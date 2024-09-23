@implementation PXZoomablePhotosLayout

- (PXZoomablePhotosLayout)initWithViewModel:(id)a3
{
  id v6;
  PXZoomablePhotosLayout *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *itemLayoutsAllowedToLoad;
  NSCache *v12;
  NSCache *providedEffectByAsset;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  PXAssetsDataSourceManager *dataSourceManager;
  uint64_t v22;
  PXAssetsDataSource *currentDataSource;
  PXPhotosGridAssetDecorationSource *v24;
  PXPhotosGridAssetDecorationSource *assetDecorationSource;
  void *v26;
  void *v27;
  CGPoint v28;
  PXGZoomLayout *v29;
  PXGZoomLayout *zoomLayout;
  uint64_t v31;
  PXMediaProvider *preheatMediaProvider;
  uint64_t v33;
  NSMapTable *visualAnchorAssetReferenceItemByLayout;
  void *v35;
  PXZoomableInlineHeadersLayout *v36;
  void *v37;
  uint64_t v38;
  PXZoomableInlineHeadersLayout *inlineHeadersLayout;
  void *v40;
  uint64_t v41;
  PXNumberAnimator *decorationAlphaAnimator;
  void *v43;
  void *v45;
  _QWORD v46[5];
  objc_super v47;

  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PXZoomablePhotosLayout;
  v7 = -[PXGLayout init](&v47, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v7, PXZoomablePhotosSpecManagerObserverContext);
    objc_msgSend(v8, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_spec, v9);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemLayoutsAllowedToLoad = v7->_itemLayoutsAllowedToLoad;
    v7->_itemLayoutsAllowedToLoad = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    providedEffectByAsset = v7->_providedEffectByAsset;
    v7->_providedEffectByAsset = v12;

    -[NSCache setCountLimit:](v7->_providedEffectByAsset, "setCountLimit:", 200);
    v14 = objc_msgSend(v9, "initialNumberOfColumns");
    if (v14 > objc_msgSend(v9, "maxColumnsForIndividualItems"))
    {
      objc_msgSend(v6, "assetsDataSourceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "areAllSectionsConsideredAccurate");

      if ((v17 & 1) == 0)
      {
        objc_msgSend(v6, "assetsDataSourceManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "performChanges:", &__block_literal_global_85946);

      }
    }
    v19 = objc_msgSend(v6, "bestColumnIndexForPreferredNumberOfColumns:", v14);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_2;
    v46[3] = &__block_descriptor_40_e44_v16__0___PXMutableZoomablePhotosViewModel__8l;
    v46[4] = v19;
    objc_msgSend(v6, "performInitialChanges:", v46);
    v7->_bodyLayoutAXGroupRole = 0;
    objc_storeStrong((id *)&v7->_viewModel, a3);
    -[PXZoomablePhotosViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, PXZoomablePhotosViewModelObserverContext_85815);
    -[PXZoomablePhotosViewModel setGeometryDelegate:](v7->_viewModel, "setGeometryDelegate:", v7);
    objc_msgSend(v6, "assetsDataSourceManager");
    v20 = objc_claimAutoreleasedReturnValue();
    dataSourceManager = v7->_dataSourceManager;
    v7->_dataSourceManager = (PXAssetsDataSourceManager *)v20;

    -[PXAssetsDataSourceManager registerChangeObserver:context:](v7->_dataSourceManager, "registerChangeObserver:context:", v7, PXZoomablePhotosDataSourceObserverContext);
    -[PXAssetsDataSourceManager dataSource](v7->_dataSourceManager, "dataSource");
    v22 = objc_claimAutoreleasedReturnValue();
    currentDataSource = v7->_currentDataSource;
    v7->_currentDataSource = (PXAssetsDataSource *)v22;

    if (-[PXAssetsDataSource numberOfSections](v7->_currentDataSource, "numberOfSections") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXZoomablePhotosLayout.m"), 323, CFSTR("Requires a data source with 1 section."));

    }
    v24 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v7->_assetDecorationSource;
    v7->_assetDecorationSource = v24;

    -[PXPhotosGridAssetDecorationSource setDataSource:section:](v7->_assetDecorationSource, "setDataSource:section:", v7->_currentDataSource, 0);
    objc_msgSend(v6, "badgesModifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGridAssetDecorationSource setBadgesModifier:](v7->_assetDecorationSource, "setBadgesModifier:", v26);

    objc_msgSend(v6, "loadingStatusManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGridAssetDecorationSource setLoadingStatusManager:](v7->_assetDecorationSource, "setLoadingStatusManager:", v27);

    v28 = *(CGPoint *)off_1E50B8580;
    v7->_normalizedScaleCenterInAnchorSprite = *(CGPoint *)off_1E50B8580;
    v7->_scaleCenterTargetInViewport = v28;
    v29 = objc_alloc_init(PXGZoomLayout);
    zoomLayout = v7->_zoomLayout;
    v7->_zoomLayout = v29;

    -[PXGLayout setContentSource:](v7->_zoomLayout, "setContentSource:", v7);
    objc_msgSend(v6, "mediaProvider");
    v31 = objc_claimAutoreleasedReturnValue();
    preheatMediaProvider = v7->_preheatMediaProvider;
    v7->_preheatMediaProvider = (PXMediaProvider *)v31;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v33 = objc_claimAutoreleasedReturnValue();
    visualAnchorAssetReferenceItemByLayout = v7->_visualAnchorAssetReferenceItemByLayout;
    v7->_visualAnchorAssetReferenceItemByLayout = (NSMapTable *)v33;

    objc_msgSend(v6, "inlineHeadersDataSourceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = [PXZoomableInlineHeadersLayout alloc];
      objc_msgSend(v6, "inlineHeadersDataSourceManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PXZoomableInlineHeadersLayout initWithDataSourceManager:](v36, "initWithDataSourceManager:", v37);
      inlineHeadersLayout = v7->_inlineHeadersLayout;
      v7->_inlineHeadersLayout = (PXZoomableInlineHeadersLayout *)v38;

      objc_msgSend(v9, "inlineHeadersSpec");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXZoomableInlineHeadersLayout setSpec:](v7->_inlineHeadersLayout, "setSpec:", v40);

      -[PXZoomableInlineHeadersLayout setGeometrySource:](v7->_inlineHeadersLayout, "setGeometrySource:", v7);
    }
    v41 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 1.0);
    decorationAlphaAnimator = v7->_decorationAlphaAnimator;
    v7->_decorationAlphaAnimator = (PXNumberAnimator *)v41;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_decorationAlphaAnimator, "registerChangeObserver:context:", v7, PXZoomablePhotosDecorationAlphaAnimatorContext);
    objc_msgSend(v6, "miniModeAnimator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "registerChangeObserver:context:", v7, PXZoomablePhotosMiniModeAnimatorContext);

    -[PXGSplitLayout setMode:](v7, "setMode:", 5);
    -[PXGSplitLayout setFirstSublayout:](v7, "setFirstSublayout:", v7->_zoomLayout);
    -[PXGSplitLayout setSecondSublayout:](v7, "setSecondSublayout:", v7->_inlineHeadersLayout);
    v7->_pinchEffectCaptureSpriteIndex = -1;
    v7->_lightBackgroundSpriteIndexRange = -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", 5, &__block_literal_global_191_85953);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    PXZoomablePhotosInvalidate(v7, 8324031);

  }
  return v7;
}

- (PXZoomablePhotosLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayout.m"), 377, CFSTR("%s is not available as initializer"), "-[PXZoomablePhotosLayout init]");

  abort();
}

- (void)setSpec:(id)a3
{
  PXZoomablePhotosLayoutSpec *v5;
  PXZoomablePhotosLayoutSpec **p_spec;
  PXZoomablePhotosLayoutSpec *spec;
  PXZoomablePhotosLayoutSpec *v8;
  PXZoomablePhotosLayoutSpec *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[6];

  v5 = (PXZoomablePhotosLayoutSpec *)a3;
  p_spec = &self->_spec;
  spec = self->_spec;
  if (spec != v5)
  {
    v8 = spec;
    v9 = v5;
    v10 = -[PXZoomablePhotosLayoutSpec defaultNumberOfColumns](v8, "defaultNumberOfColumns");
    v42 = -[PXZoomablePhotosLayoutSpec defaultNumberOfColumns](v9, "defaultNumberOfColumns");
    v11 = -[PXFeatureSpec layoutOrientation](v8, "layoutOrientation");
    v12 = -[PXFeatureSpec layoutOrientation](v9, "layoutOrientation");
    if (-[PXFeatureSpec userInterfaceIdiom](v9, "userInterfaceIdiom") == 1)
    {
      v13 = -[PXFeatureSpec layoutOrientation](v9, "layoutOrientation");
      if (v11 != v12 && v13 == 1)
      {
        -[PXZoomablePhotosLayout viewModel](self, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferredIndividualItemsColumnsNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[PXZoomablePhotosLayoutSpec supportedColumns](v9, "supportedColumns");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "integerValue");
          -[PXZoomablePhotosLayoutSpec supportedColumns](v9, "supportedColumns");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", -[PXZoomablePhotosLayoutSpec bestColumnIndexForPreferredNumberOfColumns:allowedColumns:](v9, "bestColumnIndexForPreferredNumberOfColumns:allowedColumns:", v19, v40));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v20, "integerValue");

        }
      }
    }
    -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10 == objc_msgSend(v21, "numberOfColumns") && v10 != v42;

    v24 = -[PXZoomablePhotosLayoutSpec maxColumnsForIndividualItems](v8, "maxColumnsForIndividualItems");
    v25 = -[PXZoomablePhotosLayoutSpec maxColumnsForIndividualItems](v9, "maxColumnsForIndividualItems");
    -[PXZoomablePhotosLayoutSpec itemAspectRatio](v8, "itemAspectRatio");
    v27 = v26;
    -[PXZoomablePhotosLayoutSpec itemAspectRatio](v9, "itemAspectRatio");
    v29 = v28;
    v41 = -[PXZoomablePhotosLayoutSpec minColumnsForMiniBadges](v8, "minColumnsForMiniBadges");
    v39 = -[PXZoomablePhotosLayoutSpec minColumnsForMiniBadges](v9, "minColumnsForMiniBadges");
    -[PXFeatureSpec layoutMargins](*p_spec, "layoutMargins");
    -[PXFeatureSpec layoutMargins](v9, "layoutMargins");
    if (!PXEdgeInsetsEqualToEdgeInsets()
      || (-[PXZoomablePhotosLayoutSpec aspectFitEdgeMargins](*p_spec, "aspectFitEdgeMargins"),
          -[PXZoomablePhotosLayoutSpec aspectFitEdgeMargins](v9, "aspectFitEdgeMargins"),
          !PXEdgeInsetsEqualToEdgeInsets())
      || (-[PXZoomablePhotosLayoutSpec squareEdgeMargins](*p_spec, "squareEdgeMargins"),
          -[PXZoomablePhotosLayoutSpec squareEdgeMargins](v9, "squareEdgeMargins"),
          (PXEdgeInsetsEqualToEdgeInsets() & 1) == 0))
    {
      PXZoomablePhotosInvalidate(self, 852024);
    }
    v30 = -[PXFeatureSpec userInterfaceStyle](*p_spec, "userInterfaceStyle");
    if (v30 != -[PXFeatureSpec userInterfaceStyle](v9, "userInterfaceStyle")
      || (v31 = -[PXFeatureSpec userInterfaceLevel](*p_spec, "userInterfaceLevel"),
          v31 != -[PXFeatureSpec userInterfaceLevel](v9, "userInterfaceLevel")))
    {
      ++self->_backgroundMediaVersion;
      PXZoomablePhotosInvalidate(self, 131080);
    }
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXZoomablePhotosLayoutSpec inlineHeadersSpec](v9, "inlineHeadersSpec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomableInlineHeadersLayout setSpec:](self->_inlineHeadersLayout, "setSpec:", v32);

    if (v23)
    {
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __34__PXZoomablePhotosLayout_setSpec___block_invoke;
      v43[3] = &unk_1E51409D8;
      v43[4] = self;
      v43[5] = v42;
      objc_msgSend(v33, "performChanges:", v43);

    }
    if (-[PXZoomablePhotosLayout _hasLastRowFilledStrategy](self, "_hasLastRowFilledStrategy"))
    {
      -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "numberOfColumns");

      if (v35 < 1)
      {
        v38 = 0;
      }
      else
      {
        -[PXZoomablePhotosLayoutSpec supportedColumns](v9, "supportedColumns");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "containsObject:", v37) ^ 1;

      }
      if ((v23 | v38) == 1)
        -[PXZoomablePhotosLayout _invalidateVisualShiftingEnsuringLastRowFilled](self, "_invalidateVisualShiftingEnsuringLastRowFilled");
    }
    if (v24 != v25 || v27 != v29 || v41 != v39)
      PXZoomablePhotosInvalidate(self, 65592);

  }
}

- (void)setAnchorAssetReference:(id)a3
{
  PXAssetReference *v5;

  v5 = (PXAssetReference *)a3;
  if (self->__anchorAssetReference != v5)
  {
    objc_storeStrong((id *)&self->__anchorAssetReference, a3);
    -[PXGZoomLayout setAnchorObjectReference:](self->_zoomLayout, "setAnchorObjectReference:", v5);
  }

}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_overlayInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_overlayInsets = &self->_overlayInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_overlayInsets->top = top;
    p_overlayInsets->left = left;
    p_overlayInsets->bottom = bottom;
    p_overlayInsets->right = right;
    PXZoomablePhotosInvalidate(self, 4);
  }
}

- (void)setInlineHeaderOverlayInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_inlineHeaderOverlayInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_inlineHeaderOverlayInsets = &self->_inlineHeaderOverlayInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_inlineHeaderOverlayInsets->top = top;
    p_inlineHeaderOverlayInsets->left = left;
    p_inlineHeaderOverlayInsets->bottom = bottom;
    p_inlineHeaderOverlayInsets->right = right;
    -[PXZoomableInlineHeadersLayout invalidateGeometry](self->_inlineHeadersLayout, "invalidateGeometry");
  }
}

- (void)setEffectiveOverlayInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_effectiveOverlayInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_effectiveOverlayInsets = &self->_effectiveOverlayInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_effectiveOverlayInsets->top = top;
    p_effectiveOverlayInsets->left = left;
    p_effectiveOverlayInsets->bottom = bottom;
    p_effectiveOverlayInsets->right = right;
    PXZoomablePhotosInvalidate(self, 2097160);
  }
}

- (void)setPreventFillingTopAreaInsets:(BOOL)a3
{
  if (self->_preventFillingTopAreaInsets != a3)
  {
    self->_preventFillingTopAreaInsets = a3;
    PXZoomablePhotosInvalidate(self, 8);
  }
}

- (void)setAddContentHandler:(id)a3
{
  void *v4;
  id addContentHandler;

  if (self->_addContentHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    addContentHandler = self->_addContentHandler;
    self->_addContentHandler = v4;

    -[PXZoomablePhotosLayout setEnableAddContentAccessoryItem:](self, "setEnableAddContentAccessoryItem:", self->_addContentHandler != 0);
  }
}

- (void)setEnableAddContentAccessoryItem:(BOOL)a3
{
  if (self->_enableAddContentAccessoryItem != a3)
  {
    self->_enableAddContentAccessoryItem = a3;
    PXZoomablePhotosInvalidate(self, 8);
  }
}

- (void)setEffectProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id effectProvider;
  id aBlock;

  aBlock = a3;
  v4 = _Block_copy(self->_effectProvider);
  v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = _Block_copy(aBlock);
      effectProvider = self->_effectProvider;
      self->_effectProvider = v8;

      PXZoomablePhotosInvalidate(self, 8);
      -[NSCache removeAllObjects](self->_providedEffectByAsset, "removeAllObjects");
      -[NSArray enumerateObjectsUsingBlock:](self->_itemLayouts, "enumerateObjectsUsingBlock:", &__block_literal_global_197_85941);
    }
  }

}

- (PXGBurstStackEffect)burstStackEffect
{
  void *burstStackEffect;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PXGBurstStackEffect *v9;

  -[PXGBurstStackEffect entityManager](self->_burstStackEffect, "entityManager");
  burstStackEffect = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout entityManager](self, "entityManager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (burstStackEffect == (void *)v4)
  {
    v8 = burstStackEffect;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[PXGLayout entityManager](self, "entityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc((Class)off_1E50B2890);
    -[PXGLayout entityManager](self, "entityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (PXGBurstStackEffect *)objc_msgSend(v7, "initWithEntityManager:", v8);
    burstStackEffect = self->_burstStackEffect;
    self->_burstStackEffect = v9;
LABEL_5:

  }
  return self->_burstStackEffect;
}

- (void)containingScrollViewDidScroll:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  char v8;
  PXGAnchor *anchor;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = PXFloatApproximatelyEqualToFloat();

    if ((v8 & 1) == 0)
    {
      self->_scaleCenterTargetInViewport.y = self->_scaleCenterTargetInViewport.y - y;
      anchor = self->_anchor;
      self->_anchor = 0;

      self->_scrolledWhileAnimatingZoom = 1;
      PXZoomablePhotosInvalidate(self, 16);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGLayout containingScrollViewDidScroll:](&v10, sel_containingScrollViewDidScroll_, x, y);
}

- (void)entityManagerDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGLayout entityManagerDidChange](&v4, sel_entityManagerDidChange);
  PXZoomablePhotosInvalidate(self, 917504);
  -[PXGLayout entityManager](self, "entityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    PXZoomablePhotosInvalidate(self, 2);
}

- (void)appearStateDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGLayout appearStateDidChange](&v3, sel_appearStateDidChange);
  if (-[PXGLayout appearState](self, "appearState") == 1)
    PXZoomablePhotosInvalidate(self, 786432);
}

- (void)visibleRectDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout visibleRectDidChange](&v5, sel_visibleRectDidChange);
  if (!self->_isPerformingUpdate)
    PXZoomablePhotosInvalidate(self, 4129056);
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlinePlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleRectDidChange");

}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  PXZoomablePhotosInvalidate(self, 16);
}

- (void)scrollSpeedRegimeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout scrollSpeedRegimeDidChange](&v3, sel_scrollSpeedRegimeDidChange);
  PXZoomablePhotosInvalidate(self, 1048836);
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  int64_t v4;
  int64_t v6;
  PXAssetsDataSource *v7;
  void *v8;
  _QWORD v9[4];

  v4 = -[PXGZoomLayout itemForSpriteIndex:](self->_zoomLayout, "itemForSpriteIndex:", -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", *(_QWORD *)&a3, self->_zoomLayout));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = v4;
  v7 = self->_currentDataSource;
  v9[0] = -[PXAssetsDataSource identifier](v7, "identifier");
  v9[1] = 0;
  v9[2] = v6;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource assetReferenceAtItemIndexPath:](v7, "assetReferenceAtItemIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  *a5 = objc_retainAutorelease(a3);
  return 0;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, _OWORD *);
  char v5;
  uint64_t v6;
  PXAssetsDataSource *v7;
  PXAssetsDataSource *currentDataSource;
  void *v9;
  uint64_t v10;
  PXAssetsDataSource *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;

  v4 = (void (**)(id, uint64_t, uint64_t, _OWORD *))a3;
  v16 = *(_OWORD *)((char *)off_1E50B8778 + 8);
  v17 = *((_QWORD *)off_1E50B8778 + 3);
  v5 = -[PXGLayout fullyVisibleEdgesWithDefaultTolerance](self, "fullyVisibleEdgesWithDefaultTolerance");
  if ((v5 & 4) == 0)
  {
    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)off_1E50B8778;
      goto LABEL_11;
    }
    currentDataSource = self->_currentDataSource;
    if (currentDataSource)
    {
      -[PXAssetsDataSource firstItemIndexPath](currentDataSource, "firstItemIndexPath");
      goto LABEL_8;
    }
LABEL_9:
    v6 = 0;
    memset(v15, 0, sizeof(v15));
    goto LABEL_10;
  }
  v7 = self->_currentDataSource;
  if (!v7)
    goto LABEL_9;
  -[PXAssetsDataSource lastItemIndexPath](v7, "lastItemIndexPath");
LABEL_8:
  v6 = *(_QWORD *)&v15[0];
LABEL_10:
  v16 = *(_OWORD *)((char *)v15 + 8);
  v17 = *((_QWORD *)&v15[1] + 1);
LABEL_11:
  if (v6 == *(_QWORD *)off_1E50B7E98)
  {
    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_17:
      v14.receiver = self;
      v14.super_class = (Class)PXZoomablePhotosLayout;
      -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](&v14, sel_enumerateVisibleAnchoringSpriteIndexesUsingBlock_, v4);
      goto LABEL_18;
    }
    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = self->_currentDataSource;
    *(_QWORD *)&v15[0] = v6;
    *(_OWORD *)((char *)v15 + 8) = v16;
    *((_QWORD *)&v15[1] + 1) = v17;
    -[PXAssetsDataSource assetReferenceAtItemIndexPath:](v11, "assetReferenceAtItemIndexPath:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;
  if (!v10)
    goto LABEL_17;
  v13 = -[PXGLayout spriteIndexForObjectReference:](self, "spriteIndexForObjectReference:", v10);
  LOBYTE(v15[0]) = 0;
  v4[2](v4, v13, 1, v15);

LABEL_18:
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  PXGZoomLayout *zoomLayout;
  char v4;

  zoomLayout = self->_zoomLayout;
  if (zoomLayout)
  {
    v4 = 0;
    (*((void (**)(id, PXGZoomLayout *, char *))a3 + 2))(a3, zoomLayout, &v4);
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v10;

  LODWORD(v3) = a3;
  v10 = -1;
  if (-[PXGLayout isSpriteIndex:decoratingSpriteWithIndex:](self, "isSpriteIndex:decoratingSpriteWithIndex:", *(_QWORD *)&a3, &v10))
  {
    v3 = v10;
  }
  else
  {
    v3 = v3;
  }
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v5);

  if ((_DWORD)v6 == -1)
    return 0;
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTestResultForSpriteIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isAnimating
{
  void *v2;
  void *v3;
  BOOL v4;
  char v6;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "zoomState");
    v4 = v6 != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)contentChangeTrend
{
  void *v3;
  void *v4;
  __int128 v6;
  __int128 v7;

  v7 = 0u;
  v6 = 0u;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zoomState");
  }
  else
  {
    v7 = 0u;
    v6 = 0u;
  }

  if (!-[PXZoomablePhotosLayout isAnimating](self, "isAnimating"))
    return 0;
  if (BYTE9(v7))
    return 3;
  if (*((double *)&v6 + 1) > 0.0)
    return 1;
  return 2;
}

- (id)itemsGeometry
{
  void *v2;
  void *v3;

  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemsGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)layoutSnapshotDataSource
{
  return self->_currentDataSource;
}

