@implementation PXPhotosDetailsHeaderTileWidget

- (PXPhotosDetailsHeaderTileWidget)init
{
  PXPhotosDetailsHeaderTileWidget *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalWorkQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosDetailsHeaderTileWidget;
  v2 = -[PXPhotosDetailsHeaderTileWidget init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.photosUICore.photosDetailsHeaderTileWidget.internalWork-queue", v4);
    internalWorkQueue = v2->_internalWorkQueue;
    v2->_internalWorkQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_loadBasicContent
{
  PXPhotosDetailsHeaderSpecManager *v3;
  PXPhotosDetailsHeaderSpecManager *specManager;
  PXPhotoKitUIMediaProvider *v5;
  PXPhotoKitUIMediaProvider *mediaProvider;
  void *v7;
  PXPhotosDetailsHeaderTileLayout *v8;
  void *v9;
  PXPhotosDetailsHeaderTileLayout *v10;
  PXTilingController *v11;
  PXTilingController *tilingController;
  PXBasicUIViewTileAnimator *v13;
  PXBasicUIViewTileAnimator *tileAnimator;
  PXReusableObjectPool *v15;
  PXReusableObjectPool *tilePool;
  NSMutableSet *v17;
  NSMutableSet *tilesInUse;
  id WeakRetained;
  void *v20;
  PXUITapGestureRecognizer *v21;
  PXUITapGestureRecognizer *tapGestureRecognizer;
  PXUITapGestureRecognizer *v23;
  PXUITapGestureRecognizer *pressGestureRecognizer;
  id v25;

  if (!-[PXPhotosDetailsHeaderTileWidget _isBasicContentLoaded](self, "_isBasicContentLoaded"))
  {
    -[PXPhotosDetailsHeaderTileWidget _setBasicContentLoaded:](self, "_setBasicContentLoaded:", 1);
    -[PXPhotosDetailsHeaderTileWidget extendedTraitCollection](self, "extendedTraitCollection");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[PXFeatureSpecManager initWithExtendedTraitCollection:]([PXPhotosDetailsHeaderSpecManager alloc], "initWithExtendedTraitCollection:", v25);
    specManager = self->_specManager;
    self->_specManager = v3;

    -[PXPhotosDetailsHeaderSpecManager registerChangeObserver:context:](self->_specManager, "registerChangeObserver:context:", self, PXPhotosDetailsHeaderSpecManagerObservationContext);
    v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = self->_mediaProvider;
    self->_mediaProvider = v5;

    -[PXFeatureSpecManager spec](self->_specManager, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget _setHeaderSpec:](self, "_setHeaderSpec:", v7);

    v8 = [PXPhotosDetailsHeaderTileLayout alloc];
    -[PXFeatureSpecManager spec](self->_specManager, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXPhotosDetailsHeaderTileLayout initWithSpec:](v8, "initWithSpec:", v9);

    -[PXPhotosDetailsHeaderTileLayout setDelegate:](v10, "setDelegate:", self);
    v11 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v10);
    tilingController = self->_tilingController;
    self->_tilingController = v11;

    -[PXTilingController setTileSource:](self->_tilingController, "setTileSource:", self);
    v13 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->_tileAnimator;
    self->_tileAnimator = v13;

    -[PXTilingController setTileAnimator:](self->_tilingController, "setTileAnimator:", self->_tileAnimator);
    -[PXTilingController setTransitionDelegate:](self->_tilingController, "setTransitionDelegate:", self);
    v15 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E50B46A0);
    tilePool = self->_tilePool;
    self->_tilePool = v15;

    -[PXReusableObjectPool setDelegate:](self->_tilePool, "setDelegate:", self);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](self->_tilePool, "registerReusableObjectForReuseIdentifier:creationHandler:", 0, &__block_literal_global_66326);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](self->_tilePool, "registerReusableObjectForReuseIdentifier:creationHandler:", 1, &__block_literal_global_135_66327);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](self->_tilePool, "registerReusableObjectForReuseIdentifier:creationHandler:", 2, &__block_literal_global_137_66328);
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:creationHandler:](self->_tilePool, "registerReusableObjectForReuseIdentifier:creationHandler:", 3, &__block_literal_global_139);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    tilesInUse = self->_tilesInUse;
    self->_tilesInUse = v17;

    WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
    objc_msgSend(WeakRetained, "widgetViewHostingGestureRecognizers:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTapGesture_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v21;

    -[PXUITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v20, "addGestureRecognizer:", self->_tapGestureRecognizer);
    if (objc_msgSend(v25, "userInterfaceIdiom") == 3)
    {
      -[PXUITapGestureRecognizer setAllowedPressTypes:](self->_tapGestureRecognizer, "setAllowedPressTypes:", &unk_1E53E9030);
    }
    else
    {
      v23 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTapGesture_);
      pressGestureRecognizer = self->_pressGestureRecognizer;
      self->_pressGestureRecognizer = v23;

      -[PXUITapGestureRecognizer setAllowedPressTypes:](self->_pressGestureRecognizer, "setAllowedPressTypes:", &unk_1E53E9048);
      -[PXUITapGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", self);
      objc_msgSend(v20, "addGestureRecognizer:", self->_pressGestureRecognizer);
    }
    *(_WORD *)&self->_needsUpdateFlags.keyAssets = 257;
    self->_needsUpdateFlags.curatedAssetCollection = 1;
    -[PXPhotosDetailsHeaderTileWidget _updateBasicContent](self, "_updateBasicContent");

  }
}

