@implementation PXCMMAssetsViewController

- (PXCMMAssetsViewController)initWithSession:(id)a3
{
  id v4;
  PXCMMAssetsViewController *v5;
  uint64_t v6;
  NSMutableSet *inUseTiles;
  void *v8;
  void *v9;
  PXCMMSpecManager *v10;
  PXCMMSpecManager *specManager;
  uint64_t v12;
  PXCMMSpec *spec;
  void *v14;
  void *v15;
  uint64_t v16;
  PXMomentShareStatusPresentation *momentShareStatusPresentationForFooter;
  PXCMMFooterViewModel *v18;
  PXCMMFooterViewModel *statusFooterViewModel;
  uint64_t v20;
  PXMomentShareStatusPresentation *momentShareStatusPresentationForPoster;
  void *v22;
  void *v23;
  PXStatusController *v24;
  PXStatusController *statusController;
  PXCMMStatusController *v26;
  PXMomentShareStatusPresentation *v27;
  void *v28;
  uint64_t v29;
  PXCMMStatusController *cmmStatusController;
  uint64_t v31;
  PXUpdater *updater;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PXCMMAssetsViewController;
  v5 = -[PXCMMComponentViewController initWithSession:](&v34, sel_initWithSession_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    inUseTiles = v5->_inUseTiles;
    v5->_inUseTiles = (NSMutableSet *)v6;

    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->__layoutType = objc_msgSend(v8, "initialLayoutType");

    v5->_needsToPerformInitialSelection = 1;
    -[UIViewController px_enableExtendedTraitCollection](v5, "px_enableExtendedTraitCollection");
    -[UIViewController px_extendedTraitCollection](v5, "px_extendedTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v9, objc_msgSend(v4, "activityType"));
    specManager = v5->_specManager;
    v5->_specManager = v10;

    -[PXFeatureSpecManager spec](v5->_specManager, "spec");
    v12 = objc_claimAutoreleasedReturnValue();
    spec = v5->_spec;
    v5->_spec = (PXCMMSpec *)v12;

    -[PXCMMSpecManager registerChangeObserver:context:](v5->_specManager, "registerChangeObserver:context:", v5, PXSpecManagerObservationContext_242295);
    objc_msgSend(v4, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerChangeObserver:context:", v5, PXCMMViewModelObservationContext_242293);

    objc_msgSend(v4, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userSelectionEnabled = objc_msgSend(v15, "isSelecting");

    objc_msgSend(v4, "momentShareStatusPresentationWithPresentationStyle:", 2);
    v16 = objc_claimAutoreleasedReturnValue();
    momentShareStatusPresentationForFooter = v5->_momentShareStatusPresentationForFooter;
    v5->_momentShareStatusPresentationForFooter = (PXMomentShareStatusPresentation *)v16;

    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v5->_momentShareStatusPresentationForFooter, "registerChangeObserver:context:", v5, PXMomentShareStatusPresentationObservationContext_242294);
    if (v5->_momentShareStatusPresentationForFooter)
    {
      v18 = -[PXCMMFooterViewModel initWithMomentShareStatusPresentation:mode:]([PXCMMFooterViewModel alloc], "initWithMomentShareStatusPresentation:mode:", v5->_momentShareStatusPresentationForFooter, 0);
      statusFooterViewModel = v5->_statusFooterViewModel;
      v5->_statusFooterViewModel = v18;

    }
    objc_msgSend(v4, "momentShareStatusPresentationWithPresentationStyle:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    momentShareStatusPresentationForPoster = v5->_momentShareStatusPresentationForPoster;
    v5->_momentShareStatusPresentationForPoster = (PXMomentShareStatusPresentation *)v20;

    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v5->_momentShareStatusPresentationForPoster, "registerChangeObserver:context:", v5, PXMomentShareStatusPresentationObservationContext_242294);
    objc_msgSend(v4, "viewModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "selectionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "registerChangeObserver:context:", v5, PXSelectionManagerObservationContext_242296);
    v24 = objc_alloc_init(PXStatusController);
    statusController = v5->_statusController;
    v5->_statusController = v24;

    -[PXStatusController setDelegate:](v5->_statusController, "setDelegate:", v5);
    if (v5->_momentShareStatusPresentationForFooter)
    {
      v26 = [PXCMMStatusController alloc];
      v27 = v5->_momentShareStatusPresentationForFooter;
      -[PXStatusController viewModel](v5->_statusController, "viewModel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PXCMMStatusController initWithStatusPresentation:viewModel:](v26, "initWithStatusPresentation:viewModel:", v27, v28);
      cmmStatusController = v5->_cmmStatusController;
      v5->_cmmStatusController = (PXCMMStatusController *)v29;

    }
    v31 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v5);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v31;

    -[PXUpdater setNeedsUpdateSelector:](v5->_updater, "setNeedsUpdateSelector:", sel__scheduleLayout);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateLayoutEngine);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateAssetsScene);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateGestures);
    -[PXUpdater setNeedsUpdateOf:](v5->_updater, "setNeedsUpdateOf:", sel__updateLayoutEngine);
    -[PXUpdater setNeedsUpdateOf:](v5->_updater, "setNeedsUpdateOf:", sel__updateAssetsScene);
    -[PXUpdater setNeedsUpdateOf:](v5->_updater, "setNeedsUpdateOf:", sel__updateGestures);

  }
  return v5;
}

- (CGSize)_maximumThumbnailSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "masterThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sizeWithFallBackSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateAssetsScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXUIScrollViewController *v8;
  void *v9;
  PXUIScrollViewController *v10;
  PXUIScrollViewController *scrollViewController;
  PXBasicUIViewTileAnimator *v12;
  PXBasicTileAnimator *tileAnimator;
  PXTilingController *v14;
  PXTilingController *tilingController;
  PXUIAssetsScene *v16;
  PXUIAssetsScene *sceneController;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  CGSize v37;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_sceneController && -[PXCMMAssetsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXCMMComponentViewController session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSourceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCMMAssetsViewController _createNewLayout](self, "_createNewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PXUIScrollViewController alloc];
    -[PXCMMAssetsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = -[PXUIScrollViewController initWithFrame:](v8, "initWithFrame:");
    scrollViewController = self->_scrollViewController;
    self->_scrollViewController = v10;

    v12 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->_tileAnimator;
    self->_tileAnimator = &v12->super;

    v14 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v7);
    tilingController = self->_tilingController;
    self->_tilingController = v14;

    -[PXTilingController setScrollController:](self->_tilingController, "setScrollController:", self->_scrollViewController);
    -[PXTilingController setTileAnimator:](self->_tilingController, "setTileAnimator:", self->_tileAnimator);
    v16 = -[PXUIAssetsScene initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:]([PXUIAssetsScene alloc], "initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:", self->_tilingController, v4, v33, v6, self);
    sceneController = self->_sceneController;
    self->_sceneController = v16;

    -[PXTilingController setTileSource:](self->_tilingController, "setTileSource:", self);
    -[PXTilingController setTransitionDelegate:](self->_tilingController, "setTransitionDelegate:", self->_sceneController);
    -[PXTilingController setScrollDelegate:](self->_tilingController, "setScrollDelegate:", self->_sceneController);
    -[PXCMMAssetsViewController _maximumThumbnailSize](self, "_maximumThumbnailSize");
    v19 = v18;
    v21 = v20;
    PLSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37.width = v19;
      v37.height = v21;
      NSStringFromCGSize(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "Setting the maximum image request size to %{public}@", buf, 0xCu);

    }
    -[PXUIAssetsScene setMaximumImageSize:](self->_sceneController, "setMaximumImageSize:", v19, v21);
    -[PXCMMAssetsViewController _performInitialSelectionIfNeeded](self, "_performInitialSelectionIfNeeded");

  }
  -[PXCMMAssetsViewController contentInset](self, "contentInset");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PXScrollViewController setContentInset:](self->_scrollViewController, "setContentInset:");
  -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setVerticalScrollIndicatorInsets:", v25, v27, v29, v31);

}

- (void)_updateSelectionEnabled
{
  void *v3;
  id v4;

  if ((-[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentationForPoster, "state") & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    -[PXCMMComponentViewController session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "performChanges:", &__block_literal_global_242394);
  }
}

- (void)_performInitialSelectionIfNeeded
{
  void *v3;
  uint64_t v4;

  if (self->_needsToPerformInitialSelection
    && !-[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder"))
  {
    self->_needsToPerformInitialSelection = 0;
    -[PXCMMComponentViewController session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "activityType");

    if (v4 == 2)
    {
      -[PXCMMAssetsViewController _selectNonCopiedAssets](self, "_selectNonCopiedAssets");
    }
    else if (v4 == 1)
    {
      -[PXCMMAssetsViewController _selectAllAssets](self, "_selectAllAssets");
    }
  }
}

- (void)_selectCuratedAssets
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _OWORD v23[2];

  -[PXCMMComponentViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 348, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("dataSourceSnapshot"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 348, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("dataSourceSnapshot"), v15);
  }

LABEL_3:
  objc_msgSend(off_1E50B3668, "indexPathSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "firstItemIndexPath");
  else
    memset(v23, 0, sizeof(v23));
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke;
  v20[3] = &unk_1E5142450;
  v11 = v8;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v11, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v23, 0, v20);
  if (objc_msgSend(v12, "count"))
  {
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke_2;
    v18[3] = &unk_1E513C668;
    v19 = v12;
    objc_msgSend(v6, "performChanges:", v18);

  }
}

- (void)_selectNonCopiedAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCMMComponentViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importStatusManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectNonCopiedAssetsWithImportStatusManager:", v6);
}

- (BOOL)_areAllNotCopiedAssetsSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMComponentViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v8, "areAllUnsavedAssetsSelectedWithImportStatusManager:", v7);

  return (char)v4;
}

