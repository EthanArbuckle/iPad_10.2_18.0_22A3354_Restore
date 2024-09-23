@implementation PXPhotosDetailsAssetsWidget

- (void)_setNavigatedAssetReference:(id)a3 autoPlayVideo:(BOOL)a4
{
  objc_storeStrong((id *)&self->__navigatedAssetReference, a3);
  self->__autoPlayVideoInOneUp = a4;
}

- (PXPhotosDetailsAssetsWidget)init
{
  char *v2;
  PXPhotosDetailsAssetsWidget *v3;
  _PXPhotosDetailsAssetsWidgetEventTracker *v4;
  PXPhotosDetailsAssetsWidgetEventTracker *eventTracker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsAssetsWidget;
  v2 = -[PXPhotosDetailsAssetsWidget init](&v7, sel_init);
  v3 = (PXPhotosDetailsAssetsWidget *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 14) = 257;
    *(_OWORD *)(v2 + 280) = *(_OWORD *)off_1E50B8580;
    v4 = objc_alloc_init(_PXPhotosDetailsAssetsWidgetEventTracker);
    eventTracker = v3->_eventTracker;
    v3->_eventTracker = (PXPhotosDetailsAssetsWidgetEventTracker *)v4;

    -[PXPhotosDetailsAssetsWidgetEventTracker setIsDisplayingCuratedContent:](v3->_eventTracker, "setIsDisplayingCuratedContent:", v3->__curate);
    +[PXUIAssetsScene preloadResources](PXUIAssetsScene, "preloadResources");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPhotosDataSourceStressTest setRunning:](self->__currentDataSourceStressTest, "setRunning:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsAssetsWidget;
  -[PXPhotosDetailsAssetsWidget dealloc](&v3, sel_dealloc);
}

- (PXPhotosDetailsAssetsSpecManager)_specManager
{
  PXPhotosDetailsAssetsSpecManager *specManager;
  void *v4;
  void *v5;
  PXPhotosDetailsAssetsSpecManager *v6;
  PXPhotosDetailsAssetsSpecManager *v7;

  specManager = self->__specManager;
  if (!specManager)
  {
    -[PXPhotosDetailsAssetsWidget _extendedTraitCollection](self, "_extendedTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget spec](self, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXPhotosDetailsAssetsSpecManager initWithExtendedTraitCollection:detailsOptions:]([PXPhotosDetailsAssetsSpecManager alloc], "initWithExtendedTraitCollection:detailsOptions:", v4, objc_msgSend(v5, "detailsOptions"));
    v7 = self->__specManager;
    self->__specManager = v6;

    -[PXPhotosDetailsAssetsSpecManager registerChangeObserver:context:](self->__specManager, "registerChangeObserver:context:", self, PXSpecManagerObservationContext_172754);
    specManager = self->__specManager;
  }
  return specManager;
}

- (void)_loadTilingController
{
  NSMutableSet *v3;
  NSMutableSet *tilesInUse;
  PXPhotoKitUIMediaProvider *v5;
  id v6;
  PXPhotoKitUIMediaProvider *v7;
  PXPhotoKitUIMediaProvider *mediaProvider;
  PXBasicUIViewTileAnimator *v9;
  PXBasicUIViewTileAnimator *tileAnimator;
  id v11;
  void *v12;
  PXTilingController *v13;
  PXTilingController *tilingController;
  PXPhotosDetailsInlinePlaybackController *v15;
  PXPhotosDetailsInlinePlaybackController *inlinePlaybackController;
  PXUIAssetsScene *v17;
  PXTilingController *v18;
  PXPhotoKitUIMediaProvider *v19;
  void *v20;
  void *v21;
  PXUIAssetsScene *v22;
  PXUIAssetsScene *assetsScene;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  PXUITapGestureRecognizer *v30;
  PXUITapGestureRecognizer *tapGesture;
  PXUITapGestureRecognizer *v32;
  PXUITapGestureRecognizer *pressGesture;
  PXUITapGestureRecognizer *v34;
  UIPinchGestureRecognizer *v35;
  UIPinchGestureRecognizer *pinchGesture;
  UIPinchGestureRecognizer *v37;
  PXTouchingUIGestureRecognizer *v38;
  PXTouchingUIGestureRecognizer *touchGesture;
  PXTouchingUIGestureRecognizer *v40;
  void *v41;
  void *v42;
  PXSwipeSelectionManager *v43;
  void *v44;
  void *v45;
  PXSwipeSelectionManager *v46;
  PXSwipeSelectionManager *swipeSelectionManager;
  PXUITapGestureRecognizer *v48;
  void *v49;
  void *v50;
  id v51;

  if (!self->__tilingController)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    tilesInUse = self->_tilesInUse;
    self->_tilesInUse = v3;

    v5 = [PXPhotoKitUIMediaProvider alloc];
    v6 = objc_alloc_init(MEMORY[0x1E0CD1488]);
    v7 = -[PXPhotoKitUIMediaProvider initWithImageManager:](v5, "initWithImageManager:", v6);
    mediaProvider = self->__mediaProvider;
    self->__mediaProvider = v7;

    v9 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v9;

    v11 = -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widgetScrollViewControllerHostingWidget:", self);
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "registerObserver:", self);
    -[PXPhotosDetailsAssetsWidget _createNewLayout](self, "_createNewLayout");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v50);
    tilingController = self->__tilingController;
    self->__tilingController = v13;

    -[PXTilingController setScrollController:](self->__tilingController, "setScrollController:", v51);
    -[PXTilingController setTileAnimator:](self->__tilingController, "setTileAnimator:", self->__tileAnimator);
    v15 = -[PXPhotosDetailsInlinePlaybackController initWithTilingController:]([PXPhotosDetailsInlinePlaybackController alloc], "initWithTilingController:", self->__tilingController);
    inlinePlaybackController = self->__inlinePlaybackController;
    self->__inlinePlaybackController = v15;

    -[PXPhotosDetailsInlinePlaybackController setDelegate:](self->__inlinePlaybackController, "setDelegate:", self);
    v17 = [PXUIAssetsScene alloc];
    v19 = self->__mediaProvider;
    v18 = self->__tilingController;
    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _selectionManager](self, "_selectionManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PXUIAssetsScene initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:](v17, "initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:", v18, v19, v20, v21, self);
    assetsScene = self->__assetsScene;
    self->__assetsScene = v22;

    -[PXTilingController setTileSource:](self->__tilingController, "setTileSource:", self);
    -[PXTilingController setTransitionDelegate:](self->__tilingController, "setTransitionDelegate:", self);
    -[PXTilingController setScrollDelegate:](self->__tilingController, "setScrollDelegate:", self);
    -[PXAssetsScene setDelegate:](self->__assetsScene, "setDelegate:", self);
    -[PXAssetsScene setAutoplayTilesWaitForInput:](self->__assetsScene, "setAutoplayTilesWaitForInput:", 1);
    -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "spec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (objc_msgSend(v25, "userInterfaceIdiom") == 5)
      {
        objc_msgSend(v25, "defaultCornerRadius");
        -[PXUIAssetsScene setContentTileCornerRadius:](self->__assetsScene, "setContentTileCornerRadius:");
      }
    }
    -[PXAssetsScene viewTileReusePool](self->__assetsScene, "viewTileReusePool");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerReusableObjectForReuseIdentifier:creationHandler:", 1501, &__block_literal_global_172825);

    -[PXAssetsScene viewTileReusePool](self->__assetsScene, "viewTileReusePool");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerReusableObjectForReuseIdentifier:creationHandler:", 1500, &__block_literal_global_198_172826);

    WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
    objc_msgSend(WeakRetained, "widgetViewHostingGestureRecognizers:", self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v25;
    v30 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleTap_);
    -[PXUITapGestureRecognizer setDelegate:](v30, "setDelegate:", self);
    tapGesture = self->__tapGesture;
    self->__tapGesture = v30;
    v48 = v30;

    objc_msgSend(v29, "addGestureRecognizer:", v48);
    v32 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePress_);
    -[PXUITapGestureRecognizer setAllowedPressTypes:](v32, "setAllowedPressTypes:", &unk_1E53E9FD8);
    -[PXUITapGestureRecognizer setDelegate:](v32, "setDelegate:", self);
    pressGesture = self->__pressGesture;
    self->__pressGesture = v32;
    v34 = v32;

    objc_msgSend(v29, "addGestureRecognizer:", v34);
    v35 = (UIPinchGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel_handlePinch_);
    -[UIPinchGestureRecognizer setDelegate:](v35, "setDelegate:", self);
    pinchGesture = self->__pinchGesture;
    self->__pinchGesture = v35;
    v37 = v35;

    objc_msgSend(v29, "addGestureRecognizer:", v37);
    v38 = -[PXTouchingUIGestureRecognizer initWithTarget:action:]([PXTouchingUIGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleTouch_);
    -[PXTouchingUIGestureRecognizer setDelegate:](v38, "setDelegate:", self);
    -[PXTouchingUIGestureRecognizer setMinimumTouchDuration:](v38, "setMinimumTouchDuration:", 0.15);
    -[PXTouchingUIGestureRecognizer setMaximumTouchMovement:](v38, "setMaximumTouchMovement:", 20.0);
    touchGesture = self->__touchGesture;
    self->__touchGesture = v38;
    v40 = v38;

    objc_msgSend(v51, "addGestureRecognizer:", v40);
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", self);
    objc_msgSend(v29, "addInteraction:", v41);
    objc_msgSend(v41, "setEnabled:", 1);
    objc_msgSend(v51, "scrollView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = [PXSwipeSelectionManager alloc];
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "selectionManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[PXSwipeSelectionManager initWithSelectionManager:scrollView:](v43, "initWithSelectionManager:scrollView:", v45, v42);

    -[PXSwipeSelectionManager setDelegate:](v46, "setDelegate:", self);
    swipeSelectionManager = self->__swipeSelectionManager;
    self->__swipeSelectionManager = v46;

    -[PXPhotosDetailsAssetsWidget _updateHasLoadedContentData](self, "_updateHasLoadedContentData");
    -[PXPhotosDetailsAssetsWidget _updateShowCurationButton](self, "_updateShowCurationButton");

  }
}

- (void)_invalidateLayoutGenerator
{
  -[PXPhotosDetailsAssetsWidget _setLayoutGenerator:](self, "_setLayoutGenerator:", 0);
  -[PXPhotosDetailsAssetsWidget _setLayoutEngine:](self, "_setLayoutEngine:", 0);
}

