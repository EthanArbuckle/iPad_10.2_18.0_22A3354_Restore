@implementation STCommunicationSafetyOnboardingController

- (STCommunicationSafetyOnboardingController)initWithCoordinator:(id)a3
{
  STRootViewModelCoordinator *v4;
  STCommunicationSafetyOnboardingController *v5;
  STRootViewModelCoordinator *coordinator;
  objc_super v8;

  v4 = (STRootViewModelCoordinator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationSafetyOnboardingController;
  v5 = -[STCommunicationSafetyOnboardingController init](&v8, sel_init);
  coordinator = v5->_coordinator;
  v5->_coordinator = v4;

  return v5;
}

- (void)presentOverViewController:(id)a3 skipFeatureEnablement:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v8 = a3;
  -[STCommunicationSafetyOnboardingController setCompletionBlock:](self, "setCompletionBlock:", a5);
  -[STCommunicationSafetyOnboardingController setSkipFeatureEnablement:](self, "setSkipFeatureEnablement:", v6);
  v9 = objc_alloc(MEMORY[0x24BE6E420]);
  -[STCommunicationSafetyOnboardingController _createInitialViewController](self, "_createInitialViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRootViewController:", v10);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (!v13)
    objc_msgSend(v11, "setSupportedInterfaceOrientations:", 2);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  objc_msgSend(v11, "setModalInPresentation:", 1);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __109__STCommunicationSafetyOnboardingController_presentOverViewController_skipFeatureEnablement_completionBlock___block_invoke;
  v15[3] = &unk_24DB86588;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v8, "presentViewController:animated:completion:", v14, 1, v15);

}

uint64_t __109__STCommunicationSafetyOnboardingController_presentOverViewController_skipFeatureEnablement_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", *(_QWORD *)(a1 + 40));
}

- (id)_createInitialViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[STCommunicationSafetyOnboardingController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasPasscode")
    && !objc_msgSend(v3, "hasAlreadyEnteredPINForSession"))
  {
    -[STCommunicationSafetyOnboardingController _createPINController](self, "_createPINController");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[STCommunicationSafetyOnboardingController skipFeatureEnablement](self, "skipFeatureEnablement"))
      -[STCommunicationSafetyOnboardingController _createCommunicationSafetyAnalyticsEDUController](self, "_createCommunicationSafetyAnalyticsEDUController");
    else
      -[STCommunicationSafetyOnboardingController _createCommunicationSafetyEDUController](self, "_createCommunicationSafetyEDUController");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_createCommunicationSafetyEDUController
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

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEDUFeatureTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEDUFeatureDetails"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("bubble.left.and.exclamationmark.bubble.right.fill"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v4, v5, v9);
  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEDULearnMoreButton"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__openLearnMore, 0x2000);
  objc_msgSend(v10, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAccessoryButton:", v11);

  -[STCommunicationSafetyOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v10, CFSTR("CommunicationSafetyEDUContinue"), sel__continueSelected, 1);
  -[STCommunicationSafetyOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v10, CFSTR("CommunicationSafetyEDUNotNow"), sel__notNowSelected, 0);

  return v10;
}

- (id)_createCommunicationSafetyAnalyticsEDUController
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

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyAnalyticsEDUTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyAnalyticsEDUDetails"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("chart.bar.xaxis"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v4, v5, v9);
  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.improveCommSafety"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCommunicationSafetyOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v10, CFSTR("CommunicationSafetyEDUShareWithApple"), sel__shareAnalyticsSelected, 1);
  -[STCommunicationSafetyOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v10, CFSTR("CommunicationSafetyEDUDontShare"), sel__dontShareAnalyticsSelected, 0);
  if (v13)
    -[STCommunicationSafetyOnboardingController _addAccessoryButtonToHeaderViewForWelcomeController:title:action:](self, "_addAccessoryButtonToHeaderViewForWelcomeController:title:action:", v10, v13, sel__openAboutAnalytics);

  return v10;
}

- (void)_openLearnMore
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212850"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

}

- (void)_openAboutAnalytics
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveCommSafety"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPresentingViewController:", v3);

    objc_msgSend(v4, "present");
  }

}

