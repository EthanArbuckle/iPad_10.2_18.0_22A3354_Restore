@implementation EVOnboardingPrivacyViewController

- (EVOnboardingPrivacyViewController)initWithDelegate:(id)a3
{
  id v4;
  EVOnboardingPrivacyViewController *v5;
  EVOnboardingPrivacyViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EVOnboardingPrivacyViewController;
  v5 = -[EVOnboardingBaseViewController initWithDelegate:](&v8, "initWithDelegate:", v4);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EVOnboardingPrivacyViewController;
  -[EVOnboardingBaseViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingPrivacyViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("EVOnboardingPrivacyView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingPrivacyViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesBackButton:", 1);

}

- (id)obViewController
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Improve EV Title"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Improve EV Routing subtitle"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingPrivacyViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_screen"));
  if (v10)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingPrivacyViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_screen"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  }
  objc_msgSend(v11, "scale");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v8, 2));
  if (v10)
  {

    v11 = v2;
  }

  v13 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v29, v6, v12);
  objc_msgSend(v13, "setModalPresentationStyle:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Share"), CFSTR("localized string not found"), 0));
  objc_msgSend(v14, "setTitle:forState:", v16, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "_sharePressed", 64);
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ShareButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buttonTray"));
  objc_msgSend(v17, "addButton:", v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Not Now"), CFSTR("localized string not found"), 0));
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "_notNowPressed", 64);
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("NotNowButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buttonTray"));
  objc_msgSend(v21, "addButton:", v18);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] About Improve EV"), CFSTR("localized string not found"), 0));
  objc_msgSend(v22, "setTitle:forState:", v24, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, "_aboutImproveEVRoutingPressed", 64);
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("ImproveEVRoutingButton"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "titleLabel"));
  objc_msgSend(v25, "setNumberOfLines:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerView"));
  objc_msgSend(v26, "addAccessoryButton:", v22);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerView"));
  objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("EVOnboardingHeader"));

  return v13;
}

- (void)_aboutImproveEVRoutingPressed
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User pressed on About Improve EV Routing. Will display privacy texts.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveEVRouting")));
  objc_msgSend(v5, "setPresentingViewController:", self);
  objc_msgSend(v5, "present");

}

- (void)_sharePressed
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User selected to share.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "privacyViewControllerDidSelectShare:", self);

}

- (void)_notNowPressed
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User selected not now.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "privacyViewControllerDidSelectNotNow:", self);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
