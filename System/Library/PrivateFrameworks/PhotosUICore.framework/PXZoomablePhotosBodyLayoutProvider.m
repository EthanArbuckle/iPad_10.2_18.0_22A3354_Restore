@implementation PXZoomablePhotosBodyLayoutProvider

- (PXZoomablePhotosBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v5;
  PXZoomablePhotosBodyLayoutProvider *v6;
  PXZoomablePhotosBodyLayoutProvider *v7;
  PXZoomablePhotosLayoutSpecManager *v8;
  void *v9;
  void *v10;
  PXZoomablePhotosLayoutSpecManager *v11;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PXZoomablePhotosLayoutSpecManager *v28;
  void *v29;
  uint64_t v30;
  PXZoomablePhotosViewModel *zoomablePhotosViewModel;
  PXZoomablePhotosViewModel *v33;
  PXZoomablePhotosLayoutSpecManager *v34;
  PXZoomablePhotosBodyLayoutProvider *v35;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PXZoomablePhotosBodyLayoutProvider;
  v6 = -[PXZoomablePhotosBodyLayoutProvider init](&v36, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v35 = v7;
    objc_msgSend(v5, "registerChangeObserver:context:", v7, ViewModelObservationContext_258021);
    v8 = [PXZoomablePhotosLayoutSpecManager alloc];
    objc_msgSend(v5, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXFeatureSpecManager initWithExtendedTraitCollection:](v8, "initWithExtendedTraitCollection:", v10);

    if (objc_msgSend(v5, "allowsUserDefaults"))
    {
      objc_msgSend(v5, "customUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[PXZoomablePhotosLayoutSpecManager setUserDefaults:](v11, "setUserDefaults:", v12);
      }
      else
      {
        +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "photosGridsUserDefaults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXZoomablePhotosLayoutSpecManager setUserDefaults:](v11, "setUserDefaults:", v14);

      }
    }
    else
    {
      -[PXZoomablePhotosLayoutSpecManager setUserDefaults:](v11, "setUserDefaults:", 0);
    }
    objc_msgSend(v5, "specManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "availableThumbnailSizes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setAvailableThumbnailSizes:](v11, "setAvailableThumbnailSizes:", v16);

    -[PXZoomablePhotosLayoutSpecManager setGridStyle:](v11, "setGridStyle:", objc_msgSend(v5, "gridStyle"));
    -[PXZoomablePhotosLayoutSpecManager setPreferredUserInterfaceStyle:](v11, "setPreferredUserInterfaceStyle:", objc_msgSend(v5, "preferredUserInterfaceStyle"));
    objc_msgSend(v5, "itemAspectRatio");
    -[PXZoomablePhotosLayoutSpecManager setItemAspectRatio:](v11, "setItemAspectRatio:");
    objc_msgSend(v5, "preferredAssetCropDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setForceSaliency:](v11, "setForceSaliency:", v17 != 0);

    -[PXZoomablePhotosLayoutSpecManager setOverrideDefaultNumberOfColumns:](v11, "setOverrideDefaultNumberOfColumns:", objc_msgSend(v5, "overrideDefaultNumberOfColumns"));
    objc_msgSend(v5, "specManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "spec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setPreferredUserInterfaceStyle:](v11, "setPreferredUserInterfaceStyle:", objc_msgSend(v19, "preferredUserInterfaceStyle"));

    v33 = [PXZoomablePhotosViewModel alloc];
    objc_msgSend(v5, "dataSourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProvider");
    v34 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadingStatusManager");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "badgesModifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredAssetCropDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredColumnCountsDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlinePlaybackController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    v29 = (void *)v23;
    v30 = -[PXZoomablePhotosViewModel initWithDataSourceManager:selectionManager:mediaProvider:specManager:loadingStatusManager:badgesModifier:preferredAssetCropDelegate:preferredColumnCountsDelegate:inlinePlaybackController:](v33, "initWithDataSourceManager:selectionManager:mediaProvider:specManager:loadingStatusManager:badgesModifier:preferredAssetCropDelegate:preferredColumnCountsDelegate:inlinePlaybackController:", v20, v21, v22, v28, v23, v24, v25, v26, v27);
    v7 = v35;
    zoomablePhotosViewModel = v35->_zoomablePhotosViewModel;
    v35->_zoomablePhotosViewModel = (PXZoomablePhotosViewModel *)v30;

    -[PXZoomablePhotosViewModel registerChangeObserver:context:](v7->_zoomablePhotosViewModel, "registerChangeObserver:context:", v7, operator||);
    -[PXZoomablePhotosBodyLayoutProvider _updateZoomableViewModelWithChanges:](v35, "_updateZoomableViewModelWithChanges:", -1);
    -[PXZoomablePhotosBodyLayoutProvider _updatePhotosViewModelWithChanges:](v35, "_updatePhotosViewModelWithChanges:", -1);

  }
  return v7;
}

- (PXZoomablePhotosBodyLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosBodyLayoutProvider.m"), 62, CFSTR("%s is not available as initializer"), "-[PXZoomablePhotosBodyLayoutProvider init]");

  abort();
}

- (id)createInteraction
{
  PXZoomablePhotosInteraction *v3;
  void *v4;
  PXZoomablePhotosInteraction *v5;

  v3 = [PXZoomablePhotosInteraction alloc];
  -[PXZoomablePhotosBodyLayoutProvider zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXZoomablePhotosInteraction initWithZoomablePhotosViewModel:](v3, "initWithZoomablePhotosViewModel:", v4);

  return v5;
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  PXZoomablePhotosLayout *zoomablePhotosLayout;
  PXZoomablePhotosLayout *v10;
  void *v11;
  PXZoomablePhotosLayout *v12;
  PXZoomablePhotosLayout *v13;
  id result;

  zoomablePhotosLayout = self->_zoomablePhotosLayout;
  if (zoomablePhotosLayout)
  {
    -[PXGLayout removeFromSuperlayout](zoomablePhotosLayout, "removeFromSuperlayout", a3, a4, a5, a6);
  }
  else
  {
    v10 = [PXZoomablePhotosLayout alloc];
    -[PXZoomablePhotosBodyLayoutProvider zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXZoomablePhotosLayout initWithViewModel:](v10, "initWithViewModel:", v11);
    v13 = self->_zoomablePhotosLayout;
    self->_zoomablePhotosLayout = v12;

    -[PXZoomablePhotosLayout setPreventFillingTopAreaInsets:](self->_zoomablePhotosLayout, "setPreventFillingTopAreaInsets:", 1);
  }
  result = self->_zoomablePhotosLayout;
  *a7 = 0;
  return result;
}

- (void)_configureZoomableLayoutDecorations:(id)a3 fromAssetSectionLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "assetDecorationSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetDecorationSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadingStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLoadingStatusManager:", v7);
  objc_msgSend(v8, "setHidesInteractiveFavoriteBadges:", objc_msgSend(v6, "hidesInteractiveFavoriteBadges"));
  objc_msgSend(v8, "setDecorationViewClass:", objc_msgSend(v6, "decorationViewClass"));

}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  -[PXZoomablePhotosBodyLayoutProvider _configureZoomableLayoutDecorations:fromAssetSectionLayout:](self, "_configureZoomableLayoutDecorations:fromAssetSectionLayout:", v11, v9);
  objc_msgSend(v9, "addContentActionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_initWeak(&location, v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __105__PXZoomablePhotosBodyLayoutProvider_configureSectionBodyLayout_inAssetSectionLayout_forSectionedLayout___block_invoke;
    v13[3] = &unk_1E5148D30;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "setAddContentHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v11, "setAddContentHandler:", 0);
  }

}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 1;
}

