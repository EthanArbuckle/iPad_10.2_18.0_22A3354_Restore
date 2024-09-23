@implementation BFFSettingsManager

- (BFFSettingsManager)init
{
  BYFlowSkipController *v3;
  void *v4;
  BFFSettingsManager *v5;

  v3 = objc_alloc_init(BYFlowSkipController);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BFFSettingsManager initWithManagedConfiguration:flowSkipController:](self, "initWithManagedConfiguration:flowSkipController:", v4, v3);

  return v5;
}

- (BFFSettingsManager)initWithManagedConfiguration:(id)a3 flowSkipController:(id)a4
{
  id v7;
  id v8;
  BFFSettingsManager *v9;
  BFFSettingsManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BFFSettingsManager;
  v9 = -[BFFSettingsManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedConfiguration, a3);
    objc_storeStrong((id *)&v10->_flowSkipController, a4);
    -[BFFSettingsManager _reset:](v10, "_reset:", 1);
  }

  return v10;
}

- (BOOL)hasStashedValues
{
  return -[NSMutableArray count](self->_stashedPaths, "count")
      || -[NSMutableDictionary count](self->_stashedPreferences, "count")
      || -[NSMutableDictionary count](self->_stashedManagedConfigurationSettings, "count")
      || self->_stashedAssistantEnabled
      || self->_stashedWatchData
      || -[NSArray count](self->_stashedFlowSkipIdentifiers, "count")
      || self->_stashedScreenTimeEnabled
      || self->_stashedAutoUpdateEnabled
      || self->_stashedAutoDownloadEnabled
      || self->_stashedAccessibilityData
      || self->_stashedLocationServicesEnabled
      || self->_stashedLocationServicesSettings
      || self->_stashedUserInterfaceStyleMode
      || self->_stashedSiriDataSharingOptInStatus
      || self->_stashedSeedEnrollmentProgramName
      || self->_stashedSeedEnrollmentAssetAudience
      || -[NSMutableArray count](self->_stashedAnalytics, "count")
      || self->_stashedSiriOutputVoice && -[NSString length](self->_stashedSiriLanguage, "length")
      || self->_stashedActionButtonData != 0;
}

- (BOOL)hasStashedValuesOnDisk
{
  return objc_msgSend((id)objc_opt_class(), "hasStashedValuesOnDisk");
}

+ (BOOL)hasStashedValuesOnDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  +[BFFSettingsManager loadConfigurationFromDisk](BFFSettingsManager, "loadConfigurationFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      v7 = v6 == 2;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)loadConfigurationFromDisk
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v10;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/buddy/Configuration.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "dictionaryWithContentsOfURL:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (!v5)
  {
    v8 = v4;
    goto LABEL_9;
  }
  objc_msgSend(v5, "domain");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    goto LABEL_6;
  v7 = objc_msgSend(v5, "code");

  if (v7 != 260)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[BFFSettingsManager loadConfigurationFromDisk].cold.1(v5);
LABEL_6:

  }
  v8 = 0;
LABEL_9:

  return v8;
}

+ (unint64_t)stashVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "loadConfigurationFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

+ (id)stashBuildVersion
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "loadConfigurationFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("buildVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)stashProductVersion
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "loadConfigurationFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("productVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)stashConfigurationType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a1, "loadConfigurationFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

    }
    else
    {
      v6 = 2;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setBool:(BOOL)a3 forManagedConfigurationSetting:(id)a4
{
  _BOOL8 v4;
  MCProfileConnection *managedConfiguration;
  id v7;
  id v8;

  v4 = a3;
  managedConfiguration = self->_managedConfiguration;
  v7 = a4;
  -[MCProfileConnection setBoolValue:forSetting:](managedConfiguration, "setBoolValue:forSetting:", v4, v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stashedManagedConfigurationSettings, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)removeBoolSettingForManagedConfigurationSetting:(id)a3
{
  MCProfileConnection *managedConfiguration;
  id v5;

  managedConfiguration = self->_managedConfiguration;
  v5 = a3;
  -[MCProfileConnection removeBoolSetting:](managedConfiguration, "removeBoolSetting:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_stashedManagedConfigurationSettings, "removeObjectForKey:", v5);

}

- (void)setBool:(BOOL)a3 forDomain:(id)a4 key:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;
  id v11;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BFFSettingsManager setObject:forDomain:key:](self, "setObject:forDomain:key:", v11, v10, v9);

}

- (void)setObject:(id)a3 forDomain:(id)a4 key:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;

  v8 = (__CFString *)a5;
  v9 = (__CFString *)a4;
  v10 = a3;
  CFPreferencesSetAppValue(v8, v10, v9);
  CFPreferencesAppSynchronize(v9);
  -[BFFSettingsManager _preferencesForDomain:](self, "_preferencesForDomain:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKey:", v10, v8);
}

- (void)populatePathsToStash
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_ERROR, "Failed to read Wallet preferences: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)stashPath:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Adding %@ to the list of paths to stash...", (uint8_t *)&v6, 0xCu);
    }

    -[NSMutableArray addObject:](self->_stashedPaths, "addObject:", v4);
  }

}

- (void)stashLocationServicesChoice:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedLocationServicesEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  self->_stashedLocationServicesEnabled = v4;

}

- (void)stashLocationServicesSettings:(id)a3
{
  objc_storeStrong((id *)&self->_stashedLocationServicesSettings, a3);
}

- (void)stashWatchData:(id)a3
{
  objc_storeStrong((id *)&self->_stashedWatchData, a3);
}

- (id)watchData
{
  return self->_stashedWatchData;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedAssistantEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  self->_stashedAssistantEnabled = v4;

}

- (void)setAssistantVoiceTriggerEnabled:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedAssistantVoiceTriggerEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  self->_stashedAssistantVoiceTriggerEnabled = v4;

}

- (BOOL)hasAssistantVoiceTriggerEnabledValue
{
  return self->_stashedAssistantVoiceTriggerEnabled != 0;
}

- (void)setAssistantOutputVoice:(id)a3 languageCode:(id)a4
{
  NSData *v6;
  NSString *v7;
  NSData *stashedSiriOutputVoice;
  NSString *stashedSiriLanguage;
  NSData *v10;

  v6 = (NSData *)a3;
  v7 = (NSString *)a4;
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = v6;
  v10 = v6;

  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = v7;

}

- (void)stashFlowSkipIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_stashedFlowSkipIdentifiers, a3);
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedScreenTimeEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  self->_stashedScreenTimeEnabled = v4;

}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedAutoUpdateEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  self->_stashedAutoUpdateEnabled = v4;

}

- (void)setAutoDownloadEnabled:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *stashedAutoDownloadEnabled;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  self->_stashedAutoDownloadEnabled = v4;

}

- (void)stashAccessibilityData:(id)a3
{
  objc_storeStrong((id *)&self->_stashedAccessibilityData, a3);
}

- (void)setUserInterfaceStyleMode:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *stashedUserInterfaceStyleMode;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  self->_stashedUserInterfaceStyleMode = v4;

}

- (void)setSeedEnrollmentProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *stashedSeedEnrollmentProgramName;
  NSString *stashedSeedEnrollmentAssetAudience;
  NSString *v13;
  NSString *stashedSeedEnrollmentProgramID;
  NSString *v15;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = v8;
  v15 = v8;

  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = v9;
  v13 = v9;

  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = v10;

}

- (void)stashCurrentActionButtonData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "Stashed unexpectedly nil Action Button data", v1, 2u);
}

- (void)stashActionButtonData:(id)a3
{
  objc_storeStrong((id *)&self->_stashedActionButtonData, a3);
}

- (void)stashAnalyticEvent:(id)a3 payload:(id)a4
{
  NSMutableArray *stashedAnalytics;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  stashedAnalytics = self->_stashedAnalytics;
  v10[0] = CFSTR("event");
  v10[1] = CFSTR("payload");
  v11[0] = a3;
  v11[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](stashedAnalytics, "addObject:", v9);

}

- (BOOL)hideStashInSafeHaven
{
  return -[BFFSettingsManager hideStashInSafeHavenAsProvisional:](self, "hideStashInSafeHavenAsProvisional:", 0);
}

