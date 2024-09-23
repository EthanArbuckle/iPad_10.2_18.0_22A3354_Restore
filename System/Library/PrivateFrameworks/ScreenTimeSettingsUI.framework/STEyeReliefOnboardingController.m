@implementation STEyeReliefOnboardingController

- (STEyeReliefOnboardingController)initWithCoordinator:(id)a3
{
  id v5;
  void *v6;
  STEyeReliefOnboardingController *v7;
  STEyeReliefOnboardingController *v8;
  _TtC20ScreenTimeSettingsUI19STEyeReliefMicaView *v9;
  _TtC20ScreenTimeSettingsUI19STEyeReliefMicaView *micaView;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v5 = a3;
  -[STEyeReliefOnboardingController _createInitialViewControllerWithCoordinator:](self, "_createInitialViewControllerWithCoordinator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)STEyeReliefOnboardingController;
  v7 = -[STEyeReliefOnboardingController initWithRootViewController:](&v14, sel_initWithRootViewController_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_coordinator, a3);
    v9 = objc_alloc_init(_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView);
    micaView = v8->_micaView;
    v8->_micaView = v9;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (!v12)
      -[OBNavigationController setSupportedInterfaceOrientations:](v8, "setSupportedInterfaceOrientations:", 2);
    -[STEyeReliefOnboardingController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  }

  return v8;
}

- (void)presentOverViewController:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id completionHandler;
  id v8;

  v8 = a3;
  v6 = _Block_copy(a4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  objc_msgSend(v8, "presentViewController:animated:completion:", self, 1, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefOnboardingController;
  -[STEyeReliefOnboardingController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[STEyeReliefOnboardingController primaryWelcomeViewController](self, "primaryWelcomeViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[STEyeReliefOnboardingController play](self, "play");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefOnboardingController.viewDidAppear", v5, 2u);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STEyeReliefOnboardingController;
  -[STEyeReliefOnboardingController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[STEyeReliefOnboardingController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1)
    v5 = 0.901960784;
  else
    v5 = 0.196078431;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v5, v5, v5, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefOnboardingController primaryWelcomeViewController](self, "primaryWelcomeViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefOnboardingController.viewDidLayoutSubviews", v9, 2u);
  }
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STEyeReliefOnboardingController;
  -[STEyeReliefOnboardingController _presentationControllerDidDismiss:](&v4, sel__presentationControllerDidDismiss_, a3);
  -[STEyeReliefOnboardingController _handleResponse:](self, "_handleResponse:", 0);
}

- (void)play
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  -[STEyeReliefOnboardingController micaView](self, "micaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v23 = (id)objc_opt_new();
    objc_msgSend(v23, "setType:", *MEMORY[0x24BDE5E00]);
    objc_msgSend(v23, "setDuration:", 0.5);
    -[STEyeReliefOnboardingController primaryWelcomeViewController](self, "primaryWelcomeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v23, 0);

    -[STEyeReliefOnboardingController micaView](self, "micaView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    -[STEyeReliefOnboardingController primaryWelcomeViewController](self, "primaryWelcomeViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STEyeReliefOnboardingController micaView](self, "micaView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[STEyeReliefOnboardingController primaryWelcomeViewController](self, "primaryWelcomeViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[STEyeReliefOnboardingController micaView](self, "micaView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  }
}

- (id)_createInitialViewControllerWithCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPasscode") && (objc_msgSend(v4, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    -[STEyeReliefOnboardingController _createPINController](self, "_createPINController");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STEyeReliefOnboardingController _createEyeReliefEDUController](self, "_createEyeReliefEDUController");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_createEyeReliefEDUController
{
  void *v3;
  void *v4;
  STHeroWelcomeController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureTitle"), &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureDetailText"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STHeroWelcomeController initWithTitle:detailText:topInset:]([STHeroWelcomeController alloc], "initWithTitle:detailText:topInset:", v15, v4, 0.0);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureButtonTrayCaption"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHeroWelcomeController buttonTray](v5, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCaptionText:", v6);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureContinueButton"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__continueButtonPressed, 64);
  -[STHeroWelcomeController buttonTray](v5, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v8);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEDUFeatureNotNowButton"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__cancelOnboarding, 64);
  -[STHeroWelcomeController buttonTray](v5, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", v11);

  -[STEyeReliefOnboardingController setPrimaryWelcomeViewController:](self, "setPrimaryWelcomeViewController:", v5);
  return v5;
}

- (id)_createSecondaryWelcomeController
{
  void *v2;
  STEyeReliefIntroHowItWorksViewController *v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __68__STEyeReliefOnboardingController__createSecondaryWelcomeController__block_invoke;
  v9 = &unk_24DB86870;
  objc_copyWeak(&v10, &location);
  v2 = _Block_copy(&v6);
  v3 = [STEyeReliefIntroHowItWorksViewController alloc];
  v4 = -[STEyeReliefIntroHowItWorksViewController initForChecklistFlow:withCompletionHandler:](v3, "initForChecklistFlow:withCompletionHandler:", 0, v2, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

void __68__STEyeReliefOnboardingController__createSecondaryWelcomeController__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_dismissOnboardingAndEnable");
  else
    objc_msgSend(WeakRetained, "_cancelOnboarding");

}

- (void)_handleResponse:(int64_t)a3
{
  id completionHandler;
  void (**v6)(id, int64_t);

  -[STEyeReliefOnboardingController completionHandler](self, "completionHandler");
  v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v6[2](v6, a3);
  }

}

- (void)_continueButtonPressed
{
  void *v3;
  id v4;

  -[STEyeReliefOnboardingController _createSecondaryWelcomeController](self, "_createSecondaryWelcomeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefOnboardingController setSecondaryWelcomeViewController:](self, "setSecondaryWelcomeViewController:", v3);

  -[STEyeReliefOnboardingController secondaryWelcomeViewController](self, "secondaryWelcomeViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 1);

}

- (void)_dismissOnboardingAndEnable
{
  -[STEyeReliefOnboardingController _handleResponse:](self, "_handleResponse:", 2);
  -[STEyeReliefOnboardingController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_1);
}

- (void)_cancelOnboarding
{
  -[STEyeReliefOnboardingController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_43);
  -[STEyeReliefOnboardingController _handleResponse:](self, "_handleResponse:", 0);
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
  -[STEyeReliefOnboardingController coordinator](self, "coordinator");
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
  double v6;
  double v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[STEyeReliefOnboardingController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasAlreadyEnteredPINForSession:", 1);

  -[STEyeReliefOnboardingController _createEyeReliefEDUController](self, "_createEyeReliefEDUController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[STEyeReliefOnboardingController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);

  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefOnboardingController setViewControllers:animated:](self, "setViewControllers:animated:", v8, 0);

  v9 = dispatch_time(0, 750000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__STEyeReliefOnboardingController_didAcceptEnteredPIN__block_invoke;
  block[3] = &unk_24DB86440;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

}

uint64_t __54__STEyeReliefOnboardingController_didAcceptEnteredPIN__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

- (void)didCancelEnteringPIN
{
  -[STEyeReliefOnboardingController _handleResponse:](self, "_handleResponse:", 0);
  -[STEyeReliefOnboardingController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (STHeroWelcomeController)primaryWelcomeViewController
{
  return self->_primaryWelcomeViewController;
}

- (void)setPrimaryWelcomeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryWelcomeViewController, a3);
}

- (OBWelcomeController)secondaryWelcomeViewController
{
  return self->_secondaryWelcomeViewController;
}

- (void)setSecondaryWelcomeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryWelcomeViewController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)micaView
{
  return self->_micaView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_secondaryWelcomeViewController, 0);
  objc_storeStrong((id *)&self->_primaryWelcomeViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
