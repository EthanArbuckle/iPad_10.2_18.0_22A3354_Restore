@implementation PKPayLaterBusinessChatTopicsSectionController

- (PKPayLaterBusinessChatTopicsSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9 delegate:(id)a10
{
  id v16;
  id v17;
  id v18;
  PKPayLaterBusinessChatTopicsSectionController *v19;
  PKPayLaterBusinessChatTopicsSectionController *v20;
  id *p_topics;
  PKAccountService *v22;
  PKAccountService *accountService;
  PKPaymentTransactionIconGenerator *v24;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v26;
  char *v27;
  void *v28;
  PKPayLaterTitleDetailRow *v29;
  void *v30;
  id v31;
  PKPayLaterTitleDetailRow *v32;
  uint64_t v33;
  NSArray *topicsRows;
  uint64_t v35;
  PKPayLaterIconTextRow *iconTextRow;
  PKPayLaterPayment **p_payment;
  _QWORD *v39;
  PKPayLaterFinancingPlan **p_financingPlan;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48[2];
  id location;
  objc_super v50;

  v16 = a3;
  v17 = a4;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v42 = a8;
  v18 = a10;
  v50.receiver = self;
  v50.super_class = (Class)PKPayLaterBusinessChatTopicsSectionController;
  v19 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v50, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v16, 0, v18);
  v20 = v19;
  if (v19)
  {
    v41 = v18;
    objc_storeWeak((id *)&v19->_delegate, v18);
    p_financingPlan = &v20->_financingPlan;
    objc_storeStrong((id *)&v20->_financingPlan, a5);
    objc_storeStrong((id *)&v20->_payLaterPass, a4);
    objc_storeStrong((id *)&v20->_installment, a6);
    p_payment = &v20->_payment;
    objc_storeStrong((id *)&v20->_payment, a7);
    p_topics = (id *)&v20->_topics;
    objc_storeStrong((id *)&v20->_topics, a8);
    v20->_businessChatContext = a9;
    v22 = (PKAccountService *)objc_alloc_init(MEMORY[0x1E0D668E8]);
    accountService = v20->_accountService;
    v20->_accountService = v22;

    v24 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v20->_iconGenerator;
    v20->_iconGenerator = v24;

    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[NSArray count](v20->_topics, "count"))
    {
      v27 = 0;
      do
      {
        objc_msgSend(*p_topics, "objectAtIndexedSubscript:", v27, p_payment);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v20);
        v29 = [PKPayLaterTitleDetailRow alloc];
        objc_msgSend(v28, "displayText");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __156__PKPayLaterBusinessChatTopicsSectionController_initWithPayLaterAccount_payLaterPass_financingPlan_installment_payment_topics_businessChatContext_delegate___block_invoke;
        v46[3] = &unk_1E3E671C0;
        objc_copyWeak(v48, &location);
        v48[1] = v27;
        v31 = v28;
        v47 = v31;
        v32 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v29, "initWithTitle:detail:selectionHandler:", v30, 0, v46);

        objc_msgSend(v26, "addObject:", v32);
        objc_destroyWeak(v48);
        objc_destroyWeak(&location);

        ++v27;
      }
      while ((unint64_t)v27 < objc_msgSend(*p_topics, "count"));
    }
    v33 = objc_msgSend(v26, "copy", p_payment);
    topicsRows = v20->_topicsRows;
    v20->_topicsRows = (NSArray *)v33;

    if (*p_financingPlan)
    {
      +[PKPayLaterIconTextRow rowConfiguredForDisputeLayoutWithFinancingPlan:payment:selectionHandler:](PKPayLaterIconTextRow, "rowConfiguredForDisputeLayoutWithFinancingPlan:payment:selectionHandler:", *p_financingPlan, *v39, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      iconTextRow = v20->_iconTextRow;
      v20->_iconTextRow = (PKPayLaterIconTextRow *)v35;

      -[PKPayLaterBusinessChatTopicsSectionController _updateIconForFinancingPlan:](v20, "_updateIconForFinancingPlan:", *p_financingPlan);
    }

    v18 = v41;
  }

  return v20;
}

