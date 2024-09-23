@implementation SHSHeadphoneHearingProtectionController

- (SHSHeadphoneHearingProtectionController)init
{
  SHSHeadphoneHearingProtectionController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSHeadphoneHearingProtectionController;
  v2 = -[SHSHeadphoneHearingProtectionController init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)unknownWiredDeviceStatusChanged, (CFStringRef)*MEMORY[0x24BE0A180], 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE0A180], 0);
  v4.receiver = self;
  v4.super_class = (Class)SHSHeadphoneHearingProtectionController;
  -[SHSHeadphoneHearingProtectionController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  __CFString *v3;
  void *v4;
  ADASManager *v5;
  ADASManager *audioSettingsManager;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  HKHealthStore *v15;
  HKHealthStore *healthStore;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SHSHeadphoneHearingProtectionController;
  -[SHSHeadphoneHearingProtectionController loadView](&v17, sel_loadView);
  if (_os_feature_enabled_impl())
    v3 = CFSTR("HEADPHONE_HEARING_PROTECTION");
  else
    v3 = CFSTR("HEADPHONE_LEVEL_LIMIT_TITLE");
  SHS_LocalizedStringForSounds(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController setTitle:](self, "setTitle:", v4);

  v5 = (ADASManager *)objc_alloc_init(MEMORY[0x24BE0A230]);
  audioSettingsManager = self->_audioSettingsManager;
  self->_audioSettingsManager = v5;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController setLevelLimitThreshold:](self, "setLevelLimitThreshold:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v9, "setNumberStyle:", 1);
  objc_msgSend(v9, "setMaximumFractionDigits:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNotANumberSymbol:", v11);

  -[SHSHeadphoneHearingProtectionController setNumberFormatter:](self, "setNumberFormatter:", v9);
  -[SHSHeadphoneHearingProtectionController setDeviceiPad:](self, "setDeviceiPad:", PSGetCapabilityBoolAnswer());
  v12 = PSGetCapabilityBoolAnswer();
  v13 = 0;
  if ((v12 & 1) == 0)
    v13 = PSGetCapabilityBoolAnswer() ^ 1;
  -[SHSHeadphoneHearingProtectionController setDeviceiPod:](self, "setDeviceiPod:", v13);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController setDeviceInRetailKioskMode:](self, "setDeviceInRetailKioskMode:", objc_msgSend(v14, "sf_inRetailKioskMode"));

  if (-[SHSHeadphoneHearingProtectionController shouldShowHealthFeatures](self, "shouldShowHealthFeatures")
    || _os_feature_enabled_impl())
  {
    v15 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    healthStore = self->_healthStore;
    self->_healthStore = v15;

    self->_weeklyNotificationCount = 0;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHSHeadphoneHearingProtectionController;
  -[SHSHeadphoneHearingProtectionController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[SHSHeadphoneHearingProtectionController startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController queryNotificationCountsFromDate:toDate:](self, "queryNotificationCountsFromDate:toDate:", v4, v5);

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController setLevelLimitThreshold:](self, "setLevelLimitThreshold:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SHSHeadphoneHearingProtectionController;
  -[SHSHeadphoneHearingProtectionController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Sounds/HEADPHONE_LEVEL_LIMIT_SETTING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("HEADPHONE_HEARING_PROTECTION"), CFSTR("Sounds"), v6, v8);

  objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v9, v11, v4);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v5 = (void *)objc_opt_new();
  if (_os_feature_enabled_impl()
    && (-[SHSHeadphoneHearingProtectionController shouldShowHealthFeatures](self, "shouldShowHealthFeatures")
     || _os_feature_enabled_impl()))
  {
    -[SHSHeadphoneHearingProtectionController headphoneNotificationsGroupSpecifier](self, "headphoneNotificationsGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE0A1E8];
    objc_msgSend(v7, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
    {
      -[SHSHeadphoneHearingProtectionController headphoneNotificationsSwitchSpecifier](self, "headphoneNotificationsSwitchSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
    -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getPreferenceFor:", *MEMORY[0x24BE0A1E0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "BOOLValue"))
    {

LABEL_10:
      -[SHSHeadphoneHearingProtectionController headphoneWeeklyNotificationDescriptionSpecifier](self, "headphoneWeeklyNotificationDescriptionSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v17);

      goto LABEL_11;
    }
    -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getPreferenceFor:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
      goto LABEL_10;
  }
LABEL_11:
  -[SHSHeadphoneHearingProtectionController headphoneLevelLimitGroupSpecifier](self, "headphoneLevelLimitGroupSpecifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v18);

  -[SHSHeadphoneHearingProtectionController headphoneLevelLimitSwitchSpecifier](self, "headphoneLevelLimitSwitchSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "getPreferenceFor:", *MEMORY[0x24BE0A210]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    -[SHSHeadphoneHearingProtectionController headphoneLevelLimitDescriptionSpecifier](self, "headphoneLevelLimitDescriptionSpecifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    -[SHSHeadphoneHearingProtectionController headphoneLevelLimitSliderSpecifier](self, "headphoneLevelLimitSliderSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

  }
  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "getPreferenceFor:", *MEMORY[0x24BE0A1D0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SHSHeadphoneHearingProtectionController shouldShowHealthFeatures](self, "shouldShowHealthFeatures"))
  {
    if (objc_msgSend(v26, "count")
      || (-[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v27, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v28,
          v27,
          v28))
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SHSHeadphoneAudioDevicesGroupKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v29);

      -[SHSHeadphoneHearingProtectionController headphoneAudioDevicesSpecifier](self, "headphoneAudioDevicesSpecifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v30);

    }
  }
  v31 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

- (id)deviceTypeString
{
  const __CFString *v3;

  if (-[SHSHeadphoneHearingProtectionController isDeviceiPad](self, "isDeviceiPad"))
    v3 = CFSTR("IPAD");
  else
    v3 = CFSTR("IPHONE");
  if (-[SHSHeadphoneHearingProtectionController isDeviceiPod](self, "isDeviceiPod"))
    return CFSTR("IPOD");
  else
    return (id)v3;
}

- (BOOL)shouldShowHealthFeatures
{
  int v3;

  if (!-[SHSHeadphoneHearingProtectionController isDeviceiPad](self, "isDeviceiPad")
    || (v3 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v3) = !-[SHSHeadphoneHearingProtectionController isDeviceInRetailKioskMode](self, "isDeviceInRetailKioskMode");
  }
  return v3;
}

- (id)headphoneNotificationsGroupSpecifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSRange v31;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SHSHeadphoneNotificationsGroupKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_FOOTER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE75A38];
  objc_msgSend(v3, "setProperty:forKey:", CFSTR("openAboutHeadphoneNotifications"), *MEMORY[0x24BE75A38]);
  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v9);

    v10 = (void *)MEMORY[0x24BDD17C8];
    SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_MANDATORY"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("LEARN_MORE_IN_HEALTH_LINK");
    SHS_LocalizedStringForSounds(CFSTR("LEARN_MORE_IN_HEALTH_LINK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("LEARN_MORE_IN_HEALTH_LINK");
    SHS_LocalizedStringForSounds(CFSTR("LEARN_MORE_IN_HEALTH_LINK"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v4, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getPreferenceFor:", *MEMORY[0x24BE0A1A8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((v20 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_DISABLED_FOOTER"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("HEALTH_PRIVACY_SETTINGS_LINK");
      SHS_LocalizedStringForSounds(CFSTR("HEALTH_PRIVACY_SETTINGS_LINK"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setProperty:forKey:", CFSTR("openHealthPrivacySettings"), v5);
      v15 = (void *)v24;
    }
  }
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v26, *MEMORY[0x24BE75A30]);

  objc_msgSend(v3, "setProperty:forKey:", v15, *MEMORY[0x24BE75A58]);
  SHS_LocalizedStringForSounds(v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31.location = objc_msgSend(v15, "rangeOfString:", v27);
  NSStringFromRange(v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v28, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v29, *MEMORY[0x24BE75A50]);

  return v3;
}

- (id)headphoneNotificationsSwitchSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE75590];
  SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_SWITCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setHeadphoneNotificationsEnabled_forSpecifier_, sel_getHeadphoneNotificationsEnabled, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SHSHeadphoneNotificationsSwitchKey"), *MEMORY[0x24BE75AC0]);
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPreferenceFor:", *MEMORY[0x24BE0A1A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

  return v5;
}

- (id)headphoneWeeklyNotificationDescriptionSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, sel_weeklyNotificationCount_, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", self->_weeklyNotificationData, CFSTR("NotificationDataKey"));
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SHSHeadphoneWeeklyNotificationsKey"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v5;
}

- (id)headphoneLevelLimitGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  NSRange v17;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SHSHeadphoneLevelLimitKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SHSHeadphoneHearingProtectionController shouldShowHealthFeatures](self, "shouldShowHealthFeatures")
    || (_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SHS_LocalizedStringForSounds(CFSTR("LEARN_MORE_IN_HEALTH_LINK"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v9, *MEMORY[0x24BE75A30]);

    objc_msgSend(v3, "setProperty:forKey:", v7, *MEMORY[0x24BE75A58]);
    SHS_LocalizedStringForSounds(CFSTR("LEARN_MORE_IN_HEALTH_LINK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17.location = -[__CFString rangeOfString:](v7, "rangeOfString:", v10);
    NSStringFromRange(v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v11, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v12, *MEMORY[0x24BE75A50]);

    v13 = *MEMORY[0x24BE75A38];
    v14 = CFSTR("openHealthArticleSafeListening");
    v15 = v3;
  }
  else
  {
    SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_SELECTION_FOOTER"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE75A68];
    v15 = v3;
    v14 = v7;
  }
  objc_msgSend(v15, "setProperty:forKey:", v14, v13);

  return v3;
}

- (id)headphoneLevelLimitSwitchSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_LABEL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setHeadphoneLevelLimitEnabled_forSpecifier_, sel_getHeadphoneLevelLimitEnabled, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SHSHeadphoneLevelLimitSwitchKey"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SHSHeadphoneHearingProtectionController headphoneLevelLimitLockedByRestrictions](self, "headphoneLevelLimitLockedByRestrictions") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A18]);

  return v5;
}

- (id)headphoneLevelLimitDescriptionSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  -[SHSHeadphoneHearingProtectionController updateHeadphoneLevelLimitText](self, "updateHeadphoneLevelLimitText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, sel_updateHeadphoneLevelLimitDescriptionText, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SHSHeadphoneLevelLimitDescriptionKey"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v5;
}

- (id)headphoneLevelLimitSliderSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setHeadphoneLevelLimitValue_forSpecifier_, sel_getHeadphoneLevelLimitSetting, 0, 5, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", CFSTR("SHSHeadphoneLevelLimitSliderKey"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v4 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C88]);
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75C80]);
  objc_msgSend(v3, "setProperty:forKey:", &unk_24F19D9D0, *MEMORY[0x24BE75CA8]);
  objc_msgSend(v3, "setProperty:forKey:", &unk_24F19D9E8, *MEMORY[0x24BE759B0]);
  objc_msgSend(v3, "setProperty:forKey:", &unk_24F19DA00, *MEMORY[0x24BE759A8]);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("speaker.2.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v7, *MEMORY[0x24BE75C90]);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("speaker.3.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v10, *MEMORY[0x24BE75CA0]);

  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75AD0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SHSHeadphoneHearingProtectionController headphoneLevelLimitLockedByRestrictions](self, "headphoneLevelLimitLockedByRestrictions") ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);

  return v3;
}

