@implementation PUOneUpBarsController

- (PUOneUpBarsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 207, CFSTR("%s is not available as initializer"), "-[PUOneUpBarsController init]");

  abort();
}

- (PUOneUpBarsController)initWithViewController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 211, CFSTR("%s is not available as initializer"), "-[PUOneUpBarsController initWithViewController:delegate:]");

  abort();
}

- (PUOneUpBarsController)initWithStyle:(int64_t)a3 browsingSession:(id)a4 viewController:(id)a5 actionsController:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PUOneUpBarsController *v16;
  PUOneUpBarsController *v17;
  id *p_browsingSession;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *infoRequestSerialQueue;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *scrubbingIdentifier;
  PUPhotoBrowserTitleViewController *v32;
  PUPhotoBrowserTitleViewController *titleViewController;
  uint64_t v34;
  PXInfoUpdater *currentAssetDisplayInfoUpdater;
  PUPlayPauseBarItemsController *v36;
  void *v37;
  uint64_t v38;
  PUPlayPauseBarItemsController *playPauseBarItemsController;
  void *v40;
  objc_super v42;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)PUOneUpBarsController;
  v16 = -[PUBarsController initWithViewController:delegate:](&v42, sel_initWithViewController_delegate_, a5, v15);
  v17 = v16;
  if (v16)
  {
    v16->_style = a3;
    p_browsingSession = (id *)&v16->_browsingSession;
    objc_storeStrong((id *)&v16->_browsingSession, a4);
    v17->_delegateFlags.respondsToDidChangeShowingPlayPauseButton = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToDidTapPlayPauseButton = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToDidTapTitle = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToIsDetailsAccessoryAvailableForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToToggleDetailsVisibility = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToToggleCommentsVisibility = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToCanShowCommentsForAsset = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldTapBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideToolbarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideNavigationBarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideStatusBarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    objc_msgSend(*p_browsingSession, "viewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerChangeObserver:", v17);

    objc_msgSend(*p_browsingSession, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resizeTaskDescriptorViewModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerChangeObserver:context:", v17, PUPhotoPickerResizeTaskDescriptorViewModelObservationContext);

    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerChangeObserver:context:", v17, VideoMuteControllerContext_49118);

    objc_storeStrong((id *)&v17->_actionsController, a6);
    -[PUOneUpActionsController setPopoverHelper:](v17->_actionsController, "setPopoverHelper:", v17);
    -[PUBarsController viewController](v17, "viewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pu_toolbarViewModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerChangeObserver:", v17);

    v25 = dispatch_queue_create("com.apple.photos.one-up-info-provider-request", 0);
    infoRequestSerialQueue = v17->_infoRequestSerialQueue;
    v17->_infoRequestSerialQueue = (OS_dispatch_queue *)v25;

    objc_msgSend((id)objc_opt_class(), "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    scrubbingIdentifier = v17->__scrubbingIdentifier;
    v17->__scrubbingIdentifier = (NSString *)v30;

    v32 = objc_alloc_init(PUPhotoBrowserTitleViewController);
    titleViewController = v17->__titleViewController;
    v17->__titleViewController = v32;

    -[PUPhotoBrowserTitleViewController setDelegate:](v17->__titleViewController, "setDelegate:", v17);
    v17->__needsUpdateTitle = 1;
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B550]), "initWithInfoProvider:infoKind:", v17, CFSTR("PUCurrentAssetDisplayInfo"));
    currentAssetDisplayInfoUpdater = v17->__currentAssetDisplayInfoUpdater;
    v17->__currentAssetDisplayInfoUpdater = (PXInfoUpdater *)v34;

    -[PXInfoUpdater setObserver:](v17->__currentAssetDisplayInfoUpdater, "setObserver:", v17);
    v36 = [PUPlayPauseBarItemsController alloc];
    objc_msgSend(*p_browsingSession, "viewModel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PUPlayPauseBarItemsController initWithViewModel:](v36, "initWithViewModel:", v37);
    playPauseBarItemsController = v17->__playPauseBarItemsController;
    v17->__playPauseBarItemsController = (PUPlayPauseBarItemsController *)v38;

    -[PUPlayPauseBarItemsController registerChangeObserver:](v17->__playPauseBarItemsController, "registerChangeObserver:", v17);
    v17->__lastChromeVisibility = 1;
    -[PUOneUpBarsController _initializeBarButtonItemCollections](v17, "_initializeBarButtonItemCollections");
    -[PUOneUpBarsController _startObservingOrientationChanges](v17, "_startObservingOrientationChanges");
    -[PUOneUpBarsController _invalidateScrubber](v17, "_invalidateScrubber");
    -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](v17, "_currentAssetDisplayInfoUpdater");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "invalidateInfo");

    -[PUOneUpBarsController _invalidateWantsAllPhotosButton](v17, "_invalidateWantsAllPhotosButton");
  }

  return v17;
}

- (void)_initializeBarButtonItemCollections
{
  uint64_t v3;
  __objc2_class_ro **p_info;
  PUBarButtonItemCollection *v5;
  PUBarButtonItemCollection *toolbarButtonItemCollection;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableIndexSet *v15;
  NSMutableIndexSet *toolbarButtonIdentifiers;
  PUBarButtonItemCollection *v17;
  PUBarButtonItemCollection *rightNavBarButtonItemCollection;
  NSMutableIndexSet *v19;
  NSMutableIndexSet *rightNavBarButtonIdentifiers;
  PUBarButtonItemCollection *v21;
  PUBarButtonItemCollection *centerNavBarButtonItemCollection;
  NSMutableIndexSet *v23;
  NSMutableIndexSet *centerNavBarButtonIdentifiers;
  PUBarButtonItemCollection *v25;
  PUBarButtonItemCollection *leftNavBarButtonItemCollection;
  NSMutableIndexSet *v27;
  NSMutableIndexSet *leftNavBarButtonIdentifiers;
  id v29;
  id v30;

  if (-[PUOneUpBarsController style](self, "style") == 3)
  {
    v3 = 5;
  }
  else if (-[PUOneUpBarsController style](self, "style") == 1)
  {
    if (-[PUOneUpBarsController _physicalDeviceIsIPad](self, "_physicalDeviceIsIPad"))
      v3 = 5;
    else
      v3 = 3;
  }
  else
  {
    v3 = 3;
  }
  p_info = PUBadgeTileViewController.info;
  v5 = -[PUBarButtonItemCollection initWithOptions:]([PUBarButtonItemCollection alloc], "initWithOptions:", v3);
  toolbarButtonItemCollection = self->__toolbarButtonItemCollection;
  self->__toolbarButtonItemCollection = v5;

  -[PUBarButtonItemCollection setDataSource:](self->__toolbarButtonItemCollection, "setDataSource:", self);
  if (-[PUOneUpBarsController style](self, "style") == 3)
  {
    v7 = (void *)objc_msgSend(&unk_1E59BA168, "mutableCopy");
    v8 = objc_msgSend(&unk_1E59BA168, "indexOfObject:", &unk_1E59BB280);
    v9 = objc_msgSend(&unk_1E59BA168, "indexOfObject:", &unk_1E59BB298);
    v10 = objc_msgSend(&unk_1E59BA168, "indexOfObject:", &unk_1E59BB310);
    v11 = objc_msgSend(&unk_1E59BA168, "indexOfObject:", &unk_1E59BB328);
    v12 = v8;
    p_info = (__objc2_class_ro **)(PUBadgeTileViewController + 32);
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v12, &unk_1E59BB310);
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v9, &unk_1E59BB328);
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v10, &unk_1E59BB280);
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v11, &unk_1E59BB298);
    v29 = (id)objc_msgSend(v7, "copy");

    v13 = v29;
  }
  else
  {
    v13 = &unk_1E59BA168;
  }
  v30 = v13;
  -[PUBarButtonItemCollection setIdentifiersOrder:](self->__toolbarButtonItemCollection, "setIdentifiersOrder:");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addIndex:", 14);
  objc_msgSend(v14, "addIndex:", 15);
  objc_msgSend(v14, "addIndex:", 8);
  objc_msgSend(v14, "addIndex:", 9);
  objc_msgSend(v14, "addIndex:", 7);
  objc_msgSend(v14, "addIndex:", 34);
  objc_msgSend(v14, "addIndex:", 24);
  if (-[PUOneUpBarsController style](self, "style") != 2)
    objc_msgSend(v14, "addIndex:", 33);
  objc_msgSend(v14, "addIndex:", 48);
  objc_msgSend(v14, "addIndex:", 49);
  objc_msgSend(v14, "addIndex:", 28);
  objc_msgSend(v14, "addIndex:", 29);
  objc_msgSend(v14, "addIndex:", 39);
  if (-[PUOneUpBarsController style](self, "style") == 1)
  {
    objc_msgSend(v14, "addIndex:", 12);
    objc_msgSend(v14, "addIndex:", 13);
    objc_msgSend(v14, "addIndex:", 35);
  }
  -[PUBarButtonItemCollection setCenteredItemIdentifiers:](self->__toolbarButtonItemCollection, "setCenteredItemIdentifiers:", v14);
  v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  toolbarButtonIdentifiers = self->__toolbarButtonIdentifiers;
  self->__toolbarButtonIdentifiers = v15;

  v17 = (PUBarButtonItemCollection *)objc_msgSend(objc_alloc((Class)(p_info + 1)), "initWithOptions:", 0);
  rightNavBarButtonItemCollection = self->__rightNavBarButtonItemCollection;
  self->__rightNavBarButtonItemCollection = v17;

  -[PUBarButtonItemCollection setDataSource:](self->__rightNavBarButtonItemCollection, "setDataSource:", self);
  -[PUBarButtonItemCollection setIdentifiersOrder:](self->__rightNavBarButtonItemCollection, "setIdentifiersOrder:", &unk_1E59BA180);
  v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  rightNavBarButtonIdentifiers = self->__rightNavBarButtonIdentifiers;
  self->__rightNavBarButtonIdentifiers = v19;

  v21 = (PUBarButtonItemCollection *)objc_msgSend(objc_alloc((Class)(p_info + 1)), "initWithOptions:", 0);
  centerNavBarButtonItemCollection = self->__centerNavBarButtonItemCollection;
  self->__centerNavBarButtonItemCollection = v21;

  -[PUBarButtonItemCollection setDataSource:](self->__centerNavBarButtonItemCollection, "setDataSource:", self);
  -[PUBarButtonItemCollection setIdentifiersOrder:](self->__centerNavBarButtonItemCollection, "setIdentifiersOrder:", &unk_1E59BA198);
  v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  centerNavBarButtonIdentifiers = self->__centerNavBarButtonIdentifiers;
  self->__centerNavBarButtonIdentifiers = v23;

  v25 = (PUBarButtonItemCollection *)objc_msgSend(objc_alloc((Class)(p_info + 1)), "initWithOptions:", 0);
  leftNavBarButtonItemCollection = self->__leftNavBarButtonItemCollection;
  self->__leftNavBarButtonItemCollection = v25;

  -[PUBarButtonItemCollection setDataSource:](self->__leftNavBarButtonItemCollection, "setDataSource:", self);
  -[PUBarButtonItemCollection setIdentifiersOrder:](self->__leftNavBarButtonItemCollection, "setIdentifiersOrder:", &unk_1E59BA1B0);
  v27 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  leftNavBarButtonIdentifiers = self->__leftNavBarButtonIdentifiers;
  self->__leftNavBarButtonIdentifiers = v27;

}

- (void)dealloc
{
  objc_super v3;

  -[PUPlayPauseBarItemsController unregisterChangeObserver:](self->__playPauseBarItemsController, "unregisterChangeObserver:", self);
  -[PUOneUpBarsController _stopObservingOrientationChanges](self, "_stopObservingOrientationChanges");
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsController;
  -[PUOneUpBarsController dealloc](&v3, sel_dealloc);
}

