@implementation PKCommutePlanDetailsViewController

- (PKCommutePlanDetailsViewController)initWithCommutePlan:(id)a3 associatedAction:(id)a4 forPass:(id)a5 paymentDataProvider:(id)a6 webService:(id)a7 style:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  PKCommutePlanDetailsViewController *v20;
  uint64_t v21;
  NSArray *fields;
  NSArray *v23;
  NSArray *reminderIntervals;
  uint64_t v25;
  PKTransitBalanceModel *balanceModel;
  id *p_paymentDataProvider;
  NSDateComponentsFormatter *v28;
  NSDateComponentsFormatter *timeIntervalFormatter;
  char v30;
  char v31;
  BOOL dataProviderImplementsBalanceReminderAPI;
  void *v33;
  void *v34;
  id obj;
  id v38;
  id v39;
  objc_super v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v39 = a6;
  obj = a7;
  v38 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v14, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  objc_msgSend(v14, "details");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v19);

  v40.receiver = self;
  v40.super_class = (Class)PKCommutePlanDetailsViewController;
  v20 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v40, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    fields = v20->_fields;
    v20->_fields = (NSArray *)v21;

    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    reminderIntervals = v20->_reminderIntervals;
    v20->_reminderIntervals = v23;

    objc_storeStrong((id *)&v20->_pass, a5);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v16);
    balanceModel = v20->_balanceModel;
    v20->_balanceModel = (PKTransitBalanceModel *)v25;

    objc_storeStrong((id *)&v20->_commutePlan, a3);
    objc_storeStrong((id *)&v20->_action, a4);
    p_paymentDataProvider = (id *)&v20->_paymentDataProvider;
    objc_storeStrong((id *)&v20->_paymentDataProvider, a6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*p_paymentDataProvider, "addDelegate:", v20);
    objc_storeStrong((id *)&v20->_webService, obj);
    v20->_style = a8;
    v28 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    timeIntervalFormatter = v20->_timeIntervalFormatter;
    v20->_timeIntervalFormatter = v28;

    -[NSDateComponentsFormatter setUnitsStyle:](v20->_timeIntervalFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setMaximumUnitCount:](v20->_timeIntervalFormatter, "setMaximumUnitCount:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = objc_opt_respondsToSelector();
    else
      v30 = 0;
    v20->_dataProviderImplementsBalanceReminderAPI = v30 & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v31 = objc_opt_respondsToSelector();
      v20->_dataProviderImplementsCommutePlanReminderAPI = v31 & 1;
      if ((v31 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      v20->_dataProviderImplementsCommutePlanReminderAPI = 0;
    }
    dataProviderImplementsBalanceReminderAPI = v20->_dataProviderImplementsBalanceReminderAPI;
    if (!dataProviderImplementsBalanceReminderAPI)
    {
LABEL_13:
      v20->_canShowReminders = dataProviderImplementsBalanceReminderAPI;
      -[PKCommutePlanDetailsViewController navigationItem](v20, "navigationItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v33, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
      PKPassLocalizedStringWithFormat();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCommutePlanDetailsViewController setTitle:](v20, "setTitle:", v34, 0);

      goto LABEL_14;
    }
LABEL_12:
    dataProviderImplementsBalanceReminderAPI = objc_msgSend(*p_paymentDataProvider, "apiVersion") > 1;
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCommutePlanDetailsViewController;
  -[PKSectionTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v3, self);

    -[PKCommutePlanDetailsViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKBridgeAppearanceGetAppearanceSpecifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v6);

  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  PKPaymentPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __94__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setDynamicBalances:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_resetReminderIntervalsForCountPlans:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  PKPaymentPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __91__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "updateWithDynamicCommutePlans:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_resetReminderIntervalsForTimedPlans:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  PKPaymentPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __105__PKCommutePlanDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setTransitProperties:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_reloadBalanceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PKPaymentDataProvider *paymentDataProvider;
  uint64_t v9;
  id v10;
  NSObject *v11;
  PKPaymentDataProvider *v12;
  NSObject *v13;
  PKPaymentDataProvider *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;
  id location;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  PKCommutePlanDetailsViewController *v32;
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;

  v4 = a3;
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__38;
  v39[4] = __Block_byref_object_dispose__38;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__38;
  v37[4] = __Block_byref_object_dispose__38;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__38;
  v35[4] = __Block_byref_object_dispose__38;
  v36 = 0;
  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);
  paymentDataProvider = self->_paymentDataProvider;
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke;
  v30[3] = &unk_1E3E69088;
  v34 = v39;
  v10 = v7;
  v31 = v10;
  v32 = self;
  v11 = v6;
  v33 = v11;
  -[PKPaymentDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v5, v10, v30);
  dispatch_group_enter(v11);
  v12 = self->_paymentDataProvider;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_2;
  v27[3] = &unk_1E3E690B0;
  v29 = v37;
  v13 = v11;
  v28 = v13;
  -[PKPaymentDataProvider balancesForPaymentPassWithUniqueIdentifier:completion:](v12, "balancesForPaymentPassWithUniqueIdentifier:completion:", v5, v27);
  dispatch_group_enter(v13);
  v14 = self->_paymentDataProvider;
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_3;
  v24[3] = &unk_1E3E633C0;
  v26 = v35;
  v15 = v13;
  v25 = v15;
  -[PKPaymentDataProvider plansForPaymentPassWithUniqueIdentifier:completion:](v14, "plansForPaymentPassWithUniqueIdentifier:completion:", v5, v24);
  objc_initWeak(&location, self);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_4;
  v17[3] = &unk_1E3E71E80;
  objc_copyWeak(&v22, &location);
  v20 = v37;
  v21 = v35;
  v18 = v4;
  v19 = v39;
  v16 = v4;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1096));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__PKCommutePlanDetailsViewController__reloadBalanceWithCompletion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[146], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v6[146], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v6, "_resetReminderIntervalsForCountPlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v6[146], "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(v6, "_resetReminderIntervalsForTimedPlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(v6, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

    v3 = v6;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
      v3 = v6;
    }
  }

}