- (CGSize)_scaleForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  NSObject *v21;
  NSObject *v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  uint64_t v33;
  CGSize result;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  if (v5)
    objc_msgSend(v5, "zoomState", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", 0, v27, v28, v29, v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberOfColumns");
  objc_msgSend(v7, "rowHeight");
  objc_msgSend(v8, "numberOfColumns");
  objc_msgSend(v8, "rowHeight");
  PXSizeByLinearlyInterpolatingSize();
  PXSizeScale();
  v10 = v9;
  v12 = v11;
  v13 = 1.0 / (double)objc_msgSend(v4, "numberOfColumns");
  objc_msgSend(v4, "rowHeight");
  v15 = v14;

  v16 = v10 / v13;
  if (v15 == 0.0 || v12 == 0.0)
    v18 = v16;
  else
    v18 = v12 / v15;
  if ((*(uint64_t *)&v18 <= -1 || ((*(_QWORD *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&v18 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v18;
      _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Invalid height scale:%.3f", buf, 0xCu);
    }

  }
  if ((*(uint64_t *)&v16 <= -1 || ((*(_QWORD *)&v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&v16 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v16;
      _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "Invalid width scale:%.3f", buf, 0xCu);
    }

  }
  v25 = v16;
  v26 = v18;
  result.height = v26;
  result.width = v25;
  return result;
}

- (id)_createLayoutWithNumberOfColumns:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  PXGOneColumnLayout *v8;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableDebugLayers");

  if (v6)
    v7 = 5;
  else
    v7 = 2;
  if (a3 == 1)
  {
    v8 = objc_alloc_init(PXGOneColumnLayout);
    -[PXGOneColumnLayout setMediaKind:](v8, "setMediaKind:", v7);
    -[PXGOneColumnLayout setOverrideAspectRatioAmount:](v8, "setOverrideAspectRatioAmount:", 0.0);
    objc_storeStrong((id *)&self->_oneColLayout, v8);
  }
  else
  {
    v8 = objc_alloc_init(PXGGridLayout);
    -[PXGOneColumnLayout setMediaKind:](v8, "setMediaKind:", v7);
    -[PXGItemsLayout setLazy:](v8, "setLazy:", 1);
    -[PXGOneColumnLayout setMediaTargetSizeIgnoresSpacing:](v8, "setMediaTargetSizeIgnoresSpacing:", 1);
    -[PXGOneColumnLayout setCanHandleVisibleRectRejection:](v8, "setCanHandleVisibleRectRejection:", 1);
    -[PXGOneColumnLayout setAccessoryMediaKind:](v8, "setAccessoryMediaKind:", 10);
    -[PXGOneColumnLayout setAccessoryPresentationType:](v8, "setAccessoryPresentationType:", 1);
  }
  -[PXGOneColumnLayout setNumberOfColumns:](v8, "setNumberOfColumns:", a3);
  -[PXGLayout setContentSource:](v8, "setContentSource:", self);
  -[PXGItemsLayout setNumberOfItems:](v8, "setNumberOfItems:", -[PXAssetsDataSource numberOfItemsInSection:](self->_currentDataSource, "numberOfItemsInSection:", 0));
  -[PXGItemsLayout setDelegate:](v8, "setDelegate:", self);
  -[PXZoomablePhotosLayout _configureLayout:](self, "_configureLayout:", v8);
  return v8;
}

- (void)_configureLayout:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  uint64_t v17;
  _BOOL8 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  _BOOL8 v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;

  v60 = a3;
  -[PXZoomablePhotosLayout spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v60, "numberOfColumns");
  v6 = objc_msgSend(v4, "maxColumnsForIndividualItems");
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  -[PXZoomablePhotosLayout _interItemSpacingForLayout:](self, "_interItemSpacingForLayout:", v60);
  v9 = v8;
  v10 = -[PXZoomablePhotosLayout _layoutIsAspectFit:](self, "_layoutIsAspectFit:", v60);
  v14 = 0.0;
  if (v5 <= v6)
  {
    if (v10)
      objc_msgSend(v4, "aspectFitItemCornerRadius", 0.0);
    else
      objc_msgSend(v4, "itemCornerRadius", 0.0);
  }
  *(float *)&v14 = v14;
  LODWORD(v11) = LODWORD(v14);
  LODWORD(v12) = LODWORD(v14);
  LODWORD(v13) = LODWORD(v14);
  objc_msgSend(v60, "setItemCornerRadius:", v14, v11, v12, v13);
  objc_msgSend(v4, "itemAspectRatio");
  objc_msgSend(v60, "setItemAspectRatio:");
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFaceModeEnabled");

  v17 = objc_msgSend(v60, "numberOfColumns");
  if (v10)
  {
    if (v16)
      v18 = v17 <= objc_msgSend(v4, "maxColumnsForSaliency");
    else
      v18 = 0;
    objc_msgSend(v4, "aspectFitEdgeMargins");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = 1;
  }
  else
  {
    v18 = ((v16 & 1) != 0 || objc_msgSend(v4, "useSaliency"))
       && v17 <= objc_msgSend(v4, "maxColumnsForSaliency");
    if (v7 == 4 && v5 > v6)
    {
      v27 = 0;
      v28 = 0;
      v20 = *(double *)off_1E50B8020;
      v22 = *((double *)off_1E50B8020 + 1);
      v24 = *((double *)off_1E50B8020 + 2);
      v26 = *((double *)off_1E50B8020 + 3);
      goto LABEL_21;
    }
    objc_msgSend(v4, "squareEdgeMargins");
    v20 = v29;
    v22 = v30;
    v24 = v31;
    v26 = v32;
    v27 = 0;
  }
  if (v7 == 4)
    v28 = 0;
  else
    v28 = -[PXZoomablePhotosLayout preventFillingTopAreaInsets](self, "preventFillingTopAreaInsets") ^ 1;
LABEL_21:
  if (v5 <= v6)
  {
    -[PXZoomablePhotosLayout effectiveOverlayInsets](self, "effectiveOverlayInsets");
    v34 = v33;
    PXEdgeInsetsAdd();
    v20 = v35;
    v22 = v36;
    v24 = v37;
    v26 = v38;
    if (v34 == 0.0)
      v28 = v28;
    else
      v28 = 0;
  }
  if (objc_msgSend(v60, "supportsContentMode"))
    objc_msgSend(v60, "setContentMode:", v27);
  if (v5 > v6)
  {
    objc_msgSend(v60, "setEnablePerItemCornerRadius:", 0);
    objc_msgSend(v60, "setEnablePerItemInsets:", 0);
    -[PXZoomablePhotosLayout effectProvider](self, "effectProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setEnableEffects:", v40 != 0);

  }
  else
  {
    -[PXZoomablePhotosLayout burstStackEffect](self, "burstStackEffect");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setNumberOfItemsStackedBehind:", 2);

    objc_msgSend(v60, "setEnablePerItemCornerRadius:", 1);
    objc_msgSend(v60, "setEnablePerItemInsets:", 1);
    objc_msgSend(v60, "setEnableEffects:", 1);
  }
  objc_msgSend(v60, "setHideIncompleteLastRowOrColumn:", v5 > v6);
  objc_msgSend(v60, "setEnableBestCropRect:", v18);
  objc_msgSend(v60, "setInterItemSpacing:", v9, v9);
  -[PXZoomablePhotosLayout _itemCaptionSpacingForLayout:](self, "_itemCaptionSpacingForLayout:", v60);
  objc_msgSend(v60, "setItemCaptionSpacing:");
  objc_msgSend(v60, "setPadding:", v20, v22, v24, v26);
  objc_msgSend(v60, "setFillSafeAreaTopInset:", v28);
  if (v7 == 4)
    v41 = 2;
  else
    v41 = 1;
  objc_msgSend(v60, "setDropTargetStyle:", v41);
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dropTargetAssetReference");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDropTargetObjectReference:", v43);

  objc_msgSend(v60, "setAccessoryItemContentSource:", self);
  v44 = -[PXZoomablePhotosLayout enableAddContentAccessoryItem](self, "enableAddContentAccessoryItem");
  v45 = v5 <= v6 && v44;
  objc_msgSend(v60, "setNumberOfAccessoryItems:", v45);
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "enableTungstenKeyboardNavigation");

  if (v47)
  {
    +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v10)
    {
      v50 = objc_msgSend(v48, "allPhotosAspectFitFocusAnimationStyle");
      objc_msgSend(v49, "allPhotosAspectFitFocusPadding");
    }
    else
    {
      v50 = objc_msgSend(v48, "allPhotosAspectFillFocusAnimationStyle");
      objc_msgSend(v49, "allPhotosAspectFillFocusPadding");
    }
    objc_msgSend(v60, "setAnimationParameters:forStylableType:", v50, v51, 1);
    +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v10)
    {
      v54 = objc_msgSend(v52, "aspectFitAnimationStyle");
      objc_msgSend(v53, "allPhotosAspectFitPadding");
    }
    else
    {
      v54 = objc_msgSend(v52, "aspectFillAnimationStyle");
      objc_msgSend(v53, "allPhotosAspectFillPadding");
    }
    objc_msgSend(v60, "setAnimationParameters:forStylableType:", v54, v55, 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = 2 * (v5 <= v6);
    v57 = v60;
    objc_msgSend(v57, "setStyle:", v56);
    objc_msgSend(v57, "axGroup");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "setAxRole:", -[PXZoomablePhotosLayout bodyLayoutAXGroupRole](self, "bodyLayoutAXGroupRole"));
    if (v7 == 4)
      v59 = 9;
    else
      v59 = 0;
    objc_msgSend(v58, "setLeafFeatures:", objc_msgSend(v58, "leafFeatures") | v59);

  }
}

- (void)_configureMiniModeSpriteModifierForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXGLayoutSpriteModifier *v7;
  PXGLayoutSpriteModifier *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "miniModeAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isActive"))
  {
    objc_initWeak(&location, self);
    v7 = [PXGLayoutSpriteModifier alloc];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __68__PXZoomablePhotosLayout__configureMiniModeSpriteModifierForLayout___block_invoke;
    v12 = &unk_1E5123898;
    objc_copyWeak(&v13, &location);
    v8 = -[PXGLayoutSpriteModifier initWithStateHandler:](v7, "initWithStateHandler:", &v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "setSpriteModifier:", v8, v9, v10, v11, v12);

}

- (void)_modifyMiniModeSpritesForLayout:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 sprites:(id *)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  float *v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  double *v32;
  __objc2_class **v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float64x2_t v50;
  float64x2_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  float *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  void *v64;
  __objc2_class **v66;
  void *v67;
  PXZoomableMiniModeFoldedRow *v68;
  double v69;
  PXZoomableMiniModeFoldedRow *v70;
  id v71;
  void *v72;
  double v73;
  void *v74;
  PXZoomablePhotosLayout *v75;
  id v76;
  id v77;
  double v78;
  id v79;
  double v80;
  float64x2_t v81;
  double v82;
  double v83;
  double Height;
  double v85;
  float64_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  CGRect v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v8 = a3;
  if (objc_msgSend(v8, "numberOfItems"))
  {
    v97 = 0;
    v95 = 0u;
    v96 = 0u;
    memset(&v94, 0, sizeof(v94));
    if (-[PXZoomablePhotosLayout _getMiniModeInfo:forLayout:](self, "_getMiniModeInfo:forLayout:", &v94, v8))
    {
      v9 = HIDWORD(*(unint64_t *)&a4);
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "miniModeAnimator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = self;
      -[PXZoomablePhotosLayout spec](self, "spec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "miniModeEdgeMargins");
      var2 = a5->var2;
      objc_msgSend(v11, "gridMiniStylingPercentage");
      v15 = v14;
      if (v9)
      {
        v16 = 0xFFFFFFFFLL;
        v17 = 0.0;
        v18 = 1.79769313e308;
        while (2)
        {
          v19 = (float *)((char *)var2 + 32 * v9 - 4);
          while (1)
          {
            v20 = v9 - 1;
            v21 = *(double *)(v19 - 5) + *v19 * 0.5;
            v22 = vabdd_f64(*((double *)&v95 + 1), v21);
            if (v22 <= v18 && *v19 > 0.0)
              break;
            if ((_DWORD)v16 != -1)
              goto LABEL_14;
            v19 -= 8;
            v16 = 0xFFFFFFFFLL;
            --v9;
            if (v20 + 1 <= 1)
              goto LABEL_15;
          }
          v17 = *((double *)&v95 + 1) - v21;
          v16 = v9 - 1;
          v18 = v22;
          if (v9-- > 1)
            continue;
          break;
        }
        if ((_DWORD)v20 != -1)
        {
LABEL_14:
          v24 = objc_msgSend(v8, "itemForSpriteIndex:", v16, *((double *)&v95 + 1), 0.5);
          v16 = objc_msgSend(v8, "spriteIndexForItem:", v24 - objc_msgSend(v8, "columnForItem:", v24) + objc_msgSend(v8, "numberOfColumns"));
          goto LABEL_15;
        }
        v16 = 0xFFFFFFFFLL;
      }
      else
      {
        v16 = 0xFFFFFFFFLL;
        v17 = 0.0;
      }
LABEL_15:
      v85 = v15 * v17;
      objc_msgSend(v8, "referenceSize");
      objc_msgSend(v12, "miniModeInteritemSpacing");
      v78 = v15;
      objc_msgSend(v12, "interitemSpacing");
      v76 = v8;
      objc_msgSend(v8, "numberOfColumns");
      v25 = 1.0;
      v26 = v15;
      PXFloatByLinearlyInterpolatingFloats();
      v83 = v27;
      CGRectGetMinY(v94);
      CGRectGetMaxY(v94);
      Height = CGRectGetHeight(v94);
      v74 = v12;
      objc_msgSend(v12, "miniModeItemCornerRadius");
      objc_msgSend(v11, "gridMiniChromeVisibilityPercentage");
      v29 = v28;
      v79 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a5->var0)
      {
        v30 = 0;
        v31 = 0;
        v82 = 1.0 - v29;
        v32 = (double *)((char *)var2 + 8);
        __asm { FMOV            V0.2D, #1.0 }
        v81 = _Q0;
        v37 = off_1E50B6000;
        do
        {
          PXFloatNormalize();
          PXFloatSaturate();
          v39 = v38;
          if (v11)
          {
            v40 = v25 - v38;
            v41 = 0.0;
            if (objc_msgSend(v11, "isActive"))
              v42 = v40 * 10.0;
            else
              v42 = 0.0;
            if (v39 < v25)
            {
              if (v39 <= 0.0)
              {
                v52 = v26;
                v47 = 0;
                v49 = 0;
                v51 = v81;
              }
              else
              {
                v80 = v42;
                -[__objc2_class sharedInstance](v37[10], "sharedInstance");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "gridMiniUnfoldingPercentage");
                objc_msgSend(v43, "unfoldVerticalShiftCompensation");
                objc_msgSend(v43, "unfoldVerticalShiftCompensation");
                PXFloatProgressBetween();
                PXFloatSaturate();
                PXFloatNormalize();
                PXFloatSaturate();
                objc_msgSend(v43, "unfoldEaseOutAmount");
                PXFloatByLinearlyInterpolatingFloats();
                PXFloatDenormalize();
                objc_msgSend(v43, "unfoldInitialPercentage");
                PXFloatSaturate();
                PXFloatByLinearlyInterpolatingFloats();
                v41 = v44;
                PXFloatProgressBetween();
                PXFloatByLinearlyInterpolatingFloats();
                PXFloatByLinearlyInterpolatingFloats();
                PXFloatByLinearlyInterpolatingFloats();
                PXFloatByLinearlyInterpolatingFloats();
                v86 = v45;
                PXFloatByLinearlyInterpolatingFloats();
                v47 = v46;
                PXFloatProgressBetween();
                PXFloatSaturate();
                v25 = 1.0;
                PXFloatByLinearlyInterpolatingFloats();
                v49 = v48;
                v50.f64[0] = v81.f64[0];
                v50.f64[1] = v86;
                v87 = v50;

                v51 = v87;
                v52 = v78;
                v42 = v80;
              }
              goto LABEL_27;
            }
            v47 = 0;
            v49 = 0;
            v51 = v81;
          }
          else
          {
            v51 = 0uLL;
            v41 = 0.0;
            v42 = 0.0;
            v47 = 0;
            v49 = 0;
          }
          v52 = v26;
LABEL_27:
          v53 = *(double *)&v96;
          *(v32 - 1) = *(double *)&v95 + vmuld_lane_f64(*(v32 - 1) - *(double *)&v95, v51, 1) * *(double *)&v96;
          v54 = v82;
          if (v31 < v16)
            v54 = v25;
          v55 = v41;
          v56 = *((double *)&v95 + 1) + (v85 + *v32 - *((double *)&v95 + 1)) * v53 + v41 * Height;
          v57 = v42;
          v58 = v42 + v32[1];
          *v32 = v56;
          v32[1] = v58;
          v88 = v51;
          v59 = (float *)((char *)a5->var3 + v30);
          *(float *)&v56 = vmuld_lane_f64(v83 * v53, v51, 1) * v59[15];
          v59[15] = *(float *)&v56;
          *(float *)&v56 = v54 * v51.f64[0] * *v59;
          *v59 = *(float *)&v56;
          v26 = v52;
          v73 = v52;
          PXGCornerRadiusByLinearlyInterpolatingCornerRadii();
          *((_DWORD *)v59 + 9) = v60;
          *((_DWORD *)v59 + 10) = v61;
          *((_DWORD *)v59 + 11) = v62;
          *((_DWORD *)v59 + 12) = v63;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39, *(_QWORD *)&v73);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          _NF = v39 > 0.0 && v39 < v25;
          if (_NF && (objc_msgSend(v79, "containsObject:", v64) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
            v66 = v37;
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addObject:", v67);

            v68 = [PXZoomableMiniModeFoldedRow alloc];
            v69 = *v32;
            v89 = v88;
            v90 = v55;
            v91 = v57;
            v92 = v47;
            v93 = v49;
            v70 = -[PXZoomableMiniModeFoldedRow initWithCollapseProgress:yPosition:](v68, "initWithCollapseProgress:yPosition:", &v89, v69);
            objc_msgSend(v77, "addObject:", v70);

            v37 = v66;
          }

          ++v31;
          v30 += 160;
          v32 += 4;
        }
        while (v31 < a5->var0);
      }
      -[PXZoomablePhotosLayout primaryItemsLayout](v75, "primaryItemsLayout");
      v71 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v76;
      if (v71 == v76)
      {
        -[PXZoomablePhotosLayout setMiniModeVerticalOffset:](v75, "setMiniModeVerticalOffset:", v85);
        v72 = (void *)objc_msgSend(v77, "copy");
        -[PXZoomablePhotosLayout setMiniModeFoldedRows:](v75, "setMiniModeFoldedRows:", v72);

      }
    }
  }

}

- (BOOL)_getMiniModeInfo:(id *)a3 forLayout:(id)a4
{
  id v6;
  CGFloat v7;
  double v8;
  double v9;
  _BOOL4 miniModeIsAnchoringToBottom;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSUInteger v19;
  NSUInteger v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSUInteger v28;
  unint64_t v29;
  NSUInteger v30;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;

  v6 = a4;
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v47 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  miniModeIsAnchoringToBottom = self->_miniModeIsAnchoringToBottom;
  objc_msgSend(v6, "visibleRect");
  if (miniModeIsAnchoringToBottom)
  {
    v12 = v11 * 0.5;
    objc_msgSend(v6, "contentSize");
    v14 = v13;
  }
  else
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    PXEdgeInsetsInsetRect();
    PXPointDenormalize();
    v12 = v15;
    v14 = v16;
    objc_msgSend(v6, "contentSize");
    if (v14 >= v17)
      v14 = v17;
  }
  v18 = 1.0;
  if ((PXPointIsNull() & 1) != 0)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
  }
  else
  {
    v45 = v9;
    v46 = v8;
    objc_msgSend(v6, "referenceSize");
    v23 = v22;
    v24 = v22 / 5.0 * 5.0;
    objc_msgSend(v6, "rowHeight");
    if (v25 == 0.0)
      v26 = v23 / 5.0 * 5.0;
    else
      v26 = v25;
    if (v26 == 0.0)
      v27 = 1.5;
    else
      v27 = floor(v24 / v26) + 0.5;
    v20 = objc_msgSend(v6, "itemRangeInRect:", 0.0, v14 - v24, v23, v23 / 5.0 * 5.0);
    v19 = v28;
    v29 = objc_msgSend(v6, "loadedItems");
    if (v20 >= v29 && v20 - v29 < v30)
    {
      v33 = v14 - v26 * v27;
      objc_msgSend(v6, "visibleRect");
      v8 = v33 - (v34 - v24);
      v9 = v33 - v8;
      -[PXZoomablePhotosLayout spec](self, "spec");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "miniModeEdgeMargins");
      v37 = v36;
      v39 = v38;

      -[PXZoomablePhotosLayoutSpec miniModeInteritemSpacing](self->_spec, "miniModeInteritemSpacing");
      v41 = v37 + v39 - v40;
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "miniModeAnimator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "gridMiniStylingPercentage");
      v18 = -v41 / v23 * v44 + 1.0;

      v21 = 1;
      v7 = 0.0;
      if (a3)
        goto LABEL_20;
      goto LABEL_21;
    }
    v21 = 0;
    v9 = v45;
    v8 = v46;
  }
  v23 = v47;
  if (a3)
  {
LABEL_20:
    a3->var0.origin.x = v7;
    a3->var0.origin.y = v8;
    a3->var0.size.width = v23;
    a3->var0.size.height = v9;
    a3->var1.x = v12;
    a3->var1.y = v14;
    a3->var2 = v18;
    a3->var3.location = v20;
    a3->var3.length = v19;
  }
LABEL_21:

  return v21;
}

- (void)getLastItem:(int64_t *)a3 lastColumn:(int64_t *)a4 forBodyLayout:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = a5;
  v8 = objc_msgSend(v7, "numberOfItems");
  v9 = objc_msgSend(v7, "numberOfColumns");
  *a3 = v8 - 1;
  v10 = objc_msgSend(v7, "numberOfAccessoryItems");

  *a4 = v9 + ~(v10 % v9);
}

- (BOOL)_layoutIsAspectFit:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "aspectFit")
    && -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v4))
  {
    v6 = objc_msgSend(v4, "supportsContentMode");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_layoutAllowsCaptionsInSquare:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  char v8;

  v4 = a3;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "aspectFit");
  LODWORD(self) = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v4);

  if ((_DWORD)self)
    v7 = objc_msgSend(v5, "allowsCaptionsInSquare");
  else
    v7 = 0;
  v8 = v7 & ~v6;

  return v8;
}

- (BOOL)_layoutIsQuiteTransparent:(id)a3
{
  id v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v4 = a3;
  v5 = -[PXZoomablePhotosLayout _layoutIsAspectFit:](self, "_layoutIsAspectFit:", v4);
  objc_msgSend(v4, "itemCornerRadius");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  return fmaxf(fmaxf(v7, v9), fmaxf(v11, v13)) >= 3.0 || v5;
}

- (BOOL)_layoutHasIndividualItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PXZoomablePhotosLayout spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfColumns");

  LOBYTE(v4) = v6 <= objc_msgSend(v5, "maxColumnsForIndividualItems");
  return (char)v4;
}

- (double)_interItemSpacingForLayout:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  double v9;

  v4 = a3;
  -[PXZoomablePhotosLayout spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXZoomablePhotosLayout _layoutIsAspectFit:](self, "_layoutIsAspectFit:", v4);
  v7 = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v4);

  v8 = 0.0;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v5, "aspectFitInteritemSpacing");
LABEL_6:
      v8 = v9;
    }
  }
  else if (v7)
  {
    objc_msgSend(v5, "interitemSpacing");
    goto LABEL_6;
  }

  return v8;
}

- (double)_itemCaptionSpacingForLayout:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;

  v4 = a3;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (objc_msgSend(v5, "captionsVisible")
    && (-[PXZoomablePhotosLayout _layoutIsAspectFit:](self, "_layoutIsAspectFit:", v4)
     || -[PXZoomablePhotosLayout _layoutAllowsCaptionsInSquare:](self, "_layoutAllowsCaptionsInSquare:", v4)))
  {
    -[PXZoomablePhotosLayout spec](self, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "captionSpacing");
    v6 = v8;

  }
  return v6;
}

- (BOOL)_wantsDecorationForNumberOfColumns:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  char v7;
  BOOL v8;

  -[PXZoomablePhotosLayout spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxColumnsForBadges");

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableBadges");
  if (v5 >= a3)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_wantsMiniDecorationForNumberOfColumns:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[PXZoomablePhotosLayout spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "minColumnsForMiniBadges");

  return v5 <= a3;
}

- (void)_callAddContentActionHandler
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PXZoomablePhotosLayout addContentHandler](self, "addContentHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Missing add content handler for add button press", v5, 2u);
    }

  }
}