- (PUOneUpBarsControllerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsController;
  -[PUBarsController delegate](&v3, sel_delegate);
  return (PUOneUpBarsControllerDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setShouldPlaceButtonsInNavigationBar:(BOOL)a3
{
  if (self->_shouldPlaceButtonsInNavigationBar != a3)
  {
    self->_shouldPlaceButtonsInNavigationBar = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setShouldUseCompactTitleView:(BOOL)a3
{
  if (self->_shouldUseCompactTitleView != a3)
  {
    self->_shouldUseCompactTitleView = a3;
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
  }
}

- (void)setShouldUseCompactCommentsTitle:(BOOL)a3
{
  if (self->_shouldUseCompactCommentsTitle != a3)
  {
    self->_shouldUseCompactCommentsTitle = a3;
    -[PUOneUpBarsController _invalidateCommentsTitle](self, "_invalidateCommentsTitle");
  }
}

- (void)setMaximumToolbarHeight:(double)a3
{
  if (self->_maximumToolbarHeight != a3)
  {
    self->_maximumToolbarHeight = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setMaximumAccessoryToolbarHeight:(double)a3
{
  if (self->_maximumAccessoryToolbarHeight != a3)
  {
    self->_maximumAccessoryToolbarHeight = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setShouldShowProgrammaticNavBackButton:(BOOL)a3
{
  if (self->_shouldShowProgrammaticNavBackButton != a3)
  {
    self->_shouldShowProgrammaticNavBackButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setShouldShowAirPlayButton:(BOOL)a3
{
  if (self->_shouldShowAirPlayButton != a3)
  {
    self->_shouldShowAirPlayButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setWantsShowInLibraryButton:(BOOL)a3
{
  if (self->_wantsShowInLibraryButton != a3)
  {
    self->_wantsShowInLibraryButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setShouldShowScrubber:(BOOL)a3
{
  if (self->_shouldShowScrubber != a3)
  {
    self->_shouldShowScrubber = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setDisableShowingNavigationBars:(BOOL)a3
{
  if (self->_disableShowingNavigationBars != a3)
  {
    self->_disableShowingNavigationBars = a3;
    -[PUOneUpBarsController _invalidateChromeVisibilityWithAnimationType:](self, "_invalidateChromeVisibilityWithAnimationType:", 0);
  }
}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  if (self->_shouldPlaceScrubberInScrubberBar != a3)
  {
    self->_shouldPlaceScrubberInScrubberBar = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setAllowTapOnTitle:(BOOL)a3
{
  if (self->_allowTapOnTitle != a3)
  {
    self->_allowTapOnTitle = a3;
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
  }
}

- (void)setAllowShowingPlayPauseButton:(BOOL)a3
{
  if (self->_allowShowingPlayPauseButton != a3)
  {
    self->_allowShowingPlayPauseButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
    -[PUOneUpBarsController _updateShowingPlayPauseButton](self, "_updateShowingPlayPauseButton");
  }
}

- (void)setShouldShowMuteButton:(BOOL)a3
{
  if (self->_shouldShowMuteButton != a3)
  {
    self->_shouldShowMuteButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setDebuggingObservedImageModulationManager:(id)a3
{
  PXImageModulationManager *v5;
  PXImageModulationManager *debuggingObservedImageModulationManager;
  PXImageModulationManager *v7;

  v5 = (PXImageModulationManager *)a3;
  debuggingObservedImageModulationManager = self->_debuggingObservedImageModulationManager;
  if (debuggingObservedImageModulationManager != v5)
  {
    v7 = v5;
    -[PXImageModulationManager unregisterChangeObserver:context:](debuggingObservedImageModulationManager, "unregisterChangeObserver:context:", self, PUDebuggingObservedImageModulationManagerObservationContext);
    objc_storeStrong((id *)&self->_debuggingObservedImageModulationManager, a3);
    -[PXImageModulationManager registerChangeObserver:context:](self->_debuggingObservedImageModulationManager, "registerChangeObserver:context:", self, PUDebuggingObservedImageModulationManagerObservationContext);
    v5 = v7;
  }

}

- (void)setPresentedTipID:(id)a3
{
  objc_storeStrong((id *)&self->_presentedTipID, a3);
  -[PUOneUpBarsController _updateActionsBarButtonItem](self, "_updateActionsBarButtonItem");
}

- (void)invalidateViewControllerView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsController;
  -[PUBarsController invalidateViewControllerView](&v3, sel_invalidateViewControllerView);
  -[PUBarsController invalidateContentGuideInsets](self, "invalidateContentGuideInsets");
}

- (void)_resetIdentifierIndexes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUOneUpBarsController _toolbarButtonIdentifiers](self, "_toolbarButtonIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _rightNavBarButtonIdentifiers](self, "_rightNavBarButtonIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _centerNavBarButtonIdentifiers](self, "_centerNavBarButtonIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _leftNavBarButtonIdentifiers](self, "_leftNavBarButtonIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllIndexes");
  objc_msgSend(v3, "removeAllIndexes");
  objc_msgSend(v4, "removeAllIndexes");
  objc_msgSend(v5, "removeAllIndexes");

}

- (void)_updateIdentifiersIndexesWithIdentifier:(int64_t)a3 location:(int64_t)a4 shouldEnable:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  switch(a4)
  {
    case 0:
      return;
    case 1:
      -[PUOneUpBarsController _rightNavBarButtonIdentifiers](self, "_rightNavBarButtonIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addIndex:", a3);

      -[PUOneUpBarsController _rightNavBarButtonItemCollection](self, "_rightNavBarButtonItemCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[PUOneUpBarsController _centerNavBarButtonIdentifiers](self, "_centerNavBarButtonIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addIndex:", a3);

      -[PUOneUpBarsController _centerNavBarButtonItemCollection](self, "_centerNavBarButtonItemCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[PUOneUpBarsController _leftNavBarButtonIdentifiers](self, "_leftNavBarButtonIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", a3);

      -[PUOneUpBarsController _leftNavBarButtonItemCollection](self, "_leftNavBarButtonItemCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[PUOneUpBarsController _toolbarButtonIdentifiers](self, "_toolbarButtonIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addIndex:", a3);

      -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = v9;
      objc_msgSend(v9, "barButtonItemForIdentifier:", a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setEnabled:", v5);
      break;
    default:
      v14 = 0;
      objc_msgSend(0, "setEnabled:", a5);
      break;
  }

}

- (void)updateBars
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  _BOOL4 v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  PUOneUpBarsController *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  BOOL v30;
  char v31;
  int v32;
  int v33;
  int v34;
  int64_t v35;
  int v36;
  int v37;
  int64_t v38;
  void *v39;
  void *v40;
  int v41;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  int v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  int64_t v50;
  int64_t v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  int64_t v56;
  void *v57;
  int64_t v58;
  void *v59;
  void *v60;
  int64_t v61;
  int64_t v62;
  PUOneUpBarsController *v63;
  uint64_t v64;
  int64_t v65;
  int64_t v66;
  int64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  int64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  int64_t v78;
  int v79;
  void *v80;
  void *v81;
  int64_t v82;
  uint64_t v83;
  PUOneUpBarsController *v84;
  uint64_t v85;
  int64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  int v92;
  int64_t v93;
  int64_t v94;
  int64_t v95;
  int64_t v96;
  int64_t v97;
  int64_t v98;
  int64_t v99;
  int64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  char v124;
  id v125;
  id v126;
  void *v127;
  char v128;
  void *v129;
  _BOOL8 v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  unsigned int v149;
  void *v150;
  _BOOL4 v152;
  int v153;
  int v154;
  _BOOL4 v155;
  _BOOL4 v156;
  _BOOL4 v157;
  _BOOL4 v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  void *v169;
  void *v170;
  _QWORD v171[4];
  id v172;
  id v173;
  PUOneUpBarsController *v174;
  _QWORD v175[4];
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  _QWORD v182[4];
  id v183;
  id v184;
  id v185;
  PUOneUpBarsController *v186;
  id v187;
  objc_super v188;
  _QWORD v189[10];
  _QWORD v190[12];

  v190[10] = *MEMORY[0x1E0C80C00];
  v188.receiver = self;
  v188.super_class = (Class)PUOneUpBarsController;
  -[PUBarsController updateBars](&v188, sel_updateBars);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetViewModelForAssetReference:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v5;
  objc_msgSend(v5, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "contentPrivacyState");
  -[PUOneUpBarsController _updateTitleIfNeeded](self, "_updateTitleIfNeeded");
  -[PUOneUpBarsController _title](self, "_title");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _titleViewController](self, "_titleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpBarsController currentAssetByAssetCollection](self, "currentAssetByAssetCollection");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBarsController viewController](self, "viewController");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _updateCommentsTitleIfNeeded](self, "_updateCommentsTitleIfNeeded");
  -[PUOneUpBarsController _updateFileSizeButtonTitleIfNeeded](self, "_updateFileSizeButtonTitleIfNeeded");
  -[PUOneUpBarsController _updateFileSizeButtonMenuIfNeeded](self, "_updateFileSizeButtonMenuIfNeeded");
  v157 = -[PUOneUpBarsController shouldShowProgrammaticNavBackButton](self, "shouldShowProgrammaticNavBackButton");
  v158 = -[PUOneUpBarsController shouldShowTitleView](self, "shouldShowTitleView");
  v162 = (void *)v6;
  v13 = (void *)v6;
  v14 = v9;
  v15 = objc_msgSend(v13, "isInEditMode");
  if (v9 == 1)
    v16 = 1;
  else
    v16 = v15;
  v155 = -[PUOneUpBarsController _canShowCommentsForCurrentAsset](self, "_canShowCommentsForCurrentAsset");
  v152 = -[PUOneUpBarsController allowShowingPlayPauseButton](self, "allowShowingPlayPauseButton");
  v156 = -[PUOneUpBarsController _shouldShowDoneEditingButton](self, "_shouldShowDoneEditingButton");
  v168 = objc_msgSend(v4, "isInSelectionMode");
  v17 = -[PUOneUpBarsController wantsAllPhotosButton](self, "wantsAllPhotosButton");
  v18 = -[PUOneUpBarsController style](self, "style");
  -[PUOneUpBarsController _resetIdentifierIndexes](self, "_resetIdentifierIndexes");
  v164 = v9;
  if (v16 == 1)
  {
    if (v9 == 1)
      goto LABEL_13;
    v19 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 17);
    v20 = v19;
    if (v19 && v19 != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 658, CFSTR("The cancel item can only be in the left navigation bar"));

      v14 = v9;
    }
    v22 = self;
    v23 = 17;
    v24 = v20;
    v25 = 1;
  }
  else
  {
    if (!v17)
      goto LABEL_13;
    v26 = objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 39, v167);
    v24 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 11);
    v22 = self;
    v23 = 11;
    v25 = v26;
  }
  -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](v22, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v23, v24, v25);
LABEL_13:
  v27 = objc_msgSend(v12, "canPerformAction:onAllAssetsByAssetCollection:", 13, v167);
  v28 = objc_msgSend(v12, "canPerformAction:onAllAssetsByAssetCollection:", 11, v167);
  v29 = objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 31, v7, v8);
  if (v7)
    v30 = v8 == 0;
  else
    v30 = 1;
  if (v30)
    v31 = 1;
  else
    v31 = v16;
  v165 = v4;
  v166 = v8;
  v169 = v7;
  if ((v31 & 1) != 0)
    goto LABEL_136;
  v153 = v28;
  v154 = v27;
  v32 = (v28 | v168) ^ 1;
  v33 = v29 & ~v27;
  v34 = objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 4, v7, v8);
  if (v34)
  {
    v35 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 48);
    if (v35)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 48, v35, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 4, v167));
  }
  v36 = v33 & v32;
  v37 = objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 6, v169, v8);
  if (v37)
  {
    v38 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 49);
    if (v38)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 49, v38, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 6, v167));
  }
  objc_msgSend(v4, "assetSharedViewModelForAsset:", v169);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "enableLiveVideoRender") & 1) != 0)
    v41 = 1;
  else
    v41 = objc_msgSend(v39, "needsDeferredProcessing") ^ 1;
  v149 = v41;
  v150 = v39;

  if (v36)
  {
    v42 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 6);
    if (v42)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 6, v42, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 31, v169, v166));
  }
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 56, v169, v166))
  {
    v43 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 41);
    if (v43)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 41, v43, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 56, v169, v166));
  }
  if (((objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 33, v169, v166) ^ 1 | v154 | v153) & 1) == 0)
  {
    v44 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 16);
    if (v44)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 16, v44, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 33, v169, v166));
  }
  v45 = objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 62, v169, v166);
  -[PUOneUpBarsController delegate](self, "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "oneUpBarsControllerWantsActionsMenu:", self);

  if ((v47 & v36) == 1 && v45)
  {
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 50, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 50), objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 62, v169, v166));
    -[PUOneUpBarsController _updateActionsBarButtonItem](self, "_updateActionsBarButtonItem");
  }
  v48 = v34 | v37;
  if (v18 == 1)
  {
    v49 = 0;
    v7 = v169;
  }
  else
  {
    v7 = v169;
    if (((objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 15, v169, v166) ^ 1 | v154 | v153) & 1) == 0)
    {
      v50 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 1);
      if (v50)
        -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 1, v50, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 15, v169, v166));
    }
    if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 53, v169, v166))
    {
      v51 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 39);
      if (v51)
        -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 39, v51, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 53, v167));
      v49 = 1;
    }
    else
    {
      v49 = 0;
    }
  }
  if (((v48 | v155 | v168) & 1) == 0)
  {
    if (self->_delegateFlags.respondsToIsDetailsAccessoryAvailableForAssetReference)
    {
      -[PUOneUpBarsController delegate](self, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "oneUpBarsController:isDetailsAccessoryAvailableForAssetReference:", self, v159);

    }
    else
    {
      v53 = 0;
    }
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "allowsDetailsToggleButtonInBars");

    if (v55)
    {
      if (v53
        && (!v49 || -[PUOneUpBarsController shouldPlaceButtonsInNavigationBar](self, "shouldPlaceButtonsInNavigationBar")))
      {
        v56 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 38);
        if (v56)
        {
          -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 38, v56, 1);
          -[PUOneUpBarsController detailsBarButtonController](self, "detailsBarButtonController");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "update");

        }
      }
    }
  }
  v8 = v166;
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 61, v7, v166))
  {
    v58 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 47);
    if (v58)
    {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 47, v58, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 61, v7, v166));
      -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 47);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpBarsController _localizedTitleForMergeDuplicatesBarButtonItem](self, "_localizedTitleForMergeDuplicatesBarButtonItem");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setTitle:", v60);

    }
    if ((v168 & 1) == 0)
    {
      v61 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 45);
      if (v61)
      {
        v62 = v61;
        v63 = self;
        v64 = 45;
LABEL_70:
        -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](v63, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v64, v62, 1);
        goto LABEL_71;
      }
      goto LABEL_71;
    }
  }
  else if (!v168)
  {
    goto LABEL_71;
  }
  v65 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 46);
  if (v65)
  {
    v62 = v65;
    v63 = self;
    v64 = 46;
    goto LABEL_70;
  }
LABEL_71:
  if (v18 != 1
    && ((v48 | objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 40, v7, v166) ^ 1 | v168) & 1) == 0)
  {
    v66 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 7);
    if (v66)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 7, v66, objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", 40, v7, v166));
  }
  if (objc_msgSend(v163, "showGainMapButton"))
  {
    v67 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 34);
    if (v67)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 34, v67, ((unint64_t)objc_msgSend(v7, "mediaSubtypes") >> 9) & 1);
  }
  v4 = v165;
  if (-[PUOneUpBarsController shouldShowAirPlayButton](self, "shouldShowAirPlayButton")
    && objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 34, v7, v166))
  {
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 18, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 18), 1);
  }
  if (v155)
  {
    objc_msgSend(v165, "currentAssetReference");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "assetViewModelForAssetReference:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v69, "isAccessoryViewVisible"))
      v70 = 15;
    else
      v70 = 14;
    v71 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", v70);
    if ((v71 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 856, CFSTR("The comments item can only be in the toolbar"));

    }
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v70, v71, 1);

    -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](self, "_currentAssetDisplayInfoUpdater");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "info");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("PUCommentsInfoDictionaryKey"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("PUCommentsInfoHasLikedKey"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "BOOLValue");

    if (v76)
      v77 = 20;
    else
      v77 = 19;
    v78 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", v77);
    if ((v78 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 867, CFSTR("The like item can only be in the toolbar"));

    }
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v77, v78, 1);

    v4 = v165;
    v8 = v166;
  }
  if ((v168 & 1) == 0)
  {
    v79 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EED7ACE0);
    -[PUOneUpBarsController delegate](self, "delegate");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "oneUpBarsControllerAssetActionManager:", self);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v81, "canPerformActionType:", *MEMORY[0x1E0D7C140]) & 1) != 0 || v79)
    {
      if (objc_msgSend(v81, "canPerformActionType:", *MEMORY[0x1E0D7BFC8]))
      {
        v82 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 3);
        if ((v82 & 0xFFFFFFFFFFFFFFFBLL) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 880, CFSTR("The delete item can only be in the toolbar"));

          v8 = v166;
        }
        v83 = v79 ^ 1u;
        v84 = self;
        v85 = 3;
        v86 = v82;
      }
      else
      {
        v86 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 2);
        v83 = v79 ^ 1u;
        v84 = self;
        v85 = 2;
      }
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](v84, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v85, v86, v83);
    }

  }
  if (v152)
  {
    -[PUOneUpBarsController _playPauseBarItemsController](self, "_playPauseBarItemsController");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "playPauseState");

    if (v88 == 2)
      v89 = 12;
    else
      v89 = 13;
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v89, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", v89), v149);
  }
  if (-[PUOneUpBarsController shouldShowMuteButton](self, "shouldShowMuteButton"))
  {
    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "isMuted"))
      v91 = 36;
    else
      v91 = 35;

    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v91, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", v91), v149);
  }
  v92 = v154;
  if (v153)
  {
    v93 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 4);
    v94 = v93;
    if ((v93 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 908, CFSTR("The recover item can only be in the toolbar"));

      v92 = v154;
    }
    else if (!v93)
    {
      goto LABEL_117;
    }
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 4, v94, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 11, v167));
  }
