@implementation PSGResetOrEraseListController

- (PSGResetOrEraseListController)init
{
  PSGResetOrEraseListController *v2;
  void *v3;
  CoreTelephonyClient *v4;
  CoreTelephonyClient *client;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGResetOrEraseListController;
  v2 = -[PSGResetOrEraseListController init](&v7, sel_init);
  if (v2)
  {
    v2->_requireRestrictionsCode = objc_msgSend(MEMORY[0x24BE85718], "settingEnabled");
    v2->_requirePasscode = objc_msgSend(MEMORY[0x24BE75430], "settingEnabled");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionRestrictionChangedNotification"), 0);

    v4 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x24BDC2810]);
    client = v2->__client;
    v2->__client = v4;

    -[CoreTelephonyClient setDelegate:](v2->__client, "setDelegate:", v2);
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[6];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)PSGResetOrEraseListController;
  -[PSGResetOrEraseListController viewDidLoad](&v26, sel_viewDidLoad);
  -[PSGResetOrEraseListController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)MEMORY[0x24BDD1628];
  -[PSGResetOrEraseListController table](self, "table");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGResetOrEraseListController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  -[PSGResetOrEraseListController table](self, "table");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGResetOrEraseListController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  -[PSGResetOrEraseListController table](self, "table");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGResetOrEraseListController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  -[PSGResetOrEraseListController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGResetOrEraseListController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGResetOrEraseListController;
  -[PSGResetOrEraseListController loadView](&v5, sel_loadView);
  -[PSGResetOrEraseListController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEnabled:", 0);

  -[PSGResetOrEraseListController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTopPadding:", 0.0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSGResetOrEraseListController;
  -[PSGResetOrEraseListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PSGResetOrEraseListController didAppear](self, "didAppear");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGResetOrEraseListController;
  -[PSGResetOrEraseListController dealloc](&v4, sel_dealloc);
}

- (void)updateLocationResetSpecifier
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  int v8;

  -[PSGResetOrEraseListController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSGResetOrEraseListController refreshLocationServicesAvailable](self, "refreshLocationServicesAvailable");
  v4 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  -[PSGResetOrEraseListController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = -[PSGResetOrEraseListController containsSpecifier:](self, "containsSpecifier:", self->_locationSpecifier);
  v8 = v6 ^ 1 | v4;
  if (v8 != 1 || v7 == 0)
  {
    if (((v8 | v7) & 1) == 0)
      -[PSGResetOrEraseListController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", self->_locationSpecifier, self->_locationSpecifierIndex);
  }
  else
  {
    -[PSGResetOrEraseListController removeSpecifier:](self, "removeSpecifier:", self->_locationSpecifier);
  }
}

- (void)configureSpin:(BOOL)a3 ofCellForSpecifier:(id)a4 setEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v8, "startAnimating");
      objc_msgSend(v9, "setAccessoryView:", v8);

    }
    else
    {
      objc_msgSend(v7, "setAccessoryView:", 0);
    }
    objc_msgSend(v9, "setCellEnabled:", v5);
    v7 = v9;
  }

}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *passcode;
  _BOOL4 v8;
  NSString *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  ++self->_codesEntered;
  -[PSSpecifier propertyForKey:](self->_currentSpecifier, "propertyForKey:", *MEMORY[0x24BE75C60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DevicePINController"));

  _PSGLoggingFacility();
  passcode = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(passcode, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, passcode, OS_LOG_TYPE_DEFAULT, "Accepted passcode.", buf, 2u);
    }

    v9 = (NSString *)v4;
    passcode = self->_passcode;
    self->_passcode = v9;
  }
  else if (v8)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22E024000, passcode, OS_LOG_TYPE_DEFAULT, "Accepted restrictions passcode.", v10, 2u);
  }

  self->_returningFromPINSheetWithSuccess = 1;
}

- (void)didAppear
{
  char isKindOfClass;
  PSSpecifier *currentSpecifier;

  if (self->_returningFromPINSheetWithSuccess)
  {
    if (self->_codesEntered >= self->_codesNeeded)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      currentSpecifier = self->_currentSpecifier;
      if ((isKindOfClass & 1) != 0)
        -[PSGResetOrEraseListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", currentSpecifier);
      else
        -[PSGResetOrEraseListController performButtonActionForSpecifier:](self, "performButtonActionForSpecifier:", currentSpecifier);
    }
    else
    {
      -[PSSpecifier setProperty:forKey:](self->_currentSpecifier, "setProperty:forKey:", CFSTR("PSRestrictionsPINController"), *MEMORY[0x24BE75C60]);
      -[PSSpecifier setProperty:forKey:](self->_currentSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("screenTimePinEntry"));
      -[PSGResetOrEraseListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showPINSheetFromParentViewController_, self->_currentSpecifier, 0.0);
    }
  }
  self->_returningFromPINSheetWithSuccess = 0;
}

