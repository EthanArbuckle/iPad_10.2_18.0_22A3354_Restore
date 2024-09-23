@implementation PSUIPasscodeLockController

- (PSUIPasscodeLockController)init
{
  PSUIPasscodeLockController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PSUIPasscodeLockController *v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  HMHomeManager *homeManager;
  void *v16;
  void *v17;
  uint64_t v18;
  PSUIDeviceTakeOverController *dtoController;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  PSUIPasscodeLockController *v25;
  objc_super v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v26.receiver = self;
  v26.super_class = (Class)PSUIPasscodeLockController;
  v2 = -[PSUIPasscodeLockController init](&v26, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionRestrictionChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionPasscodeChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addListenerID:forService:", CFSTR("com.apple.Preferences"), 0);

    objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addListenerID:forService:", CFSTR("com.apple.Preferences"), 1);

    +[PSUIUnlockWithAppleWatchManager sharedInstance](PSUIUnlockWithAppleWatchManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __34__PSUIPasscodeLockController_init__block_invoke;
    v24 = &unk_24F9E3F98;
    v10 = v2;
    v25 = v10;
    objc_msgSend(v8, "canUseWatchToUnlockWithCompletionHandler:", &v21);

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v11 = (void *)getHMHomeManagerClass_softClass;
    v31 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __getHMHomeManagerClass_block_invoke;
      v27[3] = &unk_24F9E3C20;
      v27[4] = &v28;
      __getHMHomeManagerClass_block_invoke((uint64_t)v27);
      v11 = (void *)v29[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v28, 8);
    v13 = [v12 alloc];
    v14 = objc_msgSend(v13, "initWithOptions:", 0, v21, v22, v23, v24);
    homeManager = v10->_homeManager;
    v10->_homeManager = (HMHomeManager *)v14;

    -[HMHomeManager setDelegate:](v10->_homeManager, "setDelegate:", v10);
    v16 = (void *)objc_opt_new();
    -[PSUIPasscodeLockController setAutoUnlockManager:](v10, "setAutoUnlockManager:", v16);

    -[PSUIPasscodeLockController autoUnlockManager](v10, "autoUnlockManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v10);

    v18 = objc_opt_new();
    dtoController = v10->_dtoController;
    v10->_dtoController = (PSUIDeviceTakeOverController *)v18;

    -[PSUIPasscodeLockController setupInternetAvailabilityMonitoring](v10, "setupInternetAvailabilityMonitoring");
  }
  return v2;
}

uint64_t __34__PSUIPasscodeLockController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCanUnlockWatch:", a2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.Preferences"), 0);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListenerID:forService:", CFSTR("com.apple.Preferences"), 1);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BDBD3F0], 0);
  v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v6, self, (CFNotificationName)*MEMORY[0x24BDDA900], 0);
  -[PSUIPasscodeLockController setIsObservingDTOStatusChange:](self, "setIsObservingDTOStatusChange:", 0);
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "DTO: Stopped observing status changes", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  nw_path_monitor_cancel((nw_path_monitor_t)self->_pathMonitor);
  v9.receiver = self;
  v9.super_class = (Class)PSUIPasscodeLockController;
  -[PSUIPasscodeLockController dealloc](&v9, sel_dealloc);
}

- (void)setupInternetAvailabilityMonitoring
{
  void *evaluator_for_endpoint;
  NSObject *v4;
  nw_path_status_t status;
  NSObject *v6;
  void *v7;
  OS_nw_path_monitor *v8;
  OS_nw_path_monitor *pathMonitor;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD update_handler[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v4 = nw_path_evaluator_copy_path();
  status = nw_path_get_status(v4);

  if (status == nw_path_status_satisfied)
    self->_isInternetReachable = 1;
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInternetReachable);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Internet status: at startup [%@]", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v8 = (OS_nw_path_monitor *)nw_path_monitor_create();
  pathMonitor = self->_pathMonitor;
  self->_pathMonitor = v8;

  v10 = self->_pathMonitor;
  v11 = MEMORY[0x24BDAC9B8];
  v12 = MEMORY[0x24BDAC9B8];
  nw_path_monitor_set_queue(v10, v11);

  v13 = self->_pathMonitor;
  update_handler[0] = MEMORY[0x24BDAC760];
  update_handler[1] = 3221225472;
  update_handler[2] = __65__PSUIPasscodeLockController_setupInternetAvailabilityMonitoring__block_invoke;
  update_handler[3] = &unk_24F9E4360;
  objc_copyWeak(&v15, (id *)buf);
  nw_path_monitor_set_update_handler(v13, update_handler);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __65__PSUIPasscodeLockController_setupInternetAvailabilityMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  NSObject *v3;
  id WeakRetained;
  nw_path_status_t status;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  status = nw_path_get_status(v3);

  if (objc_msgSend(WeakRetained, "isInternetReachable") != (status == nw_path_status_satisfied))
  {
    objc_msgSend(WeakRetained, "setIsInternetReachable:", status == nw_path_status_satisfied);
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(WeakRetained, "isInternetReachable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Internet status: changed to [%@]", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(WeakRetained, "reloadSpecifiers");
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Pane loaded", v5, 2u);
  }

  -[PSUIPasscodeLockController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Passcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  if (PSIsPearlAvailable())
    v5 = CFSTR("Face ID & Passcode");
  else
    v5 = CFSTR("Touch ID & Passcode");
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", v5, 0, v6, v8);

  if (PSIsPearlAvailable())
    v10 = CFSTR("com.apple.graphic-icon.face-id");
  else
    v10 = CFSTR("com.apple.graphic-icon.touch-id");
  -[PSUIPasscodeLockController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v10, v9, MEMORY[0x24BDBD1A8], v3);
  PSUILogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "Provided navigation donations for %@", (uint8_t *)&v12, 0xCu);
  }

}

- (id)psCellForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PSUIPasscodeLockController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController indexPathForSpecifier:](self, "indexPathForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIPasscodeLockController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)refreshCellForSpecifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSUIPasscodeLockController psCellForSpecifier:](self, "psCellForSpecifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshCellContentsWithSpecifier:", v4);

}

- (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (int64_t)fingerprintCount
{
  void *v2;
  int64_t v3;

  if (!PSSupportsMesa())
    return 0;
  +[PSUIBiometrics identities](PSUIBiometrics, "identities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)_showDeleteSavedFingerprintsAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[PSUIPasscodeLockController fingerprintCount](self, "fingerprintCount");
  v3 = (void *)MEMORY[0x24BEBD3B0];
  PSLocalizableMesaStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizableMesaStringForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke;
  v15[3] = &unk_24F9E3EB8;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_2;
  v14[3] = &unk_24F9E3EB8;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "specifierForID:", CFSTR("PASSCODE_OFF"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showPINSheet:allowOptionsButton:", v2, 1);

}

void __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCE30]);
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForIdentityType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_3;
        v16[3] = &unk_24F9E42C8;
        v16[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v13, "removeIdentity:completion:", v12, v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "specifierForID:", CFSTR("PASSCODE_OFF"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "showPINSheet:allowOptionsButton:", v15, 1);

}

uint64_t __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)updatePasscodeChangesGroupFooterToSpecifier:(id)a3 showDefault:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        v6 == 6))
  {
    objc_msgSend(v9, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
  }
  else
  {
    SFLocalizableWAPIStringKeyForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

  }
}

- (BOOL)shouldDisplayTurnOffPasscodeAlertMessage
{
  return 1;
}

- (id)turnOffPasscodeAlertMessage
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController getTurnOffAlertDescriptionForFeatureProtectedApps](self, "getTurnOffAlertDescriptionForFeatureProtectedApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController getTurnOffAlertDescriptionForOtherFeatures](self, "getTurnOffAlertDescriptionForOtherFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;

    if (v5)
    {
      -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("\n\n%@"), v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (__CFString *)v7;
    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSUIPasscodeLockController turnOffPasscodeAlertMessage].cold.1();

    v6 = &stru_24F9E4F80;
  }
  v9 = v6;

  return v9;
}