- (BOOL)hideStashInSafeHavenAsProvisional:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  char v16;
  _BOOL4 v17;
  const __CFString *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  BFFSettingsManager *v27;
  NSObject *v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[BFFSettingsManager populatePathsToStash](self, "populatePathsToStash");
  v5 = objc_alloc_init((Class)getAFSettingsConnectionClass());
  v6 = dispatch_semaphore_create(0);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke;
  v26 = &unk_1E4E27B58;
  v27 = self;
  v7 = v6;
  v28 = v7;
  objc_msgSend(v5, "getSiriDataSharingOptInStatusWithCompletion:", &v23);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (-[BFFSettingsManager hasStashedValues](self, "hasStashedValues", v23, v24, v25, v26, v27) || !v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", CFSTR("/private/var/buddy/"));

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend((id)objc_opt_class(), "stashConfigurationType");
      if (v13 == 1)
      {
        _BYLoggingFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4E92000, v14, OS_LOG_TYPE_DEFAULT, "Committing existing provisional stash on disk...", buf, 2u);
        }

        goto LABEL_22;
      }
      v16 = objc_msgSend((id)objc_opt_class(), "removeSafeHaven");
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if ((v16 & 1) != 0)
      {
        if (v17)
        {
          v18 = CFSTR("committed");
          if (v3)
            v18 = CFSTR("provisional");
          *(_DWORD *)buf = 138543362;
          v30 = v18;
          _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ stash...", buf, 0xCu);
        }

        if (!-[BFFSettingsManager _stashConfiguration:](self, "_stashConfiguration:", v3))
        {
          _BYLoggingFacility();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4E92000, v21, OS_LOG_TYPE_DEFAULT, "Not stashing paths; configuration failed to write!",
              buf,
              2u);
          }

          goto LABEL_39;
        }
LABEL_22:
        if (v3)
        {
          _BYLoggingFacility();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4E92000, v19, OS_LOG_TYPE_DEFAULT, "Not stashing any paths...", buf, 2u);
          }

          if (v13 != 1)
            goto LABEL_34;
LABEL_29:
          if (!-[BFFSettingsManager _commitStash](self, "_commitStash"))
          {
            objc_msgSend((id)objc_opt_class(), "removeSafeHaven");
            goto LABEL_39;
          }
LABEL_34:
          _BYLoggingFacility();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_8;
          *(_WORD *)buf = 0;
          v9 = "Successfully stashed!";
          goto LABEL_7;
        }
        v20 = -[BFFSettingsManager _stashPaths](self, "_stashPaths");
        if (v13 == 1 && v20)
          goto LABEL_29;
        if (v20)
          goto LABEL_34;
LABEL_39:
        _BYLoggingFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "Failed to stash!";
          goto LABEL_41;
        }
LABEL_42:
        v10 = 0;
        goto LABEL_43;
      }
      if (!v17)
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v15 = "Failed to clean up safe haven!";
    }
    else
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v15 = "Safe haven doesn't exist - can't stash information!";
    }
LABEL_41:
    _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_42;
  }
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v9 = "No settings to stash";
LABEL_7:
    _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
  }
LABEL_8:
  v10 = 1;
LABEL_43:

  return v10;
}

void __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  if (v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke_cold_1(v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)_stashConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSNumber *stashedAssistantEnabled;
  NSNumber *stashedAssistantVoiceTriggerEnabled;
  NSNumber *stashedSiriDataSharingOptInStatus;
  NSNumber *stashedLocationServicesEnabled;
  NSData *stashedLocationServicesSettings;
  NSData *stashedWatchData;
  NSNumber *stashedScreenTimeEnabled;
  NSNumber *stashedAutoUpdateEnabled;
  NSNumber *stashedAutoDownloadEnabled;
  NSData *stashedAccessibilityData;
  NSNumber *stashedUserInterfaceStyleMode;
  NSString *stashedSeedEnrollmentProgramName;
  NSString *stashedSeedEnrollmentAssetAudience;
  NSString *stashedSeedEnrollmentProgramID;
  NSMutableArray *stashedAnalytics;
  NSData *stashedSiriOutputVoice;
  NSData *stashedActionButtonData;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  int v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  char v42;
  BOOL v43;
  NSObject *v44;
  int v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E4E344E8, CFSTR("version"));
  if (v3)
    v6 = &unk_1E4E34500;
  else
    v6 = &unk_1E4E34518;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("buildVersion"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("productVersion"));

  if (-[NSMutableDictionary count](self->_stashedPreferences, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_stashedPreferences, CFSTR("defaults"));
  if (-[NSMutableDictionary count](self->_stashedManagedConfigurationSettings, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_stashedManagedConfigurationSettings, CFSTR("managedConfiguration"));
  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  if (stashedAssistantEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAssistantEnabled, CFSTR("assistant"));
  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  if (stashedAssistantVoiceTriggerEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAssistantVoiceTriggerEnabled, CFSTR("assistantVoiceTrigger"));
  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  if (stashedSiriDataSharingOptInStatus)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedSiriDataSharingOptInStatus, CFSTR("siriDataSharingOptInStatus2"));
  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  if (stashedLocationServicesEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedLocationServicesEnabled, CFSTR("locationServices"));
  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  if (stashedLocationServicesSettings)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedLocationServicesSettings, CFSTR("locationServicesSettings"));
  stashedWatchData = self->_stashedWatchData;
  if (stashedWatchData)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedWatchData, CFSTR("watch"));
  if (-[NSArray count](self->_stashedFlowSkipIdentifiers, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_stashedFlowSkipIdentifiers, CFSTR("flowSkipIdentifiers"));
  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  if (stashedScreenTimeEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedScreenTimeEnabled, CFSTR("screenTime"));
  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  if (stashedAutoUpdateEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAutoUpdateEnabled, CFSTR("autoUpdate"));
  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  if (stashedAutoDownloadEnabled)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAutoDownloadEnabled, CFSTR("autoDownload"));
  stashedAccessibilityData = self->_stashedAccessibilityData;
  if (stashedAccessibilityData)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAccessibilityData, CFSTR("accessibilityData"));
  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  if (stashedUserInterfaceStyleMode)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedUserInterfaceStyleMode, CFSTR("userInterfaceStyleMode"));
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  if (stashedSeedEnrollmentProgramName)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedSeedEnrollmentProgramName, CFSTR("seedEnrollmentProgramName"));
  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  if (stashedSeedEnrollmentAssetAudience)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedSeedEnrollmentAssetAudience, CFSTR("seedEnrollmentAssetAudience"));
  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  if (stashedSeedEnrollmentProgramID)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedSeedEnrollmentProgramID, CFSTR("seedEnrollmentProgramID"));
  stashedAnalytics = self->_stashedAnalytics;
  if (stashedAnalytics)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedAnalytics, CFSTR("analytics"));
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  if (stashedSiriOutputVoice)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedSiriOutputVoice, CFSTR("siriOutputVoice"));
  if (-[NSString length](self->_stashedSiriLanguage, "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_stashedSiriLanguage, CFSTR("siriLanguage"));
  stashedActionButtonData = self->_stashedActionButtonData;
  if (stashedActionButtonData)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", stashedActionButtonData, CFSTR("actionButton"));
  _BYLoggingFacility();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v27, OS_LOG_TYPE_DEFAULT, "Writing configuration to disk...", buf, 2u);
  }

  _BYLoggingFacility();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v5;
    _os_log_impl(&dword_1A4E92000, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/buddy/Configuration.plist"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v30 = objc_msgSend(v5, "writeToURL:error:", v29, &v50);
  v31 = v50;

  if ((v30 & 1) == 0)
  {
    _BYLoggingFacility();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v33 = 0;
        v34 = v31;
      }
      else if (v31)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v31, "domain");
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v30, objc_msgSend(v31, "code"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 1;
      }
      else
      {
        v33 = 0;
        v34 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v52 = v34;
      _os_log_impl(&dword_1A4E92000, v32, OS_LOG_TYPE_DEFAULT, "Failed to write configuration to safe haven: %{public}@", buf, 0xCu);
      if (v33)
      {

      }
    }

    if (!-[NSMutableArray count](self->_stashedPaths, "count"))
    {
      v43 = 0;
      goto LABEL_71;
    }
    _BYLoggingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v36, OS_LOG_TYPE_DEFAULT, "Attempting to write minimal configuration...", buf, 2u);
    }

    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", &unk_1E4E344E8, CFSTR("version"));
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/buddy/Configuration.plist"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v31;
    v39 = objc_msgSend(v37, "writeToURL:error:", v38, &v49);
    v40 = v49;

    if ((v39 & 1) == 0)
    {
      _BYLoggingFacility();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v46 = 0;
          v47 = v40;
        }
        else if (v40)
        {
          v48 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v40, "domain");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v38, objc_msgSend(v40, "code"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 1;
        }
        else
        {
          v46 = 0;
          v47 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v52 = v47;
        _os_log_impl(&dword_1A4E92000, v44, OS_LOG_TYPE_DEFAULT, "Failed to write configuration to safe haven: %{public}@", buf, 0xCu);
        if (v46)
        {

        }
      }
      goto LABEL_69;
    }
    v31 = v40;
    v5 = v37;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "fileExistsAtPath:", CFSTR("/private/var/buddy/Configuration.plist"));

  if ((v42 & 1) == 0)
  {
    _BYLoggingFacility();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v44, OS_LOG_TYPE_DEFAULT, "Configuration does not exist in safe haven after writing it!", buf, 2u);
    }
    v40 = v31;
    v37 = v5;