- (PXZoomablePhotosContentLayout)primaryItemsLayout
{
  void *v2;
  void *v3;

  -[PXGZoomLayout primaryLayer](self->_zoomLayout, "primaryLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemsLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXZoomablePhotosContentLayout *)v3;
}

- (id)presentedItemsGeometryForDataSource:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXZoomablePhotosLayout presentedDataSource](self, "presentedDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemsGeometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)invalidateItemsLayout
{
  id v2;

  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)_invalidateVisualShiftingEnsuringLastRowFilled
{
  self->_visuallyStableAnchorLastRowFilled = 1;
  PXZoomablePhotosInvalidate(self, 256);
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout willUpdate](&v7, sel_willUpdate);
  self->_preUpdateFlags.willPerformUpdate = 1;
  if (self->_preUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXZoomablePhotosLayout.m"), 1088, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_preUpdateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomablePhotosLayout.m"), 1089, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_preUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;

  self->_isPerformingUpdate = 1;
  p_preUpdateFlags = &self->_preUpdateFlags;
  self->_preUpdateFlags.willPerformUpdate = 0;
  needsUpdate = self->_preUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_preUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXZoomablePhotosLayout.m"), 1096, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_preUpdateFlags.isPerformingUpdate"));

      needsUpdate = p_preUpdateFlags->needsUpdate;
    }
    p_preUpdateFlags->isPerformingUpdate = 1;
    p_preUpdateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_preUpdateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "specManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXZoomablePhotosLayout setSpec:](self, "setSpec:", v7);

      if (!p_preUpdateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("PXZoomablePhotosLayout.m"), 1102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

      }
    }
    v8 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 2uLL;
    if ((v8 & 2) != 0)
    {
      p_preUpdateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXZoomablePhotosLayout _updateEffectProvider](self, "_updateEffectProvider");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXZoomablePhotosLayout.m"), 1106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v9 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 4uLL;
    if ((v9 & 4) != 0)
    {
      p_preUpdateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXZoomablePhotosLayout _updateEffectiveOverlayInsets](self, "_updateEffectiveOverlayInsets");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXZoomablePhotosLayout.m"), 1110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v10 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 8uLL;
    if ((v10 & 8) != 0)
    {
      p_preUpdateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
      -[PXZoomablePhotosLayout _updateLayers](self, "_updateLayers");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXZoomablePhotosLayout.m"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v11 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x10uLL;
    if ((v11 & 0x10) != 0)
    {
      p_preUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXZoomablePhotosLayout _updateZoom](self, "_updateZoom");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PXZoomablePhotosLayout.m"), 1118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v12 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x20uLL;
    if ((v12 & 0x20) != 0)
    {
      p_preUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXZoomablePhotosLayout _updateMiniMode](self, "_updateMiniMode");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PXZoomablePhotosLayout.m"), 1122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v13 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x40uLL;
    if ((v13 & 0x40) != 0)
    {
      p_preUpdateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXZoomablePhotosLayout _updateDecorationVisibility](self, "_updateDecorationVisibility");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PXZoomablePhotosLayout.m"), 1126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v14 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x80uLL;
    if ((v14 & 0x80) != 0)
    {
      p_preUpdateFlags->needsUpdate = v14 & 0xFFFFFFFFFFFFFF7FLL;
      -[PXZoomablePhotosLayout _updateDataSource](self, "_updateDataSource");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PXZoomablePhotosLayout.m"), 1130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v15 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x100uLL;
    if ((v15 & 0x100) != 0)
    {
      p_preUpdateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFFFEFFLL;
      -[PXZoomablePhotosLayout _updateVisualShifting](self, "_updateVisualShifting");
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PXZoomablePhotosLayout.m"), 1134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preUpdateFlags.isPerformingUpdate"));

    }
    v16 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x200uLL;
    if ((v16 & 0x200) != 0)
    {
      p_preUpdateFlags->needsUpdate = v16 & 0xFFFFFFFFFFFFFDFFLL;
      -[PXZoomablePhotosLayout _updateDecorationSource](self, "_updateDecorationSource");
    }
    objc_storeStrong((id *)&self->_presentedDataSource, self->_currentDataSource);
    p_preUpdateFlags->isPerformingUpdate = 0;
    if (p_preUpdateFlags->needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXZoomablePhotosLayout.m"), 1140, CFSTR("still needing to update %lu after update pass"), p_preUpdateFlags->needsUpdate);

    }
  }
  v65.receiver = self;
  v65.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout update](&v65, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v18 = self->_postUpdateFlags.needsUpdate;
  if (v18)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("PXZoomablePhotosLayout.m"), 1145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v18 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0x10000;
    if ((v18 & 0x10000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v18 & 0xFFFFFFFFFFFEFFFFLL;
      -[PXZoomablePhotosLayout _updateZoomTransforms](self, "_updateZoomTransforms");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PXZoomablePhotosLayout.m"), 1150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v19 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x20000uLL;
    if ((v19 & 0x20000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v19 & 0xFFFFFFFFFFFDFFFFLL;
      -[PXZoomablePhotosLayout _updateBackgroundSprites](self, "_updateBackgroundSprites");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("PXZoomablePhotosLayout.m"), 1154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v20 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x40000uLL;
    if ((v20 & 0x40000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v20 & 0xFFFFFFFFFFFBFFFFLL;
      -[PXZoomablePhotosLayout _updateBlurEffect](self, "_updateBlurEffect");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("PXZoomablePhotosLayout.m"), 1158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v21 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x80000uLL;
    if ((v21 & 0x80000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v21 & 0xFFFFFFFFFFF7FFFFLL;
      -[PXZoomablePhotosLayout _updatePinchEffect](self, "_updatePinchEffect");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PXZoomablePhotosLayout.m"), 1162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v22 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x100000uLL;
    if ((v22 & 0x100000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v22 & 0xFFFFFFFFFFEFFFFFLL;
      -[PXZoomablePhotosLayout _updatePrefetching](self, "_updatePrefetching");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("PXZoomablePhotosLayout.m"), 1166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v23 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((v23 & 0x200000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v23 & 0xFFFFFFFFFFDFFFFFLL;
      -[PXZoomablePhotosLayout _updateFloatingHeaderStyle](self, "_updateFloatingHeaderStyle");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("PXZoomablePhotosLayout.m"), 1170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v24 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400000uLL;
    if ((v24 & 0x400000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v24 & 0xFFFFFFFFFFBFFFFFLL;
    }
    else
    {
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "enableDebugSprites");

      if (!v26)
      {
LABEL_74:
        self->_postUpdateFlags.isPerformingUpdate = 0;
        if (p_postUpdateFlags->needsUpdate)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout update]");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("PXZoomablePhotosLayout.m"), 1174, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

        }
        goto LABEL_76;
      }
    }
    -[PXZoomablePhotosLayout _updateDebugVisualizationSprites](self, "_updateDebugVisualizationSprites");
    goto LABEL_74;
  }
LABEL_76:
  self->_isPerformingUpdate = 0;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGSplitLayout didUpdate](&v7, sel_didUpdate);
  if (self->_preUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXZoomablePhotosLayout.m"), 1181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_preUpdateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomablePhotosLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomablePhotosLayout.m"), 1182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_updateEffectProvider
{
  void *v3;
  id v4;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosLayout setEffectProvider:](self, "setEffectProvider:", v3);

}

- (void)_updateSurroundingScrollableContent
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat MinY;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxY;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 3);
  -[PXGLayout superlayout](self, "superlayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXGLayout rootLayout](self, "rootLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    -[PXGLayout superlayout](self, "superlayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sublayoutDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v22 = v3;
    v23 = v4;
    if (v8)
    {
      objc_msgSend(v8, "geometryForSublayout:", self);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }

    -[PXGLayout superlayout](self, "superlayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:fromLayout:", v12, v25, v24);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(v6, "frame");
    objc_msgSend(v6, "flexibleRegionInsets");
    PXEdgeInsetsInsetRect();
    MaxY = CGRectGetMaxY(v26);
    v27.origin.x = v14;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    v11 = MaxY - CGRectGetMaxY(v27);
    v28.origin.x = v14;
    v28.origin.y = v16;
    v28.size.width = v18;
    v28.size.height = v20;
    MinY = CGRectGetMinY(v28);

    v3 = v22;
    v4 = v23;
  }
  else
  {
    MinY = *(double *)off_1E50B8020;
    v11 = *((double *)off_1E50B8020 + 2);
  }
  self->_surroundingScrollableContent.top = MinY;
  self->_surroundingScrollableContent.left = v3;
  self->_surroundingScrollableContent.bottom = v11;
  self->_surroundingScrollableContent.right = v4;
}

- (void)_updateEffectiveOverlayInsets
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  int v36;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  -[PXZoomablePhotosLayout effectiveOverlayInsets](self, "effectiveOverlayInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v44 = v9;
  -[PXZoomablePhotosLayout overlayInsets](self, "overlayInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v40 = v16;
  -[PXGLayout visibleRect](self, "visibleRect");
  v43 = v17;
  -[PXGLayout visibleRect](self, "visibleRect");
  v19 = v18;
  -[PXGLayout visibleRect](self, "visibleRect");
  v21 = v20;
  v45 = v6;
  v46 = v8;
  v41 = v15;
  v42 = v13;
  if (-[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime"))
  {
    v22 = 0;
  }
  else
  {
    -[PXGLayout activeAnchor](self, "activeAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "isScrollingAnimationAnchor") ^ 1;

  }
  -[PXZoomablePhotosLayout effectiveOverlayInsets](self, "effectiveOverlayInsets");
  v25 = *(double *)off_1E50B8020;
  v24 = *((double *)off_1E50B8020 + 1);
  v26 = *((double *)off_1E50B8020 + 2);
  v27 = *((double *)off_1E50B8020 + 3);
  v28 = PXEdgeInsetsEqualToEdgeInsets();
  if ((v28 & 1) == 0 && v19 < v21 && v11 < v4
    || -[PXZoomablePhotosLayout isAnimating](self, "isAnimating")
    || (-[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v29,
        v29))
  {
    v30 = v44;
  }
  else
  {
    v34 = v28 ^ 1;
    if (v43 < 1.0)
    {
      v35 = v28;
    }
    else
    {
      v34 = 1;
      v35 = 1;
    }
    v36 = v34 | v22 ^ 1;
    if (v11 < v4)
      v35 = 1;
    if (v36 != 1 || v35 == 0)
    {
      v45 = v42;
      v46 = v41;
      v4 = v11;
      v30 = v40;
    }
    else
    {
      v30 = v44;
      if ((v28 & 1) == 0 && v43 >= 1.0 && v22)
      {
        if (v19 < v21)
        {
          v38 = v46;
        }
        else
        {
          v30 = v27;
          v38 = v26;
        }
        v39 = v45;
        if (v19 >= v21)
          v39 = v24;
        v45 = v39;
        v46 = v38;
        if (v19 >= v21)
          v4 = v25;
      }
    }
  }
  -[PXZoomablePhotosLayout effectiveOverlayInsets](self, "effectiveOverlayInsets");
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    -[PXGLayout rootLayout](self, "rootLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "createAnchorForVisibleAreaIgnoringEdges:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v32, "autoInvalidate");

    -[PXZoomablePhotosLayout setEffectiveOverlayInsets:](self, "setEffectiveOverlayInsets:", v4, v45, v46, v30);
  }
}

- (void)_updateLayers
{
  void *v4;
  void *v5;
  NSArray *layers;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSArray *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _BOOL4 v19;
  char isKindOfClass;
  PXGDecoratingLayout *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  NSArray *v32;
  NSArray *v33;
  NSArray *itemLayouts;
  NSArray *v35;
  PXZoomablePhotosContentLayout *v36;
  PXZoomablePhotosContentLayout *v37;
  PXZoomablePhotosContentLayout *decadesItemLayout;
  NSArray *v39;
  id v40;
  void *v41;
  SEL v42;
  void *v43;
  id obj;
  NSArray *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  PXZoomablePhotosLayout *v49;
  _QWORD v50[5];
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  layers = self->_layers;
  v7 = MEMORY[0x1E0C809B0];
  v8 = "LemonadeProfileButtonFactory" + 16;
  if (layers)
  {
    v9 = -[NSArray count](layers, "count");
    if (v9 == objc_msgSend(v5, "count"))
      goto LABEL_32;
    v42 = a2;
    layers = self->_layers;
  }
  else
  {
    v42 = a2;
  }
  v43 = v5;
  v46 = (void *)-[NSArray mutableCopy](layers, "mutableCopy");
  v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedColumns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v13)
    goto LABEL_31;
  v14 = v13;
  v15 = *(_QWORD *)v53;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v53 != v15)
        objc_enumerationMutation(obj);
      v17 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v16), "integerValue");
      v51[0] = v7;
      v51[1] = 3221225472;
      v51[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke;
      v51[3] = &__block_descriptor_40_e26_B32__0__PXGLayout_8Q16_B24l;
      v51[4] = v17;
      objc_msgSend(v46, "px_popFirstPassingTest:", v51);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        -[PXZoomablePhotosLayout _createLayoutWithNumberOfColumns:](self, "_createLayoutWithNumberOfColumns:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = -[PXZoomablePhotosLayout _wantsDecorationForNumberOfColumns:](self, "_wantsDecorationForNumberOfColumns:", v17);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (!v19 || (isKindOfClass & 1) != 0)
      {
        if (v19 || (isKindOfClass & 1) == 0)
        {
          if ((isKindOfClass & 1) == 0)
            goto LABEL_25;
          goto LABEL_16;
        }
        v25 = v18;
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_24:
            objc_msgSend(v25, "decoratedLayout");
            v18 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "removeFromSuperlayout");
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "px_descriptionForAssertionMessage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("PXZoomablePhotosLayout.m"), 1264, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layerToAdd"), v29, v41);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("PXZoomablePhotosLayout.m"), 1264, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layerToAdd"), v29);
        }

        goto LABEL_24;
      }
      objc_msgSend(v18, "removeFromSuperlayout");
      v21 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v18);
      -[PXGDecoratingLayout setDecorationSource:](v21, "setDecorationSource:", self->_assetDecorationSource);
      v7 = MEMORY[0x1E0C809B0];
      -[PXGDecoratingLayout setContentSource:](v21, "setContentSource:", self->_assetDecorationSource);
      -[PXGDecoratingLayout setAppliesAlphaToSublayouts:](v21, "setAppliesAlphaToSublayouts:", 0);

      v18 = v21;
LABEL_16:
      v22 = -[PXZoomablePhotosLayout _wantsMiniDecorationForNumberOfColumns:](self, "_wantsMiniDecorationForNumberOfColumns:", v17);
      v18 = v18;
      objc_msgSend(v18, "setDecorationSizeClass:", v22);
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "wantsAssetIndexBadge");

      if (v24)
        objc_msgSend(v18, "addActiveDecorations:", &unk_1E53E93F0);

LABEL_25:
      -[NSArray addObject:](v10, "addObject:", v18);
      objc_msgSend(v18, "itemsLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v45, "addObject:", v26);

      ++v16;
    }
    while (v14 != v16);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    v14 = v31;
  }
  while (v31);
LABEL_31:

  v32 = self->_layers;
  self->_layers = v10;
  v33 = v10;

  itemLayouts = self->_itemLayouts;
  self->_itemLayouts = v45;
  v35 = v45;

  PXZoomablePhotosInvalidate(self, 16);
  v36 = self->_itemLayoutByHeaderLevel[0];
  self->_itemLayoutByHeaderLevel[0] = 0;

  v37 = self->_itemLayoutByHeaderLevel[1];
  self->_itemLayoutByHeaderLevel[1] = 0;
  v7 = MEMORY[0x1E0C809B0];

  decadesItemLayout = self->_decadesItemLayout;
  self->_decadesItemLayout = 0;

  v50[0] = v7;
  v8 = "uttonFactory";
  v50[1] = 3221225472;
  v50[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke_255;
  v50[3] = &unk_1E51238E0;
  v50[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v35, "enumerateObjectsUsingBlock:", v50);

  v5 = v43;
LABEL_32:
  v39 = self->_itemLayouts;
  v47[0] = v7;
  v47[1] = *((_QWORD *)v8 + 7);
  v47[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke_2;
  v47[3] = &unk_1E5123908;
  v48 = v5;
  v49 = self;
  v40 = v5;
  -[NSArray enumerateObjectsUsingBlock:](v39, "enumerateObjectsUsingBlock:", v47);
  PXZoomablePhotosInvalidate(self, 96);

}

- (void)_updateZoom
{
  void *v3;
  void *v4;
  PXGZoomLayout *v5;
  NSArray *v6;
  PXAssetsDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  PXGZoomLayout *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  char v29;
  PXAssetsDataSource *currentDataSource;
  void *v31;
  void *v32;
  void *v33;
  int *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  PXGAnchor *anchor;
  char v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  unint64_t v64;
  PXGAnchor *v65;
  CGPoint v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  PXAssetsDataSource *v82;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  unint64_t v88;
  unint64_t v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  PXAssetsDataSource *v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  NSArray *v120;
  void *v121;
  PXGZoomLayout *v122;
  void *v123;
  uint64_t v124;
  NSArray *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  _BOOL4 v131;
  NSDateInterval *lastReturnedDateInterval;
  NSArray *lastReturnedLocationNames;
  uint64_t v134;
  PXZoomablePhotosContentLayout *v135;
  uint64_t v136;
  double v137;
  _BOOL4 v138;
  _BOOL4 v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  PXZoomablePhotosContentLayout *v143;
  uint64_t v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  uint64_t v152;
  PXZoomablePhotosContentLayout *v153;
  PXZoomablePhotosContentLayout *v154;
  int v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t i;
  PXZoomablePhotosContentLayout *v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  _BOOL4 v174;
  double v176;
  void *v177;
  PXZoomablePhotosContentLayout *v178;
  BOOL v179;
  _BOOL4 v180;
  int v181;
  void *v182;
  PXZoomablePhotosContentLayout *v183;
  PXZoomablePhotosContentLayout *v184;
  PXZoomablePhotosContentLayout *v185;
  PXZoomableInlineHeadersLayout *v186;
  void *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  int v194;
  uint64_t v195;
  double v196;
  double v197;
  PXNumberAnimator *decorationAlphaAnimator;
  void *v199;
  BOOL v200;
  void *v201;
  char v202;
  NSArray *v203;
  PXAssetsDataSource *v204;
  void *v205;
  void *v206;
  void *v207;
  int v208;
  uint64_t v209;
  void *v210;
  PXZoomablePhotosContentLayout *v211;
  PXGZoomLayout *v212;
  _QWORD v213[4];
  char v214;
  _QWORD v215[5];
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  uint64_t v240;
  CGAffineTransform v241;
  _BYTE v242[128];
  _BYTE v243[128];
  _QWORD v244[3];
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;

  v244[1] = *MEMORY[0x1E0C80C00];
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v240 = 0;
  v238 = 0u;
  v239 = 0u;
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  if (v3)
  {
    objc_msgSend(v3, "zoomState");
    v208 = BYTE8(v237);
  }
  else
  {
    v208 = 0;
  }
  v5 = self->_zoomLayout;
  v6 = self->_layers;
  v7 = self->_currentDataSource;
  -[PXZoomablePhotosLayout oneColLayout](self, "oneColLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[NSArray count](self->_itemLayouts, "count") >= 2)
    {
      -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, "numberOfColumns");
        PXFloatProgressBetween();

      }
    }
    PXFloatSaturate();
    objc_msgSend(v8, "setOverrideAspectRatioAmount:", 1.0 - v11);
  }
  v201 = v8;
  -[PXGZoomLayout primaryLayer](v5, "primaryLayer");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "itemsLayout");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v14 = *((double *)&v234 + 1) != v13 || *(double *)&v234 != *MEMORY[0x1E0C9D538];
  v200 = v14;
  v15 = !self->_wasTracking && v14;
  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference", v234);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v4;
  v203 = v6;
  v204 = v7;
  if (v16)
  {
    objc_msgSend(v4, "anchorAssetReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v5;
      -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "anchorAssetReference");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v22)
        v23 = 1;
      else
        v23 = objc_msgSend(v20, "isEqual:", v22);
      v24 = v23 ^ 1;

      v4 = v207;
      v5 = v18;
      v6 = v203;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  if (BYTE8(v237))
  {
    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v4, "layoutExtendsContentBelowBounds");
    if (!v26)
    {
      v202 = v29;
      if (v28 && v24 | v15)
      {
        currentDataSource = self->_currentDataSource;
        objc_msgSend(v4, "anchorAssetReference");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetsDataSource assetReferenceForAssetReference:](currentDataSource, "assetReferenceForAssetReference:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = v205;
        v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
        if (v32)
        {
          objc_msgSend(v206, "visibleRect");
          PXPointDenormalize();
          if (!BYTE9(v237))
          {
            objc_msgSend(v32, "indexPath");
            objc_msgSend(v205, "frameForItem:", v229);
            PXRectGetCenter();
          }
          objc_msgSend(v32, "indexPath");
          objc_msgSend(v205, "frameForItem:", v228);
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v227 = 0;
          v225 = 0u;
          v226 = 0u;
          v224 = 0u;
          -[PXZoomablePhotosLayout _spriteTransformForLayout:](self, "_spriteTransformForLayout:", v206);
          memset(&v241, 0, sizeof(v241));
          v245.origin.x = v36;
          v245.origin.y = v38;
          v245.size.width = v40;
          v245.size.height = v42;
          CGRectApplyAffineTransform(v245, &v241);
          PXPointNormalize();
          v44 = v43;
          v46 = v45;
          PXGAssertErrValidPoint();
          self->_normalizedScaleCenterInAnchorSprite.x = v44;
          self->_normalizedScaleCenterInAnchorSprite.y = v46;
          objc_msgSend(v206, "visibleRect");
          PXPointSubtract();
          self->_scaleCenterTargetInViewport.x = v47;
          self->_scaleCenterTargetInViewport.y = v48;
          -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", v32);
          -[PXGAnchor invalidate](self->_anchor, "invalidate");
          anchor = self->_anchor;
          self->_anchor = 0;

          -[PXZoomablePhotosLayout _performAnchorAlignmentVisualShiftWithBaseLayout:](self, "_performAnchorAlignmentVisualShiftWithBaseLayout:", v205);
        }

      }
      else
      {
        v33 = v205;
        v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
      }
      goto LABEL_66;
    }
    v51 = -[PXGLayout createFenceWithType:](self, "createFenceWithType:", 0);
    -[PXZoomablePhotosLayout _updateSurroundingScrollableContent](self, "_updateSurroundingScrollableContent");
    objc_msgSend(v206, "visibleRect", v234);
    PXPointDenormalize();
    v53 = v52;
    v55 = v54;
    objc_msgSend(v4, "anchorAssetReference");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsDataSource assetReferenceForAssetReference:](v204, "assetReferenceForAssetReference:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v33 = v205;
      if (!BYTE9(v237))
      {
        objc_msgSend(v57, "indexPath");
        objc_msgSend(v205, "frameForItem:", v231);
        PXRectGetCenter();
      }
      -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", v57);
      v202 = 1;
      v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
      goto LABEL_39;
    }
    v33 = v205;
    if ((-[PXAssetsDataSource containsAnyItems](v204, "containsAnyItems") & 1) == 0)
    {
      -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", 0);
      v59 = 0.5;
      v202 = 1;
      v61 = 0.5;
      v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
      goto LABEL_65;
    }
    v224 = 0u;
    v225 = 0u;
    v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
    if (v204)
    {
      -[PXAssetsDataSource firstItemIndexPath](v204, "firstItemIndexPath");
      memset(&v241, 0, 32);
      -[PXAssetsDataSource lastItemIndexPath](v204, "lastItemIndexPath");
      v64 = v225;
    }
    else
    {
      v64 = 0;
      memset(&v241, 0, 32);
    }
    v68 = objc_msgSend(v205, "loadedItems");
    if (v64 < v68)
      goto LABEL_52;
    if (v64 - v68 >= v69)
      goto LABEL_52;
    objc_msgSend(v205, "frameForItem:", (_QWORD)v225);
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    objc_msgSend(v206, "visibleRect");
    v252.origin.x = v78;
    v252.origin.y = v79;
    v252.size.width = v80;
    v252.size.height = v81;
    v246.origin.x = v71;
    v246.origin.y = v73;
    v246.size.width = v75;
    v246.size.height = v77;
    if (CGRectIntersectsRect(v246, v252))
    {
      v82 = self->_currentDataSource;
      v232 = v224;
      v233 = v225;
      -[PXAssetsDataSource assetReferenceAtItemIndexPath:](v82, "assetReferenceAtItemIndexPath:", &v232);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "frameForItem:", (_QWORD)v225);
      x = v247.origin.x;
      y = v247.origin.y;
      width = v247.size.width;
      height = v247.size.height;
      CGRectGetMidX(v247);
      v248.origin.x = x;
      v248.origin.y = y;
      v248.size.width = width;
      v248.size.height = height;
      MinY = CGRectGetMinY(v248);
    }
    else
    {
LABEL_52:
      v88 = objc_msgSend(v205, "loadedItems");
      if (*(_QWORD *)&v241.c >= v88 && *(_QWORD *)&v241.c - v88 < v89)
      {
        objc_msgSend(v205, "frameForItem:", *(_QWORD *)&v241.c);
        v91 = v90;
        v93 = v92;
        v95 = v94;
        v97 = v96;
        objc_msgSend(v206, "visibleRect");
        v253.origin.x = v98;
        v253.origin.y = v99;
        v253.size.width = v100;
        v253.size.height = v101;
        v249.origin.x = v91;
        v249.origin.y = v93;
        v249.size.width = v95;
        v249.size.height = v97;
        if (CGRectIntersectsRect(v249, v253))
        {
          v102 = self->_currentDataSource;
          v232 = *(_OWORD *)&v241.a;
          v233 = *(_OWORD *)&v241.c;
          -[PXAssetsDataSource assetReferenceAtItemIndexPath:](v102, "assetReferenceAtItemIndexPath:", &v232);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "frameForItem:", *(_QWORD *)&v241.c);
          v103 = v250.origin.x;
          v104 = v250.origin.y;
          v105 = v250.size.width;
          v106 = v250.size.height;
          CGRectGetMidX(v250);
          v251.origin.x = v103;
          v251.origin.y = v104;
          v251.size.width = v105;
          v251.size.height = v106;
          CGRectGetMaxY(v251);
          objc_msgSend(v206, "contentSize");
          v108 = v107;
          -[PXGLayout visibleRect](self, "visibleRect");
          MinY = v109 * 1.5;
          v110 = v108 <= v109 * 1.5;
LABEL_62:
          v202 = v110;
          -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", v57, MinY);
          if (v57)
          {
LABEL_39:
            objc_msgSend(v57, "indexPath");
            objc_msgSend(v33, "frameForItem:", v230);
            PXPointNormalize();
            v59 = v58;
            v61 = v60;
            objc_msgSend(v206, "visibleRect");
            PXPointSubtract();
            v12 = v62;
            v13 = v63;

LABEL_65:
            self->_scaleCenterTargetInViewport.x = v12;
            self->_scaleCenterTargetInViewport.y = v13;
            self->_normalizedScaleCenterInAnchorSprite.x = v59;
            self->_normalizedScaleCenterInAnchorSprite.y = v61;
            goto LABEL_66;
          }
          v59 = 0.5;
LABEL_64:
          v61 = 0.5;
          goto LABEL_65;
        }
      }
      v111 = objc_msgSend(v205, "itemClosestTo:", v53, v55);
      if (v111 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", 0);
        v59 = 0.5;
        v202 = 1;
        goto LABEL_64;
      }
      v112 = v111;
      v232 = (unint64_t)-[PXAssetsDataSource identifier](v204, "identifier");
      *(_QWORD *)&v233 = v112;
      *((_QWORD *)&v233 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      -[PXAssetsDataSource assetReferenceAtItemIndexPath:](v204, "assetReferenceAtItemIndexPath:", &v232);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v113;
      if (v113)
        v114 = v113;

    }
    v110 = 1;
    goto LABEL_62;
  }
  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend(v4, "layoutExtendsContentBelowBounds");
  v202 = v50;
  v33 = v205;
  v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
  if (v27)
  {
    -[PXZoomablePhotosLayout _ensureZoomingAnchor](self, "_ensureZoomingAnchor");
    v65 = self->_anchor;
    self->_anchor = 0;

    v66 = *(CGPoint *)off_1E50B8580;
    self->_scaleCenterTargetInViewport = *(CGPoint *)off_1E50B8580;
    self->_normalizedScaleCenterInAnchorSprite = v66;
    -[PXZoomablePhotosLayout setAnchorAssetReference:](self, "setAnchorAssetReference:", 0);
    -[PXZoomablePhotosLayout visualAnchorAssetReferenceItemByLayout](self, "visualAnchorAssetReferenceItemByLayout");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "removeAllObjects");

    v202 = 0;
  }
