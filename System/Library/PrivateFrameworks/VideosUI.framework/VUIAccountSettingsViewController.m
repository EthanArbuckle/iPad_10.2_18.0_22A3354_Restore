@implementation VUIAccountSettingsViewController

- (VUIAccountSettingsViewController)init
{
  VUIAccountSettingsViewController *v2;
  VUIAccountSettingsViewController *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIAccountSettingsViewController;
  v2 = -[VUIAccountSettingsViewController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_authenticationInProgress = 0;
    v2->_installedWatchListAppCount = 0;
    v2->_connectedWatchListAppCount = 0;
    v2->_initialSubsection = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__syncMySportsSettingDidChange_, *MEMORY[0x1E0DC89F0], 0);

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__VUIAccountSettingsViewController_init__block_invoke;
    v7[3] = &unk_1E9F9C6D0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__VUIAccountSettingsViewController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__VUIAccountSettingsViewController_init__block_invoke_2;
  v5[3] = &unk_1E9F9A938;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __40__VUIAccountSettingsViewController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setNotifAuthStatus:", objc_msgSend(*(id *)(a1 + 32), "authorizationStatus"));
  if (objc_msgSend(*(id *)(a1 + 32), "authorizationStatus") != 2)
    objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    -[VUIAccountSettingsViewController _accountSpecifiers](self, "_accountSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    if (self->_installedWatchListAppCount > 0 || self->_initialSubsection == 1)
    {
      -[VUIAccountSettingsViewController _sourcesSpecifiers](self, "_sourcesSpecifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v5);

    }
    -[VUIAccountSettingsViewController _externalSpecifiers](self, "_externalSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    -[VUIAccountSettingsViewController _clearHistorySpecifiers](self, "_clearHistorySpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

    if (-[VUIAccountSettingsViewController notifAuthStatus](self, "notifAuthStatus") != 2)
    {
      -[VUIAccountSettingsViewController _notificationSpecifiers](self, "_notificationSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
    if (WLKIsSportsFavoritesEnabled())
    {
      -[VUIAccountSettingsViewController _mySportsSpecifiers](self, "_mySportsSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v9);

    }
    if (!+[VUIAuthenticationManager isDemoAccount](VUIAuthenticationManager, "isDemoAccount"))
    {
      -[VUIAccountSettingsViewController _signOutSpecifiers](self, "_signOutSpecifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v10);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[VUIAccountSettingsViewController specifiers].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    -[VUIAccountSettingsViewController _dismissViewController](self, "_dismissViewController");
  }
  -[VUIAccountSettingsViewController setSpecifiers:](self, "setSpecifiers:", v3);
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VUIAccountSettingsViewController;
  -[VUIAccountSettingsViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[VUIAccountSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VUIAccountSettingsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:", 0);

  -[VUIAccountSettingsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersLargeTitles:", 0);

  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("DONE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 2, self, sel__dismissViewController);

  -[VUIAccountSettingsViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", 0);

  -[VUIAccountSettingsViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v11);

  -[VUIAccountSettingsViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:", CFSTR("SETTINGS_ACCOUNT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v16);

  objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBarTintColor:", v18);

  objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  objc_msgSend(v19, "setShadowImage:", v20);

  objc_msgSend(MEMORY[0x1E0DC34F0], "appearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTintColor:", v22);

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsViewController _dialogMetricsData](self, "_dialogMetricsData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recordDialog:", v24);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAccountSettingsViewController;
  -[VUIAccountSettingsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[VUIAccountSettingsViewController _resolveLandingBehavior](self, "_resolveLandingBehavior");
}

- (id)_accountSpecifiers
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
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("AccountGroupSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAuthenticationManager creditsString](VUIAuthenticationManager, "creditsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("SETTINGS_CREDIT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);
    objc_msgSend(v3, "setProperty:forKey:", &unk_1EA0B93B8, *MEMORY[0x1E0D80810]);

  }
  v9 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_ACCOUNT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, objc_opt_class(), 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x1E0D80938]);

  +[VUIAuthenticationManager userFullName](VUIAuthenticationManager, "userFullName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v14, *MEMORY[0x1E0D80978]);

  +[VUIAuthenticationManager userAccountName](VUIAuthenticationManager, "userAccountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v15, *MEMORY[0x1E0D80950]);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v16, *MEMORY[0x1E0D80948]);

  objc_msgSend(v12, "setProperty:forKey:", CFSTR("accountName"), *MEMORY[0x1E0D80868]);
  objc_msgSend(v12, "setControllerLoadAction:", sel__didSelectSpecifier_);
  v19[0] = v3;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_sourcesSpecifiers
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
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS_SOURCES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("SourcesGroupSpecifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("SETTINGS_CONNECTED_APPS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel__getConnectedAppsCountString, objc_opt_class(), 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setControllerLoadAction:", sel__didSelectSpecifier_);
  objc_msgSend(v10, "setProperty:forKey:", CFSTR("connectedApps"), *MEMORY[0x1E0D80868]);
  v13[0] = v6;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_externalSpecifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("ExternalGroupSpecifier"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("SETTINGS_MANAGE_SUBSCRIPTIONS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, objc_opt_class(), 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("SETTINGS_REDEEM_GIFT_CARD_OR_CODE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, objc_opt_class(), 13, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  v13 = *MEMORY[0x1E0D80780];
  objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x1E0D80780]);
  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), v13);
  v14 = *MEMORY[0x1E0DC53D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D80938];
  objc_msgSend(v7, "setProperty:forKey:", v15, *MEMORY[0x1E0D80938]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v16;
  objc_msgSend(v11, "setProperty:forKey:", v17, v16);

  objc_msgSend(v7, "setButtonAction:", sel__didSelectSpecifier_);
  objc_msgSend(v11, "setButtonAction:", sel__didSelectSpecifier_);
  v18 = *MEMORY[0x1E0D80868];
  objc_msgSend(v7, "setProperty:forKey:", CFSTR("manageSubscriptions"), *MEMORY[0x1E0D80868]);
  objc_msgSend(v11, "setProperty:forKey:", CFSTR("redeemGiftCardOrCode"), v18);
  v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v31 = (void *)v3;
  v32[0] = v3;
  v32[1] = v7;
  v32[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);

  if (self->_addFundsUrl)
  {
    v22 = (void *)MEMORY[0x1E0D804E8];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("SETTINGS_ADD_MONEY_TO_ACCOUNT"));
    v24 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, 0, objc_opt_class(), 13, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setProperty:forKey:", objc_opt_class(), v24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProperty:forKey:", v27, v30);

    objc_msgSend(v26, "setButtonAction:", sel__didSelectSpecifier_);
    objc_msgSend(v26, "setProperty:forKey:", CFSTR("addMoneyToAccount"), v18);
    objc_msgSend(v21, "addObject:", v26);

  }
  v28 = (void *)objc_msgSend(v21, "copy");

  return v28;
}

- (id)_clearHistorySpecifiers
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
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("ClearHistoryGroupSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS_CLEAR_HISTORY_FOOTER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  +[VUIAuthenticationManager userAccountName](VUIAuthenticationManager, "userAccountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);
  v9 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_CLEAR_HISTORY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteButtonSpecifierWithName:target:action:", v11, self, sel__clearPlayHistory_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setProperty:forKey:", CFSTR("clearPlayHistory"), *MEMORY[0x1E0D80868]);
  v15[0] = v3;
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_notificationSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("NotificationGroupSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_FOOTER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x1E0D80848]);
  v6 = (void *)MEMORY[0x1E0D804E8];
  -[VUIAccountSettingsViewController _notificationGroupSpecifierIdentifier](self, "_notificationGroupSpecifierIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 13, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x1E0D80938]);

  objc_msgSend(v8, "setButtonAction:", sel__didSelectSpecifier_);
  v12[0] = v3;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_mySportsSpecifiers
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
  PSSpecifier *syncMySportsSpecifier;
  id v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "osFeatureFlagsJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("dakar"), 0) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0DC8848], "isOptOutAvailable"))
  {
    v5 = (void *)MEMORY[0x1E0D804E8];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("SETTINGS_SPORTS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithID:name:", CFSTR("SportsGroupSpecifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D804E8];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_SPORTS_SYNC_MY_SPORTS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel__setSyncMySportsEnabled_, sel__syncMySportsEnabled, 0, 6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x1E0D80938]);

    objc_msgSend(v12, "setProperty:forKey:", CFSTR("syncMySports"), *MEMORY[0x1E0D80868]);
    syncMySportsSpecifier = self->_syncMySportsSpecifier;
    self->_syncMySportsSpecifier = (PSSpecifier *)v12;
    v15 = v12;

    -[VUIAccountSettingsViewController _addPrivacyFooterToGroup:](self, "_addPrivacyFooterToGroup:", v8);
    v18[0] = v8;
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
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
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("SPORTS_PRIVACY_FOOTER_FORMAT"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.mysports"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, v10);
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

- (void)_showPrivacySheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mysports"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (id)_signOutSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SignOutGroupSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D804E8];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("SETTINGS_SIGN_OUT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80938]);

  objc_msgSend(v7, "setButtonAction:", sel__didSelectSpecifier_);
  objc_msgSend(v7, "setProperty:forKey:", CFSTR("signOut"), *MEMORY[0x1E0D80868]);
  v11[0] = v3;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_didSelectSpecifier:(id)a3
{
  -[VUIAccountSettingsViewController _didSelectSpecifier:isManualSelection:](self, "_didSelectSpecifier:isManualSelection:", a3, 1);
}

- (void)_didSelectSpecifier:(id)a3 isManualSelection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  VUIAccountSettingsConnectedAppsViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];

  v4 = a4;
  v49[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("accountName"));

  if (v8)
  {
    -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:](self, "_handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:", kVUIBagKeyModifyAccountURL, kVUIBagKeyModifyAccountURL, 0);
    v48[0] = CFSTR("targetId");
    v48[1] = CFSTR("targetType");
    v49[0] = CFSTR("account");
    v49[1] = CFSTR("menuItem");
    v48[2] = CFSTR("actionType");
    v49[2] = CFSTR("account");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v9);

  }
  else
  {
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("connectedApps"));

    if (v11)
    {
      v12 = objc_alloc_init(VUIAccountSettingsConnectedAppsViewController);
      -[VUIAccountSettingsConnectedAppsViewController setShowsDoneButton:](v12, "setShowsDoneButton:", v4 ^ 1);
      -[VUIAccountSettingsViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pushViewController:animated:", v12, v4);

      v46[0] = CFSTR("targetId");
      v46[1] = CFSTR("targetType");
      v47[0] = CFSTR("connectedApps");
      v47[1] = CFSTR("menuItem");
      v46[2] = CFSTR("actionType");
      v47[2] = CFSTR("connectedApps");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v14);

    }
    else
    {
      objc_msgSend(v6, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("manageSubscriptions"));

      if (v16)
      {
        -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:](self, "_handleAccountSettingsEventWithAmsWebView:", kVUIBagKeyManageSubscriptionsURL);
        v44[0] = CFSTR("targetId");
        v44[1] = CFSTR("targetType");
        v45[0] = CFSTR("manageSubscriptions");
        v45[1] = CFSTR("menuItem");
        v44[2] = CFSTR("actionType");
        v45[2] = CFSTR("manageSubscriptions");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v17);

      }
      else
      {
        objc_msgSend(v6, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("redeemGiftCardOrCode"));

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0CD80A0]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:](self, "_handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:", kVUIBagKeyRedeemCodeURL, 0, v20);
          v42[0] = CFSTR("targetId");
          v42[1] = CFSTR("targetType");
          v43[0] = CFSTR("giftCard");
          v43[1] = CFSTR("menuItem");
          v42[2] = CFSTR("actionType");
          v43[2] = CFSTR("giftCard");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v21);

        }
        else
        {
          objc_msgSend(v6, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("addMoneyToAccount"));

          if (v23)
          {
            objc_initWeak(&location, self);
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke;
            v35[3] = &unk_1E9F99C98;
            objc_copyWeak(&v36, &location);
            -[VUIAccountSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v35);
            v40[0] = CFSTR("targetId");
            v40[1] = CFSTR("targetType");
            v41[0] = CFSTR("addFunds");
            v41[1] = CFSTR("menuItem");
            v40[2] = CFSTR("actionType");
            v41[2] = CFSTR("addFunds");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v24);

            objc_destroyWeak(&v36);
            objc_destroyWeak(&location);
          }
          else
          {
            objc_msgSend(v6, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("signOut"));

            if (v26)
            {
              -[VUIAccountSettingsViewController setAuthenticationInProgress:](self, "setAuthenticationInProgress:", 1);
              objc_initWeak(&location, self);
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_2;
              v33[3] = &unk_1E9F9C6F8;
              objc_copyWeak(&v34, &location);
              +[VUIAuthenticationManager signOutUserWithCompletionHandler:](VUIAuthenticationManager, "signOutUserWithCompletionHandler:", v33);
              v38[0] = CFSTR("targetId");
              v38[1] = CFSTR("targetType");
              v39[0] = CFSTR("signOut");
              v39[1] = CFSTR("menuItem");
              v38[2] = CFSTR("actionType");
              v39[2] = CFSTR("signOut");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v27);

              objc_destroyWeak(&v34);
              objc_destroyWeak(&location);
            }
            else
            {
              objc_msgSend(v6, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIAccountSettingsViewController _notificationGroupSpecifierIdentifier](self, "_notificationGroupSpecifierIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v28, "isEqualToString:", v29);

              if (v30)
              {
                objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32[0] = MEMORY[0x1E0C809B0];
                v32[1] = 3221225472;
                v32[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_4;
                v32[3] = &unk_1E9F9C720;
                v32[4] = self;
                objc_msgSend(v31, "getNotificationSettingsWithCompletionHandler:", v32);

              }
            }
          }
        }
      }
    }
  }

}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    +[VUIApplicationRouter handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:](VUIApplicationRouter, "handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:", WeakRetained[180], 0, 1);
    WeakRetained = v2;
  }

}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_3;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAuthenticationInProgress:", 0);
  objc_msgSend(WeakRetained, "_dismissViewController");

}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_5;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v7, &location);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "authorizationStatus"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "authorizationStatus") == 1)
      objc_msgSend(WeakRetained, "_handleNotificationsOff");
  }
  else
  {
    objc_msgSend(WeakRetained, "_promptForNotificationsAuth");
  }

}