- (void)setContentSize:(CGSize)a3
{
  -[PXPhotosDetailsHeaderTileWidget _setContentSize:](self, "_setContentSize:", a3.width, a3.height);
  -[PXPhotosDetailsHeaderTileWidget _updateKeyAssetCropRect](self, "_updateKeyAssetCropRect");
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
    -[PXPhotosDetailsContext unregisterChangeObserver:context:](context, "unregisterChangeObserver:context:", self, PXPhotosDetailsContextObservationContext);
    objc_storeStrong((id *)&self->_context, a3);
    -[PXPhotosDetailsContext registerChangeObserver:context:](self->_context, "registerChangeObserver:context:", self, PXPhotosDetailsContextObservationContext);
    +[PXPhotosDetailsLoadCoordinator loadCoordinatorForContext:](PXPhotosDetailsLoadCoordinator, "loadCoordinatorForContext:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenForCuratedFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsHeaderTileWidget _setLoadCoordinationToken:](self, "_setLoadCoordinationToken:", v8);
    -[PXPhotosDetailsHeaderTileWidget _invalidateKeyAssets](self, "_invalidateKeyAssets");
    -[PXPhotosDetailsContext photosDataSource](v10, "photosDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget _setPhotosDataSource:](self, "_setPhotosDataSource:", v9);

    -[PXPhotosDetailsHeaderTileWidget _updateBasicContent](self, "_updateBasicContent");
  }

}

- (void)_setKeyAssetsFetchResult:(id)a3
{
  PHFetchResult *v5;

  v5 = (PHFetchResult *)a3;
  if (self->__keyAssetsFetchResult != v5)
  {
    objc_storeStrong((id *)&self->__keyAssetsFetchResult, a3);
    if (-[PHFetchResult count](v5, "count"))
    {
      -[PXPhotosDetailsHeaderTileWidget _setLoadCoordinationToken:](self, "_setLoadCoordinationToken:", 0);
      -[PXPhotosDetailsHeaderTileWidget _setHasLoadedContentData:](self, "_setHasLoadedContentData:", 1);
      -[PXPhotosDetailsHeaderTileWidget _updateKeyAssetCropRect](self, "_updateKeyAssetCropRect");
    }
  }

}

- (void)_setPhotosDataSource:(id)a3
{
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  PXPhotosDataSource *v10;
  void *v11;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v13;
  id v14;

  v14 = a3;
  v4 = -[PXPhotosDataSource isEqual:](self->__photosDataSource, "isEqual:", v14);
  v5 = v14;
  if ((v4 & 1) == 0)
  {
    if (v14)
    {
      v6 = objc_msgSend(v14, "options");
      -[PXPhotosDetailsHeaderTileWidget context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldUseKeyFace");

      v9 = 48;
      if (v8)
        v9 = 16;
      v10 = -[PXPhotosDataSource initWithPhotosDataSource:options:]([PXPhotosDataSource alloc], "initWithPhotosDataSource:options:", v14, v9 | v6);
    }
    else
    {
      v10 = 0;
    }
    -[PXPhotosDataSource unregisterChangeObserver:](self->__photosDataSource, "unregisterChangeObserver:", self);
    -[PXPhotosDataSource firstAssetCollection](v10, "firstAssetCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[PXPhotosDataSource setWantsCuration:forAssetCollection:](v10, "setWantsCuration:forAssetCollection:", 1, v11);
    photosDataSource = self->__photosDataSource;
    self->__photosDataSource = v10;
    v13 = v10;

    -[PXPhotosDataSource registerChangeObserver:](self->__photosDataSource, "registerChangeObserver:", self);
    v5 = v14;
  }

}

- (void)_setLoadCoordinationToken:(id)a3
{
  PXPhotosDetailsLoadCoordinationToken *v5;
  PXPhotosDetailsLoadCoordinationToken *v6;
  PXPhotosDetailsLoadCoordinationToken **p_loadCoordinationToken;
  PXPhotosDetailsLoadCoordinationToken *loadCoordinationToken;
  PXPhotosDetailsLoadCoordinationToken *v9;

  v5 = (PXPhotosDetailsLoadCoordinationToken *)a3;
  loadCoordinationToken = self->__loadCoordinationToken;
  p_loadCoordinationToken = &self->__loadCoordinationToken;
  v6 = loadCoordinationToken;
  if (loadCoordinationToken != v5)
  {
    v9 = v5;
    -[PXPhotosDetailsLoadCoordinationToken complete](v6, "complete");
    objc_storeStrong((id *)p_loadCoordinationToken, a3);
    v5 = v9;
  }

}

- (void)_updateLayoutStyle
{
  id v3;

  -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", -[PXPhotosDetailsHeaderTileWidget _showPlaceholder](self, "_showPlaceholder") ^ 1);

}

- (void)_invalidateKeyAssets
{
  self->_needsUpdateFlags.keyAssets = 1;
}

- (void)_updateKeyAssetsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PXImageRequester *primaryAssetImageRequester;
  PXImageRequester *v12;
  void *v13;
  PXImageRequester *v14;
  _QWORD v15[4];
  PXImageRequester *v16;

  if (!self->_needsUpdateFlags.keyAssets)
    return;
  self->_needsUpdateFlags.keyAssets = 0;
  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyAssetsFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldUseKeyFace");

  if (v6)
  {
    -[PXPhotosDetailsHeaderTileWidget context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyFaceAssetFetchResult");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:

    v4 = (void *)v8;
    goto LABEL_5;
  }
  if (v4 && objc_msgSend(v4, "count"))
    goto LABEL_6;
  -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfSections") >= 1)
  {
    objc_msgSend(v7, "keyAssetsInSection:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v4 = v13;
      goto LABEL_5;
    }
    objc_msgSend(v7, "assetsInSection:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v4 = v13;
    goto LABEL_4;
  }
LABEL_5:

LABEL_6:
  -[PXPhotosDetailsHeaderTileWidget _setKeyAssetsFetchResult:](self, "_setKeyAssetsFetchResult:", v4);
  -[PXPhotosDetailsHeaderTileWidget keyAsset](self, "keyAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXImageRequester asset](self->_primaryAssetImageRequester, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v9)
    {
      primaryAssetImageRequester = self->_primaryAssetImageRequester;
      if (primaryAssetImageRequester)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __59__PXPhotosDetailsHeaderTileWidget__updateKeyAssetsIfNeeded__block_invoke;
        v15[3] = &unk_1E5124B18;
        v16 = v9;
        -[PXImageRequester performChanges:](primaryAssetImageRequester, "performChanges:", v15);
        v12 = v16;
      }
      else
      {
        v14 = -[PXImageRequester initWithMediaProvider:asset:]([PXImageRequester alloc], "initWithMediaProvider:asset:", self->_mediaProvider, v9);
        v12 = self->_primaryAssetImageRequester;
        self->_primaryAssetImageRequester = v14;
      }

    }
  }
  -[PXPhotosDetailsHeaderTileWidget _updatePreview](self, "_updatePreview");
  -[PXPhotosDetailsHeaderTileWidget _updateLayoutStyle](self, "_updateLayoutStyle");

}

- (void)_updateKeyAssetCropRect
{
  CGSize v3;
  double v4;
  double v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;

  -[PXPhotosDetailsHeaderTileWidget keyAsset](self, "keyAsset");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 && (-[PXPhotosDetailsHeaderTileWidget _contentSize](self, "_contentSize"), (PXSizeIsEmpty() & 1) == 0))
  {
    -[PXPhotosDetailsHeaderTileWidget _contentSize](self, "_contentSize");
    PXSizeGetAspectRatio();
    v5 = v4;
    -[PXPhotosDetailsHeaderTileWidget _assetCollection](self, "_assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 1, objc_msgSend(v6, "px_shouldUseFacesRectForSmartCropping"), v5);
    self->_keyAssetCropRect.origin.x = v7;
    self->_keyAssetCropRect.origin.y = v8;
    self->_keyAssetCropRect.size.width = v9;
    self->_keyAssetCropRect.size.height = v10;

  }
  else
  {
    v3 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    self->_keyAssetCropRect.origin = *(CGPoint *)off_1E50B86D0;
    self->_keyAssetCropRect.size = v3;
  }

}

- (void)_invalidateAssetCollection
{
  self->_needsUpdateFlags.assetCollection = 1;
}

- (void)_updateAssetCollectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PXTilingLayoutInvalidationContext *v12;
  _OWORD v13[5];
  uint64_t v14;

  if (self->_needsUpdateFlags.assetCollection)
  {
    self->_needsUpdateFlags.assetCollection = 0;
    -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v3, "uncuratedAssetsInSection:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "count"))
        {
          v6 = (void *)MEMORY[0x1E0CD13B8];
          -[PXPhotosDetailsHeaderTileWidget _title](self, "_title");
          v7 = objc_claimAutoreleasedReturnValue();
          -[PXPhotosDetailsHeaderTileWidget _subtitle](self, "_subtitle");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotosDetailsHeaderTileWidget _titleFontName](self, "_titleFontName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "transientAssetCollectionWithAssetFetchResult:title:subtitle:titleFontName:", v5, v7, v8, v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v7;
        }
        else
        {
          v10 = 0;
        }

        v4 = (void *)v10;
      }
    }
    -[PXPhotosDetailsHeaderTileWidget _setAssetCollection:](self, "_setAssetCollection:", v4);
    -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    v14 = 0;
    v13[0] = xmmword_1A7BA05F0;
    memset(&v13[1], 0, 64);
    -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v12, "invalidateTileWithIdentifier:", v13);
    objc_msgSend(v11, "invalidateLayoutWithContext:", v12);

  }
}