- (void)resetKeyboardDictionary:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "Resetting keyboard dictionary", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BEBD6C8], "removeAllDynamicDictionaries");
}

- (void)resetIconPositions:(id)a3
{
  SBSResetHomeScreenLayout();
}

void __52__PSGResetOrEraseListController_resetIconPositions___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      v7 = 0;
      v5 = "SBSResetHomeScreenLayout completed successfully.";
      v6 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    v5 = "SBSResetHomeScreenLayout failed.";
    v6 = buf;
    goto LABEL_6;
  }

}

- (void)resetPrivacyWarnings:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE85780], self, 0, 1u);
  v20 = objc_alloc_init(MEMORY[0x24BDC8240]);
  objc_msgSend(v20, "revokeAccessToAllBundles");
  objc_msgSend(MEMORY[0x24BDBFA88], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetApps");

  objc_msgSend(MEMORY[0x24BEBDB48], "sharedPolicyDecider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearAllCaches");

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v7 = (void *)getFMDFMIPManagerClass_softClass;
  v24 = getFMDFMIPManagerClass_softClass;
  if (!getFMDFMIPManagerClass_softClass)
  {
    *(_QWORD *)&v25 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v25 + 1) = 3221225472;
    v26 = (uint64_t)__getFMDFMIPManagerClass_block_invoke;
    v27 = &unk_24F9C8058;
    v28 = &v21;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)&v25);
    v7 = (void *)v22[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v8, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearData:completion:", 1, &__block_literal_global_34);

  -[PSGResetOrEraseListController resetNetworkPrivacy](self, "resetNetworkPrivacy");
  -[PSGResetOrEraseListController resetContacts](self, "resetContacts");
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  if (!SensorKitLibraryCore_frameworkLibrary)
  {
    v25 = xmmword_24F9C8090;
    v26 = 0;
    SensorKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SensorKitLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v10 = getSRResetAllAuthorizationsSymbolLoc_ptr;
    v27 = getSRResetAllAuthorizationsSymbolLoc_ptr;
    if (!getSRResetAllAuthorizationsSymbolLoc_ptr)
    {
      v11 = (void *)SensorKitLibrary();
      v10 = dlsym(v11, "SRResetAllAuthorizations");
      *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v10;
      getSRResetAllAuthorizationsSymbolLoc_ptr = v10;
    }
    _Block_object_dispose(&v25, 8);
    if (!v10)
    {
      -[PSGResetOrEraseListController resetPrivacyWarnings:].cold.1();
      __break(1u);
    }
    ((void (*)(void))v10)();
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v12 = (void *)getSRAuthorizationClientClass_softClass;
    v24 = getSRAuthorizationClientClass_softClass;
    if (!getSRAuthorizationClientClass_softClass)
    {
      *(_QWORD *)&v25 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v25 + 1) = 3221225472;
      v26 = (uint64_t)__getSRAuthorizationClientClass_block_invoke;
      v27 = &unk_24F9C8058;
      v28 = &v21;
      __getSRAuthorizationClientClass_block_invoke((uint64_t)&v25);
      v12 = (void *)v22[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v13, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataCollectionEnabled:", 0);

  }
  -[PSGResetOrEraseListController resetImproveSiriAndDictation](self, "resetImproveSiriAndDictation");
  v15 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  if ((objc_msgSend(v15, "containsObject:", CFSTR("advertising")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBoolValue:forSetting:", 0, *MEMORY[0x24BE639A0]);

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBoolValue:forSetting:", 0, *MEMORY[0x24BE638E0]);

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBoolValue:forSetting:", 0, *MEMORY[0x24BE637A0]);

  lockdown_delete_pair_records();
}

void __54__PSGResetOrEraseListController_resetPrivacyWarnings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "Error clearing FMDFMIPManager %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)resetContacts
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBAEC8], "resetLog");
  v2 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "dropAllLimitedAccessRowsAndSyncNotify");

}

- (void)resetImproveSiriAndDictation
{
  id v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc_init(MEMORY[0x24BE092B8]);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke;
  v3[3] = &unk_24F9C7F40;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", 0, 0, 7, CFSTR("Reset"), v3);
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2;
  v5[3] = &unk_24F9C7F18;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v3;

  v1 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(a1, v1, v3);

  }
}