LABEL_117:
  v14 = v164;
  if (!v92)
    goto LABEL_121;
  v95 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 5);
  v96 = v95;
  if ((v95 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 919, CFSTR("The restore item can only be in the toolbar"));

    v14 = v164;
  }
  else if (!v95)
  {
    goto LABEL_121;
  }
  -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 5, v96, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 13, v167));
LABEL_121:
  if (-[PUOneUpBarsController wantsShowInLibraryButton](self, "wantsShowInLibraryButton"))
  {
    v97 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 32);
    if (v97)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 32, v97, 1);
  }
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 57, v7, v8))
  {
    v98 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 42);
    if (v98)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 42, v98, 1);
  }
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 58, v7, v8))
  {
    v99 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 43);
    if (v99)
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 43, v99, 1);
  }
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 59, v7, v8))
  {
    v100 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 33);
    if (v100)
    {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 33, v100, objc_msgSend(v12, "shouldEnableActionType:onAllAssetsByAssetCollection:", 59, v167));
      -[PUOneUpBarsController _updateAddToLibraryBarButtonItem](self, "_updateAddToLibraryBarButtonItem");
    }
  }
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 52, v7, v8))
  {
    -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "centeredItemIdentifiers");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (void *)objc_msgSend(v102, "mutableCopy");

    v14 = v164;
    objc_msgSend(v103, "removeIndex:", 28);
    objc_msgSend(v103, "removeIndex:", 29);
    -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setCenteredItemIdentifiers:", v103);

  }
LABEL_136:
  v105 = v16 ^ 1;
  if (v14 == 1)
    v105 = 1;
  if ((v157 & v105) == 1)
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 10, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 10), 1);
  if (v156)
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 37, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 37), 1);
  objc_msgSend(v4, "reviewScreenBarsModel");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v107 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v107 = 0;
  }
  v108 = MEMORY[0x1E0C809B0];
  if ((v16 & 1) == 0)
  {
    v189[0] = &unk_1E59BB6B8;
    v189[1] = &unk_1E59BB6D0;
    v190[0] = &unk_1E59BB610;
    v190[1] = &unk_1E59BB688;
    v189[2] = &unk_1E59BB6E8;
    v189[3] = &unk_1E59BB700;
    v190[2] = &unk_1E59BB4F0;
    v190[3] = &unk_1E59BB4D8;
    v189[4] = &unk_1E59BB718;
    v189[5] = &unk_1E59BB730;
    v190[4] = &unk_1E59BB508;
    v190[5] = &unk_1E59BB538;
    v189[6] = &unk_1E59BB748;
    v189[7] = &unk_1E59BB760;
    v190[6] = &unk_1E59BB520;
    v190[7] = &unk_1E59BB550;
    v189[8] = &unk_1E59BB778;
    v189[9] = &unk_1E59BB790;
    v190[8] = &unk_1E59BB568;
    v190[9] = &unk_1E59BB580;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v189, 10);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v182[0] = v108;
    v182[1] = 3221225472;
    v182[2] = __35__PUOneUpBarsController_updateBars__block_invoke;
    v182[3] = &unk_1E58A2728;
    v183 = v12;
    v184 = v7;
    v185 = v8;
    v186 = self;
    v187 = v107;
    objc_msgSend(v109, "enumerateKeysAndObjectsUsingBlock:", v182);

  }
  -[PUOneUpBarsController _updateFavoriteBarButtonItem](self, "_updateFavoriteBarButtonItem");
  -[PUOneUpBarsController _updateSyndicationSaveBarButtonItem](self, "_updateSyndicationSaveBarButtonItem");
  -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _toolbarButtonIdentifiers](self, "_toolbarButtonIdentifiers");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "orderedBarButtonsItemsForIdentifiers:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpBarsController _rightNavBarButtonItemCollection](self, "_rightNavBarButtonItemCollection");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _rightNavBarButtonIdentifiers](self, "_rightNavBarButtonIdentifiers");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "orderedBarButtonsItemsForIdentifiers:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpBarsController _leftNavBarButtonItemCollection](self, "_leftNavBarButtonItemCollection");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _leftNavBarButtonIdentifiers](self, "_leftNavBarButtonIdentifiers");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "orderedBarButtonsItemsForIdentifiers:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v170, "navigationItem");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v158 || v164 == 1)
  {
    objc_msgSend(v170, "setTitle:", 0);
    v120 = 0;
  }
  else
  {
    objc_msgSend(v170, "setTitle:", v161);
    if (v161)
      v120 = 0;
    else
      v120 = v160;
  }
  objc_msgSend(v119, "setTitleView:", v120);
  objc_msgSend(v119, "leftBarButtonItems");
  v121 = (id)objc_claimAutoreleasedReturnValue();
  v122 = v118;
  v123 = v122;
  if (v121 == v122)
  {

  }
  else
  {
    v124 = objc_msgSend(v121, "isEqual:", v122);

    if ((v124 & 1) == 0)
    {
      objc_msgSend(v119, "setLeftItemsSupplementBackButton:", objc_msgSend(v123, "count") != 0);
      objc_msgSend(v119, "setLeftBarButtonItems:", v123);
    }
  }
  objc_msgSend(v119, "rightBarButtonItems");
  v125 = (id)objc_claimAutoreleasedReturnValue();
  v126 = v115;
  v127 = v126;
  if (v125 == v126)
  {

  }
  else
  {
    v128 = objc_msgSend(v125, "isEqual:", v126);

    if ((v128 & 1) == 0)
      objc_msgSend(v119, "setRightBarButtonItems:", v127);
  }
  -[PUOneUpBarsController title](self, "title");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setBackButtonTitle:", v129);

  v130 = 1;
  objc_msgSend(v119, "px_setBackButtonDisplayMode:", 1);
  if ((v168 & 1) == 0)
  {
    if (objc_msgSend(v162, "isInEditMode"))
      v130 = objc_msgSend(v162, "editStyle") != 0;
    else
      v130 = 0;
  }
  objc_msgSend(v119, "setHidesBackButton:", v130);
  -[PUOneUpBarsController _updateScrubberViewIfNeeded](self, "_updateScrubberViewIfNeeded");
  -[PUOneUpBarsController _scrubberView](self, "_scrubberView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v131, "isHidden"))
    v132 = 0;
  else
    v132 = v131;
  v133 = v132;

  v134 = v133;
  objc_msgSend(v134, "topOutset");
  v136 = v135;
  -[PUOneUpBarsController maximumToolbarHeight](self, "maximumToolbarHeight");
  v138 = v137;
  -[PUOneUpBarsController maximumAccessoryToolbarHeight](self, "maximumAccessoryToolbarHeight");
  v140 = v139;
  if (!-[PUOneUpBarsController disableShowingNavigationBars](self, "disableShowingNavigationBars"))
  {
    objc_msgSend(v170, "pu_toolbarViewModel");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v175[0] = MEMORY[0x1E0C809B0];
    v175[1] = 3221225472;
    v175[2] = __35__PUOneUpBarsController_updateBars__block_invoke_2;
    v175[3] = &unk_1E58A2750;
    v142 = v143;
    v176 = v142;
    v177 = v112;
    v178 = v134;
    v179 = v136;
    v180 = v140;
    v181 = v138;
    objc_msgSend(v142, "performChanges:", v175);

    v141 = v166;
    goto LABEL_172;
  }
  v141 = v166;
  if (v106)
  {
    v171[0] = MEMORY[0x1E0C809B0];
    v171[1] = 3221225472;
    v171[2] = __35__PUOneUpBarsController_updateBars__block_invoke_3;
    v171[3] = &unk_1E58A2778;
    v172 = v107;
    v173 = v134;
    v174 = self;
    objc_msgSend(v106, "performChanges:", v171);

    v142 = v172;
LABEL_172:

  }
}

- (id)_documentMenuActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__49277;
  v20 = __Block_byref_object_dispose__49278;
  v21 = (id)MEMORY[0x1E0C9AA60];
  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canPerformActionType:onAsset:inAssetCollection:", 62, v6, v7);

  if (v9)
  {
    objc_initWeak(&location, self);
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PUOneUpBarsController__documentMenuActions__block_invoke;
    v13[3] = &unk_1E58A27A0;
    v13[4] = &v16;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v10, "performSimpleActionWithActionType:completionHandler:", 62, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)_actionsMenuElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PUOneUpBarsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneUpBarsControllerAssetActionManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D7B1D0];
  v6 = *MEMORY[0x1E0D7C130];
  v10[0] = *MEMORY[0x1E0D7C0D0];
  v10[1] = v6;
  v10[2] = *MEMORY[0x1E0D7C120];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuElementsForActionManager:excludedActionTypes:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_actionsMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void (**)(_QWORD, _QWORD));
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__PUOneUpBarsController__actionsMenu__block_invoke;
  v11 = &unk_1E58A4AA0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC39D0];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_updateActionsBarButtonItem
{
  void *v3;
  id v4;

  -[PUOneUpBarsController _barButtonItemForIdentifier:location:](self, "_barButtonItemForIdentifier:location:", 50, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 50));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_presentedTipID)
  {
    objc_msgSend(v4, "setTarget:", self);
    objc_msgSend(v4, "setAction:", sel_barButtonItemTapped_);
    objc_msgSend(v4, "setMenu:", 0);
  }
  else
  {
    objc_msgSend(v4, "setTarget:", 0);
    objc_msgSend(v4, "setAction:", 0);
    -[PUOneUpBarsController _actionsMenu](self, "_actionsMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMenu:", v3);

  }
}

- (void)_updateFavoriteBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetViewModelForAssetReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isFavorite"))
      v7 = 8;
    else
      v7 = 9;
    -[PUOneUpBarsController _barButtonItemForIdentifier:location:](self, "_barButtonItemForIdentifier:location:", v7, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_msgSend(v8, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v12);

      objc_msgSend(v8, "landscapeImagePhone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLandscapeImagePhone:", v13);

      objc_msgSend(v8, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v14);

    }
  }

}

- (void)_updateSyndicationSaveBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "assetViewModelForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mediaType");
    v11 = CFSTR("ITEM");
    if (v10 == 1)
      v11 = CFSTR("PHOTO");
    if (v10 == 2)
      v11 = CFSTR("VIDEO");
    v12 = v11;

    v13 = objc_msgSend(v7, "fetchAssetSyndicationState");
    if ((unint64_t)(v13 - 2) > 2)
    {
      v15 = &stru_1E58AD278;
    }
    else
    {
      -[__CFString stringByAppendingString:](*(&off_1E58ABDA0 + v13 - 2), "stringByAppendingString:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setTitle:", v15);
    objc_msgSend(v8, "setEnabled:", v13 == 2);

  }
}

- (void)_updateAddToLibraryBarButtonItem
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableOneUpDescriptiveAdd");

  if ((v4 & 1) == 0)
  {
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "currentAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetViewModelForAssetReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(v7, "importState");
      if (v8 > 4)
      {
        v9 = 0;
      }
      else
      {
        PULocalizedString(*(&off_1E58A2850 + v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 33);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v9);

    }
  }
}

- (void)updateGestureRecognizersWithHostingView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpBarsController;
  -[PUBarsController updateGestureRecognizersWithHostingView:](&v12, sel_updateGestureRecognizersWithHostingView_, v4);
  -[PUOneUpBarsController _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
      -[PUOneUpBarsController _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v6);
      -[PUOneUpBarsController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "barsController:delegateForGestureRecognizer:", self, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v6, "setDelegate:", v8);

    }
    objc_msgSend(v6, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v4)
    {
      objc_msgSend(v6, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeGestureRecognizer:", v6);

      objc_msgSend(v4, "addGestureRecognizer:", v6);
    }
  }
  else if (v5)
  {
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v6);

    -[PUOneUpBarsController _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", 0);
  }

}

