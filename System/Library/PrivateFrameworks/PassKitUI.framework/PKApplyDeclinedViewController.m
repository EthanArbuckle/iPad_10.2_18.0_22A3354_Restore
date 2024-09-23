@implementation PKApplyDeclinedViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKApplyDeclinedViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "applicationStateReason") == 7
    || -[PKApplyDeclinedViewController _shouldOfferAddPayLaterPassToWallet](self, "_shouldOfferAddPayLaterPassToWallet"))
  {
    -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
  }
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKFeatureApplicationHeaderImageWithImage(objc_msgSend(v3, "featureIdentifier"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);
  if (v6)
    objc_msgSend(v5, "setTopMargin:", 30.0);
  objc_msgSend(v5, "setBodyButtonNumberOfLines:", 2);
  objc_msgSend(v5, "setBodyDataDetectorTypes:", 1);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v13, &location);
  -[PKApplyExplanationViewController setContinueAction:](self, "setContinueAction:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_1E3E61310;
  objc_copyWeak(&v11, &location);
  -[PKDynamicProvisioningPageViewController setCancelButtonAction:](self, "setCancelButtonAction:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_3;
  v8[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v9, &location);
  -[PKApplyExplanationViewController setAuxiliaryAction:](self, "setAuxiliaryAction:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_continueAction");

  return 0;
}

void __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelAction");
    WeakRetained = v2;
  }

}

uint64_t __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_auxiliaryAction");

  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKApplyDeclinedViewController;
  -[PKApplyExplanationViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "declineDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "declinedTermsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsShownWithIdentifier:", v7);

}

- (void)_continueAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  PKBusinessChatController *v7;
  PKBusinessChatController *businessChatController;
  PKBuinessChatApplyContext *v9;
  void *v10;
  PKBuinessChatApplyContext *v11;
  PKBusinessChatController *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke;
  aBlock[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v20, &location);
  v4 = _Block_copy(aBlock);
  -[PKApplyExplanationViewController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "applicationStateReason") == 7)
  {
    if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
    {
      if (!self->_businessChatController)
      {
        v7 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v7;

      }
      v9 = [PKBuinessChatApplyContext alloc];
      objc_msgSend(v6, "businessChatIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKBuinessChatApplyContext initWithIdentifier:intent:](v9, "initWithIdentifier:intent:", v10, 1);

      v12 = self->_businessChatController;
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_2;
      v17[3] = &unk_1E3E63438;
      v18 = v4;
      -[PKBusinessChatController openBusinessChatWithContext:completion:](v12, "openBusinessChatWithContext:completion:", v11, v17);

    }
  }
  else if (-[PKApplyDeclinedViewController _shouldOfferAddPayLaterPassToWallet](self, "_shouldOfferAddPayLaterPassToWallet"))
  {
    -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    v13 = dispatch_time(0, 3000000000);
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_4;
    v14[3] = &unk_1E3E6F430;
    v14[4] = self;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v4 + 2))(v4, 0);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v4 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "controller");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endApplyFlow");

      objc_msgSend(WeakRetained, "handleNextStep");
    }
  }

}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_3;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __48__PKApplyDeclinedViewController__continueAction__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_4(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a1[4], "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payLaterSetupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_5;
  v4[3] = &unk_1E3E642D0;
  objc_copyWeak(&v6, a1 + 6);
  v5 = a1[5];
  objc_msgSend(v3, "provisionPayLaterPassWithCompletion:", v4);

  objc_destroyWeak(&v6);
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)_shouldOfferAddPayLaterPassToWallet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyExplanationViewController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payLaterSetupController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "feature") == 3)
  {
    v7 = 0;
    if (objc_msgSend(v4, "applicationStateReason") == 16 && v6)
      v7 = objc_msgSend(v6, "controllerContext") == 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_cancelAction
{
  void *v3;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endApplyFlow");

  -[PKApplyExplanationViewController handleNextStep](self, "handleNextStep");
}

- (void)_auxiliaryAction
{
  void *v3;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endApplyFlow");

  -[PKApplyExplanationViewController handleNextStep](self, "handleNextStep");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
}

@end
