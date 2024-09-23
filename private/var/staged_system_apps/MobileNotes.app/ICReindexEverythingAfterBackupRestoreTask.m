@implementation ICReindexEverythingAfterBackupRestoreTask

- (id)taskIdentifier
{
  return CFSTR("DidSetReindexEverythingFlagPerBackupRestore");
}

- (void)runOneTimePerBackupRestoreLaunchTask
{
  NSObject *v2;

  if (ICUseCoreDataCoreSpotlightIntegration(self))
  {
    v2 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      sub_10040AAFC(v2);

  }
  else
  {
    +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", &__kCFBooleanTrue, kICReindexOnLaunchKey);
  }
}

@end
