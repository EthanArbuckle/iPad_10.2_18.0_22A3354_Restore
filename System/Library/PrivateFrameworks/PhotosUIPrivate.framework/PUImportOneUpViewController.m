@implementation PUImportOneUpViewController

- (PUImportOneUpViewController)initWithImportController:(id)a3 mediaProvider:(id)a4 startingAssetReference:(id)a5 presentationFilter:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PUImportOneUpViewController *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  PUImportOneUpViewControllerSpecManager *v17;
  PUImportOneUpViewControllerSpecManager *specManager;
  uint64_t v19;
  PLDateRangeFormatter *dayFormatter;
  uint64_t v21;
  PLDateRangeFormatter *timeFormatter;
  void *v23;
  PUImportActionCoordinator *v24;
  PUImportActionCoordinator *actionCoordinator;
  void *v26;
  void *v27;
  uint64_t v28;
  PFCoalescer *relayoutCoalescer;
  uint64_t v30;
  NSMutableArray *itemsNeedingRelayout;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PUImportOneUpViewController;
  v13 = -[PUImportOneUpViewController initWithNibName:bundle:](&v33, sel_initWithNibName_bundle_, 0, 0);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem");

    if (a6 == 3)
      v16 = v15;
    else
      v16 = 0;
    v17 = -[PUImportOneUpViewControllerSpecManager initWithExtendedTraitCollection:options:style:]([PUImportOneUpViewControllerSpecManager alloc], "initWithExtendedTraitCollection:options:style:", 0, 0, v16);
    specManager = v13->_specManager;
    v13->_specManager = v17;

    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong((id *)&v13->_startingAssetReference, a5);
    v13->_presentationFilter = a6;
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 2);
    v19 = objc_claimAutoreleasedReturnValue();
    dayFormatter = v13->_dayFormatter;
    v13->_dayFormatter = (PLDateRangeFormatter *)v19;

    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 7);
    v21 = objc_claimAutoreleasedReturnValue();
    timeFormatter = v13->_timeFormatter;
    v13->_timeFormatter = (PLDateRangeFormatter *)v21;

    v13->_allowsSelection = 1;
    -[PUImportOneUpViewController setImportController:](v13, "setImportController:", v10);
    objc_msgSend(v10, "createDataSourceManagerWithLogIdentifier:", CFSTR("1up"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController setImportDataSourceManager:](v13, "setImportDataSourceManager:", v23);

    v24 = -[PUImportActionCoordinator initWithViewController:importController:loggingSource:]([PUImportActionCoordinator alloc], "initWithViewController:importController:loggingSource:", v13, v13->_importController, 1);
    actionCoordinator = v13->_actionCoordinator;
    v13->_actionCoordinator = v24;

    -[PUImportOneUpViewController actionCoordinator](v13, "actionCoordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", v13);

    -[PUImportOneUpViewController actionCoordinator](v13, "actionCoordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPresentsAdditionalDeleteAllConfirmation:", 1);

    objc_msgSend(MEMORY[0x1E0D71080], "coalescerWithLabel:target:queue:action:", CFSTR("Import 1-up re-layout coalescer"), v13, MEMORY[0x1E0C80D38], &__block_literal_global_37779);
    v28 = objc_claimAutoreleasedReturnValue();
    relayoutCoalescer = v13->_relayoutCoalescer;
    v13->_relayoutCoalescer = (PFCoalescer *)v28;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = objc_claimAutoreleasedReturnValue();
    itemsNeedingRelayout = v13->_itemsNeedingRelayout;
    v13->_itemsNeedingRelayout = (NSMutableArray *)v30;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[PUImportOneUpViewController relayoutCoalescer](self, "relayoutCoalescer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[PUImportOneUpViewController setRelayoutCoalescer:](self, "setRelayoutCoalescer:", 0);
  -[PUImportOneUpViewController _cancelAlerts](self, "_cancelAlerts");
  -[PUImportOneUpViewController importController](self, "importController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController importDataSourceManager](self, "importDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDataSourceManager:", v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  v8.receiver = self;
  v8.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController dealloc](&v8, sel_dealloc);
}

- (void)_cancelAlerts
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[PUImportOneUpViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUImportOneUpViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[PUImportOneUpViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", isKindOfClass & 1, 0);
  }
}

- (void)setImportController:(id)a3
{
  PXImportController *v5;
  PXImportController **p_importController;
  PXImportController *importController;
  void *v8;
  void *v9;
  PXImportController *v10;

  v5 = (PXImportController *)a3;
  p_importController = &self->_importController;
  importController = self->_importController;
  if (importController != v5)
  {
    v10 = v5;
    -[PXImportController selectionManager](importController, "selectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterChangeObserver:context:", self, PUImportSelectionManagerObserverContext);

    -[PXImportController unregisterChangeObserver:context:](*p_importController, "unregisterChangeObserver:context:", self, PXImportControllerObserverContext);
    objc_storeStrong((id *)&self->_importController, a3);
    -[PXImportController registerChangeObserver:context:](*p_importController, "registerChangeObserver:context:", self, PXImportControllerObserverContext);
    -[PXImportController selectionManager](*p_importController, "selectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:context:", self, PUImportSelectionManagerObserverContext);

    v5 = v10;
  }

}

- (void)setImportDataSourceManager:(id)a3
{
  PXImportAssetsDataSourceManager *v5;
  PXImportAssetsDataSourceManager **p_importDataSourceManager;
  PXImportAssetsDataSourceManager *importDataSourceManager;
  PXImportAssetsDataSourceManager *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (PXImportAssetsDataSourceManager *)a3;
  p_importDataSourceManager = &self->_importDataSourceManager;
  importDataSourceManager = self->_importDataSourceManager;
  if (importDataSourceManager != v5)
  {
    -[PXImportAssetsDataSourceManager unregisterChangeObserver:context:](importDataSourceManager, "unregisterChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext);
    objc_storeStrong((id *)&self->_importDataSourceManager, a3);
    -[PXImportAssetsDataSourceManager registerChangeObserver:context:](*p_importDataSourceManager, "registerChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext);
    if (-[PUImportOneUpViewController presentationFilter](self, "presentationFilter") == 1)
    {
      -[PXImportAssetsDataSourceManager setShowAlreadyImportedItems:](*p_importDataSourceManager, "setShowAlreadyImportedItems:", 1);
      v8 = *p_importDataSourceManager;
      v9 = 0;
    }
    else
    {
      if (-[PUImportOneUpViewController presentationFilter](self, "presentationFilter") != 2)
      {
        if (-[PUImportOneUpViewController presentationFilter](self, "presentationFilter") == 3)
        {
          -[PXImportAssetsDataSourceManager setShowAlreadyImportedItems:](*p_importDataSourceManager, "setShowAlreadyImportedItems:", 1);
          -[PXImportAssetsDataSourceManager setShowNotYetImportedItems:](*p_importDataSourceManager, "setShowNotYetImportedItems:", 1);
          -[PUImportOneUpViewController startingAssetReference](self, "startingAssetReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "asset");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0C99E60];
          v19[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithArray:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXImportAssetsDataSourceManager setVisibleImportAssetIdentifiers:](*p_importDataSourceManager, "setVisibleImportAssetIdentifiers:", v18);

        }
        goto LABEL_7;
      }
      -[PXImportAssetsDataSourceManager setShowAlreadyImportedItems:](*p_importDataSourceManager, "setShowAlreadyImportedItems:", 0);
      v8 = *p_importDataSourceManager;
      v9 = 1;
    }
    -[PXImportAssetsDataSourceManager setShowNotYetImportedItems:](v8, "setShowNotYetImportedItems:", v9);
    -[PXImportAssetsDataSourceManager setVisibleImportAssetIdentifiers:](*p_importDataSourceManager, "setVisibleImportAssetIdentifiers:", 0);
LABEL_7:
    -[PUImportOneUpViewController importDataSourceManager](self, "importDataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFilteredAssetsIfNeeded");

    -[PUImportOneUpViewController importDataSourceManager](self, "importDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController setImportDataSource:](self, "setImportDataSource:", v12);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  _QWORD v13[4];
  id v14;
  PUImportOneUpViewController *v15;

  v6 = a4;
  v8 = a3;
  if ((void *)PXImportControllerObserverContext == a5)
  {
    if ((v6 & 2) != 0 || (v6 & 4) != 0 || (v6 & 0x10) != 0)
      -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems");
  }
  else if ((void *)PXImportAssetsDataSourceManagerObserverContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PUImportOneUpViewController importDataSourceManager](self, "importDataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__PUImportOneUpViewController_observable_didChange_context___block_invoke;
      v13[3] = &unk_1E58ABCA8;
      v14 = v10;
      v15 = self;
      v11 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
  }
  else if ((v6 & 1) != 0 && (void *)PUImportSelectionManagerObserverContext == a5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PUImportOneUpViewController_observable_didChange_context___block_invoke_2;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)handleNewDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  if (v6 != objc_msgSend(v4, "identifier"))
  {
    if (-[PUImportOneUpViewController performingDataSourceChange](self, "performingDataSourceChange"))
    {
      _importOneUpLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v12 = objc_msgSend(v4, "identifier");
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Collection view is performing changes, making pending data source: %ti", buf, 0xCu);
      }

      -[PUImportOneUpViewController setPendingDataSource:](self, "setPendingDataSource:", v4);
    }
    else
    {
      if (-[PUImportOneUpViewController px_isVisible](self, "px_isVisible"))
      {
        -[PUImportOneUpViewController importController](self, "importController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isLoadingInitialBatchOfAssets") ^ 1;

      }
      else
      {
        v9 = 0;
      }
      -[PUImportOneUpViewController setPerformingDataSourceChange:](self, "setPerformingDataSourceChange:", 1);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__PUImportOneUpViewController_handleNewDataSource___block_invoke;
      v10[3] = &unk_1E58ABD10;
      v10[4] = self;
      -[PUImportOneUpViewController transitionFromDataSource:toDataSource:animated:completionHandler:](self, "transitionFromDataSource:toDataSource:animated:completionHandler:", v5, v4, v9, v10);
    }
  }

}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PUImportChangeDetailsCollectionViewHelper *v20;
  void *v21;
  PUImportChangeDetailsCollectionViewHelper *v22;
  void *v23;
  unsigned int v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(_QWORD);
  _QWORD v28[4];
  id v29;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if ((-[PUImportOneUpViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    -[PUImportOneUpViewController importDataSourceManager](self, "importDataSourceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "changeHistory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportOneUpViewController changeDetailsHelper](self, "changeDetailsHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x1E0C809B0];
    if (!v18)
    {
      v24 = v7;
      objc_initWeak(&location, self);
      v20 = [PUImportChangeDetailsCollectionViewHelper alloc];
      -[PUImportOneUpViewController collectionView](self, "collectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke;
      v28[3] = &unk_1E58A0E18;
      objc_copyWeak(&v29, &location);
      v22 = -[PUImportChangeDetailsCollectionViewHelper initWithCollectionView:dataSourceSettingHandler:](v20, "initWithCollectionView:dataSourceSettingHandler:", v21, v28);
      -[PUImportOneUpViewController setChangeDetailsHelper:](self, "setChangeDetailsHelper:", v22);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      v7 = v24;
      v19 = MEMORY[0x1E0C809B0];
    }
    -[PUImportOneUpViewController changeDetailsHelper](self, "changeDetailsHelper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2;
    v25[3] = &unk_1E58A0470;
    v25[4] = self;
    v26 = v15;
    v27 = v12;
    objc_msgSend(v23, "transitionFromDataSource:toDataSource:changeHistory:animated:completionHandler:", v10, v11, v17, v7, v25);

  }
  else
  {
    -[PUImportOneUpViewController setImportDataSource:](self, "setImportDataSource:", v11);
    if (v12)
      v12[2](v12);
  }

}

- (void)updateVisibleCellBadgesAndSelectability
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("PUSelectableAssetBadgeKind"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke;
  v5[3] = &unk_1E58A0498;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PUImportOneUpViewController updateMainViewAnimated:](self, "updateMainViewAnimated:", 0);
  -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrubberCellClass:", objc_opt_class());
  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setScrubberDelegate:", self);
  -[UIViewController pu_toolbarViewModel](self, "pu_toolbarViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__PUImportOneUpViewController_viewDidLoad__block_invoke;
  v10 = &unk_1E58ABCA8;
  v11 = v4;
  v12 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "performChanges:", &v7);
  -[PUImportOneUpViewController _updateBarItemsAnimated:](self, "_updateBarItemsAnimated:", 0, v7, v8, v9, v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewWillAppear:](&v11, sel_viewWillAppear_);
  -[PUImportOneUpViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_modalTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "hasInstalledDismissGestureRecognizers") & 1) == 0)
  {
    -[PUImportOneUpViewController transitionCoordinator](self, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PUImportOneUpViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "installDismissGestureRecognizersOnView:", v8);

  }
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  -[PUImportOneUpViewController beginCenterPrioritizedThumbnailLoading](self, "beginCenterPrioritizedThumbnailLoading");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUImportOneUpViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PUImportOneUpViewController _cancelAlerts](self, "_cancelAlerts");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[PUImportOneUpViewController updateCollectionViewLayoutInsets](self, "updateCollectionViewLayoutInsets");
  if (!-[PUImportOneUpViewController hasPerformedNavigationToStartingAsset](self, "hasPerformedNavigationToStartingAsset"))
  {
    -[PUImportOneUpViewController setHasPerformedNavigationToStartingAsset:](self, "setHasPerformedNavigationToStartingAsset:", 1);
    v9 = 0u;
    v10 = 0u;
    -[PUImportOneUpViewController importDataSource](self, "importDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController startingAssetReference](self, "startingAssetReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "itemIndexPathForItem:", v5);
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
    }

    if ((_QWORD)v9 != *MEMORY[0x1E0D7CE28])
    {
      PXIndexPathFromSimpleIndexPath();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber", v9, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelectedIndexPath:", v6);

      -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v6, 0);
      -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadData");

    }
  }
}

- (BOOL)pu_wantsToolbarVisible
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem");

  return !v4 || -[PUImportOneUpViewController presentationFilter](self, "presentationFilter") != 3;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v4, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *inFlightReferenceIndexPath;
  NSIndexPath *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[9];
  _QWORD v28[5];
  objc_super v29;

  height = a3.height;
  width = a3.width;
  v29.receiver = self;
  v29.super_class = (Class)PUImportOneUpViewController;
  v7 = a4;
  -[PUImportOneUpViewController viewWillTransitionToSize:withTransitionCoordinator:](&v29, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v8);
  v9 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
  self->_inFlightReferenceIndexPath = v9;
  v11 = v9;

  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutReferenceSize:", width, height);

  -[PUImportOneUpViewController updateCollectionViewLayoutInsets](self, "updateCollectionViewLayoutInsets");
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_contentScrollInset");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentSize");
  v24 = v21 + v23;

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setContentScrollInset:", v15, v17, v19, v24);

  -[PUImportOneUpViewController inFlightReferenceIndexPath](self, "inFlightReferenceIndexPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v26, 0);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v28[3] = &unk_1E58A7A08;
  v28[4] = self;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v27[3] = &unk_1E58A04C0;
  v27[4] = self;
  *(double *)&v27[5] = v15;
  *(double *)&v27[6] = v17;
  *(double *)&v27[7] = v19;
  *(double *)&v27[8] = v21;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v28, v27);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)updateToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIBarButtonItem *v38;
  UIBarButtonItem *bottomSpacerBarButtonItem;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isImportingAssets");

  if (v8)
  {
    -[PUImportOneUpViewController stopImportBarButtonItem](self, "stopImportBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);
  }
  else
  {
    -[PUImportOneUpViewController importDataSource](self, "importDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfSelectableItems");

    if (!v11)
      goto LABEL_10;
    objc_msgSend(v6, "count");
    -[PUImportOneUpViewController importBarButtonItem](self, "importBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    -[PUImportOneUpViewController actionCoordinator](self, "actionCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController importBarButtonItem](self, "importBarButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configureImportActionsForBarButtonItem:", v14);

    PLLocalizedFrameworkString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController deleteBarButtonItem](self, "deleteBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityLabel:", v9);

    -[PUImportOneUpViewController importController](self, "importController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "importSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "canDeleteContent");

    if (v18)
    {
      -[PUImportOneUpViewController traitCollection](self, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "horizontalSizeClass");

      -[PUImportOneUpViewController deleteBarButtonItem](self, "deleteBarButtonItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == 1)
        v22 = v4;
      else
        v22 = v3;
      objc_msgSend(v22, "addObject:", v21);

    }
  }

LABEL_10:
  -[PUImportOneUpViewController importController](self, "importController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isImportingAssets"))
  {

  }
  else
  {
    -[PUImportOneUpViewController importController](self, "importController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isDeletingAssets");

    if (!v25)
      goto LABEL_14;
  }
  -[PUImportOneUpViewController progressButtonItem](self, "progressButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

LABEL_14:
  -[PUImportOneUpViewController importController](self, "importController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "hasLoadedInitialBatchOfAssets"))
  {
    -[PUImportOneUpViewController importController](self, "importController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isLoadingInitialBatchOfAssets") & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      -[PUImportOneUpViewController importController](self, "importController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isImportingAssets") & 1) != 0)
      {
        v29 = 0;
      }
      else
      {
        -[PUImportOneUpViewController importController](self, "importController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v31, "isDeletingAssets") ^ 1;

      }
    }

  }
  else
  {
    v29 = 0;
  }

  -[PUImportOneUpViewController importBarButtonItem](self, "importBarButtonItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEnabled:", v29);

  -[PUImportOneUpViewController deleteBarButtonItem](self, "deleteBarButtonItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setEnabled:", v29);

  -[PUImportOneUpViewController navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRightBarButtonItems:", v3);

  -[UIViewController pu_toolbarViewModel](self, "pu_toolbarViewModel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "toolbarItems");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PUImportOneUpViewController bottomSpacerBarButtonItem](self, "bottomSpacerBarButtonItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      v38 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      bottomSpacerBarButtonItem = self->_bottomSpacerBarButtonItem;
      self->_bottomSpacerBarButtonItem = v38;

    }
    -[PUImportOneUpViewController bottomSpacerBarButtonItem](self, "bottomSpacerBarButtonItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObject:atIndex:", v40, 0);

  }
  if ((objc_msgSend(v36, "isEqualToArray:", v4) & 1) == 0)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __49__PUImportOneUpViewController_updateToolbarItems__block_invoke;
    v41[3] = &unk_1E58ABCA8;
    v42 = v35;
    v43 = v4;
    objc_msgSend(v42, "performChanges:", v41);

  }
}

