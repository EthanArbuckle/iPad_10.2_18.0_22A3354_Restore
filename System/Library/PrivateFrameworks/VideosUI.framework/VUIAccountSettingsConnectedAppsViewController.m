@implementation VUIAccountSettingsConnectedAppsViewController

- (VUIAccountSettingsConnectedAppsViewController)init
{
  VUIAccountSettingsConnectedAppsViewController *v2;
  VUIAccountSettingsConnectedAppsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIAccountSettingsConnectedAppsViewController;
  v2 = -[VUIAccountSettingsConnectedAppsViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VUIAccountSettingsConnectedAppsViewController setShowsDoneButton:](v2, "setShowsDoneButton:", 0);
  return v3;
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIAccountSettingsConnectedAppsViewController;
  -[VUIAccountSettingsConnectedAppsViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[VUIAccountSettingsConnectedAppsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS_CONNECTED_APPS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[VUIAccountSettingsConnectedAppsViewController _configureDoneButton](self, "_configureDoneButton");
  +[VUIMetricsPageEventData createWithPageType:](VUIMetricsPageEventData, "createWithPageType:", CFSTR("connectedApps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordPage:", v6);

  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("ConnectedApps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsConnectedAppsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  PSSpecifier *v8;
  PSSpecifier *appGroup;
  void *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - specifiers - existing specifiers are nil, initializing them", buf, 2u);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!self->_appGroup)
    {
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - specifiers - existing app group is nil, adding new appGroupSpecifier", v12, 2u);
      }

      -[VUIAccountSettingsConnectedAppsViewController _appGroupSpecifier](self, "_appGroupSpecifier");
      v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      appGroup = self->_appGroup;
      self->_appGroup = v8;

      objc_msgSend(v6, "addObject:", self->_appGroup);
      -[VUIAccountSettingsConnectedAppsViewController _loadAppGroup](self, "_loadAppGroup");
    }
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_appGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("SETTINGS_APPS_GROUP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseStringWithLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", CFSTR("VUISpinnerHeaderView"), *MEMORY[0x1E0D80850]);
  -[VUIAccountSettingsConnectedAppsViewController _addPrivacyFooterToGroup:](self, "_addPrivacyFooterToGroup:", v10);

  return v10;
}

- (void)_addPrivacyFooterToGroup:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSRange v16;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80818]);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("SETTINGS_APPS_GROUP_FOOTER_FORMAT"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v11, *MEMORY[0x1E0D80838]);
  v16.location = objc_msgSend(v11, "rangeOfString:", v10);
  NSStringFromRange(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v12, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v13, *MEMORY[0x1E0D80830]);

  NSStringFromSelector(sel__showPrivacySheet_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v14, *MEMORY[0x1E0D80820]);

}

