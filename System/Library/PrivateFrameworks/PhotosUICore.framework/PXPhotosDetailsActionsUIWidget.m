@implementation PXPhotosDetailsActionsUIWidget

- (PXPhotosDetailsActionsUIWidget)init
{
  PXPhotosDetailsActionsUIWidget *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsActionsUIWidget;
  result = -[PXPhotosDetailsActionsUIWidget init](&v3, sel_init);
  if (result)
  {
    result->_needsUpdateFlags.allowedActionTypes = 1;
    result->_allowCreateMemoryAction = 1;
  }
  return result;
}

- (void)setSpec:(id)a3
{
  PXWidgetSpec *v5;
  _QWORD v6[5];

  v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__PXPhotosDetailsActionsUIWidget_setSpec___block_invoke;
    v6[3] = &unk_1E5149198;
    v6[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v6);
  }

}

- (void)setAllowRevealInMomentAction:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_allowRevealInMomentAction != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_allowRevealInMomentAction = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __63__PXPhotosDetailsActionsUIWidget_setAllowRevealInMomentAction___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v4);
  }
}

- (void)setAllowCreateMemoryAction:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_allowCreateMemoryAction != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_allowCreateMemoryAction = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __61__PXPhotosDetailsActionsUIWidget_setAllowCreateMemoryAction___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v4);
  }
}

- (void)setAllowInternalFileRadarAction:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_allowInternalFileRadarAction != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_allowInternalFileRadarAction = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __66__PXPhotosDetailsActionsUIWidget_setAllowInternalFileRadarAction___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v4);
  }
}

- (id)_extendedTraitCollection
{
  void *v3;
  void *v4;

  -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtendedTraitCollection:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_loadTilingController
{
  NSMutableSet *v3;
  NSMutableSet *tilesInUse;
  void *v5;
  PXUIScrollViewController *v6;
  PXUIScrollViewController *scrollViewController;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosDetailsActionsSpecManager *v11;
  PXPhotosDetailsActionsSpecManager *specManager;
  void *v13;
  PXActionRowTile *v14;
  PXActionRowTile *measuringActionRowTile;
  uint64_t v16;
  void *v17;
  PXTilingController *v18;
  PXTilingController *tilingController;
  PXBasicUIViewTileAnimator *v20;
  PXTileAnimator *tileAnimator;
  PXReusableObjectPool *v22;
  PXReusableObjectPool *tileReusePool;
  PXReusableObjectPool *v24;
  PXReusableObjectPool *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[5];

  if (!self->__tilingController)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v3;

    -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetScrollViewControllerHostingWidget:", self);
    v6 = (PXUIScrollViewController *)objc_claimAutoreleasedReturnValue();
    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = v6;

    -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widgetViewControllerHostingWidget:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_extendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[PXFeatureSpecManager initWithExtendedTraitCollection:]([PXPhotosDetailsActionsSpecManager alloc], "initWithExtendedTraitCollection:", v10);
    specManager = self->__specManager;
    self->__specManager = v11;

    -[PXPhotosDetailsActionsSpecManager registerChangeObserver:context:](self->__specManager, "registerChangeObserver:context:", self, PXSpecManagerObservationContext_167104);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleContentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    v14 = objc_alloc_init(PXActionRowTile);
    measuringActionRowTile = self->__measuringActionRowTile;
    self->__measuringActionRowTile = v14;

    v16 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke;
    v31[3] = &unk_1E5149198;
    v31[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v31);
    -[PXPhotosDetailsActionsUIWidget _createNewLayout](self, "_createNewLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v17);
    tilingController = self->__tilingController;
    self->__tilingController = v18;

    -[PXTilingController setScrollController:](self->__tilingController, "setScrollController:", self->__scrollViewController);
    v20 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = (PXTileAnimator *)v20;

    -[PXTilingController setTileAnimator:](self->__tilingController, "setTileAnimator:", self->__tileAnimator);
    -[PXTilingController setTileSource:](self->__tilingController, "setTileSource:", self);
    -[PXTilingController setTransitionDelegate:](self->__tilingController, "setTransitionDelegate:", self);
    v22 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E50B46A0);
    tileReusePool = self->__tileReusePool;
    self->__tileReusePool = v22;

    -[PXReusableObjectPool setDelegate:](self->__tileReusePool, "setDelegate:", self);
    objc_initWeak(&location, self);
    v24 = self->__tileReusePool;
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_2;
    v28[3] = &unk_1E513C6D0;
    objc_copyWeak(&v29, &location);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](v24, "registerReusableObjectForReuseIdentifier:creationHandler:", 403133, v28);
    v25 = self->__tileReusePool;
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_3;
    v26[3] = &unk_1E513C6D0;
    objc_copyWeak(&v27, &location);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](v25, "registerReusableObjectForReuseIdentifier:creationHandler:", 403153, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

- (void)_handleContentSizeCategoryDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PXPhotosDetailsActionsUIWidget__handleContentSizeCategoryDidChange___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v3);
}

