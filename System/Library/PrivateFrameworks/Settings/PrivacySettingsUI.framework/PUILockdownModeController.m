@implementation PUILockdownModeController

- (PUILockdownModeController)init
{
  PUILockdownModeController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PUILockdownModeController;
  v2 = -[PUILockdownModeController init](&v15, sel_init);
  if (v2)
  {
    -[PUILockdownModeController setLockdownModeEnabled:](v2, "setLockdownModeEnabled:", +[PUILockdownModeUtilities isLockdownModeEnabled](PUILockdownModeUtilities, "isLockdownModeEnabled"));
    if (-[PUILockdownModeController lockdownModeEnabled](v2, "lockdownModeEnabled"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
      -[PUILockdownModeController setClient:](v2, "setClient:", v3);

      -[PUILockdownModeController client](v2, "client");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v5 = objc_msgSend(v4, "get2GSwitchEnabledSync:", &v14);
      v6 = v14;
      -[PUILockdownModeController setHas2GSupport:](v2, "setHas2GSupport:", v5);

      if (v6)
      {
        _PUILoggingFacility();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[PUILockdownModeController init].cold.1();

      }
      if (-[PUILockdownModeController has2GSupport](v2, "has2GSupport"))
      {
        -[PUILockdownModeController client](v2, "client");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v9 = objc_msgSend(v8, "get2GUserPreferenceSync:", &v13);
        v10 = v13;

        -[PUILockdownModeController set_2GEnabled:](v2, "set_2GEnabled:", v9);
        if (v10)
        {
          _PUILoggingFacility();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v10;
            _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "Error getting if 2G is enabled: %@", buf, 0xCu);
          }

        }
      }
      else
      {
        v10 = v6;
      }

    }
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeController;
  -[PUILockdownModeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUILockdownModeController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeController;
  -[PUILockdownModeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUILockdownModeController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  PUI_BundleForPrivacySettingsFramework();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("LOCKDOWN_MODE"), CFSTR("LockdownMode"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCKDOWN_MODE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILockdownModeController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v11, v12);

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)refreshLinkStatusInParent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80618]));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]));

}