LABEL_66:
  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGZoomLayout setAnchorObjectReference:](self->_zoomLayout, "setAnchorObjectReference:", v115);

  -[PXZoomablePhotosLayout scaleCenterTargetInViewport](self, "scaleCenterTargetInViewport");
  -[PXGZoomLayout setAnchorViewportCenter:](self->_zoomLayout, "setAnchorViewportCenter:");
  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v116)
    -[PXZoomablePhotosLayout _ensureZoomingAnchor](self, "_ensureZoomingAnchor");
  -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", *((_QWORD *)&v236 + 1));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGZoomLayout layers](v5, "layers");
  v118 = objc_claimAutoreleasedReturnValue();
  v119 = (void *)v118;
  if (v208)
  {
    v120 = v6;
    v121 = (void *)v118;
    v122 = v5;
    -[PXGZoomLayout layers](v5, "layers");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "count");
    v125 = v120;
    v126 = -[NSArray count](v120, "count");

    if (v124 == v126)
    {
      v127 = (uint64_t)v121;
    }
    else
    {
      v127 = (uint64_t)v121;
      if (v116)
      {
        -[PXZoomablePhotosLayout _performAnchorAlignmentVisualShiftWithBaseLayout:](self, "_performAnchorAlignmentVisualShiftWithBaseLayout:", v33);
        -[NSArray sortedArrayUsingComparator:](v125, "sortedArrayUsingComparator:", &__block_literal_global_257);
        v128 = objc_claimAutoreleasedReturnValue();

        -[NSMutableSet removeAllObjects](self->_itemLayoutsAllowedToLoad, "removeAllObjects");
        v127 = v128;
      }
    }
    v34 = &OBJC_IVAR___PXPhotosMutableResultRecord__curationLength;
    v5 = v122;
  }
  else
  {
    v244[0] = v117;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 1);
    v127 = objc_claimAutoreleasedReturnValue();

  }
  -[PXGZoomLayout primaryLayer](v5, "primaryLayer");
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117 != v129)
  {
    PXZoomablePhotosInvalidate(self, 512);
    objc_msgSend(v117, "itemsLayout");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v130);

    if (v131)
    {
      lastReturnedDateInterval = self->_lastReturnedDateInterval;
      self->_lastReturnedDateInterval = 0;

      lastReturnedLocationNames = self->_lastReturnedLocationNames;
      self->_lastReturnedLocationNames = 0;

    }
  }
  v212 = v5;
  v199 = (void *)v127;
  v210 = v117;
  -[PXGZoomLayout setLayers:primaryLayer:](v5, "setLayers:primaryLayer:", v127, v117);
  v134 = v34[343];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v134), "objectAtIndexedSubscript:", (_QWORD)v238);
  v135 = (PXZoomablePhotosContentLayout *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v134), "objectAtIndexedSubscript:", *((_QWORD *)&v238 + 1));
  v136 = objc_claimAutoreleasedReturnValue();
  v137 = *((double *)&v239 + 1);
  v138 = -[PXZoomablePhotosLayout _layoutIsQuiteTransparent:](self, "_layoutIsQuiteTransparent:", v135);
  v211 = (PXZoomablePhotosContentLayout *)v136;
  v139 = -[PXZoomablePhotosLayout _layoutIsQuiteTransparent:](self, "_layoutIsQuiteTransparent:", v136);
  v220 = 0u;
  v221 = 0u;
  v222 = 0u;
  v223 = 0u;
  v209 = v134;
  v140 = *(id *)((char *)&self->super.super.super.isa + v134);
  v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v220, v243, 16);
  if (v141)
  {
    v142 = v141;
    v143 = 0;
    v144 = *(_QWORD *)v221;
    v145 = 2.0 - v137;
    if (!v139)
      v145 = 1.0;
    v146 = v137 * v145;
    if (v138)
      v147 = v146;
    else
      v147 = 1.0;
    if (v138 && v139)
      v148 = v137;
    else
      v148 = 1.0;
    v149 = 1.0 - v137 * v148;
    v150 = 0.0;
    v151 = 0.0;
    do
    {
      v152 = 0;
      v153 = v143;
      do
      {
        if (*(_QWORD *)v221 != v144)
          objc_enumerationMutation(v140);
        v154 = *(PXZoomablePhotosContentLayout **)(*((_QWORD *)&v220 + 1) + 8 * v152);
        if (v154 == v135)
        {
          v156 = v149;
          if (!v138)
          {
            -[PXZoomablePhotosLayout _interItemSpacingForLayout:](self, "_interItemSpacingForLayout:", v135);
            v150 = v149 * v157;
            v156 = v149;
          }
        }
        else if (v154 == v211)
        {
          if (!v139)
          {
            -[PXZoomablePhotosLayout _interItemSpacingForLayout:](self, "_interItemSpacingForLayout:");
            v159 = v147 * v158;
            if (v150 < v159)
              v150 = v159;
          }
          v156 = v147;
        }
        else
        {
          v155 = v153 != v211 || v139;
          if (v155 | v138)
            v156 = 0.0;
          else
            v156 = 1.0;
        }
        -[PXZoomablePhotosContentLayout setAlpha:](v154, "setAlpha:", v156);
        PXFloatSaturate();
        -[PXZoomablePhotosContentLayout setAccessoryAlpha:](v154, "setAccessoryAlpha:");
        if (v156 > 0.0)
          -[NSMutableSet addObject:](self->_itemLayoutsAllowedToLoad, "addObject:", v154);
        v143 = v154;

        if (v151 < v156)
          v151 = v156;
        ++v152;
        v153 = v143;
      }
      while (v142 != v152);
      v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v220, v243, 16);
    }
    while (v142);
  }
  else
  {
    v143 = 0;
  }

  -[PXGLayout displayScale](self, "displayScale");
  PXFloatRoundToPixel();
  if (v160 >= 1.0 || v160 <= 0.0)
    v162 = v160;
  else
    v162 = 1.0;
  v216 = 0u;
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v163 = *(id *)((char *)&self->super.super.super.isa + v209);
  v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v216, v242, 16);
  if (v164)
  {
    v165 = v164;
    v166 = *(_QWORD *)v217;
    do
    {
      for (i = 0; i != v165; ++i)
      {
        if (*(_QWORD *)v217 != v166)
          objc_enumerationMutation(v163);
        v168 = *(PXZoomablePhotosContentLayout **)(*((_QWORD *)&v216 + 1) + 8 * i);
        -[PXZoomablePhotosLayout _scaleForLayout:](self, "_scaleForLayout:", v168);
        v170 = v169;
        if (v168 == v135)
        {
          -[PXZoomablePhotosLayout _interItemSpacingForLayout:](self, "_interItemSpacingForLayout:", v135);
        }
        else
        {
          -[PXZoomablePhotosContentLayout alpha](v168, "alpha");
          if (v171 == 0.0)
          {
            v176 = 0.0;
          }
          else
          {
            -[PXZoomablePhotosLayout _interItemSpacingForLayout:](self, "_interItemSpacingForLayout:", v168);
            v173 = v172;
            v174 = -[PXZoomablePhotosLayout _layoutIsAspectFit:](self, "_layoutIsAspectFit:", v168);
            if (v162 < v173 || v174)
              v176 = v173;
            else
              v176 = v162;
          }
        }
        -[PXZoomablePhotosContentLayout setInterItemSpacing:](v168, "setInterItemSpacing:", v176 / v170, v176 / v170);
        if (-[PXGLayout numberOfSublayouts](v212, "numberOfSublayouts") < 2)
        {
          v179 = 0;
        }
        else
        {
          -[PXZoomablePhotosContentLayout anchorObjectReference](v168, "anchorObjectReference");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          if (v177)
          {
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v209), "lastObject");
            v178 = (PXZoomablePhotosContentLayout *)objc_claimAutoreleasedReturnValue();
            v179 = v168 == v178 && !self->_scrolledWhileAnimatingZoom;

          }
          else
          {
            v179 = 0;
          }

        }
        v180 = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v168);
        -[PXZoomablePhotosContentLayout setSpriteInfoFlags:](v168, "setSpriteInfoFlags:", 0);
        -[PXZoomablePhotosContentLayout setSpriteInfoFlags:](v168, "setSpriteInfoFlags:", (-[PXZoomablePhotosContentLayout spriteInfoFlags](v168, "spriteInfoFlags") | v179));
        if (v180)
          v181 = 0;
        else
          v181 = 16;
        -[PXZoomablePhotosContentLayout setSpriteInfoFlags:](v168, "setSpriteInfoFlags:", -[PXZoomablePhotosContentLayout spriteInfoFlags](v168, "spriteInfoFlags") | v181);
        -[PXZoomablePhotosContentLayout anchorObjectReference](v168, "anchorObjectReference");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        if (v182)
        {
          objc_msgSend(v210, "itemsLayout");
          v183 = (PXZoomablePhotosContentLayout *)objc_claimAutoreleasedReturnValue();
          -[PXZoomablePhotosContentLayout setLoadItemsOutsideAnchorViewport:](v168, "setLoadItemsOutsideAnchorViewport:", v168 == v183);

        }
        else
        {
          -[PXZoomablePhotosContentLayout setLoadItemsOutsideAnchorViewport:](v168, "setLoadItemsOutsideAnchorViewport:", 0);
        }

      }
      v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v216, v242, 16);
    }
    while (v165);
  }

  v184 = self->_itemLayoutByHeaderLevel[0];
  v185 = self->_itemLayoutByHeaderLevel[1];
  v186 = self->_inlineHeadersLayout;
  objc_msgSend(v207, "miniModeAnimator");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "gridMiniStylingPercentage");
  PXFloatSaturate();
  v189 = v188;

  if (v184 == v211)
    v190 = v137;
  else
    v190 = 0.0;
  if (v184 == v135)
    v190 = 1.0 - v137;
  -[PXZoomableInlineHeadersLayout setYearsAlpha:](v186, "setYearsAlpha:", v190 * v189);
  if (v185 == v211)
    v191 = v137;
  else
    v191 = 0.0;
  if (v185 == v135)
    v191 = 1.0 - v137;
  -[PXZoomableInlineHeadersLayout setMonthsAlpha:](v186, "setMonthsAlpha:", v191 * v189);
  self->_wasTracking = v200;
  PXZoomablePhotosInvalidate(self, 0x10000);
  if (!v208)
  {
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "saveCurrentZoomLevelAsUserPreferredIfPossible");

  }
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v193, "hideBadgesDuringZoom");

  v195 = MEMORY[0x1E0C809B0];
  if (v194)
  {
    -[PXNumberAnimator value](self->_decorationAlphaAnimator, "value");
    v196 = 1.0;
    if (v208 && (BYTE10(v237) || fabs(*(double *)&v235 + -1.0) >= 0.001))
      v196 = 0.0;
    -[PXNumberAnimator value](self->_decorationAlphaAnimator, "value");
    if (v197 != v196)
    {
      decorationAlphaAnimator = self->_decorationAlphaAnimator;
      v215[0] = v195;
      v215[1] = 3221225472;
      v215[2] = __37__PXZoomablePhotosLayout__updateZoom__block_invoke_2;
      v215[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
      *(double *)&v215[4] = v196;
      -[PXNumberAnimator performChangesWithDuration:curve:changes:](decorationAlphaAnimator, "performChangesWithDuration:curve:changes:", 1, v215, 0.2);
    }
  }
  v213[0] = v195;
  v213[1] = 3221225472;
  v213[2] = __37__PXZoomablePhotosLayout__updateZoom__block_invoke_3;
  v213[3] = &__block_descriptor_33_e69_v16__0__PXZoomablePhotosViewModel_PXMutableZoomablePhotosViewModel__8l;
  v214 = v202;
  objc_msgSend(v207, "performChanges:", v213);
  PXZoomablePhotosInvalidate(self, 131136);

}

- (void)_updateMiniMode
{
  void *v3;
  BOOL v4;
  NSArray *miniModeFoldedRows;
  NSArray *itemLayouts;
  id v7;
  id v8;
  _QWORD v9[5];

  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "miniModeAnimator");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isContentAnimating") & 1) == 0 && !objc_msgSend(v7, "targetState"))
  {
    self->_miniModeVerticalOffset = 0.0;
    miniModeFoldedRows = self->_miniModeFoldedRows;
    self->_miniModeFoldedRows = 0;

    v4 = 0;
    goto LABEL_6;
  }
  if ((-[PXGLayout anchoredContentEdges](self, "anchoredContentEdges", v7) & 4) != 0)
  {
    v4 = 1;
LABEL_6:
    self->_miniModeIsAnchoringToBottom = v4;
  }
  itemLayouts = self->_itemLayouts;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PXZoomablePhotosLayout__updateMiniMode__block_invoke;
  v9[3] = &unk_1E51238E0;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](itemLayouts, "enumerateObjectsUsingBlock:", v9, v7);
  PXZoomablePhotosInvalidate(self, 0x40000);

}

- (void)_updateDecorationVisibility
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSArray *itemLayouts;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hideBadgesDuringZoom");

  v5 = 1.0;
  v6 = 1.0;
  if (v4)
  {
    -[PXNumberAnimator presentationValue](self->_decorationAlphaAnimator, "presentationValue");
    v6 = v7;
    -[PXNumberAnimator value](self->_decorationAlphaAnimator, "value");
    v5 = v8;
  }
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "miniModeAnimator");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "gridMiniChromeVisibilityPercentage");
  PXFloatSaturate();
  v11 = v6 * v10;
  v12 = v5 * v10;
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  itemLayouts = self->_itemLayouts;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__PXZoomablePhotosLayout__updateDecorationVisibility__block_invoke;
  v17[3] = &unk_1E5123990;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  v15 = v13;
  -[NSArray enumerateObjectsUsingBlock:](itemLayouts, "enumerateObjectsUsingBlock:", v17);

}

- (void)_updateVisualShifting
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  char v21;
  int64_t visuallyStableAnchorItem;
  int64_t visuallyStableAnchorItemDesiredColumn;
  double v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  BOOL v30;
  PXZoomablePhotosLayout *v31;
  void *v32;
  BOOL v33;
  unint64_t v34;
  int64_t v35;
  int64_t v36;
  CGRect v37;

  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");
  v5 = objc_msgSend(v3, "numberOfColumns");
  if (!v4)
    goto LABEL_37;
  v6 = v5;
  if (!v5)
    goto LABEL_37;
  -[PXGLayout visibleRect](self, "visibleRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v35 = 0;
  v36 = 0;
  -[PXZoomablePhotosLayout getLastItem:lastColumn:forBodyLayout:](self, "getLastItem:lastColumn:forBodyLayout:", &v36, &v35, v3);
  v15 = -[PXZoomablePhotosLayout _hasLastRowFilledStrategy](self, "_hasLastRowFilledStrategy");
  if (v15 && v4 < v6)
  {
    v35 = 0;
    v36 = 0;
  }
  if (!self->_performedInitialVisualShift)
  {
    self->_performedInitialVisualShift = 1;
    if ((v15 | -[PXAssetsDataSource startsAtEnd](self->_currentDataSource, "startsAtEnd")) != 1)
      goto LABEL_34;
    -[PXGLayout activeAnchor](self, "activeAnchor");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = -[PXGLayout anchoredContentEdges](self, "anchoredContentEdges");

      if ((v21 & 4) == 0)
        goto LABEL_34;
    }
LABEL_14:
    visuallyStableAnchorItemDesiredColumn = v35;
    visuallyStableAnchorItem = v36;
LABEL_32:
    v31 = self;
    v32 = v3;
LABEL_33:
    -[PXZoomablePhotosLayout _performVisualShiftWithLayout:movingItem:toColumn:](v31, "_performVisualShiftWithLayout:movingItem:toColumn:", v32, visuallyStableAnchorItem, visuallyStableAnchorItemDesiredColumn, v35);
    goto LABEL_34;
  }
  if (!-[PXZoomablePhotosLayout isAnimating](self, "isAnimating"))
  {
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shiftingRequiredScreensTopDistance");
    v18 = v17;

    if (v15)
    {
      if (!self->_visuallyStableAnchorLastRowFilled)
        goto LABEL_34;
      goto LABEL_14;
    }
    v24 = v10 / v14;
    visuallyStableAnchorItem = self->_visuallyStableAnchorItem;
    if (visuallyStableAnchorItem != 0x7FFFFFFFFFFFFFFFLL && (v24 > v18 || self->_visuallyStableAnchorAllowedCloseToTop))
    {
      visuallyStableAnchorItemDesiredColumn = self->_visuallyStableAnchorItemDesiredColumn;
      goto LABEL_32;
    }
    if (-[PXGLayout anchoredContentEdges](self, "anchoredContentEdges", v35) == 4)
      goto LABEL_34;
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    if (CGRectIsEmpty(v37) || !objc_msgSend(v3, "visualItemShift"))
      goto LABEL_34;
    v25 = -[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime");
    v26 = objc_msgSend(v3, "columnForItem:", v36);
    v27 = v35;
    v28 = objc_msgSend(v3, "visualItemShift");
    if (v25 < 3)
    {
      if (v25 != 2 || (v24 < 1.0 ? (v33 = v28 <= 0) : (v33 = 1), v33))
      {
        if (v25)
          goto LABEL_34;
        if (v24 >= 1.0)
          goto LABEL_34;
        if (v28 < 1)
          goto LABEL_34;
        objc_msgSend(v3, "itemRangeInRect:", v8, v10, v12, v14);
        if (v4 > v34)
          goto LABEL_34;
      }
    }
    else
    {
      v30 = v24 < v18 || v26 != v27;
      if (self->_scrolledWhileAnimatingZoom || !v30)
        goto LABEL_34;
    }
    v31 = self;
    v32 = v3;
    visuallyStableAnchorItem = 0;
    visuallyStableAnchorItemDesiredColumn = 0;
    goto LABEL_33;
  }
LABEL_34:
  if (!-[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime", v35))
    self->_scrolledWhileAnimatingZoom = 0;
  self->_visuallyStableAnchorItem = 0x7FFFFFFFFFFFFFFFLL;
  self->_visuallyStableAnchorItemDesiredColumn = 0;
  self->_visuallyStableAnchorAllowedCloseToTop = 0;
  self->_visuallyStableAnchorLastRowFilled = 0;
LABEL_37:

}

- (void)_updateDataSource
{
  PXAssetsDataSourceManager *v3;
  PXAssetsDataSource **p_currentDataSource;
  PXAssetsDataSource *v5;
  PXAssetsDataSource *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  void *v35;
  void *v36;
  void *v37;
  NSMapTable *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  PXAssetsDataSourceManager *v58;
  void *v59;
  void *v60;
  PXZoomablePhotosLayout *v61;
  PXAssetsDataSource *v62;
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
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = self->_dataSourceManager;
  p_currentDataSource = &self->_currentDataSource;
  v5 = self->_currentDataSource;
  -[PXAssetsDataSourceManager dataSource](v3, "dataSource");
  v6 = (PXAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  v62 = v5;
  if (v5 != v6)
  {
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v81 = 0;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    if (v7)
      objc_msgSend(v7, "zoomState");
    -[PXZoomablePhotosLayout spec](self, "spec");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsDataSourceManager changeHistory](v3, "changeHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v62, "identifier"), -[PXAssetsDataSource identifier](v6, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "loadedItems");
    if (v13)
      v14 = v12;
    else
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    v59 = v11;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      v57 = 0;
    else
      v57 = objc_msgSend(v11, "columnForItem:", v14);
    v55 = v8;
    v61 = self;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v72 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (objc_msgSend(v21, "hasAnyInsertionsRemovalsOrMoves", v55))
          {
            objc_msgSend(v21, "itemChangesInSection:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v22, "indexAfterApplyingChangesToIndex:", v14);

            v18 = 1;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    if ((-[PXAssetsDataSource areAllSectionsConsideredAccurate](v62, "areAllSectionsConsideredAccurate") & 1) != 0)
      LODWORD(v23) = 0;
    else
      LODWORD(v23) = -[PXAssetsDataSource areAllSectionsConsideredAccurate](v6, "areAllSectionsConsideredAccurate");
    if (!BYTE8(v78))
    {
      v24 = objc_msgSend(v59, "numberOfColumns");
      if (v24 <= objc_msgSend(v60, "maxColumnsForIndividualItems") && (v23 & 1) == 0 && ((v18 ^ 1) & 1) == 0)
        v25 = -[PXGLayout createDefaultAnimationForCurrentContext](v61, "createDefaultAnimationForCurrentContext");
    }
    if ((v18 & 1) != 0)
    {
      -[PXZoomablePhotosLayout viewModel](v61, "viewModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "assetsDataSourceManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "performChanges:", &__block_literal_global_262);

      -[PXZoomablePhotosLayout _invalidateVisualShiftingEnsuringLastRowFilled](v61, "_invalidateVisualShiftingEnsuringLastRowFilled");
      v28 = v57;
    }
    else
    {
      v28 = 0;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v61->_visuallyStableAnchorItem = v14;
    v61->_visuallyStableAnchorItemDesiredColumn = v28;
    v61->_visuallyStableAnchorAllowedCloseToTop = v23;
    if ((_DWORD)v23)
      v61->_performedInitialVisualShift = 0;
    v23 = v23;
    -[PXAssetsDataSource filterPredicate](v62, "filterPredicate", v55);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsDataSource filterPredicate](v6, "filterPredicate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 != v30 && !objc_msgSend(v29, "isEqual:", v30))
      v23 = 15;
    v58 = v3;

    -[PXGLayout rootLayout](v61, "rootLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "createAnchorForVisibleAreaIgnoringEdges:", v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v32, "autoInvalidate");

    objc_storeStrong((id *)p_currentDataSource, v6);
    -[PXPhotosGridAssetDecorationSource setDataSource:section:](v61->_assetDecorationSource, "setDataSource:section:", *p_currentDataSource, 0);
    cachedClampedFetchResult = v61->_cachedClampedFetchResult;
    v61->_cachedClampedFetchResult = 0;

    v61->_cachedClampedItemRange = (_NSRange)xmmword_1A7C0C330;
    -[PXZoomablePhotosLayout anchorAssetReference](v61, "anchorAssetReference");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[PXZoomablePhotosLayout anchorAssetReference](v61, "anchorAssetReference");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetsDataSource assetReferenceForAssetReference:](v6, "assetReferenceForAssetReference:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXZoomablePhotosLayout setAnchorAssetReference:](v61, "setAnchorAssetReference:", v37);

    }
    v38 = v61->_visualAnchorAssetReferenceItemByLayout;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    NSAllMapTableKeys(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v68 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          -[NSMapTable objectForKey:](v38, "objectForKey:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v46 = (void *)v45;
            -[PXAssetsDataSource assetReferenceForAssetReference:](v6, "assetReferenceForAssetReference:", v45);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMapTable setObject:forKey:](v38, "setObject:forKey:", v47, v44);
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
      }
      while (v41);
    }

    +[PXGDisplayAssetTextureProvider defaultMediaVersionHandlerWithDataSourceBeforeChanges:dataSourceAfterChanges:](PXGDisplayAssetTextureProvider, "defaultMediaVersionHandlerWithDataSourceBeforeChanges:dataSourceAfterChanges:", v62, v6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v49 = v61->_layers;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v64 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "itemsLayout");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "applySectionedChangeDetailsForSingleSection:dataSourceBeforeChanges:dataSourceAfterChanges:changeMediaVersionHandler:", v15, v62, v6, v48);

        }
        v51 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      }
      while (v51);
    }

    -[PXGLayout invalidateVersion](v61, "invalidateVersion");
    PXZoomablePhotosInvalidate(v61, 1311232);
    if (!v61->_performedInitialVisualShift
      && -[PXAssetsDataSource containsAnyItems](v6, "containsAnyItems"))
    {
      PXZoomablePhotosInvalidate(v61, 256);
    }

    v3 = v58;
  }

}

- (void)_updateDecorationSource
{
  void *v3;
  PXPhotosGridAssetDecorationSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_assetDecorationSource;
  -[PXPhotosGridAssetDecorationSource setIsInSelectMode:](v4, "setIsInSelectMode:", objc_msgSend(v3, "isInSelectMode"));
  objc_msgSend(v3, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAssetDecorationSource setSelectionSnapshot:](v4, "setSelectionSnapshot:", v5);

  objc_msgSend(v3, "draggedAssetReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAssetDecorationSource setDraggedAssetReferences:](v4, "setDraggedAssetReferences:", v6);

  -[PXPhotosGridAssetDecorationSource setDurationAlwaysHidden:](v4, "setDurationAlwaysHidden:", objc_msgSend(v3, "viewBasedDecorationsEnabled"));
  -[PXPhotosGridAssetDecorationSource setForbiddenBadges:](v4, "setForbiddenBadges:", objc_msgSend(v3, "viewBasedDecorationsEnabled") << 63 >> 63);
  if (objc_msgSend(v3, "alwaysShowTopBadges"))
    -[PXPhotosGridAssetDecorationSource setForbiddenBadges:](v4, "setForbiddenBadges:", -[PXPhotosGridAssetDecorationSource forbiddenBadges](v4, "forbiddenBadges") & 0xFFFFFFDFFFFFFFFFLL);
  -[PXPhotosGridAssetDecorationSource setWantsDimmedSelectionStyle:](v4, "setWantsDimmedSelectionStyle:", objc_msgSend(v3, "wantsDimmedSelectionStyle"));
  -[PXPhotosGridAssetDecorationSource setWantsNumberedSelectionStyle:](v4, "setWantsNumberedSelectionStyle:", objc_msgSend(v3, "wantsNumberedSelectionStyle"));
  -[PXPhotosGridAssetDecorationSource setWantsFileSizeBadge:](v4, "setWantsFileSizeBadge:", objc_msgSend(v3, "wantsFileSizeBadge"));
  -[PXPhotosGridAssetDecorationSource setWantsAssetIndexBadge:](v4, "setWantsAssetIndexBadge:", objc_msgSend(v3, "wantsAssetIndexBadge"));
  -[PXPhotosGridAssetDecorationSource setWantsSharedLibraryDecorations:](v4, "setWantsSharedLibraryDecorations:", -[PXAssetsDataSource libraryFilter](self->_currentDataSource, "libraryFilter") != 1);
  -[PXAssetsDataSource containerCollection](self->_currentDataSource, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAssetDecorationSource setWantsStacksDecorations:](v4, "setWantsStacksDecorations:", objc_msgSend(v7, "px_isAllPhotosSmartAlbum"));

  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAssetDecorationSource setEnableDebugDecoration:](v4, "setEnableDebugDecoration:", objc_msgSend(v8, "enableStacksReviewUI"));

  -[PXGZoomLayout primaryLayer](self->_zoomLayout, "primaryLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemsLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  -[PXPhotosGridAssetDecorationSource setDecoratedLayout:](v4, "setDecoratedLayout:", v11);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_itemLayouts;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "invalidateDecoration", (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_updateZoomTransforms
{
  void *v4;
  CGFloat y;
  CGFloat x;
  NSMapTable *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSMapTable *v33;
  id v34;
  PXZoomableInlineHeadersLayout *inlineHeadersLayout;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  NSMapTable *v40;
  id v41;
  uint64_t v42;
  SEL v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v59;
  uint64_t v60;

  -[PXZoomablePhotosLayout oneColLayout](self, "oneColLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout visibleRect](self, "visibleRect");
  x = self->_normalizedScaleCenterInAnchorSprite.x;
  y = self->_normalizedScaleCenterInAnchorSprite.y;
  v7 = self->_visualAnchorAssetReferenceItemByLayout;
  -[NSArray firstObject](self->_itemLayouts, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemAspectRatio");
  v10 = v9;

  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "indexPath");
    v13 = v60;
    objc_msgSend(v4, "frameForItem:", v60);
    if (v4)
    {
      PXSizeGetAspectRatio();
      v10 = v14;
    }
    -[PXZoomablePhotosLayout scaleCenterTargetInViewport](self, "scaleCenterTargetInViewport");
    v59 = 0;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "zoomState");
    }
    else
    {
      v59 = 0;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
    }

    -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", (_QWORD)v57);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", *((_QWORD *)&v57 + 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout rootLayout](self, "rootLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaInsets");
    PXEdgeInsetsAdd();
    sub_1A7AE3F38();

    -[NSMapTable objectForKey:](v7, "objectForKey:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "indexPath");
      v25 = v52;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayout.m"), 1926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAssetReference != nil"));

      v25 = 0;
      v51 = 0u;
      v52 = 0u;
    }
    objc_msgSend(v20, "frameForItem:", v25);
    PXPointDenormalize();
    objc_msgSend(v20, "contentSize");
    PXEdgeInsetsInsetRect();
    PXRectShiftedInsideConstrainingRect();
    PXPointSubtract();
    -[NSMapTable objectForKey:](v7, "objectForKey:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "indexPath");
      v28 = v50;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayout.m"), 1937, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAssetReference != nil"));

      v28 = 0;
      v49 = 0u;
      v50 = 0u;
    }
    objc_msgSend(v21, "frameForItem:", v28);
    PXPointDenormalize();
    v19 = y;
    objc_msgSend(v21, "contentSize");
    PXEdgeInsetsInsetRect();
    PXRectShiftedInsideConstrainingRect();
    PXPointSubtract();
    PXPointByLinearlyInterpolatingPoints();
    PXPointAdd();
    v17 = v29;
    v18 = v30;

  }
  else
  {
    v17 = *(_QWORD *)off_1E50B8580;
    v18 = *((_QWORD *)off_1E50B8580 + 1);
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = y;
  }
  -[PXGLayout sublayoutDataStore](self->_zoomLayout, "sublayoutDataStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke;
  v39[3] = &unk_1E51239D8;
  v39[4] = self;
  v42 = v13;
  v33 = v7;
  v40 = v33;
  v43 = a2;
  v44 = x;
  v45 = v19;
  v34 = v4;
  v41 = v34;
  v46 = v10;
  v47 = v17;
  v48 = v18;
  objc_msgSend(v31, "enumerateSublayoutGeometriesUsingBlock:", v39);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    inlineHeadersLayout = self->_inlineHeadersLayout;
    v38[0] = v32;
    v38[1] = 3221225472;
    v38[2] = __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke_2;
    v38[3] = &unk_1E5149198;
    v38[4] = self;
    -[PXGLayout performChangesWithLocalUpdate:](inlineHeadersLayout, "performChangesWithLocalUpdate:", v38);
  }

}