LABEL_69:

    v43 = 0;
    v31 = v40;
    v5 = v37;
    goto LABEL_71;
  }
  v43 = 1;
LABEL_71:

  return v43;
}

- (BOOL)_stashPaths
{
  uint64_t i;
  NSObject *p_super;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  char v19;
  int v20;
  id v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t j;
  void *v37;
  void *v38;
  id v39;
  const char *v40;
  id v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  NSObject *v48;
  NSObject *v49;
  char v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_class *obj;
  id obja;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  p_super = &self->super;
  v82 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_stashedPaths, "count"))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/buddy/Root/"), 0, 0, &v73);
  v6 = v73;

  if ((v5 & 1) == 0)
  {
    _BYLoggingFacility();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v28 = 0;
      i = (uint64_t)v6;
    }
    else if (v6)
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      p_super = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), p_super, objc_msgSend(v6, "code"));
      i = objc_claimAutoreleasedReturnValue();
      v28 = 1;
    }
    else
    {
      v28 = 0;
      i = 0;
    }
    *(_DWORD *)buf = 138543362;
    v76 = i;
    _os_log_impl(&dword_1A4E92000, v27, OS_LOG_TYPE_DEFAULT, "Unable to create root within safe haven: %{public}@", buf, 0xCu);
    if (!v28)
      goto LABEL_66;
    goto LABEL_64;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = p_super[1].isa;
  v7 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (!v7)
  {
    v61 = 1;
    goto LABEL_38;
  }
  v8 = v7;
  v9 = *(_QWORD *)v70;
  v61 = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v70 != v9)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      objc_msgSend(CFSTR("/private/var/buddy/Root/"), "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v6;
      v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v68);
      v15 = v68;

      _BYLoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if ((v14 & 1) == 0)
      {
        if (v17)
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v22 = 0;
            v23 = (uint64_t)v15;
          }
          else if (v15)
          {
            v24 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "domain");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v58, objc_msgSend(v15, "code"));
            v22 = 1;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (uint64_t)v57;
          }
          else
          {
            v22 = 0;
            v23 = 0;
          }
          *(_DWORD *)buf = 138543362;
          v76 = v23;
          _os_log_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEFAULT, "Unable to create parent directories within safe haven: %{public}@", buf, 0xCu);
          if (v22)
          {

          }
        }
        goto LABEL_29;
      }
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v76 = (uint64_t)v10;
        _os_log_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEFAULT, "Copying %@ into the safe haven...", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v15;
      v19 = objc_msgSend(v18, "copyItemAtPath:toPath:error:", v10, v11, &v67);
      v6 = v67;

      if ((v19 & 1) == 0)
      {
        _BYLoggingFacility();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v20 = 0;
            v21 = v6;
          }
          else if (v6)
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "domain");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v56, objc_msgSend(v6, "code"));
            v20 = 1;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v55;
          }
          else
          {
            v20 = 0;
            v21 = 0;
          }
          *(_DWORD *)buf = 138412802;
          v76 = (uint64_t)v10;
          v77 = 2112;
          v78 = v11;
          v79 = 2114;
          v80 = v21;
          _os_log_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to copy %@ to %@: %{public}@", buf, 0x20u);
          if (v20)
          {

          }
        }
        v15 = v6;
LABEL_29:

        v61 = 0;
        v6 = v15;
      }

    }
    v8 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  }
  while (v8);
LABEL_38:
  v29 = v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v6;
  objc_msgSend(v30, "subpathsOfDirectoryAtPath:error:", CFSTR("/private/var/buddy/Root/"), &v66);
  v27 = objc_claimAutoreleasedReturnValue();
  v6 = v66;

  if (!v27)
  {
    _BYLoggingFacility();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v51 = 0;
      v52 = v6;
    }
    else if (v6)
    {
      v54 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      i = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), i, objc_msgSend(v6, "code"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 1;
    }
    else
    {
      v51 = 0;
      v52 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v76 = (uint64_t)v52;
    _os_log_impl(&dword_1A4E92000, p_super, OS_LOG_TYPE_DEFAULT, "Unable to get contents of safe haven stashed files: %{public}@", buf, 0xCu);
    if (!v51)
      goto LABEL_65;

LABEL_64:
LABEL_65:

LABEL_66:
    v50 = 0;
    goto LABEL_67;
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v27 = v27;
  v31 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v63;
    v34 = CFSTR("/");
    v35 = CFSTR("/private/var/buddy/Root/");
    obja = v6;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v27);
        -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingPathComponent:](v35, "stringByAppendingPathComponent:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_retainAutorelease(v37);
        v40 = (const char *)objc_msgSend(v39, "UTF8String");
        v41 = objc_retainAutorelease(v38);
        v42 = copyfile(v40, (const char *)objc_msgSend(v41, "UTF8String"), 0, 4u);
        if (v42 < 0)
        {
          v43 = v42;
          v44 = v32;
          v45 = v33;
          v46 = v35;
          v47 = v34;
          v48 = v27;
          _BYLoggingFacility();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v76) = v43;
            _os_log_impl(&dword_1A4E92000, v49, OS_LOG_TYPE_DEFAULT, "Failed to copy extended attributes: %d", buf, 8u);
          }

          v61 = 0;
          v27 = v48;
          v34 = v47;
          v35 = v46;
          v33 = v45;
          v32 = v44;
          v6 = obja;
        }

      }
      v32 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v32);
  }

  v50 = v61;
LABEL_67:

  return v50 & 1;
}

- (BOOL)_commitStash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "loadConfigurationFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E4E34518, CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/buddy/Configuration.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v4, "writeToURL:error:", v5, &v13);
  v7 = v13;

  if ((v6 & 1) == 0)
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v9 = 0;
        v10 = v7;
      }
      else if (v7)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "domain");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v7, "code"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to mark stash as commited: %{public}@", buf, 0xCu);
      if (v9)
      {

      }
    }

  }
  return v6;
}

+ (void)postDidRestoreSafeHavenNotification
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Posting did restore safe haven notification...", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.purplebuddy.safehaven.restored"), 0, 0, 0);
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Resetting settings/configuration to stash...", v4, 2u);
  }

  -[BFFSettingsManager _reset:](self, "_reset:", 1);
}