- (id)_createNewLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PXPhotosDetailsActionsTilingLayout *v7;
  void *v8;
  uint64_t v9;
  double v10;

  -[PXPhotosDetailsActionsUIWidget _performableActionTypes](self, "_performableActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PXPhotosDetailsActionsUIWidget _specManager](self, "_specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXPhotosDetailsActionsTilingLayout initWithNumberOfItems:]([PXPhotosDetailsActionsTilingLayout alloc], "initWithNumberOfItems:", v4);
  -[PXPhotosDetailsActionsUIWidget _rowHeight](self, "_rowHeight");
  -[PXPhotosDetailsActionsTilingLayout setRowHeight:](v7, "setRowHeight:");
  -[PXPhotosDetailsActionsUIWidget _extendedTraitCollection](self, "_extendedTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = 1.0;
  if (v9 == 3)
    v10 = 15.0;
  -[PXPhotosDetailsActionsTilingLayout setSeparatorHeight:](v7, "setSeparatorHeight:", v10);
  -[PXPhotosDetailsActionsTilingLayout setShouldShowSeparators:](v7, "setShouldShowSeparators:", objc_msgSend(v6, "shouldShowSeparators"));
  -[PXPhotosDetailsActionsTilingLayout setShouldInsetAllSeparators:](v7, "setShouldInsetAllSeparators:", objc_msgSend(v6, "shouldInsetAllSeparators"));

  return v7;
}

- (void)_setAllowedActionTypes:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *allowedActionTypes;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->__allowedActionTypes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      allowedActionTypes = self->__allowedActionTypes;
      self->__allowedActionTypes = v6;

      -[PXPhotosDetailsActionsUIWidget _invalidatePerformableActionTypes](self, "_invalidatePerformableActionTypes");
    }
  }

}

- (void)_setPerformableActionTypes:(id)a3
{
  NSArray *v5;
  char v6;
  NSArray *v7;

  v7 = (NSArray *)a3;
  v5 = self->__performableActionTypes;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSArray isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__performableActionTypes, a3);
      -[PXPhotosDetailsActionsUIWidget _invalidateLayout](self, "_invalidateLayout");
    }
  }

}

- (void)setContext:(id)a3
{
  PXPhotosDetailsContext *v5;
  PXPhotosDetailsContext *context;
  _QWORD v7[5];
  PXPhotosDetailsContext *v8;

  v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    -[PXPhotosDetailsContext unregisterChangeObserver:context:](context, "unregisterChangeObserver:context:", self, PXPhotosDetailsContextObservationContext_167105);
    objc_storeStrong((id *)&self->_context, a3);
    -[PXPhotosDetailsContext registerChangeObserver:context:](self->_context, "registerChangeObserver:context:", self, PXPhotosDetailsContextObservationContext_167105);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXPhotosDetailsActionsUIWidget_setContext___block_invoke;
    v7[3] = &unk_1E5148D08;
    v7[4] = self;
    v8 = v5;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v7);

  }
}

