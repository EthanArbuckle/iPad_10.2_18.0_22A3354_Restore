@implementation DBSSettingsController

+ (id)BOOLeanCapabilitiesToTest
{
  uint64_t v2;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE75C28];
  v4[0] = *MEMORY[0x24BE75BE0];
  v4[1] = v2;
  v4[2] = *MEMORY[0x24BE75A00];
  v4[3] = CFSTR("hall-effect-sensor");
  v4[4] = CFSTR("ambient-light-sensor");
  v4[5] = CFSTR("ipad");
  v4[6] = CFSTR("j8/Omm6s1lsmTDFsXjsBfA");
  v4[7] = CFSTR("DeviceSupportsEnhancedMultitasking");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (DBSSettingsController)init
{
  DBSSettingsController *v2;
  __CFNotificationCenter *LocalCenter;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *autoLockValues;
  void *v42;
  uint64_t v43;
  NSArray *v44;
  uint64_t v45;
  NSDictionary *autoLockTitleDictionary;
  uint64_t v47;
  NSMutableDictionary *localizedAutoLockTitleDictionary;
  uint64_t v49;
  UISUserInterfaceStyleMode *styleMode;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  objc_super v65;

  v65.receiver = self;
  v65.super_class = (Class)DBSSettingsController;
  v2 = -[DBSSettingsController init](&v65, sel_init);
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)apple_numbers_changed_notification, (CFStringRef)*MEMORY[0x24BDBD3F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionRestrictionChangedNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);
    v62 = v4;
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification_, DBSExternalDisplayManagerCurrentModeDidChange[0], 0);
    if (PSGetCapabilityBoolAnswer())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HasSeenACaseLatchCoverChanged, CFSTR("com.apple.springboard.HasSeenACaseLatchCoverNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v63 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 120);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 180);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 240);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 300);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 600);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 900);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v63, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, v14, 0);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v16, "setSecond:", 30);
    v61 = v16;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v16, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v17);

    v18 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v18, "setMinute:", 1);
    v60 = v18;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v18, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v19);

    v20 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v20, "setMinute:", 2);
    v59 = v20;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v20, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v21);

    v22 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v22, "setMinute:", 3);
    v58 = v22;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v22, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v23);

    v24 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v24, "setMinute:", 4);
    v57 = v24;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v24, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v25);

    v26 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v26, "setMinute:", 5);
    v56 = v26;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v26, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v27);

    v28 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v28, "setMinute:", 10);
    v55 = v28;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v28, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v29);

    v30 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v30, "setMinute:", 15);
    v54 = v30;
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v30, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v31);

    DBS_LocalizedStringForDisplays(CFSTR("NEVER"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v32);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v33, "sf_isiPad");

    v34 = objc_alloc(MEMORY[0x24BDBCE30]);
    if ((_DWORD)v14)
    {
      objc_msgSend(v64, "objectAtIndex:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v34, "initWithObjects:", v35, v36, v37, v38, v39, 0);
      autoLockValues = v2->_autoLockValues;
      v2->_autoLockValues = (NSArray *)v40;
    }
    else
    {
      objc_msgSend(v64, "objectAtIndex:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 5);
      autoLockValues = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", 8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v34, "initWithObjects:", v35, v36, v37, v38, v39, autoLockValues, v42, 0);
      v44 = v2->_autoLockValues;
      v2->_autoLockValues = (NSArray *)v43;

    }
    v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v15, v64);
    autoLockTitleDictionary = v2->_autoLockTitleDictionary;
    v2->_autoLockTitleDictionary = (NSDictionary *)v45;

    v47 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v2->_autoLockTitleDictionary);
    localizedAutoLockTitleDictionary = v2->_localizedAutoLockTitleDictionary;
    v2->_localizedAutoLockTitleDictionary = (NSMutableDictionary *)v47;

    v49 = objc_msgSend(objc_alloc(MEMORY[0x24BEBEC58]), "initWithDelegate:", v2);
    styleMode = v2->__styleMode;
    v2->__styleMode = (UISUserInterfaceStyleMode *)v49;

    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_isReferenceLimited);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObserver:forKeyPath:options:context:", v2, v52, 1, 0);

  }
  return v2;
}

