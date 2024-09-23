@implementation PKMerchantTokensViewController

- (PKMerchantTokensViewController)initWithPass:(id)a3 merchantTokensResponse:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKMerchantTokensViewController *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *idsToMerchantTokens;
  uint64_t v16;
  PKPaymentWebService *webService;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PKMerchantTokensViewController;
  v10 = -[PKMerchantTokensViewController initWithCollectionViewLayout:](&v21, sel_initWithCollectionViewLayout_, v9);

  if (v10)
  {
    if ((objc_msgSend(v7, "hasMerchantTokens") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempting to show PKMerchantTokensViewController for pass that has no merchant tokens."));
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v10->_previousMerchantTokensResponse, a4);
    objc_msgSend(v8, "merchantTokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    v13 = v12;
    if (!v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_storeStrong((id *)&v10->_merchantTokens, v13);
    if (!v12)

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    idsToMerchantTokens = v10->_idsToMerchantTokens;
    v10->_idsToMerchantTokens = v14;

    v10->_isFetchingMerchantTokens = 0;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v16 = objc_claimAutoreleasedReturnValue();
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v16;

    v10->_merchantIconsEnabled = PKMerchantTokensForceMerchantIconsEnabled();
    -[PKMerchantTokensViewController navigationItem](v10, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKENS_LIST_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    objc_msgSend(v18, "setBackButtonDisplayMode:", 2);
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKMerchantTokensViewController _setUpViews](self, "_setUpViews");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  if (!self->_previousMerchantTokensResponse)
    -[PKMerchantTokensViewController _fetchNextPageOfMerchantTokens](self, "_fetchNextPageOfMerchantTokens");
  -[PKMerchantTokensViewController _deselectSelectedItemAnimated:](self, "_deselectSelectedItemAnimated:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[PKMerchantTokensViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69910];
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D68E28];
  v12[0] = *MEMORY[0x1E0D68C50];
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v9);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  if ((-[PKMerchantTokensViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PKMerchantTokensViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69910];
    v6 = *MEMORY[0x1E0D68B18];
    v7 = *MEMORY[0x1E0D68858];
    v11[0] = *MEMORY[0x1E0D68AA0];
    v11[1] = v7;
    v8 = *MEMORY[0x1E0D687C0];
    v12[0] = v6;
    v12[1] = v8;
    v11[2] = *MEMORY[0x1E0D68F50];
    v12[2] = *MEMORY[0x1E0D68E28];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v9);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMerchantTokensViewController;
  -[PKMerchantTokensViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKMerchantTokensViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokensViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PKMerchantTokenDetailViewController *v8;
  PKMerchantTokenDetailViewController *v9;
  _QWORD v10[4];
  PKMerchantTokenDetailViewController *v11;
  PKMerchantTokensViewController *v12;

  v5 = a4;
  if (-[PKMerchantTokensViewController _isMerchantRow:](self, "_isMerchantRow:", v5))
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_idsToMerchantTokens, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantTokensViewController _trackButtonTapForMerchantToken:](self, "_trackButtonTapForMerchantToken:", v7);
    v8 = -[PKMerchantTokenDetailViewController initWithMerchantToken:]([PKMerchantTokenDetailViewController alloc], "initWithMerchantToken:", v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v10[3] = &unk_1E3E619E0;
    v11 = v8;
    v12 = self;
    v9 = v8;
    -[PKMerchantTokenDetailViewController preflightWithCompletion:](v9, "preflightWithCompletion:", v10);

  }
}

void __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v4[3] = &unk_1E3E61388;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __74__PKMerchantTokensViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[PKMerchantTokensViewController _isMerchantRow:](self, "_isMerchantRow:", a4);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  if (-[PKMerchantTokensViewController _isLoadingRow:](self, "_isLoadingRow:", a5, a4))
    -[PKMerchantTokensViewController _fetchNextPageOfMerchantTokens](self, "_fetchNextPageOfMerchantTokens");
}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  id v6;
  UICollectionViewDiffableDataSource *dataSource;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;
  id v20;

  v20 = a3;
  v6 = a4;
  -[NSMutableArray removeObject:](self->_merchantTokens, "removeObject:", v6);
  dataSource = self->_dataSource;
  -[PKMerchantTokensViewController _updatedSnapshotRemovingMerchantToken:](self, "_updatedSnapshotRemovingMerchantToken:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v8, 1);

  -[PKMerchantTokensViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || -[NSMutableArray count](self->_merchantTokens, "count"))
  {
    objc_msgSend(v9, "topViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v10 == v20
        || (objc_msgSend(v20, "parentViewController"),
            v11 = (id)objc_claimAutoreleasedReturnValue(),
            v11,
            v10 == v11))
      {
        v12 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);
      }
    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", self);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v9, "viewControllers"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PKMerchantTokensViewController parentViewController](self, "parentViewController"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v15, "indexOfObject:", v16),
        v16,
        v15,
        v14 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v9, "viewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v14 - 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v18 = (id)objc_msgSend(v9, "popToViewController:animated:", v10, 1);
LABEL_10:

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "merchantTokensViewController:didDeleteMerchantToken:", self, v6);

}

- (void)_setUpViews
{
  -[PKMerchantTokensViewController _setUpSelf](self, "_setUpSelf");
  -[PKMerchantTokensViewController _setUpCollectionView](self, "_setUpCollectionView");
}

- (void)_setUpSelf
{
  -[PKMerchantTokensViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
}

- (void)_setUpCollectionView
{
  void *v3;
  BOOL merchantIconsEnabled;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  UICollectionViewDiffableDataSource *v14;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v16;
  id v17;
  void *v18;
  UICollectionViewDiffableDataSource *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[4];
  BOOL v29;
  _QWORD v30[4];
  BOOL v31;

  -[PKMerchantTokensViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v3, "layoutMargins");
    objc_msgSend(v3, "setLayoutMargins:");
  }
  objc_msgSend(v3, "contentInset");
  objc_msgSend(v3, "setContentInset:");
  merchantIconsEnabled = self->_merchantIconsEnabled;
  v5 = (void *)MEMORY[0x1E0DC35C8];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke;
  v30[3] = &__block_descriptor_33_e65_v32__0__PKMerchantTokenCell_8__NSIndexPath_16__PKMerchantToken_24l;
  v31 = merchantIconsEnabled;
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_2;
  v28[3] = &__block_descriptor_33_e65_v32__0__PKMerchantTokenLoadingCell_8__NSIndexPath_16__NSString_24l;
  v29 = merchantIconsEnabled;
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3640], "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), *MEMORY[0x1E0DC48A0], &__block_literal_global_186);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_4;
  v23[3] = &unk_1E3E75A88;
  objc_copyWeak(&v26, &location);
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v14 = (UICollectionViewDiffableDataSource *)objc_msgSend(v11, "initWithCollectionView:cellProvider:", v3, v23);
  dataSource = self->_dataSource;
  self->_dataSource = v14;

  v16 = self->_dataSource;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_5;
  v21[3] = &unk_1E3E75AB0;
  v17 = v10;
  v22 = v17;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v16, "setSupplementaryViewProvider:", v21);
  -[PKMerchantTokensViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDataSource:", self->_dataSource);

  v19 = self->_dataSource;
  -[PKMerchantTokensViewController _initialSnapshot](self, "_initialSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v19, "applySnapshot:animatingDifferences:", v20, 0);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "updateCellWithMerchantToken:showMerchantIcon:", a4, *(unsigned __int8 *)(a1 + 32));
}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_2(uint64_t result, void *a2)
{
  if (!*(_BYTE *)(result + 32))
    return objc_msgSend(a2, "useSmallHeight");
  return result;
}

void __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "defaultContentConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKENS_LIST_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(v2, "setContentConfiguration:", v4);
}