- (void)_clearPlayHistory:(id)a3
{
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
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  +[VUIAuthenticationManager userAccountName](VUIAuthenticationManager, "userAccountName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("SETTINGS_CLEAR_HISTORY_PROMPT_FORMAT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (-[VUIAccountSettingsViewController _alertStyle](self, "_alertStyle") == 1)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("SETTINGS_CLEAR_HISTORY_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v7, -[VUIAccountSettingsViewController _alertStyle](self, "_alertStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("SETTINGS_CLEAR_HISTORY"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 2, &__block_literal_global_50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:", CFSTR("CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, &__block_literal_global_188);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v14);
  objc_msgSend(v10, "addAction:", v18);
  -[VUIAccountSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  v20[0] = CFSTR("targetId");
  v20[1] = CFSTR("targetType");
  v21[0] = CFSTR("clearPlayHistory");
  v21[1] = CFSTR("menuItem");
  v20[2] = CFSTR("actionType");
  v21[2] = CFSTR("clearPlayHistory");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v19);

}

uint64_t __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC8838], "deleteAllHistoryWithCompletion:", &__block_literal_global_176);
}

void __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E9FF3598;
  }
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (a2)
      v8 = CFSTR("YES");
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Delete-all! %@ %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_184);

}

void __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke_183()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("VUIClearPlayHistoryNotification"), 0);

}