- (void)updateContentGuideInsets
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  double v35;
  NSObject *v36;
  double v37;
  double v38;
  double MaxY;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  NSObject *v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  uint8_t *v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  __int128 v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double v92;
  BOOL v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  NSObject *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGAffineTransform v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  objc_super v130;
  uint8_t buf[16];
  _OWORD v132[17];
  uint64_t v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  UIEdgeInsets v141;

  v133 = *MEMORY[0x1E0C80C00];
  v130.receiver = self;
  v130.super_class = (Class)PUOneUpBarsController;
  -[PUBarsController updateContentGuideInsets](&v130, sel_updateContentGuideInsets);
  PLOneUpGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "Updating content guide insets for %@", buf, 0xCu);
  }

  -[PUBarsController contentGuideInsets](self, "contentGuideInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PUBarsController viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isViewLoaded"))
  {
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (double *)MEMORY[0x1E0DC49E8];
    v15 = *MEMORY[0x1E0DC49E8];
    objc_msgSend(v12, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (objc_msgSend(v17, "barStyle") == 4)
      {
        objc_msgSend(v17, "frame");
      }
      else
      {
        objc_msgSend(v17, "bounds");
        objc_msgSend(v13, "convertRect:fromView:", v17);
      }
      MaxY = CGRectGetMaxY(*(CGRect *)&v19);
      objc_msgSend(v13, "bounds");
      v37 = MaxY - CGRectGetMinY(v134);
      PLOneUpGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v37;
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEBUG, "\t topBarHeight: %f", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[NSObject statusBarOrientation](v23, "statusBarOrientation");
      PLOneUpGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEBUG, "\t interfaceOrientation: %@", buf, 0xCu);

        v14 = (double *)MEMORY[0x1E0DC49E8];
      }

      v27 = 0.0;
      if ((objc_msgSend(v16, "prefersStatusBarHidden") & 1) == 0)
      {
        objc_msgSend(v13, "window");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "windowScene");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "statusBarManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "statusBarFrame");
        v32 = v31;

        PLOneUpGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v32;
          _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_DEBUG, "\t statusBarHeight: %f", buf, 0xCu);
        }

        v27 = v32 + 0.0;
        v14 = (double *)MEMORY[0x1E0DC49E8];
      }
      objc_msgSend(MEMORY[0x1E0DC3A28], "defaultSizeForOrientation:", v24);
      v35 = v34;
      PLOneUpGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v35;
        _os_log_impl(&dword_1AAB61000, v36, OS_LOG_TYPE_DEBUG, "\t statusBarHeight: %f", buf, 0xCu);
      }

      v37 = v27 + v35;
      objc_msgSend(v13, "safeAreaInsets");
      if (v37 < v38)
        v37 = v38;
    }
    v40 = v14[2];

    if (v15 >= v37)
      v5 = v15;
    else
      v5 = v37;
    objc_msgSend(v16, "toolbar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUOneUpBarsController wantsToolbarVisible](self, "wantsToolbarVisible"))
    {
      objc_msgSend(v41, "window");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42 == v43)
      {
        objc_msgSend(v41, "bounds");
        objc_msgSend(v13, "convertRect:fromView:", v41);
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v54 = v5;
        v56 = v55;
        objc_msgSend(v13, "bounds");
        v58 = v57;
        v135.origin.x = v49;
        v135.origin.y = v51;
        v135.size.width = v53;
        v135.size.height = v56;
        v5 = v54;
        v9 = v58 - CGRectGetMinY(v135);
      }
      else
      {
        v9 = v40;
        if (v41)
        {
          objc_msgSend(v41, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v45 = v44;
          PLOneUpGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v45;
            _os_log_impl(&dword_1AAB61000, v46, OS_LOG_TYPE_DEBUG, "\t toolbarHeight: %f", buf, 0xCu);
          }

          if (v40 >= v45)
            v9 = v40;
          else
            v9 = v45;
        }
      }
    }
    else
    {
      objc_msgSend(v13, "safeAreaInsets");
      v9 = v47;
    }
    v7 = v14[1];
    v11 = v14[3];
    if (-[PUOneUpBarsController disableShowingNavigationBars](self, "disableShowingNavigationBars"))
    {
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "viewModel");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "reviewScreenBarsModel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        v105 = v7;
        v106 = v40;
        v107 = v11;
        v110 = v15;
        objc_msgSend(v13, "bounds");
        v63 = v62;
        v65 = v64;
        v67 = v66;
        v69 = v68;
        UIRectGetCenter();
        v104 = v70;
        v72 = v71;
        objc_msgSend(v13, "window");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "_windowInterfaceOrientation");

        if (v74)
        {
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", v74, v63, v65, v67, v69);
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          +[PUReviewScreenUtilities reviewScreenControlBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v74, v63, v65, v67, v69);
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v108 = v69;
          v109 = v67;
          +[PUReviewScreenUtilities reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:](PUReviewScreenUtilities, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", v74, v63, v65, v67, v69, v5, v7, v9, v107);
          v75 = 0;
          *(_OWORD *)buf = 0u;
          memset(v132, 0, sizeof(v132));
          do
          {
            v76 = &buf[v75];
            v78 = *(double *)&buf[v75];
            v77 = *(double *)&buf[v75 + 8];
            v79 = *(double *)&buf[v75 + 16];
            v80 = *((double *)&v132[v75 / 0x10] + 1);
            v136.origin.x = v78;
            v136.origin.y = v77;
            v136.size.width = v79;
            v136.size.height = v80;
            if (!CGRectIsEmpty(v136))
            {
              v81 = *((_OWORD *)v76 + 4);
              *(_OWORD *)&v111.a = *((_OWORD *)v76 + 3);
              *(_OWORD *)&v111.c = v81;
              *(_OWORD *)&v111.tx = *((_OWORD *)v76 + 5);
              v82 = v78;
              *(CGFloat *)&v81 = v77;
              v83 = v79;
              v84 = v80;
              CGRectApplyAffineTransform(*(CGRect *)((char *)&v81 - 8), &v111);
              UIRectCenteredAboutPoint();
              x = v137.origin.x;
              y = v137.origin.y;
              width = v137.size.width;
              height = v137.size.height;
              MinX = CGRectGetMinX(v137);
              v138.origin.x = x;
              v138.origin.y = y;
              v138.size.width = width;
              v138.size.height = height;
              MaxX = CGRectGetMaxX(v138);
              v139.origin.x = x;
              v139.origin.y = y;
              v139.size.width = width;
              v139.size.height = height;
              MinY = CGRectGetMinY(v139);
              v140.origin.x = x;
              v140.origin.y = y;
              v140.size.width = width;
              v140.size.height = height;
              v92 = CGRectGetMaxY(v140);
              if (MinY < v72 && v92 < v72)
              {
                v110 = v92;
              }
              else if (MinY <= v72 || v92 <= v72)
              {
                if (MinX < v104 && MaxX < v104)
                {
                  v105 = MaxX;
                }
                else
                {
                  v96 = MaxX <= v104 || MinX <= v104;
                  v97 = v107;
                  if (!v96)
                    v97 = v109 - MinX;
                  v107 = v97;
                }
              }
              else
              {
                v106 = v108 - MinY;
              }
            }
            v75 += 96;
          }
          while (v75 != 288);
          v5 = v110;
          v9 = v106;
          v11 = v107;
          v7 = v105;
        }
        else
        {
          -[PUBarsController contentGuideInsets](self, "contentGuideInsets");
          v5 = v98;
          v7 = v99;
          v9 = v100;
          v11 = v101;
        }
      }
    }

  }
  PLOneUpGetLog();
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    v141.top = v5;
    v141.left = v7;
    v141.bottom = v9;
    v141.right = v11;
    NSStringFromUIEdgeInsets(v141);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v103;
    _os_log_impl(&dword_1AAB61000, v102, OS_LOG_TYPE_DEBUG, "\t contentGuideInsets: %@", buf, 0xCu);

  }
  -[PUBarsController setContentGuideInsets:](self, "setContentGuideInsets:", v5, v7, v9, v11);

}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  -[PUBarsController updateIfNeeded](self, "updateIfNeeded");
  return -[PUOneUpBarsController _tapGestureRecognizer](self, "_tapGestureRecognizer");
}

- (BOOL)shouldTapBeginAtLocationFromProvider:(id)a3
{
  PUOneUpBarsController *v3;
  id v4;
  void *v5;

  if (!self->_delegateFlags.respondsToShouldTapBeginAtLocationFromProvider)
    return 1;
  v3 = self;
  v4 = a3;
  -[PUOneUpBarsController delegate](v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "oneUpBarsController:shouldTapBeginAtLocationFromProvider:", v3, v4);

  return (char)v3;
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUOneUpBarsController _wantsChromeVisible](self, "_wantsChromeVisible"))
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowStatusBar") ^ 1;

    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v7 = 1;
    if (!v5)
      goto LABEL_8;
  }
  if (self->_delegateFlags.respondsToShouldHideStatusBarWhenShowingAccessoryViewForAssetReference)
  {
    -[PUOneUpBarsController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "oneUpBarsController:shouldHideStatusBarWhenShowingAccessoryViewForAssetReference:", self, v5) ^ 1;

    if (((v7 | v9) & 1) == 0)
    {
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "assetViewModelForCurrentAssetReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v12, "isAccessoryViewVisible");

    }
  }
LABEL_8:

  return v7;
}

- (BOOL)wantsNavigationBarVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (-[PUOneUpBarsController _wantsChromeVisible](self, "_wantsChromeVisible"))
  {
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "assetViewModelForCurrentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isAccessoryViewVisible"))
    {
      objc_msgSend(v5, "assetReference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && self->_delegateFlags.respondsToShouldHideNavigationBarWhenShowingAccessoryViewForAssetReference)
      {
        -[PUOneUpBarsController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "oneUpBarsController:shouldHideNavigationBarWhenShowingAccessoryViewForAssetReference:", self, v6) ^ 1;

      }
      else
      {
        LOBYTE(v8) = 1;
      }

    }
    else
    {
      LOBYTE(v8) = 1;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)currentAssetByAssetCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v7;
      objc_msgSend(v4, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)wantsToolbarVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (-[PUOneUpBarsController _wantsChromeVisible](self, "_wantsChromeVisible"))
  {
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "assetViewModelForCurrentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isAccessoryViewVisible"))
    {
      objc_msgSend(v5, "assetReference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && self->_delegateFlags.respondsToShouldHideToolbarWhenShowingAccessoryViewForAssetReference)
      {
        -[PUOneUpBarsController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "oneUpBarsController:shouldHideToolbarWhenShowingAccessoryViewForAssetReference:", self, v6) ^ 1;

      }
      else
      {
        LOBYTE(v8) = 1;
      }

    }
    else
    {
      LOBYTE(v8) = 1;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (int64_t)preferredBarStyle
{
  void *v2;
  int64_t v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "photoBrowserBarStyle");

  return v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PUOneUpBarsController _titleViewController](self, "_titleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[PUOneUpBarsController _titleViewController](self, "_titleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_wantsChromeVisible
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isChromeVisible"))
    v5 = !-[PUOneUpBarsController disableShowingNavigationBars](self, "disableShowingNavigationBars");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_physicalDeviceIsIPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (BOOL)_canShowCommentsForCurrentAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateFlags.respondsToCanShowCommentsForAsset)
  {
    -[PUOneUpBarsController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "oneUpBarsController:canShowCommentsForAsset:", self, v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldShowDoneEditingButton
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assetViewModelForCurrentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInEditMode"))
    v5 = objc_msgSend(v4, "editStyle") == 2;
  else
    v5 = 0;

  return v5;
}

- (int64_t)_scrubberType
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "contentPrivacyState");
  v6 = 0;
  if (-[PUOneUpBarsController shouldShowScrubber](self, "shouldShowScrubber") && v5 != 1)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowScrubber");

    if (!v8)
      goto LABEL_7;
    if (-[PUOneUpBarsController _canShowCommentsForCurrentAsset](self, "_canShowCommentsForCurrentAsset"))
      goto LABEL_7;
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsMultipleAssets");

    if ((v12 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
LABEL_7:
      objc_msgSend(v4, "currentAssetReference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetViewModelForAssetReference:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "playbackStyle");

      objc_msgSend(v14, "videoPlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 == 4
        && ((objc_msgSend(v17, "isPlaybackDesired") & 1) != 0 || objc_msgSend(v18, "isActivated")))
      {
        v6 = 2;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (int64_t)_locationForBarButtonItemWithIdentifier:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  int64_t v15;
  BOOL v16;
  void *v17;
  int v18;
  int64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;

  -[PUOneUpBarsController _playPauseBarItemsController](self, "_playPauseBarItemsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playPauseState");
  v7 = -[PUOneUpBarsController shouldPlaceButtonsInNavigationBar](self, "shouldPlaceButtonsInNavigationBar");
  v8 = -[PUOneUpBarsController allowShowingPlayPauseButton](self, "allowShowingPlayPauseButton");
  if (v6)
    v9 = v8;
  else
    v9 = 0;
  v10 = -[PUOneUpBarsController isInCompactLayoutStyle](self, "isInCompactLayoutStyle");
  if (v10)
    v10 = -[PUOneUpBarsController _physicalDeviceIsIPad](self, "_physicalDeviceIsIPad");
  if (v7 || v10)
    v11 = !v7;
  else
    v11 = -[PUOneUpBarsController shouldShowAirPlayButton](self, "shouldShowAirPlayButton")
       || -[PUOneUpBarsController wantsShowInLibraryButton](self, "wantsShowInLibraryButton")
       || -[PUOneUpBarsController wantsAllPhotosButton](self, "wantsAllPhotosButton");
  v12 = -[PUOneUpBarsController _canShowCommentsForCurrentAsset](self, "_canShowCommentsForCurrentAsset");
  if (!v9
    || (+[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "allowPlayButtonInBars"),
        v13,
        (v14 & 1) != 0)
    || a3 == 13
    || v6 != 1
    || a3 == 10
    || a3 == 18
    || (unint64_t)(a3 - 21) <= 1)
  {
    switch(a3)
    {
      case 1:
        if (v11)
          v15 = 4;
        else
          v15 = 1;
        break;
      case 2:
      case 40:
        v16 = !v7 && !v12;
        goto LABEL_27;
      case 3:
      case 4:
      case 5:
      case 14:
      case 15:
      case 19:
      case 20:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 33:
      case 41:
      case 42:
      case 43:
      case 48:
      case 49:
        v15 = 4;
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 16:
      case 39:
        if (v7)
          v15 = 3;
        else
          v15 = 4;
        break;
      case 10:
      case 17:
      case 21:
      case 31:
        goto LABEL_43;
      case 11:
      case 18:
      case 22:
      case 32:
      case 37:
      case 46:
      case 50:
        v15 = 1;
        break;
      case 12:
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "allowPlayButtonInBars");

        if ((v18 & v9) != 1)
          goto LABEL_40;
        goto LABEL_34;
      case 13:
        if (!v9)
          goto LABEL_40;
        goto LABEL_34;
      case 34:
      case 38:
      case 45:
        v16 = !v7;
LABEL_27:
        if (v16)
          v15 = 4;
        else
          v15 = 1;
        break;
      case 35:
      case 36:
LABEL_34:
        v19 = -[PUOneUpBarsController style](self, "style");
        v20 = 3;
        if (!v7)
          v20 = 4;
        if (v19 == 1)
          v15 = 4;
        else
          v15 = v20;
        break;
      case 44:
        v15 = 2;
        break;
      case 47:
        if (v7)
        {
LABEL_43:
          v15 = 3;
        }
        else
        {
          -[PUOneUpBarsController browsingSession](self, "browsingSession");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "viewModel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isInSelectionMode"))
            v15 = 4;
          else
            v15 = 1;

        }
        break;
      default:
        goto LABEL_40;
    }
  }
  else
  {
LABEL_40:
    v15 = 0;
  }

  return v15;
}

- (id)_commentTitleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
}

- (id)_commentTitleAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1138];
  v10[0] = v3;
  v5 = *MEMORY[0x1E0DC1140];
  v9[0] = v4;
  v9[1] = v5;
  -[PUOneUpBarsController _commentTitleColor](self, "_commentTitleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attributedCommentTitleForTitle:(id)a3 highlighted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[PUOneUpBarsController _commentTitleAttributes](self, "_commentTitleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUOneUpBarsController _commentTitleColor](self, "_commentTitleColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "mutableCopy");
    v11 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));

  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (void)_updateCommentsButton:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PUOneUpBarsController _attributedCommentTitleForTitle:highlighted:](self, "_attributedCommentTitleForTitle:highlighted:", v6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _attributedCommentTitleForTitle:highlighted:](self, "_attributedCommentTitleForTitle:highlighted:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_barButtonItemTapped_, 64);
  objc_msgSend(v7, "setAttributedTitle:forState:", v9, 0);
  objc_msgSend(v7, "setAttributedTitle:forState:", v8, 1);
  objc_msgSend(v7, "sizeToFit");

}

- (id)_commentsButtonWithTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_barButtonItemTapped_, 64);
  if (v4)
    -[PUOneUpBarsController _updateCommentsButton:withTitle:](self, "_updateCommentsButton:withTitle:", v5, v4);

  return v5;
}

- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4
{
  uint64_t v7;
  void (**v8)(void *, const __CFString *, void *);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _PUSharingPreheatGestureRecognizer *v21;
  _PUSharingPreheatGestureRecognizer *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  PUOneUpDetailsBarButtonController *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  __CFString *v82;
  __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v96;
  void *v97;
  _QWORD v98[4];
  id v99;
  id location;
  _QWORD v101[5];
  _QWORD aBlock[5];
  _QWORD v103[3];

  v7 = MEMORY[0x1E0C809B0];
  v103[1] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke;
  aBlock[3] = &unk_1E58A27C8;
  aBlock[4] = self;
  v8 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  v101[0] = v7;
  v101[1] = 3221225472;
  v101[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_2;
  v101[3] = &unk_1E58A27F0;
  v101[4] = self;
  v9 = _Block_copy(v101);
  v10 = v9;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 1767, CFSTR("undefined identifier"));

      goto LABEL_5;
    case 1:
    case 25:
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 2);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 2:
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 16);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 3:
      v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("DELETE_BUTTON_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 7, self, sel_barButtonItemTapped_);

      break;
    case 4:
      v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("RECOVER_BUTTON_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v17, "initWithTitle:style:target:action:", v18, 0, self, sel_barButtonItemTapped_);

      break;
    case 5:
      v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("RESTORE_BUTTON_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v19, "initWithTitle:style:target:action:", v20, 0, self, sel_barButtonItemTapped_);

      break;
    case 6:
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v21 = [_PUSharingPreheatGestureRecognizer alloc];
      v98[0] = v7;
      v98[1] = 3221225472;
      v98[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_3;
      v98[3] = &unk_1E58AB2F8;
      objc_copyWeak(&v99, &location);
      v22 = -[_PUSharingPreheatGestureRecognizer initWithSharingPreheatBlock:](v21, "initWithSharingPreheatBlock:", v98);
      v103[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setGestureRecognizers:", v23);

      objc_destroyWeak(&v99);
      objc_destroyWeak(&location);
      break;
    case 7:
    case 9:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_FAVORITE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("heart"), v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 8:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_UNFAVORITE"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("heart.fill"), v47);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 10:
    case 31:
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR(" "), 0, self, sel_barButtonItemTapped_);
      objc_msgSend(v12, "_setShowsBackButtonIndicator:", 1);
      break;
    case 11:
      v48 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_CAMERA_ALLPHOTOS"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v48, "initWithTitle:style:target:action:", v49, 0, self, sel_barButtonItemTapped_);

      break;
    case 12:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_PLAY"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("play.fill"), v24);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setWidth:", 50.0);
      break;
    case 13:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_PAUSE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("pause.fill"), v25);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setWidth:", 50.0);
      break;
    case 14:
      -[PUOneUpBarsController _commentsButtonWithTitle:](self, "_commentsButtonWithTitle:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v50);

      break;
    case 15:
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_HIDECOMMENTS"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpBarsController _commentsButtonWithTitle:](self, "_commentsButtonWithTitle:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v27);
      break;
    case 16:
      v51 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_REVIEW"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v51, "initWithTitle:style:target:action:", v52, 0, self, sel_barButtonItemTapped_);

      break;
    case 17:
    case 21:
    case 46:
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 18:
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 111);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 19:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_LIKE"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("hand.thumbsup"), v53);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 20:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_LIKED"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("hand.thumbsup.fill"), v54);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 22:
    case 37:
      (*((void (**)(void *, _QWORD))v9 + 2))(v9, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 23:
      v55 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v55, "initWithTitle:style:target:action:", v56, 7, self, sel_barButtonItemTapped_);

      break;
    case 24:
      v57 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_RETAKE"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v57, "initWithTitle:style:target:action:", v58, 7, self, sel_barButtonItemTapped_);

      break;
    case 26:
    case 27:
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E58AD278, 0, self, sel_barButtonItemTapped_);
      goto LABEL_52;
    case 28:
      v59 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_SELECT_ALL"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v59, "initWithTitle:style:target:action:", v60, 0, self, sel_barButtonItemTapped_);

      break;
    case 29:
      v61 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DESELECT_ALL"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v61, "initWithTitle:style:target:action:", v62, 0, self, sel_barButtonItemTapped_);

      break;
    case 30:
      v63 = objc_alloc(MEMORY[0x1E0DC34F0]);
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "viewModel");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "resizeTaskDescriptorViewModel");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "localizedTitle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "viewModel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "resizeTaskDescriptorViewModel");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "fileSizeMenu");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v63, "initWithTitle:menu:", v65, v69);

      break;
    case 32:
      v70 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("PUPHOTOBROWSER_SHOW_IN_LIBRARY"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v70, "initWithTitle:style:target:action:", v71, 0, self, sel_barButtonItemTapped_);

      break;
    case 33:
      v28 = -[PUOneUpBarsController style](self, "style") == 2;
      v29 = objc_alloc(MEMORY[0x1E0DC34F0]);
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v29, "initWithImage:style:target:action:", v30, 0, self, sel_barButtonItemTapped_);
      }
      else
      {
        PULocalizedString(CFSTR("ONE_UP_SAVE_TO_LIBRARY"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v29, "initWithTitle:style:target:action:", v30, 0, self, sel_barButtonItemTapped_);
      }

      break;
    case 34:
      v8[2](v8, CFSTR("map"), CFSTR("Gain Map"));
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_52:
      v12 = (id)v14;
      break;
    case 35:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_MUTE"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("speaker.2.fill"), v31);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setWidth:", 53.0);
      break;
    case 36:
      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_MUTED"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, CFSTR("speaker.slash.fill"), v32);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setWidth:", 53.0);
      break;
    case 38:
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "viewModel");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      +[PUOneUpDetailsBarButtonController defaultGlyphNameFor:](PUOneUpDetailsBarButtonController, "defaultGlyphNameFor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUAnimatableBarButtonItem barButtonItemWithSystemImageName:](PUAnimatableBarButtonItem, "barButtonItemWithSystemImageName:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "addTarget:action:for:", self, sel_barButtonItemTapped_, 64);
      objc_msgSend(v75, "setAccessibilityIdentifier:", CFSTR("com.apple.mobileslideshow.infoButton"));
      v12 = v75;
      v76 = -[PUOneUpDetailsBarButtonController initWithBarButtonItem:browseViewModel:]([PUOneUpDetailsBarButtonController alloc], "initWithBarButtonItem:browseViewModel:", v12, v73);

      -[PUOneUpBarsController setDetailsBarButtonController:](self, "setDetailsBarButtonController:", v76);
      break;
    case 39:
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "viewModel");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "currentAssetReference");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "asset");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v81 = objc_msgSend(v80, "mediaType");
      v82 = CFSTR("ITEM");
      if (v81 == 1)
        v82 = CFSTR("PHOTO");
      if (v81 == 2)
        v82 = CFSTR("VIDEO");
      v83 = v82;
      objc_msgSend(CFSTR("ONE_UP_SYNDICATION_SAVE_TO_LIBRARY_"), "stringByAppendingString:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v85, 0, self, sel_barButtonItemTapped_);
      break;
    case 40:
      v33 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("trash"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v33, "initWithImage:style:target:action:", v34, 0, self, sel_barButtonItemTapped_);

      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_TRASH"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v35);

      break;
    case 41:
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "actionManager");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v87, "barButtonItemForActionType:", 56);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "customView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "addTarget:action:forControlEvents:", self, sel_barButtonItemTapped_, 64);

      break;
    case 42:
      v89 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrowshape.turn.up.left"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v89, "initWithImage:style:target:action:", v90, 0, self, sel_barButtonItemTapped_);

      break;
    case 43:
      v36 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("plus.bubble.tapback"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v36, "initWithImage:style:target:action:", v37, 0, self, sel_barButtonItemTapped_);

      break;
    case 44:
      v38 = objc_alloc(MEMORY[0x1E0DC34F0]);
      -[PUOneUpBarsController _titleViewController](self, "_titleViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v38, "initWithCustomView:", v40);

      break;
    case 45:
      v91 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("ONE_UP_SELECT_BUTTON_TITLE"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v91, "initWithTitle:style:target:action:", v92, 0, self, sel_barButtonItemTapped_);

      break;
    case 47:
      -[PUOneUpBarsController _localizedTitleForMergeDuplicatesBarButtonItem](self, "_localizedTitleForMergeDuplicatesBarButtonItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v41, 0, self, sel_barButtonItemTapped_);

      break;
    case 48:
    case 49:
      PXLocalizedSharedLibraryString();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpBarsController _createMultiLineButtonWithTitle:](self, "_createMultiLineButtonWithTitle:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v43);

      break;
    case 50:
      v44 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("ellipsis.circle"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v44, "initWithImage:menu:", v45, 0);

      PULocalizedString(CFSTR("BAR_BUTTON_ITEM_TITLE_ACTIONS"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v46);

      break;
    default:
LABEL_5:
      v12 = 0;
      break;
  }
  if (-[PUOneUpBarsController style](self, "style") == 1)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "photoBrowserSpotlightThemeColor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v94);

  }
  return v12;
}

- (id)_createMultiLineButtonWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3518];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v6, "setTitle:forState:", v5, 0);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_barButtonItemTapped_, 64);
  objc_msgSend(v6, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 0);

  objc_msgSend(v6, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v6, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 1);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "sizeToFit");
  return v6;
}

- (id)_localizedTitleForMergeDuplicatesBarButtonItem
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSelectionMode");

  if (v4)
  {
    objc_msgSend(v2, "actionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitleForActionType:", 61);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PULocalizedString(CFSTR("ONE_UP_MERGE_DUPLICATES_BUTTON_TITLE_MERGE_ALL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_updateScrubberViewIfNeeded
{
  int64_t v4;
  PUScrubberView *scrubberView;
  uint64_t v6;
  PUScrubberView *v7;
  PUScrubberView *v8;
  PUScrubberView *v9;
  PUScrubberView *v10;
  void *v11;
  id v12;

  v4 = -[PUOneUpBarsController _scrubberType](self, "_scrubberType");
  scrubberView = self->__scrubberView;
  if (!v4)
  {
    if (!scrubberView)
      return;
    v6 = 1;
    goto LABEL_6;
  }
  if (scrubberView)
  {
    v6 = 0;
LABEL_6:
    -[PUScrubberView setHidden:](scrubberView, "setHidden:", v6);
    return;
  }
  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 2040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("browsingSession != nil"));

  }
  v7 = [PUScrubberView alloc];
  v8 = -[PUScrubberView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = self->__scrubberView;
  self->__scrubberView = v8;
  v10 = v8;

  -[PUScrubberView setDelegate:](v10, "setDelegate:", self);
  -[PUScrubberView setBrowsingSession:](v10, "setBrowsingSession:", v12);
  -[PUScrubberView setType:](v10, "setType:", v4 == 2);

}

- (void)_invalidateScrubber
{
  PUScrubberView *scrubberView;

  -[PUScrubberView removeFromSuperview](self->__scrubberView, "removeFromSuperview");
  scrubberView = self->__scrubberView;
  self->__scrubberView = 0;

  -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (void)_invalidateTitle
{
  -[PUOneUpBarsController _setNeedsUpdateTitle:](self, "_setNeedsUpdateTitle:", 1);
  -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (void)_updateTitleIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  __CFString *v28;
  __CFString *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  BOOL v54;

  if (-[PUOneUpBarsController _needsUpdateTitle](self, "_needsUpdateTitle"))
  {
    -[PUOneUpBarsController _setNeedsUpdateTitle:](self, "_setNeedsUpdateTitle:", 0);
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBarTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "debuggingTitleType");

    switch(v7)
    {
      case 3:
        -[PUOneUpBarsController browsingSession](self, "browsingSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "viewModel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentAssetReference");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "asset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v27 = objc_msgSend(v9, "deferredProcessingNeeded");
          v28 = CFSTR("Processing…");
          if (!v27)
            v28 = CFSTR("Processing Done");
          v29 = v28;

          v19 = 0;
          v5 = v29;
        }
        else
        {
          v19 = 0;
        }
        break;
      case 2:
        -[PUBarsController viewController](self, "viewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "px_imageModulationManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = MEMORY[0x1AF42A3C0](objc_msgSend(v19, "requestedEDRHeadroomFactor"));
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v19, "HDRFocus");
        objc_msgSend(v22, "stringWithFormat:", CFSTR("HDR %0.1f · Req %0.1f"), v23, *(_QWORD *)&v21);
        v9 = v5;
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        -[PUOneUpBarsController browsingSession](self, "browsingSession");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "currentAssetReference");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetsDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "indexPathForAssetReference:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", objc_msgSend(v12, "section"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "numberOfSubItemsAtIndexPath:", v13);

        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "item") + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ of %@"), v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v5 = (void *)v18;
        break;
      default:
        v19 = 0;
LABEL_14:
        v45 = v19;
        v46 = v5;
        -[PUOneUpBarsController _setTitle:](self, "_setTitle:", v5);
        -[PUOneUpBarsController setDebuggingObservedImageModulationManager:](self, "setDebuggingObservedImageModulationManager:", v19);
        v30 = -[PUOneUpBarsController shouldUseCompactTitleView](self, "shouldUseCompactTitleView");
        -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](self, "_currentAssetDisplayInfoUpdater");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "info");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("PUTitleInfoDictionaryKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PUTitleInfoGeoDescriptionKey"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PUTitleInfoCreationDateKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[PUOneUpBarsController allowTapOnTitle](self, "allowTapOnTitle");
        -[PUOneUpBarsController _titleTextColorForTitleViewController:](self, "_titleTextColorForTitleViewController:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpBarsController _subtitleTextColorForTitleViewController:](self, "_subtitleTextColorForTitleViewController:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpBarsController _titleViewController](self, "_titleViewController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __45__PUOneUpBarsController__updateTitleIfNeeded__block_invoke;
        v47[3] = &unk_1E58A2940;
        v53 = v30;
        v48 = v39;
        v49 = v34;
        v50 = v35;
        v51 = v37;
        v52 = v38;
        v54 = v36;
        v40 = v38;
        v41 = v37;
        v42 = v35;
        v43 = v34;
        v44 = v39;
        objc_msgSend(v44, "performChanges:", v47);

        return;
    }

    goto LABEL_14;
  }
}