- (DBSSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  DBSSettingsController *v8;
  CBClient *v9;
  CBClient *brightnessClient;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  SBSExternalDisplayService *displayService;
  id *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DBSSettingsController;
  v8 = -[DBSSettingsController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = v8->__brightnessClient;
    v8->__brightnessClient = v9;

    objc_initWeak(&location, v8);
    -[DBSSettingsController _brightnessClient](v8, "_brightnessClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blueLightClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __48__DBSSettingsController_initWithNibName_bundle___block_invoke;
    v22[3] = &unk_24F025D30;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v12, "setStatusNotificationBlock:", v22);

    v14 = objc_opt_new();
    displayService = v8->_displayService;
    v8->_displayService = (SBSExternalDisplayService *)v14;

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __48__DBSSettingsController_initWithNibName_bundle___block_invoke_2;
    v20[3] = &unk_24F025E70;
    v16 = v8;
    v21 = v16;
    objc_msgSend(v16, "updateExternalDisplayInfoWithCompletionHandler:", v20);
    v17 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v18 = v16[175];
    v16[175] = v17;

    objc_msgSend(v16[175], "setTimeStyle:", 1);
    objc_msgSend(v16[175], "setDateStyle:", 0);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __48__DBSSettingsController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleBlueLightStatusChanged:", a2);

}

void __48__DBSSettingsController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "externalDisplayInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = DBSChamoisEnabled();

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "insertArrangementSpecifier");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSSettingsController;
  -[DBSSettingsController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[DBSSettingsController updateAutoLockSpecifier](self, "updateAutoLockSpecifier");
  -[DBSSettingsController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("APPEARANCE_OPTIONS"));
  -[DBSSettingsController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("ALWAYS_ON"));
  -[DBSSettingsController updateReferenceDependentUIElements](self, "updateReferenceDependentUIElements");
  objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capabilityBoolAnswer:", *MEMORY[0x24BE75BE0]);

  if (v5)
    -[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:](self, "_reloadBlueLightSpecifiers:reloadUI:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DBSSettingsController;
  -[DBSSettingsController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DISPLAY_AND_BRIGHTNESS"), 0, CFSTR("Display"), v6, v8);

    -[DBSSettingsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v9, MEMORY[0x24BDBD1A8], v4);
  }

}

- (void)updateReferenceDependentUIElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[DBSSettingsController specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("BRIGHTNESS"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[DBSSettingsController specifiers](self, "specifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifierForID:", CFSTR("WHITE_BALANCE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSSettingsController specifiers](self, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifierForID:", CFSTR("ADVANCED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReference");

  v10 = *MEMORY[0x24BE75A18];
  if (v9)
    v11 = MEMORY[0x24BDBD1C0];
  else
    v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A18]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("brightnessLimited"));

  -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v15);
  -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v5);
  if (v7)
    -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DBSSettingsController;
  -[DBSSettingsController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("APPEARANCE_OPTIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[DBSSettingsController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("APPEARANCE_OPTIONS"));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[DBSSettingsController _brightnessClient](self, "_brightnessClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blueLightClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatusNotificationBlock:", 0);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BDBD3F0], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.HasSeenACaseLatchCoverNotification"), 0);
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isReferenceLimited);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forKeyPath:", self, v9);

  v10.receiver = self;
  v10.super_class = (Class)DBSSettingsController;
  -[DBSSettingsController dealloc](&v10, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int IsAutomatic;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void (**v41)(_QWORD);
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t);
  void *v60;
  DBSSettingsController *v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[4];

  v64[3] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[DBSSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Display"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_UIUpdatedVisualStyleEnabled() & 1) != 0)
  {
    -[DBSSettingsController _styleMode](self, "_styleMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeValue");
    IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

    if (!IsAutomatic)
      goto LABEL_7;
    -[DBSSettingsController _deviceAppearanceScheduleSpecifier](self, "_deviceAppearanceScheduleSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("APPEARANCE_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ps_addSpecifier:toGroup:", v8, v9);
  }
  else
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("APPEARANCE_GROUP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("DEVICE_APPEARANCE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("AUTOMATIC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v8;
    v64[1] = v9;
    v64[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsInArray:", v11);

  }
LABEL_7:
  objc_msgSend(v5, "specifierForID:", CFSTR("AUTOLOCK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DBSSettingsController shouldShowAutoLock](self, "shouldShowAutoLock"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sf_isiPad");

    v15 = (_QWORD *)MEMORY[0x24BE759E0];
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 300);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProperty:forKey:", v16, *v15);

    }
    if (_AXSAttentionAwarenessFeaturesEnabled())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProperty:forKey:", v17, *v15);

      PSLocalizablePearlStringForKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProperty:forKey:", v18, *MEMORY[0x24BE75CD0]);

    }
  }
  else
  {
    objc_msgSend(v5, "removeObject:", v12);
  }
  v19 = -[DBSSettingsController shouldShowCaseLockOption](self, "shouldShowCaseLockOption");
  v20 = (_QWORD *)MEMORY[0x24BE75A68];
  if (v19)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("LOCK_WAKE_GROUP"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSSettingsController lockGroupFooter](self, "lockGroupFooter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setProperty:forKey:", v22, *v20);

  }
  else
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("SMART_CASE_LOCK_SPEC"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v21);
  }

  if (-[DBSSettingsController shouldShowAlwaysOn](self, "shouldShowAlwaysOn"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ALWAYS_ON_GROUP"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", CFSTR("j8/Omm6s1lsmTDFsXjsBfA"), *MEMORY[0x24BE75C30]);
    DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_DESCRIPTION"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v24, *v20);

    DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_DISPLAY"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[DBSAlwaysOnViewController alwaysOnSpecifierNamed:](DBSAlwaysOnViewController, "alwaysOnSpecifierNamed:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setProperty:forKey:", CFSTR("ALWAYS_ON"), *MEMORY[0x24BE75AC0]);
    v27 = objc_msgSend(v5, "indexOfSpecifierWithID:", CFSTR("LOCK_WAKE_GROUP"));
    v28 = v5;
    if (objc_msgSend(v28, "count") <= v27
      || (objc_msgSend(v28, "objectAtIndexedSubscript:", v27),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v30 = objc_msgSend(v29, "cellType"),
          v29,
          v30)
      || objc_msgSend(v28, "count") - 1 == v27)
    {
      v31 = objc_msgSend(v28, "count");
    }
    else
    {
      v54 = v27 + 1;
      do
      {
        v31 = v54;
        if (v54 >= objc_msgSend(v28, "count"))
          break;
        objc_msgSend(v28, "objectAtIndexedSubscript:", v31);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "cellType");

        v54 = v31 + 1;
      }
      while (v56);
    }

    v63[0] = v23;
    v63[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", v31, objc_msgSend(v32, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "insertObjects:atIndexes:", v32, v33);

  }
  v34 = objc_msgSend(v5, "indexOfSpecifierWithID:", CFSTR("LOCK_WAKE_GROUP"));
  v35 = v5;
  if (objc_msgSend(v35, "count") > v34)
  {
    objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "cellType");

    if (!v37)
    {
      if (objc_msgSend(v35, "count") - 1 == v34)
      {

      }
      else
      {
        objc_msgSend(v35, "objectAtIndexedSubscript:", v34 + 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "cellType");

        if (v53)
          goto LABEL_25;
      }
      objc_msgSend(v35, "removeObjectAtIndex:", v34);
      goto LABEL_25;
    }
  }

