@implementation PXPhotosContentController

- (void)swift_init
{
  PXPhotosContentController *v2;

  v2 = self;
  sub_1A689EE14();

}

- (void)swift_contentViewWillAppear:(BOOL)a3
{
  PXPhotosContentController *v3;

  v3 = self;
  sub_1A689F8D0((uint64_t)&unk_1E50BDBE0, (uint64_t)&unk_1EE8DAD98);

}

- (void)swift_contentViewDidAppear:(BOOL)a3
{
  PXPhotosContentController *v3;

  v3 = self;
  sub_1A689F8D0((uint64_t)&unk_1E50BDBB8, (uint64_t)&unk_1EE8DAD90);

}

- (void)swift_contentViewDidDisappear:(BOOL)a3
{
  PXPhotosContentController *v3;

  v3 = self;
  sub_1A689FA44();

}

- (void)swift_contentViewDidScrollToInitialPosition
{
  PXPhotosContentController *v2;

  v2 = self;
  sub_1A689F050();

}

- (PXPhotosContentController)initWithConfiguration:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  PXPhotosContentController *v8;
  uint64_t v9;
  PXMediaProvider *mediaProvider;
  uint64_t v11;
  PXExtendedTraitCollection *traitCollection;
  void *v13;
  BOOL needsFooterStatusController;
  id v15;
  void *v16;
  uint64_t v17;
  PXAssetsDataSourceCountsController *countsController;
  uint64_t v19;
  PXPhotosContentInlinePlaybackController *v20;
  PXPhotosContentInlinePlaybackController *inlinePlaybackController;
  uint64_t v22;
  PXPhotosLayoutSpecManager *v23;
  void *v24;
  PXPhotosViewModel *v25;
  PXPhotosViewModel *viewModel;
  uint64_t v27;
  PXPhotosViewOptionsModel *viewOptionsModel;
  uint64_t v29;
  PXPhotosOverlayController *overlayController;
  uint64_t v31;
  PXPhotosViewInteraction *interaction;
  PXPhotosLayout *v33;
  uint64_t v34;
  PXPhotosCustomSectionBodyLayoutProvider *customSectionBodyLayoutProvider;
  uint64_t v36;
  PXPhotosSectionHeaderLayoutProvider *customSectionHeaderLayoutProvider;
  uint64_t v38;
  PXPhotosGlobalHeaderLayoutProvider *customGlobalHeaderLayoutProvider;
  uint64_t v40;
  PXPhotosBannerProvider *customBannerProvider;
  uint64_t v42;
  PXPhotosViewEventTracker *eventTracker;
  PXGView *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  PXGView *gridView;
  double v49;
  void *v50;
  void *v51;
  PXPhotosRootLayout *v52;
  PXGLayout *rootLayout;
  void *v54;
  uint64_t v55;
  PXUpdater *updater;
  objc_super v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)PXPhotosContentController;
  v8 = -[PXPhotosContentController init](&v58, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "mediaProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v8->_mediaProvider;
    v8->_mediaProvider = (PXMediaProvider *)v9;

    objc_msgSend(v6, "adjustedExtendedTraitCollection:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    traitCollection = v8->_traitCollection;
    v8->_traitCollection = (PXExtendedTraitCollection *)v11;

    objc_msgSend(v7, "registerChangeObserver:context:", v8, PXExtendedTraitCollectionObservationContext_65805);
    -[PXPhotosContentController _updateIsInCompactMode](v8, "_updateIsInCompactMode");
    objc_msgSend(v6, "footerViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_needsFooterStatusController = v13 == 0;

    needsFooterStatusController = v8->_needsFooterStatusController;
    if (needsFooterStatusController)
      needsFooterStatusController = objc_msgSend(v6, "footerVisibilityStyle") != 0;
    v8->_needsCountsInitially = needsFooterStatusController;
    v15 = objc_alloc((Class)off_1E50B16E8);
    objc_msgSend(v6, "dataSourceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithAssetsDataSourceManager:", v16);
    countsController = v8->_countsController;
    v8->_countsController = (PXAssetsDataSourceCountsController *)v17;

    if (objc_msgSend(v6, "sectionBodyStyle"))
      v19 = ~(objc_msgSend(v6, "allowedBehaviors") >> 13) & 2;
    else
      v19 = 0;
    v20 = objc_alloc_init(PXPhotosContentInlinePlaybackController);
    inlinePlaybackController = v8->_inlinePlaybackController;
    v8->_inlinePlaybackController = v20;

    -[PXPhotosContentInlinePlaybackController setDelegate:](v8->_inlinePlaybackController, "setDelegate:", v8);
    if (objc_msgSend(v6, "sectionHeaderStyle") || (objc_msgSend(v6, "allowedBehaviors") & 0x4000) != 0)
    {
      if (objc_msgSend(v6, "sectionHeaderStyle") == 9)
        v19 |= 4uLL;
      v22 = 1;
    }
    else
    {
      v22 = 0;
    }
    v23 = -[PXPhotosLayoutSpecManager initWithExtendedTraitCollection:options:enableSectionHeaders:]([PXPhotosLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:enableSectionHeaders:", v7, v19, v22);
    -[PXMediaProvider availableThumbnailSizes](v8->_mediaProvider, "availableThumbnailSizes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayoutSpecManager setAvailableThumbnailSizes:](v23, "setAvailableThumbnailSizes:", v24);

    -[PXPhotosLayoutSpecManager setGridStyle:](v23, "setGridStyle:", objc_msgSend(v6, "gridStyle"));
    v25 = -[PXPhotosViewModel initWithConfiguration:specManager:inlinePlaybackController:]([PXPhotosViewModel alloc], "initWithConfiguration:specManager:inlinePlaybackController:", v6, v23, v8->_inlinePlaybackController);
    viewModel = v8->_viewModel;
    v8->_viewModel = v25;

    -[PXPhotosViewModel registerChangeObserver:context:](v8->_viewModel, "registerChangeObserver:context:", v8, PXPhotosViewModelObservationContext);
    -[PXPhotosViewModel viewOptionsModel](v8->_viewModel, "viewOptionsModel");
    v27 = objc_claimAutoreleasedReturnValue();
    viewOptionsModel = v8->_viewOptionsModel;
    v8->_viewOptionsModel = (PXPhotosViewOptionsModel *)v27;

    -[PXPhotosViewOptionsModel registerChangeObserver:context:](v8->_viewOptionsModel, "registerChangeObserver:context:", v8, PXPhotosViewOptionsModelObservationContext);
    objc_msgSend(v6, "overlayController");
    v29 = objc_claimAutoreleasedReturnValue();
    overlayController = v8->_overlayController;
    v8->_overlayController = (PXPhotosOverlayController *)v29;

    -[PXPhotosOverlayController setDelegate:](v8->_overlayController, "setDelegate:", v8);
    -[PXPhotosOverlayController setPhotosViewModel:](v8->_overlayController, "setPhotosViewModel:", v8->_viewModel);
    +[PXPhotosViewInteraction interactionWithViewModel:](PXPhotosViewInteraction, "interactionWithViewModel:", v8->_viewModel);
    v31 = objc_claimAutoreleasedReturnValue();
    interaction = v8->_interaction;
    v8->_interaction = (PXPhotosViewInteraction *)v31;

    -[PXPhotosViewInteraction setDelegate:](v8->_interaction, "setDelegate:", v8);
    -[PXPhotosViewInteraction setContentController:](v8->_interaction, "setContentController:", v8);
    v33 = -[PXPhotosLayout initWithViewModel:specManager:overlayController:]([PXPhotosLayout alloc], "initWithViewModel:specManager:overlayController:", v8->_viewModel, v23, v8->_overlayController);
    -[PXPhotosLayout setDelegate:](v33, "setDelegate:", v8);
    -[PXGLayout addInteraction:](v33, "addInteraction:", v8->_interaction);
    objc_storeStrong((id *)&v8->_layout, v33);
    objc_msgSend(v6, "sectionBodyLayoutProvider");
    v34 = objc_claimAutoreleasedReturnValue();
    customSectionBodyLayoutProvider = v8->_customSectionBodyLayoutProvider;
    v8->_customSectionBodyLayoutProvider = (PXPhotosCustomSectionBodyLayoutProvider *)v34;

    v8->_customSectionBodyStyle = objc_msgSend(v6, "sectionBodyStyle");
    objc_msgSend(v6, "sectionHeaderLayoutProvider");
    v36 = objc_claimAutoreleasedReturnValue();
    customSectionHeaderLayoutProvider = v8->_customSectionHeaderLayoutProvider;
    v8->_customSectionHeaderLayoutProvider = (PXPhotosSectionHeaderLayoutProvider *)v36;

    objc_msgSend(v6, "globalHeaderLayoutProvider");
    v38 = objc_claimAutoreleasedReturnValue();
    customGlobalHeaderLayoutProvider = v8->_customGlobalHeaderLayoutProvider;
    v8->_customGlobalHeaderLayoutProvider = (PXPhotosGlobalHeaderLayoutProvider *)v38;

    v8->_customSectionHeaderStyle = objc_msgSend(v6, "sectionHeaderStyle");
    objc_msgSend(v6, "bannerProvider");
    v40 = objc_claimAutoreleasedReturnValue();
    customBannerProvider = v8->_customBannerProvider;
    v8->_customBannerProvider = (PXPhotosBannerProvider *)v40;

    -[PXPhotosContentController _updateSectionHeaderAndBodyProvider](v8, "_updateSectionHeaderAndBodyProvider");
    PXPhotosViewEventTrackerCreate(v8);
    v42 = objc_claimAutoreleasedReturnValue();
    eventTracker = v8->_eventTracker;
    v8->_eventTracker = (PXPhotosViewEventTracker *)v42;

    if ((objc_msgSend(v6, "isEmbedded") & 1) == 0)
    {
      v44 = [PXGView alloc];
      v59[0] = &unk_1E53EC2D0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v6, "gridPresentationType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[PXGView initWithFrame:allowedPresentationTypes:](v44, "initWithFrame:allowedPresentationTypes:", v46, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      gridView = v8->_gridView;
      v8->_gridView = (PXGView *)v47;

      -[PXGView setLowMemoryModeEnabled:](v8->_gridView, "setLowMemoryModeEnabled:", objc_msgSend(v6, "lowMemoryMode"));
      objc_msgSend(v6, "itemAspectRatio");
      -[PXGView setAllowLargerImagesDuringScrollingInLowMemoryMode:](v8->_gridView, "setAllowLargerImagesDuringScrollingInLowMemoryMode:", v49 != 1.0);
      -[PXGView scrollingSpeedometer](v8->_gridView, "scrollingSpeedometer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosContentInlinePlaybackController setScrollViewSpeedometer:](v8->_inlinePlaybackController, "setScrollViewSpeedometer:", v50);

      -[PXPhotosOverlayController overlayLayoutProvider](v8->_overlayController, "overlayLayoutProvider");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
        v52 = -[PXPhotosRootLayout initWithPhotosLayout:overlayController:]([PXPhotosRootLayout alloc], "initWithPhotosLayout:overlayController:", v33, v8->_overlayController);
      else
        v52 = v33;
      rootLayout = v8->_rootLayout;
      v8->_rootLayout = &v52->super.super;

      -[PXGView setRootLayout:](v8->_gridView, "setRootLayout:", v8->_rootLayout);
      -[PXGView setAxNextResponder:](v8->_gridView, "setAxNextResponder:", v8);
      -[PXGView registerAllTextureProvidersWithMediaProvider:](v8->_gridView, "registerAllTextureProvidersWithMediaProvider:", v8->_mediaProvider);
      -[PXGView scrollViewController](v8->_gridView, "scrollViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "registerObserver:", v8);
      objc_msgSend(v54, "setIndicatorStyle:", objc_msgSend(v6, "scrollIndicatorStyle"));
      v55 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v8, sel__setNeedsUpdate);
      updater = v8->_updater;
      v8->_updater = (PXUpdater *)v55;

      -[PXUpdater addUpdateSelector:needsUpdate:](v8->_updater, "addUpdateSelector:needsUpdate:", sel__updateFullscreenOverlayControllers, 1);
      -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateHasScrollableContent);
      -[PXUpdater addUpdateSelector:needsUpdate:](v8->_updater, "addUpdateSelector:needsUpdate:", sel__updateViewOptionsModel, 1);

    }
    -[PXPhotosContentController swift_init](v8, "swift_init");

  }
  return v8;
}

- (PXPhotosContentController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 349, CFSTR("%s is not available as initializer"), "-[PXPhotosContentController init]");

  abort();
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXPhotosContentController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p viewModel:%@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)contentViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  if (-[PXPhotosContentController needsCountsInitially](self, "needsCountsInitially"))
  {
    -[PXPhotosContentController countsController](self, "countsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareCountsIfNeeded");

  }
  -[PXPhotosContentController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__PXPhotosContentController_contentViewWillAppear___block_invoke;
  v13[3] = &unk_1E5149198;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "scheduleTaskAfterCATransactionCommits:", v13);

  -[PXPhotosContentController viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "wantsFooterVisibleImmediately");

  if ((_DWORD)v8)
  {
    -[PXPhotosContentController footerStatusController](self, "footerStatusController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewWillAppear");

    -[PXPhotosContentController footerPresentation](self, "footerPresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewWillAppear");

  }
  -[PXPhotosContentController swift_contentViewWillAppear:](self, "swift_contentViewWillAppear:", v3);

}

- (PXPhotosGridFooterStatusController)footerStatusController
{
  void *v3;
  PXPhotosGridFooterStatusController *v4;
  void *v5;
  PXPhotosGridFooterStatusController *v6;
  PXPhotosGridFooterStatusController *footerStatusController;

  if (!self->_footerStatusController
    && -[PXPhotosContentController needsFooterStatusController](self, "needsFooterStatusController"))
  {
    -[PXPhotosContentController countsController](self, "countsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [PXPhotosGridFooterStatusController alloc];
    -[PXPhotosContentController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXPhotosGridFooterStatusController initWithViewModel:itemsCountsController:](v4, "initWithViewModel:itemsCountsController:", v5, v3);
    footerStatusController = self->_footerStatusController;
    self->_footerStatusController = v6;

    -[PXPhotosGridFooterStatusController setDelegate:](self->_footerStatusController, "setDelegate:", self);
  }
  return self->_footerStatusController;
}

- (PXPhotosGridFooterPresentation)footerPresentation
{
  void *v3;
  PXPhotosGridFooterPresentation *footerPresentation;
  BOOL v5;
  void *v6;
  PXPhotosGridFooterPresentation *v7;
  void *v8;
  PXPhotosGridFooterPresentation *v9;
  PXPhotosGridFooterPresentation *v10;
  PXPhotosGridFooterPresentation *v11;

  -[PXPhotosContentController gridView](self, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  footerPresentation = self->_footerPresentation;
  if (footerPresentation)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    -[PXPhotosContentController layout](self, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PXPhotosGridFooterPresentation alloc];
    -[PXPhotosContentController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXPhotosGridFooterPresentation initWithViewModel:gridView:layout:](v7, "initWithViewModel:gridView:layout:", v8, v3, v6);
    v10 = self->_footerPresentation;
    self->_footerPresentation = v9;

    -[PXPhotosGridFooterPresentation setDelegate:](self->_footerPresentation, "setDelegate:", self);
    footerPresentation = self->_footerPresentation;
  }
  v11 = footerPresentation;

  return v11;
}

- (void)contentViewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsContentViewVisible:", 1);

  -[PXPhotosContentController footerStatusController](self, "footerStatusController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewDidAppear");

  -[PXPhotosContentController footerPresentation](self, "footerPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewDidAppear");

  -[PXPhotosContentController swift_contentViewDidAppear:](self, "swift_contentViewDidAppear:", v3);
  -[PXPhotosContentController gridView](self, "gridView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v8 = v10;
    +[PXRepresentedEntityProviderRegistration registerViewAnnotationView:](_TtC12PhotosUICore39PXRepresentedEntityProviderRegistration, "registerViewAnnotationView:", v8);

  }
  PXRegisterAppIntentsViewAnnotationDelegate(self);
  -[PXPhotosContentController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performChanges:", &__block_literal_global_174);

}

- (void)contentViewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsContentViewVisible:", 0);

  -[PXPhotosContentController swift_contentViewDidDisappear:](self, "swift_contentViewDidDisappear:", v3);
  PXUnregisterAppIntentsViewAnnotationDelegate(self);
}

- (void)contentViewDidScrollToInitialPosition
{
  void *v3;

  -[PXPhotosContentController footerPresentation](self, "footerPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidScrollToInitialPosition");

  -[PXPhotosContentController swift_contentViewDidScrollToInitialPosition](self, "swift_contentViewDidScrollToInitialPosition");
}

- (void)enumerateAssetHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a5;
  if (v12)
  {
    v8 = a4;
    -[PXPhotosContentController interaction](self, "interaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hitTestResultsInDirection:fromSpriteReference:", a3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__PXPhotosContentController_enumerateAssetHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke;
    v13[3] = &unk_1E511F6C8;
    v14 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  }
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
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  PXSimpleIndexPath *result;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;

  v10 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x4010000000;
  v45 = &unk_1A7E74EE7;
  v11 = *((_OWORD *)off_1E50B8778 + 1);
  v46 = *(_OWORD *)off_1E50B8778;
  v47 = v11;
  if (objc_msgSend(v10, "numberOfSections") != 1
    || (-[PXPhotosContentController layout](self, "layout"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "presentedItemsGeometryForSection:inDataSource:", 0, v10),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    if (!a6 || a4->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
      goto LABEL_13;
    if (a4->item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = *(_OWORD *)&a4->item;
        v40 = *(_OWORD *)&a4->dataSourceIdentifier;
        v41 = v17;
        objc_msgSend(v10, "assetCollectionReferenceAtSectionIndexPath:", &v40);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosContentController layout](self, "layout");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "spriteReferenceForObjectReference:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2;
        v30[3] = &unk_1E511F6F0;
        v21 = v10;
        v22 = *(_OWORD *)&a4->item;
        v33 = *(_OWORD *)&a4->dataSourceIdentifier;
        v34 = v22;
        v31 = v21;
        v32 = &v42;
        -[PXPhotosContentController enumerateAssetHitTestResultsInDirection:fromSpriteReference:usingBlock:](self, "enumerateAssetHitTestResultsInDirection:fromSpriteReference:usingBlock:", a6, v20, v30);
        v23 = v31;
LABEL_12:

      }
    }
    else if (a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = *(_OWORD *)&a4->item;
      v40 = *(_OWORD *)&a4->dataSourceIdentifier;
      v41 = v24;
      objc_msgSend(v10, "assetReferenceAtItemIndexPath:", &v40);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosContentController layout](self, "layout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "spriteReferenceForObjectReference:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke;
      v35[3] = &unk_1E511F6F0;
      v26 = v10;
      v27 = *(_OWORD *)&a4->item;
      v38 = *(_OWORD *)&a4->dataSourceIdentifier;
      v39 = v27;
      v36 = v26;
      v37 = &v42;
      -[PXPhotosContentController enumerateAssetHitTestResultsInDirection:fromSpriteReference:usingBlock:](self, "enumerateAssetHitTestResultsInDirection:fromSpriteReference:usingBlock:", a6, v20, v35);
      v23 = v36;
      goto LABEL_12;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v14 = objc_msgSend(v13, "itemClosestToItem:inDirection:", a4->item, a6);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v43;
    v16 = *(_OWORD *)&a4->item;
    *((_OWORD *)v43 + 2) = *(_OWORD *)&a4->dataSourceIdentifier;
    *((_OWORD *)v15 + 3) = v16;
    v15[6] = v14;
  }
LABEL_14:
  v28 = *((_OWORD *)v43 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v43 + 2);
  *(_OWORD *)&retstr->item = v28;

  _Block_object_dispose(&v42, 8);
  return result;
}

- (PXSimpleIndexPath)_selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
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
    -[PXPhotosContentController _indexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_indexPathClosestToIndexPath:fromDataSource:inDirection:", v18, v10, a6);
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
  while (!-[PXPhotosContentController canSelectObjectAtIndexPath:inDataSource:](self, "canSelectObjectAtIndexPath:inDataSource:", &v19, v10));

  return result;
}

- (void)enumerateAssetHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXPhotosContentController interaction](self, "interaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hitTestResultsInRect:passingTest:", 0, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PXPhotosContentController_enumerateAssetHitTestResultsInRect_usingBlock___block_invoke;
  v14[3] = &unk_1E511F6C8;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

}

- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4
{
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double x;
  double y;
  double width;
  double height;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGAffineTransform v64;
  uint64_t v65;
  CGAffineTransform v66;
  CGRect v67;
  CGRect v68;

  v5 = a4;
  -[PXPhotosContentController interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[PXPhotosContentController viewModel](self, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController layout](self, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController interaction](self, "interaction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scrollViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentCoordinateSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(v18, "rootLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:fromLayout:", v30, v23, v25, v27, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  if (v18)
  {
    objc_msgSend(v18, "orientedContentTransform");
  }
  else
  {
    v65 = 0;
    memset(&v64, 0, sizeof(v64));
  }
  v66 = v64;
  v67.origin.x = v32;
  v67.origin.y = v34;
  v67.size.width = v36;
  v67.size.height = v38;
  v68 = CGRectApplyAffineTransform(v67, &v66);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  v43 = objc_alloc_init((Class)off_1E50B3668);
  v44 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke;
  v56[3] = &unk_1E511F718;
  v60 = x;
  v61 = y;
  v62 = width;
  v63 = height;
  v45 = v18;
  v57 = v45;
  v46 = v43;
  v58 = v46;
  v47 = v17;
  v59 = v47;
  objc_msgSend(v45, "enumerateItemsGeometriesInRect:dataSource:usingBlock:", v47, v56, x, y, width, height);
  v48 = v46;
  v49 = v48;
  if (!v48)
  {
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v54[0] = v44;
    v54[1] = 3221225472;
    v54[2] = __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_3;
    v54[3] = &unk_1E511F740;
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v50 = v55;
    -[PXPhotosContentController enumerateAssetHitTestResultsInRect:usingBlock:](self, "enumerateAssetHitTestResultsInRect:usingBlock:", v54, v9, v11, v13, v15);
    v49 = (void *)objc_msgSend(v50, "copy");

  }
  v51 = v59;
  v52 = v49;

  return v52;
}

- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5;
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
  void *v21;

  v5 = a4;
  -[PXPhotosContentController interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  -[PXPhotosContentController layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController interaction](self, "interaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v13 = v12;
  v15 = v14;

  objc_msgSend(v8, "rootLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayout:", v16, v13, v15);
  v18 = v17;
  v20 = v19;

  objc_msgSend(v8, "createPointReferenceAtPoint:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointForPointReference:", v7);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v8, "rootLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:fromLayout:", v8, v10, v12);

  -[PXPhotosContentController interaction](self, "interaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController interaction](self, "interaction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrollViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentCoordinateSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();

  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v20 = v19;
  v22 = v21;

  v23 = v20;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  __int128 v8;
  void *v9;
  _OWORD v11[2];

  v5 = a4;
  v6 = v5;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_2;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = a3->subitem == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    v7 = 0;
  }
  else
  {
    v8 = *(_OWORD *)&a3->item;
    v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v11[1] = v8;
    objc_msgSend(v5, "assetCollectionAtSectionIndexPath:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 != 0;

  }
LABEL_7:

  return v7;
}

- (void)moveSelectionInDirection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  -[PXPhotosContentController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "moveSelectionInDirection:withDelegate:", a3, self);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  if ((_QWORD)v11 != *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v5, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v11;
    v10[1] = v12;
    objc_msgSend(v8, "assetReferenceAtItemIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[PXPhotosContentController scrollToRevealAssetReference:completionHandler:](self, "scrollToRevealAssetReference:completionHandler:", v9, 0);

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

  -[PXPhotosContentController viewModel](self, "viewModel");
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
    -[PXPhotosContentController moveSelectionInDirection:](self, "moveSelectionInDirection:", a3);
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
      objc_msgSend(v11, "assetReferenceAtItemIndexPath:", &v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[PXPhotosContentController scrollToRevealAssetReference:completionHandler:](self, "scrollToRevealAssetReference:completionHandler:", v12, 0);

    }
  }

}

- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  void *v8;
  void *v9;
  __int128 v10;
  PXSimpleIndexPath *result;
  _OWORD v12[2];

  -[PXPhotosContentController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_OWORD *)&a4->item;
  v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v12[1] = v10;
  -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", v12, v9, a5);

  return result;
}

- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5
{
  int64_t section;
  int64_t v8;
  int64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t item;
  void *v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  PXSimpleIndexPath *v21;
  uint64_t dataSourceIdentifier;
  int64_t v23;
  uint64_t v24;
  uint64_t subitem;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  PXSimpleIndexPath *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  char v42;
  int64_t v43;
  char v44;
  void *v46;
  char v47;
  uint64_t v48;
  BOOL v50;
  PXSimpleIndexPath *v52;
  void *v53;
  void *v54;
  PXSimpleIndexPath *v56;
  void (**v57)(void);
  int64_t v58;
  int64_t v59;
  uint64_t v60;
  int64_t v61;
  id v62;
  int64_t v63;
  id v65;
  uint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD aBlock[6];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  int64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;

  v65 = a5;
  v60 = objc_msgSend(v65, "identifier");
  v56 = a3;
  section = a3->section;
  v8 = a4->section;
  v62 = objc_alloc_init((Class)off_1E50B3668);
  v9 = v8 - section;
  if (v8 >= section)
  {
    for (i = 0; v9 + 1 != i; ++i)
    {
      v11 = objc_msgSend(v65, "numberOfItemsInSection:", section + i);
      -[PXPhotosContentController layout](self, "layout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentedItemsGeometryForSection:inDataSource:", section + i, v65);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (i)
          item = 0;
        else
          item = v56->item;
        if (v9 == i)
        {
          v16 = a4->item;
        }
        else
        {
          if (v11 <= 1)
            v17 = 1;
          else
            v17 = v11;
          v16 = v17 - 1;
        }
        objc_msgSend(v13, "itemsBetweenItem:andItem:", item, v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_19;
      }
      else
      {
        if (!i)
          goto LABEL_19;
        if (v9 == i)
          goto LABEL_19;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_19;
      }
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke;
      v79[3] = &unk_1E5128958;
      v80 = v15;
      v18 = v15;
      objc_msgSend(v62, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v60, section + i, v79);

LABEL_19:
    }
  }
  v19 = v62;
  v20 = v19;
  if (!v19)
  {
    v21 = a4;
    dataSourceIdentifier = v56->dataSourceIdentifier;
    v23 = v56->section;
    v24 = v56->item;
    subitem = v56->subitem;
    v26 = v21->dataSourceIdentifier;
    v27 = v21->section;
    v28 = v21->item;
    v29 = v21->subitem;
    v52 = v21;
    v75 = v56->dataSourceIdentifier;
    v76 = v23;
    v77 = v24;
    v78 = subitem;
    objc_msgSend(v65, "objectReferenceAtIndexPath:", &v75);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v26;
    v63 = v27;
    v75 = v26;
    v76 = v27;
    v58 = v29;
    v59 = v28;
    v77 = v28;
    v78 = v29;
    objc_msgSend(v65, "objectReferenceAtIndexPath:", &v75);
    v30 = objc_claimAutoreleasedReturnValue();
    -[PXPhotosContentController interaction](self, "interaction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v30;
    LOBYTE(v30) = objc_msgSend(v32, "isObjectReference:visuallyBeforeObjectReference:", v54, v30);

    if ((v30 & 1) != 0)
    {
      v33 = v52;
    }
    else
    {
      v33 = v52;
      dataSourceIdentifier = v52->dataSourceIdentifier;
      v23 = v52->section;
      v24 = v52->item;
      subitem = v52->subitem;
      v61 = v56->dataSourceIdentifier;
      v63 = v56->section;
      v58 = v56->subitem;
      v59 = v56->item;
    }
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke_2;
    aBlock[3] = &unk_1E513E940;
    aBlock[4] = self;
    aBlock[5] = a2;
    v34 = *(_OWORD *)&v56->item;
    v71 = *(_OWORD *)&v56->dataSourceIdentifier;
    v72 = v34;
    v35 = *(_OWORD *)&v33->item;
    v73 = *(_OWORD *)&v33->dataSourceIdentifier;
    v74 = v35;
    v57 = (void (**)(void))_Block_copy(aBlock);
    while (1)
    {
      v36 = subitem;
      v37 = v24;
      v38 = dataSourceIdentifier;
      v75 = dataSourceIdentifier;
      v76 = v23;
      v77 = v24;
      v78 = subitem;
      objc_msgSend(v20, "addIndexPath:", &v75);
      v39 = dataSourceIdentifier == v61 && v23 == v63;
      v40 = v39 && v24 == v59;
      v66 = dataSourceIdentifier;
      v67 = v23;
      v41 = v40 && subitem == v58;
      v42 = v41;
      v68 = v24;
      v69 = subitem;
      -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v66, v65, 5);
      dataSourceIdentifier = v75;
      v43 = v76;
      v24 = v77;
      subitem = v78;
      if (objc_msgSend(v20, "containsIndexPath:", &v75))
        break;
      if (v43 == v23)
        v44 = v42;
      else
        v44 = 1;
      if ((v44 & 1) != 0)
      {
        if ((v42 & 1) != 0)
          goto LABEL_43;
        goto LABEL_46;
      }
    }
    v57[2]();
    if ((v42 & 1) != 0)
      goto LABEL_43;
LABEL_46:
    if (v43 < v63)
    {
      v43 = v63 - 1;
      v24 = objc_msgSend(v65, "numberOfItemsInSection:", v63 - 1) - 1;
      dataSourceIdentifier = objc_msgSend(v65, "identifier");
      v75 = v38;
      v76 = v23;
      v77 = v37;
      v78 = v36;
      v66 = dataSourceIdentifier;
      v67 = v63 - 1;
      subitem = 0x7FFFFFFFFFFFFFFFLL;
      v68 = v24;
      v69 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v65, "indexPathSetFromIndexPath:toIndexPath:", &v75, &v66);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unionIndexPathSet:", v46);

    }
    v47 = 0;
    v48 = *(_QWORD *)off_1E50B7E98;
    while ((v47 & 1) == 0 && dataSourceIdentifier != v48)
    {
      v75 = dataSourceIdentifier;
      v76 = v43;
      v77 = v24;
      v78 = subitem;
      objc_msgSend(v20, "addIndexPath:", &v75);
      v50 = dataSourceIdentifier == v61 && v43 == v63 && v24 == v59;
      v66 = dataSourceIdentifier;
      v67 = v43;
      v47 = v50 && subitem == v58;
      v68 = v24;
      v69 = subitem;
      -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v66, v65, 5);
      dataSourceIdentifier = v75;
      v43 = v76;
      v24 = v77;
      subitem = v78;
      if (objc_msgSend(v20, "containsIndexPath:", &v75))
      {
        v57[2]();
        v75 = v61;
        v76 = v63;
        v77 = v59;
        v78 = v58;
        objc_msgSend(v20, "addIndexPath:", &v75);
        break;
      }
    }
LABEL_43:

    v19 = 0;
  }

  return v20;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXPhotosContentController interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regionOfInterestForObjectReference:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PXPhotosContentController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXRegionOfInterestForAssetReference(v8, v10, v6, (uint64_t *)a4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)collapsibleFooterHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXPhotosContentController layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomCollapsibleArea");
  v4 = ceil(v3);

  return v4;
}

- (void)scrollToInitialPositionAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  unsigned int v32;

  v4 = a3;
  if (a4)
    v6 = a4;
  else
    v6 = &__block_literal_global_183;
  v7 = _Block_copy(v6);
  -[PXPhotosContentController interaction](self, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopScrollingAndZoomingAnimations");

  -[PXPhotosContentController viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "performChanges:", &__block_literal_global_184);
  -[PXPhotosContentController layout](self, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createAnchorForScrollingToInitialPosition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  if (v4 && (objc_msgSend(v13, "anchoredContentEdges"), PXEdgesGetCGRectEdge()))
  {
    objc_msgSend(v13, "invalidate");
    -[PXPhotosContentController interaction](self, "interaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "padding");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_3;
    v30[3] = &unk_1E5148A40;
    v31 = v7;
    objc_msgSend(v15, "scrollToEdge:padding:animated:completionHandler:", v32, 1, v30, v17, v19, v21, v23);

    v24 = v31;
  }
  else
  {
    v25 = (id)objc_msgSend(v13, "autoInvalidate");
    if (!v13)
    {
      (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
      goto LABEL_11;
    }
    -[PXPhotosContentController interaction](self, "interaction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_4;
    v28[3] = &unk_1E5148A40;
    v29 = v7;
    objc_msgSend(v27, "installLayoutCompletionHandler:", v28);

    v24 = v29;
  }

LABEL_11:
}

- (void)scrollToEdge:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[PXPhotosContentController layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearLastVisibleAreaAnchoringInformation");

  -[PXPhotosContentController interaction](self, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stopScrollingAndZoomingAnimations");
  objc_msgSend(v9, "scrollToEdge:animated:", v4, 0);
  if (v6)
  {
    -[PXPhotosContentController interaction](self, "interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PXPhotosContentController_scrollToEdge_completionHandler___block_invoke;
    v12[3] = &unk_1E5148A40;
    v13 = v6;
    objc_msgSend(v11, "installLayoutCompletionHandler:", v12);

  }
}

- (void)scrollToRevealAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  void *v10;
  _OWORD v11[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)off_1E50B1688);
  v9 = *((_OWORD *)off_1E50B8778 + 1);
  v11[0] = *(_OWORD *)off_1E50B8778;
  v11[1] = v9;
  v10 = (void *)objc_msgSend(v8, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v7, 0, v11);

  -[PXPhotosContentController scrollToRevealAssetReference:completionHandler:](self, "scrollToRevealAssetReference:completionHandler:", v10, v6);
}

- (void)scrollToRevealAssetReference:(id)a3 completionHandler:(id)a4
{
  -[PXPhotosContentController scrollToRevealAssetReference:scrollPosition:padding:completionHandler:](self, "scrollToRevealAssetReference:scrollPosition:padding:completionHandler:", a3, 64, a4, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (void)scrollToRevealAssetReference:(id)a3 padding:(UIEdgeInsets)a4 completionHandler:(id)a5
{
  -[PXPhotosContentController scrollToRevealAssetReference:scrollPosition:padding:completionHandler:](self, "scrollToRevealAssetReference:scrollPosition:padding:completionHandler:", a3, 64, a5, a4.top, a4.left, a4.bottom, a4.right);
}

- (void)scrollToRevealAssetReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a6;
  v14 = a3;
  -[PXPhotosContentController viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetReferenceForAssetReference:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || v17)
  {
    -[PXPhotosContentController layout](self, "layout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rootLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v17, a4, top, left, bottom, right);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v20, "autoInvalidate");

    -[PXPhotosContentController interaction](self, "interaction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scrollViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stopScrollingAndZoomingAnimations");

    objc_msgSend(v19, "enumerateDescendantsLayoutsUsingBlock:", &__block_literal_global_186_65830);
    if (v13)
    {
      -[PXPhotosContentController interaction](self, "interaction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke_2;
      v26[3] = &unk_1E5148A40;
      v27 = v13;
      objc_msgSend(v25, "installLayoutCompletionHandler:", v26);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (void)scrollToNeighboringSectionInDirection:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v4 = a4;
  -[PXPhotosContentController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stopScrollingAndZoomingAnimations");
  -[PXPhotosContentController layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleOriginForScrollingToNeighboringSectionInDirection:", a3);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "rootLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:fromDescendantLayout:", v8, v10, v12);
  objc_msgSend(v13, "visibleRect");
  PXRectWithOriginAndSize();
  objc_msgSend(v13, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  objc_msgSend(v14, "scrollRectToVisible:animated:", v4);

}

- (BOOL)isScrolledAtOrAboveDetent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double (**v7)(_QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD aBlock[5];

  v4 = a3;
  -[PXPhotosContentController interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPhotosContentController_isScrolledAtOrAboveDetent___block_invoke;
  aBlock[3] = &unk_1E511F7E8;
  aBlock[4] = self;
  v7 = (double (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v6, "visibleRect");
  v8 = v7[2](v7);
  -[PXPhotosContentController _targetVisibleRectForScrollingScrollViewController:toDetent:](self, "_targetVisibleRectForScrollingScrollViewController:toDetent:", v6, v4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  LOBYTE(v4) = v8 <= ((double (*)(double (**)(_QWORD), double, double, double, double))v7[2])(v7, v10, v12, v14, v16);
  return (char)v4;
}

- (void)scrollToDetent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v4 = a4;
  v6 = a3;
  -[PXPhotosContentController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController _targetVisibleRectForScrollingScrollViewController:toDetent:](self, "_targetVisibleRectForScrollingScrollViewController:toDetent:", v16, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v16, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 0, v4, v9, v11, v13, v15);
}

- (CGRect)_targetVisibleRectForScrollingScrollViewController:(id)a3 toDetent:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v6 = a4;
  objc_msgSend(a3, "visibleRect");
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  objc_msgSend(v6, "offset");

  -[PXPhotosContentController layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axis");
  PXPointSetValueForAxis();

  v12 = v16;
  v13 = v17;
  v14 = v18;
  v15 = v19;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)suspendDataSourceChangesWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  double v14;
  uint8_t buf[16];

  v6 = a4;
  -[PXPhotosContentController dataSourceManagerPauseToken](self, "dataSourceManagerPauseToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLGridZeroGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "data source changes are already paused", buf, 2u);
    }

  }
  -[PXPhotosContentController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PXPhotosContentController_suspendDataSourceChangesWithTimeout_identifier___block_invoke;
  v12[3] = &unk_1E51209D8;
  v14 = a3;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "performChanges:", v12);

}

- (void)resumeDataSourceChangesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  -[PXPhotosContentController dataSourceManagerPauseToken](self, "dataSourceManagerPauseToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotosContentController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PXPhotosContentController_resumeDataSourceChangesIfNeeded__block_invoke;
    v7[3] = &unk_1E5145F88;
    v7[4] = self;
    objc_msgSend(v5, "performChanges:", v7);

  }
  else
  {
    PLGridZeroGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "data source changes don't seem to be paused", buf, 2u);
    }

  }
}

- (void)stopForceIncludingAllAssetsInDataSource
{
  void *v2;
  id v3;

  -[PXPhotosContentController viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_190);

}

- (PXAssetReference)assetReferenceForCurrentScrollPosition
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__65791;
  v24 = __Block_byref_object_dispose__65792;
  v25 = 0;
  -[PXPhotosContentController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScrolledToTop");

  if (v5)
  {
    -[PXPhotosContentController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    if (v7)
    {
      objc_msgSend(v7, "firstItemIndexPath");
      v8 = v18;
    }
    else
    {
      v8 = 0;
    }
    if (v8 != *(_QWORD *)off_1E50B7E98)
    {
      v17[0] = v18;
      v17[1] = v19;
      objc_msgSend(v7, "assetReferenceAtItemIndexPath:", v17);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v21[5];
      v21[5] = v9;

    }
  }
  v11 = (void *)v21[5];
  if (!v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__PXPhotosContentController_assetReferenceForCurrentScrollPosition__block_invoke;
    v14[3] = &unk_1E51291B0;
    v15 = v3;
    v16 = &v20;
    objc_msgSend(v15, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v14);

    v11 = (void *)v21[5];
  }
  v12 = v11;

  _Block_object_dispose(&v20, 8);
  return (PXAssetReference *)v12;
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderView:animated:", v6, v4);

}

- (void)setHeaderView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderView:animated:", v4, 0);

}

- (UIView)headerView
{
  void *v2;
  void *v3;

  -[PXPhotosContentController layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (NSUndoManager)undoManager
{
  void *v3;
  void *v4;

  -[PXPhotosContentController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManagerForContentController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v4;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PXPhotosContentController _updateInteractionWorkspaceController](self, "_updateInteractionWorkspaceController");
    -[PXPhotosContentController _updateIsInCompactMode](self, "_updateIsInCompactMode");
    -[PXPhotosContentController _updateBarsController](self, "_updateBarsController");
    -[PXPhotosContentController _updateSectionHeaderAndBodyProvider](self, "_updateSectionHeaderAndBodyProvider");
    v5 = obj;
  }

}

- (void)_updateBarsController
{
  void *v3;
  void *v4;
  PXPhotosBarsController *v5;
  PXPhotosBarsController *barsController;
  id v7;

  -[PXPhotosContentController viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForContentController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEmbedded")
    && objc_msgSend(v7, "allowsChromeManagementBehavior")
    && v4)
  {
    v5 = -[PXPhotosBarsController initWithPhotosContentController:]([PXPhotosBarsController alloc], "initWithPhotosContentController:", self);
    barsController = self->_barsController;
    self->_barsController = v5;

    -[PXBarsController setViewController:](self->_barsController, "setViewController:", v4);
  }

}

- (void)setNumberOfItemsToPlayInline:(int64_t)a3
{
  id v4;

  -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfItemsToPlay:", a3);

}

- (int64_t)numberOfItemsToPlayInline
{
  void *v2;
  int64_t v3;

  -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsToPlay");

  return v3;
}

- (void)setShouldEnablePlaybackDuringAnimatedScroll:(BOOL)a3
{
  id v3;

  if (self->_shouldEnablePlaybackDuringAnimatedScroll != a3)
  {
    self->_shouldEnablePlaybackDuringAnimatedScroll = a3;
    -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidatePlaybackEnabled");

  }
}

- (void)_setNeedsUpdate
{
  void *v3;
  id v4;

  -[PXPhotosContentController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotosContentController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "needsUpdateForContentController:", self);

  }
}

- (void)updateIfNeeded
{
  id v2;

  -[PXPhotosContentController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)_invalidateFullscreenOverlayControllers
{
  id v2;

  -[PXPhotosContentController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFullscreenOverlayControllers);

}

- (void)_updateFullscreenOverlayControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXPhotosContentController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForContentController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosContentController viewModel](self, "viewModel", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullscreenOverlayControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setContainerViewController:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_invalidateHasScrollableContent
{
  id v2;

  -[PXPhotosContentController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHasScrollableContent);

}

- (void)_updateHasScrollableContent
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  void *v25;
  _QWORD v26[4];
  char v27;
  CGRect v28;
  CGRect v29;

  -[PXPhotosContentController interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "constrainedVisibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "contentBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[PXPhotosContentController layout](self, "layout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "footerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v20 - v23;

  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v24;
  LOBYTE(v21) = !CGRectContainsRect(v28, v29);
  -[PXPhotosContentController viewModel](self, "viewModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__PXPhotosContentController__updateHasScrollableContent__block_invoke;
  v26[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
  v27 = (char)v21;
  objc_msgSend(v25, "performChanges:", v26);

}

- (void)_invalidateViewOptionsModel
{
  id v2;

  -[PXPhotosContentController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewOptionsModel);

}

- (void)_updateViewOptionsModel
{
  void *v3;
  _QWORD v4[5];

  -[PXPhotosContentController viewOptionsModel](self, "viewOptionsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PXPhotosContentController__updateViewOptionsModel__block_invoke;
  v4[3] = &unk_1E5144498;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateIsInCompactMode
{
  void *v3;
  _QWORD v4[5];

  -[PXPhotosContentController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PXPhotosContentController__updateIsInCompactMode__block_invoke;
  v4[3] = &unk_1E51437F8;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateSectionHeaderAndBodyProvider
{
  void *v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  PXPhotosContentController *v15;
  id v16;
  id v17;
  __objc2_class *v18;
  PXAlbumSectionHeaderLayoutProvider *v19;
  PXPhotosKeyAssetSectionHeaderLayoutProvider *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __objc2_class *v27;
  PXPhotosMapBodyLayoutProvider *v28;
  PXEditorialBodyLayoutProvider *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  char v51;

  -[PXPhotosContentController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosContentController customSectionHeaderStyle](self, "customSectionHeaderStyle");
  v6 = -[PXPhotosContentController customSectionBodyStyle](self, "customSectionBodyStyle");
  if (objc_msgSend(v4, "allowsLensControl"))
  {
    objc_msgSend(v4, "currentLens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "defaultSectionBodyStyle");

  }
  -[PXPhotosContentController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentingViewControllerForContentController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController customSectionHeaderLayoutProvider](self, "customSectionHeaderLayoutProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController customBannerProvider](self, "customBannerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v14 = v11;
  v15 = self;
  v16 = v12;
  v17 = v9;
  switch(v5)
  {
    case 1:
      v18 = PXAlbumSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 2:
      v18 = PXImportSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 3:
      v18 = PXContentSyndicationSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 4:
      v18 = PXDuplicatesSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 5:
      v18 = PXSharingSuggestionSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 6:
      v19 = -[PXAlbumSectionHeaderLayoutProvider initWithViewModel:viewProvider:]([PXAlbumSectionHeaderLayoutProvider alloc], "initWithViewModel:viewProvider:", v13, v15);
      -[PXAlbumSectionHeaderLayoutProvider setEditorialStyle:](v19, "setEditorialStyle:", 1);
      break;
    case 7:
      v20 = -[PXPhotosKeyAssetSectionHeaderLayoutProvider initWithViewModel:viewProvider:bannerProvider:]([PXPhotosKeyAssetSectionHeaderLayoutProvider alloc], "initWithViewModel:viewProvider:bannerProvider:", v13, v15, v16);
      goto LABEL_14;
    case 8:
      v19 = -[PXAlbumSectionHeaderLayoutProvider initWithViewModel:viewProvider:]([PXAlbumSectionHeaderLayoutProvider alloc], "initWithViewModel:viewProvider:", v13, v15);
      -[PXAlbumSectionHeaderLayoutProvider setAllowsFloatingBackground:](v19, "setAllowsFloatingBackground:", 0);
      break;
    case 9:
      v18 = PXPhotosSearchSectionHeaderLayoutProvider;
LABEL_13:
      v20 = (PXPhotosKeyAssetSectionHeaderLayoutProvider *)objc_msgSend([v18 alloc], "initWithViewModel:viewProvider:", v13, v15);
LABEL_14:
      v19 = (PXAlbumSectionHeaderLayoutProvider *)v20;
      break;
    case 10:
      v19 = (PXAlbumSectionHeaderLayoutProvider *)v14;
      if (v19)
        break;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPhotosSectionHeaderLayoutProvider> _PXCreateSectionHeaderLayoutProvider(PXPhotosViewSectionHeaderStyle, PXPhotosViewModel *__strong, __strong id<PXPhotosSectionHeaderLayoutProvider>, __strong id<PXPhotosSectionHeaderLayoutViewProvider>, __strong id<PXPhotosBannerProvider>, PXViewController *__strong)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXPhotosContentController.m"), 108, CFSTR("Custom section header layout provider is missing"));

LABEL_46:
      v19 = 0;
      break;
    default:
      goto LABEL_46;
  }

  objc_msgSend(v10, "setSectionHeaderProvider:", v19);
  -[PXPhotosContentController customSectionBodyLayoutProvider](v15, "customSectionBodyLayoutProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController traitCollection](v15, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  v24 = v21;
  v25 = v22;
  v26 = v17;
  switch(v6)
  {
    case 1uLL:
      v27 = PXZoomablePhotosBodyLayoutProvider;
      goto LABEL_18;
    case 2uLL:
      v27 = PXPhotosGridMessagesBodyLayoutProvider;
LABEL_18:
      v28 = (PXPhotosMapBodyLayoutProvider *)objc_msgSend([v27 alloc], "initWithViewModel:", v23);
      goto LABEL_25;
    case 3uLL:
      v29 = -[PXEditorialBodyLayoutProvider initWithViewModel:]([PXEditorialBodyLayoutProvider alloc], "initWithViewModel:", v23);
      v30 = v29;
      if (v5 == 7)
        -[PXEditorialBodyLayoutProvider setAvoidsFullWidthHeroes:](v29, "setAvoidsFullWidthHeroes:", 1);
      if (objc_msgSend(v23, "gridStyle") == 4 || objc_msgSend(v23, "gridStyle") == 5)
        objc_msgSend(v30, "setAvoidsFullWidthHeroes:", 1);
      goto LABEL_29;
    case 4uLL:
      v28 = -[PXPhotosMapBodyLayoutProvider initWithViewModel:traitCollection:presentingViewController:]([PXPhotosMapBodyLayoutProvider alloc], "initWithViewModel:traitCollection:presentingViewController:", v23, v25, v26);
LABEL_25:
      v30 = v28;
      goto LABEL_29;
    case 5uLL:
      objc_msgSend(v24, "setViewModel:", v23);
      v30 = v24;
      if (v30)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPhotosSectionBodyLayoutProvider> _PXCreateSectionBodyLayoutProvider(PXPhotosViewSectionBodyStyle, PXPhotosViewSectionHeaderStyle, PXPhotosViewModel *__strong, __strong id<PXPhotosCustomSectionBodyLayoutProvider>, PXExtendedTraitCollection *__strong, PXViewController *__strong)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXPhotosContentController.m"), 143, CFSTR("Custom section body layout provider is missing"));

LABEL_28:
      v30 = 0;
LABEL_29:

      objc_msgSend(v10, "setSectionBodyProvider:", v30);
      -[PXPhotosContentController customGlobalHeaderLayoutProvider](v15, "customGlobalHeaderLayoutProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGlobalHeaderProvider:", v33);

      if (v6 == 1)
      {
        objc_msgSend(v10, "sectionBodyProvider");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_32:
            objc_msgSend(v34, "createInteraction");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            -[PXPhotosViewInteraction setZoomablePhotosInteraction:](v15->_interaction, "setZoomablePhotosInteraction:", v35);
LABEL_36:
            v36 = 1;
            goto LABEL_37;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "px_descriptionForAssertionMessage");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXPhotosContentController.m"), 1019, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout.sectionBodyProvider"), v44, v46);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXPhotosContentController.m"), 1019, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout.sectionBodyProvider"), v44);
        }

        goto LABEL_32;
      }
      -[PXPhotosViewInteraction setZoomablePhotosInteraction:](v15->_interaction, "setZoomablePhotosInteraction:", 0);
      if (v6 > 5)
        goto LABEL_50;
      if (((1 << v6) & 0x2D) != 0)
      {
        v35 = 0;
        goto LABEL_36;
      }
      if (v6 != 4)
      {
LABEL_50:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _PXAllowSelectModeToggleForBodyStyle(PXPhotosViewSectionBodyStyle)");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("PXPhotosContentController.m"), 170, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v35 = 0;
      v36 = 0;
LABEL_37:
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __64__PXPhotosContentController__updateSectionHeaderAndBodyProvider__block_invoke;
      v50[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
      v51 = v36;
      objc_msgSend(v23, "performChanges:", v50);
      -[PXPhotosContentController gridView](v15, "gridView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scrollViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "scrollView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = 1;
        if (v6 == 4)
        {
          objc_msgSend(v38, "scrollToEdge:animated:", 1, 0);
          v40 = 0;
        }
        objc_msgSend(v39, "setScrollEnabled:", v40);
      }

      return;
    default:
      goto LABEL_28;
  }
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placementInContext:forItemReference:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacementOverride:forItemReference:", v7, v6);

}

- (id)photosLayout:(id)a3 animationForProposedAnimation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[PXPhotosContentController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosContentController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewControllerForContentController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5;
  if (v8)
  {
    v9 = v5;
    if (objc_msgSend(v6, "viewDelegateRespondsTo:", 8))
    {
      objc_msgSend(v6, "viewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photosViewController:animationForProposedAnimation:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)presentingViewControllerForPhotosInteraction:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosContentController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForContentController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sectionHeaderLayout:(id)a3 viewForSpriteReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[PXPhotosContentController interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForSpriteReference:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)selectionBasisForSelectionManager:(id)a3
{
  return 0;
}

- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6
{
  void *v10;
  void *v11;
  int64x2_t v12;
  int64x2_t v13;
  id v14;
  id v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;

  -[PXPhotosContentController viewModel](self, "viewModel", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a6)
  {
    case 2uLL:
      a6 = 5;
      break;
    case 1uLL:
      a6 = 6;
      break;
    case 0uLL:
      v12 = *(int64x2_t *)&a4->item;
      v25 = *(int64x2_t *)&a4->dataSourceIdentifier;
      v26 = v12;
      v13 = *(int64x2_t *)&a5->item;
      v23 = *(int64x2_t *)&a5->dataSourceIdentifier;
      v24 = v13;
      -[PXPhotosContentController indexPathsFromIndexPath:toIndexPath:inDataSource:](self, "indexPathsFromIndexPath:toIndexPath:inDataSource:", &v25, &v23, v11);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
  }
  v20 = *(int64x2_t *)&a4->dataSourceIdentifier;
  v21 = *(int64x2_t *)&a4->item;
  v15 = objc_alloc_init((Class)off_1E50B3668);
  v17 = v20;
  v16 = v21;
  v14 = v15;
  v18 = *(_QWORD *)off_1E50B7E98;
  do
  {
    v23 = v17;
    v24 = v16;
    -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v23, v11, a6, v20.i64[0]);
    v20 = v25;
    v22 = v26;
    objc_msgSend(v14, "addIndexPath:", &v25);
    v17 = v20;
    v16 = v22;
  }
  while ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v20, *(int64x2_t *)&a5->dataSourceIdentifier), (int32x4_t)vceqq_s64(v22, *(int64x2_t *)&a5->item))), 0xFuLL))) & 1) == 0&& v20.i64[0] != v18);
LABEL_10:

  return v14;
}

- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5
{
  void *v10;
  void *v11;
  __int128 v12;
  PXSimpleIndexPath *result;
  _OWORD v14[2];

  -[PXPhotosContentController viewModel](self, "viewModel", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v12 = *(_OWORD *)&a5->item;
  v14[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v14[1] = v12;
  -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", v14, v11, a6);

  return result;
}

- (BOOL)shouldEnablePlaybackFor:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[PXPhotosContentController gridView](self, "gridView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollingSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "regime") < 2
    || -[PXPhotosContentController shouldEnablePlaybackDuringAnimatedScroll](self, "shouldEnablePlaybackDuringAnimatedScroll");

  return v6;
}

- (CGRect)visibleRectFor:(id)a3
{
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
  CGRect result;

  -[PXPhotosContentController layout](self, "layout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsFor:(id)a3
{
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

  -[PXPhotosContentController layout](self, "layout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
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

- (CGRect)frameFor:(id)a3 outMinPlayableSize:(CGSize *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  int v34;
  _OWORD v35[10];
  uint64_t v36;
  CGRect result;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v10 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "spriteIndexForSpriteReference:", v10);

  if ((_DWORD)v12 != -1)
  {
    v34 = *(_DWORD *)off_1E50B8298;
    v13 = *((_OWORD *)off_1E50B8358 + 1);
    v33[0] = *(_OWORD *)off_1E50B8358;
    v33[1] = v13;
    v14 = *((_OWORD *)off_1E50B83A0 + 7);
    v35[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v35[7] = v14;
    v15 = *((_OWORD *)off_1E50B83A0 + 9);
    v35[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v35[9] = v15;
    v16 = *((_OWORD *)off_1E50B83A0 + 3);
    v35[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v35[3] = v16;
    v17 = *((_OWORD *)off_1E50B83A0 + 5);
    v35[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v35[5] = v17;
    v18 = *((_OWORD *)off_1E50B83A0 + 1);
    v35[0] = *(_OWORD *)off_1E50B83A0;
    v35[1] = v18;
    v19 = *(_OWORD *)off_1E50B8398;
    v20 = *((_OWORD *)off_1E50B8398 + 1);
    v32 = *((_QWORD *)off_1E50B8398 + 4);
    v31[0] = v19;
    v31[1] = v20;
    objc_msgSend(v11, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v12 | 0x100000000, &v34, v33, v35, v31);
    objc_msgSend(v11, "minPlayableSizeForSpriteAtIndex:", v12);
    a4->width = v21;
    a4->height = v22;
    PXRectWithCenterAndSize();
    v6 = v23;
    v7 = v24;
    v8 = v25;
    v9 = v26;
  }

  v27 = v6;
  v28 = v7;
  v29 = v8;
  v30 = v9;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)canPlay:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[PXPhotosContentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXPhotosContentController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "photosContentController:canPlayAssetInline:", self, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXPhotosContentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "photosContentController:isDisplayAssetEligibleForAutoPlayback:", self, v4);

  return (char)self;
}

- (BOOL)isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXPhotosContentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "photosContentController:isDisplayAssetEligibleForPlaybackWithSettlingEffect:", self, v4);

  return (char)self;
}

- (unint64_t)filterSortedRecordsStrategy
{
  void *v3;
  char v4;
  void *v5;
  unint64_t v6;

  -[PXPhotosContentController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[PXPhotosContentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "photosContentControllerFilterSortedRecordsStrategy:", self);

  return v6;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosContentController gridView](self, "gridView", a3);
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
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((a4 & 2) != 0)
  {
    v15 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v15);
    if (v15)
      -[PXPhotosContentController _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);
  }
  if ((a4 & 4) != 0)
  {
    v14 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v14);
    v11 = v14;
    v12 = v11;
    if (v11 && objc_msgSend(v11, "axContentKind") == 6)
      -[PXPhotosContentController _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);

  }
  -[PXPhotosContentController axNextResponder](self, "axNextResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "axGroup:didChange:userInfo:", v8, a4, v10);

}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = 0;
  v4 = a3;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, &v25, 0);
  v23 = 0u;
  v24 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v23);

  -[PXPhotosContentController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v23;
  if ((_QWORD)v23 != *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v5, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "identifier");

    if (v9 != v7)
    {
      objc_msgSend(v6, "dataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changeHistory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v7, objc_msgSend(v12, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v23;
      v22 = v24;
      objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v13, &v21, 0, 0);

    }
  }
  objc_msgSend(v6, "selectionSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedIndexPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;
  v22 = v24;
  v16 = objc_msgSend(v15, "containsIndexPath:", &v21);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v6, "selectionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__PXPhotosContentController__handleChangeToModifySelectionWithUserInfo___block_invoke;
    v18[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v19 = v23;
    v20 = v24;
    objc_msgSend(v17, "performChanges:", v18);

  }
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXPhotosContentController axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

- (id)presentingViewControllerForFooterStatusController:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosContentController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForContentController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)footerPresentation:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PXPhotosContentController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosContentController:presentViewController:", self, v5);

}

- (void)dismissPresentedViewControllerForFooterPresentation:(id)a3
{
  id v4;

  -[PXPhotosContentController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissPresentedViewControllerForContentController:", self);

}

- (UIEdgeInsets)maskPaddingForFooterPresentation:(id)a3
{
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
  UIEdgeInsets result;

  -[PXPhotosContentController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maskPaddingForContentController:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  id v4;

  -[PXPhotosContentController _invalidateHasScrollableContent](self, "_invalidateHasScrollableContent", a3);
  -[PXPhotosContentController inlinePlaybackController](self, "inlinePlaybackController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleRectDidChange");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_65805 == a5)
  {
    if ((a4 & 2) != 0)
    {
      v14 = v9;
      -[PXPhotosContentController _updateIsInCompactMode](self, "_updateIsInCompactMode");
      goto LABEL_10;
    }
  }
  else if ((void *)PXPhotosViewModelObservationContext == a5)
  {
    if ((a4 & 0x100000000000) != 0)
    {
      v14 = v9;
      -[PXPhotosContentController _updateSectionHeaderAndBodyProvider](self, "_updateSectionHeaderAndBodyProvider");
      goto LABEL_10;
    }
  }
  else
  {
    if ((void *)PXPhotosViewOptionsModelObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1324, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 4) != 0)
    {
      v14 = v9;
      -[PXPhotosContentController viewOptionsModel](self, "viewOptionsModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectedLensControlItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosContentController overlayController](self, "overlayController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCurrentLens:", v11);

LABEL_10:
      v9 = v14;
    }
  }

}

- (void)_handleCurrentLensChangedFromOverlayController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[PXPhotosContentController viewOptionsModel](self, "viewOptionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PXPhotosContentController__handleCurrentLensChangedFromOverlayController___block_invoke;
  v8[3] = &unk_1E511F830;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performChanges:", v8);

}

- (void)photosOverlayController:(id)a3 didChangeCurrentLens:(id)a4
{
  -[PXPhotosContentController _handleCurrentLensChangedFromOverlayController:](self, "_handleCurrentLensChangedFromOverlayController:", a4);
}

- (void)photosOverlayController:(id)a3 didNavigateToAssetReference:(id)a4
{
  -[PXPhotosContentController scrollToRevealAssetReference:completionHandler:](self, "scrollToRevealAssetReference:completionHandler:", a4, &__block_literal_global_211);
}

- (id)dominantAssetReferenceForPhotosOverlayController:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  -[PXPhotosContentController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__65791;
  v22 = __Block_byref_object_dispose__65792;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PXPhotosContentController_dominantAssetReferenceForPhotosOverlayController___block_invoke;
  v15[3] = &unk_1E51291B0;
  v17 = &v18;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v15);
  v8 = (id)v19[5];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1361, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1361, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)visibleAssetsIterator
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosContentController layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRect");
  objc_msgSend(v2, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  objc_msgSend(v2, "assetsIteratorForContentInRect:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _Block_copy(v3);

  return v4;
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  PXPhotosContentController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollectionHandler"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[PXPhotosContentController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visibleRect");
  objc_msgSend(v11, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  objc_msgSend(v11, "assetCollectionsIteratorForContentInRect:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    _AppIntentsQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke;
    block[3] = &unk_1E5122600;
    v18 = v10;
    v19 = v12;
    v20 = v7;
    v21 = v8;
    dispatch_async(v13, block);

  }
  else
  {
    PLAppIntentsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = objc_opt_class();
      v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "No asset collections iterator for <%{public}@: %p>", buf, 0x16u);
    }

    v8[2](v8);
  }

}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  PXPhotosContentController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetHandler"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[PXPhotosContentController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosContentController visibleAssetsIterator](self, "visibleAssetsIterator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    _AppIntentsQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke;
    block[3] = &unk_1E5122600;
    v17 = v10;
    v18 = v11;
    v19 = v7;
    v20 = v8;
    dispatch_async(v12, block);

  }
  else
  {
    PLAppIntentsGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v22 = objc_opt_class();
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "No assets iterator for <%{public}@: %p>", buf, 0x16u);
    }

    v8[2](v8);
  }

}

- (void)appIntentsEnumeratePersons:(id)a3 completionHandler:(id)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, id, uint64_t);

  v14 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1477, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personHandler"));

    if (v7)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosContentController.m"), 1478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  -[PXPhotosContentController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;

    if (v11)
      v14[2](v14, v11, 1);
  }
  else
  {

    v11 = 0;
  }
  v7[2](v7);

}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->_axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_axNextResponder, a3);
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXPhotosViewEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXPhotosLayout)layout
{
  return self->_layout;
}

- (PXAssetsDataSourceCountsController)countsController
{
  return self->_countsController;
}

- (PXPhotosViewInteraction)interaction
{
  return self->_interaction;
}

- (PXPhotosContentControllerDelegate)delegate
{
  return (PXPhotosContentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)dataSourceManagerPauseToken
{
  return self->_dataSourceManagerPauseToken;
}

- (void)setDataSourceManagerPauseToken:(id)a3
{
  objc_storeStrong(&self->_dataSourceManagerPauseToken, a3);
}

- (PXGLayout)rootLayout
{
  return self->_rootLayout;
}

- (BOOL)needsCountsInitially
{
  return self->_needsCountsInitially;
}

- (BOOL)needsFooterStatusController
{
  return self->_needsFooterStatusController;
}

- (PXPhotosCustomSectionBodyLayoutProvider)customSectionBodyLayoutProvider
{
  return self->_customSectionBodyLayoutProvider;
}

- (PXPhotosSectionHeaderLayoutProvider)customSectionHeaderLayoutProvider
{
  return self->_customSectionHeaderLayoutProvider;
}

- (PXPhotosGlobalHeaderLayoutProvider)customGlobalHeaderLayoutProvider
{
  return self->_customGlobalHeaderLayoutProvider;
}

- (int64_t)customSectionHeaderStyle
{
  return self->_customSectionHeaderStyle;
}

- (int64_t)customSectionBodyStyle
{
  return self->_customSectionBodyStyle;
}

- (PXPhotosBannerProvider)customBannerProvider
{
  return self->_customBannerProvider;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (PXPhotosBarsController)barsController
{
  return self->_barsController;
}

- (PXPhotosContentInlinePlaybackController)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (BOOL)shouldEnablePlaybackDuringAnimatedScroll
{
  return self->_shouldEnablePlaybackDuringAnimatedScroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_customBannerProvider, 0);
  objc_storeStrong((id *)&self->_customGlobalHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_customSectionHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_customSectionBodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);
  objc_storeStrong(&self->_dataSourceManagerPauseToken, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_storeStrong((id *)&self->_footerPresentation, 0);
  objc_storeStrong((id *)&self->_footerStatusController, 0);
}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchSelectedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5122628;
  v11 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_3;
  v8[3] = &unk_1E51225D8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;

    if (v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v4);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {

    v3 = 0;
  }

}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {

    v3 = 0;
  }

}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchSelectedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  v10[3] = &unk_1E51225B0;
  v11 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v8[3] = &unk_1E51225D8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;

    if (v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v4);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {

    v3 = 0;
  }

}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {

    v3 = 0;
  }

}

void __78__PXPhotosContentController_dominantAssetReferenceForPhotosOverlayController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

void __81__PXPhotosContentController_photosOverlayController_didNavigateToAssetReference___block_invoke(uint64_t a1, unsigned int a2)
{
  NSLog(CFSTR("navigated successfully %d"), a2);
}

void __76__PXPhotosContentController__handleCurrentLensChangedFromOverlayController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = a2;
    objc_msgSend(v6, "setSelectedLensControlItem:", v2);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = a2;
    objc_msgSend(v3, "lensControlItems");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectedLensControlItem:", v5);

  }
}

uint64_t __72__PXPhotosContentController__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __64__PXPhotosContentController__updateSectionHeaderAndBodyProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnterSelectModeAllowed:forReason:", *(unsigned __int8 *)(a1 + 32), CFSTR("PhotosBodyStyleShouldPreventSelection"));
}

