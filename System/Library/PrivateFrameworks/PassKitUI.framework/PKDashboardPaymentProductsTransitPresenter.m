@implementation PKDashboardPaymentProductsTransitPresenter

- (PKDashboardPaymentProductsTransitPresenter)initWithPassGroupView:(id)a3 paymentDataProvider:(id)a4
{
  id v7;
  id v8;
  PKDashboardPaymentProductsTransitPresenter *v9;
  PKDashboardPaymentProductsTransitPresenter *v10;
  PKAdjustableSingleCellView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  PKAdjustableSingleCellView *sampleSingleCellView;
  PKFusedDoubleCellView *v18;
  PKFusedDoubleCellView *sampleFusedCellView;
  PKSimplePrimaryButtonCellView *v20;
  PKSimplePrimaryButtonCellView *sampleSingleCellButtonView;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKDashboardPaymentProductsTransitPresenter;
  v9 = -[PKDashboardPaymentProductsTransitPresenter init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passGroupView, a3);
    v11 = [PKAdjustableSingleCellView alloc];
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = -[PKAdjustableSingleCellView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    sampleSingleCellView = v10->_sampleSingleCellView;
    v10->_sampleSingleCellView = (PKAdjustableSingleCellView *)v16;

    v18 = -[PKFusedDoubleCellView initWithFrame:]([PKFusedDoubleCellView alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleFusedCellView = v10->_sampleFusedCellView;
    v10->_sampleFusedCellView = v18;

    v20 = -[PKSimplePrimaryButtonCellView initWithFrame:]([PKSimplePrimaryButtonCellView alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleSingleCellButtonView = v10->_sampleSingleCellButtonView;
    v10->_sampleSingleCellButtonView = v20;

    objc_storeStrong((id *)&v10->_paymentDataProvider, a4);
  }

  return v10;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("paymentProductsTransitPresenterAdjustableVIew");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("paymentProductsTransitPresenterFusedView");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("paymentProductsTransitPresenterButtonView");
  v4[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_identifierForItem:(id)a3
{
  unint64_t v3;

  v3 = -[PKDashboardPaymentProductsTransitPresenter _viewTypeForTransitItem:](self, "_viewTypeForTransitItem:", a3);
  if (v3 > 2)
    return 0;
  else
    return off_1E3E6B3F0[v3];
}

- (int64_t)_viewTypeForTransitItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  -[PKDashboardPaymentProductsTransitPresenter displayableBalancesForTransitItem:](self, "displayableBalancesForTransitItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "transitItemType");

  v8 = 2;
  if (v7 != 4)
    v8 = 0;
  if (v7 >= 3)
    v9 = v8;
  else
    v9 = v6 != 1;

  return v9;
}

- (id)displayableBalancesForTransitItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "transitItemType");
  if (v4 == 2)
  {
    objc_msgSend(v3, "transitBalanceModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayablePointsBalances");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 1)
  {
    objc_msgSend(v3, "transitBalanceModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayableCurrencyBalances");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "transitBalanceModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayableBalances");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

LABEL_9:
  return v7;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKDashboardPaymentProductsTransitPresenter _identifierForItem:](self, "_identifierForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDashboardPaymentProductsTransitPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v12, v10, v9, v8);
  return v12;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "hostedContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12
    || (v14 = objc_msgSend(v12, "viewType"),
        v14 != -[PKDashboardPaymentProductsTransitPresenter _viewTypeForTransitItem:](self, "_viewTypeForTransitItem:", v9)))
  {
    v15 = -[PKDashboardPaymentProductsTransitPresenter _allocViewForTransitItem:](self, "_allocViewForTransitItem:", v9);

    v13 = v15;
  }
  v17 = v13;
  -[PKDashboardPaymentProductsTransitPresenter _configureView:transitItem:indexPath:animated:](self, "_configureView:transitItem:indexPath:animated:", &v17, v9, v10, 0);
  v16 = v17;

  objc_msgSend(v11, "setHostedContentView:", v16);
}

- (id)_renewActionForItem:(id)a3 commutePlanIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  objc_msgSend(a3, "transitBalanceModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayableCommutePlanActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_82);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke_2;
  v12[3] = &unk_1E3E6B368;
  v13 = v5;
  v9 = v5;
  objc_msgSend(v8, "pk_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 2
    && objc_msgSend(v2, "isActionAvailable")
    && (objc_msgSend(v2, "unavailableActionBehavior") & 1) == 0;

  return v3;
}

BOOL __88__PKDashboardPaymentProductsTransitPresenter__renewActionForItem_commutePlanIdentifier___block_invoke_2(uint64_t a1, void *a2)
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

- (id)_topUpActionForItem:(id)a3 indexPath:(id)a4 balanceIdentifier:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(a3, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activationState");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "availableActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = v8 - 1;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
      if (objc_msgSend(v15, "type") == 6
        || !objc_msgSend(v15, "type")
        || objc_msgSend(v15, "type") == 1 && (v13 < 2 || (objc_msgSend(v15, "unavailableActionBehavior") & 1) != 0))
      {
        break;
      }
      if (objc_msgSend(v15, "type") == 1
        && objc_msgSend(v6, "pk_hasObjectPassingTest:", &__block_literal_global_21))
      {
        goto LABEL_24;
      }
      if (objc_msgSend(v15, "featured"))
      {
        objc_msgSend(v15, "associatedEnteredValueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_24;
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke_2;
      v21[3] = &unk_1E3E63948;
      v21[4] = v15;
      if ((objc_msgSend(v6, "pk_hasObjectPassingTest:", v21) & 1) != 0)
      {
LABEL_24:
        v19 = v15;
        goto LABEL_25;
      }
      if (objc_msgSend(v15, "type") == 1)
      {
        objc_msgSend(v15, "relevantPropertyIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {

        }
        else
        {
          objc_msgSend(v15, "associatedEnteredValueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_24;
        }
      }
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v19 = 0;
        if (v11)
          goto LABEL_3;
        goto LABEL_25;
      }
    }
  }
  v19 = 0;
LABEL_25:

  return v19;
}

BOOL __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  v3 = (id)*MEMORY[0x1E0D6ACB8];
  v4 = v2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v4 && v3)
      v6 = objc_msgSend(v3, "caseInsensitiveCompare:", v4) == 0;
  }

  return v6;
}

BOOL __94__PKDashboardPaymentProductsTransitPresenter__topUpActionForItem_indexPath_balanceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relevantPropertyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v6 == v5)
  {
    v9 = 1;
    v10 = v5;
LABEL_14:

    goto LABEL_15;
  }
  if (!v5 || !v6)
  {

    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);

  if (v8)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "associatedEnteredValueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v13 = v11;
    v10 = v13;
    if (v13 == v12)
    {
      v9 = 1;
    }
    else
    {
      v9 = 0;
      if (v5 && v13)
        v9 = objc_msgSend(v12, "caseInsensitiveCompare:", v13) == 0;
    }

    goto LABEL_14;
  }
  v9 = 1;