- (void)_invalidateCuratedAssetCollection
{
  self->_needsUpdateFlags.curatedAssetCollection = 1;
}

- (void)_updateCuratedAssetCollectionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_needsUpdateFlags.curatedAssetCollection)
  {
    self->_needsUpdateFlags.curatedAssetCollection = 0;
    -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "numberOfSections") < 1)
    {
      v8 = v9;
      goto LABEL_7;
    }
    -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "curatedAssetsInSection:", 0);
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CD13B8];
      -[PXPhotosDetailsHeaderTileWidget _title](self, "_title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transientAssetCollectionWithAssetFetchResult:title:", v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotosDetailsHeaderTileWidget _setCuratedAssetCollection:](self, "_setCuratedAssetCollection:", v7);
      -[PXPhotosDetailsHeaderTileWidget _updatePreview](self, "_updatePreview");

      v8 = (void *)v4;
LABEL_7:

    }
  }
}

- (BOOL)_showPlaceholder
{
  void *v2;
  BOOL v3;

  -[PXPhotosDetailsHeaderTileWidget keyAsset](self, "keyAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.keyAssets
      || self->_needsUpdateFlags.assetCollection
      || self->_needsUpdateFlags.curatedAssetCollection;
}

- (void)_updateBasicContent
{
  id v4;

  if (-[PXPhotosDetailsHeaderTileWidget _isBasicContentLoaded](self, "_isBasicContentLoaded")
    && -[PXPhotosDetailsHeaderTileWidget _needsUpdate](self, "_needsUpdate"))
  {
    -[PXPhotosDetailsHeaderTileWidget _updateKeyAssetsIfNeeded](self, "_updateKeyAssetsIfNeeded");
    -[PXPhotosDetailsHeaderTileWidget _updateAssetCollectionIfNeeded](self, "_updateAssetCollectionIfNeeded");
    -[PXPhotosDetailsHeaderTileWidget _updateCuratedAssetCollectionIfNeeded](self, "_updateCuratedAssetCollectionIfNeeded");
    if (-[PXPhotosDetailsHeaderTileWidget _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsHeaderTileWidget.m"), 426, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)loadContentData
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewSourceOrigin") != 6
    || (objc_msgSend(v6, "people"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4 >= 2))
  {
    -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startBackgroundFetchIfNeeded");

  }
  -[PXPhotosDetailsHeaderTileWidget setCanLoadContentData:](self, "setCanLoadContentData:", 1);

}

- (void)setCanLoadContentData:(BOOL)a3
{
  if (self->_canLoadContentData != a3)
  {
    self->_canLoadContentData = a3;
    -[PXPhotosDetailsHeaderTileWidget _updatePreview](self, "_updatePreview");
  }
}

- (id)keyAsset
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsHeaderTileWidget _keyAssetsFetchResult](self, "_keyAssetsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_filterOutVideosFromAssetCollection:(id)a3 filteredAssetCollection:(id *)a4 assets:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) = %d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalPredicate:", v9);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v10, &stru_1E5149688);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (a5)
    *a5 = objc_retainAutorelease(v10);

}

- (void)_updatePreview
{
  PXImageRequester *primaryAssetImageRequester;
  id v4;

  if (-[PXPhotosDetailsHeaderTileWidget canLoadContentData](self, "canLoadContentData"))
  {
    primaryAssetImageRequester = self->_primaryAssetImageRequester;
    -[PXPhotosDetailsHeaderTileWidget previewTile](self, "previewTile");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageRequester:", primaryAssetImageRequester);

  }
}

- (void)_updateTitleTile
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowHeaderTitle");

  if (v4)
  {
    -[PXPhotosDetailsHeaderTileWidget _titleTile](self, "_titleTile");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget _title](self, "_title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget _subtitle](self, "_subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {

      v5 = v6;
      v6 = 0;
    }
    objc_msgSend(v7, "setTitle:", v5);
    objc_msgSend(v7, "setSubtitle:", v6);

  }
}