- (void)_updateZoomableViewModelWithChanges:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[PXZoomablePhotosBodyLayoutProvider zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PXZoomablePhotosBodyLayoutProvider__updateZoomableViewModelWithChanges___block_invoke;
  v6[3] = &unk_1E51409D8;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)_updatePhotosViewModelWithChanges:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[PXZoomablePhotosBodyLayoutProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PXZoomablePhotosBodyLayoutProvider__updatePhotosViewModelWithChanges___block_invoke;
  v6[3] = &unk_1E5140A00;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ViewModelObservationContext_258021 == a5)
  {
    -[PXZoomablePhotosBodyLayoutProvider _updateZoomableViewModelWithChanges:](self, "_updateZoomableViewModelWithChanges:", a4);
  }
  else
  {
    if ((void *)operator|| != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosBodyLayoutProvider.m"), 201, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXZoomablePhotosBodyLayoutProvider _updatePhotosViewModelWithChanges:](self, "_updatePhotosViewModelWithChanges:", a4);
  }

}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->invalidationDelegate, a3);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXZoomablePhotosViewModel)zoomablePhotosViewModel
{
  return self->_zoomablePhotosViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
  objc_storeStrong((id *)&self->_zoomablePhotosLayout, 0);
}

void __72__PXZoomablePhotosBodyLayoutProvider__updatePhotosViewModelWithChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfZoomSteps:", objc_msgSend(v5, "count"));

  v6 = objc_msgSend(v4, "denseColumnsIndexRange");
  objc_msgSend(v3, "setYearsMonthsZoomStepRange:", v6, v7);
  objc_msgSend(v3, "setDefaultZoomStep:", objc_msgSend(v4, "defaultColumnIndex"));
  v8 = *(_QWORD *)(a1 + 40);
  if ((v8 & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    if (v4)
      objc_msgSend(v4, "zoomState", (unsigned __int128)0, (unsigned __int128)0);
    v9 = objc_msgSend(v4, "isDisplayingIndividualItems", v11, v12);
    objc_msgSend(v3, "setEnterSelectModeAllowed:forReason:", v9, CFSTR("DisplayingIndividualItems"));
    objc_msgSend(v3, "setOneUpPresentationAllowed:forReason:", v9, CFSTR("DisplayingIndividualItems"));
    objc_msgSend(v3, "setFloatingTitleOpacity:", 0.0);
    objc_msgSend(v3, "setAspectRatioToggleAllowed:forReason:", (_DWORD)v9 != 0, CFSTR("DisplayingIndividualItems"));
    if ((objc_msgSend(v4, "isInteractiveZooming") & 1) == 0)
    {
      objc_msgSend(v4, "anchorAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setZoomStep:isInteractive:shouldAnimate:anchorAssetReference:", 0, 0, v10, (double)0);

    }
    v8 = *(_QWORD *)(a1 + 40);
  }
  if ((v8 & 0x4000) != 0)
    objc_msgSend(v3, "setHideSurroundingContent:forReason:", objc_msgSend(v4, "shouldHideSurroundingContent"), CFSTR("ZoomableAnimation"));

}