- (void)updateNavigationItemTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  int64_t v26;
  id v27;
  id v28;
  id v29;
  __CFString *v30;
  __CFString *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  int64_t v36;

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isImportingAssets");

  -[PUImportOneUpViewController importController](self, "importController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDeletingAssets");

  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "showProgressTitles");

  if (!objc_msgSend(v6, "count") || ((v8 | v10) & v12 & 1) != 0)
  {
    PLLocalizedFrameworkString();
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedSelectionMessageForAssets();
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  if (v4)
  {
    -[PUImportOneUpViewController assetAtIndexPath:](self, "assetAtIndexPath:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "creationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PUImportOneUpViewController dayFormatter](self, "dayFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[PUImportOneUpViewController timeFormatter](self, "timeFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v16);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = &stru_1E58AD278;
      v18 = &stru_1E58AD278;
    }
    if (-[__CFString length](v18, "length"))
    {
      if (-[__CFString length](v20, "length"))
      {
        PULocalizedString(CFSTR("PUPHOTOBROWSER_TITLE_LONG_DATE_FORMAT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v20;
        PUStringWithValidatedFormat();
        v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
        goto LABEL_17;
      }
      v23 = v18;
    }
    else
    {
      v23 = v20;
    }
    v21 = v23;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:
  -[PUImportOneUpViewController navigationTitleView](self, "navigationTitleView", v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PUImportOneUpViewController _titleViewVerticalSizeClassForExtendedTraitCollection:](self, "_titleViewVerticalSizeClassForExtendedTraitCollection:", v25);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __56__PUImportOneUpViewController_updateNavigationItemTitle__block_invoke;
  v32[3] = &unk_1E58AAA58;
  v33 = v24;
  v34 = v14;
  v35 = v21;
  v36 = v26;
  v27 = v21;
  v28 = v14;
  v29 = v24;
  objc_msgSend(v29, "performChanges:", v32);

}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "layoutSizeClass") == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (void)_updateBarItemsAnimated:(BOOL)a3
{
  void *v4;
  PXNavigationTitleView *v5;
  PXNavigationTitleView *navigationTitleView;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *cancelBarButtonItem;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *importBarButtonItem;
  void *v16;
  id v17;
  void *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *stopImportBarButtonItem;
  void *v21;
  UIBarButtonItem *v22;
  UIBarButtonItem *deleteBarButtonItem;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIBarButtonItem *v29;
  UIBarButtonItem *progressButtonItem;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpViewController navigationTitleView](self, "navigationTitleView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (PXNavigationTitleView *)objc_alloc_init(MEMORY[0x1E0D7B630]);
    navigationTitleView = self->_navigationTitleView;
    self->_navigationTitleView = v5;

  }
  -[PUImportOneUpViewController cancelBarButtonItem](self, "cancelBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR(" "), 0, self, sel__cancelAction_);
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v8;

    -[PUImportOneUpViewController cancelBarButtonItem](self, "cancelBarButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setShowsBackButtonIndicator:", 1);

  }
  -[PUImportOneUpViewController importBarButtonItem](self, "importBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PLLocalizedFrameworkString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIBarButtonItem *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 2, 0, 0);
    importBarButtonItem = self->_importBarButtonItem;
    self->_importBarButtonItem = v14;

  }
  -[PUImportOneUpViewController stopImportBarButtonItem](self, "stopImportBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PLLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (UIBarButtonItem *)objc_msgSend(v17, "initWithTitle:style:target:action:", v18, 0, self, sel__stopImportAction_);
    stopImportBarButtonItem = self->_stopImportBarButtonItem;
    self->_stopImportBarButtonItem = v19;

  }
  -[PUImportOneUpViewController deleteBarButtonItem](self, "deleteBarButtonItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v22 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 16, self, sel__deleteAction_);
    deleteBarButtonItem = self->_deleteBarButtonItem;
    self->_deleteBarButtonItem = v22;

  }
  -[PUImportOneUpViewController progressButtonItem](self, "progressButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", 3, 0.0, 0.0, 28.0, 28.0);
    -[PUImportOneUpViewController setRoundProgressView:](self, "setRoundProgressView:", v25);

    -[PUImportOneUpViewController roundProgressView](self, "roundProgressView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController roundProgressView](self, "roundProgressView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v28);

    objc_msgSend(v27, "setFrame:", 0.0, 0.0, 28.0, 28.0);
    v29 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v27);
    progressButtonItem = self->_progressButtonItem;
    self->_progressButtonItem = v29;

    -[UIBarButtonItem setIsAccessibilityElement:](self->_progressButtonItem, "setIsAccessibilityElement:", 1);
    -[UIBarButtonItem setAccessibilityTraits:](self->_progressButtonItem, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0] | *MEMORY[0x1E0DC46E0]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_importControllerProgressDidChange_, *MEMORY[0x1E0D7C420], 0);

  }
  -[PUImportOneUpViewController cancelBarButtonItem](self, "cancelBarButtonItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLeftBarButtonItems:", v33);
  -[PUImportOneUpViewController navigationTitleView](self, "navigationTitleView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTitleView:", v35);

  -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems");
  -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");

}