- (void)_selectAllAssets
{
  void *v2;
  void *v3;
  id v4;

  -[PXCMMComponentViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performChanges:", &__block_literal_global_172_242390);
}

- (void)_deselectAllAssets
{
  void *v2;
  void *v3;
  id v4;

  -[PXCMMComponentViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performChanges:", &__block_literal_global_173_242389);
}

- (void)_scheduleLayout
{
  id v2;

  -[PXCMMAssetsViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMAssetsViewController;
  -[PXCMMAssetsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)viewDidLoad
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
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
  PXCMMProgressBannerView *v16;
  PXCMMProgressBannerView *progressBannerView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PXCMMAssetsViewController;
  -[PXCMMAssetsViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[PXCMMAssetsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  self->_knownReferenceSize.width = v4;
  self->_knownReferenceSize.height = v5;

  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXCMMAssetsViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMSpec reviewBackgroundColor](self->_spec, "reviewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v6);

  objc_msgSend(v31, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v31, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v30, "addSubview:", v31);
  v24 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v31, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v27 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v26;
  objc_msgSend(v31, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v8;
  objc_msgSend(v31, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v11;
  objc_msgSend(v31, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v15);

  if (self->_momentShareStatusPresentationForFooter)
  {
    v16 = -[PXCMMProgressBannerView initWithMomentShareStatusPresentation:]([PXCMMProgressBannerView alloc], "initWithMomentShareStatusPresentation:", self->_momentShareStatusPresentationForFooter);
    progressBannerView = self->_progressBannerView;
    self->_progressBannerView = v16;

    -[PXCMMProgressBannerView setDelegate:](self->_progressBannerView, "setDelegate:", self);
    -[PXCMMProgressBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressBannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v30, "addSubview:", self->_progressBannerView);
    -[PXCMMProgressBannerView layer](self->_progressBannerView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZPosition:", 1.0);

    -[PXCMMAssetsViewController _updateProgressBannerViewVisibility](self, "_updateProgressBannerViewVisibility");
    -[PXCMMAssetsViewController _updateProgressBannerViewConstraints](self, "_updateProgressBannerViewConstraints");
  }
  -[PXCMMAssetsViewController _updateSelectionEnabled](self, "_updateSelectionEnabled");
  -[PXCMMAssetsViewController _oneUpPresentation](self, "_oneUpPresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contextMenuInteraction");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "addInteraction:", v29);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel__handleSpaceBar_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMAssetsViewController addKeyCommand:](self, "addKeyCommand:", v20);

  -[PXAssetsScene viewTileReusePool](self->_sceneController, "viewTileReusePool");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke;
  v46[3] = &unk_1E513C6D0;
  objc_copyWeak(&v47, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870942, v46);
  v44[0] = v22;
  v44[1] = 3221225472;
  v44[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_2;
  v44[3] = &unk_1E513C6D0;
  objc_copyWeak(&v45, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870946, v44);
  v42[0] = v22;
  v42[1] = 3221225472;
  v42[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_3;
  v42[3] = &unk_1E513C6D0;
  objc_copyWeak(&v43, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870943, v42);
  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_4;
  v40[3] = &unk_1E513C6D0;
  objc_copyWeak(&v41, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870944, v40);
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_5;
  v38[3] = &unk_1E513C6D0;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870948, v38);
  v36[0] = v22;
  v36[1] = 3221225472;
  v36[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_6;
  v36[3] = &unk_1E513C6D0;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870947, v36);
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_7;
  v34[3] = &unk_1E513C6D0;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870945, v34);
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_8;
  v32[3] = &unk_1E513C6D0;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v21, "registerReusableObjectForReuseIdentifier:creationHandler:", 8870950, v32);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMAssetsViewController;
  -[PXCMMAssetsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXScrollViewController registerObserver:](self->_scrollViewController, "registerObserver:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMAssetsViewController;
  -[PXCMMAssetsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PXScrollViewController unregisterObserver:](self->_scrollViewController, "unregisterObserver:", self);
}

- (id)_createPosterTileController
{
  void *v3;
  PXCMMPosterTileController *v4;
  uint64_t v5;
  void *v6;
  PXCMMPosterTileController *v7;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXCMMPosterTileController alloc];
  v5 = objc_msgSend(v3, "activityType");
  objc_msgSend(v3, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXCMMPosterTileController initWithActivityType:viewModel:momentShareStatusPresentation:](v4, "initWithActivityType:viewModel:momentShareStatusPresentation:", v5, v6, self->_momentShareStatusPresentationForPoster);

  return v7;
}

- (id)_createStatusFooter
{
  PXPhotosGlobalFooterView *v3;
  PXPhotosGlobalFooterView *v4;
  PXCMMTileReusableView *v5;

  v3 = [PXPhotosGlobalFooterView alloc];
  v4 = -[PXPhotosGlobalFooterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PXPhotosGlobalFooterView setViewModel:](v4, "setViewModel:", self->_statusFooterViewModel);
  -[PXPhotosGlobalFooterView setDelegate:](v4, "setDelegate:", self);
  v5 = -[PXCMMTileReusableView initWithView:]([PXCMMTileReusableView alloc], "initWithView:", v4);

  return v5;
}

- (id)_createBannerTileController
{
  void *v3;
  PXCMMBannerTileController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PXMomentShareStatusPresentation *momentShareStatusPresentationForPoster;
  void *v9;
  PXCMMBannerTileController *v10;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXCMMBannerTileController alloc];
  v5 = objc_msgSend(v3, "activityType");
  v6 = objc_msgSend(v3, "sourceType");
  objc_msgSend(v3, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  momentShareStatusPresentationForPoster = self->_momentShareStatusPresentationForPoster;
  objc_msgSend(v3, "importStatusManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXCMMBannerTileController initWithActivityType:sourceType:viewModel:momentShareStatusPresentation:importStatusManager:](v4, "initWithActivityType:sourceType:viewModel:momentShareStatusPresentation:importStatusManager:", v5, v6, v7, momentShareStatusPresentationForPoster, v9);

  -[PXCMMBannerTileController setDelegate:](v10, "setDelegate:", self);
  return v10;
}

- (id)_createAddButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXCMMTileReusableView *v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v6);

  objc_msgSend(v4, "setImage:forState:", v3, 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_addButtonTapped_, 64);
  v7 = -[PXCMMTileReusableView initWithView:]([PXCMMTileReusableView alloc], "initWithView:", v4);

  return v7;
}

- (id)_createSectionHeaderController
{
  void *v3;
  PXCMMSectionHeaderController *v4;
  uint64_t v5;
  void *v6;
  PXMomentShareStatusPresentation *momentShareStatusPresentationForFooter;
  void *v8;
  PXCMMSectionHeaderController *v9;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXCMMSectionHeaderController alloc];
  v5 = objc_msgSend(v3, "activityType");
  objc_msgSend(v3, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  momentShareStatusPresentationForFooter = self->_momentShareStatusPresentationForFooter;
  objc_msgSend(v3, "importStatusManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXCMMSectionHeaderController initWithActivityType:viewModel:momentShareStatusPresentation:importStatusManager:](v4, "initWithActivityType:viewModel:momentShareStatusPresentation:importStatusManager:", v5, v6, momentShareStatusPresentationForFooter, v8);

  return v9;
}

- (id)_createStatusPlaceholderTileView
{
  id v3;
  void *v4;
  void *v5;
  PXCMMTileReusableView *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC36B0]);
  -[PXStatusController configuration](self->_statusController, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithConfiguration:", v4);

  v6 = -[PXCMMTileReusableView initWithView:]([PXCMMTileReusableView alloc], "initWithView:", v5);
  return v6;
}

- (id)_createStatusBadgeTileView
{
  return objc_alloc_init(PXCMMAssetStatusBadgeView);
}

- (id)_createOverlayTileView
{
  id v2;
  PXCMMTileReusableView *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  v3 = -[PXCMMTileReusableView initWithView:]([PXCMMTileReusableView alloc], "initWithView:", v2);

  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateAssetsScene);
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $B54E03000EEEC32185C6E76E4CA34543 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->shouldShowAddMoreButton = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didTapAddMoreButton = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->oneUpPresentation = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setUserSelectionEnabled:(BOOL)a3
{
  if (self->_userSelectionEnabled != a3)
  {
    self->_userSelectionEnabled = a3;
    -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateGestures);
  }
}

- (void)_setHiddenAssetReferences:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  v4 = (NSSet *)a3;
  if (v4)
  {
    v7 = v4;
    if (-[NSSet count](v4, "count"))
    {
      v5 = v7;
      goto LABEL_6;
    }

  }
  v5 = 0;
LABEL_6:
  if (self->__hiddenAssetReferences != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__hiddenAssetReferences, v5);
    -[PXAssetsScene targetLayout](self->_sceneController, "targetLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMAssetsViewController _configureLayout:](self, "_configureLayout:", v6);

    v5 = v8;
  }

}

- (id)_indexPathsForAssetReferences:(id)a3 inDataSource:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (v6 && v7)
  {
    v8 = objc_alloc_init((Class)off_1E50B3668);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v17 = 0u;
          v18 = 0u;
          objc_msgSend(v6, "indexPathForAssetReference:", v14);
          v16[0] = v17;
          v16[1] = v18;
          objc_msgSend(v8, "addIndexPath:", v16);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (void)_updateStyle
{
  void *v3;
  id v4;

  -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMSpec reviewBackgroundColor](self->_spec, "reviewBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)_updateGestures
{
  PXUITapGestureRecognizer *v3;
  PXUITapGestureRecognizer *tapSelectionGesture;
  void *v5;
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *longPressGesture;
  void *v8;
  void *v9;
  int v10;
  PXSwipeSelectionManager *swipeSelectionManager;
  PXSwipeSelectionManager *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXSwipeSelectionManager *v17;
  PXSwipeSelectionManager *v18;
  PXSwipeSelectionManager *v19;
  PXUITapGestureRecognizer *layoutTransitionGesture;
  PXUITapGestureRecognizer *v21;
  PXUITapGestureRecognizer *v22;
  id v23;

  if (!self->_tapSelectionGesture)
  {
    v3 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTap_);
    tapSelectionGesture = self->_tapSelectionGesture;
    self->_tapSelectionGesture = v3;

    -[PXUITapGestureRecognizer setNumberOfTapsRequired:](self->_tapSelectionGesture, "setNumberOfTapsRequired:", 1);
    -[PXCMMAssetsViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->_tapSelectionGesture);

  }
  if (!self->_longPressGesture)
  {
    v6 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPress_);
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = v6;

    -[PXCMMAssetsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", self->_longPressGesture);

  }
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowSwipeSelection");

  if (v10)
  {
    swipeSelectionManager = self->_swipeSelectionManager;
    if (self->_userSelectionEnabled)
    {
      if (!swipeSelectionManager)
      {
        v12 = [PXSwipeSelectionManager alloc];
        -[PXCMMComponentViewController session](self, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "selectionManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PXSwipeSelectionManager initWithSelectionManager:scrollView:](v12, "initWithSelectionManager:scrollView:", v15, v16);
        v18 = self->_swipeSelectionManager;
        self->_swipeSelectionManager = v17;

        -[PXSwipeSelectionManager setDelegate:](self->_swipeSelectionManager, "setDelegate:", self);
      }
    }
    else
    {
      -[PXSwipeSelectionManager setDelegate:](swipeSelectionManager, "setDelegate:", 0);
      v19 = self->_swipeSelectionManager;
      self->_swipeSelectionManager = 0;

    }
  }
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "allowLayoutTransitionGesture"))
  {
    layoutTransitionGesture = self->_layoutTransitionGesture;

    if (layoutTransitionGesture)
      return;
    v21 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__transitionLayoutGesture_);
    v22 = self->_layoutTransitionGesture;
    self->_layoutTransitionGesture = v21;

    -[PXUITapGestureRecognizer setNumberOfTapsRequired:](self->_layoutTransitionGesture, "setNumberOfTapsRequired:", 2);
    -[PXCMMAssetsViewController view](self, "view");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addGestureRecognizer:", self->_layoutTransitionGesture);
  }

}

- (void)_transitionLayoutGesture:(id)a3
{
  unint64_t v4;
  uint64_t v5;

  v4 = -[PXCMMAssetsViewController _layoutType](self, "_layoutType", a3);
  if (v4 > 4)
    v5 = 0;
  else
    v5 = qword_1A7C0AF00[v4];
  -[PXCMMAssetsViewController _setLayoutType:](self, "_setLayoutType:", v5);
}

- (PXAssetReference)_focusedAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0DC37E0];
  -[PXCMMAssetsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystemForEnvironment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parentFocusEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusItemContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "frame");
    PXRectGetCenter();
    v11 = v10;
    v13 = v12;
    -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v14, v11, v13);
    v16 = v15;
    v18 = v17;

    -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v16, v18, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return (PXAssetReference *)v19;
}