- (id)viewToBeFocused
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsHeaderTileWidget previewTile](self, "previewTile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setHeaderSpec:(id)a3
{
  PXPhotosDetailsHeaderSpec *v5;
  void *v6;
  PXPhotosDetailsHeaderSpec *v7;

  v5 = (PXPhotosDetailsHeaderSpec *)a3;
  if (self->__headerSpec != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->__headerSpec, a3);
    -[PXPhotosDetailsHeaderTileWidget _headerSpecDidChange](self, "_headerSpecDidChange");
    -[PXPhotosDetailsHeaderTileWidget widgetDelegate](self, "widgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetInvalidateContentLayoutStyle:", self);

    v5 = v7;
  }

}

- (void)_headerSpecDidChange
{
  void *v3;
  id v4;

  -[PXPhotosDetailsHeaderTileWidget _headerSpec](self, "_headerSpec");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpec:", v4);

}

- (double)preferredContentHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  double v24;
  double v25;

  -[PXPhotosDetailsHeaderTileWidget _scrollViewController](self, "_scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredHeaderContentHeightForWidth:screen:", v9, a3);
  v11 = v10;

  -[PXPhotosDetailsHeaderTileWidget spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentGuideInsets");
  -[PXPhotosDetailsHeaderTileWidget _headerSpec](self, "_headerSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsetEdges");
  PXEdgeInsetsForEdges();
  v15 = v14;
  v17 = v16;

  v18 = v11 + v15 + v17;
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsHeaderTileWidget extendedTraitCollection](self, "extendedTraitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "layoutSizeClass") == 1)
  {
    if (objc_msgSend(v20, "layoutOrientation") == 1)
      v18 = a3;
  }
  else if (objc_msgSend(v19, "enableIPadWideHeader"))
  {
    objc_msgSend(v20, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "verticalSizeClass") != 1)
      {
        objc_msgSend(v20, "layoutReferenceSize");
        v18 = fmin(v24, v25) / 2.16666667;
      }

    }
  }

  return v18;
}

- (BOOL)hasContentForCurrentInput
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "containsMultipleAssets") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[PXPhotosDetailsHeaderTileSettings sharedInstance](PXPhotosDetailsHeaderTileSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "showAlways");

  }
  return v4;
}

- (PXTilingController)contentTilingController
{
  -[PXPhotosDetailsHeaderTileWidget _loadBasicContent](self, "_loadBasicContent");
  return self->_tilingController;
}

- (int64_t)contentLayoutStyle
{
  void *v2;
  int64_t v3;

  -[PXPhotosDetailsHeaderTileWidget _headerSpec](self, "_headerSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldInsetAllPhotoDetailsContent") ^ 1;

  return v3;
}

- (NSString)localizedTitle
{
  return 0;
}

- (id)extendedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosDetailsHeaderTileWidget widgetDelegate](self, "widgetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetViewControllerHostingWidget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_scrollViewController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  objc_msgSend(WeakRetained, "widgetScrollViewControllerHostingWidget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  _OWORD v20[5];
  uint64_t v21;
  CGPoint v22;
  CGRect v23;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contentTileIdentifier");
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  -[PXPhotosDetailsHeaderTileWidget _contentRectInCoordinateSpace:withIdentifier:](self, "_contentRectInCoordinateSpace:withIdentifier:", v5, v20);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v4, "locationInView:", v5);
  v17 = v16;
  v19 = v18;

  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v22.x = v17;
  v22.y = v19;
  if (CGRectContainsPoint(v23, v22))
    -[PXPhotosDetailsHeaderTileWidget _startMovie](self, "_startMovie");

}

