@implementation PKExpressPassesViewController

- (PKExpressPassesViewController)initWithPaymentDataProvider:(id)a3 controller:(id)a4 style:(int64_t)a5
{
  id v9;
  id v10;
  PKExpressPassesViewController *v11;
  PKExpressPassesViewController *v12;
  id *p_expressPassController;
  NSMutableDictionary *v14;
  NSMutableDictionary *passUniqueIDToCell;
  NSMutableDictionary *v16;
  NSMutableDictionary *passUniqueIDToTransitBalanceModels;
  BOOL userAutomaticExpressModeText;
  uint64_t v19;
  PKPassSnapshotter *passSnapshotter;
  __CFString *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKExpressPassesViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v25, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v12 = v11;
  if (v11)
  {
    p_expressPassController = (id *)&v11->_expressPassController;
    objc_storeStrong((id *)&v11->_expressPassController, a4);
    objc_storeStrong((id *)&v12->_paymentDataProvider, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentDataProvider addDelegate:](v12->_paymentDataProvider, "addDelegate:", v12);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    passUniqueIDToCell = v12->_passUniqueIDToCell;
    v12->_passUniqueIDToCell = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    passUniqueIDToTransitBalanceModels = v12->_passUniqueIDToTransitBalanceModels;
    v12->_passUniqueIDToTransitBalanceModels = v16;

    v12->_style = a5;
    userAutomaticExpressModeText = 1;
    v12->_isUserInteractionsEnabled = 1;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    passSnapshotter = v12->_passSnapshotter;
    v12->_passSnapshotter = (PKPassSnapshotter *)v19;

    v12->_userAutomaticExpressModeText = objc_msgSend(*p_expressPassController, "deviceUsesAutomaticAuthorization");
    if (objc_msgSend(*p_expressPassController, "apiVersion"))
      userAutomaticExpressModeText = v12->_userAutomaticExpressModeText;
    v12->_useOldAppearance = userAutomaticExpressModeText;
    objc_msgSend(*p_expressPassController, "setPresentingViewController:", v12);
    if (v12->_userAutomaticExpressModeText)
      v21 = CFSTR("SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE");
    else
      v21 = CFSTR("SETTINGS_EXPRESS_TRANSIT_PICKER_TITLE");
    PKLocalizedPaymentString(&v21->isa);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpressPassesViewController navigationItem](v12, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v22);

  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExpressPassesViewController;
  -[PKExpressPassesViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (self->_style == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v4, self);

  }
}

- (id)_passWithUniqueIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_allPasses;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKExpressPassesViewController;
  -[PKExpressPassesViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKExpressPassesViewController _invalidateUserAuth](self, "_invalidateUserAuth");
}

- (void)dealloc
{
  objc_super v3;

  -[PKExpressPassesViewController _invalidateUserAuth](self, "_invalidateUserAuth");
  v3.receiver = self;
  v3.super_class = (Class)PKExpressPassesViewController;
  -[PKSectionTableViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  uint64_t v4;

  if (a3)
  {
    LOBYTE(v4) = a3 == 1 && -[NSMutableArray count](self->_paymentPasses, "count") != 0;
  }
  else
  {
    v4 = -[NSMutableArray count](self->_transitPasses, "count");
    if (v4)
      LOBYTE(v4) = !self->_useOldAppearance;
  }
  return v4;
}

- (void)setPasses:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_supressHandlingPassUpdates)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_passes, a3);
    -[PKExpressPassesViewController _reloadLocalPassStores](self, "_reloadLocalPassStores");
    -[PKSectionTableViewController reloadData](self, "reloadData");
    v5 = v6;
  }

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  PKExpressPassesViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __86__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    if (*(_QWORD *)(result + 40))
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:", 0, 0);
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  PKExpressPassesViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __100__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    if (*(_QWORD *)(result + 40))
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:", 0);
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  PKExpressPassesViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__PKExpressPassesViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    if (*(_QWORD *)(result + 40))
      return objc_msgSend(*(id *)(result + 48), "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPassWithUniqueIdentifier:");
  }
  return result;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPassWithUniqueIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *transitPasses;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  transitPasses = self->_transitPasses;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __130__PKExpressPassesViewController__updateBalancesWithServerBalances_transitPassProperties_commutePlans_forPassWithUniqueIdentifier___block_invoke;
  v18[3] = &unk_1E3E68CF0;
  v14 = v12;
  v19 = v14;
  v15 = -[NSMutableArray indexOfObjectPassingTest:](transitPasses, "indexOfObjectPassingTest:", v18);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_transitPasses, "objectAtIndex:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpressPassesViewController _updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPass:](self, "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPass:", v17, v10, v11, v16);

  }
}

uint64_t __130__PKExpressPassesViewController__updateBalancesWithServerBalances_transitPassProperties_commutePlans_forPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 commutePlans:(id)a5 forPass:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_passUniqueIDToTransitBalanceModels, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v12);
  if (v16)
    objc_msgSend(v14, "setDynamicBalances:", v16);
  if (v10)
    objc_msgSend(v14, "setTransitProperties:", v10);
  if (v11)
    objc_msgSend(v14, "updateWithDynamicCommutePlans:", v11);
  -[NSMutableDictionary setObject:forKey:](self->_passUniqueIDToTransitBalanceModels, "setObject:forKey:", v14, v13);
  -[NSMutableDictionary objectForKey:](self->_passUniqueIDToCell, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTransitBalanceModel:", v14);

}

- (void)paymentPreferenceCardCell:(id)a3 didChangeSwitchState:(BOOL)a4
{
  -[PKExpressPassesViewController _userSetExpressTransitCardToEnabled:cell:](self, "_userSetExpressTransitCardToEnabled:cell:", a4, a3);
}

