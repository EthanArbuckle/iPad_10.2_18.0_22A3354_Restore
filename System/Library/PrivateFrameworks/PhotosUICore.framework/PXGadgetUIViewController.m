@implementation PXGadgetUIViewController

- (PXGadgetUIViewController)initWithLayout:(id)a3 dataSourceManager:(id)a4
{
  id v7;
  id v8;
  PXGadgetUIViewController *v9;
  PXGadgetUIViewController *v10;
  NSMutableSet *v11;
  NSMutableSet *registeredCellReuseIdentifiers;
  uint64_t v13;
  PXUpdater *updater;
  void *v15;
  void *v16;
  NSMutableSet *v17;
  NSMutableSet *seenGadgetIdentifiers;
  NSMutableSet *v19;
  NSMutableSet *cellsWantingVisibleRectUpdates;
  uint64_t v21;
  NSMapTable *cellsToGadgets;
  PXGadgetNavigationHelper *v23;
  PXGadgetNavigationHelper *navigationHelper;
  PXGadgetAnchorHelper *v25;
  PXGadgetAnchorHelper *anchorHelper;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXGadgetUIViewController;
  v9 = -[PXGadgetUIViewController initWithCollectionViewLayout:](&v31, sel_initWithCollectionViewLayout_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    -[PXGadgetCollectionViewLayout setDelegate:](v10->_layout, "setDelegate:", v10);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredCellReuseIdentifiers = v10->_registeredCellReuseIdentifiers;
    v10->_registeredCellReuseIdentifiers = v11;

    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel__updaterNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:needsUpdate:](v10->_updater, "addUpdateSelector:needsUpdate:", sel__updatePlaceholder, 1);
    objc_storeStrong((id *)&v10->_dataSourceManager, a4);
    -[PXGadgetDataSourceManager setNextGadgetResponder:](v10->_dataSourceManager, "setNextGadgetResponder:", v10);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "userInterfaceIdiom") == 6)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_backgroundColor, v16);

    v10->_numberOfInitialGadgetsToLoad = 3;
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    seenGadgetIdentifiers = v10->_seenGadgetIdentifiers;
    v10->_seenGadgetIdentifiers = v17;

    v10->_isContentVisible = 1;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cellsWantingVisibleRectUpdates = v10->_cellsWantingVisibleRectUpdates;
    v10->_cellsWantingVisibleRectUpdates = v19;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    cellsToGadgets = v10->_cellsToGadgets;
    v10->_cellsToGadgets = (NSMapTable *)v21;

    v23 = objc_alloc_init(PXGadgetNavigationHelper);
    navigationHelper = v10->_navigationHelper;
    v10->_navigationHelper = v23;

    -[PXGadgetNavigationHelper setDelegate:](v10->_navigationHelper, "setDelegate:", v10);
    v25 = -[PXGadgetAnchorHelper initWithNavigationHelper:dataSourceManager:]([PXGadgetAnchorHelper alloc], "initWithNavigationHelper:dataSourceManager:", v10->_navigationHelper, v8);
    anchorHelper = v10->_anchorHelper;
    v10->_anchorHelper = v25;

    -[PXGadgetAnchorHelper setAnchorPosition:](v10->_anchorHelper, "setAnchorPosition:", 1);
    -[PXGadgetAnchorHelper setDelegate:](v10->_anchorHelper, "setDelegate:", v10);
    v10->_allowsBarManagement = 1;
    -[UIViewController px_enableExtendedTraitCollection](v10, "px_enableExtendedTraitCollection");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v10, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v10, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  }
  return v10;
}

- (void)setNumberOfInitialGadgetsToLoad:(unint64_t)a3
{
  self->_numberOfInitialGadgetsToLoad = a3;
}

- (void)_updaterNeedsUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__PXGadgetUIViewController__updaterNeedsUpdate__block_invoke;
  v2[3] = &unk_1E5148D30;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updatePlaceholder
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  -[PXGadgetUIViewController placeholderManager](self, "placeholderManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wantsPlaceholder")
    && !-[PXGadgetUIViewController shouldPreventPlaceholder](self, "shouldPreventPlaceholder"))
  {
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeholderTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    objc_msgSend(v3, "placeholderMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecondaryText:", v7);

    objc_msgSend(v3, "placeholderButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "placeholderButtonTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "buttonProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v9);

      v12 = (void *)MEMORY[0x1E0DC3428];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __46__PXGadgetUIViewController__updatePlaceholder__block_invoke;
      v23 = &unk_1E5147F40;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v12, "actionWithHandler:", &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "buttonProperties", v20, v21, v22, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPrimaryAction:", v13);

      objc_destroyWeak(&v24);
    }
    objc_destroyWeak(&location);
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  -[PXGadgetUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v4);
  -[PXGadgetUIViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "px_disableLargeTitle");

  if ((_DWORD)v5 != v16)
  {
    -[PXGadgetUIViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_setDisableLargeTitle:", v5);

    -[PXGadgetUIViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNeedsLayout");

  }
}

- (PXContentUnavailablePlaceholderManager)placeholderManager
{
  return self->_placeholderManager;
}

void __47__PXGadgetUIViewController__updaterNeedsUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;

  if (-[UIViewController px_isVisible](self, "px_isVisible", a3))
  {
    if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
    {
      -[PXGadgetUIViewController _notifyGadgetsThatGadgetControllerHasAppeared](self, "_notifyGadgetsThatGadgetControllerHasAppeared");
      -[PXGadgetUIViewController rootGadgetControllerWillAppear](self, "rootGadgetControllerWillAppear");
    }
    -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPendingNavigationTimer");

  }
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetVCViewDidLoad", ", v10, 2u);
  }

  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);
  -[PXGadgetUIViewController backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setDropDelegate:", self);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PXGadgetControllerCellReuseIdentifier"));
  v6 = objc_opt_class();
  v7 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v6, *MEMORY[0x1E0DC48A8], CFSTR("PXGadgetControllerSectionHeaderReuseIdentifier"));
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v7, CFSTR("PXGadgetControllerCustomSurveySectionHeaderReuseIdentifier"));
  objc_msgSend(v4, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  objc_msgSend(v4, "setPrefetchDataSource:", self);
  -[PXGadgetUIViewController _initializeHelpers](self, "_initializeHelpers");
  -[PXGadgetUIViewController _initializeDataSource](self, "_initializeDataSource");
  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController")
    && -[PXGadgetUIViewController allowsBarManagement](self, "allowsBarManagement"))
  {
    -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
    objc_msgSend(v4, "setContentInset:", 0.0, 0.0, 16.0, 0.0);
  }
  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerChangeObserver:", self);
  -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GadgetVCViewDidLoad", ", v10, 2u);
  }

}

- (void)_initializeDataSource
{
  void *v3;
  void *v4;
  id v5;

  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController setDataSource:](self, "setDataSource:", v3);

  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerChangeObserver:context:", self, PXDataSourceManagerObservationContext_148317);

  self->_updateFlags.collectionNeedsUpdate = 1;
  objc_msgSend(v5, "beginLoadingInitialGadgets:", -[PXGadgetUIViewController numberOfInitialGadgetsToLoad](self, "numberOfInitialGadgetsToLoad"));

}

