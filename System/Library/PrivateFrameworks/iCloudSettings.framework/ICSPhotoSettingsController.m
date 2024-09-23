@implementation ICSPhotoSettingsController

- (ICSPhotoSettingsController)init
{
  id v3;
  objc_class *v4;
  ICSPhotoSettingsController *v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("MobileSlideShowSettings.bundle"), CFSTR("System/Library/PreferenceBundles"));
  v4 = NSClassFromString(CFSTR("MSSPhotoStreamInAccountSettingsController"));
  if (v4)
  {
    v5 = (ICSPhotoSettingsController *)objc_alloc_init(v4);
  }
  else
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = CFSTR("MSSPhotoStreamInAccountSettingsController");
      v10 = 2112;
      v11 = CFSTR("MobileSlideShowSettings.bundle");
      _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "ICSPhotoSettingsController could not find the class %@ in the %@ bundle", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end