- (id)getTurnOffAlertDescriptionForFeatureProtectedApps
{
  __CFString *v2;

  if (PSIsPearlAvailable())
    v2 = CFSTR("TURN_OFF_PASSCODE_AFFECTS_PROTECTED_APPS_FACE_ID");
  else
    v2 = CFSTR("TURN_OFF_PASSCODE_AFFECTS_PROTECTED_APPS_TOUCH_ID");
  PSUI_LocalizedStringForPasscodeLock(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getTurnOffAlertDescriptionForOtherFeatures
{
  int v3;
  _BOOL4 canUnlockWatch;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = PSHasStockholmPass();
  canUnlockWatch = self->_canUnlockWatch;
  if ((v3 & 1) == 0 && !self->_canUnlockWatch)
  {
    v5 = 0;
    v6 = 0;
    goto LABEL_14;
  }
  PSPreferencesFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("TURN_OFF_PASSCODE_LOCK_CONFIRMATION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v3)
  {
    objc_msgSend(v8, "appendString:", CFSTR("_STOCKHOLM"));
    v9 = CFSTR("Payment_Prefs");
    if (!canUnlockWatch)
      goto LABEL_9;
    goto LABEL_8;
  }
  v9 = CFSTR("Passcode Lock");
  if (canUnlockWatch)
  {
LABEL_8:
    objc_msgSend(v6, "appendString:", CFSTR("_WATCH"));
    v9 = CFSTR("Watch_Prefs");
  }
LABEL_9:
  if (v6)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24F9E4F80, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (PSUsedByHSA2Account())
    {
      PSUI_RebrandedKeyForAppleID(CFSTR("TURN_OFF_PASSCODE_HSA2_ENDING"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PSUI_LocalizedStringForPasscodeLock(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
  }
  else
  {
    v5 = 0;
  }

LABEL_14:
  return v5;
}

- (BOOL)shouldPresentAppleIDAuthenticationForTogglingPasscode
{
  char v2;

  v2 = PSUsedByHSA2Account();
  return v2 | PSUsedByManagedAccount();
}

- (void)togglePasscode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = *MEMORY[0x24BE75E18];
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75E18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "intValue"))
  {

  }
  else
  {
    v12 = -[PSUIPasscodeLockController fingerprintCount](self, "fingerprintCount");

    if (v12 >= 1)
    {
      -[PSUIPasscodeLockController _showDeleteSavedFingerprintsAlert](self, "_showDeleteSavedFingerprintsAlert");
      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "propertyForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 == 1)
  {
    -[PSUIPasscodeLockController dtoController](self, "dtoController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRatchetEnabled");

    if (v10)
    {
      objc_initWeak(&location, self);
      -[PSUIPasscodeLockController dtoController](self, "dtoController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __45__PSUIPasscodeLockController_togglePasscode___block_invoke;
      v13[3] = &unk_24F9E3F70;
      objc_copyWeak(&v15, &location);
      v14 = v4;
      objc_msgSend(v11, "gateWithRatchetForOperation:forPresentingVC:completion:", 7, self, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PSUIPasscodeLockController proceedToTurnOffPasscode:](self, "proceedToTurnOffPasscode:", v4);
    }
  }
  else
  {
    -[PSUIPasscodeLockController showPINSheet:allowOptionsButton:](self, "showPINSheet:allowOptionsButton:", v4, 1);
  }
LABEL_10:

}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2 == 2)
  {
    PSUILogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __45__PSUIPasscodeLockController_togglePasscode___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __45__PSUIPasscodeLockController_togglePasscode___block_invoke_115;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_115(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Turn Off Passcode: Proceeding", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedToTurnOffPasscode:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45__PSUIPasscodeLockController_togglePasscode___block_invoke_115_cold_1();

  }
}

- (void)proceedToTurnOffPasscode:(id)a3
{
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  -[PSUIPasscodeLockController turnOffPasscodeAlertMessage](self, "turnOffPasscodeAlertMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBD3B0];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF_PASSCODE_LOCK_QUESTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("CANCEL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  v12 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __55__PSUIPasscodeLockController_proceedToTurnOffPasscode___block_invoke;
  v18 = &unk_24F9E4388;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 2, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v14, v15, v16, v17, v18);

  -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __55__PSUIPasscodeLockController_proceedToTurnOffPasscode___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "shouldPresentAppleIDAuthenticationForTogglingPasscode"))
  {
    objc_msgSend(WeakRetained, "presentAppleIDAuthenticationController");
  }
  else
  {
    objc_msgSend(WeakRetained, "specifierForID:", CFSTR("PASSCODE_OFF"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "showPINSheet:", v1);

  }
}

- (void)presentAppleIDAuthenticationController
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
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
  objc_class *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v3 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  v32 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v27 = &unk_24F9E3C20;
    v28 = &v29;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)&v24);
    v3 = (void *)v30[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v29, 8);
  v6 = objc_alloc_init(v5);
  v7 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUsername:", v9);

  objc_msgSend(v8, "aa_personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDSID:", v10);

  objc_msgSend(v8, "aa_altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAltDSID:", v11);

  objc_msgSend(v6, "setAuthenticationType:", 2);
  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v6, "setIsUsernameEditable:", 0);
  PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultButtonString:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  PSUI_RebrandedKeyForAppleID(CFSTR("TURN_OFF_PASSCODE_HSA2_AUTH_PROMPT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForPasscodeLock(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReason:", v17);

  objc_msgSend(v6, "setEnablePasscodeAuth:", 0);
  objc_initWeak(&location, self);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v18 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
  v32 = getAKAppleIDAuthenticationControllerClass_softClass;
  if (!getAKAppleIDAuthenticationControllerClass_softClass)
  {
    v24 = v4;
    v25 = 3221225472;
    v26 = __getAKAppleIDAuthenticationControllerClass_block_invoke;
    v27 = &unk_24F9E3C20;
    v28 = &v29;
    __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)&v24);
    v18 = (void *)v30[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v29, 8);
  v20 = objc_alloc_init(v19);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke;
  v21[3] = &unk_24F9E43B0;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v20, "authenticateWithContext:completion:", v6, v21);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  _QWORD block[9];

  if (!a3)
  {
    block[7] = v3;
    block[8] = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke_2;
    block[3] = &unk_24F9E3BF8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "specifierForID:", CFSTR("PASSCODE_OFF"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showPINSheet:", v2);

}

- (void)showPINSheet:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[PSUIPasscodeLockController _shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:](self, "_shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:", v4))
  {
    -[PSUIPasscodeLockController _showLocalAuthenticationPINSheet:](self, "_showLocalAuthenticationPINSheet:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PSUIPasscodeLockController;
    -[PSUIPasscodeLockController showPINSheet:allowOptionsButton:](&v5, sel_showPINSheet_allowOptionsButton_, v4, 1);
  }

}

- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4
{
  id v5;
  objc_super v6;

  v5 = a3;
  if (-[PSUIPasscodeLockController _shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:](self, "_shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:", v5))
  {
    -[PSUIPasscodeLockController _showLocalAuthenticationPINSheet:](self, "_showLocalAuthenticationPINSheet:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PSUIPasscodeLockController;
    -[PSUIPasscodeLockController showPINSheet:allowOptionsButton:](&v6, sel_showPINSheet_allowOptionsButton_, v5, 1);
  }

}

- (void)_showLocalAuthenticationPINSheet:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  id v7;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75E18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
  {
    if (v5 == 1)
    {
      PSUI_LocalizedStringForPasscodeLock(CFSTR("PMREMOVE"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:title:passcodePrompt:withCompletion:", self);
      goto LABEL_8;
    }
    if (v5 != 2)
      return;
    v6 = CFSTR("PMCHANGE");
  }
  else
  {
    v6 = CFSTR("PMSET");
  }
  PSUI_LocalizedStringForPasscodeLock(v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:", self);
LABEL_8:

}

- (BOOL)_shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75E18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if ((v5 & 0xFFFFFFFD) == 0)
    return -[PSUIPasscodeLockController shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests](self, "shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests");
  if (v5 == 1)
    return -[PSUIPasscodeLockController shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests](self, "shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests");
  return 0;
}

- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests
{
  return 1;
}

- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests
{
  return 1;
}

- (void)showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDDA9F0]);
  -[PSUIPasscodeLockController set_passcodeRemovalService:](self, "set_passcodeRemovalService:", v14);

  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x24BE6B608];
  v16 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke;
  v29[3] = &unk_24F9E43D8;
  objc_copyWeak(&v33, &location);
  v17 = v11;
  v30 = v17;
  v18 = v12;
  v31 = v18;
  v19 = v10;
  v32 = v19;
  objc_msgSend(v15, "lazyFutureWithBlock:", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_140;
  v27[3] = &unk_24F9E4400;
  objc_copyWeak(&v28, &location);
  v21 = (id)objc_msgSend(v20, "addSuccessBlock:", v27);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2;
  v24[3] = &unk_24F9E4428;
  objc_copyWeak(&v26, &location);
  v22 = v13;
  v25 = v22;
  v23 = (id)objc_msgSend(v20, "addCompletionBlock:", v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_passcodeRemovalService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v9 = a1[5];
    v14 = 138543874;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode Removal Service (%{public}@) with title '%{public}@' and prompt '%{public}@'.", (uint8_t *)&v14, 0x20u);

  }
  v10 = objc_alloc_init(MEMORY[0x24BDDA9F8]);
  objc_msgSend(v10, "setTitle:", a1[4]);
  objc_msgSend(v10, "setPasscodePrompt:", a1[5]);
  objc_msgSend(WeakRetained, "_passcodeRemovalService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[6];
  objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "startInParentVC:options:completion:", v12, v10, v13);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_140(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didUpdatePasscode:", 0);
  objc_msgSend(WeakRetained, "reloadSpecifiers");
  objc_msgSend(WeakRetained, "showKeychainAlert");

}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_cold_1(WeakRetained, (uint64_t)v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_passcodeRemovalService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed passcode removal request (%{public}@).", (uint8_t *)&v10, 0xCu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  objc_msgSend(WeakRetained, "set_passcodeRemovalService:", 0);

}

- (void)showLocalAuthenticationPasscodeChangeFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDDA9E0]);
  -[PSUIPasscodeLockController set_passcodeChangeService:](self, "set_passcodeChangeService:", v14);

  objc_initWeak(location, self);
  v15 = (void *)MEMORY[0x24BE6B608];
  v16 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke;
  v37[3] = &unk_24F9E43D8;
  objc_copyWeak(&v41, location);
  v17 = v11;
  v38 = v17;
  v18 = v12;
  v39 = v18;
  v19 = v10;
  v40 = v19;
  objc_msgSend(v15, "lazyFutureWithBlock:", v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_145;
  v35[3] = &unk_24F9E4478;
  objc_copyWeak(&v36, location);
  objc_msgSend(v20, "flatMap:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  objc_msgSend(v21, "flatMap:", &__block_literal_global_4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_149;
  v33[3] = &unk_24F9E44E0;
  objc_copyWeak(&v34, location);
  objc_msgSend(v22, "flatMap:", v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_154;
  v30[3] = &unk_24F9E4428;
  objc_copyWeak(&v32, location);
  v24 = v13;
  v31 = v24;
  v25 = (id)objc_msgSend(v23, "addCompletionBlock:", v30);
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_155;
  v28[3] = &unk_24F9E4508;
  objc_copyWeak(&v29, location);
  v26 = (id)objc_msgSend(v22, "addCompletionBlock:", v28);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v41);
  objc_destroyWeak(location);

}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_passcodeChangeService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v9 = a1[5];
    v14 = 138543874;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode Change Service (%{public}@) with title '%{public}@' and prompt '%{public}@'.", (uint8_t *)&v14, 0x20u);

  }
  v10 = objc_alloc_init(MEMORY[0x24BDDA9E8]);
  objc_msgSend(v10, "setTitle:", a1[4]);
  objc_msgSend(v10, "setPasscodePrompt:", a1[5]);
  objc_msgSend(WeakRetained, "_passcodeChangeService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[6];
  objc_msgSend(v4, "completionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "startInParentVC:options:completion:", v12, v10, v13);
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x24BE6B608];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2;
  v9[3] = &unk_24F9E4450;
  v9[4] = WeakRetained;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_passcodeChangeService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Change Service (%{public}@) completed, extracting credentials.", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v3, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "credentialOfType:reply:", -9, v7);
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_147(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v2 = a2;
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Extracted Credentials, continuing to update system state.", v8, 2u);
  }

  v4 = (void *)MEMORY[0x24BE6B608];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);

  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Extracted Credentials, Updating Keychain State.", buf, 2u);
  }

  v6 = (void *)MEMORY[0x24BE6B608];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_150;
  v10[3] = &unk_24F9E4450;
  v11 = v3;
  v12 = WeakRetained;
  v7 = v3;
  objc_msgSend(v6, "lazyFutureWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_150(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE75520], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_152;
  v8[3] = &unk_24F9E42C8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "promptForDevicePasscodeChangeToPasscode:overController:completion:", v6, v5, v8);

}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_152(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_3;
  v6[3] = &unk_24F9E39A0;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Updating Keychain State failed with error '%{public}@'.", (uint8_t *)&v7, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "finishWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Updating Keychain State succeeded.", (uint8_t *)&v7, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_154_cold_1(WeakRetained, (uint64_t)v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_passcodeChangeService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed passcode change request (%{public}@).", (uint8_t *)&v10, 0xCu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  objc_msgSend(WeakRetained, "set_passcodeChangeService:", 0);

}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    PSUILogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_155_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    objc_msgSend(WeakRetained, "_didUpdatePasscode:", v5);
  }

}

