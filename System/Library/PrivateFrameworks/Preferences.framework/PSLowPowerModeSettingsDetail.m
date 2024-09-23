@implementation PSLowPowerModeSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE"));
}

+ (id)iconImage
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "+[PSLowPowerModeSettingsDetail setEnabled:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v8, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0D44738], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setPowerMode:fromSource:", v3, *MEMORY[0x1E0D44740]);

  if ((v6 & 1) == 0)
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PSLowPowerModeSettingsDetail setEnabled:].cold.1(v3, v7);

  }
}

+ (BOOL)isEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

+ (void)setEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "Failed to report change to Low Power Mode: %@ via LowPowerMode", (uint8_t *)&v4, 0xCu);

}

@end