- (void)_initializeHelpers
{
  void *v3;
  uint64_t v4;
  PXGadgetSpecManager *v5;
  id v6;

  -[PXGadgetUIViewController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollDirection");

  v4 = PXAxisFromUICollectionViewScrollDirection();
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXGadgetSpecManager initWithGadgetSpecClass:scrollAxis:traitCollection:]([PXGadgetSpecManager alloc], "initWithGadgetSpecClass:scrollAxis:traitCollection:", objc_msgSend((id)objc_opt_class(), "gadgetSpecClass"), v4, v6);
  -[PXGadgetSpecManager registerChangeObserver:context:](v5, "registerChangeObserver:context:", self, PXGadgetSpecManagerObservationContext);
  -[PXGadgetUIViewController setSpecManager:](self, "setSpecManager:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
    -[PXGadgetUIViewController rootGadgetControllerWillAppear](self, "rootGadgetControllerWillAppear");
  -[PXGadgetUIViewController updateIfNeeded](self, "updateIfNeeded");
  -[PXGadgetUIViewController _addContextMenuInteraction](self, "_addContextMenuInteraction");
  -[PXGadgetUIViewController setCurrentlyVisible:](self, "setCurrentlyVisible:", 1);
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPendingNavigationTimer");

  -[PXGadgetUIViewController _setTimerToHandleGadgetsSeen](self, "_setTimerToHandleGadgetsSeen");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PXGadgetUIViewController setSelectedGadget:](self, "setSelectedGadget:", 0);
  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
  {
    objc_msgSend(v4, "setCanLoadRemainingDataForProviders:", 1);
    -[PXGadgetUIViewController _notifyGadgetsThatGadgetControllerHasAppeared](self, "_notifyGadgetsThatGadgetControllerHasAppeared");
  }
  if (self->_updateFlags.loadRemaingGadgetsAfterViewAppeared)
  {
    objc_msgSend(v4, "loadRemainingGadgetsIfNeeded");
    self->_updateFlags.loadRemaingGadgetsAfterViewAppeared = 0;
  }
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigateIfNeeded");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) != 0 || objc_msgSend(v4, "isDecelerating"))
    -[PXGadgetUIViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  PXGadgetUIViewController *v5;
  PXGadgetUIViewController *v6;
  int v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  -[PXGadgetUIViewController setCurrentlyVisible:](self, "setCurrentlyVisible:", 0);
  -[PXGadgetUIViewController _removeContextMenuInteraction](self, "_removeContextMenuInteraction");
  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
  {
    -[PXGadgetUIViewController rootGadgetControllerDidDisappear](self, "rootGadgetControllerDidDisappear");
    -[PXGadgetUIViewController _notifyGadgetsThatGadgetControllerHasDisappeared](self, "_notifyGadgetsThatGadgetControllerHasDisappeared");
    -[PXGadgetUIViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (PXGadgetUIViewController *)objc_claimAutoreleasedReturnValue();
    if (v5 != self)
    {
      v6 = v5;
      if ((-[PXGadgetUIViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0)
      {
        v7 = -[PXGadgetUIViewController isViewLoaded](self, "isViewLoaded");

        if (!v7)
          goto LABEL_15;
        goto LABEL_12;
      }

LABEL_14:
      goto LABEL_15;
    }
    -[PXGadgetUIViewController presentedViewController](self, "presentedViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      if ((-[PXGadgetUIViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
      {

        goto LABEL_14;
      }
      v10 = -[PXGadgetUIViewController isViewLoaded](self, "isViewLoaded");

      if ((v10 & 1) == 0)
        goto LABEL_15;
    }
    else
    {
      v11 = -[PXGadgetUIViewController isViewLoaded](self, "isViewLoaded");

      if ((v11 & 1) == 0)
      {
LABEL_15:
        -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCanLoadRemainingDataForProviders:", 0);

        goto LABEL_16;
      }
    }
LABEL_12:
    -[PXGadgetUIViewController _notifyGadgetsThatGadgetWasDismissed](self, "_notifyGadgetsThatGadgetWasDismissed");
    goto LABEL_15;
  }
LABEL_16:
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateAnyPendingNavigation");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[PXGadgetUIViewController specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateGadgetDataSourceToSpecIfNeeded:", v4);

  objc_msgSend(off_1E50B4758, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillLayoutSubviews");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigateIfNeeded");

  -[PXGadgetUIViewController _updateGadgetVisibleRects](self, "_updateGadgetVisibleRects");
}

- (int64_t)_scrollAxis
{
  void *v2;

  -[PXGadgetUIViewController layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollDirection");

  return PXAxisFromUICollectionViewScrollDirection();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL8 v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[PXGadgetUIViewController isCurrentlyVisible](self, "isCurrentlyVisible"))
  {
    v8 = -[PXGadgetUIViewController isScrolling](self, "isScrolling");
    -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hasAnchor") & 1) != 0
      || v8
      || -[PXGadgetUIViewController isGadgetAnimating](self, "isGadgetAnimating")
      || -[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
    {
      if (v8)
        objc_msgSend(v9, "clearAnchor");
    }
    else
    {
      objc_msgSend(v9, "saveAnchor");
    }
    -[PXGadgetUIViewController setIsRotatingVerticalLayout:](self, "setIsRotatingVerticalLayout:", 0);
    if (-[PXGadgetUIViewController _scrollAxis](self, "_scrollAxis") == 1)
    {
      -[PXGadgetUIViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = height != v11;

      -[PXGadgetUIViewController setIsRotatingVerticalLayout:](self, "setIsRotatingVerticalLayout:", v12);
    }
    v14[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E512DEF8;
    v15[4] = self;
    v16 = v9;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v14[3] = &unk_1E5148240;
    v13 = v9;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v14);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)isRootGadgetViewController
{
  return 1;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;

  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController", a3))
  {
    -[PXGadgetUIViewController rootGadgetControllerDidDisappear](self, "rootGadgetControllerDidDisappear");
    -[PXGadgetUIViewController _notifyGadgetsThatGadgetControllerHasDisappeared](self, "_notifyGadgetsThatGadgetControllerHasDisappeared");
    -[PXGadgetUIViewController _notifyGadgetsThatGadgetWasDismissed](self, "_notifyGadgetsThatGadgetWasDismissed");
  }
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAnyPendingNavigation");

}

- (void)reloadContent
{
  id v3;

  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCachedProviders");
  objc_msgSend(v3, "beginLoadingInitialGadgets:", -[PXGadgetUIViewController numberOfInitialGadgetsToLoad](self, "numberOfInitialGadgetsToLoad"));

}

- (id)gadgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v8, "indexPathForItemAtPoint:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)debugURLsForDiagnostics
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PXGadgetUIViewController_debugURLsForDiagnostics__block_invoke;
  v7[3] = &unk_1E512DF20;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateGadgetsUsingBlock:", v7);

  return v5;
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v4;
  char v5;
  UIColor *v6;
  UIColor *backgroundColor;
  UIColor *v8;
  void *v9;
  UIColor *v10;

  v10 = (UIColor *)a3;
  v4 = self->_backgroundColor;
  if (v4 == v10)
  {

  }
  else
  {
    v5 = -[UIColor isEqual:](v10, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)-[UIColor copy](v10, "copy");
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v6;

      if (-[PXGadgetUIViewController isViewLoaded](self, "isViewLoaded"))
      {
        v8 = self->_backgroundColor;
        -[PXGadgetUIViewController collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v8);

        -[PXGadgetUIViewController _invalidatePlaceholder](self, "_invalidatePlaceholder");
      }
    }
  }

}

- (void)setDataSource:(id)a3
{
  PXGadgetDataSource *v5;
  void *v6;
  PXGadgetDataSource *v7;
  char v8;
  uint64_t v9;
  PXGadgetDataSource *v10;

  v10 = (PXGadgetDataSource *)a3;
  v5 = self->_dataSource;
  v6 = v10;
  if (v5 == v10)
    goto LABEL_5;
  v7 = v5;
  v8 = -[PXGadgetDataSource isEqual:](v5, "isEqual:");

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
    {
      v9 = -[PXGadgetDataSource hasNoContentGadget](v10, "hasNoContentGadget") ^ 1;
      -[PXGadgetUIViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlwaysBounceVertical:", v9);
LABEL_5:

    }
  }

}

- (void)setContentVisible:(BOOL)a3
{
  if (self->_isContentVisible != a3)
  {
    self->_isContentVisible = a3;
    if (-[PXGadgetUIViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PXGadgetUIViewController _notifyPresentedGadgetsOfVisibilityChange](self, "_notifyPresentedGadgetsOfVisibilityChange");
      if (self->_isContentVisible)
        -[PXGadgetUIViewController _setTimerToHandleGadgetsSeen](self, "_setTimerToHandleGadgetsSeen");
      else
        -[PXGadgetUIViewController _clearTimerToHandleGadgetsSeen](self, "_clearTimerToHandleGadgetsSeen");
    }
  }
}

- (void)setLayout:(id)a3
{
  PXGadgetCollectionViewLayout *v5;
  PXGadgetCollectionViewLayout **p_layout;
  PXGadgetCollectionViewLayout *layout;
  PXGadgetCollectionViewLayout *v8;
  void *v9;
  PXGadgetCollectionViewLayout *v10;

  v5 = (PXGadgetCollectionViewLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  if (layout != v5)
  {
    v10 = v5;
    -[PXGadgetCollectionViewLayout setDelegate:](layout, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_layout, a3);
    -[PXGadgetCollectionViewLayout setDelegate:](*p_layout, "setDelegate:", self);
    v8 = *p_layout;
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCollectionViewLayout:", v8);

    v5 = v10;
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  y = a4.y;
  x = a4.x;
  -[PXGadgetUIViewController view](self, "view", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "targetPreviewViewForLocation:inCoordinateSpace:", v7, x, y);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "previewViewControllerAtLocation:fromSourceView:", v7, x, y);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if (!v11)
              goto LABEL_14;
            goto LABEL_13;
          }
        }
        else
        {
          v11 = 0;
          v12 = 0;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
LABEL_17:

            goto LABEL_9;
          }
        }
        objc_msgSend(v8, "contextMenuWithSuggestedActions:", MEMORY[0x1E0C9AA60]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "children");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v15, "count");

        if (v12 || !v11)
        {
          if (!v12)
            goto LABEL_17;
          goto LABEL_16;
        }
LABEL_13:
        objc_msgSend(v11, "px_previewActionMenus");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (!v17)
        {
LABEL_14:
          v12 = 0;
          goto LABEL_17;
        }
LABEL_16:
        -[PXGadgetUIViewController setInteractionPreviewGadget:](self, "setInteractionPreviewGadget:", v8);
        -[PXGadgetUIViewController setInteractionPreviewView:](self, "setInteractionPreviewView:", v10);
        -[PXGadgetUIViewController setIsInteractionPreviewCancelled:](self, "setIsInteractionPreviewCancelled:", 1);
        v18 = (void *)MEMORY[0x1E0DC36B8];
        v19 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
        v23[3] = &unk_1E5135EB8;
        v24 = v11;
        v20[0] = v19;
        v20[1] = 3221225472;
        v20[2] = __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
        v20[3] = &unk_1E512DF48;
        v21 = v8;
        v11 = v24;
        v22 = v11;
        objc_msgSend(v18, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v23, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXGadgetUIViewController interactionPreviewView](self, "interactionPreviewView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController interactionPreviewGadget](self, "interactionPreviewGadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "previewParametersForTargetPreviewView:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5)
    {
      if (v7)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v5, v7);

        goto LABEL_11;
      }
LABEL_6:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v5);
      goto LABEL_11;
    }
  }
  else
  {
    if (v5)
      goto LABEL_6;
    v8 = 0;
  }
  PXAssertGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "interactionPreviewView can't be nil when presenting preview, (previewGadget: %@)", (uint8_t *)&v12, 0xCu);
  }

  v9 = 0;
