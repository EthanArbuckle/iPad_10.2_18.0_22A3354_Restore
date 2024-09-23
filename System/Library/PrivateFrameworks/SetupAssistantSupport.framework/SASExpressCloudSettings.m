@implementation SASExpressCloudSettings

+ (id)createExpressSettingsWithQueue:(id)a3
{
  NSObject *v3;
  SASExpressSettings *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v3 = a3;
  dispatch_assert_queue_V2(v3);
  v4 = objc_alloc_init(SASExpressSettings);
  -[SASExpressSettings setVersion:](v4, "setVersion:", 1);
  +[SASSystemInformation productType](SASSystemInformation, "productType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setProductType:](v4, "setProductType:", v5);

  +[SASSystemInformation deviceClass](SASSystemInformation, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setDeviceClass:](v4, "setDeviceClass:", v6);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setDeviceAnalyticsOptIn:](v4, "setDeviceAnalyticsOptIn:", objc_msgSend(v7, "userBoolValueForSetting:", *MEMORY[0x1E0D46FC0]) == 1);

  +[SASExpressCloudSettings privacyBundleForIdentifier:](SASExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.analyticsdevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setDeviceAnalyticsPrivacyBundle:](v4, "setDeviceAnalyticsPrivacyBundle:", v8);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setAppAnalyticsOptIn:](v4, "setAppAnalyticsOptIn:", objc_msgSend(v9, "userBoolValueForSetting:", *MEMORY[0x1E0D46EF0]) == 1);

  +[SASExpressCloudSettings privacyBundleForIdentifier:](SASExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.analyticsapp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setAppAnalyticsPrivacyBundle:](v4, "setAppAnalyticsPrivacyBundle:", v10);

  -[SASExpressSettings setLocationServicesOptIn:](v4, "setLocationServicesOptIn:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
  +[SASExpressCloudSettings privacyBundleForIdentifier:](SASExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.locationservices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setLocationServicesPrivacyBundle:](v4, "setLocationServicesPrivacyBundle:", v11);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v12 = (void *)getAFPreferencesClass_softClass;
  v43 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getAFPreferencesClass_block_invoke;
    v38 = &unk_1E97DC4E8;
    v39 = &v40;
    __getAFPreferencesClass_block_invoke((uint64_t)&v35);
    v12 = (void *)v41[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v13, "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setSiriOptIn:](v4, "setSiriOptIn:", objc_msgSend(v14, "assistantIsEnabled"));

  +[SASExpressCloudSettings privacyBundleForIdentifier:](SASExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.siri"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setSiriPrivacyBundle:](v4, "setSiriPrivacyBundle:", v15);

  objc_msgSend((id)objc_opt_class(), "_isFindMyEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    -[SASExpressSettings setFindMyOptIn:](v4, "setFindMyOptIn:", objc_msgSend(v16, "BOOLValue"));
    +[SASExpressCloudSettings privacyBundleForIdentifier:](SASExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.findmy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASExpressSettings setFindMyPrivacyBundle:](v4, "setFindMyPrivacyBundle:", v18);

  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v19 = (void *)getSUManagerClientClass_softClass;
  v43 = getSUManagerClientClass_softClass;
  if (!getSUManagerClientClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getSUManagerClientClass_block_invoke;
    v38 = &unk_1E97DC4E8;
    v39 = &v40;
    __getSUManagerClientClass_block_invoke((uint64_t)&v35);
    v19 = (void *)v41[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v40, 8);
  v21 = (void *)objc_msgSend([v20 alloc], "initWithDelegate:queue:clientType:", 0, v3, 0);
  -[SASExpressSettings setSoftwareUpdateAutoUpdateEnabled:](v4, "setSoftwareUpdateAutoUpdateEnabled:", objc_msgSend(v21, "isAutomaticUpdateV2Enabled"));
  -[SASExpressSettings setSoftwareUpdateAutoDownloadEnabled:](v4, "setSoftwareUpdateAutoDownloadEnabled:", objc_msgSend(v21, "isAutomaticDownloadEnabled"));
  objc_msgSend((id)objc_opt_class(), "_isScreenTimeEnabled");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    -[SASExpressSettings setScreenTimeEnabled:](v4, "setScreenTimeEnabled:", objc_msgSend(v22, "BOOLValue"));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v24 = (void *)getPKPassLibraryClass_softClass;
  v43 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getPKPassLibraryClass_block_invoke;
    v38 = &unk_1E97DC4E8;
    v39 = &v40;
    __getPKPassLibraryClass_block_invoke((uint64_t)&v35);
    v24 = (void *)v41[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v25, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "backupMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setWalletData:](v4, "setWalletData:", v27);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v28 = (void *)getNRMigratorClass_softClass;
  v43 = getNRMigratorClass_softClass;
  if (!getNRMigratorClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getNRMigratorClass_block_invoke;
    v38 = &unk_1E97DC4E8;
    v39 = &v40;
    __getNRMigratorClass_block_invoke((uint64_t)&v35);
    v28 = (void *)v41[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v29, "sharedMigrator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "migrationConsentRequestData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings setWatchMigrationData:](v4, "setWatchMigrationData:", v31);

  -[SASExpressSettings setAppearanceMode:](v4, "setAppearanceMode:", objc_msgSend((id)objc_opt_class(), "_appearanceValue"));
  objc_msgSend((id)objc_opt_class(), "_displayZoomOption");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    -[SASExpressSettings setDisplayZoomOption:](v4, "setDisplayZoomOption:", objc_msgSend(v32, "intValue"));

  return v4;
}

+ (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  SASExpressCloudSettings *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SASExpressCloudSettings);
  -[SASExpressCloudSettings updateSettings:withCompletion:](v7, "updateSettings:withCompletion:", v6, v5);

}

+ (void)fetchSettingsWithCompletion:(id)a3
{
  id v3;
  SASExpressCloudSettings *v4;

  v3 = a3;
  v4 = objc_alloc_init(SASExpressCloudSettings);
  -[SASExpressCloudSettings fetchSettingsWithCompletion:](v4, "fetchSettingsWithCompletion:", v3);

}

- (SASExpressCloudSettings)init
{
  return -[SASExpressCloudSettings initWithContainerIdentifier:](self, "initWithContainerIdentifier:", CFSTR("com.apple.setupassistant.expresssetup"));
}

- (SASExpressCloudSettings)initWithContainerIdentifier:(id)a3
{
  id v4;
  SASExpressCloudSettings *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  SASCloudKitClient *v8;
  SASCloudKitClient *cloudKitClient;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASExpressCloudSettings;
  v5 = -[SASExpressCloudSettings init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("Express Settings CloudKit Queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = -[SASCloudKitClient initWithContainerIdentifier:callbackQueue:]([SASCloudKitClient alloc], "initWithContainerIdentifier:callbackQueue:", v4, v5->_queue);
    cloudKitClient = v5->_cloudKitClient;
    v5->_cloudKitClient = v8;

  }
  return v5;
}

- (void)setXpcActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SASExpressCloudSettings cloudKitClient](self, "cloudKitClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setXpcActivity:", v4);

}

- (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SASExpressCloudSettings cloudKitClient](self, "cloudKitClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke;
    v19[3] = &unk_1E97DC3D0;
    v21 = v7;
    v19[4] = self;
    v20 = v6;
    objc_msgSend(v10, "fetchCurrentDeviceIDWithCompletion:", v19);

  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SASExpressCloudSettings updateSettings:withCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1D45FD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch device ID: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_217;
    v12[3] = &unk_1E97DC3A8;
    v16 = *(id *)(a1 + 48);
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    objc_msgSend(v8, "_setupRecordZoneWithName:completion:", CFSTR("settings"), v12);

  }
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_217(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[SASExpressCloudSettings _queryForSettingsForDeviceID:](SASExpressCloudSettings, "_queryForSettingsForDeviceID:", a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "cloudKitClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_218;
    v12[3] = &unk_1E97DC380;
    v9 = v6;
    v10 = a1[5];
    v13 = v9;
    v14 = v10;
    v15 = v5;
    v16 = a1[4];
    v17 = a1[6];
    v18 = a1[7];
    objc_msgSend(v8, "fetchRecords:inZone:group:completion:", v7, v15, 0, v12);

  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_217_cold_1();

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_218_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  }
  +[SASSystemInformation productVersion](SASSystemInformation, "productVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "zoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_createSettingsRecordInZoneID:forDeviceID:", v17, *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  +[SASSystemInformation productType](SASSystemInformation, "productType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProductType:", v19);

  +[SASSystemInformation deviceClass](SASSystemInformation, "deviceClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDeviceClass:", v20);

  objc_msgSend(v18, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encryptedValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("settings"));

  if (v14)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("productBuild"));
  objc_msgSend(*(id *)(a1 + 40), "cloudKitClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_221;
  v24[3] = &unk_1E97DC358;
  v25 = *(id *)(a1 + 72);
  objc_msgSend(v23, "saveRecord:group:completion:", v15, 0, v24);

}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_221(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_221_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke;
    v8[3] = &unk_1E97DC3F8;
    v9 = v4;
    -[SASExpressCloudSettings _fetchAppropriateSettingsWithCompletion:](self, "_fetchAppropriateSettingsWithCompletion:", v8);

  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D45FD000, v7, OS_LOG_TYPE_DEFAULT, "Unable to fetch settings as there's no account", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  SASExpressSettings *v10;
  void *v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_3();
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_15;
  }
  if (!v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_1(v7, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_4;
  }
  objc_msgSend(v5, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("settings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(SASExpressSettings);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v9);
  if (SASExpressSettingsReadFrom((uint64_t)v10, (uint64_t)v11))
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v12();

LABEL_15:
}

- (void)_setupRecordZoneWithName:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SASExpressCloudSettings *v16;
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C95098];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v8, *MEMORY[0x1E0C94730]);

  -[SASExpressCloudSettings cloudKitClient](self, "cloudKitClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke;
  v14[3] = &unk_1E97DC420;
  v15 = v10;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v11, "fetchRecordZone:group:completion:", v13, 0, v14);

}

void __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke_cold_1();

    if (!+[SASExpressCloudSettings _isCloudKitError:](SASExpressCloudSettings, "_isCloudKitError:", v6)
      || objc_msgSend(v6, "code") != 26)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_10;
    }
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "cloudKitClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveRecordZone:group:completion:", v5, 0, *(_QWORD *)(a1 + 48));

  }
LABEL_10:

}