- (void)_setViewModel:(id)a3
{
  PXPhotosDetailsViewModel *v5;
  PXPhotosDetailsViewModel *viewModel;
  PXPhotosDetailsViewModel *v7;

  v5 = (PXPhotosDetailsViewModel *)a3;
  viewModel = self->__viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXPhotosDetailsViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, PXPhotosDetailsViewModelObservationContext);
    objc_storeStrong((id *)&self->__viewModel, a3);
    -[PXPhotosDetailsViewModel registerChangeObserver:context:](self->__viewModel, "registerChangeObserver:context:", self, PXPhotosDetailsViewModelObservationContext);
    -[PXPhotosDetailsActionsUIWidget _invalidateLayout](self, "_invalidateLayout");
    v5 = v7;
  }

}

- (void)_setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v7;

  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->__photosDataSource;
  v7 = v5;
  if (photosDataSource != v5)
  {
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](v7, "registerChangeObserver:", self);
    -[PXPhotosDetailsActionsUIWidget _invalidateActionManager](self, "_invalidateActionManager");
    -[PXPhotosDetailsActionsUIWidget _invalidatePerformableActionTypes](self, "_invalidatePerformableActionTypes");
  }

}

- (void)_setPeopleFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;

  v5 = (PHFetchResult *)a3;
  if (self->__peopleFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__peopleFetchResult, a3);
    -[PXPhotosDetailsActionsUIWidget _invalidateActionManager](self, "_invalidateActionManager");
    -[PXPhotosDetailsActionsUIWidget _invalidatePerformableActionTypes](self, "_invalidatePerformableActionTypes");
    v5 = v6;
  }

}

- (BOOL)hasContentForCurrentInput
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[PXPhotosDetailsActionsUIWidget _performableActionTypes](self, "_performableActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PXPhotosDetailsActionsUIWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXPhotosDetailsActionsUIWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "widgetDeviceIsUnlocked:", self);

  }
  else
  {
    v7 = 1;
  }

  if (v4)
    return v7;
  else
    return 0;
}

- (PXTilingController)contentTilingController
{
  -[PXPhotosDetailsActionsUIWidget _loadTilingController](self, "_loadTilingController");
  return -[PXPhotosDetailsActionsUIWidget _tilingController](self, "_tilingController");
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)CFSTR("PXPhotosDetailsActionsUIWidget");
}

- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsActionsUIWidget _scrollViewController](self, "_scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4
{
  id v4;

  objc_msgSend(a4, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)configureActionButtonTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  PXWidgetSpec *spec;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  spec = self->_spec;
  v7 = a3;
  objc_msgSend(v7, "setIdiom:", -[PXFeatureSpec userInterfaceIdiom](spec, "userInterfaceIdiom"));
  v8 = a4->index[2];
  -[PXPhotosDetailsActionsUIWidget _performableActionTypes](self, "_performableActionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsActionsUIWidget _assetCollectionActionManager](self, "_assetCollectionActionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedTitleForActionType:useCase:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  -[PXPhotosDetailsActionsUIWidget _viewModel](self, "_viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "disabledActionTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v13, "containsObject:", v15) ^ 1);

  objc_msgSend(v10, "menuElementsForActionType:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsMenu:", objc_msgSend(v14, "count") != 0);

}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;

  v7 = a4;
  v8 = a3->index[0];
  if (v8 == 6200435)
  {
    -[PXPhotosDetailsActionsUIWidget _tileReusePool](self, "_tileReusePool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "checkOutReusableObjectWithReuseIdentifier:", 403153);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v8 != 6200434)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_OWORD *)&a3->index[5];
      v22 = *(_OWORD *)&a3->index[3];
      v23 = v17;
      v24 = *(_OWORD *)&a3->index[7];
      v25 = a3->index[9];
      v18 = *(_OWORD *)&a3->index[1];
      v20 = *(_OWORD *)&a3->length;
      v21 = v18;
      PXTileIdentifierDescription((unint64_t *)&v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsActionsUIWidget.m"), 357, CFSTR("%@ got asked to produce a tile for an unknown identifier:%@. If you're adding custom tile kinds, those have to be returned by your own tile source and not bubble up to the assets scene."), self, v19);

      abort();
    }
    -[PXPhotosDetailsActionsUIWidget _tileReusePool](self, "_tileReusePool");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "checkOutReusableObjectWithReuseIdentifier:", 403133);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_OWORD *)&a3->index[5];
    v22 = *(_OWORD *)&a3->index[3];
    v23 = v11;
    v24 = *(_OWORD *)&a3->index[7];
    v25 = a3->index[9];
    v12 = *(_OWORD *)&a3->index[1];
    v20 = *(_OWORD *)&a3->length;
    v21 = v12;
    -[PXPhotosDetailsActionsUIWidget configureActionButtonTile:withIdentifier:](self, "configureActionButtonTile:withIdentifier:", v10, &v20);
  }
  -[PXPhotosDetailsActionsUIWidget _tilesInUse](self, "_tilesInUse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v10);

  return v10;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PXPhotosDetailsActionsUIWidget _tileReusePool](self, "_tileReusePool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInReusableObject:", v5);

  -[PXPhotosDetailsActionsUIWidget _tilesInUse](self, "_tilesInUse");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  PXTileIdentifierIdentityConverter *v7;

  v4 = a4;
  objc_msgSend(v4, "fromLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  else
    v7 = 0;
  return v7;
}

