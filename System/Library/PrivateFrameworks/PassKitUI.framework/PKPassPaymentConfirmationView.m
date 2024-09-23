@implementation PKPassPaymentConfirmationView

- (PKPassPaymentConfirmationView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPassPaymentConfirmationView *v11;
  PKPassPaymentConfirmationView *v12;
  uint64_t v13;
  PKPaymentService *paymentService;
  NSMutableDictionary *v15;
  NSMutableDictionary *registeredExpressObservers;
  uint64_t v17;
  PKExpressTransactionState *expressState;
  PKExpressTransactionState *v19;
  uint64_t v20;
  PKExpressTransactionState *v21;
  void *v22;
  uint64_t v23;
  PKTransitBalanceModel *transitBalanceModel;
  int v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  PKPaymentService *v30;
  NSObject *v31;
  PKPaymentService *v32;
  NSObject *v33;
  PKPaymentService *v34;
  PKPaymentService *v35;
  NSObject *v36;
  PKPassPaymentPayStateView *v37;
  PKPassPaymentPayStateView *payStateView;
  uint64_t v39;
  PKPassPaymentPayStateView *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  id v47;
  void *v48;
  _QWORD block[8];
  id v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD *v53;
  id v54;
  _QWORD v55[4];
  NSObject *v56;
  _QWORD *v57;
  _QWORD v58[4];
  NSObject *v59;
  _QWORD *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  NSObject *v64;
  _QWORD *v65;
  id location;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  objc_super v75;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v75.receiver = self;
  v75.super_class = (Class)PKPassPaymentConfirmationView;
  v11 = -[PKPassFooterContentView initWithPass:presentationContext:](&v75, sel_initWithPass_presentationContext_, v8, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_passView, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v12);
    paymentService = v12->_paymentService;
    v12->_paymentService = (PKPaymentService *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredExpressObservers = v12->_registeredExpressObservers;
    v12->_registeredExpressObservers = v15;

    v12->_transactionType = objc_msgSend(v10, "standaloneTransactionType");
    -[PKPassPaymentConfirmationView _registerForExpressTransactionNotifications:](v12, "_registerForExpressTransactionNotifications:", 1);
    -[PKPaymentService outstandingExpressTransactionState](v12->_paymentService, "outstandingExpressTransactionState");
    v17 = objc_claimAutoreleasedReturnValue();
    expressState = v12->_expressState;
    v12->_expressState = (PKExpressTransactionState *)v17;

    if (!-[PKPassPaymentConfirmationView _isExpressOutstanding](v12, "_isExpressOutstanding")
      || !-[PKPassPaymentConfirmationView _isRegisteredForAllExpressTransactionNotifications](v12, "_isRegisteredForAllExpressTransactionNotifications"))
    {
      -[PKPassPaymentConfirmationView _registerForExpressTransactionNotifications:](v12, "_registerForExpressTransactionNotifications:", 0);
      v19 = v12->_expressState;
      if (!v19)
      {
        v20 = objc_msgSend(MEMORY[0x1E0D66D60], "create");
        v21 = v12->_expressState;
        v12->_expressState = (PKExpressTransactionState *)v20;

        v19 = v12->_expressState;
      }
      if (-[PKExpressTransactionState isProcessing](v19, "isProcessing"))
        -[PKExpressTransactionState resolve](v12->_expressState, "resolve");
    }
    objc_msgSend(v8, "paymentPass", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v22);
    transitBalanceModel = v12->_transitBalanceModel;
    v12->_transitBalanceModel = (PKTransitBalanceModel *)v23;

    objc_msgSend(v22, "devicePrimaryPaymentApplication");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    v47 = v8;
    if ((unint64_t)(-[PKPassFooterContentView style](v12, "style") - 1) >= 3)
      v25 = objc_msgSend(v22, "isStoredValuePass");
    else
      v25 = 0;
    objc_msgSend(v22, "uniqueID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = __Block_byref_object_copy__51;
    v73[4] = __Block_byref_object_dispose__51;
    v74 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = __Block_byref_object_copy__51;
    v71[4] = __Block_byref_object_dispose__51;
    v72 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__51;
    v69[4] = __Block_byref_object_dispose__51;
    v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy__51;
    v67[4] = __Block_byref_object_dispose__51;
    v68 = 0;
    objc_initWeak(&location, v12);
    v27 = dispatch_group_create();
    v28 = v27;
    v29 = MEMORY[0x1E0C809B0];
    if (v25)
    {
      dispatch_group_enter(v27);
      v30 = v12->_paymentService;
      v61[0] = v29;
      v61[1] = 3221225472;
      v61[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke;
      v61[3] = &unk_1E3E69088;
      v65 = v71;
      v62 = v48;
      v63 = v22;
      v31 = v28;
      v64 = v31;
      -[PKPaymentService transitStateWithPassUniqueIdentifier:paymentApplication:completion:](v30, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v26, v62, v61);
      dispatch_group_enter(v31);
      v32 = v12->_paymentService;
      v58[0] = v29;
      v58[1] = 3221225472;
      v58[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_2;
      v58[3] = &unk_1E3E690B0;
      v60 = v69;
      v33 = v31;
      v59 = v33;
      -[PKPaymentService balancesForPaymentPassWithUniqueIdentifier:completion:](v32, "balancesForPaymentPassWithUniqueIdentifier:completion:", v26, v58);
      dispatch_group_enter(v33);
      v34 = v12->_paymentService;
      v55[0] = v29;
      v55[1] = 3221225472;
      v55[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_3;
      v55[3] = &unk_1E3E633C0;
      v57 = v67;
      v56 = v33;
      -[PKPaymentService plansForPaymentPassWithUniqueIdentifier:completion:](v34, "plansForPaymentPassWithUniqueIdentifier:completion:", v26, v55);

    }
    dispatch_group_enter(v28);
    v35 = v12->_paymentService;
    v51[0] = v29;
    v51[1] = 3221225472;
    v51[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_4;
    v51[3] = &unk_1E3E76530;
    v53 = v73;
    objc_copyWeak(&v54, &location);
    v36 = v28;
    v52 = v36;
    -[PKPaymentService tilesForPassWithUniqueIdentifier:context:completion:](v35, "tilesForPassWithUniqueIdentifier:context:completion:", v26, 1, v51);
    block[0] = v29;
    block[1] = 3221225472;
    block[2] = __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_5;
    block[3] = &unk_1E3E76558;
    objc_copyWeak(&v50, &location);
    block[4] = v71;
    block[5] = v69;
    block[6] = v67;
    block[7] = v73;
    dispatch_group_notify(v36, MEMORY[0x1E0C80D38], block);
    v37 = -[PKPassPaymentPayStateView initWithStyle:]([PKPassPaymentPayStateView alloc], "initWithStyle:", -[PKPassFooterContentView style](v12, "style"));
    payStateView = v12->_payStateView;
    v12->_payStateView = v37;

    v39 = objc_msgSend(v22, "isAccessPass");
    -[PKPassPaymentPayStateView setAccessPass:](v12->_payStateView, "setAccessPass:", v39);
    v40 = v12->_payStateView;
    if ((_DWORD)v39)
      v41 = objc_msgSend(v22, "accessType") == 3;
    else
      v41 = 0;
    -[PKPassPaymentPayStateView setHomeKeyPass:](v40, "setHomeKeyPass:", v41);
    -[PKPassPaymentPayStateView setDelegate:](v12->_payStateView, "setDelegate:", v12);
    -[PKPassPaymentPayStateView setAlpha:](v12->_payStateView, "setAlpha:", 1.0);
    -[PKPassPaymentPayStateView glyph](v12->_payStateView, "glyph");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setState:animated:completionHandler:", 6, 0, 0);

    -[PKPassPaymentConfirmationView addSubview:](v12, "addSubview:", v12->_payStateView);
    -[PKPassFooterContentView bottomRule](v12, "bottomRule");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAlpha:", 0.0);

    -[PKPassFooterContentView setInfoButtonAlpha:](v12, "setInfoButtonAlpha:", 0.0);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
    _Block_object_dispose(v67, 8);

    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(v73, 8);
    v9 = v46;
    v8 = v47;
    v10 = v45;
  }

  return v12;
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_groupTileForTiles:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__PKPassPaymentConfirmationView_initWithPass_passView_context___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[78], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend(v3[78], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v3[78], "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_storeStrong(v3 + 77, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(v3, "_updateContentPrimaryView");
    objc_msgSend(v3, "_updateContentSecondaryView");
    WeakRetained = v3;
  }

}

- (id)_groupTileForTiles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isGroupType") & 1) != 0)
      objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_193);
    else
      objc_msgSend(MEMORY[0x1E0D66F50], "_createDefaultDashboardGroupTileWithChildTiles:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_193);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

BOOL __52__PKPassPaymentConfirmationView__groupTileForTiles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "prearmTiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_reloadTiles
{
  PKPaymentService *paymentService;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  paymentService = self->_paymentService;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke;
  v6[3] = &unk_1E3E665B8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  -[PKPaymentService tilesForPassWithUniqueIdentifier:context:completion:](paymentService, "tilesForPassWithUniqueIdentifier:context:completion:", v5, 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_groupTileForTiles:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke_2;
    v8[3] = &unk_1E3E61388;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __45__PKPassPaymentConfirmationView__reloadTiles__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 616), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
}

- (id)_findOrCreatePrimaryAdjustableSingleCellView
{
  PKPaymentDashboardCellActionHandleable *singleValueCellPrimary;
  PKAdjustableSingleCellView *v4;
  PKPaymentDashboardCellActionHandleable *v5;
  PKPaymentDashboardCellActionHandleable *v6;

  singleValueCellPrimary = self->_singleValueCellPrimary;
  if (!singleValueCellPrimary)
  {
    v4 = [PKAdjustableSingleCellView alloc];
    v5 = -[PKAdjustableSingleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_singleValueCellPrimary;
    self->_singleValueCellPrimary = v5;

    -[PKPaymentDashboardCellActionHandleable setAlpha:](self->_singleValueCellPrimary, "setAlpha:", 0.0);
    -[PKPassPaymentConfirmationView addSubview:](self, "addSubview:", self->_singleValueCellPrimary);
    singleValueCellPrimary = self->_singleValueCellPrimary;
  }
  return singleValueCellPrimary;
}

- (id)_findOrCreatePrimaryFusedDoubleCellView
{
  PKPaymentDashboardCellActionHandleable *dualValueCellPrimary;
  PKFusedDoubleCellView *v4;
  PKPaymentDashboardCellActionHandleable *v5;
  PKPaymentDashboardCellActionHandleable *v6;

  dualValueCellPrimary = self->_dualValueCellPrimary;
  if (!dualValueCellPrimary)
  {
    v4 = [PKFusedDoubleCellView alloc];
    v5 = -[PKFusedDoubleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_dualValueCellPrimary;
    self->_dualValueCellPrimary = v5;

    -[PKPaymentDashboardCellActionHandleable setAlpha:](self->_dualValueCellPrimary, "setAlpha:", 0.0);
    -[PKPassPaymentConfirmationView addSubview:](self, "addSubview:", self->_dualValueCellPrimary);
    dualValueCellPrimary = self->_dualValueCellPrimary;
  }
  return dualValueCellPrimary;
}

- (id)_findOrCreateSecondaryView
{
  PKPaymentDashboardCellActionHandleable *singleValueCellSecondary;
  PKAdjustableSingleCellView *v4;
  PKPaymentDashboardCellActionHandleable *v5;
  PKPaymentDashboardCellActionHandleable *v6;

  singleValueCellSecondary = self->_singleValueCellSecondary;
  if (!singleValueCellSecondary)
  {
    v4 = [PKAdjustableSingleCellView alloc];
    v5 = -[PKAdjustableSingleCellView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_singleValueCellSecondary;
    self->_singleValueCellSecondary = v5;

    -[PKPaymentDashboardCellActionHandleable setAlpha:](self->_singleValueCellSecondary, "setAlpha:", 0.0);
    -[PKPassPaymentConfirmationView addSubview:](self, "addSubview:", self->_singleValueCellSecondary);
    singleValueCellSecondary = self->_singleValueCellSecondary;
  }
  return singleValueCellSecondary;
}

- (BOOL)_shouldDisplayPrimaryView
{
  void *v3;
  char v4;

  if ((unint64_t)(-[PKPassFooterContentView style](self, "style") - 1) >= 3)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isStoredValuePass"))
    {
      v4 = -[PKTransitBalanceModel hasBalanceContent](self->_transitBalanceModel, "hasBalanceContent");

      if ((v4 & 1) != 0)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (BOOL)_canDisplaySecondaryView
{
  return (unint64_t)(-[PKPassFooterContentView style](self, "style") - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldDisplaySecondaryView
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PKPassPaymentConfirmationView _canDisplaySecondaryView](self, "_canDisplaySecondaryView");
  if (v3)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isTransitPass"))
    {
      v5 = -[PKTransitBalanceModel hasCommutePlanContent](self->_transitBalanceModel, "hasCommutePlanContent");

      if ((v5 & 1) != 0)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else
    {

    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_updateContentPrimaryView
{
  uint64_t v3;
  unint64_t v4;
  UIView *v5;
  PKPassTileGroupView *tileGroupView;
  PKPassTileGroupView *v7;
  PKPassTileGroupView *v8;
  UIView *displayedCellPrimary;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  float v14;
  float v15;
  unint64_t v16;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIView *v39;
  _QWORD v40[5];

  if (-[PKTransitBalanceModel hasBalanceContent](self->_transitBalanceModel, "hasBalanceContent"))
  {
    -[PKTransitBalanceModel displayableBalances](self->_transitBalanceModel, "displayableBalances");
    v39 = (UIView *)objc_claimAutoreleasedReturnValue();
    v3 = -[UIView count](v39, "count");
    v4 = v3;
    if (v3 == 1)
    {
      -[PKPassPaymentConfirmationView _findOrCreatePrimaryAdjustableSingleCellView](self, "_findOrCreatePrimaryAdjustableSingleCellView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v3)
      {
LABEL_11:
        -[UIView layer](self->_displayedCellPrimary, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "presentationLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11)
          v11 = v10;
        objc_msgSend(v11, "opacity");
        v15 = v14;

        v16 = v4 - 1;
        if (v4 == 1)
        {
          -[UIView objectAtIndexedSubscript:](v39, "objectAtIndexedSubscript:", 0);
          v17 = (UIView *)objc_claimAutoreleasedReturnValue();
          v18 = self->_displayedCellPrimary;
          -[UIView setAlpha:](v18, "setAlpha:", 1.0);
          -[UIView beginUpdates](v18, "beginUpdates");
          -[UIView setEnableDisclosure:](v18, "setEnableDisclosure:", 0);
          -[PKPassFooterContentView paymentPass](self, "paymentPass");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setPass:](v18, "setPass:", v19);

          -[UIView localizedTitle](v17, "localizedTitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[UIView setTitle:](v18, "setTitle:", v20);
          }
          else
          {
            PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setTitle:](v18, "setTitle:", v23);

          }
          v24 = v15 > 0.0;

          -[UIView formattedValue](v17, "formattedValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setDetail:](v18, "setDetail:", v25);

          -[UIView setSubDetail:](v18, "setSubDetail:", 0);
          v26 = v18;
        }
        else
        {
          if (v4 == 2)
          {
            v17 = self->_displayedCellPrimary;
            -[UIView setAlpha:](v17, "setAlpha:", 1.0);
            -[UIView beginUpdates](v17, "beginUpdates");
            -[UIView objectAtIndexedSubscript:](v39, "objectAtIndexedSubscript:", 0);
            v18 = (UIView *)objc_claimAutoreleasedReturnValue();
            -[UIView localizedTitle](v18, "localizedTitle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              -[UIView setLeftTitle:](v17, "setLeftTitle:", v21);
            }
            else
            {
              PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView setLeftTitle:](v17, "setLeftTitle:", v27);

            }
            -[UIView formattedValue](v18, "formattedValue");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setLeftDetail:](v17, "setLeftDetail:", v28);

            -[UIView setLeftSubDetail:](v17, "setLeftSubDetail:", 0);
            -[UIView objectAtIndexedSubscript:](v39, "objectAtIndexedSubscript:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedTitle");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              -[UIView setRightTitle:](v17, "setRightTitle:", v30);
            }
            else
            {
              PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView setRightTitle:](v17, "setRightTitle:", v31);

            }
            objc_msgSend(v29, "formattedValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setRightDetail:](v17, "setRightDetail:", v32);

            -[UIView setRightSubDetail:](v17, "setRightSubDetail:", 0);
            -[PKPassFooterContentView paymentPass](self, "paymentPass");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setPass:](v17, "setPass:", v33);

            -[UIView setEnableDisclosure:](v17, "setEnableDisclosure:", 0);
            -[UIView endUpdates:](v17, "endUpdates:", v15 > 0.0);

            goto LABEL_33;
          }
          if (v4 < 3)
          {
LABEL_34:
            v13 = v39;
            goto LABEL_35;
          }
          v17 = self->_displayedCellPrimary;
          -[UIView setAlpha:](v17, "setAlpha:", 1.0);
          -[UIView beginUpdates](v17, "beginUpdates");
          -[UIView objectAtIndexedSubscript:](v39, "objectAtIndexedSubscript:", 0);
          v18 = (UIView *)objc_claimAutoreleasedReturnValue();
          -[UIView localizedTitle](v18, "localizedTitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[UIView setLeftTitle:](v17, "setLeftTitle:", v22);
          }
          else
          {
            PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setLeftTitle:](v17, "setLeftTitle:", v34);

          }
          v24 = v15 > 0.0;

          -[UIView formattedValue](v18, "formattedValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setLeftDetail:](v17, "setLeftDetail:", v35);

          -[UIView setLeftSubDetail:](v17, "setLeftSubDetail:", 0);
          PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_OTHER_BALANCES_HEADER"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setRightTitle:](v17, "setRightTitle:", v36);

          PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_MORE_BALANCES_HEADER"), CFSTR("%lu"), v16);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setRightDetail:](v17, "setRightDetail:", v37);

          -[UIView setRightSubDetail:](v17, "setRightSubDetail:", 0);
          -[PKPassFooterContentView paymentPass](self, "paymentPass");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setPass:](v17, "setPass:", v38);

          -[UIView setEnableDisclosure:](v17, "setEnableDisclosure:", 0);
          v26 = v17;
        }
        -[UIView endUpdates:](v26, "endUpdates:", v24);
LABEL_33:

        goto LABEL_34;
      }
      -[PKPassPaymentConfirmationView _findOrCreatePrimaryFusedDoubleCellView](self, "_findOrCreatePrimaryFusedDoubleCellView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    displayedCellPrimary = self->_displayedCellPrimary;
    self->_displayedCellPrimary = v5;

    goto LABEL_11;
  }
  if (!self->_groupTile)
  {
    v13 = self->_displayedCellPrimary;
    self->_displayedCellPrimary = 0;
LABEL_35:

    return;
  }
  tileGroupView = self->_tileGroupView;
  if (!tileGroupView)
  {
    v7 = objc_alloc_init(PKPassTileGroupView);
    v8 = self->_tileGroupView;
    self->_tileGroupView = v7;

    -[PKPassPaymentConfirmationView addSubview:](self, "addSubview:", self->_tileGroupView);
    tileGroupView = self->_tileGroupView;
  }
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __58__PKPassPaymentConfirmationView__updateContentPrimaryView__block_invoke;
  v40[3] = &unk_1E3E612E8;
  v40[4] = self;
  -[PKPassTileGroupView performBatchUpdates:animated:](tileGroupView, "performBatchUpdates:animated:", v40, 1);
  objc_storeStrong((id *)&self->_displayedCellPrimary, self->_tileGroupView);
}

void __58__PKPassPaymentConfirmationView__updateContentPrimaryView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9[8];
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "_canDisplaySecondaryView"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplaySecondaryView"))
      v2 = 1;
    else
      v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[66];
  objc_msgSend(v3, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 488);
  v8 = *(_QWORD *)(v6 + 616);
  v9[0] = 1;
  v10 = v2;
  v11 = 0;
  objc_msgSend(v4, "setPass:passView:groupTile:context:animated:", v5, v7, v8, v9, 0);

}

- (void)_updateContentSecondaryView
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  PKPaymentDashboardCellActionHandleable *v8;
  PKPaymentDashboardCellActionHandleable *singleValueCellSecondary;
  PKPaymentDashboardCellActionHandleable *v10;
  void *v11;
  PKTransitBalanceModel *transitBalanceModel;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  void *v18;
  __CFString *v19;
  id v20;
  id v21;
  char v22;

  if (-[PKTransitBalanceModel hasCommutePlanContent](self->_transitBalanceModel, "hasCommutePlanContent"))
  {
    -[PKPaymentDashboardCellActionHandleable layer](self->_singleValueCellSecondary, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      v4 = v3;
    objc_msgSend(v4, "opacity");
    v7 = v6;

    -[PKPassPaymentConfirmationView _findOrCreateSecondaryView](self, "_findOrCreateSecondaryView");
    v8 = (PKPaymentDashboardCellActionHandleable *)objc_claimAutoreleasedReturnValue();
    singleValueCellSecondary = self->_singleValueCellSecondary;
    self->_singleValueCellSecondary = v8;

    v10 = self->_singleValueCellSecondary;
    -[PKPaymentDashboardCellActionHandleable setAlpha:](v10, "setAlpha:", 1.0);
    -[PKPaymentDashboardCellActionHandleable beginUpdates](v10, "beginUpdates");
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDashboardCellActionHandleable setPass:](v10, "setPass:", v11);
    -[PKPaymentDashboardCellActionHandleable setEnableDisclosure:](v10, "setEnableDisclosure:", 0);
    transitBalanceModel = self->_transitBalanceModel;
    v22 = 0;
    v20 = 0;
    v21 = 0;
    v19 = &stru_1E3E7D690;
    -[PKTransitBalanceModel getDisplayableCommutePlanDetailsForTitle:value:subtitle:isExpired:](transitBalanceModel, "getDisplayableCommutePlanDetailsForTitle:value:subtitle:isExpired:", &v21, &v20, &v19, &v22);
    v13 = v21;
    v14 = v20;
    v15 = v19;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    v16 = v13;

    v17 = v14;
    -[PKPaymentDashboardCellActionHandleable setTitle:](v10, "setTitle:", v16);
    -[PKPaymentDashboardCellActionHandleable setDetail:](v10, "setDetail:", v17);
    -[PKPaymentDashboardCellActionHandleable setSubDetail:](v10, "setSubDetail:", v15);
    if (v22)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDashboardCellActionHandleable setSubDetailColor:](v10, "setSubDetailColor:", v18);

    -[PKPaymentDashboardCellActionHandleable endUpdates:](v10, "endUpdates:", v7 > 0.0);
    -[PKPassPaymentConfirmationView layoutIfNeeded](self, "layoutIfNeeded");
    -[PKPassPaymentConfirmationView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PKPassPaymentConfirmationView _disableActivityTimer](self, "_disableActivityTimer");
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  -[PKPassPaymentConfirmationView _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView dealloc](&v3, sel_dealloc);
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKPassPaymentConfirmationView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double v7;
  UIView *displayedCellPrimary;
  double v9;
  PKPaymentDashboardCellActionHandleable *singleValueCellSecondary;
  UIView *v11;
  CGFloat v12;
  PKPaymentDashboardCellActionHandleable *v13;
  CGFloat v14;
  CGFloat amount;
  CGFloat amounta;
  CGRect slice;
  CGRect remainder;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView layoutSubviews](&v19, sel_layoutSubviews);
  -[PKPassPaymentConfirmationView bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  memset(&slice, 0, sizeof(slice));
  remainder = v20;
  CGRectDivide(v20, &slice, &remainder, 10.0, CGRectMinYEdge);
  if (-[PKPassPaymentConfirmationView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView")
    && !self->_receivedTransaction)
  {
    -[UIView sizeThatFits:](self->_displayedCellPrimary, "sizeThatFits:", width, 1.79769313e308);
    amount = v7;
    displayedCellPrimary = self->_displayedCellPrimary;
    PKSizeAlignedInRect();
    -[UIView pkui_setFrame:animated:](displayedCellPrimary, "pkui_setFrame:animated:", self->_animated);
    CGRectDivide(remainder, &slice, &remainder, amount, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  if (-[PKPassPaymentConfirmationView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView")
    && !self->_receivedTransaction)
  {
    -[PKPaymentDashboardCellActionHandleable sizeThatFits:](self->_singleValueCellSecondary, "sizeThatFits:", width, 1.79769313e308);
    amounta = v9;
    singleValueCellSecondary = self->_singleValueCellSecondary;
    PKSizeAlignedInRect();
    -[PKPaymentDashboardCellActionHandleable pkui_setFrame:animated:](singleValueCellSecondary, "pkui_setFrame:animated:", self->_animated);
    CGRectDivide(remainder, &slice, &remainder, amounta, CGRectMinYEdge);
  }
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  CGRectDivide(v21, &slice, &remainder, 10.0, CGRectMinYEdge);
  if (-[PKPassPaymentConfirmationView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView"))
  {
    v11 = self->_displayedCellPrimary;
    if (v11)
    {
      -[UIView frame](v11, "frame");
      CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  if (-[PKPassPaymentConfirmationView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView"))
  {
    v13 = self->_singleValueCellSecondary;
    if (v13)
    {
      -[PKPaymentDashboardCellActionHandleable frame](v13, "frame");
      CGRectDivide(remainder, &slice, &remainder, v14, CGRectMinYEdge);
    }
  }
  -[UIView pkui_setFrame:animated:](self->_payStateView, "pkui_setFrame:animated:", self->_animated, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
  NSDate *v4;
  NSDate *visibleDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView willBecomeVisibleAnimated:](&v6, sel_willBecomeVisibleAnimated_, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  visibleDate = self->_visibleDate;
  self->_visibleDate = v4;

}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
  void *v4;
  PKExpressTransactionState *expressState;
  PKExpressTransactionState *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView didBecomeVisibleAnimated:](&v8, sel_didBecomeVisibleAnimated_, a3);
  self->_needsResolution = 1;
  if (!-[PKPassPaymentConfirmationView _isExpressOutstanding](self, "_isExpressOutstanding"))
    goto LABEL_9;
  -[PKPaymentService outstandingExpressTransactionState](self->_paymentService, "outstandingExpressTransactionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  expressState = self->_expressState;
  if (!v4)
    goto LABEL_5;
  if ((-[PKExpressTransactionState mergeState:](expressState, "mergeState:", v4) & 1) == 0)
  {
    expressState = self->_expressState;
LABEL_5:
    -[PKExpressTransactionState resolve](expressState, "resolve");
  }
  if (!-[PKPassPaymentConfirmationView _isExpressOutstanding](self, "_isExpressOutstanding"))
    -[PKPassPaymentConfirmationView _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);

LABEL_9:
  v6 = self->_expressState;
  if (v6 && !-[PKExpressTransactionState status](v6, "status"))
    -[PKPassPaymentPayStateView setState:animated:withCompletionHandler:](self->_payStateView, "setState:animated:withCompletionHandler:", 7, 1, 0);
  else
    -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PKPassPaymentConfirmationView_didBecomeVisibleAnimated___block_invoke;
  v7[3] = &unk_1E3E612E8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v7, 0);
}

uint64_t __58__PKPassPaymentConfirmationView_didBecomeVisibleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setLabelAlpha:", 1.0);
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView willBecomeHiddenAnimated:](&v4, sel_willBecomeHiddenAnimated_, a3);
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentConfirmationView;
  -[PKPassFooterContentView didBecomeHiddenAnimated:](&v3, sel_didBecomeHiddenAnimated_, a3);
}

- (void)_presentCheckmarkIfNecessary
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKPassPaymentPayStateView *payStateView;
  _QWORD v13[4];
  id v14[2];
  id location;

  if (self->_needsResolution)
  {
    v3 = -[PKExpressTransactionState status](self->_expressState, "status");
    v4 = v3 == 1;
    if (self->_showingResolution)
    {
      if (v3 != 1 || self->_showingSuccessResolution)
      {
        if (!-[PKPassPaymentConfirmationView _isExpressOutstanding](self, "_isExpressOutstanding"))
          -[PKPassPaymentConfirmationView _beginResolution](self, "_beginResolution");
        return;
      }
      v5 = (void *)(self->_resolutionCounter + 1);
      self->_resolutionCounter = (unint64_t)v5;
      self->_showingResolution = 1;
      self->_showingSuccessResolution = v4;
      self->_animatingResolution = 1;
      v6 = 8;
LABEL_13:
      v8 = -[PKExpressTransactionState standaloneTransactionType](self->_expressState, "standaloneTransactionType");
      if (v8 == 2)
      {
        v9 = CFSTR("TRANSACTION_UNLOCKED");
      }
      else
      {
        if (v8 != 1)
        {
LABEL_16:
          v10 = 0;
LABEL_22:
          objc_initWeak(&location, self);
          payStateView = self->_payStateView;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __61__PKPassPaymentConfirmationView__presentCheckmarkIfNecessary__block_invoke;
          v13[3] = &unk_1E3E757B0;
          objc_copyWeak(v14, &location);
          v14[1] = v5;
          -[PKPassPaymentPayStateView setState:animated:withOverrideText:preserveGlyphState:completionHandler:](payStateView, "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", v6, 1, v10, 0, v13);
          objc_destroyWeak(v14);
          objc_destroyWeak(&location);

          return;
        }
        v9 = CFSTR("TRANSACTION_LOCKED");
      }
      PKLocalizedCredentialString(&v9->isa);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)(self->_resolutionCounter + 1);
      self->_resolutionCounter = (unint64_t)v5;
      self->_showingResolution = 1;
      self->_showingSuccessResolution = v4;
      self->_animatingResolution = 1;
      if (v3 == 1)
        v6 = 8;
      else
        v6 = 9;
      switch(v3)
      {
        case 0:
        case 2:
          v7 = CFSTR("PAYMENT_TRY_AGAIN");
          break;
        case 1:
          goto LABEL_13;
        case 3:
          v7 = CFSTR("PAYMENT_TRY_WITH_DIFFERENT_CARD");
          break;
        default:
          goto LABEL_16;
      }
      PKLocalizedPaymentString(&v7->isa);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v11;
    goto LABEL_22;
  }
}

void __61__PKPassPaymentConfirmationView__presentCheckmarkIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 73) == *(_QWORD *)(a1 + 40))
    {
      *((_BYTE *)WeakRetained + 565) = 0;
      v5 = WeakRetained;
      v4 = objc_msgSend(WeakRetained, "_isExpressOutstanding");
      v3 = v5;
      if ((v4 & 1) == 0)
      {
        objc_msgSend(v5, "_beginResolution");
        v3 = v5;
      }
    }
  }

}

- (void)_disableActivityTimer
{
  NSObject *activityResolutionTimer;
  OS_dispatch_source *v4;

  activityResolutionTimer = self->_activityResolutionTimer;
  if (activityResolutionTimer)
  {
    dispatch_source_cancel(activityResolutionTimer);
    v4 = self->_activityResolutionTimer;
    self->_activityResolutionTimer = 0;

  }
}

- (void)_beginResolution
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (!self->_animatingResolution && self->_needsResolution && !self->_showingAlert)
  {
    if (!self->_showingSuccessResolution
      && -[PKExpressTransactionState status](self->_expressState, "status") == 3
      && (-[PKPassFooterContentView pass](self, "pass"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "paymentPass"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isTransitPass"),
          v4,
          v3,
          v5))
    {
      -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        self->_showingAlert = 1;
        -[PKPassPaymentConfirmationView _disableActivityTimer](self, "_disableActivityTimer");
        PKLocalizedPaymentString(CFSTR("PAYMENT_ALERT_INCOMPATIBLE_TRANSIT_TITLE"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("PAYMENT_ALERT_INCOMPATIBLE_TRANSIT_MESSAGE"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("PAYMENT_ALERT_INCOMPATIBLE_TRANSIT_OK"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __49__PKPassPaymentConfirmationView__beginResolution__block_invoke;
        v16 = &unk_1E3E63F88;
        objc_copyWeak(&v17, &location);
        objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, &v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAction:", v12, v13, v14, v15, v16);

        objc_msgSend(v6, "presentViewController:animated:completion:", v9, 1, 0);
        objc_destroyWeak(&v17);

        objc_destroyWeak(&location);
      }
      else
      {
        -[PKPassPaymentConfirmationView _resolveActivityIfNecessaryWithDelay](self, "_resolveActivityIfNecessaryWithDelay");
      }

    }
    else
    {
      -[PKPassPaymentConfirmationView _resolveActivityIfNecessaryWithDelay](self, "_resolveActivityIfNecessaryWithDelay");
    }
  }
}

void __49__PKPassPaymentConfirmationView__beginResolution__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resolveActivityIfNecessary");
    WeakRetained = v2;
  }

}

- (void)_resolveActivityIfNecessaryWithDelay
{
  double v3;
  double v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *activityResolutionTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!self->_animatingResolution && self->_needsResolution && !self->_showingAlert)
  {
    -[PKPassPaymentConfirmationView _disableActivityTimer](self, "_disableActivityTimer");
    objc_initWeak(&location, self);
    if (self->_receivedTransaction)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "defaultDuration");
      v4 = v3 + 0.35;
    }
    else if (self->_receivedExit)
    {
      v4 = 1.0;
    }
    else
    {
      v4 = 0.5;
    }
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    activityResolutionTimer = self->_activityResolutionTimer;
    self->_activityResolutionTimer = v5;

    v7 = self->_activityResolutionTimer;
    v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v9 = self->_activityResolutionTimer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKPassPaymentConfirmationView__resolveActivityIfNecessaryWithDelay__block_invoke;
    v10[3] = &unk_1E3E61310;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_activityResolutionTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __69__PKPassPaymentConfirmationView__resolveActivityIfNecessaryWithDelay__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject **v5;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[72];
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[72];
      v5[72] = 0;

      v2 = v5;
    }
    objc_msgSend(v2, "_resolveActivityIfNecessary");
    v2 = v5;
  }

}

- (void)_resolveActivityIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsResolution)
  {
    -[PKPassFooterContentView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPassFooterContentViewInGroup:", self);

    self->_needsResolution = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D6AD00];
    v9 = *MEMORY[0x1E0D6AD08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, self, v8);

  }
}

- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4
{
  id v5;
  void *v6;
  SystemSoundID v7;

  v5 = a3;
  kdebug_trace();
  -[PKPassFooterContentView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passFooterContentViewDidTransact:success:", self, 1);

  LODWORD(self) = objc_msgSend(v5, "accessPass");
  if ((_DWORD)self)
    v7 = 1163;
  else
    v7 = 1394;
  AudioServicesPlaySystemSound(v7);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPassPaymentConfirmationView *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentConfirmationView_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__PKPassPaymentConfirmationView_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  BOOL v4;
  double v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "transactionDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "_isExpressOutstanding");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0 || *(_BYTE *)(v3 + 561))
  {
    if (*(_QWORD *)(v3 + 592))
      v4 = v8 == 0;
    else
      v4 = 1;
    if (!v4)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:");
      if (v5 <= -10.0)
        goto LABEL_11;
      v3 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend((id)v3, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasDeviceTransactionSourceIdentifier:", *(_QWORD *)(a1 + 48));

    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 560) = 1;
      objc_msgSend(*(id *)(a1 + 40), "_updateContentPrimaryView");
      objc_msgSend(*(id *)(a1 + 40), "_updateContentSecondaryView");
    }
  }
LABEL_11:

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setTransitProperties:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      if (!v12 || !v11)
      {

        goto LABEL_10;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_10;
    }
    -[PKPassPaymentConfirmationView _groupTileForTiles:](self, "_groupTileForTiles:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__PKPassPaymentConfirmationView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    v17[3] = &unk_1E3E61388;
    v17[4] = self;
    v18 = v15;
    v16 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
LABEL_10:

}

uint64_t __84__PKPassPaymentConfirmationView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 616), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setDynamicBalances:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PKPassPaymentConfirmationView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateWithDynamicCommutePlans:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
  }
}

- (id)_expressNotificationNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D69E20];
  v6[0] = *MEMORY[0x1E0D69E18];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0D69E08];
  v6[2] = *MEMORY[0x1E0D69E00];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0D69DF8];
  v6[4] = *MEMORY[0x1E0D69E10];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isRegisteredForAllExpressTransactionNotifications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPassPaymentConfirmationView _expressNotificationNames](self, "_expressNotificationNames", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredExpressObservers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_isRegisteredForAnyExpressTransactionNotifications
{
  return -[NSMutableDictionary count](self->_registeredExpressObservers, "count") != 0;
}

- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredExpressObservers, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredExpressObservers, "setObject:forKeyedSubscript:", v10, v11);
  }

}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  id location;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!-[PKPassPaymentConfirmationView _isRegisteredForAllExpressTransactionNotifications](self, "_isRegisteredForAllExpressTransactionNotifications"))
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke;
      aBlock[3] = &unk_1E3E719D8;
      objc_copyWeak(&v26, &location);
      v4 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PKPassPaymentConfirmationView _expressNotificationNames](self, "_expressNotificationNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(v6);
            -[PKPassPaymentConfirmationView _registerObserverForNotificationName:center:handler:](self, "_registerObserverForNotificationName:center:handler:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v5, v4);
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v7);
      }

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
  else if (-[PKPassPaymentConfirmationView _isRegisteredForAnyExpressTransactionNotifications](self, "_isRegisteredForAnyExpressTransactionNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PKPassPaymentConfirmationView _expressNotificationNames](self, "_expressNotificationNames", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredExpressObservers, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "removeObserver:", v16);
            -[NSMutableDictionary removeObjectForKey:](self->_registeredExpressObservers, "removeObjectForKey:", v15);
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
      }
      while (v12);
    }

  }
}

