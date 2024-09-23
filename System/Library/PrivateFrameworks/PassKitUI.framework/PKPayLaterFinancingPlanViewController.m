@implementation PKPayLaterFinancingPlanViewController

- (PKPayLaterFinancingPlanViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5 merchantIcon:(id)a6 iconGenerator:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentTransactionIconGenerator *v17;
  PKPayLaterFinancingPlanViewController *v18;
  PKPayLaterFinancingPlanViewController *v19;
  id *p_paymentIntentController;
  PKPaymentTransactionIconGenerator *v21;
  NSDateFormatter *v22;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  PKPaymentPass *payLaterPass;
  PKPayLaterDashboardMessageComposer *v31;
  void *v32;
  uint64_t v33;
  PKPayLaterDashboardMessageComposer *dashboardMessagesComposer;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (PKPaymentTransactionIconGenerator *)a7;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterFinancingPlanViewController;
  v18 = -[PKPayLaterViewController initWithPayLaterAccount:](&v36, sel_initWithPayLaterAccount_, v14);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    p_paymentIntentController = (id *)&v19->_paymentIntentController;
    objc_storeStrong((id *)&v19->_paymentIntentController, a5);
    v21 = v17;
    if (!v17)
      v21 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    objc_storeStrong((id *)&v19->_iconGenerator, v21);
    if (!v17)

    objc_storeStrong((id *)&v19->_merchantIcon, a6);
    objc_msgSend(*p_paymentIntentController, "intentDetailsForFinancingPlan:intent:completion:", v13, 2, 0);
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v22;

    v24 = v19->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v24, "setCalendar:", v25);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v19->_dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v19, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPayLaterFinancingPlanViewController _configureFooter](v19, "_configureFooter");
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "associatedPassUniqueID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "passWithUniqueID:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "paymentPass");
    v29 = objc_claimAutoreleasedReturnValue();
    payLaterPass = v19->_payLaterPass;
    v19->_payLaterPass = (PKPaymentPass *)v29;

    v31 = [PKPayLaterDashboardMessageComposer alloc];
    v37[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PKPayLaterDashboardMessageComposer initWithContext:allFinancingPlans:payLaterPass:payLaterAccount:financingPlan:paymentIntentController:delegate:](v31, "initWithContext:allFinancingPlans:payLaterPass:payLaterAccount:financingPlan:paymentIntentController:delegate:", 1, v32, v19->_payLaterPass, v14, v13, *p_paymentIntentController, v19);
    dashboardMessagesComposer = v19->_dashboardMessagesComposer;
    v19->_dashboardMessagesComposer = (PKPayLaterDashboardMessageComposer *)v33;

    -[PKPayLaterFinancingPlanViewController _configureFinancingPlanMoreMenu](v19, "_configureFinancingPlanMoreMenu");
  }

  return v19;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke;
  v15[3] = &unk_1E3E67120;
  v15[4] = self;
  objc_msgSend(v5, "addOperation:", v15);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_3;
  v14[3] = &unk_1E3E67120;
  v14[4] = self;
  objc_msgSend(v5, "addOperation:", v14);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_6;
  v10[3] = &unk_1E3E67198;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v8 = v4;
  v11 = v8;
  v9 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1376);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_2;
  v11[3] = &unk_1E3E618A0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "preflightDashboardMessagesWithCompletion:", v11);

}

uint64_t __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  _QWORD *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD **)(a1 + 32);
  v11 = (void *)v10[170];
  if (v11)
  {
    objc_msgSend(v11, "size");
    if (v13 == 80.0 && v12 == 80.0)
    {
      v9[2](v9, v8, 0);
      goto LABEL_9;
    }
    v10 = *(_QWORD **)(a1 + 32);
  }
  objc_initWeak(&location, v10);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 1384);
  objc_msgSend(*(id *)(v15 + 1320), "merchant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_4;
  v21[3] = &unk_1E3E67170;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v16, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v21, 80.0, 80.0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 1360);
  *(_QWORD *)(v19 + 1360) = v18;

  v9[2](v9, v8, 0);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_9:

}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_5;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v5;
  v10 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 170, *(id *)(a1 + 32));
    WeakRetained = v3;
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v3, "_updateMerchantIcon");
      WeakRetained = v3;
    }
  }

}

