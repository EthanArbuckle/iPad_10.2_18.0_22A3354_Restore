@implementation PXCuratedLibraryViewProvider

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCuratedLibraryViewModelObservationContext == a5)
    goto LABEL_12;
  if ((void *)CountsControllerObservationContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_12;
    v17 = v9;
    -[PXCuratedLibraryViewProvider _logLibraryCountsIfNecessary](self, "_logLibraryCountsIfNecessary");
LABEL_11:
    v9 = v17;
    goto LABEL_12;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_26611 == a5)
  {
    if ((v6 & 3) == 0)
      goto LABEL_12;
    goto LABEL_10;
  }
  if ((void *)PXLibraryFilterStateObservationContext_26612 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 849, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
LABEL_10:
    v17 = v9;
    -[PXCuratedLibraryViewProvider sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasSharedLibraryOrPreview");
    -[PXCuratedLibraryViewProvider libraryFilterState](self, "libraryFilterState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXCuratedLibraryViewProvider _layoutVariantToUse:viewMode:](self, "_layoutVariantToUse:viewMode:", v11, objc_msgSend(v12, "viewMode"));
    -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "specManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setVariant:", v13);

    goto LABEL_11;
  }
LABEL_12:

}

- (PXGView)gridView
{
  return self->_gridView;
}

- (PXCuratedLibraryFooterController)footerController
{
  return self->_footerController;
}

- (PXCuratedLibraryEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController
{
  return self->_videoPlaybackController;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_axNextResponder, a3);
}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4
{
  return -[PXCuratedLibraryViewProvider initWithPhotoLibrary:extendedTraitCollection:initialZoomLevel:](self, "initWithPhotoLibrary:extendedTraitCollection:initialZoomLevel:", a3, a4, 0);
}

- (id)additionalRectDiagnosticsProvidersForView:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "enablePlaybackDiagnostics"))
  {
    v7[0] = self->_videoPlaybackController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)_logLibraryCountsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryViewProvider itemCountsController](self, "itemCountsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "counts");

  -[PXCuratedLibraryViewProvider eventTracker](self, "eventTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logLibraryItemsCount:", 0);

}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (int64_t)_layoutVariantToUse:(BOOL)a3 viewMode:(int64_t)a4
{
  if ((unint64_t)a4 < 3 && a3)
    return a4 + 1;
  else
    return 0;
}

- (PXCuratedLibraryViewProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 73, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryViewProvider init]");

  abort();
}

- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4 initialZoomLevel:(int64_t)a5
{
  id v8;
  id v9;
  PXCuratedLibraryViewConfiguration *v10;
  PXCuratedLibraryViewProvider *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[PXCuratedLibraryViewConfiguration initWithPhotoLibrary:]([PXCuratedLibraryViewConfiguration alloc], "initWithPhotoLibrary:", v9);

  -[PXCuratedLibraryViewConfiguration setInitialZoomLevel:](v10, "setInitialZoomLevel:", a5);
  v11 = -[PXCuratedLibraryViewProvider initWithConfiguration:extendedTraitCollection:](self, "initWithConfiguration:extendedTraitCollection:", v10, v8);

  return v11;
}

