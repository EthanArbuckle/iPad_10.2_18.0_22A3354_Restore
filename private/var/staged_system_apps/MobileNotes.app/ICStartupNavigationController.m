@implementation ICStartupNavigationController

- (ICStartupNavigationController)initWithForceWelcomeScreen:(BOOL)a3 presentingWindow:(id)a4 dismissBlock:(id)a5
{
  id v8;
  id v9;
  ICStartupNavigationController *v10;
  ICStartupNavigationController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  ICStartupWhatsNewViewController *v18;
  void *v19;
  ICStartupController *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  ICStartupViewController *v26;
  ICStartupDeviceListViewController *v27;
  void *v28;
  void *v29;
  ICStartupDeviceListViewController *v30;
  int IsAppleAccountBrandingEnabled;
  void *v33;
  const __CFString *v34;
  objc_super v35;

  v8 = a4;
  v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)ICStartupNavigationController;
  v10 = -[ICStartupNavigationController initWithNibName:bundle:](&v35, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    -[ICStartupNavigationController setPresentingWindow:](v10, "setPresentingWindow:", v8);
    -[ICStartupNavigationController setDismissBlock:](v11, "setDismissBlock:", v9);
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_applicationIconImageWithSize:](UIImage, "ic_applicationIconImageWithSize:", 84.0, 84.0));
    else
      v12 = 0;
    v13 = objc_msgSend(v8, "ic_behavior");
    if (!a3
      && +[ICStartupController shouldShowWhatsNewScreen](ICStartupController, "shouldShowWhatsNewScreen"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      if (v13 == (id)1)
        v16 = CFSTR("What’s New in Math Notes");
      else
        v16 = CFSTR("What’s New in Notes");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1005704B8, 0));

      v18 = -[ICStartupWhatsNewViewController initWithTitle:detailText:icon:]([ICStartupWhatsNewViewController alloc], "initWithTitle:detailText:icon:", v17, 0, v12);
      -[ICStartupNavigationController setStartupWhatsNewViewController:](v11, "setStartupWhatsNewViewController:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupWhatsNewViewController](v11, "startupWhatsNewViewController"));
      v11->_startupScreenType = 1;
      goto LABEL_19;
    }
    v20 = -[ICStartupController initWithDelegate:]([ICStartupController alloc], "initWithDelegate:", v11);
    -[ICStartupNavigationController setStartupController:](v11, "setStartupController:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = v21;
    if (v13 == (id)1)
      v23 = CFSTR("Welcome to Math Notes");
    else
      v23 = CFSTR("Welcome to Notes");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1005704B8, 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController traitCollection](v11, "traitCollection"));
    if (objc_msgSend(v24, "horizontalSizeClass") == (id)2
      && (+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
    {

      if (v13 == (id)1)
      {
        v25 = 0;
        goto LABEL_18;
      }
      IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v33;
      if (IsAppleAccountBrandingEnabled)
        v34 = CFSTR("Great new tools for notes synced to your Apple Account.");
      else
        v34 = CFSTR("Great new tools for notes synced to your iCloud account.");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_1005704B8, 0));
    }
    else
    {
      v25 = 0;
    }

LABEL_18:
    v26 = -[ICStartupViewController initWithTitle:detailText:icon:]([ICStartupViewController alloc], "initWithTitle:detailText:icon:", v17, v25, v12);
    -[ICStartupNavigationController setStartupViewController:](v11, "setStartupViewController:", v26);

    v27 = [ICStartupDeviceListViewController alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Upgrade Notes"), &stru_1005704B8, 0));
    v30 = -[ICStartupDeviceListViewController initWithTitle:detailText:icon:](v27, "initWithTitle:detailText:icon:", v29, 0, 0);
    -[ICStartupNavigationController setDeviceListViewController:](v11, "setDeviceListViewController:", v30);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupViewController](v11, "startupViewController"));
    v11->_startupScreenType = 2;

LABEL_19:
    -[ICStartupNavigationController pushViewController:animated:](v11, "pushViewController:animated:", v19, 0);
    -[ICStartupNavigationController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
    -[ICStartupNavigationController setNavigationBarHidden:](v11, "setNavigationBarHidden:", 1);

  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICStartupNavigationController;
  -[ICStartupNavigationController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupViewController](self, "startupViewController"));
  objc_msgSend(v4, "checkStatusIfNecessaryWithDeviceCheckIndicator:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController view](self, "view"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Welcome Screen"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICStartupNavigationController;
  -[ICStartupNavigationController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController eventReporter](self, "eventReporter"));
  objc_msgSend(v4, "startOnboardingScreenViewEventDurationTracking");

}

- (BOOL)shouldSwapChoices
{
  return 0;
}

- (void)continueAction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  objc_msgSend(v3, "didContinueFromStartupView");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController deviceListViewController](self, "deviceListViewController"));
  -[ICStartupNavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 1);

}