- (void)updateMainViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PUSelectableAssetCollectionViewLayout *v9;
  double v10;
  double v11;
  id v12;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;

  if (-[PUImportOneUpViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    -[PUImportOneUpViewController specManager](self, "specManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    memset(v21, 0, sizeof(v21));
    -[PUImportOneUpViewController getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "getMainCollectionViewFrame:collectionViewLayoutInsets:", &v22, v21);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoCollectionViewBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
    v9 = (PUSelectableAssetCollectionViewLayout *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interItemSpacing");
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        objc_msgSend(v8, "setFrame:", v22, v23);
        -[PUImportOneUpViewController updateCollectionViewLayoutInsets](self, "updateCollectionViewLayoutInsets");

        return;
      }
    }
    else
    {
      v11 = v10;
      v9 = objc_alloc_init(PUSelectableAssetCollectionViewLayout);
      -[PUHorizontalCollectionViewLayout setInteritemSpacing:](v9, "setInteritemSpacing:", v11);
      objc_msgSend(v5, "selectionBadgeOffset");
      -[PUSelectableAssetCollectionViewLayout setSharingBadgeOffset:](v9, "setSharingBadgeOffset:");
      -[PUHorizontalCollectionViewLayout setDelegate:](v9, "setDelegate:", self);
      objc_storeStrong((id *)&self->_collectionViewLayout, v9);
      if (v8)
        goto LABEL_4;
    }
    v12 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v8 = (void *)objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v9, v22, v23);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v8, "setAlwaysBounceHorizontal:", 1);
    objc_msgSend(v8, "setPagingEnabled:", 0);
    objc_msgSend(v8, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    objc_msgSend(v8, "setDataSource:", self);
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v8, "setBackgroundColor:", v7);
    objc_msgSend(v8, "setDelaysContentTouches:", 0);
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUImportOneUpCellIdentifier"));
    objc_msgSend(v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUSelectableAssetBadgeKind"), CFSTR("PUImportOneUpBadgeIdentifier"));
    objc_msgSend(v8, "setContentInsetAdjustmentBehavior:", 2);
    v13 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapInMainCollectionView_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v13;

    -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfTapsRequired:", 1);

    -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfTouchesRequired:", 1);

    -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v18);

    objc_storeStrong((id *)&self->_collectionView, v8);
    -[PUImportOneUpViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    goto LABEL_4;
  }
}

