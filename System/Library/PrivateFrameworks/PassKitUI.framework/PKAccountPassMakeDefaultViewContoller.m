@implementation PKAccountPassMakeDefaultViewContoller

- (PKAccountPassMakeDefaultViewContoller)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  id v9;
  id v10;
  PKAccountPassMakeDefaultViewContoller *v11;
  PKAccountPassMakeDefaultViewContoller *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  v11 = -[PKExplanationViewController initWithContext:](&v16, sel_initWithContext_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_accountController, a3);
    objc_msgSend(v9, "accountCredential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_featureIdentifier = objc_msgSend(v14, "feature");

  }
  return v12;
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;
  objc_super v5;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKAccountPassMakeDefaultViewContoller dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PKApplyHeroCardView *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKExplanationViewController loadView](&v38, sel_loadView);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PKAccountFlowController accountCredential](self->_accountController, "accountCredential", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passDetailsResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postProvisioningContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
        {
          objc_storeStrong((id *)&self->_makeDefaultPostProvisioningContent, v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[PKExplanationViewController explanationView](self, "explanationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dockView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "footerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPostProvisioningContent title](self->_makeDefaultPostProvisioningContent, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "setTitleText:", v14);
  }
  else
  {
    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitleText:", v15);

  }
  objc_msgSend(v12, "primaryButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPostProvisioningContent primaryButtonTitle](self->_makeDefaultPostProvisioningContent, "primaryButtonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v16, "setTitle:forState:", v17, 0);
  }
  else
  {
    PKLocalizedFeatureString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:forState:", v18, 0);

  }
  objc_msgSend(v11, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v13, "setManualEntryButton:", 0);
  if (-[PKAccountPassMakeDefaultViewContoller _willPerformProvisioningActions](self, "_willPerformProvisioningActions"))
  {
    PKFeatureIdentifierToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PKHasPairedWatchSupportingFeatureIdentifier();

    -[PKAccountPostProvisioningContent body](self->_makeDefaultPostProvisioningContent, "body");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("ACCOUNT_MAKE_DEFAULT_BODY_AND_WATCH");
    if (!v20)
      v23 = CFSTR("ACCOUNT_MAKE_DEFAULT_BODY");
    if (v21)
      v23 = (__CFString *)v21;
    v24 = v23;

    PKLocalizedFeatureString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setBodyText:", v25);
    objc_msgSend(v13, "setupLaterButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPostProvisioningContent secondaryButtonTitle](self->_makeDefaultPostProvisioningContent, "secondaryButtonTitle");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_26;
  }
  else
  {
    PKLocalizedFeatureString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBodyText:", v28);

    objc_msgSend(v13, "setupLaterButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPostProvisioningContent secondaryButtonTitle](self->_makeDefaultPostProvisioningContent, "secondaryButtonTitle");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
LABEL_26:
      PKLocalizedFeatureString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:forState:", v30, 0);

      v29 = 0;
      goto LABEL_27;
    }
  }
  v29 = (void *)v27;
  objc_msgSend(v26, "setTitle:forState:", v27, 0);
LABEL_27:

  PKProvisioningSecondaryBackgroundColor();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTopBackgroundColor:", v31);
  v32 = -[PKApplyHeroCardView initWithFeatureIdentifier:]([PKApplyHeroCardView alloc], "initWithFeatureIdentifier:", self->_featureIdentifier);
  -[PKApplyHeroCardView setBackgroundColor:](v32, "setBackgroundColor:", v31);
  objc_msgSend(v11, "setHeroView:", v32);
  objc_msgSend(v11, "setShowPrivacyView:", 0);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "showCheckmark:animated:", 0, 0);
  objc_msgSend(v11, "setNeedsLayout");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKAccountPassMakeDefaultViewContoller navigationItem](self, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKExplanationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKAccountFlowController performInitalOperations](self->_accountController, "performInitalOperations");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKAccountPassMakeDefaultViewContoller viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassMakeDefaultViewContoller _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKAccountPassMakeDefaultViewContoller viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPassMakeDefaultViewContoller;
  -[PKAccountPassMakeDefaultViewContoller viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassMakeDefaultViewContoller _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *inUseAssertion;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[PKAccountPassMakeDefaultViewContoller _willPerformProvisioningActions](self, "_willPerformProvisioningActions"))
  {
    if (!self->_inUseAssertion)
    {
      v5 = (void *)MEMORY[0x1E0C9E3A8];
      PKPassKitCoreBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("Setting up account credential for provisioning"));
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v7;

    }
    -[PKAccountFlowController provisioningController](self->_accountController, "provisioningController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFlowController accountCredential](self->_accountController, "accountCredential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PKAccountPassMakeDefaultViewContoller_preflightWithCompletion___block_invoke;
    v11[3] = &unk_1E3E653D8;
    v12 = v4;
    objc_msgSend(v9, "setupAccountCredentialForProvisioning:completion:", v10, v11);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

uint64_t __65__PKAccountPassMakeDefaultViewContoller_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)_willPerformProvisioningActions
{
  return (-[PKAccountFlowController operations](self->_accountController, "operations") & 3) != 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", 0);

  -[PKAccountFlowController makeAccountPassDefault:](self->_accountController, "makeAccountPassDefault:", 1);
  v6 = *MEMORY[0x1E0D68B18];
  v7 = *MEMORY[0x1E0D68858];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v7;
  v8 = *MEMORY[0x1E0D68DD8];
  v11[0] = v6;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassMakeDefaultViewContoller _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v9);

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  void *v5;
  PKAccountFlowController *accountController;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (-[PKAccountPassMakeDefaultViewContoller _willPerformProvisioningActions](self, "_willPerformProvisioningActions", a3))
  {
    -[PKExplanationViewController explanationView](self, "explanationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dockView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setButtonsEnabled:", 0);

    -[PKAccountFlowController makeAccountPassDefault:](self->_accountController, "makeAccountPassDefault:", 0);
  }
  else
  {
    -[PKAccountFlowController endProvisioningFlow](self->_accountController, "endProvisioningFlow");
    accountController = self->_accountController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__PKAccountPassMakeDefaultViewContoller_explanationViewDidSelectSetupLater___block_invoke;
    v11[3] = &unk_1E3E62260;
    v11[4] = self;
    -[PKAccountFlowController nextViewControllerWithCompletion:](accountController, "nextViewControllerWithCompletion:", v11);
  }
  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v8;
  v9 = *MEMORY[0x1E0D68DE0];
  v13[0] = v7;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassMakeDefaultViewContoller _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v10);

}