void __65__PKPayLaterFinancingPlanViewController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  PKPayLaterFinancingPlanSectionController *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1408) = 1;
    v12 = WeakRetained;
    v4 = [PKPayLaterFinancingPlanSectionController alloc];
    v5 = *((_QWORD *)v12 + 165);
    objc_msgSend(v12, "payLaterAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPayLaterFinancingPlanSectionController initWithFinancingPlan:payLaterAccount:payLaterPass:dynamicContentPage:merchantIcon:paymentIntentController:delegate:](v4, "initWithFinancingPlan:payLaterAccount:payLaterPass:dynamicContentPage:merchantIcon:paymentIntentController:delegate:", v5, v6, *((_QWORD *)v12 + 166), 0, *((_QWORD *)v12 + 170), *((_QWORD *)v12 + 168), v12);
    v8 = (void *)*((_QWORD *)v12 + 167);
    *((_QWORD *)v12 + 167) = v7;

    objc_msgSend(*((id *)v12 + 167), "setDynamicCollectionDelegate:", *(_QWORD *)(a1 + 32));
    v9 = (void *)*((_QWORD *)v12 + 167);
    objc_msgSend(*((id *)v12 + 172), "dashboardMessages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDashboardMessages:", v10);

    objc_msgSend(v12, "_updateMerchantIcon");
    v3 = v12;
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
      v3 = v12;
    }
  }

}

- (void)viewDidLoad
{
  NSObject *v3;
  PKPayLaterFinancingPlan *financingPlan;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[4];
  id v16;
  objc_super v17;
  uint8_t buf[4];
  PKPayLaterFinancingPlan *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterFinancingPlanViewController;
  -[PKPayLaterViewController viewDidLoad](&v17, sel_viewDidLoad);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    financingPlan = self->_financingPlan;
    *(_DWORD *)buf = 138412290;
    v19 = financingPlan;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Viewing financing plan %@", buf, 0xCu);
  }

  -[PKPayLaterFinancingPlanViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 1;

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:menu:", 1, 0);
    objc_msgSend(v8, "setTarget:", self);
    objc_msgSend(v8, "setAction:", sel__closeButtonTapped);
    -[PKPayLaterFinancingPlanViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  }
  objc_initWeak((id *)buf, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v16, (id *)buf);
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = v11;
  if (self->_preflightedData)
  {
    v11[2](v11);
  }
  else
  {
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke_2;
    v13[3] = &unk_1E3E614F0;
    v14 = v11;
    -[PKPayLaterFinancingPlanViewController preflightWithCompletion:](self, "preflightWithCompletion:", v13);

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 167))
  {
    v4[0] = *((_QWORD *)WeakRetained + 167);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSections:animated:", v3, 0);

  }
}

uint64_t __52__PKPayLaterFinancingPlanViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadMessages
{
  PKPayLaterFinancingPlanSectionController *sectionController;
  void *v4;

  sectionController = self->_sectionController;
  -[PKPayLaterDashboardMessageComposer dashboardMessages](self->_dashboardMessagesComposer, "dashboardMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSectionController setDashboardMessages:](sectionController, "setDashboardMessages:", v4);

  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void)dashboardMessageComposer:(id)a3 requestPresentViewController:(id)a4
{
  if (a4)
    -[PKPayLaterFinancingPlanViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)dashboardMessageComposer:(id)a3 requestPushViewController:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    -[PKPayLaterFinancingPlanViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v5, 1);

  }
}

- (void)dashboardMessageComposer:(id)a3 requestPresentPassDetailsForPass:(id)a4
{
  id v4;

  if (a4)
  {
    objc_msgSend(a4, "uniqueID", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    PKOpenPassDetails();

  }
}

- (void)dashboardMessageComposer:(id)a3 requestPresentFinancingPlanDetails:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "planIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v9;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (v10 && v11)
      {
        v13 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      objc_msgSend(v7, "planIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      PKOpenPayLaterFinancingPlanDetails();
    }

  }
LABEL_11:

}