LABEL_15:

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGSize result;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "bounds");
  v11 = v10 + -32.0;
  -[PKDashboardPaymentProductsTransitPresenter _sampleViewForTransitItem:](self, "_sampleViewForTransitItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  -[PKDashboardPaymentProductsTransitPresenter _configureView:transitItem:indexPath:animated:](self, "_configureView:transitItem:indexPath:animated:", &v20, v9, v8, 0);

  v13 = v20;
  objc_msgSend(v13, "sizeThatFits:", v11, 1.79769313e308);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSComparisonResult v12;
  PKAdjustableSingleCellView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PKAdjustableSingleCellView *v18;
  PKAdjustableSingleCellView *sampleSingleCellView;
  PKFusedDoubleCellView *v20;
  PKFusedDoubleCellView *sampleFusedCellView;
  PKSimplePrimaryButtonCellView *v22;
  PKSimplePrimaryButtonCellView *sampleSingleCellButtonView;
  id v24;

  v8 = a5;
  if (a3)
  {
    if (a4)
    {
      v24 = v8;
      v9 = a4;
      objc_msgSend(a3, "preferredContentSizeCategory");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeCategory");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();

      v12 = UIContentSizeCategoryCompareToCategory(v10, v11);
      v8 = v24;
      if (v12)
      {
        v13 = [PKAdjustableSingleCellView alloc];
        v14 = *MEMORY[0x1E0C9D648];
        v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v18 = -[PKAdjustableSingleCellView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
        sampleSingleCellView = self->_sampleSingleCellView;
        self->_sampleSingleCellView = v18;

        v20 = -[PKFusedDoubleCellView initWithFrame:]([PKFusedDoubleCellView alloc], "initWithFrame:", v14, v15, v16, v17);
        sampleFusedCellView = self->_sampleFusedCellView;
        self->_sampleFusedCellView = v20;

        v22 = -[PKSimplePrimaryButtonCellView initWithFrame:]([PKSimplePrimaryButtonCellView alloc], "initWithFrame:", v14, v15, v16, v17);
        sampleSingleCellButtonView = self->_sampleSingleCellButtonView;
        self->_sampleSingleCellButtonView = v22;

        objc_msgSend(v24, "reloadData");
        v8 = v24;
      }
    }
  }

}

- (id)_sampleViewForTransitItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a3;
  -[PKDashboardPaymentProductsTransitPresenter displayableBalancesForTransitItem:](self, "displayableBalancesForTransitItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "transitItemType");

  if (v7 < 3)
  {
    v8 = 32;
    if (v6 == (id)1)
      v8 = 24;
    goto LABEL_9;
  }
  if (v7 == 3)
  {
    v8 = 24;
    goto LABEL_9;
  }
  if (v7 == 4)
  {
    v8 = 40;
LABEL_9:
    v6 = *(id *)((char *)&self->super.isa + v8);
  }

  return v6;
}

- (id)_allocViewForTransitItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __objc2_class **v8;
  id v9;

  v4 = a3;
  -[PKDashboardPaymentProductsTransitPresenter displayableBalancesForTransitItem:](self, "displayableBalancesForTransitItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "transitItemType");

  v8 = &off_1E3E1A730;
  if (v7 < 3)
  {
    if (v6 != (void *)1)
      v8 = off_1E3E1B4D8;
    goto LABEL_8;
  }
  if (v7 == 3)
  {
LABEL_8:
    v9 = objc_alloc(*v8);
    v6 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_9;
  }
  if (v7 == 4)
  {
    v8 = off_1E3E1D2F0;
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void)_configureView:(id *)a3 transitItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  __CFString *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _BOOL8 v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  __CFString *v64;
  id *v65;
  id *v66;
  _BOOL4 v67;
  void *v68;
  __CFString *v69;
  id v70;
  id v71;
  char v72;

  v67 = a6;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "transitBalanceModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayableCommutePlans");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v68, "count");
  -[PKDashboardPaymentProductsTransitPresenter displayableBalancesForTransitItem:](self, "displayableBalancesForTransitItem:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v15 = objc_msgSend(v9, "transitItemType");
  -[PKDashboardPaymentProductsTransitPresenter _passForTransitItem:indexPath:](self, "_passForTransitItem:indexPath:", v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 < 3)
  {
    if (v14 == 2)
    {
      v18 = *a3;
      objc_msgSend(v18, "beginUpdates");
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v18, "setLeftTitle:", v26);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
        v38 = a3;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLeftTitle:", v39);

        a3 = v38;
      }
      v65 = a3;

      objc_msgSend(v19, "formattedValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLeftDetail:", v40);

      objc_msgSend(v18, "setLeftSubDetail:", 0);
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedTitle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend(v18, "setRightTitle:", v41);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRightTitle:", v49);

      }
      objc_msgSend(v21, "formattedValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRightDetail:", v50);

      objc_msgSend(v18, "setRightSubDetail:", 0);
      objc_msgSend(v18, "setPass:", v16);
      objc_msgSend(v18, "setEnableDisclosure:", 1);
      objc_msgSend(v18, "endUpdates:", v67);
    }
    else
    {
      v63 = v10;
      v17 = v14 - 1;
      if (v14 != 1)
      {
        v18 = *a3;
        objc_msgSend(v18, "beginUpdates");
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v18, "setLeftTitle:", v33);
        }
        else
        {
          PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
          v51 = a3;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setLeftTitle:", v52);

          a3 = v51;
        }

        objc_msgSend(v19, "formattedValue");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLeftDetail:", v53);

        objc_msgSend(v18, "setLeftSubDetail:", 0);
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_OTHER_BALANCES_HEADER"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRightTitle:", v54);

        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_MORE_BALANCES_HEADER"), CFSTR("%lu"), v17);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRightDetail:", v55);

        objc_msgSend(v18, "setRightSubDetail:", 0);
        objc_msgSend(v18, "setPass:", v16);
        objc_msgSend(v18, "setEnableDisclosure:", 1);
        objc_msgSend(v18, "endUpdates:", v67);
        v10 = v63;
        goto LABEL_44;
      }
      v65 = a3;
      v18 = *a3;
      objc_msgSend(v18, "beginUpdates");
      objc_msgSend(v18, "setAction:", 0);
      objc_msgSend(v18, "setActionHandler:", 0);
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v63;
      -[PKDashboardPaymentProductsTransitPresenter _topUpActionForItem:indexPath:balanceIdentifier:](self, "_topUpActionForItem:indexPath:balanceIdentifier:", v9, v63, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDashboardPaymentProductsTransitPresenter _actionHandlerForItem:indexPath:](self, "_actionHandlerForItem:indexPath:", v9, v63);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v21 && v22 && objc_msgSend(v21, "isActionAvailable"))
      {
        objc_msgSend(v18, "setAction:", v21);
        objc_msgSend(v18, "setActionHandler:", v23);
      }
      v61 = v23;
      objc_msgSend(v18, "setEnableDisclosure:", 0);
      objc_msgSend(v19, "localizedTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v18, "setTitle:", v24);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitle:", v34);

      }
      objc_msgSend(v19, "formattedValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDetail:", v35);

      if (objc_msgSend(v16, "isAutoTopUpBalance:", v19)
        && objc_msgSend(v16, "isAutoTopEnabled"))
      {
        PKLocalizedPaymentString(CFSTR("DASHBOARD_BALANCE_AUTO_RELOAD_ON"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSubDetail:", v36);

      }
      else
      {
        objc_msgSend(v18, "setSubDetail:", 0);
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubDetailColor:", v37);

      objc_msgSend(v18, "setPass:", v16);
      objc_msgSend(v18, "endUpdates:", v67);

    }
    a3 = v65;
LABEL_44:

    objc_msgSend(v18, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67928]);
    goto LABEL_49;
  }
  if (v15 == 3)
  {
    v66 = a3;
    v27 = *a3;
    objc_msgSend(v27, "beginUpdates");
    objc_msgSend(v27, "setPass:", v16);
    objc_msgSend(v27, "setAction:", 0);
    objc_msgSend(v27, "setActionHandler:", 0);
    objc_msgSend(v27, "setEnableDisclosure:", v12 > 1);
    v72 = 0;
    v71 = 0;
    v69 = &stru_1E3E7D690;
    v70 = 0;
    v62 = v11;
    objc_msgSend(v11, "getDisplayableCommutePlanDetailsForTitle:value:subtitle:isExpired:", &v71, &v70, &v69, &v72);
    v28 = v71;
    v29 = v70;
    v30 = v69;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    v59 = v16;
    PKCommutePlanFormatTitleFromLabelAndValue();
    v31 = v28;

    v32 = v29;
    v60 = v31;
    objc_msgSend(v27, "setTitle:", v31);
    v58 = v32;
    objc_msgSend(v27, "setDetail:", v32);
    v64 = v30;
    objc_msgSend(v27, "setSubDetail:", v30);
    if (v72)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSubDetailColor:", v42);

    a3 = v66;
    v11 = v62;
    v16 = v59;
    if (v12 == 1)
    {
      objc_msgSend(v68, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPaymentProductsTransitPresenter _renewActionForItem:commutePlanIdentifier:](self, "_renewActionForItem:commutePlanIdentifier:", v9, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDashboardPaymentProductsTransitPresenter _actionHandlerForItem:indexPath:](self, "_actionHandlerForItem:indexPath:", v9, v10);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v46;
      if (v45 && v46 && objc_msgSend(v45, "isActionAvailable"))
      {
        v48 = objc_msgSend(v59, "isSuicaPass")
           && objc_msgSend(v45, "type") == 2
           && objc_msgSend(v59, "transitCommutePlanType") == 1;
        objc_msgSend(v45, "setReverseButtonTitleForLegacySuica:", v48);
        objc_msgSend(v27, "setAction:", v45);
        objc_msgSend(v27, "setActionHandler:", v47);
      }

      a3 = v66;
    }
    objc_msgSend(v27, "endUpdates:", v67);
    v56 = *MEMORY[0x1E0D67EC8];
    v18 = v27;
    objc_msgSend(v18, "setAccessibilityIdentifier:", v56);

  }
  else if (v15 == 4)
  {
    v18 = *a3;
    objc_msgSend(v18, "beginUpdates");
    objc_msgSend(v18, "setPass:", v16);
    if ((objc_msgSend(v11, "hasCommutePlanContent") & 1) == 0)
      objc_msgSend(v11, "hasBalanceContent");
    PKPassLocalizedStringWithFormat();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v25, 0);

    objc_msgSend(v18, "endUpdates:", v67);
  }
  else
  {
    v18 = 0;
  }