void __74__PXZoomablePhotosBodyLayoutProvider__updateZoomableViewModelWithChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLowMemoryMode:", objc_msgSend(v4, "lowMemoryMode"));
  objc_msgSend(v3, "setIsInSelectMode:", objc_msgSend(v4, "isInSelectMode"));
  objc_msgSend(v3, "setViewBasedDecorationsEnabled:", objc_msgSend(v4, "viewBasedDecorationsEnabled"));
  objc_msgSend(v4, "draggedAssetReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDraggedAssetReferences:", v5);

  objc_msgSend(v4, "dropTargetAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDropTargetAssetReference:", v6);

  objc_msgSend(v3, "setAspectFit:", objc_msgSend(v4, "aspectFitContent"));
  objc_msgSend(v3, "setCaptionsVisible:", objc_msgSend(v4, "captionsVisible"));
  objc_msgSend(v3, "setAllowsCaptionsInSquare:", objc_msgSend(v4, "allowsCaptionsInSquareBehavior"));
  objc_msgSend(v3, "setWantsDimmedSelectionStyle:", objc_msgSend(v4, "wantsDimmedSelectionStyle"));
  objc_msgSend(v3, "setWantsNumberedSelectionStyle:", objc_msgSend(v4, "wantsNumberedSelectionStyle"));
  objc_msgSend(v3, "setWantsFileSizeBadge:", objc_msgSend(v4, "wantsFileSizeBadge"));
  objc_msgSend(v3, "setWantsAssetIndexBadge:", objc_msgSend(v4, "wantsAssetIndexBadge"));
  objc_msgSend(v4, "effectProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffectProvider:", v7);

  objc_msgSend(v3, "setAlwaysShowTopBadges:", objc_msgSend(v4, "wantsTopBadgesWithViewBasedDecorations"));
  objc_msgSend(v3, "setFaceModeEnabled:", objc_msgSend(v4, "isFaceModeEnabled"));
  objc_msgSend(v4, "additionalAspectFitEdgeMargins");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "specManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAdditionalAspectFitEdgeMargins:", v9, v11, v13, v15);

  objc_msgSend(v3, "setUseLowMemoryDecode:", objc_msgSend(v4, "useLowMemoryDecode"));
  objc_msgSend(v3, "setContentShiftStrategy:", objc_msgSend(v4, "contentShiftStrategy"));
  objc_msgSend(v4, "zoomStep");
  v18 = v17;
  objc_msgSend(v3, "setIsInteractiveZooming:", objc_msgSend(v4, "isInteractiveZooming"));
  if (objc_msgSend(v3, "isInteractiveZooming"))
  {
    objc_msgSend(v4, "zoomStep");
    v20 = v19;
    objc_msgSend(v4, "zoomAnchorAssetReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractiveZoomColumnIndex:withAnchorAssetReference:", v21, v20);

  }
  else
  {
    v22 = llround(v18);
    if (v3)
    {
      objc_msgSend(v3, "zoomState");
      v23 = v25;
    }
    else
    {
      v23 = 0;
    }
    if (v23 != v22)
    {
      objc_msgSend(v4, "zoomAnchorAssetReference");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v22, v24, objc_msgSend(v4, "shouldAnimateZooming"));

    }
  }
  if ((*(_BYTE *)(a1 + 47) & 4) != 0)
    objc_msgSend(v3, "resetToInitialState");

}

void __105__PXZoomablePhotosBodyLayoutProvider_configureSectionBodyLayout_inAssetSectionLayout_forSectionedLayout___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "addContentActionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "addContentActionHandler");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v2)[2](v2, WeakRetained);

  }
}

@end