- (id)navigationBarAnimationView
{
  return self->_navigationBarImageView;
}

- (double)headerHeight
{
  double result;

  -[PKPayLaterFinancingPlanSectionController headerViewHeight](self->_sectionController, "headerViewHeight");
  return result;
}

- (void)didUpdateFinancingPlan:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  PKPayLaterFinancingPlan *pendingFinancingPlanUpdate;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "planIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_17;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_17;
  }
  pendingFinancingPlanUpdate = self->_pendingFinancingPlanUpdate;
  objc_storeStrong((id *)&self->_pendingFinancingPlanUpdate, a3);
  if (!pendingFinancingPlanUpdate)
  {
    if (self->_lastUpdateOfFinancingPlan)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", self->_lastUpdateOfFinancingPlan);
      v15 = (uint64_t)v14;

      if (v15 <= 3)
        v16 = 3;
      else
        v16 = 0;
    }
    else
    {
      v16 = 3;
    }
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPayLaterFinancingPlan planIdentifier](self->_pendingFinancingPlanUpdate, "planIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v23 = v16;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Waiting %ld seconds to update the UI for financing plan update: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v19 = dispatch_time(0, 1000000000 * v16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKPayLaterFinancingPlanViewController_didUpdateFinancingPlan___block_invoke;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v21, (id *)buf);
    dispatch_after(v19, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
LABEL_17:

}

void __64__PKPayLaterFinancingPlanViewController_didUpdateFinancingPlan___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)*((_QWORD *)WeakRetained + 177);
    *((_QWORD *)WeakRetained + 177) = v2;

    v4 = (id *)(WeakRetained + 1320);
    objc_storeStrong((id *)WeakRetained + 165, *((id *)WeakRetained + 178));
    v5 = (void *)*((_QWORD *)WeakRetained + 178);
    *((_QWORD *)WeakRetained + 178) = 0;

    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v4, "planIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Updating financing plan UI: %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*((id *)WeakRetained + 172), "setFinancingPlan:", *v4);
    objc_msgSend(*((id *)WeakRetained + 167), "setFinancingPlan:", *v4);
    objc_msgSend(WeakRetained, "_configureFooter");
    objc_msgSend(WeakRetained, "reloadMessages");
  }

}

- (void)didUpdatePayLaterAccount:(id)a3
{
  PKPayLaterDashboardMessageComposer *dashboardMessagesComposer;
  id v5;

  dashboardMessagesComposer = self->_dashboardMessagesComposer;
  v5 = a3;
  -[PKPayLaterDashboardMessageComposer setPayLaterAccount:](dashboardMessagesComposer, "setPayLaterAccount:", v5);
  -[PKPayLaterSectionController setPayLaterAccount:](self->_sectionController, "setPayLaterAccount:", v5);

  -[PKPayLaterFinancingPlanViewController _configureFooter](self, "_configureFooter");
  -[PKPayLaterFinancingPlanViewController reloadMessages](self, "reloadMessages");
}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F38];
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

- (void)payLaterContentActionFooterViewDidTapButton
{
  void *v3;
  PKPayLaterMakePaymentViewController *v4;
  PKNavigationController *v5;
  PKNavigationController *v6;
  _QWORD v7[5];
  PKNavigationController *v8;
  id v9;
  id location;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68860];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  v4 = -[PKPayLaterMakePaymentViewController initWithFinancingPlan:paymentIntentController:]([PKPayLaterMakePaymentViewController alloc], "initWithFinancingPlan:paymentIntentController:", self->_financingPlan, self->_paymentIntentController);
  v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
  -[PKPayLaterContentActionFooterView setShowSpinner:](self->_footerView, "setShowSpinner:", 1);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke;
  v7[3] = &unk_1E3E63548;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v6 = v5;
  v8 = v6;
  -[PKPayLaterMakePaymentViewController preflightWithCompletion:](v4, "preflightWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke_2;
    v12 = &unk_1E3E61310;
    objc_copyWeak(&v13, &location);
    v6 = (void (**)(_QWORD))_Block_copy(&v9);
    if (v4)
    {
      PKAccountDisplayableError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, v6, v9, v10, v11, v12);
      else
        v6[2](v6);

    }
    else
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, v6, v9, v10, v11, v12);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __84__PKPayLaterFinancingPlanViewController_payLaterContentActionFooterViewDidTapButton__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[169], "setShowSpinner:", 0);
    WeakRetained = v2;
  }

}