- (void)getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  -[PUImportOneUpViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutReferenceSize");
  v18 = v17;
  v20 = v19;
  v21 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v18 != v21 || v20 != v22)
  {
    -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutReferenceSize");
    v13 = v25;
    v15 = v26;

  }
  if (a3)
  {
    a3->origin.x = v9;
    a3->origin.y = v11;
    a3->size.width = v13;
    a3->size.height = v15;
  }
  if (a4)
  {
    -[PUImportOneUpViewController px_safeAreaInsets](self, "px_safeAreaInsets");
    UIEdgeInsetsMax();
    a4->top = v27;
    a4->left = v28;
    a4->bottom = v29;
    a4->right = v30;
  }
}

- (void)getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "firstItemIndexPath");
    objc_msgSend(v7, "lastItemIndexPath");
    PXIndexPathFromSimpleIndexPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXIndexPathFromSimpleIndexPath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v8 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v8);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease(v9);

}

- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double rect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUImportOneUpViewController specManager](self, "specManager", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "selectionBadgeSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "selectionBadgeOffset");
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend(v9, "selectionBadgeCorner");
  if (v18 != 1)
  {
    v19 = width;
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    if (v18 == 4)
    {
      v26 = x;
      v27 = y;
      v28 = height;
    }
    else
    {
      v21 = height;
      v22 = *MEMORY[0x1E0C9D648];
      if (v18 == 2)
      {
        v23 = x;
        v24 = y;
        v25 = CGRectGetWidth(*(CGRect *)(&v19 - 2));
        v40.origin.x = v22;
        v40.origin.y = v20;
        v40.size.width = v11;
        v40.size.height = v13;
        v15 = v25 - CGRectGetWidth(v40) - v15;
        goto LABEL_8;
      }
      v29 = x;
      v30 = y;
      v38 = v21;
      rect = v19;
      v37 = CGRectGetWidth(*(CGRect *)(&v19 - 2));
      v41.origin.x = v22;
      v41.origin.y = v20;
      v41.size.width = v11;
      v41.size.height = v13;
      v31 = CGRectGetWidth(v41);
      v28 = v38;
      v15 = v37 - v31 - v15;
      v26 = x;
      v27 = y;
      v19 = rect;
    }
    v32 = CGRectGetHeight(*(CGRect *)(&v19 - 2));
    v42.origin.x = v15;
    v42.origin.y = v20;
    v42.size.width = v11;
    v42.size.height = v13;
    v17 = v32 - CGRectGetHeight(v42) - v17;
  }
LABEL_8:

  v33 = v15;
  v34 = v17;
  v35 = v11;
  v36 = v13;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)beginCenterPrioritizedThumbnailLoading
{
  id v3;

  -[PUImportOneUpViewController setLoadLargeThumbnailsInCustomOrder:](self, "setLoadLargeThumbnailsInCustomOrder:", -[PUImportOneUpViewController isCommitingPreview](self, "isCommitingPreview") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController setThumbnailLoadableItemWhitelist:](self, "setThumbnailLoadableItemWhitelist:", v3);

}

- (void)loadCenterPrioritizedVisibleThumbnails
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[PUImportOneUpViewController loadLargeThumbnailsInCustomOrder](self, "loadLargeThumbnailsInCustomOrder"))
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleItems");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_226);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUImportOneUpViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[PUImportOneUpViewController collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v9, "importItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUImportOneUpViewController thumbnailLoadableItemWhitelist](self, "thumbnailLoadableItemWhitelist");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v10);

          objc_msgSend(v9, "refreshThumbnail");
        }

      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v4 = v5;
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v4);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEqual:", v7, (_QWORD)v21) & 1) == 0)
            {
              -[PUImportOneUpViewController collectionView](self, "collectionView");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "cellForItemAtIndexPath:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v18, "importItem");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUImportOneUpViewController thumbnailLoadableItemWhitelist](self, "thumbnailLoadableItemWhitelist");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v19);

                objc_msgSend(v18, "refreshThumbnail");
              }

            }
          }
          v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      -[PUImportOneUpViewController setLoadLargeThumbnailsInCustomOrder:](self, "setLoadLargeThumbnailsInCustomOrder:", 0);
      -[PUImportOneUpViewController setThumbnailLoadableItemWhitelist:](self, "setThumbnailLoadableItemWhitelist:", 0);

    }
  }
}

- (void)_handleTapAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController _toggleCurrentPickStatusAtIndexPath:](self, "_toggleCurrentPickStatusAtIndexPath:", v6);
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0
    && objc_msgSend(v4, "isTracking"))
  {
    -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginInteractiveUpdate");
    -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v6, 1);

  }
}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  id v17;

  v4 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v17);
  v6 = v5;
  v8 = v7;

  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v11 = v10;
  objc_msgSend(v9, "itemsContentInset");
  v14 = v11 - fabs(v13);
  if (v6 > fabs(v12) && v6 < v14)
  {
    -[PUImportOneUpViewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PUImportOneUpViewController _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", v16);

  }
}