- (void)_resetReminderIntervalsForTimedPlans:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *reminderIntervals;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v14 = a3;
  if (-[PKPaymentPassAction type](self->_action, "type") == 2
    && (-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 1) != 0)
  {
    -[PKTransitCommutePlan expiryDate](self->_commutePlan, "expiryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitCommutePlan startDate](self->_commutePlan, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = MEMORY[0x1E0C809B0];
    if (v14 && objc_msgSend(v14, "count"))
    {
      -[PKTransitCommutePlan identifier](self->_commutePlan, "identifier");
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke;
      v18[3] = &unk_1E3E71EA8;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v19;
      objc_msgSend(v14, "pk_firstObjectPassingTest:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "expiryDate");
        v10 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "startDate");
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
        v4 = (void *)v10;
      }

    }
    if (v4)
    {
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke_34;
      v15[3] = &unk_1E3E71ED0;
      v16 = v4;
      v17 = v5;
      objc_msgSend(&unk_1E3FAE830, "pk_objectsPassingTest:", v15);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      reminderIntervals = self->_reminderIntervals;
      self->_reminderIntervals = v12;

    }
  }

}

uint64_t __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
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

BOOL __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForTimedPlans___block_invoke_34(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  return v4 < v6 - v7;
}

- (void)_resetReminderIntervalsForCountPlans:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *reminderIntervals;
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v14 = a3;
  if (-[PKPaymentPassAction type](self->_action, "type") == 2)
  {
    v4 = -[PKTransitCommutePlan properties](self->_commutePlan, "properties");
    if (v14)
    {
      if ((v4 & 4) != 0 && objc_msgSend(v14, "count"))
      {
        -[PKTransitCommutePlan passFieldForKey:](self->_commutePlan, "passFieldForKey:", *MEMORY[0x1E0D6BAA0]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "foreignReferenceIdentifiers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke;
        v16[3] = &unk_1E3E71EF8;
        v9 = v6;
        v17 = v9;
        objc_msgSend(v7, "pk_firstObjectPassingTest:", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v8;
          v15[1] = 3221225472;
          v15[2] = __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke_43;
          v15[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
          v15[4] = objc_msgSend(v11, "integerValue");
          objc_msgSend(&unk_1E3FAE848, "pk_objectsPassingTest:", v15);
          v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
          reminderIntervals = self->_reminderIntervals;
          self->_reminderIntervals = v12;

        }
      }
    }
  }

}

uint64_t __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  return v3;
}