- (id)headphoneAudioDevicesSpecifier
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (MGGetBoolAnswer())
    v3 = CFSTR("HEADPHONE_USB_AUDIO_ACCESSORIES");
  else
    v3 = CFSTR("HEADPHONE_LIGHTNING_ADAPTERS");
  v4 = (void *)MEMORY[0x24BE75590];
  SHS_LocalizedStringForSounds(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", v3);
  return v6;
}

- (id)updateHeadphoneLevelLimitText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_SET_LEVEL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController numberFormatter](self, "numberFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)updateHeadphoneLevelLimitDescriptionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("HEADPHONE_LEVEL_LIMIT_%@_INFO"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_LocalizedStringForSounds(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)openHealthPrivacySettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy&path=HEALTH/HEADPHONE_AUDIO_LEVELS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)openAboutHeadphoneNotifications
{
  SHSHeadphoneNotificationsController *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SHSHeadphoneNotificationsController);
  v4 = objc_alloc_init(MEMORY[0x24BEBD7A8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
  objc_msgSend(v4, "setRightBarButtonItem:", v5);
  v6 = objc_alloc(MEMORY[0x24BEBD788]);
  -[SHSHeadphoneHearingProtectionController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[SHSHeadphoneHearingProtectionController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v12 = (void *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v9);

  v16[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItems:", v13);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBarTintColor:", v14);

  objc_msgSend(v12, "setTranslucent:", 0);
  objc_msgSend(v12, "_setHidesShadow:", 1);
  -[SHSHeadphoneNotificationsController view](v3, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v12);

  -[SHSHeadphoneHearingProtectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

- (void)dismiss
{
  -[SHSHeadphoneHearingProtectionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)openHealthArticleSafeListening
{
  const __CFString *v2;
  void *v3;
  id v4;

  if (_os_feature_enabled_impl())
    v2 = CFSTR("x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening");
  else
    v2 = CFSTR("x-apple-Health://HearingAppPlugin.healthplugin/WhyHearingHealthMatters");
  v3 = (void *)*MEMORY[0x24BEBDF78];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

- (void)setHeadphoneLevelLimitEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "BOOLValue"))
  {
    -[SHSHeadphoneHearingProtectionController headphoneLevelLimitDescriptionSpecifier](self, "headphoneLevelLimitDescriptionSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    -[SHSHeadphoneHearingProtectionController headphoneLevelLimitSliderSpecifier](self, "headphoneLevelLimitSliderSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSHeadphoneHearingProtectionController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v8, CFSTR("SHSHeadphoneLevelLimitSwitchKey"), 1);

  }
  else
  {
    -[SHSHeadphoneHearingProtectionController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("SHSHeadphoneLevelLimitDescriptionKey"), 1);
    -[SHSHeadphoneHearingProtectionController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("SHSHeadphoneLevelLimitSliderKey"), 1);
  }
  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "setPreferenceFor:value:", *MEMORY[0x24BE0A210], v5);

}

- (id)getHeadphoneLevelLimitEnabled
{
  void *v2;
  void *v3;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHeadphoneLevelLimitValue:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SHSHeadphoneHearingProtectionController levelLimitThreshold](self, "levelLimitThreshold");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v12)
  {
    -[SHSHeadphoneHearingProtectionController setLevelLimitThreshold:](self, "setLevelLimitThreshold:", v12);
    -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "setPreferenceFor:value:", *MEMORY[0x24BE0A218], v12);

    v8 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "specifierForID:", CFSTR("SHSHeadphoneLevelLimitDescriptionKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSHeadphoneHearingProtectionController updateHeadphoneLevelLimitText](self, "updateHeadphoneLevelLimitText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v10);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "specifierForID:", CFSTR("SHSHeadphoneLevelLimitDescriptionKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSHeadphoneHearingProtectionController reloadSpecifier:](self, "reloadSpecifier:", v11);

  }
}

- (id)getHeadphoneLevelLimitSetting
{
  void *v2;
  void *v3;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHeadphoneNotificationsEnabled:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "BOOLValue"))
  {
    -[SHSHeadphoneHearingProtectionController headphoneWeeklyNotificationDescriptionSpecifier](self, "headphoneWeeklyNotificationDescriptionSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSHeadphoneHearingProtectionController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v5, CFSTR("SHSHeadphoneNotificationsSwitchKey"), 1);

  }
  else
  {
    -[SHSHeadphoneHearingProtectionController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("SHSHeadphoneWeeklyNotificationsKey"), 1);
  }
  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "setPreferenceFor:value:", *MEMORY[0x24BE0A1E0], v8);

}

