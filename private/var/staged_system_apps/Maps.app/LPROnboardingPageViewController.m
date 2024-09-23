@implementation LPROnboardingPageViewController

- (LPROnboardingPageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  LPROnboardingPageViewController *v11;
  LPROnboardingPageViewController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LPROnboardingPageViewController;
  v11 = -[LPROnboardingPageViewController init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_scenario = a3;
    objc_storeStrong((id *)&v11->_vehicle, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
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
  void *v10;
  id v11;
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
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)LPROnboardingPageViewController;
  -[LPROnboardingPageViewController viewDidLoad](&v37, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("LPROnboardingPageView"));

  if (self->_vehicle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate (with vehicle)"), CFSTR("localized string not found"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate"), CFSTR("localized string not found"), 0));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate subtitle"), CFSTR("localized string not found"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("LPR_onboarding_icon")));
  v11 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v7, v9, v10);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
  objc_msgSend(v12, "setAllowFullWidthIcon:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("OBWelcomeView"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
  objc_msgSend(v15, "setLineBreakMode:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
  objc_msgSend(v16, "setTextAlignment:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
  objc_msgSend(v17, "setNumberOfLines:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] continue"), CFSTR("localized string not found"), 0));
  objc_msgSend(v14, "setTitle:forState:", v19, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "continuePressed", 64);
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ContinueButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonTray"));
  objc_msgSend(v20, "addButton:", v14);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "titleLabel"));
  objc_msgSend(v22, "setLineBreakMode:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "titleLabel"));
  objc_msgSend(v23, "setTextAlignment:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "titleLabel"));
  objc_msgSend(v24, "setNumberOfLines:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Set Up Later"), CFSTR("localized string not found"), 0));
  objc_msgSend(v21, "setTitle:forState:", v26, 0);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "cancelPressed", 64);
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("SetupLaterButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonTray"));
  objc_msgSend(v27, "addButton:", v21);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonTray"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("[LPR Onboarding] Add License Plate privacy"), CFSTR("localized string not found"), 0));
  objc_msgSend(v28, "setCaptionText:", v30);

  -[LPROnboardingPageViewController addChildViewController:](self, "addChildViewController:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v31, "addSubview:", v32);

  objc_msgSend(v11, "didMoveToParentViewController:", self);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_maps_constraintsForCenteringInView:", v35));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

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
  v9.super_class = (Class)LPROnboardingPageViewController;
  -[LPROnboardingPageViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController traitCollection](self, "traitCollection"));
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
  v7.super_class = (Class)LPROnboardingPageViewController;
  -[LPROnboardingPageViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)cancelPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didCancelConfiguringLPRForVehicle:", self->_vehicle);

}

- (void)continuePressed
{
  LPRRegionSelectionViewController *v3;
  int64_t scenario;
  VGVehicle *vehicle;
  id WeakRetained;
  void *v7;
  LPRRegionSelectionViewController *v8;

  v3 = [LPRRegionSelectionViewController alloc];
  scenario = self->_scenario;
  vehicle = self->_vehicle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = -[LPRRegionSelectionViewController initWithScenario:vehicle:delegate:](v3, "initWithScenario:vehicle:delegate:", scenario, vehicle, WeakRetained);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LPROnboardingPageViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