- (void)_userChangedExpressSettingForPaymentPassAtIndexPath:(id)a3
{
  id v4;
  void *selectedPaymentPassIndex;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  PKExpressPassesViewController *v19;
  id v20[2];
  unsigned int v21;
  _QWORD v22[5];
  id v23;
  unsigned int v24;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  selectedPaymentPassIndex = (void *)self->_selectedPaymentPassIndex;
  v6 = objc_msgSend(v4, "row");
  v7 = v6;
  if (v6 != self->_selectedPaymentPassIndex)
  {
    self->_selectedPaymentPassIndex = v6;
    -[PKExpressPassesViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", selectedPaymentPassIndex, objc_msgSend(v4, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKExpressPassesViewController _configureAccessoryViewForPaymentCardCell:row:](self, "_configureAccessoryViewForPaymentCardCell:row:", v10, selectedPaymentPassIndex);
    objc_msgSend(v8, "cellForRowAtIndexPath:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpressPassesViewController _configureAccessoryViewForPaymentCardCell:row:](self, "_configureAccessoryViewForPaymentCardCell:row:", v11, objc_msgSend(v4, "row"));
    objc_msgSend(v11, "setActivityIndicatorActive:", 1);
    -[PKExpressPassesViewController _setUserInteractionsEnabled:](self, "_setUserInteractionsEnabled:", 0);
    v12 = -[PKExpressPassesViewController _beginPassUpdateSuppression](self, "_beginPassUpdateSuppression");
    v13 = self->_selectedPaymentPassIndex;
    if (v13 == -[NSMutableArray count](self->_paymentPasses, "count"))
    {
      -[PKExpressPassesViewController _paymentPassForIndex:](self, "_paymentPassForIndex:", selectedPaymentPassIndex);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke;
      v22[3] = &unk_1E3E68D18;
      objc_copyWeak(&v23, &location);
      v22[4] = self;
      v24 = v12;
      -[PKExpressPassesViewController _disableExpressModeForPass:withCompletion:](self, "_disableExpressModeForPass:withCompletion:", v14, v22);
      objc_destroyWeak(&v23);

    }
    else
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke_2;
      aBlock[3] = &unk_1E3E68D40;
      objc_copyWeak(v20, &location);
      v20[1] = selectedPaymentPassIndex;
      v18 = v4;
      v19 = self;
      v21 = v12;
      v15 = _Block_copy(aBlock);
      -[PKExpressPassesViewController _paymentPassForIndex:](self, "_paymentPassForIndex:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v16))
      {
        self->_selectedPaymentPassIsInPendingState = 1;
        -[PKExpressPassesViewController _upgradeExpressModeForPass:withCompletion:](self, "_upgradeExpressModeForPass:withCompletion:", v16, v15);
      }
      else
      {
        -[PKExpressPassesViewController _enableExpressModeForPass:withCompletion:](self, "_enableExpressModeForPass:withCompletion:", v16, v15);
      }

      objc_destroyWeak(v20);
    }

  }
  objc_destroyWeak(&location);

}

void __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateExpressState:", v5);
    objc_msgSend(v4, "_updateUIWithExpressState");
    objc_msgSend(v4, "_sendExpressPassDidChangeNotification");
    objc_msgSend(v4, "_setUserInteractionsEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_endPassUpdateSuppressionWithToken:delay:", *(unsigned int *)(a1 + 48), 0.5);
  }

}

void __85__PKExpressPassesViewController__userChangedExpressSettingForPaymentPassAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1168) = 0;
    if (v9)
    {
      objc_msgSend(WeakRetained, "_updateExpressState:");
      objc_msgSend(v4, "_updateUIWithExpressState");
      objc_msgSend(v4, "_sendExpressPassDidChangeNotification");
    }
    else
    {
      *((_QWORD *)WeakRetained + 144) = *(_QWORD *)(a1 + 56);
      if (objc_msgSend(WeakRetained, "isSectionMapped:", 1))
      {
        objc_msgSend(v4, "tableView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setActivityIndicatorActive:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_configureAccessoryViewForPaymentCardCell:row:", v6, objc_msgSend(*(id *)(a1 + 32), "row"));
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 56), objc_msgSend(v4, "indexForSection:", 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cellForRowAtIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setActivityIndicatorActive:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_configureAccessoryViewForPaymentCardCell:row:", v8, *(_QWORD *)(a1 + 56));

      }
    }
    objc_msgSend(v4, "_setUserInteractionsEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_endPassUpdateSuppressionWithToken:delay:", *(unsigned int *)(a1 + 64), 0.5);
  }

}

- (void)_userSetExpressTransitCardToEnabled:(BOOL)a3 cell:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  PKExpressPassesViewController *v13;
  id v14;
  unsigned int v15;
  id location;

  v6 = a4;
  objc_msgSend(v6, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpressPassesViewController _setUserInteractionsEnabled:](self, "_setUserInteractionsEnabled:", 0);
  objc_msgSend(v6, "setAccessoryType:", 0);
  objc_msgSend(v6, "setActivityIndicatorActive:", 1);
  objc_initWeak(&location, self);
  v8 = -[PKExpressPassesViewController _beginPassUpdateSuppression](self, "_beginPassUpdateSuppression");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKExpressPassesViewController__userSetExpressTransitCardToEnabled_cell___block_invoke;
  aBlock[3] = &unk_1E3E68D68;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v13 = self;
  v15 = v8;
  v10 = _Block_copy(aBlock);
  if (a3)
    -[PKExpressPassesViewController _enableExpressModeForPass:withCompletion:](self, "_enableExpressModeForPass:withCompletion:", v7, v10);
  else
    -[PKExpressPassesViewController _disableExpressModeForPass:withCompletion:](self, "_disableExpressModeForPass:withCompletion:", v7, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __74__PKExpressPassesViewController__userSetExpressTransitCardToEnabled_cell___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setUserInteractionsEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorActive:", 0);
    if (v3)
    {
      objc_msgSend(v5, "_transitUpdateWithState:", v3);
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "_endPassUpdateSuppressionWithToken:delay:", *(unsigned int *)(a1 + 56), 0.5);
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isSectionMapped:", 0) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "actionSwitch");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOn:animated:", 0, 1);

      goto LABEL_6;
    }
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to update express pass UI", v8, 2u);
    }

  }
LABEL_7:

}