- (void)_updateLayoutEngineIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  PXAspectFitLayoutMetrics *v16;
  __objc2_class *v17;
  double v18;
  double v19;
  void *v20;
  PXExploreLayoutMetrics *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  __objc2_class **v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PXSectionedLayoutEngine *v31;
  void *v32;
  PXSectionedLayoutEngine *v33;
  id v34;
  _QWORD v35[4];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !v6)
    goto LABEL_25;
  objc_msgSend(v6, "layoutReferenceSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "contentGuideInsets");
  v13 = v8 - (v11 + v12);
  if ((PXSizeIsNull() & 1) == 0)
  {
    -[PXPhotosDetailsAssetsWidget _layoutGenerator](self, "_layoutGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "wantsCurationForFirstAssetCollection"))
      {
        if (objc_msgSend(v4, "userInterfaceIdiom") != 3)
        {
          +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
          v16 = (PXAspectFitLayoutMetrics *)objc_claimAutoreleasedReturnValue();
          if (-[PXAspectFitLayoutMetrics useCuratedLibraryLayout](v16, "useCuratedLibraryLayout"))
          {
            v21 = -[PXExploreLayoutMetrics initWithExtendedTraitCollection:]([PXExploreLayoutMetrics alloc], "initWithExtendedTraitCollection:", v6);
            -[PXExploreLayoutMetrics setLayoutSubtype:](v21, "setLayoutSubtype:", 2);
            -[PXLayoutMetrics setReferenceSize:](v21, "setReferenceSize:", v13, v10);
            -[PXPhotosDetailsAssetsWidget context](self, "context");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "shouldShowMovieHeader"))
              v23 = objc_msgSend(v6, "layoutOrientation") == 2;
            else
              v23 = 1;
            -[PXExploreLayoutMetrics setAllowHeaders:](v21, "setAllowHeaders:", v23);

            -[PXExploreLayoutMetrics setLargeHeroDensity:](v21, "setLargeHeroDensity:", 0);
            if ((-[PXAspectFitLayoutMetrics allowItemReorderingInCuratedLayout](v16, "allowItemReorderingInCuratedLayout") & 1) == 0)-[PXExploreLayoutMetrics setReorderingTolerance:](v21, "setReorderingTolerance:", 1);
            objc_msgSend(v4, "exploreInteritemSpacing");
            -[PXExploreLayoutMetrics setInteritemSpacing:](v21, "setInteritemSpacing:");
            v25 = off_1E50B2440;
          }
          else
          {
            v21 = objc_alloc_init(PXEditorialLayoutMetrics);
            -[PXLayoutMetrics setReferenceSize:](v21, "setReferenceSize:", v13, v10);
            -[PXExploreLayoutMetrics setNumberOfColumns:](v21, "setNumberOfColumns:", objc_msgSend(v4, "editorialNumberOfColumns"));
            objc_msgSend(v4, "editorialInterTileSpacing");
            -[PXExploreLayoutMetrics setInterTileSpacing:](v21, "setInterTileSpacing:");
            +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXExploreLayoutMetrics setLowerItemCountThreshold:](v21, "setLowerItemCountThreshold:", objc_msgSend(v24, "editorialLayoutActivityFeedItemCountThreshold"));

            v25 = off_1E50B23C0;
          }
          v20 = (void *)objc_msgSend(objc_alloc(*v25), "initWithMetrics:", v21);

          goto LABEL_19;
        }
        v16 = objc_alloc_init(PXAspectFitLayoutMetrics);
        -[PXLayoutMetrics setReferenceSize:](v16, "setReferenceSize:", v13, v10);
        objc_msgSend(v4, "editorialInterTileSpacing");
        -[PXAspectFitLayoutMetrics setInterTileSpacing:](v16, "setInterTileSpacing:");
        v17 = PXAspectFitLayoutGenerator;
      }
      else
      {
        v16 = objc_alloc_init(PXGridLayoutMetrics);
        -[PXAspectFitLayoutMetrics setAxis:](v16, "setAxis:", 1);
        -[PXLayoutMetrics setReferenceSize:](v16, "setReferenceSize:", v13, v10);
        v18 = *MEMORY[0x1E0C9D820];
        v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        -[PXAspectFitLayoutMetrics setHeaderSize:](v16, "setHeaderSize:", *MEMORY[0x1E0C9D820], v19);
        -[PXAspectFitLayoutMetrics setFooterSize:](v16, "setFooterSize:", v18, v19);
        objc_msgSend(v4, "gridInterItemSpacing");
        -[PXAspectFitLayoutMetrics setInterItemSpacing:](v16, "setInterItemSpacing:");
        objc_msgSend(v4, "gridContentInsets");
        -[PXAspectFitLayoutMetrics setContentInsets:](v16, "setContentInsets:");
        objc_msgSend(v4, "gridItemSize");
        -[PXAspectFitLayoutMetrics setItemSize:](v16, "setItemSize:");
        v17 = PXGridLayoutGenerator;
      }
      v20 = (void *)objc_msgSend([v17 alloc], "initWithMetrics:", v16);
LABEL_19:

      -[PXPhotosDetailsAssetsWidget _setLayoutGenerator:](self, "_setLayoutGenerator:", v20);
    }
  }
  -[PXPhotosDetailsAssetsWidget _layoutGenerator](self, "_layoutGenerator");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dataSource");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      if (v30)
        objc_msgSend(v30, "firstItemIndexPath");
      v31 = [PXSectionedLayoutEngine alloc];
      -[PXPhotosDetailsAssetsWidget _layoutGenerator](self, "_layoutGenerator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:](v31, "initWithAxis:layoutGenerator:dataSourceSnapshot:", 1, v32, v30);

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__PXPhotosDetailsAssetsWidget__updateLayoutEngineIfNeeded__block_invoke;
      v35[3] = &__block_descriptor_64_e42_v16__0___PXMutableSectionedLayoutEngine__8l;
      v36 = v38;
      v37 = v39;
      v34 = -[PXSectionedLayoutEngine performChangesAndWait:](v33, "performChangesAndWait:", v35);
      -[PXPhotosDetailsAssetsWidget _setLayoutEngine:](self, "_setLayoutEngine:", v33);

    }
  }
LABEL_25:

}

- (id)_createNewLayout
{
  void *v4;
  void *v5;
  PXPhotosDetailsAssetsTilingLayout *v6;
  void *v8;

  -[PXPhotosDetailsAssetsWidget _updateLayoutEngineIfNeeded](self, "_updateLayoutEngineIfNeeded");
  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 422, CFSTR("The layout engine should always return a layoutSnapshot."));

  }
  v6 = -[PXEngineDrivenAssetsTilingLayout initWithLayoutEngineSnapshot:]([PXPhotosDetailsAssetsTilingLayout alloc], "initWithLayoutEngineSnapshot:", v5);
  -[PXEngineDrivenAssetsTilingLayout setDelegate:](v6, "setDelegate:", self);
  -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v6);

  return v6;
}

- (void)_configureLayout:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  double v46;
  NSDate *loadStartDate;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  uint8_t buf[40];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutSnapshot");
  v7 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 434, CFSTR("The layout engine should always return a layoutSnapshot."));

  }
  -[PXPhotosDetailsAssetsWidget _hiddenAssetReferences](self, "_hiddenAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init((Class)off_1E50B3668);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v65 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
          v62 = 0u;
          v63 = 0u;
          objc_msgSend(v5, "dataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "indexPathForAssetReference:", v15);
          }
          else
          {
            v62 = 0u;
            v63 = 0u;
          }

          v60 = v62;
          v61 = v63;
          objc_msgSend(v9, "addIndexPath:", &v60);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = 0;
  }
  -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v19 = objc_alloc_init((Class)off_1E50B3668);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v57 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
          v62 = 0u;
          v63 = 0u;
          objc_msgSend(v5, "dataSource");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "indexPathForAssetReference:", v25);
          }
          else
          {
            v62 = 0u;
            v63 = 0u;
          }

          v60 = v62;
          v61 = v63;
          objc_msgSend(v19, "addIndexPath:", &v60);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v22);
    }

  }
  else
  {
    v19 = 0;
  }
  -[PXPhotosDetailsAssetsWidget _highlightedAssetReference](self, "_highlightedAssetReference");
  v28 = objc_claimAutoreleasedReturnValue();
  v49 = *((_OWORD *)off_1E50B8778 + 1);
  v51 = *(_OWORD *)off_1E50B8778;
  v62 = *(_OWORD *)off_1E50B8778;
  v63 = v49;
  if (v28)
  {
    objc_msgSend(v5, "dataSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "indexPathForAssetReference:", v28);
    }
    else
    {
      v60 = 0u;
      v61 = 0u;
    }
    v62 = v60;
    v63 = v61;

  }
  -[PXPhotosDetailsAssetsWidget _focusedAssetReference](self, "_focusedAssetReference", v49);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v51;
  v61 = v50;
  if (v31)
  {
    objc_msgSend(v5, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "indexPathForAssetReference:", v31);
    else
      memset(buf, 0, 32);
    v60 = *(_OWORD *)buf;
    v61 = *(_OWORD *)&buf[16];

  }
  v52 = (void *)v28;
  objc_msgSend(v5, "dataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v34, "photosDataSource");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "wantsCurationForFirstAssetCollection");
    if (objc_msgSend(v35, "numberOfSections") < 1
      || (objc_msgSend(v35, "assetsInSection:", 0),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v37,
          v37))
    {
      v38 = objc_msgSend(v35, "isEmpty");
      v39 = 2;
      if (v36)
        v39 = 0;
      if (v38)
        v40 = v39;
      else
        v40 = 0;
    }
    else
    {
      v40 = 1;
    }

  }
  else
  {
    LOBYTE(v36) = 0;
    v40 = 0;
  }
  objc_msgSend(v5, "setSelectionBadgeOptions:", 1025);
  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "spec");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v36 & 1) != 0)
  {
    v43 = 1;
    v44 = 1;
  }
  else
  {
    v44 = objc_msgSend(v42, "gridContentMode");
    v43 = 3;
  }
  if (!objc_msgSend(v42, "enableBadges"))
    v43 = 0;
  objc_msgSend(v5, "setContentMode:", v44);
  objc_msgSend(v5, "setBadgeOptions:", v43);
  objc_msgSend(v5, "setLayoutSnapshot:", v55);
  objc_msgSend(v5, "setHiddenIndexPaths:", v9);
  objc_msgSend(v5, "setPlaceholderMode:", v40);
  *(_OWORD *)buf = v62;
  *(_OWORD *)&buf[16] = v63;
  objc_msgSend(v5, "setHighlightedIndexPath:", buf);
  objc_msgSend(v5, "setDraggingIndexPaths:", v19);
  *(_OWORD *)buf = v60;
  *(_OWORD *)&buf[16] = v61;
  objc_msgSend(v5, "setFocusedIndexPath:", buf);
  objc_msgSend(v5, "setSpec:", v42);
  if (v40 != 1 && self->_loadStartDate)
  {
    PLRelatedGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      -[NSDate timeIntervalSinceNow](self->_loadStartDate, "timeIntervalSinceNow");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = -v46;
      _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_DEFAULT, "[%@] initial data souce loaded in %fs", buf, 0x16u);
    }

    loadStartDate = self->_loadStartDate;
    self->_loadStartDate = 0;

  }
}

- (void)_updateTilingLayoutIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v18 = v4;
    objc_msgSend(v4, "layoutSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 519, CFSTR("The layout engine should always return a layoutSnapshot."));

    }
    -[PXPhotosDetailsAssetsWidget _tilingController](self, "_tilingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "layoutSnapshot");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_6;
    v9 = (void *)v8;
    objc_msgSend(v7, "layoutSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSourceSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "identifier");
    objc_msgSend(v5, "dataSourceSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "identifier");

    if (v12 != v14)
    {
      -[PXPhotosDetailsAssetsWidget _createNewLayout](self, "_createNewLayout");
      v15 = objc_claimAutoreleasedReturnValue();

      -[PXPhotosDetailsAssetsWidget _tilingController](self, "_tilingController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transitionToLayout:", v15);

      v7 = (void *)v15;
    }
    else
    {
LABEL_6:
      -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v7);
    }

    v4 = v18;
  }

}

- (void)_updateHasLoadedContentData
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PXPhotosDetailsAssetsWidget _tilingController](self, "_tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v5, "placeholderMode");
  -[PXPhotosDetailsAssetsWidget _setHasLoadedContentData:](self, "_setHasLoadedContentData:", v4 != 1);
  if (v4 != 1)
    -[PXPhotosDetailsAssetsWidget _setLoadCoordinationToken:](self, "_setLoadCoordinationToken:", 0);

}

- (void)_setDraggingAssetReferences:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  v4 = (NSSet *)a3;
  if (v4)
  {
    v8 = v4;
    if (-[NSSet count](v4, "count"))
    {
      v5 = v8;
      goto LABEL_6;
    }

  }
  v5 = 0;
LABEL_6:
  if (self->__draggingAssetReferences != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->__draggingAssetReferences, v5);
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v7);

    v5 = v9;
  }

}

- (void)_setHiddenAssetReferences:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  v4 = (NSSet *)a3;
  if (v4)
  {
    v8 = v4;
    if (-[NSSet count](v4, "count"))
    {
      v5 = v8;
      goto LABEL_6;
    }

  }
  v5 = 0;
LABEL_6:
  if (self->__hiddenAssetReferences != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->__hiddenAssetReferences, v5);
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v7);

    v5 = v9;
  }

}

- (void)_setHighlightedAssetReference:(id)a3
{
  PXAssetReference *v5;
  void *v6;
  void *v7;
  PXAssetReference *v8;

  v5 = (PXAssetReference *)a3;
  if (self->__highlightedAssetReference != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__highlightedAssetReference, a3);
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v7);

    v5 = v8;
  }

}

- (void)_setFocusedAssetReference:(id)a3
{
  PXAssetReference *v5;
  void *v6;
  void *v7;
  PXAssetReference *v8;

  v5 = (PXAssetReference *)a3;
  if (self->__focusedAssetReference != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__focusedAssetReference, a3);
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _configureLayout:](self, "_configureLayout:", v7);

    v5 = v8;
  }

}

- (void)_updateFocusedAssetReference
{
  void *v3;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;

  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC37E0];
  objc_msgSend(v4, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusSystemForEnvironment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentFocusEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "focusItemContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "frame");
    PXRectGetCenter();
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "contentCoordinateSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v16, v13, v15);
    v18 = v17;
    v20 = v19;

    -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v18, v20, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v22 = (id)v21;
  -[PXPhotosDetailsAssetsWidget _setFocusedAssetReference:](self, "_setFocusedAssetReference:", v21);

}

- (void)_setCurate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->__curate != a3)
  {
    v3 = a3;
    self->__curate = a3;
    -[PXPhotosDetailsAssetsWidget _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
    -[PXPhotosDetailsAssetsWidget eventTracker](self, "eventTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsDisplayingCuratedContent:", v3);

    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photosDataSource");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstAssetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v11, "setWantsCuration:forAssetCollection:", v3, v7);
    -[PXPhotosDetailsAssetsWidget _updateShowCurationButton](self, "_updateShowCurationButton");
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widgetLocalizedSubtitleDidChange:", self);

    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widget:animateChanges:withAnimationOptions:", self, 0, 0);

    -[PXPhotosDetailsAssetsWidget _updateLayoutEngineIfNeeded](self, "_updateLayoutEngineIfNeeded");
    -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updatePlaybackEnabled");

  }
}