- (PXCuratedLibraryViewProvider)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v6;
  id v7;
  PXCuratedLibraryViewProvider *v8;
  void *v9;
  uint64_t v10;
  PXUIMediaProvider *mediaProvider;
  PXCuratedLibraryLayoutSpecManager *v12;
  void *v13;
  PXCuratedLibraryStyleGuide *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXCuratedLibraryViewModel *v20;
  PXCuratedLibraryViewModel *viewModel;
  PXCuratedLibraryLayout *v22;
  PXCuratedLibraryLayout *layout;
  uint64_t v24;
  PXCuratedLibraryAssetsDataSourceManager *assetsDataSourceManager;
  uint64_t v26;
  PXCuratedLibraryVideoPlaybackController *videoPlaybackController;
  PXGView *v28;
  PXGView *gridView;
  PXCuratedLibraryViewModel *v30;
  PXCuratedLibraryViewProvider *v31;
  id v32;
  void *v33;
  uint64_t v34;
  PXAssetsDataSourceCountsController *itemCountsController;
  PXCuratedLibraryFooterController *v36;
  PXCuratedLibraryFooterController *footerController;
  uint64_t v38;
  PXCuratedLibraryEventTracker *eventTracker;
  PXCuratedLibraryEventTracker *v40;
  void *v41;
  PXZoomablePhotosInteraction *v42;
  void *v43;
  uint64_t v44;
  PXZoomablePhotosInteraction *zoomablePhotosInteraction;
  void *v46;
  uint64_t v47;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  void *v49;
  uint64_t v50;
  PXLibraryFilterState *libraryFilterState;
  _QWORD v53[4];
  PXCuratedLibraryViewProvider *v54;
  objc_super v55;

  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)PXCuratedLibraryViewProvider;
  v8 = -[PXCuratedLibraryViewProvider init](&v55, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_photoLibrary, v9);
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a4);
    +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v8->_mediaProvider;
    v8->_mediaProvider = (PXUIMediaProvider *)v10;

    v12 = -[PXCuratedLibraryLayoutSpecManager initWithExtendedTraitCollection:options:variant:]([PXCuratedLibraryLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:variant:", v8->_extendedTraitCollection, 0, 0);
    -[PXUIMediaProvider availableThumbnailSizes](v8->_mediaProvider, "availableThumbnailSizes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryLayoutSpecManager setAvailableThumbnailSizes:](v12, "setAvailableThumbnailSizes:", v13);

    v14 = -[PXCuratedLibraryStyleGuide initWithExtendedTraitCollection:secondaryToolbarStyle:]([PXCuratedLibraryStyleGuide alloc], "initWithExtendedTraitCollection:secondaryToolbarStyle:", v8->_extendedTraitCollection, objc_msgSend(v6, "secondaryToolbarStyle"));
    v15 = objc_msgSend(v6, "initialZoomLevel");
    if (!v15)
    {
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "curatedLibraryZoomLevel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17 || (v15 = objc_msgSend(v17, "integerValue"), (unint64_t)(v15 - 5) <= 0xFFFFFFFFFFFFFFFBLL))
      {
        +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v18, "initialZoomLevel");

      }
      if (v15 == 3)
      {
        if (objc_msgSend(v6, "enableDays"))
          v15 = 3;
        else
          v15 = 4;
      }

    }
    +[PXCuratedLibraryAssetsDataSourceManagerConfiguration configurationWithPhotoLibrary:enableDays:](PXCuratedLibraryAssetsDataSourceManagerConfiguration, "configurationWithPhotoLibrary:enableDays:", v9, objc_msgSend(v6, "enableDays"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXCuratedLibraryViewModel initWithConfiguration:assetsDataSourceManagerConfiguration:zoomLevel:mediaProvider:specManager:styleGuide:]([PXCuratedLibraryViewModel alloc], "initWithConfiguration:assetsDataSourceManagerConfiguration:zoomLevel:mediaProvider:specManager:styleGuide:", v6, v19, v15, v8->_mediaProvider, v12, v14);
    viewModel = v8->_viewModel;
    v8->_viewModel = v20;

    v22 = -[PXCuratedLibraryLayout initWithViewModel:]([PXCuratedLibraryLayout alloc], "initWithViewModel:", v8->_viewModel);
    layout = v8->_layout;
    v8->_layout = v22;

    -[PXCuratedLibraryViewModel assetsDataSourceManager](v8->_viewModel, "assetsDataSourceManager");
    v24 = objc_claimAutoreleasedReturnValue();
    assetsDataSourceManager = v8->_assetsDataSourceManager;
    v8->_assetsDataSourceManager = (PXCuratedLibraryAssetsDataSourceManager *)v24;

    -[PXCuratedLibraryViewModel videoPlaybackController](v8->_viewModel, "videoPlaybackController");
    v26 = objc_claimAutoreleasedReturnValue();
    videoPlaybackController = v8->_videoPlaybackController;
    v8->_videoPlaybackController = (PXCuratedLibraryVideoPlaybackController *)v26;

    -[PXCuratedLibraryVideoPlaybackController setCuratedLibraryLayout:](v8->_videoPlaybackController, "setCuratedLibraryLayout:", v8->_layout);
    v28 = objc_alloc_init(PXGView);
    gridView = v8->_gridView;
    v8->_gridView = v28;

    -[PXGView setRootLayout:](v8->_gridView, "setRootLayout:", v8->_layout);
    -[PXGView setDiagnosticsSource:](v8->_gridView, "setDiagnosticsSource:", v8);
    -[PXGView setAxNextResponder:](v8->_gridView, "setAxNextResponder:", v8);
    -[PXGView registerAllTextureProvidersWithMediaProvider:namedImagesBundle:](v8->_gridView, "registerAllTextureProvidersWithMediaProvider:namedImagesBundle:", v8->_mediaProvider, 0);
    v30 = v8->_viewModel;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __78__PXCuratedLibraryViewProvider_initWithConfiguration_extendedTraitCollection___block_invoke;
    v53[3] = &unk_1E5143468;
    v31 = v8;
    v54 = v31;
    -[PXCuratedLibraryViewModel performChanges:](v30, "performChanges:", v53);
    v32 = objc_alloc((Class)off_1E50B16E8);
    -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](v8->_assetsDataSourceManager, "dataSourceManagerForZoomLevel:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithAssetsDataSourceManager:", v33);
    itemCountsController = v31->_itemCountsController;
    v31->_itemCountsController = (PXAssetsDataSourceCountsController *)v34;

    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](v31->_itemCountsController, "registerChangeObserver:context:", v31, CountsControllerObservationContext);
    if (objc_msgSend(v6, "enableFooter"))
    {
      v36 = -[PXCuratedLibraryFooterController initWithGridView:layout:viewModel:itemsCountsController:]([PXCuratedLibraryFooterController alloc], "initWithGridView:layout:viewModel:itemsCountsController:", v8->_gridView, v8->_layout, v8->_viewModel, v31->_itemCountsController);
      footerController = v31->_footerController;
      v31->_footerController = v36;

    }
    PXCuratedLibraryEventTrackerCreate(v8->_viewModel, v8->_layout);
    v38 = objc_claimAutoreleasedReturnValue();
    eventTracker = v31->_eventTracker;
    v31->_eventTracker = (PXCuratedLibraryEventTracker *)v38;

    v40 = v31->_eventTracker;
    -[PXCuratedLibraryViewModel analysisStatus](v8->_viewModel, "analysisStatus");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setEventTracker:", v40);

    v42 = [PXZoomablePhotosInteraction alloc];
    -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v8->_viewModel, "zoomablePhotosViewModel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PXZoomablePhotosInteraction initWithZoomablePhotosViewModel:](v42, "initWithZoomablePhotosViewModel:", v43);
    zoomablePhotosInteraction = v31->_zoomablePhotosInteraction;
    v31->_zoomablePhotosInteraction = (PXZoomablePhotosInteraction *)v44;

    -[PXZoomablePhotosInteraction setView:](v31->_zoomablePhotosInteraction, "setView:", v8->_gridView);
    -[PXZoomablePhotosInteraction setDelegate:](v31->_zoomablePhotosInteraction, "setDelegate:", v31);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v8->_viewModel, "registerChangeObserver:context:", v31, PXCuratedLibraryViewModelObservationContext);
    -[PXCuratedLibraryViewProvider viewModel](v31, "viewModel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sharedLibraryStatusProvider");
    v47 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v31->_sharedLibraryStatusProvider;
    v31->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v47;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v31->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v31, PXSharedLibraryStatusProviderObservationContext_26611);
    -[PXCuratedLibraryViewProvider viewModel](v31, "viewModel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "libraryFilterState");
    v50 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v31->_libraryFilterState;
    v31->_libraryFilterState = (PXLibraryFilterState *)v50;

    -[PXLibraryFilterState registerChangeObserver:context:](v31->_libraryFilterState, "registerChangeObserver:context:", v31, PXLibraryFilterStateObservationContext_26612);
    -[PXCuratedLibraryLayoutSpecManager setVariant:](v12, "setVariant:", -[PXCuratedLibraryViewProvider _layoutVariantToUse:viewMode:](v31, "_layoutVariantToUse:viewMode:", -[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](v31->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview"), -[PXLibraryFilterState viewMode](v31->_libraryFilterState, "viewMode")));
    -[PXCuratedLibraryViewProvider _logLibraryCountsIfNecessary](v31, "_logLibraryCountsIfNecessary");

  }
  return v8;
}

- (PXAssetReference)preferredAnchorAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__26650;
  v36 = __Block_byref_object_dispose__26651;
  v37 = 0;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isAnyItemSelected"))
  {
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    if (v4)
      objc_msgSend(v4, "cursorIndexPath");
    -[PXCuratedLibraryViewProvider layout](self, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "visibleRect");
    PXRectGetCenter();
    v8 = v7;
    v10 = v9;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__PXCuratedLibraryViewProvider_preferredAnchorAssetReference__block_invoke;
    v20[3] = &unk_1E511A6F8;
    v11 = v5;
    v21 = v11;
    v12 = v4;
    v25 = v30;
    v26 = v31;
    v22 = v12;
    v23 = &v32;
    v27 = v8;
    v28 = v10;
    v24 = v29;
    objc_msgSend(v6, "enumerateVisibleAssetReferencesUsingBlock:", v20);

    _Block_object_dispose(v29, 8);
  }
  v13 = (void *)v33[5];
  if (!v13)
  {
    -[PXCuratedLibraryViewProvider gridView](self, "gridView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    PXRectGetCenter();
    objc_msgSend(v14, "firstCuratedLibraryHitTestResultsAtPoint:withControl:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetReference");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v33[5];
    v33[5] = v16;

    v13 = (void *)v33[5];
  }
  v18 = v13;

  _Block_object_dispose(&v32, 8);
  return (PXAssetReference *)v18;
}

- (PXSectionedObjectReference)preferredObjectReferenceToScrollToWhenRestoringState
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat Height;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v43 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryViewProvider gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrolledAtEdge:tolerance:", 3, 100.0);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v2, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    PXRectGetCenter();
    v15 = v14;
    v17 = v16;
    v44.origin.x = v7;
    v44.origin.y = v9;
    v44.size.width = v11;
    v44.size.height = v13;
    v18 = CGRectGetWidth(v44) / 3.0;
    v45.origin.x = v7;
    v45.origin.y = v9;
    v45.size.width = v11;
    v45.size.height = v13;
    Height = CGRectGetHeight(v45);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v2, "hitTestResultsAtPoint:padding:passingTest:", 0, v15, v17, Height / 3.0, v18, Height / 3.0, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (!v21)
    {
      v5 = 0;
      goto LABEL_25;
    }
    v22 = v21;
    v5 = 0;
    v23 = *(_QWORD *)v39;
    v24 = 1.79769313e308;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v26;
          v28 = objc_msgSend(v27, "control");
          if (v28 == 1)
          {
            objc_msgSend(v27, "assetReference");
            v29 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v30 = (void *)v29;
            if (v29)
            {
              objc_msgSend(v2, "regionOfInterestForHitTestResult:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if (v31)
              {
                objc_msgSend(v31, "rectInCoordinateSpace:", v2);
                PXRectShortestDistanceToPoint();
                v34 = v33;
              }
              else
              {
                v34 = 1.79769313e308;
              }
              if (v34 < v24)
              {
                v35 = v30;
                v36 = v5;
                v5 = v35;

                v24 = v34;
              }

            }
          }
          else if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            objc_msgSend(v27, "assetCollectionReference");
            v29 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }

          continue;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v22)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
  }
  v5 = 0;