+ (int64_t)passcodeGracePeriod
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x24BE63A40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)graceValue:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE63A40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setGraceValue:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v5 = a3;
  -[PSUIPasscodeLockController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75CC0]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  PSUILogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PSUIPasscodeLockController setGraceValue:specifier:].cold.2();

  if (!v8)
  {
LABEL_7:
    PSUILogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSUIPasscodeLockController setGraceValue:specifier:].cold.1();

  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forSetting:passcode:", v5, *MEMORY[0x24BE63A40], v8);

}

- (void)updateGracePeriodSpecifier
{
  id v3;

  -[PSUIPasscodeLockController specifierForID:](self, "specifierForID:", CFSTR("PASSCODE_REQ"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController _updateGracePeriodForSpecifier:](self, "_updateGracePeriodForSpecifier:", v3);
  -[PSUIPasscodeLockController reloadSpecifier:](self, "reloadSpecifier:", v3);

}

- (void)_updateGracePeriodForSpecifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "effectiveParametersForValueSetting:", *MEMORY[0x24BE63A40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE63BB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  LOBYTE(v4) = PSSupportsMesa();
  v8 = PSIsPearlAvailable();
  if ((v4 & 1) != 0 || v8)
  {
    +[PSUIBiometrics identities](PSUIBiometrics, "identities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isFingerprintUnlockAllowed");

      if (v11)
        v7 = 0;
    }
    else
    {

    }
  }
  v12 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v25, "propertyForKey:", CFSTR("gracePeriodValues"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v25, "propertyForKey:", CFSTR("gracePeriodShortTitles"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v25, "propertyForKey:", CFSTR("gracePeriodTitles"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v14, "count");
  if (v21 >= 1)
  {
    v22 = v21 + 1;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v22 - 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)objc_msgSend(v23, "intValue") > v7)
      {
        objc_msgSend(v17, "removeObjectForKey:", v23);
        objc_msgSend(v20, "removeObjectForKey:", v23);
        objc_msgSend(v14, "removeObjectAtIndex:", v22 - 2);
      }

      --v22;
    }
    while (v22 > 1);
  }
  objc_msgSend(v25, "setValues:", v14);
  objc_msgSend(v25, "setTitleDictionary:", v20);
  objc_msgSend(v25, "setShortTitleDictionary:", v17);
  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    objc_msgSend(v25, "removePropertyForKey:", *MEMORY[0x24BE75CD0]);
  }
  else
  {
    PSUI_LocalizedStringForPasscodeLock(CFSTR("SECURITY_MSG"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperty:forKey:", v24, *MEMORY[0x24BE75CD0]);

  }
  -[PSUIPasscodeLockController _localizeGracePeriodTitlesForSpecifier:](self, "_localizeGracePeriodTitlesForSpecifier:", v25);

}

- (void)_localizeGracePeriodTitlesForSpecifier:(id)a3
{
  id v4;
  __CFNotificationCenter *LocalCenter;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_localizeGracePeriodTitlesForSpecifier__sSubscribed & 1) == 0)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)apple_numbers_changed_notification, (CFStringRef)*MEMORY[0x24BDBD3F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _localizeGracePeriodTitlesForSpecifier__sSubscribed = 1;
  }
  objc_msgSend(v4, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v7, "mutableCopy");

  v30 = v4;
  objc_msgSend(v4, "shortTitleDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v8, "mutableCopy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "intValue");
        if ((int)v11 >= 1)
        {
          if (v11 > 0xE0F)
          {
            v12 = v11 / 0xE10uLL;
            if ((unint64_t)v11 - 3600 >= 0xE10)
              v15 = CFSTR("%ld_HOURS");
            else
              v15 = CFSTR("%ld_HOUR");
            if ((unint64_t)v11 - 3600 >= 0xE10)
              v16 = CFSTR("%ld_HOURS_SHORT");
            else
              v16 = CFSTR("%ld_HOUR_SHORT");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v15, v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v16, v12);
          }
          else
          {
            v12 = (unsigned __int16)v11 / 0x3Cu;
            if ((unint64_t)v11 - 60 >= 0x3C)
              v13 = CFSTR("%ld_MINUTES");
            else
              v13 = CFSTR("%ld_MINUTE");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v13, v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld_MIN"), v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v14;
          v18 = (void *)MEMORY[0x24BDD17C8];
          PSUI_LocalizedStringForPasscodeLock(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BDD16F0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v21, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", v19, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v23, v10);

          v24 = (void *)MEMORY[0x24BDD17C8];
          PSUI_LocalizedStringForPasscodeLock(v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x24BDD16F0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringFromNumber:numberStyle:", v27, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", v25, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v29, v10);

        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v35);
  }

  objc_msgSend(v30, "setTitleDictionary:", v33);
  objc_msgSend(v30, "setShortTitleDictionary:", v32);

}

- (BOOL)gracePeriodPasscodeRecoveryAvailable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recoveryPasscodeAvailable");

  return v3;
}

- (void)gracePeriodClearRecoveryPasscode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  PSUIPasscodeLockController *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("GRACE_PERIOD_CLEAR_PASSCODE_ALERT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForPasscodeLock(CFSTR("GRACE_PERIOD_CLEAR_PASSCODE_ALERT_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("GRACE_PERIOD_CLEAR_PASSCODE_ALERT_TURN_OFF"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke;
  v19 = &unk_24F9E3B08;
  v20 = v4;
  v21 = self;
  v11 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12, v16, v17, v18, v19);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, &__block_literal_global_193);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", *(_QWORD *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_2;
  block[3] = &unk_24F9E39A0;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_async(v2, block);

}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecoveryPasscode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3;
  block[3] = &unk_24F9E4530;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v2 = a1 + 32;
  v3 = *(_QWORD *)(a1 + 32);
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 48), "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "User decided to clear recovery passcode.", v14, 2u);
    }

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v12, "specifierForID:", CFSTR("PASSCODE_GRACE_PERIOD_GROUP"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeSpecifier:animated:", v13, 1);

  }
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_192()
{
  NSObject *v0;
  uint8_t v1[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_DEFAULT, "User canceled for clear recovery passcode.", v1, 2u);
  }

}

- (void)openGracePeriodPasscodeRecoveryHelpLink
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/en-us/HT213849"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, &__block_literal_global_197);

}

void __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    PSUILogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke_cold_1();

  }
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
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
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  NSRange v31;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPasscodeRecoverySupported");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recoveryPasscodeExpiryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject compare:](v9, "compare:", v8) == 1)
      {
        PSUILogForCategory(1uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[PSUIPasscodeLockController addGracePeriodPasscodeRecoveryFooterToSpecifier:].cold.2();
      }
      else
      {
        objc_msgSend(v8, "timeIntervalSinceNow");
        v12 = v11;
        v10 = objc_alloc_init(MEMORY[0x24BDD14F8]);
        -[NSObject setUnitsStyle:](v10, "setUnitsStyle:", 5);
        -[NSObject setAllowedUnits:](v10, "setAllowedUnits:", 96);
        -[NSObject setZeroFormattingBehavior:](v10, "setZeroFormattingBehavior:", 14);
        -[NSObject stringFromTimeInterval:](v10, "stringFromTimeInterval:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        PSUILogForCategory(1uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v8;
          v28 = 2112;
          v29 = v13;
          _os_log_impl(&dword_22E0C8000, v14, OS_LOG_TYPE_DEFAULT, "Recovery Expiry date [%@] time remaining to expire [%@]", buf, 0x16u);
        }

        v15 = (void *)MEMORY[0x24BDD17C8];
        PSUI_LocalizedStringForPasscodeLock(CFSTR("PASSCODE_RECOVERY_TEXT"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)v13;
        objc_msgSend(v15, "stringWithFormat:", v16, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v18, "isPasscodeRecoveryRestricted");

        if ((_DWORD)v16)
        {
          objc_msgSend(v4, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);
        }
        else
        {
          PSUI_LocalizedStringForPasscodeLock(CFSTR("PASSCODE_RECOVERY_LEARN_MORE_TEXT"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v17, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setProperty:forKey:", v22, *MEMORY[0x24BE75A30]);

          objc_msgSend(v4, "setProperty:forKey:", v20, *MEMORY[0x24BE75A58]);
          v31.location = objc_msgSend(v20, "rangeOfString:", v19);
          NSStringFromRange(v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setProperty:forKey:", v23, *MEMORY[0x24BE75A40]);

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setProperty:forKey:", v24, *MEMORY[0x24BE75A50]);

          objc_msgSend(v4, "setProperty:forKey:", CFSTR("openGracePeriodPasscodeRecoveryHelpLink"), *MEMORY[0x24BE75A38]);
          v17 = v20;
        }

      }
    }
    else
    {
      PSUILogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PSUIPasscodeLockController addGracePeriodPasscodeRecoveryFooterToSpecifier:].cold.1();
    }

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PSUIPasscodeLockController;
  v6 = a4;
  -[PSUIPasscodeLockController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("TURN_OFF_PASSCODE_RECOVERY"));

  if (!v10)
    goto LABEL_6;
  v11 = v7;
  if (objc_msgSend(v11, "type") != 13)
  {

LABEL_6:
    v14 = v7;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

LABEL_7:
  return v7;
}

- (void)scrollToStolenDeviceProtection
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Scrolling and highlighting: Stolen Device Protection", v5, 2u);
  }

  -[PSUIPasscodeLockController specifierForID:](self, "specifierForID:", CFSTR("DTO_STATUS_LABEL_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController _scrollToSpecifierWithID:animated:](self, "_scrollToSpecifierWithID:animated:", CFSTR("DTO_STATUS_LABEL_ID"), 1);
  -[PSUIPasscodeLockController selectRowForSpecifier:](self, "selectRowForSpecifier:", v4);

}

- (void)registerObserverAndHandlerForDTOStatusChanges
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  if (!-[PSUIPasscodeLockController isObservingDTOStatusChange](self, "isObservingDTOStatusChange"))
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Start observing status changes", v5, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)dtoStatusChangedNotification, (CFStringRef)*MEMORY[0x24BDDA900], 0, (CFNotificationSuspensionBehavior)1028);
    -[PSUIPasscodeLockController setIsObservingDTOStatusChange:](self, "setIsObservingDTOStatusChange:", 1);
  }
}

- (void)handleDTOStatusChanged
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke;
  v2[3] = &unk_24F9E3978;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Reloading Status Label to updated status", v4, 2u);
    }

    objc_msgSend(WeakRetained, "reloadSpecifierID:", CFSTR("DTO_STATUS_LABEL_ID"));
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke_cold_1();

  }
}