- (void)setActionInProgress:(BOOL)a3
{
  _BOOL4 v3;
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXCMMAssetsViewController_setActionInProgress___block_invoke;
  aBlock[3] = &unk_1E5149198;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_actionInProgress == v3)
  {
    if (!v3)
      goto LABEL_8;
LABEL_6:
    v5[2](v5);
    goto LABEL_8;
  }
  self->_actionInProgress = v3;
  -[PXCMMComponentViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activityType");

  if (v7 == 2)
  {
    if (!v3)
    {
      -[PXCMMAssetsViewController _selectNonCopiedAssets](self, "_selectNonCopiedAssets");
      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_8:

}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  PXUIScrollViewController *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PXAssetReference *v23;
  PXAssetReference *navigatedAssetReference;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PXCMMComponentViewController session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "isSelecting");
    v8 = objc_msgSend(v6, "oneUpDisabled");
    v9 = self->_scrollViewController;
    -[PXUIScrollViewController contentCoordinateSpace](v9, "contentCoordinateSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_locationInCoordinateSpace:", v10);
    v12 = v11;
    v14 = v13;

    if (v7)
    {
      v30 = 0u;
      v31 = 0u;
      -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v12, v14, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
      if (*(_QWORD *)off_1E50B7E98)
      {
        v28 = v30;
        v29 = v31;
        if (-[PXCMMAssetsViewController _isAssetAlreadyImportedAtIndexPath:](self, "_isAssetAlreadyImportedAtIndexPath:", &v28))
        {
          -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dataSource");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v30;
          v29 = v31;
          objc_msgSend(v26, "assetAtItemIndexPath:", &v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "mediaType");
          PXLocalizedAssetMessageForUsage(v16, 0, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PXLocalizedAssetMessageForUsage(v16, 0, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0DC3448];
          PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addAction:", v22);

          -[PXCMMAssetsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
        }
        else
        {
          v28 = v30;
          v29 = v31;
          -[PXCMMAssetsViewController _toggleAssetSelectionAtIndexPath:](self, "_toggleAssetSelectionAtIndexPath:", &v28);
        }
      }
    }
    else if ((v8 & 1) == 0)
    {
      -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v12, v14, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
      v23 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
      navigatedAssetReference = self->_navigatedAssetReference;
      self->_navigatedAssetReference = v23;

      if (self->_navigatedAssetReference)
      {
        -[PXCMMAssetsViewController _oneUpPresentation](self, "_oneUpPresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "startWithConfigurationHandler:", 0);

      }
    }

  }
}

- (void)_handleLongPress:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PXAssetReference *v9;
  PXAssetReference *navigatedAssetReference;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 1)
  {
    -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_locationInCoordinateSpace:", v4);
    v6 = v5;
    v8 = v7;

    -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v6, v8, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
    v9 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
    navigatedAssetReference = self->_navigatedAssetReference;
    self->_navigatedAssetReference = v9;

    if (self->_navigatedAssetReference)
    {
      -[PXCMMAssetsViewController _oneUpPresentation](self, "_oneUpPresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startWithConfigurationHandler:", 0);

    }
  }

}

- (void)_handleSpaceBar:(id)a3
{
  PXAssetReference *v4;
  PXAssetReference *navigatedAssetReference;
  id v6;

  -[PXCMMAssetsViewController _focusedAssetReference](self, "_focusedAssetReference", a3);
  v4 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
  navigatedAssetReference = self->_navigatedAssetReference;
  self->_navigatedAssetReference = v4;

  if (self->_navigatedAssetReference)
  {
    -[PXCMMAssetsViewController _oneUpPresentation](self, "_oneUpPresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startWithConfigurationHandler:", 0);

  }
}

- (void)_toggleAssetSelectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  char v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  char v14;
  _OWORD v15[2];

  -[PXCMMComponentViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v8;
  v9 = objc_msgSend(v7, "isIndexPathSelected:", v15);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PXCMMAssetsViewController__toggleAssetSelectionAtIndexPath___block_invoke;
  v11[3] = &__block_descriptor_65_e37_v16__0___PXMutableSelectionManager__8l;
  v14 = v9 ^ 1;
  v10 = *(_OWORD *)&a3->item;
  v12 = *(_OWORD *)&a3->dataSourceIdentifier;
  v13 = v10;
  objc_msgSend(v6, "performChanges:", v11);

}

- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  if (!*(_QWORD *)off_1E50B7E98)
    return 0;
  -[PXCMMComponentViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(v8, "assetReferenceAtItemIndexPath:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4
{
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:kind:](self, "_assetIndexPathAtLocation:padding:kind:", 6432423, a4.x, a4.y, a5.top, a5.left, a5.bottom, a5.right);
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4 kind:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  PXSimpleIndexPath *result;
  __int128 v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v15 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v15;
  -[PXCMMComponentViewController session](self, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataSourceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "identifier");

  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  -[PXAssetsScene tilingController](self->_sceneController, "tilingController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__PXCMMAssetsViewController__assetIndexPathAtLocation_padding_kind___block_invoke;
  v24[3] = &__block_descriptor_48_e355_B504__0_PXTileIdentifier_Q_10Q__8_v96_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_104_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_296Q488___NSObject__496l;
  v24[4] = a6;
  v24[5] = v19;
  if (v20)
  {
    objc_msgSend(v20, "hitTestTileAtPoint:padding:passingTest:", v24, x, y, top, left, bottom, right);
  }
  else
  {
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }

  if ((_QWORD)v25)
  {
    if (*((_QWORD *)&v25 + 1) == a6)
    {
      v23 = v27;
      *(_OWORD *)&retstr->dataSourceIdentifier = v26;
      *(_OWORD *)&retstr->item = v23;
    }
  }
  return result;
}

- (int64_t)_assetImportStateAtIndexPath:(PXSimpleIndexPath *)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  int64_t v11;
  _OWORD v13[2];

  v6 = a4;
  -[PXCMMComponentViewController session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "importStatusManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_OWORD *)&a3->item;
    v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v13[1] = v9;
    objc_msgSend(v6, "assetAtItemIndexPath:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_msgSend(v8, "importStateForAsset:", v10);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  __int128 v6;
  _OWORD v8[2];

  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v6;
  LOBYTE(a3) = -[PXCMMAssetsViewController _isAssetAlreadyImportedAtIndexPath:withEngineDrivenLayout:](self, "_isAssetAlreadyImportedAtIndexPath:withEngineDrivenLayout:", v8, v5);

  return (char)a3;
}

- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3 withEngineDrivenLayout:(id)a4
{
  void *v6;
  __int128 v7;
  int64_t v8;
  _OWORD v10[2];

  objc_msgSend(a4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v7;
  v8 = -[PXCMMAssetsViewController _assetImportStateAtIndexPath:withDataSource:](self, "_assetImportStateAtIndexPath:withDataSource:", v10, v6);

  return (unint64_t)(v8 - 1) < 2;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a5.y;
  x = a5.x;
  -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager scrollView](self->_swipeSelectionManager, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v10, x, y);
  v12 = v11;
  v14 = v13;

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v12, v14, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  y = a5.y;
  x = a5.x;
  -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager scrollView](self->_swipeSelectionManager, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v10, x, y);
  v12 = v11;
  v14 = v13;

  -[PXSwipeSelectionManager scrollView](self->_swipeSelectionManager, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v12, v14, v16, v17, v18, v19);
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y;
  double x;
  PXUIScrollViewController *scrollViewController;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  y = a5.y;
  x = a5.x;
  scrollViewController = self->_scrollViewController;
  v10 = a4;
  -[PXUIScrollViewController contentCoordinateSpace](scrollViewController, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager scrollView](self->_swipeSelectionManager, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v12, x, y);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v10, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "frame");
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v14, v16, v18, v19, v20, v21);
}