- (void)_updateShowCurationButton
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotosDetailsAssetsWidget isSelecting](self, "isSelecting")
    && (!-[PXPhotosDetailsAssetsWidget isSelecting](self, "isSelecting")
     || !-[PXPhotosDetailsAssetsWidget _curate](self, "_curate"))
    || v4 && (objc_msgSend(v7, "isCuratedAssetsFutilelyForAssetCollection:", v4) & 1) != 0
    || (objc_msgSend(v7, "isCuratedAssetsEmptyForAssetCollection:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[PXPhotosDetailsAssetsWidget spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v6, "detailsOptions") & 8) == 0;

  }
  -[PXPhotosDetailsAssetsWidget _setShowCurationButton:](self, "_setShowCurationButton:", v5);

}

- (void)_setShowCurationButton:(BOOL)a3
{
  id v4;

  if (self->__showCurationButton != a3)
  {
    self->__showCurationButton = a3;
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetLocalizedSubtitleDidChange:", self);

  }
}

- (void)_logAssetCountsIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (!-[PXPhotosDetailsAssetsWidget didLogCuratedAssetCount](self, "didLogCuratedAssetCount"))
  {
    -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfSections");

    if (v4 >= 1)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      do
      {
        -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "curatedAssetsInSection:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v5 += objc_msgSend(v9, "count");
        v6 |= v9 != 0;

        ++v7;
        -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "numberOfSections");

      }
      while (v7 < v11);
      if ((v6 & 1) != 0)
      {
        +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logPushValueForDistributionKey:forKey:", *MEMORY[0x1E0D725D0], (double)v5);

        v13 = (void *)MEMORY[0x1E0D09910];
        v31 = *MEMORY[0x1E0D09840];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.photosDetailsSummaryAssetsCounted"), v15);

        -[PXPhotosDetailsAssetsWidget setDidLogCuratedAssetCount:](self, "setDidLogCuratedAssetCount:", 1);
      }
    }
  }
  if (!-[PXPhotosDetailsAssetsWidget didLogUncuratedAssetCount](self, "didLogUncuratedAssetCount"))
  {
    -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "numberOfSections");

    if (v17 >= 1)
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      do
      {
        -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uncuratedAssetsInSection:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v20 += objc_msgSend(v22, "count");
        v19 |= v22 != 0;

        ++v18;
        -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "numberOfSections");

      }
      while (v18 < v24);
      if ((v19 & 1) != 0)
      {
        +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logPushValueForDistributionKey:forKey:", *MEMORY[0x1E0D725E0], (double)v20);

        v26 = (void *)MEMORY[0x1E0D09910];
        v29 = *MEMORY[0x1E0D09840];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.photosDetailsAllAssetsCounted"), v28);

        -[PXPhotosDetailsAssetsWidget setDidLogUncuratedAssetCount:](self, "setDidLogUncuratedAssetCount:", 1);
      }
    }
  }
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  PXSimpleIndexPath *result;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v13 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v13;
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "identifier");

  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tilingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__PXPhotosDetailsAssetsWidget__assetIndexPathAtLocation_padding___block_invoke;
  v22[3] = &__block_descriptor_40_e355_B504__0_PXTileIdentifier_Q_10Q__8_v96_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_104_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_296Q488___NSObject__496l;
  v22[4] = v16;
  if (v18)
  {
    objc_msgSend(v18, "hitTestTileAtPoint:padding:passingTest:", v22, x, y, top, left, bottom, right);
  }
  else
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
  }

  if (v23 == __PAIR128__(6432423, 5))
  {
    v21 = v25;
    *(_OWORD *)&retstr->dataSourceIdentifier = v24;
    *(_OWORD *)&retstr->item = v21;
  }
  return result;
}

- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4
{
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  if (!*(_QWORD *)off_1E50B7E98)
    return 0;
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(v7, "assetReferenceAtItemIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isLocationWithinCurrentLayoutBounds:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  BOOL v14;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget contentTilingController](self, "contentTilingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "contentCoordinateSpaceIdentifier"), objc_msgSend(v7, "coordinateSpaceIdentifier"), x, y);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v7, "contentBounds");
    objc_msgSend(v7, "contentInset");
    PXEdgeInsetsInsetRect();
    v16.x = v11;
    v16.y = v13;
    v14 = CGRectContainsPoint(v17, v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_performTilingChangeWithoutAnimationTransition:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PXPhotosDetailsAssetsWidget _transitionWithoutAnimation](self, "_transitionWithoutAnimation");
  -[PXPhotosDetailsAssetsWidget _setTransitionWithoutAnimation:](self, "_setTransitionWithoutAnimation:", 1);
  v4[2](v4);

  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIfNeeded");

  -[PXPhotosDetailsAssetsWidget _setTransitionWithoutAnimation:](self, "_setTransitionWithoutAnimation:", v5);
}

- (void)_setCurrentDataSourceStressTest:(id)a3
{
  PXPhotosDataSourceStressTest *v5;
  PXPhotosDataSourceStressTest *currentDataSourceStressTest;
  void *v7;
  PXPhotosDataSourceStressTest *v8;

  v5 = (PXPhotosDataSourceStressTest *)a3;
  currentDataSourceStressTest = self->__currentDataSourceStressTest;
  if (currentDataSourceStressTest != v5)
  {
    v8 = v5;
    -[PXPhotosDataSourceStressTest unregisterChangeObserver:context:](currentDataSourceStressTest, "unregisterChangeObserver:context:", self, PXStressTestObservationContext);
    objc_storeStrong((id *)&self->__currentDataSourceStressTest, a3);
    -[PXPhotosDataSourceStressTest registerChangeObserver:context:](self->__currentDataSourceStressTest, "registerChangeObserver:context:", self, PXStressTestObservationContext);
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetLocalizedDisclosureTitleDidChange:", self);

    v5 = v8;
  }

}

- (id)_regionOfInterestForAssetReference:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CGRect v74;
  CGRect v75;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tilingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scrollController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateIfNeeded");

  v72 = 0u;
  v73 = 0u;
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "indexPathForAssetReference:", v4);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  v15 = *(double *)off_1E50B86D0;
  v16 = *((double *)off_1E50B86D0 + 1);
  v17 = *((double *)off_1E50B86D0 + 2);
  v18 = *((double *)off_1E50B86D0 + 3);

  v19 = v72;
  if ((_QWORD)v72 != *(_QWORD *)off_1E50B7E98)
  {
    v20 = *((_QWORD *)&v72 + 1);
    v21 = v73;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v48 = xmmword_1A7C0C200;
    v49 = v72;
    v50 = v73;
    v51 = 0u;
    v52 = 0u;
    *(_QWORD *)&v53 = 0;
    if (objc_msgSend(v10, "getTile:geometry:group:userData:forTileWithIdentifier:", 0, &v60, 0, 0, &v48))
    {
      v6 = *((double *)&v60 + 1);
      v5 = *(double *)&v60;
      v8 = *((double *)&v61 + 1);
      v7 = *(double *)&v61;
      v15 = *((double *)&v69 + 1);
      v17 = *((double *)&v70 + 1);
      v16 = *(double *)&v70;
      v18 = *(double *)&v71;
    }
    v74.origin.x = v5;
    v74.origin.y = v6;
    v74.size.width = v7;
    v74.size.height = v8;
    if (CGRectIsNull(v74))
    {
      v40 = v4;
      -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v72;
      objc_msgSend(v23, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "identifier");

      if (v24 == v26)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v41 = xmmword_1A7C0C200;
        v42 = v19;
        v43 = v20;
        v44 = v21;
        v45 = 0u;
        v46 = 0u;
        v47 = 0;
        if (objc_msgSend(v23, "getGeometry:group:userData:forTileWithIdentifier:", &v48, 0, 0, &v41))
        {
          +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v23, "coordinateSpaceIdentifier");
          v29 = objc_msgSend(v10, "contentCoordinateSpaceIdentifier");
          objc_msgSend(v27, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v28, v29, v48, v49);
          v5 = v30;
          v6 = v31;
          v7 = v32;
          v8 = v33;

        }
      }
      v4 = v40;

    }
  }
  v75.origin.x = v5;
  v75.origin.y = v6;
  v75.size.width = v7;
  v75.size.height = v8;
  if (CGRectIsNull(v75))
  {
    v34 = 0;
  }
  else
  {
    v35 = objc_alloc((Class)off_1E50B4620);
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scrollViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "contentCoordinateSpace");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v35, "initWithRect:inCoordinateSpace:", v38, v5, v6, v7, v8);

    objc_msgSend(v34, "setImageContentsRect:", v15, v16, v17, v18);
  }

  return v34;
}

- (void)_fallBackByTogglingCurationIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isCuratedAssetsEmptyForAssetCollection:", v3);
  if ((v4 & 1) != 0
    || (objc_msgSend(v5, "wantsCurationForAssetCollection:", v3) & 1) == 0 && objc_msgSend(v5, "isEmpty"))
  {
    -[PXPhotosDetailsAssetsWidget _setCurate:](self, "_setCurate:", v4 ^ 1u);
  }

}

- (id)_assetActionManagerForAssetsReference:(id)a3
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
  id v14;
  PXPhotoKitAssetActionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;

  v4 = a3;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "selectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isSelecting") & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    if (v4)
      objc_msgSend(v4, "indexPath");
    v22[0] = v23;
    v22[1] = v24;
    objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v8);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__PXPhotosDetailsAssetsWidget__assetActionManagerForAssetsReference___block_invoke;
    v20[3] = &unk_1E513C668;
    v21 = v12;
    v14 = v12;
    objc_msgSend(v13, "performChanges:", v20);

    v11 = v13;
  }
  v15 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v11);
  -[PXActionManager setPerformerDelegate:](v15, "setPerformerDelegate:", self);
  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "people");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager setPerson:](v15, "setPerson:", v18);

    }
  }

  return v15;
}

- (void)setContext:(id)a3
{
  PXPhotosDetailsContext *v5;
  PXPhotosDetailsContext *context;
  void *v7;
  void *v8;
  void *v9;
  PXPhotosDetailsContext *v10;

  v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  v10 = v5;
  if (context != v5)
  {
    -[PXPhotosDetailsContext unregisterChangeObserver:context:](context, "unregisterChangeObserver:context:", self, PXPhotosDetailsContextObservationContext_172755);
    objc_storeStrong((id *)&self->_context, a3);
    -[PXPhotosDetailsContext registerChangeObserver:context:](self->_context, "registerChangeObserver:context:", self, PXPhotosDetailsContextObservationContext_172755);
    +[PXPhotosDetailsLoadCoordinator loadCoordinatorForContext:](PXPhotosDetailsLoadCoordinator, "loadCoordinatorForContext:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenForCuratedFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsAssetsWidget _setLoadCoordinationToken:](self, "_setLoadCoordinationToken:", v8);
    -[PXPhotosDetailsContext photosDataSource](v10, "photosDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _setPhotosDataSource:](self, "_setPhotosDataSource:", v9);

    -[PXPhotosDetailsAssetsWidget _updateShowCurationButton](self, "_updateShowCurationButton");
  }

}

- (id)dataSourceManager
{
  void *v3;
  PXPhotoKitAssetsDataSourceManager *v4;
  void *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  PXPhotoKitAssetsDataSourceManager *dataSourceManager;

  if (!self->_dataSourceManager)
  {
    -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [PXPhotoKitAssetsDataSourceManager alloc];
      -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:](v4, "initWithPhotosDataSource:", v5);
      dataSourceManager = self->_dataSourceManager;
      self->_dataSourceManager = v6;

    }
  }
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  void *v3;
  id v4;
  void *v5;
  PXSectionedSelectionManager *v6;
  PXSectionedSelectionManager *selectionManager;

  if (!self->_selectionManager)
  {
    -[PXPhotosDetailsAssetsWidget dataSourceManager](self, "dataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc((Class)off_1E50B4A40);
      -[PXPhotosDetailsAssetsWidget dataSourceManager](self, "dataSourceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (PXSectionedSelectionManager *)objc_msgSend(v4, "initWithDataSourceManager:", v5);
      selectionManager = self->_selectionManager;
      self->_selectionManager = v6;

    }
  }
  return self->_selectionManager;
}

- (void)_setLoadCoordinationToken:(id)a3
{
  PXPhotosDetailsLoadCoordinationToken *v5;
  PXPhotosDetailsLoadCoordinationToken *loadCoordinationToken;
  PXPhotosDetailsLoadCoordinationToken *v7;

  v5 = (PXPhotosDetailsLoadCoordinationToken *)a3;
  loadCoordinationToken = self->__loadCoordinationToken;
  if (loadCoordinationToken != v5)
  {
    v7 = v5;
    -[PXPhotosDetailsLoadCoordinationToken complete](loadCoordinationToken, "complete");
    objc_storeStrong((id *)&self->__loadCoordinationToken, a3);
    v5 = v7;
  }

}

- (void)_setPhotosDataSource:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  PXPhotosDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = -[PXPhotosDataSource isEqual:](self->__photosDataSource, "isEqual:", v17);
  v6 = v17;
  if ((v5 & 1) == 0)
  {
    v7 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosDataSource != nil"));

      v7 = 0;
    }
    v8 = -[PXPhotosDataSource initWithPhotosDataSource:options:]([PXPhotosDataSource alloc], "initWithPhotosDataSource:options:", v17, objc_msgSend(v7, "options") | 0x10);
    v9 = (void *)objc_opt_class();
    -[PXPhotosDetailsAssetsWidget context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "people");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_refreshSortDescriptorsInPhotosDataSource:withPeople:", v8, v11);

    -[PXPhotosDataSource firstAssetCollection](v8, "firstAssetCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PXPhotosDataSource setWantsCuration:forAssetCollection:](v8, "setWantsCuration:forAssetCollection:", -[PXPhotosDetailsAssetsWidget _curate](self, "_curate"), v12);
      if (-[PXPhotosDataSource isCuratedAssetsEmptyForAssetCollection:](v8, "isCuratedAssetsEmptyForAssetCollection:", v12))
      {
        self->__curate = 0;
        -[PXPhotosDataSource setWantsCuration:forAssetCollection:](v8, "setWantsCuration:forAssetCollection:", 0, v12);
      }
    }
    else
    {
      self->__curate = 0;
    }
    photosDataSource = self->__photosDataSource;
    self->__photosDataSource = v8;
    v14 = v8;

    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPhotosDataSource:", v14);

    v6 = v17;
  }

}

