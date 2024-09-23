@implementation PKPayLaterFinancingPlanListViewController

+ (id)disputeFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 businessChatTopic:(id)a5 financingPlans:(id)a6 completedFinancingPlans:(id)a7 financingPlansUpdateQuery:(id)a8 completedFinancingPlansQuery:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PKPayLaterFinancingPlanListViewController *v22;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[PKPayLaterFinancingPlanListViewController initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:]([PKPayLaterFinancingPlanListViewController alloc], "initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:", v21, 3, v18, v17, 0, v20, v19, 0, v16, v15);

  return v22;
}

+ (id)completedFinancingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 completedFinancingPlans:(id)a5 completedFinancingPlansQuery:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKPayLaterFinancingPlanListViewController *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PKPayLaterFinancingPlanListViewController initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:]([PKPayLaterFinancingPlanListViewController alloc], "initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:", v12, 1, v10, 0, 0, 0, 0, v11, v9, 0);

  return v13;
}

+ (id)financingPlansListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 financingPlansUpdateQuery:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKPayLaterFinancingPlanListViewController *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PKPayLaterFinancingPlanListViewController initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:]([PKPayLaterFinancingPlanListViewController alloc], "initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:", v12, 0, v10, 0, 0, 0, 0, v11, v9, 0);

  return v13;
}

+ (id)activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:(id)a3 paymentIntentController:(id)a4 financingPlans:(id)a5 completedFinancingPlansCount:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  PKPayLaterFinancingPlanListViewController *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[PKPayLaterFinancingPlanListViewController initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:]([PKPayLaterFinancingPlanListViewController alloc], "initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:primaryFinancingPlansUpdateQuery:secondaryFinancingPlansUpdateQuery:", v11, 2, v9, 0, a6, 0, 0, v10, 0, 0);

  return v12;
}