LABEL_11:

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a5;
  -[PXGadgetUIViewController interactionPreviewGadget](self, "interactionPreviewGadget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController interactionPreviewView](self, "interactionPreviewView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredCommitStyle:", v9 != 0);
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = MEMORY[0x1E0C809B0];
      v10 = __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v11 = &v14;
      v12 = v9;
LABEL_7:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E5148D08;
      v11[4] = (uint64_t)v7;
      v11[5] = (uint64_t)v12;
      objc_msgSend(v6, "addCompletion:", v11);

    }
  }
  else if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = MEMORY[0x1E0C809B0];
    v10 = __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
    v11 = &v13;
    v12 = v8;
    goto LABEL_7;
  }
  -[PXGadgetUIViewController setIsInteractionPreviewCancelled:](self, "setIsInteractionPreviewCancelled:", 0, v13);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a5;
  -[PXGadgetUIViewController interactionPreviewGadget](self, "interactionPreviewGadget");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXGadgetUIViewController isInteractionPreviewCancelled](self, "isInteractionPreviewCancelled") ^ 1;
  -[PXGadgetUIViewController interactionPreviewView](self, "interactionPreviewView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "didDismissPreviewViewController:committing:", v9, v7);
  }
  else if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "didDismissPreviewWithPreviewView:committing:", v8, v7);
  }
  -[PXGadgetUIViewController setInteractionPreviewGadget:](self, "setInteractionPreviewGadget:", 0);
  -[PXGadgetUIViewController setInteractionPreviewView:](self, "setInteractionPreviewView:", 0);
  -[PXGadgetUIViewController setIsInteractionPreviewCancelled:](self, "setIsInteractionPreviewCancelled:", 0);

}

