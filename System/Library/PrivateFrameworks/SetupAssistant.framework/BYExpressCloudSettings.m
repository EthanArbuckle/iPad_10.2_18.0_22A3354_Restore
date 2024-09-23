@implementation BYExpressCloudSettings

+ (id)createExpressSettingsWithQueue:(id)a3
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v37;
  uint64_t v38;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = a3;
  dispatch_assert_queue_V2(v3);
  v4 = objc_alloc_init(MEMORY[0x1E0D8D728]);
  objc_msgSend(v4, "setVersion:", 1);
  objc_msgSend(MEMORY[0x1E0D8D738], "productType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductType:", v5);

  objc_msgSend(MEMORY[0x1E0D8D738], "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceClass:", v6);

  objc_msgSend(MEMORY[0x1E0D8D738], "productVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductVersion:", v7);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceAnalyticsOptIn:", objc_msgSend(v8, "userBoolValueForSetting:", *MEMORY[0x1E0D46FC0]) == 1);

  +[BYExpressCloudSettings privacyBundleForIdentifier:](BYExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.analyticsdevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceAnalyticsPrivacyBundle:", v9);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppAnalyticsOptIn:", objc_msgSend(v10, "userBoolValueForSetting:", *MEMORY[0x1E0D46EF0]) == 1);

  +[BYExpressCloudSettings privacyBundleForIdentifier:](BYExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.analyticsapp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppAnalyticsPrivacyBundle:", v11);

  objc_msgSend(v4, "setLocationServicesOptIn:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
  +[BYExpressCloudSettings privacyBundleForIdentifier:](BYExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.locationservices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocationServicesPrivacyBundle:", v12);

  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v13 = (void *)getAFPreferencesClass_softClass_3;
  v45 = getAFPreferencesClass_softClass_3;
  if (!getAFPreferencesClass_softClass_3)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getAFPreferencesClass_block_invoke_3;
    v40 = &unk_1E4E26900;
    v41 = &v42;
    __getAFPreferencesClass_block_invoke_3((uint64_t)&v37);
    v13 = (void *)v43[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v14, "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriOptIn:", objc_msgSend(v15, "assistantIsEnabled"));

  +[BYExpressCloudSettings privacyBundleForIdentifier:](BYExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.siri"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriPrivacyBundle:", v16);

  objc_msgSend(v4, "setSiriVoiceTriggerEnabled:", +[BYSiriUtilities isVoiceTriggerEnabled](BYSiriUtilities, "isVoiceTriggerEnabled"));
  objc_msgSend((id)objc_opt_class(), "_isFindMyEnabled");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v4, "setFindMyOptIn:", objc_msgSend(v17, "BOOLValue"));
    +[BYExpressCloudSettings privacyBundleForIdentifier:](BYExpressCloudSettings, "privacyBundleForIdentifier:", CFSTR("com.apple.onboarding.findmy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFindMyPrivacyBundle:", v19);

  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v20 = (void *)getSUManagerClientClass_softClass_1;
  v45 = getSUManagerClientClass_softClass_1;
  if (!getSUManagerClientClass_softClass_1)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getSUManagerClientClass_block_invoke_1;
    v40 = &unk_1E4E26900;
    v41 = &v42;
    __getSUManagerClientClass_block_invoke_1((uint64_t)&v37);
    v20 = (void *)v43[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v42, 8);
  v22 = (void *)objc_msgSend([v21 alloc], "initWithDelegate:queue:clientType:", 0, v3, 0);
  objc_msgSend(v4, "setSoftwareUpdateAutoUpdateEnabled:", objc_msgSend(v22, "isAutomaticUpdateV2Enabled"));
  objc_msgSend(v4, "setSoftwareUpdateAutoDownloadEnabled:", objc_msgSend(v22, "isAutomaticDownloadEnabled"));
  objc_msgSend((id)objc_opt_class(), "_isScreenTimeEnabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v4, "setScreenTimeEnabled:", objc_msgSend(v23, "BOOLValue"));
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v25 = (void *)getPKPassLibraryClass_softClass_1;
  v45 = getPKPassLibraryClass_softClass_1;
  if (!getPKPassLibraryClass_softClass_1)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getPKPassLibraryClass_block_invoke_1;
    v40 = &unk_1E4E26900;
    v41 = &v42;
    __getPKPassLibraryClass_block_invoke_1((uint64_t)&v37);
    v25 = (void *)v43[3];
  }
  v26 = objc_retainAutorelease(v25);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v26, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "backupMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWalletData:", v28);

  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v29 = (void *)getNRMigratorClass_softClass_1;
  v45 = getNRMigratorClass_softClass_1;
  if (!getNRMigratorClass_softClass_1)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getNRMigratorClass_block_invoke_1;
    v40 = &unk_1E4E26900;
    v41 = &v42;
    __getNRMigratorClass_block_invoke_1((uint64_t)&v37);
    v29 = (void *)v43[3];
  }
  v30 = objc_retainAutorelease(v29);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v30, "sharedMigrator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "migrationConsentRequestData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWatchMigrationData:", v32);

  objc_msgSend(v4, "setAppearanceMode:", objc_msgSend((id)objc_opt_class(), "_appearanceValue"));
  objc_msgSend((id)objc_opt_class(), "_displayZoomOption");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
    objc_msgSend(v4, "setDisplayZoomOption:", objc_msgSend(v33, "intValue"));
  _BYLoggingFacility();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    +[BYExpressCloudSettings createExpressSettingsWithQueue:].cold.1((uint64_t)v4, v35);

  return v4;
}