- (id)getDTOSpecifiers
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend((id)objc_opt_class(), "isRatchetFeatureAvailable");
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      -[PSUIPasscodeLockController dtoController](self, "dtoController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isRatchetEnabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Available [Status: %@]: Adding specifiers", buf, 0xCu);

    }
    -[PSUIPasscodeLockController registerObserverAndHandlerForDTOStatusChanges](self, "registerObserverAndHandlerForDTOStatusChanges");
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F9E4F80, self, 0, 0, 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setIdentifier:](v4, "setIdentifier:", CFSTR("DTO_GROUP_ID"));
    v9 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_STATUS_LABEL_DESCRIPTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel_getDTOStatusForSpecifier_, objc_opt_class(), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("DTO_STATUS_LABEL_ID"));
    objc_msgSend(v11, "setProperty:forKey:", NSClassFromString(CFSTR("PSMultilineTableCell")), *MEMORY[0x24BE75948]);
    -[PSUIPasscodeLockController updateDTOSpecifierIfNeeded](self, "updateDTOSpecifierIfNeeded");
    v14[0] = v4;
    v14[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Unavailable: Skip adding specifiers", buf, 2u);
    }
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (void)updateDTOSpecifierIfNeeded
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Will perform preliminary checks", buf, 2u);
  }

  -[PSUIPasscodeLockController dtoController](self, "dtoController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke;
  v5[3] = &unk_24F9E45E0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v4, "performPreliminaryPreEnableDTOChecksWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  _QWORD v9[6];
  id v10;
  char v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2;
  v9[3] = &unk_24F9E45B8;
  v11 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v9[4] = WeakRetained;
  v9[5] = v7;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      PSUILogForCategory(1uLL);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "DTO: Passed preliminary checks", v5, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "specifierForID:", CFSTR("DTO_GROUP_ID"));
      v2 = objc_claimAutoreleasedReturnValue();
      -[NSObject setProperty:forKey:](v2, "setProperty:forKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x24BE75A68]);
      objc_msgSend(*(id *)(a1 + 40), "specifierForID:", CFSTR("DTO_STATUS_LABEL_ID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      PSUILogForCategory(1uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Failed preliminary checks - will be disabled", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:", CFSTR("DTO_GROUP_ID"));
    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2_cold_1();
  }

}

- (id)getDTOStatusForSpecifier:(id)a3
{
  void *v3;
  int v4;
  __CFString *v5;

  -[PSUIPasscodeLockController dtoController](self, "dtoController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRatchetEnabled");

  if (v4)
    v5 = CFSTR("DTO_STATUS_LABEL_DESCRIPTION_STATE_ON");
  else
    v5 = CFSTR("DTO_STATUS_LABEL_DESCRIPTION_STATE_OFF");
  PSUI_LocalizedStringForPasscodeDimpleKey(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)voiceDial:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveRestrictedBoolValueForSetting:", *MEMORY[0x24BE63788]);

  switch(v5)
  {
    case 1:
      v7 = 1;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v7 = 0;
      goto LABEL_7;
    case 0:
      -[PSUIPasscodeLockController voiceDial:].cold.1();
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)setVoiceDial:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x24BE63CB0];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBoolValue:forSetting:", v6, *MEMORY[0x24BE63788]);
}

- (BOOL)shouldShowVoiceDial
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  if (MGGetBoolAnswer()
    && (objc_msgSend(getAFPreferencesClass(), "sharedPreferences"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "assistantIsEnabled"),
        v2,
        v3))
  {
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "disableAssistantWhilePasscodeLocked") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isVoiceDialRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63788]);

  return v3;
}

- (void)updateVoiceDialGroup
{
  int v3;
  _BOOL4 v4;
  PSSpecifier *voiceDialSpecifier;
  void *v6;
  PSSpecifier *v7;
  void *v8;
  PSSpecifier *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (self->_voiceDialGroupSpecifier && self->_voiceDialSpecifier)
  {
    if ((-[PSUIPasscodeLockController containsSpecifier:](self, "containsSpecifier:") & 1) != 0)
    {
      v3 = -[PSUIPasscodeLockController containsSpecifier:](self, "containsSpecifier:", self->_voiceDialSpecifier);
      v4 = -[PSUIPasscodeLockController shouldShowVoiceDial](self, "shouldShowVoiceDial");
      if (v3 && !v4)
      {
        voiceDialSpecifier = self->_voiceDialSpecifier;
        v11[0] = self->_voiceDialGroupSpecifier;
        v11[1] = voiceDialSpecifier;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSUIPasscodeLockController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v6, 1);
LABEL_11:

        return;
      }
    }
    else
    {
      v4 = -[PSUIPasscodeLockController shouldShowVoiceDial](self, "shouldShowVoiceDial");
      LOBYTE(v3) = 0;
    }
    if ((v3 & 1) == 0 && v4)
    {
      v7 = self->_voiceDialSpecifier;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSUIPasscodeLockController isVoiceDialRestricted](self, "isVoiceDialRestricted") ^ 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);

      v9 = self->_voiceDialSpecifier;
      v10[0] = self->_voiceDialGroupSpecifier;
      v10[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v6, CFSTR("PASSCODE_REQ"), 1);
      goto LABEL_11;
    }
  }
}

- (id)assistantUnderLockEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "disableAssistantWhilePasscodeLocked") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAssistantUnderLockEnabled:(id)a3 forSpecifier:(id)a4
{
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v5 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disableAssistantWhilePasscodeLocked");

  if (v5 == v7)
  {
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableAssistantWhilePasscodeLocked:", v5 ^ 1u);

    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronize");

  }
  -[PSUIPasscodeLockController updateVoiceDialGroup](self, "updateVoiceDialGroup");
}

- (BOOL)isAssistantRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637E0]);

  return v3;
}

- (id)homeControlAccessAllowedWhenLocked:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[PSUIPasscodeLockController homeManager](self, "homeManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAccessAllowedWhenLocked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHomeControlAccessAllowedWhenLocked:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PSUIPasscodeLockController homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "BOOLValue");

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__PSUIPasscodeLockController_setHomeControlAccessAllowedWhenLocked_specifier___block_invoke;
  v11[3] = &unk_24F9E4608;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "updateAccessAllowedWhenLocked:completionHandler:", v9, v11);

}

uint64_t __78__PSUIPasscodeLockController_setHomeControlAccessAllowedWhenLocked_specifier___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "reloadSpecifier:animated:", *(_QWORD *)(result + 40), 1);
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  -[PSUIPasscodeLockController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("HOME_CONTROL_SWITCH"));
}

- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4
{
  -[PSUIPasscodeLockController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("HOME_CONTROL_SWITCH"), a4);
}

- (id)wallet:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63840]);

  switch(v5)
  {
    case 1:
      v7 = 1;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v7 = 0;
      goto LABEL_7;
    case 0:
      -[PSUIPasscodeLockController wallet:].cold.1();
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)setWallet:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x24BE63CB0];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBoolValue:forSetting:", v6, *MEMORY[0x24BE63840]);
}

- (BOOL)isWalletRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63840]);

  return v3;
}

- (BOOL)showReplyWithMessage
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPhone");

  return v3;
}

- (id)wipeEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
    -[PSUIPasscodeLockController specifierForID:](self, "specifierForID:", CFSTR("WIPE_DEVICE"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE75578], "readPreferenceValue:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_policyDictatedMaxFailedAttempts < 0)
      v8 = (void *)MEMORY[0x24BDBD1C0];
    else
      v8 = (void *)MEMORY[0x24BDBD1C8];
    v7 = v8;
  }
  v9 = v7;

  return v9;
}

- (void)setWipeEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  int policyDictatedMaxFailedAttempts;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;

  v6 = a4;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    v7 = (void *)MEMORY[0x24BDD16F0];
    policyDictatedMaxFailedAttempts = self->_policyDictatedMaxFailedAttempts;
    if (policyDictatedMaxFailedAttempts < 0)
      v9 = 10;
    else
      v9 = policyDictatedMaxFailedAttempts;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("WIPE_DEVICE_ALERT_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v11;
    objc_msgSend(v12, "stringWithFormat:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PSUI_LocalizedStringForPasscodeLock(CFSTR("WIPE_DEVICE_ALERT_OK"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("WIPE_DEVICE_ALERT_CANCEL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sf_isiPad");
    v18 = v14;
    if (v17)
    {
      objc_msgSend(v6, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "sf_isiPad"))
      v20 = v14;
    else
      v20 = 0;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v18, v20, objc_msgSend(v21, "sf_isiPad"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    v23 = (void *)MEMORY[0x24BEBD3A8];
    v24 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke;
    v31[3] = &unk_24F9E3EB8;
    v32 = v6;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v27, 1, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v25);

    v30[0] = v24;
    v30[1] = 3221225472;
    v30[2] = __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke_2;
    v30[3] = &unk_24F9E3EB8;
    v30[4] = self;
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v28, 2, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v26);

    -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
  }
  else
  {
    -[PSUIPasscodeLockController _setWipeEnabled:](self, "_setWipeEnabled:", 0);
  }

}