- (void)_syncMySportsSettingDidChange:(id)a3
{
  NSNumber *syncMySportsEnabled;
  _QWORD v5[4];
  id v6;
  id location;

  syncMySportsEnabled = self->__syncMySportsEnabled;
  self->__syncMySportsEnabled = 0;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke;
  v5[3] = &unk_1E9F99C98;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSpecifier:", WeakRetained[176]);
    WeakRetained = v2;
  }

}

- (NSNumber)_syncMySportsEnabled
{
  NSNumber *syncMySportsEnabled;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSNumber *v18;
  NSNumber *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, void *);
  void *v24;
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  syncMySportsEnabled = self->__syncMySportsEnabled;
  if (!syncMySportsEnabled)
  {
    v4 = dispatch_semaphore_create(0);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "osFeatureFlagsJSON");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("dakar"), 0))
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke;
      v26[3] = &unk_1E9F9C808;
      v27[1] = &v28;
      v27[0] = v4;
      +[VUISportsFavoriteService userConsentWithCompletionHandler:](_TtC8VideosUI24VUISportsFavoriteService, "userConsentWithCompletionHandler:", v26);
      v7 = (id *)v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_191;
      v24 = &unk_1E9F9C830;
      v25[1] = &v28;
      v25[0] = v4;
      objc_msgSend(v8, "isOnboarded:", &v21);
      v7 = (id *)v25;

    }
    v9 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v4, v9))
    {
      WLKSystemLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[VUIAccountSettingsViewController _syncMySportsEnabled].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v29 + 24), v21, v22, v23, v24);
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v19 = self->__syncMySportsEnabled;
    self->__syncMySportsEnabled = v18;

    _Block_object_dispose(&v28, 8);
    syncMySportsEnabled = self->__syncMySportsEnabled;
  }
  return syncMySportsEnabled;
}