- (void)dataDidChange
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__PUILockdownModeController_dataDidChange__block_invoke;
  v2[3] = &unk_1EA26CB38;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __42__PUILockdownModeController_dataDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)updateSpecifiersForImposedSettings
{
  id v3;

  if (-[PUILockdownModeController lockdownModeEnabled](self, "lockdownModeEnabled"))
  {
    if (-[PUILockdownModeController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("LOCKDOWN_MODE_OPTIONS_GROUP")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PUILockdownModeController lockdownModeOptionsSpecifiers](self, "lockdownModeOptionsSpecifiers");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PUILockdownModeController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v3, 0);

    }
  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = +[PUILockdownModeUtilities getCanSetLockdownMode](PUILockdownModeUtilities, "getCanSetLockdownMode");
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("PUIOnboardingCellDelegateKey"));

    objc_msgSend(v5, "addObject:", v7);
    v9 = -[PUILockdownModeController lockdownModeEnabled](self, "lockdownModeEnabled");
    v10 = (void *)MEMORY[0x1E0D804E8];
    if (v9)
    {
      PUI_LocalizedStringForLockdownMode(CFSTR("STATE_SPECIFIER_TURN_OFF"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteButtonSpecifierWithName:target:action:", v11, self, sel_didTapOnboardingLockdownModeButton);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PUI_LocalizedStringForLockdownMode(CFSTR("STATE_SPECIFIER_TURN_ON"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 13, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1EA27E8B8, *MEMORY[0x1E0D806F8]);
      objc_msgSend(v12, "setButtonAction:", sel_didTapOnboardingLockdownModeButton);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D80808]);

    objc_msgSend(v5, "addObject:", v12);
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)lockdownModeOptionsSpecifiers
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[10];

  v60[8] = *MEMORY[0x1E0C80C00];
  -[PUILockdownModeController _lockdownModeOptionsSpecifiers](self, "_lockdownModeOptionsSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v46 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("LOCKDOWN_MODE_OPTIONS_GROUP"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:");
    getLocalizedDeviceName();
    v4 = objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_MESSAGES_HEADER"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v45;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_MESSAGES_CONTENT"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v43;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_FACETIME_HEADER"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v42;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_FACETIME_CONTENT"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v40;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WEB_HEADER"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v39;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WEB_CONTENT"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v37;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_SHARED_ALBUMS_HEADER"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v36;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_SHARED_ALBUMS_CONTENT"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v34;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_USB_HEADER"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v33;
    v5 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_USB_CONTENT"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v32, v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v30;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WIRELESS_CONNECTIVITY_HEADER"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v29;
    -[PUILockdownModeController has2GSupport](self, "has2GSupport");
    SFLocalizableWAPIStringKeyForKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLockdownMode(v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v6;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_REMOTE_HEADER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v7;
    v8 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_REMOTE_CONTENT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v4;
    objc_msgSend(v8, "stringWithFormat:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v60[6] = v11;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_PROFILES_HEADER"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v12;
    PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_PROFILES_CONTENT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __58__PUILockdownModeController_lockdownModeOptionsSpecifiers__block_invoke;
    v49[3] = &unk_1EA26CE50;
    v49[4] = self;
    v16 = v15;
    v50 = v16;
    v17 = v46;
    v51 = v17;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v49);
    v18 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLockdownMode(CFSTR("WEB_CONTENT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addObject:", v20);
    if (-[PUILockdownModeController has2GSupport](self, "has2GSupport"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", &stru_1EA26D430);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForLockdownMode(CFSTR("ENABLE_2G_FOOTER"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperty:forKey:", v22, *MEMORY[0x1E0D80848]);

      objc_msgSend(v17, "addObject:", v21);
      v23 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForLockdownMode(CFSTR("ENABLE_2G"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, self, sel_set2GEnabled_specifier_, sel__2GEnabled_, 0, 6, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setIdentifier:", CFSTR("Enable_2G"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
      objc_msgSend(v17, "addObject:", v25);

    }
    -[PUILockdownModeController set_lockdownModeOptionsSpecifiers:](self, "set_lockdownModeOptionsSpecifiers:", v17);

  }
  -[PUILockdownModeController _lockdownModeOptionsSpecifiers](self, "_lockdownModeOptionsSpecifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __58__PUILockdownModeController_lockdownModeOptionsSpecifiers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, *(_QWORD *)(a1 + 32), 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D80978]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80950]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PUITableCellNoSeparator"));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

- (BOOL)lockdownModeEnabled
{
  return +[PUILockdownModeUtilities isLockdownModeEnabled](PUILockdownModeUtilities, "isLockdownModeEnabled");
}

- (void)openLearnMorePage
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getSFSafariViewControllerClass_softClass_0;
  v14 = getSFSafariViewControllerClass_softClass_0;
  if (!getSFSafariViewControllerClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSFSafariViewControllerClass_block_invoke_0;
    v10[3] = &unk_1EA26B260;
    v10[4] = &v11;
    __getSFSafariViewControllerClass_block_invoke_0((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  v5 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212650"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithURL:", v6);

  -[PUILockdownModeController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PUILockdownModeController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    -[PUILockdownModeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)didTapOnboardingLockdownModeButton
{
  if (-[PUILockdownModeController lockdownModeEnabled](self, "lockdownModeEnabled"))
    -[PUILockdownModeController presentConfirmationAlert:hasPairedWatch:](self, "presentConfirmationAlert:hasPairedWatch:", 0, 0);
  else
    -[PUILockdownModeController presentOnboardingController](self, "presentOnboardingController");
}

- (void)set2GEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0D80990]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v8) & 1) == 0)
  {
    objc_initWeak(location, self);
    if (objc_msgSend(v6, "BOOLValue"))
    {
      PUI_LocalizedStringForLockdownMode(CFSTR("2G_ALERT_ENABLE_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForLockdownMode(CFSTR("2G_ALERT_ENABLE_MESSAGE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForLockdownMode(CFSTR("2G_ALERT_ENABLE_BUTTON"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke;
      v29[3] = &unk_1EA26CEA0;
      v29[4] = self;
      v13 = v7;
      v30 = v13;
      v14 = v8;
      v31 = v14;
      objc_copyWeak(&v32, location);
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v15);

      v16 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForLockdownMode(CFSTR("CANCEL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_103;
      v25[3] = &unk_1EA26CEC8;
      v26 = v13;
      v27 = v14;
      objc_copyWeak(&v28, location);
      objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v18);

      -[PUILockdownModeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
      objc_destroyWeak(&v28);

      objc_destroyWeak(&v32);
    }
    else
    {
      -[PUILockdownModeController client](self, "client");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_104;
      v21[3] = &unk_1EA26CE78;
      v22 = v7;
      v23 = v8;
      objc_copyWeak(&v24, location);
      objc_msgSend(v19, "set2GUserPreference:completion:", 0, v21);

      objc_destroyWeak(&v24);
      v9 = v22;
    }

    objc_destroyWeak(location);
  }

}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(a1[4], "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2;
  v5[3] = &unk_1EA26CE78;
  v6 = a1[5];
  v7 = a1[6];
  objc_copyWeak(&v8, a1 + 7);
  objc_msgSend(v4, "set2GUserPreference:completion:", 1, v5);

  objc_destroyWeak(&v8);
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80990]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

  }
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_103(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80990]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_104(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_104_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80990]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

  }
}

- (id)_2GEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUILockdownModeController _2GEnabled](self, "_2GEnabled", a3));
}

