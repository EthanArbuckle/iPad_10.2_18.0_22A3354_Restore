@implementation SBPowerDownViewController

- (SBPowerDownViewController)initWithWindowSceneManager:(id)a3
{
  id v5;
  SBPowerDownViewController *v6;
  SBPowerDownViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPowerDownViewController;
  v6 = -[SBPowerDownViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_windowSceneManager, a3);

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPowerDownViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SBPowerDownViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "powerDownViewControllerDidDisappear:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBPowerDownViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[SBPowerDownViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBPowerDownView setFrame:](self->_powerDownView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBPowerDownView *v12;
  SBPowerDownView *v13;
  SBPowerDownView *powerDownView;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBPowerDownViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activeVariant");
  objc_msgSend(v4, "contrastForVariant:", v5);
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CEAF48];
  objc_msgSend(v4, "averageColorForVariant:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibilitySettingsForVariant:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [SBPowerDownView alloc];
  objc_msgSend(v3, "bounds");
  v13 = -[SBUIPowerDownView initWithFrame:vibrantSettings:](v12, "initWithFrame:vibrantSettings:", v11);
  powerDownView = self->_powerDownView;
  self->_powerDownView = v13;

  -[SBUIPowerDownView setDelegate:](self->_powerDownView, "setDelegate:", self);
  objc_msgSend(v3, "addSubview:", self->_powerDownView);
  v15 = objc_alloc_init(MEMORY[0x1E0D898D8]);
  -[SBPowerDownViewController setBeaconManager:](self, "setBeaconManager:", v15);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownViewController;
  -[SBPowerDownViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBPowerDownViewController _beginTimeTracking](self, "_beginTimeTracking");
  -[SBPowerDownViewController _incrementCountForKey:](self, "_incrementCountForKey:", CFSTR("com.apple.springboard.powerdown.uiActivatedCount"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownViewController;
  -[SBPowerDownViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBPowerDownViewController _endTimeTrackingIncludingReportWithKey:](self, "_endTimeTrackingIncludingReportWithKey:", CFSTR("com.apple.springboard.powerdown.uiActivatedDurationSeconds"));
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)powerDownViewRequestCancel:(id)a3
{
  id v4;

  -[SBPowerDownViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "powerDownViewControllerRequestsDismissal:", self);

}

- (void)powerDownViewRequestPowerDown:(id)a3
{
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD v9[5];

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke;
  v9[3] = &unk_1E8E9DED8;
  v9[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v9, a2, a3);
  if (-[SBPowerDownViewController userWantsFindMySuppressed](self, "userWantsFindMySuppressed"))
  {
    -[SBPowerDownViewController beaconManager](self, "beaconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_2;
    v7[3] = &unk_1E8E9E8D0;
    v8 = v5;
    objc_msgSend(v6, "setSuppressLPEMBeaconing:completion:", 1, v7);

  }
  else
  {
    v5[2](v5);
  }

}

void __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "powerDownViewControllerRequestsPowerDown:", *(_QWORD *)(a1 + 32));

}

void __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_3;
  block[3] = &unk_1E8E9E8D0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showPowerDownFindMyAlertWithProceed:(id)a3 cancelCompletion:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("POWER_DOWN_FIND_MY_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("POWER_DOWN_FIND_MY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v25, v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CEA2E0];
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke;
  v28[3] = &unk_1E8E9E918;
  v28[4] = self;
  v29 = v6;
  v19 = v6;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v13, 0, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0CEA2E0];
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke_3;
  v26[3] = &unk_1E8E9E918;
  v26[4] = self;
  v27 = v7;
  v22 = v7;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v15, 1, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v23);

  -[SBPowerDownViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
}

uint64_t __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "beaconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserHasAcknowledgedFindMy:completion:", 1, &__block_literal_global_8);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "beaconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserHasAcknowledgedFindMy:completion:", 1, &__block_literal_global_48);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showPowerDownFindMyAlert
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
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("POWER_DOWN_FIND_MY_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("POWER_DOWN_FIND_MY_DISABLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_BUTTON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke;
  v18[3] = &unk_1E8E9DCB0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v12, 0, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v15);

  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke_2;
  v17[3] = &unk_1E8E9DCB0;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v10, 0, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  -[SBPowerDownViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

uint64_t __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userAcknowledgedFindMyInfo");
}

uint64_t __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapTemporarilyDisableFindMy");
}

- (void)userAcknowledgedFindMyInfo
{
  void *v3;

  -[SBPowerDownViewController beaconManager](self, "beaconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserHasAcknowledgedFindMy:completion:", 1, &__block_literal_global_53);

  -[SBUIPowerDownView didAcknowledgeFindMyInfo](self->_powerDownView, "didAcknowledgeFindMyInfo");
}