void __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __77__PKPassPaymentConfirmationView__registerForExpressTransactionNotifications___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleExpressNotification:", *(_QWORD *)(a1 + 32));

}

- (void)_handleExpressNotification:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  PKPassPaymentPayStateView *payStateView;
  const __CFString *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = -[PKExpressTransactionState isProcessing](self->_expressState, "isProcessing");
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKEqualObjects())
    {
      -[PKExpressTransactionState receiveEvents:](self->_expressState, "receiveEvents:", 1);
      payStateView = self->_payStateView;
      v8 = CFSTR("Express started");
    }
    else
    {
      if (!PKEqualObjects())
      {
        if (PKEqualObjects())
        {
          -[PKExpressTransactionState receiveEvents:](self->_expressState, "receiveEvents:", 256);
          -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
          payStateView = self->_payStateView;
          v8 = CFSTR("Express ended: failure");
        }
        else
        {
          if (!PKEqualObjects())
          {
            if (PKEqualObjects())
            {
              -[PKExpressTransactionState receiveEvents:](self->_expressState, "receiveEvents:", 4);
              -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
              payStateView = self->_payStateView;
              v8 = CFSTR("Express ended");
            }
            else
            {
              if (!PKEqualObjects())
                goto LABEL_8;
              -[PKPassPaymentConfirmationView _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);
              -[PKExpressTransactionState resolve](self->_expressState, "resolve");
              self->_receivedExit = 1;
              -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
              payStateView = self->_payStateView;
              v8 = CFSTR("Express exited");
            }
            goto LABEL_6;
          }
          -[PKExpressTransactionState receiveEvents:](self->_expressState, "receiveEvents:", 512);
          -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
          payStateView = self->_payStateView;
          v8 = CFSTR("Express ended: incompatible");
        }
        v9 = 1;
        goto LABEL_7;
      }
      -[PKExpressTransactionState receiveEvents:](self->_expressState, "receiveEvents:", 2);
      -[PKPassPaymentConfirmationView _presentCheckmarkIfNecessary](self, "_presentCheckmarkIfNecessary");
      payStateView = self->_payStateView;
      v8 = CFSTR("Express timeout");
    }
LABEL_6:
    v9 = 0;
LABEL_7:
    -[PKPassPaymentPayStateView updateDebugLabel:isErrorState:](payStateView, "updateDebugLabel:isErrorState:", v8, v9);
LABEL_8:

    v5 = v10;
  }

}

- (BOOL)_isExpressOutstanding
{
  PKExpressTransactionState *expressState;

  expressState = self->_expressState;
  if (expressState)
    LOBYTE(expressState) = -[PKExpressTransactionState isProcessing](expressState, "isProcessing");
  return (char)expressState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_registeredExpressObservers, 0);
  objc_storeStrong((id *)&self->_visibleDate, 0);
  objc_storeStrong((id *)&self->_activityResolutionTimer, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_displayedCellPrimary, 0);
  objc_storeStrong((id *)&self->_tileGroupView, 0);
  objc_storeStrong((id *)&self->_dualValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_singleValueCellSecondary, 0);
  objc_storeStrong((id *)&self->_singleValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_payStateView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