LABEL_25:
  v38 = (void *)objc_opt_new();
  -[DBSSettingsController set_zoomAndProSpecifierVendor:](self, "set_zoomAndProSpecifierVendor:", v38);

  -[DBSSettingsController _zoomAndProSpecifierVendor](self, "_zoomAndProSpecifierVendor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDelegate:", self);

  v57 = MEMORY[0x24BDAC760];
  v58 = 3221225472;
  v59 = __35__DBSSettingsController_specifiers__block_invoke;
  v60 = &unk_24F025DA8;
  v61 = self;
  v40 = v35;
  v62 = v40;
  v41 = (void (**)(_QWORD))MEMORY[0x22E2A2908](&v57);
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager", v57, v58, v59, v60, v61);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "externalDisplayAvailable");

  if (v43)
  {
    -[DBSSettingsController connectedDisplaySpecifiers](self, "connectedDisplaySpecifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", objc_msgSend(v40, "indexOfSpecifierWithID:", CFSTR("BOLD_TEXT")) + 1, objc_msgSend(v44, "count"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSSettingsController connectedDisplaySpecifiers](self, "connectedDisplaySpecifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "insertObjects:atIndexes:", v46, v45);

    if ((DBSChamoisEnabled() & 1) == 0)
      v41[2](v41);

  }
  else
  {
    v41[2](v41);
  }
  -[DBSSettingsController _updateAutoLockSpecifiers:](self, "_updateAutoLockSpecifiers:", v40);
  -[DBSSettingsController _localizeAutoLockTitlesWithSpecifiers:](self, "_localizeAutoLockTitlesWithSpecifiers:", v40);
  objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "capabilityBoolAnswer:", *MEMORY[0x24BE75BE0]);

  if (v48)
    -[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:](self, "_reloadBlueLightSpecifiers:reloadUI:", v40, 0);
  v49 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v40;
  v50 = v40;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

void __35__DBSSettingsController_specifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));

  +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainDisplayBrightnessSpecifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", objc_msgSend(*(id *)(a1 + 40), "indexOfSpecifierWithID:", CFSTR("BOLD_TEXT")) + 1, objc_msgSend(v10, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "insertObjects:atIndexes:", v10, v4);
  objc_msgSend(*(id *)(a1 + 32), "_zoomAndProSpecifierVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_zoomAndProSpecifierVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBSSettingsController;
  -[DBSSettingsController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "setSelectionStyle:", 0);
  }
  return v5;
}

- (id)lockGroupFooter
{
  _BOOL4 v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  if (PSGetCapabilityBoolAnswer())
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("SBHasSeenACaseLatchCoverOnce"), CFSTR("com.apple.springboard"), 0) != 0;
  else
    v2 = 0;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  if (v2 && v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    DBS_LocalizedStringForDisplays(CFSTR("SMART_CASE_LOCK_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForDisplays(CFSTR("AUTOLOCK_LPM_FOOTER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n\n%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v2)
    {
      v9 = CFSTR("SMART_CASE_LOCK_FOOTER");
    }
    else
    {
      if (!v4)
      {
        v8 = 0;
        return v8;
      }
      v9 = CFSTR("AUTOLOCK_LPM_FOOTER");
    }
    DBS_LocalizedStringForDisplays(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)shouldShowAutoLock
{
  return PSIsInEDUMode() ^ 1;
}

- (BOOL)shouldShowCaseLockOption
{
  int v2;

  if ((PSIsInEDUMode() & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = PSGetCapabilityBoolAnswer();
    if (v2)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
      LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("SBHasSeenACaseLatchCoverOnce"), CFSTR("com.apple.springboard"), 0) != 0;
    }
  }
  return v2;
}

- (BOOL)shouldShowAlwaysOn
{
  int v2;

  v2 = PSGetCapabilityBoolAnswer();
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (id)screenLock:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE637F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "intValue") == 0x7FFFFFFF)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)setScreenLock:(id)a3 specifier:(id)a4
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "intValue");
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v8 || v4 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x7FFFFFFFLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forSetting:", v7, *MEMORY[0x24BE637F8]);

  }
  else
  {
    objc_msgSend(v5, "setValue:forSetting:", v8, *MEMORY[0x24BE637F8]);
  }

}