- (id)_extendedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetViewControllerHostingWidget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadContentData
{
  NSDate *v3;
  NSDate *loadStartDate;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  loadStartDate = self->_loadStartDate;
  self->_loadStartDate = v3;

  -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startBackgroundFetchIfNeeded");

}

- (PXTilingController)contentTilingController
{
  -[PXPhotosDetailsAssetsWidget _loadTilingController](self, "_loadTilingController");
  return -[PXPhotosDetailsAssetsWidget _tilingController](self, "_tilingController");
}

- (int64_t)contentLayoutStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "shouldInsetAllPhotoDetailsContent") ^ 1;
  return v4;
}

- (id)_title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E50B3470, "defaultHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayableTextForTitle:intent:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_subtitle
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_curationButtonTitle
{
  __CFString *v2;

  if (-[PXPhotosDetailsAssetsWidget _curate](self, "_curate"))
    v2 = CFSTR("PXPhotosDetailsAssetsWidgetShowMoreButton");
  else
    v2 = CFSTR("PXPhotosDetailsAssetsWidgetShowSummaryButton");
  PXLocalizedStringFromTable(v2, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;

  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "shouldShowTitle"))
    goto LABEL_17;
  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowHeaderTitle");

  if (!v6)
    goto LABEL_17;
  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "shouldShowMovieHeader") & 1) != 0)
  {
    v8 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v8 == 3)
    {
LABEL_17:
      v14 = 0;
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "shouldShowMovieHeader"))
  {

  }
  else
  {
    -[PXPhotosDetailsAssetsWidget context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldUseKeyFace");

    if (!v11)
    {
      -[PXPhotosDetailsAssetsWidget _title](self, "_title");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowEditorialLayoutStressTest");

  if (!v13)
    goto LABEL_17;
  PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsAssetsWidgetTitle"), CFSTR("PhotosUICore"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsAssetsWidget _currentDataSourceStressTest](self, "_currentDataSourceStressTest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (v14)
      v17 = v14;
    else
      v17 = CFSTR("Photos");
    -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR(" (#%lu)"), objc_msgSend(v15, "dataSourceIndex"));
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v18;
  }

LABEL_18:
  return (NSString *)v14;
}

- (NSString)localizedDisclosureTitle
{
  return 0;
}

- (NSString)localizedSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;

  if (-[PXPhotosDetailsAssetsWidget _showCurationButton](self, "_showCurationButton"))
  {
    -[PXPhotosDetailsAssetsWidget _curationButtonTitle](self, "_curationButtonTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[PXPhotosDetailsAssetsWidget _specManager](self, "_specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "shouldShowMovieHeader") & 1) != 0)
  {

LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "shouldShowTitle");

  if (!v7)
    goto LABEL_7;
  -[PXPhotosDetailsAssetsWidget _subtitle](self, "_subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowEditorialLayoutStressTest");

  if (v9)
  {
    -[PXPhotosDetailsAssetsWidget _currentDataSourceStressTest](self, "_currentDataSourceStressTest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRunning");
    v12 = CFSTR("Start Test");
    if (v11)
      v12 = CFSTR("Pause Test");
    v13 = v12;

    v3 = v13;
  }
  return (NSString *)v3;
}

- (void)_userDidSelectCurationButton
{
  const __CFString *v3;
  void *v4;

  -[PXPhotosDetailsAssetsWidget _toggleCuration](self, "_toggleCuration");
  if (-[PXPhotosDetailsAssetsWidget _curate](self, "_curate"))
  {
    v3 = CFSTR("com.apple.photos.CPAnalytics.photosDetailsSummaryButtonSelected");
  }
  else
  {
    +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72610]);

    v3 = CFSTR("com.apple.photos.CPAnalytics.photosDetailsShowMoreButtonSelected");
  }
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v3, MEMORY[0x1E0C9AA70]);
}

- (void)_toggleCuration
{
  char v3;
  void *v4;
  _QWORD v5[5];
  char v6;

  v3 = !-[PXPhotosDetailsAssetsWidget _curate](self, "_curate");
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXPhotosDetailsAssetsWidget__toggleCuration__block_invoke;
  v5[3] = &unk_1E5144398;
  v5[4] = self;
  v6 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)userDidSelectSubtitle
{
  void *v3;
  int v4;
  void *v5;
  PXPhotosDataSourceStressTest *v6;
  id v7;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowEditorialLayoutStressTest");

  if (v4)
  {
    -[PXPhotosDetailsAssetsWidget _currentDataSourceStressTest](self, "_currentDataSourceStressTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = objc_alloc_init(PXPhotosDataSourceStressTest);
      -[PXPhotosDataSourceStressTest setMaximumAssetCount:](v6, "setMaximumAssetCount:", 6);
      -[PXPhotosDetailsAssetsWidget _setCurrentDataSourceStressTest:](self, "_setCurrentDataSourceStressTest:", v6);
      v5 = v6;
    }
    v7 = v5;
    objc_msgSend(v5, "setRunning:", objc_msgSend(v5, "isRunning") ^ 1);

  }
  else
  {
    -[PXPhotosDetailsAssetsWidget _userDidSelectCurationButton](self, "_userDidSelectCurationButton");
  }
}

- (BOOL)supportsSelection
{
  return 1;
}

- (void)setSelecting:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    if (!a3)
    {
      -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selectionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performChanges:", &__block_literal_global_282);

    }
    -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePlaybackEnabled");

    -[PXPhotosDetailsAssetsWidget _updateShowCurationButton](self, "_updateShowCurationButton");
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetLocalizedSubtitleDidChange:", self);

    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widgetLocalizedDisclosureTitleDidChange:", self);

  }
}

- (BOOL)supportsFaceMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "people");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") == 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    -[PXPhotosDetailsAssetsWidget _createNewLayout](self, "_createNewLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionToLayout:", v5);

  }
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  id v4;

  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetHasLoadedContentDataDidChange:", self);

  }
}

- (void)contentViewWillAppear
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimatesContent:", 1);

  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentViewVisible:", 1);

  -[PXPhotosDetailsAssetsWidget eventTracker](self, "eventTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logContentViewWillAppear");

}

- (void)contentViewDidDisappear
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimatesContent:", 0);

  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentViewVisible:", 0);

  -[PXPhotosDetailsAssetsWidget eventTracker](self, "eventTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logContentViewDidDisappear");

}

- (PXAssetActionManager)assetActionManager
{
  void *v3;
  void *v4;

  -[PXPhotosDetailsAssetsWidget _focusedAssetReference](self, "_focusedAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsAssetsWidget _assetActionManagerForAssetsReference:](self, "_assetActionManagerForAssetsReference:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetActionManager *)v4;
}

- (void)spaceBarWasPressed
{
  -[PXPhotosDetailsAssetsWidget _handleTapOnFocusedAssetReferenceWithActivity:](self, "_handleTapOnFocusedAssetReferenceWithActivity:", 0);
}

- (id)bestCursorTileForLiftingAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[12];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tilingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  if (v8
    && (objc_msgSend(v8, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_283, x, y, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3)), (_QWORD)v20))
  {
    objc_msgSend(v8, "currentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v19, 0, sizeof(v19));
    v15 = v22;
    v16 = v23;
    v17 = v24;
    v18 = v25;
    v13 = v20;
    v14 = v21;
    v10 = 0;
    if (objc_msgSend(v9, "getGeometry:group:userData:forTileWithIdentifier:", v19, 0, 0, &v13))
    {
      v12 = 0;
      v15 = v22;
      v16 = v23;
      v17 = v24;
      v18 = v25;
      v13 = v20;
      v14 = v21;
      v10 = 0;
      if (objc_msgSend(v8, "getTile:geometry:group:userData:forTileWithIdentifier:", &v12, 0, 0, 0, &v13))v10 = v12;
    }

  }
  else
  {
    -[PXPhotosDetailsAssetsWidget imageViewBasicTileForPreviewingAtPoint:](self, "imageViewBasicTileForPreviewingAtPoint:", x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)cursorInteractionEnabled
{
  return !-[PXPhotosDetailsAssetsWidget _curate](self, "_curate");
}

- (id)imageViewBasicTileForPreviewingAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  int v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  CGRect v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v8, x, y);
  v45 = 0u;
  v46 = 0u;
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
  if (*(_QWORD *)off_1E50B7E98)
  {
    v26 = v8;
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tilingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v45;
    v15 = v46;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    memset(&v34, 0, sizeof(v34));
    v28 = xmmword_1A7C0C200;
    v29 = v45;
    v30 = v46;
    v31 = 0u;
    v32 = 0u;
    v33 = 0;
    v16 = objc_msgSend(v13, "getGeometry:group:userData:forTileWithIdentifier:", &v34, 0, 0, &v28);
    v17 = v13;
    v10 = 0;
    if (v16)
    {
      objc_msgSend(v13, "visibleRect");
      v47.origin.x = v18;
      v47.origin.y = v19;
      v47.size.width = v20;
      v47.size.height = v21;
      if (CGRectIntersectsRect(v34, v47))
      {
        v27 = 0;
        -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "tilingController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = xmmword_1A7C0C200;
        v29 = v14;
        v30 = v15;
        v31 = 0u;
        v32 = 0u;
        v33 = 0;
        v24 = objc_msgSend(v23, "getTile:geometry:group:userData:forTileWithIdentifier:", &v27, 0, 0, 0, &v28);

        v10 = 0;
        if (v24)
          v10 = v27;
      }
      else
      {
        v10 = 0;
      }
      v17 = v13;
    }

    v8 = v26;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", a4, a3.x, a3.y, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXPhotosDetailsAssetsWidget _setNavigatedAssetReference:autoPlayVideo:](self, "_setNavigatedAssetReference:autoPlayVideo:", v5, 0);
    -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewViewControllerAllowingActions:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)genericPreviewViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  -[PXPhotosDetailsAssetsWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isAnyItemSelected"))
  {
    v13 = 0u;
    v14 = 0u;
    if (v6)
      objc_msgSend(v6, "firstSelectedIndexPath");
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v13;
    v12[1] = v14;
    objc_msgSend(v7, "objectReferenceAtIndexPath:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsAssetsWidget _setNavigatedAssetReference:autoPlayVideo:](self, "_setNavigatedAssetReference:autoPlayVideo:", v8, 0);
    -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewViewControllerAllowingActions:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didDismissPreviewViewController:committing:", v6, v4);

}

- (void)commitPreviewViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitPreviewViewController:", v4);

}

- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  double v12;
  _OWORD v14[2];

  v6 = a3;
  v7 = 1.0;
  if (!-[PXPhotosDetailsAssetsWidget isFaceModeEnabled](self, "isFaceModeEnabled"))
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photosDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)&a4->item;
    v14[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v14[1] = v10;
    objc_msgSend(v9, "assetAtSimpleIndexPath:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "aspectRatio");
    v7 = v12;

  }
  return v7;
}

- (double)engineDrivenLayout:(id)a3 zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  int v9;
  int64_t item;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  BOOL v20;
  double v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[2];

  v5 = a3;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_OWORD *)&a4->item;
  v27[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v27[1] = v8;
  v9 = objc_msgSend(v7, "isAssetAtIndexPathPartOfCuratedSet:", v27);
  item = a4->item;
  if (v5)
  {
    objc_msgSend(v5, "focusedIndexPath");
    v11 = a4->item;
    v13 = v24;
    v12 = v23;
    v14 = v26;
    v15 = v25;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v13 = 0;
    v12 = 0;
    v11 = a4->item;
  }
  v16 = 1000000.0;
  if (!v9)
    v16 = 0.0;
  v17 = v16 + (double)(100 * item);
  v20 = a4->dataSourceIdentifier == v12 && a4->section == v13 && v11 == v15;
  if (v20 && a4->subitem == v14)
    v21 = v17 + 2000000.0;
  else
    v21 = v17;

  return v21;
}

- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  void *v8;
  __int128 v9;
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
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  CGRect result;

  objc_msgSend(a3, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotosDetailsAssetsWidget isFaceModeEnabled](self, "isFaceModeEnabled"))
  {
    v9 = *(_OWORD *)&a4->item;
    v37 = *(_OWORD *)&a4->dataSourceIdentifier;
    v38 = v9;
    objc_msgSend(v8, "primaryFaceForAssetAtItemIndexPath:", &v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "normalizedCropRect");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
    }
    else
    {
      v26 = *(_OWORD *)&a4->item;
      v37 = *(_OWORD *)&a4->dataSourceIdentifier;
      v38 = v26;
      objc_msgSend(v8, "assetAtItemIndexPath:", &v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 1, a5);
      v13 = v28;
      v15 = v29;
      v17 = v30;
      v19 = v31;

      v11 = 0;
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v8, "numberOfItemsInSection:", a4->section) >> 3 <= 0x270)
  {
    v20 = *(_OWORD *)&a4->item;
    v37 = *(_OWORD *)&a4->dataSourceIdentifier;
    v38 = v20;
    objc_msgSend(v8, "assetAtItemIndexPath:", &v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v36[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v8, "assetCollectionAtSectionIndexPath:", v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, objc_msgSend(v21, "px_shouldUseFacesRectForSmartCropping"), a5);
    v13 = v22;
    v15 = v23;
    v17 = v24;
    v19 = v25;

LABEL_8:
    goto LABEL_9;
  }
  v13 = *(double *)off_1E50B86D0;
  v15 = *((double *)off_1E50B86D0 + 1);
  v17 = *((double *)off_1E50B86D0 + 2);
  v19 = *((double *)off_1E50B86D0 + 3);
LABEL_9:

  v32 = v13;
  v33 = v15;
  v34 = v17;
  v35 = v19;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[8];
  _QWORD v20[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSpecManagerObservationContext_172754 != a5)
  {
    if ((void *)PXStressTestObservationContext != a5)
    {
      if ((void *)PXPhotosDetailsContextObservationContext_172755 != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 1374, CFSTR("unknown observation context"));
LABEL_22:

        goto LABEL_23;
      }
      if ((v6 & 0x30) != 0)
      {
        -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "widgetLocalizedTitleDidChange:", self);

      }
      if ((v6 & 8) != 0)
      {
        PLPeopleGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotosDetailsAssetsWidget: People changed, will refresh Data Source", v19, 2u);
        }

        -[PXPhotosDetailsAssetsWidget _photosDataSource](self, "_photosDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        -[PXPhotosDetailsAssetsWidget context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "people");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_refreshSortDescriptorsInPhotosDataSource:withPeople:", v10, v15);

        objc_msgSend(v10, "firstAssetCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "setWantsCuration:forAssetCollection:", -[PXPhotosDetailsAssetsWidget _curate](self, "_curate"), v16);

        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if ((v6 & 1) != 0)
    {
      -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "widgetLocalizedSubtitleDidChange:", self);

      if ((v6 & 2) == 0)
      {
LABEL_9:
        if ((v6 & 4) == 0)
          goto LABEL_23;
        goto LABEL_21;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_9;
    }
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__PXPhotosDetailsAssetsWidget_observable_didChange_context___block_invoke;
    v20[3] = &unk_1E5149198;
    v20[4] = self;
    objc_msgSend(v18, "performChanges:", v20);

    if ((v6 & 4) == 0)
      goto LABEL_23;
LABEL_21:
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetLocalizedTitleDidChange:", self);
    goto LABEL_22;
  }
  if ((v6 & 1) != 0)
  {
    -[PXPhotosDetailsAssetsWidget _invalidateLayoutGenerator](self, "_invalidateLayoutGenerator");
    -[PXPhotosDetailsAssetsWidget _updateLayoutEngineIfNeeded](self, "_updateLayoutEngineIfNeeded");
    -[PXPhotosDetailsAssetsWidget _updateTilingLayoutIfNeeded](self, "_updateTilingLayoutIfNeeded");
    -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetInvalidateContentLayoutStyle:", self);
    goto LABEL_22;
  }
LABEL_23:

}

- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = a4;
  -[PXPhotosDetailsAssetsWidget _updateHasLoadedContentData](self, "_updateHasLoadedContentData");
  -[PXPhotosDetailsAssetsWidget _updateShowCurationButton](self, "_updateShowCurationButton");
  -[PXPhotosDetailsAssetsWidget _updateFocusedAssetReference](self, "_updateFocusedAssetReference");
  -[PXPhotosDetailsAssetsWidget _updateDraggingAssetReferencesWithDataSource:](self, "_updateDraggingAssetReferencesWithDataSource:", v5);

  -[PXPhotosDetailsAssetsWidget _logAssetCountsIfNecessary](self, "_logAssetCountsIfNecessary");
  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widget:animateChanges:withAnimationOptions:", self, 0, 0);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PXPhotosDetailsAssetsWidget_assetsScene_didTransitionToDataSource___block_invoke;
  v7[3] = &unk_1E5148D30;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXPhotosDetailsAssetsWidget _updateLayoutEngineIfNeeded](self, "_updateLayoutEngineIfNeeded");
  v7 = (void *)MEMORY[0x1E0C99E20];
  -[PXPhotosDetailsAssetsWidget _hiddenAssetReferences](self, "_hiddenAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PXPhotosDetailsAssetsWidget _hiddenAssetReferences](self, "_hiddenAssetReferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v6, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v12);
  }

  -[PXPhotosDetailsAssetsWidget _setHiddenAssetReferences:](self, "_setHiddenAssetReferences:", v9);
  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataSourceSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "identifier");

  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "changeHistory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v18, objc_msgSend(v6, "identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count") == 1)
  {
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __63__PXPhotosDetailsAssetsWidget_assetsScene_layoutForDataSource___block_invoke;
  v36 = &unk_1E513C7A8;
  v24 = v6;
  v37 = v24;
  v25 = v22;
  v38 = v25;
  v26 = (id)objc_msgSend(v23, "performChangesAndWait:", &v33);

  -[PXPhotosDetailsAssetsWidget _createNewLayout](self, "_createNewLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqual:", v24);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 1425, CFSTR("Should be getting a layout with the updated correct data source from the layout engine %@ != %@"), v24, v32, v33, v34, v35, v36, v37);

  }
  return v27;
}

- (id)assetsScene:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _PXAssetsWidgetTileIdentifierConverter *v9;
  PXComposedTileIdentifierConverter *v10;
  void *v11;
  PXComposedTileIdentifierConverter *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "tilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilingController:tileIdentifierConverterForChange:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(_PXAssetsWidgetTileIdentifierConverter);
  v10 = [PXComposedTileIdentifierConverter alloc];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXComposedTileIdentifierConverter initWithTileIdentifierConverters:](v10, "initWithTileIdentifierConverters:", v11);

  return v12;
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;

  v7 = a4;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a3->index[5];
  v27 = *(_OWORD *)&a3->index[3];
  v28 = v9;
  v29 = *(_OWORD *)&a3->index[7];
  v30 = a3->index[9];
  v10 = *(_OWORD *)&a3->index[1];
  v25 = *(_OWORD *)&a3->length;
  v26 = v10;
  if (!objc_msgSend(v8, "providesTileForIdentifier:", &v25))
  {
    if (a3->length == 1)
    {
      v14 = a3->index[0];
      if (v14 == 32100)
      {
        v15 = 1500;
      }
      else
      {
        if (v14 != 32101)
          goto LABEL_15;
        v15 = 1501;
      }
      objc_msgSend(v8, "viewTileReusePool");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "checkOutReusableObjectWithReuseIdentifier:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableSet addObject:](self->_tilesInUse, "addObject:", v13);
      if (v13)
        goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_OWORD *)&a3->index[5];
    v27 = *(_OWORD *)&a3->index[3];
    v28 = v18;
    v29 = *(_OWORD *)&a3->index[7];
    v30 = a3->index[9];
    v19 = *(_OWORD *)&a3->index[1];
    v25 = *(_OWORD *)&a3->length;
    v26 = v19;
    PXTileIdentifierDescription((unint64_t *)&v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 1470, CFSTR("%@ couldn't check out tile for identifier:%@, layout:%@"), self, v20, v7);

    v13 = 0;
    goto LABEL_16;
  }
  v11 = *(_OWORD *)&a3->index[5];
  v27 = *(_OWORD *)&a3->index[3];
  v28 = v11;
  v29 = *(_OWORD *)&a3->index[7];
  v30 = a3->index[9];
  v12 = *(_OWORD *)&a3->index[1];
  v25 = *(_OWORD *)&a3->length;
  v26 = v12;
  v13 = (void *)objc_msgSend(v8, "checkOutTileForIdentifier:layout:", &v25, v7);
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL && a3->index[0] == 6332437)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v13, "setDelegate:", self);
  }
  if (!v13)
    goto LABEL_15;
LABEL_16:
  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_OWORD *)&a3->index[5];
  v27 = *(_OWORD *)&a3->index[3];
  v28 = v22;
  v29 = *(_OWORD *)&a3->index[7];
  v30 = a3->index[9];
  v23 = *(_OWORD *)&a3->index[1];
  v25 = *(_OWORD *)&a3->length;
  v26 = v23;
  objc_msgSend(v21, "checkOutTile:withIdentifier:", v13, &v25);

  return v13;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;

  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->index[5];
  v18 = *(_OWORD *)&a4->index[3];
  v19 = v8;
  v20 = *(_OWORD *)&a4->index[7];
  v21 = a4->index[9];
  v9 = *(_OWORD *)&a4->index[1];
  v16 = *(_OWORD *)&a4->length;
  v17 = v9;
  objc_msgSend(v7, "checkInTile:withIdentifier:", a3, &v16);

  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a4->index[5];
  v18 = *(_OWORD *)&a4->index[3];
  v19 = v11;
  v20 = *(_OWORD *)&a4->index[7];
  v21 = a4->index[9];
  v12 = *(_OWORD *)&a4->index[1];
  v16 = *(_OWORD *)&a4->length;
  v17 = v12;
  if (objc_msgSend(v10, "providesTileForIdentifier:", &v16))
  {
    v13 = *(_OWORD *)&a4->index[5];
    v18 = *(_OWORD *)&a4->index[3];
    v19 = v13;
    v20 = *(_OWORD *)&a4->index[7];
    v21 = a4->index[9];
    v14 = *(_OWORD *)&a4->index[1];
    v16 = *(_OWORD *)&a4->length;
    v17 = v14;
    objc_msgSend(v10, "checkInTile:withIdentifier:", a3, &v16);
  }
  else
  {
    objc_msgSend(v10, "viewTileReusePool");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "checkInReusableObject:", a3);

    -[NSMutableSet removeObject:](self->_tilesInUse, "removeObject:", a3);
  }

}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  SEL v37;
  void *v38;
  id v39;
  CGPoint result;
  CGRect v41;
  CGRect v42;

  v7 = a3;
  v8 = a4;
  -[PXPhotosDetailsAssetsWidget _currentDataSourceStressTest](self, "_currentDataSourceStressTest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRunning");

  if (!v10)
  {
    v37 = a2;
    objc_msgSend(v7, "currentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(v15, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photosDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "wantsCurationForFirstAssetCollection");

    objc_msgSend(v18, "photosDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "wantsCurationForFirstAssetCollection");

    objc_msgSend(v17, "photosDataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortDescriptors");
    v39 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "photosDataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sortDescriptors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v20 != v22)
          {
LABEL_9:
            -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:", self);

            if (!v28)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("PXPhotosDetailsAssetsWidget.m"), 1515, CFSTR("Code which should be unreachable has been reached"));

              abort();
            }
            objc_msgSend(v15, "contentBounds");
            CGRectGetMinX(v41);
            objc_msgSend(v15, "contentBounds");
            PXRectEdgeValue();
            objc_msgSend(v15, "visibleRect");
            PXPointSubtract();
            objc_msgSend(v16, "contentBounds");
            CGRectGetMinX(v42);
            objc_msgSend(v16, "contentBounds");
            PXRectEdgeValue();
            PXPointSubtract();
            goto LABEL_15;
          }
          v25 = v38;
          if (v39 == v25)
          {

          }
          else
          {
            v26 = objc_msgSend(v39, "isEqual:", v25);

            if ((v26 & 1) == 0)
              goto LABEL_9;
          }
        }
      }
    }
    -[PXPhotosDetailsAssetsWidget _visibleOriginScrollTarget](self, "_visibleOriginScrollTarget");
    if ((PXPointIsNull() & 1) != 0)
    {
      -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tilingController:initialVisibleOriginForLayout:", v7, v16);
      v12 = v32;
      v14 = v33;

LABEL_16:
      goto LABEL_17;
    }
    -[PXPhotosDetailsAssetsWidget _visibleOriginScrollTarget](self, "_visibleOriginScrollTarget");