- (void)_userChangedExpressTransitToNone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PKExpressPassController *expressPassController;
  _QWORD v14[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_selectedTransitPassIndices, "count"))
  {
    -[PKExpressPassesViewController _setUserInteractionsEnabled:](self, "_setUserInteractionsEnabled:", 0);
    -[PKExpressPassesViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[NSMutableArray count](self->_transitPasses, "count"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAccessoryType:", 0);
    objc_msgSend(v5, "setActivityIndicatorActive:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_selectedTransitPassIndices;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          -[NSMutableArray objectAtIndex:](self->_transitPasses, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "unsignedIntegerValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniqueID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_initWeak(&location, self);
    expressPassController = self->_expressPassController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke;
    v14[3] = &unk_1E3E62B38;
    objc_copyWeak(&v15, &location);
    -[PKExpressPassController disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:](expressPassController, "disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:", v6, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __65__PKExpressPassesViewController__userChangedExpressTransitToNone__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_setUserInteractionsEnabled:", 1);
    objc_msgSend(v7, "_transformState:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(v7[137], "enabledExpressPasses");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    objc_msgSend(v7, "_transitUpdateWithState:", v6);
    WeakRetained = v7;
  }

}

- (void)_upgradeExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *selectedPaymentPassIndex;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20[2];
  _QWORD v21[4];
  id v22;
  PKExpressPassesViewController *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27[2];
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[6];
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    selectedPaymentPassIndex = (void *)self->_selectedPaymentPassIndex;
    objc_initWeak(location, self);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__12;
    v37[4] = __Block_byref_object_dispose__12;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__12;
    v35[4] = __Block_byref_object_dispose__12;
    v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__12;
    v33[4] = __Block_byref_object_dispose__12;
    v34 = 0;
    v9 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke;
    v32[3] = &unk_1E3E64F70;
    v32[4] = self;
    v32[5] = v33;
    objc_msgSend(v9, "addOperation:", v32);
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_41;
    v28[3] = &unk_1E3E68DE0;
    objc_copyWeak(&v31, location);
    v28[4] = self;
    v11 = v6;
    v29 = v11;
    v30 = v35;
    objc_msgSend(v9, "addOperation:", v28);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_43;
    v21[3] = &unk_1E3E68E58;
    objc_copyWeak(v27, location);
    v12 = v11;
    v22 = v12;
    v23 = self;
    v24 = v35;
    v25 = v33;
    v27[1] = selectedPaymentPassIndex;
    v26 = v37;
    objc_msgSend(v9, "addOperation:", v21);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_4;
    v15[3] = &unk_1E3E68E80;
    objc_copyWeak(v20, location);
    v17 = v7;
    v18 = v37;
    v20[1] = selectedPaymentPassIndex;
    v16 = v12;
    v19 = v33;
    v14 = (id)objc_msgSend(v9, "evaluateWithInput:completion:", v13, v15);

    objc_destroyWeak(v20);
    objc_destroyWeak(v27);

    objc_destroyWeak(&v31);
    _Block_object_dispose(v33, 8);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

    objc_destroyWeak(location);
  }

}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128))
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2;
    v12[3] = &unk_1E3E68D90;
    v15 = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v13 = v6;
    v11 = v12;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E3E61590;
    v17 = v11;
    dispatch_async(v9, block);

  }
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  char IsEnabled;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;
  uint8_t buf[16];

  IsEnabled = PKNearFieldRadioIsEnabled();
  if ((IsEnabled & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Cannot upgrade express mode while NFC radio is disabled", buf, 2u);
    }

    v4 = PKCreateAlertControllerForNFCRadioDisabled();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_39;
  block[3] = &unk_1E3E668F0;
  v9 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v10 = IsEnabled;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 48) == 0);
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_41(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  id WeakRetained;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, id, _QWORD);
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3;
      v14[3] = &unk_1E3E68DB8;
      objc_copyWeak(&v18, (id *)(a1 + 56));
      v16 = v9;
      v12 = v8;
      v13 = *(_QWORD *)(a1 + 48);
      v15 = v12;
      v17 = v13;
      objc_msgSend(WeakRetained, "_acquireUserAuthForPass:withCompletion:", v11, v14);

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }

}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id WeakRetained;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (!v6 || v7)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error getting auth for express mode change: %@", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_9:
  v9();

}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  int8x16_t v20;
  _QWORD v21[4];
  id v22;
  int8x16_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[144];
    PKLocalizedTransitString(CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_UPDATING_CARD"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_updatePaymentCardCellWithIndex:statusString:", v12, v13);

    v14 = (void *)v11[137];
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_46;
    v21[3] = &unk_1E3E68E30;
    objc_copyWeak(v27, (id *)(a1 + 72));
    v24 = v9;
    v17 = v8;
    v27[1] = *(id *)(a1 + 80);
    v18 = *(_QWORD *)(a1 + 56);
    v22 = v17;
    v25 = v18;
    v20 = *(int8x16_t *)(a1 + 32);
    v19 = (id)v20.i64[0];
    v23 = vextq_s8(v20, v20, 8uLL);
    v26 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v14, "upgradeExpressModeForPass:withCredential:resultHandler:", v15, v16, v21);

    objc_destroyWeak(v27);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24[2];

  v5 = a2;
  v6 = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3_47;
  v15[3] = &unk_1E3E68E08;
  objc_copyWeak(v24, (id *)(a1 + 80));
  v21 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v7 = *(void **)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v18 = v6;
  v19 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  v24[1] = v7;
  v22 = v10;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 72);
  v20 = v11;
  v23 = v12;
  v13 = v6;
  v14 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

  objc_destroyWeak(v24);
}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_3_47(uint64_t a1)
{
  void *v2;
  void (*v3)(void);
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (!WeakRetained)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6B0B8]);

      if (!v6)
      {
        v7 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 104), objc_msgSend(*(id *)(a1 + 56), "indexForSection:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    objc_msgSend(WeakRetained, "_expressEnableFailureAlertWithRetryIndexPath:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(WeakRetained, "_reportExpressModeEnableFailed:", *(_QWORD *)(a1 + 64));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v2);
  v3 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_5:
  v3();
LABEL_12:

}

void __75__PKExpressPassesViewController__upgradeExpressModeForPass_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *WeakRetained;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      objc_msgSend(WeakRetained[138], "setObject:atIndexedSubscript:", v7, *(_QWORD *)(a1 + 72));
      objc_msgSend(v6, "_reportExpressModeEnable:conflictingPasses:", *(_QWORD *)(a1 + 32), 0);
    }
    objc_msgSend(v6, "_updatePaymentCardCellWithIndex:statusString:", *(_QWORD *)(a1 + 72), 0);
    objc_msgSend(v6, "_invalidateUserAuth");
    v8 = *(_QWORD *)(a1 + 40);
    if (objc_msgSend(v11, "isCanceled"))
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }
    else
    {
      objc_msgSend(v6[137], "enabledExpressPasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v10)
      objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_enableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  PKExpressPassesViewController *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD *v41;
  id v42;
  _QWORD v43[6];
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKExpressPassController expressModeSupportedForPass:](self->_expressPassController, "expressModeSupportedForPass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D48]), "initWithPassInformation:forSecureElementPass:", v8, v6);
    objc_initWeak(location, self);
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__12;
    v50[4] = __Block_byref_object_dispose__12;
    v51 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__12;
    v48[4] = __Block_byref_object_dispose__12;
    v49 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__12;
    v46[4] = __Block_byref_object_dispose__12;
    v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__12;
    v44[4] = __Block_byref_object_dispose__12;
    v45 = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v11 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke;
    v43[3] = &unk_1E3E64F70;
    v43[4] = self;
    v43[5] = v44;
    objc_msgSend(v10, "addOperation:", v43);
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_53;
    v38[3] = &unk_1E3E68EF8;
    objc_copyWeak(&v42, location);
    v38[4] = self;
    v12 = v6;
    v39 = v12;
    v13 = v9;
    v40 = v13;
    v41 = v50;
    objc_msgSend(v10, "addOperation:", v38);
    v34[0] = v11;
    v34[1] = 3221225472;
    v34[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_58;
    v34[3] = &unk_1E3E68DE0;
    objc_copyWeak(&v37, location);
    v34[4] = self;
    v14 = v12;
    v35 = v14;
    v36 = v48;
    objc_msgSend(v10, "addOperation:", v34);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_59;
    v24[3] = &unk_1E3E68F48;
    objc_copyWeak(&v33, location);
    v15 = v13;
    v25 = v15;
    v29 = v48;
    v30 = v46;
    v16 = v8;
    v26 = v16;
    v31 = v50;
    v32 = v44;
    v27 = v14;
    v28 = self;
    objc_msgSend(v10, "addOperation:", v24);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_5;
    v19[3] = &unk_1E3E68F70;
    objc_copyWeak(&v23, location);
    v20 = v7;
    v21 = v46;
    v22 = v44;
    v18 = (id)objc_msgSend(v10, "evaluateWithInput:completion:", v17, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v42);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);

    objc_destroyWeak(location);
  }

}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128))
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2;
    v12[3] = &unk_1E3E68D90;
    v15 = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v13 = v6;
    v11 = v12;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E3E61590;
    v17 = v11;
    dispatch_async(v9, block);

  }
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  char IsEnabled;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;
  uint8_t buf[16];

  IsEnabled = PKNearFieldRadioIsEnabled();
  if ((IsEnabled & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Cannot upgrade express mode while NFC radio is disabled", buf, 2u);
    }

    v4 = PKCreateAlertControllerForNFCRadioDisabled();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_52;
  block[3] = &unk_1E3E668F0;
  v9 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v10 = IsEnabled;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 48) == 0);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_53(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  _QWORD *WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  void (**v23)(id, id, _QWORD);
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1178))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Checking for conflicts against pass %@", buf, 0xCu);

      }
      v13 = (void *)WeakRetained[137];
      v14 = *(_QWORD *)(a1 + 48);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_54;
      v19[3] = &unk_1E3E68ED0;
      objc_copyWeak(&v25, (id *)(a1 + 64));
      v23 = v9;
      v15 = v8;
      v16 = *(_QWORD *)(a1 + 56);
      v20 = v15;
      v24 = v16;
      v17 = *(id *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 32);
      v21 = v17;
      v22 = v18;
      objc_msgSend(v13, "conflictingExpressPassesWithPassConfiguration:completion:", v14, v19);

      objc_destroyWeak(&v25);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }

}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_55;
  block[3] = &unk_1E3E68EA8;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  v12 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 64);
  v8 = v4;
  v13 = v5;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_55(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_13:
    v17();
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "_conflictingPassesForPass:useCaseWithPasses:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 48), "count");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Found %ld conflicts total of which %@ are valid for the use case", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1120), "paymentWebService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKGymKitConflictsWithPass();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v12;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Pass conflict with GymKit:%d", buf, 8u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
    v13 = 1;
  else
    v13 = v12;
  if (v13 != 1)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_13;
  }
  v14 = *(void **)(a1 + 64);
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v16 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_56;
  v18[3] = &unk_1E3E61338;
  v20 = v14;
  v19 = *(id *)(a1 + 32);
  PKPromptUserAboutConflicts(v15, v12, v16, v3, v18);