- (void)_updateAutoLockSpecifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE637F8];
  objc_msgSend(v4, "effectiveParametersForValueSetting:", *MEMORY[0x24BE637F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE63BB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "intValue");
  else
    v8 = -1;
  objc_msgSend(v35, "specifierForID:", CFSTR("AUTOLOCK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "specifierForID:", CFSTR("LOCK_WAKE_GROUP"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLowPowerModeEnabled");

  v13 = *MEMORY[0x24BE75A18];
  if (v12)
    v14 = &unk_24F02FA50;
  else
    v14 = &unk_24F02FA68;
  objc_msgSend(v9, "setProperty:forKey:", v14, *MEMORY[0x24BE75A18]);
  -[DBSSettingsController lockGroupFooter](self, "lockGroupFooter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v10, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);
  else
    objc_msgSend(v10, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
  if (v8 == -1)
  {
    objc_msgSend(v9, "setValues:", self->_autoLockValues);
    objc_msgSend(v9, "setTitleDictionary:", self->_localizedAutoLockTitleDictionary);
  }
  else
  {
    v34 = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_autoLockValues);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isValueSettingLockedDownByRestrictions:", v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18 ^ 1u);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v19, v13);

    v20 = objc_msgSend(v16, "count");
    if (v20 - 1 >= 0)
    {
      v21 = v20;
      do
      {
        objc_msgSend(v16, "objectAtIndex:", --v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");
        if (v23 > v8 || v23 == -1)
          objc_msgSend(v16, "removeObjectAtIndex:", v21);

      }
      while (v21 > 0);
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "effectiveValueForSetting:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "intValue");

    if ((_DWORD)v27)
      v28 = (_DWORD)v27 == 0x7FFFFFFF;
    else
      v28 = 1;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "containsObject:", v29) & 1) == 0)
      {
        objc_msgSend(v16, "addObject:", v29);
        objc_msgSend(v16, "sortUsingSelector:", sel_compare_);
        -[NSMutableDictionary objectForKey:](self->_localizedAutoLockTitleDictionary, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          v31 = objc_alloc_init(MEMORY[0x24BDBCE68]);
          v32 = v31;
          if ((int)v27 > 59)
            objc_msgSend(v31, "setMinute:", v27 / 0x3CuLL);
          else
            objc_msgSend(v31, "setSecond:", (int)v27);
          objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v32, 3);
          v33 = v32;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](self->_localizedAutoLockTitleDictionary, "setObject:forKey:", v30, v29);

        }
      }

    }
    objc_msgSend(v9, "setValues:", v16);
    objc_msgSend(v9, "setTitleDictionary:", self->_localizedAutoLockTitleDictionary);

    v10 = v34;
  }

}

- (void)updateAutoLockSpecifier
{
  id v3;

  -[DBSSettingsController specifiers](self, "specifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSSettingsController _updateAutoLockSpecifiers:](self, "_updateAutoLockSpecifiers:", v3);

}

- (void)_localizeAutoLockTitlesWithSpecifiers:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *localizedAutoLockTitleDictionary;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "specifierForID:", CFSTR("AUTOLOCK"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v22 = (void *)v4;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSMutableDictionary allKeys](self->_localizedAutoLockTitleDictionary, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v7)
      goto LABEL_21;
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = (int)objc_msgSend(v11, "intValue");
        -[NSDictionary objectForKey:](self->_autoLockTitleDictionary, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCE68]);
          v16 = v17;
          if ((int)v12 > 59)
            objc_msgSend(v17, "setMinute:", v12 / 0x3C);
          else
            objc_msgSend(v17, "setSecond:", v12);
          objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v16, 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          localizedAutoLockTitleDictionary = self->_localizedAutoLockTitleDictionary;
          v20 = v14;
          goto LABEL_18;
        }
        v14 = (void *)v13;
        if ((v12 & 0x80000000) != 0)
        {
          v18 = self->_localizedAutoLockTitleDictionary;
          DBS_LocalizedStringForDisplays(CFSTR("NEVER"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          localizedAutoLockTitleDictionary = v18;
          v20 = v16;
LABEL_18:
          -[NSMutableDictionary setObject:forKey:](localizedAutoLockTitleDictionary, "setObject:forKey:", v20, v11);
          goto LABEL_19;
        }
        v15 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        v16 = v15;
        if (v12 > 0x3B)
          objc_msgSend(v15, "setMinute:", v12 / 0x3C);
        else
          objc_msgSend(v15, "setSecond:", v12);
        objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v16, 3);
        v21 = objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKey:](self->_localizedAutoLockTitleDictionary, "setObject:forKey:", v21, v11);
        v14 = (void *)v21;
LABEL_19:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v8)
      {
LABEL_21:

        v5 = v22;
        objc_msgSend(v22, "setTitleDictionary:", self->_localizedAutoLockTitleDictionary);
        break;
      }
    }
  }

}

- (void)_localizeAutoLockTitles
{
  id v3;

  -[DBSSettingsController specifiers](self, "specifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSSettingsController _localizeAutoLockTitlesWithSpecifiers:](self, "_localizeAutoLockTitlesWithSpecifiers:", v3);

}

- (void)profileNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DBSSettingsController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__DBSSettingsController_profileNotification___block_invoke;
  v6[3] = &unk_24F025DA8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __45__DBSSettingsController_profileNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE63BA8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v5, "intValue");
  if ((_DWORD)v2 != getpid())
    objc_msgSend(*(id *)(a1 + 40), "reload");
  objc_msgSend(*(id *)(a1 + 40), "updateAutoLockSpecifier");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "specifierForID:", CFSTR("AUTOLOCK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifier:", v4);

}