- (id)_createSettingsRecordInZoneID:(id)a3 forDeviceID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C95048];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithRecordType:zoneID:", CFSTR("Settings"), v7);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("deviceUUID"));
  +[SASSystemInformation deviceClass](SASSystemInformation, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("deviceClass"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E97E1980, CFSTR("platform"));
  return v8;
}

- (void)_fetchAppropriateSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SASSystemInformation deviceClass](SASSystemInformation, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_queryForSettingsFromPastMonthForDeviceClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_zoneForSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v8, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQualityOfService:", 25);

  +[SASLogging facility](SASLogging, "facility");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1D45FD000, v10, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for device class \"%@\"...", buf, 0xCu);
  }

  -[SASExpressCloudSettings cloudKitClient](self, "cloudKitClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke;
  v15[3] = &unk_1E97DC470;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v18 = v4;
  v12 = v8;
  v13 = v7;
  v14 = v4;
  objc_msgSend(v11, "fetchRecords:inZone:group:completion:", v6, v13, v12, v15);

}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SASLogging facility](SASLogging, "facility");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1D45FD000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", buf, 0xCu);

    }
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_queryForSettingsFromPastMonthForPlatform:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SASLogging facility](SASLogging, "facility");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D45FD000, v9, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for the current platform...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cloudKitClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_241;
    v16[3] = &unk_1E97DC470;
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v19 = v13;
    v16[4] = v14;
    v17 = v15;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v10, "fetchRecords:inZone:group:completion:", v8, v11, v12, v16);

  }
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_241(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SASLogging facility](SASLogging, "facility");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1D45FD000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", buf, 0xCu);

    }
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_queryForSettingsFromPastMonth");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SASLogging facility](SASLogging, "facility");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D45FD000, v9, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for any platform/device class...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cloudKitClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_242;
    v13[3] = &unk_1E97DC448;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v10, "fetchRecords:inZone:group:completion:", v8, v11, v12, v13);

  }
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SASLogging facility](SASLogging, "facility");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D45FD000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", (uint8_t *)&v13, 0xCu);

    }
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_242_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (BOOL)_isCloudKitError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  return v4;
}