- (void)upgradeAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  objc_msgSend(v2, "didUpgradeFromStartupView:", 1);

}

- (void)noUpgradeAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  objc_msgSend(v2, "didUpgradeFromStartupView:", 0);

}

- (void)submitOnboardingScreenViewEvent
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[ICStartupNavigationController startupScreenType](self, "startupScreenType");
  if (v3 == 2)
    v4 = 1;
  else
    v4 = 2 * (v3 == 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController eventReporter](self, "eventReporter"));
  objc_msgSend(v5, "submitOnboardingScreenViewEventWithType:", v4);

}

- (void)dismissWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  -[ICStartupNavigationController submitOnboardingScreenViewEvent](self, "submitOnboardingScreenViewEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  objc_msgSend(v4, "didContinueFromStartupView");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController dismissBlock](self, "dismissBlock"));
  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController dismissBlock](self, "dismissBlock"));
    ((void (**)(_QWORD, id))v6)[2](v6, v8);

    -[ICStartupNavigationController setDismissBlock:](self, "setDismissBlock:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICStartupNavigationControllerDidDismissNotification"), self);

}

- (void)dismiss
{
  -[ICStartupNavigationController dismissWithCompletionBlock:](self, "dismissWithCompletionBlock:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)ICStartupNavigationController;
  return -[ICStartupNavigationController supportedInterfaceOrientations](&v6, "supportedInterfaceOrientations");
}

+ (id)defaultLabelColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (double)introductionControlsButtonWidthForView:(id)a3 viewSize:(CGSize)a4
{
  double width;
  id v5;
  void *v6;
  id v7;
  double v8;
  void *v9;

  width = a4.width;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
  {
    v8 = fmin(width + -32.0, 360.0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    if (objc_msgSend(v9, "horizontalSizeClass") == (id)1)
      v8 = 288.0;
    else
      v8 = 480.0;

  }
  return v8;
}

+ (double)introductionControlsBottomSpacingForViewSize:(CGSize)a3
{
  return 0.0;
}

+ (BOOL)shouldUseCompactLayoutForTraitCollection:(id)a3 viewSize:(CGSize)a4
{
  double width;
  void *v5;
  id v6;
  BOOL v8;

  width = a4.width;
  if (objc_msgSend(a3, "horizontalSizeClass", a4.width, a4.height) != (id)1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  v8 = width < 639.0 || v6 == 0;

  return v8;
}

- (NSArray)primaryAccountDevices
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryAccountDevices"));

  return (NSArray *)v3;
}

- (unint64_t)getStartupMigrationType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  v3 = objc_msgSend(v2, "getStartupMigrationType");

  return (unint64_t)v3;
}

- (void)startupMigrationTypeMightHaveChanged
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupController](self, "startupController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupViewController](self, "startupViewController"));
  objc_msgSend(v4, "checkStatusIfNecessaryWithDeviceCheckIndicator:", v3);

}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *eventReporter;
  void *v10;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController view](self, "view"));
    v8 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v6, v7);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (void)noUpgradeActionAndDismiss
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController viewControllers](self, "viewControllers"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController deviceListViewController](self, "deviceListViewController"));
  if (v8 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController deviceListViewController](self, "deviceListViewController"));
    objc_msgSend(v7, "noUpgrade:", self);
    goto LABEL_5;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupViewController](self, "startupViewController"));

  v6 = v8;
  if (v8 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupNavigationController startupViewController](self, "startupViewController"));
    objc_msgSend(v7, "continueAction:", self);
LABEL_5:

    v6 = v8;
  }

}

- (UIWindow)presentingWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_presentingWindow);
}

- (void)setPresentingWindow:(id)a3
{
  objc_storeWeak((id *)&self->_presentingWindow, a3);
}

- (ICStartupViewController)startupViewController
{
  return self->_startupViewController;
}

- (void)setStartupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_startupViewController, a3);
}

- (ICStartupDeviceListViewController)deviceListViewController
{
  return self->_deviceListViewController;
}

- (void)setDeviceListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_deviceListViewController, a3);
}

- (ICStartupWhatsNewViewController)startupWhatsNewViewController
{
  return self->_startupWhatsNewViewController;
}

- (void)setStartupWhatsNewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_startupWhatsNewViewController, a3);
}

- (ICStartupController)startupController
{
  return self->_startupController;
}

- (void)setStartupController:(id)a3
{
  objc_storeStrong((id *)&self->_startupController, a3);
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (unint64_t)startupScreenType
{
  return self->_startupScreenType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_startupController, 0);
  objc_storeStrong((id *)&self->_startupWhatsNewViewController, 0);
  objc_storeStrong((id *)&self->_deviceListViewController, 0);
  objc_storeStrong((id *)&self->_startupViewController, 0);
  objc_destroyWeak((id *)&self->_presentingWindow);
}

@end