LABEL_14:
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_56(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2 ^ 1u);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  id WeakRetained;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, id, _QWORD);
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128))
    {
      v9[2](v9, v8, 0);
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3;
      v14[3] = &unk_1E3E68DB8;
      objc_copyWeak(&v18, (id *)(a1 + 56));
      v16 = v9;
      v12 = v8;
      v13 = *(_QWORD *)(a1 + 48);
      v15 = v12;
      v17 = v13;
      objc_msgSend(WeakRetained, "_acquireUserAuthForPass:withCompletion:", v11, v14);

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }

}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id WeakRetained;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (!v6 || v7)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error getting auth for express mode change: %@", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_9:
  v9();

}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_59(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = (void *)*((_QWORD *)WeakRetained + 137);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_60;
    v19[3] = &unk_1E3E68F20;
    objc_copyWeak(&v27, (id *)(a1 + 96));
    v24 = v9;
    v15 = v8;
    v16 = *(_QWORD *)(a1 + 72);
    v20 = v15;
    v25 = v16;
    v21 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v26 = *(_OWORD *)(a1 + 80);
    v18 = *(_QWORD *)(a1 + 56);
    v22 = v17;
    v23 = v18;
    objc_msgSend(v12, "setExpressModeWithPassConfiguration:credential:completion:", v13, v14, v19);

    objc_destroyWeak(&v27);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_2_60(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  v5 = MEMORY[0x1E0C809B0];
  if (WeakRetained)
  {
    if (v3)
    {
LABEL_3:
      objc_msgSend(WeakRetained, "_transformState:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3_61;
    block[3] = &unk_1E3E618A0;
    v19 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    if (v3)
      goto LABEL_3;
  }
  objc_msgSend(WeakRetained[137], "enabledExpressPasses");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 40), "passUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(WeakRetained, "_reportExpressModeEnable:conflictingPasses:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_expressEnableFailureAlertWithRetryIndexPath:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(WeakRetained, "_reportExpressModeEnableFailed:", *(_QWORD *)(a1 + 48));
  }
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_4;
  v14[3] = &unk_1E3E618A0;
  v16 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_3_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

uint64_t __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __74__PKExpressPassesViewController__enableExpressModeForPass_withCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invalidateUserAuth");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v3)
      objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_disableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKExpressPassController *expressPassController;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  expressPassController = self->_expressPassController;
  objc_msgSend(v6, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke;
  v12[3] = &unk_1E3E68F98;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  -[PKExpressPassController disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:](expressPassController, "disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:", v10, v12);

  -[PKExpressPassesViewController _reportExpressModeDisable:](self, "_reportExpressModeDisable:", v6);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __75__PKExpressPassesViewController__disableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "_transformState:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v10[137], "enabledExpressPasses");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);

    goto LABEL_10;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v10 = 0;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
LABEL_10:
    v3 = v10;
  }

}

- (void)_sendExpressPassDidChangeNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PKExpressPassesViewControllerExpressPassChangedNotification"), 0);

}

