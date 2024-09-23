@implementation PKEnhancedMerchantsViewController

- (PKEnhancedMerchantsViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKEnhancedMerchantsViewController *v12;
  PKEnhancedMerchantsViewController *v13;
  void *v14;
  PKEnhancedMerchantsListSectionController *v15;
  PKEnhancedMerchantsListSectionController *enhancedMerchantsListSectionController;
  void *v17;
  objc_super v19;
  PKEnhancedMerchantsListSectionController *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKEnhancedMerchantsViewController;
  v12 = -[PKDynamicCollectionViewController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v12, "setUseItemIdentityWhenUpdating:", 1);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_accountService, a4);
    objc_storeStrong((id *)&v13->_enhancedMerchantsFetcher, a5);
    v21[0] = CFSTR("PKEnhancedMerchantsListSectionMerchantList");
    v21[1] = CFSTR("PKEnhancedMerchantsListSectionMerchantDisclosures");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKEnhancedMerchantsListSectionController initWithSectionIdentifiers:fetcher:delegate:]([PKEnhancedMerchantsListSectionController alloc], "initWithSectionIdentifiers:fetcher:delegate:", v14, v13->_enhancedMerchantsFetcher, v13);
    enhancedMerchantsListSectionController = v13->_enhancedMerchantsListSectionController;
    v13->_enhancedMerchantsListSectionController = v15;

    v20 = v13->_enhancedMerchantsListSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController setSections:animated:](v13, "setSections:animated:", v17, 0);

  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
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
  v11 = a3;
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
  -[PKEnhancedMerchantsViewController _nonNilSections](self, "_nonNilSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v20 = 0u;
  -[PKEnhancedMerchantsViewController _nonNilSections](self, "_nonNilSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        dispatch_group_enter(v4);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke;
        v16[3] = &unk_1E3E66148;
        v18 = v24;
        v19 = v26;
        v17 = v4;
        objc_msgSend(v9, "preflightWithCompletion:", v16);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }

  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E66170;
    block[4] = self;
    v13 = v10;
    v14 = v11;
    v15 = v26;
    dispatch_group_notify(v4, MEMORY[0x1E0C80D38], block);

  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

void __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
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

uint64_t __61__PKEnhancedMerchantsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSections:animated:", *(_QWORD *)(a1 + 40), 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v4 = (void *)MEMORY[0x1E0DC3428];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __48__PKEnhancedMerchantsViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E3E62BD0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "actionWithHandler:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 24, v5, v10, v11, v12, v13);

  -[PKEnhancedMerchantsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v8, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v8, "setBounces:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __48__PKEnhancedMerchantsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantsViewController reportEventIfNecessary:](self, "reportEventIfNecessary:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKEnhancedMerchantsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantsViewController reportEventIfNecessary:](self, "reportEventIfNecessary:", v4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKEnhancedMerchantsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKEnhancedMerchantsViewController;
  -[PKEnhancedMerchantsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKEnhancedMerchantsViewController traitCollection](self, "traitCollection");
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
        -[PKDynamicCollectionViewController reloadDataWithoutRebuildingDataStores](self, "reloadDataWithoutRebuildingDataStores");
    }
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)scrollToMerchantWithPrivateIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
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
  aBlock[2] = __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke;
  aBlock[3] = &unk_1E3E614F0;
  v10 = v8;
  v17 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (v7)
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke_2;
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

uint64_t __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__PKEnhancedMerchantsViewController_scrollToMerchantWithPrivateIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "merchantForPrivateIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (id)v2;
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "scrollToItem:atScrollPosition:animated:", v2, 1, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)navigateToRewardsHubDestination:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7[5];

  if (!a3)
  {
    v7[3] = v3;
    v7[4] = v4;
    objc_initWeak(v7, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__PKEnhancedMerchantsViewController_navigateToRewardsHubDestination___block_invoke;
    v5[3] = &unk_1E3E61310;
    objc_copyWeak(&v6, v7);
    dispatch_async(MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(v7);
  }
}

void __69__PKEnhancedMerchantsViewController_navigateToRewardsHubDestination___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  }
}

- (void)openURL:(id)a3 sensitive:(BOOL)a4 preferInApp:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  if (v6)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
      objc_msgSend(v7, "openSensitiveURL:withOptions:", v9, 0);
    else
      objc_msgSend(v7, "openURL:withOptions:", v9, 0);

    v6 = v9;
  }

}

- (void)openLinkedApplication:(id)a3
{
  objc_msgSend(a3, "openApplication:withLaunchOptions:", self, 1);
}

- (void)reportEventIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68A70], *MEMORY[0x1E0D68F50]);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "reportAccountRewardsEventIfNecessary:", v4);

}

- (void)presentDisplayableError:(id)a3
{
  id v4;

  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  -[PKEnhancedMerchantsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_nonNilSections
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_enhancedMerchantsListSectionController);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedMerchantsListSectionController, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