LABEL_26:

  return (PXSectionedObjectReference *)v5;
}

- (void)prepareForNavigationToObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "zoomLevel") == 4)
  {
    objc_msgSend(v5, "zoomablePhotosViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PXCuratedLibraryViewProvider_prepareForNavigationToObjectReference___block_invoke;
    v7[3] = &unk_1E512BDB8;
    v8 = v4;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)zoomInAllPhotos
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PXCuratedLibraryViewProvider_zoomInAllPhotos__block_invoke;
  v5[3] = &unk_1E512BDB8;
  v5[4] = self;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)zoomOutAllPhotos
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceAllPhotosAccurateIfNeeded");

  objc_msgSend(v3, "zoomablePhotosViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PXCuratedLibraryViewProvider_zoomOutAllPhotos__block_invoke;
  v6[3] = &unk_1E512BDB8;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:", v6);

}

- (BOOL)attemptSetInSelectMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  BOOL v10;

  v3 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v9 = objc_msgSend(v5, "containsObject:", CFSTR("PXCuratedLibraryActionCancelSelectMode"));

    if (v9)
    {
      v8 = &__block_literal_global_150;
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "containsObject:", CFSTR("PXCuratedLibraryActionEnterSelectMode"));

  if ((v7 & 1) == 0)
    goto LABEL_7;
  v8 = &__block_literal_global_26645;
LABEL_6:
  objc_msgSend(v4, "performChanges:", v8);
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)toggleSelectMode
{
  id v3;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewProvider attemptSetInSelectMode:](self, "attemptSetInSelectMode:", objc_msgSend(v3, "isSelecting") ^ 1);

}