- (void)resetPersonalHandwritingStyle:(id)a3
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  _Unwind_Exception *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  _PSGLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "Resetting personal handwriting style", (uint8_t *)v7, 2u);
  }

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v5 = (void (*)(void))getCHResetInventorySymbolLoc_ptr;
  v11 = getCHResetInventorySymbolLoc_ptr;
  if (!getCHResetInventorySymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getCHResetInventorySymbolLoc_block_invoke;
    v7[3] = &unk_24F9C8058;
    v7[4] = &v8;
    __getCHResetInventorySymbolLoc_block_invoke((uint64_t)v7);
    v5 = (void (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    v6 = (_Unwind_Exception *)-[PSGResetOrEraseListController resetPrivacyWarnings:].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5();

}

- (void)_resetWithMode:(int64_t)a3 andOptions:(id)a4 withSpecifier:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  NSString *passcode;
  void *v14;
  char v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[8];
  __int128 v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  if (!v8)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v11 = (void *)getDDRResetOptionsClass_softClass;
    v30 = getDDRResetOptionsClass_softClass;
    if (!getDDRResetOptionsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&v32 = 3221225472;
      *((_QWORD *)&v32 + 1) = __getDDRResetOptionsClass_block_invoke;
      v33 = &unk_24F9C8058;
      v34 = &v27;
      __getDDRResetOptionsClass_block_invoke((uint64_t)buf);
      v11 = (void *)v28[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v27, 8);
    v8 = objc_alloc_init(v12);
  }
  passcode = self->_passcode;
  if (a3 == 3)
  {
    if (passcode)
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isPasscodeRequiredByProfiles");

      if ((v15 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "changePasscodeFrom:to:outError:", self->_passcode, 0, 0);

      }
      v17 = self->_passcode;
      self->_passcode = 0;

    }
    else
    {
      self->_passcode = 0;
    }
    -[PSGResetOrEraseListController resetPrivacyWarnings:](self, "resetPrivacyWarnings:", 0);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v19 = (void *)getMBManagerClass_softClass;
    v30 = getMBManagerClass_softClass;
    if (!getMBManagerClass_softClass)
    {
      *(_QWORD *)buf = v10;
      *(_QWORD *)&v32 = 3221225472;
      *((_QWORD *)&v32 + 1) = __getMBManagerClass_block_invoke;
      v33 = &unk_24F9C8058;
      v34 = &v27;
      __getMBManagerClass_block_invoke((uint64_t)buf);
      v19 = (void *)v28[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v27, 8);
    v18 = (void *)objc_msgSend([v20 alloc], "initWithDelegate:", self);
    objc_msgSend(v18, "unsetLocalBackupPasswordWithError:", 0);
  }
  else
  {
    self->_passcode = 0;

    if (a3 != 2)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "checkCarrierProfileForceInstallation:", 1);
  }

LABEL_17:
  if (v9)
    -[PSGResetOrEraseListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 1, v9, 0);
  _PSGLoggingFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a3;
    LOWORD(v32) = 2112;
    *(_QWORD *)((char *)&v32 + 2) = v8;
    _os_log_impl(&dword_22E024000, v21, OS_LOG_TYPE_DEFAULT, "########### Calling DDRReset with mode: %d; options: %@",
      buf,
      0x12u);
  }

  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __73__PSGResetOrEraseListController__resetWithMode_andOptions_withSpecifier___block_invoke;
  v24[3] = &unk_24F9C7F68;
  v25 = v8;
  v26 = a3;
  v23 = v8;
  dispatch_async(v22, v24);

}

void __73__PSGResetOrEraseListController__resetWithMode_andOptions_withSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class (*v10)(uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)getDDRResetRequestClass_softClass;
  v16 = getDDRResetRequestClass_softClass;
  if (!getDDRResetRequestClass_softClass)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __getDDRResetRequestClass_block_invoke;
    v11 = &unk_24F9C8058;
    v12 = &v13;
    __getDDRResetRequestClass_block_invoke((uint64_t)&v8);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithMode:options:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("EACS-Settings"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getDDRResetServiceClass_softClass;
  v16 = getDDRResetServiceClass_softClass;
  if (!getDDRResetServiceClass_softClass)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __getDDRResetServiceClass_block_invoke;
    v11 = &unk_24F9C8058;
    v12 = &v13;
    __getDDRResetServiceClass_block_invoke((uint64_t)&v8);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetWithRequest:completion:", v4, 0);

}

- (BOOL)_networkConnectivityAvailable
{
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  flags = 0;
  address = (sockaddr)xmmword_22E059290;
  _networkConnectivityAvailable_reachability = (uint64_t)SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
  return SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)_networkConnectivityAvailable_reachability, &flags)
      && (flags & 2) != 0;
}