- (id)_textColorForTitleViewController:(BOOL)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[PUOneUpBarsController style](self, "style");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v5, "photoBrowserSpotlightThemeColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      objc_msgSend(v5, "photoBrowserTitleViewTappableTextColor");
    else
      objc_msgSend(v5, "photoBrowserTitleViewTextColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (void)_invalidateCommentsTitle
{
  -[PUOneUpBarsController _setNeedsUpdateCommentsTitle:](self, "_setNeedsUpdateCommentsTitle:", 1);
  -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (void)_updateCommentsTitleIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  if (-[PUOneUpBarsController _needsUpdateCommentsTitle](self, "_needsUpdateCommentsTitle"))
  {
    -[PUOneUpBarsController _setNeedsUpdateCommentsTitle:](self, "_setNeedsUpdateCommentsTitle:", 0);
    -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](self, "_currentAssetDisplayInfoUpdater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "info");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("PUCommentsInfoDictionaryKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_23:

      return;
    }
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PUCommentsInfoCommentCountKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PUCommentsInfoLikeCountKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 && v8)
    {
      PULocalizedString(CFSTR("ONEUP_COMMENTS_TOGGLE_CONSOLIDATED_COMMENTS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedStringWithValidatedFormat(v11, CFSTR("%d"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v12, "length", v10 + v8)
        || !-[PUOneUpBarsController shouldUseCompactCommentsTitle](self, "shouldUseCompactCommentsTitle"))
      {
        -[PUOneUpBarsController _attributedCommentTitleForTitle:highlighted:](self, "_attributedCommentTitleForTitle:highlighted:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUBarsController viewController](self, "viewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "size");
        v16 = v15;
        objc_msgSend(v14, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v19 = v18 * 0.5;

        if (v16 < v19)
        {
          PULocalizedString(CFSTR("ONEUP_COMMENTS_TOGGLE_COMMENTS_AND_LIKES"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v10;
          v28 = v8;
          PULocalizedStringWithValidatedFormat(v20, CFSTR("%d %d"));
          v21 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v21;
        }

      }
    }
    else if (v10 || !v8)
    {
      if (!v10 || v8)
      {
        PULocalizedString(CFSTR("ONEUP_COMMENTS_TOGGLE_NO_COMMENTS"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 1;
LABEL_19:
        -[PUOneUpBarsController setShouldBeginEditingAfterShowingComments:](self, "setShouldBeginEditingAfterShowingComments:", v24, v27, v28);
        objc_msgSend(v6, "customView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 2207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("commentsItemButton && [commentsItemButton isKindOfClass:UIButton.class]"));

        }
        -[PUOneUpBarsController _updateCommentsButton:withTitle:](self, "_updateCommentsButton:withTitle:", v25, v12);

        goto LABEL_22;
      }
      PULocalizedString(CFSTR("ONEUP_COMMENTS_TOGGLE_LIKES_ONLY"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v10;
      PULocalizedStringWithValidatedFormat(v23, CFSTR("%d"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PULocalizedString(CFSTR("ONEUP_COMMENTS_TOGGLE_COMMENTS_ONLY"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v8;
      PULocalizedStringWithValidatedFormat(v22, CFSTR("%d"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
    goto LABEL_19;
  }
}

- (void)_invalidateFileSizeButtonTitle
{
  -[PUOneUpBarsController _setNeedsUpdateFileSizeButtonTitle:](self, "_setNeedsUpdateFileSizeButtonTitle:", 1);
  -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (void)_invalidateFileSizeButtonMenu
{
  -[PUOneUpBarsController _setNeedsUpdateFileSizeButtonMenu:](self, "_setNeedsUpdateFileSizeButtonMenu:", 1);
  -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (void)_updateFileSizeButtonTitleIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PUOneUpBarsController _needsUpdateFileSizeButtonTitle](self, "_needsUpdateFileSizeButtonTitle"))
  {
    -[PUOneUpBarsController _setNeedsUpdateFileSizeButtonTitle:](self, "_setNeedsUpdateFileSizeButtonTitle:", 0);
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 30);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resizeTaskDescriptorViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

  }
}

- (void)_updateFileSizeButtonMenuIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PUOneUpBarsController _needsUpdateFileSizeButtonMenu](self, "_needsUpdateFileSizeButtonMenu"))
  {
    -[PUOneUpBarsController _setNeedsUpdateFileSizeButtonMenu:](self, "_setNeedsUpdateFileSizeButtonMenu:", 0);
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", 30);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resizeTaskDescriptorViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileSizeMenu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v6);

  }
}

- (void)_invalidateChromeVisibilityWithAnimationType:(int64_t)a3
{
  -[PUOneUpBarsController _setNeedsUpdateChromeVisibility:](self, "_setNeedsUpdateChromeVisibility:", 1);
  -[PUOneUpBarsController _setNextChromeVisibilityUpdateAnimationType:](self, "_setNextChromeVisibilityUpdateAnimationType:", a3);
  -[PUOneUpBarsController _updateChromeVisibilityIfNeeded](self, "_updateChromeVisibilityIfNeeded");
}

- (void)_updateChromeVisibilityIfNeeded
{
  _BOOL8 v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (-[PUOneUpBarsController _needsUpdateChromeVisibility](self, "_needsUpdateChromeVisibility"))
  {
    -[PUOneUpBarsController _setNeedsUpdateChromeVisibility:](self, "_setNeedsUpdateChromeVisibility:", 0);
    v3 = -[PUOneUpBarsController _wantsChromeVisible](self, "_wantsChromeVisible");
    v4 = -[PUOneUpBarsController _nextChromeVisibilityUpdateAnimationType](self, "_nextChromeVisibilityUpdateAnimationType");
    -[PUBarsController viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    if (v4)
    {
      -[PUOneUpBarsController browsingSession](self, "browsingSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PUChromeAnimationDuration(v7);

      if (!v3)
      {
        if (-[PUOneUpBarsController _lastChromeVisibility](self, "_lastChromeVisibility"))
          -[PUBarsController disableUpdateBarsForDuration:](self, "disableUpdateBarsForDuration:", v8);
        objc_msgSend(v9, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, *(_QWORD *)&v8);
        goto LABEL_12;
      }
      objc_msgSend(v9, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, *(_QWORD *)&v8);
    }
    else
    {
      objc_msgSend(v5, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
      if (!v3)
      {
LABEL_12:
        -[PUOneUpBarsController _setLastChromeVisibility:](self, "_setLastChromeVisibility:", v3);

        return;
      }
    }
    if (!-[PUOneUpBarsController _lastChromeVisibility](self, "_lastChromeVisibility"))
      -[PUBarsController invalidateContentGuideInsets](self, "invalidateContentGuideInsets");
    goto LABEL_12;
  }
}

- (void)_updateShowingPlayPauseButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BOOL8 v7;

  if (-[PUOneUpBarsController allowShowingPlayPauseButton](self, "allowShowingPlayPauseButton"))
  {
    -[PUOneUpBarsController _playPauseBarItemsController](self, "_playPauseBarItemsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "playPauseState");

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowPlayButtonInBars");

    if (v6)
      v7 = v4 != 0;
    else
      v7 = v4 == 1;
  }
  else
  {
    v7 = 0;
  }
  -[PUOneUpBarsController _setShowingPlayPauseButton:](self, "_setShowingPlayPauseButton:", v7);
}

- (void)_setShowingPlayPauseButton:(BOOL)a3
{
  id v4;

  if (self->_isShowingPlayPauseButton != a3)
  {
    self->_isShowingPlayPauseButton = a3;
    if (self->_delegateFlags.respondsToDidChangeShowingPlayPauseButton)
    {
      -[PUOneUpBarsController delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oneUpBarsControllerDidChangeShowingPlayPauseButton:", self);

    }
  }
}

- (void)_updateWantsAllPhotosButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController currentAssetByAssetCollection](self, "currentAssetByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "canPerformAction:onAllAssetsByAssetCollection:", 39, v5);

  -[PUOneUpBarsController setWantsAllPhotosButton:](self, "setWantsAllPhotosButton:", v6);
}

- (void)setWantsAllPhotosButton:(BOOL)a3
{
  if (self->_wantsAllPhotosButton != a3)
  {
    self->_wantsAllPhotosButton = a3;
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)_startObservingOrientationChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_orientationChanged_, *MEMORY[0x1E0DC4960], v4);

  objc_msgSend(v4, "beginGeneratingDeviceOrientationNotifications");
}

- (void)_stopObservingOrientationChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endGeneratingDeviceOrientationNotifications");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_handleTrashButton:(id)a3
{
  id v3;

  -[PUOneUpBarsController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performTrashAction");

}

- (void)_handleInfoButton:(id)a3
{
  id v3;

  -[PUOneUpBarsController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performToggleDetailsAction");

}

- (void)_handleCreativeControlsButton:(id)a3
{
  id v3;

  -[PUOneUpBarsController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 15);

}

- (void)_handleFavoriteButton:(id)a3
{
  id v3;

  -[PUOneUpBarsController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performToggleFavoriteAction");

}

- (void)barButtonItemTapped:(id)a3
{
  int64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[PUOneUpBarsController _identifierForButton:](self, "_identifierForButton:");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 2362, CFSTR("Untracked BarButtonItem tapped: %@"), v7);

  }
  -[PUOneUpBarsController _barButtonTappedWithIdentifier:](self, "_barButtonTappedWithIdentifier:", v5);

}

- (void)_barButtonTappedWithIdentifier:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  switch(a3)
  {
    case 1:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 15;
      goto LABEL_47;
    case 2:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performTrashAction");
      goto LABEL_48;
    case 3:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 10;
      goto LABEL_47;
    case 4:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 11;
      goto LABEL_47;
    case 5:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performRestoreAction");
      goto LABEL_48;
    case 6:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performShareAction");
      goto LABEL_48;
    case 7:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performToggleFavoriteAction");
      goto LABEL_48;
    case 10:
    case 31:
      -[PUBarsController viewController](self, "viewController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_48;
    case 11:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 39;
      goto LABEL_47;
    case 12:
      v6 = 4;
      goto LABEL_15;
    case 13:
      v6 = 2;
LABEL_15:
      -[PUOneUpBarsController _performPlayPauseAction:](self, "_performPlayPauseAction:", v6);
      return;
    case 14:
    case 15:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performToggleCommentsActionAndBeginEditing:", -[PUOneUpBarsController shouldBeginEditingAfterShowingComments](self, "shouldBeginEditingAfterShowingComments"));
      goto LABEL_48;
    case 16:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 33;
      goto LABEL_47;
    case 17:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performCancelEditingAction");
      goto LABEL_48;
    case 18:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 34;
      goto LABEL_47;
    case 19:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      v8 = 1;
      goto LABEL_21;
    case 20:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      v8 = 0;
LABEL_21:
      objc_msgSend(v7, "performLikeActionWithLike:", v8);
      goto LABEL_48;
    case 21:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 42;
      goto LABEL_47;
    case 22:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 43;
      goto LABEL_47;
    case 23:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 46;
      goto LABEL_47;
    case 24:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 44;
      goto LABEL_47;
    case 25:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 47;
      goto LABEL_47;
    case 26:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 48;
      goto LABEL_47;
    case 27:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 49;
      goto LABEL_47;
    case 28:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 50;
      goto LABEL_47;
    case 29:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 51;
      goto LABEL_47;
    case 32:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performShowInLibraryAction");
      goto LABEL_48;
    case 33:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 59;
      goto LABEL_47;
    case 34:
      -[PUOneUpBarsController _revealGainMapImage](self, "_revealGainMapImage");
      return;
    case 35:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v10 = 1;
      goto LABEL_36;
    case 36:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v10 = 0;
LABEL_36:
      objc_msgSend(v9, "performMuteActionWithShouldMute:", v10);
      goto LABEL_48;
    case 37:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performDoneEditingAction");
      goto LABEL_48;
    case 38:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performToggleDetailsAction");
      goto LABEL_48;
    case 39:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performSyndicationSaveAction");
      goto LABEL_48;
    case 40:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 54;
      goto LABEL_47;
    case 41:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 56;
      goto LABEL_47;
    case 42:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 57;
      goto LABEL_47;
    case 43:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 58;
      goto LABEL_47;
    case 45:
    case 46:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toggleSelectionMode");
      goto LABEL_48;
    case 47:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performMergeDuplicatesAction");
      goto LABEL_48;
    case 48:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 4;
      goto LABEL_47;
    case 49:
      -[PUOneUpBarsController actionsController](self, "actionsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = 6;
LABEL_47:
      objc_msgSend(v4, "performSimpleActionWithActionType:", v5);
LABEL_48:

      break;
    case 50:
      -[PUOneUpBarsController _showActionsMenu](self, "_showActionsMenu");
      break;
    default:
      return;
  }
}

- (void)_showActionsMenu
{
  void *v3;
  _QWORD v4[5];

  -[PUOneUpBarsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PUOneUpBarsController__showActionsMenu__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  objc_msgSend(v3, "oneUpBarsControllerWillPresentActionsMenu:completionHandler:", self, v4);

}

- (void)_revealGainMapImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "assetViewModelForAssetReference:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PUOneUpBarsController__revealGainMapImage__block_invoke;
    v7[3] = &unk_1E58ABD10;
    v8 = v5;
    v6 = v5;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)_performPlayPauseAction:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PUOneUpBarsController _scrubberView](self, "_scrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelDeceleration");

  -[PUOneUpBarsController actionsController](self, "actionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performPlayPauseActionWithDesiredState:", a3);

  if (self->_delegateFlags.respondsToDidTapPlayPauseButton)
  {
    -[PUOneUpBarsController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oneUpBarsController:didTapPlayPauseButton:", self, a3 == 4);

  }
}

- (void)_performPXActionType:(id)a3
{
  -[PUOneUpBarsController _performPXActionType:withCompletionHandler:](self, "_performPXActionType:withCompletionHandler:", a3, 0);
}

- (void)_performPXActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PUOneUpBarsController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oneUpBarsControllerAssetActionManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "canPerformActionType:", v10))
  {
    objc_msgSend(v8, "actionPerformerForActionType:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performActionWithCompletionHandler:", v6);

  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  _QWORD v10[4];
  id v11;
  char v12;

  -[PUOneUpBarsController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isInSelectionMode"))
  {
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performSimpleActionWithActionType:", 41);

  }
  else
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "allowChromeHiding"))
    {
      v8 = -[PUOneUpBarsController disableChromeHiding](self, "disableChromeHiding");

      if (!v8)
      {
        v9 = objc_msgSend(v5, "isChromeVisible");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __53__PUOneUpBarsController__handleTapGestureRecognizer___block_invoke;
        v10[3] = &unk_1E58AAD68;
        v11 = v5;
        v12 = v9;
        objc_msgSend(v11, "performChanges:", v10);

      }
    }
    else
    {

    }
  }

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUOneUpBarsController _browsingViewModel:didChange:](self, "_browsingViewModel:didChange:", v7, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PUOneUpBarsController _toolbarViewModel:didChange:](self, "_toolbarViewModel:didChange:", v7, v6);
  }

}

- (void)_browsingViewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  PUOneUpBarsController *v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  char v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  _BOOL4 v65;
  _BOOL4 v66;
  void *v67;
  uint64_t v68;
  id obj;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v8, "chromeAnimationType");

  if (objc_msgSend(v7, "assetsDataSourceDidChange"))
    -[PUBarsController invalidateBars](self, "invalidateBars");
  if (objc_msgSend(v7, "contentPrivacyStateDidChange"))
  {
    -[PUOneUpBarsController _invalidateChromeVisibilityWithAnimationType:](self, "_invalidateChromeVisibilityWithAnimationType:", 0);
    -[PUBarsController invalidateBars](self, "invalidateBars");
    v9 = objc_msgSend(v6, "contentPrivacyState") == 1;
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v7, "currentAssetDidChange");
  if ((_DWORD)v10)
  {
    -[PUOneUpBarsController _invalidateWantsAllPhotosButton](self, "_invalidateWantsAllPhotosButton");
    -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](self, "_currentAssetDisplayInfoUpdater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateInfo");

    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
    -[PUOneUpBarsController _invalidateCommentsTitle](self, "_invalidateCommentsTitle");
    -[PUBarsController invalidateBars](self, "invalidateBars");
    -[PUOneUpBarsController detailsBarButtonController](self, "detailsBarButtonController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentAssetDidChange");

    v70 = 2;
  }
  if (objc_msgSend(v7, "reviewScreenSelectionDidChange"))
  {
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
  if (objc_msgSend(v7, "navigationBarTitleDidChange"))
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
  if (objc_msgSend(v7, "resizeTaskDescriptorViewModelDidChange"))
  {
    -[PUOneUpBarsController _invalidateFileSizeButtonTitle](self, "_invalidateFileSizeButtonTitle");
    -[PUOneUpBarsController _invalidateFileSizeButtonMenu](self, "_invalidateFileSizeButtonMenu");
  }
  if (objc_msgSend(v7, "reviewScreenBarsModelDidChange"))
  {
    -[PUBarsController invalidateBars](self, "invalidateBars");
    -[PUBarsController invalidateContentGuideInsets](self, "invalidateContentGuideInsets");
  }
  if (objc_msgSend(v7, "isInSelectionModeDidChange"))
  {
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_selectionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "performChanges:", &__block_literal_global_49146);
    -[PUOneUpBarsController browsingSession](self, "browsingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v6, "isInSelectionMode");
    objc_msgSend(v17, "px_selectionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      objc_msgSend(v19, "registerChangeObserver:context:", self, PhotosUICoreSelectionManagerObservationContext);
    else
      objc_msgSend(v19, "unregisterChangeObserver:context:", self, PhotosUICoreSelectionManagerObservationContext);

    -[PUBarsController invalidateBars](self, "invalidateBars");
  }
  if (objc_msgSend(v7, "chromeVisibilityDidChange"))
  {
    v10 = -[PUOneUpBarsController disableShowingNavigationBars](self, "disableShowingNavigationBars") ^ 1;
    -[PUBarsController viewController](self, "viewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "px_isVisible");
    v23 = v70;
    if (!v22)
      v23 = 0;
    v70 = v23;

  }
  if (objc_msgSend(v7, "currentAssetTransitionProgressDidChange"))
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = PUShouldAutoHideChrome(v6, objc_msgSend(v24, "chromeAutoHideBehaviorOnSwipe"));

  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v6, "currentAssetReference");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v66 = v9;
    objc_msgSend(v6, "currentAssetReference");
    v27 = objc_claimAutoreleasedReturnValue();
    v67 = v7;
    objc_msgSend(v7, "assetViewModelChangesByAssetReference");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)v27;
    objc_msgSend(v64, "objectForKeyedSubscript:", v27);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    v65 = v25;
    if (!v28)
    {
      v31 = v70;
      goto LABEL_63;
    }
    v29 = v28;
    v30 = *(_QWORD *)v81;
    v31 = v70;
    v72 = *(_QWORD *)v81;
    while (1)
    {
      v32 = 0;
      v68 = v29;
      do
      {
        if (*(_QWORD *)v81 != v30)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v32);
        objc_msgSend(v33, "videoPlayerChange");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "accessoryViewVisibilityChanged") & 1) != 0
          || (objc_msgSend(v33, "isInEditModeChanged") & 1) != 0
          || (objc_msgSend(v33, "isFavoriteChanged") & 1) != 0
          || (objc_msgSend(v33, "assetSyndicationStateChanged") & 1) != 0
          || (objc_msgSend(v33, "assetChanged") & 1) != 0
          || (objc_msgSend(v33, "importStateChanged") & 1) != 0
          || (objc_msgSend(v34, "audioStatusDidChange") & 1) != 0
          || (objc_msgSend(v34, "isActivatedDidChange") & 1) != 0
          || objc_msgSend(v34, "desiredPlayStateDidChange"))
        {
          -[PUBarsController invalidateBars](self, "invalidateBars");
        }
        if (objc_msgSend(v33, "accessoryViewVisibilityChanged"))
        {
          objc_msgSend(v6, "assetViewModelForAssetReference:", v73);
          v35 = v32;
          v36 = v31;
          v37 = v29;
          v38 = v10;
          v39 = self;
          v40 = v6;
          v41 = v34;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isLastAccessoryViewVisibilityChangeReasonUserAction");

          v34 = v41;
          v6 = v40;
          self = v39;
          v44 = v38;
          v29 = v37;
          v31 = v36;
          v32 = v35;
          if (v43)
            v31 = 1;
          v10 = v43 | v44;
          v30 = v72;
        }
        if (objc_msgSend(v33, "isInEditModeChanged"))
          -[PUOneUpBarsController _invalidateChromeVisibilityWithAnimationType:](self, "_invalidateChromeVisibilityWithAnimationType:", v31);
        if (objc_msgSend(v33, "contentOffsetChanged"))
        {
          -[PUBarsController invalidateBars](self, "invalidateBars");
          v10 = 1;
        }
        if (objc_msgSend(v33, "visualImageAnalysisChanged"))
        {
          v71 = v34;
          v45 = v10;
          v46 = v31;
          v47 = v6;
          objc_msgSend(v6, "assetViewModelForAssetReference:", v73);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "assetReference");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "asset");
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "asset");
          v51 = (id)objc_claimAutoreleasedReturnValue();
          if (v50 == v51)
          {

          }
          else
          {
            v52 = v51;
            v53 = objc_msgSend(v50, "isEqual:", v51);

            if ((v53 & 1) == 0)
              goto LABEL_58;
          }
          -[PUBarsController invalidateBars](self, "invalidateBars");
LABEL_58:

          v6 = v47;
          v31 = v46;
          v10 = v45;
          v34 = v71;
          v30 = v72;
          v29 = v68;
        }

        ++v32;
      }
      while (v29 != v32);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (!v29)
      {
LABEL_63:
        v54 = v10;
        v70 = v31;
        v7 = v67;
        objc_msgSend(v67, "assetSharedViewModelChangesByAssetUUID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "asset");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "uuid");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKey:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v59 = v58;
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v77 != v62)
                objc_enumerationMutation(v59);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "needsDeferredProcessingChanged"))
                -[PUBarsController invalidateBars](self, "invalidateBars");
            }
            v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          }
          while (v61);
        }

        v25 = v65;
        v9 = v66;
        LOBYTE(v10) = v54;
        break;
      }
    }
  }
  if (v25)
  {
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke_2;
    v74[3] = &unk_1E58ABD10;
    v75 = v6;
    objc_msgSend(v75, "performChanges:", v74);

  }
  else if ((v10 & 1) != 0)
  {
    -[PUOneUpBarsController _invalidateChromeVisibilityWithAnimationType:](self, "_invalidateChromeVisibilityWithAnimationType:", v70);
  }
  if (v9)
    -[PUOneUpBarsController updateBars](self, "updateBars");

}