- (void)_addContextMenuInteraction
{
  void *v3;
  void *v4;
  id v5;

  if (-[PXGadgetUIViewController isRootGadgetViewController](self, "isRootGadgetViewController"))
  {
    -[PXGadgetUIViewController contextMenuInteraction](self, "contextMenuInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
      -[PXGadgetUIViewController setContextMenuInteraction:](self, "setContextMenuInteraction:", v5);
      -[PXGadgetUIViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addInteraction:", v5);

    }
  }
}

- (void)_removeContextMenuInteraction
{
  void *v3;
  void *v4;
  id v5;

  -[PXGadgetUIViewController contextMenuInteraction](self, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInteraction:", v5);

    -[PXGadgetUIViewController setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
    v3 = v5;
  }

}

- (void)updateIfNeeded
{
  id v2;

  if (self->_updateFlags.collectionNeedsUpdate)
  {
    self->_updateFlags.collectionNeedsUpdate = 0;
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

  }
}

- (id)_gadgetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];

  v4 = a3;
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  v7 = objc_msgSend(v4, "section");
  v8 = objc_msgSend(v4, "item");

  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "gadgetAtIndexPath:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_indexPathForGadget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  __int128 v11;

  v4 = a3;
  v11 = 0u;
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "indexPathForGadget:", v4);
  else
    v11 = 0u;

  if (*(_QWORD *)off_1E50B7E98)
    v7 = (_QWORD)v11 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 1;
  if (!v7 && *((_QWORD *)&v11 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_configureHeader:(id)a3 withGadgetSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;
  _OWORD v16[2];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "sectionHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "firstSectionIndexPath");
  else
    memset(v16, 0, sizeof(v16));
  objc_msgSend(v10, "gadgetSectionAtIndexPath:", v16);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadgets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PXGadgetUIViewController__configureHeader_withGadgetSection___block_invoke;
  v14[3] = &unk_1E512DF70;
  v15 = v11 == v6;
  v14[4] = self;
  objc_msgSend(v8, "performChangesWithGadget:additionalChanges:", v13, v14);

  objc_msgSend(v7, "setHeaderModel:", v8);
}

- (void)_handleGadgetsSeen
{
  PXGadgetUIViewController *v2;
  void *v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  double width;
  double height;
  double v24;
  double v25;
  _BOOL4 v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  id v35;
  unint64_t v36;
  __CFString *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  PXGadgetUIViewController *v43;
  void *v44;
  id v45;
  _QWORD r2[5];
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v52 = *MEMORY[0x1E0C80C00];
  if (!self->_updateFlags.collectionNeedsUpdate)
  {
    v2 = self;
    if (!-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
    {
      if (-[PXGadgetUIViewController isContentVisible](v2, "isContentVisible"))
      {
        -[PXGadgetUIViewController collectionView](v2, "collectionView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGadgetUIViewController visibleBounds](v2, "visibleBounds");
        r2[0] = v4;
        v6 = v5;
        v8 = v7;
        v10 = v9;
        objc_msgSend(v3, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v11;
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v11, "bounds");
          objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v12);
        }
        objc_msgSend(v3, "indexPathsForVisibleItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGadgetUIViewController seenGadgetIdentifiers](v2, "seenGadgetIdentifiers");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&r2[1], 0, 32);
        v47 = 0u;
        v48 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &r2[1], v51, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)r2[3];
          v43 = v2;
          v45 = v14;
          do
          {
            v18 = 0;
            v19 = sel_uniqueGadgetIdentifier;
            do
            {
              if (*(_QWORD *)r2[3] != v17)
                objc_enumerationMutation(v14);
              v20 = *(_QWORD *)(r2[2] + 8 * v18);
              objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "frame");
              width = v53.size.width;
              height = v53.size.height;
              *(_QWORD *)&v55.origin.x = r2[0];
              v55.origin.y = v6;
              v55.size.width = v8;
              v55.size.height = v10;
              v54 = CGRectIntersection(v53, v55);
              v24 = v54.size.width;
              v25 = v54.size.height;
              if (!CGRectIsNull(v54))
              {
                v26 = v25 >= height * 0.8 && v24 >= width * 0.8;
                if ((PXSizeIsNull() & 1) != 0)
                {
                  v27 = 0;
                }
                else
                {
                  PXSizeGetArea();
                  v29 = v28;
                  PXSizeGetArea();
                  v27 = v29 >= v30 * 0.6;
                }
                if (v26 || v27)
                {
                  -[PXGadgetUIViewController _gadgetAtIndexPath:](v2, "_gadgetAtIndexPath:", v20);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v32 = v19;
                    objc_msgSend(v31, "uniqueGadgetIdentifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v33)
                    {
                      if ((objc_msgSend(v44, "containsObject:", v33) & 1) == 0)
                      {
                        objc_msgSend(v44, "addObject:", v33);
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          objc_msgSend(v31, "contentHasBeenSeen");
                        v34 = (void *)MEMORY[0x1E0D09910];
                        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v36 = objc_msgSend(v31, "gadgetType");
                        v42 = v34;
                        if (v36 > 0x16)
                          v37 = 0;
                        else
                          v37 = off_1E513EE30[v36];
                        v38 = v37;
                        v40 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.gadgetSeenWithType%@"), v38, v41);
                        objc_msgSend(v42, "sendEvent:withPayload:", v40, MEMORY[0x1E0C9AA70]);

                        goto LABEL_30;
                      }
                    }
                    else
                    {
                      PLUIGetLog();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                      {
                        v39 = objc_opt_class();
                        *(_DWORD *)buf = 138543362;
                        v50 = v39;
                        _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_ERROR, "PXGadgetUIViewController: No unique gadget identifier provided by gadget: %{public}@", buf, 0xCu);
                      }
LABEL_30:

                      v2 = v43;
                    }

                    v19 = v32;
                    v14 = v45;
                  }

                }
              }

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &r2[1], v51, 16);
          }
          while (v16);
        }

      }
    }
  }
}

- (void)_clearTimerToHandleGadgetsSeen
{
  id v2;

  -[PXGadgetUIViewController gadgetSeenTimer](self, "gadgetSeenTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_setTimerToHandleGadgetsSeen
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  -[PXGadgetUIViewController _clearTimerToHandleGadgetsSeen](self, "_clearTimerToHandleGadgetsSeen");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __56__PXGadgetUIViewController__setTimerToHandleGadgetsSeen__block_invoke;
  v8 = &unk_1E5141230;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController setGadgetSeenTimer:](self, "setGadgetSeenTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyGadgetsThatGadgetControllerHasAppeared
{
  id v2;

  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGadgetsUsingBlock:", &__block_literal_global_148413);

}

- (void)_notifyGadgetsThatGadgetControllerHasDisappeared
{
  id v2;

  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGadgetsUsingBlock:", &__block_literal_global_227_148410);

}

- (void)_notifyGadgetsThatGadgetWasDismissed
{
  id v2;

  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGadgetsUsingBlock:", &__block_literal_global_230_148406);

}

- (void)_updateHeaderForGadget:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  int64x2_t v11;

  v5 = a4;
  if (!self->_updateFlags.collectionNeedsUpdate
    && !-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
  {
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = objc_msgSend(v6, "identifier");
    v10[1] = objc_msgSend(v5, "section");
    v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v6, "gadgetSectionAtIndexPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supplementaryViewForElementKind:atIndexPath:", *MEMORY[0x1E0DC48A8], v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[PXGadgetUIViewController _configureHeader:withGadgetSection:](self, "_configureHeader:withGadgetSection:", v9, v7);

  }
}

- (void)_updateVisibleGadgetHeaders
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_updateFlags.collectionNeedsUpdate
    && !-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
  {
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", *MEMORY[0x1E0DC48A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v10, (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGadgetUIViewController _updateHeaderForGadget:atIndexPath:](self, "_updateHeaderForGadget:atIndexPath:", v11, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_notifyPresentedGadgetsOfVisibilityChange
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_updateFlags.collectionNeedsUpdate)
  {
    v3 = -[PXGadgetUIViewController isContentVisible](self, "isContentVisible");
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathsForVisibleItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v5)
      goto LABEL_22;
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_20;
          -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", ", buf, 2u);
          }
          objc_msgSend(v9, "contentViewWillAppear");
          if (!os_signpost_enabled(v10))
            goto LABEL_19;
          *(_WORD *)buf = 0;
          v11 = v10;
          v12 = "GadgetContentWillAppear";
          goto LABEL_18;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_20;
        -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentDidDisappear", ", buf, 2u);
        }
        objc_msgSend(v9, "contentViewDidDisappear");
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          v11 = v10;
          v12 = "GadgetContentDidDisappear";
LABEL_18:
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v12, "", buf, 2u);
        }
LABEL_19:

LABEL_20:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v6)
      {
LABEL_22:

        return;
      }
    }
  }
}

- (void)_scrollViewDidEndScrolling
{
  void *v3;

  +[PXAnimationTracker scrollAnimationDidEnd:](PXAnimationTracker, "scrollAnimationDidEnd:", -[PXGadgetUIViewController scrollAnimationIdentifier](self, "scrollAnimationIdentifier"));
  if (!-[PXGadgetUIViewController isGadgetAnimating](self, "isGadgetAnimating")
    && !-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
  {
    -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveAnchor");

  }
  -[PXGadgetUIViewController _setTimerToHandleGadgetsSeen](self, "_setTimerToHandleGadgetsSeen");
  -[PXGadgetUIViewController setIsScrolling:](self, "setIsScrolling:", 0);
}

- (void)_updateGadgetVisibleRects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_updateFlags.collectionNeedsUpdate
    && !-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
  {
    -[PXGadgetUIViewController cellsWantingVisibleRectUpdates](self, "cellsWantingVisibleRectUpdates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      -[PXGadgetUIViewController collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indexPathsForVisibleItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            objc_msgSend(v4, "cellForItemAtIndexPath:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v3, "containsObject:", v11))
            {
              -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXGadgetUIViewController _updateVisibleRectForGadget:inCell:collectionView:](self, "_updateVisibleRectForGadget:inCell:collectionView:", v12, v11, v4);

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_updateVisibleRectForGadget:(id)a3 inCell:(id)a4 collectionView:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXGadgetUIViewController visibleBounds](self, "visibleBounds");
    objc_msgSend(v8, "convertRect:fromView:", v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "bounds");
    v38.origin.x = v18;
    v38.origin.y = v19;
    v38.size.width = v20;
    v38.size.height = v21;
    v36.origin.x = v11;
    v36.origin.y = v13;
    v36.size.width = v15;
    v36.size.height = v17;
    v37 = CGRectIntersection(v36, v38);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    if (CGRectIsNull(v37))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    objc_msgSend(v8, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertRect:fromView:", v8, x, y, width, height);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    objc_msgSend(v35, "setVisibleContentRect:", v28, v30, v32, v34);
  }

}

