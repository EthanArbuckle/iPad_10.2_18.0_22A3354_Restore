@implementation LPRCustomizeInterstitialViewController

- (LPRCustomizeInterstitialViewController)initWithVehicle:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  LPRCustomizeInterstitialViewController *v9;
  LPRCustomizeInterstitialViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPRCustomizeInterstitialViewController;
  v9 = -[LPRCustomizeInterstitialViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)LPRCustomizeInterstitialViewController;
  -[LPRCustomizeInterstitialViewController viewDidLoad](&v31, "viewDidLoad");
  -[LPRCustomizeInterstitialViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("LPRCustomizeInterstitialView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Customize Your Vehicle"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Customize subtitle"), CFSTR("localized string not found"), 0));

  v7 = sub_10037CFB4((int)-[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_flatImageWithColor:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 1));

  v12 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v4, v6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("OBWelcomeView"));

  objc_msgSend(v12, "setModalPresentationStyle:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerView"));
  objc_msgSend(v14, "setIconInheritsTint:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerView"));
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Customize"), CFSTR("localized string not found"), 0));
  objc_msgSend(v17, "setTitle:forState:", v19, 0);

  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "continuePressed", 64);
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("CustomizeButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buttonTray"));
  objc_msgSend(v20, "addButton:", v17);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Set Up Later in Maps Settings"), CFSTR("localized string not found"), 0));
  objc_msgSend(v21, "setTitle:forState:", v23, 0);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "setupLaterPressed", 64);
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("SetupLaterButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buttonTray"));
  objc_msgSend(v24, "addButton:", v21);

  -[LPRCustomizeInterstitialViewController addChildViewController:](self, "addChildViewController:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v25, "addSubview:", v26);

  objc_msgSend(v12, "didMoveToParentViewController:", self);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_maps_constraintsForCenteringInView:", v29));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRCustomizeInterstitialViewController;
  -[LPRCustomizeInterstitialViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPRCustomizeInterstitialViewController;
  -[LPRCustomizeInterstitialViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)setupLaterPressed
{
  -[LPRCustomizeInterstitialViewController _didFinishCreatingVehicle](self, "_didFinishCreatingVehicle");
}

- (void)_didFinishCreatingVehicle
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didFinishConfiguringLPRForVehicle:", self->_vehicle);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v4, "virtualGarageSaveVehicle:", self->_vehicle);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v5, "virtualGarageSelectVehicle:", self->_vehicle);

}

- (void)continuePressed
{
  NSBundle *v3;
  void *v4;
  EditVehicleViewController *v5;
  NSMutableArray *v6;
  void *v7;
  EditVehicleViewController *v8;
  void *v9;
  id v10;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v10 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController traitCollection](self, "traitCollection"));
  v5 = [EditVehicleViewController alloc];
  v6 = sub_10037D03C(v10, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[EditVehicleViewController initWithColors:vehicle:delegate:](v5, "initWithColors:vehicle:delegate:", v7, self->_vehicle, self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LPRCustomizeInterstitialViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a6, "count"))
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "-[LPRCustomizeInterstitialViewController editVehicleViewController:didSelectColor:nickname:removedNetworks:]";
      v20 = 2080;
      v21 = "LPRCustomizeInterstitialViewController.m";
      v22 = 1024;
      v23 = 118;
      v24 = 2080;
      v25 = "removedNetworks.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_hexRepresentation"));
  -[VGVehicle setColorHex:](self->_vehicle, "setColorHex:", v11);

  if (objc_msgSend(v10, "length"))
    -[VGVehicle setDisplayName:](self->_vehicle, "setDisplayName:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v12, "virtualGarageSaveVehicle:", self->_vehicle);

}

- (void)editVehicleViewControllerDidSelectDone:(id)a3
{
  -[LPRCustomizeInterstitialViewController _didFinishCreatingVehicle](self, "_didFinishCreatingVehicle", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