- (double)_heightForRowAtIndexPath:(id)a3
{
  double v3;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "row");
  v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  if (!v7)
  {
    v9 = objc_msgSend(v5, "row");
    if (v9 != -[NSMutableArray count](self->_transitPasses, "count"))
    {
      v3 = *MEMORY[0x1E0DC53D8];
      goto LABEL_8;
    }
    -[PKExpressPassesViewController _transitCardCellForRow:](self, "_transitCardCellForRow:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v7 == 1)
  {
    -[PKExpressPassesViewController _paymentCardCellForRow:](self, "_paymentCardCellForRow:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = v8;
    objc_msgSend(v8, "heightThatFitsLabels");
    v3 = v11;

  }
LABEL_8:

  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  -[PKExpressPassesViewController _heightForRowAtIndexPath:](self, "_heightForRowAtIndexPath:", a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  -[PKExpressPassesViewController _heightForRowAtIndexPath:](self, "_heightForRowAtIndexPath:", a4);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5)
  {
    if (v5 != 1)
    {
      v7 = 0;
      v8 = 0;
      return v7 + v8;
    }
    v6 = 1104;
  }
  else
  {
    v6 = 1080;
  }
  v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "count");
  v8 = v7 > 0;
  return v7 + v8;
}

- (id)_preferenceCardCellForIdentifier:(id)a3
{
  id v4;
  void *v5;
  PKPaymentPreferenceCardCell *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PKExpressPassesViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v4);
  v6 = (PKPaymentPreferenceCardCell *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[PKPaymentPreferenceCardCell initWithReuseIdentifier:]([PKPaymentPreferenceCardCell alloc], "initWithReuseIdentifier:", v4);
    if (self->_style == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPreferenceCardCell setActivityIndicatorColor:](v6, "setActivityIndicatorColor:", v7);

    }
  }
  -[PKPaymentPreferenceCardCell displayLabel](v6, "displayLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 1);

  -[PKPaymentPreferenceCardCell displayLabel](v6, "displayLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 4);

  -[PKPaymentPreferenceCardCell setAccessoryType:](v6, "setAccessoryType:", 0);
  return v6;
}

- (id)_paymentCardCellForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKExpressPassesViewController _preferenceCardCellForIdentifier:](self, "_preferenceCardCellForIdentifier:", CFSTR("paymentCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_paymentPasses, "count") <= (unint64_t)a3)
  {
    objc_msgSend(v5, "setPassSnapshotter:", 0);
    objc_msgSend(v5, "setPass:", 0);
    objc_msgSend(v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("NONE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v8);
  }
  else
  {
    -[PKExpressPassesViewController _paymentPassForIndex:](self, "_paymentPassForIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", 0);

    objc_msgSend(v5, "setPassSnapshotter:", self->_passSnapshotter);
    objc_msgSend(v5, "setPass:", v6);
    -[PKExpressPassesViewController _additionalContextStringForPass:](self, "_additionalContextStringForPass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdditionalContextString:", v8);
  }

  -[PKExpressPassesViewController _configureAccessoryViewForPaymentCardCell:row:](self, "_configureAccessoryViewForPaymentCardCell:row:", v5, a3);
  objc_msgSend(v5, "setUserInteractionEnabled:", self->_isUserInteractionsEnabled);
  return v5;
}

- (id)_additionalContextStringForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "devicePaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[PKExpressPassController expressModeSupportedForPass:](self->_expressPassController, "expressModeSupportedForPass:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __65__PKExpressPassesViewController__additionalContextStringForPass___block_invoke;
    v33[3] = &unk_1E3E68FC0;
    v10 = v8;
    v34 = v10;
    v27 = v9;
    objc_msgSend(v9, "enumerateCredentialsWithHandler:", v33);
    -[PKExpressPassController eligibleExpressUpgradeRequestsForPass:](self->_expressPassController, "eligibleExpressUpgradeRequestsForPass:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "paymentApplicationIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v13);

    }
    v26 = v12;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = v6;
    objc_msgSend(v4, "sortedPaymentApplications:ascending:", v6, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v20, "applicationIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v10, "containsObject:", v21);

          if (v22)
          {
            objc_msgSend(v20, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v23);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v17);
    }
    v24 = objc_msgSend(v14, "count");
    v6 = v28;
    if (v24 >= objc_msgSend(v28, "count"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __65__PKExpressPassesViewController__additionalContextStringForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x1E0D66D58], "extractApplicationIdentifier:subcredentialIdentifier:fromIdentifiers:", &v3, 0, a2);
  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", v3);

}

- (id)_transitCardCellForRow:(int64_t)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  -[PKExpressPassesViewController _preferenceCardCellForIdentifier:](self, "_preferenceCardCellForIdentifier:", CFSTR("transitCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKExpressPassesViewController _isTransitExpressRowEnabledForIndex:](self, "_isTransitExpressRowEnabledForIndex:", a3);
  objc_msgSend(v5, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[NSMutableDictionary removeObjectForKey:](self->_passUniqueIDToCell, "removeObjectForKey:", v8);
  if (-[NSMutableArray count](self->_transitPasses, "count") <= (unint64_t)a3)
  {
    objc_msgSend(v5, "setPassSnapshotter:", 0);
    objc_msgSend(v5, "setPass:", 0);
    objc_msgSend(v5, "setDelegate:", 0);
    objc_msgSend(v5, "setAccessoryViewType:", 0);
    objc_msgSend(v5, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("NONE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    if (v6)
      v16 = 3;
    else
      v16 = 0;
    objc_msgSend(v5, "setAccessoryType:", v16);
  }
  else
  {
    objc_msgSend(v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", 0);

    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "setAccessoryViewType:", 1);
    objc_msgSend(v5, "actionSwitch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOn:animated:", v6, 0);

    -[PKExpressPassesViewController _transitPassForIndex:](self, "_transitPassForIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPassSnapshotter:", self->_passSnapshotter);
    objc_msgSend(v5, "setPass:", v11);
    objc_msgSend(v11, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_passUniqueIDToCell, "setObject:forKey:", v5, v12);
    if (objc_msgSend(v11, "isStoredValuePass"))
    {
      -[NSMutableDictionary objectForKey:](self->_passUniqueIDToTransitBalanceModels, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v5, "setTransitBalanceModel:", v13);
      }
      else
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__PKExpressPassesViewController__transitCardCellForRow___block_invoke;
        v18[3] = &unk_1E3E68FE8;
        objc_copyWeak(&v20, &location);
        v19 = v11;
        -[PKExpressPassesViewController _fetchBalancesAndTransitPassPropertiesForPass:completion:](self, "_fetchBalancesAndTransitPassPropertiesForPass:completion:", v19, v18);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }

    }
  }
  objc_msgSend(v5, "setActivityIndicatorActive:", 0);
  objc_msgSend(v5, "setUserInteractionEnabled:", self->_isUserInteractionsEnabled);

  return v5;
}

void __56__PKExpressPassesViewController__transitCardCellForRow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_updateBalancesWithServerBalances:transitPassProperties:commutePlans:forPass:", v10, v9, v8, *(_QWORD *)(a1 + 32));

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint8_t v11[16];

  v5 = a4;
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  v7 = objc_msgSend(v5, "row");

  if (v6)
  {
    if (v6 == 1)
    {
      -[PKExpressPassesViewController _paymentCardCellForRow:](self, "_paymentCardCellForRow:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Unhandled section!", v11, 2u);
      }

      v8 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
    }
  }
  else
  {
    -[PKExpressPassesViewController _transitCardCellForRow:](self, "_transitCardCellForRow:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v8, "section"));
  if (v6)
  {
    if (v6 == 1)
      -[PKExpressPassesViewController _userChangedExpressSettingForPaymentPassAtIndexPath:](self, "_userChangedExpressSettingForPaymentPassAtIndexPath:", v8);
  }
  else
  {
    v7 = objc_msgSend(v8, "row");
    if (v7 == -[NSMutableArray count](self->_transitPasses, "count"))
      -[PKExpressPassesViewController _userChangedExpressTransitToNone](self, "_userChangedExpressTransitToNone");
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_isUserInteractionsEnabled)
    goto LABEL_5;
  v9 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v9 == 1)
  {
    v11 = 1;
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_5:
    v11 = 0;
  }
  else
  {
    v10 = objc_msgSend(v8, "row");
    v11 = v10 == -[NSMutableArray count](self->_transitPasses, "count");
  }
LABEL_7:

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  if (self->_useOldAppearance)
  {
    if (self->_userAutomaticExpressModeText)
      v7 = CFSTR("SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE");
    else
      v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_CARDS_SECTION_HEADER");
    goto LABEL_9;
  }
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (!v8)
  {
    v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_CARD_CATEGORY_SECTION_HEADER");
LABEL_9:
    PKLocalizedPaymentString(&v7->isa);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v8 != 1)
  {
    v10 = 0;
    goto LABEL_11;
  }
  PKLocalizedTransitString(CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_HEADER"));
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)v9;
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  unint64_t v11;
  int64_t style;
  uint64_t v13;
  __CFString *v14;
  int IsAvailable;
  int v16;

  v6 = a3;
  if (self->_useOldAppearance
    || (v11 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4)) == 0)
  {
    if (self->_style == 1)
    {
      v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_WATCH");
    }
    else
    {
      IsAvailable = PKNearFieldLowPowerSupportIsAvailable();
      v16 = PKPearlIsAvailable();
      if (IsAvailable)
      {
        if (v16)
          v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_FACEID");
        else
          v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_TOUCHID");
      }
      else
      {
        if (v16)
        {
          PKLocalizedPearlString(CFSTR("SETTINGS_TRANSIT_SECTION_FOOTER_PEARL"));
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (self->_userAutomaticExpressModeText)
          v7 = CFSTR("SETTINGS_AUTOMATIC_TRANSIT_SECTION_FOOTER");
        else
          v7 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE");
      }
    }
    PKLocalizedPaymentString(&v7->isa);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11 != 1)
    {
      v9 = 0;
      goto LABEL_6;
    }
    style = self->_style;
    v13 = -[NSMutableArray count](self->_transitPasses, "count");
    if (style == 1)
    {
      if (v13)
        v14 = CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_WATCH");
      else
        v14 = CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_WATCH_NO_TRANSIT_CARDS");
    }
    else if (v13)
    {
      v14 = CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER");
    }
    else if (PKPearlIsAvailable())
    {
      v14 = CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_NO_TRANSIT_CARDS_PEARL");
    }
    else
    {
      v14 = CFSTR("SETTINGS_EXPRESS_PAYMENT_CARDS_SECTION_FOOTER_NO_TRANSIT_CARDS");
    }
    PKLocalizedTransitString(&v14->isa);
    v8 = objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

- (void)_updateUIWithExpressState
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PKExpressPassesViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKSectionTableViewController isSectionMapped:](self, "isSectionMapped:", 1))
    v4 = -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 1);
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[PKSectionTableViewController isSectionMapped:](self, "isSectionMapped:", 0))
    v17 = -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 0);
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "section");
        v12 = objc_msgSend(v10, "row");
        objc_msgSend(v3, "cellForRowAtIndexPath:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          -[PKExpressPassesViewController _configureAccessoryViewForPaymentCardCell:row:](self, "_configureAccessoryViewForPaymentCardCell:row:", v13, v12);
        }
        else if (v11 == v17)
        {
          v14 = -[PKExpressPassesViewController _isTransitExpressRowEnabledForIndex:](self, "_isTransitExpressRowEnabledForIndex:", v12);
          objc_msgSend(v13, "setActivityIndicatorActive:", 0);
          if (v12 != -[NSMutableArray count](self->_transitPasses, "count") || !v14)
          {
            objc_msgSend(v13, "setAccessoryType:", 0);
            objc_msgSend(v13, "actionSwitch");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setOn:animated:", v14, 1);

          }
          else
          {
            objc_msgSend(v13, "setAccessoryType:", 3);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldShowSelectionDisclosureForPass:(id)a3
{
  return 0;
}

- (void)_configureAccessoryViewForPaymentCardCell:(id)a3 row:(int64_t)a4
{
  id v6;
  int64_t selectedPaymentPassIndex;
  BOOL v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  selectedPaymentPassIndex = self->_selectedPaymentPassIndex;
  v14 = v6;
  if (selectedPaymentPassIndex == a4 && self->_selectedPaymentPassIsInPendingState)
  {
    v8 = -[NSMutableArray count](self->_paymentPasses, "count") == a4;
    v6 = v14;
    v9 = !v8;
  }
  else
  {
    v9 = 0;
  }
  if (selectedPaymentPassIndex == a4)
    v10 = v9;
  else
    v10 = 1;
  objc_msgSend(v6, "setActivityIndicatorActive:");
  objc_msgSend(v14, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKExpressPassesViewController _shouldShowSelectionDisclosureForPass:](self, "_shouldShowSelectionDisclosureForPass:", v11))
  {
    objc_msgSend(v14, "setAccessoryViewType:", 2);
    if ((v10 & 1) != 0)
    {
      PKLocalizedPaymentString(CFSTR("EXPRESS_PAYMENT_CARDS_MULTIPLE_APPLET_OFF_DISCLOSURE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisclosureString:", v12);

    }
    else
    {
      objc_msgSend(v14, "setDisclosureString:", self->_selectedPaymentPassDisclosureString);
    }
  }
  else
  {
    objc_msgSend(v14, "setAccessoryViewType:", 0);
    if (v10)
      v13 = 0;
    else
      v13 = 3;
    objc_msgSend(v14, "setAccessoryType:", v13);
  }

}

- (void)_setUserInteractionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_isUserInteractionsEnabled ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_isUserInteractionsEnabled = a3;
    -[PKExpressPassesViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "visibleCells", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setUserInteractionEnabled:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)_conflictingPassesForPass:(id)a3 useCaseWithPasses:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke;
  aBlock[3] = &unk_1E3E69010;
  v10 = v8;
  v18 = v10;
  v11 = _Block_copy(aBlock);
  if ((objc_msgSend(v6, "isTransitPass") & 1) == 0 && (objc_msgSend(v6, "isAccessPass") & 1) == 0)
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_paymentPasses, "enumerateObjectsUsingBlock:", v11);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke_2;
  v15[3] = &unk_1E3E69038;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v7, "objectsPassingTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __77__PKExpressPassesViewController__conflictingPassesForPass_useCaseWithPasses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)_acquireUserAuthForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];
  id location;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    if (self->_LAContext)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Received auth request with pending auth request present.", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      objc_storeStrong((id *)&self->_LAContext, v9);
      if (self->_userAutomaticExpressModeText)
        v10 = CFSTR("TRANSIT_AUTOMATIC_AUTHENTICATION_REASON");
      else
        v10 = CFSTR("TRANSIT_EXPRESS_AUTHENTICATION_REASON");
      PKLocalizedPaymentString(&v10->isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = &unk_1E3FACFA0;
      PKLocalizedPaymentString(CFSTR("TRANSIT_EXPRESS_AUTHENTICATION_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v24[1] = &unk_1E3FACFB8;
      objc_msgSend(v6, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v14;
      v24[2] = &unk_1E3FACFD0;
      PKLocalizedString(CFSTR("WALLET"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = &unk_1E3FACFE8;
      v25[2] = v15;
      v25[3] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke;
      v18[3] = &unk_1E3E69060;
      objc_copyWeak(&v21, &location);
      v17 = v9;
      v19 = v17;
      v20 = v7;
      objc_msgSend(v17, "evaluatePolicy:options:reply:", 2, v16, v18);

      objc_destroyWeak(&v21);
    }
    objc_destroyWeak(&location);
  }

}

void __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke_2;
    block[3] = &unk_1E3E64098;
    v10 = v5;
    v11 = v6;
    v12 = a1[4];
    v8 = a1[5];
    v13 = WeakRetained;
    v14 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __72__PKExpressPassesViewController__acquireUserAuthForPass_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "externalizedContext");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v4 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v3 = v4;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 56), "_invalidateUserAuth");
    v3 = 0;
  }

}