- (void)_reset:(BOOL)a3
{
  NSMutableArray *v4;
  NSMutableArray *stashedPaths;
  NSMutableDictionary *v6;
  NSMutableDictionary *stashedPreferences;
  NSMutableDictionary *v8;
  NSMutableDictionary *stashedManagedConfigurationSettings;
  NSNumber *stashedAssistantEnabled;
  NSNumber *stashedAssistantVoiceTriggerEnabled;
  NSNumber *stashedSiriDataSharingOptInStatus;
  NSNumber *stashedLocationServicesEnabled;
  NSData *stashedLocationServicesSettings;
  NSData *stashedWatchData;
  NSArray *stashedFlowSkipIdentifiers;
  NSNumber *stashedScreenTimeEnabled;
  NSNumber *stashedAutoUpdateEnabled;
  NSNumber *stashedAutoDownloadEnabled;
  NSData *stashedAccessibilityData;
  NSNumber *stashedUserInterfaceStyleMode;
  NSString *stashedSeedEnrollmentProgramName;
  NSString *stashedSeedEnrollmentAssetAudience;
  NSString *stashedSeedEnrollmentProgramID;
  NSMutableArray *v25;
  NSMutableArray *stashedAnalytics;
  NSData *stashedSiriOutputVoice;
  NSString *stashedSiriLanguage;
  NSData *stashedActionButtonData;

  if (a3)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    stashedPaths = self->_stashedPaths;
    self->_stashedPaths = v4;

  }
  v6 = (NSMutableDictionary *)objc_opt_new();
  stashedPreferences = self->_stashedPreferences;
  self->_stashedPreferences = v6;

  v8 = (NSMutableDictionary *)objc_opt_new();
  stashedManagedConfigurationSettings = self->_stashedManagedConfigurationSettings;
  self->_stashedManagedConfigurationSettings = v8;

  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  self->_stashedAssistantEnabled = 0;

  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  self->_stashedAssistantVoiceTriggerEnabled = 0;

  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  self->_stashedSiriDataSharingOptInStatus = 0;

  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  self->_stashedLocationServicesEnabled = 0;

  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  self->_stashedLocationServicesSettings = 0;

  stashedWatchData = self->_stashedWatchData;
  self->_stashedWatchData = 0;

  stashedFlowSkipIdentifiers = self->_stashedFlowSkipIdentifiers;
  self->_stashedFlowSkipIdentifiers = 0;

  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  self->_stashedScreenTimeEnabled = 0;

  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  self->_stashedAutoUpdateEnabled = 0;

  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  self->_stashedAutoDownloadEnabled = 0;

  stashedAccessibilityData = self->_stashedAccessibilityData;
  self->_stashedAccessibilityData = 0;

  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  self->_stashedUserInterfaceStyleMode = 0;

  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = 0;

  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = 0;

  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = 0;

  v25 = (NSMutableArray *)objc_opt_new();
  stashedAnalytics = self->_stashedAnalytics;
  self->_stashedAnalytics = v25;

  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = 0;

  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = 0;

  stashedActionButtonData = self->_stashedActionButtonData;
  self->_stashedActionButtonData = 0;

}

- (void)applySafeHavenStash
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  int v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  _BYTE v36[10];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "hasStashedValuesOnDisk") & 1) == 0)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "stashConfigurationType");
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        LOWORD(v35) = 0;
        v10 = "Attempted to apply a provisional stash!";
LABEL_92:
        _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v35, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v35) = 0;
      v10 = "No committed stashed values on disk";
      goto LABEL_92;
    }
LABEL_93:

    return;
  }
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NeverApplyRestoreStash"));

  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "stashProductVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stashBuildVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412546;
      *(_QWORD *)v36 = v11;
      *(_WORD *)&v36[8] = 2112;
      v37 = v12;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Applying safe haven stash from %@ (%@)", (uint8_t *)&v35, 0x16u);

    }
    v13 = -[BFFSettingsManager _restoreConfiguration](self, "_restoreConfiguration");
    if (v13 == 1)
    {
      if (-[NSMutableDictionary count](self->_stashedPreferences, "count"))
      {
        -[BFFSettingsManager _applyStashedPreferences](self, "_applyStashedPreferences");
      }
      else
      {
        _BYLoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v19, OS_LOG_TYPE_DEFAULT, "No stashed preferences found", (uint8_t *)&v35, 2u);
        }

      }
      if (-[NSMutableDictionary count](self->_stashedManagedConfigurationSettings, "count"))
      {
        -[BFFSettingsManager _applyStashedManagedConfiguration](self, "_applyStashedManagedConfiguration");
      }
      else
      {
        _BYLoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v20, OS_LOG_TYPE_DEFAULT, "No stashed managed configuration settings found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedAssistantEnabled
        || self->_stashedAssistantVoiceTriggerEnabled
        || self->_stashedSiriDataSharingOptInStatus
        || self->_stashedSiriOutputVoice && -[NSString length](self->_stashedSiriLanguage, "length"))
      {
        -[BFFSettingsManager _applyAssistantPreferences](self, "_applyAssistantPreferences");
      }
      else
      {
        _BYLoggingFacility();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v34, OS_LOG_TYPE_DEFAULT, "No assistant preferences found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedLocationServicesEnabled)
      {
        -[BFFSettingsManager _applyLocationServices](self, "_applyLocationServices");
      }
      else
      {
        _BYLoggingFacility();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v21, OS_LOG_TYPE_DEFAULT, "No location services preference found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedLocationServicesSettings)
      {
        -[BFFSettingsManager _applyLocationServicesSettings](self, "_applyLocationServicesSettings");
      }
      else
      {
        _BYLoggingFacility();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v22, OS_LOG_TYPE_DEFAULT, "No location services settings found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedWatchData)
      {
        -[BFFSettingsManager _restoreWatchData](self, "_restoreWatchData");
      }
      else
      {
        _BYLoggingFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v23, OS_LOG_TYPE_DEFAULT, "No watch migration data found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedFlowSkipIdentifiers)
      {
        -[BFFSettingsManager _applyStashedFlowSkipIdentifiers](self, "_applyStashedFlowSkipIdentifiers");
      }
      else
      {
        _BYLoggingFacility();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "No flow skip identifiers found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedScreenTimeEnabled)
      {
        -[BFFSettingsManager _applyScreenTimePreferences](self, "_applyScreenTimePreferences");
      }
      else
      {
        _BYLoggingFacility();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v25, OS_LOG_TYPE_DEFAULT, "No Screen Time preferences found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedAutoUpdateEnabled)
      {
        -[BFFSettingsManager _applyUpdatePreferences](self, "_applyUpdatePreferences");
      }
      else
      {
        _BYLoggingFacility();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v26, OS_LOG_TYPE_DEFAULT, "No update preferences found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedAccessibilityData)
      {
        -[BFFSettingsManager _restoreAccessibilityData](self, "_restoreAccessibilityData");
      }
      else
      {
        _BYLoggingFacility();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v27, OS_LOG_TYPE_DEFAULT, "No accessibility data found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedUserInterfaceStyleMode)
      {
        -[BFFSettingsManager _applyUserInterfaceStyleMode](self, "_applyUserInterfaceStyleMode");
      }
      else
      {
        _BYLoggingFacility();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v28, OS_LOG_TYPE_DEFAULT, "No user interface style mode data found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedSeedEnrollmentProgramName && self->_stashedSeedEnrollmentAssetAudience)
      {
        -[BFFSettingsManager _applySeedEnrollmentData](self, "_applySeedEnrollmentData");
      }
      else
      {
        _BYLoggingFacility();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v29, OS_LOG_TYPE_DEFAULT, "No seed enrollment data found", (uint8_t *)&v35, 2u);
        }

      }
      if (-[NSMutableArray count](self->_stashedAnalytics, "count"))
      {
        -[BFFSettingsManager _restoreAnalyticsData](self, "_restoreAnalyticsData");
      }
      else
      {
        _BYLoggingFacility();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v30, OS_LOG_TYPE_DEFAULT, "No analytics data found", (uint8_t *)&v35, 2u);
        }

      }
      if (self->_stashedActionButtonData)
      {
        -[BFFSettingsManager _restoreActionButtonData](self, "_restoreActionButtonData");
      }
      else
      {
        _BYLoggingFacility();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_1A4E92000, v31, OS_LOG_TYPE_DEFAULT, "No action button data found", (uint8_t *)&v35, 2u);
        }

      }
      -[BFFSettingsManager _restoreStashedFiles](self, "_restoreStashedFiles");
      _BYLoggingFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_89;
      LOWORD(v35) = 0;
      v16 = "Finished applying safe haven stash!";
      v17 = v15;
      v18 = 2;
    }
    else
    {
      v14 = v13;
      _BYLoggingFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_89:

        +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "BOOLForKey:", CFSTR("DoNotRemoveStash"));

        if (!v33)
        {
          objc_msgSend((id)objc_opt_class(), "removeSafeHaven");
          objc_msgSend((id)objc_opt_class(), "postDidRestoreSafeHavenNotification");
          return;
        }
        _BYLoggingFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_93;
        LOWORD(v35) = 0;
        v10 = "Not removing safe haven stash (default set)";
        goto LABEL_92;
      }
      v35 = 67109376;
      *(_DWORD *)v36 = v14;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = 1;
      v16 = "Configuration is a different version (%d) expected (%d)!";
      v17 = v15;
      v18 = 14;
    }
    _os_log_impl(&dword_1A4E92000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
    goto LABEL_89;
  }
  if (v6)
  {
    LOWORD(v35) = 0;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Not applying safe haven stash (default set)", (uint8_t *)&v35, 2u);
  }

}