- (id)getHeadphoneNotificationsEnabled
{
  void *v2;
  void *v3;

  -[SHSHeadphoneHearingProtectionController audioSettingsManager](self, "audioSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)headphoneLevelLimitLockedByRestrictions
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("volumeLimit"));

  return v3;
}

- (id)weeklyNotificationCount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SHSHeadphoneHearingProtectionController numberFormatter](self, "numberFormatter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_weeklyNotificationCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateMonthlyNotificationCounts:(id)a3 withNames:(id)a4 forDates:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *weeklyNotificationData;
  void *v21;
  id v22;
  NSArray *v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v22, "setDateFormat:", CFSTR("M"));
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    do
    {
      v26[0] = CFSTR("month");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v25;
      v26[1] = CFSTR("date");
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v11;
      v26[2] = CFSTR("count");
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v12;
      v26[3] = CFSTR("desc");
      v13 = (void *)MEMORY[0x24BDD17C8];
      SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_NOTIFICATIONS_VOICE_OVER_DESCRIPTION"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v15 = v7;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, objc_msgSend(v17, "integerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray setObject:atIndexedSubscript:](v24, "setObject:atIndexedSubscript:", v19, v10);

      v9 = v16;
      v7 = v15;

      ++v10;
    }
    while (objc_msgSend(v8, "count") > v10);
  }
  weeklyNotificationData = self->_weeklyNotificationData;
  self->_weeklyNotificationData = v24;

  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.self"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneHearingProtectionController setWeeklyNotificationCount:](self, "setWeeklyNotificationCount:", objc_msgSend(v21, "intValue"));

}

