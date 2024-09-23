@implementation SHSHeadphoneAudioAccessoriesController

- (SHSHeadphoneAudioAccessoriesController)init
{
  SHSHeadphoneAudioAccessoriesController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  v2 = -[SHSHeadphoneAudioAccessoriesController init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)unknownWiredDeviceStatusChanged_0, (CFStringRef)*MEMORY[0x24BE0A180], 0, (CFNotificationSuspensionBehavior)0);
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
  v4.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  -[SHSHeadphoneAudioAccessoriesController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  __CFString *v3;
  void *v4;
  ADASManager *v5;
  ADASManager *audioSettingsManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  -[SHSHeadphoneAudioAccessoriesController loadView](&v7, sel_loadView);
  if (MGGetBoolAnswer())
    v3 = CFSTR("HEADPHONE_USB_AUDIO_ACCESSORIES");
  else
    v3 = CFSTR("HEADPHONE_LIGHTNING_ADAPTERS");
  SHS_LocalizedStringForSounds(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneAudioAccessoriesController setTitle:](self, "setTitle:", v4);

  v5 = (ADASManager *)objc_alloc_init(MEMORY[0x24BE0A230]);
  audioSettingsManager = self->_audioSettingsManager;
  self->_audioSettingsManager = v5;

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  -[SHSHeadphoneAudioAccessoriesController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SHSHeadphoneAudioAccessoriesController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  -[SHSHeadphoneAudioAccessoriesController viewDidAppear:](&v24, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[SHSHeadphoneAudioAccessoriesController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.Sounds/HEADPHONE_LEVEL_LIMIT_SETTING/%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD19B8]);
  -[SHSHeadphoneAudioAccessoriesController specifier](self, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", v12, CFSTR("Sounds"), v13, v15);

  v17 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithKey:table:locale:bundleURL:", CFSTR("HEADPHONE_HEARING_PROTECTION"), CFSTR("Sounds"), v18, v20);

  objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v25[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneAudioAccessoriesController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v16, v23, v9);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE0A1A0];
    objc_msgSend(v6, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (MGGetBoolAnswer())
        v9 = CFSTR("HEADPHONE_CURRENT_USB_AUDIO_ACCESSORY_GROUP");
      else
        v9 = CFSTR("HEADPHONE_CURRENT_LIGHTNING_ADAPTER_GROUP");
      v10 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupSpecifierWithID:name:", CFSTR("SHSCurrentAudioAccessoryKey"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v12);
      -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getPreferenceFor:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
        v16 = CFSTR("HEADPHONE_CURRENT_DEVICE_HEADPHONE_FOOTER");
      else
        v16 = CFSTR("HEADPHONE_CURRENT_DEVICE_OTHER_DEVICE_FOOTER");
      SHS_LocalizedStringForSounds(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

      v18 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(CFSTR("CONNECTED_TO_HEADPHONES_SWITCH"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, sel_setConnectedToHeadphonesEnabled_forSpecifier_, sel_getConnectedToHeadphonesEnabled, 0, 6, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v20);
    }
    -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getPreferenceFor:", *MEMORY[0x24BE0A1D0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SHSForgetAudioAccessoryKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v24);
      if (MGGetBoolAnswer())
        v25 = CFSTR("FORGET_USB_AUDIO_ACCESSORIES_BUTTON");
      else
        v25 = CFSTR("FORGET_LIGHTNING_ADAPTERS_BUTTON");
      v26 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 13, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setButtonAction:", sel_confirmForgetAudioAccessoriesAction);
      objc_msgSend(v5, "addObject:", v28);

    }
    v29 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)confirmForgetAudioAccessoriesAction
{
  int v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  objc_initWeak(&location, self);
  v3 = MGGetBoolAnswer();
  v4 = v3;
  if (v3)
    v5 = CFSTR("FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_BUTTON");
  else
    v5 = CFSTR("FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_BUTTON");
  if (v3)
    v6 = CFSTR("FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_TITLE");
  else
    v6 = CFSTR("FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_TITLE");
  v7 = (void *)MEMORY[0x24BEBD3B0];
  SHS_LocalizedStringForSounds(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v9 = CFSTR("FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_MESSAGE");
  else
    v9 = CFSTR("FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_MESSAGE");
  SHS_LocalizedStringForSounds(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  SHS_LocalizedStringForSounds(CFSTR("FORGET_AUDIO_ACCESSORIES_CANCEL_BUTTON"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  v15 = (void *)MEMORY[0x24BEBD3A8];
  SHS_LocalizedStringForSounds(v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __77__SHSHeadphoneAudioAccessoriesController_confirmForgetAudioAccessoriesAction__block_invoke;
  v21 = &unk_24F197AC8;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17, v18, v19, v20, v21);

  -[SHSHeadphoneAudioAccessoriesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __77__SHSHeadphoneAudioAccessoriesController_confirmForgetAudioAccessoriesAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deleteAllAudioAccessoryData");

}

- (void)deleteAllAudioAccessoryData
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SHSHeadphoneAudioAccessoriesController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("SHSForgetAudioAccessoryKey"), 1);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE0A160], 0, 0, 1u);
  -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openSensitiveURL:withOptions:", v6, 0);

  }
}

- (void)setConnectedToHeadphonesEnabled:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "setPreferenceFor:value:", *MEMORY[0x24BE0A1A0], v7);

}

- (id)getConnectedToHeadphonesEnabled
{
  void *v2;
  void *v3;

  -[SHSHeadphoneAudioAccessoriesController audioSettingsManager](self, "audioSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioSettingsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end
