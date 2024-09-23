@implementation SKUIDonationAmountViewController

- (SKUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIDonationAmountViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationAmountViewController initWithCharity:configuration:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDonationAmountViewController;
  v8 = -[SKUIDonationStepViewController initWithCharity:configuration:](&v13, sel_initWithCharity_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "addObserver:", v8);
    objc_msgSend(v7, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("DONATION_FLOW_TITLE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_TITLE"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationAmountViewController setTitle:](v8, "setTitle:", v11);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E73BD6F0, 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIDonationAmountViewController;
  -[SKUIDonationAmountViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  SKUIDonationAmountView *amountView;
  void *v10;
  SKUIDonationAmountView *v11;
  void *v12;
  SKUIDonationAmountView *v13;
  SKUIDonationAmountView *v14;
  SKUIDonationAmountView *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIDonationAmountViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v5, "setAction:", sel__cancelButtonAction_);
  objc_msgSend(v5, "setTarget:", self);
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v4, "setLeftBarButtonItem:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v7, "setAction:", sel__donateButtonAction_);
  objc_msgSend(v7, "setEnabled:", 0);
  objc_msgSend(v7, "setTarget:", self);
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("DONATION_FLOW_DONATE_BUTTON"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_DONATE_BUTTON"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v4, "setRightBarButtonItem:", v7);
  amountView = self->_amountView;
  if (!amountView)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [SKUIDonationAmountView alloc];
    -[SKUIDonationStepViewController charity](self, "charity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SKUIDonationAmountView initWithCharity:](v11, "initWithCharity:", v12);
    v14 = self->_amountView;
    self->_amountView = v13;

    v15 = self->_amountView;
    -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationStepViewController charity](self, "charity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logoImageForCharity:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationAmountView setLogoImage:](v15, "setLogoImage:", v18);

    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__amountChangedNotification_, 0x1E73BD6F0, self->_amountView);
    amountView = self->_amountView;
  }
  -[SKUIDonationAmountViewController setView:](self, "setView:", amountView);

}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v6;
  id v7;
  SKUIDonationAmountView *amountView;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SKUIDonationStepViewController charity](self, "charity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    amountView = self->_amountView;
    objc_msgSend(v10, "logoImageForCharity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationAmountView setLogoImage:](amountView, "setLogoImage:", v9);

  }
}