- (BOOL)swipeSelectionManager:(id)a3 shouldSelectItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a4->item;
  v6[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v6[1] = v4;
  return !-[PXCMMAssetsViewController _isAssetAlreadyImportedAtIndexPath:](self, "_isAssetAlreadyImportedAtIndexPath:", v6);
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[PXCMMComponentViewController session](self, "session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSelecting");

  return v5;
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  void *v3;
  id v4;

  -[PXCMMComponentViewController session](self, "session", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_233_242343);

}

- (void)addButtonTapped:(id)a3
{
  id v4;

  if (self->_delegateRespondsTo.didTapAddMoreButton)
  {
    -[PXCMMAssetsViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didTapAddMoreButtonForAssetsViewController:", self);

  }
}

- (void)_selectionModeDidChange
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PXCMMComponentViewController session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "activityType");
  if (objc_msgSend(v3, "isSelecting"))
  {
    -[PXCMMAssetsViewController setUserSelectionEnabled:](self, "setUserSelectionEnabled:", 1);
    if (v4 != 1)
    {
      if (v4 != 2)
        goto LABEL_9;
      goto LABEL_6;
    }
LABEL_8:
    -[PXCMMAssetsViewController _selectAllAssets](self, "_selectAllAssets");
    goto LABEL_9;
  }
  -[PXCMMAssetsViewController setUserSelectionEnabled:](self, "setUserSelectionEnabled:", 0);
  if (v4 != 2)
  {
    if (v4 != 1)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_6:
  -[PXCMMAssetsViewController _selectNonCopiedAssets](self, "_selectNonCopiedAssets");
LABEL_9:
  -[PXCMMAssetsViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");

}

- (void)_updatePlaceholder
{
  -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
  if (!-[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder"))
    -[PXCMMAssetsViewController _performInitialSelectionIfNeeded](self, "_performInitialSelectionIfNeeded");
}

- (void)_updateSelectionIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PXCMMComponentViewController session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "activityType");
  if ((objc_msgSend(v3, "isSelecting") & 1) == 0 && v4 == 2)
    -[PXCMMAssetsViewController _selectNonCopiedAssets](self, "_selectNonCopiedAssets");

}

- (PXOneUpPresentation)_oneUpPresentation
{
  void *v3;
  void *v4;

  if (self->_delegateRespondsTo.oneUpPresentation)
  {
    -[PXCMMAssetsViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationForAssetsViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setDelegate:", self);
  }
  else
  {
    v4 = 0;
  }
  return (PXOneUpPresentation *)v4;
}

- (BOOL)_shouldShowDefaultOneUpActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sourceType") || objc_msgSend(v3, "activityType") != 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[PXCMMComponentViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSelecting") ^ 1;

  }
  return v6;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 17;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  v4 = -[PXCMMAssetsViewController _shouldShowDefaultOneUpActions](self, "_shouldShowDefaultOneUpActions", a3);
  -[PXCMMComponentViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isSelecting") & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    -[PXCMMComponentViewController session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activityType");

    v7 = 1;
    if (v9 == 2)
      v7 = 2;
  }
  if (v4)
    v10 = 0;
  else
    v10 = v7;

  return v10;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v3;
  void *v4;

  -[PXCMMComponentViewController session](self, "session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  void *v3;
  void *v4;

  -[PXCMMComponentViewController session](self, "session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createSelectionManagerWithAssetReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  if (a3)
    objc_msgSend(a3, "indexPath");
  v12[0] = v13;
  v12[1] = v14;
  objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMComponentViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PXCMMAssetsViewController__createSelectionManagerWithAssetReference___block_invoke;
  v10[3] = &unk_1E513C668;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "performChanges:", v10);

  return v7;
}

- (id)_assetActionManagerWithSelectionManager:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  PXPhotoKitAssetActionManager *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  __CFString **v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXCMMComponentViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v5);
    -[PXActionManager setPerformerDelegate:](v10, "setPerformerDelegate:", self);
    v11 = v6;
    v12 = objc_msgSend(v11, "activityType");
    objc_msgSend(v11, "importStatusManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != 2)
      goto LABEL_5;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXPhotoKitImportStatusManager *_ImportStatusManagerForSession(PXCMMSession *__strong)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXCMMAssetsViewController.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("session.importStatusManager"), v25, v27);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXPhotoKitImportStatusManager *_ImportStatusManagerForSession(PXCMMSession *__strong)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXCMMAssetsViewController.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("session.importStatusManager"), v25);
    }

LABEL_5:
    -[PXPhotoKitAssetActionManager setImportStatusManager:](v10, "setImportStatusManager:", v13);

    objc_msgSend(v11, "importSessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setImportSessionID:](v10, "setImportSessionID:", v14);

    v15 = objc_msgSend(v7, "isSelecting");
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v17, "addObject:", CFSTR("PXAssetActionTypeAddToLibrary"));
    if ((v15 & 1) != 0)
    {
      v18 = PXAssetActionTypeToggleSelection;
    }
    else
    {
      if ((objc_msgSend(v16, "disablePrintAction") & 1) == 0)
        objc_msgSend(v17, "addObject:", CFSTR("PXAssetActionTypePrint"));
      if ((objc_msgSend(v16, "disableShareAction") & 1) == 0)
        objc_msgSend(v17, "addObject:", CFSTR("PXAssetActionTypeShare"));
      if ((objc_msgSend(v16, "disableShowInAllPhotosAction") & 1) == 0)
        objc_msgSend(v17, "addObject:", CFSTR("PXAssetActionTypeShowInLibrary"));
      if ((objc_msgSend(v16, "disableCopyAction") & 1) != 0)
        goto LABEL_19;
      v18 = PXAssetActionTypeCopy;
    }
    objc_msgSend(v17, "addObject:", *v18);