- (id)startDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 2097404, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMonth:", objc_msgSend(v4, "month") - 5);
  objc_msgSend(v4, "setDay:", 1);
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)endDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)queryNotificationCountsFromDate:(id)a3 toDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v26 = a4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v10);

  objc_msgSend(v9, "setDateFormat:", CFSTR("MMM"));
  v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  for (i = 0; i != 6; ++i)
  {
    objc_msgSend(v11, "setMonth:", i);
    objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v11, v28, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);
    objc_msgSend(v9, "stringFromDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);
    objc_msgSend(v6, "addObject:", &unk_24F19DA18);

  }
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2918]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForSamplesWithStartDate:endDate:options:", v28, v26, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDD17C0]);
  v25 = (void *)objc_msgSend(v16, "initWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
  objc_initWeak(&location, self);
  v17 = objc_alloc(MEMORY[0x24BDD3F00]);
  v36[0] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke;
  v29[3] = &unk_24F197AA0;
  v19 = v5;
  v30 = v19;
  v20 = v9;
  v31 = v20;
  v21 = v6;
  v32 = v21;
  objc_copyWeak(&v34, &location);
  v22 = v7;
  v33 = v22;
  v23 = (void *)objc_msgSend(v17, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v15, v24, 0, v18, v29);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v23);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&location);
}