- (void)_invalidateUserAuth
{
  LAContext *LAContext;
  LAContext *v4;

  LAContext = self->_LAContext;
  if (LAContext)
  {
    -[LAContext invalidate](LAContext, "invalidate");
    v4 = self->_LAContext;
    self->_LAContext = 0;

  }
}

- (id)_transformState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "passUniqueIdentifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "setObject:forKey:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_transitUpdateWithState:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PKExpressPassesViewController _updateExpressState:](self, "_updateExpressState:", a3);
  -[PKExpressPassesViewController _updateUIWithExpressState](self, "_updateUIWithExpressState");
  -[PKExpressPassesViewController _sendExpressPassDidChangeNotification](self, "_sendExpressPassDidChangeNotification");
  if (!-[PKSectionTableViewController isSectionMapped:](self, "isSectionMapped:", 0))
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update express pass UI", v5, 2u);
    }

  }
}

- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  uint64_t v12;
  PKPaymentDataProvider *paymentDataProvider;
  PKPaymentDataProvider *v14;
  PKPaymentDataProvider *v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__12;
  v37[4] = __Block_byref_object_dispose__12;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__12;
  v35[4] = __Block_byref_object_dispose__12;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__12;
  v33[4] = __Block_byref_object_dispose__12;
  v34 = 0;
  objc_msgSend(v6, "devicePrimaryPaymentApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();
  v12 = MEMORY[0x1E0C809B0];
  if ((v11 & 1) != 0)
  {
    dispatch_group_enter(v9);
    paymentDataProvider = self->_paymentDataProvider;
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke;
    v28[3] = &unk_1E3E69088;
    v32 = v37;
    v29 = v10;
    v30 = v6;
    v31 = v9;
    -[PKPaymentDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v8, v29, v28);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v9);
    v14 = self->_paymentDataProvider;
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_2;
    v25[3] = &unk_1E3E690B0;
    v27 = v35;
    v26 = v9;
    -[PKPaymentDataProvider balancesForPaymentPassWithUniqueIdentifier:completion:](v14, "balancesForPaymentPassWithUniqueIdentifier:completion:", v8, v25);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v9);
    v15 = self->_paymentDataProvider;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_3;
    v22[3] = &unk_1E3E633C0;
    v24 = v33;
    v23 = v9;
    -[PKPaymentDataProvider plansForPaymentPassWithUniqueIdentifier:completion:](v15, "plansForPaymentPassWithUniqueIdentifier:completion:", v8, v22);

  }
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_4;
  block[3] = &unk_1E3E690D8;
  v18 = v7;
  v19 = v35;
  v20 = v37;
  v21 = v33;
  v16 = v7;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __90__PKExpressPassesViewController__fetchBalancesAndTransitPassPropertiesForPass_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (void)_updatePaymentCardCellWithIndex:(int64_t)a3 statusString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[PKExpressPassesViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setSubtitleOverrideString:", v9);

}

