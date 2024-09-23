@implementation AppKitPreferencesPrivacyController

- (AppKitPreferencesPrivacyController)initWithBundleIdentifier:(id)a3
{
  id v5;
  AppKitPreferencesPrivacyController *v6;
  AppKitPreferencesPrivacyController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppKitPreferencesPrivacyController;
  v6 = -[AppKitPreferencesPrivacyController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (void)present
{
  id v3;
  void *v4;
  OBPrivacySplashController *v5;
  OBPrivacySplashController *obkSplashController;
  void *v7;
  UINavigationController *v8;
  UINavigationController *navigationController;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  MacSceneHostingPreferencesPresentationController *v14;
  MacSceneHostingPreferencesPresentationController *presentationController;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismissSplashScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", self->_bundleIdentifier));
  v5 = (OBPrivacySplashController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "splashController"));
  obkSplashController = self->_obkSplashController;
  self->_obkSplashController = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacySplashController navigationItem](self->_obkSplashController, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v3);

  v8 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_obkSplashController);
  navigationController = self->_navigationController;
  self->_navigationController = v8;

  -[UINavigationController setNavigationBarHidden:](self->_navigationController, "setNavigationBarHidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadAppKitBundle"));
  v12 = (objc_class *)objc_msgSend(v11, "classNamed:", CFSTR("MacSceneHostingPreferencesPresentationController"));

  objc_initWeak(&location, self);
  v13 = [v12 alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009059CC;
  v16[3] = &unk_1011DBA88;
  objc_copyWeak(&v17, &location);
  v14 = (MacSceneHostingPreferencesPresentationController *)objc_msgSend(v13, "initWithSetupBlock:", v16);
  presentationController = self->_presentationController;
  self->_presentationController = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_dismissSplashScreen
{
  id WeakRetained;

  -[MacSceneHostingPreferencesPresentationController dismissScene](self->_presentationController, "dismissScene");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "preferencesPrivacyControllerDidDismiss:", self);

}

- (UGCAppKitPreferencesPrivacyControllerDelegate)delegate
{
  return (UGCAppKitPreferencesPrivacyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_obkSplashController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