- (void)_loadAppGroup
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke;
  v3[3] = &unk_1E9F9C8D0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  +[VUIAccountSettingsConnectedAppsViewController fetchConnectedAppsWithCompletion:](VUIAccountSettingsConnectedAppsViewController, "fetchConnectedAppsWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - loaded group for apps: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v9 = objc_msgSend(v5, "count");
    if (v6 || !v9)
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_2((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

      objc_msgSend(WeakRetained, "removeSpecifier:", WeakRetained[172]);
    }
    else
    {
      if (objc_msgSend(WeakRetained[173], "count"))
      {
        VUIDefaultLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_msgSend(WeakRetained[173], "count");
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = v11 != 0;
          _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - app specifier count is above 0: %d", buf, 8u);
        }

        objc_msgSend(WeakRetained, "removeContiguousSpecifiers:animated:", WeakRetained[173], 0);
      }
      objc_initWeak((id *)buf, WeakRetained);
      dispatch_get_global_queue(2, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_33;
      block[3] = &unk_1E9F9D178;
      v13 = v5;
      v14 = *(_QWORD *)(a1 + 32);
      v24 = v13;
      v25 = v14;
      objc_copyWeak(&v26, (id *)buf);
      dispatch_async(v12, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_1(v15);

  }
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_33(id *a1)
{
  uint64_t i;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;
  CGSize v40;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a1[4];
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v3 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(v2, "displayName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, a1[5], sel__toggleSpecifier_sender_, sel__accessStatusForSpecifier_, objc_opt_class(), 6, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "channelID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setIdentifier:", v6);

        objc_msgSend(v5, "setUserInfo:", v2);
        objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "channelID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "channelForID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[5], "_iconSize");
        v11 = v10;
        v13 = v12;
        objc_initWeak(&location, v5);
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v2, "channelID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v40.width = v11;
          v40.height = v13;
          NSStringFromCGSize(v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v15;
          v36 = 2112;
          v37 = v16;
          _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - begin fetching icon for channelID: %@ of size: %@", buf, 0x16u);

        }
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_41;
        v26[3] = &unk_1E9FA3028;
        objc_copyWeak(&v27, &location);
        v26[4] = v2;
        objc_copyWeak(&v28, a1 + 6);
        +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v9, v26, v11, v13);
        objc_msgSend(v20, "addObject:", v5);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_46;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v25, a1 + 6);
  v24 = v20;
  v17 = v20;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v25);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_41(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (v3)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  v7 = !v6;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "channelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 1024;
    v20 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - done fetching icon for channelID: %@ shouldSetSpecifier: %d", buf, 0x12u);

  }
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_42;
    v12[3] = &unk_1E9FA3000;
    objc_copyWeak(&v16, a1 + 6);
    v13 = v3;
    v10 = v5;
    v11 = a1[4];
    v14 = v10;
    v15 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

    objc_destroyWeak(&v16);
  }

}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    objc_msgSend(v3, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "channelID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - set and reload specifier id: %@ for channel: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", v5, *MEMORY[0x1E0D80870]);
    objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

  }
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_46(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - stopping app spinner and setting app specifiers", v4, 2u);
    }

    objc_msgSend(WeakRetained, "_stopAppSpinner");
    objc_storeStrong(WeakRetained + 173, *(id *)(a1 + 32));
    objc_msgSend(WeakRetained, "insertContiguousSpecifiers:afterSpecifier:animated:", *(_QWORD *)(a1 + 32), WeakRetained[172], 0);
  }

}