- (unint64_t)_restoreConfiguration
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *stashedPreferences;
  NSMutableDictionary *v6;
  NSMutableDictionary *stashedManagedConfigurationSettings;
  NSNumber *v8;
  NSNumber *stashedAssistantEnabled;
  NSNumber *v10;
  NSNumber *stashedAssistantVoiceTriggerEnabled;
  NSNumber *v12;
  NSNumber *stashedSiriDataSharingOptInStatus;
  NSNumber *v14;
  NSNumber *stashedLocationServicesEnabled;
  NSData *v16;
  NSData *stashedLocationServicesSettings;
  NSData *v18;
  NSData *stashedWatchData;
  NSArray *v20;
  NSArray *stashedFlowSkipIdentifiers;
  NSNumber *v22;
  NSNumber *stashedScreenTimeEnabled;
  NSNumber *v24;
  NSNumber *stashedAutoDownloadEnabled;
  NSNumber *v26;
  NSNumber *stashedAutoUpdateEnabled;
  NSData *v28;
  NSData *stashedAccessibilityData;
  NSNumber *v30;
  NSNumber *stashedUserInterfaceStyleMode;
  NSString *v32;
  NSString *stashedSeedEnrollmentProgramName;
  NSString *v34;
  NSString *stashedSeedEnrollmentAssetAudience;
  NSString *v36;
  NSString *stashedSeedEnrollmentProgramID;
  NSMutableArray *v38;
  NSMutableArray *stashedAnalytics;
  NSData *v40;
  NSData *stashedSiriOutputVoice;
  NSString *v42;
  NSString *stashedSiriLanguage;
  NSData *v44;
  NSData *stashedActionButtonData;
  void *v46;
  unint64_t v47;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/private/var/buddy/Configuration.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("defaults"));
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  stashedPreferences = self->_stashedPreferences;
  self->_stashedPreferences = v4;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("managedConfiguration"));
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  stashedManagedConfigurationSettings = self->_stashedManagedConfigurationSettings;
  self->_stashedManagedConfigurationSettings = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assistant"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  self->_stashedAssistantEnabled = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assistantVoiceTrigger"));
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  self->_stashedAssistantVoiceTriggerEnabled = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("siriDataSharingOptInStatus2"));
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  self->_stashedSiriDataSharingOptInStatus = v12;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationServices"));
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  self->_stashedLocationServicesEnabled = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationServicesSettings"));
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  self->_stashedLocationServicesSettings = v16;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("watch"));
  v18 = (NSData *)objc_claimAutoreleasedReturnValue();
  stashedWatchData = self->_stashedWatchData;
  self->_stashedWatchData = v18;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  stashedFlowSkipIdentifiers = self->_stashedFlowSkipIdentifiers;
  self->_stashedFlowSkipIdentifiers = v20;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("screenTime"));
  v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  self->_stashedScreenTimeEnabled = v22;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("autoDownload"));
  v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  self->_stashedAutoDownloadEnabled = v24;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("autoUpdate"));
  v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  self->_stashedAutoUpdateEnabled = v26;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessibilityData"));
  v28 = (NSData *)objc_claimAutoreleasedReturnValue();
  stashedAccessibilityData = self->_stashedAccessibilityData;
  self->_stashedAccessibilityData = v28;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("userInterfaceStyleMode"));
  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  self->_stashedUserInterfaceStyleMode = v30;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seedEnrollmentProgramName"));
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = v32;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seedEnrollmentAssetAudience"));
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = v34;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seedEnrollmentProgramID"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = v36;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("analytics"));
  v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  stashedAnalytics = self->_stashedAnalytics;
  self->_stashedAnalytics = v38;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("siriOutputVoice"));
  v40 = (NSData *)objc_claimAutoreleasedReturnValue();
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = v40;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("siriLanguage"));
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = v42;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actionButton"));
  v44 = (NSData *)objc_claimAutoreleasedReturnValue();
  stashedActionButtonData = self->_stashedActionButtonData;
  self->_stashedActionButtonData = v44;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedIntegerValue");

  return v47;
}

- (void)_applyStashedPreferences
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id obj;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_stashedPreferences, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v17 = v2;
        v3 = *(const __CFString **)(*((_QWORD *)&v22 + 1) + 8 * v2);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stashedPreferences, "objectForKeyedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v4, "allKeys");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(v5);
              v10 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKeyedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              _BYLoggingFacility();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v27 = v10;
                v28 = 2112;
                v29 = v3;
                v30 = 2112;
                v31 = v11;
                _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Setting default for key %@ in domain %@ to %@...", buf, 0x20u);
              }

              CFPreferencesSetAppValue(v10, v11, v3);
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
          }
          while (v7);
        }

        CFPreferencesAppSynchronize(v3);
        v2 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v16);
  }

}

- (void)_applyStashedManagedConfiguration
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  const __CFString *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_stashedManagedConfigurationSettings, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0D46FC0];
    *(_QWORD *)&v4 = 138543618;
    v18 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stashedManagedConfigurationSettings, "objectForKeyedSubscript:", v9, v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        _BYLoggingFacility();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Removing BOOL value for %@...", buf, 0xCu);
          }

          -[MCProfileConnection removeBoolSetting:](self->_managedConfiguration, "removeBoolSetting:", v9);
        }
        else
        {
          if (v14)
          {
            v15 = objc_msgSend(v10, "BOOLValue");
            *(_DWORD *)buf = v18;
            v16 = CFSTR("NO");
            if (v15)
              v16 = CFSTR("YES");
            v25 = v9;
            v26 = 2114;
            v27 = v16;
            _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Setting BOOL value for %{public}@ to %{public}@", buf, 0x16u);
          }

          -[MCProfileConnection setBoolValue:forSetting:](self->_managedConfiguration, "setBoolValue:forSetting:", objc_msgSend(v10, "BOOLValue"), v9);
        }
        if (objc_msgSend(v9, "isEqualToString:", v7))
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.OTACrashCopier.SubmissionPreferenceChanged"), 0, 0, 0);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v5);
  }

}

- (void)_applyAssistantPreferences
{
  void *v1;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = objc_msgSend(a1, "code");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Failed to decode Siri output voice %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

void __48__BFFSettingsManager__applyAssistantPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__BFFSettingsManager__applyAssistantPreferences__block_invoke_cold_1(v3);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_applyLocationServices
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_stashedLocationServicesEnabled)
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSNumber BOOLValue](self->_stashedLocationServicesEnabled, "BOOLValue");
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Setting location services to %d...", (uint8_t *)v5, 8u);
    }

    objc_msgSend(getCLLocationManagerClass(), "setLocationServicesEnabled:", -[NSNumber BOOLValue](self->_stashedLocationServicesEnabled, "BOOLValue"));
  }
}

- (void)_applyLocationServicesSettings
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  if (self->_stashedLocationServicesSettings)
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Setting location services from archived blob...", v5, 2u);
    }

    v4 = (id)objc_msgSend(getCLLocationManagerClass(), "_applyArchivedAuthorizationDecisions:", self->_stashedLocationServicesSettings);
  }
}

- (void)_applyStashedFlowSkipIdentifiers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_stashedFlowSkipIdentifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        _BYLoggingFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v8;
          _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Setting flow as skipped: %{public}@", buf, 0xCu);
        }

        -[BYFlowSkipController didSkipFlow:](self->_flowSkipController, "didSkipFlow:", v8);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  if (!-[NSArray containsObject:](self->_stashedFlowSkipIdentifiers, "containsObject:", CFSTR("siri")))
  {
    _BYLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, "Removing follow up for Siri as the stashed skipped flows did not include Siri...", buf, 2u);
    }

    -[BYFlowSkipController didCompleteFlow:](self->_flowSkipController, "didCompleteFlow:", CFSTR("siri"));
  }
}

