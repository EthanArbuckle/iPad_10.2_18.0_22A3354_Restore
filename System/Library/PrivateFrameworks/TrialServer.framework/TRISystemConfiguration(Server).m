@implementation TRISystemConfiguration(Server)

- (uint64_t)userSettingsIsSiriEnabled
{
  void *v0;
  uint64_t v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Assistant Enabled"), CFSTR("com.apple.assistant.support"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v1 = objc_msgSend(v0, "BOOLValue");
  else
    v1 = 0;

  return v1;
}

- (id)userSettingsSiriLocale
{
  void *v1;

  if (objc_msgSend(a1, "userSettingsIsSiriEnabled"))
    v1 = (void *)CFPreferencesCopyAppValue(CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"));
  else
    v1 = 0;
  return v1;
}

+ (void)updateSystemInfoUsingContext:()Server
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Updating system info.", (uint8_t *)&v18, 2u);
  }

  v5 = objc_alloc(MEMORY[0x1E0DC0B90]);
  objc_msgSend(v3, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPaths:", v6);

  objc_msgSend(v7, "deviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v9 = (id)objc_msgSend(v7, "createPersistentDeviceIdentifier");
  v10 = (void *)MEMORY[0x1E0DC0B98];
  objc_msgSend(v3, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createSystemInfoWithFactorProvider:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v12, "save") & 1) != 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Update sysconfig", (uint8_t *)&v18, 2u);
    }

    v14 = (id)objc_msgSend(v7, "reloadSystemInfo");
  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = CFSTR("Failed to create system info");
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v3, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldLogAtLevel:withPrivacyRadar:", 50, 54260918);

    if (v17)
      objc_msgSend(v3, "logErrorMetric:", CFSTR("Failed to create system info"));
  }
  notify_post("com.apple.trial.covariates-updated");

}

@end
