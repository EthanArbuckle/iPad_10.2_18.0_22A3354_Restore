@implementation BFFFinishSetupPasscodeController

+ (id)finishSetupPasscodeController
{
  return objc_alloc_init(BFFFinishSetupPasscodeController);
}

- (id)viewControllerWithCompletion:(id)a3
{
  BFFPasscodeViewController *v4;
  BFFPasscodeViewController *passcodeViewController;
  NSObject *v6;
  BFFPasscodeViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BFFPasscodeViewController *v13;
  int v15;
  BFFPasscodeViewController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[BFFFinishSetupPasscodeController setCompletion:](self, "setCompletion:", a3);
  v4 = objc_alloc_init(BFFPasscodeViewController);
  passcodeViewController = self->_passcodeViewController;
  self->_passcodeViewController = v4;

  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_passcodeViewController;
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup created passcodeController %@", (uint8_t *)&v15, 0xCu);
  }

  -[BFFPasscodeViewController setPasscodeCreationDelegate:](self->_passcodeViewController, "setPasscodeCreationDelegate:", self);
  objc_storeStrong((id *)&self->_selfReference, self);
  -[BFFPasscodeViewController view](self->_passcodeViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancelButton_);
  -[BFFPasscodeViewController navigationItem](self->_passcodeViewController, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:animated:", v11, 0);

  v13 = self->_passcodeViewController;
  return v13;
}

- (void)_userDidTapCancelButton:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Finish setup passcode user did cancel", v5, 2u);
  }

  -[BFFFinishSetupPasscodeController _completeWithPasscode:result:](self, "_completeWithPasscode:result:", 0, 2);
}

- (void)_completeWithPasscode:(id)a3 result:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**completion)(id, unint64_t, void *);
  void *v12;
  id v13;
  BFFFinishSetupPasscodeController *selfReference;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[BFFFinishSetupPasscodeController flowSkipController](self, "flowSkipController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE85820];
  objc_msgSend(v7, "didCompleteFlow:", *MEMORY[0x24BE85820]);

  CFPreferencesSetValue(CFSTR("Passcode4Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[BFFFinishSetupPasscodeController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordActionWithValue:forFeature:", v10, 11);

  completion = (void (**)(id, unint64_t, void *))self->_completion;
  if (completion)
  {
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, a4, v12);

    v13 = self->_completion;
    self->_completion = 0;

  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  BFFFinishSetupPasscodeController *v17;
  id v18;
  char v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup passcode did finish", buf, 2u);
  }

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    objc_msgSend(v6, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hidesBackButton");

    objc_msgSend(v6, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:", 1);

    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v6, CFSTR("FINISH_SETUP_PASSCODE_CONTROLLER"));
    _BYLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214875000, v13, OS_LOG_TYPE_DEFAULT, "Finish setup passcode will prompt for device passcode change", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE75520], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke;
    v15[3] = &unk_24D234408;
    v19 = v11;
    v16 = v6;
    v17 = self;
    v18 = v7;
    objc_msgSend(v14, "promptForDevicePasscodeChangeToPasscode:overController:completion:", v18, v16, v15);

  }
  else
  {
    -[BFFFinishSetupPasscodeController _completeWithPasscode:result:](self, "_completeWithPasscode:result:", v7, objc_msgSend(v7, "length") == 0);
  }

}

void __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v16 = a2;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup passcode did prompt for device passcode change with success %d error %@", buf, 0x12u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke_10;
  v10[3] = &unk_24D2343E0;
  v7 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __89__BFFFinishSetupPasscodeController_passcodeViewController_didFinishWithPasscodeCreation___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;

  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("FINISH_SETUP_PASSCODE_CONTROLLER"));
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesBackButton:", *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "_completeWithPasscode:result:", *(_QWORD *)(a1 + 48), 0);
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

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end