- (void)didTapEnableLockdownModeButton:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PUILockdownModeController_didTapEnableLockdownModeButton___block_invoke;
  v3[3] = &unk_1EA26CEF0;
  v3[4] = self;
  -[PUILockdownModeController getEligibleDevicesWithCompletion:](self, "getEligibleDevicesWithCompletion:", v3);
}

uint64_t __60__PUILockdownModeController_didTapEnableLockdownModeButton___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentConfirmationAlert:hasPairedWatch:", a2, a3);
}

- (void)presentOnboardingController
{
  void *v3;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;

  getLocalizedDeviceName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D651A8]);
  PUI_LocalizedStringForLockdownMode(CFSTR("LOCKDOWN_MODE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  PUI_LocalizedStringForLockdownMode(CFSTR("ONBOARDING_UI_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithTitle:detailText:symbolName:contentLayout:", v5, v8, 0, 2);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_MESSAGES_HEADER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_MESSAGES_CONTENT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v10, v11);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_FACETIME_HEADER"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_FACETIME_CONTENT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v12, v13);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WEB_HEADER"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WEB_CONTENT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v14, v15);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_SHARED_ALBUMS_HEADER"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_SHARED_ALBUMS_CONTENT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v16, v17);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_USB_HEADER"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_USB_CONTENT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v20, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v18, v21);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_WIRELESS_CONNECTIVITY_HEADER"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILockdownModeController has2GSupport](self, "has2GSupport");
  SFLocalizableWAPIStringKeyForKey();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v22, v24);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_REMOTE_HEADER"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_REMOTE_CONTENT"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v25, v26);

  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_PROFILES_HEADER"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3940];
  PUI_LocalizedStringForLockdownMode(CFSTR("SECTION_PROFILES_CONTENT"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", v29, v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSectionWithHeader:content:", v27, v30);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLockdownMode(CFSTR("ENABLE_LOCKDOWN_MODE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTitle:forState:", v32, 0);

  objc_msgSend(v31, "addTarget:action:forEvents:", self, sel_didTapEnableLockdownModeButton_, 0x2000);
  objc_msgSend(v9, "buttonTray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addButton:", v31);

  v34 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v35 = (void *)MEMORY[0x1E0DC3428];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __56__PUILockdownModeController_presentOnboardingController__block_invoke;
  v41[3] = &unk_1EA26BF60;
  v42 = v9;
  v36 = v9;
  objc_msgSend(v35, "actionWithHandler:", v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v34, "initWithBarButtonSystemItem:primaryAction:", 1, v37);

  objc_msgSend(v36, "navigationItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLeftBarButtonItem:", v38);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v36);
  -[PUILockdownModeController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v40, 3);

}