- (void)_shareAnalyticsSelected
{
  void *v3;
  void (**v4)(id, _QWORD, BOOL, BOOL);

  -[STCommunicationSafetyOnboardingController setIsAnalyticsEnabled:](self, "setIsAnalyticsEnabled:", 1);
  -[STCommunicationSafetyOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(id, _QWORD, BOOL, BOOL))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 0, -[STCommunicationSafetyOnboardingController isFeatureEnabled](self, "isFeatureEnabled"), -[STCommunicationSafetyOnboardingController isAnalyticsEnabled](self, "isAnalyticsEnabled"));
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_dontShareAnalyticsSelected
{
  void *v3;
  void (**v4)(id, _QWORD, BOOL, BOOL);

  -[STCommunicationSafetyOnboardingController setIsAnalyticsEnabled:](self, "setIsAnalyticsEnabled:", 0);
  -[STCommunicationSafetyOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(id, _QWORD, BOOL, BOOL))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 0, -[STCommunicationSafetyOnboardingController isFeatureEnabled](self, "isFeatureEnabled"), -[STCommunicationSafetyOnboardingController isAnalyticsEnabled](self, "isAnalyticsEnabled"));
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_continueSelected
{
  void *v3;
  id v4;

  -[STCommunicationSafetyOnboardingController setIsFeatureEnabled:](self, "setIsFeatureEnabled:", 1);
  -[STCommunicationSafetyOnboardingController _createCommunicationSafetyAnalyticsEDUController](self, "_createCommunicationSafetyAnalyticsEDUController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

- (void)_notNowSelected
{
  void *v3;
  void (**v4)(id, _QWORD, BOOL, BOOL);

  -[STCommunicationSafetyOnboardingController setIsFeatureEnabled:](self, "setIsFeatureEnabled:", 0);
  -[STCommunicationSafetyOnboardingController setIsAnalyticsEnabled:](self, "setIsAnalyticsEnabled:", 0);
  -[STCommunicationSafetyOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(id, _QWORD, BOOL, BOOL))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 0, -[STCommunicationSafetyOnboardingController isFeatureEnabled](self, "isFeatureEnabled"), -[STCommunicationSafetyOnboardingController isAnalyticsEnabled](self, "isAnalyticsEnabled"));
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_addTrayButtonToWelcomeController:(id)a3 localizationKey:(id)a4 action:(SEL)a5 isBold:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a4;
  v11 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  else
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTitle:forState:", v13, 0);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, a5, 0x2000);
  objc_msgSend(v11, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addButton:", v12);
}

- (void)_addAccessoryButtonToHeaderViewForWelcomeController:(id)a3 title:(id)a4 action:(SEL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE6E400];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "accessoryButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v9, 0);

  objc_msgSend(v13, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, a5, 64);
  objc_msgSend(v10, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAccessoryButton:", v13);
}

- (BOOL)validatePIN:(id)a3 forPINController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  -[STCommunicationSafetyOnboardingController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passcode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  return v10;
}

- (void)didAcceptEnteredPIN
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[STCommunicationSafetyOnboardingController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasAlreadyEnteredPINForSession:", 1);

  if (-[STCommunicationSafetyOnboardingController skipFeatureEnablement](self, "skipFeatureEnablement"))
    -[STCommunicationSafetyOnboardingController _createCommunicationSafetyAnalyticsEDUController](self, "_createCommunicationSafetyAnalyticsEDUController");
  else
    -[STCommunicationSafetyOnboardingController _createCommunicationSafetyEDUController](self, "_createCommunicationSafetyEDUController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewControllers:animated:", v6, 1);

}

- (void)didCancelEnteringPIN
{
  void *v3;
  void (**v4)(id, uint64_t, BOOL, BOOL);

  -[STCommunicationSafetyOnboardingController setIsFeatureEnabled:](self, "setIsFeatureEnabled:", 0);
  -[STCommunicationSafetyOnboardingController setIsAnalyticsEnabled:](self, "setIsAnalyticsEnabled:", 0);
  -[STCommunicationSafetyOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(id, uint64_t, BOOL, BOOL))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 1, -[STCommunicationSafetyOnboardingController isFeatureEnabled](self, "isFeatureEnabled"), -[STCommunicationSafetyOnboardingController isAnalyticsEnabled](self, "isAnalyticsEnabled"));
  -[STCommunicationSafetyOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_createPINController
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPinDelegate:", self);
  objc_msgSend(v3, "setMode:", 3);
  return v3;
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)skipFeatureEnablement
{
  return self->_skipFeatureEnablement;
}

- (void)setSkipFeatureEnablement:(BOOL)a3
{
  self->_skipFeatureEnablement = a3;
}

- (BOOL)isFeatureEnabled
{
  return self->_isFeatureEnabled;
}

- (void)setIsFeatureEnabled:(BOOL)a3
{
  self->_isFeatureEnabled = a3;
}

- (BOOL)isAnalyticsEnabled
{
  return self->_isAnalyticsEnabled;
}

- (void)setIsAnalyticsEnabled:(BOOL)a3
{
  self->_isAnalyticsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