void __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "status") == 2;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_cold_1(a1 + 40, v5);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_191(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;

  v6 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  WLKSystemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_191_cold_1(a2, v6);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setSyncMySportsEnabled:(id)a3
{
  id v5;
  void *v6;
  NSTimer *v7;
  NSTimer *syncMySportsDebouncer;
  _QWORD v9[5];
  id v10;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->__syncMySportsEnabled, a3);
  -[NSTimer invalidate](self->_syncMySportsDebouncer, "invalidate");
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0C99E88];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke;
  v9[3] = &unk_1E9F9C8A8;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 0.5);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  syncMySportsDebouncer = self->_syncMySportsDebouncer;
  self->_syncMySportsDebouncer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _TtC8VideosUI26VUIUserConsentModification *v6;
  void *v7;
  uint64_t v8;
  _TtC8VideosUI26VUIUserConsentModification *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "osFeatureFlagsJSON");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", CFSTR("dakar"), 0))
  {
    v6 = [_TtC8VideosUI26VUIUserConsentModification alloc];
    objc_msgSend(*(id *)(a1 + 32), "_syncMySportsEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = 2;
    else
      v8 = 1;
    v9 = -[VUIUserConsentModification initWithStatus:](v6, "initWithStatus:", v8);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2;
    v15[3] = &unk_1E9F9C858;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    +[VUISportsFavoriteService modifyUserConsentWithModification:completionHandler:](_TtC8VideosUI24VUISportsFavoriteService, "modifyUserConsentWithModification:completionHandler:", v9, v15);
    objc_destroyWeak(&v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_syncMySportsEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_196;
    v13[3] = &unk_1E9F9C880;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    objc_msgSend(v10, "setOptInStatus:completion:", v12, v13);

    objc_destroyWeak(&v14);
  }

}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v4)
  {
    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_cold_1(v4, v7);

  }
  else if (WeakRetained)
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Settings: Successfully set sports syncing opt in status. Reloading specifier.", buf, 2u);
    }

    v9 = (void *)v6[178];
    v6[178] = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_195;
    block[3] = &unk_1E9F98DF0;
    block[4] = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_195(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_196(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_cold_1(v3, v6);

  }
  else if (WeakRetained)
  {
    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Settings: Successfully set sports syncing opt in status. Reloading specifier.", buf, 2u);
    }

    v8 = (void *)v5[178];
    v5[178] = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_197;
    block[3] = &unk_1E9F98DF0;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_197(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
}

- (void)_resolveLandingBehavior
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[VUIAccountSettingsViewController initialSubsection](self, "initialSubsection"))
  {
    -[VUIAccountSettingsViewController _navigateToSubsection:clearSubsection:](self, "_navigateToSubsection:clearSubsection:", -[VUIAccountSettingsViewController initialSubsection](self, "initialSubsection"), 1);
  }
  else
  {
    v3 = dispatch_group_create();
    -[VUIAccountSettingsViewController _checkConnectedAppsWithDispatchGroup:](self, "_checkConnectedAppsWithDispatchGroup:", v3);
    -[VUIAccountSettingsViewController _checkExternalLinksWithDispatchGroup:](self, "_checkExternalLinksWithDispatchGroup:", v3);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__VUIAccountSettingsViewController__resolveLandingBehavior__block_invoke;
    v4[3] = &unk_1E9F99C98;
    objc_copyWeak(&v5, &location);
    dispatch_group_notify(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);

  }
}

