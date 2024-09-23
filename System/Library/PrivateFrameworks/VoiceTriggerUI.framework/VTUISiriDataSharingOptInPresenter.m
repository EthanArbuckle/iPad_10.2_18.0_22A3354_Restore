@implementation VTUISiriDataSharingOptInPresenter

- (VTUISiriDataSharingOptInPresenter)init
{
  VTUISiriDataSharingOptInPresenter *v2;
  AFSettingsConnection *v3;
  AFSettingsConnection *settings;
  dispatch_queue_t v5;
  OS_dispatch_queue *settingsQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTUISiriDataSharingOptInPresenter;
  v2 = -[VTUISiriDataSharingOptInPresenter init](&v8, sel_init);
  if (v2)
  {
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = dispatch_queue_create("com.apple.siri.amnesia", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    v2->_sourceOfChange = 0;
    -[VTUISiriDataSharingOptInPresenter _fetchSiriDataSharingEnabled](v2, "_fetchSiriDataSharingEnabled");
  }
  return v2;
}

- (void)_fetchSiriDataSharingEnabled
{
  NSObject *settingsQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)siriDataSharingOptInViewFeatureFlagEnabled
{
  return 1;
}

- (BOOL)shouldShowSiriDataSharingOptInView
{
  int64_t dataSharingOptInStatus;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dataSharingOptInStatus = self->_dataSharingOptInStatus;
  v3 = dataSharingOptInStatus - 1;
  if ((unint64_t)(dataSharingOptInStatus - 1) >= 3)
  {
    if (!dataSharingOptInStatus)
    {
      v6 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView]";
        _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: VTUISiriDataSharingOptInView requested: User has not made a decision. Returning YES", (uint8_t *)&v8, 0xCu);
      }
      v3 = 1;
    }
  }
  else
  {
    v4 = VTUILogContextFacility;
    v5 = os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT);
    v3 = 0;
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView]";
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: VTUISiriDataSharingOptInView requested: User has made a decision. Returning NO", (uint8_t *)&v8, 0xCu);
      v3 = 0;
    }
  }
  return v3 & 1;
}

- (id)dataSharingOptInViewForFrame:(CGRect)a3 viewStyle:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4 != 2)
  {
    if (a4 == 1)
    {
      -[VTUISiriDataSharingOptInPresenter _proximityViewForFrame:](self, "_proximityViewForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (a4)
    {
      v5 = 0;
      return v5;
    }
  }
  -[VTUISiriDataSharingOptInPresenter _modalViewControllerForViewStyle:](self, "_modalViewControllerForViewStyle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataSharingOptInTextWelcomeControllerForViewStyle:(int64_t)a3
{
  void *v5;

  -[VTUISiriDataSharingOptInPresenter _modalViewControllerForViewStyle:](self, "_modalViewControllerForViewStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](self, "setSourceOfChange:", 2);
  return v5;
}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 1);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2;
    v5[3] = &unk_24F33E020;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "getSiriDataSharingOptInStatusWithCompletion:", v5);
    objc_destroyWeak(&v6);
  }

}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
      __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2_cold_1();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = (void *)VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x24BDD16E0];
        v10 = v8;
        objc_msgSend(v9, "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[VTUISiriDataSharingOptInPresenter _fetchSiriDataSharingEnabled]_block_invoke";
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_229EF7000, v10, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Siri data sharing opt in fetch completed with state:%@", (uint8_t *)&v12, 0x16u);

      }
      v7[3] = a3;

    }
  }

}