uint64_t __76__PKAccountPassMakeDefaultViewContoller_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", a2);
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  -[PKAccountPassMakeDefaultViewContoller _presentViewController:](self, "_presentViewController:", a4);
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
  -[PKAccountPassMakeDefaultViewContoller _presentDisplayableError:](self, "_presentDisplayableError:", a4);
}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    -[PKAccountPassMakeDefaultViewContoller navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PKAccountPassMakeDefaultViewContoller__presentViewController___block_invoke;
    v7[3] = &unk_1E3E62288;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);

  }
  else
  {
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
    -[PKAccountPassMakeDefaultViewContoller _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __64__PKAccountPassMakeDefaultViewContoller__presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
  if (v4)
  {
    -[PKAccountPassMakeDefaultViewContoller navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKAccountPassMakeDefaultViewContoller _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "endProvisioningFlow");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1032);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke_2;
  v5[3] = &unk_1E3E62260;
  v5[4] = v2;
  return objc_msgSend(v3, "nextViewControllerWithCompletion:", v5);
}

uint64_t __66__PKAccountPassMakeDefaultViewContoller__presentDisplayableError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", a2);
}

- (void)_terminateSetupFlow
{
  PKPaymentSetupViewControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKAccountPassMakeDefaultViewContoller presentingViewController](self, "presentingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0D68DC8], *MEMORY[0x1E0D68F50]);
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = (void *)objc_msgSend(v8, "copy");
    -[PKAccountFlowController accountCredential](self->_accountController, "accountCredential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportDashboardEventIfNecessary:forPass:", v5, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_makeDefaultPostProvisioningContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountController, 0);
}

@end