void __51__PXPhotosContentController__updateIsInCompactMode__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsInCompactMode:", objc_msgSend(v4, "layoutSizeClass") == 1);

}

void __52__PXPhotosContentController__updateViewOptionsModel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "overlayController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableLenses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdditionalLensControlItems:", v4);

}

uint64_t __56__PXPhotosContentController__updateHasScrollableContent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasScrollableContent:", *(unsigned __int8 *)(a1 + 32));
}

void __67__PXPhotosContentController_assetReferenceForCurrentScrollPosition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }

}

uint64_t __68__PXPhotosContentController_stopForceIncludingAllAssetsInDataSource__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopForceIncludingAllAssets");
}

uint64_t __60__PXPhotosContentController_resumeDataSourceChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "dataSourceManagerPauseToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeChangeDeliveryAndBackgroundLoading:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setDataSourceManagerPauseToken:", 0);
}

void __76__PXPhotosContentController_suspendDataSourceChangesWithTimeout_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDataSourceManagerPauseToken:", v3);

}

double __55__PXPhotosContentController_isScrolledAtOrAboveDetent___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "axis");
  PXPointValueForAxis();
  v3 = v2;

  return v3;
}

uint64_t __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v5;
  else
    v2 = 0;

  if ((objc_msgSend(v2, "isLazy") & 1) != 0)
  {

LABEL_8:
    objc_msgSend(v5, "setNeedsUpdate");
    v4 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v4 = v5;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_8;
LABEL_9:

}

