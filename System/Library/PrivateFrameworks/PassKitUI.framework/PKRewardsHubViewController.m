@implementation PKRewardsHubViewController

- (PKRewardsHubViewController)initWithAccount:(id)a3 transactionSourceCollection:(id)a4 accountService:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKRewardsHubViewController *v12;
  PKRewardsHubViewController *v13;
  PKAccount **p_account;
  PKAccountService **p_accountService;
  uint64_t v16;
  PKRewardsSummaryFetcher *rewardsFetcher;
  id v18;
  void *v19;
  uint64_t v20;
  PKAccountEnhancedMerchantsFetcher *enhancedMerchantsFetcher;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  PKRewardsHubSummarySectionController *v27;
  PKRewardsHubSummarySectionController *summariesSectionController;
  PKEnhancedMerchantsShelfSectionController *v29;
  PKEnhancedMerchantsShelfSectionController *enhancedMerchantsShelfSectionController;
  PKAccountPromotionsSectionController *v31;
  PKAccountPromotionsSectionController *promotionsSectionController;
  PKDailyCashSelectionSectionController *v33;
  PKDailyCashSelectionSectionController *dailyCashSelectionSectionController;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PKRewardsHubViewController;
  v12 = -[PKDynamicCollectionViewController init](&v36, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v12, "setUseItemIdentityWhenUpdating:", 1);
    p_account = &v13->_account;
    objc_storeStrong((id *)&v13->_account, a3);
    p_accountService = &v13->_accountService;
    objc_storeStrong((id *)&v13->_accountService, a5);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D675B8]), "initWithTransactionSourceCollection:account:", v13->_transactionSourceCollection, v13->_account);
    rewardsFetcher = v13->_rewardsFetcher;
    v13->_rewardsFetcher = (PKRewardsSummaryFetcher *)v16;

    v18 = objc_alloc(MEMORY[0x1E0D66850]);
    -[PKAccount accountIdentifier](v13->_account, "accountIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithAccountIdentifier:accountService:", v19, v13->_accountService);
    enhancedMerchantsFetcher = v13->_enhancedMerchantsFetcher;
    v13->_enhancedMerchantsFetcher = (PKAccountEnhancedMerchantsFetcher *)v20;

    v22 = -[PKAccount showRewardsGraph](v13->_account, "showRewardsGraph");
    v37[0] = CFSTR("PKRewardsHubSectionLifetimeSummary");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((v22 & 1) == 0)
    {
      objc_msgSend(v23, "arrayByAddingObject:", CFSTR("PKRewardsHubSectionDateRangeSummary"));
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    v26 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v27 = -[PKRewardsHubSummarySectionController initWithSectionIdentifiers:rewardsFetcher:paymentDataProvider:showRewardsGraph:delegate:]([PKRewardsHubSummarySectionController alloc], "initWithSectionIdentifiers:rewardsFetcher:paymentDataProvider:showRewardsGraph:delegate:", v24, v13->_rewardsFetcher, v26, v22, v13);
    summariesSectionController = v13->_summariesSectionController;
    v13->_summariesSectionController = v27;

    v29 = -[PKEnhancedMerchantsShelfSectionController initWithSectionIdentifier:fetcher:delegate:]([PKEnhancedMerchantsShelfSectionController alloc], "initWithSectionIdentifier:fetcher:delegate:", CFSTR("PKRewardsHubSectionEnhancedMerchantShelf"), v13->_enhancedMerchantsFetcher, v13);
    enhancedMerchantsShelfSectionController = v13->_enhancedMerchantsShelfSectionController;
    v13->_enhancedMerchantsShelfSectionController = v29;

    v31 = -[PKAccountPromotionsSectionController initWithSectionIdentifier:account:accountService:delegate:]([PKAccountPromotionsSectionController alloc], "initWithSectionIdentifier:account:accountService:delegate:", CFSTR("PKRewardsHubSectionAccountPromotions"), *p_account, *p_accountService, v13);
    promotionsSectionController = v13->_promotionsSectionController;
    v13->_promotionsSectionController = v31;

    v33 = -[PKDailyCashSelectionSectionController initWithSectionIdentifier:account:accountService:delegate:]([PKDailyCashSelectionSectionController alloc], "initWithSectionIdentifier:account:accountService:delegate:", CFSTR("PKRewardsHubSectionDailyCashSelection"), *p_account, *p_accountService, v13);
    dailyCashSelectionSectionController = v13->_dailyCashSelectionSectionController;
    v13->_dailyCashSelectionSectionController = v33;

  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id obj;
  _QWORD block[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  int v25;
  _QWORD v26[3];
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2810000000;
  v24[3] = &unk_19E0C78CE;
  v25 = 0;
  -[PKRewardsHubViewController _nonNilSections](self, "_nonNilSections");
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        dispatch_group_enter(v4);
        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke;
        v16[3] = &unk_1E3E66148;
        v18 = v24;
        v19 = v26;
        v17 = v4;
        objc_msgSend(v9, "preflightWithCompletion:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v5);
  }

  if (v10)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E66170;
    block[4] = self;
    v13 = obj;
    v14 = v10;
    v15 = v26;
    dispatch_group_notify(v4, MEMORY[0x1E0C80D38], block);

  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

void __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  char v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = a2;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __54__PKRewardsHubViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSections:animated:", *(_QWORD *)(a1 + 40), 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKRewardsHubViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setBounces:", 1);
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKRewardsHubViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 1);
  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[PKRewardsHubViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F90]);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKRewardsHubViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PKRewardsHubViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersLargeTitles:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PKDailyCashSelectionSectionController analyticsEventReportWithPreSelect:](self->_dailyCashSelectionSectionController, "analyticsEventReportWithPreSelect:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  -[PKRewardsHubViewController reportEventIfNecessary:](self, "reportEventIfNecessary:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRewardsHubViewController reportEventIfNecessary:](self, "reportEventIfNecessary:", v4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PKDynamicCollectionViewController reloadDataWithoutRebuildingDataStores](self, "reloadDataWithoutRebuildingDataStores");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  PKRewardsHubSummarySectionController *summariesSectionController;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PKRewardsHubViewController traitCollection](self, "traitCollection");
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
        summariesSectionController = self->_summariesSectionController;
        -[PKDynamicCollectionViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKRewardsHubSummarySectionController traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](summariesSectionController, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v6, v11);

        -[PKDynamicCollectionViewController reloadDataWithoutRebuildingDataStores](self, "reloadDataWithoutRebuildingDataStores");
      }
    }
  }

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKRewardsHubViewController;
  -[PKRewardsHubViewController willMoveToParentViewController:](&v9, sel_willMoveToParentViewController_);
  if (!a3)
  {
    v5 = *MEMORY[0x1E0D68B18];
    v6 = *MEMORY[0x1E0D68858];
    v10[0] = *MEMORY[0x1E0D68AA0];
    v10[1] = v6;
    v7 = *MEMORY[0x1E0D687C0];
    v11[0] = v5;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRewardsHubViewController reportEventIfNecessary:](self, "reportEventIfNecessary:", v8);

  }
}

- (void)scrollToPromotionWithProgramIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke;
  aBlock[3] = &unk_1E3E614F0;
  v10 = v8;
  v17 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (v7)
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke_2;
    v13[3] = &unk_1E3E65388;
    v13[4] = self;
    v14 = v7;
    v15 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
  }

}

uint64_t __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__PKRewardsHubViewController_scrollToPromotionWithProgramIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "promotionForProgramIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (id)v2;
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "scrollToItem:atScrollPosition:animated:", v2, 1, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)navigateToRewardsHubDestination:(int64_t)a3
{
  if (a3 == 1)
    -[PKRewardsHubViewController presentEnhancedMerchantsListWithCompletion:](self, "presentEnhancedMerchantsListWithCompletion:", 0);
}

- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  PKBasicWebViewController *v9;
  void *v10;
  int v11;
  PKNavigationController *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v13 = v8;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v9 = (PKBasicWebViewController *)objc_claimAutoreleasedReturnValue();
      -[PKBasicWebViewController openSensitiveURL:withOptions:](v9, "openSensitiveURL:withOptions:", v13, 0);
    }
    else if (v5
           && (objc_msgSend(v8, "scheme"),
               v10 = (void *)objc_claimAutoreleasedReturnValue(),
               v11 = objc_msgSend(v10, "containsString:", CFSTR("http")),
               v10,
               v11))
    {
      v9 = -[PKBasicWebViewController initWithURL:]([PKBasicWebViewController alloc], "initWithURL:", v13);
      v12 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v9);
      -[PKRewardsHubViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v9 = (PKBasicWebViewController *)objc_claimAutoreleasedReturnValue();
      -[PKBasicWebViewController openURL:withOptions:](v9, "openURL:withOptions:", v13, 0);
    }

    v8 = v13;
  }

}