void __56__PUILockdownModeController_presentOnboardingController__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentConfirmationAlert:(id)a3 hasPairedWatch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  _QWORD v34[5];
  BOOL v35;

  v4 = a4;
  v6 = a3;
  v7 = -[PUILockdownModeController lockdownModeEnabled](self, "lockdownModeEnabled");
  v33 = !v7;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isiPhone");

  getLocalizedDeviceName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v11 = CFSTR("CONFIRM_ALERT_DISABLE_TITLE");
  else
    v11 = CFSTR("CONFIRM_ALERT_ENABLE_TITLE");
  PUI_LocalizedStringForLockdownMode(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "count"))
  {
    v13 = v4 & v9;
    v14 = (void *)MEMORY[0x1E0CB3940];
    if (v13 == 1)
    {
      v15 = CFSTR("CONFIRM_ALERT_ENABLE_ALL_DEVICES_WITH_WATCH_MESSAGE");
      v16 = CFSTR("CONFIRM_ALERT_DISABLE_ALL_DEVICES_WITH_WATCH_MESSAGE");
    }
    else
    {
      v15 = CFSTR("CONFIRM_ALERT_ENABLE_ALL_DEVICES_MESSAGE");
      v16 = CFSTR("CONFIRM_ALERT_DISABLE_ALL_DEVICES_MESSAGE");
    }
  }
  else
  {
    v17 = v4 & v9;
    v14 = (void *)MEMORY[0x1E0CB3940];
    if (v17 == 1)
    {
      v15 = CFSTR("CONFIRM_ALERT_ENABLE_WITH_WATCH_MESSAGE");
      v16 = CFSTR("CONFIRM_ALERT_DISABLE_WITH_WATCH_MESSAGE");
    }
    else
    {
      v15 = CFSTR("CONFIRM_ALERT_ENABLE_MESSAGE");
      v16 = CFSTR("CONFIRM_ALERT_DISABLE_MESSAGE");
    }
  }
  if (v7)
    v18 = (__CFString *)v16;
  else
    v18 = (__CFString *)v15;
  PUI_LocalizedStringForLockdownMode(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v22 = CFSTR("CONFIRM_ALERT_DISABLE_BUTTON");
  else
    v22 = CFSTR("CONFIRM_ALERT_ENABLE_BUTTON");
  if (v7)
    v23 = 2;
  else
    v23 = 0;
  PUI_LocalizedStringForLockdownMode(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __69__PUILockdownModeController_presentConfirmationAlert_hasPairedWatch___block_invoke;
  v34[3] = &unk_1EA26B830;
  v34[4] = self;
  v35 = v33;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v26, v23, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForLockdownMode(CFSTR("CANCEL"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v30);

  -[PUILockdownModeController presentedViewController](self, "presentedViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[PUILockdownModeController presentedViewController](self, "presentedViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presentViewController:animated:completion:", v21, 1, 0);

  }
  else
  {
    -[PUILockdownModeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
  }

}

uint64_t __69__PUILockdownModeController_presentConfirmationAlert_hasPairedWatch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLockdownModeEnabled:forAllDevices:", *(unsigned __int8 *)(a1 + 40), 1);
}

- (void)presentErrorAlert
{
  _BOOL4 v3;
  BOOL v4;
  __CFString *v5;
  __CFString *v6;
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
  id v17;

  v3 = -[PUILockdownModeController lockdownModeEnabled](self, "lockdownModeEnabled");
  v4 = !v3;
  if (v3)
    v5 = CFSTR("ERROR_ALERT_DISABLE_TITLE");
  else
    v5 = CFSTR("ERROR_ALERT_ENABLE_TITLE");
  if (v4)
    v6 = CFSTR("ERROR_ALERT_ENABLE_MESSAGE");
  else
    v6 = CFSTR("ERROR_ALERT_DISABLE_MESSAGE");
  PUI_LocalizedStringForLockdownMode(v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  PUI_LocalizedStringForLockdownMode(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getLocalizedDeviceName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForLockdownMode(CFSTR("OK"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  -[PUILockdownModeController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PUILockdownModeController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    -[PUILockdownModeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }

}

- (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke;
  v4[3] = &unk_1EA26B380;
  v4[4] = self;
  +[PUILockdownModeUtilities setLockdownModeEnabled:forAllDevices:completion:](PUILockdownModeUtilities, "setLockdownModeEnabled:forAllDevices:completion:", a3, a4, v4);
}

void __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_cold_1();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_153;
    block[3] = &unk_1EA26B358;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentErrorAlert");
}

- (void)getEligibleDevicesWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, BOOL);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  objc_class *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_semaphore_t v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  _QWORD block[4];
  NSObject *v42;
  id v43;
  void (**v44)(id, _QWORD, BOOL);
  BOOL v45;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[3];
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  id v62[3];

  v62[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, BOOL))a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PUIGetActivePairedDevice();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v6 != 0;
  if (v5)
  {
    objc_msgSend(v5, "aa_altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_authKitAccountForAltDSID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "aa_needsToVerifyTerms") & 1) != 0)
      goto LABEL_14;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2050000000;
    v11 = (void *)getAKAccountManagerClass_softClass;
    v61 = getAKAccountManagerClass_softClass;
    if (!getAKAccountManagerClass_softClass)
    {
      v53 = MEMORY[0x1E0C809B0];
      v54 = 3221225472;
      v55 = (uint64_t)__getAKAccountManagerClass_block_invoke;
      v56 = &unk_1EA26B260;
      v57 = &v58;
      __getAKAccountManagerClass_block_invoke((uint64_t)&v53);
      v11 = (void *)v59[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v58, 8);
    objc_msgSend(v12, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "securityLevelForAccount:", v10) == 4;

    if (!v14)
    {
LABEL_14:
      v3[2](v3, 0, v7 != 0);
    }
    else
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2050000000;
      v15 = (void *)getAKDeviceListRequestContextClass_softClass;
      v61 = getAKDeviceListRequestContextClass_softClass;
      if (!getAKDeviceListRequestContextClass_softClass)
      {
        v53 = MEMORY[0x1E0C809B0];
        v54 = 3221225472;
        v55 = (uint64_t)__getAKDeviceListRequestContextClass_block_invoke;
        v56 = &unk_1EA26B260;
        v57 = &v58;
        __getAKDeviceListRequestContextClass_block_invoke((uint64_t)&v53);
        v15 = (void *)v59[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v58, 8);
      v17 = objc_alloc_init(v16);
      objc_msgSend(v17, "setAltDSID:", v9);
      objc_msgSend(v17, "setIncludeFamilyDevices:", 0);
      objc_msgSend(v17, "setIncludeUntrustedDevices:", 0);
      v53 = 0;
      v54 = (uint64_t)&v53;
      v55 = 0x2020000000;
      v18 = (id *)getAKServiceNameiCloudSymbolLoc_ptr;
      v56 = (void *)getAKServiceNameiCloudSymbolLoc_ptr;
      if (!getAKServiceNameiCloudSymbolLoc_ptr)
      {
        v19 = (void *)AuthKitLibrary_0();
        v18 = (id *)dlsym(v19, "AKServiceNameiCloud");
        *(_QWORD *)(v54 + 24) = v18;
        getAKServiceNameiCloudSymbolLoc_ptr = (uint64_t)v18;
      }
      _Block_object_dispose(&v53, 8);
      if (!v18)
      {
        __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
        __break(1u);
      }
      v62[0] = *v18;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v62[0];
      objc_msgSend(v20, "arrayWithObjects:count:", v62, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setServices:", v22);
      objc_msgSend(v17, "setOperatingSystems:", &unk_1EA27EBD0);
      v23 = MGCopyAnswer();
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v52 = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
      v39 = v10;
      v25 = dispatch_semaphore_create(0);
      v58 = 0;
      v59 = &v58;
      v60 = 0x2050000000;
      v26 = (void *)getAKAppleIDAuthenticationControllerClass_softClass_0;
      v61 = getAKAppleIDAuthenticationControllerClass_softClass_0;
      if (!getAKAppleIDAuthenticationControllerClass_softClass_0)
      {
        v53 = MEMORY[0x1E0C809B0];
        v54 = 3221225472;
        v55 = (uint64_t)__getAKAppleIDAuthenticationControllerClass_block_invoke_0;
        v56 = &unk_1EA26B260;
        v57 = &v58;
        __getAKAppleIDAuthenticationControllerClass_block_invoke_0((uint64_t)&v53);
        v26 = (void *)v59[3];
      }
      v40 = (void *)v24;
      v27 = (void *)v23;
      v37 = v9;
      v38 = v8;
      v28 = objc_retainAutorelease(v26);
      _Block_object_dispose(&v58, 8);
      v29 = objc_alloc_init(v28);
      v30 = MEMORY[0x1E0C809B0];
      v31 = v29;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke;
      v46[3] = &unk_1EA26CF18;
      v32 = v25;
      v47 = v32;
      v36 = v27;
      v48 = v36;
      v33 = v40;
      v49 = v33;
      v50 = v51;
      objc_msgSend(v31, "fetchDeviceListWithContext:completion:", v17, v46);
      block[0] = v30;
      block[1] = 3221225472;
      block[2] = __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_167;
      block[3] = &unk_1EA26CF40;
      v42 = v32;
      v43 = v33;
      v44 = v3;
      v45 = v38;
      v34 = v33;
      v35 = v32;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v9 = v37;
      v10 = v39;

      _Block_object_dispose(v51, 8);
    }

  }
  else
  {
    v3[2](v3, 0, v6 != 0);
  }

}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  BOOL v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  id v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v44 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    v45 = v8;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v52;
      do
      {
        v13 = 0;
        v46 = v11;
        do
        {
          if (*(_QWORD *)v52 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
          objc_msgSend(v14, "serialNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15 && (objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_14;
            objc_msgSend(v14, "lastUpdatedDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastUpdatedDate");
            v19 = v12;
            v20 = a1;
            v21 = v9;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v18, "compare:", v22);

            v9 = v21;
            a1 = v20;
            v12 = v19;
            v11 = v46;

            v8 = v45;
            if (v23 == 1)
LABEL_14:
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v16);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v11);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v8, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v29, "lastUpdatedDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSinceNow");
          v32 = v31 / 86400.0;

          if (v32 <= 7.0)
          {
            objc_msgSend(v29, "operatingSystemVersion");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("."));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "firstObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "integerValue");

            objc_msgSend(v29, "operatingSystemName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("iOS"));

            if (v38)
              v39 = v36 < 17;
            else
              v39 = 1;
            if (!v39)
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
            objc_msgSend(v29, "operatingSystemName");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("macOS"));

            if (v41 && v36 >= 14)
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
            objc_msgSend(v29, "operatingSystemName");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "isEqualToString:", CFSTR("watchOS")) && v36 >= 10)
            {
              v43 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

              if (!v43)
              {
                objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
              }
            }
            else
            {

            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v26);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v6 = 0;
    v5 = v44;
  }

}

uint64_t __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_167(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;

  v2 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), v2))
  {
    _PUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_167_cold_1(v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUILockdownModeController;
  v6 = a4;
  -[PUILockdownModeController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILockdownModeController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v13.receiver, v13.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D80780]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isEqual:", objc_opt_class());

  if ((_DWORD)v6)
  {
    objc_msgSend(v7, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

  }
  objc_msgSend(v8, "propertyForKey:", CFSTR("PUITableCellNoSeparator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);

  return v7;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)has2GSupport
{
  return self->_has2GSupport;
}

- (void)setHas2GSupport:(BOOL)a3
{
  self->_has2GSupport = a3;
}

- (BOOL)_2GEnabled
{
  return self->__2GEnabled;
}

- (void)set_2GEnabled:(BOOL)a3
{
  self->__2GEnabled = a3;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (NSArray)_lockdownModeOptionsSpecifiers
{
  return self->__lockdownModeOptionsSpecifiers;
}

- (void)set_lockdownModeOptionsSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->__lockdownModeOptionsSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lockdownModeOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, v0, v1, "Error getting if 2G is supported: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, v0, v1, "Error enabling 2G: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_104_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, v0, v1, "Error disabling 2G: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, v0, v1, "Error setting Lockdown Mode state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, v0, v1, "Error fetching device list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_167_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "Waited too long for fetchDeviceList. Returning…", v1, 2u);
}

@end