void __59__VUIAccountSettingsViewController__resolveLandingBehavior__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSpecifiers");
    WeakRetained = v2;
  }

}

- (void)_checkConnectedAppsWithDispatchGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  id location;

  v4 = a3;
  dispatch_group_enter(v4);
  -[VUIAccountSettingsViewController setInstalledWatchListAppCount:](self, "setInstalledWatchListAppCount:", 0);
  -[VUIAccountSettingsViewController setConnectedWatchListAppCount:](self, "setConnectedWatchListAppCount:", 0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__VUIAccountSettingsViewController__checkConnectedAppsWithDispatchGroup___block_invoke;
  v6[3] = &unk_1E9F9C8D0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  +[VUIAccountSettingsConnectedAppsViewController fetchConnectedAppsWithCompletion:](VUIAccountSettingsConnectedAppsViewController, "fetchConnectedAppsWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __73__VUIAccountSettingsViewController__checkConnectedAppsWithDispatchGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 || !WeakRetained)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v6;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - an error occured fetching installed apps: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v20 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - installed watchlist app count is: %lu", buf, 0xCu);
    }

    WeakRetained[174] = objc_msgSend(v5, "count");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "accessStatus", (_QWORD)v14) == 1)
            ++WeakRetained[175];
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_checkExternalLinksWithDispatchGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DB1840], "app", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlForKey:", kVUIBagKeyAddFundsURL);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[VUIAccountSettingsViewController setAddFundsUrl:](self, "setAddFundsUrl:", v6);
    v5 = v6;
  }

}

