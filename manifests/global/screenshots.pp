# Public: Manages screenshot preferences
class osx::global::screenshots (
  $location = '~/Desktop',
  $type     = 'png',
) {

  Boxen::Osx_defaults {
    user   => $::boxen_user,
    domain => 'com.apple.screencapture',
  }

  if ( $location ) {
    boxen::osx_defaults { 'Manage screenshot location':
      key       => 'location',
      value     => $location,
    }
  }

  if ( $type ) {
    boxen::osx_defaults { 'Manage screenshot file type':
      key       => 'type',
      value     => $type,
    }
  }
}