BOOL __75__PKCommutePlanDetailsViewController__resetReminderIntervalsForCountPlans___block_invoke_43(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") < *(_QWORD *)(a1 + 32);
}

- (void)_fetchRemindersWithCompletion:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  PKPaymentDataProvider *paymentDataProvider;
  PKPaymentPass *pass;
  PKPaymentDataProvider *v11;
  PKTransitCommutePlan *commutePlan;
  PKPaymentPass *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  v5 = -[PKTransitCommutePlan properties](self->_commutePlan, "properties");
  if ((v5 & 4) != 0)
  {
    if (!self->_dataProviderImplementsBalanceReminderAPI)
      goto LABEL_10;
    v6 = objc_alloc(MEMORY[0x1E0D670B8]);
    -[PKTransitCommutePlan foreignReferenceIdentifiers](self->_commutePlan, "foreignReferenceIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithIdentifiers:forValue:roundingToExponent:", v7, 0, 0);

    objc_initWeak(&location, self);
    paymentDataProvider = self->_paymentDataProvider;
    pass = self->_pass;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke;
    v17[3] = &unk_1E3E71F40;
    objc_copyWeak(&v19, &location);
    v18 = v4;
    -[PKPaymentDataProvider balanceReminderThresholdForBalance:pass:withCompletion:](paymentDataProvider, "balanceReminderThresholdForBalance:pass:withCompletion:", v8, pass, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  if ((v5 & 3) == 1)
  {
    if (self->_dataProviderImplementsCommutePlanReminderAPI)
    {
      self->_selectedReminderIntervalsIndex = 0;
      self->_shouldLoadReminderInterval = 1;
      objc_initWeak(&location, self);
      v11 = self->_paymentDataProvider;
      commutePlan = self->_commutePlan;
      v13 = self->_pass;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_4;
      v14[3] = &unk_1E3E71F68;
      objc_copyWeak(&v16, &location);
      v15 = v4;
      -[PKPaymentDataProvider commutePlanReminderForCommutePlan:pass:withCompletion:](v11, "commutePlanReminderForCommutePlan:pass:withCompletion:", commutePlan, v13, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
LABEL_10:
    -[PKCommutePlanDetailsViewController _reloadBalanceWithCompletion:](self, "_reloadBalanceWithCompletion:", v4);
    goto LABEL_11;
  }
  if ((v5 & 1) != 0 && ((v5 & 2) != 0 || !self->_dataProviderImplementsCommutePlanReminderAPI))
    goto LABEL_10;
LABEL_11:

}

void __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E3E66EF0;
  v11 = v3;
  v12 = WeakRetained;
  v13 = *(id *)(a1 + 32);
  v6 = v3;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61850;
  block[4] = WeakRetained;
  v9 = _Block_copy(aBlock);
  v7 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_updateSelectedBalanceReminderWithBalanceReminder:");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBalanceWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD aBlock[5];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_5;
  aBlock[3] = &unk_1E3E66EF0;
  aBlock[4] = WeakRetained;
  v11 = v3;
  v12 = *(id *)(a1 + 32);
  v6 = v3;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_6;
  block[3] = &unk_1E3E61850;
  block[4] = WeakRetained;
  v9 = _Block_copy(aBlock);
  v7 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_5(_QWORD *a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)a1[4];
  if (v4 && v4[1136])
    objc_msgSend(v4, "_updateSelectedReminderIntervalsIndexWithReminder:", a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __68__PKCommutePlanDetailsViewController__fetchRemindersWithCompletion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBalanceWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (!a3)
    return 1;
  if (a3 == 1)
    return self->_canShowReminders;
  return 0;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCommutePlanDetailsViewController;
  -[PKCommutePlanDetailsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKCommutePlanDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCommutePlanDetailsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)_handleReminderIntervalChanged:(int64_t)a3
{
  BOOL v5;
  int64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  int v24;

  if (self->_selectedReminderIntervalsIndex != a3)
  {
    self->_shouldLoadReminderInterval = 0;
    v5 = a3 < 1;
    v6 = a3 - 1;
    if (v5)
    {
      v7 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_reminderIntervals, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKCommutePlanDetailsViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 1);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_selectedReminderIntervalsIndex, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessoryType:", 0);
    if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 1) != 0)
    {
      v14 = objc_alloc(MEMORY[0x1E0D670D0]);
      objc_msgSend(v7, "doubleValue");
      v15 = (void *)objc_msgSend(v14, "initWithTimeInterval:");
      -[PKPaymentDataProvider setCommutePlanReminder:forCommutePlan:pass:completion:](self->_paymentDataProvider, "setCommutePlanReminder:forCommutePlan:pass:completion:", v15, self->_commutePlan, self->_pass, 0);

    }
    else if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 4) != 0)
    {
      v12 = objc_alloc(MEMORY[0x1E0D670C0]);
      v13 = (void *)MEMORY[0x1E0CB3598];
      if (v7)
      {
        objc_msgSend(v7, "decimalValue");
      }
      else
      {
        v23[0] = 0;
        v23[1] = 0;
        v24 = 0;
      }
      objc_msgSend(v13, "decimalNumberWithDecimal:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v12, "initWithThreshold:isEnabled:", v16, 1);

      v18 = objc_alloc(MEMORY[0x1E0D670B8]);
      -[PKTransitCommutePlan foreignReferenceIdentifiers](self->_commutePlan, "foreignReferenceIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithIdentifiers:forValue:roundingToExponent:", v19, 0, 0);

      -[PKPaymentDataProvider setBalanceReminder:forBalance:pass:completion:](self->_paymentDataProvider, "setBalanceReminder:forBalance:pass:completion:", v17, v20, self->_pass, 0);
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setAccessoryType:", 3);
    self->_selectedReminderIntervalsIndex = a3;

  }
}

- (void)_handleActionSelected
{
  char v3;
  id v4;
  PKPerformActionViewController *v5;
  PKNavigationController *v6;
  id v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v3 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_action, &v8, &v7);
  v4 = v7;
  if ((v3 & 1) != 0 || v8 == 2)
  {
    v5 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, self->_action, self->_paymentDataProvider);
    -[PKPerformActionViewController setDelegate:](v5, "setDelegate:", self);
    -[PKPerformActionViewController setWebService:](v5, "setWebService:", self->_webService);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    -[PKNavigationController setSupportedInterfaceOrientations:](v6, "setSupportedInterfaceOrientations:", 2);
    -[PKCommutePlanDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v8, self->_action, v4, 0);
    v5 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKCommutePlanDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)_updateSelectedBalanceReminderWithBalanceReminder:(id)a3
{
  NSArray *reminderIntervals;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  reminderIntervals = self->_reminderIntervals;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "threshold");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSArray indexOfObject:](reminderIntervals, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v8 + 1;
  if (self->_selectedReminderIntervalsIndex != v9)
  {
    self->_selectedReminderIntervalsIndex = v9;
    if (self->_canShowReminders)
      -[PKCommutePlanDetailsViewController _reloadChangedIndexPathsWithOldIndex:newIndex:inSection:](self, "_reloadChangedIndexPathsWithOldIndex:newIndex:inSection:");
  }
}