id __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  uint64_t v11;
  _QWORD *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "_isMerchantRow:", v8))
  {
    objc_msgSend(WeakRetained[130], "objectForKeyedSubscript:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (_QWORD *)(a1 + 32);
    v9 = (id)v11;
  }
  else
  {
    v12 = (_QWORD *)(a1 + 40);
  }
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *v12, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __54__PKMerchantTokensViewController__setUpCollectionView__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + 32));
}

+ (id)_collectionViewLayout
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v2, "setFooterMode:", 1);
  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKMerchantTokensViewController__collectionViewLayout__block_invoke;
  v7[3] = &unk_1E3E75AD8;
  v8 = v2;
  v4 = v2;
  v5 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v7);

  return v5;
}

id __55__PKMerchantTokensViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    objc_msgSend(v3, "setContentInsetsReference:", 4);
    objc_msgSend(v3, "contentInsets");
    objc_msgSend(v3, "setContentInsets:");
  }
  return v3;
}

- (id)_initialSnapshot
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokensViewController _updateIdentifiersWithMerchantTokens:](self, "_updateIdentifiersWithMerchantTokens:", self->_merchantTokens);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v9[0] = CFSTR("MerchantTokenMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  objc_msgSend(v4, "appendItemsWithIdentifiers:", v3);
  if (-[PKMerchantTokensViewController _shouldShowLoadingRow](self, "_shouldShowLoadingRow"))
  {
    v8 = CFSTR("MerchantTokenLoadingCell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:", v6);

  }
  return v4;
}