- (id)_currentAsset
{
  void *v3;
  void *v4;
  void *v5;

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController assetAtIndexPath:](self, "assetAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[4];

  v4 = a3;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  PXSimpleIndexPathFromIndexPath();

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v9, 0, sizeof(v9));
  objc_msgSend(v6, "assetAtItemIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)importAssetAtIndexPath:(id)a3
{
  void *v3;
  id v4;

  -[PUImportOneUpViewController assetAtIndexPath:](self, "assetAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGSize result;

  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[PUImportOneUpViewController getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "getMainCollectionViewFrame:collectionViewLayoutInsets:", &v52, &v50);
  v6 = *(double *)&v53 - (*((double *)&v50 + 1) + *((double *)&v51 + 1));
  v7 = *((double *)&v53 + 1) - (*(double *)&v50 + *(double *)&v51);
  objc_msgSend(v5, "orientedPixelSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "useThumbnailSizesAsImageSizeHints");

  v14 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v9 != *MEMORY[0x1E0C9D820] || v11 != v15 || v13 == 0)
    goto LABEL_27;
  objc_msgSend(v4, "largeThumbnailSize");
  if (v19 == v14 && v18 == v15)
  {
    objc_msgSend(v4, "thumbnailSize");
    if (v24 == v14 && v23 == v15)
    {
      -[PUImportOneUpViewController itemsWithInvalidImageSizes](self, "itemsWithInvalidImageSizes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportOneUpViewController setItemsWithInvalidImageSizes:](self, "setItemsWithInvalidImageSizes:", v27);

      }
      -[PUImportOneUpViewController itemsWithInvalidImageSizes](self, "itemsWithInvalidImageSizes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v4);

      goto LABEL_22;
    }
    objc_msgSend(v4, "thumbnailSize");
  }
  else
  {
    objc_msgSend(v4, "largeThumbnailSize");
  }
  v9 = v21;
  v11 = v22;
LABEL_22:
  if (v9 != v14 || v11 != v15)
  {
    -[PUImportOneUpViewController itemsWithInvalidImageSizes](self, "itemsWithInvalidImageSizes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObject:", v4);

  }
LABEL_27:
  -[PUImportOneUpViewController specManager](self, "specManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "spec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "interItemSpacing");
  v34 = v6 + v33 * -4.0;
  v35 = v7 + v33 * -2.0;
  objc_msgSend(v32, "selectionBadgeSize");
  v37 = v36;
  objc_msgSend(v32, "selectionBadgeOffset");
  v39 = v37 + v38 * 2.0;
  PURectWithSizeThatFitsInRect(v9, v11, 0.0, 0.0, v34, v35);
  if (v41 < v39 && v11 < v9)
  {
    v40 = v40 * (v39 / v41);
    v41 = v39;
  }
  if (v40 < v39 && v9 < v11)
  {
    v41 = v41 * (v39 / v40);
    v40 = v39;
  }
  if (v40 >= v39)
    v44 = v40;
  else
    v44 = v39;
  if (v34 < v44)
    v44 = v34;
  if (v41 >= v39)
    v45 = v41;
  else
    v45 = v39;
  if (v35 < v45)
    v45 = v35;
  v46 = round(v44);
  v47 = round(v45);

  v48 = v46;
  v49 = v47;
  result.height = v49;
  result.width = v48;
  return result;
}

- (void)pageToItemOrNearestIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a4;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "itemIndexPathForItem:", v6);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }

  if ((_QWORD)v14 == *MEMORY[0x1E0D7CE28])
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = v14;
  v13 = v15;
  PXIndexPathFromSimpleIndexPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_8:
    -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber", v12, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedIndexPath:", v10);

    -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v10, v4);
  }
LABEL_9:

}

- (void)pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  v8 = v7;
  -[PUImportOneUpViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v11, v6);
  v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
  -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");

}

- (id)indexPathOfCenterVisibleItemInCollectionView:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v10;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  -[PUImportOneUpViewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v4, 0, MidX, CGRectGetMidY(v13));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;
  objc_msgSend(v5, "bounds");
  v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a4.y;
  x = a4.x;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "visibleCells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v10 = 0;
      v14 = *(_QWORD *)v25;
      v15 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v8, "indexPathForCell:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v18) & 1) == 0)
          {
            objc_msgSend(v17, "center");
            v21 = (v20 - y) * (v20 - y) + (v19 - x) * (v19 - x);
            if (v21 < v15)
            {
              v22 = v18;

              v15 = v21;
              v10 = v22;
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)badgeViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  uint64_t v6;
  id v7;
  PUImportOneUpCellBadgeView *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  void *v18;

  if (a4)
  {
    objc_msgSend(a4, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("PUSelectableAssetBadgeKind"), CFSTR("PUImportOneUpBadgeIdentifier"), a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3;
    v8 = [PUImportOneUpCellBadgeView alloc];
    v6 = -[PUImportOneUpCellBadgeView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v9 = (void *)v6;
  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__PUImportOneUpViewController_badgeViewAtIndexPath_forCollectionView___block_invoke;
  v16[3] = &unk_1E58ABCA8;
  v11 = v9;
  v17 = v11;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "performBadgeUpdates:", v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

- (void)updateCollectionViewLayoutInsets
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PUImportOneUpViewController getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "getMainCollectionViewFrame:collectionViewLayoutInsets:", &v19, &v17);
  v15 = 0;
  v16 = 0;
  -[PUImportOneUpViewController getFirstValidIndexPath:lastValidIndexPath:](self, "getFirstValidIndexPath:lastValidIndexPath:", &v16, &v15);
  v3 = v16;
  v4 = v15;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v9 = *((double *)&v17 + 1);
    v11 = *((double *)&v18 + 1);
  }
  else
  {
    -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v3);
    v8 = v7;
    -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v5);
    v9 = *((double *)&v17 + 1) + round((*(double *)&v20 - v8) * 0.5);
    v11 = *((double *)&v18 + 1) + round((*(double *)&v20 - v10) * 0.5);
    *((double *)&v17 + 1) = v9;
    *((double *)&v18 + 1) = v11;
  }
  v12 = *(double *)&v17;
  v13 = *(double *)&v18;
  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItemsContentInset:", v12, v9, v13, v11);

}

- (PUReviewScrubber)reviewScrubber
{
  PUReviewScrubber *reviewScrubber;
  PUReviewScrubber *v4;
  PUReviewScrubber *v5;

  reviewScrubber = self->_reviewScrubber;
  if (!reviewScrubber)
  {
    v4 = objc_alloc_init(PUReviewScrubber);
    v5 = self->_reviewScrubber;
    self->_reviewScrubber = v4;

    reviewScrubber = self->_reviewScrubber;
  }
  return reviewScrubber;
}

- (unsigned)reviewScrubberImageFormat
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "largestUncroppedNonJPEGThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "formatID");

  return v4;
}

- (double)absoluteProgressFromCurrentContentOffset
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "containsAnyItems"))
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportOneUpViewController assetAtIndexPath:](self, "assetAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController importDataSource](self, "importDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "indexOfObject:", v7);
    -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v6);
    v12 = v11;
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentOffset");
    v15 = v14;

    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v16, v6);
    v18 = v17;

    if (v15 >= v18)
    {
      -[PUImportOneUpViewController nextIndexPath:](self, "nextIndexPath:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v12;
      if (v19)
      {
        -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v19);
        v28 = v29;
      }
      -[PUImportOneUpViewController specManager](self, "specManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "spec");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "interItemSpacing");
      v33 = round(v28 * 0.5 + v12 * 0.5 + v18 + v32);

      v27 = (v15 - v18) / (v33 - v18);
      v26 = (double)v10;
    }
    else
    {
      -[PUImportOneUpViewController previousIndexPath:](self, "previousIndexPath:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      if (v19)
      {
        -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v19);
        v20 = v21;
      }
      -[PUImportOneUpViewController specManager](self, "specManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "spec");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "interItemSpacing");
      v25 = round(v18 - v12 * 0.5 - v24 - v20 * 0.5);

      v26 = (double)v10;
      v27 = (v15 - v25) / (v18 - v25) + -1.0;
    }
    v4 = v27 + v26;

  }
  return v4;
}

- (void)_updateReviewScrubberFromContentOffset
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsAnyItems"))
  {
    -[PUImportOneUpViewController absoluteProgressFromCurrentContentOffset](self, "absoluteProgressFromCurrentContentOffset");
    v4 = v3;
    -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithAbsoluteProgress:", v4);

  }
}

- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3
{
  if (self->_allowsSelection)
    -[PUImportOneUpViewController _reallyToggleCurrentPickStatusAtIndexPath:](self, "_reallyToggleCurrentPickStatusAtIndexPath:", a3);
}

- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSelectable"))
  {
    v4 = objc_msgSend(v7, "isSelected");
    -[PUImportOneUpViewController importController](self, "importController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
      objc_msgSend(v5, "deselectItem:", v7);
    else
      objc_msgSend(v5, "selectItem:", v7);

    -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");
    -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems");
  }

}