- (void)_setSiriDataSharingStatus:(int64_t)a3 forceDismissal:(BOOL)a4
{
  NSObject *settingsQueue;
  _QWORD v8[4];
  id v9[2];
  BOOL v10;
  id location;

  self->_dataSharingOptInStatus = a3;
  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke;
  v8[3] = &unk_24F33DB80;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v10 = a4;
  dispatch_async(settingsQueue, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16[2];
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      v6 = *(_QWORD *)(a1 + 40);
      v7 = v4;
      objc_msgSend(v5, "numberWithInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(WeakRetained, "sourceOfChange"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reasonForChange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v19 = "-[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:]_block_invoke";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Setting data sharing status: %@ source: %@ reason: %@", buf, 0x2Au);

    }
    v11 = (void *)WeakRetained[1];
    v12 = *(_QWORD *)(a1 + 40);
    v13 = objc_msgSend(WeakRetained, "sourceOfChange");
    objc_msgSend(WeakRetained, "reasonForChange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5;
    v15[3] = &unk_24F33E048;
    v16[1] = *(id *)(a1 + 40);
    v17 = *(_BYTE *)(a1 + 48);
    objc_copyWeak(v16, v2);
    objc_msgSend(v11, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", v12, 1, v13, v14, v15);

    objc_destroyWeak(v16);
  }

}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
      __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5_cold_1(a1, v4, (uint64_t)v3);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_6;
  v5[3] = &unk_24F33DB58;
  v7 = *(_BYTE *)(a1 + 48);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);

}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Setting data sharing completed. Requesting dismissal:%@", (uint8_t *)&v8, 0x16u);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_requestDismissal");

  }
}

- (id)_modalViewControllerForViewStyle:(int64_t)a3
{
  VTUISiriDataSharingOptInViewController *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
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

  v4 = -[VTUISiriDataSharingOptInViewController initWithViewStyle:]([VTUISiriDataSharingOptInViewController alloc], "initWithViewStyle:", a3);
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeviceIPad");

  if (v6)
  {
    -[VTUISiriDataSharingOptInViewController headerView](v4, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("DATA_SHARING_DETAIL_IPAD");
  }
  else
  {
    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDeviceVision");

    -[VTUISiriDataSharingOptInViewController headerView](v4, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v12)
      v10 = CFSTR("DATA_SHARING_DETAIL_VISION");
    else
      v10 = CFSTR("DATA_SHARING_DETAIL_IPHONE");
  }
  objc_msgSend(v8, "uiLocalizedStringForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetailText:", v13);

  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DETAIL_LINK"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v16, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__userTappedDetailLinkText, 64);
  -[VTUISiriDataSharingOptInViewController headerView](v4, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAccessoryButton:", v14);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_CONFIRMATION_BUTTON_TITLE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__userTappedOptInToDataSharing, 64);
  -[VTUISiriDataSharingOptInViewController buttonTray](v4, "buttonTray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addButton:", v18);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DECLINE_BUTTON_TITLE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v24, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__userTappedOptOutOfDataSharing, 64);
  -[VTUISiriDataSharingOptInViewController buttonTray](v4, "buttonTray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addButton:", v22);

  objc_storeStrong((id *)&self->_currentWelcomeController, v4);
  -[VTUISiriDataSharingOptInViewController setDelegate:](self->_currentWelcomeController, "setDelegate:", self);

  return v4;
}

- (id)_proximityViewForFrame:(CGRect)a3
{
  VTUIProximityDataSharingOptInView *v4;
  VTUIProximityDataSharingOptInView *currentProxView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[VTUIProximityDataSharingOptInView initWithFrame:]([VTUIProximityDataSharingOptInView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  currentProxView = self->_currentProxView;
  self->_currentProxView = v4;

  -[VTUIProximityDataSharingOptInView dismissButton](self->_currentProxView, "dismissButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__userTappedDismissButtonFromProxCard, 64);

  -[VTUIProximityDataSharingOptInView shareButton](self->_currentProxView, "shareButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__userTappedOptInToDataSharing, 64);

  -[VTUIProximityDataSharingOptInView notNowButton](self->_currentProxView, "notNowButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__userTappedOptOutOfDataSharing, 64);

  -[VTUIProximityDataSharingOptInView aboutLink](self->_currentProxView, "aboutLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__userTappedDetailLinkText, 64);

  return self->_currentProxView;
}

- (void)_userTappedDetailLinkText
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x24BE6E468]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (self->_currentWelcomeController)
  {
    objc_msgSend(v3, "setPresentingViewController:");
    v3 = v7;
  }
  if (self->_currentProxView)
  {
    -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v3 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPresentingViewController:", v6);

      v3 = v7;
    }
  }
  objc_msgSend(v3, "present");

}

- (void)_userTappedOptInToDataSharing
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUISiriDataSharingOptInPresenter _userTappedOptInToDataSharing]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User has selected to share. Enabling..", (uint8_t *)&v4, 0xCu);
  }
  -[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:](self, "_setSiriDataSharingStatus:forceDismissal:", 1, 1);
}

- (void)_userTappedOptOutOfDataSharing
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUISiriDataSharingOptInPresenter _userTappedOptOutOfDataSharing]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User has selected not to share. Disabling..", (uint8_t *)&v4, 0xCu);
  }
  -[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:](self, "_setSiriDataSharingStatus:forceDismissal:", 2, 1);
}