- (void)actionRowTileSelected:(id)a3 tapPositionInTile:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[PXPhotosDetailsActionsUIWidget _activePerformer](self, "_activePerformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    -[PXPhotosDetailsActionsUIWidget _tilingController](self, "_tilingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "tileIdentifierForTile:", v7);
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

    if ((unint64_t)(v25 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (_QWORD)v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = *((_QWORD *)&v26 + 1);
      -[PXPhotosDetailsActionsUIWidget _performableActionTypes](self, "_performableActionTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = v15;
      v18 = v17;

      -[PXPhotosDetailsActionsUIWidget setLastNormalizedTapPosition:](self, "setLastNormalizedTapPosition:", x / v16, y / v18);
      -[PXPhotosDetailsActionsUIWidget _assetCollectionActionManager](self, "_assetCollectionActionManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actionPerformerForActionType:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setDelegate:", self);
      -[PXPhotosDetailsActionsUIWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke;
      v23[3] = &unk_1E5149198;
      v24 = v20;
      v22 = v20;
      objc_msgSend(v21, "widget:performAfterUnlockingDeviceIfNecessary:failurehandler:", self, v23, 0);

    }
  }

}

- (id)menuElementsForActionRowTile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotosDetailsActionsUIWidget _tilingController](self, "_tilingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "tileIdentifierForTile:", v4);

  return 0;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  if (a4 == 10)
  {
    -[PXPhotosDetailsActionsUIWidget _setActivePerformer:](self, "_setActivePerformer:", v6);
  }
  else
  {
    -[PXPhotosDetailsActionsUIWidget _activePerformer](self, "_activePerformer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
      -[PXPhotosDetailsActionsUIWidget _setActivePerformer:](self, "_setActivePerformer:", 0);
    if (a4 == 20)
    {
      objc_msgSend(v6, "actionType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeCreateMemory"));

      if (v9)
      {
        +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "addToTabSimulate");

        if ((v11 & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1E0C99E20];
          -[PXPhotosDetailsActionsUIWidget _viewModel](self, "_viewModel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "disabledActionTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setWithSet:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", CFSTR("PXAssetCollectionActionTypeCreateMemory"));
          -[PXPhotosDetailsActionsUIWidget _viewModel](self, "_viewModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __65__PXPhotosDetailsActionsUIWidget_actionPerformer_didChangeState___block_invoke;
          v27[3] = &unk_1E5130EF0;
          v28 = v15;
          v17 = v15;
          objc_msgSend(v16, "performChanges:", v27);

        }
      }
      objc_msgSend(v6, "actionType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemory"));

      if (v19)
      {
        -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "widget:requestViewControllerDismissalAnimated:", self, 1);

      }
      objc_msgSend(v6, "actionType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeDeleteMemory"));

      if (v22)
      {
        -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "widget:requestViewControllerDismissalAnimated:", self, 1);

      }
    }
  }
  -[PXPhotosDetailsActionsUIWidget actionPerformerDelegate](self, "actionPerformerDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[PXPhotosDetailsActionsUIWidget actionPerformerDelegate](self, "actionPerformerDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionPerformer:didChangeState:", v6, a4);

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "widget:transitionToViewController:withTransitionType:", self, v5, 2);

  return (char)self;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDetailsActionsUIWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetUndoManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
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
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotosDetailsActionsUIWidget _activePerformer](self, "_activePerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__167108;
  v37 = __Block_byref_object_dispose__167109;
  v38 = 0;
  -[PXPhotosDetailsActionsUIWidget _tilingController](self, "_tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__PXPhotosDetailsActionsUIWidget_prepareForPopoverPresentation___block_invoke;
  v30[3] = &unk_1E5130F18;
  v30[4] = self;
  v16 = v5;
  v31 = v16;
  v32 = &v33;
  objc_msgSend(v6, "enumerateTilesInRect:withOptions:usingBlock:", 0, v30, v9, v11, v13, v15);
  v17 = (void *)v34[5];
  if (v17)
  {
    objc_msgSend(v17, "bounds");
    v19 = v18;
    -[PXPhotosDetailsActionsUIWidget lastNormalizedTapPosition](self, "lastNormalizedTapPosition");
    v21 = v20;
    objc_msgSend((id)v34[5], "bounds");
    v23 = v22;
    objc_msgSend((id)v34[5], "bounds");
    v25 = v24;
    objc_msgSend((id)v34[5], "bounds");
    v27 = v26;
    objc_msgSend(v4, "setSourceView:", v34[5]);
    objc_msgSend(v4, "setSourceRect:", v19 * v21 + v25 * -0.5, v23 + v27 * -0.75, v25, v27);
    objc_msgSend(v4, "setPermittedArrowDirections:", 2);
  }
  else
  {
    PLUIGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "actionType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v29;
      _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "Failed to prepare popover presentation over a tile row for action type (%@)", buf, 0xCu);

    }
  }

  _Block_object_dispose(&v33, 8);
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a4, "sectionedDataSourceChangeDetails", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasAnyChanges"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__PXPhotosDetailsActionsUIWidget_photosDataSource_didChange___block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v7);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSpecManagerObservationContext_167104 == a5)
  {
    if ((v6 & 1) != 0)
    {
      v16 = MEMORY[0x1E0C809B0];
      v10 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke;
      v11 = &v16;
      goto LABEL_12;
    }
  }
  else if ((void *)PXPhotosDetailsContextObservationContext_167105 == a5)
  {
    if ((v6 & 0x30) != 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_2;
      v15[3] = &unk_1E5149198;
      v15[4] = self;
      -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v15);
    }
    if ((v6 & 8) != 0)
    {
      v14 = MEMORY[0x1E0C809B0];
      v10 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_3;
      v11 = &v14;
      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)PXPhotosDetailsViewModelObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsActionsUIWidget.m"), 550, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 0x20) != 0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v10 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_4;
      v11 = &v13;
