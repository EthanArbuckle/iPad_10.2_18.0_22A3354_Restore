@implementation PXAssetsScene

- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 delegate:(id)a6
{
  return -[PXAssetsScene initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:](self, "initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:", a3, a4, a5, 0, a6);
}

- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXAssetsScene *v18;
  PXAssetsScene *v19;
  PXAssetBadgeManager *v20;
  PXAssetBadgeManager *badgeManager;
  uint64_t v22;
  NSMutableArray *anchors;
  uint64_t v24;
  PXAssetsDataSource *dataSource;
  PXSectionedSelectionManager *v26;
  PXSectionedSelectionManager *selectionManager;
  id v28;
  void *v29;
  uint64_t v30;
  PXScrollViewSpeedometer *scrollSpeedometer;
  PXReusableObjectPool *v32;
  PXReusableObjectPool *viewTileReusePool;
  void *v34;
  void *v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  void *v39;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v41.receiver = self;
  v41.super_class = (Class)PXAssetsScene;
  v18 = -[PXAssetsScene init](&v41, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tilingController, a3);
    objc_storeStrong((id *)&v19->_mediaProvider, a4);
    v20 = objc_alloc_init(PXAssetBadgeManager);
    badgeManager = v19->_badgeManager;
    v19->_badgeManager = v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    anchors = v19->__anchors;
    v19->__anchors = (NSMutableArray *)v22;

    -[PXAssetsScene setDelegate:](v19, "setDelegate:", v17);
    objc_storeStrong((id *)&v19->_dataSourceManager, a5);
    objc_msgSend(v15, "registerChangeObserver:context:", v19, PXAssetsSceneDataSourceObserverContext);
    objc_msgSend(v15, "dataSource");
    v24 = objc_claimAutoreleasedReturnValue();
    dataSource = v19->__dataSource;
    v19->__dataSource = (PXAssetsDataSource *)v24;

    if (v16)
      v26 = (PXSectionedSelectionManager *)v16;
    else
      v26 = (PXSectionedSelectionManager *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v15);
    selectionManager = v19->_selectionManager;
    v19->_selectionManager = v26;

    -[PXSectionedSelectionManager registerChangeObserver:context:](v19->_selectionManager, "registerChangeObserver:context:", v19, PXAssetsSceneSelectionManagerObserverContext);
    v28 = objc_alloc((Class)off_1E50B47A0);
    objc_msgSend(v13, "scrollController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithScrollController:", v29);
    scrollSpeedometer = v19->_scrollSpeedometer;
    v19->_scrollSpeedometer = (PXScrollViewSpeedometer *)v30;

    -[PXScrollViewSpeedometer registerChangeObserver:context:](v19->_scrollSpeedometer, "registerChangeObserver:context:", v19, PXAssetsSceneSpeedometerObserverContext);
    v32 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E50B46A0);
    viewTileReusePool = v19->_viewTileReusePool;
    v19->_viewTileReusePool = v32;

    -[PXReusableObjectPool setDelegate:](v19->_viewTileReusePool, "setDelegate:", v19);
    +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_animatesContent = objc_msgSend(v34, "animateContentByDefault");

    +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "allowLoopingVideoPlayback");
    if (objc_msgSend(v35, "allowAnimatedImagePlayback"))
      v36 |= 2uLL;
    if (objc_msgSend(v35, "allowVideoPlayback"))
      v36 |= 4uLL;
    if (objc_msgSend(v35, "allowLivePhotoPlayback"))
    {
      v37 = objc_msgSend(v35, "playLivePhotosAsLoops");
      v38 = 8;
      if (v37)
        v38 = 24;
      v36 |= v38;
    }

    v19->_autoplayBehavior = v36;
    -[PXAssetsScene targetLayout](v19, "targetLayout");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene _configureLayout:](v19, "_configureLayout:", v39);

  }
  return v19;
}

- (PXAssetsScene)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsScene.m"), 121, CFSTR("%s is not available as initializer"), "-[PXAssetsScene init]");

  abort();
}

- (void)transitionToLayout:(id)a3
{
  id v4;

  v4 = a3;
  -[PXAssetsScene _saveAnchorAsset](self, "_saveAnchorAsset");
  -[PXAssetsScene _configureLayout:](self, "_configureLayout:", v4);
  -[PXTilingController transitionToLayout:](self->_tilingController, "transitionToLayout:", v4);

}