- (BOOL)ensureSelectMode
{
  void *v3;
  char v4;

  -[PXCuratedLibraryViewProvider attemptSetInSelectMode:](self, "attemptSetInSelectMode:", 1);
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelecting");

  return v4;
}

- (void)performActionWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformerForActionType:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "performActionWithCompletionHandler:", 0);
}

- (id)titleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "actionPerformerForActionType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "localizedTitleForUseCase:", a4);
  else
    objc_msgSend(v8, "localizedTitleForActionType:useCase:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)discoverabilityTitleForActionType:(id)a3
{
  return -[PXCuratedLibraryViewProvider titleForActionType:useCase:](self, "titleForActionType:useCase:", a3, 1);
}

- (id)selectionContainerWithUndoManager:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  PXSelectionContainer *v16;
  void *v17;
  void *v18;
  void *v19;
  PXSelectionContainer *v20;
  void *v22;
  _OWORD v23[2];

  v5 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v6, "zoomLevel"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 350, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v8 = 9;
      break;
    case 2:
      v8 = 8;
      break;
    case 3:
      goto LABEL_6;
    case 4:
      objc_msgSend(v6, "zoomablePhotosViewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isDisplayingIndividualItems");

      if ((v10 & 1) != 0)
      {
LABEL_6:
        v8 = 7;
      }
      else
      {
        v11 = objc_alloc((Class)off_1E50B4A80);
        objc_msgSend(v6, "currentDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E50B3180, "indexPathSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *((_OWORD *)off_1E50B8778 + 1);
        v23[0] = *(_OWORD *)off_1E50B8778;
        v23[1] = v14;
        v15 = objc_msgSend(v11, "initWithDataSource:selectedIndexPaths:cursorIndexPath:", v12, v13, v23);

        v8 = 7;
        v7 = (void *)v15;
      }
      break;
    default:
      v8 = 0;
      break;
  }
  v16 = [PXSelectionContainer alloc];
  -[PXCuratedLibraryViewProvider photoLibrary](self, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "px_virtualCollections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "photosCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXSelectionContainer initWithSelectionSnapshot:collection:undoManager:context:](v16, "initWithSelectionSnapshot:collection:undoManager:context:", v7, v19, v5, v8);

  return v20;
}

- (void)scrollLibraryViewToAssetReference:(id)a3 scrollPosition:(unint64_t)a4 completionHandler:(id)a5
{
  -[PXCuratedLibraryViewProvider scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:](self, "scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:", a3, a4, a5, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (void)scrollLibraryViewToObjectReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (v13)
  {
    -[PXCuratedLibraryViewProvider layout](self, "layout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewProvider gridView](self, "gridView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetsDataSourceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectReferenceNearestToObjectReference:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    if (v20)
    {
      objc_msgSend(v20, "indexPathForObjectReference:", v21);
      v23 = *((_QWORD *)&v33 + 1);
      if (*((_QWORD *)&v33 + 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_9:
        objc_msgSend(v17, "scrollViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stopScrollingAndZoomingAnimations");

        if (a4 != 2)
        {
          objc_msgSend(v16, "estimatedHeaderHeight");
          if (top < v25)
            top = v25;
        }
        objc_msgSend(v16, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v21, a4, top, left, bottom, right);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v26, "autoInvalidate");

        if (objc_msgSend(v18, "zoomLevel") == 4)
        {
          objc_msgSend(v16, "allPhotosLayout");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "invalidateItemsLayout");

        }
        if (v15)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke_2;
          v29[3] = &unk_1E5148CE0;
          v31 = v15;
          v30 = v21;
          objc_msgSend(v17, "installLayoutCompletionHandler:", v29);

        }
        goto LABEL_17;
      }
    }
    else
    {
      v23 = 0;
      v33 = 0u;
      v34 = 0u;
    }
    v32[0] = v22;
    v32[1] = 3221225472;
    v32[2] = __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke;
    v32[3] = &__block_descriptor_40_e58_v16__0___PXCuratedLibraryMutableAssetsDataSourceManager__8l;
    v32[4] = v23;
    objc_msgSend(v19, "performChanges:", v32);
    goto LABEL_9;
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("can't scroll library view to objectReference %@"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v16);
LABEL_17:

  }
}

- (id)hitTestResultControlsForCurrentZoomLevel
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "zoomLevel");

  switch(v5)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v5 = 2;
      goto LABEL_5;
    case 2:
      objc_msgSend(v3, "addIndex:", 3);
      v5 = 4;
      goto LABEL_5;
    case 3:
    case 4:
      v5 = 1;