- (id)_paymentPassForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_paymentPasses, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_paymentPasses, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_transitPassForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_transitPasses, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_transitPasses, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)_sectionForPass:(id)a3
{
  int64_t result;

  result = 1;
  if (a3)
  {
    if (!self->_useOldAppearance)
      return objc_msgSend(a3, "isTransitPass") ^ 1;
  }
  return result;
}

- (BOOL)_isTransitExpressRowEnabledForIndex:(unint64_t)a3
{
  unint64_t v5;
  NSMutableArray *selectedTransitPassIndices;
  void *v7;
  char v8;

  v5 = -[NSMutableArray count](self->_transitPasses, "count");
  selectedTransitPassIndices = self->_selectedTransitPassIndices;
  if (v5 <= a3)
    return -[NSMutableArray count](selectedTransitPassIndices, "count") == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray containsObject:](selectedTransitPassIndices, "containsObject:", v7);

  return v8;
}

- (void)_reloadLocalPassStores
{
  NSMutableArray *v3;
  NSMutableArray *transitPasses;
  NSMutableArray *v5;
  NSMutableArray *selectedTransitPassIndices;
  NSMutableArray *v7;
  NSMutableArray *paymentPasses;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray **p_paymentPasses;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  transitPasses = self->_transitPasses;
  self->_transitPasses = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  selectedTransitPassIndices = self->_selectedTransitPassIndices;
  self->_selectedTransitPassIndices = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  paymentPasses = self->_paymentPasses;
  self->_paymentPasses = v7;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_passes;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isAccessPass", (_QWORD)v17) & 1) == 0
          && ((-[PKExpressPassController isExpressModeSupportedForPass:](self->_expressPassController, "isExpressModeSupportedForPass:", v14) & 1) != 0|| -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v14)))
        {
          if (!objc_msgSend(v14, "isTransitPass")
            || (p_paymentPasses = &self->_transitPasses, self->_useOldAppearance))
          {
            p_paymentPasses = &self->_paymentPasses;
          }
          -[NSMutableArray addObject:](*p_paymentPasses, "addObject:", v14);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[NSMutableArray sortUsingComparator:](self->_transitPasses, "sortUsingComparator:", &__block_literal_global_64);
  -[NSMutableArray sortUsingComparator:](self->_paymentPasses, "sortUsingComparator:", &__block_literal_global_64);
  -[PKExpressPassController enabledExpressPasses](self->_expressPassController, "enabledExpressPasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpressPassesViewController _updateExpressState:](self, "_updateExpressState:", v16);

}

uint64_t __55__PKExpressPassesViewController__reloadLocalPassStores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "serialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

- (void)_updateExpressState:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *selectedTransitPassIndices;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = -[NSMutableArray count](self->_paymentPasses, "count");
  self->_selectedPaymentPassIndex = v5;
  self->_selectedPaymentPassIsInPendingState = 0;
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_paymentPasses, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;

      if (v6 == ++v7)
        goto LABEL_11;
    }
    if (self->_selectedPaymentPassIndex != v6)
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Multiple payment passes are marked as express!", v18, 2u);
      }

    }
    self->_selectedPaymentPassIndex = v7;

  }
LABEL_11:
  -[NSMutableArray removeAllObjects](self->_selectedTransitPassIndices, "removeAllObjects");
  if (-[NSMutableArray count](self->_transitPasses, "count"))
  {
    v12 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_transitPasses, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        selectedTransitPassIndices = self->_selectedTransitPassIndices;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](selectedTransitPassIndices, "addObject:", v17);

      }
      ++v12;
    }
    while (v12 < -[NSMutableArray count](self->_transitPasses, "count"));
  }

}

- (unsigned)_beginPassUpdateSuppression
{
  unsigned int v2;

  self->_supressHandlingPassUpdates = 1;
  v2 = self->_supressHandlingPassUpdateCounter + 1;
  self->_supressHandlingPassUpdateCounter = v2;
  return v2;
}

- (void)_endPassUpdateSuppressionWithToken:(unsigned int)a3 delay:(double)a4
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  unsigned int v9;
  id location;

  objc_initWeak(&location, self);
  v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKExpressPassesViewController__endPassUpdateSuppressionWithToken_delay___block_invoke;
  block[3] = &unk_1E3E69140;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__PKExpressPassesViewController__endPassUpdateSuppressionWithToken_delay___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_DWORD *)(a1 + 40) == *((_DWORD *)WeakRetained + 293))
    WeakRetained[1169] = 0;

}

