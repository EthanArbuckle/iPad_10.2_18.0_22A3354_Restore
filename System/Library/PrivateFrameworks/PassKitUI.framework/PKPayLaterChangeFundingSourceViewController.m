@implementation PKPayLaterChangeFundingSourceViewController

- (PKPayLaterChangeFundingSourceViewController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PKPayLaterChangeFundingSourceViewController *v13;
  uint64_t v14;
  PKPayLaterPaymentSource *selectedPaymentSource;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "payLaterAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterChangeFundingSourceViewController;
  v13 = -[PKPayLaterViewController initWithPayLaterAccount:](&v19, sel_initWithPayLaterAccount_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_payLaterPass, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
    objc_msgSend(v9, "paymentSource");
    v14 = objc_claimAutoreleasedReturnValue();
    selectedPaymentSource = v13->_selectedPaymentSource;
    v13->_selectedPaymentSource = (PKPayLaterPaymentSource *)v14;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v13, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPayLaterChangeFundingSourceViewController navigationItem](v13, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v17);

  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlan *financingPlan;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentIntentController = self->_paymentIntentController;
    financingPlan = self->_financingPlan;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E3E676D8;
    v8[4] = self;
    v9 = v4;
    -[PKPayLaterPaymentIntentController intentDetailsForFinancingPlan:intent:completion:](paymentIntentController, "intentDetailsForFinancingPlan:intent:completion:", financingPlan, 2, v8);

  }
}

void __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E3E622D8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  PKPayLaterChangeFundingSourceSectionController *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1352), *(id *)(a1 + 40));
  v2 = -[PKPayLaterChangeFundingSourceSectionController initWithFinancingPlan:payLaterPass:paymentIntentController:intentDetails:dynamicContentPage:delegate:]([PKPayLaterChangeFundingSourceSectionController alloc], "initWithFinancingPlan:payLaterPass:paymentIntentController:intentDetails:dynamicContentPage:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352), 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1344);
  *(_QWORD *)(v3 + 1344) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "setDynamicCollectionDelegate:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)didSelectFundingSource:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PKPayLaterChangeFundingSourceViewController _canChangeFundingSource](self, "_canChangeFundingSource"))
    -[PKPayLaterChangeFundingSourceViewController _presentChangeFundingSourceFlowWithPrimaryPaymentSource:completion:](self, "_presentChangeFundingSourceFlowWithPrimaryPaymentSource:completion:", v4, 0);
  else
    -[PKPayLaterChangeFundingSourceViewController _presentUnableToChangeFundingSourceAlert](self, "_presentUnableToChangeFundingSourceAlert");

}

- (void)didUpdateAutoPayment:(BOOL)a3 completion:(id)a4
{
  if (a3)
    -[PKPayLaterChangeFundingSourceViewController _presentChangeFundingSourceFlowWithPrimaryPaymentSource:completion:](self, "_presentChangeFundingSourceFlowWithPrimaryPaymentSource:completion:", self->_selectedPaymentSource, a4);
  else
    -[PKPayLaterChangeFundingSourceViewController _turnOffAutoPaymentWithCompletion:](self, "_turnOffAutoPaymentWithCompletion:", a4);
}

- (BOOL)_canChangeFundingSource
{
  return -[PKPayLaterFinancingPlan state](self->_financingPlan, "state") != 3;
}

- (void)_presentUnableToChangeFundingSourceAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presenting pending confirmed alert for trying to change funding source.", v11, 2u);
  }

  v4 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedCocoonString(CFSTR("PLAN_CONFIRMED_FUNDING_SOURCE_CHANGE_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("PLAN_CONFIRMED_FUNDING_SOURCE_CHANGE_ALERT_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCocoonString(CFSTR("PLAN_CONFIRMED_FUNDING_SOURCE_CHANGE_ALERT_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  -[PKPayLaterChangeFundingSourceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[PKPayLaterChangeFundingSourceViewController _updateSectionControllerAnimated:](self, "_updateSectionControllerAnimated:", 1);

}

- (void)_presentChangeFundingSourceFlowWithPrimaryPaymentSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlan *financingPlan;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PKPayLaterChangeFundingSourceViewController *v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterChangeFundingSourceViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sceneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke;
  v18[3] = &unk_1E3E67728;
  objc_copyWeak(&v22, &location);
  v16 = v7;
  v21 = v16;
  v17 = v8;
  v19 = v17;
  v20 = self;
  -[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:](paymentIntentController, "presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:", financingPlan, v6, intentDetails, 2, 0, v12, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  id v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (a2)
    {
      v9 = *(_QWORD *)(a1 + 48);
      if (v9)
        (*(void (**)(void))(v9 + 16))();
      objc_msgSend(WeakRetained, "_updateSectionControllerAnimated:", 1);
    }
    else if (v7 || (a3 & 1) == 0)
    {
      PKAccountDisplayableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = PKAlertForDisplayableErrorWithHandlers(v17, 0, 0, 0);

      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v18, 1, 0);
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Failed to present change funding source flow payment intent authorization %@", buf, 0xCu);
      }

      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
        (*(void (**)(void))(v20 + 16))();

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 32);
        PKFinancingPlanPaymentIntentTypeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Completed presenting change funding source flow for planIdentifier %@, intent %@", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "accountService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "payLaterAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_19;
      v21[3] = &unk_1E3E67700;
      v16 = *(void **)(a1 + 48);
      v21[4] = *(_QWORD *)(a1 + 40);
      v22 = v16;
      objc_msgSend(v13, "updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:", v15, 0, 0, 0, 0, v21);

    }
  }

}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_3;
  v5[3] = &unk_1E3E67030;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "pk_firstObjectPassingTest:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1320), v3);
    objc_msgSend(*(id *)(a1 + 40), "_updateSectionControllerAnimated:", 1);
  }

}

uint64_t __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "planIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterChangeFundingSourceViewController;
  -[PKPayLaterViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPayLaterChangeFundingSourceViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  if (self->_sectionController)
  {
    v7[0] = self->_sectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 0);

  }
}

- (void)_updateSectionControllerAnimated:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Updating PKPayLaterChangeFundingSourceSectionController", v6, 2u);
  }

  -[PKPayLaterChangeFundingSourceSectionController setFinancingPlan:](self->_sectionController, "setFinancingPlan:", self->_financingPlan);
  v7[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 1);

}

- (void)_turnOffAutoPaymentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v4 = a3;
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D669A0]);
  objc_msgSend(v7, "setAccountIdentifier:", v6);
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v9);

  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlanIdentifier:", v10);

  objc_msgSend(v7, "setAutoPayment:", 0);
  v11 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke;
  v24[3] = &unk_1E3E677A0;
  v13 = v7;
  v25 = v13;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v11, "addOperation:", v24);
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_4;
  v21[3] = &unk_1E3E64410;
  v21[4] = self;
  v14 = v6;
  v22 = v14;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v11, "addOperation:", v21);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_32;
  v18[3] = &unk_1E3E677F0;
  objc_copyWeak(&v20, &location);
  v16 = v4;
  v18[4] = self;
  v19 = v16;
  v17 = (id)objc_msgSend(v11, "evaluateWithInput:completion:", v15, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2;
  v14[3] = &unk_1E3E67778;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "accountPayLaterChangeAutoPaymentWithRequest:completion:", v11, v14);

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_3;
  v6[3] = &unk_1E3E67750;
  objc_copyWeak(&v10, a1 + 6);
  v7 = v4;
  v9 = a1[5];
  v8 = a1[4];
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v10);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      if (v4)
        objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v5;
  }

}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "accountService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_5;
  v14[3] = &unk_1E3E677C8;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:", v11, 0, 0, 0, 1, v14);

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_5(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_6;
  v5[3] = &unk_1E3E67750;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v8 = a1[5];
  v7 = a1[4];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_7;
    v7[3] = &unk_1E3E67030;
    v7[4] = WeakRetained;
    objc_msgSend(v3, "pk_firstObjectPassingTest:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(WeakRetained, "didUpdateFinancingPlan:", v4);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained[165], "planIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v9 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "There is no financing plan with ID %@ updated after changing the auto payment method", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "planIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_32(uint64_t a1)
{
  id v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2_33;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v2 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2_33(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_updateSectionControllerAnimated:", 1);
    WeakRetained = v3;
  }

}

- (void)didUpdateFinancingPlan:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_9;
    }
    v10 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_financingPlan, a3);
  -[PKPayLaterChangeFundingSourceViewController _updateSectionControllerAnimated:](self, "_updateSectionControllerAnimated:", 1);
LABEL_9:

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F28];
}

- (id)additionalAnalyticsDictionary
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D68CD8];
  -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  PKPayLaterFinancingPlanStateToString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPaymentSource, 0);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