- (void)_updateSelectedReminderIntervalsIndexWithReminder:(id)a3
{
  NSArray *reminderIntervals;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(a3, "timeInterval");
  reminderIntervals = self->_reminderIntervals;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray indexOfObject:](reminderIntervals, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6 + 1;
  if (self->_selectedReminderIntervalsIndex != v7)
  {
    self->_selectedReminderIntervalsIndex = v7;
    if (self->_canShowReminders)
      -[PKCommutePlanDetailsViewController _reloadChangedIndexPathsWithOldIndex:newIndex:inSection:](self, "_reloadChangedIndexPathsWithOldIndex:newIndex:inSection:");
  }
}

- (void)_reloadChangedIndexPathsWithOldIndex:(unint64_t)a3 newIndex:(unint64_t)a4 inSection:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCommutePlanDetailsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKCommutePlanDetailsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (unint64_t)_commutePlanDetailsRowTypeForRowIndex:(int64_t)a3
{
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v6;
    v7 += -[PKCommutePlanDetailsViewController _numberOfCommutePlanDetailsRowsEnabledForRowType:](self, "_numberOfCommutePlanDetailsRowsEnabledForRowType:", v6);
    if ((v5 & 1) != 0)
      break;
    v5 = 1;
    v6 = 1;
  }
  while (v7 <= a3);
  if (v7 <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v8;
}