+ (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D8D720];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "updateSettings:withCompletion:", v7, v6);

}

+ (void)fetchSettingsWithCompletion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D8D720];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "fetchSettingsWithCompletion:", v4);

}

+ (id)privacyBundleForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
    v10[3] = &unk_1E4E26900;
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
    v8 = objc_alloc_init(MEMORY[0x1E0D8D730]);
    objc_msgSend(v8, "setIdentifier:", v3);
    objc_msgSend(v8, "setContentVersion:", objc_msgSend(v7, "contentVersion"));
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
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getFMDFMIPManagerClass_softClass_1;
  v23 = getFMDFMIPManagerClass_softClass_1;
  v4 = MEMORY[0x1E0C809B0];
  if (!getFMDFMIPManagerClass_softClass_1)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getFMDFMIPManagerClass_block_invoke_1;
    v19[3] = &unk_1E4E26900;
    v19[4] = &v20;
    __getFMDFMIPManagerClass_block_invoke_1((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke;
  v10[3] = &unk_1E4E26AA0;
  v12 = &v13;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v6, "fmipStateWithCompletion:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1(v5);

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
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getSTManagementStateClass_softClass_1;
  v23 = getSTManagementStateClass_softClass_1;
  v4 = MEMORY[0x1E0C809B0];
  if (!getSTManagementStateClass_softClass_1)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getSTManagementStateClass_block_invoke_1;
    v19[3] = &unk_1E4E26900;
    v19[4] = &v20;
    __getSTManagementStateClass_block_invoke_1((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  v6 = objc_alloc_init(v5);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke;
  v10[3] = &unk_1E4E27C20;
  v12 = &v13;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v6, "screenTimeStateWithCompletionHandler:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1(v5);

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
  v2 = (void *)getUISUserInterfaceStyleModeClass_softClass_1;
  v13 = getUISUserInterfaceStyleModeClass_softClass_1;
  if (!getUISUserInterfaceStyleModeClass_softClass_1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getUISUserInterfaceStyleModeClass_block_invoke_1;
    v9[3] = &unk_1E4E26900;
    v9[4] = &v10;
    __getUISUserInterfaceStyleModeClass_block_invoke_1((uint64_t)v9);
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
      v24[3] = &unk_1E4E26900;
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
      v4 = &unk_1E4E34530;
    else
      v4 = &unk_1E4E34548;

  }
  return v4;
}

+ (void)createExpressSettingsWithQueue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_DEBUG, "Created express settings %@", (uint8_t *)&v2, 0xCu);
}

void __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1(void *a1)
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
    objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = OUTLINED_FUNCTION_2_0();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Failed to retrieve Find My state: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

void __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1(void *a1)
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
    objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v1;
    v12 = OUTLINED_FUNCTION_2_0();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0_4(&dword_1A4E92000, v3, v4, "Failed to retrieve Screen Time state: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {

  }
  OUTLINED_FUNCTION_1_2();
}

@end