- (void)_cancelButtonAction:(id)a3
{
  void *v4;
  id v5;

  -[SKUIDonationStepViewController donationViewController](self, "donationViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_donateButtonAction:(id)a3
{
  SKUIDonationAmountView *amountView;
  id v5;
  id v6;

  amountView = self->_amountView;
  v5 = a3;
  -[SKUIDonationAmountView setUserInteractionEnabled:](amountView, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setEnabled:", 0);

  if (-[SKUIGiftValidator isValidating](self->_validator, "isValidating"))
  {
    self->_tappedNextWhileValidating = 1;
  }
  else if (self->_lastValidationResponse)
  {
    -[SKUIDonationAmountViewController _performActionAfterValidation](self, "_performActionAfterValidation");
  }
  else
  {
    self->_tappedNextWhileValidating = 1;
    -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationAmountViewController _validateDonation:](self, "_validateDonation:", v6);

  }
}

- (void)_amountChangedNotification:(id)a3
{
  id v4;

  -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", 1);
    -[SKUIDonationAmountViewController _validateDonation:](self, "_validateDonation:", v4);
  }
  else
  {
    -[SKUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", 0);
    -[SKUIGiftValidator cancelValidation](self->_validator, "cancelValidation");
  }

}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  _BOOL4 v4;
  id v6;
  SKUIDonationResultViewController *v7;
  void *v8;
  void *v9;
  SKUIDonationResultViewController *v10;
  void *v11;
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
  SKUIGiftPurchaseRequest *purchaseRequest;
  id v23;

  v4 = a3;
  v6 = a4;
  v23 = v6;
  if (v4)
  {
    v7 = [SKUIDonationResultViewController alloc];
    -[SKUIDonationStepViewController charity](self, "charity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIDonationResultViewController initWithCharity:configuration:](v7, "initWithCharity:configuration:", v8, v9);

    -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultViewController setDonationAmount:](v10, "setDonationAmount:", v11);

    -[SKUIDonationStepViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationStepViewController setOperationQueue:](v10, "setOperationQueue:", v12);

    -[SKUIDonationAmountViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v10, 1);

  }
  else
  {
    if (v6)
    {
      -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0DC3450];
      if (v15)
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("DONATION_FLOW_UNABLE_TO_DONATE"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_UNABLE_TO_DONATE"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0DC3448];
      if (v15)
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("DONATION_FLOW_OK_BUTTON"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_OK_BUTTON"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v21);

      -[SKUIDonationAmountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    }
    -[SKUIDonationAmountViewController _reenableAfterFailure](self, "_reenableAfterFailure");
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", v6 != 0);

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    -[SKUIDonationAmountViewController _performActionAfterValidation](self, "_performActionAfterValidation");
  }

}

- (void)_performActionAfterValidation
{
  SKUIGiftPurchaseRequest *v3;
  void *v4;
  void *v5;
  SKUIGiftPurchaseRequest *v6;
  SKUIGiftPurchaseRequest *purchaseRequest;
  SKUIGiftPurchaseRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  if (-[SKUIGiftValidationResponse isValid](self->_lastValidationResponse, "isValid"))
  {
    if (!self->_purchaseRequest)
    {
      objc_initWeak(&location, self);
      v3 = [SKUIGiftPurchaseRequest alloc];
      -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SKUIGiftPurchaseRequest initWithDonation:configuration:](v3, "initWithDonation:configuration:", v4, v5);
      purchaseRequest = self->_purchaseRequest;
      self->_purchaseRequest = v6;

      v8 = self->_purchaseRequest;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke;
      v18[3] = &unk_1E73A2F80;
      objc_copyWeak(&v19, &location);
      -[SKUIGiftPurchaseRequest purchaseWithCompletionBlock:](v8, "purchaseWithCompletionBlock:", v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientContext");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3450];
    if (v17)
      objc_msgSend(v17, "localizedStringForKey:", CFSTR("DONATION_FLOW_INVALID_DONATION"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_INVALID_DONATION"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftValidationResponse errorString](self->_lastValidationResponse, "errorString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3448];
    if (v17)
      objc_msgSend(v17, "localizedStringForKey:", CFSTR("DONATION_FLOW_OK_BUTTON"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_OK_BUTTON"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    -[SKUIDonationAmountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    -[SKUIDonationAmountViewController _reenableAfterFailure](self, "_reenableAfterFailure");

  }
}

void __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke_2;
  block[3] = &unk_1E73A2000;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishPurchaseWithResult:errorMessage:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_reenableAfterFailure
{
  id v3;

  -[SKUIDonationAmountView setUserInteractionEnabled:](self->_amountView, "setUserInteractionEnabled:", 1);
  -[SKUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", v3 != 0);

}

- (void)_setDonationButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[SKUIDonationAmountViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    v5 = 2;
  else
    v5 = 0;
  objc_msgSend(v6, "setEnabled:", v3);
  objc_msgSend(v6, "setStyle:", v5);

}

- (void)_validateDonation:(id)a3
{
  id v4;
  SKUIGiftValidator *validator;
  void *v6;
  SKUIGiftValidator *v7;
  void *v8;
  void *v9;
  SKUIGiftValidator *v10;
  SKUIGiftValidator *v11;
  SKUIGiftValidator *v12;
  void *v13;
  SKUIGiftValidator *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  validator = self->_validator;
  if (validator)
  {
    -[SKUIGiftValidator cancelValidation](validator, "cancelValidation");
  }
  else
  {
    -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SKUIGiftValidator alloc];
    objc_msgSend(v6, "donationValidationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIGiftValidator initWithValidationURL:clientContext:](v7, "initWithValidationURL:clientContext:", v8, v9);
    v11 = self->_validator;
    self->_validator = v10;

    v12 = self->_validator;
    -[SKUIDonationStepViewController operationQueue](self, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftValidator setOperationQueue:](v12, "setOperationQueue:", v13);

  }
  objc_initWeak(&location, self);
  v14 = self->_validator;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__SKUIDonationAmountViewController__validateDonation___block_invoke;
  v15[3] = &unk_1E73A20A0;
  objc_copyWeak(&v16, &location);
  -[SKUIGiftValidator validateDonation:withCompletionBlock:](v14, "validateDonation:withCompletionBlock:", v4, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__SKUIDonationAmountViewController__validateDonation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SKUIDonationAmountViewController__validateDonation___block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __54__SKUIDonationAmountViewController__validateDonation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishValidationWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_lastValidationResponse, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
}

- (void)initWithCharity:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDonationAmountViewController initWithCharity:configuration:]";
}

@end