- (id)_updatedSnapshotWithMerchantTokens:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokensViewController _updateIdentifiersWithMerchantTokens:](self, "_updateIdentifiersWithMerchantTokens:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("MerchantTokenLoadingCell");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteItemsWithIdentifiers:", v6);

  objc_msgSend(v5, "appendItemsWithIdentifiers:", v4);
  if (-[PKMerchantTokensViewController _shouldShowLoadingRow](self, "_shouldShowLoadingRow"))
  {
    v9 = CFSTR("MerchantTokenLoadingCell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendItemsWithIdentifiers:", v7);

  }
  return v5;
}

- (id)_updatedSnapshotRemovingMerchantToken:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "merchantTokenId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsToMerchantTokens, "setObject:forKeyedSubscript:", 0, v4);
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteItemsWithIdentifiers:", v6);

  return v5;
}

- (id)_updateIdentifiersWithMerchantTokens:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "merchantTokenId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_idsToMerchantTokens, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsToMerchantTokens, "setObject:forKeyedSubscript:", v10, v11);
            objc_msgSend(v14, "addObject:", v11);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v14;
}

- (BOOL)_isLoadingRow:(id)a3
{
  void *v3;
  char v4;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MerchantTokenLoadingCell"));

  return v4;
}

- (BOOL)_isMerchantRow:(id)a3
{
  return !-[PKMerchantTokensViewController _isLoadingRow:](self, "_isLoadingRow:", a3);
}

- (BOOL)_hasMoreUnfetchedMerchantTokens
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  if (!self->_previousMerchantTokensResponse)
    return 1;
  v3 = -[NSMutableArray count](self->_merchantTokens, "count");
  -[PKRetrieveMerchantTokensResponse totalMerchantTokens](self->_previousMerchantTokensResponse, "totalMerchantTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 < objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)_fetchNextPageOfMerchantTokens
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentWebService *webService;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[PKMerchantTokensViewController _hasMoreUnfetchedMerchantTokens](self, "_hasMoreUnfetchedMerchantTokens")
    && !self->_isFetchingMerchantTokens)
  {
    self->_isFetchingMerchantTokens = 1;
    v3 = objc_alloc_init(MEMORY[0x1E0D675B0]);
    objc_msgSend(v3, "setPass:", self->_pass);
    -[PKRetrieveMerchantTokensResponse pageNumber](self->_previousMerchantTokensResponse, "pageNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[PKRetrieveMerchantTokensResponse pageNumber](self->_previousMerchantTokensResponse, "pageNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPageNumber:", v7);

    }
    -[PKRetrieveMerchantTokensResponse pageSize](self->_previousMerchantTokensResponse, "pageSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PKRetrieveMerchantTokensResponse pageSize](self->_previousMerchantTokensResponse, "pageSize");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPageSize:", v9);

    }
    objc_initWeak(&location, self);
    webService = self->_webService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke;
    v11[3] = &unk_1E3E75B00;
    objc_copyWeak(&v12, &location);
    -[PKPaymentWebService retrieveMerchantTokensWithRequest:completion:](webService, "retrieveMerchantTokensWithRequest:completion:", v3, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __64__PKMerchantTokensViewController__fetchNextPageOfMerchantTokens__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1048) = 0;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_storeStrong(WeakRetained + 128, v4);
      objc_msgSend(*(id *)(a1 + 32), "merchantTokens");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = (void *)MEMORY[0x1E0C9AA60];
      if (v5)
        v7 = (void *)v5;
      v8 = v7;

      objc_msgSend(v3[129], "addObjectsFromArray:", v8);
      v9 = v3[126];
      objc_msgSend(v3, "_updatedSnapshotWithMerchantTokens:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applySnapshot:animatingDifferences:", v10, 0);

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v3, "collectionView", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathsForVisibleItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v18;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v12);
            if (objc_msgSend(v3, "_isLoadingRow:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16)))
              objc_msgSend(v3, "_fetchNextPageOfMerchantTokens");
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v14);
      }

    }
  }

}

- (void)_deselectSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a3;
  -[PKMerchantTokensViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKMerchantTokensViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke;
      v13[3] = &unk_1E3E75B28;
      v14 = v5;
      v15 = v7;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke_2;
      v10[3] = &unk_1E3E75B28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v7, v3);
    }

  }
}

uint64_t __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __64__PKMerchantTokensViewController__deselectSelectedItemAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)_trackButtonTapForMerchantToken:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setValue:forKey:", *MEMORY[0x1E0D68E38], *MEMORY[0x1E0D68858]);
  objc_msgSend(v3, "setValue:forKey:", *MEMORY[0x1E0D68E28], *MEMORY[0x1E0D68F50]);
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69910], v3);

}

- (PKMerchantTokensViewControllerDelegate)delegate
{
  return (PKMerchantTokensViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_idsToMerchantTokens, 0);
  objc_storeStrong((id *)&self->_merchantTokens, 0);
  objc_storeStrong((id *)&self->_previousMerchantTokensResponse, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