- (void)_userTappedDismissButtonFromProxCard
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VTUISiriDataSharingOptInPresenter _userTappedDismissButtonFromProxCard]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User tapped the delete button on the prox card.", (uint8_t *)&v7, 0xCu);
  }
  -[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:](self, "_setSiriDataSharingStatus:forceDismissal:", 3, 0);
  -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriDataSharingOptInViewDismissButtonTappedFromPresenter:", self);

  }
}

- (void)_requestDismissal
{
  void *v3;
  VTUIProximityDataSharingOptInView *currentProxView;
  VTUISiriDataSharingOptInViewController *currentWelcomeController;

  -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriDataSharingOptInRequestsDismissalFromPresenter:", self);

  currentProxView = self->_currentProxView;
  self->_currentProxView = 0;

  currentWelcomeController = self->_currentWelcomeController;
  self->_currentWelcomeController = 0;

}

- (void)tearDownPresentedViews
{
  VTUISiriDataSharingOptInViewController *currentWelcomeController;
  void *v4;
  VTUISiriDataSharingOptInViewController *v5;
  VTUIProximityDataSharingOptInView *currentProxView;
  VTUIProximityDataSharingOptInView *v7;

  currentWelcomeController = self->_currentWelcomeController;
  if (currentWelcomeController)
  {
    -[VTUISiriDataSharingOptInViewController setDelegate:](currentWelcomeController, "setDelegate:", 0);
    -[VTUISiriDataSharingOptInViewController view](self->_currentWelcomeController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v5 = self->_currentWelcomeController;
    self->_currentWelcomeController = 0;

  }
  currentProxView = self->_currentProxView;
  if (currentProxView)
  {
    -[VTUIProximityDataSharingOptInView removeFromSuperview](currentProxView, "removeFromSuperview");
    v7 = self->_currentProxView;
    self->_currentProxView = 0;

  }
}

- (void)didDismissFromViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_dataSharingOptInStatus)
    -[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:](self, "_setSiriDataSharingStatus:forceDismissal:", 3, 0);
  -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VTUISiriDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriDataSharingOptInViewControllerDidDismissFromPresenter:", self);

  }
}

- (VTUISiriDataSharingOptInPresentationDelegate)presentationDelegate
{
  return (VTUISiriDataSharingOptInPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (int64_t)sourceOfChange
{
  return self->_sourceOfChange;
}

- (void)setSourceOfChange:(int64_t)a3
{
  self->_sourceOfChange = a3;
}

- (NSString)reasonForChange
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReasonForChange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForChange, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_currentProxView, 0);
  objc_storeStrong((id *)&self->_currentWelcomeController, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_229EF7000, v0, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Siri data sharing opt in status fetch failed with error:%@", (uint8_t *)v1, 0x16u);
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  __int16 v8;
  int v9[5];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315650;
  OUTLINED_FUNCTION_0();
  v10 = v8;
  v11 = a3;
  _os_log_error_impl(&dword_229EF7000, v6, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Setting data sharing status:%@ failed with error:%@", (uint8_t *)v9, 0x20u);

}

@end