- (CGRect)visibleBounds
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_isUsingDeprecatedViewLoadingForGadget:(id)a3
{
  return (objc_opt_respondsToSelector() & 1) == 0;
}

- (id)_gadgetForCollectionViewCell:(id)a3
{
  return -[NSMapTable objectForKey:](self->_cellsToGadgets, "objectForKey:", a3);
}

- (void)_setGadget:(id)a3 forCollectionViewCell:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_cellsToGadgets, "setObject:forKey:", a3, a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXGadgetUIViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PXGadgetUIViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setVisibleContentRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (-[PXGadgetUIViewController _isUsingDeprecatedViewLoadingForGadget:](self, "_isUsingDeprecatedViewLoadingForGadget:", v8))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PXGadgetControllerCellReuseIdentifier"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClipsToBounds:", 0);
  }
  else
  {
    v10 = (objc_class *)objc_msgSend(v8, "collectionViewItemClass");
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[NSMutableSet containsObject:](self->_registeredCellReuseIdentifiers, "containsObject:", v12) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_registeredCellReuseIdentifiers, "addObject:", v12);
      objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v10, v12);
    }
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXGadgetUIViewController _setGadget:forCollectionViewCell:](self, "_setGadget:forCollectionViewCell:", v8, v9);

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  int64x2_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "headerStyle") == 6)
    v12 = CFSTR("PXGadgetControllerCustomSurveySectionHeaderReuseIdentifier");
  else
    v12 = CFSTR("PXGadgetControllerSectionHeaderReuseIdentifier");
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = objc_msgSend(v14, "identifier");
  v17[1] = objc_msgSend(v10, "section");
  v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v14, "gadgetSectionAtIndexPath:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController _configureHeader:withGadgetSection:](self, "_configureHeader:withGadgetSection:", v13, v15);

  return v13;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Gadget_CV_prefetchItems", ", buf, 2u);
  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXGadgetUIViewController _isUsingDeprecatedViewLoadingForGadget:](self, "_isUsingDeprecatedViewLoadingForGadget:", v10))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "contentViewController");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "view");
LABEL_9:

        goto LABEL_10;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "contentView");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
LABEL_10:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "bounds");
      objc_msgSend(v10, "prefetchDuringScrollingForWidth:", v12);
    }

  }
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Gadget_CV_prefetchItems", ", v13, 2u);
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXGadgetUIViewController _isUsingDeprecatedViewLoadingForGadget:](self, "_isUsingDeprecatedViewLoadingForGadget:", v10))
  {
    objc_msgSend(v10, "prepareCollectionViewItem:", v9);
    goto LABEL_16;
  }
  v11 = v9;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v12 = 0;
LABEL_7:
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v10, "contentView"), (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v14;
    }
    else
    {
      PXAssertGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v10;
        _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "No content view provided by gadget: %@", (uint8_t *)&v18, 0xCu);
      }

      v13 = 0;
    }
    goto LABEL_13;
  }
  objc_msgSend(v10, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_7;
LABEL_13:
  if (v12)
  {
    -[PXGadgetUIViewController addChildViewController:](self, "addChildViewController:", v12);
    objc_msgSend(v12, "didMoveToParentViewController:", self);
  }
  objc_msgSend(v11, "setGadgetContentView:", v13);

LABEL_16:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXGadgetUIViewController cellsWantingVisibleRectUpdates](self, "cellsWantingVisibleRectUpdates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v9);

    -[PXGadgetUIViewController _updateVisibleRectForGadget:inCell:collectionView:](self, "_updateVisibleRectForGadget:inCell:collectionView:", v10, v9, v8);
  }
  if (-[PXGadgetUIViewController isContentVisible](self, "isContentVisible")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", ", (uint8_t *)&v18, 2u);
    }
    objc_msgSend(v10, "contentViewWillAppear");
    if (os_signpost_enabled(v17))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", ", (uint8_t *)&v18, 2u);
    }

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[PXGadgetUIViewController _gadgetForCollectionViewCell:](self, "_gadgetForCollectionViewCell:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (-[PXGadgetUIViewController _isUsingDeprecatedViewLoadingForGadget:](self, "_isUsingDeprecatedViewLoadingForGadget:", v6))
    {
      v7 = v14;
      objc_msgSend(v7, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "gadgetContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
      {
        if (-[PXGadgetUIViewController isContentVisible](self, "isContentVisible")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "contentViewDidDisappear");
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "contentViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "willMoveToParentViewController:", 0);
            objc_msgSend(v12, "removeFromParentViewController");
          }

        }
        objc_msgSend(v7, "setGadgetContentView:", 0);
      }

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "removeCollectionViewItem:", v14);
    }
  }
  -[PXGadgetUIViewController cellsWantingVisibleRectUpdates](self, "cellsWantingVisibleRectUpdates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v14);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "userDidSelectGadget");
  objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v6, 0);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  void *v4;
  unint64_t v5;

  -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ((unint64_t)objc_msgSend(v4, "gadgetCapabilities") >> 1) & 1;

  return v5;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
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
  UIEdgeInsets result;

  v8 = a4;
  v9 = a3;
  -[PXGadgetUIViewController layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:layout:insetForSectionAtIndex:", v9, v8, a5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXGadgetUIViewController layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionView:layout:sizeForItemAtIndexPath:", v10, v9, v8);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a4;
  v9 = a3;
  -[PXGadgetUIViewController layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:layout:referenceSizeForHeaderInSection:", v9, v8, a5);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)insetsForSectionHeaders
{
  void *v2;
  void *v3;
  double v4;
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
  UIEdgeInsets result;

  -[PXGadgetUIViewController specManager](self, "specManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentGadgetSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)isTogglingSidebarNoRotating
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    v5 = -[PXGadgetUIViewController isDFITogglingSidebar](self, "isDFITogglingSidebar");
    if (v5)
      LOBYTE(v5) = !-[PXGadgetUIViewController isRotatingVerticalLayout](self, "isRotatingVerticalLayout");
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4
{
  -[PXGadgetUIViewController setIsDFITogglingSidebar:](self, "setIsDFITogglingSidebar:", 1, a4);
}

- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4
{
  -[PXGadgetUIViewController setIsDFITogglingSidebar:](self, "setIsDFITogglingSidebar:", 0, a4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PXGadgetUIViewController _updateGadgetVisibleRects](self, "_updateGadgetVisibleRects", a3);
  objc_msgSend(off_1E50B4758, "sharedScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewDidScroll");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[PXGadgetUIViewController _clearTimerToHandleGadgetsSeen](self, "_clearTimerToHandleGadgetsSeen");
  -[PXGadgetUIViewController setIsScrolling:](self, "setIsScrolling:", 1);
  v5 = objc_msgSend(v4, "isDecelerating");

  if ((v5 & 1) == 0)
    +[PXAnimationTracker scrollAnimationDidBegin:](PXAnimationTracker, "scrollAnimationDidBegin:", -[PXGadgetUIViewController scrollAnimationIdentifier](self, "scrollAnimationIdentifier"));
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v6 = a3;
  if (!a4)
  {
    v9 = v6;
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDecelerating");

    v6 = v9;
    if ((v8 & 1) == 0)
    {
      -[PXGadgetUIViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling");
      v6 = v9;
    }
  }

}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  +[PXImportManager supportedTypeIdentifiers](PXImportManager, "supportedTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5);

  return v6;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10
    && (v12 = objc_msgSend(v10, "section"),
        -[PXGadgetUIViewController dataSource](self, "dataSource"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "numberOfSections"),
        v13,
        v12 < v14))
  {
    -[PXGadgetUIViewController _gadgetAtIndexPath:](self, "_gadgetAtIndexPath:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "gadgetCapabilities");
    v17 = objc_alloc(MEMORY[0x1E0DC3608]);
    if ((v16 & 1) != 0)
    {
      v18 = 2;
      v19 = 2;
    }
    else
    {
      v18 = 1;
      v19 = 0;
    }
    v20 = (void *)objc_msgSend(v17, "initWithDropOperation:intent:", v18, v19);

  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:intent:", 1, 0);
  }

  return v20;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetUIViewController.m"), 1195, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGadgetUIViewController collectionView:performDropWithCoordinator:]", v11);

  abort();
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3;

  -[PXGadgetUIViewController layout](self, "layout", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  char v4;
  id v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v11 = v6;
  if ((v4 & 0x40) != 0)
  {
    v7 = -[PXGadgetUIViewController isGadgetAnimating](self, "isGadgetAnimating");
    v6 = v11;
    if (!v7)
    {
      v8 = -[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating");
      v6 = v11;
      if (!v8)
      {
        -[PXGadgetUIViewController layout](self, "layout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidateLayout");

        v6 = v11;
      }
    }
  }
  if ((v4 & 3) != 0)
  {
    -[PXGadgetUIViewController _indexPathForGadget:](self, "_indexPathForGadget:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetUIViewController _updateHeaderForGadget:atIndexPath:](self, "_updateHeaderForGadget:atIndexPath:", v11, v10);

    v6 = v11;
  }

}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[PXGadgetUIViewController isCurrentlyVisible](self, "isCurrentlyVisible"))
  {
    -[PXGadgetUIViewController setGadgetAnimating:](self, "setGadgetAnimating:", 1);
    objc_initWeak(&location, self);
    -[PXGadgetUIViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__PXGadgetUIViewController_gadget_animateChanges___block_invoke;
    v9[3] = &unk_1E5142510;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "performBatchUpdates:completion:", v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PXGadgetUIViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PXGadgetUIViewController setSelectedGadget:](self, "setSelectedGadget:", v10);
    objc_msgSend(v13, "px_pushViewController:animated:completion:", v11, v7, v12);
  }

  return v13 != 0;
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetUIViewController.m"), 1254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    v10 = 0;
  }
  -[PXGadgetUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v6, v11);

}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v9 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetUIViewController.m"), 1261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  }
  -[PXGadgetUIViewController presentedViewController](self, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
    -[PXGadgetUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v6, v9);

}

- (id)presentationEnvironmentForGadget:(id)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetUIViewController.m"), 1269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget"));

  }
  return +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
}