- (PKPayLaterFinancingPlanListViewController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 primaryFinancingPlansUpdateQuery:(id)a11 secondaryFinancingPlansUpdateQuery:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PKPayLaterFinancingPlanListViewController *v22;
  uint64_t v23;
  PKAccountService *accountService;
  PKPayLaterFinancingPlanListSectionController *v25;
  PKPayLaterFinancingPlanListSectionController *sectionController;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v17 = a3;
  v31 = a5;
  v30 = a6;
  v18 = a8;
  v29 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v32.receiver = self;
  v32.super_class = (Class)PKPayLaterFinancingPlanListViewController;
  v22 = -[PKPayLaterViewController initWithPayLaterAccount:](&v32, sel_initWithPayLaterAccount_, v17);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v23 = objc_claimAutoreleasedReturnValue();
    accountService = v22->_accountService;
    v22->_accountService = (PKAccountService *)v23;

    objc_storeStrong((id *)&v22->_primaryFinancingPlansUpdateQuery, a11);
    objc_storeStrong((id *)&v22->_secondaryFinancingPlansUpdateQuery, a12);
    v25 = -[PKPayLaterFinancingPlanListSectionController initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:dynamicContentPage:delegate:]([PKPayLaterFinancingPlanListSectionController alloc], "initWithPayLaterAccount:context:primaryFinancingPlans:secondaryFinancingPlans:tertiaryFinancingPlansCount:payLaterPass:businessChatTopic:paymentIntentController:dynamicContentPage:delegate:", v17, a4, v31, v30, a7, v18, v29, v19, 0, v22);
    sectionController = v22->_sectionController;
    v22->_sectionController = v25;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v22->_sectionController, "setDynamicCollectionDelegate:", v22);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v22, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v22;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterFinancingPlanListViewController;
  -[PKPayLaterViewController viewDidLoad](&v8, sel_viewDidLoad);
  v9[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

  switch(-[PKPayLaterFinancingPlanListSectionController context](self->_sectionController, "context"))
  {
    case 0uLL:
    case 2uLL:
      -[PKPayLaterFinancingPlanListViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ALL_PURCHASES");
      goto LABEL_4;
    case 1uLL:
      -[PKPayLaterFinancingPlanListViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("COMPLETED_INSTALLMENTS");
LABEL_4:
      PKLocalizedCocoonString(&v5->isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v6);

      goto LABEL_6;
    case 3uLL:
      PKLocalizedCocoonString(CFSTR("SELECT_ORDER_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v7);

      PKLocalizedCocoonString(CFSTR("SELECT_ORDER_DESCRIPTION"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);
LABEL_6:

      break;
    default:
      return;
  }
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  -[PKPayLaterSectionController setPayLaterAccount:](self->_sectionController, "setPayLaterAccount:", a3);
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void)_updatedFinancingPlan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKAccountService *accountService;
  PKAccountServicePayLaterFinancingPlanQuery *primaryFinancingPlansUpdateQuery;
  id *v9;
  id v10;
  void *v11;
  PKAccountService *v12;
  id *v13;
  PKAccountService *v14;
  PKAccountServicePayLaterFinancingPlanQuery *v15;
  PKAccountService *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[PKPayLaterFinancingPlanListSectionController context](self->_sectionController, "context"))
  {
    case 0uLL:
      accountService = self->_accountService;
      primaryFinancingPlansUpdateQuery = self->_primaryFinancingPlansUpdateQuery;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_7;
      v17[3] = &unk_1E3E647B8;
      objc_copyWeak(&v18, &location);
      -[PKAccountService financingPlansWithQuery:completion:](accountService, "financingPlansWithQuery:completion:", primaryFinancingPlansUpdateQuery, v17);
      v9 = &v18;
      goto LABEL_5;
    case 1uLL:
      v14 = self->_accountService;
      v15 = self->_primaryFinancingPlansUpdateQuery;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke;
      v23[3] = &unk_1E3E64768;
      objc_copyWeak(&v24, &location);
      v23[4] = self;
      -[PKAccountService financingPlansWithQuery:completion:](v14, "financingPlansWithQuery:completion:", v15, v23);
      v9 = &v24;
LABEL_5:
      objc_destroyWeak(v9);
      break;
    case 2uLL:
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", v6, 80);
      objc_msgSend(MEMORY[0x1E0D67010], "completedFinancingPlanStates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCountFinancingPlanStates:", v11);

      v12 = self->_accountService;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_5;
      v19[3] = &unk_1E3E647B8;
      objc_copyWeak(&v20, &location);
      -[PKAccountService financingPlansWithQuery:completion:](v12, "financingPlansWithQuery:completion:", v10, v19);
      v13 = &v20;
      goto LABEL_7;
    case 3uLL:
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v10, "safelyAddObject:", self->_primaryFinancingPlansUpdateQuery);
      objc_msgSend(v10, "safelyAddObject:", self->_secondaryFinancingPlansUpdateQuery);
      v16 = self->_accountService;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_3;
      v21[3] = &unk_1E3E64790;
      objc_copyWeak(&v22, &location);
      v21[4] = self;
      -[PKAccountService financingPlansWithQueries:completion:](v16, "financingPlansWithQueries:completion:", v10, v21);
      v13 = &v22;
LABEL_7:
      objc_destroyWeak(v13);

      break;
    default:
      break;
  }

  objc_destroyWeak(&location);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1352))
      {
        v4 = (void *)WeakRetained[166];
        v6 = WeakRetained;
        objc_msgSend(v3, "completedFinancingPlans");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setPrimaryFinancingPlans:", v5);

        objc_msgSend(v6, "reloadDataAnimated:", 1);
        WeakRetained = v6;
      }
    }
  }

}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_4;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
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
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 1352);
    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v3, "queryIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "relevantFinancingPlans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained[166], "setPrimaryFinancingPlans:", v7);
      v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1360);
      if (!v8)
        goto LABEL_8;
      goto LABEL_7;
    }
    v8 = *(void **)(v2 + 1360);
    if (v8)
    {
LABEL_7:
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v8, "queryIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relevantFinancingPlans");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained[166], "setSecondaryFinancingPlans:", v12);
LABEL_8:
      objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);
    }
  }

}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_6;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained[166];
      v6 = WeakRetained;
      objc_msgSend(v3, "activeFinancingPlans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPrimaryFinancingPlans:", v5);

      objc_msgSend(v6[166], "setTertiaryFinancingPlansCount:", objc_msgSend(*(id *)(a1 + 32), "financingPlanCount"));
      objc_msgSend(v6, "reloadDataAnimated:", 1);
      WeakRetained = v6;
    }
  }

}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_8;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPayLaterFinancingPlanListViewController__updatedFinancingPlan___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = (void *)WeakRetained[166];
      v6 = WeakRetained;
      objc_msgSend(v3, "relevantFinancingPlans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPrimaryFinancingPlans:", v5);

      objc_msgSend(v6, "reloadDataAnimated:", 1);
      WeakRetained = v6;
    }
  }

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F40];
}

- (id)additionalAnalyticsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[PKPayLaterFinancingPlanListSectionController context](self->_sectionController, "context") == 3)
  {
    -[PKPayLaterFinancingPlanListSectionController businessChatTopic](self->_sectionController, "businessChatTopic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "analyticsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safelySetObject:forKey:", v5, *MEMORY[0x1E0D69050]);

  }
  if (objc_msgSend(v3, "count"))
    v6 = (void *)objc_msgSend(v3, "copy");
  else
    v6 = 0;

  return v6;
}

- (void)openBusinessChatForTopic:(id)a3 financingPlan:(id)a4
{
  id v6;
  id v7;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v9;
  PKBusinessChatController *v10;
  PKBusinessChatPayLaterContext *v11;
  void *v12;
  void *v13;
  PKBusinessChatPayLaterContext *v14;
  PKBusinessChatController *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  businessChatController = self->_businessChatController;
  if (businessChatController)
    v9 = businessChatController;
  else
    v9 = objc_alloc_init(PKBusinessChatController);
  v10 = self->_businessChatController;
  self->_businessChatController = v9;

  objc_initWeak(&location, self);
  v11 = [PKBusinessChatPayLaterContext alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanListSectionController payLaterPass](self->_sectionController, "payLaterPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v11, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v12, v13, v6, v7, 0, 0, 0);

  v15 = self->_businessChatController;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke;
  v16[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v17, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v15, "openBusinessChatWithContext:completion:", v14, v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __84__PKPayLaterFinancingPlanListViewController_openBusinessChatForTopic_financingPlan___block_invoke_2(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFinancingPlansUpdateQuery, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlansUpdateQuery, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