LABEL_19:
    -[PXActionManager setAllowedActionTypes:](v10, "setAllowedActionTypes:", v17);

    goto LABEL_20;
  }
  PLSharingGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v20;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "%@: Unable to provide action manager because data source manager is not of type PXPhotoKitAssetsDataSourceManager.", buf, 0xCu);

  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (id)oneUpPresentationActionManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[PXCMMAssetsViewController _shouldShowDefaultOneUpActions](self, "_shouldShowDefaultOneUpActions", a3))
  {
    v4 = 0;
  }
  else
  {
    -[PXCMMComponentViewController session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSelecting");

    if (v7)
    {
      -[PXCMMComponentViewController session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (self->_navigatedAssetReference)
    {
      -[PXCMMAssetsViewController _createSelectionManagerWithAssetReference:](self, "_createSelectionManagerWithAssetReference:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[PXCMMAssetsViewController _assetActionManagerWithSelectionManager:](self, "_assetActionManagerWithSelectionManager:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  void *v4;
  void *v5;

  if (self->_navigatedAssetReference)
  {
    -[PXCMMAssetsViewController _createSelectionManagerWithAssetReference:](self, "_createSelectionManagerWithAssetReference:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMAssetsViewController _assetActionManagerWithSelectionManager:](self, "_assetActionManagerWithSelectionManager:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PXAssetReference *v20;
  PXAssetReference *navigatedAssetReference;

  v5 = a4;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "disableClickyOrb") & 1) != 0)
  {
    v7 = 0;
LABEL_6:

    goto LABEL_7;
  }
  -[PXCMMComponentViewController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSelecting");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v6);
    v12 = v11;
    v14 = v13;
    -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:fromCoordinateSpace:", v6, v12, v14);
    v17 = v16;
    v19 = v18;

    -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v17, v19, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    v20 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
    navigatedAssetReference = self->_navigatedAssetReference;
    self->_navigatedAssetReference = v20;

    v7 = v20 != 0;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[PXCMMComponentViewController session](self, "session", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSelecting") ^ 1;

  return v6;
}

- (id)oneUpPresentationImportStatusManager:(id)a3
{
  void *v3;
  void *v4;

  -[PXCMMComponentViewController session](self, "session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importStatusManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_navigatedAssetReference;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  PXTilingController *tilingController;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  id v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGRect v71;
  CGRect v72;

  v5 = a4;
  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXCMMComponentViewController session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXScrollViewController updateIfNeeded](self->_scrollViewController, "updateIfNeeded");
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v11, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "indexPathForAssetReference:", v5);
  }
  else
  {
    v69 = 0u;
    v70 = 0u;
  }
  v14 = *(double *)off_1E50B86D0;
  v15 = *((double *)off_1E50B86D0 + 1);
  v16 = *((double *)off_1E50B86D0 + 2);
  v17 = *((double *)off_1E50B86D0 + 3);

  v18 = v69;
  if ((_QWORD)v69 != *(_QWORD *)off_1E50B7E98)
  {
    v19 = *((_QWORD *)&v69 + 1);
    v20 = v70;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    tilingController = self->_tilingController;
    v45 = xmmword_1A7C0C200;
    v46 = v69;
    v47 = v70;
    v48 = 0u;
    v49 = 0u;
    *(_QWORD *)&v50 = 0;
    if (-[PXTilingController getTile:geometry:group:userData:forTileWithIdentifier:](tilingController, "getTile:geometry:group:userData:forTileWithIdentifier:", 0, &v57, 0, 0, &v45))
    {
      v7 = *((double *)&v57 + 1);
      v6 = *(double *)&v57;
      v9 = *((double *)&v58 + 1);
      v8 = *(double *)&v58;
      v14 = *((double *)&v66 + 1);
      v16 = *((double *)&v67 + 1);
      v15 = *(double *)&v67;
      v17 = *(double *)&v68;
    }
    v71.origin.x = v6;
    v71.origin.y = v7;
    v71.size.width = v8;
    v71.size.height = v9;
    if (CGRectIsNull(v71))
    {
      v37 = v5;
      -[PXAssetsScene currentLayout](self->_sceneController, "currentLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v69;
      objc_msgSend(v22, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "identifier");

      if (v23 == v25)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v38 = xmmword_1A7C0C200;
        v39 = v18;
        v40 = v19;
        v41 = v20;
        v42 = 0u;
        v43 = 0u;
        v44 = 0;
        if (objc_msgSend(v22, "getGeometry:group:userData:forTileWithIdentifier:", &v45, 0, 0, &v38))
        {
          +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v22, "coordinateSpaceIdentifier");
          v28 = -[PXTilingController contentCoordinateSpaceIdentifier](self->_tilingController, "contentCoordinateSpaceIdentifier");
          objc_msgSend(v26, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v27, v28, v45, v46);
          v6 = v29;
          v7 = v30;
          v8 = v31;
          v9 = v32;

        }
      }
      v5 = v37;

    }
  }
  v72.origin.x = v6;
  v72.origin.y = v7;
  v72.size.width = v8;
  v72.size.height = v9;
  if (CGRectIsNull(v72))
  {
    v33 = 0;
  }
  else
  {
    v34 = objc_alloc((Class)off_1E50B4620);
    -[PXUIScrollViewController contentCoordinateSpace](self->_scrollViewController, "contentCoordinateSpace");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v34, "initWithRect:inCoordinateSpace:", v35, v6, v7, v8, v9);

    objc_msgSend(v33, "setImageContentsRect:", v14, v15, v16, v17);
  }

  return v33;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5;
  void *v6;
  void *v7;
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
  __int128 v19;
  CGSize v20;
  double v21;
  CGFloat v22;
  double v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  CGSize v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[2];
  CGRect v44;
  CGRect v45;

  v5 = a4;
  -[PXScrollViewController updateIfNeeded](self->_scrollViewController, "updateIfNeeded");
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  memset(v43, 0, sizeof(v43));
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "indexPathForAssetReference:", v5);
  else
    memset(v43, 0, sizeof(v43));

  if (*(_QWORD *)&v43[0] != *(_QWORD *)off_1E50B7E98)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = (CGSize)0;
    v24 = xmmword_1A7C0C200;
    v25 = *(_QWORD *)&v43[0];
    v26 = *(_OWORD *)((char *)v43 + 8);
    v27 = *((_QWORD *)&v43[1] + 1);
    v28 = 0u;
    v29 = 0u;
    v30 = 0;
    if (objc_msgSend(v7, "getGeometry:group:userData:forTileWithIdentifier:", &v31, 0, 0, &v24))
    {
      -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      -[PXScrollViewController contentInset](self->_scrollViewController, "contentInset");
      PXEdgeInsetsInsetRect();
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = v31;
      v20 = v32;
      -[PXScrollViewController contentInset](self->_scrollViewController, "contentInset");
      v22 = *(double *)&v19 + v21;
      -[PXScrollViewController contentInset](self->_scrollViewController, "contentInset");
      v45.origin.y = *((double *)&v19 + 1) + v23;
      v44.origin.x = v12;
      v44.origin.y = v14;
      v44.size.width = v16;
      v44.size.height = v18;
      v45.origin.x = v22;
      v45.size = v20;
      if (!CGRectIntersectsRect(v44, v45))
        objc_msgSend(v10, "px_scrollToContentOffset:animated:", 0, v31);

    }
  }

}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXTilingController *tilingController;
  id v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  id v21;
  _OWORD v22[2];

  v5 = a4;
  -[PXScrollViewController updateIfNeeded](self->_scrollViewController, "updateIfNeeded");
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  memset(v22, 0, sizeof(v22));
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "indexPathForAssetReference:", v5);
  else
    memset(v22, 0, sizeof(v22));

  if (*(_QWORD *)&v22[0] == *(_QWORD *)off_1E50B7E98)
  {
    v10 = 0;
  }
  else
  {
    tilingController = self->_tilingController;
    v20 = 0;
    v21 = 0;
    v14 = xmmword_1A7C0C200;
    v15 = *(_QWORD *)&v22[0];
    v16 = *(_OWORD *)((char *)v22 + 8);
    v17 = *((_QWORD *)&v22[1] + 1);
    v18 = 0u;
    v19 = 0u;
    v10 = 0;
    if (-[PXTilingController getTile:geometry:group:userData:forTileWithIdentifier:](tilingController, "getTile:geometry:group:userData:forTileWithIdentifier:", &v21, 0, 0, 0, &v14))
    {
      v12 = v21;
      if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EEAEAF60))
      {
        objc_msgSend(v12, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
  }

  return v10;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXCMMComponentViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v8, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PXCMMAssetsViewController_oneUpPresentation_setHiddenAssetReferences___block_invoke;
  v17[3] = &unk_1E5148D08;
  v17[4] = self;
  v18 = v9;
  v16 = v9;
  -[PXCMMAssetsViewController _performTilingChangeWithoutAnimationTransition:](self, "_performTilingChangeWithoutAnimationTransition:", v17);

}

- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  return -[PXUIScrollViewController scrollView](self->_scrollViewController, "scrollView", a3, a4);
}

- (void)_setLayoutType:(int64_t)a3
{
  if (self->__layoutType != a3)
  {
    self->__layoutType = a3;
    -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
  }
}

- (void)_performTilingChangeWithoutAnimationTransition:(id)a3
{
  BOOL layoutAnimationsGloballyDisabled;

  layoutAnimationsGloballyDisabled = self->_layoutAnimationsGloballyDisabled;
  self->_layoutAnimationsGloballyDisabled = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  -[PXScrollViewController updateIfNeeded](self->_scrollViewController, "updateIfNeeded");
  self->_layoutAnimationsGloballyDisabled = layoutAnimationsGloballyDisabled;
}

- (unint64_t)_additionalTileCount
{
  void *v3;
  int64_t v4;
  unint64_t v5;

  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldShowInlineAddButton"))
  {
    v4 = -[PXCMMAssetsViewController _layoutType](self, "_layoutType");

    if (v4 == 1 || !self->_delegateRespondsTo.shouldShowAddMoreButton)
      return 0;
    -[PXCMMAssetsViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "shouldShowAddMoreButtonForAssetsViewController:", self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_invalidateLayoutGenerator
{
  PXLayoutGenerator *layoutGenerator;
  PXSectionedLayoutEngine *layoutEngine;

  layoutGenerator = self->_layoutGenerator;
  self->_layoutGenerator = 0;

  layoutEngine = self->_layoutEngine;
  self->_layoutEngine = 0;

  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateLayoutEngine);
}

- (id)_createNewLayout
{
  void *v4;
  void *v5;
  double width;
  double height;
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
  PXCMMEngineDrivenLayoutConfiguration *v22;
  PXCMMEngineDrivenLayout *v23;
  void *v25;

  -[PXLayoutEngine layoutSnapshot](self->_layoutEngine, "layoutSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 1278, CFSTR("The layout engine should always return a layoutSnapshot."));

      v4 = 0;
    }
  }
  width = self->_knownReferenceSize.width;
  height = self->_knownReferenceSize.height;
  -[PXCMMSpec reviewContentInsets](self->_spec, "reviewContentInsets");
  -[PXCMMSpec reviewSafeAreaInsets](self->_spec, "reviewSafeAreaInsets");
  PXEdgeInsetsAdd();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXCMMAssetsViewController _headerHeightFromReferenceSize:insets:](self, "_headerHeightFromReferenceSize:insets:", width, height, v8, v10, v12, v14);
  v17 = v16;
  -[PXCMMAssetsViewController _bannerHeightFromReferenceSize:](self, "_bannerHeightFromReferenceSize:", width, height);
  v19 = v18;
  -[PXCMMAssetsViewController _statusFooterHeightFromReferenceSize:insets:](self, "_statusFooterHeightFromReferenceSize:insets:", width, height, v9, v11, v13, v15);
  v21 = v20;
  v22 = objc_alloc_init(PXCMMEngineDrivenLayoutConfiguration);
  -[PXCMMEngineDrivenLayoutConfiguration setLayoutType:](v22, "setLayoutType:", -[PXCMMAssetsViewController _layoutType](self, "_layoutType"));
  -[PXCMMEngineDrivenLayoutConfiguration setHeaderHeight:](v22, "setHeaderHeight:", v17);
  -[PXCMMEngineDrivenLayoutConfiguration setBannerHeight:](v22, "setBannerHeight:", v19);
  -[PXCMMEngineDrivenLayoutConfiguration setStatusFooterHeight:](v22, "setStatusFooterHeight:", v21);
  v23 = -[PXCMMEngineDrivenLayout initWithLayoutEngineSnapshot:configuration:]([PXCMMEngineDrivenLayout alloc], "initWithLayoutEngineSnapshot:configuration:", v4, v22);
  -[PXEngineDrivenAssetsTilingLayout setDelegate:](v23, "setDelegate:", self);
  -[PXCMMAssetsViewController _configureLayout:](self, "_configureLayout:", v23);

  return v23;
}

- (void)_configureLayout:(id)a3
{
  uint64_t v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 1302, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 1302, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v16);
  }

