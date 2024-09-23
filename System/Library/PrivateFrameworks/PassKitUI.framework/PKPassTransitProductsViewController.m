@implementation PKPassTransitProductsViewController

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v8;
  if (v10 == v9)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_9;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_9;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v13[3] = &unk_1E3E61388;
  v13[4] = self;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

LABEL_9:
}

void __95__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setDynamicBalances:", *(_QWORD *)(a1 + 40));
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
    v11[2] = __92__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __92__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "updateWithDynamicCommutePlans:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D6A788], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPassTransitProductsViewController;
  -[PKSectionTableViewController dealloc](&v4, sel_dealloc);
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
    v11[2] = __106__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __106__PKPassTransitProductsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setTransitProperties:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_reloadBalance
{
  void *v3;
  NSObject *v4;
  void *v5;
  PKPaymentDataProvider *paymentDataProvider;
  uint64_t v7;
  id v8;
  NSObject *v9;
  PKPaymentDataProvider *v10;
  NSObject *v11;
  PKPaymentDataProvider *v12;
  NSObject *v13;
  _QWORD block[7];
  id v15;
  id location;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  PKPassTransitProductsViewController *v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__42;
  v32[4] = __Block_byref_object_dispose__42;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__42;
  v30[4] = __Block_byref_object_dispose__42;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__42;
  v28[4] = __Block_byref_object_dispose__42;
  v29 = 0;
  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);
  paymentDataProvider = self->_paymentDataProvider;
  v7 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke;
  v23[3] = &unk_1E3E69088;
  v27 = v32;
  v8 = v5;
  v24 = v8;
  v25 = self;
  v9 = v4;
  v26 = v9;
  -[PKPaymentDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v3, v8, v23);
  dispatch_group_enter(v9);
  v10 = self->_paymentDataProvider;
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_2;
  v20[3] = &unk_1E3E690B0;
  v22 = v30;
  v11 = v9;
  v21 = v11;
  -[PKPaymentDataProvider balancesForPaymentPassWithUniqueIdentifier:completion:](v10, "balancesForPaymentPassWithUniqueIdentifier:completion:", v3, v20);
  dispatch_group_enter(v11);
  v12 = self->_paymentDataProvider;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_3;
  v17[3] = &unk_1E3E633C0;
  v19 = v28;
  v13 = v11;
  v18 = v13;
  -[PKPaymentDataProvider plansForPaymentPassWithUniqueIdentifier:completion:](v12, "plansForPaymentPassWithUniqueIdentifier:completion:", v3, v17);
  objc_initWeak(&location, self);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_4;
  block[3] = &unk_1E3E737D0;
  objc_copyWeak(&v15, &location);
  block[4] = v32;
  block[5] = v30;
  block[6] = v28;
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1136));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__PKPassTransitProductsViewController__reloadBalance__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[135], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend(v3[135], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v3[135], "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v3, "_reloadContent");
    WeakRetained = v3;
  }

}

- (void)_handlePassUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPassTransitProductsViewController__handlePassUpdate___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__PKPassTransitProductsViewController__handlePassUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "passTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithPassTypeIdentifier:serialNumber:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setPass:", v6);
}