+ (id)_queryForSettingsForDeviceID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceUUID == %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("Settings"), v3);

  return v4;
}

+ (id)_queryForSettingsFromPastMonthForPlatform:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("platform == %ld"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v3;
  +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth](SASExpressCloudSettings, "_predicateForRecordsModifiedInPastMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("Settings"), v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  return v8;
}

+ (id)_queryForSettingsFromPastMonthForDeviceClass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceClass == %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v3;
  +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth](SASExpressCloudSettings, "_predicateForRecordsModifiedInPastMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("Settings"), v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  return v8;
}

+ (id)_queryForSettingsFromPastMonth
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95010]);
  +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth](SASExpressCloudSettings, "_predicateForRecordsModifiedInPastMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordType:predicate:", CFSTR("Settings"), v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  return v4;
}

+ (id)_predicateForRecordsModifiedInPastMonth
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setMonth:", -1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modificationDate >= %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_zoneForSettings
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("settings"));
}

+ (id)privacyBundleForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SASExpressSettingsPrivacyBundle *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getOBBundleClass_softClass;
  v14 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getOBBundleClass_block_invoke;
    v10[3] = &unk_1E97DC4E8;
    v10[4] = &v11;
    __getOBBundleClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v5, "bundleWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyFlow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
    -[SASExpressSettingsPrivacyBundle setIdentifier:](v8, "setIdentifier:", v3);
    -[SASExpressSettingsPrivacyBundle setContentVersion:](v8, "setContentVersion:", objc_msgSend(v7, "contentVersion"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_isFindMyEnabled
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getFMDFMIPManagerClass_softClass;
  v23 = getFMDFMIPManagerClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getFMDFMIPManagerClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getFMDFMIPManagerClass_block_invoke;
    v19[3] = &unk_1E97DC4E8;
    v19[4] = &v20;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke;
  v10[3] = &unk_1E97DC498;
  v12 = &v13;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v6, "fmipStateWithCompletion:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 == 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_isScreenTimeEnabled
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getSTManagementStateClass_softClass;
  v23 = getSTManagementStateClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getSTManagementStateClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getSTManagementStateClass_block_invoke;
    v19[3] = &unk_1E97DC4E8;
    v19[4] = &v20;
    __getSTManagementStateClass_block_invoke((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  v6 = objc_alloc_init(v5);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke;
  v10[3] = &unk_1E97DC4C0;
  v12 = &v13;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v6, "screenTimeStateWithCompletionHandler:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 == 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (int)_appearanceValue
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getUISUserInterfaceStyleModeClass_softClass;
  v13 = getUISUserInterfaceStyleModeClass_softClass;
  if (!getUISUserInterfaceStyleModeClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getUISUserInterfaceStyleModeClass_block_invoke;
    v9[3] = &unk_1E97DC4E8;
    v9[4] = &v10;
    __getUISUserInterfaceStyleModeClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithDelegate:", 0);
  v5 = objc_msgSend(v4, "modeValue");
  if (v5 == 1)
    v6 = 1;
  else
    v6 = 3;
  if (v5 == 2)
    v7 = 2;
  else
    v7 = v6;

  return v7;
}

+ (id)_displayZoomOption
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("zoomed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v3, "count") == 4)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v17 = (void *)getCADisplayClass_softClass;
    v28 = getCADisplayClass_softClass;
    if (!getCADisplayClass_softClass)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getCADisplayClass_block_invoke;
      v24[3] = &unk_1E97DC4E8;
      v24[4] = &v25;
      __getCADisplayClass_block_invoke((uint64_t)v24);
      v17 = (void *)v26[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v18, "mainDisplay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentMode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (double)(unint64_t)objc_msgSend(v20, "height");
    v22 = v13 * v16;
    if (v22 == v21 && v7 * v10 == (double)(unint64_t)objc_msgSend(v20, "width", v21, v22))
      v4 = &unk_1E97E1998;
    else
      v4 = &unk_1E97E19B0;

  }
  return v4;
}

- (SASCloudKitClient)cloudKitClient
{
  return self->_cloudKitClient;
}

- (void)setCloudKitClient:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudKitClient, 0);
}

- (void)updateSettings:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D45FD000, a1, a3, "Unable to fetch settings as there's no account", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_217_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Error setting up record zone: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_218_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D45FD000, a2, a3, "Error fetching records: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_221_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to save record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D45FD000, a1, a3, "No settings found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D45FD000, a1, a3, "Failed to read settings", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Unable to fetch settings: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to fetching record zone: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_242_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to fetch records: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to retrieve Find My state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to retrieve Screen Time state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
