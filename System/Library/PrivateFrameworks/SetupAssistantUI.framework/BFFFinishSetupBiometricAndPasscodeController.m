@implementation BFFFinishSetupBiometricAndPasscodeController

- (BFFFinishSetupBiometricAndPasscodeController)initWithFlowSkipIdentifier:(id)a3
{
  id v4;
  BFFFinishSetupBiometricAndPasscodeController *v5;
  uint64_t v6;
  NSString *flowSkipIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BFFFinishSetupBiometricAndPasscodeController;
  v5 = -[BFFFinishSetupBiometricAndPasscodeController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    flowSkipIdentifier = v5->_flowSkipIdentifier;
    v5->_flowSkipIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)preconditionViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BFFFinishSetupPINVerificationViewController *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  BFFFinishSetupBiometricAndPasscodeController *v14;
  id v15;

  v4 = a3;
  -[BFFFinishSetupBiometricAndPasscodeController setPasscode:](self, "setPasscode:", 0);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPasscodeSet");

  v7 = 0;
  if (v6)
  {
    v7 = objc_alloc_init(BFFFinishSetupPINVerificationViewController);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __89__BFFFinishSetupBiometricAndPasscodeController_preconditionViewControllerWithCompletion___block_invoke;
    v13 = &unk_24D234560;
    v14 = self;
    v15 = v4;
    -[BFFFinishSetupPINVerificationViewController setCompletion:](v7, "setCompletion:", &v10);
    if (BFFIsiPad())
    {
      -[BFFFinishSetupPINVerificationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7, v10, v11, v12, v13, v14);
      -[BFFFinishSetupPINVerificationViewController popoverPresentationController](v7, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setPermittedArrowDirections:", 0);
      objc_msgSend(v8, "setSourceView:", 0);
      objc_msgSend(v8, "_setCentersPopoverIfSourceViewNotSet:", 1);

    }
    else
    {
      -[BFFFinishSetupPINVerificationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 17, v10, v11, v12, v13, v14);
    }

  }
  return v7;
}

void __89__BFFFinishSetupBiometricAndPasscodeController_preconditionViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setPasscode:", a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    if (a2)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "flowSkipController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didCompleteFlow:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

      v6 = *(_QWORD *)(a1 + 40);
      v8[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup biometric subclass failed to implement -createViewController.", v6, 2u);
  }

  return 0;
}

- (id)viewControllerWithCompletion:(id)a3
{
  id v4;
  BFFFinishSetupBiometricAndPasscodeController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  BFFFinishSetupBiometricAndPasscodeController *v19;

  v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__0;
  v18[4] = __Block_byref_object_dispose__0;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v19 = v5;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke;
  v15[3] = &unk_24D234588;
  v17 = v18;
  v7 = v4;
  v16 = v7;
  -[BFFFinishSetupBiometricAndPasscodeController setCompletion:](v5, "setCompletion:", v15);
  -[BFFFinishSetupBiometricAndPasscodeController passcode](v5, "passcode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  -[BFFFinishSetupBiometricAndPasscodeController passcode](v5, "passcode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke_2;
  v13[3] = &unk_24D2345B0;
  v13[4] = v5;
  v14 = v9 == 0;
  -[BFFFinishSetupBiometricAndPasscodeController createViewControllerWithPasscode:completion:](v5, "createViewControllerWithPasscode:completion:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v18, 8);
  return v11;
}

void __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__BFFFinishSetupBiometricAndPasscodeController_viewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BFFPasscodeViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "flowSkipController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didCompleteFlow:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (!a3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v12 = objc_alloc_init(BFFPasscodeViewController);
      -[BFFPasscodeViewController setPasscodeCreationDelegate:](v12, "setPasscodeCreationDelegate:", *(_QWORD *)(a1 + 32));
      -[BFFPasscodeViewController view](v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "backgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v15);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__userDidTapPasscodeCancelButton_);
      -[BFFPasscodeViewController navigationItem](v12, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLeftBarButtonItem:animated:", v16, 0);

      objc_msgSend(v5, "parentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "showViewController:sender:", v12, *(_QWORD *)(a1 + 32));

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "passcode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFingerprintUnlockAllowed:passcode:completion:", 1, v20, 0);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 48);
  if (v8)
  {
    if (a3 != 2)
      a3 = a3 == 1;
    v21[0] = *(_QWORD *)(v7 + 8);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a3, v9);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = 0;

  }
LABEL_8:

}

- (void)_userDidTapPasscodeCancelButton:(id)a3
{
  NSObject *v4;
  void *v5;
  void (**completion)(id, uint64_t, void *);
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t v10[8];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup biometric user did cancel passcode", v10, 2u);
  }

  -[BFFFinishSetupBiometricAndPasscodeController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordActionWithValue:forFeature:", MEMORY[0x24BDBD1C0], 11);

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    v7 = *MEMORY[0x24BE85820];
    v11[0] = self->_flowSkipIdentifier;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 2, v8);

    v9 = self->_completion;
    self->_completion = 0;

  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[BFFFinishSetupBiometricAndPasscodeController capabilities](self, "capabilities", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPearl");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("ENTER_PASSCODE_SUBTITLE_FACEID");
  else
    v7 = CFSTR("ENTER_PASSCODE_SUBTITLE_TOUCHID");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D234A48, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**completion)(id, _QWORD, void *);
  void *v14;
  id v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup biometric passcode did finish with passcode %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFingerprintUnlockAllowed:passcode:completion:", 1, v5, 0);

  -[BFFFinishSetupBiometricAndPasscodeController flowSkipController](self, "flowSkipController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE85820];
  objc_msgSend(v9, "didCompleteFlow:", *MEMORY[0x24BE85820]);

  CFPreferencesSetValue(CFSTR("Passcode4Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[BFFFinishSetupBiometricAndPasscodeController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordActionWithValue:forFeature:", v12, 11);

  completion = (void (**)(id, _QWORD, void *))self->_completion;
  if (completion)
  {
    v16[0] = self->_flowSkipIdentifier;
    v16[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 0, v14);

    v15 = self->_completion;
    self->_completion = 0;

  }
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_flowSkipIdentifier, 0);
}

@end
