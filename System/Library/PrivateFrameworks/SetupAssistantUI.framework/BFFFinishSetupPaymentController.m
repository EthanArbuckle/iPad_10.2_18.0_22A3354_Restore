@implementation BFFFinishSetupPaymentController

+ (id)finishSetupPaymentControllerWithHost:(id)a3
{
  id v3;
  BFFFinishSetupPaymentController *v4;

  v3 = a3;
  v4 = -[BFFFinishSetupPaymentController initWithHost:]([BFFFinishSetupPaymentController alloc], "initWithHost:", v3);

  return v4;
}

- (BFFFinishSetupPaymentController)initWithHost:(id)a3
{
  id v4;
  BFFFinishSetupPaymentController *v5;
  BFFFinishSetupPaymentController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BFFFinishSetupPaymentController;
  v5 = -[BFFFinishSetupPaymentController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_host, v4);

  return v6;
}

- (id)prerequisiteFlowIdentifier
{
  BFFFinishSetupFlowHosting **p_host;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  char v12;

  p_host = &self->_host;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  v4 = (void *)*MEMORY[0x24BE85820];
  if (objc_msgSend(WeakRetained, "didSkipFlowInFinishSetup:", *MEMORY[0x24BE85820]))
  {

LABEL_9:
    v10 = 0;
    return v10;
  }
  v5 = objc_loadWeakRetained((id *)p_host);
  v6 = (void *)*MEMORY[0x24BE85808];
  v7 = objc_msgSend(v5, "didSkipFlowInFinishSetup:", *MEMORY[0x24BE85808]);

  if ((v7 & 1) != 0)
    goto LABEL_9;
  v8 = objc_loadWeakRetained((id *)p_host);
  v9 = objc_msgSend(v8, "didCompleteFlowInFinishSetup:", v4);

  if ((v9 & 1) != 0
    || (+[BFFFinishSetupPaymentController registrationViewControllerOutstandingRequirements](BFFFinishSetupPaymentController, "registrationViewControllerOutstandingRequirements") & 2) == 0|| (v10 = v4) == 0)
  {
    v11 = objc_loadWeakRetained((id *)p_host);
    v12 = objc_msgSend(v11, "didCompleteFlowInFinishSetup:", v6);

    if ((v12 & 1) == 0
      && !+[BFFFinishSetupPaymentController hasPrimaryiCloudAccount](BFFFinishSetupPaymentController, "hasPrimaryiCloudAccount"))
    {
      v10 = v6;
      return v10;
    }
    goto LABEL_9;
  }
  return v10;
}

+ (unint64_t)registrationViewControllerOutstandingRequirements
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc((Class)getPKSetupAssistantContextClass()), "initWithSetupAssistantAsFollowupAction:", 1);
  v3 = (void *)objc_msgSend(objc_alloc((Class)getPKPaymentSetupAssistantControllerClass()), "initWithSetupAssistantContext:", v2);
  objc_msgSend(v3, "isFollowupNeededReturningRequirements:", &v6);
  v4 = v6;

  return v4;
}

+ (BOOL)hasPrimaryiCloudAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (BOOL)controllerNeedsToRun
{
  BFFFinishSetupFlowHosting **p_host;
  id WeakRetained;
  id v4;
  int v5;
  NSObject *v6;
  BOOL v7;
  uint8_t v9[16];
  uint8_t buf[16];

  p_host = &self->_host;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (objc_msgSend(WeakRetained, "didSkipFlowInFinishSetup:", *MEMORY[0x24BE85820]))
  {

LABEL_4:
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup payment controller does not need to run. The user skipped a prerequisite", buf, 2u);
    }
    v7 = 0;
    goto LABEL_10;
  }
  v4 = objc_loadWeakRetained((id *)p_host);
  v5 = objc_msgSend(v4, "didSkipFlowInFinishSetup:", *MEMORY[0x24BE85808]);

  if (v5)
    goto LABEL_4;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup payment controller needs to run", v9, 2u);
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (id)viewControllerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  UIViewController *v6;

  -[BFFFinishSetupPaymentController setCompletion:](self, "setCompletion:", a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancelButton_);
  -[UIViewController navigationItem](self->_registrationViewController, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:animated:", v4, 0);

  v6 = self->_registrationViewController;
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PKPaymentSetupAssistantController *v7;
  PKPaymentSetupAssistantController *paymentController;
  PKPaymentSetupAssistantController *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup will preflight payment controller", buf, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc((Class)getPKSetupAssistantContextClass()), "initWithSetupAssistantAsFollowupAction:", 1);
  objc_msgSend(v6, "setDelegate:", self);
  v7 = (PKPaymentSetupAssistantController *)objc_msgSend(objc_alloc((Class)getPKPaymentSetupAssistantControllerClass()), "initWithSetupAssistantContext:", v6);
  paymentController = self->_paymentController;
  self->_paymentController = v7;

  v9 = self->_paymentController;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__BFFFinishSetupPaymentController_performExtendedInitializationWithCompletion___block_invoke;
  v11[3] = &unk_24D234248;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[PKPaymentSetupAssistantController setupAssistantViewControllerWithCompletion:](v9, "setupAssistantViewControllerWithCompletion:", v11);

}

void __79__BFFFinishSetupPaymentController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v4 != 0;
    _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup did preflight payment controller with success %d", buf, 8u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = *MEMORY[0x24BE85810];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v4 != 0, v7);

  }
}

- (BOOL)canCompleteExtendedInitializationQuickly
{
  return 1;
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
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Buddy followup payment controller user did tap cancel", v5, 2u);
  }

  -[BFFFinishSetupPaymentController _completeWithResult:didSetUp:](self, "_completeWithResult:didSetUp:", 2, 0);
}

- (void)_completeWithResult:(unint64_t)a3 didSetUp:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**completion)(id, unint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x24BDAC8D0];
  -[BFFFinishSetupPaymentController flowSkipController](self, "flowSkipController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE85810];
  objc_msgSend(v7, "didCompleteFlow:", *MEMORY[0x24BE85810]);

  CFPreferencesSetValue(CFSTR("Payment2Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[BFFFinishSetupPaymentController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordActionWithValue:forFeature:", v10, 15);

  completion = (void (**)(id, unint64_t, void *))self->_completion;
  if (completion)
  {
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, a3, v12);

    v13 = self->_completion;
  }
  else
  {
    v13 = 0;
  }
  self->_completion = 0;

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = -[PKPaymentSetupAssistantController isFollowupNeededReturningRequirements:](self->_paymentController, "isFollowupNeededReturningRequirements:", 0);
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Buddy followup payment controller did terminate flow with still needing to run: %i", (uint8_t *)v6, 8u);
  }

  -[BFFFinishSetupPaymentController _completeWithResult:didSetUp:](self, "_completeWithResult:didSetUp:", 0, v4 ^ 1u);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_paymentController, 0);
  objc_storeStrong((id *)&self->_registrationViewController, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end