- (void)_dismissReviewControllerWithAsset:(id)a3
{
  -[PUImportOneUpViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_cancelOneUpView
{
  id v3;

  -[PUImportOneUpViewController _updateBarItemsAnimated:](self, "_updateBarItemsAnimated:", 1);
  -[PUImportOneUpViewController _currentAsset](self, "_currentAsset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController _dismissReviewControllerWithAsset:](self, "_dismissReviewControllerWithAsset:", v3);

}

- (void)_deleteAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUImportOneUpViewController importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  -[PUImportOneUpViewController actionCoordinator](self, "actionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteItemsFromBarButtonItem:withOneUpHintItems:", v4, v7);

}

- (void)_stopImportAction:(id)a3
{
  id v3;

  -[PUImportOneUpViewController actionCoordinator](self, "actionCoordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopImport");

}

- (void)importControllerProgressDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C418]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C410]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C428]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _PFAssertContinueHandler();
  objc_msgSend(v6, "doubleValue");
  v12 = v11;
  _importOneUpLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[PUImportOneUpViewController importControllerProgressDidChange:]";
    v26 = 2048;
    v27 = v12;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "%s: setting progress to %f ", buf, 0x16u);
  }

  if (v12 == 0.0)
  {
    -[PUImportOneUpViewController roundProgressView](self, "roundProgressView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetProgress");

  }
  -[PUImportOneUpViewController importController](self, "importController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "isDeletingAssets");

  PLLocalizedFrameworkString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController roundProgressView](self, "roundProgressView", v17, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProgress:", v12);

  -[UIBarButtonItem setAccessibilityLabel:](self->_progressButtonItem, "setAccessibilityLabel:", v18);
  if (v12 >= 1.0)
  {
    PLLocalizedFrameworkString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_progressButtonItem, "setAccessibilityLabel:", v20);

  }
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "showProgressTitles");

  if (v22)
    -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 0;
}

- (void)deleteItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUImportOneUpViewController actionCoordinator](self, "actionCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteItemsWithoutConfirmation:", v4);

}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
  void *v4;
  int v5;

  -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems", a3);
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showProgressTitles");

  if (v5)
    -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");
}

- (void)actionCoordinatorDidBeginDelete:(id)a3
{
  void *v4;
  int v5;

  -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems", a3);
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showProgressTitles");

  if (v5)
    -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");
}

- (id)importDestinationForActionCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[PUImportOneUpViewController importController](self, "importController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importDestinationAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_importControllerDidEndAction
{
  void *v3;
  int v4;

  -[PUImportOneUpViewController setAllowsSelection:](self, "setAllowsSelection:", 1);
  -[PUImportOneUpViewController updateToolbarItems](self, "updateToolbarItems");
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showProgressTitles");

  if (v4)
    -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle");
}

- (void)_importControllerWillBeginAction
{
  -[PUImportOneUpViewController setAllowsSelection:](self, "setAllowsSelection:", 0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginInteractiveUpdate");

}

- (void)scrollViewDidScroll:(id)a3
{
  -[PUImportOneUpViewController updateNavigationItemTitle](self, "updateNavigationItemTitle", a3);
  if (!-[PUImportOneUpViewController updatingContentOffsetFromScrubbing](self, "updatingContentOffsetFromScrubbing"))
    -[PUImportOneUpViewController _updateReviewScrubberFromContentOffset](self, "_updateReviewScrubberFromContentOffset");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v4;

  if (!a4)
  {
    -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishInteractiveUpdate");

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3;

  -[PUImportOneUpViewController reviewScrubber](self, "reviewScrubber", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishInteractiveUpdate");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  double width;
  double height;
  double v11;
  double y;
  double MidX;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;

  x = a4.x;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "bounds");
  width = v36.size.width;
  height = v36.size.height;
  v11 = a5->x;
  y = a5->y;
  v36.origin.x = a5->x;
  v36.origin.y = y;
  MidX = CGRectGetMidX(v36);
  objc_msgSend(v8, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutAttributesForElementsInRect:", v11, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    v20 = 1.79769313e308;
    v21 = 1.79769313e308;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v22);
        objc_msgSend(v23, "indexPath", (_QWORD)v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "representedElementCategory"))
        {
          if ((-[PUImportOneUpViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v8, v24), v26 = v25, x == 0.0)|| x > 0.0 && v25 > a5->x|| x < 0.0 && v25 < a5->x)
          {
            objc_msgSend(v23, "center");
            v28 = vabdd_f64(v27, MidX);
            if (v28 < v20)
            {
              v20 = v28;
              v21 = v26;
            }
          }
        }

        ++v22;
      }
      while (v18 != v22);
      v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v18 = v29;
    }
    while (v29);

    if (v21 != 1.79769313e308)
    {
      a5->x = v21;
      a5->y = 0.0;
    }
  }
  else
  {

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  -[PUImportOneUpViewController _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", a4);
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUImportOneUpCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayDelegate:", self);
  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImportItem:", v8);
  objc_msgSend(v7, "setSelected:", objc_msgSend(v8, "isSelected"));
  objc_msgSend(v7, "refreshThumbnail");

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("PUSelectableAssetBadgeKind")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportOneUpViewController.m"), 1530, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUImportOneUpViewController badgeViewAtIndexPath:forCollectionView:](self, "badgeViewAtIndexPath:forCollectionView:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v18[4];

  v7 = a4;
  v8 = a5;
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "showImportItemFilenames");

    if (v11)
    {
      -[PUImportOneUpViewController importDataSource](self, "importDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      PXSimpleIndexPathFromIndexPath();

      -[PUImportOneUpViewController importDataSource](self, "importDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v18, 0, sizeof(v18));
      objc_msgSend(v13, "assetAtItemIndexPath:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "debugDisplayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ [%lu]"), v16, objc_msgSend(v8, "item"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateDebugLabel:", v17);

    }
    else
    {
      objc_msgSend(v9, "updateDebugLabel:", 0);
    }
  }

}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", a5, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[PUImportOneUpViewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", a6, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)importOneUpCell:(id)a3 requestedBadgeUpdateForImportItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isDeleted") & 1) == 0)
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PUImportOneUpViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUSelectableAssetBadgeKind"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __81__PUImportOneUpViewController_importOneUpCell_requestedBadgeUpdateForImportItem___block_invoke;
        v12[3] = &unk_1E58ABCA8;
        v13 = v11;
        v14 = v7;
        objc_msgSend(v13, "performBadgeUpdates:", v12);

      }
    }

  }
}

- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PUImportOneUpViewController loadLargeThumbnailsInCustomOrder](self, "loadLargeThumbnailsInCustomOrder")
    && (-[PUImportOneUpViewController thumbnailLoadableItemWhitelist](self, "thumbnailLoadableItemWhitelist"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "member:", v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PUImportOneUpViewController importController](self, "importController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "importMediaProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__PUImportOneUpViewController_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke;
    v16[3] = &unk_1E58A0528;
    v18 = v10;
    objc_copyWeak(&v19, &location);
    v17 = v9;
    v12 = (void *)objc_msgSend(v14, "requestImageForImportItem:ofSize:priority:completion:", v17, 3, 1, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (int64_t)v12;
}

- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  void *v5;
  id v6;

  -[PUImportOneUpViewController importController](self, "importController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importMediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelImageRequest:", a4);

}

- (void)invalidateLayoutIfNeededForImportItem:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  BOOL v25;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useThumbnailSizesAsImageSizeHints");

  -[PUImportOneUpViewController itemsWithInvalidImageSizes](self, "itemsWithInvalidImageSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "member:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v31;
  if (v7 && v5)
  {
    objc_msgSend(v31, "importAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orientedPixelSize");
    v11 = v10;
    v13 = v12;

    objc_msgSend(v31, "thumbnailSize");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v31, "largeThumbnailSize");
    v19 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v21 != *MEMORY[0x1E0C9D820] || v18 != v20)
    {
      objc_msgSend(v31, "largeThumbnailSize");
      v15 = v23;
      v17 = v24;
    }
    v25 = v11 == v19 && v13 == v20;
    v8 = v31;
    if (v25 && (v15 != v19 || v17 != v20))
    {
      -[PUImportOneUpViewController itemsNeedingRelayout](self, "itemsNeedingRelayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v31);

      -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "invalidateLayout");

      v29 = -[PUImportOneUpViewController isAnimatingTransition](self, "isAnimatingTransition");
      v8 = v31;
      if (!v29)
      {
        -[PUImportOneUpViewController relayoutCoalescer](self, "relayoutCoalescer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "update");

        v8 = v31;
      }
    }
  }

}