- (void)_applyScreenTimePreferences
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  objc_class *v8;
  char v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[MCProfileConnection effectiveBoolValueForSetting:](self->_managedConfiguration, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FD8]) == 2)
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Not setting Screen Time as enabling restrictions is restricted...", buf, 2u);
    }
  }
  else
  {
    v4 = -[NSNumber BOOLValue](self->_stashedScreenTimeEnabled, "BOOLValue");
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if ((_DWORD)v4)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Setting Screen Time enabled to %{public}@...", buf, 0xCu);
    }

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v7 = (void *)getSTManagementStateClass_softClass_0;
    v20 = getSTManagementStateClass_softClass_0;
    if (!getSTManagementStateClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSTManagementStateClass_block_invoke_0;
      v22 = &unk_1E4E26900;
      v23 = &v17;
      __getSTManagementStateClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v18[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v17, 8);
    v3 = objc_alloc_init(v8);
    v16 = 0;
    v9 = -[NSObject setScreenTimeEnabled:error:](v3, "setScreenTimeEnabled:error:", v4, &v16);
    v10 = v16;
    if ((v9 & 1) == 0)
    {
      _BYLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (_DWORD)v4 ? CFSTR("enable") : CFSTR("disable");
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v13 = 0;
          v14 = v10;
        }
        else if (v10)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "domain");
          v4 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v10, "code"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 1;
        }
        else
        {
          v13 = 0;
          v14 = 0;
        }
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        _os_log_error_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_ERROR, "Failed to %{public}@ Screen Time: %{public}@", buf, 0x16u);
        if (v13)
        {

        }
      }

    }
  }

}

- (void)_applyUpdatePreferences
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 buf;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v3 = (void *)getSUManagerClientClass_softClass_0;
  v16 = getSUManagerClientClass_softClass_0;
  if (!getSUManagerClientClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v18 = __getSUManagerClientClass_block_invoke_0;
    v19 = &unk_1E4E26900;
    v20 = &v13;
    __getSUManagerClientClass_block_invoke_0((uint64_t)&buf);
    v3 = (void *)v14[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v13, 8);
  v5 = [v4 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithDelegate:clientType:", 0, 1, v13);
  if (self->_stashedAutoDownloadEnabled)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSNumber BOOLValue](self->_stashedAutoDownloadEnabled, "BOOLValue");
      v9 = CFSTR("NO");
      if (v8)
        v9 = CFSTR("YES");
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Setting auto-download for updates enabled to %{public}@...", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v6, "enableAutomaticDownload:", -[NSNumber BOOLValue](self->_stashedAutoDownloadEnabled, "BOOLValue"));
  }
  if (self->_stashedAutoUpdateEnabled)
  {
    _BYLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NSNumber BOOLValue](self->_stashedAutoUpdateEnabled, "BOOLValue");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, "Setting auto-update enabled to %{public}@...", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v6, "enableAutomaticUpdateV2:", -[NSNumber BOOLValue](self->_stashedAutoUpdateEnabled, "BOOLValue"));
  }

}

- (void)_restoreStashedFiles
{
  void *v2;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/private/var/buddy/Root/"));

  if (v5)
  {
    -[BFFSettingsManager _shovePath:toPath:](self, "_shovePath:toPath:", CFSTR("/private/var/buddy/Root/"), CFSTR("/"));
    v6 = objc_claimAutoreleasedReturnValue();
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = _BYIsInternalInstall();
        v10 = v6;
        if ((v9 & 1) == 0)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject domain](v6, "domain");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, -[NSObject code](v6, "code"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to restore files from safe haven: %{public}@", buf, 0xCu);
        if ((v9 & 1) == 0)
        {

        }
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Restored files from save haven!", buf, 2u);
    }

  }
  else
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "No stashed files to apply", buf, 2u);
    }
  }

}

- (void)_restoreWatchData
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Passing watch data over to NanoRegistry...", (uint8_t *)v6, 2u);
  }

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getNRMigratorClass_softClass_0;
  v10 = getNRMigratorClass_softClass_0;
  if (!getNRMigratorClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getNRMigratorClass_block_invoke_0;
    v6[3] = &unk_1E4E26900;
    v6[4] = &v7;
    __getNRMigratorClass_block_invoke_0((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "ingestPostRestoreMigrationDataForConsentedDevices:", self->_stashedWatchData);
}

- (void)_restoreAccessibilityData
{
  NSObject *v2;
  uint8_t v3[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Restoring accessibility settings...", v3, 2u);
  }

  _AXSRestoreSettingsFromDataBlobForBuddy();
}

- (void)_applyUserInterfaceStyleMode
{
  NSObject *v3;
  NSInteger v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 buf;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSNumber integerValue](self->_stashedUserInterfaceStyleMode, "integerValue");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Setting user interface style mode to %ld", (uint8_t *)&buf, 0xCu);
  }

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getUISUserInterfaceStyleModeClass_softClass_0;
  v12 = getUISUserInterfaceStyleModeClass_softClass_0;
  if (!getUISUserInterfaceStyleModeClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getUISUserInterfaceStyleModeClass_block_invoke_0;
    v15 = &unk_1E4E26900;
    v16 = &v9;
    __getUISUserInterfaceStyleModeClass_block_invoke_0((uint64_t)&buf);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  v7 = [v6 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithDelegate:", 0, v9);
  objc_msgSend(v8, "setModeValue:", -[NSNumber integerValue](self->_stashedUserInterfaceStyleMode, "integerValue"));

}

- (void)_applySeedEnrollmentData
{
  BYBuddyDaemonGeneralClient *v3;

  v3 = objc_alloc_init(BYBuddyDaemonGeneralClient);
  -[BYBuddyDaemonGeneralClient enrollInSeedProgramNamed:withAssetAudience:programID:](v3, "enrollInSeedProgramNamed:withAssetAudience:programID:", self->_stashedSeedEnrollmentProgramName, self->_stashedSeedEnrollmentAssetAudience, self->_stashedSeedEnrollmentProgramID);

}

- (void)_restoreAnalyticsData
{
  void *v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A4E92000, a4, OS_LOG_TYPE_DEBUG, "Sending event %@...", a1, 0xCu);

}

- (void)_restoreActionButtonData
{
  -[BFFSettingsManager _setCurrentActionButtonData:](self, "_setCurrentActionButtonData:", self->_stashedActionButtonData);
}

- (id)_currentActionButtonData
{
  return +[BYActionButtonStore currentData](BYActionButtonStore, "currentData");
}

- (void)_setCurrentActionButtonData:(id)a3
{
  +[BYActionButtonStore setCurrentData:](BYActionButtonStore, "setCurrentData:", a3);
}