LABEL_15:
    v12 = v29;
    v14 = v30;
    goto LABEL_16;
  }
  objc_msgSend(v8, "contentBounds");
  v12 = v11;
  v14 = v13 + -100.0;
LABEL_17:

  v34 = v12;
  v35 = v14;
  result.y = v35;
  result.x = v34;
  return result;
}

- (CGPoint)tilingController:(id)a3 targetVisibleOriginForLayout:(id)a4 proposedVisibleOrigin:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v10 = a3;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tilingController:targetVisibleOriginForLayout:proposedVisibleOrigin:", v10, v9, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tilingController:tileIdentifierConverterForChange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (-[PXPhotosDetailsAssetsWidget _transitionWithoutAnimation](self, "_transitionWithoutAnimation"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "fromLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "toLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "photosDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "wantsCurationForFirstAssetCollection");

    objc_msgSend(v12, "photosDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "wantsCurationForFirstAssetCollection");

    if (v10 == v12)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    if (v14 == v16)
      goto LABEL_8;
    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "changeHistory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:changeHistory:](PXAssetsTileTransitionCoordinator, "transitionCoordinatorForChange:changeHistory:", v7, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTreatRemovalsAsDeletes:", 0);
    if (!v8)
    {
LABEL_8:
      -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tilingController:transitionAnimationCoordinatorForChange:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PXPhotosDetailsAssetsWidget dragSession](self, "dragSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "state") == 3 && !v4)
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentCoordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_locationInCoordinateSpace:", v7);
    v9 = v8;
    v11 = v10;

    -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v9, v11, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[PXPhotosDetailsAssetsWidget _handleTapOnAssetReference:autoPlayVideo:activity:](self, "_handleTapOnAssetReference:autoPlayVideo:activity:", v12, 0, 0);

  }
}

- (void)handlePress:(id)a3
{
  -[PXPhotosDetailsAssetsWidget _handleTapOnFocusedAssetReferenceWithActivity:](self, "_handleTapOnFocusedAssetReferenceWithActivity:", 1);
}

- (void)handlePinch:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handlePresentingPinchGestureRecognizer:", v19);

  if ((v5 & 1) == 0
    && !-[PXPhotosDetailsAssetsWidget isSelecting](self, "isSelecting")
    && (objc_msgSend(v19, "state") == 1 || objc_msgSend(v19, "state") == 2))
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentCoordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_locationInCoordinateSpace:", v8);
    v10 = v9;
    v12 = v11;

    -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v10, v12, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
      if (!WeakRetained
        || (v15 = WeakRetained,
            v16 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
            v17 = objc_msgSend(v16, "photosDetailsAssetWidget:shouldPresentOneUpForAssetReference:", self, v13),
            v16,
            v15,
            v17))
      {
        -[PXPhotosDetailsAssetsWidget _setNavigatedAssetReference:autoPlayVideo:](self, "_setNavigatedAssetReference:autoPlayVideo:", v13, 0);
        -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startWithConfigurationHandler:", &__block_literal_global_298);

      }
    }

  }
}

- (void)handleTouch:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "state");
  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetScrollViewControllerHostingWidget:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 1
      && (objc_msgSend(v7, "isDragging") & 1) == 0
      && !-[PXPhotosDetailsAssetsWidget _canDragOut](self, "_canDragOut"))
    {
      -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentCoordinateSpace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "px_locationInCoordinateSpace:", v11);
      -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsAssetsWidget _setHighlightedAssetReference:](self, "_setHighlightedAssetReference:", v12);

    }
  }
  else
  {
    -[PXPhotosDetailsAssetsWidget _setHighlightedAssetReference:](self, "_setHighlightedAssetReference:", 0);
  }

}

- (void)presentOneUpForAssetReference:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  int v13;
  void *v14;
  _QWORD v15[4];
  BOOL v16;
  __int128 v17;
  __int128 v18;

  v6 = a3;
  if (-[PXPhotosDetailsAssetsWidget _curate](self, "_curate"))
    -[PXPhotosDetailsAssetsWidget _toggleCuration](self, "_toggleCuration");
  v17 = 0u;
  v18 = 0u;
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPathForAssetReference:", v6);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }

  if ((_QWORD)v17 != *(_QWORD *)off_1E50B7E98)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
    if (!WeakRetained
      || (v11 = WeakRetained,
          v12 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
          v13 = objc_msgSend(v12, "photosDetailsAssetWidget:shouldPresentOneUpForAssetReference:", self, v6),
          v12,
          v11,
          v13))
    {
      -[PXPhotosDetailsAssetsWidget _setNavigatedAssetReference:autoPlayVideo:](self, "_setNavigatedAssetReference:autoPlayVideo:", v6, 0);
      -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__PXPhotosDetailsAssetsWidget_presentOneUpForAssetReference_animated___block_invoke;
      v15[3] = &__block_descriptor_33_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      v16 = a4;
      objc_msgSend(v14, "startWithConfigurationHandler:", v15);

    }
  }

}

- (void)_handleTapOnAssetReference:(id)a3 autoPlayVideo:(BOOL)a4 activity:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  int v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  char v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;

  v6 = a4;
  v8 = a3;
  if (-[PXPhotosDetailsAssetsWidget isSelecting](self, "isSelecting"))
  {
    v25 = 0u;
    v26 = 0u;
    if (v8)
      objc_msgSend(v8, "indexPath");
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "selectionSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v25;
    v24[1] = v26;
    v12 = objc_msgSend(v11, "isIndexPathSelected:", v24);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke;
    v20[3] = &__block_descriptor_65_e37_v16__0___PXMutableSelectionManager__8l;
    v21 = v25;
    v22 = v26;
    v23 = v12;
    objc_msgSend(v10, "performChanges:", v20);

  }
  else
  {
    -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isContextMenuInteractionActive") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
      if (!WeakRetained
        || (v15 = WeakRetained,
            v16 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
            v17 = objc_msgSend(v16, "photosDetailsAssetWidget:shouldPresentOneUpForAssetReference:", self, v8),
            v16,
            v15,
            v17))
      {
        -[PXPhotosDetailsAssetsWidget _setNavigatedAssetReference:autoPlayVideo:](self, "_setNavigatedAssetReference:autoPlayVideo:", v8, v6);
        -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke_2;
        v19[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
        v19[4] = a5;
        objc_msgSend(v18, "startWithConfigurationHandler:", v19);

      }
    }

  }
}

- (void)_handleTapOnFocusedAssetReferenceWithActivity:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PXPhotosDetailsAssetsWidget _focusedAssetReference](self, "_focusedAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[PXPhotosDetailsAssetsWidget _handleTapOnAssetReference:autoPlayVideo:activity:](self, "_handleTapOnAssetReference:autoPlayVideo:activity:", v5, 0, a3);
    v5 = v6;
  }

}

- (void)playButtonTileWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = a3;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  -[PXPhotosDetailsAssetsWidget _tilingController](self, "_tilingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tileIdentifierForTile:", v4);
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }

  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");

  if ((unint64_t)(v14 - 3) <= 2 && (_QWORD)v15 != 0x7FFFFFFFFFFFFFFFLL && (_QWORD)v15 == v9)
  {
    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v15;
    v13[1] = v16;
    objc_msgSend(v11, "assetReferenceAtItemIndexPath:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[PXPhotosDetailsAssetsWidget _handleTapOnAssetReference:autoPlayVideo:activity:](self, "_handleTapOnAssetReference:autoPlayVideo:activity:", v12, 1, 0);

  }
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  int64_t v9;

  -[PXPhotosDetailsAssetsWidget context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "viewSourceOrigin");
  v6 = -[PXPhotosDetailsAssetsWidget _curate](self, "_curate");
  switch(v5)
  {
    case 2:
      v7 = !v6;
      v8 = 18;
      goto LABEL_11;
    case 3:
      v7 = !v6;
      v8 = 20;
      goto LABEL_11;
    case 4:
      v7 = !v6;
      v8 = 22;
      goto LABEL_11;
    case 5:
      v7 = !v6;
      v8 = 24;
      goto LABEL_11;
    case 6:
      v7 = !v6;
      v8 = 28;
      goto LABEL_11;
    case 7:
      v7 = !v6;
      v8 = 30;
      goto LABEL_11;
    case 8:
      v7 = !v6;
      v8 = 32;
      goto LABEL_11;
    case 9:
      v7 = !v6;
      v8 = 26;
LABEL_11:
      if (v7)
        v9 = v8 + 1;
      else
        v9 = v8;
      break;
    case 10:
      v9 = 35;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDetailsAssetsWidget _navigatedAssetReference](self, "_navigatedAssetReference", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsAssetsWidget _assetActionManagerForAssetsReference:](self, "_assetActionManagerForAssetsReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  _OWORD v27[2];

  v5 = a4;
  memset(v27, 0, sizeof(v27));
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "indexPathForAssetReference:", v5);
  else
    memset(v27, 0, sizeof(v27));

  v10 = *(_QWORD *)&v27[0];
  if (*(_QWORD *)&v27[0] == *(_QWORD *)off_1E50B7E98)
  {
    v11 = 0;
  }
  else
  {
    v18 = *(_OWORD *)((char *)v27 + 8);
    v12 = *((_QWORD *)&v27[1] + 1);
    v26 = 0;
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tilingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = xmmword_1A7C0C200;
    v20 = v10;
    v21 = v18;
    v22 = v12;
    v23 = 0u;
    v24 = 0u;
    v25 = 0;
    v15 = objc_msgSend(v14, "getTile:geometry:group:userData:forTileWithIdentifier:", &v26, 0, 0, 0, &v19);

    v11 = 0;
    if (v15)
    {
      v16 = v26;
      if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EEAEAF60))
      {
        objc_msgSend(v16, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
  }

  return v11;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  return -[PXPhotosDetailsAssetsWidget _regionOfInterestForAssetReference:](self, "_regionOfInterestForAssetReference:", a4);
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _OWORD v42[12];
  _OWORD v43[2];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v5 = a4;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scrollController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIfNeeded");

  objc_msgSend(v7, "currentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "currentLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  memset(v43, 0, sizeof(v43));
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "indexPathForAssetReference:", v5);
  else
    memset(v43, 0, sizeof(v43));

  if (*(_QWORD *)&v43[0] != *(_QWORD *)off_1E50B7E98)
  {
    memset(v42, 0, sizeof(v42));
    v35 = xmmword_1A7C0C200;
    v36 = *(_QWORD *)&v43[0];
    v37 = *(_OWORD *)((char *)v43 + 8);
    v38 = *((_QWORD *)&v43[1] + 1);
    v39 = 0u;
    v40 = 0u;
    v41 = 0;
    if (objc_msgSend(v10, "getGeometry:group:userData:forTileWithIdentifier:", v42, 0, 0, &v35))
    {
      PXEdgeInsetsMake();
      objc_msgSend(v7, "scrollController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentInset");

      sub_1A7AE3F38();
      PXEdgeInsetsInsetRect();
      sub_1A7AE3F38();
      PXEdgeInsetsInsetRect();
      v15 = v14;
      v31 = v14;
      v32 = v16;
      v18 = v17;
      v19 = v16;
      v30 = v20;
      objc_msgSend(v10, "visibleRect");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v29 = v25;
      v28 = v27;
      v44.origin.x = v15;
      v44.origin.y = v18;
      v44.size.width = v19;
      v44.size.height = v30;
      CGRectGetMaxX(v44);
      v45.origin.x = v22;
      v45.origin.y = v24;
      v45.size.width = v26;
      v45.size.height = v28;
      CGRectGetMaxX(v45);
      v46.origin.x = v31;
      v46.origin.y = v18;
      v46.size.width = v32;
      v46.size.height = v30;
      CGRectGetMinX(v46);
      v47.origin.x = v22;
      v47.origin.y = v24;
      v47.size.width = v29;
      v47.size.height = v28;
      CGRectGetMinX(v47);
      v48.origin.x = v31;
      v48.origin.y = v18;
      v48.size.width = v32;
      v48.size.height = v30;
      CGRectGetMaxY(v48);
      v49.origin.x = v22;
      v49.origin.y = v24;
      v49.size.width = v29;
      v49.size.height = v28;
      CGRectGetMaxY(v49);
      v50.origin.x = v31;
      v50.size.width = v32;
      v50.origin.y = v18;
      v50.size.height = v30;
      CGRectGetMinY(v50);
      v51.origin.x = v22;
      v51.origin.y = v24;
      v51.size.width = v29;
      v51.size.height = v28;
      CGRectGetMinY(v51);
      PXPointAdd();
      -[PXPhotosDetailsAssetsWidget _setVisibleOriginScrollTarget:](self, "_setVisibleOriginScrollTarget:");
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __79__PXPhotosDetailsAssetsWidget_oneUpPresentation_scrollAssetReferenceToVisible___block_invoke;
      v33[3] = &unk_1E5148D08;
      v33[4] = self;
      v34 = v10;
      -[PXPhotosDetailsAssetsWidget _performTilingChangeWithoutAnimationTransition:](self, "_performTilingChangeWithoutAnimationTransition:", v33);
      -[PXPhotosDetailsAssetsWidget _setVisibleOriginScrollTarget:](self, "_setVisibleOriginScrollTarget:", *(double *)off_1E50B8580, *((double *)off_1E50B8580 + 1));

    }
  }

}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PXPhotosDetailsAssetsWidget_oneUpPresentation_setHiddenAssetReferences___block_invoke;
  v16[3] = &unk_1E5148D08;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  -[PXPhotosDetailsAssetsWidget _performTilingChangeWithoutAnimationTransition:](self, "_performTilingChangeWithoutAnimationTransition:", v16);

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  -[PXPhotosDetailsAssetsWidget _setHighlightedAssetReference:](self, "_setHighlightedAssetReference:", 0);
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[PXPhotosDetailsAssetsWidget oneUpPresentation](self, "oneUpPresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidatePresentingGeometry");

  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleRectDidChange");

}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  id v3;

  -[PXPhotosDetailsAssetsWidget _inlinePlaybackController](self, "_inlinePlaybackController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRectDidChange");

}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  void *v3;
  id v4;

  -[PXPhotosDetailsAssetsWidget context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performChanges:", &__block_literal_global_310_172733);
}