- (void)_startAppSpinner
{
  id v2;

  -[PSSpecifier propertyForKey:](self->_appGroup, "propertyForKey:", *MEMORY[0x1E0D80858]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showSpinner");

}

- (void)_stopAppSpinner
{
  id v2;

  -[PSSpecifier propertyForKey:](self->_appGroup, "propertyForKey:", *MEMORY[0x1E0D80858]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideSpinner");

}

- (CGSize)_iconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 29.0;
  v3 = 29.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_toggleSpecifier:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  __CFString **v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "channelForID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "externalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke;
  v21[3] = &unk_1E9FA3078;
  v21[4] = self;
  v22 = v6;
  v23 = v10;
  v24 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v6;
  objc_msgSend(v13, "fetchConfigurationWithCompletionHandler:", v21);

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("targetId");
  v25[1] = CFSTR("targetType");
  v26[0] = v8;
  v26[1] = CFSTR("switch");
  v25[2] = CFSTR("actionType");
  v18 = objc_msgSend(v16, "BOOLValue");
  v19 = VUIMetricsActionTypeAdd;
  if (!v18)
    v19 = VUIMetricsActionTypeRemove;
  v26[2] = *v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordClick:", v20);

}

void __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke(id *a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8[2];
  id location;

  v3 = (void *)objc_msgSend(a2, "vppaStatus");
  objc_initWeak(&location, a1[4]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke_2;
  v4[3] = &unk_1E9FA3050;
  objc_copyWeak(v8, &location);
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8[1] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 32), "BOOLValue") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if ((*(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL) == 2)
      objc_msgSend(WeakRetained, "_showVppaExpiredPrompt:", v2);
    else
      objc_msgSend(WeakRetained, "_promptToEnableChannel:withExternalID:", v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(WeakRetained, "_promptToDisableChannel:withExternalID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (id)_accessStatusForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsForChannelID:externalID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "accessStatus") == 1)
    v8 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v8 = (void *)MEMORY[0x1E0C9AAA0];

  return v8;
}

- (void)_showPrivacySheet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("targetId");
  v7[1] = CFSTR("targetType");
  v8[0] = CFSTR("privacyLink");
  v8[1] = CFSTR("link");
  v7[2] = CFSTR("actionType");
  v8[2] = CFSTR("privacyLink");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordClick:", v6);

}

- (void)_showVppaExpiredPrompt:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[VUIAccountSettingsConnectedAppsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke;
  v7[3] = &unk_1E9F98DF0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke(uint64_t a1)
{
  id v2;

  +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startVPPAConsentFlow:consentCancelButtonType:shouldForceVPPAPrompt:completion:", *(_QWORD *)(a1 + 32), 0, 0, &__block_literal_global_133);

}

void __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    VUIBoolLogString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - showVppaExpiredPrompt - Finished VPPA reconsent. Success: %@", (uint8_t *)&v7, 0xCu);

  }
  if (a3)
  {
    +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadConfigurationAfterVPPAChange");

  }
}

- (void)_promptToEnableChannel:(id)a3 withExternalID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  VUIAccountSettingsConnectedAppsViewController *v54;
  id v55;
  id location[2];

  v6 = a3;
  v46 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_IN_PROMPT_FORMAT"));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v11;
  v45 = (void *)v9;
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@ %@"), 0, v13, v9);
  v14 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_IN_TITLE_FORMAT"));
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v16;
  objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v19;
  if (-[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle") == 1)
    v20 = (void *)v19;
  else
    v20 = 0;
  v40 = v20;
  v43 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v40, v14, -[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_IN_FORMAT"));
  v24 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v24;
  objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v26);
  v27 = objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  v28 = (void *)MEMORY[0x1E0DC3448];
  v29 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke;
  v50[3] = &unk_1E9FA30E8;
  v30 = v22;
  v51 = v30;
  v47 = v46;
  v52 = v47;
  v31 = v6;
  v53 = v31;
  v54 = self;
  objc_copyWeak(&v55, location);
  v38 = (void *)v27;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v27, 0, v50);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:", CFSTR("CANCEL"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v29;
  v48[1] = 3221225472;
  v48[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_2;
  v48[3] = &unk_1E9FA3110;
  v48[4] = self;
  v36 = v30;
  v49 = v36;
  objc_msgSend(v33, "actionWithTitle:style:handler:", v35, 1, v48);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v32);
  objc_msgSend(v21, "addAction:", v37);
  -[VUIAccountSettingsConnectedAppsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);

  objc_destroyWeak(&v55);
  objc_destroyWeak(location);

}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:forChannelID:externalID:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "settingsForChannelID:externalID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Enabling channel %@", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0DC8838];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_67;
  v12[3] = &unk_1E9FA30C0;
  v13 = *(id *)(a1 + 48);
  v9 = v4;
  v14 = v9;
  v15 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v17 = v11;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  objc_msgSend(v8, "updateCloudStoreAppSettings:deleteHistory:completion:", v5, 0, v12);
  objc_destroyWeak(&v18);

}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_67(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Successfully enabled channel %@", buf, 0xCu);

    }
    +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadConfigurationAfterVPPAChange");

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Failed to sync opt-in to cloud, reverting", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setStatus:forChannelID:externalID:", 2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "specifierForID:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_68;
    v10[3] = &unk_1E9F9A938;
    objc_copyWeak(&v12, (id *)(a1 + 72));
    v11 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

    objc_destroyWeak(&v12);
  }
}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_68(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v2, 1);

}