- (void)_toolbarViewModel:(id)a3 didChange:(id)a4
{
  _QWORD block[5];

  if (objc_msgSend(a4, "accessoryViewChanged", a3))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PUOneUpBarsController__toolbarViewModel_didChange___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)sourceItemForActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;
  void *v11;

  v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E0D7C010] == v4 || *MEMORY[0x1E0D7BFD0] == (_QWORD)v4)
  {
    v7 = 50;
LABEL_22:
    -[PUOneUpBarsController _barButtonItemForIdentifier:](self, "_barButtonItemForIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((id)*MEMORY[0x1E0D7C130] == v4
    || *MEMORY[0x1E0D7C0A0] == (_QWORD)v4
    || *MEMORY[0x1E0D7C140] == (_QWORD)v4
    || *MEMORY[0x1E0D7C000] == (_QWORD)v4)
  {
    v7 = 2;
    goto LABEL_22;
  }
  if ((id)*MEMORY[0x1E0D7BFC8] == v4)
  {
    v7 = 3;
    goto LABEL_22;
  }
  v11 = 0;
LABEL_23:

  return v11;
}

- (id)_barButtonItemForActionType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v5 = a3 - 1;
  if (a3 - 1 <= 0x3D && ((0x37BE005B400256A9uLL >> v5) & 1) != 0)
  {
    -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", qword_1AB0EFB00[v5], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_airPlayBarButtonItemForPopoverPresentation
{
  uint64_t v3;

  if (-[PUOneUpBarsController shouldShowAirPlayButton](self, "shouldShowAirPlayButton"))
    v3 = 34;
  else
    v3 = 31;
  -[PUOneUpBarsController _barButtonItemForActionType:](self, "_barButtonItemForActionType:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3
{
  if (a3 == 34)
    -[PUOneUpBarsController _airPlayBarButtonItemForPopoverPresentation](self, "_airPlayBarButtonItemForPopoverPresentation");
  else
    -[PUOneUpBarsController _barButtonItemForActionType:](self, "_barButtonItemForActionType:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3
{
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  -[PUOneUpBarsController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isPresentingOverOneUp"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PUOneUpBarsController_presentationControllerDidDismiss___block_invoke;
    v5[3] = &unk_1E58ABD10;
    v6 = v4;
    objc_msgSend(v6, "performChanges:", v5);

  }
}

- (id)barButtonItemCollection:(id)a3 newBarButtonItemForIdentifier:(int64_t)a4
{
  return -[PUOneUpBarsController _newBarButtonItemWithIdentifier:location:](self, "_newBarButtonItemWithIdentifier:location:", a4, -[PUOneUpBarsController _locationForBarButtonItemCollection:](self, "_locationForBarButtonItemCollection:", a3));
}

- (id)_barButtonItemCollectionForLocation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      -[PUOneUpBarsController _rightNavBarButtonItemCollection](self, "_rightNavBarButtonItemCollection", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[PUOneUpBarsController _centerNavBarButtonItemCollection](self, "_centerNavBarButtonItemCollection", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[PUOneUpBarsController _leftNavBarButtonItemCollection](self, "_leftNavBarButtonItemCollection", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_barButtonIdentifiersForLocation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      -[PUOneUpBarsController _rightNavBarButtonIdentifiers](self, "_rightNavBarButtonIdentifiers", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[PUOneUpBarsController _centerNavBarButtonIdentifiers](self, "_centerNavBarButtonIdentifiers", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[PUOneUpBarsController _leftNavBarButtonIdentifiers](self, "_leftNavBarButtonIdentifiers", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[PUOneUpBarsController _toolbarButtonIdentifiers](self, "_toolbarButtonIdentifiers", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (int64_t)_locationForBarButtonItemCollection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  int64_t v10;

  v4 = a3;
  -[PUOneUpBarsController _leftNavBarButtonItemCollection](self, "_leftNavBarButtonItemCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v10 = 3;
  }
  else
  {
    -[PUOneUpBarsController _centerNavBarButtonItemCollection](self, "_centerNavBarButtonItemCollection");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v10 = 2;
    }
    else
    {
      -[PUOneUpBarsController _rightNavBarButtonItemCollection](self, "_rightNavBarButtonItemCollection");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        v10 = 1;
      }
      else
      {
        -[PUOneUpBarsController _toolbarButtonItemCollection](self, "_toolbarButtonItemCollection");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v8 == v4;

        v10 = 4 * v9;
      }
    }
  }

  return v10;
}

- (id)_barButtonItemForIdentifier:(int64_t)a3 location:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PUOneUpBarsController _barButtonItemCollectionForLocation:](self, "_barButtonItemCollectionForLocation:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "barButtonItemForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_activeBarButtonItemForIdentifier:(int64_t)a3
{
  return -[PUOneUpBarsController _barButtonItemForIdentifier:location:](self, "_barButtonItemForIdentifier:location:", a3, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:"));
}

- (id)_barButtonItemForIdentifier:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:");
  -[PUOneUpBarsController _barButtonItemCollectionForLocation:](self, "_barButtonItemCollectionForLocation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpBarsController _barButtonIdentifiersForLocation:](self, "_barButtonIdentifiersForLocation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v7, "containsIndex:", a3))
    {
      objc_msgSend(v6, "barButtonItemForIdentifier:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (UIBarButtonItem)barButtonItemToggleDetails
{
  return (UIBarButtonItem *)-[PUOneUpBarsController _barButtonItemForIdentifier:](self, "_barButtonItemForIdentifier:", 38);
}

- (UIBarButtonItem)barButtonItemActionsMenu
{
  return (UIBarButtonItem *)-[PUOneUpBarsController _barButtonItemForIdentifier:](self, "_barButtonItemForIdentifier:", 50);
}

- (int64_t)_identifierForButton:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(&unk_1E59BA1C8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v9 = *(_QWORD *)v17;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(&unk_1E59BA1C8);
      -[PUOneUpBarsController _barButtonItemCollectionForLocation:](self, "_barButtonItemCollectionForLocation:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((isKindOfClass & 1) != 0)
      {
        v13 = objc_msgSend(v11, "identifierForBarButtonItem:", v4);
      }
      else
      {
        if ((v6 & 1) == 0)
        {

          goto LABEL_13;
        }
        v13 = objc_msgSend(v11, "identifierForCustomButton:", v4);
      }
      v14 = v13;

      if (v14)
        goto LABEL_16;
LABEL_13:
      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(&unk_1E59BA1C8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v8);
LABEL_15:
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)playPauseBarItemsController:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "playPauseStateDidChange", a3))
  {
    -[PUBarsController invalidateBars](self, "invalidateBars");
    -[PUOneUpBarsController _updateShowingPlayPauseButton](self, "_updateShowingPlayPauseButton");
  }
}

- (id)overOneUpPresentationSession:(id)a3 barButtonItemForActivityType:(id)a4
{
  void *v5;

  if (objc_msgSend(a4, "isEqual:", *MEMORY[0x1E0D7BC80]))
  {
    -[PUOneUpBarsController _airPlayBarButtonItemForPopoverPresentation](self, "_airPlayBarButtonItemForPopoverPresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)overOneUpPresentationSession:(id)a3 didAppendReviewScreenAction:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  if (a4 == 1)
  {
    v10 = v6;
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 46;
    goto LABEL_5;
  }
  if (!a4)
  {
    v10 = v6;
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 47;
LABEL_5:
    objc_msgSend(v7, "performSimpleActionWithActionType:", v9);

    v6 = v10;
  }

}

- (void)ppt_performAction:(unint64_t)a3
{
  id v3;
  id v4;

  if (a3 == 31)
  {
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performShareAction");

  }
  else if (a3 == 15)
  {
    -[PUOneUpBarsController actionsController](self, "actionsController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performSimpleActionWithActionType:", 15);

  }
}

- (BOOL)scrubberView:(id)a3 shouldIgnoreHitTest:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char isKindOfClass;
  void *v18;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  -[PUBarsController viewController](self, "viewController");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertPoint:fromView:", v10, x, y);
  v14 = v13;
  v16 = v15;
  LOBYTE(v11) = objc_msgSend(v10, "isDescendantOfView:", v12);

  if ((v11 & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_msgSend(v12, "hitTest:withEvent:", v9, v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }

  }
  return isKindOfClass & 1;
}

- (void)photoBrowserTitleViewControllerTapped:(id)a3
{
  id v4;

  if (self->_delegateFlags.respondsToDidTapTitle)
  {
    -[PUOneUpBarsController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oneUpBarsControllerDidTapTitle:", self);

  }
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUOneUpBarsController _currentAssetDisplayInfoUpdater](self, "_currentAssetDisplayInfoUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 3156, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
  -[PUOneUpBarsController _invalidateCommentsTitle](self, "_invalidateCommentsTitle");

}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PUCurrentAssetDisplayInfo")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 3220, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUOneUpBarsController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "currentAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PUOneUpBarsController _canShowCommentsForCurrentAsset](self, "_canShowCommentsForCurrentAsset");
  -[PUOneUpBarsController infoRequestSerialQueue](self, "infoRequestSerialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__PUOneUpBarsController_requestInfoOfKind_withResultHandler___block_invoke;
  v20[3] = &unk_1E58A4C18;
  v15 = v9;
  v24 = v13;
  v21 = v15;
  v22 = v12;
  v23 = v8;
  v16 = v8;
  v17 = v12;
  dispatch_async(v14, v20);

  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PUDebuggingObservedImageModulationManagerObservationContext == a5)
  {
    v11 = v9;
    -[PUOneUpBarsController _invalidateTitle](self, "_invalidateTitle");
    goto LABEL_10;
  }
  if ((void *)PUPhotoPickerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    v11 = v9;
    -[PUOneUpBarsController _invalidateFileSizeButtonTitle](self, "_invalidateFileSizeButtonTitle");
    v9 = v11;
    if ((v6 & 4) != 0)
    {
      -[PUOneUpBarsController _invalidateFileSizeButtonMenu](self, "_invalidateFileSizeButtonMenu");
      goto LABEL_10;
    }
  }
  else
  {
    if ((void *)PhotosUICoreSelectionManagerObservationContext != a5 && (void *)VideoMuteControllerContext_49118 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpBarsController.m"), 3252, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PUBarsController invalidateBars](self, "invalidateBars");
LABEL_10:
      v9 = v11;
    }
  }

}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (PUOneUpActionsController)actionsController
{
  return self->_actionsController;
}

- (BOOL)shouldPlaceButtonsInNavigationBar
{
  return self->_shouldPlaceButtonsInNavigationBar;
}

- (BOOL)isInCompactLayoutStyle
{
  return self->_isInCompactLayoutStyle;
}

- (void)setIsInCompactLayoutStyle:(BOOL)a3
{
  self->_isInCompactLayoutStyle = a3;
}

- (BOOL)shouldUseCompactTitleView
{
  return self->_shouldUseCompactTitleView;
}

- (BOOL)shouldUseCompactCommentsTitle
{
  return self->_shouldUseCompactCommentsTitle;
}

- (double)maximumToolbarHeight
{
  return self->_maximumToolbarHeight;
}

- (double)maximumAccessoryToolbarHeight
{
  return self->_maximumAccessoryToolbarHeight;
}

- (BOOL)shouldShowProgrammaticNavBackButton
{
  return self->_shouldShowProgrammaticNavBackButton;
}

- (BOOL)shouldShowAirPlayButton
{
  return self->_shouldShowAirPlayButton;
}

- (BOOL)wantsShowInLibraryButton
{
  return self->_wantsShowInLibraryButton;
}

- (BOOL)shouldShowScrubber
{
  return self->_shouldShowScrubber;
}

- (BOOL)shouldShowTitleView
{
  return self->_shouldShowTitleView;
}

- (void)setShouldShowTitleView:(BOOL)a3
{
  self->_shouldShowTitleView = a3;
}

- (BOOL)allowTapOnTitle
{
  return self->_allowTapOnTitle;
}

- (BOOL)allowShowingPlayPauseButton
{
  return self->_allowShowingPlayPauseButton;
}

- (BOOL)shouldShowMuteButton
{
  return self->_shouldShowMuteButton;
}

- (BOOL)disableShowingNavigationBars
{
  return self->_disableShowingNavigationBars;
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (BOOL)disableChromeHiding
{
  return self->_disableChromeHiding;
}

- (void)setDisableChromeHiding:(BOOL)a3
{
  self->_disableChromeHiding = a3;
}

- (NSString)presentedTipID
{
  return self->_presentedTipID;
}

- (BOOL)isShowingPlayPauseButton
{
  return self->_isShowingPlayPauseButton;
}

- (NSString)_scrubbingIdentifier
{
  return self->__scrubbingIdentifier;
}

- (PUScrubberView)_scrubberView
{
  return self->__scrubberView;
}

- (BOOL)_needsUpdateTitle
{
  return self->__needsUpdateTitle;
}

- (void)_setNeedsUpdateTitle:(BOOL)a3
{
  self->__needsUpdateTitle = a3;
}

- (NSString)_title
{
  return self->__title;
}

- (void)_setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PUPhotoBrowserTitleViewController)_titleViewController
{
  return self->__titleViewController;
}

- (BOOL)_needsUpdateCommentsTitle
{
  return self->__needsUpdateCommentsTitle;
}

- (void)_setNeedsUpdateCommentsTitle:(BOOL)a3
{
  self->__needsUpdateCommentsTitle = a3;
}

- (BOOL)shouldBeginEditingAfterShowingComments
{
  return self->_shouldBeginEditingAfterShowingComments;
}

- (void)setShouldBeginEditingAfterShowingComments:(BOOL)a3
{
  self->_shouldBeginEditingAfterShowingComments = a3;
}

- (BOOL)_needsUpdateFileSizeButtonTitle
{
  return self->__needsUpdateFileSizeButtonTitle;
}

- (void)_setNeedsUpdateFileSizeButtonTitle:(BOOL)a3
{
  self->__needsUpdateFileSizeButtonTitle = a3;
}

- (BOOL)_needsUpdateFileSizeButtonMenu
{
  return self->__needsUpdateFileSizeButtonMenu;
}

- (void)_setNeedsUpdateFileSizeButtonMenu:(BOOL)a3
{
  self->__needsUpdateFileSizeButtonMenu = a3;
}

- (PXInfoUpdater)_currentAssetDisplayInfoUpdater
{
  return self->__currentAssetDisplayInfoUpdater;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (BOOL)_needsUpdateChromeVisibility
{
  return self->__needsUpdateChromeVisibility;
}

- (void)_setNeedsUpdateChromeVisibility:(BOOL)a3
{
  self->__needsUpdateChromeVisibility = a3;
}

- (int64_t)_nextChromeVisibilityUpdateAnimationType
{
  return self->__nextChromeVisibilityUpdateAnimationType;
}

- (void)_setNextChromeVisibilityUpdateAnimationType:(int64_t)a3
{
  self->__nextChromeVisibilityUpdateAnimationType = a3;
}

- (BOOL)_lastChromeVisibility
{
  return self->__lastChromeVisibility;
}

- (void)_setLastChromeVisibility:(BOOL)a3
{
  self->__lastChromeVisibility = a3;
}

- (BOOL)_needsUpdatePlayPauseItems
{
  return self->__needsUpdatePlayPauseItems;
}

- (void)_setNeedsUpdatePlayPauseItems:(BOOL)a3
{
  self->__needsUpdatePlayPauseItems = a3;
}

- (PUPlayPauseBarItemsController)_playPauseBarItemsController
{
  return self->__playPauseBarItemsController;
}

- (PUBarButtonItemCollection)_toolbarButtonItemCollection
{
  return self->__toolbarButtonItemCollection;
}

- (void)_setToolbarButtonItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->__toolbarButtonItemCollection, a3);
}

- (NSMutableIndexSet)_toolbarButtonIdentifiers
{
  return self->__toolbarButtonIdentifiers;
}

- (void)_setToolbarButtonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__toolbarButtonIdentifiers, a3);
}

- (PUBarButtonItemCollection)_rightNavBarButtonItemCollection
{
  return self->__rightNavBarButtonItemCollection;
}

- (void)_setRightNavBarButtonItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->__rightNavBarButtonItemCollection, a3);
}

- (NSMutableIndexSet)_rightNavBarButtonIdentifiers
{
  return self->__rightNavBarButtonIdentifiers;
}

- (void)_setRightNavBarButtonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__rightNavBarButtonIdentifiers, a3);
}

- (PUBarButtonItemCollection)_centerNavBarButtonItemCollection
{
  return self->__centerNavBarButtonItemCollection;
}

- (void)_setCenterNavBarButtonItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->__centerNavBarButtonItemCollection, a3);
}

- (NSMutableIndexSet)_centerNavBarButtonIdentifiers
{
  return self->__centerNavBarButtonIdentifiers;
}

- (void)_setCenterNavBarButtonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__centerNavBarButtonIdentifiers, a3);
}