- (id)_preferencesForDomain:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stashedPreferences, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_stashedPreferences, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_shovePath:(id)a3 toPath:(id)a4
{
  BFFSettingsManager *v6;
  BFFSettingsManager *v7;
  void *v8;
  void *v9;
  void *v10;
  BFFSettingsManager *v11;
  NSObject *v12;
  int v13;
  BFFSettingsManager *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BFFSettingsManager *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BFFSettingsManager *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  BFFSettingsManager *v34;
  NSObject *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  BFFSettingsManager *v47;
  void *v48;
  void *v49;
  BFFSettingsManager *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  BFFSettingsManager *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  BFFSettingsManager *v60;
  void *v61;
  BFFSettingsManager *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  char v66;
  NSObject *v67;
  BFFSettingsManager *v68;
  BFFSettingsManager *v69;
  int v70;
  void *v71;
  void *v72;
  char v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  char v78;
  NSObject *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  NSObject *v88;
  BFFSettingsManager *v89;
  BFFSettingsManager *v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  NSObject *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  BFFSettingsManager *obj;
  void *v106;
  BFFSettingsManager *v107;
  BFFSettingsManager *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  BFFSettingsManager *v113;
  BFFSettingsManager *v114;
  BFFSettingsManager *v115;
  BFFSettingsManager *v116;
  BFFSettingsManager *v117;
  BFFSettingsManager *v118;
  BFFSettingsManager *v119;
  BFFSettingsManager *v120;
  id v121;
  _BYTE v122[128];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  uint8_t buf[4];
  BFFSettingsManager *v132;
  __int16 v133;
  uint64_t v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v6 = (BFFSettingsManager *)a3;
  v7 = (BFFSettingsManager *)a4;
  v8 = (void *)0x1E0CB3000;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  v107 = v6;
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v6, &v121);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (BFFSettingsManager *)v121;

  if (!v10)
  {
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v13 = 0;
        v14 = v11;
      }
      else if (v11)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        -[BFFSettingsManager domain](v11, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v8, -[BFFSettingsManager code](v11, "code"));
        v14 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
        v13 = 1;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v132 = v14;
      _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get attributes for source path: %{public}@", buf, 0xCu);
      if (v13)
      {

      }
    }

  }
  v16 = *MEMORY[0x1E0CB2B18];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2B18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB2B20];
  v19 = objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0CB2B20]);

  if (v10)
  {
    v106 = v10;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v11;
    objc_msgSend(v20, "attributesOfItemAtPath:error:", v7, &v120);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v120;

    objc_msgSend(v21, "objectForKey:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)*MEMORY[0x1E0CB2B30];

    if (v23 == v24)
    {
      v7 = objc_retainAutorelease(v7);
      if (realpath_DARWIN_EXTSN((const char *)-[BFFSettingsManager fileSystemRepresentation](v7, "fileSystemRepresentation"), (char *)buf))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFileSystemRepresentation:length:", buf, strlen((const char *)buf));
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = v22;
        objc_msgSend(v27, "attributesOfItemAtPath:error:", v26, &v119);
        v28 = objc_claimAutoreleasedReturnValue();
        v24 = v21;
        v29 = v119;

        v22 = v29;
        v21 = (void *)v28;
        v7 = (BFFSettingsManager *)v26;
      }
    }
    objc_msgSend(v21, "objectForKey:", v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqual:", v18);

    if ((v19 & 1) != 0)
    {
      if (!v21)
      {
        -[BFFSettingsManager stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
        v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "fileExistsAtPath:", v50);

        if ((v54 & 1) != 0)
        {
          v55 = v22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v22;
          v66 = objc_msgSend(v65, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v50, 1, 0, &v115);
          v55 = v115;

          if ((v66 & 1) == 0)
          {
            _BYLoggingFacility();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              v68 = v7;
              v69 = v50;
              if ((_BYIsInternalInstall() & 1) != 0)
              {
                v70 = 0;
                v71 = v55;
              }
              else if (v55)
              {
                v83 = (void *)MEMORY[0x1E0CB3940];
                -[BFFSettingsManager domain](v55, "domain");
                v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v50, -[BFFSettingsManager code](v55, "code"));
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = 1;
              }
              else
              {
                v70 = 0;
                v71 = 0;
              }
              *(_DWORD *)buf = 138412546;
              v132 = v69;
              v133 = 2114;
              v134 = (uint64_t)v71;
              _os_log_impl(&dword_1A4E92000, v67, OS_LOG_TYPE_DEFAULT, "Failed to create target directory %@: %{public}@", buf, 0x16u);
              if (v70)
              {

              }
              v50 = v69;
              v7 = v68;
            }

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v55;
        v87 = objc_msgSend(v86, "moveItemAtPath:toPath:error:", v107, v7, &v114);
        v22 = v114;

        if ((v87 & 1) != 0)
        {
          v48 = 0;
        }
        else
        {
          _BYLoggingFacility();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = v7;
            v90 = v50;
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v91 = 0;
              v92 = v22;
            }
            else if (v22)
            {
              v93 = (void *)MEMORY[0x1E0CB3940];
              -[BFFSettingsManager domain](v22, "domain");
              v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v50, -[BFFSettingsManager code](v22, "code"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = 1;
            }
            else
            {
              v91 = 0;
              v92 = 0;
            }
            *(_DWORD *)buf = 138412546;
            v132 = v107;
            v133 = 2114;
            v134 = (uint64_t)v92;
            _os_log_impl(&dword_1A4E92000, v88, OS_LOG_TYPE_DEFAULT, "Failed to move directory into place %@: %{public}@", buf, 0x16u);
            if (v91)
            {

            }
            v50 = v90;
            v7 = v89;
          }

          v94 = (void *)MEMORY[0x1E0CB35C8];
          v125[0] = CFSTR("source");
          v125[1] = CFSTR("target");
          v126[0] = v107;
          v126[1] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "errorWithDomain:code:userInfo:", CFSTR("BFFSettingsManagerErrorDomain"), -2001, v95);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v21 = 0;
        goto LABEL_113;
      }
      if ((v31 & 1) != 0)
      {
        v104 = v21;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v22;
        objc_msgSend(v32, "contentsOfDirectoryAtPath:error:", v107, &v113);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v113;

        if (v34)
        {
          _BYLoggingFacility();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = _BYIsInternalInstall();
            v37 = v34;
            if ((v36 & 1) == 0)
            {
              v38 = (void *)MEMORY[0x1E0CB3940];
              -[BFFSettingsManager domain](v34, "domain");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v24, -[BFFSettingsManager code](v34, "code"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
            }
            *(_DWORD *)buf = 138412546;
            v132 = v107;
            v133 = 2114;
            v134 = (uint64_t)v37;
            _os_log_impl(&dword_1A4E92000, v35, OS_LOG_TYPE_DEFAULT, "Unable to get contents of %@: %{public}@", buf, 0x16u);
            if ((v36 & 1) == 0)
            {

            }
          }

        }
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        obj = v33;
        v39 = -[BFFSettingsManager countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v110;
          while (2)
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v110 != v41)
                objc_enumerationMutation(obj);
              v43 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
              -[BFFSettingsManager stringByAppendingPathComponent:](v107, "stringByAppendingPathComponent:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[BFFSettingsManager stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v43);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[BFFSettingsManager _shovePath:toPath:](self, "_shovePath:toPath:", v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                v22 = v46;

                v50 = obj;
                v48 = v22;
                goto LABEL_62;
              }

              v34 = 0;
            }
            v40 = -[BFFSettingsManager countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
            v34 = 0;
            v47 = 0;
            if (v40)
              continue;
            break;
          }
        }
        else
        {
          v47 = v34;
        }
        v50 = obj;

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v47;
        v78 = objc_msgSend(v77, "removeItemAtPath:error:", v107, &v108);
        v22 = v108;

        if ((v78 & 1) != 0)
        {
          v48 = 0;
LABEL_62:
          v21 = v104;
          goto LABEL_113;
        }
        _BYLoggingFacility();
        v79 = objc_claimAutoreleasedReturnValue();
        v21 = v104;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v80 = 0;
            v81 = v22;
          }
          else if (v22)
          {
            v85 = (void *)MEMORY[0x1E0CB3940];
            -[BFFSettingsManager domain](v22, "domain");
            v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v50, -[BFFSettingsManager code](v22, "code"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = 1;
          }
          else
          {
            v80 = 0;
            v81 = 0;
          }
          *(_DWORD *)buf = 138412546;
          v132 = v107;
          v133 = 2114;
          v134 = (uint64_t)v81;
          _os_log_impl(&dword_1A4E92000, v79, OS_LOG_TYPE_DEFAULT, "Unable to remove source directory %@: %{public}@", buf, 0x16u);
          if (v80)
          {

          }
          v50 = obj;
        }

        v62 = v22;
        v22 = v62;
        goto LABEL_44;
      }
      v61 = (void *)MEMORY[0x1E0CB35C8];
      v123[0] = CFSTR("source");
      v123[1] = CFSTR("target");
      v124[0] = v107;
      v124[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
      v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
      v51 = v61;
      v52 = -2002;
LABEL_43:
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("BFFSettingsManagerErrorDomain"), v52, v50);
      v62 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