- (BOOL)swipeSelectionManager:(id)a3 shouldBeginSelectionAtLocation:(CGPoint)a4
{
  void *v4;

  -[PXPhotosDetailsAssetsWidget dragSession](self, "dragSession", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == 0;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);
  v15 = v14;
  v17 = v16;

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v15, v17, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "frame");
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  return -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v15, v17, v19, v20, v21, v22);
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "frame");
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  return -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v15, v17, v19, v20, v21, v22);
}

- (BOOL)shouldEnablePlaybackForController:(id)a3
{
  _BOOL4 v4;

  v4 = -[PXPhotosDetailsAssetsWidget _curate](self, "_curate", a3);
  if (v4)
    LOBYTE(v4) = !-[PXPhotosDetailsAssetsWidget isSelecting](self, "isSelecting");
  return v4;
}

- (CGSize)minimumItemSizeForPlaybackInController:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PXPhotosDetailsAssetsWidget _layoutEngine](self, "_layoutEngine", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "minHeroItemsSize");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *(double *)off_1E50B8810;
    v8 = *((double *)off_1E50B8810 + 1);
  }

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  double v13;

  v4 = a3;
  if (-[PXPhotosDetailsAssetsWidget isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentCoordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "px_locationInCoordinateSpace:", v7);
    v8 = -[PXPhotosDetailsAssetsWidget _isLocationWithinCurrentLayoutBounds:](self, "_isLocationWithinCurrentLayoutBounds:");
    -[PXPhotosDetailsAssetsWidget _pinchGesture](self, "_pinchGesture");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v9 == v4;
    v11 = v9 != v4 && v8;
    if (v10 && v8)
    {
      -[PXPhotosDetailsAssetsWidget _pinchGesture](self, "_pinchGesture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "velocity");
      v11 = v13 > 0.0;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  -[PXPhotosDetailsAssetsWidget _touchGesture](self, "_touchGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = 1;
  }
  else
  {
    -[PXPhotosDetailsAssetsWidget _touchGesture](self, "_touchGesture");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v6;

  }
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PXPhotosDetailsAssetsWidget _pinchGesture](self, "_pinchGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[PXPhotosDetailsAssetsWidget _swipeSelectionManager](self, "_swipeSelectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gesturesForFailureRequirements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "containsObject:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_canDragOut
{
  void *v2;
  char v3;

  +[PXDragAndDropSettings sharedInstance](PXDragAndDropSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dragOutEnabled");

  return v3;
}

- (id)_imageTileForDragItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  int v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  CGRect v31;
  __int128 v32;
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
  __int128 v43;
  CGRect v44;

  objc_msgSend(a3, "localObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "assetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetReferenceForAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPath");
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }

  if ((_QWORD)v42 != *(_QWORD *)off_1E50B7E98)
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tilingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v42;
      v15 = v43;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      memset(&v31, 0, sizeof(v31));
      v25 = xmmword_1A7C0C200;
      v26 = v42;
      v27 = v43;
      v28 = 0u;
      v29 = 0u;
      v30 = 0;
      v10 = 0;
      if (!objc_msgSend(v13, "getGeometry:group:userData:forTileWithIdentifier:", &v31, 0, 0, &v25))
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v13, "visibleRect");
      v44.origin.x = v16;
      v44.origin.y = v17;
      v44.size.width = v18;
      v44.size.height = v19;
      if (CGRectIntersectsRect(v31, v44))
      {
        v24 = 0;
        -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tilingController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = xmmword_1A7C0C200;
        v26 = v14;
        v27 = v15;
        v28 = 0u;
        v29 = 0u;
        v30 = 0;
        v22 = objc_msgSend(v21, "getTile:geometry:group:userData:forTileWithIdentifier:", &v24, 0, 0, 0, &v25);

        v10 = 0;
        if (v22)
          v10 = v24;
        goto LABEL_12;
      }
    }
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)_dragItemForAssetReference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PXDraggingItemLocalObject *v7;

  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXDragAndDropItemProviderForDisplayAsset(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v5);
    v7 = -[PXDraggingItemLocalObject initWithAssetReference:]([PXDraggingItemLocalObject alloc], "initWithAssetReference:", v3);
    objc_msgSend(v6, "setLocalObject:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_addAssetReferencesToDrag:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = -[PXPhotosDetailsAssetsWidget _canDragAssetReferences:](self, "_canDragAssetReferences:", v4);
  if (v5)
  {
    -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setByAddingObjectsFromSet:", v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v4;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PXPhotosDetailsAssetsWidget__addAssetReferencesToDrag___block_invoke;
    v11[3] = &unk_1E5148D08;
    v11[4] = self;
    v12 = v8;
    v9 = v8;
    -[PXPhotosDetailsAssetsWidget _performTilingChangeWithoutAnimationTransition:](self, "_performTilingChangeWithoutAnimationTransition:", v11);

  }
  else
  {
    -[PXPhotosDetailsAssetsWidget _presentConfidentialityWarning](self, "_presentConfidentialityWarning");
  }

  return v5;
}

- (void)_updateDraggingAssetReferencesWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[PXPhotosDetailsAssetsWidget _setDraggingAssetReferences:](self, "_setDraggingAssetReferences:", v7);
}