- (PKPassTransitProductsViewController)initWithPaymentPass:(id)a3 transitType:(unint64_t)a4
{
  id v6;
  PKPassTransitProductsViewController *v7;
  PKPassTransitProductsViewController *v8;
  PKAdjustableSingleCellView *v9;
  uint64_t v10;
  PKAdjustableSingleCellView *sampleSingleCellView;
  PKPaymentDataProvider *v12;
  PKPaymentDataProvider *paymentDataProvider;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassTransitProductsViewController;
  v7 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v8 = v7;
  if (v7)
  {
    -[PKPassTransitProductsViewController setPass:](v7, "setPass:", v6);
    v8->_transitType = a4;
    v9 = [PKAdjustableSingleCellView alloc];
    v10 = -[PKAdjustableSingleCellView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleSingleCellView = v8->_sampleSingleCellView;
    v8->_sampleSingleCellView = (PKAdjustableSingleCellView *)v10;

    v12 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentDataProvider = v8->_paymentDataProvider;
    v8->_paymentDataProvider = v12;

    -[PKPaymentDataProvider addDelegate:](v8->_paymentDataProvider, "addDelegate:", v8);
    if ((-[PKPaymentPass isRemotePass](v8->_pass, "isRemotePass") & 1) == 0)
    {
      -[PKPaymentPass dataAccessor](v8->_pass, "dataAccessor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v8->_remoteDataAccessor, v14);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0D6A788];
        -[PKRemoteDataAccessor library](v8->_remoteDataAccessor, "library");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__handlePassUpdate_, v16, v17);

      }
    }
    -[PKPassTransitProductsViewController navigationItem](v8, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v8;
}

- (void)setPass:(id)a3
{
  PKTransitBalanceModel *v4;
  PKTransitBalanceModel *balanceModel;
  PKPaymentPass *v6;

  v6 = (PKPaymentPass *)a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    self->_pass = v6;
    v4 = (PKTransitBalanceModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v6);
    balanceModel = self->_balanceModel;
    self->_balanceModel = v4;

    -[PKPassTransitProductsViewController _setupPlans](self, "_setupPlans");
    -[PKPassTransitProductsViewController _setupBalances](self, "_setupBalances");
    -[PKPassTransitProductsViewController _reloadBalance](self, "_reloadBalance");
  }

}

- (void)_setupPlans
{
  self->_hasCommutePlans = -[PKTransitBalanceModel hasCommutePlanContent](self->_balanceModel, "hasCommutePlanContent");
}

- (void)_setupBalances
{
  id v3;

  if ((-[PKTransitBalanceModel hasBalanceContent](self->_balanceModel, "hasBalanceContent") & 1) != 0)
  {
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "state");
    self->_hasBalance = PKPaymentApplicationStateIsPersonalized() != 0;

  }
  else
  {
    self->_hasBalance = 0;
  }
}

- (void)_reloadContent
{
  id v2;

  self->_accessibleLayout = 0;
  -[PKPassTransitProductsViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassTransitProductsViewController;
  -[PKSectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKPassTransitProductsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 0);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("TransitPassProductAdjustableView"));
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("TransitPassHeaderIdentifier"));
  -[PKPassTransitProductsViewController _reloadBalance](self, "_reloadBalance");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTransitProductsViewController;
  -[PKPassTransitProductsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPassTransitProductsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassTransitProductsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;
  PKAdjustableSingleCellView *v12;
  PKAdjustableSingleCellView *v13;
  PKAdjustableSingleCellView *sampleSingleCellView;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTransitProductsViewController;
  -[PKPassTransitProductsViewController traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[PKPassTransitProductsViewController traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        objc_msgSend(v4, "preferredContentSizeCategory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)*MEMORY[0x1E0DC4938];

        if (v10 != v11)
        {
          v12 = [PKAdjustableSingleCellView alloc];
          v13 = -[PKAdjustableSingleCellView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          sampleSingleCellView = self->_sampleSingleCellView;
          self->_sampleSingleCellView = v13;

          -[PKPassTransitProductsViewController _reloadContent](self, "_reloadContent");
        }
      }
    }
  }

}

- (id)_renewActionForCommutePlanIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PKTransitBalanceModel displayableCommutePlanActions](self->_balanceModel, "displayableCommutePlanActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_165);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke_2;
  v10[3] = &unk_1E3E6B368;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "pk_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 2
    && objc_msgSend(v2, "isActionAvailable")
    && (objc_msgSend(v2, "unavailableActionBehavior") & 1) == 0;

  return v3;
}

BOOL __76__PKPassTransitProductsViewController__renewActionForCommutePlanIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a2, "associatedPlanIdentifier");
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
      v8 = objc_msgSend(v5, "caseInsensitiveCompare:", v6) == 0;
  }

  return v8;
}

- (id)_topUpActionForIndexPath:(id)a3 balanceIdentifiers:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PKPaymentPass availableActions](self->_pass, "availableActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0D6ACB8];
    v11 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == 1 && objc_msgSend(v5, "containsObject:", v10))
          goto LABEL_19;
        if (objc_msgSend(v13, "featured"))
        {
          objc_msgSend(v13, "associatedEnteredValueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_19;
        }
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke;
        v20[3] = &unk_1E3E63948;
        v20[4] = v13;
        if ((objc_msgSend(v5, "pk_hasObjectPassingTest:", v20) & 1) != 0
          || (v19[0] = v11,
              v19[1] = 3221225472,
              v19[2] = __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke_2,
              v19[3] = &unk_1E3E63948,
              v19[4] = v13,
              objc_msgSend(v5, "pk_hasObjectPassingTest:", v19)))
        {
LABEL_19:
          v17 = v13;
          goto LABEL_21;
        }
        if (objc_msgSend(v13, "type") == 1)
        {
          objc_msgSend(v13, "relevantPropertyIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {

          }
          else
          {
            objc_msgSend(v13, "associatedEnteredValueIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              goto LABEL_19;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v17 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_21:

  return v17;
}

BOOL __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relevantPropertyIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v5 && v4)
      v7 = objc_msgSend(v4, "caseInsensitiveCompare:", v5) == 0;
  }

  return v7;
}