void __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", *MEMORY[0x24BE759A0]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOn:animated:", 0, 1);

}

uint64_t __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWipeEnabled:", 1);
}

- (void)_setWipeEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE75578];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController specifierForID:](self, "specifierForID:", CFSTR("WIPE_DEVICE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferenceValue:specifier:", v6, v5);

}

- (id)_makeWipeDeviceGroupFooter
{
  void *v2;
  int policyDictatedMaxFailedAttempts;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x24BDD16F0];
  policyDictatedMaxFailedAttempts = self->_policyDictatedMaxFailedAttempts;
  if (policyDictatedMaxFailedAttempts < 0)
    v4 = 10;
  else
    v4 = policyDictatedMaxFailedAttempts;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromNumber:numberStyle:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("WIPE_DEVICE_TEXT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isContentProtectionInEffect");

  if (v11)
  {
    PSUI_LocalizedStringForPasscodeLock(CFSTR("DATA_ENCRYPTED_TEXT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@\n "), v9, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v9;
  }

  return v13;
}

- (void)devicePINController:(id)a3 shouldAcceptPIN:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int IsPasswordWeak2;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "simplePIN");
  IsPasswordWeak2 = SecPasswordIsPasswordWeak2();

  if (IsPasswordWeak2)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __81__PSUIPasscodeLockController_devicePINController_shouldAcceptPIN_withCompletion___block_invoke;
    v12[3] = &unk_24F9E4630;
    v13 = v9;
    -[PSUIPasscodeLockController showWeakWarningAlertForController:offerUseAnyway:withCompletion:](self, "showWeakWarningAlertForController:offerUseAnyway:withCompletion:", v8, 1, v12);

  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

uint64_t __81__PSUIPasscodeLockController_devicePINController_shouldAcceptPIN_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showWeakWarningAlertForController:(id)a3 offerUseAnyway:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  int v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = PSUsedByHSA2Account();
  v10 = CFSTR("WEAK_PASSCODE_DETAILS");
  if (v9)
    v10 = CFSTR("WEAK_PASSCODE_DETAILS_HSA2");
  v11 = (void *)MEMORY[0x24BEBD3B0];
  v12 = v10;
  PSUI_LocalizedStringForPasscodeLock(CFSTR("WEAK_PASSCODE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForPasscodeLock(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("CHOOSE_NEW_CODE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke;
  v29[3] = &unk_24F9E3EE0;
  v19 = v8;
  v30 = v19;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v20);

  if (v6)
  {
    v21 = (void *)MEMORY[0x24BEBD3A8];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("USE_WEAK_PASSCODE_ANYWAY"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = 3221225472;
    v26 = __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke_2;
    v27 = &unk_24F9E3EE0;
    v28 = v19;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, &v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v23, v24, v25, v26, v27);

  }
  objc_msgSend(v7, "presentViewController:animated:completion:", v15, 1, 0);

}

uint64_t __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  -[PSUIPasscodeLockController _didUpdatePasscode:](self, "_didUpdatePasscode:", a4);
  -[PSUIPasscodeLockController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_didUpdatePasscode:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  -[PSUIPasscodeLockController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSUIPasscodeLockController _didUpdatePasscode:].cold.1();

  }
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "_didUpdatePasscode: Saving passcode for specifier", buf, 2u);
    }

    -[PSUIPasscodeLockController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v4, *MEMORY[0x24BE75CC0]);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "_didUpdatePasscode: Removing passcode for specifier", v10, 2u);
    }

    -[PSUIPasscodeLockController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePropertyForKey:", *MEMORY[0x24BE75CC0]);
  }

}

- (void)devicePINController:(id)a3 didAcceptChangedPIN:(id)a4
{
  -[PSUIPasscodeLockController _didUpdatePasscode:](self, "_didUpdatePasscode:", a4);
}

- (void)didAcceptRemovePIN
{
  -[PSUIPasscodeLockController _didUpdatePasscode:](self, "_didUpdatePasscode:", 0);
  -[PSUIPasscodeLockController reloadSpecifiers](self, "reloadSpecifiers");
  -[PSUIPasscodeLockController showKeychainAlert](self, "showKeychainAlert");
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 0;
}