LABEL_3:
  objc_msgSend(v19, "setPlaceholderMode:", -[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder"));
  objc_msgSend(v19, "setContentMode:", -[PXCMMSpec reviewGridContentMode](self->_spec, "reviewGridContentMode"));
  if (self->_userSelectionEnabled)
    v5 = 1025;
  else
    v5 = 0;
  objc_msgSend(v19, "setSelectionBadgeOptions:", v5);
  objc_msgSend(v19, "setBadgeOptions:", 3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  objc_msgSend(v19, "setHasFloatingBanner:", !IsAccessibilityCategory);
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHasFloatingSectionHeaders:", objc_msgSend(v9, "sectionHeadersShouldFloat"));

  -[PXCMMSpec reviewContentInsets](self->_spec, "reviewContentInsets");
  objc_msgSend(v19, "setHeaderFooterSideInset:", v10);
  -[PXCMMSpec reviewHeaderTopInset](self->_spec, "reviewHeaderTopInset");
  objc_msgSend(v19, "setHeaderTopInset:");
  -[PXCMMSpec reviewFooterBottomInset](self->_spec, "reviewFooterBottomInset");
  objc_msgSend(v19, "setFooterBottomInset:");
  -[PXCMMAssetsViewController _progressBannerViewLayoutHeight](self, "_progressBannerViewLayoutHeight");
  -[PXCMMSpec reviewSafeAreaInsets](self->_spec, "reviewSafeAreaInsets");
  objc_msgSend(v19, "setReviewSafeAreaInsets:");
  -[PXCMMAssetsViewController _hiddenAssetReferences](self, "_hiddenAssetReferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMAssetsViewController _indexPathsForAssetReferences:inDataSource:](self, "_indexPathsForAssetReferences:inDataSource:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setHiddenIndexPaths:", v13);
}

- (id)_createNewLayoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  int64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "showSectionHeaders"))
  {
    v7 = -[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder");

    v8 = 0.0;
    if (!v7)
    {
      -[PXCMMSpec reviewSectionHeaderHeight](self->_spec, "reviewSectionHeaderHeight");
      v8 = v9;
    }
  }
  else
  {

    v8 = 0.0;
  }
  v10 = -[PXCMMAssetsViewController _layoutType](self, "_layoutType");
  v11 = -[PXCMMAssetsViewController _additionalTileCount](self, "_additionalTileCount");
  -[PXCMMSpec reviewGridItemSize](self->_spec, "reviewGridItemSize");
  v13 = v12;
  v15 = v14;
  -[PXCMMSpec reviewGridInterItemSpacing](self->_spec, "reviewGridInterItemSpacing");
  v17 = v16;
  v19 = v18;
  -[PXCMMSpec reviewGridContentInsets](self->_spec, "reviewGridContentInsets");
  return +[PXCMMLayoutGenerator layoutGeneratorForLayoutType:withReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:](PXCMMLayoutGenerator, "layoutGeneratorForLayoutType:withReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:", v10, v11, width, height, v8, v13, v15, v17, v19, v20, v21, v22, v23);
}

- (double)_headerHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showAttachedHeaderView");

  if (!v6)
    return 0.0;
  PXEdgeInsetsInsetSize();
  v8 = v7;
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMAssetsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCMMPosterTileController preferredHeightForWidth:traitCollection:screen:](PXCMMPosterTileController, "preferredHeightForWidth:traitCollection:screen:", v10, v13, v8);
  v15 = v14;

  return v15;
}

- (double)_bannerHeightFromReferenceSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  double v8;
  PXMomentShareStatusPresentation *momentShareStatusPresentationForPoster;
  uint64_t v10;
  void *v11;
  PXCMMBannerTileController *measuringBannerTile;
  PXCMMBannerTileController *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PXMomentShareStatusPresentation *v17;
  void *v18;
  PXCMMBannerTileController *v19;
  PXCMMBannerTileController *v20;
  void *v21;
  double v22;

  height = a3.height;
  width = a3.width;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showFloatingBanner");

  v8 = 0.0;
  if (v7)
  {
    momentShareStatusPresentationForPoster = self->_momentShareStatusPresentationForPoster;
    if (!momentShareStatusPresentationForPoster
      || (v10 = -[PXMomentShareStatusPresentation type](momentShareStatusPresentationForPoster, "type")) != 0
      && (v10 != 1
       || (-[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentationForPoster, "state") & 0xFFFFFFFFFFFFFFFDLL) != 4
       && !-[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder")))
    {
      -[PXCMMComponentViewController session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      measuringBannerTile = self->_measuringBannerTile;
      if (!measuringBannerTile)
      {
        v13 = [PXCMMBannerTileController alloc];
        v14 = objc_msgSend(v11, "activityType");
        v15 = objc_msgSend(v11, "sourceType");
        objc_msgSend(v11, "viewModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_momentShareStatusPresentationForPoster;
        objc_msgSend(v11, "importStatusManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PXCMMBannerTileController initWithActivityType:sourceType:viewModel:momentShareStatusPresentation:importStatusManager:](v13, "initWithActivityType:sourceType:viewModel:momentShareStatusPresentation:importStatusManager:", v14, v15, v16, v17, v18);
        v20 = self->_measuringBannerTile;
        self->_measuringBannerTile = v19;

        -[PXCMMAssetsViewController _configureBannerTile:](self, "_configureBannerTile:", self->_measuringBannerTile);
        measuringBannerTile = self->_measuringBannerTile;
      }
      -[PXCMMBannerTileController view](measuringBannerTile, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeThatFits:", width, height);
      v8 = v22;

    }
  }
  return v8;
}

- (double)_statusFooterHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  double v4;
  PXPhotosGlobalFooterView *v6;
  PXPhotosGlobalFooterView *v7;
  PXPhotosGlobalFooterView *measuringStatusFooterView;
  double v9;

  v4 = 0.0;
  if (self->_momentShareStatusPresentationForFooter
    && !-[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder"))
  {
    if (!self->_measuringStatusFooterView)
    {
      v6 = [PXPhotosGlobalFooterView alloc];
      v7 = -[PXPhotosGlobalFooterView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      measuringStatusFooterView = self->_measuringStatusFooterView;
      self->_measuringStatusFooterView = v7;

      -[PXPhotosGlobalFooterView setViewModel:](self->_measuringStatusFooterView, "setViewModel:", self->_statusFooterViewModel);
    }
    PXEdgeInsetsInsetSize();
    -[PXPhotosGlobalFooterView sizeThatFits:](self->_measuringStatusFooterView, "sizeThatFits:");
    return v9;
  }
  return v4;
}

- (void)_updateLayoutEngine
{
  double width;
  double height;
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
  PXLayoutGenerator *v25;
  PXLayoutGenerator *layoutGenerator;
  void *v27;
  void *v28;
  void *v29;
  PXSectionedLayoutEngine *v30;
  id v31;
  PXSectionedLayoutEngine *layoutEngine;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  _QWORD v55[6];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  width = self->_knownReferenceSize.width;
  height = self->_knownReferenceSize.height;
  -[PXCMMSpec reviewContentInsets](self->_spec, "reviewContentInsets");
  -[PXCMMSpec reviewSafeAreaInsets](self->_spec, "reviewSafeAreaInsets");
  PXEdgeInsetsAdd();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXCMMAssetsViewController _headerHeightFromReferenceSize:insets:](self, "_headerHeightFromReferenceSize:insets:", width, height, v5, v7, v9, v11);
  v14 = v13;
  -[PXCMMAssetsViewController _bannerHeightFromReferenceSize:](self, "_bannerHeightFromReferenceSize:", width, height);
  v16 = v15;
  v52 = v12;
  v53 = v8;
  -[PXCMMAssetsViewController _statusFooterHeightFromReferenceSize:insets:](self, "_statusFooterHeightFromReferenceSize:insets:", width, height, v6, v8, v10, v12);
  v18 = v17;
  -[PXCMMAssetsViewController _progressBannerViewLayoutHeight](self, "_progressBannerViewLayoutHeight");
  v20 = v19;
  v54 = v14;
  -[PXCMMSpec reviewHeaderTopInset](self->_spec, "reviewHeaderTopInset");
  v22 = v6 + v14 + v16 + v21;
  -[PXCMMSpec reviewFooterBottomInset](self->_spec, "reviewFooterBottomInset");
  v24 = v10 + v18 + v20 + v23;
  if ((PXSizeIsNull() & 1) == 0 && !self->_layoutGenerator)
  {
    PXEdgeInsetsForEdges();
    PXEdgeInsetsInsetSize();
    -[PXCMMAssetsViewController _createNewLayoutGeneratorWithReferenceSize:](self, "_createNewLayoutGeneratorWithReferenceSize:");
    v25 = (PXLayoutGenerator *)objc_claimAutoreleasedReturnValue();
    layoutGenerator = self->_layoutGenerator;
    self->_layoutGenerator = v25;

  }
  if (self->_layoutGenerator && !self->_layoutEngine)
  {
    -[PXCMMComponentViewController session](self, "session");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataSourceManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dataSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:insets:]([PXSectionedLayoutEngine alloc], "initWithAxis:layoutGenerator:dataSourceSnapshot:insets:", 1, self->_layoutGenerator, v29, v22, v53, v24, v52);
    v58 = 0u;
    v59 = 0u;
    if (v29)
      objc_msgSend(v29, "firstItemIndexPath");
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __48__PXCMMAssetsViewController__updateLayoutEngine__block_invoke;
    v55[3] = &__block_descriptor_80_e42_v16__0___PXMutableSectionedLayoutEngine__8l;
    *(double *)&v55[4] = width;
    *(double *)&v55[5] = height;
    v56 = v58;
    v57 = v59;
    v31 = -[PXSectionedLayoutEngine performChangesAndWait:](v30, "performChangesAndWait:", v55);
    layoutEngine = self->_layoutEngine;
    self->_layoutEngine = v30;

  }
  -[PXLayoutEngine layoutSnapshot](self->_layoutEngine, "layoutSnapshot");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (self->_userSelectionEnabled)
    v36 = 1025;
  else
    v36 = 0;
  objc_msgSend(v34, "setSelectionBadgeOptions:", v36);
  objc_msgSend(v35, "updateAssetStatusBadgeTiles");
  objc_msgSend(v35, "layoutSnapshot");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dataSourceSnapshot");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "identifier");
  objc_msgSend(v33, "dataSourceSnapshot");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "identifier");

  v42 = objc_msgSend(v35, "layoutType");
  v43 = -[PXCMMAssetsViewController _layoutType](self, "_layoutType");
  objc_msgSend(v35, "headerHeight");
  v45 = v44;
  objc_msgSend(v35, "bannerHeight");
  v47 = v46;
  objc_msgSend(v35, "statusFooterHeight");
  v49 = v48;
  objc_msgSend(v35, "layoutSnapshot");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50 || (v50, v39 == v41) && v42 == v43 && v45 == v54 && v47 == v16 && v49 == v18)
  {
    if (v35)
    {
      -[PXCMMAssetsViewController _configureLayout:](self, "_configureLayout:", v35);
      objc_msgSend(v35, "setLayoutSnapshot:", v33);
    }
  }
  else
  {
    -[PXCMMAssetsViewController _createNewLayout](self, "_createNewLayout");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene transitionToLayout:](self->_sceneController, "transitionToLayout:", v51);

  }
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXSectionedLayoutEngine *layoutEngine;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v5 = a4;
  -[PXCMMAssetsViewController _updateLayoutEngine](self, "_updateLayoutEngine");
  -[PXLayoutEngine dataSourceSnapshot](self->_layoutEngine, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  -[PXCMMComponentViewController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changeHistory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v7, objc_msgSend(v5, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  layoutEngine = self->_layoutEngine;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __61__PXCMMAssetsViewController_assetsScene_layoutForDataSource___block_invoke;
  v22 = &unk_1E513C7A8;
  v23 = v5;
  v24 = v12;
  v14 = v12;
  v15 = v5;
  v16 = -[PXSectionedLayoutEngine performChangesAndWait:](layoutEngine, "performChangesAndWait:", &v19);
  -[PXCMMAssetsViewController _createNewLayout](self, "_createNewLayout", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_layoutAnimationsGloballyDisabled)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a3, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changeHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:changeHistory:](PXAssetsTileTransitionCoordinator, "transitionCoordinatorForChange:changeHistory:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "sectionHeadersShouldFloat");

    if ((_DWORD)v8)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v6, "invalidationContexts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v33;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "tag");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PXCMMSectionHeaderTileGroupInvalidation"));

            if ((v17 & 1) != 0)
            {

              objc_msgSend(v7, "disableAnimationsForTileKind:", 8439963);
              goto LABEL_14;
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
LABEL_14:
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "showFloatingBanner");

    if (v19)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v6, "invalidationContexts", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        while (2)
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "tag");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("PXCMMBannerTileGroupInvalidationTag"));

            if ((v26 & 1) != 0)
            {

              objc_msgSend(v7, "disableAnimationsForTileKind:", 8439981);
              goto LABEL_25;
            }
            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v22)
            continue;
          break;
        }
      }

    }