- (id)_expressEnableFailureAlertWithRetryIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  PKExpressPassesViewController *v26;
  id v27;

  v4 = a3;
  v5 = v4;
  if (self->_style == 1)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3450];
    if (v4)
    {
      PKLocalizedPaymentString(CFSTR("SETTINGS_EXPRESS_TRANSIT_ENABLE_FAILURE_WITH_RETRY_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETTINGS_EXPRESS_TRANSIT_ENABLE_FAILURE_MESSAGE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __78__PKExpressPassesViewController__expressEnableFailureAlertWithRetryIndexPath___block_invoke;
      v25 = &unk_1E3E61D90;
      v26 = self;
      v27 = v5;
      objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v12, v22, v23, v24, v25, v26);

      v13 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v15);

    }
    else
    {
      PKLocalizedPaymentString(CFSTR("SETTINGS_EXPRESS_TRANSIT_ENABLE_FAILURE_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETTINGS_EXPRESS_TRANSIT_ENABLE_FAILURE_MESSAGE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v20);

    }
  }

  return v6;
}

uint64_t __78__PKExpressPassesViewController__expressEnableFailureAlertWithRetryIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userChangedExpressSettingForPaymentPassAtIndexPath:", *(_QWORD *)(a1 + 40));
}

- (void)_beginReporting
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0D66A58];
  -[PKExpressPassesViewController _reportingSubject](self, "_reportingSubject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginSubjectReporting:", v3);

}

- (void)_endReporting
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0D66A58];
  -[PKExpressPassesViewController _reportingSubject](self, "_reportingSubject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSubjectReporting:", v3);

}

- (void)_reportExpressModeEnable:(id)a3 conflictingPasses:(id)a4
{
  -[PKExpressPassesViewController _reportExpressModeEvent:forPass:conflictingPasses:](self, "_reportExpressModeEvent:forPass:conflictingPasses:", *MEMORY[0x1E0D68B48], a3, a4);
}

- (void)_reportExpressModeEnableFailed:(id)a3
{
  -[PKExpressPassesViewController _reportExpressModeEvent:forPass:conflictingPasses:](self, "_reportExpressModeEvent:forPass:conflictingPasses:", *MEMORY[0x1E0D68B50], a3, 0);
}

- (void)_reportExpressModeDisable:(id)a3
{
  -[PKExpressPassesViewController _reportExpressModeEvent:forPass:conflictingPasses:](self, "_reportExpressModeEvent:forPass:conflictingPasses:", *MEMORY[0x1E0D68B40], a3, 0);
}

- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4 conflictingPasses:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  PKExpressPassesViewController *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  __CFString *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id *v39;
  __CFString *v40;
  unint64_t v41;
  __CFString *v42;
  void *v43;
  __CFString *v44;
  id v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKExpressPassesViewController _beginReporting](self, "_beginReporting");
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63 = v8;
  objc_msgSend(v11, "safelySetObject:forKey:", v8, *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0D69770], *MEMORY[0x1E0D68F50]);
  if (self->_style == 1)
    v12 = (_QWORD *)MEMORY[0x1E0D693A0];
  else
    v12 = (_QWORD *)MEMORY[0x1E0D693C0];
  objc_msgSend(v11, "setObject:forKey:", *v12, *MEMORY[0x1E0D693B0]);
  if (objc_msgSend(v10, "count"))
  {
    v62 = v9;
    v13 = self;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v15 = v10;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v65;
      v20 = *MEMORY[0x1E0D69690];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "organizationName", v62);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = v22;
          else
            v24 = v20;
          objc_msgSend(v14, "addObject:", v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v18);
    }

    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("|"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v25, *MEMORY[0x1E0D68A38]);

    v10 = v15;
    self = v13;
    v9 = v62;
  }
  objc_msgSend(v9, "devicePaymentApplications", v62);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v69;
    while (2)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v69 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        if (v30 && v30 != objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "paymentType"))
        {

          v34 = CFSTR("multiple");
          goto LABEL_28;
        }
        v30 = objc_msgSend(v33, "paymentType");
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v29)
        continue;
      break;
    }
  }

  PKPaymentMethodTypeToString();
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  objc_msgSend(v11, "safelySetObject:forKey:", v34, *MEMORY[0x1E0D690D8]);
  v35 = v11;
  v36 = v9;
  v37 = v36;
  if (v36 && v35)
  {
    v38 = objc_msgSend(v36, "passType");
    v39 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v38 + 1) >= 3)
      v40 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v40 = off_1E3E69160[v38 + 1];
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D69040]);

    v41 = objc_msgSend(v37, "style");
    if (v41 < 0xD && ((0x13FFu >> v41) & 1) != 0)
      v42 = off_1E3E69178[v41];
    else
      v42 = (__CFString *)*v39;
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D69038]);

    objc_msgSend(v37, "nfcPayload");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D69000]);

    v45 = v37;
    if (objc_msgSend(v45, "passType") == 1)
    {
      objc_msgSend(v45, "secureElementPass");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "cardType");
      if (v47 <= 4)
        v44 = (__CFString *)**((id **)&unk_1E3E691E0 + v47);

    }
    else
    {
      v44 = CFSTR("other");
    }

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D69028]);
    objc_msgSend(v45, "secureElementPass");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "isIdentityPass"))
    {
      v49 = objc_msgSend(v48, "identityType");
      if ((unint64_t)(v49 - 1) < 3)
      {
        v50 = off_1E3E69208[v49 - 1];
        goto LABEL_49;
      }
    }
    else if (objc_msgSend(v48, "isAccessPass"))
    {
      v51 = objc_msgSend(v48, "accessType");
      if (v51 < 7)
      {
        v50 = off_1E3E69220[v51];
        goto LABEL_49;
      }
    }
    v50 = (__CFString *)*v39;
LABEL_49:

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D69020]);
    objc_msgSend(v45, "secureElementPass");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "devicePaymentApplications");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D68940]);
    objc_msgSend(v45, "secureElementPass");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *v39;
    objc_msgSend(v55, "organizationName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "length"))
    {
      v58 = objc_msgSend(v55, "cardType");
      if (v58 == 4 || v58 == 2)
      {
        v59 = v57;

        v56 = v59;
      }
    }

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D68D88]);
  }

  v60 = (void *)MEMORY[0x1E0D66A58];
  -[PKExpressPassesViewController _reportingSubject](self, "_reportingSubject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "subject:sendEvent:", v61, v35);

  -[PKExpressPassesViewController _endReporting](self, "_endReporting");
}

- (id)_reportingSubject
{
  return (id)*MEMORY[0x1E0D69958];
}

- (NSArray)passes
{
  return self->_passes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_selectedPaymentPassDisclosureString, 0);
  objc_storeStrong((id *)&self->_passUniqueIDToTransitBalanceModels, 0);
  objc_storeStrong((id *)&self->_passUniqueIDToCell, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_allPasses, 0);
  objc_storeStrong((id *)&self->_paymentPasses, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_selectedTransitPassIndices, 0);
  objc_storeStrong((id *)&self->_transitPasses, 0);
}

@end