void __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  id v20;
  _QWORD block[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v11 = *(void **)(a1 + 32);
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v10, "endDate", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringFromDate:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "indexOfObject:", v14);

          if (objc_msgSend(v10, "value") == 1)
          {
            v16 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v18, v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "updateMonthlyNotificationCounts:withNames:forDates:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke_2;
    block[3] = &unk_24F197920;
    objc_copyWeak(&v22, (id *)(a1 + 64));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v22);
    v4 = v20;
  }

}

void __82__SHSHeadphoneHearingProtectionController_queryNotificationCountsFromDate_toDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioSettingsManager, a3);
}

- (BOOL)isDeviceiPad
{
  return self->_DeviceiPad;
}

- (void)setDeviceiPad:(BOOL)a3
{
  self->_DeviceiPad = a3;
}

- (BOOL)isDeviceiPod
{
  return self->_DeviceiPod;
}

- (void)setDeviceiPod:(BOOL)a3
{
  self->_DeviceiPod = a3;
}

- (BOOL)isDeviceInRetailKioskMode
{
  return self->_DeviceInRetailKioskMode;
}

- (void)setDeviceInRetailKioskMode:(BOOL)a3
{
  self->_DeviceInRetailKioskMode = a3;
}

- (BOOL)shouldShowHeadphoneNotificationsSection
{
  return self->_shouldShowHeadphoneNotificationsSection;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (NSArray)weeklyNotificationData
{
  return self->_weeklyNotificationData;
}

- (void)setWeeklyNotificationData:(id)a3
{
  objc_storeStrong((id *)&self->_weeklyNotificationData, a3);
}

- (int)weeklyNotificationCount
{
  return self->_weeklyNotificationCount;
}

- (void)setWeeklyNotificationCount:(int)a3
{
  self->_weeklyNotificationCount = a3;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSNumber)levelLimitThreshold
{
  return self->_levelLimitThreshold;
}

- (void)setLevelLimitThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_levelLimitThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelLimitThreshold, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_weeklyNotificationData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end