LABEL_25:
    objc_msgSend(v7, "disableAnimationsForTileKind:", 8439964);
  }

  return v7;
}

- (void)_configureBannerTile:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PXCMMComponentViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceType");
  v6 = objc_msgSend(v4, "activityType");
  if (!v5 && v6 == 1)
  {
    objc_msgSend(v4, "peopleSuggestionsPreviewDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "peopleSuggestionsDataSourceManager");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v11, "setPeopleSuggestionsDataSourceManager:", v10);
  }

}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  PXUIAssetsScene *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;

  v7 = a4;
  v8 = self->_sceneController;
  v9 = *(_OWORD *)&a3->index[5];
  v26 = *(_OWORD *)&a3->index[3];
  v27 = v9;
  v28 = *(_OWORD *)&a3->index[7];
  v29 = a3->index[9];
  v10 = *(_OWORD *)&a3->index[1];
  v24 = *(_OWORD *)&a3->length;
  v25 = v10;
  if (!-[PXAssetsScene providesTileForIdentifier:](v8, "providesTileForIdentifier:", &v24))
  {
    v14 = a3->index[0];
    if (v14 > 8439963)
    {
      switch(v14)
      {
        case 8439980:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870944;
          break;
        case 8439981:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v18, "checkOutReusableObjectWithReuseIdentifier:", 8870947);

          -[PXCMMAssetsViewController _configureBannerTile:](self, "_configureBannerTile:", v13);
          if (!v13)
            goto LABEL_16;
          goto LABEL_20;
        case 8439982:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870948;
          break;
        case 8439983:
          goto LABEL_16;
        case 8439984:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870950;
          break;
        default:
          if (v14 != 8439964)
            goto LABEL_16;
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870946;
          break;
      }
    }
    else
    {
      switch(v14)
      {
        case 8439952:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870942;
          break;
        case 8439962:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870943;
          break;
        case 8439963:
          -[PXAssetsScene viewTileReusePool](v8, "viewTileReusePool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = 8870945;
          break;
        default:
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(_OWORD *)&a3->index[5];
          v26 = *(_OWORD *)&a3->index[3];
          v27 = v20;
          v28 = *(_OWORD *)&a3->index[7];
          v29 = a3->index[9];
          v21 = *(_OWORD *)&a3->index[1];
          v24 = *(_OWORD *)&a3->length;
          v25 = v21;
          PXTileIdentifierDescription((unint64_t *)&v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 1571, CFSTR("%@ couldn't check out tile for identifier:%@, layout:%@"), self, v22, v7);

          v13 = 0;
          goto LABEL_21;
      }
    }
    v13 = (void *)objc_msgSend(v15, "checkOutReusableObjectWithReuseIdentifier:", v17);

    if (v13)
    {
LABEL_20:
      -[NSMutableSet addObject:](self->_inUseTiles, "addObject:", v13);
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  v11 = *(_OWORD *)&a3->index[5];
  v26 = *(_OWORD *)&a3->index[3];
  v27 = v11;
  v28 = *(_OWORD *)&a3->index[7];
  v29 = a3->index[9];
  v12 = *(_OWORD *)&a3->index[1];
  v24 = *(_OWORD *)&a3->length;
  v25 = v12;
  v13 = -[PXUIAssetsScene checkOutTileForIdentifier:layout:](v8, "checkOutTileForIdentifier:layout:", &v24, v7);
  if (!v13)
    goto LABEL_16;
LABEL_21:

  return v13;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  PXUIAssetsScene *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;

  v7 = self->_sceneController;
  v8 = *(_OWORD *)&a4->index[5];
  v15 = *(_OWORD *)&a4->index[3];
  v16 = v8;
  v17 = *(_OWORD *)&a4->index[7];
  v18 = a4->index[9];
  v9 = *(_OWORD *)&a4->index[1];
  v13 = *(_OWORD *)&a4->length;
  v14 = v9;
  if (-[PXAssetsScene providesTileForIdentifier:](v7, "providesTileForIdentifier:", &v13))
  {
    v10 = *(_OWORD *)&a4->index[5];
    v15 = *(_OWORD *)&a4->index[3];
    v16 = v10;
    v17 = *(_OWORD *)&a4->index[7];
    v18 = a4->index[9];
    v11 = *(_OWORD *)&a4->index[1];
    v13 = *(_OWORD *)&a4->length;
    v14 = v11;
    -[PXUIAssetsScene checkInTile:withIdentifier:](v7, "checkInTile:withIdentifier:", a3, &v13);
  }
  else
  {
    -[PXAssetsScene viewTileReusePool](v7, "viewTileReusePool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkInReusableObject:", a3);

    -[NSMutableSet removeObject:](self->_inUseTiles, "removeObject:", a3);
  }

}

- (void)engineDrivenLayoutReferenceSizeDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v9;

  v9 = a3;
  -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v4 == v9)
  {
    objc_msgSend(v9, "referenceSize");
    v5 = v9;
    if (self->_knownReferenceSize.width != v6 || self->_knownReferenceSize.height != v7)
    {
      self->_knownReferenceSize.width = v6;
      self->_knownReferenceSize.height = v7;
      -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
      v5 = v9;
    }
  }

}

- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  double v8;
  double v9;
  _OWORD v11[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "aspectRatio");
    v8 = v9;
  }

  return v8;
}

- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  void *v7;
  __int128 v8;
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
  _OWORD v22[2];
  CGRect result;

  objc_msgSend(a3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->item;
  v22[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v22[1] = v8;
  objc_msgSend(v7, "assetAtItemIndexPath:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "bestCropRectForAspectRatio:", a5);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v11 = *(double *)off_1E50B86D0;
    v13 = *((double *)off_1E50B86D0 + 1);
    v15 = *((double *)off_1E50B86D0 + 2);
    v17 = *((double *)off_1E50B86D0 + 3);
  }

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)engineDrivenLayout:(id)a3 shouldShowDimmingOverlayAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int128 v11;
  int64_t v12;
  BOOL v13;
  _OWORD v15[2];

  v6 = a3;
  -[PXCMMComponentViewController session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "activityType") == 2
    && (objc_msgSend(v7, "viewModel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isSelecting"),
        v8,
        v9))
  {
    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&a4->item;
    v15[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v15[1] = v11;
    v12 = -[PXCMMAssetsViewController _assetImportStateAtIndexPath:withDataSource:](self, "_assetImportStateAtIndexPath:withDataSource:", v15, v10);

    v13 = v12 == 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)engineDrivenLayout:(id)a3 shouldShowStatusBadgeAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  _OWORD v17[2];

  v6 = a3;
  -[PXCMMComponentViewController session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "activityType") == 2)
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&a4->item;
    v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v17[1] = v9;
    v10 = -[PXCMMAssetsViewController _assetImportStateAtIndexPath:withDataSource:](self, "_assetImportStateAtIndexPath:withDataSource:", v17, v8);

    -[PXCMMComponentViewController session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSelecting");

    v14 = 2;
    if (!v13)
      v14 = 3;
    v15 = v10 == v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)engineDrivenLayout:(id)a3 assetStatusAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v6;
  __int128 v7;
  int64_t v8;
  _OWORD v10[2];

  objc_msgSend(a3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v7;
  v8 = -[PXCMMAssetsViewController _assetImportStateAtIndexPath:withDataSource:](self, "_assetImportStateAtIndexPath:withDataSource:", v10, v6);

  if ((unint64_t)(v8 - 1) > 2)
    return 0;
  else
    return qword_1A7C0AF28[v8 - 1];
}