- (id)_getConnectedAppsCountString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_connectedWatchListAppCount);
}

- (id)_dialogMetricsData
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("dialogId");
  v3[1] = CFSTR("dialogType");
  v4[0] = CFSTR("accountSettings");
  v4[1] = CFSTR("accountSettings");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_recordDialogClick:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  -[VUIAccountSettingsViewController _dialogMetricsData](self, "_dialogMetricsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v5);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordClick:", v8);

}

- (id)_notificationGroupSpecifierIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_IPAD");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");

      if (v10 != 6)
      {
        v11 = 0;
        return v11;
      }
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_VISION_PRO");
    }
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_IPHONE");
  }
  objc_msgSend(v6, "localizedStringForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIAccountSettingsViewController;
  -[VUIAccountSettingsViewController tableView:cellForRowAtIndexPath:](&v10, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

LABEL_5:
    -[VUIAccountSettingsViewController _createAxIdFromTableCell:](self, "_createAxIdFromTableCell:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v8);

    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    goto LABEL_5;
  }
  return v5;
}

- (int64_t)_alertStyle
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsTraitsInCollection:", v3);

  return v5;
}

- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3
{
  -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:](self, "_handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:", a3, 0, 0);
}

- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3 storeServicesBagKey:(id)a4 storeServicesUrl:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  VUIAccountSettingsViewController *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[16];
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0DB1840];
  v11 = a3;
  objc_msgSend(v10, "app");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urlForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VUIAccountSettingsViewController _parseUrl:](self, "_parseUrl:", v13);
    goto LABEL_12;
  }
  if (v8)
  {
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Falling back to legacy StoreServices key", buf, 2u);
    }

    v15 = self;
    v16 = 0;
    v17 = v8;