LABEL_5:
      objc_msgSend(v3, "addIndex:", v5);
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_itemsGeometryForDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXCuratedLibraryViewProvider layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedItemsGeometryForDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXSimpleIndexPath)_indexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  id *v25;
  id *v26;
  __int128 v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  PXSimpleIndexPath *result;
  _QWORD v33[4];
  id v34;
  _QWORD v35[2];
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;

  v10 = a5;
  v45 = 0;
  v46 = &v45;
  v47 = 0x4010000000;
  v48 = &unk_1A7E74EE7;
  v11 = *((_OWORD *)off_1E50B8778 + 1);
  v49 = *(_OWORD *)off_1E50B8778;
  v50 = v11;
  -[PXCuratedLibraryViewProvider _itemsGeometryForDataSource:](self, "_itemsGeometryForDataSource:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (!a6)
      goto LABEL_13;
    -[PXCuratedLibraryViewProvider hitTestResultControlsForCurrentZoomLevel](self, "hitTestResultControlsForCurrentZoomLevel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98)
    {
      if (a4->item == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = *(_OWORD *)&a4->item;
          v43 = *(_OWORD *)&a4->dataSourceIdentifier;
          v44 = v18;
          objc_msgSend(v10, "assetCollectionReferenceAtSectionIndexPath:", &v43);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXCuratedLibraryViewProvider layout](self, "layout");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "spriteReferenceForObjectReference:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXCuratedLibraryViewProvider gridView](self, "gridView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2;
          v33[3] = &unk_1E511A760;
          v34 = v17;
          v23 = v10;
          v24 = *(_OWORD *)&a4->item;
          v36 = *(_OWORD *)&a4->dataSourceIdentifier;
          v37 = v24;
          v35[0] = v23;
          v35[1] = &v45;
          objc_msgSend(v22, "enumerateCuratedLibraryHitTestResultsInDirection:fromSpriteReference:usingBlock:", a6, v21, v33);
          v25 = &v34;
          v26 = (id *)v35;
LABEL_11:

        }
      }
      else if (a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = *(_OWORD *)&a4->item;
        v43 = *(_OWORD *)&a4->dataSourceIdentifier;
        v44 = v27;
        objc_msgSend(v10, "assetReferenceAtItemIndexPath:", &v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCuratedLibraryViewProvider layout](self, "layout");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "spriteReferenceForObjectReference:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXCuratedLibraryViewProvider gridView](self, "gridView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke;
        v38[3] = &unk_1E511A760;
        v39 = v17;
        v29 = v10;
        v30 = *(_OWORD *)&a4->item;
        v41 = *(_OWORD *)&a4->dataSourceIdentifier;
        v42 = v30;
        v40[0] = v29;
        v40[1] = &v45;
        objc_msgSend(v22, "enumerateCuratedLibraryHitTestResultsInDirection:fromSpriteReference:usingBlock:", a6, v21, v38);
        v25 = &v39;
        v26 = (id *)v40;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  v14 = objc_msgSend(v12, "itemClosestToItem:inDirection:", a4->item, a6);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v46;
    v16 = *(_OWORD *)&a4->item;
    *((_OWORD *)v46 + 2) = *(_OWORD *)&a4->dataSourceIdentifier;
    *((_OWORD *)v15 + 3) = v16;
    v15[6] = v14;
  }
LABEL_13:
  v31 = *((_OWORD *)v46 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v46 + 2);
  *(_OWORD *)&retstr->item = v31;

  _Block_object_dispose(&v45, 8);
  return result;
}

- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  __int128 v9;
  void *v10;
  void *v11;
  _OWORD v13[2];

  v6 = a4;
  v7 = v6;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_2;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v8) = a3->subitem == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    LOBYTE(v8) = 0;
  }
  else
  {
    v9 = *(_OWORD *)&a3->item;
    v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v13[1] = v9;
    objc_msgSend(v6, "assetCollectionAtSectionIndexPath:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v10, objc_msgSend(v11, "zoomLevel"));

  }
LABEL_7:

  return v8;
}

- (void)moveSelectionInDirection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "moveSelectionInDirection:withDelegate:", a3, self);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }

  if ((_QWORD)v19 != *(_QWORD *)off_1E50B7E98)
  {
    -[PXCuratedLibraryViewProvider anchorPaddingForCurrentZoomLevel](self, "anchorPaddingForCurrentZoomLevel");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "currentDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v19;
    v18[1] = v20;
    objc_msgSend(v16, "objectReferenceAtIndexPath:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[PXCuratedLibraryViewProvider scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:](self, "scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:", v17, 0, 0, v9, v11, v13, v15);

  }
}

- (void)extendSelectionInDirection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "startingIndexPathForMoveInDirection:", a3);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }

  v8 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v17 == *(_QWORD *)off_1E50B7E98)
  {
    -[PXCuratedLibraryViewProvider moveSelectionInDirection:](self, "moveSelectionInDirection:", a3);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "selectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v13 = v17;
      v14 = v18;
      objc_msgSend(v9, "extendSelectionFromIndexPath:inDirection:withDelegate:", &v13, a3, self);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }

    if ((_QWORD)v15 != v8)
    {
      objc_msgSend(v5, "currentDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v14 = v16;
      objc_msgSend(v11, "objectReferenceAtIndexPath:", &v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[PXCuratedLibraryViewProvider anchorPaddingForCurrentZoomLevel](self, "anchorPaddingForCurrentZoomLevel");
        -[PXCuratedLibraryViewProvider scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:](self, "scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:", v12, 0, 0);
      }

    }
  }

}

- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  PXSimpleIndexPath *result;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;

  v10 = a5;
  v11 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v11;
  v12 = *(_QWORD *)off_1E50B7E98;
  do
  {
    v13 = *(_OWORD *)&a4->item;
    v18[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v18[1] = v13;
    -[PXCuratedLibraryViewProvider _indexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_indexPathClosestToIndexPath:fromDataSource:inDirection:", v18, v10, a6);
    v14 = v20;
    *(_OWORD *)&retstr->dataSourceIdentifier = v19;
    *(_OWORD *)&retstr->item = v14;
    v15 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&a4->dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&a4->item = v15;
    if (retstr->dataSourceIdentifier == v12)
      break;
    v16 = *(_OWORD *)&retstr->item;
    v19 = *(_OWORD *)&retstr->dataSourceIdentifier;
    v20 = v16;
  }
  while (!-[PXCuratedLibraryViewProvider canSelectObjectAtIndexPath:inDataSource:](self, "canSelectObjectAtIndexPath:inDataSource:", &v19, v10));

  return result;
}

- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t section;
  int64_t dataSourceIdentifier;
  int64_t item;
  int64_t subitem;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  char v33;
  int64_t v34;
  char v35;
  void *v37;
  char v38;
  uint64_t v39;
  BOOL v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PXSimpleIndexPath *v47;
  PXSimpleIndexPath *v48;
  void *v49;
  void *v50;
  SEL v51;
  void (**v52)(void);
  int64_t v53;
  int64_t v54;
  int64_t v55;
  PXCuratedLibraryViewProvider *v56;
  void *v57;
  int64_t v58;
  int64_t v59;
  int64_t v60;
  int64_t v61;
  uint64_t v62;
  _QWORD aBlock[6];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  int64_t v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;

  v9 = a5;
  -[PXCuratedLibraryViewProvider _itemsGeometryForDataSource:](self, "_itemsGeometryForDataSource:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v9, "identifier");
    if (a3->dataSourceIdentifier != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalFromIndexPath.dataSourceIdentifier == dataSourceIdentifier"));

    }
    if (a3->section)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalFromIndexPath.section == section"));

    }
    if (a4->dataSourceIdentifier != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalToIndexPath.dataSourceIdentifier == dataSourceIdentifier"));

    }
    if (a4->section)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalToIndexPath.section == section"));

    }
    objc_msgSend(v10, "itemsBetweenItem:andItem:", a3->item, a4->item);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v12, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = a2;
    dataSourceIdentifier = a3->dataSourceIdentifier;
    section = a3->section;
    item = a3->item;
    subitem = a3->subitem;
    v47 = a4;
    v48 = a3;
    v18 = a4->dataSourceIdentifier;
    v19 = a4->section;
    v56 = self;
    v21 = a4->item;
    v20 = a4->subitem;
    v68 = dataSourceIdentifier;
    v69 = section;
    v70 = item;
    v71 = subitem;
    objc_msgSend(v9, "objectReferenceAtIndexPath:", &v68);
    v22 = objc_claimAutoreleasedReturnValue();
    v54 = v21;
    v55 = v18;
    v68 = v18;
    v69 = v19;
    v57 = v9;
    v58 = v19;
    v70 = v21;
    v71 = v20;
    v53 = v20;
    objc_msgSend(v9, "objectReferenceAtIndexPath:", &v68);
    v23 = objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewProvider gridView](v56, "gridView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v23;
    v50 = (void *)v22;
    LOBYTE(v19) = objc_msgSend(v24, "isObjectReference:visuallyBeforeObjectReference:", v22, v23);

    if ((v19 & 1) == 0)
    {
      dataSourceIdentifier = v47->dataSourceIdentifier;
      section = v47->section;
      item = v47->item;
      subitem = v47->subitem;
      v58 = v48->section;
      v54 = v48->item;
      v55 = v48->dataSourceIdentifier;
      v53 = v48->subitem;
    }
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PXCuratedLibraryViewProvider_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke;
    aBlock[3] = &unk_1E513E940;
    aBlock[4] = v56;
    aBlock[5] = v51;
    v25 = *(_OWORD *)&v48->item;
    v64 = *(_OWORD *)&v48->dataSourceIdentifier;
    v65 = v25;
    v26 = *(_OWORD *)&v47->item;
    v66 = *(_OWORD *)&v47->dataSourceIdentifier;
    v67 = v26;
    v52 = (void (**)(void))_Block_copy(aBlock);
    while (1)
    {
      v27 = subitem;
      v28 = item;
      v29 = dataSourceIdentifier;
      v68 = dataSourceIdentifier;
      v69 = section;
      v70 = item;
      v71 = subitem;
      objc_msgSend(v13, "addIndexPath:", &v68);
      v30 = dataSourceIdentifier == v55 && section == v58;
      v31 = v30 && item == v54;
      v59 = dataSourceIdentifier;
      v60 = section;
      v32 = v31 && subitem == v53;
      v33 = v32;
      v61 = item;
      v62 = subitem;
      -[PXCuratedLibraryViewProvider selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](v56, "selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v59, v57, 5);
      dataSourceIdentifier = v68;
      v34 = v69;
      item = v70;
      subitem = v71;
      if (objc_msgSend(v13, "containsIndexPath:", &v68))
        break;
      if (v34 == section)
        v35 = v33;
      else
        v35 = 1;
      if ((v35 & 1) != 0)
      {
        if ((v33 & 1) != 0)
          goto LABEL_32;
        goto LABEL_35;
      }
    }
    v52[2]();
    if ((v33 & 1) != 0)
      goto LABEL_32;
LABEL_35:
    if (v34 < v58)
    {
      v34 = v58 - 1;
      item = objc_msgSend(v57, "numberOfItemsInSection:", v58 - 1) - 1;
      dataSourceIdentifier = objc_msgSend(v57, "identifier");
      v68 = v29;
      v69 = section;
      v70 = v28;
      v71 = v27;
      v59 = dataSourceIdentifier;
      v60 = v58 - 1;
      subitem = 0x7FFFFFFFFFFFFFFFLL;
      v61 = item;
      v62 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v57, "indexPathSetFromIndexPath:toIndexPath:", &v68, &v59);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unionIndexPathSet:", v37);

    }
    v38 = 0;
    v39 = *(_QWORD *)off_1E50B7E98;
    while ((v38 & 1) == 0 && dataSourceIdentifier != v39)
    {
      v68 = dataSourceIdentifier;
      v69 = v34;
      v70 = item;
      v71 = subitem;
      objc_msgSend(v13, "addIndexPath:", &v68);
      v41 = dataSourceIdentifier == v55 && v34 == v58 && item == v54;
      v59 = dataSourceIdentifier;
      v60 = v34;
      v38 = v41 && subitem == v53;
      v61 = item;
      v62 = subitem;
      -[PXCuratedLibraryViewProvider selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](v56, "selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v59, v57, 5);
      dataSourceIdentifier = v68;
      v34 = v69;
      item = v70;
      subitem = v71;
      if (objc_msgSend(v13, "containsIndexPath:", &v68))
      {
        v52[2]();
        v68 = v55;
        v69 = v58;
        v70 = v54;
        v71 = v53;
        objc_msgSend(v13, "addIndexPath:", &v68);
        break;
      }
    }
LABEL_32:

    v9 = v57;
    v10 = 0;
  }

  return v13;
}

- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  uint64_t v45;
  CGAffineTransform v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXCuratedLibraryViewProvider gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryViewProvider _itemsGeometryForDataSource:](self, "_itemsGeometryForDataSource:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v6, "rootLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentCoordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    if (v18)
    {
      objc_msgSend(v18, "orientedContentTransform");
    }
    else
    {
      v45 = 0;
      memset(&v44, 0, sizeof(v44));
    }
    v46 = v44;
    v49.origin.x = v22;
    v49.origin.y = v24;
    v49.size.width = v26;
    v49.size.height = v28;
    v50 = CGRectApplyAffineTransform(v49, &v46);
    objc_msgSend(v17, "itemsInRect:inLayout:", v18, v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v37, objc_msgSend(v16, "identifier"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v6, "curatedLibraryHitTestResultsInRect:withControl:", 1, v8, v10, v12, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "assetReference");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "indexPath");
            objc_msgSend(v18, "addIndexPath:", &v39);
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v31);
    }

    v36 = (void *)objc_msgSend(v18, "copy");
  }

  return v36;
}

- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v5 = a4;
  -[PXCuratedLibraryViewProvider gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();

  objc_msgSend(v6, "rootLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "createPointReferenceAtPoint:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4
{
  id v5;
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
  CGPoint result;

  v5 = a3;
  -[PXCuratedLibraryViewProvider gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointForPointReference:", v5);

  objc_msgSend(v6, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryViewProvider gridView](self, "gridView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((a4 & 2) != 0)
  {
    v13 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v13);
    if (v13)
      -[PXCuratedLibraryViewProvider _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);
  }
  if ((a4 & 4) != 0)
  {
    v12 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v12);
    if (v12)
      -[PXCuratedLibraryViewProvider _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);
  }
  -[PXCuratedLibraryViewProvider axNextResponder](self, "axNextResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axGroup:didChange:userInfo:", v8, a4, v10);

}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;

  v4 = a3;
  v32 = 0;
  v33 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, &v33, &v32);
  v5 = v33;
  v6 = v32;
  v7 = objc_msgSend(v6, "axContentKind");
  v30 = 0u;
  v31 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v30);
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 != 6 && objc_msgSend(v8, "zoomLevel") == 3)
  {
    PXGAXGetItemGeometryForUserInfo(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v10 = (void *)objc_msgSend(v10, "itemClosestToItem:inDirection:", 0x7FFFFFFFFFFFFFFFLL, 5);
    *(_QWORD *)&v31 = v10;

  }
  objc_msgSend(v9, "selectionSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "identifier");

  v15 = v30;
  v16 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v30 != *(_QWORD *)off_1E50B7E98 && v14 != (_QWORD)v30)
  {
    objc_msgSend(v9, "assetsDataSourceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "changeHistory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v15, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v30;
    v29 = v31;
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v20, &v28, 0, 0);

    v15 = v30;
  }
  if (v15 != v16)
  {
    objc_msgSend(v9, "selectionSnapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectedIndexPaths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v30;
    v29 = v31;
    v23 = objc_msgSend(v22, "containsIndexPath:", &v28);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(v9, "selectionManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __75__PXCuratedLibraryViewProvider__handleChangeToModifySelectionWithUserInfo___block_invoke;
      v25[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
      v26 = v30;
      v27 = v31;
      objc_msgSend(v24, "performChanges:", v25);

    }
  }

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXCuratedLibraryViewProvider axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("PXCuratedLibraryActionAllPhotosInteractiveZoom"));

  return v5;
}

- (void)zoomablePhotosInteractionWillBegin:(id)a3
{
  void *v4;
  id v5;

  -[PXCuratedLibraryViewProvider assetsDataSourceManager](self, "assetsDataSourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceAllPhotosAccurateIfNeeded");

  -[PXCuratedLibraryViewProvider layout](self, "layout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLastVisibleAreaAnchoringInformation");

}

- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  -[PXCuratedLibraryViewProvider gridView](self, "gridView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstCuratedLibraryHitTestResultsAtPoint:withControl:", 1, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)selectionBasisForSelectionManager:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  void *v10;

  v5 = a3;
  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "zoomLevel");

  if (v7 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewProvider.m"), 769, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = qword_1A7C092B0[v7];

  return v8;
}

- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64x2_t v14;
  int64x2_t v15;
  id v16;
  id v17;
  int64x2_t v18;
  int64x2_t v19;
  uint64_t v20;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "zoomLevel");
  objc_msgSend(v10, "assetsDataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSourceForZoomLevel:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a6)
  {
    case 2uLL:
      a6 = 5;
      break;
    case 1uLL:
      a6 = 6;
      break;
    case 0uLL:
      v14 = *(int64x2_t *)&a4->item;
      v27 = *(int64x2_t *)&a4->dataSourceIdentifier;
      v28 = v14;
      v15 = *(int64x2_t *)&a5->item;
      v25 = *(int64x2_t *)&a5->dataSourceIdentifier;
      v26 = v15;
      -[PXCuratedLibraryViewProvider indexPathsFromIndexPath:toIndexPath:inDataSource:](self, "indexPathsFromIndexPath:toIndexPath:inDataSource:", &v27, &v25, v13);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
  }
  v22 = *(int64x2_t *)&a4->dataSourceIdentifier;
  v23 = *(int64x2_t *)&a4->item;
  v17 = objc_alloc_init((Class)off_1E50B3668);
  v19 = v22;
  v18 = v23;
  v16 = v17;
  v20 = *(_QWORD *)off_1E50B7E98;
  do
  {
    v25 = v19;
    v26 = v18;
    -[PXCuratedLibraryViewProvider selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v25, v13, a6, v22.i64[0]);
    v22 = v27;
    v24 = v28;
    objc_msgSend(v16, "addIndexPath:", &v27);
    v19 = v22;
    v18 = v24;
  }
  while ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v22, *(int64x2_t *)&a5->dataSourceIdentifier), (int32x4_t)vceqq_s64(v24, *(int64x2_t *)&a5->item))), 0xFuLL))) & 1) == 0&& v22.i64[0] != v20);