- (PXGadgetTransition)gadgetTransition
{
  PXUIGadgetTransition *v3;
  void *v4;
  void *v5;
  PXUIGadgetTransition *v6;

  -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  v3 = [PXUIGadgetTransition alloc];
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_gridPresentation](self, "px_gridPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXUIGadgetTransition initWithOneUpPresentation:gridPresentation:](v3, "initWithOneUpPresentation:gridPresentation:", v4, v5);

  return (PXGadgetTransition *)v6;
}

- (PXGadgetDelegate)nextGadgetResponder
{
  return 0;
}

- (id)sortedVisibleIndexPathsForAnchorHelper:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGadgetUIViewController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)anchorHelper:(id)a3 indexPathIsFullyVisible:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  BOOL v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double Height;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v39;
  CGFloat v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v6 = a4;
  v7 = a3;
  -[PXGadgetUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bounds");
  objc_msgSend(v10, "convertRect:toView:", v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v7, "anchorPosition");

  if (v19 == 1)
  {
    objc_msgSend(v9, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    PXRectGetCenter();
    v39 = v29;
    v40 = v18;
    v31 = v30;
    v42.origin.x = v22;
    v42.origin.y = v24;
    v42.size.width = v26;
    v42.size.height = v28;
    Height = CGRectGetHeight(v42);
    if (Height <= 100.0)
      v33 = Height;
    else
      v33 = 100.0;
    v34 = fmax(v31 + v33 * -0.5, 0.0);
    v44.size.height = v40;
    v35 = fmax(v39 - v33, 0.0);
    v36 = v33;
    v44.origin.x = v12;
    v44.origin.y = v14;
    v44.size.width = v16;
    v20 = CGRectIntersectsRect(*(CGRect *)(&v33 - 2), v44);
  }
  else
  {
    if (v19)
    {
      v37 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v8, "bounds");
    v43.origin.x = v12;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    v20 = CGRectContainsRect(v41, v43);
  }
  v37 = v20;
LABEL_10:

  return v37;
}

- (BOOL)navigateToGadget:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetUIViewController.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget != nil"));

  }
  if (!-[PXGadgetUIViewController isScrolling](self, "isScrolling"))
  {
    -[PXGadgetUIViewController _indexPathForGadget:](self, "_indexPathForGadget:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "PXGadgetUIViewController - Gadget %@ is at index path %@", buf, 0x16u);
    }

    v8 = v9 != 0;
    if (v9)
    {
      -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "anchorPosition");

      if (v12 == 1)
        v13 = 18;
      else
        v13 = 9;
      -[PXGadgetUIViewController collectionView](self, "collectionView");
      v14 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject selectionFollowsFocus](v14, "selectionFollowsFocus"))
      {
        -[NSObject selectItemAtIndexPath:animated:scrollPosition:](v14, "selectItemAtIndexPath:animated:scrollPosition:", v9, v4, v13);
        if (v4)
          goto LABEL_19;
        goto LABEL_17;
      }
      -[NSObject scrollToItemAtIndexPath:atScrollPosition:animated:](v14, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, v13, v4);
      if (!v4)
      {
LABEL_17:
        -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "saveGadgetAsAnchor:", v7);
        goto LABEL_18;
      }
    }
    else
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXGadgetUIViewController - %@: Null index path returned for non-null gadget: %@", buf, 0x16u);
LABEL_18:

      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (void)navigationHelperDidNotFindValidGadget:(id)a3
{
  id v3;

  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadRemainingGadgetsIfNeeded");

}