- (void)showKeychainAlert
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
  id v12;

  if (PSKeychainSyncGetStatus() == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DISABLE_WARNING%@%@"), CFSTR("_PASSWORDS"), CFSTR("_KEYCHAIN"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF_ICLOUD_KEYCHAIN"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("KEEP_USING_ICLOUD_KEYCHAIN"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BEBD3B0];
    PSUI_LocalizedStringForPasscodeLock(v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v3, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v4, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v8);

    v9 = (void *)MEMORY[0x24BEBD3A8];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF_AND_REMOVE_PASSWORDS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, &__block_literal_global_268_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_269);

}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke_2()
{
  NSObject *v0;
  uint8_t buf[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_INFO, "Disabling keychain sync.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE1A440], "setUserVisibleKeychainSyncEnabled:withCompletion:", 0, &__block_literal_global_272);
  SOSCCRemoveThisDeviceFromCircle();
}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke_271(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = v3;
      v6 = "setUserVisibleKeychainSyncEnabled failed with error: %{public}@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "setUserVisibleKeychainSyncEnabled completed successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

}

- (BOOL)canBeShownFromSuspendedState
{
  void *v2;
  char v3;

  +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet") ^ 1;

  return v3;
}

- (void)suspend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "suspend: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PSSpecifier *v28;
  PSSpecifier *voiceDialSpecifier;
  PSSpecifier *v30;
  PSSpecifier *voiceDialGroupSpecifier;
  PSSpecifier *v32;
  BOOL v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  int v98;
  void *v99;
  uint64_t v100;
  void *v101;
  int v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  BOOL v107;
  int v108;
  int v109;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  PSUIPasscodeLockController *v141;
  _QWORD v142[2];
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v133 = (int)*MEMORY[0x24BE756E0];
    +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPasscodeSet");

    if (MGGetBoolAnswer())
    {
      -[PSUIPasscodeLockController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("5.0~Passcode Lock Assistant"), self);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v134 = 0;
    }
    -[PSUIPasscodeLockController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Passcode Lock"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specifierForID:", CFSTR("PASSCODE_OFF"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5)
      v8 = CFSTR("PASSCODE_OFF");
    else
      v8 = CFSTR("PASSCODE_ON");
    PSUI_LocalizedStringForPasscodeLock(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75E18]);

    v11 = (uint64_t *)MEMORY[0x24BE75A18];
    if ((_DWORD)v5)
    {
      v12 = !-[PSUIPasscodeLockController isInternetReachable](self, "isInternetReachable")
         && -[PSUIPasscodeLockController shouldPresentAppleIDAuthenticationForTogglingPasscode](self, "shouldPresentAppleIDAuthenticationForTogglingPasscode");
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isPasscodeRequired");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !(v12 | v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v16, *v11);

      objc_msgSend(v6, "specifierForID:", CFSTR("PASSCODE_GROUP"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController updatePasscodeChangesGroupFooterToSpecifier:showDefault:](self, "updatePasscodeChangesGroupFooterToSpecifier:showDefault:", v17, v12 ^ 1);

      PSUILogForCategory(1uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !(v12 | v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v144 = v18;
        v145 = 2112;
        v146 = v19;
        v147 = 2112;
        v148 = v20;
        _os_log_impl(&dword_22E0C8000, v13, OS_LOG_TYPE_DEFAULT, "Passcode Group: Passcode On/Off enablement status [%@] | appleIDConnection [%@] | MC [%@]", buf, 0x20u);

      }
    }
    else
    {
      PSUILogForCategory(1uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E0C8000, v13, OS_LOG_TYPE_DEFAULT, "Passcode Group: Passcode not set", buf, 2u);
      }
    }

    -[PSUIPasscodeLockController getDTOSpecifiers](self, "getDTOSpecifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObjects:atIndexes:", v21, v23);

    }
    v131 = v21;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recoveryPasscodeExpiryDate");
    v25 = objc_claimAutoreleasedReturnValue();

    v130 = (void *)v25;
    if (v25)
    {
      objc_msgSend(v6, "specifierForID:", CFSTR("PASSCODE_GRACE_PERIOD_GROUP"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController addGracePeriodPasscodeRecoveryFooterToSpecifier:](self, "addGracePeriodPasscodeRecoveryFooterToSpecifier:", v26);
      objc_msgSend(v6, "specifierForID:", CFSTR("TURN_OFF_PASSCODE_RECOVERY"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v11);
    }
    else
    {
      objc_msgSend(v6, "specifierForID:", CFSTR("TURN_OFF_PASSCODE_RECOVERY"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "specifierForID:", CFSTR("PASSCODE_GRACE_PERIOD_GROUP"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v6, "removeObject:", v26);
      if (v27)
        objc_msgSend(v6, "removeObject:", v27);
    }

    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_DIAL"));
    v28 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceDialSpecifier = self->_voiceDialSpecifier;
    self->_voiceDialSpecifier = v28;

    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_DIAL_GROUP"));
    v30 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceDialGroupSpecifier = self->_voiceDialGroupSpecifier;
    self->_voiceDialGroupSpecifier = v30;

    v32 = self->_voiceDialSpecifier;
    v132 = v7;
    if (self->_voiceDialGroupSpecifier)
    {
      if (v32)
      {
        v33 = -[PSUIPasscodeLockController shouldShowVoiceDial](self, "shouldShowVoiceDial");
        v32 = self->_voiceDialSpecifier;
        if (!v33)
        {
          v142[0] = self->_voiceDialGroupSpecifier;
          v142[1] = v32;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeObjectsInArray:", v34);

          v32 = self->_voiceDialSpecifier;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSUIPasscodeLockController isVoiceDialRestricted](self, "isVoiceDialRestricted") ^ 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = self;
    v36 = *v11;
    -[PSSpecifier setProperty:forKey:](v32, "setProperty:forKey:", v35, *v11);

    v140 = v6;
    objc_msgSend(v6, "specifierForID:", CFSTR("ALLOW_ACCESS_WHEN_LOCKED"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPasscodeLockController _allowAccessWhenLockedSpecifierFooter](v141, "_allowAccessWhenLockedSpecifierFooter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = *MEMORY[0x24BE75A68];
    v129 = v37;
    objc_msgSend(v37, "setProperty:forKey:", v38);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x24BE639B0];
    v41 = objc_msgSend(v39, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639B0]);

    v42 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("NOTIFICATIONS_VIEW"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, v141, sel_setEnabledInLockScreen_specifier_, sel_enabledInLockScreen_, 0, 6, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "setProperty:forKey:", v40, CFSTR("MC_FEATURE"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v41 ^ 1u);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v44;
    objc_msgSend(v44, "setProperty:forKey:", v45, v36);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x24BE639B8];
    LODWORD(v43) = objc_msgSend(v46, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639B8]);

    v48 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("TODAY_VIEW"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, v141, sel_setEnabledInLockScreen_specifier_, sel_enabledInLockScreen_, 0, 6, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "setProperty:forKey:", v47, CFSTR("MC_FEATURE"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v43 ^ 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v50;
    objc_msgSend(v50, "setProperty:forKey:", v51, v36);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *MEMORY[0x24BE639A8];
    LODWORD(v43) = objc_msgSend(v52, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A8]);

    v54 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("CONTROL_CENTER"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v55, v141, sel_setEnabledInLockScreen_specifier_, sel_enabledInLockScreen_, 0, 6, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "setProperty:forKey:", v53, CFSTR("MC_FEATURE"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v43 ^ 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v56;
    objc_msgSend(v56, "setProperty:forKey:", v57, v36);

    v58 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("COMPLICATIONS"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v59, v141, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "setIdentifier:", CFSTR("COMPLICATIONS"));
    v61 = *MEMORY[0x24BE759E8];
    objc_msgSend(v60, "setProperty:forKey:", CFSTR("com.apple.chronod"), *MEMORY[0x24BE759E8]);
    v62 = *MEMORY[0x24BE75B50];
    objc_msgSend(v60, "setProperty:forKey:", CFSTR("showComplicationDataWhenPasscodeLocked"), *MEMORY[0x24BE75B50]);
    v63 = *MEMORY[0x24BE759E0];
    v64 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v60, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
    v136 = v60;
    v124 = *MEMORY[0x24BE75868];
    objc_msgSend(v60, "setProperty:forKey:", v64);
    v65 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("LIVE_ACTIVITIES"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v66, v141, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v67, "setIdentifier:", CFSTR("LIVE_ACTIVITIES"));
    objc_msgSend(v67, "setProperty:forKey:", CFSTR("com.apple.chronod"), v61);
    objc_msgSend(v67, "setProperty:forKey:", CFSTR("showLiveActivitiesWhenPasscodeLocked"), v62);
    v135 = v67;
    objc_msgSend(v67, "setProperty:forKey:", v64, v63);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = *MEMORY[0x24BE63AE8];
    LOBYTE(v64) = objc_msgSend(v68, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63AE8]);

    if ((v64 & 1) != 0)
    {
      v70 = 0;
    }
    else
    {
      objc_msgSend(getLockdownModeManagerClass(), "shared");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "enabled");

      v70 = v72 ^ 1u;
    }
    v73 = (void *)MEMORY[0x24BE75590];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("ACCESSORIES"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v74, v141, sel_setEnabledInLockScreenForUSB_specifier_, sel_enabledInLockScreenForUSB_, 0, 6, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "setProperty:forKey:", CFSTR("ACCESSORIES"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v75, "setProperty:forKey:", v69, CFSTR("MC_FEATURE"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v70);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v75;
    objc_msgSend(v75, "setProperty:forKey:", v76, v36);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v138, v139, v137, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
      objc_msgSend(v77, "addObject:", v136);
    if (_os_feature_enabled_impl())
      objc_msgSend(v77, "addObject:", v135);
    if (MGGetBoolAnswer())
    {
      objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "assistantIsEnabled");

      if (v79)
      {
        if (objc_msgSend(v134, "count"))
        {
          objc_msgSend(v77, "addObjectsFromArray:", v134);
          if (-[PSUIPasscodeLockController isAssistantRestricted](v141, "isAssistantRestricted"))
          {
            objc_msgSend(v77, "specifierForID:", CFSTR("ASSISTANT_WHILE_LOCKED"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v36);

          }
        }
      }
    }
    objc_msgSend(v140, "specifierForID:", CFSTR("RETURN_MISSED_CALLS_SWITCH"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v81, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v124);
    if (PSIsBundleIDHiddenDueToRestrictions())
      objc_msgSend(v140, "removeObject:", v81);
    v125 = v81;
    objc_msgSend(v140, "specifierForID:", CFSTR("ALLOW_ACCESS_WHEN_LOCKED"));
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v77, "count");
    v123 = (void *)v82;
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", objc_msgSend(v140, "indexOfObject:", v82) + 1, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "insertObjects:atIndexes:", v77, v84);

    objc_msgSend(v140, "specifierForID:", CFSTR("WALLET_SWITCH"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PSUIPasscodeLockController isWalletRestricted](v141, "isWalletRestricted"))
      objc_msgSend(v85, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v36);
    v122 = v85;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "valueRestrictionForFeature:", *MEMORY[0x24BE639D8]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v126 = v77;
    v121 = v87;
    if (v87)
      v88 = objc_msgSend(v87, "intValue");
    else
      v88 = -1;
    v141->_policyDictatedMaxFailedAttempts = v88;
    objc_msgSend(v140, "specifierForID:", CFSTR("WIPE_DEVICE"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = (void *)MGCopyAnswer();
    objc_msgSend(v89, "setProperty:forKey:");
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63910]);

    if (v91 == 2)
      v92 = 0;
    else
      v92 = v141->_policyDictatedMaxFailedAttempts >> 31;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v92);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setProperty:forKey:");
    if (v91 == 2)
      objc_msgSend(v89, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75DA0]);
    objc_msgSend(v140, "specifierForID:", CFSTR("WIPE_DEVICE_TEXT"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPasscodeLockController _makeWipeDeviceGroupFooter](v141, "_makeWipeDeviceGroupFooter");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setProperty:forKey:", v94, v128);

    objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "availabilityForListenerID:forService:", CFSTR("com.apple.Preferences"), 0);

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "isTelephonyDevice");

    objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "availabilityForListenerID:forService:", CFSTR("com.apple.Preferences"), 1);

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "supportsSMS");

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "deviceType");

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v105, "deviceType");

    v107 = 0;
    if (v96 == 1)
      v108 = 1;
    else
      v108 = v98;
    if (v100 == 1)
      v109 = 1;
    else
      v109 = v102;
    if (v108 == 1 && v109)
      v107 = v104 == 3 || v106 == 2;
    if ((PKIsUSBRestrictedModeDisabledByMobileAsset() & 1) == 0)
    {
      objc_msgSend(v140, "specifierForID:", CFSTR("RETURN_MISSED_CALLS_SWITCH"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "ps_insertObject:afterObject:", v127, v111);

    }
    if (!v107)
    {
      objc_msgSend(v140, "specifierForID:", CFSTR("REPLY_WITH_MESSAGE_SWITCH"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "removeObject:", v112);

    }
    objc_msgSend(v140, "specifierForID:", CFSTR("PASSCODE_REQ"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "values");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setProperty:forKey:", v114, CFSTR("gracePeriodValues"));

    objc_msgSend(v113, "titleDictionary");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setProperty:forKey:", v115, CFSTR("gracePeriodTitles"));

    objc_msgSend(v113, "shortTitleDictionary");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setProperty:forKey:", v116, CFSTR("gracePeriodShortTitles"));

    -[PSUIPasscodeLockController _updateGracePeriodForSpecifier:](v141, "_updateGracePeriodForSpecifier:", v113);
    -[PSUIPasscodeLockController disablePasscodeRequiredSpecifiers:](v141, "disablePasscodeRequiredSpecifiers:", v140);
    v117 = *(Class *)((char *)&v141->super.super.super.super.super.isa + v133);
    *(Class *)((char *)&v141->super.super.super.super.super.isa + v133) = (Class)v140;

    -[PSUIPasscodeLockController updateAutoUnlockSpecifiers](v141, "updateAutoUnlockSpecifiers");
    v3 = *(Class *)((char *)&v141->super.super.super.super.super.isa + v133);
  }
  return v3;
}

- (id)enabledInLockScreen:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("MC_FEATURE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "effectiveBoolValueForSetting:", v6);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (_DWORD)v4 == 1);
}

- (id)enabledInLockScreenForUSB:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[PSUIPasscodeLockController enabledInLockScreen:](self, "enabledInLockScreen:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setEnabledInLockScreen:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "propertyForKey:", CFSTR("MC_FEATURE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBoolValue:forSetting:", v8, v9);
}

- (void)setEnabledInLockScreenForUSB:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  unsigned int v11;
  char v12;
  char v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  _QWORD aBlock[4];
  id v34;
  id v35;
  PSUIPasscodeLockController *v36;
  id v37;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke;
  aBlock[3] = &unk_24F9E4278;
  v28 = &v37;
  objc_copyWeak(&v37, location);
  v8 = v6;
  v34 = v8;
  v9 = v7;
  v35 = v9;
  v36 = self;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = _AXSGetUSBRMDisablers();
  v12 = objc_msgSend(v8, "BOOLValue");
  if (v11)
    v13 = v12;
  else
    v13 = 1;
  if ((v13 & 1) != 0)
  {
    v10[2](v10);
  }
  else
  {
    if (__clz(__rbit32(v11)) + 1 == fls(v11))
    {
      if ((v11 & 1) != 0)
      {
        v14 = CFSTR("ACCESSORIES_OFF_WARNING_VO");
      }
      else
      {
        if ((v11 & 2) == 0)
          goto LABEL_18;
        v14 = CFSTR("ACCESSORIES_OFF_WARNING_SC");
      }
    }
    else
    {
      v14 = CFSTR("ACCESSORIES_OFF_WARNING_MULTI");
    }
    v15 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", &v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sf_isiPad");
    if (v17)
    {
      objc_msgSend(v9, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    PSUI_LocalizedStringForPasscodeLock(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v18, v19, objc_msgSend(v20, "sf_isiPad"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    v22 = (void *)MEMORY[0x24BEBD3A8];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_OFF"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_2;
    v31[3] = &unk_24F9E3EE0;
    v32 = v10;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 2, v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v24);

    v25 = (void *)MEMORY[0x24BEBD3A8];
    PSUI_LocalizedStringForPasscodeLock(CFSTR("CANCEL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_3;
    v29[3] = &unk_24F9E3B08;
    v29[4] = self;
    v30 = v9;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v27);

    -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
  }
LABEL_18:

  objc_destroyWeak(v28);
  objc_destroyWeak(location);

}

void __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setEnabledInLockScreen:specifier:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("ALLOW_ACCESS_WHEN_LOCKED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_allowAccessWhenLockedSpecifierFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v4, 1);
}

uint64_t __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return _AXSSetUSBRMDisablers();
}

uint64_t __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)disablePasscodeRequiredSpecifiers:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPasscodeSet");

  if ((v5 & 1) == 0)
  {
    v23[0] = CFSTR("PASSCODE_OFF");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = *MEMORY[0x24BE75A18];
      v12 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "containsObject:", v15);

          if ((v16 & 1) == 0)
            objc_msgSend(v14, "setProperty:forKey:", v12, v11);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v3 = v17;
  }

}

- (void)profileNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE63BA8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "intValue");
  if ((_DWORD)v4 != getpid())
    -[PSUIPasscodeLockController reloadSpecifiers](self, "reloadSpecifiers");

}

