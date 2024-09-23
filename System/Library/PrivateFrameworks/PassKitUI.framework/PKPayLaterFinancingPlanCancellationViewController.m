@implementation PKPayLaterFinancingPlanCancellationViewController

- (PKPayLaterFinancingPlanCancellationViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 dynamicContentPage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PKPayLaterFinancingPlanCancellationViewController *v13;
  PKPayLaterFinancingPlanCancellationViewController *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D66FE0]);
    PKLocalizedCocoonString(CFSTR("LOADING_CANCELLATION_REASONS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHeaderTitle:", v12);

  }
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanCancellationViewController;
  v13 = -[PKPayLaterViewController initWithPayLaterAccount:](&v16, sel_initWithPayLaterAccount_, v8);
  v14 = v13;
  if (v13)
  {
    v13->_shouldLoadCancellationReasons = v10 == 0;
    objc_storeStrong((id *)&v13->_financingPlan, a4);
    objc_storeStrong((id *)&v14->_dynamicContentPage, v11);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v14, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPayLaterFinancingPlanCancellationViewController _preflightIfNecessary](v14, "_preflightIfNecessary");
  }

  return v14;
}

- (void)_preflightIfNecessary
{
  uint64_t v3;
  void (**v4)(_QWORD);
  _BOOL4 shouldLoadCancellationReasons;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  PKPayLaterFinancingPlan *financingPlan;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v16, &location);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  shouldLoadCancellationReasons = self->_shouldLoadCancellationReasons;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (shouldLoadCancellationReasons)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Loading loan cancellation reasons.", buf, 2u);
    }

    v8 = (void *)objc_opt_class();
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    financingPlan = self->_financingPlan;
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_12;
    v11[3] = &unk_1E3E67008;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v8, "planCancellationReasonsDynamincContentForPayLaterAccount:financingPlan:completion:", v9, financingPlan, v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Loan cancellation reasons already loaded.", buf, 2u);
    }

    v4[2](v4);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PKPayLaterFinancingPlanCancellationSectionController *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PKPayLaterFinancingPlanCancellationSectionController alloc];
    v3 = *((_QWORD *)WeakRetained + 165);
    objc_msgSend(WeakRetained, "payLaterAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPayLaterFinancingPlanCancellationSectionController initWithFinancingPlan:payLaterAccount:dynamicContentPage:viewControllerDelegate:](v2, "initWithFinancingPlan:payLaterAccount:dynamicContentPage:viewControllerDelegate:", v3, v4, *((_QWORD *)WeakRetained + 166), WeakRetained);
    v6 = (void *)*((_QWORD *)WeakRetained + 167);
    *((_QWORD *)WeakRetained + 167) = v5;

    objc_msgSend(*((id *)WeakRetained + 167), "setDynamicCollectionDelegate:", WeakRetained);
    v8[0] = *((_QWORD *)WeakRetained + 167);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSections:animated:", v7, 1);

    objc_msgSend(WeakRetained, "_updateView");
  }

}

void __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1360) = 0;
    if (!v6 || v7)
    {
      PKAccountDisplayableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_2;
      v12[3] = &unk_1E3E612E8;
      v12[4] = v9;
      v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, v12, 0);

      if (v11)
        objc_msgSend(v9, "presentViewController:animated:completion:", v11, 1, 0);

    }
    else
    {
      objc_storeStrong(WeakRetained + 166, a2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didSelectCancellationRow:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Updated loan cancellation reason to identifier %@, description %@", (uint8_t *)&v9, 0x16u);

    }
    objc_storeStrong((id *)&self->_selectedReason, a3);
    -[PKPayLaterFinancingPlanCancellationViewController _updateRightBarButtonEnabledState](self, "_updateRightBarButtonEnabledState");
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanCancellationViewController;
  -[PKPayLaterViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPayLaterFinancingPlanCancellationViewController _updateView](self, "_updateView");
}