LABEL_10:

  return v16;
}

- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  PXSimpleIndexPath *result;
  _OWORD v16[2];

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "zoomLevel");
  objc_msgSend(v10, "assetsDataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSourceForZoomLevel:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v14 = *(_OWORD *)&a5->item;
  v16[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v16[1] = v14;
  -[PXCuratedLibraryViewProvider selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", v16, v13, a6);

  return result;
}

- (UIEdgeInsets)anchorPaddingForCurrentZoomLevel
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[PXCuratedLibraryViewProvider viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "zoomLevel");

  if ((unint64_t)(v3 - 1) < 2 || v3 == 4)
  {
    PXEdgeInsetsMake();
  }
  else
  {
    v4 = *(double *)off_1E50B8020;
    v5 = *((double *)off_1E50B8020 + 1);
    v6 = *((double *)off_1E50B8020 + 2);
    v7 = *((double *)off_1E50B8020 + 3);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->_axNextResponder);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXZoomablePhotosInteraction)zoomablePhotosInteraction
{
  return self->_zoomablePhotosInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosInteraction, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_footerController, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_videoPlaybackController, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
}

uint64_t __75__PXCuratedLibraryViewProvider__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

void __81__PXCuratedLibraryViewProvider_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE v10[32];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PXAssertGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)v10 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&v10[16] = v3;
    PXSimpleIndexPathDescription();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)v10 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&v10[16] = v5;
    PXSimpleIndexPathDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "gridView", *(_OWORD *)v10, *(_OWORD *)&v10[16]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v10 = 138413058;
    *(_QWORD *)&v10[4] = v4;
    *(_WORD *)&v10[12] = 2112;
    *(_QWORD *)&v10[14] = v6;
    *(_WORD *)&v10[22] = 2112;
    *(_QWORD *)&v10[24] = v8;
    v11 = 2112;
    v12 = v9;
    _os_log_fault_impl(&dword_1A6789000, v2, OS_LOG_TYPE_FAULT, "infinite cycle detected when gathering indexes between %@ and %@ in %@ (%@)", v10, 0x2Au);

  }
}

void __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int64x2_t v7;
  void *v8;
  int64x2_t v9;
  uint64_t v10;

  v5 = a2;
  objc_msgSend(v5, "assetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v5, "control")))
  {
    v7 = 0uLL;
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(v8, "indexPathForAssetReference:", v6);
      v7 = 0u;
      v9 = 0u;
    }
    else
    {
      v9 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), v7), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 72), v9))), 0xFuLL))) & 1) == 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_OWORD *)(v10 + 32) = 0u;
      *(_OWORD *)(v10 + 48) = 0u;
      *a3 = 1;
    }
  }

}

void __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int64x2_t v7;
  void *v8;
  int64x2_t v9;
  uint64_t v10;

  v5 = a2;
  objc_msgSend(v5, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v5, "control")))
  {
    v7 = 0uLL;
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(v8, "indexPathForAssetCollectionReference:", v6);
      v7 = 0u;
      v9 = 0u;
    }
    else
    {
      v9 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), v7), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 72), v9))), 0xFuLL))) & 1) == 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_OWORD *)(v10 + 32) = 0u;
      *(_OWORD *)(v10 + 48) = 0u;
      *a3 = 1;
    }
  }

}

uint64_t __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateSection:andSectionsBeforeAndAfter:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0, 0);
}

uint64_t __55__PXCuratedLibraryViewProvider_attemptSetInSelectMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

uint64_t __55__PXCuratedLibraryViewProvider_attemptSetInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 1);
}

void __48__PXCuratedLibraryViewProvider_zoomOutAllPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zoomState");
    v5 = *((_QWORD *)&v9 + 1) + 1;
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = 1;
    v7 = 0u;
    v8 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "preferredAnchorAssetReference", v7, v8, v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomToColumnIndex:withAnchorAssetReference:animated:", v5, v6, 1);

}

void __47__PXCuratedLibraryViewProvider_zoomInAllPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zoomState");
    v5 = *((_QWORD *)&v9 + 1) - 1;
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = -1;
    v7 = 0u;
    v8 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "preferredAnchorAssetReference", v7, v8, v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomToColumnIndex:withAnchorAssetReference:animated:", v5, v6, 1);

}

void __70__PXCuratedLibraryViewProvider_prepareForNavigationToObjectReference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  objc_msgSend(v4, "zoomInToIndividualItemsWithAnchorAssetReference:animated:", v3, 0);

}

void __61__PXCuratedLibraryViewProvider_preferredAnchorAssetReference__block_invoke(int64x2_t *a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  _OWORD v11[2];
  int64x2_t v12;
  int64x2_t v13;

  v6 = a2;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)a1[2].i64[0];
  if (v7)
    objc_msgSend(v7, "indexPathForObjectReference:", v6);
  v8 = (void *)a1[2].i64[1];
  v11[0] = v12;
  v11[1] = v13;
  if (objc_msgSend(v8, "isIndexPathSelected:", v11))
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v12, a1[4]), (int32x4_t)vceqq_s64(v13, a1[5]))), 0xFuLL))) & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[3].i64[0] + 8) + 40), a2);
      *a3 = 1;
    }
    else
    {
      PXRectShortestDistanceToPoint();
      v10 = *(_QWORD *)(a1[3].i64[1] + 8);
      if (v9 < *(double *)(v10 + 24))
      {
        *(double *)(v10 + 24) = v9;
        objc_storeStrong((id *)(*(_QWORD *)(a1[3].i64[0] + 8) + 40), a2);
      }
    }
  }

}

uint64_t __78__PXCuratedLibraryViewProvider_initWithConfiguration_extendedTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

@end