- (void)_updateMerchantIcon
{
  UIImageView *navigationBarImageView;
  UIImageView *v4;
  UIImageView *v5;

  navigationBarImageView = self->_navigationBarImageView;
  if (navigationBarImageView)
  {
    -[UIImageView setImage:](navigationBarImageView, "setImage:", self->_merchantIcon);
  }
  else
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", self->_merchantIcon);
    v5 = self->_navigationBarImageView;
    self->_navigationBarImageView = v4;

    -[UIImageView setContentMode:](self->_navigationBarImageView, "setContentMode:", 1);
    -[UIImageView _setContinuousCornerRadius:](self->_navigationBarImageView, "_setContinuousCornerRadius:", 3.0);
    -[UIImageView setClipsToBounds:](self->_navigationBarImageView, "setClipsToBounds:", 1);
  }
}

- (void)_configureFooter
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  PKPayLaterContentActionFooterView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PKPayLaterContentActionFooterView *v31;
  PKPayLaterContentActionFooterView *footerView;
  PKPayLaterContentActionFooterView *v33;
  void *v34;
  PKPayLaterContentActionFooterView *v35;
  void *v36;
  void *v37;
  id v38;

  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoPayment");

  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextDueInstallment");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  if (PKPayLaterFinancingPlanStateIsPending())
    v7 = 1;
  else
    v7 = v38 == 0;
  if (!v7 && v6 != 0)
  {
    v10 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
    if (v10 == 4)
      goto LABEL_13;
    if (v10 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:toDate:options:", 16, v12, v6, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "day");
      v15 = *MEMORY[0x1E0D6AC00];

      if (v14 < v15)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCocoonString(CFSTR("PAY_NOW_BUTTON"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      PKLocalizedCocoonString(CFSTR("PAY_EARLY_BUTTON"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
      v16 = 0;
      v37 = 0;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3888];
    +[PKPayLaterContentActionFooterView leadingTitleFont](PKPayLaterContentActionFooterView, "leadingTitleFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configurationWithFont:scale:", v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v38, "status");
    if (v22 == 4)
    {
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pastDueAmount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedCocoonString(CFSTR("PAST_DUE_AMOUNT"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v25 = v18;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v22 != 1)
      {
        v27 = 0;
        v23 = 0;
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(v38, "currentBalance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v6);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v4)
        PKLocalizedCocoonString(CFSTR("AUTOPAY_ON_DATE"), CFSTR("%@"), v24);
      else
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_DUE_ON_DATE"), CFSTR("%@"), v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0D67010];
      -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
      v36 = v21;
      v29 = v16;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = objc_msgSend(v28, "canMakePaymentsWithAccountState:", objc_msgSend(v30, "state"));

      v31 = -[PKPayLaterContentActionFooterView initWithDelegate:]([PKPayLaterContentActionFooterView alloc], "initWithDelegate:", self);
      footerView = self->_footerView;
      self->_footerView = v31;

      -[PKPayLaterContentActionFooterView setLeadingTitleText:](self->_footerView, "setLeadingTitleText:", v27);
      -[PKPayLaterContentActionFooterView setLeadingTitleIcon:](self->_footerView, "setLeadingTitleIcon:", 0);
      -[PKPayLaterContentActionFooterView setLeadingTitleTextColor:](self->_footerView, "setLeadingTitleTextColor:", v18);
      v33 = self->_footerView;
      objc_msgSend(v23, "formattedStringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v33;
      v16 = v29;
      v21 = v36;
      -[PKPayLaterContentActionFooterView setLeadingDetailText:](v35, "setLeadingDetailText:", v34);

      if ((_DWORD)v28)
      {
        if (objc_msgSend(v17, "length"))
          -[PKPayLaterContentActionFooterView setButtonText:](self->_footerView, "setButtonText:", v17);
        if (v37)
          -[PKPayLaterContentActionFooterView setButtonTintColor:](self->_footerView, "setButtonTintColor:");
        if (v16)
          -[PKPayLaterContentActionFooterView setButtonTitleColor:](self->_footerView, "setButtonTitleColor:", v16);
      }
      -[PKPayLaterViewController setFooterView:](self, "setFooterView:", self->_footerView);
    }
    goto LABEL_33;
  }
  v9 = self->_footerView;
  self->_footerView = 0;

  -[PKPayLaterViewController setFooterView:](self, "setFooterView:", 0);
LABEL_34:

}

- (void)_closeButtonTapped
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68858];
  v5[0] = *MEMORY[0x1E0D688C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  -[PKPayLaterFinancingPlanViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_configureFinancingPlanMoreMenu
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  UIBarButtonItem *v34;
  UIBarButtonItem *moreMenuButton;
  UIBarButtonItem *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panSuffix");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  if (v39)
  {
    v4 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedCocoonString(CFSTR("RETURNS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.left"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke;
    v49[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v50, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "addObject:", v7);
    objc_destroyWeak(&v50);
  }
  v8 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedCocoonString(CFSTR("REPORT_AN_ISSUE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("flag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_2;
  v47[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v48, &location);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedCocoonString(CFSTR("VIEW_LOAN_AGREEMENT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_3;
  v45[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v46, &location);
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v16);
  if (-[PKPayLaterFinancingPlan isCancellable](self->_financingPlan, "isCancellable"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithTintColor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedCocoonString(CFSTR("MARK_AS_CANCELED_TITLE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_4;
    v43[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v44, &location);
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v20, 0, v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setAttributes:", 2);
    objc_msgSend(v12, "addObject:", v23);

    objc_destroyWeak(&v44);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safelyAddObject:", v24);

  if (PKTransactionDebugDetailsEnabled())
  {
    v25 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_5;
    v41[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v42, &location);
    objc_msgSend(v25, "actionWithTitle:image:identifier:handler:", CFSTR("Debug Plan"), v26, 0, v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC39D0];
    v52[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "safelyAddObject:", v30);

    objc_destroyWeak(&v42);
  }
  PKUIInfoButtonImageWithDefaultConfiguration();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (UIBarButtonItem *)objc_msgSend(v32, "initWithImage:menu:", v31, v33);
  moreMenuButton = self->_moreMenuButton;
  self->_moreMenuButton = v34;

  v36 = self->_moreMenuButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](v36, "setTintColor:", v37);

  -[PKPayLaterFinancingPlanViewController navigationItem](self, "navigationItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRightBarButtonItem:", self->_moreMenuButton);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentInStoreReturnsViewController");
    WeakRetained = v2;
  }

}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChat");
    WeakRetained = v2;
  }

}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentLoanAgreement");
    WeakRetained = v2;
  }

}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentLoanCancellationFlow");
    WeakRetained = v2;
  }

}

void __72__PKPayLaterFinancingPlanViewController__configureFinancingPlanMoreMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_sharePlan");
    WeakRetained = v2;
  }

}

- (void)_presentBusinessChat
{
  void *v3;
  PKPayLaterBusinessChatTopicComposer *v4;
  void *v5;
  PKPayLaterBusinessChatTopicComposer *v6;
  PKPayLaterBusinessChatTopicComposer *topicsComposer;
  PKPayLaterBusinessChatTopicComposer *v8;
  _QWORD v9[4];
  id v10[2];
  id location;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0D68858];
  v13[0] = *MEMORY[0x1E0D688A0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  v4 = [PKPayLaterBusinessChatTopicComposer alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPayLaterBusinessChatTopicComposer initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:](v4, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:", v5, self->_payLaterPass, self->_financingPlan, 0, 0);
  topicsComposer = self->_topicsComposer;
  self->_topicsComposer = v6;

  objc_initWeak(&location, self);
  v8 = self->_topicsComposer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke;
  v9[3] = &unk_1E3E671E8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)2;
  -[PKPayLaterBusinessChatTopicComposer releventTopicsForContext:completion:](v8, "releventTopicsForContext:completion:", 2, v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_2;
  block[3] = &unk_1E3E671C0;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v7 = v3;
  v8[1] = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  PKPayLaterBusinessChatTopicsViewController *v4;
  void *v5;
  PKPayLaterBusinessChatTopicsViewController *v6;
  PKNavigationController *v7;
  void *v8;
  PKBusinessChatController *v9;
  void *v10;
  PKBusinessChatPayLaterContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PKBusinessChatPayLaterContext *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v4 = [PKPayLaterBusinessChatTopicsViewController alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKPayLaterBusinessChatTopicsViewController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:](v4, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:", v5, WeakRetained[166], WeakRetained[165], 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      v8 = (void *)WeakRetained[175];
      if (v8)
        v9 = v8;
      else
        v9 = objc_alloc_init(PKBusinessChatController);
      v10 = (void *)WeakRetained[175];
      WeakRetained[175] = v9;

      v11 = [PKBusinessChatPayLaterContext alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = WeakRetained[166];
      objc_msgSend(MEMORY[0x1E0D66FD8], "genericBusinessChatTopicForContext:", *(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v11, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v12, v13, v14, WeakRetained[165], 0, 0, 0);

      v16 = (void *)WeakRetained[175];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_3;
      v17[3] = &unk_1E3E61DB8;
      objc_copyWeak(&v18, v2);
      objc_msgSend(v16, "openBusinessChatWithContext:completion:", v15, v17);
      objc_destroyWeak(&v18);

    }
  }

}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_4;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __61__PKPayLaterFinancingPlanViewController__presentBusinessChat__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    WeakRetained = v5;
  }

}

- (void)_presentInStoreReturnsViewController
{
  void *v3;
  PKPayLaterFinancingPlanInStoreReturnViewController *v4;
  PKPayLaterFinancingPlan *financingPlan;
  void *v6;
  PKPayLaterFinancingPlanInStoreReturnViewController *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68840];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  v4 = [PKPayLaterFinancingPlanInStoreReturnViewController alloc];
  financingPlan = self->_financingPlan;
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPayLaterFinancingPlanInStoreReturnViewController initWithFinancingPlan:payLaterAccount:](v4, "initWithFinancingPlan:payLaterAccount:", financingPlan, v6);

  -[PKPayLaterViewController pushViewController:animated:](self, "pushViewController:animated:", v7, 1);
}

- (void)_presentLoanAgreement
{
  void *v3;
  void *v4;
  PKAccountTermsAndConditionsController *v5;
  void *v6;
  void *v7;
  PKAccountTermsAndConditionsController *v8;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[PKPayLaterFinancingPlan termsDetails](self->_financingPlan, "termsDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installmentAgreementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [PKAccountTermsAndConditionsController alloc];
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v5, "initWithAccount:webService:context:termsIdentifier:", v6, v7, 0, v4);
    termsController = self->_termsController;
    self->_termsController = v8;

    objc_initWeak(&location, self);
    v10 = self->_termsController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__PKPayLaterFinancingPlanViewController__presentLoanAgreement__block_invoke;
    v13[3] = &unk_1E3E62598;
    objc_copyWeak(&v14, &location);
    -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v10, "termsViewControllerWithCompletion:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    PKAccountDisplayableError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = PKAlertForDisplayableErrorWithHandlers(v11, 0, 0, 0);

    if (v12)
      -[PKPayLaterFinancingPlanViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

void __62__PKPayLaterFinancingPlanViewController__presentLoanAgreement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (void)_presentLoanCancellationFlow
{
  unint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  PKPayLaterFinancingPlanViewController *v24;
  id v25;
  id location;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  if (v3 > 8)
  {
    v4 = 0;
  }
  else
  {
    PKLocalizedCocoonString(&off_1E3E67258[v3]->isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presenting loan cancellation alert for %@", buf, 0xCu);
  }

  v7 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedCocoonString(CFSTR("MARK_AS_CANCELED_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCocoonString(CFSTR("MARK_AS_CANCELED_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke;
  v22[3] = &unk_1E3E67238;
  v13 = v5;
  v23 = v13;
  objc_copyWeak(&v25, &location);
  v24 = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCocoonString(CFSTR("CANCEL_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_109;
  v20[3] = &unk_1E3E61D68;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  -[PKPayLaterFinancingPlanViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v9, 1, 0);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id *v6;
  _QWORD *WeakRetained;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "User wants to cancel loan for %@", buf, 0xCu);
  }

  v6 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "payLaterAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WeakRetained[165];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_104;
    v10[3] = &unk_1E3E67210;
    objc_copyWeak(&v11, v6);
    +[PKPayLaterFinancingPlanCancellationViewController planCancellationReasonsDynamincContentForPayLaterAccount:financingPlan:completion:](PKPayLaterFinancingPlanCancellationViewController, "planCancellationReasonsDynamincContentForPayLaterAccount:financingPlan:completion:", v8, v9, v10);

    objc_destroyWeak(&v11);
  }

}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  PKPayLaterFinancingPlanCancellationViewController *v8;
  void *v9;
  PKPayLaterFinancingPlanCancellationViewController *v10;
  PKNavigationController *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Error getting loan cancellation reasons UI %@", (uint8_t *)&v14, 0xCu);
      }

      PKAccountDisplayableError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (PKPayLaterFinancingPlanCancellationViewController *)PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);

      if (v10)
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      v8 = [PKPayLaterFinancingPlanCancellationViewController alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKPayLaterFinancingPlanCancellationViewController initWithPayLaterAccount:financingPlan:dynamicContentPage:](v8, "initWithPayLaterAccount:financingPlan:dynamicContentPage:", v9, WeakRetained[165], v5);

      v11 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v10);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

    }
  }

}

void __69__PKPayLaterFinancingPlanViewController__presentLoanCancellationFlow__block_invoke_109(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User wants to keep loan for %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_sharePlan
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (PKTransactionDebugDetailsEnabled())
  {
    -[PKPayLaterFinancingPlan dictionaryRepresentation](self->_financingPlan, "dictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v22;
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("financingPlan_%@.json"), v8);

        -[NSObject temporaryDirectory](v6, "temporaryDirectory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NSObject createFileAtPath:contents:attributes:](v6, "createFileAtPath:contents:attributes:", v12, v4, 0);

        if ((v13 & 1) != 0)
        {
          v14 = objc_alloc(MEMORY[0x1E0D96D28]);
          v23 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "initWithActivityItems:applicationActivities:", v15, 0);

          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __51__PKPayLaterFinancingPlanViewController__sharePlan__block_invoke;
          v19[3] = &unk_1E3E64020;
          v20 = v6;
          v21 = v11;
          -[NSObject setCompletionWithItemsHandler:](v16, "setCompletionWithItemsHandler:", v19);
          -[NSObject popoverPresentationController](v16, "popoverPresentationController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBarButtonItem:", self->_moreMenuButton);

          -[PKPayLaterFinancingPlanViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v25 = v18;
            _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error saving financing plan JSON to file path: %@", buf, 0xCu);

          }
        }

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v3;
          v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error converting financing plan dictionary %@ to JSON: %@", buf, 0x16u);
        }
      }

    }
  }
}

uint64_t __51__PKPayLaterFinancingPlanViewController__sharePlan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_topicsComposer, 0);
  objc_storeStrong((id *)&self->_moreMenuButton, 0);
  objc_storeStrong((id *)&self->_pendingFinancingPlanUpdate, 0);
  objc_storeStrong((id *)&self->_lastUpdateOfFinancingPlan, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_navigationBarImageView, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dashboardMessagesComposer, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