LABEL_12:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E5149198;
      v11[4] = (uint64_t)self;
      -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v13);
    }
  }

}

- (void)_performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingChanges;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PXPhotosDetailsActionsUIWidget _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.peopleFetchResult
      || self->_needsUpdateFlags.actionManager
      || self->_needsUpdateFlags.allowedActionTypes
      || self->_needsUpdateFlags.performableActionTypes
      || self->_needsUpdateFlags.rowHeight
      || self->_needsUpdateFlags.layout;
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXPhotosDetailsActionsUIWidget _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXPhotosDetailsActionsUIWidget _updatePeopleFetchResultIfNeeded](self, "_updatePeopleFetchResultIfNeeded");
    -[PXPhotosDetailsActionsUIWidget _updateActionManagerIfNeeded](self, "_updateActionManagerIfNeeded");
    -[PXPhotosDetailsActionsUIWidget _updateAllowedActionTypesIfNeeded](self, "_updateAllowedActionTypesIfNeeded");
    -[PXPhotosDetailsActionsUIWidget _updatePerformableActionTypesIfNeeded](self, "_updatePerformableActionTypesIfNeeded");
    -[PXPhotosDetailsActionsUIWidget _updateRowHeightIfNeeded](self, "_updateRowHeightIfNeeded");
    -[PXPhotosDetailsActionsUIWidget _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXPhotosDetailsActionsUIWidget _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsActionsUIWidget.m"), 597, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsActionsUIWidget.m"), 601, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidatePeopleFetchResult
{
  self->_needsUpdateFlags.peopleFetchResult = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePeopleFetchResultIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.peopleFetchResult)
  {
    self->_needsUpdateFlags.peopleFetchResult = 0;
    -[PXPhotosDetailsActionsUIWidget context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "people");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsActionsUIWidget _setPeopleFetchResult:](self, "_setPeopleFetchResult:", v4);
  }
}