BOOL __83__PKPassTransitProductsViewController__topUpActionForIndexPath_balanceIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "associatedEnteredValueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v5 && v4)
      v7 = objc_msgSend(v4, "caseInsensitiveCompare:", v5) == 0;
  }

  return v7;
}

- (id)_allocView
{
  PKAdjustableSingleCellView *v2;

  v2 = [PKAdjustableSingleCellView alloc];
  return -[PKAdjustableSingleCellView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)_actionHandlerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __66__PKPassTransitProductsViewController__actionHandlerForIndexPath___block_invoke;
  v11 = &unk_1E3E6B3D0;
  objc_copyWeak(&v12, &location);
  v5 = _Block_copy(&v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __66__PKPassTransitProductsViewController__actionHandlerForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  char v9;
  id v10;
  PKPerformActionViewController *v11;
  void *v12;
  PKNavigationController *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "pass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0;
    v9 = objc_msgSend(v8, "canPerformAction:unableReason:displayableError:", v6, &v15, &v14);
    v10 = v14;
    if ((v9 & 1) != 0 || v15 == 2)
    {
      v11 = -[PKPerformActionViewController initWithPass:action:]([PKPerformActionViewController alloc], "initWithPass:action:", v8, v6);
      -[PKPerformActionViewController setDelegate:](v11, "setDelegate:", WeakRetained);
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionViewController setWebService:](v11, "setWebService:", v12);

      v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v11);
      -[PKNavigationController setSupportedInterfaceOrientations:](v13, "setSupportedInterfaceOrientations:", 2);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);

    }
    else
    {
      +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v15, v6, v10, 0);
      v11 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);
    }

  }
}

- (void)_configureView:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t transitType;
  PKPaymentPass *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  PKTransitBalanceModel *balanceModel;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL8 v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;

  v55 = a5;
  v7 = a3;
  v8 = a4;
  -[PKTransitBalanceModel displayableCommutePlans](self->_balanceModel, "displayableCommutePlans");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitBalanceModel displayableBalances](self->_balanceModel, "displayableBalances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  transitType = self->_transitType;
  v12 = self->_pass;
  v13 = objc_msgSend(v8, "row");
  if (transitType >= 3)
  {
    if (transitType != 3)
      goto LABEL_35;
    v22 = v7;
    objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "beginUpdates");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v51 = v23;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v33 = 0;
      v34 = 0;
      v35 = &stru_1E3E7D690;
LABEL_34:
      objc_msgSend(v22, "setTitle:", v34);
      objc_msgSend(v22, "setDetail:", v33);
      objc_msgSend(v22, "setSubDetail:", v35);
      objc_msgSend(v22, "setPass:", v12);
      objc_msgSend(v22, "setEnableDisclosure:", 0);
      objc_msgSend(v22, "setSubDetailColor:", v52);
      objc_msgSend(v22, "endUpdates:", v55);

      goto LABEL_35;
    }
    v54 = v9;
    objc_msgSend(v23, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "label");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v24;
    objc_msgSend(v24, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "properties");
    if ((v26 & 3) == 1)
    {
      objc_msgSend(v23, "formattedDateString");
      v48 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v27 = v23;
      if (!objc_msgSend(v23, "hasExpiredPlanDate"))
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v52;
      v52 = (void *)v28;
    }
    else
    {
      if ((v26 & 4) == 0)
      {
        v48 = &stru_1E3E7D690;
        v27 = v23;
        goto LABEL_25;
      }
      objc_msgSend(v23, "passFieldForKey:", *MEMORY[0x1E0D6BAA0]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v46, "foreignReferenceType") - 1) > 1)
      {
        v48 = &stru_1E3E7D690;
      }
      else
      {
        balanceModel = self->_balanceModel;
        objc_msgSend(v46, "foreignReferenceIdentifiers");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransitBalanceModel balanceForIdentifiers:](balanceModel, "balanceForIdentifiers:", v49);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "formattedValue");
        v43 = objc_claimAutoreleasedReturnValue();

        v48 = &stru_1E3E7D690;
        v25 = (void *)v43;
      }
      v27 = v23;
      v29 = v46;
    }