- (void)_submitButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterDynamicContentPageItem identifier](self->_selectedReason, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDynamicContentPageItem contentTitle](self->_selectedReason, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Submitting loan cancellation for plan %@ with reason %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke;
  v13[3] = &unk_1E3E67058;
  objc_copyWeak(&v17, (id *)buf);
  v10 = v3;
  v14 = v10;
  v11 = v5;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v10, "cancelFinancingPlanWithIdentifier:accountIdentifier:cancellationReasonIdentifier:cancellationReasonDescription:completion:", v12, v11, v6, v7, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_2;
  block[3] = &unk_1E3E623E8;
  objc_copyWeak(&v10, a1 + 7);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[5];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_3;
      v11[3] = &unk_1E3E612E8;
      v11[4] = WeakRetained;
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v11, 0);

      if (v5)
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);
      objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_4;
      v8[3] = &unk_1E3E651E8;
      objc_copyWeak(&v10, v2);
      v9 = *(id *)(a1 + 56);
      objc_msgSend(v6, "updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:", v7, 0, 0, 0, 0, v8);

      objc_destroyWeak(&v10);
    }
  }

}

uint64_t __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_5;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  id v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_6;
    v10 = &unk_1E3E67030;
    v3 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v3, "pk_firstObjectPassingTest:", &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_storeStrong(v5 + 165, v4);
      objc_msgSend(v5[167], "setFinancingPlan:", v4);
    }
    objc_msgSend(v5, "setShowNavigationBarSpinner:", 0, v5, v7, v8, v9, v10);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = (id *)v6;
  }

}

uint64_t __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "planIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_cancelButtonTapped
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Cancel tapped on PKPayLaterFinancingPlanCancellationViewController", v4, 2u);
  }

  -[PKPayLaterFinancingPlanCancellationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateRightBarButtonEnabledState
{
  -[UIBarButtonItem setEnabled:](self->_rightbarButton, "setEnabled:", self->_selectedReason != 0);
}

- (void)_updateView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *rightbarButton;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[PKPayLaterDynamicContentPage headerTitle](self->_dynamicContentPage, "headerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  -[PKPayLaterDynamicContentPage headerSubtitle](self->_dynamicContentPage, "headerSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);

  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", self->_shouldLoadCancellationReasons);
  -[PKPayLaterDynamicContentPage primaryActionTitle](self->_dynamicContentPage, "primaryActionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("SUBMIT_BUTTON"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v7;

  v8 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:menu:", v17, 0);
  rightbarButton = self->_rightbarButton;
  self->_rightbarButton = v8;

  -[UIBarButtonItem setStyle:](self->_rightbarButton, "setStyle:", 2);
  -[UIBarButtonItem setTarget:](self->_rightbarButton, "setTarget:", self);
  -[UIBarButtonItem setAction:](self->_rightbarButton, "setAction:", sel__submitButtonTapped);
  -[PKPayLaterFinancingPlanCancellationViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", self->_rightbarButton);

  -[PKPayLaterDynamicContentPage secondaryActionTitle](self->_dynamicContentPage, "secondaryActionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    PKLocalizedString(CFSTR("CANCEL"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:menu:", v14, 0);
  objc_msgSend(v15, "setTarget:", self);
  objc_msgSend(v15, "setAction:", sel__cancelButtonTapped);
  -[PKPayLaterFinancingPlanCancellationViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  -[PKPayLaterFinancingPlanCancellationViewController _updateRightBarButtonEnabledState](self, "_updateRightBarButtonEnabledState");
}

+ (void)planCancellationReasonsDynamincContentForPayLaterAccount:(id)a3 financingPlan:(id)a4 completion:(id)a5
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0D669B8];
    v8 = a3;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v8, "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccountIdentifier:", v10);

    objc_msgSend(v8, "accountBaseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setBaseURL:", v11);
    objc_msgSend(v9, "setType:", 15);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke;
    v13[3] = &unk_1E3E67080;
    v14 = v6;
    objc_msgSend(v12, "accountPayLaterContentWithRequest:completion:", v9, v13);

  }
}

void __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (*v4)(void);
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "dynamicContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicContentPageForPageType:", 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeFinancingPlanCancellationReasons", v6, 2u);
    }

    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v4();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_rightbarButton, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