LABEL_49:
  v57 = objc_retainAutorelease(v18);
  *a3 = v57;

}

- (id)_actionHandlerForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __78__PKDashboardPaymentProductsTransitPresenter__actionHandlerForItem_indexPath___block_invoke;
  v14 = &unk_1E3E6B3D0;
  objc_copyWeak(&v15, &location);
  v8 = _Block_copy(&v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __78__PKDashboardPaymentProductsTransitPresenter__actionHandlerForItem_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  char v9;
  id v10;
  PKPerformActionViewController *v11;
  PKNavigationController *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
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
      v12 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v11);
      objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);
      -[PKPerformActionViewController setDelegate:](v11, "setDelegate:", WeakRetained);

    }
    else
    {
      +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v15, v6, v10, 0);
      v11 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
      v12 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();

      -[PKNavigationController presentViewController:animated:completion:](v12, "presentViewController:animated:completion:", v11, 1, 0);
    }

  }
}

- (id)_passForTransitItem:(id)a3 indexPath:(id)a4
{
  void *v4;
  void *v5;

  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "hostedContentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = -[PKDashboardPaymentProductsTransitPresenter _allocViewForTransitItem:](self, "_allocViewForTransitItem:", v9);
  v14 = v12;
  -[PKDashboardPaymentProductsTransitPresenter _configureView:transitItem:indexPath:animated:](self, "_configureView:transitItem:indexPath:animated:", &v14, v9, v10, 0);
  v13 = v14;

  objc_msgSend(v11, "setHostedContentView:", v13);
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

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a3, "transitItemType") == 4)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "hostedContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "enableDisclosure");

    }
    else
    {
      v14 = 0;
    }
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "activationState"))
      v10 = 0;
    else
      v10 = v14;

  }
  return v10;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9;
  PKPaymentPassCombinedActionDataController *v10;
  void *v11;
  void *v12;
  PKPaymentDataProvider *paymentDataProvider;
  void *v14;
  void *v15;
  PKPaymentPassCombinedActionDataController *v16;
  PKPaymentPassCombinedActionDataController *combinedActionController;
  PKPaymentPassCombinedActionDataController *v18;
  PKPassTransitProductsViewController *v19;
  PKPassTransitProductsViewController *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  PKPassTransitProductsViewController *v25;

  v23 = a6;
  v9 = a3;
  if (objc_msgSend(v9, "transitItemType") == 4)
  {
    v10 = [PKPaymentPassCombinedActionDataController alloc];
    objc_msgSend(v9, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    paymentDataProvider = self->_paymentDataProvider;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitBalanceModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PKPaymentPassCombinedActionDataController initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:](v10, "initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:", v11, v12, paymentDataProvider, v14, v15, 0);
    combinedActionController = self->_combinedActionController;
    self->_combinedActionController = v16;

    v18 = self->_combinedActionController;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __121__PKDashboardPaymentProductsTransitPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v24[3] = &unk_1E3E688A8;
    v25 = (PKPassTransitProductsViewController *)v23;
    -[PKPaymentPassCombinedActionDataController fetchViewController:](v18, "fetchViewController:", v24);
    v19 = v25;
  }
  else
  {
    v20 = [PKPassTransitProductsViewController alloc];
    objc_msgSend(v9, "pass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v9, "transitItemType");

    v19 = -[PKPassTransitProductsViewController initWithPaymentPass:transitType:](v20, "initWithPaymentPass:transitType:", v21, v22);
    objc_storeWeak((id *)&self->_productDetailsController, v19);
    objc_msgSend(v23, "pushViewController:animated:", v19, 1);
  }

}

void __121__PKDashboardPaymentProductsTransitPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v6, 1);
  }

}

- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellButtonView, 0);
  objc_storeStrong((id *)&self->_sampleFusedCellView, 0);
  objc_storeStrong((id *)&self->_sampleSingleCellView, 0);
  objc_destroyWeak((id *)&self->_productDetailsController);
  objc_storeStrong((id *)&self->_passGroupView, 0);
}

@end