- (void)_dataSourceManagerDidChange
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  PXGadgetUIViewController *v34;
  id v35;
  id v36;
  uint64_t *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  SEL v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController specManager](self, "specManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__148318;
  v55 = __Block_byref_object_dispose__148319;
  _GetChangeDetails(v5, objc_msgSend(v6, "identifier"), objc_msgSend(v7, "identifier"));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXGadgetUIViewController isCurrentlyVisible](self, "isCurrentlyVisible"))
  {
    PLGadgetsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Gadget view controller is visible and evaulating changes.", buf, 2u);
    }

    objc_msgSend((id)v52[5], "sectionChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v50 = objc_msgSend(v9, "hasIncrementalChanges");
    if (!*((_BYTE *)v48 + 24))
      goto LABEL_14;
    objc_msgSend((id)v52[5], "sectionsWithItemChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke;
    v46[3] = &unk_1E512DFF8;
    v46[4] = &v51;
    v46[5] = &v47;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v46);

    if (*((_BYTE *)v48 + 24))
    {
      PLGadgetsGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)v52[5];
        *(_DWORD *)buf = 138412290;
        v58 = v13;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Gadget view controller will perform UICollectionView batch updates with change details: %@", buf, 0xCu);
      }

      -[PXGadgetUIViewController setBatchUpdating:](self, "setBatchUpdating:", 1);
      v38[0] = v11;
      v38[1] = 3221225472;
      v38[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_277;
      v38[3] = &unk_1E512E070;
      v38[4] = self;
      v39 = v7;
      v40 = v9;
      v14 = v4;
      v15 = v6;
      v16 = v11;
      v17 = v14;
      v41 = v14;
      v45 = a2;
      v28 = v15;
      v42 = v15;
      v44 = &v51;
      v43 = v29;
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2_281;
      v30[3] = &unk_1E512E098;
      v31 = v17;
      v32 = v40;
      v33 = v39;
      v34 = self;
      v35 = v5;
      v37 = &v51;
      v36 = v42;
      objc_msgSend(v31, "performBatchUpdates:completion:", v38, v30);

      v6 = v28;
    }
    else
    {
LABEL_14:
      PLGadgetsGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "publiclySafeDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "publiclySafeDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v4, "numberOfSections");
        v25 = v52[5];
        *(_DWORD *)buf = 138544130;
        v58 = v22;
        v59 = 2114;
        v60 = v23;
        v61 = 2048;
        v62 = v24;
        v63 = 2112;
        v64 = v25;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "Gadget view controller will not perform UICollectionView batch updates. Setting new data source: %{public}@, Old data source: %{public}@, UICollectionView number of sections: %ld, Change details: %@", buf, 0x2Au);

      }
      -[PXGadgetUIViewController setDataSource:](self, "setDataSource:", v7);
      if (_HasAnyInsertionsForChangeDetails((void *)v52[5]))
        objc_msgSend(v29, "updateGadgetDataSourceToSpecIfNeeded:", v7);
      -[PXGadgetUIViewController _notifyGadgetsThatGadgetControllerHasAppeared](self, "_notifyGadgetsThatGadgetControllerHasAppeared");
      PLGadgetsGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "publiclySafeDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v27;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "Reloading Gadget view controller's UICollectionView with new data source: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v4, "reloadData");
      -[PXGadgetUIViewController gadgetControllerFinishedUpdatingDataSourceWithChange:](self, "gadgetControllerFinishedUpdatingDataSourceWithChange:", v52[5]);
    }
    _Block_object_dispose(&v47, 8);

  }
  else
  {
    PLGadgetsGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "publiclySafeDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "publiclySafeDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v19;
      v59 = 2114;
      v60 = v20;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Gadget view controller not yet visible. Setting new data source: %{public}@, old data source: %{public}@", buf, 0x16u);

    }
    -[PXGadgetUIViewController setDataSource:](self, "setDataSource:", v7);
    self->_updateFlags = (PXGadgetUpdateFlags)257;
    if (_HasAnyInsertionsForChangeDetails((void *)v52[5]))
      objc_msgSend(v29, "updateGadgetDataSourceToSpecIfNeeded:", v7);
    -[PXGadgetUIViewController gadgetControllerFinishedUpdatingDataSourceWithChange:](self, "gadgetControllerFinishedUpdatingDataSourceWithChange:", v52[5]);
  }
  _Block_object_dispose(&v51, 8);

}

- (void)_gadgetSpecDidChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[PXGadgetUIViewController specManager](self, "specManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentGadgetSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpec:", v4);

  objc_msgSend(v19, "currentGadgetSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;

  -[PXGadgetUIViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "largeTitleInsets");
  if (v7 == v14 && v11 == 0.0 && v9 == v13)
  {
    v15 = v12;

    if (v15 == 0.0)
      goto LABEL_8;
  }
  else
  {

  }
  -[PXGadgetUIViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLargeTitleInsets:", 0.0, v7, 0.0, v9);

  -[PXGadgetUIViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

LABEL_8:
  -[PXGadgetUIViewController _updateVisibleGadgetHeaders](self, "_updateVisibleGadgetHeaders");
  if (!-[PXGadgetUIViewController isBatchUpdating](self, "isBatchUpdating"))
    objc_msgSend(v3, "invalidateLayout");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if ((void *)PXDataSourceManagerObservationContext_148317 == a5)
  {
    if ((v6 & 1) != 0)
    {
      v9 = v8;
      -[PXGadgetUIViewController _dataSourceManagerDidChange](self, "_dataSourceManagerDidChange");
      goto LABEL_7;
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXGadgetSpecManagerObservationContext == a5)
  {
    v9 = v8;
    -[PXGadgetUIViewController _gadgetSpecDidChange](self, "_gadgetSpecDidChange");
LABEL_7:
    v8 = v9;
  }

}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[PXGadgetUIViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_scrollToEdge:animated:", 1, v3);

  return 1;
}

- (void)setPlaceholderManager:(id)a3
{
  PXContentUnavailablePlaceholderManager *v5;
  PXContentUnavailablePlaceholderManager *placeholderManager;
  PXContentUnavailablePlaceholderManager *v7;

  v5 = (PXContentUnavailablePlaceholderManager *)a3;
  placeholderManager = self->_placeholderManager;
  if (placeholderManager != v5)
  {
    v7 = v5;
    -[PXContentUnavailablePlaceholderManager setDelegate:](placeholderManager, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_placeholderManager, a3);
    -[PXContentUnavailablePlaceholderManager setDelegate:](self->_placeholderManager, "setDelegate:", self);
    -[PXGadgetUIViewController _invalidatePlaceholder](self, "_invalidatePlaceholder");
    v5 = v7;
  }

}

- (void)_invalidatePlaceholder
{
  id v2;

  -[PXGadgetUIViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaceholder);

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetUIViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v13, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);

  }
  return v9;
}

- (OS_os_log)gadgetViewControllerLog
{
  if (gadgetViewControllerLog_onceToken != -1)
    dispatch_once(&gadgetViewControllerLog_onceToken, &__block_literal_global_287_148309);
  return (OS_os_log *)(id)gadgetViewControllerLog_sectionedDataSourceLog;
}

- (int64_t)scrollAnimationIdentifier
{
  return 0;
}

- (PXGadgetDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXGadgetNavigationHelper)navigationHelper
{
  return self->_navigationHelper;
}

- (PXGadgetAnchorHelper)anchorHelper
{
  return self->_anchorHelper;
}

- (unint64_t)numberOfInitialGadgetsToLoad
{
  return self->_numberOfInitialGadgetsToLoad;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PXGadgetCollectionViewLayout)layout
{
  return self->_layout;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (PXGadget)interactionPreviewGadget
{
  return self->_interactionPreviewGadget;
}

- (void)setInteractionPreviewGadget:(id)a3
{
  objc_storeStrong((id *)&self->_interactionPreviewGadget, a3);
}

- (UIView)interactionPreviewView
{
  return self->_interactionPreviewView;
}

- (void)setInteractionPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_interactionPreviewView, a3);
}

- (BOOL)isInteractionPreviewCancelled
{
  return self->_isInteractionPreviewCancelled;
}

- (void)setIsInteractionPreviewCancelled:(BOOL)a3
{
  self->_isInteractionPreviewCancelled = a3;
}

- (PXGadgetDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isCurrentlyVisible
{
  return self->_currentlyVisible;
}

- (void)setCurrentlyVisible:(BOOL)a3
{
  self->_currentlyVisible = a3;
}

- (BOOL)isLoadingGadgets
{
  return self->_loadingGadgets;
}

- (void)setLoadingGadgets:(BOOL)a3
{
  self->_loadingGadgets = a3;
}

- (BOOL)isGadgetAnimating
{
  return self->_gadgetAnimating;
}

- (void)setGadgetAnimating:(BOOL)a3
{
  self->_gadgetAnimating = a3;
}

- (BOOL)isBatchUpdating
{
  return self->_batchUpdating;
}

- (void)setBatchUpdating:(BOOL)a3
{
  self->_batchUpdating = a3;
}

- (PXGadgetSpecManager)specManager
{
  return self->_specManager;
}

- (void)setSpecManager:(id)a3
{
  objc_storeStrong((id *)&self->_specManager, a3);
}

- (PXGadget)selectedGadget
{
  return self->_selectedGadget;
}

- (void)setSelectedGadget:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGadget, a3);
}