- (void)_invalidateAllowedActionTypes
{
  self->_needsUpdateFlags.allowedActionTypes = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateAllowedActionTypesIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.allowedActionTypes)
  {
    self->_needsUpdateFlags.allowedActionTypes = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PXPhotosDetailsActionsUIWidget allowRevealInMomentAction](self, "allowRevealInMomentAction"))
      objc_msgSend(v3, "addObject:", CFSTR("PXAssetCollectionActionTypeRevealInMoment"));
    -[PXPhotosDetailsActionsUIWidget _setAllowedActionTypes:](self, "_setAllowedActionTypes:", v3);

  }
}

- (void)_invalidatePerformableActionTypes
{
  self->_needsUpdateFlags.performableActionTypes = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePerformableActionTypesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.performableActionTypes)
  {
    self->_needsUpdateFlags.performableActionTypes = 0;
    -[PXPhotosDetailsActionsUIWidget _assetCollectionActionManager](self, "_assetCollectionActionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PXPhotosDetailsActionsUIWidget _allowedActionTypes](self, "_allowedActionTypes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v3, "canPerformActionType:", v10))
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count")
      || -[PXPhotosDetailsActionsUIWidget allowInternalFileRadarAction](self, "allowInternalFileRadarAction"))
    {
      if (objc_msgSend(v3, "canPerformActionType:", CFSTR("PXAssetCollectionActionTypeFileRadar")))
        objc_msgSend(v4, "addObject:", CFSTR("PXAssetCollectionActionTypeFileRadar"));
    }
    -[PXPhotosDetailsActionsUIWidget _setPerformableActionTypes:](self, "_setPerformableActionTypes:", v4);

  }
}

- (void)_invalidateActionManager
{
  self->_needsUpdateFlags.actionManager = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateActionManagerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  PXPhotoKitAssetCollectionActionManager *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_needsUpdateFlags.actionManager)
  {
    self->_needsUpdateFlags.actionManager = 0;
    -[PXPhotosDetailsActionsUIWidget _photosDataSource](self, "_photosDataSource");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstAssetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PXPhotosDetailsActionsUIWidget context](self, "context");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayTitleInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v3, v5);
      -[PXPhotosDetailsActionsUIWidget _peopleFetchResult](self, "_peopleFetchResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetCollectionActionManager setPeople:](v6, "setPeople:", v7);

      -[PXPhotosDetailsActionsUIWidget context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containingAlbum");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetCollectionActionManager setContainingAlbum:](v6, "setContainingAlbum:", v9);

      objc_msgSend(v11, "assetsInSection:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetCollectionActionManager setAssetsFetchResult:](v6, "setAssetsFetchResult:", v10);

    }
    else
    {
      v6 = 0;
    }
    -[PXPhotosDetailsActionsUIWidget _setAssetCollectionActionManager:](self, "_setAssetCollectionActionManager:", v6);

  }
}