- (void)_showStockholmLocallyStoredValueOfflineWarningIfNeeded:(id)a3
{
  void (**v4)(id, uint64_t);
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (**v23)(id, uint64_t);
  void (**v24)(id, uint64_t);
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, uint64_t);
  void *v29;
  void *v30;
  _QWORD v31[4];
  void (**v32)(id, uint64_t);
  _QWORD v33[4];
  void (**v34)(id, uint64_t);
  uint8_t buf[4];
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = -[PSGResetOrEraseListController _networkConnectivityAvailable](self, "_networkConnectivityAvailable");
  PSStockholmLocallyStoredValuePassNames();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  _PSGLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v36 = !v5;
    v37 = 1024;
    v38 = v7 != 0;
    _os_log_impl(&dword_22E024000, v8, OS_LOG_TYPE_DEFAULT, "isOffline: %d, hasLocallyStoredValue: %d", buf, 0xEu);
  }

  if (v7)
    v9 = v5;
  else
    v9 = 1;
  _PSGLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "_showStockholmLocallyStoredValueOfflineWarningIfNeeded completed directly", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "Showing payment card warning.", buf, 2u);
    }

    v12 = (void *)MEMORY[0x24BDD17C8];
    PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_TITLE_SINGLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_MSG_SINGLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_TITLE_MULTIPLE"));
      v17 = objc_claimAutoreleasedReturnValue();

      PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_MSG_MULTIPLE"));
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
      v16 = (void *)v18;
    }
    v30 = v15;
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_ALERT_CANCEL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke;
    v33[3] = &unk_24F9C7F90;
    v23 = v4;
    v24 = v4;
    v34 = v24;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v25);

    v26 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForReset(CFSTR("ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_ALERT_ACCEPT"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v22;
    v31[1] = 3221225472;
    v31[2] = __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke_69;
    v31[3] = &unk_24F9C7F90;
    v28 = v24;
    v4 = v23;
    v32 = v28;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 2, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v29);

    -[PSGResetOrEraseListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
  }

}

uint64_t __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "Payment card warning: Cancelled.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "Payment card warning: Erase.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)confirmationSpecifierConfirmed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[2];
  __int16 v25;
  uint8_t buf[16];

  v4 = a3;
  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "Confirmed.", buf, 2u);
  }

  self->_shouldEraseCellularPlans = 0;
  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForReset(CFSTR("RESET_CONFIRMATION_CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCancelButton:", v7);

  objc_msgSend(v6, "setProperty:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BE75978]);
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("settingsErase"));

  if (v9)
  {
    objc_msgSend(v6, "setConfirmationAction:", sel_eraseSettings_);
    PSG_LocalizedStringForReset(CFSTR("RESET_CONFIRMATION_ALERT_ACCEPT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOkButton:", v10);

    PSG_LocalizedStringForReset(CFSTR("CLEAR_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v11);

    v12 = CFSTR("CLEAR_SETTINGS_MSG_CONFIRM");
    if (PSHasStockholmPass())
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPasscodeRequiredByProfiles");

      if (!v14)
        v12 = CFSTR("CLEAR_SETTINGS_MSG_CONFIRM_STOCKHOLM");
    }
    PSG_LocalizedStringForReset(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v15);

    _PSGLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v25 = 0;
    v17 = "Showing second confirmation for Settings Erase.";
    v18 = (uint8_t *)&v25;
    goto LABEL_12;
  }
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("cellularErase"));

  if (v20)
  {
    objc_msgSend(v6, "setConfirmationAction:", sel_resetAllCellularNetworks_);
    PSG_LocalizedStringForReset(CFSTR("RESET_CONFIRMATION_ALERT_ACCEPT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOkButton:", v21);

    PSG_LocalizedStringForReset(CFSTR("REMOVE_ALL_CELLULAR_PLANS_LABEL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v22);

    PSG_LocalizedStringForReset(CFSTR("REMOVE_ALL_CELLULAR_PLANS_MSG_CONFIRM"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v23);

    _PSGLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      -[PSGResetOrEraseListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v6);
      goto LABEL_14;
    }
    *(_WORD *)v24 = 0;
    v17 = "Showing second confirmation for Erase All Cellular Networks.";
    v18 = v24;
LABEL_12:
    _os_log_impl(&dword_22E024000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)eraseSettings:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__PSGResetOrEraseListController_eraseSettings___block_invoke;
  v3[3] = &unk_24F9C7FB8;
  v3[4] = self;
  -[PSGResetOrEraseListController _showStockholmLocallyStoredValueOfflineWarningIfNeeded:](self, "_showStockholmLocallyStoredValueOfflineWarningIfNeeded:", v3);
}

void __47__PSGResetOrEraseListController_eraseSettings___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("settingsErase"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resetWithMode:andOptions:withSpecifier:", 3, 0, v3);

  }
}

- (void)resetNetworkSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BEB35F8]);
  v6 = (void *)objc_msgSend(v5, "initWorkspaceWithService:", *MEMORY[0x24BEB3600]);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEB3628]), "initWithWorkspace:", v6);
    if (v7)
    {
      v8 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __54__PSGResetOrEraseListController_resetNetworkSettings___block_invoke;
      v14[3] = &unk_24F9C7FB8;
      v9 = v8;
      v15 = v9;
      if ((-[NSObject resetDataForKeys:reply:](v7, "resetDataForKeys:reply:", 0, v14) & 1) != 0)
      {
        v10 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v9, v10))
        {
          _PSGLoggingFacility();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_DEFAULT, "resetDataForKeys did not complete. Bailing to avoid a hang", buf, 2u);
          }

        }
        lockdown_delete_pair_records();
        _PSGLoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E024000, v12, OS_LOG_TYPE_DEFAULT, "Proceed reset network settings", buf, 2u);
        }

        -[PSGResetOrEraseListController _resetWithMode:andOptions:withSpecifier:](self, "_resetWithMode:andOptions:withSpecifier:", 2, 0, v4);
      }
      else
      {
        _PSGLoggingFacility();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E024000, v13, OS_LOG_TYPE_DEFAULT, "resetDataForKeys unable to contact service", buf, 2u);
        }

      }
    }
    else
    {
      _PSGLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "Unable to create NetworkPerformanceFeed", buf, 2u);
      }
    }

  }
  else
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "Unable to create AnalyticsWorkspace", buf, 2u);
    }
  }

}

