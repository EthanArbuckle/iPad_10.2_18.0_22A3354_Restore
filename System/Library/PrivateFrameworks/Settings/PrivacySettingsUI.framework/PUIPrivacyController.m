@implementation PUIPrivacyController

- (PUIPrivacyController)init
{
  PUIPrivacyController *v2;
  CoreTelephonyClient *v3;
  CoreTelephonyClient *client;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *securitySettingsQueue;
  NSObject *v8;
  _QWORD block[4];
  PUIPrivacyController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUIPrivacyController;
  v2 = -[PUIPrivacyController init](&v12, sel_init);
  if (v2)
  {
    v3 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x1E0CA6E38]);
    client = v2->__client;
    v2->__client = v3;

    -[CoreTelephonyClient setDelegate:](v2->__client, "setDelegate:", v2);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2("com.apple.PrivacySettingsUI.ssq", v5, 0);
    securitySettingsQueue = v2->securitySettingsQueue;
    v2->securitySettingsQueue = (OS_dispatch_queue *)v6;

    v2->profileInstalledToken = 0;
    v2->profileUninstalledToken = 0;
    v8 = v2->securitySettingsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__PUIPrivacyController_init__block_invoke;
    block[3] = &unk_1EA26B358;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

void __28__PUIPrivacyController_init__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(getNudityDetectionPreferencesHelperClass(), "initializeNudityDetection");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PUIPrivacyController_init__block_invoke_2;
  block[3] = &unk_1EA26B358;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __28__PUIPrivacyController_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setNudityModelSetupHasCompleted:", 1);
  if (objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionFeatureEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_updateNudityDetectionGroup_, CFSTR("CommunicationSafetySettingsEffectiveStoreChanged"), 0);

  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "launchHasCompleted");
  v4 = *(void **)(a1 + 32);
  if (!v3)
    return objc_msgSend(v4, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("launchHasCompleted"), 0, 0);
  objc_msgSend(v4, "reloadSpecifiers");
  return objc_msgSend(*(id *)(a1 + 32), "handlePendingURL");
}

- (void)dealloc
{
  int profileInstalledToken;
  int profileUninstalledToken;
  objc_super v5;

  profileInstalledToken = self->profileInstalledToken;
  if (profileInstalledToken)
    notify_cancel(profileInstalledToken);
  profileUninstalledToken = self->profileUninstalledToken;
  if (profileUninstalledToken)
    notify_cancel(profileUninstalledToken);
  v5.receiver = self;
  v5.super_class = (Class)PUIPrivacyController;
  -[PUIPrivacyController dealloc](&v5, sel_dealloc);
}

+ (id)BOOLeanCapabilitiesToTest
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("launchHasCompleted"), a4, a5, a6))
  {
    if (-[PUIPrivacyController nudityModelSetupHasCompleted](self, "nudityModelSetupHasCompleted"))
    {
      -[PUIPrivacyController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("launchHasCompleted"));
      -[PUIPrivacyController reloadSpecifiers](self, "reloadSpecifiers");
      -[PUIPrivacyController handlePendingURL](self, "handlePendingURL");
    }
  }
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)driverKitSpecifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[PUIPrivacyController driverBundleControllers](self, "driverBundleControllers");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PUIPrivacyController driverBundleControllers](self, "driverBundleControllers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    -[PUIPrivacyController driverBundleControllers](self, "driverBundleControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIPrivacyController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifiersWithSpecifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v12 = *MEMORY[0x1E0D80728];
    v24[0] = *MEMORY[0x1E0D80738];
    v24[1] = v12;
    v25[0] = CFSTR("DriverKitSettings");
    v25[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    v22 = CFSTR("items");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPrivacyController specifier](self, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPrivacyController bundle](self, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    SpecifiersFromPlist();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;

    -[PUIPrivacyController setDriverBundleControllers:](self, "setDriverBundleControllers:", v19, &v20);
    return v18;
  }
}