- (void)_invalidateRowHeight
{
  self->_needsUpdateFlags.rowHeight = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateRowHeightIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  id v9;

  if (self->_needsUpdateFlags.rowHeight)
  {
    self->_needsUpdateFlags.rowHeight = 0;
    -[PXPhotosDetailsActionsUIWidget _measuringActionRowTile](self, "_measuringActionRowTile");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareForReuse");
    objc_msgSend(v9, "setTitle:", CFSTR("Title"));
    objc_msgSend(v9, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = v4;

    v6 = round(v5);
    v7 = -[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom");
    v8 = 42.0;
    if (v7 == 3)
      v8 = 70.0;
    if (v6 >= v8)
      v8 = v6;
    -[PXPhotosDetailsActionsUIWidget _setRowHeight:](self, "_setRowHeight:", v8);

  }
}

- (void)_setRowHeight:(double)a3
{
  if (self->__rowHeight != a3)
  {
    self->__rowHeight = a3;
    -[PXPhotosDetailsActionsUIWidget _invalidateLayoutEnsureTransition](self, "_invalidateLayoutEnsureTransition");
  }
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  -[PXPhotosDetailsActionsUIWidget _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayoutEnsureTransition
{
  self->_ensureTransition = 1;
  -[PXPhotosDetailsActionsUIWidget _invalidateLayout](self, "_invalidateLayout");
}

- (void)_updateLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    -[PXPhotosDetailsActionsUIWidget _tilingController](self, "_tilingController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_ensureTransition
      || (v6 = objc_msgSend(v4, "numberOfItems"), v6 != -[NSArray count](self->__performableActionTypes, "count")))
    {
      self->_ensureTransition = 0;
      if (v3)
      {
        if (v5)
        {
          -[PXPhotosDetailsActionsUIWidget _createNewLayout](self, "_createNewLayout");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "transitionToLayout:", v8);

        }
      }
    }
    else
    {
      objc_msgSend(v3, "scrollController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "visibleRect");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__PXPhotosDetailsActionsUIWidget__updateLayoutIfNeeded__block_invoke;
      v9[3] = &unk_1E5130F48;
      v9[4] = self;
      objc_msgSend(v3, "enumerateTilesInRect:withOptions:usingBlock:", 0, v9);

    }
  }
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  return (PXWidgetUnlockDelegate *)objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
}

- (void)setWidgetUnlockDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetUnlockDelegate, a3);
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (BOOL)allowRevealInMomentAction
{
  return self->_allowRevealInMomentAction;
}

- (BOOL)allowCreateMemoryAction
{
  return self->_allowCreateMemoryAction;
}

- (BOOL)allowInternalFileRadarAction
{
  return self->_allowInternalFileRadarAction;
}

- (PXActionPerformerDelegate)actionPerformerDelegate
{
  return (PXActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
}

- (void)setActionPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionPerformerDelegate, a3);
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXReusableObjectPool)_tileReusePool
{
  return self->__tileReusePool;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (PHFetchResult)_peopleFetchResult
{
  return self->__peopleFetchResult;
}

- (PXPhotoKitAssetCollectionActionManager)_assetCollectionActionManager
{
  return self->__assetCollectionActionManager;
}

- (void)_setAssetCollectionActionManager:(id)a3
{
  objc_storeStrong((id *)&self->__assetCollectionActionManager, a3);
}

- (NSArray)_allowedActionTypes
{
  return self->__allowedActionTypes;
}

- (NSArray)_performableActionTypes
{
  return self->__performableActionTypes;
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (PXPhotosDetailsActionsSpecManager)_specManager
{
  return self->__specManager;
}

- (PXActionRowTile)_measuringActionRowTile
{
  return self->__measuringActionRowTile;
}

- (double)_rowHeight
{
  return self->__rowHeight;
}

- (PXActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (void)_setActivePerformer:(id)a3
{
  objc_storeStrong((id *)&self->__activePerformer, a3);
}

- (CGPoint)lastNormalizedTapPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastNormalizedTapPosition.x;
  y = self->_lastNormalizedTapPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastNormalizedTapPosition:(CGPoint)a3
{
  self->_lastNormalizedTapPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->__measuringActionRowTile, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->__performableActionTypes, 0);
  objc_storeStrong((id *)&self->__allowedActionTypes, 0);
  objc_storeStrong((id *)&self->__assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->__peopleFetchResult, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->__tileReusePool, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

uint64_t __55__PXPhotosDetailsActionsUIWidget__updateLayoutIfNeeded__block_invoke(uint64_t result, __int128 *a2)
{
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  if (*((_QWORD *)a2 + 1) == 6200434)
  {
    v3 = result;
    v16 = 0;
    objc_msgSend(*(id *)(result + 32), "_tilingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a2[3];
    v12 = a2[2];
    v13 = v5;
    v14 = a2[4];
    v15 = *((_QWORD *)a2 + 10);
    v6 = a2[1];
    v10 = *a2;
    v11 = v6;
    objc_msgSend(v4, "getTile:geometry:group:userData:forTileWithIdentifier:", &v16, 0, 0, 0, &v10);

    v7 = *(void **)(v3 + 32);
    v8 = a2[3];
    v12 = a2[2];
    v13 = v8;
    v14 = a2[4];
    v15 = *((_QWORD *)a2 + 10);
    v9 = a2[1];
    v10 = *a2;
    v11 = v9;
    return objc_msgSend(v7, "configureActionButtonTile:withIdentifier:", v16, &v10);
  }
  return result;
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateActionManager");
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutEnsureTransition");
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayout");
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePeopleFetchResult");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayout");
}

void __61__PXPhotosDetailsActionsUIWidget_photosDataSource_didChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstAssetCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_assetCollectionActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateActionManager");
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePerformableActionTypes");
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateLayout");

}

void __64__PXPhotosDetailsActionsUIWidget_prepareForPopoverPresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  if (*(_QWORD *)(a2 + 8) == 6200434)
  {
    v11 = *(_QWORD *)(a2 + 24);
    objc_msgSend(*(id *)(a1 + 32), "_performableActionTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "actionType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "isEqualToString:", v17);

    if ((_DWORD)v12)
    {
      objc_msgSend(a3, "view");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      *a8 = 1;
    }

  }
}

uint64_t __65__PXPhotosDetailsActionsUIWidget_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisabledActionTypes:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActionWithCompletionHandler:", &__block_literal_global_167115);
}

void __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Error performing action:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __45__PXPhotosDetailsActionsUIWidget_setContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewModel:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPhotosDataSource:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePeopleFetchResult");
}

uint64_t __70__PXPhotosDetailsActionsUIWidget__handleContentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateRowHeight");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayout");
}

uint64_t __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRowHeight");
}

PXActionRowTile *__55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_2(uint64_t a1)
{
  PXActionRowTile *v2;
  id WeakRetained;

  v2 = objc_alloc_init(PXActionRowTile);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PXActionRowTile setDelegate:](v2, "setDelegate:", WeakRetained);

  return v2;
}

PXUIGenericViewTile *__55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_3(uint64_t a1)
{
  PXUIGenericViewTile *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc_init(PXUIGenericViewTile);
  -[PXUIGenericViewTile view](v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extendedTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v2;
}

uint64_t __66__PXPhotosDetailsActionsUIWidget_setAllowInternalFileRadarAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActionTypes");
}

uint64_t __61__PXPhotosDetailsActionsUIWidget_setAllowCreateMemoryAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActionTypes");
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_setAllowRevealInMomentAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActionTypes");
}

uint64_t __42__PXPhotosDetailsActionsUIWidget_setSpec___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayout");
}

@end
