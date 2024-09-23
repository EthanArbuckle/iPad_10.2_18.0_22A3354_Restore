@implementation BYSetupStateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_instance;
}

void __36__BYSetupStateManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (id)buddyPrefsValueForKey:(id)a3
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID v5;

  v3 = CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.purplebuddy"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return v4;
}

- (int64_t)restoreType
{
  void *v2;
  int64_t v3;

  -[BYSetupStateManager buddyPrefsValueForKey:](self, "buddyPrefsValueForKey:", CFSTR("RestoreState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("RestoredFromiTunesBackup")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("RestoredFromiCloudBackup")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("BackgroundRestoringFromiCloudBackup")) & 1) != 0)
  {
    v3 = 3;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("RestoredFromDevice")))
  {
    v3 = 4;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)clearRestoreType
{
  NSObject *v2;
  uint8_t v3[16];

  if (-[BYSetupStateManager restoreType](self, "restoreType"))
  {
    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Clearing RestoreState...", v3, 2u);
    }

    CFPreferencesSetAppValue(CFSTR("RestoreState"), 0, CFSTR("com.apple.purplebuddy"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy"));
  }
}

- (BOOL)didRestoreFromBackup
{
  return -[BYSetupStateManager restoreType](self, "restoreType") != 0;
}

- (BOOL)didSetupUsingiTunes
{
  void *v2;
  char v3;

  -[BYSetupStateManager buddyPrefsValueForKey:](self, "buddyPrefsValueForKey:", CFSTR("SetupState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SetupUsingiTunes"));

  return v3;
}

- (void)recordSetupUsingBuddy
{
  CFPreferencesSetAppValue(CFSTR("SetupState"), CFSTR("SetupUsingAssistant"), CFSTR("com.apple.purplebuddy"));
  -[BYSetupStateManager clearRestoreType](self, "clearRestoreType");
}

@end