uint64_t __60__PXPhotosContentController_scrollToEdge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureStartingSectionHasContent");
}

uint64_t __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

void __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v9[32];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PXAssertGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)v9 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&v9[16] = v3;
    PXSimpleIndexPathDescription();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)v9 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&v9[16] = v5;
    PXSimpleIndexPathDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "layout", *(_OWORD *)v9, *(_OWORD *)&v9[16]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v9 = 138413058;
    *(_QWORD *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2112;
    *(_QWORD *)&v9[14] = v6;
    *(_WORD *)&v9[22] = 2112;
    *(_QWORD *)&v9[24] = v7;
    v10 = 2112;
    v11 = v8;
    _os_log_fault_impl(&dword_1A6789000, v2, OS_LOG_TYPE_FAULT, "infinite cycle detected when gathering indexes between %@ and %@ in %@ (%@)", v9, 0x2Au);

  }
}

void __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "itemsInRect:inLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(*(id *)(a1 + 48), "identifier");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_2;
  v9[3] = &unk_1E5128958;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v7, a3, v9);

}

void __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _OWORD v5[2];

  objc_msgSend(a2, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v3, "indexPath");
    else
      memset(v5, 0, sizeof(v5));
    objc_msgSend(v4, "addIndexPath:", v5);
  }

}