LABEL_11:
    -[VUIAccountSettingsViewController _handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:](v15, "_handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:", v16, v17, 0);
    goto LABEL_12;
  }
  VUIDefaultLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Falling back to legacy StoreServices URL", v27, 2u);
    }

    v15 = self;
    v16 = v9;
    v17 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

LABEL_12:
}

- (void)_parseUrl:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0CFDC68]);
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBag:", v6);

  objc_msgSend(v7, "typeForURL:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__VUIAccountSettingsViewController__parseUrl___block_invoke;
  v10[3] = &unk_1E9F9C8F8;
  v9 = v4;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "addFinishBlock:", v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __46__VUIAccountSettingsViewController__parseUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  id WeakRetained;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__VUIAccountSettingsViewController__parseUrl___block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  v8 = objc_msgSend(v5, "intValue");
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8 == 0;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - AMSURLParser for Account Settings URL. useAMSWebView=%d", (uint8_t *)v11, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:", *(_QWORD *)(a1 + 32), 0, v8 == 0);

}

- (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke;
  block[3] = &unk_1E9F99CE0;
  objc_copyWeak(&v15, &location);
  v16 = a5;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && *(_BYTE *)(a1 + 56))
  {
    +[VUIApplicationRouter pushAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:fromNavigationController:](VUIApplicationRouter, "pushAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:fromNavigationController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke_2;
    v4[3] = &unk_1E9F9C920;
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 56);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v4);

  }
}

BOOL __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke_2(uint64_t a1)
{
  return +[VUIApplicationRouter handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:](VUIApplicationRouter, "handleAccountSettingsEventWithUrl:amsBagKey:useAMSWebView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_dismissViewController
{
  -[VUIAccountSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_createAxIdFromTableCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("UIA.TV.AccountSettings."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleNotificationsOff
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
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3450];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS_NOTIFICATIONS_ARE_OFF_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("SETTINGS_NOTIFICATIONS_ARE_OFF_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("SETTINGS_GO_TO_SETTINGS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, &__block_literal_global_226);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:", CFSTR("SETTINGS_ACCESS_DENY"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v16);
  objc_msgSend(v8, "addAction:", v12);
  -[VUIAccountSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  v18[0] = CFSTR("targetId");
  v18[1] = CFSTR("targetType");
  v19[0] = CFSTR("gotoSettings");
  v19[1] = CFSTR("menuItem");
  v18[2] = CFSTR("actionType");
  v19[2] = CFSTR("gotoSettings");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccountSettingsViewController _recordDialogClick:](self, "_recordDialogClick:", v17);

}

void __59__VUIAccountSettingsViewController__handleNotificationsOff__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=com.apple.tv"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)_promptForNotificationsAuth
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke;
  v4[3] = &unk_1E9F9C6F8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "requestAuthorizationWithOptions:completionHandler:", 7, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke_2;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(WeakRetained, "setNotifAuthStatus:", v4);
  objc_msgSend(v3, "reloadSpecifiers");
  v6[0] = CFSTR("targetId");
  v6[1] = CFSTR("targetType");
  v7[0] = CFSTR("promptNotificationAuthorization");
  v7[1] = CFSTR("menuItem");
  v6[2] = CFSTR("actionType");
  v7[2] = CFSTR("promptNotificationAuthorization");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_recordDialogClick:", v5);

}

- (void)_navigateToSubsection:(int64_t)a3 clearSubsection:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = -[VUIAccountSettingsViewController initialSubsection](self, "initialSubsection");
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Navigating to initial subsection: %ld", (uint8_t *)&v14, 0xCu);
  }

  if (a3 == 1)
  {
    v8 = CFSTR("connectedApps");
  }
  else
  {
    if (a3 != 2)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[VUIAccountSettingsViewController _navigateToSubsection:clearSubsection:].cold.1((uint64_t)self, v11, v12);

      goto LABEL_12;
    }
    v8 = CFSTR("manageSubscriptions");
  }
  -[VUIAccountSettingsViewController specifierForID:](self, "specifierForID:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    -[VUIAccountSettingsViewController _didSelectSpecifier:isManualSelection:](self, "_didSelectSpecifier:isManualSelection:", v9, 0);
    goto LABEL_14;
  }