- (void)_updateBackgroundSprites
{
  void *v3;
  unsigned int v4;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int location;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  location = self->_lightBackgroundSpriteIndexRange.location;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PXGLayout sublayoutDataStore](self->_zoomLayout, "sublayoutDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke;
  v5[3] = &unk_1E5123A28;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(v3, "enumerateSublayoutGeometriesUsingBlock:", v5);

  if (v7[3] >= 2)
  {
    v4 = *((_DWORD *)v11 + 6);
  }
  else
  {
    v4 = self->_lightBackgroundSpriteIndexRange.location;
    *((_DWORD *)v11 + 6) = v4;
  }
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v4 | ((unint64_t)(self->_lightBackgroundSpriteIndexRange.location- v4+ self->_lightBackgroundSpriteIndexRange.length) << 32), &__block_literal_global_277);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_updatePinchEffect
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  PXGEdgeStretchEffect *v15;
  PXGEdgeStretchEffect *edgeStretchEffect;
  void *v17;
  PXGEdgeStretchEffect *v18;
  PXGEdgeStretchEffect *v19;
  float v20;
  char v21;
  void *v22;
  double v23;
  _BOOL4 v25;
  _BOOL4 v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[5];
  BOOL v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  uint64_t v42;
  _QWORD v43[5];
  float v44;
  uint64_t v45;
  CGRect v46;

  v45 = *MEMORY[0x1E0C80C00];
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray lastObject](self->_layers, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray lastObject](self->_itemLayouts, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosLayout _scaleForLayout:](self, "_scaleForLayout:", v5);
  v7 = v6;
  -[PXGLayout entityManager](self, "entityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGEdgeStretchEffect entityManager](self->_edgeStretchEffect, "entityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "lowMemoryMode") & 1) == 0 && v8 && -[PXGLayout appearState](self, "appearState") == 1)
    {
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rubberBandEffect");

      if (v12 == 1)
      {
        v13 = objc_alloc((Class)off_1E50B2958);
        -[PXGLayout entityManager](self, "entityManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (PXGEdgeStretchEffect *)objc_msgSend(v13, "initWithEntityManager:", v14);
        edgeStretchEffect = self->_edgeStretchEffect;
        self->_edgeStretchEffect = v15;

        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke;
        v43[3] = &unk_1E5123A70;
        v43[4] = self;
        self->_pinchEffectCaptureSpriteIndex = -[PXGLayout addSpriteWithInitialState:](self, "addSpriteWithInitialState:", v43);
        -[PXGLayout axGroup](self, "axGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateIfNeeded");

        goto LABEL_10;
      }
    }
    else
    {

    }
    if (self->_pinchEffectCaptureSpriteIndex != -1)
    {
      v18 = self->_edgeStretchEffect;
      self->_edgeStretchEffect = 0;

      -[PXGLayout removeSpritesInRange:](self, "removeSpritesInRange:", self->_pinchEffectCaptureSpriteIndex | 0x100000000);
      self->_pinchEffectCaptureSpriteIndex = -1;
    }
  }
LABEL_10:
  v19 = self->_edgeStretchEffect;
  if (v19)
  {
    -[PXGLayout styleForSpriteAtIndex:](self, "styleForSpriteAtIndex:", self->_pinchEffectCaptureSpriteIndex);
    v20 = v44;
    v21 = objc_msgSend(v3, "isDisplayingIndividualItems");
    -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v21 & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      v23 = 0.9999;
      v25 = v20 > 0.0 || v22 == v5;
      v26 = v7 < 0.9999 && v25;
    }
    -[PXGLayout visibleRect](self, "visibleRect", v23);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v4, "itemsLayout");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36 == v35)
      {
        v42 = 0;
        memset(&v41, 0, sizeof(v41));
        -[PXZoomablePhotosLayout _spriteTransformForLayout:](self, "_spriteTransformForLayout:", v4);
        v40 = v41;
        v46.origin.x = v28;
        v46.origin.y = v30;
        v46.size.width = v32;
        v46.size.height = v34;
        CGRectApplyAffineTransform(v46, &v40);
        PXPointSubtract();
        -[PXGEdgeStretchEffect setSampleRect:](v19, "setSampleRect:");
      }
    }
    v37 = self->_pinchEffectCaptureSpriteIndex | 0x100000000;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_3;
    v38[3] = &unk_1E5123A98;
    v38[4] = self;
    v39 = v26;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v37, v38);

  }
}

- (void)_updateBlurEffect
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _PXGSpriteIndexRange *p_blurEffectsSpriteIndexRange;
  NSArray *blurEffects;
  id v14;
  _PXGSpriteIndexRange v15;
  id v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _QWORD v51[5];
  id v52;
  char v53;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableBlurEffect");

  if (v4)
  {
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "miniModeAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "enableBlurDebugLayers");
    -[PXGLayout entityManager](self, "entityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_blurEffects, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v9)
    {
      p_blurEffectsSpriteIndexRange = &self->_blurEffectsSpriteIndexRange;
      if (!self->_blurEffectsSpriteIndexRange.length)
        *p_blurEffectsSpriteIndexRange = -[PXGLayout addSpriteCount:withInitialState:](self, "addSpriteCount:withInitialState:", 5, &__block_literal_global_280_85870);
      if (-[NSArray count](self->_blurEffects, "count"))
      {
        blurEffects = self->_blurEffects;
        self->_blurEffects = 0;

      }
      if (v9 && objc_msgSend(v7, "isActive"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_2;
        v51[3] = &unk_1E5123B08;
        v51[4] = self;
        v52 = v14;
        v53 = v8;
        v15 = *p_blurEffectsSpriteIndexRange;
        v16 = v14;
        -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v15, v51);
        v17 = (NSArray *)objc_msgSend(v16, "copy");
        v18 = self->_blurEffects;
        self->_blurEffects = v17;

        -[PXGLayout axGroup](self, "axGroup");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "updateIfNeeded");

      }
    }
    v20 = self->_blurEffects;
    if (-[NSArray count](v20, "count"))
    {
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      if (-[PXZoomablePhotosLayout _getMiniModeInfo:forLayout:](self, "_getMiniModeInfo:forLayout:", &v46, v22))
      {
        -[PXZoomablePhotosLayout miniModeFoldedRows](self, "miniModeFoldedRows");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v22, "referenceSize");
          v25 = v24;
          v27 = v26;
          objc_msgSend(v21, "maxBlurRadius");
          v29 = v28;
          objc_msgSend(v21, "blurDimmingStrength");
          v31 = v30;
          objc_msgSend(v22, "rowHeight");
          if (v32 == 0.0)
            v33 = *((double *)&v47 + 1);
          else
            v33 = v32;
          v34 = objc_msgSend(v23, "count");
          v36[0] = MEMORY[0x1E0C809B0];
          v35 = v34 / 5;
          v36[1] = 3221225472;
          v36[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_4;
          v36[3] = &unk_1E5123B58;
          if (v34 / 5 <= 1)
            v35 = 1;
          v36[4] = self;
          v38 = v34;
          v39 = v35;
          v37 = v23;
          v40 = v29;
          v41 = v31;
          v42 = v25;
          v43 = v27;
          v44 = v33;
          v45 = v8;
          -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", *(_QWORD *)&self->_blurEffectsSpriteIndexRange, v36);

        }
      }

    }
  }
}

- (void)_updatePrefetching
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange *p_prefetchedForLoadedItems;
  BOOL v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PXAssetsDataSource *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  void *v28;
  int v29;
  PXZoomablePhotosLayout *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v53;
  BOOL v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  PXZoomablePhotosLayout *v68;
  char *v69;
  NSArray *obj;
  uint64_t v71;
  _QWORD block[4];
  id v73;
  PXZoomablePhotosLayout *v74;
  NSUInteger v75;
  NSUInteger v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;
  NSRange v92;
  NSRange v93;
  NSRange v94;
  NSRange v95;

  v91 = *MEMORY[0x1E0C80C00];
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v67, "loadedItems");
  v6 = v4;
  v7 = v5;
  p_prefetchedForLoadedItems = &self->_prefetchedForLoadedItems;
  v10 = v5 == self->_prefetchedForLoadedItems.length && v4 == self->_prefetchedForLoadedItems.location || v5 == 0;
  v68 = self;
  if (!v10)
  {
    v11 = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v67);
    v12 = (v6 - (v7 >> 1)) & ~((uint64_t)(v6 - (v7 >> 1)) >> 63);
    v13 = objc_msgSend(v67, "numberOfItems") - 1;
    if (v13 >= (uint64_t)(v7 + v6 + (v7 >> 1) - 1))
      v13 = v7 + v6 + (v7 >> 1) - 1;
    v14 = v3;
    v15 = v13 - v12 + 1;
    v16 = (void *)MEMORY[0x1E0CB36B8];
    v17 = self->_currentDataSource;
    objc_msgSend(v16, "indexSetWithIndexesInRange:", v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v18, -[PXAssetsDataSource identifier](v17, "identifier"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXAssetsDataSource prefetchIndexPaths:level:](v17, "prefetchIndexPaths:level:", v19, !v11);
    p_prefetchedForLoadedItems->location = v6;
    p_prefetchedForLoadedItems->length = v7;

    self = v68;
    v3 = v14;
  }
  if (-[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime"))
    v20 = 0;
  else
    v20 = !-[PXZoomablePhotosLayout isAnimating](self, "isAnimating");
  if (objc_msgSend(v3, "preheatThumbnailsWhenIdle"))
    v21 = v7 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    objc_msgSend(v67, "numberOfColumns");
    -[PXGLayout referenceSize](v68, "referenceSize");
    -[PXGLayout displayScale](v68, "displayScale");
    PXSizeScale();
    v23 = v22;
    v25 = v24;
    if (-[PXGLayout scrollSpeedRegime](v68, "scrollSpeedRegime") > 2
      || -[PXZoomablePhotosLayout isAnimating](v68, "isAnimating"))
    {
      -[PXMediaProvider preheatThumbnailDataForAssets:origin:targetSize:](v68->_preheatMediaProvider, "preheatThumbnailDataForAssets:origin:targetSize:", 0, 0, v23, v25);
    }
    else if (v20)
    {
      -[PXZoomablePhotosLayout presentedDataSource](v68, "presentedDataSource");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = xmmword_1A7C0C1F0;
      v87 = objc_msgSend(v61, "identifier");
      v89 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v61, "assetsInSectionIndexPath:", &v87);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        v63 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v63 = v6 + (v7 >> 1);
      -[PXMediaProvider preheatThumbnailDataForAssets:origin:targetSize:](v68->_preheatMediaProvider, "preheatThumbnailDataForAssets:origin:targetSize:", v62, v63, v23, v25);

    }
  }
  if (objc_msgSend(v3, "preheatDenserZoomLevels"))
    v26 = v20;
  else
    v26 = 0;
  if (v26 == 1 && v7 != 0)
  {
    -[PXZoomablePhotosLayout viewModel](v68, "viewModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isInteractiveZoomingAllowed");

    if (v29)
    {
      v30 = v68;
      -[PXZoomablePhotosLayout presentedDataSource](v68, "presentedDataSource");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = xmmword_1A7C0C1F0;
      v84 = objc_msgSend(v31, "identifier");
      v86 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v31, "assetsInSectionIndexPath:", &v84);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGLayout referenceSize](v68, "referenceSize");
      v33 = v32;
      v35 = v34;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = v68->_itemLayouts;
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      if (v36)
      {
        v37 = v36;
        v38 = v6 + (v7 >> 1);
        v71 = *(_QWORD *)v81;
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          v38 = 0x7FFFFFFFFFFFFFFFLL;
        v66 = v38;
        v64 = v38 + 1;
        v39 = -1;
        do
        {
          v40 = 0;
          v41 = (char *)v30 + 16 * v39;
          v69 = (char *)&v68->super.super.super.isa + v39 + 1;
          do
          {
            if (*(_QWORD *)v81 != v71)
              objc_enumerationMutation(obj);
            v42 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v40);
            if (!-[PXZoomablePhotosLayout _layoutHasIndividualItems:](v30, "_layoutHasIndividualItems:", v42)
              && v39 + v40 <= 8
              && !v69[v40 + 1312])
            {
              v43 = objc_msgSend(v67, "numberOfColumns");
              v44 = v43 < objc_msgSend(v42, "numberOfColumns");
              v30 = v68;
              if (v44)
              {
                v45 = floor(v33 / (double)objc_msgSend(v42, "numberOfColumns"));
                -[PXGLayout displayScale](v68, "displayScale");
                PXSizeScale();
                v47 = v46;
                v49 = v48;
                if (v66 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("NSRange+PhotosUIFoundation.h"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("midLocation != NSNotFound"));

                }
                v50 = vcvtpd_s64_f64(v33 / v45) * vcvtpd_s64_f64(v35 / v45);
                if ((v50 & 0x8000000000000000) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("NSRange+PhotosUIFoundation.h"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("padding >= 0"));

                }
                v94.length = objc_msgSend(v65, "count");
                v92.location = (v66 - v50) & ~((uint64_t)(v66 - v50) >> 63);
                v92.length = v64 + v50 - v92.location;
                v94.location = 0;
                v93 = NSIntersectionRange(v92, v94);
                location = v93.location;
                length = v93.length;
                v95.location = *((_QWORD *)v41 + 146);
                v53 = *((_QWORD *)v41 + 147);
                v95.length = v53;
                v54 = (double)NSIntersectionRange(v93, v95).length / (double)(v53 + 1) >= 0.9 || length == 0;
                v30 = v68;
                if (!v54)
                {
                  *((_QWORD *)v41 + 146) = location;
                  *((_QWORD *)v41 + 147) = length;
                  v69[v40 + 1312] = 1;
                  +[PXMediaProvider preheatQueue](PXPhotoKitUIMediaProvider, "preheatQueue");
                  v55 = objc_claimAutoreleasedReturnValue();
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke;
                  block[3] = &unk_1E5146140;
                  v56 = v65;
                  v75 = location;
                  v76 = length;
                  v73 = v56;
                  v74 = v68;
                  v77 = v47;
                  v78 = v49;
                  v79 = v39 + v40 + 1;
                  dispatch_async(v55, block);

                  v30 = v68;
                }
              }
            }
            ++v40;
            v41 += 16;
          }
          while (v37 != v40);
          v39 += v40;
          v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
        }
        while (v37);
      }

    }
  }

}

- (void)_updateFloatingHeaderStyle
{
  int v3;
  double v4;

  -[PXZoomablePhotosLayout effectiveOverlayInsets](self, "effectiveOverlayInsets");
  v3 = PXEdgeInsetsEqualToEdgeInsets();
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXZoomablePhotosLayout setWantsOverBackgroundFloatingHeaderAppearance:](self, "setWantsOverBackgroundFloatingHeaderAppearance:", (v4 < 1.0) & ~v3);
}

- (void)_updateDebugVisualizationSprites
{
  void *v4;
  int v5;
  NSUInteger v6;
  _PXGSpriteIndexRange *p_debugVisualizationSpriteIndexRange;
  unint64_t v8;
  uint64_t v9;
  _PXGSpriteIndexRange v10;
  _PXGSpriteIndexRange *v11;
  void *v12;
  _QWORD v13[6];
  __int128 v14;
  int v15;
  _QWORD v16[5];
  __int128 v17;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableDebugSprites");

  if (self->_debugVisualizationSpriteTitles)
  {
    if (v5)
    {
LABEL_3:
      v6 = -[NSArray count](self->_debugVisualizationSpriteTitles, "count");
      p_debugVisualizationSpriteIndexRange = &self->_debugVisualizationSpriteIndexRange;
      LODWORD(v8) = self->_debugVisualizationSpriteIndexRange.length;
      v9 = MEMORY[0x1E0C809B0];
      if (!(_DWORD)v8)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke;
        v16[3] = &unk_1E5125040;
        v17 = xmmword_1A7C0C470;
        v16[4] = self;
        v10 = -[PXGLayout addSpriteCount:withInitialState:](self, "addSpriteCount:withInitialState:", v6, v16);
        *p_debugVisualizationSpriteIndexRange = v10;
        v8 = HIDWORD(*(unint64_t *)&v10);
      }
      if ((_DWORD)v8 != (_DWORD)v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayout.m"), 2384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_debugVisualizationSpriteIndexRange.length == spriteCount"));

      }
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke_2;
      v13[3] = &unk_1E5123B80;
      v15 = v6;
      v13[4] = self;
      v13[5] = a2;
      v14 = xmmword_1A7C0C470;
      -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", *p_debugVisualizationSpriteIndexRange, v13);
      return;
    }
  }
  else
  {
    self->_debugVisualizationSpriteTitles = (NSArray *)&unk_1E53E9408;
    if (v5)
      goto LABEL_3;
  }
  v11 = &self->_debugVisualizationSpriteIndexRange;
  if (self->_debugVisualizationSpriteIndexRange.length)
  {
    -[PXGLayout removeSpritesInRange:](self, "removeSpritesInRange:", *v11);
    *v11 = *(_PXGSpriteIndexRange *)off_1E50B8378;
  }
}

- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_wantsOverBackgroundFloatingHeaderAppearance != a3)
  {
    self->_wantsOverBackgroundFloatingHeaderAppearance = a3;
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__PXZoomablePhotosLayout_setWantsOverBackgroundFloatingHeaderAppearance___block_invoke;
    v5[3] = &__block_descriptor_33_e69_v16__0__PXZoomablePhotosViewModel_PXMutableZoomablePhotosViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (int64_t)_estimatedItemsPerScreenForLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  v4 = a3;
  -[PXGLayout visibleRect](self, "visibleRect");
  v6 = v5;
  v7 = objc_msgSend(v4, "numberOfColumns");

  PXSizeGetArea();
  return (uint64_t)(v8 / (v6 / (double)v7 * (v6 / (double)v7)));
}

- (BOOL)_isAllowedToShiftItem:(int64_t)a3 inLayout:(id)a4
{
  double v5;
  void *v6;
  double v7;
  double v8;

  v5 = (double)-[PXZoomablePhotosLayout _estimatedItemsPerScreenForLayout:](self, "_estimatedItemsPerScreenForLayout:", a4);
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shiftingRequiredScreensTopDistance");
  v8 = v7;

  return v8 * v5 <= (double)a3;
}

- (BOOL)_performVisualShiftWithLayout:(id)a3 movingItem:(int64_t)a4 toColumn:(int64_t)a5
{
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  int64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = -[PXZoomablePhotosLayout _layoutHasIndividualItems:](self, "_layoutHasIndividualItems:", v8);
  v10 = -[PXZoomablePhotosLayout _hasLastRowFilledStrategy](self, "_hasLastRowFilledStrategy");
  v11 = !v9;
  -[PXGLayout visibleRect](self, "visibleRect");
  if (!(a5 | a4)
    || !v9
    || v10
    || (PXSizeIsEmpty() & 1) == 0
    && -[PXZoomablePhotosLayout _isAllowedToShiftItem:inLayout:](self, "_isAllowedToShiftItem:inLayout:", a4, v8))
  {
    v12 = 1;
  }
  else
  {
    a5 = 0;
    v12 = 0;
    a4 = 0;
  }
  if (v10 && v9 && objc_msgSend(v8, "numberOfColumns") >= 2)
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v14 = v13;
    v16 = v15;
    -[PXGLayout visibleRect](self, "visibleRect");
    v18 = v17 - v14 - v16;
    v19 = objc_msgSend(v8, "numberOfColumns");
    -[PXGLayout referenceSize](self, "referenceSize");
    v21 = vcvtpd_s64_f64(v18 / (v20 / (double)v19)) - (v19 + objc_msgSend(v8, "numberOfItems") - 1) / v19;
    v22 = v21 & ~(v21 >> 63);
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v8, "shiftItem:toColumn:topPaddingRows:hideIncompleteRows:", a4, a5, v22, v11);

  return v12;
}