- (BOOL)_shouldShowRenewAction
{
  PKPaymentPassAction *action;

  action = self->_action;
  if (action)
    LOBYTE(action) = -[PKPaymentPassAction isActionAvailable](action, "isActionAvailable");
  return (char)action;
}

- (int64_t)_numberOfCommutePlanDetailsRowsEnabled
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_fields, "count");
  return v3 + -[PKCommutePlanDetailsViewController _shouldShowRenewAction](self, "_shouldShowRenewAction");
}

- (int64_t)_numberOfCommutePlanDetailsRowsEnabledForRowType:(unint64_t)a3
{
  if (a3 == 1)
    return -[PKCommutePlanDetailsViewController _shouldShowRenewAction](self, "_shouldShowRenewAction");
  if (a3)
    return 0;
  return -[NSArray count](self->_fields, "count");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int64_t result;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 1)
  {
    result = -[NSArray count](self->_reminderIntervals, "count");
    if (result)
      return -[NSArray count](self->_reminderIntervals, "count") + 1;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return -[PKCommutePlanDetailsViewController _numberOfCommutePlanDetailsRowsEnabled](self, "_numberOfCommutePlanDetailsRowsEnabled");
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKCommutePlanDetailsTableViewCell *v16;
  void *v17;
  PKCommutePlanDetailsTableViewCell *v18;
  PKTransitBalanceModel *balanceModel;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  PKPaymentPassAction *action;
  _BOOL8 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSDateComponentsFormatter *timeIntervalFormatter;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int64_t style;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  int64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");

  v10 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", v9);
  if (v10 == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("reminderCellIdentifier"));
    v18 = (PKCommutePlanDetailsTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = (PKCommutePlanDetailsTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("reminderCellIdentifier"));
      if (self->_style == 2)
      {
        PKBridgeAppearanceGetAppearanceSpecifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PKAppearanceApplyToContainer(v26, v18);

      }
    }
    if (v8 >= 1)
    {
      if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 4) != 0)
      {
        -[NSArray objectAtIndexedSubscript:](self->_reminderIntervals, "objectAtIndexedSubscript:", v8 - 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("COMMUTE_PLAN_RENEWAL_REMINDER_COUNT_PLAN"), CFSTR("%@"), v33);
      }
      else
      {
        if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 1) == 0)
        {
          v12 = 0;
LABEL_32:
          -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setText:", v12);

          -[PKCommutePlanDetailsTableViewCell detailTextLabel](v18, "detailTextLabel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setText:", 0);

          -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setLineBreakMode:", 0);

          -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setNumberOfLines:", 2);

          if (v8 == self->_selectedReminderIntervalsIndex)
            v40 = 3;
          else
            v40 = 0;
          -[PKCommutePlanDetailsTableViewCell setAccessoryType:](v18, "setAccessoryType:", v40);
          style = self->_style;
          -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (style == 2)
          {
            PKBridgeAppearanceGetAppearanceSpecifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "textColor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setTextColor:", v44);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setTextColor:", v43);
          }

          goto LABEL_52;
        }
        timeIntervalFormatter = self->_timeIntervalFormatter;
        -[NSArray objectAtIndexedSubscript:](self->_reminderIntervals, "objectAtIndexedSubscript:", v8 - 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        -[NSDateComponentsFormatter stringFromTimeInterval:](timeIntervalFormatter, "stringFromTimeInterval:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("COMMUTE_PLAN_RENEWAL_REMINDER_SETUP_CELL_SUBTITLE_FORMAT_STRING"), CFSTR("%@"), v33);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    PKLocalizedPaymentString(CFSTR("COMMUTE_PLAN_RENEWAL_REMINDER_SETUP_CELL_NONE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (v10)
    goto LABEL_28;
  v11 = -[PKCommutePlanDetailsViewController _commutePlanDetailsRowTypeForRowIndex:](self, "_commutePlanDetailsRowTypeForRowIndex:", v8);
  if (v11 != 1)
  {
    if (!v11)
    {
      -[NSArray objectAtIndexedSubscript:](self->_fields, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("planDetailsCellStyle%d"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v15);
      v16 = (PKCommutePlanDetailsTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v16 = -[PKCommutePlanDetailsTableViewCell initWithStyle:reuseIdentifier:passDetailViewStyle:]([PKCommutePlanDetailsTableViewCell alloc], "initWithStyle:reuseIdentifier:passDetailViewStyle:", 0, v15, self->_style);
        if (self->_style == 2)
        {
          PKBridgeAppearanceGetAppearanceSpecifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PKAppearanceApplyToContainer(v17, v16);

        }
      }
      v18 = v16;
      if ((unint64_t)(objc_msgSend(v12, "foreignReferenceType") - 1) <= 1)
      {
        balanceModel = self->_balanceModel;
        objc_msgSend(v12, "foreignReferenceIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransitBalanceModel balanceForIdentifiers:](balanceModel, "balanceForIdentifiers:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "formattedValue");
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v22;
      }
      objc_msgSend(v12, "key");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v8)
      {
        if (!objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D6BAA0]))
        {
          if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D6BAB0]))
          {
            -[PKTransitCommutePlan startDateString](self->_commutePlan, "startDateString");
            v25 = objc_claimAutoreleasedReturnValue();
LABEL_50:
            v54 = (void *)v25;

            v14 = v54;
            goto LABEL_51;
          }
          if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D6BAA8]))
          {
            -[PKTransitCommutePlan expiryDateString](self->_commutePlan, "expiryDateString");
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_50;
          }
