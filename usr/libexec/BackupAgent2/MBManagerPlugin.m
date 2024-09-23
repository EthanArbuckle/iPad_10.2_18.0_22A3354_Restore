@implementation MBManagerPlugin

- (id)preparingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0, a4));
  objc_msgSend(v4, "setPreferencesValue:forKey:", &__kCFBooleanTrue, CFSTR("DriveRestoreInProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"));
  objc_msgSend(v5, "postNotification:", CFSTR("com.apple.MobileBackup.Drive.RestoreStarted"));

  return 0;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0, a4, a5));
  objc_msgSend(v5, "setPreferencesValue:forKey:", 0, CFSTR("DriveRestoreInProgress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"));
  objc_msgSend(v6, "postNotification:", CFSTR("com.apple.MobileBackup.Drive.RestoreEnded"));

  return 0;
}

@end