- (void)setDelegate:(id)a3
{
  PXAssetsSceneDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateFlags.respondsToTileIdentifierConverterForChange = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToWillTransitionToDataSource = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidTransitionToDataSource = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTransitionAnimationCoordinatorForChange = p_delegate & 1;
}

- (PXAssetsTilingLayout)targetLayout
{
  void *v2;
  void *v3;

  -[PXAssetsScene tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return (PXAssetsTilingLayout *)v3;
}

- (PXAssetsTilingLayout)currentLayout
{
  void *v2;
  void *v3;

  -[PXAssetsScene tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return (PXAssetsTilingLayout *)v3;
}

- (BOOL)providesTileForIdentifier:(PXTileIdentifier *)a3
{
  unint64_t v3;
  char v5;
  int64x2_t v6;
  BOOL v7;
  char v8;
  BOOL v10;

  v3 = a3->index[0];
  v5 = a3->length == 5 && v3 == 6432423;
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = vdupq_n_s64(v3);
    v7 = v3 == 6332434;
    v8 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v6, (int64x2_t)xmmword_1A7C0C800), (int32x4_t)vceqq_s64(v6, (int64x2_t)xmmword_1A7C0C810)))) | (v3 == 6332439);
    v10 = v3 == 6332440 || v3 == 6332438;
    v5 |= (v7 || v10) | v8;
  }
  return v5 & 1;
}

- (void)willTransitionToDataSource:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToWillTransitionToDataSource)
  {
    v4 = a3;
    -[PXAssetsScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetsScene:willTransitionToDataSource:", self, v4);

  }
}

- (void)didTransitionToDataSource:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToDidTransitionToDataSource)
  {
    v4 = a3;
    -[PXAssetsScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetsScene:didTransitionToDataSource:", self, v4);

  }
}

- (void)setAnimatesContent:(BOOL)a3
{
  id v4;

  if (self->_animatesContent != a3)
  {
    self->_animatesContent = a3;
    -[PXAssetsScene targetLayout](self, "targetLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene _configureLayout:](self, "_configureLayout:", v4);

  }
}

- (void)setNeedsUpdate
{
  void *v2;
  id v3;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    -[PXAssetsScene tilingController](self, "tilingController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsUpdate");

  }
}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXAssetsScene updateIfNeeded](self, "updateIfNeeded");
}

- (BOOL)needsUpdate
{
  return self->_needsUpdateFlags.layout;
}