- (void)openLinkedApplication:(id)a3
{
  objc_msgSend(a3, "openApplication:withLaunchOptions:", self, 1);
}

- (void)presentEducationViewController
{
  PKNavigationController *v3;
  PKRewardsEducationViewController *v4;

  v4 = -[PKRewardsEducationViewController initWithAccount:accountService:enhancedMerchantsFetcher:]([PKRewardsEducationViewController alloc], "initWithAccount:accountService:enhancedMerchantsFetcher:", self->_account, self->_accountService, self->_enhancedMerchantsFetcher);
  v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
  -[PKRewardsHubViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)reportEventIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D689B0], *MEMORY[0x1E0D68F50]);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "reportAccountRewardsEventIfNecessary:", v4);

}

- (void)presentEnhancedMerchant:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__PKRewardsHubViewController_presentEnhancedMerchant___block_invoke;
    v6[3] = &unk_1E3E740C0;
    v7 = v4;
    -[PKRewardsHubViewController presentEnhancedMerchantsListWithCompletion:](self, "presentEnhancedMerchantsListWithCompletion:", v6);

  }
}

uint64_t __54__PKRewardsHubViewController_presentEnhancedMerchant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scrollToItem:atScrollPosition:animated:", *(_QWORD *)(a1 + 32), 1, 1);
}

- (id)_nonNilSections
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_summariesSectionController);
  objc_msgSend(v3, "safelyAddObject:", self->_dailyCashSelectionSectionController);
  if (-[PKAccount showCardPromotions](self->_account, "showCardPromotions"))
    objc_msgSend(v3, "safelyAddObject:", self->_promotionsSectionController);
  if (-[PKAccount showEnhancedMerchants](self->_account, "showEnhancedMerchants"))
    objc_msgSend(v3, "safelyAddObject:", self->_enhancedMerchantsShelfSectionController);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)presentEnhancedMerchantsListWithCompletion:(id)a3
{
  id v4;
  PKEnhancedMerchantsViewController *v5;
  uint64_t v6;
  PKEnhancedMerchantsViewController *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  PKEnhancedMerchantsViewController *v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = -[PKEnhancedMerchantsViewController initWithAccount:accountService:enhancedMerchantsFetcher:]([PKEnhancedMerchantsViewController alloc], "initWithAccount:accountService:enhancedMerchantsFetcher:", self->_account, self->_accountService, self->_enhancedMerchantsFetcher);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E61B90;
  objc_copyWeak(&v15, &location);
  v7 = v5;
  v13 = v7;
  v8 = v4;
  v14 = v8;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_4;
  v10[3] = &unk_1E3E614F0;
  v9 = _Block_copy(aBlock);
  v11 = v9;
  -[PKEnhancedMerchantsViewController preflightWithCompletion:](v7, "preflightWithCompletion:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", a1[4]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_3;
  v4[3] = &unk_1E3E618A0;
  v6 = a1[5];
  v5 = a1[4];
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, v4);

}

uint64_t __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __73__PKRewardsHubViewController_presentEnhancedMerchantsListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyCashSelectionSectionController, 0);
  objc_storeStrong((id *)&self->_promotionsSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsShelfSectionController, 0);
  objc_storeStrong((id *)&self->_summariesSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_rewardsFetcher, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