- (id)_allowAccessWhenLockedSpecifierFooter
{
  void *v2;
  char v3;
  int IsAvailable;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  id v14;
  id v15;

  objc_msgSend(getLockdownModeManagerClass(), "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  IsAvailable = PKNearFieldRadioIsAvailable();
  if ((PKIsUSBRestrictedModeDisabledByMobileAsset() & 1) != 0)
  {
    if (!IsAvailable)
    {
      v6 = 0;
      return v6;
    }
    if (PSIsPearlAvailable())
      v5 = CFSTR("WALLET_FOOTER_TEXT_FACEID");
    else
      v5 = CFSTR("WALLET_FOOTER_TEXT");
    PSUI_LocalizedStringForPasscodeLock(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v3 & 1) != 0)
    {
      v7 = CFSTR("ACCESSORIES_OFF_LOCKDOWN");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63AE8]);

      if (v9 == 2)
        v7 = CFSTR("ACCESSORIES_ON");
      else
        v7 = CFSTR("ACCESSORIES_OFF");
    }
    PSUI_LocalizedStringForPasscodeLock(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!IsAvailable)
      return v6;
  }
  objc_msgSend(MEMORY[0x24BE6E9D0], "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEffectivelyLocked");

  if (v11)
  {
    if (PSIsPearlAvailable())
      v12 = CFSTR("WALLET_LOCKED_FOOTER_TEXT_FACEID");
    else
      v12 = CFSTR("WALLET_LOCKED_FOOTER_TEXT_TOUCHID");
    PSUI_LocalizedStringForPasscodeLock(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\n%@"), v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v13;
    }
    v15 = v14;

    v6 = v15;
  }
  return v6;
}

- (void)updatePhoneAutounlockSection:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    -[PSUIPasscodeLockController updateAutoUnlockSpecifiers](self, "updateAutoUnlockSpecifiers");
  }
  else
  {
    -[PSUIPasscodeLockController autoUnlockSpecifiers](self, "autoUnlockSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[PSUIPasscodeLockController autoUnlockSpecifiers](self, "autoUnlockSpecifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v6, 1);

      -[PSUIPasscodeLockController setAutoUnlockSpecifiers:](self, "setAutoUnlockSpecifiers:", 0);
    }
  }
}

- (void)updateAutoUnlockSpecifiers
{
  NSObject *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(MEMORY[0x24BE900E0], "autoUnlockSupported");
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnrolledInFaceID");
    +[PSUIPasscodeAndBiometrics sharedInstance](PSUIPasscodeAndBiometrics, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109632;
    v15 = v4;
    v16 = 1024;
    v17 = v6;
    v18 = 1024;
    v19 = objc_msgSend(v7, "isUnlockEnabled");
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Auto unlock supported: %d, is enrolled in faceID: %d, phone unlock enabled: %d", buf, 0x14u);

  }
  if (objc_msgSend(MEMORY[0x24BE900E0], "autoUnlockSupported"))
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEnrolledInFaceID") & 1) != 0)
    {
      +[PSUIPasscodeAndBiometrics sharedInstance](PSUIPasscodeAndBiometrics, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isUnlockEnabled");

      if (v10)
      {
        -[PSUIPasscodeLockController autoUnlockManager](self, "autoUnlockManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke;
        v13[3] = &unk_24F9E46B8;
        v13[4] = self;
        objc_msgSend(v11, "eligibleAutoUnlockDevicesWithCompletionHandler:", v13);

        return;
      }
    }
    else
    {

    }
  }
  PSUILogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v12, OS_LOG_TYPE_DEFAULT, "Autounlock is not supported or FaceID is not setup.", buf, 2u);
  }

}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  __CFString *v41;
  __CFString *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD block[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v6)
  {
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  v46 = v6;
  PSUILogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v61 = v16;
    _os_log_impl(&dword_22E0C8000, v15, OS_LOG_TYPE_DEFAULT, "Found %@ autounlock device(s)", buf, 0xCu);

  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v5;
  v17 = 0x24BE75000uLL;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v52)
  {
    v18 = *(_QWORD *)v57;
    v51 = *MEMORY[0x24BE75948];
    v50 = *MEMORY[0x24BE75D28];
    v48 = *MEMORY[0x24BE75A18];
    v47 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v21 = *(void **)(v17 + 1424);
        objc_msgSend(v20, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, *(_QWORD *)(a1 + 32), sel_setAutoUnlockEnabled_specifier_, sel_autoUnlockEnabled_, 0, 6, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setProperty:forKey:", objc_opt_class(), v51);
        PSUILogForCategory(1uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "modelDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v17;
          v28 = a1;
          v29 = v7;
          v30 = objc_msgSend(v20, "unlockEnabled");
          v31 = objc_msgSend(v20, "supportsApproveWithWatch");
          *(_DWORD *)buf = 138413058;
          v61 = v25;
          v62 = 2112;
          v63 = v26;
          v64 = 1024;
          v65 = v30;
          v7 = v29;
          a1 = v28;
          v17 = v27;
          v18 = v47;
          v66 = 1024;
          v67 = v31;
          _os_log_impl(&dword_22E0C8000, v24, OS_LOG_TYPE_DEFAULT, "PAU device name: %@, model description: %@, unlock enabled: %d, software supported: %d", buf, 0x22u);

        }
        if (objc_msgSend(v20, "supportsApproveWithWatch"))
        {
          objc_msgSend(v20, "modelDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "length");

          if (v33)
          {
            objc_msgSend(v20, "modelDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setProperty:forKey:", v34, v50);

          }
        }
        else
        {
          PSUI_LocalizedStringForPasscodeLock(CFSTR("UNSUPPORTED_WATCH_SOFTWARE"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setProperty:forKey:", v35, v50);

          objc_msgSend(v23, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v48);
        }
        objc_msgSend(v20, "uniqueID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setIdentifier:", v36);

        objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, CFSTR("PSUIAutoUnlockDeviceKey"));
        objc_msgSend(v7, "addObject:", v23);

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v52);
  }

  if (objc_msgSend(v7, "count"))
  {
    v37 = *(void **)(v17 + 1424);
    PSUI_LocalizedStringForPasscodeLock(CFSTR("USE_APPLE_WATCH_TO_UNLOCK"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "groupSpecifierWithID:name:", CFSTR("AUTO_UNLOCK_DEVICES_GROUP"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "insertObject:atIndex:", v39, 0);
    LODWORD(v38) = objc_msgSend(*(id *)(a1 + 32), "useAlternateFooterTextForPAU");
    v40 = objc_msgSend(MEMORY[0x24BE094E8], "assistantEnabled");
    if ((_DWORD)v38)
    {
      if (v40)
        v41 = CFSTR("PHONE_AUTO_UNLOCK_FOOTER_PERIOCULAR_ASSISTANT_ENABLED");
      else
        v41 = CFSTR("PHONE_AUTO_UNLOCK_FOOTER_PERIOCULAR_ASSISTANT_DISABLED");
      PSUI_LocalizedStringForPasscodePeriocular(v41);
      v43 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v40)
        v42 = CFSTR("PHONE_AUTO_UNLOCK_FOOTER_ASSISTANT_ENABLED");
      else
        v42 = CFSTR("PHONE_AUTO_UNLOCK_FOOTER_ASSISTANT_DISABLED");
      PSUI_LocalizedStringForPasscodeLock(v42);
      v43 = objc_claimAutoreleasedReturnValue();
    }
    v44 = (void *)v43;
    objc_msgSend(v39, "setProperty:forKey:", v43, *MEMORY[0x24BE75A68]);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_399;
  block[3] = &unk_24F9E3E90;
  objc_copyWeak(&v55, (id *)buf);
  v54 = v7;
  v45 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v55);
  objc_destroyWeak((id *)buf);

}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_399(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "autoUnlockSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 != objc_msgSend(*(id *)(a1 + 32), "count");

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "autoUnlockSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeContiguousSpecifiers:animated:", v8, v6);

  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "setAutoUnlockSpecifiers:", v9);

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "autoUnlockSpecifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "specifierForID:", CFSTR("PASSCODE_REQ"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertContiguousSpecifiers:afterSpecifier:animated:", v11, v13, v6);

}

- (BOOL)useAlternateFooterTextForPAU
{
  int v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPeriocularEnrollmentSupported");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)autoUnlockEnabled:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PSUIAutoUnlockDeviceKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "unlockEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAutoUnlockEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  PSUIPasscodeLockController *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PSUIAutoUnlockDeviceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "BOOLValue");

  if (v9)
  {
    -[PSUIPasscodeLockController showAlertForPhoneAutoUnlockEnablementOfDevice:ofSpecifier:](self, "showAlertForPhoneAutoUnlockEnablementOfDevice:ofSpecifier:", v8, v6);
  }
  else
  {
    PSUILogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_22E0C8000, v10, OS_LOG_TYPE_DEFAULT, "disabling autounlock device: %@", buf, 0xCu);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75998]);
    -[PSUIPasscodeLockController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v6, 1);
    -[PSUIPasscodeLockController autoUnlockManager](self, "autoUnlockManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke;
    v12[3] = &unk_24F9E46E0;
    v13 = v8;
    v14 = self;
    objc_msgSend(v11, "disableAutoUnlockForDevice:completionHandler:", v13, v12);

  }
}