- (void)didTapTemporarilyDisableFindMy
{
  void *v3;
  int v4;
  void *v5;
  SBFUserAuthenticationController *v6;
  SBFUserAuthenticationController *userAuthController;
  SBFLockOutStatusProvider *v8;
  SBFLockOutStatusProvider *lockOutController;
  SBPasscodeEntryTransientOverlayViewController *v10;
  void *v11;
  void *v12;
  SBPasscodeEntryTransientOverlayViewController *v13;

  -[SBPowerDownViewController userAcknowledgedFindMyInfo](self, "userAcknowledgedFindMyInfo");
  objc_msgSend((id)SBApp, "authenticationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPasscodeSet");

  if (v4)
  {
    -[SBPowerDownViewController userAuthController](self, "userAuthController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v6 = (SBFUserAuthenticationController *)objc_claimAutoreleasedReturnValue();
      userAuthController = self->_userAuthController;
      self->_userAuthController = v6;

      objc_msgSend((id)SBApp, "lockOutController");
      v8 = (SBFLockOutStatusProvider *)objc_claimAutoreleasedReturnValue();
      lockOutController = self->_lockOutController;
      self->_lockOutController = v8;

    }
    v10 = [SBPasscodeEntryTransientOverlayViewController alloc];
    objc_msgSend((id)SBApp, "authenticationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBPasscodeEntryTransientOverlayViewController initWithAuthenticationController:](v10, "initWithAuthenticationController:", v11);

    -[SBPowerDownViewController setPasscodeEntryTransientOverlayViewController:](self, "setPasscodeEntryTransientOverlayViewController:", v13);
    -[SBPasscodeEntryTransientOverlayViewController setDelegate:](self->_passcodeEntryTransientOverlayViewController, "setDelegate:", self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, 1, 0);

  }
  else
  {
    -[SBPowerDownViewController setUserWantsFindMySuppressed:](self, "setUserWantsFindMySuppressed:", 1);
    -[SBUIPowerDownView didSuppressFindMy](self->_powerDownView, "didSuppressFindMy");
  }
}

- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  SBPasscodeEntryTransientOverlayViewController *passcodeEntryTransientOverlayViewController;

  v4 = a4;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, v4, 0);

  passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
  self->_passcodeEntryTransientOverlayViewController = 0;

}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__SBPowerDownViewController_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke;
  v10[3] = &unk_1E8E9E980;
  v10[4] = self;
  v5 = a4;
  v6 = (void *)MEMORY[0x1D17E5550](v10);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DA0]), "initForPasscode:source:handler:", v5, 0, v6);

  -[SBPowerDownViewController userAuthController](self, "userAuthController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processAuthenticationRequest:", v7);

  return 1;
}

uint64_t __94__SBPowerDownViewController_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  id *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no");
    if (a2)
      v5 = CFSTR("yes");
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "PowerDownFindMy auth attempt succeeded: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(id **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "setUserWantsFindMySuppressed:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "didSuppressFindMy");
  }
  else
  {
    result = objc_msgSend(v6[182], "isBlocked");
    if (!(_DWORD)result)
      return result;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setPasscodeVisible:animated:", 0, 1);
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, 1, 0);

}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_PASSCODE_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_PASSCODE_SUBTITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)powerDownViewDidCancelSlide:(id)a3
{
  -[SBPowerDownViewController _incrementCountForKey:](self, "_incrementCountForKey:", CFSTR("com.apple.springboard.powerdown.poweroffSliderCanceledByLettingGoCount"));
}

- (void)powerDownViewDidCompleteSlide:(id)a3
{
  -[SBPowerDownViewController _incrementCountForKey:](self, "_incrementCountForKey:", CFSTR("com.apple.springboard.powerdown.powerOffSliderCompletedCount"));
}

- (void)powerDownViewDidFireIdleTimer:(id)a3
{
  -[SBPowerDownViewController _incrementCountForKey:](self, "_incrementCountForKey:", CFSTR("com.apple.springboard.powerdown.uiDeactivatedByIdleCount"));
}