void __156__PKPayLaterBusinessChatTopicsSectionController_initWithPayLaterAccount_payLaterPass_financingPlan_installment_payment_topics_businessChatContext_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[18], "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_handleTopicRowTapped:topic:", v3, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)_updateIconForFinancingPlan:(id)a3
{
  id v4;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  iconGenerator = self->_iconGenerator;
  objc_msgSend(v4, "merchant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke;
  v8[3] = &unk_1E3E62438;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v6, 0, 0, v8, 45.0, 45.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterIconTextRow setIcon:](self->_iconTextRow, "setIcon:", v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke_2;
  block[3] = &unk_1E3E68C58;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained[20], "setIcon:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v4, "dynamicCollectionDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "reloadItem:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160), 1);

      WeakRetained = v4;
    }

  }
}

- (id)identifiers
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_financingPlan)
    objc_msgSend(v3, "addObject:", CFSTR("kFinancingPlanSection"));
  if (-[NSArray count](self->_topics, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("kTopicsSection"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kFinancingPlanSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kFinancingPlanSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterBusinessChatTopicsSectionController _configureFinancingPlanSection:](self, "_configureFinancingPlanSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kTopicsSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kTopicsSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterBusinessChatTopicsSectionController _configureTopicsSection:](self, "_configureTopicsSection:", v6);
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if ((v4 == CFSTR("kTopicsSection")
     || v4 && (v6 = objc_msgSend(CFSTR("kTopicsSection"), "isEqualToString:", v4), v5, v6))
    && (v7 = self->_businessChatContext - 1, v7 <= 2)
    && (PKLocalizedCocoonString(&off_1E3E6BBE8[v7]->isa), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "uppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4918], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v17[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterBusinessChatTopicsSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v20, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (__CFString *)v6;
  v17 = v16;
  if (v16 == CFSTR("kFinancingPlanSection")
    || v16 && (v18 = objc_msgSend(CFSTR("kFinancingPlanSection"), "isEqualToString:", v16), v17, v18))
  {
    v9 = 16.0;
  }
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (void)_configureFinancingPlanSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "safelyAddObject:", self->_iconTextRow);
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "appendItems:", v6);

}

- (void)_configureTopicsSection:(id)a3
{
  objc_msgSend(a3, "appendItems:", self->_topicsRows);
}

- (void)_financingPlansForTopic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKAccountService *accountService;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v6 = a4;
  v7 = a3;
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "relevantFinancingPlanStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D67010], "activeFinancingPlanStates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  if (v11)
    objc_msgSend(v15, "intersectSet:", v10);
  v16 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D67010], "completedFinancingPlanStates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

  if (v11)
    objc_msgSend(v18, "intersectSet:", v10);
  if (objc_msgSend(v15, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", v9, 32);
    objc_msgSend(v15, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRelevantFinancingPlanStates:", v20);

    objc_msgSend(v12, "addObject:", v19);
  }
  else
  {
    v19 = 0;
  }
  if (objc_msgSend(v18, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", v9, 32);
    objc_msgSend(v18, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRelevantFinancingPlanStates:", v22);

    objc_msgSend(v12, "addObject:", v21);
  }
  else
  {
    v21 = 0;
  }
  accountService = self->_accountService;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke;
  v27[3] = &unk_1E3E6BB78;
  v28 = v19;
  v29 = v21;
  v30 = v6;
  v24 = v6;
  v25 = v21;
  v26 = v19;
  -[PKAccountService financingPlansWithQueries:completion:](accountService, "financingPlansWithQueries:completion:", v12, v27);

}

void __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke(id *a1, void *a2)
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
  v5[2] = __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke_2;
  v5[3] = &unk_1E3E622D8;
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "queryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queryIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v2)
  {
    v8 = 0;
    if (v3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relevantFinancingPlans");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relevantFinancingPlans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_handleTopicRowTapped:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPayLaterSectionController viewControllerDelegate](self, "viewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D68C08];
  objc_msgSend(v7, "analyticsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportAnalyticsEvent:", v10);

  if (self->_financingPlan || !objc_msgSend(v7, "requiresFinancingPlan"))
    -[PKPayLaterBusinessChatTopicsSectionController _showTopicExplanationForRow:topic:](self, "_showTopicExplanationForRow:topic:", v6, v7);
  else
    -[PKPayLaterBusinessChatTopicsSectionController _showListOfFinancingPlansForRow:topic:](self, "_showListOfFinancingPlansForRow:topic:", v6, v7);

}

- (void)_showListOfFinancingPlansForRow:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setShowSpinner:", 1);
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItem:animated:", v6, 1);

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PKPayLaterBusinessChatTopicsSectionController__showListOfFinancingPlansForRow_topic___block_invoke;
  v11[3] = &unk_1E3E6BBA0;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  -[PKPayLaterBusinessChatTopicsSectionController _financingPlansForTopic:completion:](self, "_financingPlansForTopic:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __87__PKPayLaterBusinessChatTopicsSectionController__showListOfFinancingPlansForRow_topic___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "payLaterAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPayLaterFinancingPlanListViewController disputeFinancingPlansListViewControllerWithPayLaterAccount:payLaterPass:businessChatTopic:financingPlans:completedFinancingPlans:financingPlansUpdateQuery:completedFinancingPlansQuery:](PKPayLaterFinancingPlanListViewController, "disputeFinancingPlansListViewControllerWithPayLaterAccount:payLaterPass:businessChatTopic:financingPlans:completedFinancingPlans:financingPlansUpdateQuery:completedFinancingPlansQuery:", v14, *((_QWORD *)v13 + 13), *(_QWORD *)(a1 + 32), v18, v9, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_loadWeakRetained((id *)v13 + 12);
    objc_msgSend(v16, "pushViewController:animated:", v15, 1);

    objc_msgSend(*(id *)(a1 + 40), "setShowSpinner:", 0);
    objc_msgSend(v13, "dynamicCollectionDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadItem:animated:", *(_QWORD *)(a1 + 40), 1);

  }
}

- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setShowSpinner:", 1);
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItem:animated:", v6, 1);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D669C0]), "initWithTopic:", v7);
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccountIdentifier:", v11);

  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountBaseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBaseURL:", v13);

  objc_msgSend(v9, "setFinancingPlan:", self->_financingPlan);
  objc_msgSend(v9, "setPayment:", self->_payment);
  objc_msgSend(v9, "setInstallment:", self->_installment);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke;
  v17[3] = &unk_1E3E6BBC8;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v18 = v15;
  v16 = v6;
  v19 = v16;
  objc_msgSend(v14, "accountPayLaterContentWithRequest:completion:", v9, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke(id *a1, void *a2)
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
  v5[2] = __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke_2(id *a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPayLaterBusinessChatTopicExplanationViewController *v7;
  void *v8;
  PKPayLaterBusinessChatTopicExplanationViewController *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "reportIssueTopics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "updateWithBusinessChatTopic:", v4);
    objc_msgSend(a1[4], "dynamicContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicContentPageForPageType:", 12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [PKPayLaterBusinessChatTopicExplanationViewController alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPayLaterBusinessChatTopicExplanationViewController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContent:](v7, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContent:", v8, WeakRetained[13], WeakRetained[14], WeakRetained[15], WeakRetained[16], a1[5], v5);

      v10 = objc_loadWeakRetained(WeakRetained + 12);
      objc_msgSend(v10, "pushViewController:animated:", v9, 1);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeDisputeTopicExplanation, opening business chat instead", buf, 2u);
      }

      v9 = (PKPayLaterBusinessChatTopicExplanationViewController *)objc_loadWeakRetained(WeakRetained + 12);
      -[PKPayLaterBusinessChatTopicExplanationViewController openBusinessChatForTopic:](v9, "openBusinessChatForTopic:", a1[5]);
    }

    objc_msgSend(a1[6], "setShowSpinner:", 0);
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadItem:animated:", a1[6], 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_iconTextRow, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_topicsRows, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