- (void)relayoutCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDecelerating") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDragging");

    if ((v6 & 1) != 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "firstItemIndexPath");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  objc_msgSend(v8, "assetAtItemIndexPath:", &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "lastItemIndexPath");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  objc_msgSend(v10, "assetAtItemIndexPath:", &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController itemsNeedingRelayout](self, "itemsNeedingRelayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "containsObject:", v9))
  {

  }
  else
  {
    -[PUImportOneUpViewController itemsNeedingRelayout](self, "itemsNeedingRelayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v11);

    if (!v14)
      goto LABEL_17;
  }
  -[PUImportOneUpViewController updateCollectionViewLayoutInsets](self, "updateCollectionViewLayoutInsets", v24, v25, v26, v27);
LABEL_17:
  -[PUImportOneUpViewController collectionView](self, "collectionView", v24, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

  -[PUImportOneUpViewController updateCollectionViewLayoutInsets](self, "updateCollectionViewLayoutInsets");
  if (v4)
  {
    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;

    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v19, v4);
    v21 = v20;

    -[PUImportOneUpViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentOffset:", v21, v18);

  }
  -[PUImportOneUpViewController itemsNeedingRelayout](self, "itemsNeedingRelayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeAllObjects");

}

- (int64_t)importOneUpScrubberCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  objc_msgSend(a3, "importItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController importController](self, "importController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "importMediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PUImportOneUpViewController_importOneUpScrubberCell_requestedThumbnailForImportItem_completion___block_invoke;
  v14[3] = &unk_1E58A0E68;
  v15 = v7;
  v11 = v7;
  v12 = objc_msgSend(v10, "requestImageForImportItem:ofSize:completion:", v8, 0, v14);

  return v12;
}

- (void)importOneUpScrubberCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  void *v5;
  id v6;

  -[PUImportOneUpViewController importController](self, "importController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importMediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelImageRequest:", a4);

}

- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(v9, "setDisplayDelegate:", self);
  objc_msgSend(v9, "setImportItem:", v8);
  objc_msgSend(v9, "refreshThumbnail");

}

- (void)reviewScrubberDidScrub:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stopScrollingAndZoomingAnimations");

  self->_updatingContentOffsetFromScrubbing = 1;
  objc_msgSend(v4, "selectedIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v6, 0);
  self->_updatingContentOffsetFromScrubbing = 0;

}

- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stopScrollingAndZoomingAnimations");

  -[PUImportOneUpViewController pageToIndexPath:animated:](self, "pageToIndexPath:animated:", v5, 1);
}

- (unint64_t)numberOfSectionsInReviewScrubber:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  void *v5;
  unint64_t v6;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4
{
  return 0;
}

- (id)transitionItemsForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  PUImportOneUpTransitionItem *v22;
  PUImportOneUpTransitionItem *v23;
  void *v24;
  PUImportOneUpTransitionView *v25;
  void *v26;
  void *v27;
  PUImportOneUpTransitionView *v28;
  void *v29;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController indexPathOfCenterVisibleItemInCollectionView:](self, "indexPathOfCenterVisibleItemInCollectionView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpViewController importAssetAtIndexPath:](self, "importAssetAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "itemIndexPathForItem:", v6);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "photoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController imageRectFromPhotoView:](self, "imageRectFromPhotoView:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "contentHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "photoImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [PUImportOneUpTransitionItem alloc];
  v31[0] = v32;
  v31[1] = v33;
  v23 = -[PUImportOneUpTransitionItem initWithInitialFrame:snapshotImage:importItem:indexPath:](v22, "initWithInitialFrame:snapshotImage:importItem:indexPath:", v21, v6, v31, v13, v15, v17, v19);
  objc_msgSend(v11, "contentHelper");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentAlpha");
  -[PUImportOneUpTransitionItem setInitialContentAlpha:](v23, "setInitialContentAlpha:");

  v25 = [PUImportOneUpTransitionView alloc];
  -[PUImportOneUpViewController importController](self, "importController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "importMediaProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PUImportOneUpTransitionView initWithImportItem:startingImage:mediaProvider:](v25, "initWithImportItem:startingImage:mediaProvider:", v6, v21, v27);
  -[PUImportOneUpTransitionItem setTransitionView:](v23, "setTransitionView:", v28);

  v34[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CGRect)targetFrameForTransitionItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  CGRect result;

  objc_msgSend(a3, "importItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "itemIndexPathForItem:", v4);
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }

  PXIndexPathFromSimpleIndexPath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController collectionView](self, "collectionView", v23, v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "photoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController imageRectFromPhotoView:](self, "imageRectFromPhotoView:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)prepareTransitionItemViewForDestination:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;

  v4 = a3;
  objc_msgSend(v4, "transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "initialFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "targetFrame");
    objc_msgSend(v5, "setInitialFrame:targetFrame:", v7, v9, v11, v13, v14, v15, v16, v17);
    objc_msgSend(v4, "importItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    -[PUImportOneUpViewController importDataSource](self, "importDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "itemIndexPathForItem:", v18);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
    }

    PXIndexPathFromSimpleIndexPath();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpViewController collectionView](self, "collectionView", v31, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForItemAtIndexPath:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "photoView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentAlpha");
    v27 = v26;

    objc_msgSend(v4, "setTargetContentAlpha:", v27);
    objc_msgSend(v4, "initialContentAlpha");
    v29 = v28;
    objc_msgSend(v4, "targetContentAlpha");
    objc_msgSend(v5, "setPhotoViewInitialAlpha:targetAlpha:", v29, v30);

  }
}

- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        v20 = 0u;
        v21 = 0u;
        -[PUImportOneUpViewController importDataSource](self, "importDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "importItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v14, "itemIndexPathForItem:", v15);
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }

        PXIndexPathFromSimpleIndexPath();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16, v20, v21);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFloatingCellIndexPaths:", v7);

  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "panGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEnabled:", 0);

  -[PUImportOneUpViewController setAnimatingTransition:](self, "setAnimatingTransition:", 1);
}

- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[PUImportOneUpViewController collectionView](self, "collectionView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "panGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);

  -[PUImportOneUpViewController setAnimatingTransition:](self, "setAnimatingTransition:", 0);
  -[PUImportOneUpViewController itemsNeedingRelayout](self, "itemsNeedingRelayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[PUImportOneUpViewController relayoutCoalescer](self, "relayoutCoalescer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "update");

  }
  -[PUImportOneUpViewController collectionViewLayout](self, "collectionViewLayout");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFloatingCellIndexPaths:", 0);

}

- (CGRect)imageRectFromPhotoView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "contentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "imageContentFrameForBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "convertRect:toView:", 0, v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[PUImportOneUpViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    objc_msgSend(v8, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
      v10 = objc_msgSend(v8, "isDecelerating");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)previousSectionWithItems:(int64_t)a3
{
  void *v4;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (a3-- >= 1)
  {
    if (objc_msgSend(v4, "numberOfItemsInSection:", a3))
      goto LABEL_6;
  }
  a3 = -1;
LABEL_6:

  return a3;
}

- (int64_t)nextSectionWithItems:(int64_t)a3
{
  void *v4;
  unint64_t v5;

  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");
  while (++a3 < v5)
  {
    if (objc_msgSend(v4, "numberOfItemsInSection:", a3))
      goto LABEL_6;
  }
  a3 = -1;
LABEL_6:

  return a3;
}

- (id)previousIndexPath:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "item") < 1)
  {
    v6 = -[PUImportOneUpViewController previousSectionWithItems:](self, "previousSectionWithItems:", objc_msgSend(v4, "section"));
    if (v6 < 0)
    {
      v5 = 0;
    }
    else
    {
      v7 = v6;
      -[PUImportOneUpViewController importDataSource](self, "importDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v8, "numberOfItemsInSection:", v7) - 1, v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v4, "item") - 1, objc_msgSend(v4, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)nextIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;

  v4 = a3;
  -[PUImportOneUpViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");
  if (v6 >= objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v4, "section")) - 1)
  {
    v12 = -[PUImportOneUpViewController nextSectionWithItems:](self, "nextSectionWithItems:", objc_msgSend(v4, "section"));
    if (v12 < 0)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v9 = v12;
    v10 = (void *)MEMORY[0x1E0CB36B0];
    v11 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB36B0];
    v8 = objc_msgSend(v4, "item") + 1;
    v9 = objc_msgSend(v4, "section");
    v10 = v7;
    v11 = v8;
  }
  objc_msgSend(v10, "indexPathForItem:inSection:", v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (PXAssetReference)startingAssetReference
{
  return self->_startingAssetReference;
}

- (BOOL)isCommitingPreview
{
  return self->_isCommitingPreview;
}

- (void)setIsCommitingPreview:(BOOL)a3
{
  self->_isCommitingPreview = a3;
}

- (PUImportOneUpViewControllerSpecManager)specManager
{
  return self->_specManager;
}

- (void)setSpecManager:(id)a3
{
  objc_storeStrong((id *)&self->_specManager, a3);
}

- (PXImportController)importController
{
  return self->_importController;
}

- (unint64_t)presentationFilter
{
  return self->_presentationFilter;
}

- (void)setPresentationFilter:(unint64_t)a3
{
  self->_presentationFilter = a3;
}

- (PXImportAssetsDataSourceManager)importDataSourceManager
{
  return self->_importDataSourceManager;
}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (void)setImportDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_importDataSource, a3);
}