LABEL_51:
          -[PKCommutePlanDetailsTableViewCell setPrimaryText:](v18, "setPrimaryText:", v13);
          -[PKCommutePlanDetailsTableViewCell setSecondaryText:](v18, "setSecondaryText:", v14);

LABEL_52:
          goto LABEL_53;
        }
      }
      else if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 4) != 0)
      {
        PKCommutePlanFormatTitleFromLabelAndValue();
        v45 = v13;

        v46 = v14;
        goto LABEL_47;
      }
      PKCommutePlanFieldEitherLabelOrValueIsEmpty();
      PKCommutePlanFormatTitleFromLabelAndValue();
      v45 = v13;

      v46 = v14;
LABEL_47:
      v53 = v46;

      v14 = v53;
      v13 = v45;
      goto LABEL_51;
    }
    goto LABEL_28;
  }
  if (!-[PKCommutePlanDetailsViewController _shouldShowRenewAction](self, "_shouldShowRenewAction"))
  {
LABEL_28:
    v18 = 0;
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("actionCellIdentifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v27);
  v18 = (PKCommutePlanDetailsTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v18 = (PKCommutePlanDetailsTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, v27);
    if (self->_style == 2)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKAppearanceApplyToContainer(v28, v18);

    }
  }
  action = self->_action;
  if (-[PKPaymentPass isSuicaPass](self->_pass, "isSuicaPass"))
    v30 = -[PKPaymentPassAction type](self->_action, "type") == 2;
  else
    v30 = 0;
  -[PKPaymentPassAction setReverseButtonTitleForLegacySuica:](action, "setReverseButtonTitleForLegacySuica:", v30);
  -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction title](self->_action, "title");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setText:", v48);

  v49 = self->_style;
  -[PKCommutePlanDetailsTableViewCell textLabel](v18, "textLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "buttonTextColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextColor:", v52);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextColor:", v51);
  }