- (void)_updateNudityDetectionFooter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSRange v25;

  v24 = a3;
  objc_msgSend(getNudityDetectionPreferencesHelperClass(), "mainNudityDetectionFooterText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\[(.+)\\]\\((.+)\\)"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    v9 = objc_msgSend(v6, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPrivacyController setNudityDetectionURL:](self, "setNudityDetectionURL:", v12);

    v13 = objc_msgSend(v7, "rangeAtIndex:", 1);
    objc_msgSend(v4, "substringWithRange:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "range");
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v16, v17, v15);
    v18 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v18;
  }
  else
  {
    v15 = 0;
  }
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProperty:forKey:", v20, *MEMORY[0x1E0D80818]);

  objc_msgSend(v24, "setProperty:forKey:", v4, *MEMORY[0x1E0D80838]);
  if (v15)
  {
    v25.location = objc_msgSend(v4, "rangeOfString:", v15);
    NSStringFromRange(v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v21, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v22, *MEMORY[0x1E0D80830]);

    NSStringFromSelector(sel__nudityDetectionLinkClicked_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v23, *MEMORY[0x1E0D80820]);

  }
}

- (void)updateNudityDetectionGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionFeatureEnabled"))
  {
    -[PUIPrivacyController specifierForID:](self, "specifierForID:", CFSTR("NUDITY_DETECTION_GROUP"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUIPrivacyController _updateNudityDetectionFooter:](self, "_updateNudityDetectionFooter:", v6);
    -[PUIPrivacyController specifierForID:](self, "specifierForID:", CFSTR("NUDITY_DETECTION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D80808]);

    -[PUIPrivacyController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("NUDITY_DETECTION_GROUP"));
    -[PUIPrivacyController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("NUDITY_DETECTION"));

  }
}

- (void)updateSecurityGroup
{
  uint64_t v3;
  NSObject *securitySettingsQueue;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD handler[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  if (!self->profileInstalledToken)
  {
    securitySettingsQueue = self->securitySettingsQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke;
    handler[3] = &unk_1EA26B210;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("MISProvisioningProfileInstalled", &self->profileInstalledToken, securitySettingsQueue, handler);
    objc_destroyWeak(&v12);
  }
  if (!self->profileUninstalledToken)
  {
    v5 = self->securitySettingsQueue;
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_2;
    v9[3] = &unk_1EA26B210;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch("MISProvisioningProfileRemoved", &self->profileUninstalledToken, v5, v9);
    objc_destroyWeak(&v10);
  }
  v6 = self->securitySettingsQueue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3;
  block[3] = &unk_1EA26B410;
  objc_copyWeak(&v8, &location);
  block[4] = self;
  dispatch_async(v6, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSecurityGroup");

}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSecurityGroup");

}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  id v14;
  char v15;
  _BYTE buf[24];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v2 = getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr;
  v17 = getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr;
  if (!getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr)
  {
    v3 = (void *)AppleMobileFileIntegrityLibrary();
    v2 = dlsym(v3, "AMFIShouldShowDeveloperModeSettings");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v2;
    getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(buf, 8);
  if (!v2)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    __break(1u);
  }
  v4 = ((uint64_t (*)(void))v2)();
  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[PUIPrivacyController updateSecurityGroup]_block_invoke_3";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s: shouldShowDeveloperMode: %@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "driverKitSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_59;
    block[3] = &unk_1EA26B3E8;
    block[4] = v8;
    v12 = v9;
    v10 = v9;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v14);

  }
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;

  objc_msgSend(*(id *)(a1 + 32), "driverSpecifiers");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDriverSpecifiers:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "driverSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 40);
  if (v6)
    v7 = objc_msgSend(v6, "count") != 0;
  else
    v7 = 0;
  v8 = 0x1E0D80000uLL;
  if (_os_feature_enabled_impl()
    && +[PUILockdownModeUtilities getCanShowLockdownMode](PUILockdownModeUtilities, "getCanShowLockdownMode"))
  {
    v9 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLockdownMode(CFSTR("LOCKDOWN_MODE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, *(_QWORD *)(a1 + 48), 0, sel_lockdownModeEnabled_, objc_opt_class(), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("LOCKDOWN_MODE"));
  }
  else
  {
    v11 = 0;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    PSBundlePathForPreferenceBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB34D0];
    SFRuntimeAbsoluteFilePathForPath();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleWithPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "classNamed:", CFSTR("DeveloperModeViewController"));
    v17 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForPrivacy(CFSTR("DEVELOPER_MODE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, *(_QWORD *)(a1 + 32), 0, sel_developerModeEnabled_, v16, 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0x1E0D80000;
    objc_msgSend(v19, "setIdentifier:", CFSTR("DeveloperModeController"));

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "removeSpecifierID:", CFSTR("SECURITY_GROUP"));
  objc_msgSend(*(id *)(a1 + 32), "removeSpecifierID:", CFSTR("LOCKDOWN_MODE"));
  objc_msgSend(*(id *)(a1 + 32), "removeSpecifierID:", CFSTR("DeveloperModeController"));
  objc_msgSend(*(id *)(a1 + 32), "removeContiguousSpecifiers:animated:", v28, v2 != v5);
  v20 = *(void **)(v8 + 1256);
  PUI_LocalizedStringForPrivacy(CFSTR("SECURITY_GROUP"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "groupSpecifierWithID:name:", CFSTR("SECURITY_GROUP"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addSpecifier:", v22);
  if (v19)
    objc_msgSend(*(id *)(a1 + 48), "addSpecifier:", v19);
  if (v11)
    objc_msgSend(*(id *)(a1 + 48), "addSpecifier:", v11);
  if (v7)
  {
    v23 = v2 != v5;
    v24 = *(void **)(a1 + 48);
    objc_msgSend(v24, "driverSpecifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertContiguousSpecifiers:afterSpecifier:animated:", v25, 0, v23);

  }
  objc_msgSend(*(id *)(a1 + 48), "specifierIDPendingPush");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("LOCKDOWN_MODE"));

  if (v27)
    objc_msgSend(*(id *)(a1 + 48), "handlePendingURL");

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  PSSpecifier *v19;
  PSSpecifier *locationSpecifier;
  PSSpecifier *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  __CFString *v83;
  void *v84;
  __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  BOOL v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void **v114;
  uint64_t v115;
  uint64_t v116;
  uint8_t buf[16];
  Class (*v118)(uint64_t);
  void *v119;
  void **v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v105 = (int)*MEMORY[0x1E0D80590];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "propertyForKey:", *MEMORY[0x1E0D80978]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPrivacyController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class())
    {
      v6 = objc_msgSend(MEMORY[0x1E0D89678], "isSecureElementTCCServiceEligible");
      _PUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v6 & 1) != 0)
      {
        if (v8)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: not removing SECURE_ELEMENT", buf, 0xCu);
        }
      }
      else
      {
        if (v8)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: removing SECURE_ELEMENT", buf, 0xCu);
        }

        objc_msgSend(v5, "specifierForID:", CFSTR("SECURE_ELEMENT"));
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v7);
      }

      v9 = objc_msgSend(MEMORY[0x1E0D89678], "isContactlessTCCServiceEligible");
      _PUILoggingFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s: not removing CONTACTLESS_NFC", buf, 0xCu);
        }
      }
      else
      {
        if (v11)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s: removing CONTACTLESS_NFC", buf, 0xCu);
        }

        objc_msgSend(v5, "specifierForID:", CFSTR("CONTACTLESS_NFC"));
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v10);
      }

    }
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("FOCUS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        objc_msgSend(v5, "specifierForID:", CFSTR("FOCUS"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v14);

      }
    }
    -[PUIPrivacyController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
      -[PUIPrivacyController refreshLocationServicesAvailable](self, "refreshLocationServicesAvailable");
    -[PUIPrivacyController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v5, "specifierForID:", CFSTR("LOCATION"));
    v19 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    locationSpecifier = self->_locationSpecifier;
    self->_locationSpecifier = v19;

    if ((v18 & 1) == 0)
      objc_msgSend(v5, "removeObject:", self->_locationSpecifier);
    v21 = self->_locationSpecifier;
    PUI_LocalizedStringForPrivacy(CFSTR("LOCATION_SERVICES"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v21, "setName:", v22);

    objc_msgSend(v5, "specifierForID:", CFSTR("HEALTH"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("HEALTH_DATA"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    v114 = &v113;
    v115 = 0x2050000000;
    v23 = (void *)getHKHealthStoreClass_softClass;
    v116 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      v118 = __getHKHealthStoreClass_block_invoke;
      v119 = &unk_1EA26B260;
      v120 = &v113;
      __getHKHealthStoreClass_block_invoke((uint64_t)buf);
      v23 = v114[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v113, 8);
    if ((objc_msgSend(v24, "isHealthDataAvailable") & 1) != 0)
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Health"), 0, 0);
      if (v25)
      {
        objc_msgSend(v5, "removeObject:", v110);
      }
      else
      {
        objc_msgSend(v5, "removeObject:", v112);
        v26 = v110;

        v112 = v26;
      }

    }
    else
    {
      objc_msgSend(v5, "removeObject:", v112);
      objc_msgSend(v5, "removeObject:", v110);
    }
    objc_msgSend(v5, "specifierForID:", *MEMORY[0x1E0D80A40]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = *MEMORY[0x1E0D808D0];
    objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0]);
    v106 = *MEMORY[0x1E0D80880];
    objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.app-tracking-transparency"));
    if (v27)
      v28 = 1;
    else
      v28 = v18;
    if ((v28 & 1) == 0)
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("LOCATION_TRACKERS_GROUP"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v29);

    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "sf_isiPhone");

    if (v31)
    {
      v32 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForAlmanac(CFSTR("RESEARCH"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, 0, 0, 0, 2, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "setIdentifier:", CFSTR("ALMANAC"));
      objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80728]);
      objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
      objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
      PSBundlePathForPreferenceBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setProperty:forKey:", v35, *MEMORY[0x1E0D808B8]);

      objc_msgSend(v34, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
      objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.research-sensor-and-usage-data"), v106);
      objc_msgSend(v34, "setControllerLoadAction:", NSSelectorFromString(CFSTR("lazyLoadBundle:")));
      objc_msgSend(v5, "ps_insertObject:afterObject:", v34, v112);

    }
    objc_msgSend(v5, "specifierForID:", CFSTR("WILLOW"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "sf_isiPhone");
    if (v111)
      v38 = v37;
    else
      v38 = 0;

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForPrivacy(CFSTR("WALLET"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v40, self, 0, 0, 0, 2, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setIdentifier:", CFSTR("WALLET"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80728]);
      objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
      PSBundlePathForPreferenceBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      SFRuntimeAbsoluteFilePathForPath();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D808B8]);

      objc_msgSend(v41, "setControllerLoadAction:", NSSelectorFromString(CFSTR("lazyLoadBundle:")));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "userInterfaceIdiom"))
        v45 = CFSTR("com.apple.PassbookStub");
      else
        v45 = CFSTR("com.apple.Passbook");
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0D808C0]);

      objc_msgSend(v5, "ps_insertObject:afterObject:", v41, v111);
    }
    objc_msgSend(v5, "specifierForID:", CFSTR("PRIVACY_GROUP"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("PRIVACY_CONTROLLER_FOOTER"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0D80848];
    objc_msgSend(v109, "setProperty:forKey:", v46, *MEMORY[0x1E0D80848]);

    objc_msgSend(v5, "specifierForID:", CFSTR("AD_GROUP"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("ADVERTISING"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setProperty:forKey:", CFSTR("advertising"), CFSTR("capability"));
    if (objc_msgSend(MEMORY[0x1E0CA5660], "isActivityAvailable"))
    {
      if ((PSIsInEDUMode() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "sf_inRetailKioskMode");

        if ((v49 & 1) == 0)
        {
          objc_msgSend(v5, "specifierForID:", CFSTR("FILEACCESS"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            v51 = (void *)MEMORY[0x1E0D804E8];
            PUI_LocalizedStringForPrivacy(CFSTR("MOTION"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, 0, 0, 0, objc_opt_class(), 2, 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "setProperty:forKey:", *MEMORY[0x1E0D80A18], *MEMORY[0x1E0D80868]);
            objc_msgSend(v53, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
            objc_msgSend(v53, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.motion-and-fitness"), v106);
            objc_msgSend(v5, "ps_insertObject:afterObject:", v53, v50);

          }
        }
      }
    }
    if (-[PUIPrivacyController nudityModelSetupHasCompleted](self, "nudityModelSetupHasCompleted")
      && objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionFeatureEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("NUDITY_DETECTION_GROUP"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPrivacyController _updateNudityDetectionFooter:](self, "_updateNudityDetectionFooter:", v54);
      PSBundlePathForPreferenceBundle();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)MEMORY[0x1E0CB34D0];
      SFRuntimeAbsoluteFilePathForPath();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bundleWithPath:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(getNudityDetectionPreferencesHelperClass(), "classForNudityDetectionSettings");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "classNamed:", v59);

      v61 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v62, self, 0, sel_getNudityDetectionEnabledValue, v60, 2, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v63, "setProperty:forKey:", CFSTR("NUDITY_DETECTION"), *MEMORY[0x1E0D80868]);
      objc_msgSend(v63, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSMultilineTableCell")), *MEMORY[0x1E0D80780]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D80808]);

      objc_msgSend(v63, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
      objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowIconID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v65, v106);

      objc_msgSend(v5, "specifierForID:", CFSTR("PRIVACY_GROUP"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ps_addGroup:afterGroup:", v54, v66);

      objc_msgSend(v5, "specifierForID:", CFSTR("NUDITY_DETECTION_GROUP"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ps_insertObject:afterObject:", v63, v67);

    }
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "sf_isiPhone");

      if (v69)
      {
        objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SAFETY_CHECK_GROUP"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        PUI_LocalizedStringForSafety(CFSTR("SAFETY_CHECK_FOOTER"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setProperty:forKey:", v71, v47);

        PSBundlePathForPreferenceBundle();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)MEMORY[0x1E0CB34D0];
        SFRuntimeAbsoluteFilePathForPath();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "bundleWithPath:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = objc_msgSend(v75, "classNamed:", CFSTR("DSSafetyCheckWelcomeController"));
        v77 = (void *)MEMORY[0x1E0D804E8];
        PUI_LocalizedStringForSafety(CFSTR("SAFETY_CHECK"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, self, 0, 0, v76, 2, 0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v79, "setProperty:forKey:", CFSTR("SAFETY_CHECK"), *MEMORY[0x1E0D80868]);
        objc_msgSend(v79, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
        objc_msgSend(v79, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.safety-check"), v106);
        objc_msgSend(v5, "specifierForID:", CFSTR("PRIVACY_GROUP"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ps_addGroup:afterGroup:", v70, v80);

        objc_msgSend(v5, "specifierForID:", CFSTR("SAFETY_CHECK_GROUP"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ps_insertObject:afterObject:", v79, v81);

      }
    }
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      v82 = _os_feature_enabled_impl();
      v83 = CFSTR("RECORD_APP_ACTIVITY");
      if (v82)
        v83 = CFSTR("APP_PRIVACY_REPORT");
      v84 = (void *)MEMORY[0x1E0D804E8];
      v85 = v83;
      objc_msgSend(v84, "groupSpecifierWithID:", CFSTR("PRIVACY_REPORT_GROUP"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v86);
      v87 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForPrivacy(v85);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v87, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v88, 0, 0, 0, objc_opt_class(), 2, 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v89, "setIdentifier:", CFSTR("PRIVACY_REPORT"));
      objc_msgSend(v89, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
      objc_msgSend(v5, "addObject:", v89);

    }
    if (+[PUIDataAndSensorsController shouldShowDataAndSensors](PUIDataAndSensorsController, "shouldShowDataAndSensors"))
    {
      v90 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForPrivacy(CFSTR("DATA_AND_SENSORS"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v91, self, 0, 0, objc_opt_class(), 2, 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v92, "setIdentifier:", CFSTR("DATA_AND_SENSORS"));
      objc_msgSend(v5, "addObject:", v92);

    }
    if (!_os_feature_enabled_impl())
      goto LABEL_73;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "userInterfaceIdiom") == 1;

    if (v94)
      goto LABEL_73;
    v113 = 0;
    if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1EA26B4A0;
      v118 = 0;
      MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
      v95 = v113;
      if (MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
      {
        if (!v113)
          goto LABEL_70;
      }
      else
      {
        v103 = v113;
        v95 = (void *)abort_report_np();
        __break(1u);
      }
      free(v95);
    }
LABEL_70:
    objc_msgSend(v5, "specifierForID:", CFSTR("PASSKEYS"), v103);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("JOURNALING_SUGGESTIONS_GROUP"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setIdentifier:", CFSTR("JOURNALING_SUGGESTIONS_GROUP"));
      objc_msgSend(v5, "ps_insertObject:afterObject:", v97, v96);
      v98 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForPrivacy(CFSTR("JOURNALING_SUGGESTIONS"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v99, self, 0, 0, NSClassFromString(CFSTR("MOSuggestionSheetSettingsController")), 2, 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v100, "setIdentifier:", CFSTR("JOURNALING_SUGGESTIONS"));
      objc_msgSend(v100, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
      objc_msgSend(v100, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v107);
      objc_msgSend(v100, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.journaling-suggestions"), v106);
      objc_msgSend(v5, "ps_insertObject:afterObject:", v100, v97);

    }
LABEL_73:
    v101 = *(Class *)((char *)&self->super.super.super.super.super.isa + v105);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v105) = (Class)v5;

    -[PUIPrivacyController updateSecurityGroup](self, "updateSecurityGroup");
    -[PUIPrivacyController setLaunchHasCompleted:](self, "setLaunchHasCompleted:", 1);

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v105);
  }
  return v3;
}

- (void)reloadSpecifiers
{
  void *v2;
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DB1FB000, a1, v3, "%{public}s: called off main thread with backtrace: %{public}@", (uint8_t *)v4);

  OUTLINED_FUNCTION_2();
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("LOCKDOWN_MODE")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("NUDITY_DETECTION"));

  return v5;
}

- (void)setCapabilityEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v12;
  id v13;

  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("capability"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
  v9 = objc_msgSend(v8, "containsObject:", v13);
  if ((v6 & 1) != 0)
  {
    if (v9)
      objc_msgSend(v8, "removeObject:", v13);
  }
  else if ((v9 & 1) == 0)
  {
    objc_msgSend(v8, "addObject:", v13);
  }
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v7, "count"))
  {
    CFPreferencesSetAppValue(CFSTR("SBParentalControlsCapabilities"), v8, CFSTR("com.apple.springboard"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.locationd/Restrictions"), 0, 0, 1u);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v12, CFSTR("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification"), 0, 0, 1u);
  }

}

- (id)capabilityEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  objc_msgSend(v3, "propertyForKey:", CFSTR("capability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateLocationServicesVisibility
{
  void *v3;
  void *v4;
  int v5;
  int v6;

  -[PUIPrivacyController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PUIPrivacyController refreshLocationServicesAvailable](self, "refreshLocationServicesAvailable");
  -[PUIPrivacyController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = -[PUIPrivacyController containsSpecifier:](self, "containsSpecifier:", self->_locationSpecifier);
  if (!v5 || (v6 & 1) != 0)
  {
    if (((v6 ^ 1 | v5) & 1) == 0)
      -[PUIPrivacyController removeSpecifier:](self, "removeSpecifier:", self->_locationSpecifier);
  }
  else
  {
    -[PUIPrivacyController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", self->_locationSpecifier, 1);
  }
}

- (id)locationServicesEnabled:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(getCLLocationManagerClass(), "sharedManager");
  if (objc_msgSend(getCLLocationManagerClass(), "locationServicesEnabled:", 0))
    return PUI_LocalizedStringForPrivacy(CFSTR("On"));
  else
    return PUI_LocalizedStringForPrivacy(CFSTR("Off"));
}

- (id)lockdownModeEnabled:(id)a3
{
  if (+[PUILockdownModeUtilities isLockdownModeEnabled](PUILockdownModeUtilities, "isLockdownModeEnabled", a3))
  {
    return PUI_LocalizedStringForPrivacy(CFSTR("On"));
  }
  else
  {
    return PUI_LocalizedStringForPrivacy(CFSTR("Off"));
  }
}

- (id)developerModeEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  v14 = getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  if (!getAMFIIsDeveloperModeEnabledSymbolLoc_ptr)
  {
    v5 = (void *)AppleMobileFileIntegrityLibrary();
    v4 = dlsym(v5, "AMFIIsDeveloperModeEnabled");
    v12[3] = (uint64_t)v4;
    getAMFIIsDeveloperModeEnabledSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    v10 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  if (((unsigned int (*)(uint64_t))v4)(v6))
    v7 = CFSTR("On");
  else
    v7 = CFSTR("Off");
  PUI_LocalizedStringForPrivacy(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)refreshLocationServicesAvailable
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DB1FB000, v0, v1, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v2);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PUIPrivacyController set_cachedLocationServicesAvailableValue:](self, "set_cachedLocationServicesAvailableValue:", 0);
    -[PUIPrivacyController updateLocationServicesVisibility](self, "updateLocationServicesVisibility");
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__PUIPrivacyController_carrierBundleChange___block_invoke;
    v5[3] = &unk_1EA26B438;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __44__PUIPrivacyController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (id)getNudityDetectionEnabledValue
{
  return (id)objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionOnOffLabel");
}

- (void)_nudityDetectionLinkClicked:(id)a3
{
  id v4;

  if (self->_nudityDetectionURL)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openSensitiveURL:withOptions:", self->_nudityDetectionURL, 0);

  }
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

- (NSNumber)_cachedLocationServicesAvailableValue
{
  return self->__cachedLocationServicesAvailableValue;
}

- (void)set_cachedLocationServicesAvailableValue:(id)a3
{
  objc_storeStrong((id *)&self->__cachedLocationServicesAvailableValue, a3);
}

- (NSArray)driverBundleControllers
{
  return self->_driverBundleControllers;
}

- (void)setDriverBundleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_driverBundleControllers, a3);
}

- (NSArray)driverSpecifiers
{
  return self->_driverSpecifiers;
}

- (void)setDriverSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_driverSpecifiers, a3);
}

- (BOOL)launchHasCompleted
{
  return self->_launchHasCompleted;
}

- (void)setLaunchHasCompleted:(BOOL)a3
{
  self->_launchHasCompleted = a3;
}

- (NSURL)nudityDetectionURL
{
  return self->_nudityDetectionURL;
}

- (void)setNudityDetectionURL:(id)a3
{
  objc_storeStrong((id *)&self->_nudityDetectionURL, a3);
}

- (BOOL)nudityModelSetupHasCompleted
{
  return self->_nudityModelSetupHasCompleted;
}

- (void)setNudityModelSetupHasCompleted:(BOOL)a3
{
  self->_nudityModelSetupHasCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nudityDetectionURL, 0);
  objc_storeStrong((id *)&self->_driverSpecifiers, 0);
  objc_storeStrong((id *)&self->_driverBundleControllers, 0);
  objc_storeStrong((id *)&self->__cachedLocationServicesAvailableValue, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_locationSpecifier, 0);
  objc_storeStrong((id *)&self->securitySettingsQueue, 0);
}

uint64_t __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[PUIPrivacyController reloadSpecifiers].cold.1(v0);
}

@end