- (void)_promptToDisableChannel:(id)a3 withExternalID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD aBlock[4];
  id v66;
  id v67;
  id v68;
  VUIAccountSettingsConnectedAppsViewController *v69;
  id v70;
  id location[2];

  v6 = a3;
  v54 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_OUT_PROMPT_FORMAT"));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@ %@ %@"), 0, v13, v14, v9);
  v15 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_OUT_TITLE_FORMAT"));
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v17;
  objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v19);
  v20 = objc_claimAutoreleasedReturnValue();

  v51 = (void *)v20;
  if (-[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle") == 1)
    v21 = (void *)v20;
  else
    v21 = 0;
  v50 = v21;
  v53 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v50, v15, -[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke;
  aBlock[3] = &unk_1E9FA3138;
  v24 = v22;
  v66 = v24;
  v49 = v54;
  v67 = v49;
  v55 = v6;
  v68 = v55;
  v69 = self;
  objc_copyWeak(&v70, location);
  v25 = _Block_copy(aBlock);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_OUT_FORMAT"));
  v27 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v11;

  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v55, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), 0, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v27;

  v31 = (void *)MEMORY[0x1E0DC3448];
  v62[0] = v23;
  v62[1] = 3221225472;
  v62[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_2;
  v62[3] = &unk_1E9FA3160;
  v32 = v25;
  v64 = v32;
  v33 = v24;
  v63 = v33;
  v46 = (void *)v30;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v30, 0, v62);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:", CFSTR("SETTINGS_APP_OPT_OUT_AND_DELETE"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_3;
  v59[3] = &unk_1E9FA3160;
  v38 = v32;
  v61 = v38;
  v39 = v33;
  v60 = v39;
  objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 2, v59);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:", CFSTR("CANCEL"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_4;
  v57[3] = &unk_1E9FA3110;
  v57[4] = self;
  v44 = v39;
  v58 = v44;
  objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 1, v57);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "addAction:", v34);
  objc_msgSend(v56, "addAction:", v40);
  objc_msgSend(v56, "addAction:", v45);
  -[VUIAccountSettingsConnectedAppsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v56, 1, 0);

  objc_destroyWeak(&v70);
  objc_destroyWeak(location);

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:forChannelID:externalID:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "settingsForChannelID:externalID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    v8 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Disabling channel %@ Delete:%@", buf, 0x16u);
  }

  v9 = (void *)MEMORY[0x1E0DC8838];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_83;
  v13[3] = &unk_1E9FA30C0;
  v14 = *(id *)(a1 + 48);
  v10 = v4;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 56);
  v17 = v11;
  v18 = v12;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  objc_msgSend(v9, "updateCloudStoreAppSettings:deleteHistory:completion:", v5, a2, v13);
  objc_destroyWeak(&v19);

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_83(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Successfully disabled channel %@", buf, 0xCu);

    }
    +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadConfigurationAfterVPPAChange");

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Failed to sync opt-out to cloud, reverting: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setStatus:forChannelID:externalID:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "specifierForID:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_84;
    v12[3] = &unk_1E9F9A938;
    objc_copyWeak(&v14, (id *)(a1 + 72));
    v13 = v10;
    v11 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

    objc_destroyWeak(&v14);
  }

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_84(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("targetId");
  v5[1] = CFSTR("targetType");
  v6[0] = v3;
  v6[1] = CFSTR("alertButton");
  v5[2] = CFSTR("actionType");
  v5[3] = CFSTR("actionContext");
  v6[2] = CFSTR("remove");
  v6[3] = CFSTR("alert");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClick:", v4);

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("targetId");
  v5[1] = CFSTR("targetType");
  v6[0] = v3;
  v6[1] = CFSTR("alertButton");
  v5[2] = CFSTR("actionType");
  v5[3] = CFSTR("actionContext");
  v6[2] = CFSTR("removeAndClearHistory");
  v6[3] = CFSTR("alert");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClick:", v4);

}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v2, 1);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("targetId");
  v6[1] = CFSTR("targetType");
  v7[0] = v4;
  v7[1] = CFSTR("alertButton");
  v6[2] = CFSTR("actionType");
  v6[3] = CFSTR("actionContext");
  v7[2] = CFSTR("cancel");
  v7[3] = CFSTR("alert");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClick:", v5);

}

- (int64_t)_alertStyle
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsConnectedAppsViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsTraitsInCollection:", v3);

  return v5;
}

- (void)_configureDoneButton
{
  void *v3;
  id v4;

  if (self->_showsDoneButton)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismiss);
    -[VUIAccountSettingsConnectedAppsViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
}

- (void)_dismiss
{
  id v2;

  -[VUIAccountSettingsConnectedAppsViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (void)fetchConnectedAppsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke;
  v6[3] = &unk_1E9F99C68;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "synchronize:completion:", 1, v6);

}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v13, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_95;
    v15[3] = &unk_1E9F98E40;
    v16 = v14;
    v17 = *(id *)(a1 + 32);
    v13 = v14;
    objc_msgSend(v13, "_updateDisplayNamesForUI:", v15);

  }
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_95(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_2;
  block[3] = &unk_1E9FA3188;
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_watchListAppsFiltered");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "count");
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6 = 134218240;
    v7 = v4;
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - fetchConnectedApps - finished fetching apps, count: %lu, updateSuccess: %d", (uint8_t *)&v6, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroup, 0);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIAccountSettingsConnectedApps - loadAppGroup - strongSelf is nil, aborting", v1, 2u);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAccountSettingsConnectedApps - loadAppGroup - app groups are empty or an error occured! aborting load. error: %@", a5, a6, a7, a8, 2u);
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAccountSettingsConnectedApps - fetchConnectedApps - failed to fetch connected apps with error: %@", a5, a6, a7, a8, 2u);
}

@end