LABEL_12:
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[VUIAccountSettingsViewController _navigateToSubsection:clearSubsection:].cold.1((uint64_t)self, v10, v13);
LABEL_14:

  if (v4)
    -[VUIAccountSettingsViewController setInitialSubsection:](self, "setInitialSubsection:", 0);
}

- (void)setAuthenticationInProgress:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_authenticationInProgress = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[VUIAccountSettingsViewController specifiers](self, "specifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x1E0D80808];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !self->_authenticationInProgress);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setProperty:forKey:", v11, v8);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v12, "startAnimating");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v12);
  -[VUIAccountSettingsViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (self->_authenticationInProgress)
    v16 = v13;
  else
    v16 = 0;
  objc_msgSend(v14, "setLeftBarButtonItem:", v16);

}

- (int64_t)initialSubsection
{
  return self->_initialSubsection;
}

- (void)setInitialSubsection:(int64_t)a3
{
  self->_initialSubsection = a3;
}

- (BOOL)authenticationInProgress
{
  return self->_authenticationInProgress;
}

- (int64_t)installedWatchListAppCount
{
  return self->_installedWatchListAppCount;
}

- (void)setInstalledWatchListAppCount:(int64_t)a3
{
  self->_installedWatchListAppCount = a3;
}

- (int64_t)connectedWatchListAppCount
{
  return self->_connectedWatchListAppCount;
}

- (void)setConnectedWatchListAppCount:(int64_t)a3
{
  self->_connectedWatchListAppCount = a3;
}

- (PSSpecifier)syncMySportsSpecifier
{
  return self->_syncMySportsSpecifier;
}

- (void)setSyncMySportsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncMySportsSpecifier, a3);
}

- (int64_t)notifAuthStatus
{
  return self->_notifAuthStatus;
}

- (void)setNotifAuthStatus:(int64_t)a3
{
  self->_notifAuthStatus = a3;
}

- (void)set_syncMySportsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->__syncMySportsEnabled, a3);
}

- (NSTimer)syncMySportsDebouncer
{
  return self->_syncMySportsDebouncer;
}

- (void)setSyncMySportsDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_syncMySportsDebouncer, a3);
}

- (NSURL)addFundsUrl
{
  return self->_addFundsUrl;
}

- (void)setAddFundsUrl:(id)a3
{
  objc_storeStrong((id *)&self->_addFundsUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addFundsUrl, 0);
  objc_storeStrong((id *)&self->_syncMySportsDebouncer, 0);
  objc_storeStrong((id *)&self->__syncMySportsEnabled, 0);
  objc_storeStrong((id *)&self->_syncMySportsSpecifier, 0);
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIAccountSettings - AccountSettingsViewController displayed when user is in signed out state. Dismissing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)_syncMySportsEnabled
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Settings: Fetch sync my sports opt in status timed out.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_29(&dword_1D96EE000, v3, v4, "Settings: Fetch sync my sports opt in status completed. isOnboarded=%i, error=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_9();
}

void __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke_191_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_29(&dword_1D96EE000, v3, v4, "Settings: Fetch sync my sports opt in status completed. isOnboarded=%i, error=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_9();
}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, v4, "Settings: Failed to set sports syncing opt in status. error=%@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6();
}

- (void)_handleAccountSettingsEventWithAmsWebView:(uint64_t)a3 storeServicesBagKey:(uint64_t)a4 storeServicesUrl:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIAccountSettings - Errors loading accountSettings URL, no fallback provided", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __46__VUIAccountSettingsViewController__parseUrl___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "VUIAccountSettings - AMSURLParser error for url %@ %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_9();
}

- (void)_navigateToSubsection:(uint64_t)a3 clearSubsection:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 1384);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, a3, "No specifier associated with subsection: %ld. Ignoring.", (uint8_t *)&v4);
}

@end