- (PUBarButtonItemCollection)_leftNavBarButtonItemCollection
{
  return self->__leftNavBarButtonItemCollection;
}

- (void)_setLeftNavBarButtonItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->__leftNavBarButtonItemCollection, a3);
}

- (NSMutableIndexSet)_leftNavBarButtonIdentifiers
{
  return self->__leftNavBarButtonIdentifiers;
}

- (void)_setLeftNavBarButtonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__leftNavBarButtonIdentifiers, a3);
}

- (PXImageModulationManager)debuggingObservedImageModulationManager
{
  return self->_debuggingObservedImageModulationManager;
}

- (OS_dispatch_queue)infoRequestSerialQueue
{
  return self->_infoRequestSerialQueue;
}

- (BOOL)wantsAllPhotosButton
{
  return self->_wantsAllPhotosButton;
}

- (int64_t)style
{
  return self->_style;
}

- (PUOneUpDetailsBarButtonController)detailsBarButtonController
{
  return self->_detailsBarButtonController;
}

- (void)setDetailsBarButtonController:(id)a3
{
  objc_storeStrong((id *)&self->_detailsBarButtonController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsBarButtonController, 0);
  objc_storeStrong((id *)&self->_infoRequestSerialQueue, 0);
  objc_storeStrong((id *)&self->_debuggingObservedImageModulationManager, 0);
  objc_storeStrong((id *)&self->__leftNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__leftNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__centerNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__centerNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__rightNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__rightNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__toolbarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__toolbarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__playPauseBarItemsController, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__currentAssetDisplayInfoUpdater, 0);
  objc_storeStrong((id *)&self->__titleViewController, 0);
  objc_storeStrong((id *)&self->__title, 0);
  objc_storeStrong((id *)&self->__scrubberView, 0);
  objc_storeStrong((id *)&self->__scrubbingIdentifier, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

void __61__PUOneUpBarsController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1AF42B2C0]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localCreationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("PUTitleInfoCreationDateKey"));
    objc_msgSend(v6, "localizedGeoDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PUTitleInfoGeoDescriptionKey"));
    if (*(_BYTE *)(a1 + 56))
    {
      v23 = v4;
      v24 = v2;
      v9 = +[PUOneUpCommentsInfoProvider likeCountForDisplayAsset:](PUOneUpCommentsInfoProvider, "likeCountForDisplayAsset:", v6);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v10;
        v27 = 2048;
        v28 = v9;
        _os_log_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[79401480]: Like count for asset (%{public}@) BEFORE reload = %lu", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchUpdatedObject:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "fetchPropertySetsIfNeeded");
      v14 = v13;

      v15 = +[PUOneUpCommentsInfoProvider likeCountForDisplayAsset:](PUOneUpCommentsInfoProvider, "likeCountForDisplayAsset:", v14);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2048;
        v28 = v15;
        _os_log_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[79401480]: Like count for asset (%{public}@) AFTER reload = %lu", buf, 0x16u);

      }
      if (v9 != v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v22;
        _os_log_error_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[79401480]: *** Like count for asset (%{public}@) is different before and after asset reload ***", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("PUCommentsInfoLikeCountKey"));

      v18 = +[PUOneUpCommentsInfoProvider hasUserLikedDisplayAsset:](PUOneUpCommentsInfoProvider, "hasUserLikedDisplayAsset:", v14);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("PUCommentsInfoHasLikedKey"));

      v20 = +[PUOneUpCommentsInfoProvider commentCountForDisplayAsset:](PUOneUpCommentsInfoProvider, "commentCountForDisplayAsset:", v14);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("PUCommentsInfoCommentCountKey"));

      v2 = v24;
      v4 = v23;
    }
    else
    {
      v14 = v6;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PUTitleInfoDictionaryKey"));
    if (v5)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PUCommentsInfoDictionaryKey"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    objc_autoreleasePoolPop(v2);
  }
}

uint64_t __58__PUOneUpBarsController_presentationControllerDidDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPresentingOverOneUp:", 0);
}

uint64_t __53__PUOneUpBarsController__toolbarViewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateContentGuideInsets");
}

uint64_t __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", 0);
}

uint64_t __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

uint64_t __53__PUOneUpBarsController__handleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", *(_BYTE *)(a1 + 40) == 0, 2);
}

uint64_t __44__PUOneUpBarsController__revealGainMapImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRevealsGainMapImage:", objc_msgSend(*(id *)(a1 + 32), "revealsGainMapImage") ^ 1);
}

void __41__PUOneUpBarsController__showActionsMenu__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_barButtonItemForIdentifier:location:", 50, objc_msgSend(*(id *)(a1 + 32), "_locationForBarButtonItemWithIdentifier:", 50));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_actionsMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v2);

  v3 = objc_opt_respondsToSelector();
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v8, "performSelector:", sel_view);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "contextMenuInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    }
    v4 = v8;
  }

}

uint64_t __45__PUOneUpBarsController__updateTitleIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUsingCompactTitleView:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setGeoDescription:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCreationDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setTitleTextColor:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitleTextColor:", *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setTappable:", *(unsigned __int8 *)(a1 + 73));
}

id __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0DC34F0];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithImage:style:target:action:", v9, 0, *(_QWORD *)(a1 + 32), sel_barButtonItemTapped_);
  objc_msgSend(v10, "setTitle:", v6);

  return v10;
}

id __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", a2, *(_QWORD *)(a1 + 32), sel_barButtonItemTapped_);
}

void __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionsController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preheatShareAction");

}

void __37__PUOneUpBarsController__actionsMenu__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_documentMenuActions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  a2[2](v4, v7);

}

void __45__PUOneUpBarsController__documentMenuActions__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_actionsMenuElements");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __35__PUOneUpBarsController_updateBars__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v10, "integerValue");
  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:onAsset:inAssetCollection:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v7 = objc_msgSend(*(id *)(a1 + 56), "_locationForBarButtonItemWithIdentifier:", v6);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 56), "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v6, v7, objc_msgSend(*(id *)(a1 + 32), "shouldEnableActionType:onAsset:inAssetCollection:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
      objc_msgSend(*(id *)(a1 + 56), "_barButtonItemForIdentifier:location:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v9, v10);

    }
  }

}

uint64_t __35__PUOneUpBarsController_updateBars__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setToolbarItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewTopOutset:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewMaximumHeight:", *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumHeight:", *(double *)(a1 + 72));
}

void __35__PUOneUpBarsController_updateBars__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAvailableItemsByIdentifier:", v3);
  objc_msgSend(v4, "setAccessoryView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setShouldPlaceScrubberInScrubberBar:", objc_msgSend(*(id *)(a1 + 48), "shouldPlaceScrubberInScrubberBar"));

}

@end