- (void)_performAnchorAlignmentVisualShiftWithBaseLayout:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double y;
  double x;
  double v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PXAssetsDataSource *currentDataSource;
  uint64_t v35;
  _QWORD v36[2];
  int v37;
  int v38;
  char *v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  if ((PXPointIsValid() & 1) == 0)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "This value should be set to PXPointNull when not relevant", buf, 2u);
    }

  }
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  *(_OWORD *)buf = 0u;
  v46 = 0u;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "zoomState");
  }
  else
  {
    v51 = 0;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    *(_OWORD *)buf = 0u;
    v46 = 0u;
  }

  -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v9 = v44;
  }
  else
  {
    v9 = 0;
    v44 = 0u;
    v43 = 0u;
  }
  y = 0.5;
  x = 0.5;
  if ((PXPointIsNull() & 1) == 0)
  {
    x = self->_normalizedScaleCenterInAnchorSprite.x;
    y = self->_normalizedScaleCenterInAnchorSprite.y;
  }
  v12 = *(double *)&v50 + (double)(uint64_t)v49 - (double)*((uint64_t *)&v47 + 1);
  v13 = self->_itemLayouts;
  v14 = -[NSArray count](v13, "count");
  v15 = objc_msgSend(v41, "numberOfColumns");
  v40 = 0;
  if (v15 == 1 && v14 > 1)
  {
    -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXZoomablePhotosLayout _isAllowedToShiftItem:inLayout:](self, "_isAllowedToShiftItem:inLayout:", v9, v16);

    if (v17)
    {
      v40 = 0;
    }
    else
    {
      v40 = 1;
      -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "columnForItem:", v9);
      v20 = objc_msgSend(v18, "numberOfColumns");
      x = (1.0 / (double)v20 * 0.5 + (double)v19 * (1.0 / (double)v20) + 1.0 / (double)v20 * -0.5)
        / (1.0 - 1.0 / (double)v20);

    }
  }
  v36[1] = v36;
  MEMORY[0x1E0C80A78](v15);
  v39 = (char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  +[PXZoomablePhotosLayout getBestAnchorColumns:forItemLayouts:startingAtBaseLayout:anchorItem:normalizedScaleCenterInAnchor:biasTowardsCenter:](PXZoomablePhotosLayout, "getBestAnchorColumns:forItemLayouts:startingAtBaseLayout:anchorItem:normalizedScaleCenterInAnchor:biasTowardsCenter:", x, y);
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v22, "enableCrossfadeFallback");

  if (v14 >= 1)
  {
    v23 = 0;
    v38 = v37 ^ 1;
    do
    {
      v24 = v13;
      -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v23);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)&v39[8 * v23];
      v27 = v8;
      v28 = v8;
      if ((_DWORD)v40)
        v29 = objc_msgSend(v25, "numberOfColumns") != 3;
      else
        v29 = 1;
      if (v25 == v41)
      {
        if ((v37 & v29) == 1 && v12 >= 1.5)
        {
LABEL_29:
          v31 = objc_msgSend(v25, "columnForItem:", v9);
          v32 = (v26 + v9 - v31) & ~((v26 + v9 - v31) >> 63);
          v33 = -[PXAssetsDataSource numberOfItemsInSection:](self->_currentDataSource, "numberOfItemsInSection:", 0);
          if (v32 >= v33 - 1)
            v32 = v33 - 1;
          if (v32 != v9)
          {
            currentDataSource = self->_currentDataSource;
            v42[0] = -[PXAssetsDataSource identifier](currentDataSource, "identifier");
            v42[1] = 0;
            v42[2] = v32;
            v42[3] = 0x7FFFFFFFFFFFFFFFLL;
            -[PXAssetsDataSource assetReferenceAtItemIndexPath:](currentDataSource, "assetReferenceAtItemIndexPath:", v42);
            v35 = objc_claimAutoreleasedReturnValue();

            v28 = (id)v35;
          }
        }
      }
      else
      {
        v30 = -[PXZoomablePhotosLayout _performVisualShiftWithLayout:movingItem:toColumn:](self, "_performVisualShiftWithLayout:movingItem:toColumn:", v25, v9, v26);
        if (((v30 | v38) & 1) == 0 && v29)
          goto LABEL_29;
      }
      -[NSMapTable setObject:forKey:](self->_visualAnchorAssetReferenceItemByLayout, "setObject:forKey:", v28, v25);

      ++v23;
      v8 = v27;
      v13 = v24;
    }
    while (v14 != v23);
  }

}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)_spriteTransformForLayout:(SEL)a3
{
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  $8F6F21C65DCD0A0F8AC24DFE540A6236 *result;
  _OWORD v12[4];

  v6 = a4;
  v7 = *((_OWORD *)off_1E50B8368 + 1);
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&retstr->var0.c = v7;
  *(_OWORD *)&retstr->var0.tx = *((_OWORD *)off_1E50B8368 + 2);
  retstr->var1 = *((double *)off_1E50B8368 + 6);
  objc_msgSend(v6, "superlayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    memset(v12, 0, sizeof(v12));
    -[PXGLayout sublayoutDataStore](self->_zoomLayout, "sublayoutDataStore", 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "geometryForSublayout:", v6);
    else
      memset(v12, 0, sizeof(v12));

    *(_OWORD *)&retstr->var0.a = *(_OWORD *)((char *)v12 + 8);
    *(_OWORD *)&retstr->var0.c = *(_OWORD *)((char *)&v12[1] + 8);
    *(_OWORD *)&retstr->var0.tx = *(_OWORD *)((char *)&v12[2] + 8);
    retstr->var1 = *((double *)&v12[3] + 1);
  }

  return result;
}

- (BOOL)_hasLastRowFilledStrategy
{
  void *v2;
  BOOL v3;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentShiftStrategy") == 1;

  return v3;
}

- (void)_ensureZoomingAnchor
{
  void *v3;
  PXGAnchor *v4;
  void *anchor;
  void *v6;
  void *v7;
  double v8;
  double v9;
  PXGAnchor *v10;
  PXGAnchor *v11;
  id v12;

  if (-[PXGAnchor canBeReused](self->_anchor, "canBeReused"))
  {
    -[PXGLayout rootLayout](self, "rootLayout");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createAnchorWithAnchor:", self->_anchor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoInvalidate");
    v4 = (PXGAnchor *)objc_claimAutoreleasedReturnValue();
    anchor = self->_anchor;
    self->_anchor = v4;
  }
  else
  {
    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    -[PXZoomablePhotosLayout anchorAssetReference](self, "anchorAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout dynamicSpriteReferenceForObjectReference:](self, "dynamicSpriteReferenceForObjectReference:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[PXGLayout rootLayout](self, "rootLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayout scaleCenterTargetInViewport](self, "scaleCenterTargetInViewport");
    objc_msgSend(v3, "createAnchorForScrollingSpriteForSpriteReference:normalizedAnchorPoint:toVisibleLocation:", v12, self->_normalizedScaleCenterInAnchorSprite.x, self->_normalizedScaleCenterInAnchorSprite.y, v8, v9);
    anchor = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(anchor, "autoInvalidate");
    v10 = (PXGAnchor *)objc_claimAutoreleasedReturnValue();
    v11 = self->_anchor;
    self->_anchor = v10;

  }
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PXAssetsDataSource *currentDataSource;

  v5 = a5;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    objc_msgSend(v7, "keyAssetReference");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
    goto LABEL_15;
  if ((v5 & 1) != 0)
  {
    -[PXAssetsDataSource objectReferenceNearestToObjectReference:](self->_currentDataSource, "objectReferenceNearestToObjectReference:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      if (!v10)
        goto LABEL_15;
      goto LABEL_12;
    }

  }
  v10 = v9;
LABEL_12:
  currentDataSource = self->_currentDataSource;
  if (currentDataSource)
    -[PXAssetsDataSource indexPathForAssetReference:](currentDataSource, "indexPathForAssetReference:", v10);

LABEL_15:
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  PXAssetsDataSource *v5;
  void *v6;
  _QWORD v8[4];

  v5 = self->_currentDataSource;
  v8[0] = -[PXAssetsDataSource identifier](v5, "identifier");
  v8[1] = 0;
  v8[2] = a4;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource objectReferenceAtIndexPath:](v5, "objectReferenceAtIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  -[PXZoomablePhotosLayout _displayAssetForItem:](self, "_displayAssetForItem:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  v6 = v5;

  return v6;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  void *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[PXZoomablePhotosLayout _displayAssetForItem:](self, "_displayAssetForItem:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if ((objc_msgSend(v8, "representsBurst") & 1) == 0)
  {
    -[PXZoomablePhotosLayout viewModel](self, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredAssetCropDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "preferredCropForAsset:withAspectRatio:", v8, a5);
      v9 = v15;
      v10 = v16;
      v11 = v17;
      v12 = v18;
    }
    else
    {
      -[PXZoomablePhotosLayout viewModel](self, "viewModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isFaceModeEnabled");

      if (v20)
      {
        -[PXZoomablePhotosLayout _displayFaceForItem:](self, "_displayFaceForItem:", a4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "normalizedCropRect");
          v9 = v23;
          v10 = v24;
          v11 = v25;
          v12 = v26;
        }

      }
    }
    v34.origin.x = v9;
    v34.origin.y = v10;
    v34.size.width = v11;
    v34.size.height = v12;
    if (CGRectIsEmpty(v34))
    {
      v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, 4, 0, a5);
      v10 = v27;
      v11 = v28;
      v12 = v29;
    }

  }
  v35.origin.x = v9;
  v35.origin.y = v10;
  v35.size.width = v11;
  v35.size.height = v12;
  if (CGRectIsEmpty(v35))
  {
    v9 = *(double *)off_1E50B86D0;
    v10 = *((double *)off_1E50B86D0 + 1);
    v11 = *((double *)off_1E50B86D0 + 2);
    v12 = *((double *)off_1E50B86D0 + 3);
  }

  v30 = v9;
  v31 = v10;
  v32 = v11;
  v33 = v12;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;

  -[PXZoomablePhotosLayout _displayAssetForItem:](self, "_displayAssetForItem:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_providedEffectByAsset, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout entityManager](self, "entityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    -[NSCache removeObjectForKey:](self->_providedEffectByAsset, "removeObjectForKey:", v5);

    v6 = 0;
  }
  v9 = objc_msgSend(v6, "effectId");
  if (!v9)
  {
    -[PXZoomablePhotosLayout effectProvider](self, "effectProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_13;
    -[PXZoomablePhotosLayout effectProvider](self, "effectProvider");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[PXGLayout entityManager](self, "entityManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v12)[2](v12, v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (-[NSCache setObject:forKey:](self->_providedEffectByAsset, "setObject:forKey:", v14, v5),
          v9 = objc_msgSend(v14, "effectId"),
          v14,
          !v9))
    {
LABEL_13:
      if (objc_msgSend(v5, "representsBurst"))
      {
        -[PXZoomablePhotosLayout burstStackEffect](self, "burstStackEffect");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v15, "effectId");

      }
      else
      {
        v9 = 0;
      }
    }
  }

  return v9;
}

- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5
{
  -[PXAssetsDataSource identifier](self->_currentDataSource, "identifier", a3);
  PXUpdateSectionedSpriteInfoTagsForItemsInRange();
}

- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "aspectFit"))
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[PXZoomablePhotosLayout assetDecorationSource](self, "assetDecorationSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expectedInsetsForItem:", a4);
    v7 = v10;
    v8 = v11;

  }
  v12 = v7;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_displayAssetForItem:(int64_t)a3
{
  PXAssetsDataSource *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self->_currentDataSource;
  v7[0] = -[PXAssetsDataSource identifier](v4, "identifier");
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource assetAtItemIndexPath:](v4, "assetAtItemIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_displayFaceForItem:(int64_t)a3
{
  PXAssetsDataSource *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self->_currentDataSource;
  v7[0] = -[PXAssetsDataSource identifier](v4, "identifier");
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource primaryFaceForAssetAtItemIndexPath:](v4, "primaryFaceForAssetAtItemIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)frameForItemAtIndexPath:(PXSimpleIndexPath *)a3 level:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PXZoomablePhotosContentLayout frameForItem:](self->_itemLayoutByHeaderLevel[a4], "frameForItem:", a3->item);
  PXRectWithAspectRatioFillingRect();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)spriteTransformForLevel:(SEL)a3
{
  return -[PXZoomablePhotosLayout _spriteTransformForLayout:](self, "_spriteTransformForLayout:", self->_itemLayoutByHeaderLevel[a4]);
}

- (CGRect)boundsForLevel:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[PXZoomablePhotosContentLayout contentSize](self->_itemLayoutByHeaderLevel[a3], "contentSize");
  v4 = v3;
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_NSRange)_rangeOfItemsForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (v10 = objc_msgSend(v8, "numberOfColumns"),
        -[PXZoomablePhotosLayout spec](self, "spec"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "maxColumnsForIndividualItems"),
        v11,
        v10 > v12)
    || (-[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v9, x, y, width, height),
        CGRectIsNull(v19))
    || (PXPointIsNull() & 1) != 0)
  {
    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v9, "contentSize");
    objc_msgSend(v9, "contentSize");
    PXRectShiftedInsideConstrainingRect();
    v14 = objc_msgSend(v9, "itemRangeInRect:");
    v13 = v17;
  }

  v15 = v14;
  v16 = v13;
  result.length = v16;
  result.location = v15;
  return result;
}

- (BOOL)_layoutWantsSingleDateTitle
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfColumns");
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 <= objc_msgSend(v4, "maxColumnsForSingleDate");

  return v3;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  NSDateInterval *lastReturnedDateInterval;
  PXAssetsDataSource *v14;
  id *v15;
  PXAssetsDataSource *v16;
  _QWORD *v17;
  _BOOL8 v18;
  NSDateInterval *v19;
  int64_t lastReturnedDateIntervalDataSourceIdentifier;
  void *v21;
  void *v22;
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[PXZoomablePhotosLayout _layoutWantsSingleDateTitle](self, "_layoutWantsSingleDateTitle"))
  {
    v10 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", x, y, width, height);
    v12 = v18;
    if (v18)
      goto LABEL_3;
LABEL_7:
    lastReturnedDateInterval = self->_lastReturnedDateInterval;
LABEL_8:
    v19 = lastReturnedDateInterval;
    lastReturnedDateIntervalDataSourceIdentifier = self->_lastReturnedDateIntervalDataSourceIdentifier;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
    v24[3] = &unk_1E5123BD0;
    v15 = (id *)v25;
    v25[0] = v19;
    v25[1] = lastReturnedDateIntervalDataSourceIdentifier;
    v16 = v19;
    v17 = v24;
    goto LABEL_9;
  }
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v10 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:");
  v12 = v11 != 0;
  if (!v11)
    goto LABEL_7;
LABEL_3:
  if (-[PXZoomablePhotosLayout isAnimating](self, "isAnimating"))
  {
    lastReturnedDateInterval = self->_lastReturnedDateInterval;
    if (lastReturnedDateInterval)
      goto LABEL_8;
  }
  v14 = self->_currentDataSource;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke;
  v26[3] = &unk_1E5123BA8;
  v15 = (id *)v27;
  v27[2] = v10;
  v27[3] = v12;
  v27[4] = a4;
  v27[0] = v14;
  v27[1] = self;
  v16 = v14;
  v17 = v26;
LABEL_9:
  v21 = (void *)objc_msgSend(v17, "copy");

  v22 = _Block_copy(v21);
  return v22;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *lastReturnedLocationNames;
  PXAssetsDataSource *v9;
  BOOL v10;
  id *v11;
  PXAssetsDataSource *v12;
  _QWORD *v13;
  NSArray *v14;
  int64_t lastReturnedLocationNamesDataSourceIdentifier;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[4];
  BOOL v23;

  v4 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v5) == 0)
  {
    lastReturnedLocationNames = self->_lastReturnedLocationNames;
LABEL_7:
    v14 = lastReturnedLocationNames;
    lastReturnedLocationNamesDataSourceIdentifier = self->_lastReturnedLocationNamesDataSourceIdentifier;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_3;
    v19[3] = &unk_1E5123C20;
    v11 = (id *)v20;
    v20[0] = v14;
    v20[1] = lastReturnedLocationNamesDataSourceIdentifier;
    v12 = v14;
    v13 = v19;
    goto LABEL_8;
  }
  v7 = v4;
  if (-[PXZoomablePhotosLayout isAnimating](self, "isAnimating"))
  {
    lastReturnedLocationNames = self->_lastReturnedLocationNames;
    if (lastReturnedLocationNames)
      goto LABEL_7;
  }
  v9 = self->_currentDataSource;
  v10 = v7 + v6 == -[PXAssetsDataSource numberOfItemsInSection:](v9, "numberOfItemsInSection:", 0);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke;
  v21[3] = &unk_1E5123BF8;
  v11 = (id *)v22;
  v22[2] = v7;
  v22[3] = v6;
  v23 = v10;
  v22[0] = v9;
  v22[1] = self;
  v12 = v9;
  v13 = v21;
LABEL_8:
  v16 = (void *)objc_msgSend(v13, "copy");

  v17 = _Block_copy(v16);
  return v17;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  uint64_t v4;
  void *v5;
  PXAssetsDataSource *v6;
  PXAssetsDataSource *v7;
  void *v8;
  _QWORD aBlock[4];
  PXAssetsDataSource *v11;

  v5 = 0;
  if (-[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) != 0x7FFFFFFFFFFFFFFFLL&& v4)
  {
    v6 = self->_currentDataSource;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PXZoomablePhotosLayout_assetCollectionsIteratorForContentInRect___block_invoke;
    aBlock[3] = &unk_1E513B878;
    v11 = v6;
    v7 = v6;
    v5 = _Block_copy(aBlock);

  }
  v8 = _Block_copy(v5);

  return v8;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  PXAssetsDataSource *v9;
  PXAssetsDataSource *v10;
  void *v11;
  _QWORD aBlock[4];
  PXAssetsDataSource *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    if (v5)
    {
      v8 = v4;
      v9 = self->_currentDataSource;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke;
      aBlock[3] = &unk_1E5123C70;
      v14 = v9;
      v15 = v8;
      v16 = v7;
      v10 = v9;
      v6 = _Block_copy(aBlock);

    }
  }
  v11 = _Block_copy(v6);

  return v11;
}

- (BOOL)zoomablePhotosViewModelIsResetToInitialState:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  if (!-[PXZoomablePhotosLayout _hasLastRowFilledStrategy](self, "_hasLastRowFilledStrategy", a3))
    return 1;
  -[PXZoomablePhotosLayout primaryItemsLayout](self, "primaryItemsLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  -[PXZoomablePhotosLayout getLastItem:lastColumn:forBodyLayout:](self, "getLastItem:lastColumn:forBodyLayout:", &v10, &v9, v4);
  v5 = objc_msgSend(v4, "columnForItem:", v10);
  v7 = !self->_performedInitialVisualShift || v5 == v9;

  return v7;
}

- (void)zoomablePhotosViewModelResetToInitialState:(id)a3
{
  if (-[PXZoomablePhotosLayout _hasLastRowFilledStrategy](self, "_hasLastRowFilledStrategy", a3))
  {
    self->_performedInitialVisualShift = 0;
    PXZoomablePhotosInvalidate(self, 256);
  }
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableInlineVideo");

  if (!v5)
    return 1;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inlinePlaybackController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxNumberOfPlayingItems");

  if (v8 < 1)
    return 1;
  -[PXZoomablePhotosLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDisplayingIndividualItems");

  if (v10)
    return 3;
  else
    return 1;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  if (-[PXZoomablePhotosLayout isAnimating](self, "isAnimating", a3))
    return 2;
  else
    return 1;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  PXAssetsDataSource *currentDataSource;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = a4;
  v6 = objc_msgSend(v5, "itemForSpriteIndex:", 0);
  v7 = objc_msgSend(v5, "numberOfItems");

  v8 = v7 - v6;
  if (self->_cachedClampedItemRange.location == v6 && self->_cachedClampedItemRange.length == v8)
  {
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    if (cachedClampedFetchResult)
      return cachedClampedFetchResult;
  }
  currentDataSource = self->_currentDataSource;
  v15 = -[PXAssetsDataSource identifier](currentDataSource, "identifier");
  v16 = xmmword_1A7C0C1F0;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource assetsInSectionIndexPath:](currentDataSource, "assetsInSectionIndexPath:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultSubfetchResultWithRange();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, v14);
  self->_cachedClampedItemRange.location = v6;
  self->_cachedClampedItemRange.length = v8;

  return v14;
}

- (id)displayAssetRequestObserverForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  return self->_assetDecorationSource;
}