LABEL_53:
  return v18;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  BOOL v7;

  v5 = a4;
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  if (v6 == 1)
  {
    v7 = 1;
  }
  else if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[PKCommutePlanDetailsViewController _commutePlanDetailsRowTypeForRowIndex:](self, "_commutePlanDetailsRowTypeForRowIndex:", objc_msgSend(v5, "row")) == 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v7, 1);
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v6 == 1)
  {
    -[PKCommutePlanDetailsViewController _handleReminderIntervalChanged:](self, "_handleReminderIntervalChanged:", objc_msgSend(v7, "row"));
  }
  else if (!v6
         && -[PKCommutePlanDetailsViewController _commutePlanDetailsRowTypeForRowIndex:](self, "_commutePlanDetailsRowTypeForRowIndex:", objc_msgSend(v7, "row")) == 1&& -[PKCommutePlanDetailsViewController _shouldShowRenewAction](self, "_shouldShowRenewAction"))
  {
    -[PKCommutePlanDetailsViewController _handleActionSelected](self, "_handleActionSelected");
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 1)
  {
    if ((-[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 4) != 0)
    {
      -[PKTransitCommutePlan passFieldForKey:](self->_commutePlan, "passFieldForKey:", *MEMORY[0x1E0D6BAA0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unitType");

      if (v8)
      {
        if (v8 == 2)
        {
          v5 = -[NSArray count](self->_reminderIntervals, "count");
          if (v5)
          {
            v6 = CFSTR("COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_TICKETS");
            goto LABEL_17;
          }
        }
        else if (v8 == 1)
        {
          v5 = -[NSArray count](self->_reminderIntervals, "count");
          if (v5)
          {
            v6 = CFSTR("COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_RIDES");
            goto LABEL_17;
          }
        }
        else
        {
          v5 = -[NSArray count](self->_reminderIntervals, "count");
          if (v5)
          {
            v6 = CFSTR("COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_NONE");
            goto LABEL_17;
          }
        }
      }
      else
      {
        v5 = -[NSArray count](self->_reminderIntervals, "count");
        if (v5)
        {
          v6 = CFSTR("COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER_COUNT_BASED_UNIT_TRIPS");
          goto LABEL_17;
        }
      }
    }
    else
    {
      v5 = -[NSArray count](self->_reminderIntervals, "count");
      if (v5)
      {
        v6 = CFSTR("COMMUTE_PLAN_DETAILS_REMINDER_SECTION_HEADER");
LABEL_17:
        PKLocalizedPaymentString(&v6->isa);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5;
  BOOL v6;
  void *v8;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) != 1
    || ((v5 = -[PKTransitCommutePlan properties](self->_commutePlan, "properties") & 1, self->_canShowReminders)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        v6))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[NSArray count](self->_reminderIntervals, "count");
    if (v8)
    {
      PKPassLocalizedStringWithFormat();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedDataController, 0);
  objc_storeStrong((id *)&self->_commutePlan, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_timeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_reminderIntervals, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end