- (void)powerDownViewDidReceiveCancelButtonAction:(id)a3
{
  -[SBPowerDownViewController _incrementCountForKey:](self, "_incrementCountForKey:", CFSTR("com.apple.springboard.powerdown.uiDeactivatedByCancelButtonCount"));
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  id obj;
  _QWORD block[5];
  id v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "performAlongsideTransitions");
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
  v6 = objc_msgSend(v3, "isAnimated");
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v29[3] = &unk_1E8E9DED8;
  v8 = v4;
  v30 = v8;
  objc_msgSend(v5, "hideAnimated:completion:", v6, v29);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = a1;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 1440);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v14 = 0.0;
        if (objc_msgSend(v3, "isAnimated"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(v18 + 32) + 1392), "showHideAnimationDuration");
          v14 = v15;
        }
        v16 = (void *)MEMORY[0x1E0CEABB0];
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
        v24[3] = &unk_1E8E9DED8;
        v24[4] = v13;
        v22[0] = v7;
        v22[1] = 3221225472;
        v22[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
        v22[3] = &unk_1E8E9DEB0;
        v22[4] = v13;
        v23 = v8;
        objc_msgSend(v16, "animateWithDuration:animations:completion:", v24, v22, v14);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  block[3] = &unk_1E8E9E820;
  block[4] = *(_QWORD *)(v18 + 32);
  v21 = v3;
  v17 = v3;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1440);
  *(_QWORD *)(v2 + 1440) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  NSObject *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "performAlongsideTransitions");
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
  v27 = v3;
  v6 = objc_msgSend(v3, "isAnimated");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  v38[3] = &unk_1E8E9DED8;
  v7 = v4;
  v39 = v7;
  objc_msgSend(v5, "showAnimated:completion:", v6, v38);
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "connectedWindowScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    v12 = *MEMORY[0x1E0CEBE20];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v14, "isExternalDisplayWindowScene"))
        {
          dispatch_group_enter(v7);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F88]), "initWithWindowScene:", v14);
          objc_msgSend(v15, "setWindowLevel:", v12);
          objc_msgSend(v15, "setHidden:", 0);
          objc_msgSend(v15, "setAlpha:", 0.0);
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
          objc_msgSend(v15, "bounds");
          objc_msgSend(v16, "createDimmingBackdropViewWithFrame:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addSubview:", v17);
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
          if (!v18)
          {
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v20 = *(_QWORD *)(a1 + 32);
            v21 = *(void **)(v20 + 1440);
            *(_QWORD *)(v20 + 1440) = v19;

            v18 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
          }
          objc_msgSend(v18, "addObject:", v15);
          v22 = 0.0;
          if (objc_msgSend(v27, "isAnimated"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "showHideAnimationDuration");
            v22 = v23;
          }
          v24 = (void *)MEMORY[0x1E0CEABB0];
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
          v32[3] = &unk_1E8E9DED8;
          v33 = v15;
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
          v30[3] = &unk_1E8E9E980;
          v31 = v7;
          v25 = v15;
          objc_msgSend(v24, "animateWithDuration:animations:completion:", v32, v30, v22);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
  block[3] = &unk_1E8E9DED8;
  v29 = v27;
  v26 = v27;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (int64_t)idleTimerMode
{
  return 3;
}

- (BOOL)shouldDisableBanners
{
  return 1;
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (BOOL)shouldDisableSiri
{
  return 1;
}

- (BOOL)shouldPendAlertItems
{
  return 1;
}

- (BOOL)handleLockButtonPress
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_forceBioLockout");

  return 1;
}

- (void)_beginTimeTracking
{
  self->_aggdStartTime = mach_absolute_time();
}

- (void)_incrementCountForKey:(id)a3
{
  ADClientAddValueForScalarKey();
}

- (void)_endTimeTrackingIncludingReportWithKey:(id)a3
{
  if (self->_aggdStartTime)
  {
    ADPushTimeIntervalForDistributionKeySinceStartTime();
    self->_aggdStartTime = 0;
  }
}

- (SBPowerDownViewControllerDelegate)delegate
{
  return (SBPowerDownViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void)setWindowSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneManager, a3);
}

- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController
{
  return self->_passcodeEntryTransientOverlayViewController;
}

- (void)setPasscodeEntryTransientOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, a3);
}

- (NSMutableArray)externalDisplayDimmingWindows
{
  return self->_externalDisplayDimmingWindows;
}

- (void)setExternalDisplayDimmingWindows:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayDimmingWindows, a3);
}

- (SBFUserAuthenticationController)userAuthController
{
  return self->_userAuthController;
}

- (void)setUserAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_userAuthController, a3);
}

- (BOOL)userWantsFindMySuppressed
{
  return self->_userWantsFindMySuppressed;
}

- (void)setUserWantsFindMySuppressed:(BOOL)a3
{
  self->_userWantsFindMySuppressed = a3;
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
  objc_storeStrong((id *)&self->_lockOutController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_externalDisplayDimmingWindows, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_powerDownView, 0);
}

@end