LABEL_25:
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    v47 = v44;

    v45 = v25;
    objc_msgSend(v27, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassTransitProductsViewController _renewActionForCommutePlanIdentifier:](self, "_renewActionForCommutePlanIdentifier:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassTransitProductsViewController _actionHandlerForIndexPath:](self, "_actionHandlerForIndexPath:", v8);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    if (v39 && v40 && objc_msgSend(v39, "isActionAvailable"))
    {
      v42 = -[PKPaymentPass isSuicaPass](v12, "isSuicaPass")
         && objc_msgSend(v39, "type") == 2
         && -[PKPaymentPass transitCommutePlanType](self->_pass, "transitCommutePlanType") == 1;
      objc_msgSend(v39, "setReverseButtonTitleForLegacySuica:", v42);
      objc_msgSend(v22, "setAction:", v39);
      objc_msgSend(v22, "setActionHandler:", v41);
    }

    v9 = v54;
    v34 = v47;
    v35 = (__CFString *)v48;
    v33 = v45;
    goto LABEL_34;
  }
  v53 = v9;
  v14 = v7;
  objc_msgSend(v14, "beginUpdates");
  objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassTransitProductsViewController _topUpActionForIndexPath:balanceIdentifiers:](self, "_topUpActionForIndexPath:balanceIdentifiers:", v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassTransitProductsViewController _actionHandlerForIndexPath:](self, "_actionHandlerForIndexPath:", v8);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17)
    v20 = v18 == 0;
  else
    v20 = 1;
  if (!v20 && objc_msgSend(v17, "isActionAvailable"))
  {
    objc_msgSend(v14, "setAction:", v17);
    objc_msgSend(v14, "setActionHandler:", v19);
  }
  objc_msgSend(v14, "setEnableDisclosure:", 0);
  objc_msgSend(v15, "localizedTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v14, "setTitle:", v21);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v30);

  }
  objc_msgSend(v15, "formattedValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDetail:", v31);

  objc_msgSend(v14, "setSubDetail:", &stru_1E3E7D690);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSubDetailColor:", v32);

  objc_msgSend(v14, "setPass:", v12);
  objc_msgSend(v14, "endUpdates:", v55);

  v9 = v53;
LABEL_35:

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPassTransitProductsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t transitType;
  PKTransitBalanceModel *balanceModel;
  void *v6;
  int64_t v7;

  transitType = self->_transitType;
  balanceModel = self->_balanceModel;
  if (transitType == 3)
    -[PKTransitBalanceModel displayableCommutePlans](balanceModel, "displayableCommutePlans", a3, a4);
  else
    -[PKTransitBalanceModel displayableBalances](balanceModel, "displayableBalances", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 48.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  PKAdjustableSingleCellView *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = self->_sampleSingleCellView;
  v8 = a3;
  -[PKPassTransitProductsViewController _configureView:indexPath:animated:](self, "_configureView:indexPath:animated:", v7, a4, 0);
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "bounds");
  v14 = v13;

  -[PKAdjustableSingleCellView sizeThatFits:](v7, "sizeThatFits:", v14 - v10 - v12, 1.79769313e308);
  v16 = v15;

  return v16;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  unint64_t transitType;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  -[PKPassTransitProductsViewController tableView](self, "tableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("TransitPassHeaderIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  transitType = self->_transitType;
  if (!transitType)
  {
    PKLocalizedPaymentString(CFSTR("BALANCES_PRODUCT_LIST_HEADER"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (transitType == 3)
  {
    v11 = 0;
    PKPassLocalizedStringWithFormat();
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    objc_msgSend(v6, "setHeaderLabelText:", v8, v11);

  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TransitPassProductAdjustableView"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassTransitProductsViewController _configureCell:inTableView:forIndexPath:](self, "_configureCell:inTableView:forIndexPath:", v8, v7, v6);

  return v8;
}

- (void)_configureCell:(id)a3 inTableView:(id)a4 forIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a5;
  v7 = a3;
  objc_msgSend(v7, "hostedContentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[PKPassTransitProductsViewController _allocView](self, "_allocView");
  -[PKPassTransitProductsViewController _configureView:indexPath:animated:](self, "_configureView:indexPath:animated:", v8, v9, 0);
  objc_msgSend(v7, "setHostedContentView:", v8);

}

- (void)accessibleLayoutForView:(id)a3 changedFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  if (a5 == 2 && self->_accessibleLayout != 2)
  {
    self->_accessibleLayout = 2;
    v9 = v7;
    -[PKPassTransitProductsViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

    v7 = v9;
  }

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

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDataAccessor, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellView, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
}

@end
