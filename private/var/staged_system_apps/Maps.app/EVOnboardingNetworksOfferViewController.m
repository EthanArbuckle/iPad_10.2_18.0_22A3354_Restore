@implementation EVOnboardingNetworksOfferViewController

- (EVOnboardingNetworksOfferViewController)initWithDelegate:(id)a3 vehicleName:(id)a4
{
  id v6;
  id v7;
  EVOnboardingNetworksOfferViewController *v8;
  EVOnboardingNetworksOfferViewController *v9;
  NSString *v10;
  NSString *vehicleName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EVOnboardingNetworksOfferViewController;
  v8 = -[EVOnboardingBaseViewController initWithDelegate:](&v13, "initWithDelegate:", v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (NSString *)objc_msgSend(v7, "copy");
    vehicleName = v9->_vehicleName;
    v9->_vehicleName = v10;

  }
  return v9;
}

- (id)obViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (self->_vehicleName)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Preferred Networks for Your vehicle title"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_vehicleName));

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Preferred Networks title"), CFSTR("localized string not found"), 0));
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Preferred Networks subtitle"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PreferredNetworks")));
  v9 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v5, v7, v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerView"));
  objc_msgSend(v10, "setAllowFullWidthIcon:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Choose Networks"), CFSTR("localized string not found"), 0));
  objc_msgSend(v11, "setTitle:forState:", v13, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_chooseNetworks", 64);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("ConnectButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonTray"));
  objc_msgSend(v14, "addButton:", v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Set Up Later"), CFSTR("localized string not found"), 0));
  objc_msgSend(v15, "setTitle:forState:", v17, 0);

  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_setUpLaterPressed", 64);
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("SetUpLaterButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonTray"));
  objc_msgSend(v18, "addButton:", v15);

  return v9;
}

- (void)_chooseNetworks
{
  id v3;
  NSObject *v4;
  EVOnboardingNetworksOfferViewController *v5;
  EVOnboardingNetworksOfferViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id WeakRetained;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const char *v18;

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksOfferViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[EVOnboardingNetworksOfferViewController _chooseNetworks]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", 452, 123, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "networksOfferViewControllerDidSelectSetupNow:", self);

}

- (void)_setUpLaterPressed
{
  id v3;
  NSObject *v4;
  EVOnboardingNetworksOfferViewController *v5;
  EVOnboardingNetworksOfferViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id WeakRetained;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const char *v18;

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksOfferViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[EVOnboardingNetworksOfferViewController _setUpLaterPressed]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", 440, 123, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "networksOfferViewControllerDidSelectSetupLater:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