LABEL_44:
      v48 = v62;
      goto LABEL_113;
    }
    if (v21)
    {
      if (v31)
      {
        v49 = (void *)MEMORY[0x1E0CB35C8];
        v129[0] = CFSTR("source");
        v129[1] = CFSTR("target");
        v130[0] = v107;
        v130[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
        v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
        v51 = v49;
        v52 = -2003;
        goto LABEL_43;
      }
      v56 = v21;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v22;
      v64 = objc_msgSend(v63, "removeItemAtPath:error:", v7, &v117);
      v60 = v117;

      if ((v64 & 1) != 0)
      {
        v57 = 0x1E0CB3000;
LABEL_102:
        objc_msgSend(*(id *)(v57 + 1568), "defaultManager");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v60;
        v97 = objc_msgSend(v96, "moveItemAtPath:toPath:error:", v107, v7, &v116);
        v22 = v116;

        if ((v97 & 1) != 0)
        {
          v48 = 0;
          v21 = v56;
LABEL_114:

          v11 = v22;
          v10 = v106;
          goto LABEL_115;
        }
        _BYLoggingFacility();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v99 = 0;
            v100 = v22;
          }
          else if (v22)
          {
            v101 = (void *)MEMORY[0x1E0CB3940];
            -[BFFSettingsManager domain](v22, "domain");
            self = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), self, -[BFFSettingsManager code](v22, "code"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = 1;
          }
          else
          {
            v99 = 0;
            v100 = 0;
          }
          *(_DWORD *)buf = 138412546;
          v132 = v107;
          v133 = 2114;
          v134 = (uint64_t)v100;
          _os_log_impl(&dword_1A4E92000, v98, OS_LOG_TYPE_DEFAULT, "Failed to move directory into place %@: %{public}@", buf, 0x16u);
          if (v99)
          {

          }
        }

        v102 = (void *)MEMORY[0x1E0CB35C8];
        v127[0] = CFSTR("source");
        v127[1] = CFSTR("target");
        v128[0] = v107;
        v128[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
        v50 = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "errorWithDomain:code:userInfo:", CFSTR("BFFSettingsManagerErrorDomain"), -2001, v50);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v56;
LABEL_113:

        goto LABEL_114;
      }
      _BYLoggingFacility();
      self = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_100;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v76 = 0;
        v19 = (uint64_t)v60;
      }
      else if (v60)
      {
        v82 = (void *)MEMORY[0x1E0CB3940];
        -[BFFSettingsManager domain](v60, "domain");
        v64 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v64, -[BFFSettingsManager code](v60, "code"));
        v19 = objc_claimAutoreleasedReturnValue();
        v76 = 1;
      }
      else
      {
        v76 = 0;
        v19 = 0;
      }
      *(_DWORD *)buf = 138412546;
      v132 = v7;
      v133 = 2114;
      v134 = v19;
      _os_log_impl(&dword_1A4E92000, &self->super, OS_LOG_TYPE_DEFAULT, "Unable to remove file at path: %@ - %{public}@", buf, 0x16u);
      if (!v76)
        goto LABEL_100;
      goto LABEL_98;
    }
    v56 = 0;
    -[BFFSettingsManager stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
    self = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
    v57 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "fileExistsAtPath:", self);

    if ((v59 & 1) != 0)
    {
      v60 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v22;
      v73 = objc_msgSend(v72, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self, 1, 0, &v118);
      v60 = v118;

      if ((v73 & 1) == 0)
      {
        _BYLoggingFacility();
        v64 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_DEFAULT))
          goto LABEL_99;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v74 = 0;
          v75 = v60;
        }
        else if (v60)
        {
          v84 = (void *)MEMORY[0x1E0CB3940];
          -[BFFSettingsManager domain](v60, "domain");
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v19, -[BFFSettingsManager code](v60, "code"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 1;
        }
        else
        {
          v74 = 0;
          v75 = 0;
        }
        *(_DWORD *)buf = 138412546;
        v132 = self;
        v133 = 2114;
        v134 = (uint64_t)v75;
        _os_log_impl(&dword_1A4E92000, (os_log_t)v64, OS_LOG_TYPE_DEFAULT, "Failed to create target directory %@: %{public}@", buf, 0x16u);
        if (!v74)
          goto LABEL_99;

LABEL_98:
LABEL_99:

LABEL_100:
        v57 = 0x1E0CB3000uLL;
      }
    }

    goto LABEL_102;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BFFSettingsManagerErrorDomain"), -2000, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_115:

  return v48;
}

+ (BOOL)removeSafeHaven
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Removing safe haven on disk...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v4 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/private/var/buddy/Configuration.plist"), &v23);
  v5 = v23;

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E0CB28A8])
    {

    }
    else
    {
      v8 = (void *)objc_msgSend(v5, "code");

      if (v8 != (void *)4)
      {
        _BYLoggingFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v10 = 0;
            v11 = v5;
          }
          else if (v5)
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v5, "domain");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v8, objc_msgSend(v5, "code"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = 1;
          }
          else
          {
            v10 = 0;
            v11 = 0;
          }
          *(_DWORD *)buf = 138543362;
          v25 = v11;
          _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to remove existing safe haven configuration: %{public}@", buf, 0xCu);
          if (v10)
          {

          }
        }
        v16 = 0;
        goto LABEL_31;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  v13 = objc_msgSend(v12, "removeItemAtPath:error:", CFSTR("/private/var/buddy/Root/"), &v22);
  v14 = v22;

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v14, "domain");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9 == *MEMORY[0x1E0CB28A8])
    {
      v16 = 1;
    }
    else
    {
      v15 = (void *)objc_msgSend(v14, "code");

      if (v15 == (void *)4)
        goto LABEL_13;
      _BYLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v17 = 0;
          v18 = v14;
        }
        else if (v14)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v14, "domain");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v15, objc_msgSend(v14, "code"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 1;
        }
        else
        {
          v17 = 0;
          v18 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to remove existing safe haven paths: %{public}@", buf, 0xCu);
        if (v17)
        {

        }
      }
      v16 = 0;
    }
    v5 = v14;
LABEL_31:

    v14 = v5;
    goto LABEL_32;
  }
LABEL_13:
  v16 = 1;
LABEL_32:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_stashedActionButtonData, 0);
  objc_storeStrong((id *)&self->_stashedSiriLanguage, 0);
  objc_storeStrong((id *)&self->_stashedSiriOutputVoice, 0);
  objc_storeStrong((id *)&self->_stashedAnalytics, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentProgramID, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentAssetAudience, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentProgramName, 0);
  objc_storeStrong((id *)&self->_stashedUserInterfaceStyleMode, 0);
  objc_storeStrong((id *)&self->_stashedAccessibilityData, 0);
  objc_storeStrong((id *)&self->_stashedAutoDownloadEnabled, 0);
  objc_storeStrong((id *)&self->_stashedAutoUpdateEnabled, 0);
  objc_storeStrong((id *)&self->_stashedScreenTimeEnabled, 0);
  objc_storeStrong((id *)&self->_stashedFlowSkipIdentifiers, 0);
  objc_storeStrong((id *)&self->_stashedWatchData, 0);
  objc_storeStrong((id *)&self->_stashedLocationServicesSettings, 0);
  objc_storeStrong((id *)&self->_stashedLocationServicesEnabled, 0);
  objc_storeStrong((id *)&self->_stashedSiriDataSharingOptInStatus, 0);
  objc_storeStrong((id *)&self->_stashedAssistantVoiceTriggerEnabled, 0);
  objc_storeStrong((id *)&self->_stashedAssistantEnabled, 0);
  objc_storeStrong((id *)&self->_stashedManagedConfigurationSettings, 0);
  objc_storeStrong((id *)&self->_stashedPreferences, 0);
  objc_storeStrong((id *)&self->_stashedPaths, 0);
}

+ (void)loadConfigurationFromDisk
{
  void *v1;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = OUTLINED_FUNCTION_3_0();
  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = OUTLINED_FUNCTION_2_0();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Unable to read configuration for stash values: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

void __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = OUTLINED_FUNCTION_3_0();
  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = OUTLINED_FUNCTION_2_0();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Failed to get Siri data sharing opt-in status for stashing: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

void __48__BFFSettingsManager__applyAssistantPreferences__block_invoke_cold_1(void *a1)
{
  void *v1;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = OUTLINED_FUNCTION_3_0();
  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = OUTLINED_FUNCTION_2_0();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Failed to set Siri data sharing opt-in: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

@end