- (id)locksAndUnlocksWithCase:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBLockAndUnlockWithCase"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocksAndUnlocksWithCase:(id)a3 specifier:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  if (a3)
  {
    v4 = (const __CFString *)*MEMORY[0x24BDBD590];
    v5 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(CFSTR("SBLockAndUnlockWithCase"), a3, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    CFPreferencesSynchronize(CFSTR("com.apple.springboard"), v4, v5);
    GSSendAppPreferencesChanged();
  }
}

- (void)presentModalMagnifyController
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x24BE75588]);
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v8, "setSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
  objc_msgSend(v8, "setParentController:", self);
  objc_msgSend(v8, "setupController");
  if (DBSReverseZoomEnabled())
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v8, "setModalPresentationStyle:", v7);
  -[DBSSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (BOOL)proModeSupported
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availablePresets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)connectedDisplayName
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v11))
  {
    -[DBSSettingsController specifiers](self, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "specifierForID:", CFSTR("BRIGHTNESS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("brightnessLimited"));

    -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DBSSettingsController;
    -[DBSSettingsController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "BOOLValue");
  _AXSSetEnhanceTextLegibilityEnabled();
  v5 = objc_msgSend(v4, "BOOLValue");

  +[DBSAnalytics logBoldTextEvent:](DBSAnalytics, "logBoldTextEvent:", v5);
  DBSPurgeKeyboardCache();
}

- (id)boldTextEnabledForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSEnhanceTextLegibilityEnabled());
}

- (void)updateForExternalMonitorAvailability:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (DBSChamoisEnabled())
  {
    v5 = (int)*MEMORY[0x24BE756E0];
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + v5))
    {
      if (v3)
      {
        +[DBSBrightnessManager removeSpecifiersFrom:](DBSBrightnessManager, "removeSpecifiersFrom:", self);
        +[DBSZoomAndProSpecifiers removeSpecifiersFrom:](DBSZoomAndProSpecifiers, "removeSpecifiersFrom:", self);
      }
      else
      {
        if (!+[DBSBrightnessManager specifiersPresentIn:](DBSBrightnessManager, "specifiersPresentIn:", self))
        {
          +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setDelegate:", self);

          +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mainDisplayBrightnessSpecifiers");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "specifierForID:", CFSTR("BOLD_TEXT"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[DBSSettingsController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v8, v9, 1);

        }
        if (!+[DBSZoomAndProSpecifiers specifiersPresentIn:](DBSZoomAndProSpecifiers, "specifiersPresentIn:", self))
        {
          -[DBSSettingsController _zoomAndProSpecifierVendor](self, "_zoomAndProSpecifierVendor");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "specifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[DBSSettingsController specifiers](self, "specifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[DBSSettingsController insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v10, objc_msgSend(v11, "count"));

        }
      }
    }
  }
}

- (void)_reloadBlueLightSpecifiers:(id)a3 reloadUI:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v4 = a4;
  v6 = a3;
  v21 = 0;
  v20 = 0u;
  -[DBSSettingsController _brightnessClient](self, "_brightnessClient", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blueLightClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "getBlueLightStatus:", &v19);

  if ((v9 & 1) == 0)
    -[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:].cold.1();
  v10 = *((_QWORD *)&v20 + 1);
  objc_msgSend(v6, "specifierForID:", CFSTR("BLUE_LIGHT_REDUCTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isReference");

  if (v10)
    v14 = 1;
  else
    v14 = v13;
  if (v14)
    v15 = MEMORY[0x24BDBD1C0];
  else
    v15 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v11, "setProperty:forKey:", v15, *MEMORY[0x24BE75A18]);
  objc_msgSend(v6, "specifierForID:", CFSTR("BLUE_LIGHT_GROUP"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v10)
  {
    objc_msgSend(v16, "setProperty:forKey:", &stru_24F026548, *MEMORY[0x24BE75A68]);
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  DBS_LocalizedStringForDisplays(CFSTR("BLUE_LIGHT_LOW_POWER_MODE_FOOTER"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75A68]);

  if (v4)
  {
LABEL_10:
    -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v11);
    -[DBSSettingsController reloadSpecifier:](self, "reloadSpecifier:", v17);
  }
LABEL_11:

}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__DBSSettingsController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_24F025E70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__DBSSettingsController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "specifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reloadBlueLightSpecifiers:reloadUI:", v2, 1);

}