- (BOOL)_shouldShowProgressBanner
{
  void *v3;
  int v4;

  if (self->_momentShareStatusPresentationForFooter
    && !-[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder")
    && (unint64_t)(-[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentationForFooter, "state")- 1) < 4)
  {
    return 1;
  }
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showProgressBannerView");

  if (v4)
  {
    if (_shouldShowProgressBanner_predicate != -1)
      dispatch_once(&_shouldShowProgressBanner_predicate, &__block_literal_global_318);
    return 1;
  }
  return 0;
}

- (double)_progressBannerViewLayoutHeight
{
  double result;

  if (!-[PXCMMAssetsViewController _shouldShowProgressBanner](self, "_shouldShowProgressBanner"))
    return 0.0;
  -[PXCMMProgressBannerView layoutHeight](self->_progressBannerView, "layoutHeight");
  return result;
}

- (void)_updateProgressBannerViewVisibility
{
  int v3;

  v3 = -[PXCMMAssetsViewController _shouldShowProgressBanner](self, "_shouldShowProgressBanner");
  if (v3 == -[PXCMMProgressBannerView isHidden](self->_progressBannerView, "isHidden"))
  {
    -[PXCMMProgressBannerView setHidden:](self->_progressBannerView, "setHidden:", v3 ^ 1u);
    -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
  }
}

- (void)_updateProgressBannerViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *progressBannerViewConstraints;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  -[PXCMMProgressBannerView superview](self->_progressBannerView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMProgressBannerView layoutHeight](self->_progressBannerView, "layoutHeight");
  v5 = v4;
  -[PXCMMProgressBannerView topAnchor](self->_progressBannerView, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  -[PXCMMProgressBannerView leadingAnchor](self->_progressBannerView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  -[PXCMMProgressBannerView trailingAnchor](self->_progressBannerView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  -[PXCMMProgressBannerView bottomAnchor](self->_progressBannerView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_progressBannerViewConstraints);
  progressBannerViewConstraints = self->_progressBannerViewConstraints;
  self->_progressBannerViewConstraints = v13;
  v15 = v13;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_progressBannerViewConstraints);
}

- (void)progressBannerViewLayoutHeightDidChange:(id)a3
{
  -[PXCMMAssetsViewController _updateProgressBannerViewConstraints](self, "_updateProgressBannerViewConstraints", a3);
  -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
}

- (void)progressBannerView:(id)a3 presentViewController:(id)a4
{
  -[PXCMMAssetsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)progressBannerView:(id)a3 dismissViewController:(id)a4
{
  PXCMMAssetsViewController *v5;

  objc_msgSend(a4, "presentingViewController", a3);
  v5 = (PXCMMAssetsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[PXCMMAssetsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_shouldShowStatusPlaceholder
{
  void *v2;
  void *v3;
  char v4;

  if (!self->_momentShareStatusPresentationForFooter)
    return 0;
  -[PXCMMComponentViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowPlaceholder");

  return v4;
}

- (void)statusController:(id)a3 configurationDidChange:(id)a4
{
  PXUIAssetsScene *sceneController;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  sceneController = self->_sceneController;
  v5 = a4;
  -[PXAssetsScene viewTileReusePool](sceneController, "viewTileReusePool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkOutReusableObjectWithReuseIdentifier:", 8870950);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v7;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v9;
  else
    v8 = 0;

  objc_msgSend(v8, "setConfiguration:", v5);
}

- (id)presentationEnvironmentForStatusController:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  PXCMMSpec *v10;
  PXCMMSpec *spec;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCMMViewModelObservationContext_242293 == a5)
  {
    v13 = v9;
    if ((v6 & 0x600) != 0)
    {
      -[PXCMMAssetsViewController _selectionModeDidChange](self, "_selectionModeDidChange");
      v9 = v13;
    }
    if ((v6 & 0x1000) == 0)
      goto LABEL_15;
    -[PXCMMAssetsViewController _updatePlaceholder](self, "_updatePlaceholder");
LABEL_13:
    -[PXCMMAssetsViewController _updateProgressBannerViewVisibility](self, "_updateProgressBannerViewVisibility");
    goto LABEL_14;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_242294 == a5)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_15;
    v13 = v9;
    -[PXCMMAssetsViewController _updateSelectionEnabled](self, "_updateSelectionEnabled");
    goto LABEL_13;
  }
  if ((void *)PXSpecManagerObservationContext_242295 == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_15;
    v13 = v9;
    -[PXFeatureSpecManager spec](self->_specManager, "spec");
    v10 = (PXCMMSpec *)objc_claimAutoreleasedReturnValue();
    spec = self->_spec;
    self->_spec = v10;

    -[PXCMMAssetsViewController _updateStyle](self, "_updateStyle");
    -[PXCMMAssetsViewController _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
    goto LABEL_14;
  }
  if ((void *)PXSelectionManagerObservationContext_242296 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMAssetsViewController.m"), 1817, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    v13 = v9;
    -[PXCMMAssetsViewController _updateSelectionIfNeeded](self, "_updateSelectionIfNeeded");
LABEL_14:
    v9 = v13;
  }
LABEL_15:

}

- (void)didTapActionButtonInBannerTileController:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[PXCMMComponentViewController session](self, "session", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activityType");

  if (v5 == 2)
    self->_receivingActionButtonWasTapped = 1;
  -[PXCMMAssetsViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsViewControllerDidTapActionButton:", self);

}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = v5;
  if (v5)
    -[PXCMMAssetsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  else
    -[PXCMMAssetsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  PXBoopableItemsProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PXCMMComponentViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectionEnabled");

  if (v5)
  {
    -[PXCMMAssetsViewController boopableItemsProvider](self, "boopableItemsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(PXBoopableItemsProvider);
      -[PXCMMAssetsViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", v7);

      -[PXCMMComponentViewController session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMAssetsViewController boopableItemsProvider](self, "boopableItemsProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectionManager:", v10);

      -[PXCMMComponentViewController session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMAssetsViewController boopableItemsProvider](self, "boopableItemsProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImagePreviewMediaProvider:", v13);

    }
    -[PXCMMAssetsViewController boopableItemsProvider](self, "boopableItemsProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  return (UIActivityItemsConfigurationReading *)v15;
}

- (void)invalidateBoopableItemsProvider
{
  -[PXCMMAssetsViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", 0);
}

- (PXActionManager)assetActionManager
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCMMAssetsViewController _focusedAssetReference](self, "_focusedAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXCMMAssetsViewController _createSelectionManagerWithAssetReference:](self, "_createSelectionManagerWithAssetReference:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMAssetsViewController _assetActionManagerWithSelectionManager:](self, "_assetActionManagerWithSelectionManager:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (PXActionManager *)v5;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  -[PXCMMAssetsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  -[PXCMMAssetsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a5);
  return 1;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXCMMAssetsViewControllerDelegate)delegate
{
  return (PXCMMAssetsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (int64_t)_layoutType
{
  return self->__layoutType;
}

- (void)set_layoutType:(int64_t)a3
{
  self->__layoutType = a3;
}

- (NSSet)_hiddenAssetReferences
{
  return self->__hiddenAssetReferences;
}

- (void)set_hiddenAssetReferences:(id)a3
{
  objc_storeStrong((id *)&self->__hiddenAssetReferences, a3);
}

- (BOOL)userSelectionEnabled
{
  return self->_userSelectionEnabled;
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->__hiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inUseTiles, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentationForPoster, 0);
  objc_storeStrong((id *)&self->_measuringBannerTile, 0);
  objc_storeStrong((id *)&self->_measuringStatusFooterView, 0);
  objc_storeStrong((id *)&self->_statusFooterViewModel, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentationForFooter, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_layoutTransitionGesture, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_tapSelectionGesture, 0);
  objc_storeStrong((id *)&self->_cmmStatusController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_progressBannerViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressBannerView, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __54__PXCMMAssetsViewController__shouldShowProgressBanner__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PLSharingGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "Debug setting forced the progress banner to be visible", v1, 2u);
  }

}

uint64_t __61__PXCMMAssetsViewController_assetsScene_layoutForDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDataSourceSnapshot:withChangeDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __48__PXCMMAssetsViewController__updateLayoutEngine__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;

  v3 = a2;
  PXSizeScale();
  objc_msgSend(v3, "setSeedSize:");
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  PXIndexPathFromSimpleIndexPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeedItem:", v4, v5, v6);

}

uint64_t __72__PXCMMAssetsViewController_oneUpPresentation_setHiddenAssetReferences___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHiddenAssetReferences:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__PXCMMAssetsViewController__createSelectionManagerWithAssetReference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t __91__PXCMMAssetsViewController_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 1);
}

BOOL __68__PXCMMAssetsViewController__assetIndexPathAtLocation_padding_kind___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 8);
  return (v2 == *(_QWORD *)(a1 + 32) || v2 == 8439981 || v2 == 8439963) && *(_QWORD *)(a2 + 16) == *(_QWORD *)(a1 + 40);
}

uint64_t __62__PXCMMAssetsViewController__toggleAssetSelectionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return objc_msgSend(a2, "setSelectedState:forIndexPath:", v2, v5);
}

void __49__PXCMMAssetsViewController_setActionInProgress___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isSelecting"))
    objc_msgSend(v2, "performChanges:", &__block_literal_global_225_242350);

}

uint64_t __49__PXCMMAssetsViewController_setActionInProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 0);
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createOverlayTileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createStatusBadgeTileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createAddButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createPosterTileController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createStatusFooter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createBannerTileController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createSectionHeaderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createStatusPlaceholderTileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __47__PXCMMAssetsViewController__deselectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __45__PXCMMAssetsViewController__selectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

uint64_t __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  uint64_t result;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(void **)(a1 + 32);
  v5 = a2[1];
  v9 = *a2;
  v10 = v5;
  result = objc_msgSend(v4, "isAssetAtIndexPathPartOfCuratedSet:", &v9);
  if ((_DWORD)result)
  {
    v7 = *(void **)(a1 + 40);
    v8 = a2[1];
    v9 = *a2;
    v10 = v8;
    return objc_msgSend(v7, "addIndexPath:", &v9);
  }
  return result;
}

uint64_t __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __52__PXCMMAssetsViewController__updateSelectionEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSelectionEnabled:", 0);
  objc_msgSend(v2, "setSelecting:", 0);

}

@end