- (BOOL)_startMovie
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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsHeaderTileWidget loadContentData](self, "loadContentData");
  -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosDetailsHeaderTileWidget moviePresenter](self, "moviePresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PXPhotosDetailsHeaderTileWidget widgetDelegate](self, "widgetDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widgetViewControllerHostingWidget:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXMoviePresenter moviePresenterWithPresentingViewController:](PXMoviePresenter, "moviePresenterWithPresentingViewController:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsHeaderTileWidget setMoviePresenter:](self, "setMoviePresenter:", v8);

    }
    -[PXPhotosDetailsHeaderTileWidget context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "people");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsHeaderTileWidget moviePresenter](self, "moviePresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget _keyAssetsFetchResult](self, "_keyAssetsFetchResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:referencePersons:preferredTransitionType:", v4, v13, v11, 1);

    if (v14)
    {
      +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didPlayMovieForAssetCollection:", v4);

      v16 = (void *)MEMORY[0x1E0D09910];
      v17 = *MEMORY[0x1E0D09818];
      v24[0] = v4;
      v18 = *MEMORY[0x1E0D09830];
      v23[0] = v17;
      v23[1] = v18;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionMoviePlayed"), v21);

    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (CGRect)_contentRectInCoordinateSpace:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v6;
  __int128 v7;
  __int128 v8;
  void *v9;
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
  _OWORD v23[5];
  unint64_t v24;
  CGRect result;

  v6 = a3;
  v7 = *(_OWORD *)&a4->index[5];
  v23[2] = *(_OWORD *)&a4->index[3];
  v23[3] = v7;
  v23[4] = *(_OWORD *)&a4->index[7];
  v24 = a4->index[9];
  v8 = *(_OWORD *)&a4->index[1];
  v23[0] = *(_OWORD *)&a4->length;
  v23[1] = v8;
  -[PXPhotosDetailsHeaderTileWidget _contentRegionOfInterestForTileWithIdentifier:](self, "_contentRegionOfInterestForTileWithIdentifier:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "rectInCoordinateSpace:", v6);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_contentRegionOfInterestForTileWithIdentifier:(PXTileIdentifier *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  PXTilingController *tilingController;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  PXTilingController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[5];
  uint64_t v41;
  id v42;
  _OWORD v43[12];
  __int128 v44;
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

  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *((_OWORD *)off_1E50B8940 + 9);
  v64 = *((_OWORD *)off_1E50B8940 + 8);
  v65 = v6;
  v7 = *((_OWORD *)off_1E50B8940 + 11);
  v66 = *((_OWORD *)off_1E50B8940 + 10);
  v67 = v7;
  v8 = *((_OWORD *)off_1E50B8940 + 5);
  v60 = *((_OWORD *)off_1E50B8940 + 4);
  v61 = v8;
  v9 = *((_OWORD *)off_1E50B8940 + 7);
  v62 = *((_OWORD *)off_1E50B8940 + 6);
  v63 = v9;
  v10 = *((_OWORD *)off_1E50B8940 + 1);
  v56 = *(_OWORD *)off_1E50B8940;
  v57 = v10;
  v11 = *((_OWORD *)off_1E50B8940 + 3);
  v58 = *((_OWORD *)off_1E50B8940 + 2);
  v59 = v11;
  v12 = *(_OWORD *)&a3->index[5];
  v46 = *(_OWORD *)&a3->index[3];
  v47 = v12;
  v48 = *(_OWORD *)&a3->index[7];
  *(_QWORD *)&v49 = a3->index[9];
  v13 = *(_OWORD *)&a3->index[1];
  v44 = *(_OWORD *)&a3->length;
  v45 = v13;
  v14 = 0;
  if (objc_msgSend(v5, "getGeometry:group:userData:forTileWithIdentifier:", &v56, 0, 0, &v44))
  {
    +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXTilingController contentCoordinateSpaceIdentifier](self->_tilingController, "contentCoordinateSpaceIdentifier");
    if (v15)
    {
      v43[8] = v64;
      v43[9] = v65;
      v43[10] = v66;
      v43[11] = v67;
      v43[4] = v60;
      v43[5] = v61;
      v43[6] = v62;
      v43[7] = v63;
      v43[0] = v56;
      v43[1] = v57;
      v43[2] = v58;
      v43[3] = v59;
      objc_msgSend(v15, "convertTileGeometry:toCoordinateSpaceIdentifier:", v43, v16);
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
    }
    v64 = v52;
    v65 = v53;
    v66 = v54;
    v67 = v55;
    v60 = v48;
    v61 = v49;
    v62 = v50;
    v63 = v51;
    v56 = v44;
    v57 = v45;
    v58 = v46;
    v59 = v47;

    v17 = objc_alloc((Class)off_1E50B4620);
    -[PXPhotosDetailsHeaderTileWidget _scrollViewController](self, "_scrollViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentCoordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v17, "initWithRect:inCoordinateSpace:", v19, v56, v57);

    tilingController = self->_tilingController;
    v21 = *(_OWORD *)&a3->index[5];
    v46 = *(_OWORD *)&a3->index[3];
    v47 = v21;
    v48 = *(_OWORD *)&a3->index[7];
    *(_QWORD *)&v49 = a3->index[9];
    v22 = *(_OWORD *)&a3->index[1];
    v44 = *(_OWORD *)&a3->length;
    v45 = v22;
    -[PXTilingController imageTileWithIdentifier:](tilingController, "imageTileWithIdentifier:", &v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageRequester");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    if (v5)
    {
      objc_msgSend(v5, "tileIdentifierForTileKind:", 1);
    }
    else
    {
      v41 = 0;
      memset(v40, 0, sizeof(v40));
    }
    objc_msgSend(v5, "getGeometry:group:userData:forTileWithIdentifier:", 0, 0, &v42, v40);
    v25 = v42;
    objc_msgSend(v25, "viewSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImageRequester:", v24);
    objc_msgSend(v14, "setImageContentsRect:", *((double *)&v65 + 1), v66, *(double *)&v67);
    objc_msgSend(v14, "setImageViewSpec:", v26);
    v27 = self->_tilingController;
    if (v5)
    {
      objc_msgSend(v5, "tileIdentifierForTileKind:", 2);
    }
    else
    {
      v39 = 0;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
    }
    -[PXTilingController titleSubtitleTileWithIdentifier:](v27, "titleSubtitleTileWithIdentifier:", &v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v30);

      objc_msgSend(v29, "subtitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSubtitle:", v31);

      objc_msgSend(v29, "labelSpec");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextViewSpec:", v32);

    }
    objc_msgSend(v14, "setPlaceholderViewFactory:", &__block_literal_global_178, v34, v35, v36, v37, v38, v39);

  }
  return v14;
}

- (id)createHeaderSnapshotViewForMemoryCreationAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGSize v15;
  __int128 v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGRect v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  CGRect v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  CGRect v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGRect v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  id v57;

  -[PXPhotosDetailsHeaderTileWidget contentTilingController](self, "contentTilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v56 = 0;
  v57 = 0;
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  memset(&v52, 0, sizeof(v52));
  if (v4)
    objc_msgSend(v4, "tileIdentifierForTileKind:", 1);
  v42 = v53;
  v43 = v54;
  v44 = v55;
  *(_QWORD *)&v45 = v56;
  v41 = v52;
  if (!objc_msgSend(v3, "getTile:geometry:group:userData:forTileWithIdentifier:", &v57, 0, 0, 0, &v41))goto LABEL_6;
  if (!v57)
    goto LABEL_6;
  objc_msgSend(v57, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v7, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  if (!v8)
  {
LABEL_6:
    -[PXImageRequester image](self->_primaryAssetImageRequester, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *((_OWORD *)off_1E50B8940 + 9);
    v48 = *((_OWORD *)off_1E50B8940 + 8);
    v49 = v11;
    v12 = *((_OWORD *)off_1E50B8940 + 11);
    v50 = *((_OWORD *)off_1E50B8940 + 10);
    v51 = v12;
    v13 = *((_OWORD *)off_1E50B8940 + 5);
    v44 = *((_OWORD *)off_1E50B8940 + 4);
    v45 = v13;
    v14 = *((_OWORD *)off_1E50B8940 + 7);
    v46 = *((_OWORD *)off_1E50B8940 + 6);
    v47 = v14;
    v15 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
    v41.origin = *(CGPoint *)off_1E50B8940;
    v41.size = v15;
    v16 = *((_OWORD *)off_1E50B8940 + 3);
    v42 = *((_OWORD *)off_1E50B8940 + 2);
    v43 = v16;
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    memset(&v36, 0, sizeof(v36));
    if (v5)
      objc_msgSend(v5, "tileIdentifierForTileKind:", 0);
    v32 = v53;
    v33 = v54;
    v34 = v55;
    v35 = v56;
    v31 = v52;
    if ((objc_msgSend(v5, "getGeometry:group:userData:forTileWithIdentifier:", &v41, 0, 0, &v31) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v32 = v37;
      v33 = v38;
      v34 = v39;
      v35 = v40;
      v31 = v36;
      v17 = objc_msgSend(v5, "getGeometry:group:userData:forTileWithIdentifier:", &v41, 0, 0, &v31) ^ 1;
    }
    v8 = 0;
    if (v10 && (v17 & 1) == 0)
    {
      if (CGRectEqualToRect(v41, *MEMORY[0x1E0C9D648]) || CGRectIsNull(v41))
      {
        v8 = 0;
      }
      else
      {
        +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *((_QWORD *)&v51 + 1);
        v20 = objc_msgSend(v3, "contentCoordinateSpaceIdentifier");
        objc_msgSend(v18, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v19, v20, *(_OWORD *)&v41.origin, *(_OWORD *)&v41.size);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v22, v24, v26, v28);
        objc_msgSend(v8, "setContentMode:", 2);
        objc_msgSend(v8, "setImage:", v10);
        objc_msgSend(v8, "setClipsToBounds:", 1);
        -[PXPhotosDetailsHeaderTileWidget _scrollViewController](self, "_scrollViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addSubview:", v8);

      }
    }

  }
  return v8;
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v11[5];
  unint64_t v12;

  v5 = *(_OWORD *)&a3->index[5];
  v11[2] = *(_OWORD *)&a3->index[3];
  v11[3] = v5;
  v11[4] = *(_OWORD *)&a3->index[7];
  v12 = a3->index[9];
  v6 = *(_OWORD *)&a3->index[1];
  v11[0] = *(_OWORD *)&a3->length;
  v11[1] = v6;
  v7 = -[PXPhotosDetailsHeaderTileWidget _tileForIdentifier:layout:](self, "_tileForIdentifier:layout:", v11, a4);
  -[PXTilingController scrollController](self->_tilingController, "scrollController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  return v7;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  PXReusableObjectPool *tilePool;
  id v6;

  tilePool = self->_tilePool;
  v6 = a3;
  -[PXReusableObjectPool checkInReusableObject:](tilePool, "checkInReusableObject:", v6);
  -[NSMutableSet removeObject:](self->_tilesInUse, "removeObject:", v6);

}

- (void)_tileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  PXImageRequester *primaryAssetImageRequester;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  _BOOL8 v22;
  void *v23;
  _QWORD v25[9];
  _OWORD v26[5];
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v6 = a4;
  v7 = *(_OWORD *)&a3->index[5];
  v30 = *(_OWORD *)&a3->index[3];
  v31 = v7;
  v32 = *(_OWORD *)&a3->index[7];
  *(_QWORD *)&v33 = a3->index[9];
  v8 = *(_OWORD *)&a3->index[1];
  v28 = *(_OWORD *)&a3->length;
  v29 = v8;
  v9 = objc_msgSend(v6, "tileKindForTileIdentifier:", &v28);
  -[PXReusableObjectPool checkOutReusableObjectWithReuseIdentifier:](self->_tilePool, "checkOutReusableObjectWithReuseIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_tilesInUse, "addObject:", v10);
  switch(v9)
  {
    case 3:
      v13 = v10;
      -[PXPhotosDetailsHeaderTileWidget _playButtonSize](self, "_playButtonSize");
      v15 = v14;
      v17 = v16;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = *(_OWORD *)&a3->index[5];
      v26[2] = *(_OWORD *)&a3->index[3];
      v26[3] = v18;
      v26[4] = *(_OWORD *)&a3->index[7];
      v27 = a3->index[9];
      v19 = *(_OWORD *)&a3->index[1];
      v26[0] = *(_OWORD *)&a3->length;
      v26[1] = v19;
      objc_msgSend(v6, "getGeometry:group:userData:forTileWithIdentifier:", &v28, 0, 0, v26);
      objc_msgSend(v6, "previewRect");
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __61__PXPhotosDetailsHeaderTileWidget__tileForIdentifier_layout___block_invoke;
      v25[3] = &unk_1E511F958;
      v25[4] = self;
      v25[5] = v15;
      v25[6] = v17;
      *(double *)&v25[7] = *(double *)&v30 - v20;
      *(double *)&v25[8] = *((double *)&v30 + 1) - v21;
      objc_msgSend(v13, "performChanges:", v25);
      v22 = -[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom") == 5;
      objc_msgSend(v13, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUserInteractionEnabled:", v22);

      objc_msgSend(v13, "setDelegate:", self);
      break;
    case 2:
      -[PXPhotosDetailsHeaderTileWidget _setTitleTile:](self, "_setTitleTile:", v10);
      -[PXPhotosDetailsHeaderTileWidget _updateTitleTile](self, "_updateTitleTile");
      break;
    case 1:
      primaryAssetImageRequester = self->_primaryAssetImageRequester;
      v12 = v10;
      objc_msgSend(v12, "setImageRequester:", primaryAssetImageRequester);
      -[PXPhotosDetailsHeaderTileWidget setPreviewTile:](self, "setPreviewTile:", v12);

      break;
  }

  return v10;
}

- (id)_title
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subtitle
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_titleFontName
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleFontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_playButtonLocalizedTitle
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionPlay"), CFSTR("PhotosUICore"));
}

- (CGSize)_playButtonSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PXPhotosDetailsHeaderTileWidget extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setStyle:", 5);
    -[PXPhotosDetailsHeaderTileWidget _playButtonLocalizedTitle](self, "_playButtonLocalizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedTitle:", v6);

    objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonSizeWithConfiguration:", v5);
  }
  else
  {
    -[PXFeatureSpecManager spec](self->_specManager, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playButtonSize");
  }
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  return objc_alloc_init(PXTileIdentifierIdentityConverter);
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  return objc_alloc_init(PXPhotosDetailsHeaderTileTransitionAnimationCoordinator);
}

- (BOOL)_isPointWithinCurrentLayoutBounds:(CGPoint)a3
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
  -[PXPhotosDetailsHeaderTileWidget contentTilingController](self, "contentTilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsHeaderTileWidget contentTilingController](self, "contentTilingController");
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  PXUITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = (PXUITapGestureRecognizer *)a3;
  if (-[PXPhotosDetailsHeaderTileWidget isUserInteractionEnabled](self, "isUserInteractionEnabled")
    && (self->_tapGestureRecognizer == v4 || self->_pressGestureRecognizer == v4))
  {
    -[PXPhotosDetailsHeaderTileWidget _scrollViewController](self, "_scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentCoordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer px_locationInCoordinateSpace:](v4, "px_locationInCoordinateSpace:", v7);
    v9 = v8;
    v11 = v10;

    v5 = -[PXPhotosDetailsHeaderTileWidget _isPointWithinCurrentLayoutBounds:](self, "_isPointWithinCurrentLayoutBounds:", v9, v11);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  PXTilingLayoutInvalidationContext *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _OWORD v16[5];
  uint64_t v17;

  v6 = a4;
  v9 = a3;
  if ((void *)PXPhotosDetailsHeaderSpecManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PXFeatureSpecManager spec](self->_specManager, "spec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsHeaderTileWidget _setHeaderSpec:](self, "_setHeaderSpec:", v12);

    }
  }
  else
  {
    if ((void *)PXPhotosDetailsContextObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsHeaderTileWidget.m"), 890, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      -[PXPhotosDetailsHeaderTileWidget _invalidateKeyAssets](self, "_invalidateKeyAssets");
      -[PXPhotosDetailsHeaderTileWidget _invalidateAssetCollection](self, "_invalidateAssetCollection");
      -[PXPhotosDetailsHeaderTileWidget _invalidateCuratedAssetCollection](self, "_invalidateCuratedAssetCollection");
    }
    if ((v6 & 0x70) != 0)
    {
      -[PXTilingController targetLayout](self->_tilingController, "targetLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(PXTilingLayoutInvalidationContext);
      if (v10)
      {
        objc_msgSend(v10, "tileIdentifierForTileKind:", 2);
      }
      else
      {
        v17 = 0;
        memset(v16, 0, sizeof(v16));
      }
      -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v11, "invalidateTileWithIdentifier:", v16);
      objc_msgSend(v10, "invalidateLayoutWithContext:", v11);
      -[PXPhotosDetailsHeaderTileWidget _titleTile](self, "_titleTile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__PXPhotosDetailsHeaderTileWidget_observable_didChange_context___block_invoke;
      v15[3] = &unk_1E5149198;
      v15[4] = self;
      objc_msgSend(v13, "performBatchUpdates:", v15);

      -[PXPhotosDetailsHeaderTileWidget _invalidateAssetCollection](self, "_invalidateAssetCollection");
    }
    if ((*(_QWORD *)&v6 & 0x10000CLL) != 0)
      -[PXPhotosDetailsHeaderTileWidget _invalidateKeyAssets](self, "_invalidateKeyAssets");
    -[PXPhotosDetailsHeaderTileWidget _updateBasicContent](self, "_updateBasicContent");
  }

}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  objc_msgSend(v19, "sectionedDataSourceChangeDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v19, "sectionsWithKeyAssetChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsIndex:", 0);

  if ((v10 & 1) != 0 || !objc_msgSend(v19, "hasIncrementalChanges"))
  {
    v12 = 1;
    if (v8)
      goto LABEL_16;
LABEL_6:
    if (!v10)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v19, "contentChangedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v19, "insertedIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v19, "deletedIndexPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "count") != 0;

    }
  }

  if (!v8)
    goto LABEL_6;
LABEL_16:
  -[PXPhotosDetailsHeaderTileWidget _photosDataSource](self, "_photosDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstAssetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleFontName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsHeaderTileWidget _titleFontName](self, "_titleFontName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
    -[PXPhotosDetailsHeaderTileWidget _invalidateAssetCollection](self, "_invalidateAssetCollection");

  if (v10)
LABEL_7:
    -[PXPhotosDetailsHeaderTileWidget _invalidateKeyAssets](self, "_invalidateKeyAssets");
LABEL_8:
  if (v12)
  {
    -[PXPhotosDetailsHeaderTileWidget _invalidateAssetCollection](self, "_invalidateAssetCollection");
    -[PXPhotosDetailsHeaderTileWidget _invalidateCuratedAssetCollection](self, "_invalidateCuratedAssetCollection");
  }
  -[PXPhotosDetailsHeaderTileWidget _updateBasicContent](self, "_updateBasicContent");

}

- (CGRect)photosDetailsHeaderTileLayout:(id)a3 contentsRectForAspectRatio:(double)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyAssetCropRect.origin.x;
  y = self->_keyAssetCropRect.origin.y;
  width = self->_keyAssetCropRect.size.width;
  height = self->_keyAssetCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)regionOfInterestForContext:(id)a3
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[5];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v4 = a3;
  -[PXPhotosDetailsHeaderTileWidget context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 0;
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  if (v7 && (objc_msgSend(v7, "contentTileIdentifier"), (_QWORD)v12))
  {
    v10[2] = v14;
    v10[3] = v15;
    v10[4] = v16;
    v11 = v17;
    v10[0] = v12;
    v10[1] = v13;
    -[PXPhotosDetailsHeaderTileWidget _contentRegionOfInterestForTileWithIdentifier:](self, "_contentRegionOfInterestForTileWithIdentifier:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  id v4;

  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    -[PXPhotosDetailsHeaderTileWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetHasLoadedContentDataDidChange:", self);

  }
}

- (BOOL)containsPoint:(CGPoint)a3 forCoordinateSpace:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  _OWORD v12[5];
  uint64_t v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXTilingController currentLayout](self->_tilingController, "currentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "contentTileIdentifier");
  }
  else
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  -[PXPhotosDetailsHeaderTileWidget _contentRectInCoordinateSpace:withIdentifier:](self, "_contentRectInCoordinateSpace:withIdentifier:", v7, v12);
  v14.x = x;
  v14.y = y;
  v10 = CGRectContainsPoint(v15, v14);

  return v10;
}

- (void)playMovieWithCompletionHandler:(id)a3
{
  void (**v4)(id, BOOL);

  v4 = (void (**)(id, BOOL))a3;
  v4[2](v4, -[PXPhotosDetailsHeaderTileWidget _startMovie](self, "_startMovie"));

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (PXPhotosDetailsHeaderSpec)_headerSpec
{
  return self->__headerSpec;
}

- (PXPhotosDetailsHeaderPreviewTile)previewTile
{
  return self->_previewTile;
}

- (void)setPreviewTile:(id)a3
{
  objc_storeStrong((id *)&self->_previewTile, a3);
}

- (PXUIPlayButtonTile)_playButtonTile
{
  return self->__playButtonTile;
}

- (void)_setPlayButtonTile:(id)a3
{
  objc_storeStrong((id *)&self->__playButtonTile, a3);
}

- (PXTitleSubtitleUILabelTile)_titleTile
{
  return self->__titleTile;
}

- (void)_setTitleTile:(id)a3
{
  objc_storeStrong((id *)&self->__titleTile, a3);
}

- (BOOL)_isBasicContentLoaded
{
  return self->__basicContentLoaded;
}

- (void)_setBasicContentLoaded:(BOOL)a3
{
  self->__basicContentLoaded = a3;
}

- (BOOL)canLoadContentData
{
  return self->_canLoadContentData;
}

- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken
{
  return self->__loadCoordinationToken;
}

- (PHFetchResult)_keyAssetsFetchResult
{
  return self->__keyAssetsFetchResult;
}

- (PHAssetCollection)_assetCollection
{
  return self->__assetCollection;
}

- (void)_setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->__assetCollection, a3);
}

- (PHAssetCollection)_curatedAssetCollection
{
  return self->__curatedAssetCollection;
}

- (void)_setCuratedAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->__curatedAssetCollection, a3);
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (CGSize)_contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__contentSize.width;
  height = self->__contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setContentSize:(CGSize)a3
{
  self->__contentSize = a3;
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setMoviePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_moviePresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->__curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->__assetCollection, 0);
  objc_storeStrong((id *)&self->__keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->__loadCoordinationToken, 0);
  objc_storeStrong((id *)&self->__titleTile, 0);
  objc_storeStrong((id *)&self->__playButtonTile, 0);
  objc_storeStrong((id *)&self->_previewTile, 0);
  objc_storeStrong((id *)&self->__headerSpec, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_primaryAssetImageRequester, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
  objc_storeStrong((id *)&self->_tilePool, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
}

uint64_t __64__PXPhotosDetailsHeaderTileWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTitleTile");
}

void __61__PXPhotosDetailsHeaderTileWidget__tileForIdentifier_layout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v5 = a2;
  objc_msgSend(v5, "setImageRequester:", v3);
  objc_msgSend(v5, "setPlayButtonSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v5, "setPlayButtonStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_playButtonLocalizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayButtonTitle:", v4);

  objc_msgSend(v5, "setImageViewportLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v5, "setAllowsBackdropStatisticsSuppression:", 0);

}

PXPhotosDetailsHeaderPlaceholderView *__81__PXPhotosDetailsHeaderTileWidget__contentRegionOfInterestForTileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXPhotosDetailsHeaderPlaceholderView *v3;

  v2 = a2;
  v3 = -[PXPhotosDetailsHeaderPlaceholderView initWithRegionOfInterest:]([PXPhotosDetailsHeaderPlaceholderView alloc], "initWithRegionOfInterest:", v2);

  return v3;
}

uint64_t __59__PXPhotosDetailsHeaderTileWidget__updateKeyAssetsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAsset:", *(_QWORD *)(a1 + 32));
}

PXUIPlayButtonTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_4()
{
  return objc_alloc_init(PXUIPlayButtonTile);
}

PXTitleSubtitleUILabelTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_3()
{
  return objc_alloc_init(PXTitleSubtitleUILabelTile);
}

PXPhotosDetailsHeaderPreviewTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_2()
{
  PXPhotosDetailsHeaderPreviewTile *v0;

  v0 = objc_alloc_init(PXPhotosDetailsHeaderPreviewTile);
  -[PXUIImageTile setDrawsFocusRing:](v0, "setDrawsFocusRing:", 1);
  return v0;
}

PXPlaceholderView *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke()
{
  PXPlaceholderView *v0;

  v0 = [PXPlaceholderView alloc];
  return -[PXPlaceholderView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (double)preferredHeaderContentHeightForWidth:(double)a3 screen:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a4;
  +[PXPhotosDetailsHeaderTileSettings sharedInstance](PXPhotosDetailsHeaderTileSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aspectRatio");
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v10 = v9;
    v12 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v10 = v14;
    v12 = v15;

  }
  if (v10 >= v12)
    v10 = v12;
  v16 = a3 / v8;
  objc_msgSend(v6, "maximumHeightRelativeToScreenHeight");
  v18 = v17 * v10;
  objc_msgSend(v6, "maximumAbsoluteHeight");
  if (v18 < v19)
    v19 = v18;
  if (v16 >= v19)
    v16 = v19;

  return v16;
}

+ (BOOL)canShowMovieHeaderForDataSource:(id)a3
{
  return PXPhotosDetailsContextShouldShowHeaderForDataSource(a3);
}

@end