- (id)blueLightSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v4 = a3;
  -[DBSSettingsController _brightnessClient](self, "_brightnessClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supported");

  if (!v7)
    goto LABEL_11;
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  -[DBSSettingsController _brightnessClient](self, "_brightnessClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blueLightClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "getBlueLightStatus:", &v18);

  if ((v10 & 1) == 0)
    -[DBSSettingsController blueLightSchedule:].cold.1();
  if (*((_QWORD *)&v19 + 1))
    goto LABEL_4;
  if (DWORD1(v18) == 2)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    DBS_LocalizedStringForDisplays(CFSTR("START_TIME_TO_STOP_TIME"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSSettingsController localizedTimeForTime:](self, "localizedTimeForTime:", *((_QWORD *)&v18 + 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSSettingsController localizedTimeForTime:](self, "localizedTimeForTime:", (_QWORD)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (DWORD1(v18) == 1)
  {
    v11 = CFSTR("SUNSET_TO_SUNRISE");
    goto LABEL_5;
  }
  if (DWORD1(v18))
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (BYTE1(v18))
  {
    v11 = CFSTR("ON");
    goto LABEL_5;
  }
LABEL_4:
  v11 = CFSTR("OFF");
LABEL_5:
  DBS_LocalizedStringForDisplays(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v12;
}

- (id)localizedTimeForTime:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setHour:", a3.var0);
  objc_msgSend(v5, "setMinute:", *(uint64_t *)&a3 >> 32);
  v6 = objc_alloc(MEMORY[0x24BDBCE48]);
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v7, "dateFromComponents:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)connectedDisplaySpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
    || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("CONNECTED_DISPLAYS")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)MEMORY[0x24BE75590];
    if (DBSChamoisEnabled())
      v7 = CFSTR("CONNECTED_DISPLAYS");
    else
      v7 = CFSTR("CONNECTED_DISPLAYS_LEGACY");
    DBS_LocalizedStringForConnectedDisplays(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithID:name:", CFSTR("CONNECTED_DISPLAYS"), v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v5);
  }
  v9 = DBSChamoisEnabled();
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v4);
  if (v9)
  {
    if (!v10
      || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("MAIN_DISPLAY")),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12 = (void *)MEMORY[0x24BE75590];
      +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mainDisplayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, objc_opt_class(), 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setProperty:forKey:", CFSTR("MAIN_DISPLAY"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("ipad"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 40.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithSymbolConfiguration:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProperty:forKey:", v17, *MEMORY[0x24BE75AC8]);

      objc_msgSend(v11, "setProperty:forKey:", &unk_24F02FC18, *MEMORY[0x24BE75D10]);
      objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v3, "addObject:", v11);
    }
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
      || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_DISPLAY")),
          (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v19 = (void *)MEMORY[0x24BE75590];
      +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "externalDisplayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, objc_opt_class(), 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setProperty:forKey:", CFSTR("EXTERNAL_DISPLAY"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("display"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 50.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageWithSymbolConfiguration:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperty:forKey:", v24, *MEMORY[0x24BE75AC8]);

      objc_msgSend(v18, "setProperty:forKey:", &unk_24F02FC18, *MEMORY[0x24BE75D10]);
      objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v3, "addObject:", v18);
    }
    -[DBSSettingsController externalDisplayInfo](self, "externalDisplayInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
        || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("DISPLAY_ARRANGEMENT")),
            (v26 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[DBSSettingsController makeArrangementSpecifier](self, "makeArrangementSpecifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v26);
      }

    }
  }
  else if (!v10
         || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_DISPLAY")),
             (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v27 = (void *)MEMORY[0x24BE75590];
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "externalDisplayName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, 0, objc_opt_class(), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", CFSTR("EXTERNAL_DISPLAY"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v3, "addObject:", v11);
  }

  return v3;
}

- (id)makeArrangementSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForConnectedDisplays(CFSTR("DISPLAY_ARRANGEMENT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("DISPLAY_ARRANGEMENT"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setButtonAction:", sel_presentArrangementController);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v5;
}

- (void)insertArrangementSpecifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3)
    || (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("DISPLAY_ARRANGEMENT")),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[DBSSettingsController makeArrangementSpecifier](self, "makeArrangementSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
    {
      -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_DISPLAY"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[DBSSettingsController insertSpecifier:afterSpecifier:](self, "insertSpecifier:afterSpecifier:", v5, v6);

      }
    }

    v4 = 0;
  }

}

- (void)insertExternalDisplaySpecifiers
{
  void *v3;
  id v4;

  -[DBSSettingsController connectedDisplaySpecifiers](self, "connectedDisplaySpecifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("BOLD_TEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSSettingsController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v4, v3, 1);

}

- (void)removeExternalDisplaySpecifiers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (int)*MEMORY[0x24BE756E0];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("CONNECTED_DISPLAYS"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v12, "addObject:", v4);

    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("MAIN_DISPLAY"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v12, "addObject:", v6);

    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_DISPLAY"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v12, "addObject:", v8);

    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("DISPLAY_ARRANGEMENT"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v12, "addObject:", v10);

    }
  }
  if (objc_msgSend(v12, "count"))
    -[DBSSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v12, 1);

}

- (void)presentArrangementController
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BE75588]);
  -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("DISPLAY_ARRANGEMENT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v3, "setSpecifier:", v4);
  objc_msgSend(v3, "setParentController:", self);
  objc_msgSend(v3, "setupController");
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(v3, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__DBSSettingsController_presentArrangementController__block_invoke;
  v11[3] = &unk_24F026128;
  objc_copyWeak(&v14, &location);
  v9 = v8;
  v12 = v9;
  v10 = v3;
  v13 = v10;
  -[DBSSettingsController updateExternalDisplayInfoWithCompletionHandler:](self, "updateExternalDisplayInfoWithCompletionHandler:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __53__DBSSettingsController_presentArrangementController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "externalDisplayInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExternalDisplayInfo:", v2);

  objc_msgSend(WeakRetained, "displayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDisplayService:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", WeakRetained);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
  objc_msgSend(WeakRetained, "setArrangementViewController:", *(_QWORD *)(a1 + 40));

}

- (void)arrangementViewControllerDidDismiss:(id)a3
{
  -[DBSSettingsController setArrangementViewController:](self, "setArrangementViewController:", 0);
}

- (void)updateExternalDisplayInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DBSSettingsController displayService](self, "displayService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F026178;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "getConnectedDisplayInfoWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24F026150;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v11);
}