- (BOOL)_canDragAssetReferences:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "asset", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EEB87F40)
            && +[PXSharingConfidentialityController confidentialWarningRequiredForAsset:](PXSharingConfidentialityController, "confidentialWarningRequiredForAsset:", v9))
          {

            v10 = 0;
            goto LABEL_14;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_14:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_presentConfidentialityWarning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:style:handler:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharingConfidentialityController confidentialityAlertWithActions:](PXSharingConfidentialityController, "confidentialityAlertWithActions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widget:transitionToViewController:withTransitionType:", self, v7, 2);

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  PXPhotosDetailsAssetsWidget *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  uint8_t buf[32];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ itemsForBeginningSession: %@", buf, 0x16u);
  }

  if (-[PXPhotosDetailsAssetsWidget _canDragOut](self, "_canDragOut"))
  {
    -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v11);
    v13 = v12;
    v15 = v14;
    objc_msgSend(v9, "scrollViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentCoordinateSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v11, v13, v15);
    memset(buf, 0, sizeof(buf));
    -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
    if (*(_QWORD *)buf == *(_QWORD *)off_1E50B7E98)
    {
      v18 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = *(_OWORD *)buf;
      v48 = *(_OWORD *)&buf[16];
      v41 = v21;
      objc_msgSend(v21, "assetReferenceAtItemIndexPath:", &v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v22);

      if ((v24 & 1) != 0)
      {
        v18 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(v9, "selectionManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "selectionSnapshot");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_OWORD *)buf;
        v48 = *(_OWORD *)&buf[16];
        v40 = v22;
        if (objc_msgSend(v26, "isIndexPathSelected:", &v47))
        {
          v37 = v25;
          v38 = v26;
          objc_msgSend(v26, "selectedIndexPaths");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v27, "count"));
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __72__PXPhotosDetailsAssetsWidget_dragInteraction_itemsForBeginningSession___block_invoke;
          v42[3] = &unk_1E513AAF8;
          v43 = v41;
          v44 = self;
          v30 = v29;
          v45 = v30;
          v31 = v28;
          v46 = v31;
          objc_msgSend(v27, "enumerateItemIndexPathsUsingBlock:", v42);
          if (-[PXPhotosDetailsAssetsWidget _addAssetReferencesToDrag:](self, "_addAssetReferencesToDrag:", v31))
            v18 = v30;
          else
            v18 = (id)MEMORY[0x1E0C9AA60];

          v25 = v37;
          v26 = v38;
        }
        else
        {
          -[PXPhotosDetailsAssetsWidget _dragItemForAssetReference:](self, "_dragItemForAssetReference:", v22);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = v22;
            v27 = (void *)v32;
            v39 = v26;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[PXPhotosDetailsAssetsWidget _addAssetReferencesToDrag:](self, "_addAssetReferencesToDrag:", v34);

            if (v35)
            {
              v49 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = (id)MEMORY[0x1E0C9AA60];
            }
            v26 = v39;
          }
          else
          {
            v27 = 0;
            v18 = (id)MEMORY[0x1E0C9AA60];
          }
        }

        v22 = v40;
      }

    }
    v19 = v18;

  }
  else
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v30;
  _OWORD v31[2];
  void *v32;
  uint8_t buf[40];
  uint64_t v34;
  CGPoint v35;

  y = a5.y;
  x = a5.x;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v35.x = x;
    v35.y = y;
    NSStringFromCGPoint(v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ itemsForAddingToSession: %@ withTouchAtPoint: %@", buf, 0x20u);

  }
  -[PXPhotosDetailsAssetsWidget _assetsScene](self, "_assetsScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrollViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrollViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentCoordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v15, x, y);
  memset(buf, 0, 32);
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
  if (*(_QWORD *)buf == *(_QWORD *)off_1E50B7E98)
  {
    v18 = 0;
  }
  else
  {
    v30 = v9;
    -[PXPhotosDetailsAssetsWidget _dataSourceManager](self, "_dataSourceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = *(_OWORD *)buf;
    v31[1] = *(_OWORD *)&buf[16];
    objc_msgSend(v20, "assetReferenceAtItemIndexPath:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsAssetsWidget _draggingAssetReferences](self, "_draggingAssetReferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v21);

    if ((v23 & 1) != 0)
    {
      v18 = 0;
      v9 = v30;
    }
    else
    {
      -[PXPhotosDetailsAssetsWidget _dragItemForAssetReference:](self, "_dragItemForAssetReference:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24
        && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = -[PXPhotosDetailsAssetsWidget _addAssetReferencesToDrag:](self, "_addAssetReferencesToDrag:", v25),
            v25,
            v26))
      {
        v32 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      v9 = v30;

    }
  }
  v27 = (void *)MEMORY[0x1E0C9AA60];
  if (v18)
    v27 = v18;
  v28 = v27;

  return v28;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v43 = 138412802;
    v44 = v8;
    v45 = 2112;
    v46 = v9;
    v47 = 2112;
    v48 = v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ previewForLiftingItem: %@ session: %@", (uint8_t *)&v43, 0x20u);
  }

  -[PXPhotosDetailsAssetsWidget _imageTileForDragItem:](self, "_imageTileForDragItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EEAEAF60))
  {
    v13 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v12, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v15 = (void *)objc_msgSend(v13, "initWithFrame:");

    objc_msgSend(v12, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v16);

    objc_msgSend(v12, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentMode:", objc_msgSend(v17, "contentMode"));

    objc_msgSend(v12, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClipsToBounds:", objc_msgSend(v18, "clipsToBounds"));

    objc_msgSend(v12, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentsRect");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v15, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentsRect:", v22, v24, v26, v28);

    objc_msgSend(v15, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setZPosition:", 3.40282347e38);

    objc_msgSend(v12, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    PXRectGetCenter();
    v33 = v32;
    v35 = v34;
    v36 = objc_alloc_init(MEMORY[0x1E0DC3768]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v37);

    v38 = objc_alloc(MEMORY[0x1E0DC3770]);
    objc_msgSend(v31, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithContainer:center:", v39, v33, v35);

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v15, v36, v40);
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v25 = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ previewForCancellingItem: %@", (uint8_t *)&v25, 0x16u);
  }

  -[PXPhotosDetailsAssetsWidget _imageTileForDragItem:](self, "_imageTileForDragItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    PXRectGetCenter();
    v15 = v14;
    v17 = v16;
    v18 = objc_alloc(MEMORY[0x1E0DC3770]);
    objc_msgSend(v13, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithContainer:center:", v19, v15, v17);

    objc_msgSend(v9, "retargetedPreviewWithTarget:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setZPosition:", 3.40282347e38);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ sessionWillBegin: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PXPhotosDetailsAssetsWidget setDragSession:](self, "setDragSession:", v7);
  -[PXPhotosDetailsAssetsWidget _setHighlightedAssetReference:](self, "_setHighlightedAssetReference:", 0);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLDragAndDropGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ session: %@ didEndWithOperation: %lu", (uint8_t *)&v11, 0x20u);
  }

  -[PXPhotosDetailsAssetsWidget setDragSession:](self, "setDragSession:", 0);
  -[PXPhotosDetailsAssetsWidget _setDraggingAssetReferences:](self, "_setDraggingAssetReferences:", 0);

}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__PXPhotosDetailsAssetsWidget_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1E51438B0;
  v5[4] = self;
  objc_msgSend(a4, "addCompletion:", v5);
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PXPhotosDetailsAssetsWidget_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E51438B0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  CGPoint v25;

  y = a5.y;
  x = a5.x;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v25.x = x;
    v25.y = y;
    NSStringFromCGPoint(v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ sessionForAddingItems: %@ withTouchAtPoint: %@", (uint8_t *)&v18, 0x20u);

  }
  -[PXPhotosDetailsAssetsWidget dragSession](self, "dragSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "containsObject:", v13);

  if (v14)
  {
    -[PXPhotosDetailsAssetsWidget dragSession](self, "dragSession");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v10, "count") != 1)
    {
      v16 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v10, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
LABEL_9:

  return v16;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "widget:transitionToViewController:withTransitionType:", self, v5, 2);

  return (char)self;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetViewControllerHostingWidget:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v6);

  return v9 != 0;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetUndoManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXPhotosDetailsAssetsWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetViewControllerHostingWidget:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (void)setOneUpPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpPresentation, a3);
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)_selectionManager
{
  return self->_selectionManager;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXPhotosDetailsAssetsWidgetOneUpDelegate)widgetOneUpDelegate
{
  return (PXPhotosDetailsAssetsWidgetOneUpDelegate *)objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
}

- (void)setWidgetOneUpDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetOneUpDelegate, a3);
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (PXPhotoKitUIMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXUIAssetsScene)_assetsScene
{
  return self->__assetsScene;
}

- (PXPhotosDetailsInlinePlaybackController)_inlinePlaybackController
{
  return self->__inlinePlaybackController;
}

- (PXPhotosDetailsAssetsWidgetEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXLayoutGenerator)_layoutGenerator
{
  return self->__layoutGenerator;
}

- (void)_setLayoutGenerator:(id)a3
{
  objc_storeStrong((id *)&self->__layoutGenerator, a3);
}

- (PXSectionedLayoutEngine)_layoutEngine
{
  return self->__layoutEngine;
}

- (void)_setLayoutEngine:(id)a3
{
  objc_storeStrong((id *)&self->__layoutEngine, a3);
}

- (PXAssetReference)_navigatedAssetReference
{
  return self->__navigatedAssetReference;
}

- (BOOL)_autoPlayVideoInOneUp
{
  return self->__autoPlayVideoInOneUp;
}

- (NSSet)_hiddenAssetReferences
{
  return self->__hiddenAssetReferences;
}

- (NSSet)_draggingAssetReferences
{
  return self->__draggingAssetReferences;
}

- (BOOL)_curate
{
  return self->__curate;
}

- (BOOL)_showCurationButton
{
  return self->__showCurationButton;
}

- (PXSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (PXUITapGestureRecognizer)_tapGesture
{
  return self->__tapGesture;
}

- (PXUITapGestureRecognizer)_pressGesture
{
  return self->__pressGesture;
}

- (UIPinchGestureRecognizer)_pinchGesture
{
  return self->__pinchGesture;
}

- (PXTouchingUIGestureRecognizer)_touchGesture
{
  return self->__touchGesture;
}

- (CGPoint)_visibleOriginScrollTarget
{
  double x;
  double y;
  CGPoint result;

  x = self->__visibleOriginScrollTarget.x;
  y = self->__visibleOriginScrollTarget.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setVisibleOriginScrollTarget:(CGPoint)a3
{
  self->__visibleOriginScrollTarget = a3;
}

- (BOOL)_transitionWithoutAnimation
{
  return self->__transitionWithoutAnimation;
}

- (void)_setTransitionWithoutAnimation:(BOOL)a3
{
  self->__transitionWithoutAnimation = a3;
}

- (PXAssetReference)_highlightedAssetReference
{
  return self->__highlightedAssetReference;
}

- (PXAssetReference)_focusedAssetReference
{
  return self->__focusedAssetReference;
}

- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken
{
  return self->__loadCoordinationToken;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (PXPhotosDataSourceStressTest)_currentDataSourceStressTest
{
  return self->__currentDataSourceStressTest;
}

- (BOOL)didLogCuratedAssetCount
{
  return self->_didLogCuratedAssetCount;
}

- (void)setDidLogCuratedAssetCount:(BOOL)a3
{
  self->_didLogCuratedAssetCount = a3;
}

- (BOOL)didLogUncuratedAssetCount
{
  return self->_didLogUncuratedAssetCount;
}

- (void)setDidLogUncuratedAssetCount:(BOOL)a3
{
  self->_didLogUncuratedAssetCount = a3;
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_dragSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->__currentDataSourceStressTest, 0);
  objc_storeStrong((id *)&self->__loadCoordinationToken, 0);
  objc_storeStrong((id *)&self->__focusedAssetReference, 0);
  objc_storeStrong((id *)&self->__highlightedAssetReference, 0);
  objc_storeStrong((id *)&self->__touchGesture, 0);
  objc_storeStrong((id *)&self->__pinchGesture, 0);
  objc_storeStrong((id *)&self->__pressGesture, 0);
  objc_storeStrong((id *)&self->__tapGesture, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__draggingAssetReferences, 0);
  objc_storeStrong((id *)&self->__hiddenAssetReferences, 0);
  objc_storeStrong((id *)&self->__navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->__layoutEngine, 0);
  objc_storeStrong((id *)&self->__layoutGenerator, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->__inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->__assetsScene, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_destroyWeak((id *)&self->_widgetOneUpDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_storeStrong((id *)&self->_loadStartDate, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
}

uint64_t __82__PXPhotosDetailsAssetsWidget_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_setDraggingAssetReferences:", 0);
  return result;
}

uint64_t __83__PXPhotosDetailsAssetsWidget_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "_setDraggingAssetReferences:", 0);
  return result;
}

void __72__PXPhotosDetailsAssetsWidget_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  objc_msgSend(v3, "assetReferenceAtItemIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_dragItemForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }

}

uint64_t __57__PXPhotosDetailsAssetsWidget__addAssetReferencesToDrag___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDraggingAssetReferences:", *(_QWORD *)(a1 + 40));
}

uint64_t __93__PXPhotosDetailsAssetsWidget_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 1);
}

uint64_t __74__PXPhotosDetailsAssetsWidget_oneUpPresentation_setHiddenAssetReferences___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHiddenAssetReferences:", *(_QWORD *)(a1 + 40));
}

void __79__PXPhotosDetailsAssetsWidget_oneUpPresentation_scrollAssetReferenceToVisible___block_invoke(uint64_t a1)
{
  void *v2;
  PXTilingLayoutInvalidationContext *v3;

  objc_msgSend(*(id *)(a1 + 32), "widgetDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetRequestFocus:", *(_QWORD *)(a1 + 32));

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateVisibleRect](v3, "invalidateVisibleRect");
  objc_msgSend(*(id *)(a1 + 40), "invalidateLayoutWithContext:", v3);

}

void __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  __int128 v8;
  _OWORD v9[2];

  v3 = a2;
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");
  v6 = *(_QWORD *)(a1 + 32);

  if (v5 == v6)
  {
    v7 = *(_BYTE *)(a1 + 64) == 0;
    v8 = *(_OWORD *)(a1 + 48);
    v9[0] = *(_OWORD *)(a1 + 32);
    v9[1] = v8;
    objc_msgSend(v3, "setSelectedState:forIndexPath:", v7, v9);
  }

}

uint64_t __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivity:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__PXPhotosDetailsAssetsWidget_presentOneUpForAssetReference_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __43__PXPhotosDetailsAssetsWidget_handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteractiveMode:", 1);
}

uint64_t __63__PXPhotosDetailsAssetsWidget_assetsScene_layoutForDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDataSourceSnapshot:withChangeDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __69__PXPhotosDetailsAssetsWidget_assetsScene_didTransitionToDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fallBackByTogglingCurationIfNeeded");

}

void __60__PXPhotosDetailsAssetsWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_dataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_currentDataSourceStressTest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotosDataSource:", v3);

}

BOOL __81__PXPhotosDetailsAssetsWidget_bestCursorTileForLiftingAtPoint_inCoordinateSpace___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(*(_QWORD *)(a2 + 8) - 6332438) < 4;
}

uint64_t __44__PXPhotosDetailsAssetsWidget_setSelecting___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __46__PXPhotosDetailsAssetsWidget__toggleCuration__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_curate");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logAssetCountsIfNecessary");
    return objc_msgSend(*(id *)(a1 + 32), "_setCurate:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __69__PXPhotosDetailsAssetsWidget__assetActionManagerForAssetsReference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

BOOL __65__PXPhotosDetailsAssetsWidget__assetIndexPathAtLocation_padding___block_invoke(uint64_t a1, _QWORD *a2)
{
  return *a2 == 5 && a2[1] == 6432423 && a2[2] == *(_QWORD *)(a1 + 32);
}

void __58__PXPhotosDetailsAssetsWidget__updateLayoutEngineIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;

  v3 = a2;
  objc_msgSend(v3, "setSeedSize:", 1.79769313e308, 1.79769313e308);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  PXIndexPathFromSimpleIndexPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeedItem:", v4, v5, v6);

}

PXPlaceholderView *__52__PXPhotosDetailsAssetsWidget__loadTilingController__block_invoke_2()
{
  PXPlaceholderView *v0;
  PXPlaceholderView *v1;

  v0 = [PXPlaceholderView alloc];
  v1 = -[PXPlaceholderView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PXPlaceholderView setShouldShowIndicatorView:](v1, "setShouldShowIndicatorView:", 1);
  return v1;
}

_PXContentUnavailableView *__52__PXPhotosDetailsAssetsWidget__loadTilingController__block_invoke()
{
  _PXContentUnavailableView *v0;
  void *v1;
  _PXContentUnavailableView *v2;

  v0 = [_PXContentUnavailableView alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsAssetsWidgetContentUnavailableTitle"), CFSTR("PhotosUICore"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[_UIContentUnavailableView initWithFrame:title:style:](v0, "initWithFrame:title:style:", v1, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[_PXContentUnavailableView sizeToFit](v2, "sizeToFit");
  return v2;
}

+ (void)_refreshSortDescriptorsInPhotosDataSource:(id)a3 withPeople:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", objc_msgSend(v7, "assetSortOrder"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortDescriptors");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v8)
    {

    }
    else
    {
      v10 = v9;
      v11 = objc_msgSend(v9, "isEqual:", v8);

      if ((v11 & 1) == 0)
      {
        PLPeopleGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v13;
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotosDetailsAssetsWidget: Sort descriptors for person set on Person: %{public}@. New Sort Descriptors: %@.", (uint8_t *)&v14, 0x16u);

        }
        objc_msgSend(v5, "setSortDescriptors:", v8);
      }
    }

  }
}

@end