intptr_t __54__PSGResetOrEraseListController_resetNetworkSettings___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if ((a2 & 1) == 0)
  {
    _PSGLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "resetDataForKeys failure", v5, 2u);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)resetSceneUnderstandingData:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "Resetting scene understanding data", v6, 2u);
  }

  -[PSGResetOrEraseListController _resetWithMode:andOptions:withSpecifier:](self, "_resetWithMode:andOptions:withSpecifier:", 1, 0, v4);
}

- (void)resetAllCellularNetworks:(id)a3
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke;
  v6[3] = &unk_24F9C7FE0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "eraseAllPlans:", v6);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _PSGLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke_cold_1((uint64_t)v4, v5);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *mutableSpecifiers;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[PSGResetOrEraseListController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Reset"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableArray *)objc_msgSend(v5, "initWithArray:", v6);
    mutableSpecifiers = self->_mutableSpecifiers;
    self->_mutableSpecifiers = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForReset(CFSTR("RESET"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 13, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setButtonAction:", sel_showResetActionSheet_);
    -[NSMutableArray specifierForID:](self->_mutableSpecifiers, "specifierForID:", CFSTR("fullErase"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        PSG_LocalizedStringForReset(CFSTR("ERASE_OK"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitle:", v15);

        PSG_LocalizedStringForReset(CFSTR("FULL_RESET_QUICK_MSG"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPrompt:", v16);

      }
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63910]);

    if (v18 == 2)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v9, "addObject:", v12);
    objc_msgSend(v9, "addObject:", v13);
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)prepareMutableSpecifiers
{
  int v3;
  NSMutableArray *mutableSpecifiers;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  PSSpecifier *v21;
  PSSpecifier *locationSpecifier;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSMutableArray *v31;
  void *v32;
  id v33;

  v3 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  if (v3)
  {
    mutableSpecifiers = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](mutableSpecifiers, "specifierForID:", CFSTR("settingsErase"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](mutableSpecifiers, "removeObject:", v5);

    v6 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v6, "specifierForID:", CFSTR("fullErase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v6, "removeObject:", v7);

    v8 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v8, "specifierForID:", CFSTR("fullEraseIPod"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v8, "removeObject:", v9);

    v10 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v10, "specifierForID:", CFSTR("RESET_KEYBOARD_DICTIONARY_LABEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v10, "removeObject:", v11);

    v12 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v12, "specifierForID:", CFSTR("RESET_NETWORK_LABEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v12, "removeObject:", v13);

    v14 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v14, "specifierForID:", CFSTR("cellularErase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v14, "removeObject:", v15);

    v16 = self->_mutableSpecifiers;
    -[NSMutableArray specifierForID:](v16, "specifierForID:", CFSTR("SUBSCRIBER_SERVICES_ID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v16, "removeObject:", v17);

  }
  -[PSGResetOrEraseListController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    -[PSGResetOrEraseListController refreshLocationServicesAvailable](self, "refreshLocationServicesAvailable");
  -[PSGResetOrEraseListController _cachedLocationServicesAvailableValue](self, "_cachedLocationServicesAvailableValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  -[NSMutableArray specifierForID:](self->_mutableSpecifiers, "specifierForID:", CFSTR("RESET_PRIVACY_LABEL"));
  v21 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  locationSpecifier = self->_locationSpecifier;
  self->_locationSpecifier = v21;

  self->_locationSpecifierIndex = -[NSMutableArray indexOfObject:](self->_mutableSpecifiers, "indexOfObject:", self->_locationSpecifier);
  if ((v3 | v20 ^ 1) == 1)
    -[NSMutableArray removeObject:](self->_mutableSpecifiers, "removeObject:", self->_locationSpecifier);
  -[NSMutableArray specifierForID:](self->_mutableSpecifiers, "specifierForID:", CFSTR("settingsErase"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (PSHasStockholmPass())
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isPasscodeRequiredByProfiles");

        if ((v24 & 1) == 0)
        {
          v25 = v33;
          PSG_LocalizedStringForReset(CFSTR("CLEAR_SETTINGS_MSG_STOCKHOLM"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPrompt:", v26);

        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BE856E8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "embeddedPlanItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {
    objc_msgSend(MEMORY[0x24BE856E8], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isAnyLocalFlowTypeSupported");

    if ((v30 & 1) != 0)
      goto LABEL_17;
  }
  else
  {

  }
  v31 = self->_mutableSpecifiers;
  -[NSMutableArray specifierForID:](v31, "specifierForID:", CFSTR("cellularErase"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v31, "removeObject:", v32);

LABEL_17:
}

- (void)showResetActionSheet:(id)a3
{
  void *v4;
  NSMutableArray *mutableSpecifiers;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  PSGResetOrEraseListController *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGResetOrEraseListController prepareMutableSpecifiers](self, "prepareMutableSpecifiers");
  mutableSpecifiers = self->_mutableSpecifiers;
  -[NSMutableArray specifierForID:](mutableSpecifiers, "specifierForID:", CFSTR("fullErase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](mutableSpecifiers, "removeObject:", v6);

  v7 = self->_mutableSpecifiers;
  -[NSMutableArray specifierForID:](v7, "specifierForID:", CFSTR("fullEraseIPod"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v7, "removeObject:", v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self;
  v10 = self->_mutableSpecifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v15, "cellType") == 13)
        {
          v16 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __54__PSGResetOrEraseListController_showResetActionSheet___block_invoke;
          v22[3] = &unk_24F9C7E20;
          v22[4] = v9;
          v22[5] = v15;
          objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addAction:", v18);

        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v19 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForReset(CFSTR("RESET_CONFIRMATION_CANCEL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v21);

  -[PSGResetOrEraseListController presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v4, 1, 0);
}

uint64_t __54__PSGResetOrEraseListController_showResetActionSheet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSelectAlertAction:", *(_QWORD *)(a1 + 40));
}

- (void)didSelectAlertAction:(id)a3
{
  id v5;
  NSString *passcode;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v5 = a3;
  passcode = self->_passcode;
  self->_passcode = 0;

  if (!*(_WORD *)&self->_requireRestrictionsCode)
    goto LABEL_22;
  objc_msgSend(v5, "propertyForKey:", CFSTR("pane"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DevicePINPane"));

  if (!v8)
    goto LABEL_22;
  self->_codesNeeded = 0;
  self->_codesEntered = 0;
  _PSGLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "erase require user enter passcode", buf, 2u);
  }

  if (self->_requireRestrictionsCode)
  {
    _PSGLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "Restrictions passcode required.", v21, 2u);
    }

    -[PSGResetOrEraseListController specifierForID:](self, "specifierForID:", CFSTR("RESET_KEYBOARD_DICTIONARY_LABEL"));
    v11 = objc_claimAutoreleasedReturnValue();
    if ((id)v11 == v5)
    {

      goto LABEL_16;
    }
    v12 = (void *)v11;
    -[PSGResetOrEraseListController specifierForID:](self, "specifierForID:", CFSTR("RESET_NETWORK_LABEL"));
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 == v5)
    {

      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[PSGResetOrEraseListController specifierForID:](self, "specifierForID:", CFSTR("RESET_PRIVACY_LABEL"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v5)
    {
      v16 = PSIsLocationRestricted();

      if (!v16)
        goto LABEL_16;
    }
    else
    {

    }
    ++self->_codesNeeded;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v17, CFSTR("mode"));

    objc_msgSend(v5, "setProperty:forKey:", CFSTR("PSRestrictionsPINController"), *MEMORY[0x24BE75C60]);
    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("screenTimePinEntry"));
  }
LABEL_16:
  if (self->_requirePasscode)
  {
    _PSGLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_22E024000, v18, OS_LOG_TYPE_DEFAULT, "Passcode required.", v20, 2u);
    }

    ++self->_codesNeeded;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v19, CFSTR("mode"));

    -[PSSpecifier setProperty:forKey:](self->_currentSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C0], CFSTR("screenTimePinEntry"));
    objc_msgSend(v5, "setProperty:forKey:", CFSTR("DevicePINController"), *MEMORY[0x24BE75C60]);
  }
  objc_storeStrong((id *)&self->_currentSpecifier, a3);
  if (self->_codesNeeded)
  {
    -[PSGResetOrEraseListController showPINSheetFromParentViewController:](self, "showPINSheetFromParentViewController:", self->_currentSpecifier);
    goto LABEL_25;
  }
LABEL_22:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PSGResetOrEraseListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v5);
  else
    -[PSGResetOrEraseListController performButtonActionForSpecifier:](self, "performButtonActionForSpecifier:", v5);
LABEL_25:

}

- (void)showPINSheetFromParentViewController:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD aBlock[5];
  id v21;
  _QWORD v22[7];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke;
  aBlock[3] = &unk_24F9C7E70;
  aBlock[4] = self;
  v5 = v4;
  v21 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v7 = -[PSGResetOrEraseListController isRatchetFeatureAvailableAndEnabled](self, "isRatchetFeatureAvailableAndEnabled");
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("settingsErase"));

  if (v9 && v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA948]), "initWithIdentifier:", CFSTR("ResetAllSettings"));
    v22[0] = &unk_24F9D4278;
    PSG_LocalizedStringForReset(CFSTR("DTO_GENERIC_SECURITY_DELAY_BEGIN_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v22[1] = &unk_24F9D4290;
    PSG_LocalizedStringForReset(CFSTR("DTO_GENERIC_SECURITY_DELAY_BEGIN_DESCRIPTION"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    v22[2] = &unk_24F9D42A8;
    PSG_LocalizedStringForReset(CFSTR("DTO_GENERIC_IN_PROGRESS_COUNTDOWN_DESCRIPTION"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v13;
    v22[3] = &unk_24F9D4260;
    PSG_LocalizedStringForReset(CFSTR("DTO_GENERIC_SECURITY_DELAY_BEGIN_DESCRIPTION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v14;
    v22[4] = &unk_24F9D42C0;
    PSG_LocalizedStringForReset(CFSTR("DTO_NOTIFICATION_DESCRIPTION_DEFAULT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v15;
    v22[5] = &unk_24F9D42D8;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=PASSCODE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[6] = &unk_24F9D42F0;
    v23[5] = v16;
    v23[6] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_151;
    v18[3] = &unk_24F9C8030;
    v19 = v6;
    objc_msgSend(v10, "armWithOptions:completion:", v17, v18);

  }
  else
  {
    v6[2](v6);
  }

}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke(uint64_t a1)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x24BE75440];
  v3 = *(id *)(a1 + 32);
  v4 = objc_alloc_init(v2);
  objc_msgSend(v4, "setAllowOptionsButton:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE756D8]) = 1;
  objc_msgSend(v4, "setParentController:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", v3, *MEMORY[0x24BE75E10]);
  objc_msgSend(v4, "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE75768]), *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "showController:", v4);

}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24F9D4308);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  _PSGLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Proceeding to perform critical operation as gating was successful", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_155;
    block[3] = &unk_24F9C8008;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v10 = v12;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_151_cold_1(v6, (uint64_t)v5, v10);
  }

}

uint64_t __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 0;
  -[PSGResetOrEraseListController didAppear](self, "didAppear", a3);
}

- (void)subscriberOptions:(id)a3
{
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _QWORD v45[7];
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v45[5] = 0;
  v46 = 0u;
  v47 = 0;
  v45[6] = self;
  v4 = _CTServerConnectionCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    buf[0] = 0;
    _CTServerConnectionGetResetCellularAccountSettingsIsAllowed();
    CFRelease(v5);
  }
  v6 = (void *)MEMORY[0x24BEBD3B0];
  PSG_LocalizedStringForReset(CFSTR("SUBSCRIBER_SERVICES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0x24BEBD000uLL;
  v10 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForReset(CFSTR("SUBSCRIBER_SERVICES_CANCEL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  PSG_LocalizedStringForReset(CFSTR("REPROVISION_ACCOUNT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __51__PSGResetOrEraseListController_subscriberOptions___block_invoke;
  v45[3] = &unk_24F9C7E48;
  v45[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[PSGResetOrEraseListController _client](self, "_client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v16, "getSubscriptionInfoWithError:", &v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v44;

  if (v18)
  {
    _PSGLoggingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PSGResetOrEraseListController subscriberOptions:].cold.1();
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v17, "subscriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v21)
    {
      v22 = v21;
      v35 = v17;
      v36 = v8;
      v18 = 0;
      v23 = *(_QWORD *)v41;
      while (2)
      {
        v24 = 0;
        v25 = v18;
        do
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v24);
          -[PSGResetOrEraseListController _client](self, "_client");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v25;
          v28 = (void *)objc_msgSend(v27, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v26, CFSTR("AllowAKEYEditing"), v20, &v39);
          v18 = v39;

          if (v28)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              v30 = v28;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v31 = v30;
              else
                v31 = 0;
              v19 = v31;

              goto LABEL_24;
            }
          }
          if (v18)
          {
            _PSGLoggingFacility();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v49 = "-[PSGResetOrEraseListController subscriberOptions:]";
              v50 = 2114;
              v51 = v18;
              _os_log_error_impl(&dword_22E024000, v29, OS_LOG_TYPE_ERROR, "%s: Error retrieving value: %{public}@.", buf, 0x16u);
            }

          }
          ++v24;
          v25 = v18;
        }
        while (v22 != v24);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v22)
          continue;
        break;
      }
      v19 = 0;
LABEL_24:
      v8 = v36;
      v17 = v35;
      v9 = 9863680000;
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }

    if (-[NSObject BOOLValue](v19, "BOOLValue"))
    {
      v32 = *(void **)(v9 + 936);
      PSG_LocalizedStringForReset(CFSTR("RESET_AKEY"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_168;
      v38[3] = &unk_24F9C7E48;
      v38[4] = self;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v38);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v34);

    }
    -[PSGResetOrEraseListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reprovisionAccount");
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_168(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAKey");
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmEraseCellularSettings");
}

- (void)reprovisionAccount
{
  CTStartManualOTASP();
}

- (void)resetAKey
{
  CTCallDial();
}

- (void)eraseCellularSettings
{
  uint64_t v2;
  const void *v3;

  v2 = _CTServerConnectionCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    _CTServerConnectionEraseBasebandSettings();
    _CTServerConnectionResetModem();
    CFRelease(v3);
  }
}

- (void)confirmEraseCellularSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 13, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForReset(CFSTR("ERASE_ACCOUNT_CONFIRMATION_CANCEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCancelButton:", v3);

  objc_msgSend(v7, "setProperty:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BE75978]);
  objc_msgSend(v7, "setConfirmationAction:", sel_eraseCellularSettings);
  PSG_LocalizedStringForReset(CFSTR("ERASE_ACCOUNT_CONFIRMATION_ALERT_ACCEPT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOkButton:", v4);

  PSG_LocalizedStringForReset(CFSTR("ERASE_ACCOUNT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v5);

  PSG_LocalizedStringForReset(CFSTR("ERASE_ACCOUNT_MSG_CONFIRM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrompt:", v6);

  -[PSGResetOrEraseListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v7);
}

- (void)deviceFullErase:(id)a3
{
  -[PSGResetOrEraseListController presentExitBuddyWithUpsellTradeIn:](self, "presentExitBuddyWithUpsellTradeIn:", 0);
}

- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE2CFE8], "defaultConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpsellTradeIn:", v3);
  objc_msgSend(MEMORY[0x24BE2CFF0], "presentUsingParentViewController:configuration:completion:", self, v5, 0);

}

- (void)refreshLocationServicesAvailable
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22E024000, v0, v1, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PSGResetOrEraseListController set_cachedLocationServicesAvailableValue:](self, "set_cachedLocationServicesAvailableValue:", 0);
    -[PSGResetOrEraseListController updateLocationResetSpecifier](self, "updateLocationResetSpecifier");
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__PSGResetOrEraseListController_carrierBundleChange___block_invoke;
    v5[3] = &unk_24F9C7E70;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __53__PSGResetOrEraseListController_carrierBundleChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "carrier bundle change", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSGResetOrEraseListController;
  -[PSGResetOrEraseListController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "isLargeTextEnabled"))
  {
    v5 = (void *)MEMORY[0x24BEBB520];
    v6 = *MEMORY[0x24BEBE1D0];
    objc_msgSend((id)objc_opt_class(), "maximumSupportedContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_preferredFontForTextStyle:maximumContentSizeCategory:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

  }
  return v4;
}

+ (BOOL)isLargeTextEnabled
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

+ (NSString)maximumSupportedContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x24BEBE070];
}

- (BOOL)isRatchetFeatureAvailableAndEnabled
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  char v7;

  if (!_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureSupported");

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureAvailable");

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled");

  return v7;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLocationServicesAvailableValue, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_mutableSpecifiers, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_locationSpecifier, 0);
  objc_storeStrong((id *)&self->_currentSpecifier, 0);
}

- (uint64_t)resetPrivacyWarnings:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(v0);
}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  id WeakRetained;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a2;
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = &unk_24F9D4260;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_22E024000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while setting Siri Analytics Status to '%@': %@", (uint8_t *)&v9, 0x20u);

}

void __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22E024000, a2, OS_LOG_TYPE_ERROR, "Failed to reset cellular plans: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_151_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0_0(&dword_22E024000, a3, v6, "Ratchet: Cannot proceed to perform critical operation as gating failed - Error: %{public}@ - %@", (uint8_t *)&v7);

}

- (void)subscriberOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22E024000, v0, v1, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end