void __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  DBSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227A37000, v4, OS_LOG_TYPE_DEFAULT, "Recieved valid external display", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setExternalDisplayInfo:", v6);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_227A37000, v4, OS_LOG_TYPE_DEFAULT, "No Valid display", v10, 2u);
    }

    objc_msgSend(WeakRetained, "setExternalDisplayInfo:", 0);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE756E0]))
    {
      objc_msgSend(WeakRetained, "specifierForID:", CFSTR("DISPLAY_ARRANGEMENT"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(WeakRetained, "removeSpecifier:", v6);
    objc_msgSend(WeakRetained, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "arrangementViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)handleDBSExternalDisplayManagerCurrentModeDidChangeNotification:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __89__DBSSettingsController_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification___block_invoke;
  v5[3] = &unk_24F0261A0;
  objc_copyWeak(&v6, &location);
  -[DBSSettingsController updateExternalDisplayInfoWithCompletionHandler:](self, "updateExternalDisplayInfoWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __89__DBSSettingsController_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDisplayServiceInfoUpdate");

}

- (void)handleDisplayServiceInfoUpdate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    DBSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_227A37000, v3, OS_LOG_TYPE_DEFAULT, "Recieved", (uint8_t *)buf, 2u);
    }

    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "externalDisplayAvailable");

    if (v5)
      -[DBSSettingsController insertExternalDisplaySpecifiers](self, "insertExternalDisplaySpecifiers");
    else
      -[DBSSettingsController removeExternalDisplaySpecifiers](self, "removeExternalDisplaySpecifiers");
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSSettingsController updateForExternalMonitorAvailability:](self, "updateForExternalMonitorAvailability:", objc_msgSend(v6, "externalDisplayAvailable"));

  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__DBSSettingsController_handleDisplayServiceInfoUpdate__block_invoke;
    block[3] = &unk_24F0261A0;
    objc_copyWeak(&v8, buf);
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __55__DBSSettingsController_handleDisplayServiceInfoUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDisplayServiceInfoUpdate");

}

- (id)_deviceAppearanceScheduleSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0])
    && (-[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("APPEARANCE_OPTIONS")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[DBSSettingsController specifierForID:](self, "specifierForID:", CFSTR("APPEARANCE_OPTIONS"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDisplays(CFSTR("APPEARANCE_OPTIONS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__deviceAppearanceScheduleString, objc_opt_class(), 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("APPEARANCE_OPTIONS"), *MEMORY[0x24BE75AC0]);
    -[DBSSettingsController _styleMode](self, "_styleMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, DBSStyleModeKey[0]);

  }
  return v4;
}

- (id)_deviceAppearanceScheduleString
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[DBSSettingsController _styleMode](self, "_styleMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suggestedAutomaticModeValue");

  if (v4 == 100)
  {
    -[DBSSettingsController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6 == 2)
      v7 = CFSTR("DARK_UNTIL_SUNRISE");
    else
      v7 = CFSTR("LIGHT_UNTIL_SUNSET");
    DBS_LocalizedStringForDisplays(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DBSSettingsController _styleMode](self, "_styleMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "suggestedAutomaticModeValue");

    if (v9 == 102)
    {
      -[DBSSettingsController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceStyle");

      v12 = (void *)MEMORY[0x24BDD17C8];
      if (v11 == 2)
      {
        DBS_LocalizedStringForDisplays(CFSTR("CUSTOM_SCHEDULE_DARK"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DBSSettingsController _lightAppearanceTimeString](self, "_lightAppearanceTimeString");
      }
      else
      {
        DBS_LocalizedStringForDisplays(CFSTR("CUSTOM_SCHEDULE_LIGHT"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DBSSettingsController _darkAppearanceTimeString](self, "_darkAppearanceTimeString");
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
  return v14;
}

- (id)_darkAppearanceTimeString
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[DBSSettingsController _styleMode](self, "_styleMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "customSchedule");
    v6 = v17;
  }
  else
  {
    v6 = 0;
    v17 = 0u;
    v18 = 0u;
  }
  objc_msgSend(v3, "setHour:", v6);

  -[DBSSettingsController _styleMode](self, "_styleMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "customSchedule");
    v9 = *((_QWORD *)&v15 + 1);
  }
  else
  {
    v9 = 0;
    v15 = 0u;
    v16 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v15, v16, v17, v18);

  v10 = objc_alloc(MEMORY[0x24BDBCE48]);
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v11, "dateFromComponents:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_lightAppearanceTimeString
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[DBSSettingsController _styleMode](self, "_styleMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "customSchedule");
    v6 = v18;
  }
  else
  {
    v6 = 0;
    v17 = 0u;
    v18 = 0u;
  }
  objc_msgSend(v3, "setHour:", v6);

  -[DBSSettingsController _styleMode](self, "_styleMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "customSchedule");
    v9 = *((_QWORD *)&v16 + 1);
  }
  else
  {
    v9 = 0;
    v15 = 0u;
    v16 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v15, v16, v17, v18);

  v10 = objc_alloc(MEMORY[0x24BDBCE48]);
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v11, "dateFromComponents:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)getAppearanceValueForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[DBSSettingsController _styleMode](self, "_styleMode", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "modeValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAppearanceValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "integerValue");
  -[DBSSettingsController _styleMode](self, "_styleMode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModeValue:", v5);

}

- (id)getAutomaticAppearanceEnabledForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[DBSSettingsController _styleMode](self, "_styleMode", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeValue");
  objc_msgSend(v3, "numberWithBool:", UISUserInterfaceStyleModeValueIsAutomatic());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAutomaticAppearanceEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  dispatch_time_t v6;
  uint64_t v7;
  _QWORD block[5];

  v5 = a3;
  v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__DBSSettingsController_setAutomaticAppearanceEnabled_forSpecifier___block_invoke;
  block[3] = &unk_24F025E70;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  v7 = objc_msgSend(v5, "BOOLValue");

  +[DBSAnalytics logAutomaticDarkModeEvent:](DBSAnalytics, "logAutomaticDarkModeEvent:", v7);
}

void __68__DBSSettingsController_setAutomaticAppearanceEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  int IsAutomatic;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_styleMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modeValue");
  IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

  v4 = *(void **)(a1 + 32);
  if (IsAutomatic)
  {
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 1)
      v6 = 1;
    else
      v6 = 2;

    objc_msgSend(*(id *)(a1 + 32), "_styleMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModeValue:", v6);

    v8 = *MEMORY[0x24BEBEC88];
    v9 = *(_QWORD *)(MEMORY[0x24BEBEC88] + 8);
    objc_msgSend(*(id *)(a1 + 32), "_styleMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverride:", v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "removeSpecifierID:animated:", CFSTR("APPEARANCE_OPTIONS"), 1);
  }
  else
  {
    objc_msgSend(v4, "_styleMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "suggestedAutomaticModeValue");
    objc_msgSend(*(id *)(a1 + 32), "_styleMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setModeValue:", v12);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "_deviceAppearanceScheduleSpecifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSpecifier:afterSpecifierID:", v15, CFSTR("AUTOMATIC"));

  }
}

- (void)_updateDeviceAppearanceToNewInterfaceStyle:(int64_t)a3
{
  void *v5;
  int IsAutomatic;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[DBSSettingsController _styleMode](self, "_styleMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modeValue");
  IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

  if (a3 == 1)
    v7 = 1;
  else
    v7 = 2;
  -[DBSSettingsController _styleMode](self, "_styleMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (IsAutomatic)
  {
    v10 = objc_msgSend(v8, "override");

    if (v10 != v7)
    {
      -[DBSSettingsController _styleMode](self, "_styleMode");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOverride:", v7, 1);
LABEL_10:

    }
  }
  else
  {
    v11 = objc_msgSend(v8, "modeValue");

    if (v11 != v7)
    {
      -[DBSSettingsController _styleMode](self, "_styleMode");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setModeValue:", v7);
      goto LABEL_10;
    }
  }
}

- (void)deviceAppearanceTableViewCellUserDidTapOnLightAppearance:(id)a3
{
  -[DBSSettingsController _updateDeviceAppearanceToNewInterfaceStyle:](self, "_updateDeviceAppearanceToNewInterfaceStyle:", 1);
  +[DBSAnalytics logDarkModeEvent:](DBSAnalytics, "logDarkModeEvent:", 0);
}

- (void)deviceAppearanceTableViewCellUserDidTapOnDarkAppearance:(id)a3
{
  -[DBSSettingsController _updateDeviceAppearanceToNewInterfaceStyle:](self, "_updateDeviceAppearanceToNewInterfaceStyle:", 2);
  +[DBSAnalytics logDarkModeEvent:](DBSAnalytics, "logDarkModeEvent:", 1);
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
  objc_storeStrong((id *)&self->_displayService, a3);
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)setExternalDisplayInfo:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayInfo, a3);
}

- (UISUserInterfaceStyleMode)_styleMode
{
  return self->__styleMode;
}

- (void)set_styleMode:(id)a3
{
  objc_storeStrong((id *)&self->__styleMode, a3);
}

- (CBClient)_brightnessClient
{
  return self->__brightnessClient;
}

- (void)set_brightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->__brightnessClient, a3);
}

- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor
{
  return self->__zoomAndProSpecifierVendor;
}

- (void)set_zoomAndProSpecifierVendor:(id)a3
{
  objc_storeStrong((id *)&self->__zoomAndProSpecifierVendor, a3);
}

- (PSSetupController)arrangementViewController
{
  return self->_arrangementViewController;
}

- (void)setArrangementViewController:(id)a3
{
  objc_storeStrong((id *)&self->_arrangementViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangementViewController, 0);
  objc_storeStrong((id *)&self->__zoomAndProSpecifierVendor, 0);
  objc_storeStrong((id *)&self->__brightnessClient, 0);
  objc_storeStrong((id *)&self->__styleMode, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_localizedAutoLockTitleDictionary, 0);
  objc_storeStrong((id *)&self->_autoLockTitleDictionary, 0);
  objc_storeStrong((id *)&self->_autoLockValues, 0);
}

- (void)_reloadBlueLightSpecifiers:reloadUI:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get Night Shift capability from CoreBrightness.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:]", "DBSSettingsController.m", 753, "0");
}

- (void)blueLightSchedule:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blr status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSSettingsController blueLightSchedule:]", "DBSSettingsController.m", 789, "0");
}

@end
