@implementation PSGMousePointerViewController

- (PSGMousePointerViewController)init
{
  PSGMousePointerViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGMousePointerViewController;
  v2 = -[PSGMousePointerViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_pointerDevicesDidChange, PSGPointerDevicesDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGMousePointerViewController;
  -[PSGMousePointerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)PSGMousePointerViewController;
  -[PSGMousePointerViewController viewDidAppear:](&v15, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/POINTERS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMouse");

  v7 = objc_alloc(MEMORY[0x24BDD19B8]);
  if (v6)
    v8 = CFSTR("TRACKPAD_MOUSE");
  else
    v8 = CFSTR("TRACKPAD");
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithKey:table:locale:bundleURL:", v8, CFSTR("General"), v9, v11);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGMousePointerViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.trackpad-and-mouse"), v12, v14, v4);

}

- (void)pointerDevicesDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointerDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[PSGMousePointerViewController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    -[PSGMousePointerViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[3] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasMouse");

    if (v6)
    {
      PSG_LocalizedStringForPointers(CFSTR("TRACKPAD_MOUSE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGMousePointerViewController setTitle:](self, "setTitle:", v7);

    }
    v8 = (void *)objc_opt_new();
    v9 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForPointers(CFSTR("TRACKING_SPEED"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupSpecifierWithID:name:", CFSTR("TRACKING_SPEED_GROUP"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v11;
    objc_msgSend(v8, "addObject:", v11);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setTrackingSpeed_specifier_, sel_trackingSpeed_, 0, 5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", CFSTR("TRACKING_SPEED"));
    objc_msgSend(v12, "setProperty:forKey:", &unk_24F9D4440, *MEMORY[0x24BE75CA8]);
    objc_msgSend(v12, "setProperty:forKey:", &unk_24F9D4458, *MEMORY[0x24BE759B0]);
    objc_msgSend(v12, "setProperty:forKey:", &unk_24F9D4440, *MEMORY[0x24BE759A8]);
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75C80]);
    v13 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C88]);
    objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x24BE75C98]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("tortoise.fill"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v14, *MEMORY[0x24BE75C90]);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("hare.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v15, *MEMORY[0x24BE75CA0]);

    objc_msgSend(v8, "addObject:", v12);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SCROLLING_GROUP"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForPointers(CFSTR("SCROLLING_FOOTER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

    v56 = v16;
    objc_msgSend(v8, "addObject:", v16);
    v18 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForPointers(CFSTR("NATURAL_SCROLLING"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, sel_setNaturalScrolling_specifier_, sel_naturalScrolling_, 0, 6, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setIdentifier:", CFSTR("NATURAL_SCROLLING"));
    v55 = v20;
    objc_msgSend(v8, "addObject:", v20);
    +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v21, "hasTrackpad");

    if ((_DWORD)v16)
    {
      v22 = (void *)MEMORY[0x24BE75590];
      PSG_LocalizedStringForPointers(CFSTR("TRACKPAD"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "groupSpecifierWithID:name:", CFSTR("TRACKPAD_GROUP"), v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)v24;
      objc_msgSend(v8, "addObject:", v24);
      v25 = (void *)MEMORY[0x24BE75590];
      PSG_LocalizedStringForPointers(CFSTR("TAP_TO_CLICK"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, sel_setTapToClick_specifier_, sel_tapToClick_, 0, 6, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setIdentifier:", CFSTR("TAP_TO_CLICK"));
      objc_msgSend(v8, "addObject:", v27);
      v28 = (void *)MEMORY[0x24BE75590];
      PSG_LocalizedStringForPointers(CFSTR("TWO_FINGER_SECONDARY_CLICK"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, sel_setTwoFingerSecondaryClick_specifier_, sel_twoFingerSecondaryClick_, 0, 6, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "setIdentifier:", CFSTR("TWO_FINGER_SECONDARY_CLICK"));
      objc_msgSend(v8, "addObject:", v30);
      +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v31, "trackpadSupportsSystemHaptics");

      if ((_DWORD)v23)
      {
        v32 = (void *)MEMORY[0x24BE75590];
        PSG_LocalizedStringForPointersHiding(CFSTR("SYSTEM_HAPTICS"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "setIdentifier:", CFSTR("SYSTEM_HAPTICS"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("com.apple.preferences.sounds"), *MEMORY[0x24BE759E8]);
        objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("effects-trackpad-haptic"), *MEMORY[0x24BE75B50]);
        objc_msgSend(v34, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
        objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("com.apple.preferences.sounds.changed"), *MEMORY[0x24BE75D98]);
        objc_msgSend(v8, "addObject:", v34);

      }
    }
    +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "hasMouse");

    if (v36)
    {
      +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "hasMagicMouse");

      v39 = (void *)MEMORY[0x24BE75590];
      if (v38)
        v40 = CFSTR("MAGIC_MOUSE");
      else
        v40 = CFSTR("MOUSE");
      PSG_LocalizedStringForPointers(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "groupSpecifierWithID:name:", CFSTR("MOUSE"), v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v42;
      objc_msgSend(v8, "addObject:", v42);
      v43 = (void *)MEMORY[0x24BE75590];
      PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, self, sel_setSecondaryClick_specifier_, sel_secondaryClick_, objc_opt_class(), 2, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "setIdentifier:", CFSTR("SECONDARY_CLICK"));
      if (v38)
      {
        PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK_OFF"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v46;
        PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK_RIGHT"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v47;
        PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK_LEFT"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v48;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = &unk_24F9D4668;
      }
      else
      {
        PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK_RIGHT"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v46;
        PSG_LocalizedStringForPointers(CFSTR("SECONDARY_CLICK_LEFT"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = v47;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = &unk_24F9D4680;
      }

      objc_msgSend(v45, "setValues:titles:", v50, v49);
      objc_msgSend(v8, "addObject:", v45);

    }
    v51 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setSecondaryClick:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalDevicePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasMagicMouse");

  v9 = (int)objc_msgSend(v4, "intValue");
  if (v8)
    objc_msgSend(v6, "setButtonConfigurationForVirtualButtonMice:", v9);
  else
    objc_msgSend(v6, "setButtonConfigurationForHardwareButtonMice:", v9);
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGlobalDevicePreferences:", v6);

  _PSGLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[PSGMousePointerViewController setSecondaryClick:specifier:]";
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }

}

- (id)secondaryClick:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasMagicMouse");

  v5 = (void *)MEMORY[0x24BDD16E0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalDevicePreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = objc_msgSend(v7, "buttonConfigurationForVirtualButtonMice");
  else
    v9 = objc_msgSend(v7, "buttonConfigurationForHardwareButtonMice");
  objc_msgSend(v5, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _PSGLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[PSGMousePointerViewController secondaryClick:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)setTrackingSpeed:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrackingSpeedIndex:", objc_msgSend(v4, "intValue"));

  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PSGMousePointerViewController setTrackingSpeed:specifier:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)trackingSpeed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "trackingSpeedIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSGMousePointerViewController trackingSpeed:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)setTapToClick:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalDevicePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnableTapToClick:", objc_msgSend(v4, "BOOLValue"));
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalDevicePreferences:", v6);

  _PSGLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[PSGMousePointerViewController setTapToClick:specifier:]";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_22E024000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }

}

- (id)tapToClick:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalDevicePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableTapToClick"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _PSGLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[PSGMousePointerViewController tapToClick:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)setTwoFingerSecondaryClick:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalDevicePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnableTwoFingerSecondaryClick:", objc_msgSend(v4, "BOOLValue"));
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalDevicePreferences:", v6);

  _PSGLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[PSGMousePointerViewController setTwoFingerSecondaryClick:specifier:]";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_22E024000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }

}

- (id)twoFingerSecondaryClick:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalDevicePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableTwoFingerSecondaryClick"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _PSGLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[PSGMousePointerViewController twoFingerSecondaryClick:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)setNaturalScrolling:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalDevicePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnableNaturalScrolling:", objc_msgSend(v4, "BOOLValue"));
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalDevicePreferences:", v6);

  _PSGLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[PSGMousePointerViewController setNaturalScrolling:specifier:]";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_22E024000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }

}

- (id)naturalScrolling:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalDevicePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableNaturalScrolling"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _PSGLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[PSGMousePointerViewController naturalScrolling:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PSGMousePointerViewController;
  v6 = a4;
  -[PSGMousePointerViewController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSGMousePointerViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v20.receiver, v20.super_class);

  -[PSGMousePointerViewController specifierAtIndex:](self, "specifierAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "isEqualToString:", CFSTR("TRACKING_SPEED"));

  if ((_DWORD)v6)
  {
    v11 = v7;
    objc_msgSend(v11, "control");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "segmentedSliderTrackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "_accessibilityHigherContrastTintColorForColor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.596078431, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_accessibilityHigherContrastTintColorForColor:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "_minValueView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v15);

    objc_msgSend(v12, "_maxValueView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v15);

  }
  return v7;
}

@end