- (id)customPixelBufferSourcesProviderForDisplayAssetsInLayout:(id)a3
{
  void *v3;
  void *v4;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlinePlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)useLowMemoryDecodeInLayout:(id)a3
{
  void *v3;
  char v4;

  -[PXZoomablePhotosLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useLowMemoryDecode");

  return v4;
}

- (id)_debugColors
{
  if (_debugColors_onceToken != -1)
    dispatch_once(&_debugColors_onceToken, &__block_literal_global_324);
  return (id)_debugColors_colors;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXZoomablePhotosLayout *v6;
  PXZoomablePhotosLayout *v7;
  void *v8;
  void *v9;
  void *v10;
  _PXGSpriteIndexRange lightBackgroundSpriteIndexRange;
  unsigned int v12;
  BOOL v13;

  v6 = (PXZoomablePhotosLayout *)a4;
  v7 = v6;
  if (v6 == self)
  {
    lightBackgroundSpriteIndexRange = v6->_lightBackgroundSpriteIndexRange;
    v13 = lightBackgroundSpriteIndexRange.location > a3;
    v12 = lightBackgroundSpriteIndexRange.length + lightBackgroundSpriteIndexRange.location;
    v13 = !v13 && v12 > a3;
    if (v13)
    {
      -[PXZoomablePhotosLayout spec](v6, "spec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultBackgroundColor");
    }
    else
    {
      -[PXZoomablePhotosLayout _debugColors](v6, "_debugColors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3 % (unint64_t)objc_msgSend(v8, "count"));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXZoomablePhotosLayout _debugColors](self, "_debugColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout itemsLayout](v7, "itemsLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "numberOfColumns") % (unint64_t)objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  __CFString *v5;

  -[NSArray objectAtIndexedSubscript:](self->_debugVisualizationSpriteTitles, "objectAtIndexedSubscript:", a3 - self->_debugVisualizationSpriteIndexRange.location, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("⌖");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), CFSTR("⌖"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v4 = a3 - self->_debugVisualizationSpriteIndexRange.location;
  -[PXZoomablePhotosLayout _debugColors](self, "_debugColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4 % objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setAlignment:", 1);
  v16[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1420]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1140];
  v17[0] = v9;
  v17[1] = v6;
  v11 = *MEMORY[0x1E0DC1178];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = v8;
  v17[3] = &unk_1E53EF980;
  v12 = *MEMORY[0x1E0DC11B0];
  v16[3] = *MEMORY[0x1E0DC11B8];
  v16[4] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  PXPhotosGridAddButtonViewUserData *v8;
  PXPhotosGridAddButtonViewUserData *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v5 = a4;
  objc_msgSend(v5, "superlayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfColumns");
  objc_initWeak(&location, self);
  v8 = [PXPhotosGridAddButtonViewUserData alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__PXZoomablePhotosLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke;
  v19 = &unk_1E5148D30;
  objc_copyWeak(&v20, &location);
  v9 = -[PXPhotosGridAddButtonViewUserData initWithStyle:actionHandler:](v8, "initWithStyle:actionHandler:", v7 < 5, &v16);
  objc_msgSend(v6, "itemCornerRadius", v16, v17, v18, v19);
  -[PXPhotosGridAddButtonViewUserData setCornerRadius:](v9, "setCornerRadius:", fminf(fminf(v10, v11), fminf(v12, v13)));
  -[PXZoomablePhotosLayout spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAddButtonViewUserData setPreferredUserInterfaceStyle:](v9, "setPreferredUserInterfaceStyle:", objc_msgSend(v14, "preferredUserInterfaceStyle"));

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v9;
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  unsigned int location;
  unsigned int v5;
  BOOL v6;

  location = self->_blurEffectsSpriteIndexRange.location;
  v6 = location > a3;
  v5 = self->_blurEffectsSpriteIndexRange.length + location;
  return !v6 && v5 > a3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  int v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  if ((void *)PXZoomablePhotosViewModelObserverContext_85815 == a5)
  {
    if ((v6 & 1) != 0)
      PXZoomablePhotosInvalidate(self, 720944);
    if ((v6 & 6) != 0)
      PXZoomablePhotosInvalidate(self, 720952);
    if ((v6 & 2) != 0)
      PXZoomablePhotosInvalidate(self, 512);
    if ((*(_QWORD *)&v6 & 0x20010) != 0)
      PXZoomablePhotosInvalidate(self, 520);
    if ((v6 & 0x800) != 0)
      PXZoomablePhotosInvalidate(self, 8);
    if ((v6 & 0x10000) != 0)
      PXZoomablePhotosInvalidate(self, 2);
    if ((v6 & 0x2660) != 0)
      PXZoomablePhotosInvalidate(self, 512);
    if ((v6 & 0x80000) != 0)
      PXZoomablePhotosInvalidate(self, 8);
    if ((*(_QWORD *)&v6 & 0xE00000) != 0)
      PXZoomablePhotosInvalidate(self, 8);
    if ((v6 & 0x1000000) != 0)
    {
      v9 = 0x100000;
      goto LABEL_34;
    }
  }
  else if ((void *)PXZoomablePhotosDataSourceObserverContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v9 = 128;
      goto LABEL_34;
    }
  }
  else if ((void *)PXZoomablePhotosSpecManagerObserverContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v9 = 1;
      goto LABEL_34;
    }
  }
  else if ((void *)PXZoomablePhotosDecorationAlphaAnimatorContext == a5)
  {
    if ((v6 & 3) != 0)
    {
      v9 = 64;
      goto LABEL_34;
    }
  }
  else
  {
    if ((void *)PXZoomablePhotosMiniModeAnimatorContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayout.m"), 3352, CFSTR("%@ got unexpected observer context:%p"), self, a5);

      abort();
    }
    if ((v6 & 7) != 0)
    {
      v9 = 4456544;
LABEL_34:
      PXZoomablePhotosInvalidate(self, v9);
    }
  }

}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = a5;
  if ((a4 & 6) != 0)
  {
    -[PXZoomablePhotosLayout presentedDataSource](self, "presentedDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "identifier");

    v13 = 0;
    v14 = v11;
    PXGAXAddSimpleIndexPathGroupChangeUserInfo(v9, &v14, &v13, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGLayout axGroup:didChange:userInfo:](&v12, sel_axGroup_didChange_userInfo_, v8, a4, v9);

}

- (id)debugQuickLookObject
{
  void *v3;

  v3 = -[NSArray count](self->_itemLayouts, "count");
  if (v3)
  {
    +[PXZoomablePhotosLayout visualizeBestAnchorColumnsForLayouts:imageWidth:](PXZoomablePhotosLayout, "visualizeBestAnchorColumnsForLayouts:imageWidth:", self->_itemLayouts, 1024.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (PXZoomablePhotosLayoutSpec)spec
{
  return self->_spec;
}

- (PXAssetReference)anchorAssetReference
{
  return self->__anchorAssetReference;
}

- (PXZoomablePhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXAssetsDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (UIEdgeInsets)overlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overlayInsets.top;
  left = self->_overlayInsets.left;
  bottom = self->_overlayInsets.bottom;
  right = self->_overlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)inlineHeaderOverlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_inlineHeaderOverlayInsets.top;
  left = self->_inlineHeaderOverlayInsets.left;
  bottom = self->_inlineHeaderOverlayInsets.bottom;
  right = self->_inlineHeaderOverlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)preventFillingTopAreaInsets
{
  return self->_preventFillingTopAreaInsets;
}

- (id)addContentHandler
{
  return self->_addContentHandler;
}

- (int64_t)bodyLayoutAXGroupRole
{
  return self->_bodyLayoutAXGroupRole;
}

- (void)setBodyLayoutAXGroupRole:(int64_t)a3
{
  self->_bodyLayoutAXGroupRole = a3;
}

- (PXGAnchor)anchor
{
  return self->_anchor;
}

- (CGPoint)scaleCenterTargetInViewport
{
  double x;
  double y;
  CGPoint result;

  x = self->_scaleCenterTargetInViewport.x;
  y = self->_scaleCenterTargetInViewport.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)normalizedScaleCenterInAnchorSprite
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedScaleCenterInAnchorSprite.x;
  y = self->_normalizedScaleCenterInAnchorSprite.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSMapTable)visualAnchorAssetReferenceItemByLayout
{
  return self->_visualAnchorAssetReferenceItemByLayout;
}

- (BOOL)shouldAnimateTowardsAnchor
{
  return self->_shouldAnimateTowardsAnchor;
}

- (BOOL)wasTracking
{
  return self->_wasTracking;
}

- (PXGOneColumnLayout)oneColLayout
{
  return self->_oneColLayout;
}

- (UIEdgeInsets)effectiveOverlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_effectiveOverlayInsets.top;
  left = self->_effectiveOverlayInsets.left;
  bottom = self->_effectiveOverlayInsets.bottom;
  right = self->_effectiveOverlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)wantsOverBackgroundFloatingHeaderAppearance
{
  return self->_wantsOverBackgroundFloatingHeaderAppearance;
}

- (id)effectProvider
{
  return self->_effectProvider;
}

- (BOOL)enableAddContentAccessoryItem
{
  return self->_enableAddContentAccessoryItem;
}

- (BOOL)miniModeIsAnchoringToBottom
{
  return self->_miniModeIsAnchoringToBottom;
}

- (void)setMiniModeIsAnchoringToBottom:(BOOL)a3
{
  self->_miniModeIsAnchoringToBottom = a3;
}

- (double)miniModeVerticalOffset
{
  return self->_miniModeVerticalOffset;
}

- (void)setMiniModeVerticalOffset:(double)a3
{
  self->_miniModeVerticalOffset = a3;
}

- (NSArray)miniModeFoldedRows
{
  return self->_miniModeFoldedRows;
}

- (void)setMiniModeFoldedRows:(id)a3
{
  objc_storeStrong((id *)&self->_miniModeFoldedRows, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_miniModeFoldedRows, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_storeStrong((id *)&self->_oneColLayout, 0);
  objc_storeStrong((id *)&self->_visualAnchorAssetReferenceItemByLayout, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_addContentHandler, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->__anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_providedEffectByAsset, 0);
  objc_storeStrong((id *)&self->_debugVisualizationSpriteTitles, 0);
  objc_storeStrong((id *)&self->_burstStackEffect, 0);
  objc_storeStrong((id *)&self->_lastReturnedLocationNames, 0);
  objc_storeStrong((id *)&self->_lastReturnedDateInterval, 0);
  objc_storeStrong((id *)&self->_decorationAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_itemLayoutsAllowedToLoad, 0);
  objc_storeStrong((id *)&self->_decadesItemLayout, 0);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_itemLayoutByHeaderLevel[i], 0);
  objc_storeStrong((id *)&self->_itemLayouts, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
  objc_storeStrong((id *)&self->_preheatMediaProvider, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_inlineHeadersLayout, 0);
  objc_storeStrong((id *)&self->_blurEffects, 0);
  objc_storeStrong((id *)&self->_edgeStretchEffect, 0);
  objc_storeStrong((id *)&self->_zoomLayout, 0);
}

void __64__PXZoomablePhotosLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callAddContentActionHandler");

}

void __38__PXZoomablePhotosLayout__debugColors__block_invoke()
{
  uint64_t i;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  for (i = 0; i != 10; ++i)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)i / 10.0, 0.8, 0.8, 1.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v1);

  }
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_debugColors_colors;
  _debugColors_colors = v2;

}

void __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  v7 = v5 + *(_QWORD *)(a1 + 48) - 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke_2;
  v11[3] = &unk_1E5123C48;
  v12 = v6;
  v13 = v3;
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = v5;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = v4;
  v9[1] = 0;
  v9[2] = v7;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = v3;
  objc_msgSend(v12, "enumerateItemIndexPathsStartingAtIndexPath:untilEndIndexPath:usingBlock:", v10, v9, v11);

}

void __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__PXZoomablePhotosLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "identifier");
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  v9 = xmmword_1A7C0C1F0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "assetCollectionAtSectionIndexPath:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

id __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  id v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") == a2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = v5 + *(_QWORD *)(a1 + 56) - 1;
    v7 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_2;
    v15[3] = &unk_1E5142450;
    v16 = v7;
    v8 = v4;
    v17 = v8;
    v14[0] = a2;
    v14[1] = 0;
    v14[2] = v5;
    v14[3] = 0x7FFFFFFFFFFFFFFFLL;
    v13[0] = a2;
    v13[1] = 0;
    v13[2] = v6;
    v13[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v16, "enumerateItemIndexPathsStartingAtIndexPath:untilEndIndexPath:usingBlock:", v14, v13, v15);
    PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!*(_BYTE *)(a1 + 64) && (unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      objc_msgSend(v10, "subarrayWithRange:", 0, 1);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1440), v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1448) = a2;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

id __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 40) == a2)
    return *(id *)(a1 + 32);
  else
    return 0;
}

void __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "localizedGeoDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

    }
  }

}

id __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") != a2)
    return 0;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = *(_QWORD *)(a1 + 56)) == 0)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = v4 + v5 - 1;
    v26 = a2;
    v27 = 0;
    v28 = v4;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "assetAtItemIndexPath:", &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v26 = a2;
    v27 = 0;
    v28 = v7;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v9, "assetAtItemIndexPath:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 64) == 1)
      objc_msgSend(v8, "importDate");
    else
      objc_msgSend(v8, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 64) == 1)
      objc_msgSend(v10, "importDate");
    else
      objc_msgSend(v10, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "px_unionStartDate:endDate:withDate:", &v25, &v24, v14);
    v16 = v25;
    v17 = v24;
    v22 = v17;
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "px_unionStartDate:endDate:withDate:", &v23, &v22, v15);
    v13 = v23;

    v12 = v22;
  }
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "titleUseDateRange");

  if ((v19 & 1) == 0)
  {
    v20 = v13;

    v12 = v20;
  }
  v21 = 0;
  if (v13)
  {
    if (v12)
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v12);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1424), v21);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1432) = a2;

  return v21;
}

id __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 40) == a2)
    return *(id *)(a1 + 32);
  else
    return 0;
}

uint64_t __73__PXZoomablePhotosLayout_setWantsOverBackgroundFloatingHeaderAppearance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsOverBackgroundFloatingHeaderAppearance:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke(uint64_t result, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  float32x2_t *v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v14;
  float32x2_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGFloat Width;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v4 = result;
    v6 = (_OWORD *)a3[3];
    v5 = a3[4];
    v7 = (float32x2_t *)a3[2];
    v28 = *(_OWORD *)off_1E50B83A0;
    v26 = *((_OWORD *)off_1E50B83A0 + 5);
    v27 = *((_OWORD *)off_1E50B83A0 + 1);
    v24 = *((_OWORD *)off_1E50B83A0 + 3);
    v25 = *((_OWORD *)off_1E50B83A0 + 4);
    v22 = *((_OWORD *)off_1E50B83A0 + 9);
    v23 = *((_OWORD *)off_1E50B83A0 + 2);
    v20 = *((_OWORD *)off_1E50B83A0 + 7);
    v21 = *((_OWORD *)off_1E50B83A0 + 8);
    v19 = *((_OWORD *)off_1E50B83A0 + 6);
    v17 = *((_OWORD *)off_1E50B8398 + 1);
    v18 = *(_OWORD *)off_1E50B8398;
    v8 = *((_QWORD *)off_1E50B8398 + 4);
    do
    {
      v9 = *(double *)(v4 + 40);
      v10 = *(double *)(v4 + 48);
      v30.origin.x = 0.0;
      v30.origin.y = 0.0;
      v30.size.width = v9;
      v30.size.height = v10;
      MidX = CGRectGetMidX(v30);
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.width = v9;
      v31.size.height = v10;
      MidY = CGRectGetMidY(v31);
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      v32.size.width = v9;
      v32.size.height = v10;
      Width = CGRectGetWidth(v32);
      v33.origin.x = 0.0;
      v33.origin.y = 0.0;
      v33.size.width = v9;
      v33.size.height = v10;
      Height = CGRectGetHeight(v33);
      v14.f64[0] = Width;
      v14.f64[1] = Height;
      *(CGFloat *)v7 = MidX;
      *(CGFloat *)&v7[1] = MidY;
      v7[2] = (float32x2_t)0xC059000000000000;
      v7[3] = vcvt_f32_f64(v14);
      *v6 = v28;
      v6[1] = v27;
      v6[4] = v25;
      v6[5] = v26;
      v6[2] = v23;
      v6[3] = v24;
      v6[8] = v21;
      v6[9] = v22;
      v6[6] = v19;
      v6[7] = v20;
      *(_QWORD *)(v5 + 32) = v8;
      *(_OWORD *)v5 = v18;
      *(_OWORD *)(v5 + 16) = v17;
      *(_BYTE *)(v5 + 1) = 3;
      v15 = vcvt_f32_f64(*(float64x2_t *)(v4 + 40));
      result = objc_msgSend(*(id *)(v4 + 32), "displayScale");
      *(float *)&v16 = v16;
      *(float32x2_t *)(v5 + 8) = vmul_n_f32(v15, *(float *)&v16);
      v6 += 10;
      v7 += 4;
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

void __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke_2(uint64_t a1, unint64_t a2, double *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  double *v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  CGAffineTransform v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  CGAffineTransform v66;
  uint64_t v67;
  CGRect v68;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "visibleRect");
  v7 = v6;
  v9 = v8;
  v65 = 0;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "zoomState");
  }
  else
  {
    v65 = 0;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
  }

  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = &v52 - 2 * v14;
  objc_msgSend(*(id *)(a1 + 32), "anchorAssetReference", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryItemsLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "anchorAssetReference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v52 = v9;
    v53 = v7;
    if (v18)
    {
      objc_msgSend(v18, "indexPath", v52, v53);
      v20 = v58;
    }
    else
    {
      v20 = 0;
      v57 = 0u;
      v58 = 0u;
    }
    objc_msgSend(v17, "frameForItem:", v20, v52, v53);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    *(_QWORD *)&v55 = 0;
    memset(&v54, 0, sizeof(v54));
    v33 = *(id **)(a1 + 32);
    objc_msgSend(v33[133], "primaryLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_spriteTransformForLayout:", v34);

    v66 = v54;
    v68.origin.x = v26;
    v68.origin.y = v28;
    v68.size.width = v30;
    v68.size.height = v32;
    CGRectApplyAffineTransform(v68, &v66);
    PXRectGetCenter();
    v24 = v35;
    v23 = v36;
    objc_msgSend(*(id *)(a1 + 32), "normalizedScaleCenterInAnchorSprite");
    if ((PXPointIsNull() & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "normalizedScaleCenterInAnchorSprite", 0.5, 0.5);
    PXPointDenormalize();
    v21 = v37;
    v22 = v38;
  }
  else
  {
    v21 = *(_QWORD *)off_1E50B8580;
    v22 = *((_QWORD *)off_1E50B8580 + 1);
    v23 = v22;
    v24 = *(_QWORD *)off_1E50B8580;
  }
  v39 = HIDWORD(a2);
  v56 = 0;
  v55 = 0u;
  memset(&v54, 0, sizeof(v54));
  v40 = *(void **)(a1 + 32);
  objc_msgSend(v40, "primaryItemsLayout");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_getMiniModeInfo:forLayout:", &v54, v41);

  *v15 = v24;
  v15[1] = v23;
  v15[2] = v21;
  v15[3] = v22;
  objc_msgSend(*(id *)(a1 + 32), "scaleCenterTargetInViewport");
  PXPointAdd();
  v15[4] = v42;
  v15[5] = v43;
  PXPointDenormalize();
  v15[6] = v44;
  v15[7] = v45;
  *((_OWORD *)v15 + 4) = *(_OWORD *)&v54.tx;
  if (*(_DWORD *)(a1 + 64) == 5)
  {
    if (!v39)
      return;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXZoomablePhotosLayout.m"), 2415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("i == spriteCount"));

    if (!v39)
      return;
  }
  v46 = 0;
  v47 = *(double *)(a1 + 56) * -0.5 + 10.0;
  if (v39 <= 1)
    v48 = 1;
  else
    v48 = v39;
  v49 = (double *)(v15 + 1);
  do
  {
    v50 = *v49 - v47;
    *a3 = *(v49 - 1);
    a3[1] = v50;
    a3[2] = (float)(-200.0 - (float)v46++);
    v49 += 2;
    a3 += 4;
  }
  while (v48 != v46);
}

void __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[6];

  PXDisplayAssetFetchResultSubfetchResultWithRange();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "preheatThumbnailDataForAssets:origin:targetSize:", v2, 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke_2;
  v4[3] = &unk_1E5144EB8;
  v3 = *(_QWORD *)(a1 + 80);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1312 + *(_QWORD *)(result + 40)) = 0;
  return result;
}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3)
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  objc_msgSend(*(id *)(a1 + 32), "entityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_3;
  v9[3] = &unk_1E5123AE0;
  v7 = a3[1];
  v11 = *a3;
  v12 = v7;
  v13 = *((_QWORD *)a3 + 4);
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  v14 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v6, "performChanges:", v9);

}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_4(uint64_t a1, uint64_t a2, __int128 *a3)
{
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  objc_msgSend(*(id *)(a1 + 32), "entityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_5;
  v12[3] = &unk_1E5123B30;
  v22 = a2;
  v15 = *(_OWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 80);
  v16 = *(_OWORD *)(a1 + 64);
  v17 = v9;
  v18 = *(_QWORD *)(a1 + 96);
  v10 = a3[1];
  v19 = *a3;
  v20 = v10;
  v21 = *((_QWORD *)a3 + 4);
  v23 = *(_BYTE *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  v14 = v11;
  objc_msgSend(v7, "performChanges:", v12);

}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_5(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v20;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v23;
  float64x2_t v24;
  float v25;
  double v26;
  int v27;
  int v28;
  float v29;
  void *v30;
  double v31;
  uint64_t v32;
  int v33;
  id v34;
  double v35;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v34 = a2;
  LODWORD(v3) = *(_DWORD *)(a1 + 148);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      if (v7 == (_DWORD)v3 - 1)
        v8 = *(_QWORD *)(a1 + 48) - v6;
      else
        v8 = *(_QWORD *)(a1 + 56);
      v9 = v8 + v6;
      v10 = objc_msgSend(*(id *)(a1 + 32), "count") - (v8 + v6);
      v11 = objc_msgSend(*(id *)(a1 + 32), "count") + ~v6;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v10 & ~(v10 >> 63));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v11 & ~(v11 >> 63));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v12, "collapseProgress");
      if (v13)
        objc_msgSend(v13, "collapseProgress");
      objc_msgSend(v12, "yPosition");
      objc_msgSend(v13, "yPosition");
      PXFloatByLinearlyInterpolatingFloats();
      v14 = *(double *)(a1 + 64);
      PXFloatByLinearlyInterpolatingFloats();
      v35 = v14 * v15;
      PXFloatByLinearlyInterpolatingFloats();
      PXRectWithCenterAndSize();
      x = v37.origin.x;
      y = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      v20 = *(_QWORD *)(a1 + 120) + v4;
      *(float *)&v14 = 0.0 + -0.1;
      MidX = CGRectGetMidX(v37);
      v38.origin.x = x;
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      MidY = CGRectGetMidY(v38);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v36 = CGRectGetWidth(v39);
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v23 = CGRectGetHeight(v40);
      v24.f64[0] = v36;
      v24.f64[1] = v23;
      *(CGFloat *)v20 = MidX;
      *(CGFloat *)(v20 + 8) = MidY;
      *(double *)(v20 + 16) = *(float *)&v14;
      *(float32x2_t *)(v20 + 24) = vcvt_f32_f64(v24);
      v25 = 0.0;
      if (v11 < 0)
      {
        v27 = 0;
        v26 = v35;
      }
      else
      {
        v26 = v35;
        if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
        {
          v27 = 0;
        }
        else
        {
          v28 = PXFloatApproximatelyEqualToFloat();
          v27 = v28 ^ 1;
          v29 = 0.2;
          if (!*(_BYTE *)(a1 + 152))
            v29 = 1.0;
          if (v28)
            v25 = 0.0;
          else
            v25 = v29;
        }
      }
      *(float *)(*(_QWORD *)(a1 + 128) + v5) = v25;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "objectAtIndexedSubscript:", v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setExposure:", 0.0);
      PXFloatSaturate();
      objc_msgSend(v30, "setMultiplier:");
      if (v27)
        v31 = v26;
      else
        v31 = 0.0;
      objc_msgSend(v30, "setRadius:", v31);
      v32 = *(unsigned int *)(*(_QWORD *)(a1 + 112) + 4 * v7);
      v33 = objc_msgSend(v30, "effectId");
      *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v34), "mutableEffectIds") + 4 * v32) = v33;

      ++v7;
      v3 = *(unsigned int *)(a1 + 148);
      v5 += 160;
      v4 += 32;
      v6 = v9;
    }
    while (v7 < v3);
  }

}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 *v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;

  v37 = a2;
  if (*(_DWORD *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v35 = *((_OWORD *)off_1E50B8358 + 1);
    v36 = *(_OWORD *)off_1E50B8358;
    v34 = *(_OWORD *)off_1E50B83A0;
    v32 = *((_OWORD *)off_1E50B83A0 + 5);
    v33 = *((_OWORD *)off_1E50B83A0 + 1);
    v30 = *((_OWORD *)off_1E50B83A0 + 3);
    v31 = *((_OWORD *)off_1E50B83A0 + 4);
    v28 = *((_OWORD *)off_1E50B83A0 + 9);
    v29 = *((_OWORD *)off_1E50B83A0 + 2);
    v26 = *((_OWORD *)off_1E50B83A0 + 7);
    v27 = *((_OWORD *)off_1E50B83A0 + 8);
    v25 = *((_OWORD *)off_1E50B83A0 + 6);
    v23 = *((_OWORD *)off_1E50B8398 + 1);
    v24 = *(_OWORD *)off_1E50B8398;
    __asm { FMOV            V8.2S, #1.0 }
    v12 = *((_QWORD *)off_1E50B8398 + 4);
    do
    {
      v13 = objc_alloc((Class)off_1E50B29D8);
      objc_msgSend(*(id *)(a1 + 32), "entityManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithEntityManager:", v14);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
      v16 = (__int128 *)(*(_QWORD *)(a1 + 64) + v3);
      *v16 = v36;
      v16[1] = v35;
      v17 = (__int128 *)(*(_QWORD *)(a1 + 72) + v4);
      *v17 = v34;
      v17[1] = v33;
      v17[4] = v31;
      v17[5] = v32;
      v17[2] = v29;
      v17[3] = v30;
      v17[8] = v27;
      v17[9] = v28;
      v17[6] = v25;
      v17[7] = v26;
      v18 = *(_QWORD *)(a1 + 80) + v5;
      *(_OWORD *)v18 = v24;
      *(_OWORD *)(v18 + 16) = v23;
      *(_QWORD *)(v18 + 32) = v12;
      v19 = *(_QWORD *)(a1 + 80) + v5;
      if (*(_BYTE *)(a1 + 88))
      {
        *(_QWORD *)(v19 + 8) = _D8;
        v20 = 5;
      }
      else
      {
        v20 = 9;
      }
      *(_BYTE *)(v19 + 1) = v20;
      v21 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * v6);
      v22 = objc_msgSend(v15, "effectId", v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
      *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v37), "mutableEffectIds") + 4 * v21) = v22;

      ++v6;
      v5 += 40;
      v4 += 160;
      v3 += 32;
    }
    while (v6 < *(unsigned int *)(a1 + 48));
  }

}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  int v18;

  v4 = *(_OWORD **)(a3 + 16);
  v5 = *((_OWORD *)off_1E50B8358 + 1);
  *v4 = *(_OWORD *)off_1E50B8358;
  v4[1] = v5;
  v6 = *(_OWORD **)(a3 + 24);
  v7 = *((_OWORD *)off_1E50B83A0 + 1);
  *v6 = *(_OWORD *)off_1E50B83A0;
  v6[1] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 5);
  v6[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v6[5] = v8;
  v9 = *((_OWORD *)off_1E50B83A0 + 3);
  v6[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v6[3] = v9;
  v10 = *((_OWORD *)off_1E50B83A0 + 9);
  v6[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v6[9] = v10;
  v11 = *((_OWORD *)off_1E50B83A0 + 7);
  v6[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v6[7] = v11;
  v12 = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v12 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  v13 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v12 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v12 + 16) = v13;
  *(_BYTE *)(*(_QWORD *)(a3 + 32) + 1) = 9;
  v14 = **(_DWORD **)(a3 + 8);
  objc_msgSend(*(id *)(a1 + 32), "entityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_2;
  v17[3] = &unk_1E5126CC8;
  v18 = v14;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v16, "performChanges:", v17);

}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_3(uint64_t a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v13;
  float64x2_t v14;
  float v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  objc_msgSend(*(id *)(a1 + 32), "visibleRect");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v16 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = CGRectGetHeight(v20);
  v14.f64[0] = v16;
  v14.f64[1] = v13;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[3] = vcvt_f32_f64(v14);
  a3[2] = (float32x2_t)0xBFE0000000000000;
  v15 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v15 = 0.0;
  *a4 = v15;
}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  v4 = a2;
  LODWORD(v3) = objc_msgSend(v3, "effectId");
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "mutableEffectIds");

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = (_DWORD)v3;
}