- (BOOL)performingDataSourceChange
{
  return self->_performingDataSourceChange;
}

- (void)setPerformingDataSourceChange:(BOOL)a3
{
  self->_performingDataSourceChange = a3;
}

- (PXImportAssetsDataSource)pendingDataSource
{
  return self->_pendingDataSource;
}

- (void)setPendingDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDataSource, a3);
}

- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper
{
  return self->_changeDetailsHelper;
}

- (void)setChangeDetailsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetailsHelper, a3);
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PUSelectableAssetCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (UIBarButtonItem)importBarButtonItem
{
  return self->_importBarButtonItem;
}

- (UIBarButtonItem)stopImportBarButtonItem
{
  return self->_stopImportBarButtonItem;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (UIBarButtonItem)progressButtonItem
{
  return self->_progressButtonItem;
}

- (PLRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (void)setRoundProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_roundProgressView, a3);
}

- (UIBarButtonItem)bottomSpacerBarButtonItem
{
  return self->_bottomSpacerBarButtonItem;
}

- (PUImportActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_actionCoordinator, a3);
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (PXNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (PLDateRangeFormatter)dayFormatter
{
  return self->_dayFormatter;
}

- (PLDateRangeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (NSIndexPath)inFlightReferenceIndexPath
{
  return self->_inFlightReferenceIndexPath;
}

- (BOOL)updatingContentOffsetFromScrubbing
{
  return self->_updatingContentOffsetFromScrubbing;
}

- (BOOL)hasPerformedNavigationToStartingAsset
{
  return self->_hasPerformedNavigationToStartingAsset;
}

- (void)setHasPerformedNavigationToStartingAsset:(BOOL)a3
{
  self->_hasPerformedNavigationToStartingAsset = a3;
}

- (BOOL)loadLargeThumbnailsInCustomOrder
{
  return self->_loadLargeThumbnailsInCustomOrder;
}

- (void)setLoadLargeThumbnailsInCustomOrder:(BOOL)a3
{
  self->_loadLargeThumbnailsInCustomOrder = a3;
}

- (NSMutableSet)thumbnailLoadableItemWhitelist
{
  return self->_thumbnailLoadableItemWhitelist;
}

- (void)setThumbnailLoadableItemWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLoadableItemWhitelist, a3);
}

- (NSMutableSet)itemsWithInvalidImageSizes
{
  return self->_itemsWithInvalidImageSizes;
}

- (void)setItemsWithInvalidImageSizes:(id)a3
{
  objc_storeStrong((id *)&self->_itemsWithInvalidImageSizes, a3);
}

- (PFCoalescer)relayoutCoalescer
{
  return self->_relayoutCoalescer;
}

- (void)setRelayoutCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_relayoutCoalescer, a3);
}

- (NSMutableArray)itemsNeedingRelayout
{
  return self->_itemsNeedingRelayout;
}

- (void)setItemsNeedingRelayout:(id)a3
{
  objc_storeStrong((id *)&self->_itemsNeedingRelayout, a3);
}

- (UICollectionViewLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (void)setTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitionLayout, a3);
}

- (BOOL)isAnimatingTransition
{
  return self->_animatingTransition;
}

- (void)setAnimatingTransition:(BOOL)a3
{
  self->_animatingTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_storeStrong((id *)&self->_itemsNeedingRelayout, 0);
  objc_storeStrong((id *)&self->_relayoutCoalescer, 0);
  objc_storeStrong((id *)&self->_itemsWithInvalidImageSizes, 0);
  objc_storeStrong((id *)&self->_thumbnailLoadableItemWhitelist, 0);
  objc_storeStrong((id *)&self->_inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_bottomSpacerBarButtonItem, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_progressButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_stopImportBarButtonItem, 0);
  objc_storeStrong((id *)&self->_importBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_changeDetailsHelper, 0);
  objc_storeStrong((id *)&self->_pendingDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_startingAssetReference, 0);
  objc_storeStrong((id *)&self->_reviewScrubber, 0);
}

uint64_t __98__PUImportOneUpViewController_importOneUpScrubberCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

void __90__PUImportOneUpViewController_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  if (v7)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v6, a4);
    v6 = v9;
  }
  if (v6 && (a4 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "invalidateLayoutIfNeededForImportItem:", *(_QWORD *)(a1 + 32));

    v6 = v9;
  }

}

uint64_t __81__PUImportOneUpViewController_importOneUpCell_requestedBadgeUpdateForImportItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  return objc_msgSend(*(id *)(a1 + 32), "setSelectable:", objc_msgSend(*(id *)(a1 + 40), "isSelectable"));
}

uint64_t __70__PUImportOneUpViewController_badgeViewAtIndexPath_forCollectionView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  return objc_msgSend(*(id *)(a1 + 32), "setSelectable:", objc_msgSend(*(id *)(a1 + 40), "isSelectable"));
}

uint64_t __69__PUImportOneUpViewController_loadCenterPrioritizedVisibleThumbnails__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __56__PUImportOneUpViewController_updateNavigationItemTitle__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setVerticalSizeClass:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitleFont:", v2);

}

uint64_t __49__PUImportOneUpViewController_updateToolbarItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToolbarItems:", *(_QWORD *)(a1 + 40));
}

void __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inFlightReferenceIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "inFlightReferenceIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageToIndexPath:animated:", v5, objc_msgSend(v8, "isAnimated"));

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1168);
    *(_QWORD *)(v6 + 1168) = 0;

  }
}

void __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContentScrollInset:", v2, v3, v4, v5);

  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLayoutReferenceSize:", v7, v8);

}

uint64_t __46__PUImportOneUpViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadCenterPrioritizedVisibleThumbnails");
}

uint64_t __42__PUImportOneUpViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", *(_QWORD *)(a1 + 40));
}

void __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _OWORD v13[4];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  PXSimpleIndexPathFromIndexPath();

  objc_msgSend(*(id *)(a1 + 32), "importDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v13, 0, sizeof(v13));
  objc_msgSend(v6, "assetAtItemIndexPath:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUSelectableAssetBadgeKind"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke_2;
    v10[3] = &unk_1E58ABCA8;
    v11 = v9;
    v12 = v7;
    objc_msgSend(v11, "performBadgeUpdates:", v10);

  }
}

uint64_t __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  return objc_msgSend(*(id *)(a1 + 32), "setSelectable:", objc_msgSend(*(id *)(a1 + 40), "isSelectable"));
}

void __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setImportDataSource:", v3);

}

uint64_t __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "reviewScrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "updateVisibleCellBadgesAndSelectability");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "pageToItemOrNearestIndexPath:animated:", v5, a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateBarItemsAnimated:", 1);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__PUImportOneUpViewController_handleNewDataSource___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PUImportOneUpViewController_handleNewDataSource___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__PUImportOneUpViewController_handleNewDataSource___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _importOneUpLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "importDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v3, "identifier");
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Finished transitioning to: %lu", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setPerformingDataSourceChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "pendingDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingDataSource:", 0);
    _importOneUpLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "identifier");
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Applying pending data source: %lu", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleNewDataSource:", v5);
  }
}

uint64_t __60__PUImportOneUpViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItems");
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "handleNewDataSource:", *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(v3, "_dismissReviewControllerWithAsset:", 0);
}

uint64_t __60__PUImportOneUpViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBarItemsAnimated:", 0);
}

void __112__PUImportOneUpViewController_initWithImportController_mediaProvider_startingAssetReference_presentationFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "delayNextInvocationByTimeInterval:", 0.5);
  objc_msgSend(v4, "relayoutCollectionView");

}

@end