uint64_t __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

void __75__PXPhotosContentController_enumerateAssetHitTestResultsInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  if (v3 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
  {

  }
  else
  {
    v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

    v6 = v7;
    if (!v5)
      goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = v7;
LABEL_6:

}

void __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke(int64x2_t *a1, void *a2, _BYTE *a3)
{
  void *v5;
  int64x2_t v6;
  void *v7;
  int64x2_t v8;
  uint64_t v9;

  objc_msgSend(a2, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0uLL;
    v7 = (void *)a1[2].i64[0];
    if (v7)
    {
      objc_msgSend(v7, "indexPathForAssetReference:", v5);
      v6 = 0u;
      v8 = 0u;
    }
    else
    {
      v8 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(a1[3], v6), (int32x4_t)vceqq_s64(a1[4], v8))), 0xFuLL))) & 1) == 0)
    {
      v9 = *(_QWORD *)(a1[2].i64[1] + 8);
      *(_OWORD *)(v9 + 32) = 0u;
      *(_OWORD *)(v9 + 48) = 0u;
      *a3 = 1;
    }
  }

}

void __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2(int64x2_t *a1, void *a2, _BYTE *a3)
{
  void *v5;
  int64x2_t v6;
  void *v7;
  int64x2_t v8;
  uint64_t v9;

  objc_msgSend(a2, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0uLL;
    v7 = (void *)a1[2].i64[0];
    if (v7)
    {
      objc_msgSend(v7, "indexPathForAssetCollectionReference:", v5);
      v6 = 0u;
      v8 = 0u;
    }
    else
    {
      v8 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(a1[3], v6), (int32x4_t)vceqq_s64(a1[4], v8))), 0xFuLL))) & 1) == 0)
    {
      v9 = *(_QWORD *)(a1[2].i64[1] + 8);
      *(_OWORD *)(v9 + 32) = 0u;
      *(_OWORD *)(v9 + 48) = 0u;
      *a3 = 1;
    }
  }

}

void __100__PXPhotosContentController_enumerateAssetHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  if (v3 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
  {

  }
  else
  {
    v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

    v6 = v7;
    if (!v5)
      goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = v7;
LABEL_6:

}

uint64_t __50__PXPhotosContentController_contentViewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markContentAsViewed");
}

uint64_t __51__PXPhotosContentController_contentViewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_65841);
}

uint64_t __51__PXPhotosContentController_contentViewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startBackgroundFetchIfNeeded");
}

@end