void __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  CGRect v26;
  CGAffineTransform v27;
  uint64_t v28;
  CGAffineTransform buf;
  uint64_t v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayoutAtIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemsLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "alpha");
  if (v9 > 0.0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v8, "interItemSpacing");
    if (v10 > 0.0 && (objc_msgSend(*(id *)(a1 + 32), "_layoutIsQuiteTransparent:", v8) & 1) == 0)
    {
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1108)
                                                                                       + *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104)))
      {
        PLGridZeroGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.a) = 0;
          _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Not enough background sprites available to satisfy visible layers", (uint8_t *)&buf, 2u);
        }

      }
      else
      {
        v11 = *(_OWORD *)(a3 + 88);
        *(_OWORD *)&buf.a = *(_OWORD *)(a3 + 72);
        *(_OWORD *)&buf.c = v11;
        *(_OWORD *)&buf.tx = *(_OWORD *)(a3 + 104);
        v30 = *(_QWORD *)(a3 + 120);
        objc_msgSend(v8, "loadedItemsRect");
        v31 = buf;
        v33 = CGRectApplyAffineTransform(v32, &v31);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        objc_msgSend(*(id *)(a1 + 32), "displayScale");
        PXFloatRoundToPixel();
        v17 = -v16;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v35 = CGRectInset(v34, v17, v17);
        v18 = *(void **)(a1 + 32);
        v19 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) | 0x100000000;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke_2;
        v23[3] = &unk_1E5123A00;
        v26 = v35;
        v28 = v30;
        v27 = buf;
        v20 = v8;
        v21 = *(_QWORD *)(a1 + 32);
        v24 = v20;
        v25 = v21;
        objc_msgSend(v18, "modifySpritesInRange:state:", v19, v23);
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      }
    }
  }

}

void __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke_276(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t i;

  for (i = HIDWORD(a2); i; --i)
  {
    *a4 = 0;
    a4 += 40;
  }
}

float __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke_2(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v16;
  double v17;
  float result;
  CGFloat Width;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = v9;
  v21.origin.y = v10;
  v21.size.width = v11;
  v21.size.height = v12;
  MidY = CGRectGetMidY(v21);
  v22.origin.x = v9;
  v22.origin.y = v10;
  v22.size.width = v11;
  v22.size.height = v12;
  Width = CGRectGetWidth(v22);
  v23.origin.x = v9;
  v23.origin.y = v10;
  v23.size.width = v11;
  v23.size.height = v12;
  Height = CGRectGetHeight(v23);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = 0;
  a3[3] = vcvt_f32_f64(v16);
  *(double *)&a3[2] = *(double *)(a1 + 128) + 10.0;
  *(_DWORD *)(a4 + 52) = -1046478848;
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  result = v17;
  *(float *)a4 = result;
  *(_WORD *)(a5 + 32) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1112);
  return result;
}

void __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform v35;
  __int128 v36;
  __int128 v37;
  CGAffineTransform v38;
  CGAffineTransform v39;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayoutAtIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemsLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = *((_OWORD *)off_1E50B8368 + 1);
  v34 = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&v38.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&v38.c = v33;
  v32 = *((_OWORD *)off_1E50B8368 + 2);
  *(_OWORD *)&v38.tx = v32;
  v9 = *((double *)off_1E50B8368 + 6);
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "containsObject:", v8);
  v11 = v10;
  if (*(_QWORD *)(a1 + 56) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v10 & 1) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "indexPath");
    v14 = v37;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PXZoomablePhotosLayout.m"), 1960, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchorAssetReference != nil"));

    v14 = 0;
    v36 = 0u;
    v37 = 0u;
  }
  objc_msgSend(v8, "frameForItem:", v14);
  PXPointDenormalize();
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "alpha");
  v19 = 1.0;
  v20 = 1.0;
  if (v21 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_scaleForLayout:", v8);
    v19 = v22;
    v20 = v23;
  }
  if (v8 == *(void **)(a1 + 48))
    PXSizeGetAspectRatio();
  else
    objc_msgSend(v8, "itemAspectRatio");
  v26 = *(double *)(a1 + 88);
  v25 = *(double *)(a1 + 96);
  v27 = *(double *)(a1 + 104);
  *(_OWORD *)&v35.a = v34;
  *(_OWORD *)&v35.c = v33;
  *(_OWORD *)&v35.tx = v32;
  *(_OWORD *)&v39.a = v34;
  *(_OWORD *)&v39.c = v33;
  *(_OWORD *)&v39.tx = v32;
  v28 = v24 / v26;
  CGAffineTransformTranslate(&v35, &v39, v25, v27);
  v38 = v35;
  v39 = v35;
  CGAffineTransformScale(&v35, &v39, v19, v20 * v28);
  v38 = v35;
  v39 = v35;
  CGAffineTransformTranslate(&v35, &v39, -v16, -v18);
  v38 = v35;
  v29 = (float)((float)(unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "indexOfObject:", v8) + 1)
              * 20.0);
  v35 = v38;
  v39 = v38;
  CGAffineTransformTranslate(&v35, &v39, 0.0, 0.0);
  v9 = v9 + 0.0 + v29;
  v38 = v35;

  if ((v11 & 1) == 0)
  {
LABEL_12:
    v35 = v38;
    v39 = v38;
    CGAffineTransformTranslate(&v35, &v39, 100000.0, 0.0);
    v9 = v9 + 0.0;
    v38 = v35;
  }
LABEL_13:
  v30 = *(_OWORD *)&v38.c;
  *(_OWORD *)(a3 + 72) = *(_OWORD *)&v38.a;
  *(_OWORD *)(a3 + 88) = v30;
  *(_OWORD *)(a3 + 104) = *(_OWORD *)&v38.tx;
  *(double *)(a3 + 120) = v9;
  objc_msgSend(v8, "numberOfColumns");
  objc_msgSend(v8, "alpha");
  kdebug_trace();

}

uint64_t __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "invalidateAnchorItemFrames");
}

id __43__PXZoomablePhotosLayout__updateDataSource__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PXZoomablePhotosLayout"), 1.0);
}

void __53__PXZoomablePhotosLayout__updateDecorationVisibility__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "decoratingLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "alpha");
  v6 = v5;
  v7 = *(double *)(a1 + 40);
  if (v6 != v7)
  {
    v7 = 0.0;
    if (v4 == v9)
      v7 = *(double *)(a1 + 48);
  }
  objc_msgSend(v3, "setAlpha:", v7);
  objc_msgSend(v3, "alpha");
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v9, "alpha");
    v8 = PXFloatApproximatelyEqualToFloat() ^ 1;
  }
  objc_msgSend(v3, "setEnabled:", v8);

}

uint64_t __41__PXZoomablePhotosLayout__updateMiniMode__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureMiniModeSpriteModifierForLayout:", a2);
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutExtendsContentBelowBounds:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "itemsLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfColumns");

  objc_msgSend(v4, "itemsLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "numberOfColumns");
  if (v6 > v8)
    return -1;
  else
    return v8 > v6;
}

BOOL __39__PXZoomablePhotosLayout__updateLayers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "itemsLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfColumns") == *(_QWORD *)(a1 + 32);

  return v4;
}

void __39__PXZoomablePhotosLayout__updateLayers__block_invoke_255(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "numberOfColumns");
  objc_msgSend(*(id *)(a1 + 32), "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxColumnsForStickyHeaderDisplay");

  if (v7 <= v9)
    goto LABEL_8;
  v10 = *(id **)(a1 + 32);
  v11 = v10 + 173;
  if (!v10[174])
  {
    v11 = v10 + 174;
    goto LABEL_7;
  }
  if (!*v11)
  {
LABEL_7:
    objc_storeStrong(v11, a2);
    goto LABEL_8;
  }
  if (!v10[175])
  {
    objc_storeStrong(v10 + 175, a2);
    *a4 = 1;
  }
LABEL_8:

}

void __39__PXZoomablePhotosLayout__updateLayers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfColumns:", objc_msgSend(v6, "integerValue"));

  objc_msgSend(*(id *)(a1 + 40), "_configureLayout:", v7);
}

void __68__PXZoomablePhotosLayout__configureMiniModeSpriteModifierForLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;

  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = *(_OWORD *)(a4 + 16);
  v10[0] = *(_OWORD *)a4;
  v10[1] = v9;
  v11 = *(_QWORD *)(a4 + 32);
  objc_msgSend(WeakRetained, "_modifyMiniModeSpritesForLayout:spriteIndexRange:sprites:", v7, a3, v10);

}

uint64_t __44__PXZoomablePhotosLayout_setEffectProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateEffects");
}

void __34__PXZoomablePhotosLayout_setSpec___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  objc_msgSend(v8, "zoomToColumnIndex:withAnchorAssetReference:animated:", v7, 0, 0);
}

uint64_t __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoomToColumnIndex:withAnchorAssetReference:animated:", *(_QWORD *)(a1 + 32), 0, 0);
}

void __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_3(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v26;

  v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v5 = (_OWORD *)a3[3];
    v4 = a3[4];
    v6 = (_OWORD *)a3[2];
    v7 = *(_OWORD *)off_1E50B8358;
    v8 = *((_OWORD *)off_1E50B8358 + 1);
    v9 = *(_OWORD *)off_1E50B83A0;
    v10 = *((_OWORD *)off_1E50B83A0 + 1);
    v12 = *((_OWORD *)off_1E50B83A0 + 4);
    v11 = *((_OWORD *)off_1E50B83A0 + 5);
    v14 = *((_OWORD *)off_1E50B83A0 + 2);
    v13 = *((_OWORD *)off_1E50B83A0 + 3);
    v16 = *((_OWORD *)off_1E50B83A0 + 8);
    v15 = *((_OWORD *)off_1E50B83A0 + 9);
    v18 = *((_OWORD *)off_1E50B83A0 + 6);
    v17 = *((_OWORD *)off_1E50B83A0 + 7);
    v19 = *(_OWORD *)off_1E50B8398;
    v20 = *((_OWORD *)off_1E50B8398 + 1);
    __asm { FMOV            V22.2S, #1.0 }
    v26 = *((_QWORD *)off_1E50B8398 + 4);
    do
    {
      *v6 = v7;
      v6[1] = v8;
      v6 += 2;
      *v5 = v9;
      v5[1] = v10;
      v5[4] = v12;
      v5[5] = v11;
      v5[2] = v14;
      v5[3] = v13;
      v5[8] = v16;
      v5[9] = v15;
      v5[6] = v18;
      v5[7] = v17;
      *(_QWORD *)(v4 + 32) = v26;
      *(_OWORD *)v4 = v19;
      *(_OWORD *)(v4 + 16) = v20;
      v5 += 10;
      *(_BYTE *)(v4 + 1) = 5;
      *(_QWORD *)(v4 + 8) = _D22;
      v4 += 40;
      --v3;
    }
    while (v3);
  }
}

uint64_t __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateAllSectionsIfNeeded");
}

+ (void)getBestAnchorColumns:(int64_t *)a3 forItemLayouts:(id)a4 startingAtBaseLayout:(id)a5 anchorItem:(int64_t)a6 normalizedScaleCenterInAnchor:(CGPoint)a7 biasTowardsCenter:(BOOL)a8
{
  double x;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double *v44;
  char *v45;
  uint64_t v46;
  char v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  int64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger location;
  void *v62;
  double v63;
  NSRange v64;
  NSUInteger length;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  double v71;
  NSRange v72;
  void *v73;
  char *v74;
  uint64_t v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  int64_t *v83;
  SEL v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  char *v92;
  size_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  double *v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  _BOOL4 v104;
  double v105;
  double v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  NSRange v112;

  v104 = a8;
  x = a7.x;
  v83 = a3;
  v84 = a2;
  v85 = a1;
  v111 = *MEMORY[0x1E0C80C00];
  v110 = a4;
  v11 = a5;
  v12 = objc_msgSend(v110, "count");
  v13 = objc_msgSend(v110, "indexOfObject:", v11);
  v109 = v12;
  if (v12 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", v84, v85, CFSTR("PXZoomablePhotosLayout.m"), 2517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutCount > 0"));

  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", v84, v85, CFSTR("PXZoomablePhotosLayout.m"), 2518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchorItem != NSNotFound"));

  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", v84, v85, CFSTR("PXZoomablePhotosLayout.m"), 2519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseLayoutIndex != NSNotFound"));

  }
  PXGAssertErrValidPoint();
  v108 = objc_msgSend(v11, "columnForItem:", a6);
  v14 = objc_msgSend(v11, "numberOfColumns");
  if (v109 < 1)
  {
LABEL_11:
    v15 = 0;
  }
  else
  {
    v15 = 0;
    while (1)
    {
      objc_msgSend(v110, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "numberOfColumns");

      if (v17 > 1)
        break;
      if (v109 == ++v15)
        goto LABEL_11;
    }
  }
  objc_msgSend(v110, "objectAtIndexedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "numberOfColumns");

  v82 = v11;
  if (v104)
  {
    if (v19 >= 0)
      v21 = v19;
    else
      v21 = v19 + 1;
    v95 = v21 >> 1;
    v22 = 1;
  }
  else
  {
    v23 = v108;
    if (v13 != v15)
      v23 = 0;
    v95 = v23;
    if (v13 == v15)
      v22 = 1;
    else
      v22 = v19;
  }
  v96 = v22;
  v81 = (uint64_t)&v81;
  MEMORY[0x1E0C80A78](v20);
  v94 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v28);
  v92 = (char *)&v81 - v30;
  v32 = 8 * v31;
  if (v19 >= 1)
  {
    v33 = 0;
    v34 = v94;
    v35 = v19;
    do
    {
      *v34 = 0;
      if (v109 >= 1)
      {
        v36 = &v92[v33];
        bzero(&v27[v33], v32);
        memset_pattern16(v36, &unk_1A7C0CA20, v32);
      }
      v33 += v32;
      ++v34;
      --v35;
    }
    while (v35);
  }
  v37 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v96)
  {
LABEL_93:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v29);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", v84, v85, CFSTR("PXZoomablePhotosLayout.m"), 2709, CFSTR("Must be able to find a zoom plan solution"));

    goto LABEL_94;
  }
  v38 = 0;
  v39 = 1.0 / (double)v14;
  v40 = 1.0 / (double)v19;
  v41 = v39 * 0.5 + v39 * (double)v108;
  v106 = v39;
  v42 = 0.5;
  v91 = v40;
  v90 = v40 * 0.5;
  v89 = -v41;
  v97 = v40 / v39;
  v88 = 1.0 - v40 / v39;
  v103 = v41;
  v107 = x * v39 + v39 * (double)v108;
  v105 = v41 - v107;
  v43 = v95;
  v44 = (double *)&v27[8 * v109 * v95];
  v45 = &v92[8 * v109 * v95];
  v101 = 1000.0;
  v87 = -0.025;
  v86 = 0.025;
  v93 = v32;
  do
  {
    v100 = v38;
    v46 = v38 + v43;
    v47 = PXFloatApproximatelyEqualToFloat();
    v48 = v107;
    if ((v47 & 1) == 0)
      v48 = (v90 + v91 * (double)v46 + v89 * v97) / v88;
    v98 = v46;
    v99 = v44;
    if (v109 < 1)
    {
      v51 = 0.0;
      goto LABEL_84;
    }
    v49 = 0;
    v102 = v103 - v48;
    v50 = 0.0;
    v51 = 0.0;
    while (1)
    {
      objc_msgSend(v110, "objectAtIndexedSubscript:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "numberOfColumns");
      v54 = v53;
      v55 = (double)v53;
      v56 = 1.0 / (double)v53;
      v57 = v56 / v106;
      if (v53)
      {
        v58 = v48 + v102 * v57;
        if (v104)
          v58 = v42;
        v59 = vcvtmd_s64_f64(v58 * v55);
        if (v53 - 1 < v59)
          v59 = v53 - 1;
        v60 = v59 & ~(v59 >> 63);
      }
      else
      {
        v60 = 0x7FFFFFFFFFFFFFFFLL;
      }
      location = 0;
      if (!v49)
        goto LABEL_47;
      objc_msgSend(v110, "objectAtIndexedSubscript:", v49 - 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v62, "numberOfColumns") <= 1)
      {

LABEL_47:
        length = v54;
        if (!v54)
          goto LABEL_83;
        goto LABEL_48;
      }
      v63 = *(v44 - 1);

      if (v63 == 0.0)
        goto LABEL_47;
      if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
        goto LABEL_77;
      if (v50 <= 0.0)
      {
        if (v50 < 0.0)
        {
          v64.location = 0;
          v64.length = vcvtmd_s64_f64((v63 + v86 + v56 * -0.5) * v55) + 1;
          goto LABEL_79;
        }
LABEL_77:
        v64.location = 0;
        goto LABEL_78;
      }
      v64.location = vcvtpd_s64_f64((v63 + v87 + v56 * -0.5) * v55);
LABEL_78:
      v64.length = v54;
LABEL_79:
      v112.location = 0;
      v112.length = v54;
      v72 = NSIntersectionRange(v64, v112);
      length = v72.length;
      location = v72.location;
      if (!v72.length)
        goto LABEL_83;
LABEL_48:
      if (location == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_83;
      v66 = length + location - 1;
      if (v66 >= v60)
        v66 = v60;
      v67 = (uint64_t)location <= v66 ? v66 : location;
      if (v67 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_83;
      if (v13 == v49 && v108 >= location && v108 - location < length && v67 != v108 && !v104)
        break;
      v68 = v56 * 0.5 + v56 * (double)v67;
      v69 = vabdd_f64(v68, v107 + v105 * v57);
      if (v13 == v49 && (v108 - location >= length || v108 < location))
        v69 = v69 + v101;
      v42 = 0.5;
      *(_QWORD *)&v45[8 * v49] = v67;
      *v44 = v68;
      if (v13 != v49 && v50 == 0.0 && v54 >= 2 && (PXFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        PXFloatSign();
        if (v49 <= v13)
          v50 = v71;
        else
          v50 = -v71;
      }
      v51 = v51 + v69;

      ++v49;
      ++v44;
      if (v109 == v49)
        goto LABEL_84;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v84, v85, CFSTR("PXZoomablePhotosLayout.m"), 2652, CFSTR("finalColumn (%ld) != baseAnchorColumn (%ld)"), v67, v108);

LABEL_83:
    v51 = 1.79769313e308;
    v42 = 0.5;
LABEL_84:
    PXGAssertErrValidFloat();
    v74 = v94;
    *(double *)&v94[8 * v98] = v51;
    v38 = v100 + 1;
    v32 = v93;
    v44 = (double *)((char *)v99 + v93);
    v45 += v93;
    v75 = v96;
    v43 = v95;
  }
  while (v100 + 1 != v96);
  v37 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = 1.79769313e308;
  do
  {
    if (*(double *)&v74[8 * v43] < v29)
    {
      v37 = v43;
      v29 = *(double *)&v74[8 * v43];
    }
    ++v43;
    --v75;
  }
  while (v75);
  if (v37 == 0x7FFFFFFFFFFFFFFFLL || v29 >= 1.79769313e308)
    goto LABEL_93;
LABEL_94:
  memcpy(v83, &v92[8 * v37 * v109], v32);

}

+ (id)visualizeBestAnchorColumnsForLayouts:(id)a3 imageWidth:(double)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  CGImage *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, CGContext *, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (double)(v7 - 1);
  PXEdgeInsetsMake();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __74__PXZoomablePhotosLayout_visualizeBestAnchorColumnsForLayouts_imageWidth___block_invoke;
  v20 = &unk_1E5123CF8;
  v22 = a4;
  v23 = v10 + v9 + a4 * 0.075 * v8 + (a4 * 0.075 * 0.5 * v8 + (double)v7 * (a4 * 0.075)) * (double)v7;
  v24 = v9;
  v25 = v11;
  v26 = v10;
  v27 = v12;
  v28 = a4;
  v29 = v7;
  v21 = v6;
  v30 = a4 * 0.075;
  v31 = a4 * 0.075 * 0.5;
  v32 = a1;
  v33 = v31 * v8 + (double)v7 * (a4 * 0.075);
  v34 = a4 * 0.075;
  v13 = v6;
  v14 = (CGImage *)MEMORY[0x1A85CCE98](1, 0, &v17, a4, v23);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v14);

  return v15;
}

void __74__PXZoomablePhotosLayout_visualizeBestAnchorColumnsForLayouts_imageWidth___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  int v30;
  uint64_t v31;
  char v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double *v36;
  CGFloat v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  const CGPoint *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  CGFloat v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  const CGPoint *v62;
  uint64_t v63;
  double *p_y;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[72];
  uint64_t v74;
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v74 = *MEMORY[0x1E0C80C00];
  PXEdgeInsetsInsetSize();
  v13 = v12;
  CGContextTranslateCTM(a2, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(a2, 1.0, -1.0);
  CGContextSetRGBFillColor(a2, 1.0, 1.0, 1.0, 1.0);
  v76.origin.x = a3;
  v76.origin.y = a4;
  v76.size.width = a5;
  v76.size.height = a6;
  CGContextFillRect(a2, v76);
  PXClamp();
  CGContextSetLineWidth(a2, v14);
  CGContextTranslateCTM(a2, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 56));
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v18);
  v62 = (const CGPoint *)(&v53 - 2 * v20);
  v65 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectPassingTest:", &__block_literal_global_344_85962, v19);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v54 = *(id *)(a1 + 32);
  v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v70;
    p_y = &v62->y;
    v55 = 0.9;
    v63 = 0x3FC999999999999ALL;
    v61 = 0x3FD3333333333333;
    v60 = 0x3FE999999999999ALL;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v70 != v56)
          objc_enumerationMutation(v54);
        v58 = v21;
        v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v21);
        CGContextSetRGBStrokeColor(a2, v55, v55, v55, 1.0);
        if (*(uint64_t *)(a1 + 96) >= 1)
        {
          v23 = 0;
          do
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "numberOfColumns");
            if (objc_msgSend(v24, "numberOfColumns") >= 1)
            {
              v26 = 0;
              v27 = 1.0 / (double)v25;
              do
              {
                v77.origin.x = v13 * (v27 * (double)v26);
                v77.size.height = *(CGFloat *)(a1 + 104);
                v77.origin.y = (v77.size.height + *(double *)(a1 + 112)) * (double)v23;
                v77.size.width = v13 * v27;
                CGContextStrokeRect(a2, v77);
                ++v26;
              }
              while (v26 < objc_msgSend(v24, "numberOfColumns"));
            }

            ++v23;
          }
          while (v23 < *(_QWORD *)(a1 + 96));
        }
        v28 = objc_msgSend(v22, "numberOfColumns");
        v66 = 0;
        v67 = (uint64_t)fmax(v13 * (1.0 / (double)v28) / 20.0, 3.0);
        v29 = (double)(v67 - 1);
        v30 = 1;
        do
        {
          v59 = v30;
          if (objc_msgSend(v22, "numberOfColumns") >= 1)
          {
            v68 = 0;
            while (v67 < 1)
            {
LABEL_38:
              v51 = v68 + 1;
              v52 = objc_msgSend(v22, "numberOfColumns");
              v68 = v51;
              if (v51 >= v52)
                goto LABEL_39;
            }
            v31 = 0;
            while (2)
            {
              v32 = v66;
              objc_msgSend(*(id *)(a1 + 120), "getBestAnchorColumns:forItemLayouts:startingAtBaseLayout:anchorItem:normalizedScaleCenterInAnchor:biasTowardsCenter:", v17, *(_QWORD *)(a1 + 32), v22, v68, v66 & 1, (double)v31 / v29, 0.5);
              v33 = 1.0;
              if ((v32 & 1) != 0)
              {
                v34 = 0.68;
                v35 = 0.26;
                v36 = (double *)&v75;
                goto LABEL_27;
              }
              v33 = 0.5;
              v34 = 0.5;
              v35 = 0.5;
              v37 = 0.5;
              if (v65 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v38 = *(_QWORD *)&v17[8 * v65];
                if (v38)
                {
                  if (v38 == 1)
                  {
                    v33 = 0.0;
                    v34 = *(double *)&v60;
                    goto LABEL_24;
                  }
                  v35 = 1.0;
                  v33 = 0.0;
                  v34 = 0.0;
                }
                else
                {
                  v34 = 0.0;
                  v33 = 1.0;
LABEL_24:
                  v35 = 0.0;
                }
                v36 = (double *)&v74;
LABEL_27:
                v37 = *(v36 - 32);
              }
              CGContextSetRGBStrokeColor(a2, v33, v34, v35, v37);
              if (*(uint64_t *)(a1 + 96) >= 1)
              {
                v39 = 0;
                v40 = p_y;
                do
                {
                  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v39);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = *(_QWORD *)&v17[8 * v39];
                  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v39);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v43, "numberOfColumns");

                  if (v41 == v22)
                    v45 = (double)v31 / v29;
                  else
                    v45 = 0.5;
                  v46 = v13 * (v45 * (1.0 / (double)v44) + (double)v42 * (1.0 / (double)v44));
                  v47 = *(double *)(a1 + 104) * 0.5 + (double)v39 * (*(double *)(a1 + 104) + *(double *)(a1 + 112));
                  *(v40 - 1) = v46;
                  *v40 = v47;

                  ++v39;
                  v48 = *(_QWORD *)(a1 + 96);
                  v40 += 2;
                }
                while (v39 < v48);
                if (v48 >= 2)
                {
                  v49 = 0;
                  v50 = v62;
                  do
                  {
                    CGContextStrokeLineSegments(a2, v50, 2uLL);
                    ++v49;
                    ++v50;
                  }
                  while (v49 < *(_QWORD *)(a1 + 96) - 1);
                }
              }
              if (++v31 == v67)
                goto LABEL_38;
              continue;
            }
          }
LABEL_39:
          v30 = 0;
          v66 = 1;
        }
        while ((v59 & 1) != 0);
        CGContextTranslateCTM(a2, 0.0, *(double *)(a1 + 128) + *(double *)(a1 + 136));
        v21 = v58 + 1;
      }
      while (v58 + 1 != v57);
      v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v57);
  }

}

BOOL __74__PXZoomablePhotosLayout_visualizeBestAnchorColumnsForLayouts_imageWidth___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "numberOfColumns") == 3;
}

@end