- (PXGadgetUpdateFlags)updateFlags
{
  return self->_updateFlags;
}

- (void)setUpdateFlags:(PXGadgetUpdateFlags)a3
{
  self->_updateFlags = a3;
}

- (NSTimer)gadgetSeenTimer
{
  return self->_gadgetSeenTimer;
}

- (void)setGadgetSeenTimer:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSeenTimer, a3);
}

- (NSMutableSet)seenGadgetIdentifiers
{
  return self->_seenGadgetIdentifiers;
}

- (void)setSeenGadgetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_seenGadgetIdentifiers, a3);
}

- (BOOL)isContentVisible
{
  return self->_isContentVisible;
}

- (NSMutableSet)cellsWantingVisibleRectUpdates
{
  return self->_cellsWantingVisibleRectUpdates;
}

- (void)setCellsWantingVisibleRectUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_cellsWantingVisibleRectUpdates, a3);
}

- (BOOL)isDFITogglingSidebar
{
  return self->_isDFITogglingSidebar;
}

- (void)setIsDFITogglingSidebar:(BOOL)a3
{
  self->_isDFITogglingSidebar = a3;
}

- (BOOL)isRotatingVerticalLayout
{
  return self->_isRotatingVerticalLayout;
}

- (void)setIsRotatingVerticalLayout:(BOOL)a3
{
  self->_isRotatingVerticalLayout = a3;
}

- (BOOL)shouldPreventPlaceholder
{
  return self->_shouldPreventPlaceholder;
}

- (BOOL)allowsBarManagement
{
  return self->_allowsBarManagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderManager, 0);
  objc_storeStrong((id *)&self->_cellsWantingVisibleRectUpdates, 0);
  objc_storeStrong((id *)&self->_seenGadgetIdentifiers, 0);
  objc_storeStrong((id *)&self->_gadgetSeenTimer, 0);
  objc_storeStrong((id *)&self->_selectedGadget, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_interactionPreviewView, 0);
  objc_storeStrong((id *)&self->_interactionPreviewGadget, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_anchorHelper, 0);
  objc_storeStrong((id *)&self->_navigationHelper, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_cellsToGadgets, 0);
  objc_storeStrong((id *)&self->_registeredCellReuseIdentifiers, 0);
}

void __51__PXGadgetUIViewController_gadgetViewControllerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "GadgetViewController");
  v1 = (void *)gadgetViewControllerLog_sectionedDataSourceLog;
  gadgetViewControllerLog_sectionedDataSourceLog = (uint64_t)v0;

}

void __46__PXGadgetUIViewController__updatePlaceholder__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performPlaceholderButtonAction");

}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "itemChangesInSection:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasIncrementalChanges") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_277(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removedIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "insertedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
    goto LABEL_4;
  if (objc_msgSend(v2, "indexGreaterThanOrEqualToIndex:", objc_msgSend(*(id *)(a1 + 56), "numberOfSections")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 56), "deleteSections:", v2);
LABEL_4:
    if (objc_msgSend(v3, "count"))
      objc_msgSend(*(id *)(a1 + 56), "insertSections:", v3);
    v4 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_278;
    v19[3] = &unk_1E512E020;
    v5 = *(void **)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v5, "enumerateMovedIndexesUsingBlock:", v19);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "sectionsWithItemChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2;
    v12[3] = &unk_1E513A8A0;
    v17 = *(_QWORD *)(a1 + 80);
    v7 = *(id *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v8;
    v15 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v12);
    if (_HasAnyInsertionsForChangeDetails(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)))
      objc_msgSend(*(id *)(a1 + 72), "updateGadgetDataSourceToSpecIfNeeded:", *(_QWORD *)(a1 + 40));

    goto LABEL_12;
  }
  PXAssertGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v2;
    v27 = 2112;
    v28 = v3;
    _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "Gadget view controller caught trying to remove UICollectionView section/s that doesn't exist - Old datasource: %@, New datasource: %@, Removed indexes: %@, Inserted indexes: %@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 56), "reloadData");
LABEL_12:

}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2_281(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PLGadgetsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
    v14 = 134217984;
    v15 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Gadget view controller finished UICollectionView batch updates. Current collection view number of sections: %ld", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "changedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  PLGadgetsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "publiclySafeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = (uint64_t)v8;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Reloading Gadget view controller's UICollectionView after batch updates. New data source: %{public}@, Section being reloaded: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "reloadSections:", v4);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "publiclySafeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = (uint64_t)v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Not reloading gadget view controller's UICollectionView after batch updates. No changed indexes for new data source: %{public}@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "_notifyGadgetsThatGadgetControllerHasAppeared");
  objc_msgSend(*(id *)(a1 + 64), "loadRemainingGadgetsIfNeeded");
  objc_msgSend(*(id *)(a1 + 56), "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != *(void **)(a1 + 48))
  {
    _GetChangeDetails(*(void **)(a1 + 64), objc_msgSend(*(id *)(a1 + 72), "identifier"), objc_msgSend(v10, "identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  objc_msgSend(*(id *)(a1 + 56), "gadgetControllerFinishedUpdatingDataSourceWithChange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 56), "setBatchUpdating:", 0);

}

uint64_t __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveSection:toSection:", a2, a3);
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "itemChangesInSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfSections") <= a2)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      objc_msgSend(*(id *)(a1 + 32), "reloadData");
      goto LABEL_12;
    }
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413314;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2048;
    v27 = a2;
    v12 = "Gadget view controller caught trying to remove UICollectionView item/s from a section that doesn't exist - Old"
          " datasource: %@, New datasource: %@, Removed indexes: %@, Inserted indexes: %@, Nonexistent section: %lu";
LABEL_14:
    _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, v12, buf, 0x34u);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "indexGreaterThanOrEqualToIndex:", objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413314;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2048;
    v27 = a2;
    v12 = "Gadget view controller caught trying to remove UICollectionView item/s that do not exist - Old datasource: %@,"
          " New datasource: %@, Removed indexes: %@, Inserted indexes: %@, Section in question: %lu";
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deleteItemsAtIndexPaths:", v7);

LABEL_5:
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v6, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "insertItemsAtIndexPaths:", v8);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_280;
  v15[3] = &unk_1E512E048;
  v17 = a2;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateMovedIndexesUsingBlock:", v15);

LABEL_12:
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "moveItemAtIndexPath:toIndexPath:", v6, v5);

}

void __50__PXGadgetUIViewController_gadget_animateChanges___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setGadgetAnimating:", 0);

}

void __64__PXGadgetUIViewController__notifyGadgetsThatGadgetWasDismissed__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "gadgetWasDismissed");

}

void __76__PXGadgetUIViewController__notifyGadgetsThatGadgetControllerHasDisappeared__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "gadgetControllerHasDisappeared");

}

void __73__PXGadgetUIViewController__notifyGadgetsThatGadgetControllerHasAppeared__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "gadgetControllerHasAppeared");

}

void __56__PXGadgetUIViewController__setTimerToHandleGadgetsSeen__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleGadgetsSeen");

}

void __63__PXGadgetUIViewController__configureHeader_withGadgetSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setIsFirstSection:", v3);
  objc_msgSend(*(id *)(a1 + 32), "configureSectionHeader:", v4);

}

uint64_t __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitPreviewViewController:", *(_QWORD *)(a1 + 40));
}

uint64_t __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitPreviewView:", *(_QWORD *)(a1 + 40));
}

id __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "contextMenuWithSuggestedActions:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "px_previewActionMenus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

void __51__PXGadgetUIViewController_debugURLsForDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "debugURLsForDiagnostics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

  }
}

uint64_t __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 40), "navigateToAnchorIfNeeded");
}

uint64_t __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsRotatingVerticalLayout:", 0);
}

+ (Class)gadgetSpecClass
{
  return (Class)objc_opt_class();
}

@end