- (void)updateIfNeeded
{
  if (-[PXAssetsScene needsUpdate](self, "needsUpdate"))
    -[PXAssetsScene _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  -[PXAssetsScene setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLayoutIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    -[PXAssetsScene delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene _dataSource](self, "_dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene willTransitionToDataSource:](self, "willTransitionToDataSource:", v4);
    objc_msgSend(v8, "assetsScene:layoutForDataSource:", self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsScene.m"), 240, CFSTR("delegate:%@ must return a new layout for data source:%@"), v8, v4);

    }
    -[PXAssetsScene _configureLayout:](self, "_configureLayout:", v5);
    -[PXAssetsScene _saveAnchorAsset](self, "_saveAnchorAsset");
    -[PXAssetsScene tilingController](self, "tilingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionToLayout:", v5);

    -[PXAssetsScene didTransitionToDataSource:](self, "didTransitionToDataSource:", v4);
  }
}

- (void)_updateDataSourceIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[5];
  id v11;

  -[PXAssetsScene dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAssetsScene selectionManager](self, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
  {
    -[PXAssetsScene _dataSource](self, "_dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v4);

    if ((v9 & 1) == 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__PXAssetsScene__updateDataSourceIfNeeded__block_invoke;
      v10[3] = &unk_1E5148D08;
      v10[4] = self;
      v11 = v4;
      -[PXAssetsScene performChanges:](self, "performChanges:", v10);

    }
  }
  else
  {

  }
}

- (void)_configureLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  -[PXAssetsScene selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");
  objc_msgSend(v5, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");

  if (v7 == v9)
  {
    objc_msgSend(v5, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedIndexPaths:", v10);

  }
  if (-[PXAssetsScene animatesContent](self, "animatesContent"))
    v11 = -[PXAssetsScene autoplayBehavior](self, "autoplayBehavior");
  else
    v11 = 0;
  objc_msgSend(v12, "setAnimatedOverlayBehavior:", v11);

}

- (void)_saveAnchorAsset
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;

  -[PXAssetsScene _anchors](self, "_anchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");
  -[PXAssetsScene tilingController](self, "tilingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXAssetsScene tilingController](self, "tilingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "visibleRect");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v26 = CGRectInset(v25, v25.size.width * -0.5, v25.size.height * -0.5);
    v13 = v26.origin.x;
    v14 = v26.origin.y;
    v15 = v26.size.width;
    v16 = v26.size.height;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __33__PXAssetsScene__saveAnchorAsset__block_invoke;
    v18[3] = &unk_1E513A788;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    v19 = v8;
    v20 = v3;
    v17 = v8;
    objc_msgSend(v17, "enumerateTilesInRect:withOptions:usingBlock:", 0, v18, v13, v14, v15, v16);

  }
}

- (void)_setDataSource:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = -[PXAssetsDataSource identifier](self->__dataSource, "identifier");
  if (v5 != objc_msgSend(v6, "identifier"))
  {
    objc_storeStrong((id *)&self->__dataSource, a3);
    -[PXAssetsScene _invalidateLayout](self, "_invalidateLayout");
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v8 = a3;
  if ((v6 & 1) != 0 && (void *)PXAssetsSceneDataSourceObserverContext == a5)
  {
    v10 = v8;
    -[PXAssetsScene _updateDataSourceIfNeeded](self, "_updateDataSourceIfNeeded");
LABEL_7:
    v8 = v10;
    goto LABEL_8;
  }
  if ((v6 & 1) != 0 && (void *)PXAssetsSceneSelectionManagerObserverContext == a5)
  {
    v10 = v8;
    -[PXAssetsScene _updateDataSourceIfNeeded](self, "_updateDataSourceIfNeeded");
    -[PXAssetsScene targetLayout](self, "targetLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsScene _configureLayout:](self, "_configureLayout:", v9);

    goto LABEL_7;
  }
LABEL_8:

}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PXSectionedTileIdentifierConverter *v15;
  void *v16;
  void *v17;
  PXSectionedTileIdentifierConverter *v18;
  void *v19;

  v5 = a4;
  v6 = v5;
  if (self->_delegateFlags.respondsToTileIdentifierConverterForChange && !self->_isAskingForTileIdentifierConverter)
  {
    self->_isAskingForTileIdentifierConverter = 1;
    -[PXAssetsScene delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetsScene:tileIdentifierConverterForChange:", self, v6);
    v18 = (PXSectionedTileIdentifierConverter *)objc_claimAutoreleasedReturnValue();

    self->_isAskingForTileIdentifierConverter = 0;
  }
  else
  {
    objc_msgSend(v5, "fromLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[PXAssetsScene dataSourceManager](self, "dataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changeHistory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "identifier");
      objc_msgSend(v8, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v13, objc_msgSend(v14, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = [PXSectionedTileIdentifierConverter alloc];
    objc_msgSend(v7, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PXSectionedTileIdentifierConverter initWithFromDataSource:toDataSource:changeDetails:](v15, "initWithFromDataSource:toDataSource:changeDetails:", v16, v17, v9);

  }
  return v18;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (self->_delegateFlags.respondsToTransitionAnimationCoordinatorForChange
    && !self->_isAskingForTransitionAnimationCoordinator)
  {
    self->_isAskingForTransitionAnimationCoordinator = 1;
    -[PXAssetsScene delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsScene:transitionAnimationCoordinatorForChange:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    self->_isAskingForTransitionAnimationCoordinator = 0;
  }
  else
  {
    -[PXAssetsScene dataSourceManager](self, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:changeHistory:](PXAssetsTileTransitionCoordinator, "transitionCoordinatorForChange:changeHistory:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  uint64_t *v29;
  id obj;
  PXAssetsScene *v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[4];
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGPoint result;

  v57 = *MEMORY[0x1E0C80C00];
  v32 = a4;
  objc_msgSend(v32, "scrollBounds");
  v6 = v5;
  v8 = v7;
  -[PXAssetsScene _anchors](self, "_anchors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v31 = self;
  -[PXAssetsScene _anchors](self, "_anchors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    v15 = *(_QWORD *)off_1E50B7E98;
    v29 = &v37;
    v28 = xmmword_1A7C0C200;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v17, "assetReference", v28, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v32, "dataSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXAssetsScene dataSourceManager](v31, "dataSourceManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "changeHistory");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "indexPath");
          objc_msgSend(v21, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v51, objc_msgSend(v19, "identifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          memset(&v50[2], 0, 32);
          objc_msgSend(v18, "indexPath");
          objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v22, v50, 0, 0);
          v23 = *(_QWORD *)&v50[2];
          if (*(_QWORD *)&v50[2] == v15)
          {
            if (v19)
            {
              objc_msgSend(v19, "indexPathForObjectReference:", v18);
            }
            else
            {
              v38 = 0u;
              v39 = 0u;
            }
            v50[2] = v38;
            v50[3] = v39;
            v23 = v38;
          }
          if (v23 != v15)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v33 = v28;
            v34 = v23;
            v35 = *(_OWORD *)((char *)&v50[2] + 8);
            v36 = *((_QWORD *)&v50[3] + 1);
            *(_OWORD *)v29 = 0u;
            *((_OWORD *)v29 + 1) = 0u;
            v29[4] = 0;
            if ((objc_msgSend(v32, "getGeometry:group:userData:forTileWithIdentifier:", &v38, 0, 0, &v33) & 1) != 0)
            {
              objc_msgSend(v17, "anchorOrigin");
              PXPointSubtract();
              v6 = v24;
              v8 = v25;

              goto LABEL_19;
            }
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_19:

  v26 = v6;
  v27 = v8;
  result.y = v27;
  result.x = v26;
  return result;
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsScene.m"), 420, CFSTR("%@ must be implemented in a concrete subclass"), v8);

  abort();
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsScene.m"), 424, CFSTR("%@ must be implemented in a concrete subclass"), v7);

  abort();
}

- (PXAssetsSceneDelegate)delegate
{
  return (PXAssetsSceneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXAssetBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (PXScrollViewSpeedometer)scrollSpeedometer
{
  return self->_scrollSpeedometer;
}

- (PXReusableObjectPool)viewTileReusePool
{
  return self->_viewTileReusePool;
}

- (BOOL)animatesContent
{
  return self->_animatesContent;
}

- (PXAssetsDataSource)_dataSource
{
  return self->__dataSource;
}

- (NSMutableArray)_anchors
{
  return self->__anchors;
}

- (unint64_t)autoplayBehavior
{
  return self->_autoplayBehavior;
}

- (void)setAutoplayBehavior:(unint64_t)a3
{
  self->_autoplayBehavior = a3;
}

- (BOOL)autoplayTilesWaitForInput
{
  return self->_autoplayTilesWaitForInput;
}

- (void)setAutoplayTilesWaitForInput:(BOOL)a3
{
  self->_autoplayTilesWaitForInput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__anchors, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->_viewTileReusePool, 0);
  objc_storeStrong((id *)&self->_scrollSpeedometer, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __33__PXAssetsScene__saveAnchorAsset__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _PXAssetsSceneAnchor *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a5;
  if (*(_QWORD *)a2 == 5 && *(_QWORD *)(a2 + 8) == 6432423)
  {
    PXDistanceBetweenPoints();
    v9 = v8;
    v17 = *(_OWORD *)(a2 + 16);
    v11 = *(_QWORD *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v11;
    v20 = v10;
    objc_msgSend(v12, "assetReferenceAtItemIndexPath:", &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PXPointSubtract();
    v16 = -[_PXAssetsSceneAnchor initWithAssetReference:anchorOrigin:distance:]([_PXAssetsSceneAnchor alloc], "initWithAssetReference:anchorOrigin:distance:", v13, v14, v15, v9);
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v16, objc_msgSend(*(id *)(a1 + 40), "indexOfObject:inSortedRange:options:usingComparator:", v16, 0, objc_msgSend(*(id *)(a1 + 40), "count"), 1024, &__block_literal_global_231904));

  }
}

uint64_t __33__PXAssetsScene__saveAnchorAsset__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "distance");
  v7 = v6;
  objc_msgSend(v5, "distance");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "distance");
    v11 = v10;
    objc_msgSend(v5, "distance");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __42__PXAssetsScene__updateDataSourceIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDataSource:", *(_QWORD *)(a1 + 40));
}

@end