void __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    PSUILogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  }
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "autounlock device disabled: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "updateAutoUnlockSpecifiers");
}

- (void)updateAutoUnlockDevicewithDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__PSUIPasscodeLockController_updateAutoUnlockDevicewithDevice___block_invoke;
  v6[3] = &unk_24F9E39A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __63__PSUIPasscodeLockController_updateAutoUnlockDevicewithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierForID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PSUILogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Updating auto unlock specifier for device: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("PSUIAutoUnlockDeviceKey"));
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v4, 1);
  }

}

- (void)showAlertForPhoneAutoUnlockEnablementOfDevice:(id)a3 ofSpecifier:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  PSUIPasscodeLockController *v35;
  id v36;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPasscodeLockController specifierForID:](self, "specifierForID:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75998]);
  -[PSUIPasscodeLockController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v7, 1);
  v9 = (void *)MEMORY[0x24BEBD3B0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("PHONE_AUTO_UNLOCK_ALERT_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("PHONE_AUTO_UNLOCK_ALERT_BODY"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v13, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("CANCEL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke;
  v33[3] = &unk_24F9E3B30;
  v22 = v6;
  v34 = v22;
  v35 = self;
  v23 = v7;
  v36 = v23;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v24);

  v25 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("TURN_ON"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke_409;
  v30[3] = &unk_24F9E3B30;
  v30[4] = self;
  v31 = v22;
  v32 = v23;
  v27 = v23;
  v28 = v22;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 0, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v29);
  objc_msgSend(v18, "setPreferredAction:", v29);
  -[PSUIPasscodeLockController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

}

uint64_t __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled enable phone auto unlock with device: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "autoUnlockManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declinedToEnablePhoneAutoUnlock");

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 48), 1);
}

uint64_t __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke_409(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableAutoUnlockForDevice:ofSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)enableAutoUnlockForDevice:(id)a3 ofSpecifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "enabling autounlock device: %@", (uint8_t *)&v13, 0xCu);
  }

  -[PSUIPasscodeLockController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSUIPasscodeLockController enableAutoUnlockForDevice:ofSpecifier:].cold.2();

  }
  -[PSUIPasscodeLockController specifier](self, "specifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75CC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PSUIPasscodeLockController enableAutoUnlockForDevice:ofSpecifier:].cold.1();

  }
  -[PSUIPasscodeLockController autoUnlockManager](self, "autoUnlockManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enableAutoUnlockWithDevice:passcode:", v5, v10);

}

- (void)presentAutoUnlockEnableFailureAlertWithDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  PSUIPasscodeLockController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke;
  block[3] = &unk_24F9E4530;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v32 = (uint64_t)v3;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Presenting autounlock enable failure alert of device: %@, with error: %@", buf, 0x16u);
  }

  objc_msgSend(a1[5], "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE90218]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PSUI_LocalizedStringForPasscodeLock(CFSTR("WATCH_AUTO_UNLOCK_FAILED_BODY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(a1[6], "errorActionWithAutoUnlockError:", a1[5], v20);
  objc_initWeak(&location, a1[6]);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    PSUI_LocalizedStringForPasscodeLock(CFSTR("OPEN"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &__block_literal_global_416;
  }
  else
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_412;
    aBlock[3] = &unk_24F9E4708;
    v26 = a1[4];
    v12 = a1[5];
    v13 = a1[6];
    v27 = v12;
    v28 = v13;
    objc_copyWeak(&v29, &location);
    v11 = _Block_copy(aBlock);
    PSUI_LocalizedStringForPasscodeLock(CFSTR("TRY_AGAIN"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v29);

  }
  PSUILogForCategory(1uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v32 = v8;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v7;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_22E0C8000, v14, OS_LOG_TYPE_DEFAULT, "Presenting autounlock enable error of action type:%lu with title: %@, body: %@, actionTitle: %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v21, v7, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeLock(CFSTR("CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_420;
  v22[3] = &unk_24F9E3B08;
  v23 = a1[5];
  v24 = a1[4];
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v10, 0, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v18);
  objc_msgSend(v15, "addAction:", v19);
  objc_msgSend(v15, "setPreferredAction:", v19);
  objc_msgSend(a1[6], "presentViewController:animated:completion:", v15, 1, 0);

  objc_destroyWeak(&location);
}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_412(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Retry enable auto unlock with device: %@, of previous error: %@", (uint8_t *)&v10, 0x16u);
  }

  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75998]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v7, 1);

  v9 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v9, "enableAutoUnlockForDevice:ofSpecifier:", *(_QWORD *)(a1 + 32), v7);

}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_415()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_DEFAULT, "Switch to watch app to setup watch for auto unlock", v3, 2u);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=PASSCODE_ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v2, 0);

}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_420(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Ignored auto unlock enable error alert: %@ of device: %@", (uint8_t *)&v5, 0x16u);
  }

}

- (unint64_t)errorActionWithAutoUnlockError:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "code");
  return (unint64_t)(v3 - 108) <= 0x32 && ((1 << (v3 - 108)) & 0x4000000000801) != 0;
}

- (void)manager:(id)a3 enablingLockedDevice:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "autounlock device requires unlock: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)manager:(id)a3 didEnableDevice:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "autounlock device enabled: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PSUIPasscodeLockController updateAutoUnlockDevicewithDevice:](self, "updateAutoUnlockDevicewithDevice:", v5);
}

- (void)manager:(id)a3 failedToEnableDevice:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a4;
  v8 = a5;
  PSUILogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PSUIPasscodeLockController manager:failedToEnableDevice:error:].cold.1();

  -[PSUIPasscodeLockController updateAutoUnlockDevicewithDevice:](self, "updateAutoUnlockDevicewithDevice:", v7);
  -[PSUIPasscodeLockController presentAutoUnlockEnableFailureAlertWithDevice:withError:](self, "presentAutoUnlockEnableFailureAlertWithDevice:withError:", v7, v8);

}

- (BOOL)canUnlockWatch
{
  return self->_canUnlockWatch;
}

- (void)setCanUnlockWatch:(BOOL)a3
{
  self->_canUnlockWatch = a3;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (SFAutoUnlockManager)autoUnlockManager
{
  return self->_autoUnlockManager;
}

- (void)setAutoUnlockManager:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnlockManager, a3);
}

- (NSArray)autoUnlockSpecifiers
{
  return self->_autoUnlockSpecifiers;
}

- (void)setAutoUnlockSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnlockSpecifiers, a3);
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
  objc_storeStrong((id *)&self->_dtoController, a3);
}

- (BOOL)isFindMyEnabled
{
  return self->_isFindMyEnabled;
}

- (void)setIsFindMyEnabled:(BOOL)a3
{
  self->_isFindMyEnabled = a3;
}

- (BOOL)isObservingDTOStatusChange
{
  return self->_isObservingDTOStatusChange;
}

- (void)setIsObservingDTOStatusChange:(BOOL)a3
{
  self->_isObservingDTOStatusChange = a3;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pathMonitor, a3);
}

- (BOOL)isInternetReachable
{
  return self->_isInternetReachable;
}

- (void)setIsInternetReachable:(BOOL)a3
{
  self->_isInternetReachable = a3;
}

- (LAPasscodeChangeService)_passcodeChangeService
{
  return self->__passcodeChangeService;
}

- (void)set_passcodeChangeService:(id)a3
{
  objc_storeStrong((id *)&self->__passcodeChangeService, a3);
}

- (LAPasscodeRemovalService)_passcodeRemovalService
{
  return self->__passcodeRemovalService;
}

- (void)set_passcodeRemovalService:(id)a3
{
  objc_storeStrong((id *)&self->__passcodeRemovalService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__passcodeRemovalService, 0);
  objc_storeStrong((id *)&self->__passcodeChangeService, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->_autoUnlockSpecifiers, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_voiceDialGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceDialSpecifier, 0);
}

- (void)turnOffPasscodeAlertMessage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Turn Off Passcode: Alert message: Protected apps description should be the default description!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Turn Off Passcode: Not turning off as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Turn Off Passcode: Not proceeding - missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_passcodeRemovalService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_22E0C8000, a3, v5, "Error encountered during passcode removal operation (%{public}@): %{public}@", v6);

  OUTLINED_FUNCTION_7();
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_154_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_passcodeChangeService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_22E0C8000, a3, v5, "Error encountered during passcode change operation (%{public}@): %{public}@", v6);

  OUTLINED_FUNCTION_7();
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_155_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Error encountered during passcode operation (extraction): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)setGraceValue:specifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "setGraceValue: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setGraceValue:specifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "setGraceValue: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Grace period clear recovery passcode failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

void __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Failed to open passcode support url.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "RecoveryExpiryDate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_22E0C8000, v0, (uint64_t)v0, "Now [%@] is past RecoveryExpiryDate [%@]", v1);
  OUTLINED_FUNCTION_2_1();
}

void __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Failed to update changes as missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Performing preliminary checks - No instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)voiceDial:.cold.1()
{
  NSLog(CFSTR("The \"MCFeatureAllowVoiceDialing\" profile feature has no default value, please file a radar."));
  __assert_rtn("-[PSUIPasscodeLockController voiceDial:]", "PSUIPasscodeLockController.m", 1066, "MCRestrictedBoolNoData != value");
}

- (void)wallet:.cold.1()
{
  NSLog(CFSTR("The \"MCFeatureCardsWhileLockedAllowed\" profile feature has no default value, please file a radar."));
  __assert_rtn("-[PSUIPasscodeLockController wallet:]", "PSUIPasscodeLockController.m", 1160, "MCRestrictedBoolNoData != value");
}

- (void)_didUpdatePasscode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "_didUpdatePasscode: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Error when querying autounlock devices: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

void __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3_0(&dword_22E0C8000, a3, (uint64_t)a3, "Error when disabling autounlock device: %@, error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)enableAutoUnlockForDevice:ofSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "enableAutoUnlockForDevice: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)enableAutoUnlockForDevice:ofSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "enableAutoUnlockForDevice: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)manager:failedToEnableDevice:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_22E0C8000, v0, (uint64_t)v0, "failed to enable autounlock device: %@, with error: %@", v1);
  OUTLINED_FUNCTION_2_1();
}

@end
