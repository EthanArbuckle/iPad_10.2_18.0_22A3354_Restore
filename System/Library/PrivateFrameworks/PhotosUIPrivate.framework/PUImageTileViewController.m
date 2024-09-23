@implementation PUImageTileViewController

- (PUImageTileViewController)initWithReuseIdentifier:(id)a3
{
  PUImageTileViewController *v3;
  uint64_t v4;
  PXEventCoalescer *targetSizeUpdateRateLimiter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImageTileViewController;
  v3 = -[PUTileController initWithReuseIdentifier:](&v7, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D7CCF0], "rateLimitingCoalescerWithRate:", 0.2);
    v4 = objc_claimAutoreleasedReturnValue();
    targetSizeUpdateRateLimiter = v3->_targetSizeUpdateRateLimiter;
    v3->_targetSizeUpdateRateLimiter = (PXEventCoalescer *)v4;

    -[PXEventCoalescer registerObserver:](v3->_targetSizeUpdateRateLimiter, "registerObserver:", v3);
  }
  return v3;
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUImageTileViewController targetSizeUpdateRateLimiter](self, "targetSizeUpdateRateLimiter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PUImageTileViewController _updateImageRequesterTargetSize](self, "_updateImageRequesterTargetSize");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PUImageTileViewController _cancelAllImageRequests](self, "_cancelAllImageRequests");
  v4.receiver = self;
  v4.super_class = (Class)PUImageTileViewController;
  -[PUTileViewController dealloc](&v4, sel_dealloc);
}

- (void)expectedPresentationSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  -[PUTileController expectedPresentationSizeDidChange](&v3, sel_expectedPresentationSizeDidChange);
  -[PUImageTileViewController _invalidateTargetSize](self, "_invalidateTargetSize");
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (id)loadView
{
  UIImageView *v3;
  UIImageView *imageView;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  imageView = self->__imageView;
  self->__imageView = v3;

  -[UIImageView setContentMode:](self->__imageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->__imageView, "setClipsToBounds:", 1);
  -[UIImageView setUserInteractionEnabled:](self->__imageView, "setUserInteractionEnabled:", 0);
  -[UIImageView layer](self->__imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

  -[UIImageView layer](self->__imageView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", 0);

  -[UIImageView setPreferredImageDynamicRange:](self->__imageView, "setPreferredImageDynamicRange:", 0);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useDebuggingColors");

  if (v8)
  {
    -[UIImageView layer](self->__imageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v9, "setBorderWidth:", 2.0);
  }
  -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
  -[PUImageTileViewController _invalidateImageLayerModulatorManager](self, "_invalidateImageLayerModulatorManager");
  -[PUImageTileViewController _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
  -[PUImageTileViewController _invalidateImageLayerModulatorInput](self, "_invalidateImageLayerModulatorInput");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleShouldReloadAssetMediaNotification_, CFSTR("PUShouldReloadAssetMediaNotification"), 0);

  return self->__imageView;
}

- (void)_configureImageViewPreferredImageDynamicRange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[6];
  uint8_t buf[16];

  -[PUTileController tilingView](self, "tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDisplayHDR");

  if (v4)
  {
    -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isPresentedForPreview");

      if (v7)
        v8 = 0;
      else
        v8 = 2;
    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    v8 = 0;
  }
  if (-[PUImageTileViewController shouldRequestHDR](self, "shouldRequestHDR")
    && -[PUImageTileViewController shouldAnimatePreferredDynamicRangeChanges](self, "shouldAnimatePreferredDynamicRangeChanges"))
  {
    -[PUTileController tilingView](self, "tilingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_FAULT, "Tiling view should not be nil", buf, 2u);
      }

    }
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredImageDynamicRangeAnimationDuration");
    v13 = v12;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__PUImageTileViewController__configureImageViewPreferredImageDynamicRange__block_invoke;
    v15[3] = &unk_1E58AACF0;
    v15[4] = self;
    v15[5] = v8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v15, 0, v13, 0.0);
  }
  else
  {
    -[PUImageTileViewController _imageView](self, "_imageView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredImageDynamicRange:", v8);

  }
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUImageTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUImageTileViewController setAsset:](self, "setAsset:", 0);
  -[PUImageTileViewController setShouldUseFullSizeImageData:](self, "setShouldUseFullSizeImageData:", 0);
  -[PUImageTileViewController setMediaProvider:](self, "setMediaProvider:", 0);
  -[PUImageTileViewController _setTargetSize:](self, "_setTargetSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PUImageTileViewController displayImageRequestResult:](self, "displayImageRequestResult:", 0);
  -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  -[PUImageTileViewController _updateFullSizeTiledLayerIfNeeded](self, "_updateFullSizeTiledLayerIfNeeded");
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 IsEmpty;
  CGRect *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)PUImageTileViewController;
  v4 = a3;
  -[PUTileViewController applyLayoutInfo:](&v20, sel_applyLayoutInfo_, v4);
  objc_msgSend(v4, "contentsRect", v20.receiver, v20.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  IsEmpty = CGRectIsEmpty(v21);
  v14 = (CGRect *)MEMORY[0x1E0D7D078];
  if (IsEmpty)
  {
    v6 = *MEMORY[0x1E0D7D078];
    v8 = *(double *)(MEMORY[0x1E0D7D078] + 8);
    v10 = *(double *)(MEMORY[0x1E0D7D078] + 16);
    v12 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  }
  -[PUImageTileViewController _imageView](self, "_imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentsRect");
  v17 = PXRectApproximatelyEqualToRect();

  if ((v17 & 1) == 0)
  {
    -[PUImageTileViewController _imageView](self, "_imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentsRect:", v6, v8, v10, v12);

  }
  -[PUImageTileViewController _invalidateTargetSize](self, "_invalidateTargetSize");
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  -[PUImageTileViewController setCanUseFullSizeTiledLayer:](self, "setCanUseFullSizeTiledLayer:", CGRectEqualToRect(v22, *v14));
  -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *browsingViewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_browsingViewModel, "registerChangeObserver:", self);
    v5 = v7;
  }

}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  PUAssetViewModel *v7;
  void *v8;
  PUAssetViewModel *v9;

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  v9 = v5;
  if (assetViewModel != v5)
  {
    v7 = assetViewModel;
    -[PUAssetViewModel unregisterChangeObserver:](v7, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](self->_assetViewModel, "registerChangeObserver:", self);
    -[PUImageTileViewController assetViewModelDidChange:](self, "assetViewModelDidChange:", v7);
    -[PUAssetViewModel asset](v9, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImageTileViewController setAsset:](self, "setAsset:", v8);
  }

}

- (void)setAsset:(id)a3
{
  if (self->_asset != a3)
  {
    -[PUImageTileViewController _setAssetWithoutUpdateIfNeeded:](self, "_setAssetWithoutUpdateIfNeeded:");
    -[PUImageTileViewController _updateImageRequesterFullSizeImageDataProperties](self, "_updateImageRequesterFullSizeImageDataProperties");
    -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_setAssetWithoutUpdateIfNeeded:(id)a3
{
  PUDisplayAsset *v5;
  id *p_asset;
  PUDisplayAsset *asset;
  PUDisplayAsset *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  PUDisplayAsset *v14;
  PUDisplayAsset *v15;
  uint64_t v16;
  uint64_t v17;
  PUDisplayAsset *v18;
  PUDisplayAsset *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  PUImageTileViewController *v25;
  __int16 v26;
  PUDisplayAsset *v27;
  __int16 v28;
  PUDisplayAsset *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (PUDisplayAsset *)a3;
  p_asset = (id *)&self->_asset;
  asset = self->_asset;
  if (asset == v5)
    goto LABEL_38;
  v8 = asset;
  objc_storeStrong((id *)&self->_asset, a3);
  -[PUImageTileViewController _invalidateDidRequestHDR](self, "_invalidateDidRequestHDR");
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fullQualityCrossfadeBehavior");

  if (*p_asset)
  {
    -[PUDisplayAsset uuid](v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUDisplayAsset uuid](v8, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      if (v10 == 1
        || (objc_opt_respondsToSelector() & 1) != 0
        && -[PUDisplayAsset needsDeferredProcessing](v5, "needsDeferredProcessing")
        && v10 == 2)
      {
        -[PUImageTileViewController setShouldAnimateToFullQualityResult:](self, "setShouldAnimateToFullQualityResult:", 1);
      }
      v14 = v8;
      v15 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = -[PUDisplayAsset contentChangeFromDisplayAsset:](v14, "contentChangeFromDisplayAsset:", v15);
        LOBYTE(v17) = v16;
        if (!v16)
          v17 = -[PUDisplayAsset contentChangeFromDisplayAsset:](v15, "contentChangeFromDisplayAsset:", v14);

        if ((v17 & 0x10) != 0)
          -[PUImageTileViewController setShouldAnimateToFullQualityResult:](self, "setShouldAnimateToFullQualityResult:", 0);
      }
      else
      {

      }
    }
  }
  else
  {
    -[PUImageTileViewController setShouldAnimateToFullQualityResult:](self, "setShouldAnimateToFullQualityResult:", 0);
    -[PUImageTileViewController _invalidate](self, "_invalidate");
  }
  if (v5
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && -[PUDisplayAsset isPhotoIrisPlaceholder](v8, "isPhotoIrisPlaceholder"))
  {
    -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
  }
  else
  {
    v18 = (PUDisplayAsset *)*p_asset;
    v19 = v8;
    if (v18 == v19)
    {
      v20 = 0;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = -[PUDisplayAsset contentChangeFromDisplayAsset:](v18, "contentChangeFromDisplayAsset:", v19);
      if (!v20)
        v20 = -[PUDisplayAsset contentChangeFromDisplayAsset:](v19, "contentChangeFromDisplayAsset:", v18);
    }
    else
    {
      v20 = 1;
    }

    if ((v20 & 4) != 0)
      v21 = v20 ^ 0x20;
    else
      v21 = v20;
    if ((v21 & 0xFFFFFFFFFFFFFFF1) == 0)
      goto LABEL_35;
    -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
    if ((v21 & 2) != 0)
      goto LABEL_35;
  }
  -[PUImageTileViewController _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
LABEL_35:
  PLOneUpGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[PUDisplayAsset modificationDate](v5, "modificationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413570;
    v25 = self;
    v26 = 2048;
    v27 = v8;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v23;
    v32 = 1024;
    v33 = -[PUDisplayAsset canPlayPhotoIris](v5, "canPlayPhotoIris");
    v34 = 1024;
    v35 = -[PUDisplayAsset isPhotoIrisPlaceholder](v5, "isPhotoIrisPlaceholder");
    _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEBUG, "%@ setAsset:%p -> %@ modificationDate:%@ canPlayIris:%d isPhotoIrisPlaceholder:%d", (uint8_t *)&v24, 0x36u);

  }
  -[PUImageTileViewController _updateAssetLoadingStage](self, "_updateAssetLoadingStage");
  -[PUImageTileViewController assetDidChange](self, "assetDidChange");

LABEL_38:
}

- (void)setShouldAnimateToFullQualityResult:(BOOL)a3
{
  id v4;

  if (self->_shouldAnimateToFullQualityResult != a3)
  {
    self->_shouldAnimateToFullQualityResult = a3;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController setShouldRetainNonFinalImageUntilZoom:](self, "setShouldRetainNonFinalImageUntilZoom:", objc_msgSend(v4, "retainProxyUntilZoom"));

  }
}

- (void)setMediaProvider:(id)a3
{
  PUMediaProvider *v5;
  PUMediaProvider *v6;

  v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PUImageTileViewController _invalidate](self, "_invalidate");
    v5 = v6;
  }

}

- (void)_setImageRequester:(id)a3
{
  PUImageRequester *v5;
  PUImageRequester **p_imageRequester;
  PUImageRequester *imageRequester;
  PUImageRequester *v8;

  v5 = (PUImageRequester *)a3;
  p_imageRequester = &self->__imageRequester;
  imageRequester = self->__imageRequester;
  if (imageRequester != v5)
  {
    v8 = v5;
    -[PUImageRequester unregisterObserver:](imageRequester, "unregisterObserver:", self);
    -[PUImageRequester cancelAllImageRequests](*p_imageRequester, "cancelAllImageRequests");
    objc_storeStrong((id *)&self->__imageRequester, a3);
    -[PUImageRequester registerObserver:](*p_imageRequester, "registerObserver:", self);
    v5 = v8;
  }

}

- (void)setImageModulationManager:(id)a3
{
  PXImageModulationManager *v5;
  PXImageModulationManager *v6;

  v5 = (PXImageModulationManager *)a3;
  if (self->_imageModulationManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageModulationManager, a3);
    -[PUImageTileViewController _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
    v5 = v6;
  }

}

- (void)setImageLayerModulator:(id)a3
{
  PXImageLayerModulator *v5;
  PXImageLayerModulator *v6;

  v5 = (PXImageLayerModulator *)a3;
  if (self->_imageLayerModulator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageLayerModulator, a3);
    -[PUImageTileViewController _invalidateImageLayerModulatorInput](self, "_invalidateImageLayerModulatorInput");
    v5 = v6;
  }

}

- (void)setShouldUseFullSizeImageData:(BOOL)a3
{
  double v4;
  void *v5;

  if (self->_shouldUseFullSizeImageData != a3)
  {
    self->_shouldUseFullSizeImageData = a3;
    if (-[PUImageTileViewController shouldUseFullSizeImageData](self, "shouldUseFullSizeImageData"))
      v4 = 1.0;
    else
      v4 = 0.2;
    -[PUImageTileViewController targetSizeUpdateRateLimiter](self, "targetSizeUpdateRateLimiter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInterval:", v4);

    -[PUImageTileViewController _updateImageRequesterFullSizeImageDataProperties](self, "_updateImageRequesterFullSizeImageDataProperties");
  }
}

- (void)_updateImageRequesterFullSizeImageDataProperties
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
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
  -[PUImageTileViewController asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (-[PUImageTileViewController shouldUseFullSizeImageData](self, "shouldUseFullSizeImageData") && v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_supportedZoomImageFormats");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "conformsToType:", v12);

        if ((v13 & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v5 = v7;
      if (v7)
        goto LABEL_16;
    }
    else
    {
LABEL_11:

    }
    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
      v5 = v7;
    else
      v5 = 0;
LABEL_16:

  }
  -[PUImageTileViewController _imageRequester](self, "_imageRequester");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__PUImageTileViewController__updateImageRequesterFullSizeImageDataProperties__block_invoke;
  v16[3] = &unk_1E58ABCA8;
  v16[4] = self;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v14, "performChanges:", v16);

}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_placeholderColor;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_placeholderColor, a3);
      -[PUImageTileViewController _updateImageViewBackgroundColor](self, "_updateImageViewBackgroundColor");
    }
  }

}

- (BOOL)wantsVisibleRectChanges
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUImageTileViewController;
  if (-[PUTileViewController wantsVisibleRectChanges](&v6, sel_wantsVisibleRectChanges))
    return 1;
  -[PUImageTileViewController _fullSizeTiledLayer](self, "_fullSizeTiledLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)didChangeVisibleRect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  -[PUTileViewController didChangeVisibleRect](&v3, sel_didChangeVisibleRect);
  -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PUImageTileViewController _imageView](self, "_imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

}

- (void)_setTargetSize:(CGSize)a3
{
  id v4;

  if (a3.width != self->__targetSize.width || a3.height != self->__targetSize.height)
  {
    self->__targetSize = a3;
    -[PUImageTileViewController targetSizeUpdateRateLimiter](self, "targetSizeUpdateRateLimiter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputEvent");

  }
}

- (void)_updateImageRequesterTargetSize
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  PUImageTileViewController *v7;

  -[PUImageTileViewController _imageRequester](self, "_imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PUImageTileViewController__updateImageRequesterTargetSize__block_invoke;
  v5[3] = &unk_1E58ABCA8;
  v6 = v3;
  v7 = self;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  CGSize v18;

  v17 = *MEMORY[0x1E0C80C00];
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "PPT_isDeferredProcessingDoneAndFinalImageDisplayed") & 1) == 0
    && self->_presentingDelegateFlags.respondsToPPTShouldSignalDeferredProcessingDoneAndFinalImageDisplayed)
  {
    if (-[PUImageTileViewController isDeferredProcessingFinished](self, "isDeferredProcessingFinished"))
    {
      -[PUImageTileViewController presentingDelegate](self, "presentingDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "ppt_imageTileViewControllerShouldSignalDeferredProcessingDoneAndFinalImageDisplayed:", self);

      if (v5)
      {
        PLOneUpGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[PUImageTileViewController image](self, "image");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "size");
          NSStringFromCGSize(v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUImageTileViewController asset](self, "asset");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v14 = v8;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "Deferred Processing: DP processed image loaded/displayed, %@, uuid: %@", buf, 0x16u);

        }
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __88__PUImageTileViewController__notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded__block_invoke;
        v11[3] = &unk_1E58ABD10;
        v12 = v3;
        objc_msgSend(v12, "performChanges:", v11);

      }
    }
  }

}

- (BOOL)isDeferredProcessingFinished
{
  void *v2;
  int v3;

  -[PUImageTileViewController asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "needsDeferredProcessing") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)gainMapImageIsAvailable
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  BOOL v11;

  -[PUImageTileViewController asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "imageIsFullQuality");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v3, "needsDeferredProcessing");
  else
    v6 = 0;
  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "gainMapImage");

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if ((v5 & 1) != 0)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    -[PUImageTileViewController _invalidateImageLayerModulatorInput](self, "_invalidateImageLayerModulatorInput");
  }
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PUImageTileViewController _invalidateImageLayerModulatorInput](self, "_invalidateImageLayerModulatorInput");
  }
}

- (void)setPreloadedImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _PreloadedImageResult *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PUImageTileViewController _imageRequester](self, "_imageRequester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__PUImageTileViewController_setPreloadedImage___block_invoke;
      v9[3] = &unk_1E58ABCA8;
      v10 = v5;
      v11 = v4;
      objc_msgSend(v10, "performChanges:", v9);

    }
  }
  else
  {
    -[PUImageTileViewController image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[_PreloadedImageResult initWithPreloadedImage:]([_PreloadedImageResult alloc], "initWithPreloadedImage:", v4);
      -[PUImageTileViewController displayImageRequestResult:](self, "displayImageRequestResult:", v8);

    }
  }

}

- (void)_setFullSizeImageData:(id)a3
{
  NSData *v5;
  NSData *v6;

  v5 = (NSData *)a3;
  if (self->__fullSizeImageData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__fullSizeImageData, a3);
    -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
    -[PUImageTileViewController _invalidateFullSizeImageMetadata](self, "_invalidateFullSizeImageMetadata");
    v5 = v6;
  }

}

- (void)_setFullSizeImageURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;
  char v7;
  NSURL *v8;

  v8 = (NSURL *)a3;
  v5 = self->__fullSizeImageURL;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSURL isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__fullSizeImageURL, a3);
      -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
      -[PUImageTileViewController _invalidateFullSizeImageMetadata](self, "_invalidateFullSizeImageMetadata");
    }
  }

}

- (void)_handleShouldReloadAssetMediaNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  -[PUImageTileViewController asset](self, "asset");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EEC2D708))
  {
    v6 = v5;
    objc_msgSend(v10, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      -[PUImageTileViewController setRequiresFullQualityImage:](self, "setRequiresFullQualityImage:", 0);
      -[PUImageTileViewController _cancelAllImageRequests](self, "_cancelAllImageRequests");
      -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
      -[PUImageTileViewController _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
      -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    }

  }
}

- (void)_setAssetLoadingStage:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  _BYTE v18[22];
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->__assetLoadingStage != a3)
  {
    self->__assetLoadingStage = a3;
    -[PUImageTileViewController _assetLoadingStartDate](self, "_assetLoadingStartDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (a3 == 2)
    {
      if (!v5)
      {
LABEL_15:
        -[PUImageTileViewController _setAssetLoadingStartDate:](self, "_setAssetLoadingStartDate:", v6, *(_OWORD *)v18);

        return;
      }
      -[PUImageTileViewController asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[PUImageTileViewController asset](self, "asset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceNow");
        v11 = v10;
        v12 = objc_msgSend(v9, "isCloudSharedAsset");
        PLOneUpGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          -[PUImageTileViewController asset](self, "asset");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = CFSTR("NO");
          *(_DWORD *)v18 = 134218498;
          *(double *)&v18[4] = -v11;
          *(_WORD *)&v18[12] = 2112;
          if (v12)
            v16 = CFSTR("YES");
          *(_QWORD *)&v18[14] = v14;
          v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEBUG, "load time = %0.3f s for asset: %@ isCloudShared:%@", v18, 0x20u);

        }
      }
    }
    else
    {
      if (a3 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v17;
        goto LABEL_15;
      }
      if (a3)
        goto LABEL_15;
    }

    v6 = 0;
    goto LABEL_15;
  }
}

- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUImageTileViewController;
  v3 = -[PUTileController shouldAvoidInPlaceSnapshottedFadeOut](&v8, sel_shouldAvoidInPlaceSnapshottedFadeOut);
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0 || (objc_msgSend(v4, "isUserTransformingTile") & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_msgSend(v5, "contentOffset");
    v6 = PXFloatEqualToFloatWithTolerance() ^ 1;
  }

  return v6;
}

- (void)setCanUseFullSizeTiledLayer:(BOOL)a3
{
  if (self->_canUseFullSizeTiledLayer != a3)
  {
    self->_canUseFullSizeTiledLayer = a3;
    -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  }
}

- (void)isViewControllerTransitioningDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  -[PUTileController isViewControllerTransitioningDidChange](&v3, sel_isViewControllerTransitioningDidChange);
  -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return -[PUImageTileViewController needsUpdateTargetSize](self, "needsUpdateTargetSize")
      || -[PUImageTileViewController _needsUpdateDidRequestHDR](self, "_needsUpdateDidRequestHDR")
      || -[PUImageTileViewController _needsUpdateImage](self, "_needsUpdateImage")
      || -[PUImageTileViewController _needsUpdateImageLayerModulatorManager](self, "_needsUpdateImageLayerModulatorManager")|| -[PUImageTileViewController _needsUpdateImageLayerModulator](self, "_needsUpdateImageLayerModulator")|| -[PUImageTileViewController _needsUpdateImageLayerModulatorInput](self, "_needsUpdateImageLayerModulatorInput")|| -[PUImageTileViewController _needsUpdateFullSizeImageMetadata](self, "_needsUpdateFullSizeImageMetadata")|| -[PUImageTileViewController _needsUpdateFullSizeTiledLayer](self, "_needsUpdateFullSizeTiledLayer");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUImageTileViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUImageTileViewController _updateTargetSizeIfNeeded](self, "_updateTargetSizeIfNeeded");
    -[PUImageTileViewController _updateDidRequestHDRIfNeeded](self, "_updateDidRequestHDRIfNeeded");
    -[PUImageTileViewController _updateImageIfNeeded](self, "_updateImageIfNeeded");
    -[PUImageTileViewController _updateImageLayerModulatorManagerIfNeeded](self, "_updateImageLayerModulatorManagerIfNeeded");
    -[PUImageTileViewController _updateImageLayerModulatorIfNeeded](self, "_updateImageLayerModulatorIfNeeded");
    -[PUImageTileViewController _updateImageLayerModulatorInputIfNeeded](self, "_updateImageLayerModulatorInputIfNeeded");
    -[PUImageTileViewController _updateFullSizeImageMetadataIfNeeded](self, "_updateFullSizeImageMetadataIfNeeded");
    -[PUImageTileViewController _updateFullSizeTiledLayerIfNeeded](self, "_updateFullSizeTiledLayerIfNeeded");
    if (-[PUImageTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageTileViewController.m"), 691, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (void)_invalidate
{
  -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
  -[PUImageTileViewController _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
  -[PUImageTileViewController _cancelAllImageRequests](self, "_cancelAllImageRequests");
  -[PUImageTileViewController setDisplayedImageRequestResult:](self, "setDisplayedImageRequestResult:", 0);
  -[PUImageTileViewController _setImageRequester:](self, "_setImageRequester:", 0);
  -[PUImageTileViewController _setFullSizeImageData:](self, "_setFullSizeImageData:", 0);
  -[PUImageTileViewController _setFullSizeImageURL:](self, "_setFullSizeImageURL:", 0);
  -[PUImageTileViewController setIsDisplayingFullQualityImage:](self, "setIsDisplayingFullQualityImage:", 0);
}

- (void)_invalidateDidRequestHDR
{
  -[PUImageTileViewController _setNeedsUpdateDidRequestHDR:](self, "_setNeedsUpdateDidRequestHDR:", 1);
}

- (void)_updateDidRequestHDRIfNeeded
{
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (-[PUImageTileViewController _needsUpdateDidRequestHDR](self, "_needsUpdateDidRequestHDR"))
  {
    -[PUImageTileViewController _setNeedsUpdateDidRequestHDR:](self, "_setNeedsUpdateDidRequestHDR:", 0);
    v3 = 0;
    if (-[PUImageTileViewController shouldRequestHDR](self, "shouldRequestHDR"))
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "enableImageDecodeToHDR");

      if (v5)
      {
        -[PUTileController tilingView](self, "tilingView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "screenDynamicRangeMonitor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v7, "screenSupportsHDR");

      }
      else
      {
        v3 = 1;
      }
    }
    self->_didRequestHDR = v3;
  }
}

- (void)_invalidateTargetSize
{
  -[PUImageTileViewController setNeedsUpdateTargetSize:](self, "setNeedsUpdateTargetSize:", 1);
}

- (void)_updateTargetSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
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

  if (-[PUImageTileViewController needsUpdateTargetSize](self, "needsUpdateTargetSize"))
  {
    -[PUImageTileViewController setNeedsUpdateTargetSize:](self, "setNeedsUpdateTargetSize:", 0);
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (-[PUTileController isActive](self, "isActive"))
    {
      -[PUImageTileViewController _screenScale](self, "_screenScale");
      v6 = v5;
      -[PUImageTileViewController asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "aspectRatio");
      v9 = v8;

      if (v9 > 0.0)
      {
        -[PUTileController expectedPresentationSize](self, "expectedPresentationSize");
        PFSizeWithAspectRatioFittingSize();
      }
      -[PUTileViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      PXSizeMax();
      v12 = v11;
      v14 = v13;

      -[PUImageTileViewController targetSizeForProposedTargetSize:](self, "targetSizeForProposedTargetSize:", v12 * v6, v14 * v6);
      v16 = v15;
      v18 = v17;
      PLPhysicalScreenSize();
      v20 = v19 * v6;
      v22 = v21 * v6;
      if (v20 <= v22)
        v20 = v22;
      v3 = fmin(v16, v20);
      v4 = fmin(v18, v20);
    }
    -[PUImageTileViewController _setTargetSize:](self, "_setTargetSize:", v3, v4);
  }
}

- (double)_screenScale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  if (v7 < 1.0)
  {
    -[PUTileController tilingView](self, "tilingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v7 = v11;

  }
  if (v7 < 1.0)
  {
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v7 = *(double *)&PUMainScreenScale_screenScale;
  }
  return fmax(v7, 1.0);
}

- (void)_invalidateImage
{
  void *v3;

  -[PUImageTileViewController targetSizeUpdateRateLimiter](self, "targetSizeUpdateRateLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[PUImageTileViewController _setImageRequester:](self, "_setImageRequester:", 0);
  -[PUImageTileViewController _setFullSizeImageURL:](self, "_setFullSizeImageURL:", 0);
  -[PUImageTileViewController _setFullSizeImageData:](self, "_setFullSizeImageData:", 0);
  -[PUImageTileViewController _setNeedsUpdateImage:](self, "_setNeedsUpdateImage:", 1);
}

- (void)_updateImageIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PUImageRequester *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  BOOL v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (-[PUImageTileViewController _needsUpdateImage](self, "_needsUpdateImage"))
  {
    -[PUImageTileViewController _setNeedsUpdateImage:](self, "_setNeedsUpdateImage:", 0);
    v3 = -[PUImageTileViewController animatesImageTransitions](self, "animatesImageTransitions");
    -[PUImageTileViewController setAnimatesImageTransitions:](self, "setAnimatesImageTransitions:", 0);
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController mediaProvider](self, "mediaProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController _targetSize](self, "_targetSize");
    if (v5 && v6)
    {
      v9 = v7;
      v10 = v8;
      -[PUImageTileViewController _imageRequester](self, "_imageRequester");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImageTileViewController _imageRequester](self, "_imageRequester");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = -[PUImageRequester initWithMediaProvider:asset:requiresFullQualityImage:]([PUImageRequester alloc], "initWithMediaProvider:asset:requiresFullQualityImage:", v6, v5, -[PUImageTileViewController requiresFullQualityImage](self, "requiresFullQualityImage"));

        -[PUImageTileViewController _setImageRequester:](self, "_setImageRequester:", v13);
        v11 = v13;
      }
      objc_msgSend(v5, "uniformTypeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v38 = v5;
      if (-[PUImageTileViewController shouldUseFullSizeImageData](self, "shouldUseFullSizeImageData") && v14)
      {
        v35 = v11;
        v36 = v6;
        v37 = v4;
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_supportedZoomImageFormats");
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v49;
LABEL_10:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v21));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v16, "conformsToType:", v22);

            if ((v23 & 1) != 0)
              break;
            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
              if (v19)
                goto LABEL_10;
              goto LABEL_16;
            }
          }
          v15 = v17;
          v4 = v37;
          v3 = v3;
          v11 = v35;
          if (v17)
            goto LABEL_21;
        }
        else
        {
LABEL_16:

          v4 = v37;
          v3 = v3;
          v11 = v35;
        }
        if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
          v15 = v17;
        else
          v15 = 0;
LABEL_21:

        v6 = v36;
      }
      v24 = -[PUImageTileViewController shouldRequestGainMap](self, "shouldRequestGainMap");
      v25 = -[PUImageTileViewController didRequestHDR](self, "didRequestHDR");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "potentialEDRHeadroom");
      v28 = v27;

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __49__PUImageTileViewController__updateImageIfNeeded__block_invoke;
      v39[3] = &unk_1E58A00D8;
      v40 = v11;
      v46 = v24;
      v47 = v25;
      v43 = v28;
      v44 = v9;
      v45 = v10;
      v41 = v4;
      v42 = v15;
      v29 = v15;
      v30 = v11;
      objc_msgSend(v30, "performChanges:", v39);

      v5 = v38;
    }
    -[PUImageTileViewController setAnimatesImageTransitions:](self, "setAnimatesImageTransitions:", v3);
    -[PUTileController tilingView](self, "tilingView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "screenDynamicRangeMonitor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "unregisterChangeObserver:context:", self, PXDisplayScreenDynamicRangeObservationContext);

    -[PUTileController tilingView](self, "tilingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "screenDynamicRangeMonitor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerChangeObserver:context:", self, PXDisplayScreenDynamicRangeObservationContext);

  }
}

- (BOOL)shouldRequestGainMap
{
  void *v3;
  __int16 v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  char v11;

  -[PUImageTileViewController asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaSubtypes");
  -[PUTileController tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDisplayHDR");

  objc_msgSend(MEMORY[0x1E0D7B508], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "gainMapEnabled");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enableHDRImages");

  if ((v4 & 0x200) != 0)
  {
    if (v8)
      v11 = v6 & (v10 ^ 1);
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldRequestHDR
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  int v9;

  -[PUTileController tilingView](self, "tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDisplayHDR");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableHDRImages");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enableImageDecodeToHDR");

  if ((v8 & 1) != 0 || (v9 = -[PUImageTileViewController _assetNeedsHDR](self, "_assetNeedsHDR")) != 0)
    LOBYTE(v9) = v6 & v4;
  return v9;
}

- (BOOL)shouldAnimatePreferredDynamicRangeChanges
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enablePreferredImageDynamicRangeAnimation");

  LOBYTE(self) = -[PUImageTileViewController _assetNeedsHDR](self, "_assetNeedsHDR");
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableFlexGTC");

  return v4 & self & v6;
}

- (BOOL)_assetNeedsHDR
{
  void *v2;
  __int16 v3;
  unint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  int v9;
  char v10;

  -[PUImageTileViewController asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaSubtypes");
  v4 = objc_msgSend(v2, "mediaSubtypes");
  objc_msgSend(MEMORY[0x1E0D7B508], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "gainMapEnabled");

  objc_msgSend(MEMORY[0x1E0D7B508], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "toneMapEnabled");

  if ((v3 & 0x200) != 0)
    v9 = (v4 >> 23) & 1;
  else
    v9 = 1;
  if (v9)
    v10 = (v4 & 0x800000) != 0;
  else
    v10 = v8 & ~v6;

  return v10;
}

- (void)imageRequester:(id)a3 didProduceResult:(id)a4
{
  void *v5;
  _BOOL4 v6;
  id v7;

  v7 = a4;
  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUImageTileViewController shouldAdoptResult:overExistingResult:](self, "shouldAdoptResult:overExistingResult:", v7, v5);

  if (v6)
    -[PUImageTileViewController displayImageRequestResult:](self, "displayImageRequestResult:", v7);

}

- (void)imageRequesterDidUpdateFullSizeImageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "fullSizeImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController _setFullSizeImageData:](self, "_setFullSizeImageData:", v5);

  objc_msgSend(v4, "fullSizeImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImageTileViewController _setFullSizeImageURL:](self, "_setFullSizeImageURL:", v6);
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)shouldAdoptResult:(id)a3 overExistingResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  const char *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  float v32;
  float v33;
  float v34;
  int v35;
  int v36;
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = v6;
      v16 = "Accepting new image requester result because existing result is nil.\n\t%@";
      goto LABEL_12;
    }
LABEL_13:
    v17 = 1;
LABEL_35:

    goto LABEL_36;
  }
  if (-[PUImageTileViewController shouldRetainNonFinalImageUntilZoom](self, "shouldRetainNonFinalImageUntilZoom")
    && objc_msgSend(v6, "imageIsFullQuality"))
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = v6;
      v9 = "Ignoring new image requester result because we are refraining from showing final image until we zoom in to di"
           "splay full image data.\n"
           "\t%@";
LABEL_33:
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, 0xCu);
      goto LABEL_34;
    }
    goto LABEL_34;
  }
  objc_msgSend(v6, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = objc_msgSend(v11, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
      PLOneUpGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138412290;
        v38 = v6;
        v16 = "Accepting new image requester result because uuid does not match existing result.\n\t%@";
LABEL_12:
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  objc_msgSend(v6, "asset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  v21 = v19;
  if (v20 == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = objc_msgSend(v20, "isContentEqualTo:", v21);
    if (!v23)
      v23 = objc_msgSend(v22, "isContentEqualTo:", v20);

    if (v23 != 2)
      goto LABEL_28;
  }
  objc_msgSend(v6, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  objc_msgSend(v7, "image");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "size");
  if ((PFSizeLargerThanSize() & 1) != 0)
  {

  }
  else
  {
    v26 = objc_msgSend(v6, "imageIsFullQuality");

    if ((v26 & 1) == 0)
    {
      PLOneUpGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138412290;
        v38 = v6;
        v9 = "Ignoring new image requester result because its image is not larger than the existing one and it is not ful"
             "l quality.\n"
             "\t%@";
        goto LABEL_33;
      }
      goto LABEL_34;
    }
  }
  objc_msgSend(v6, "image");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 == v28
    && (v29 = objc_msgSend(v6, "gainMapImage"), v29 == objc_msgSend(v7, "gainMapImage"))
    && (objc_msgSend(v6, "gainMapValue"), v33 = v32, objc_msgSend(v7, "gainMapValue"), v33 == v34))
  {
    v35 = objc_msgSend(v6, "imageIsFullQuality");
    v36 = objc_msgSend(v7, "imageIsFullQuality");

    if (v35 == v36)
    {
      PLOneUpGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v37 = 138412290;
      v38 = v6;
      v9 = "Ignoring new image requester result because its image, gain map info, and full quality flag is equal to our c"
           "urrent one.\n"
           "\t%@";
      goto LABEL_33;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "image");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = v6;
      v9 = "Ignoring new image requester result because its image is nil.\n\t%@";
      goto LABEL_33;
    }
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
LABEL_28:
  v17 = 1;
LABEL_36:

  return v17;
}

- (BOOL)shouldAnimateAppearanceOfResult:(id)a3 overExistingResult:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  BOOL v18;

  v6 = a3;
  v7 = a4;
  if (!-[PUTileController isAnimating](self, "isAnimating"))
  {
    objc_msgSend(v7, "asset");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if (v13 == v14)
      {

      }
      else
      {
        v15 = objc_msgSend(v13, "isContentEqualTo:", v14);
        if (!v15)
          v15 = objc_msgSend(v14, "isContentEqualTo:", v13);

        if (v15 != 2)
        {
          -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isScrubbing");

          if (!v17)
            goto LABEL_16;
          goto LABEL_12;
        }
      }

    }
LABEL_12:
    v18 = -[PUImageTileViewController animatesImageTransitions](self, "animatesImageTransitions");
    if ((!v7 || !v18)
      && (!-[PUImageTileViewController shouldAnimateToFullQualityResult](self, "shouldAnimateToFullQualityResult")
       || (objc_msgSend(v6, "imageIsFullQuality") & 1) == 0))
    {
      goto LABEL_2;
    }
LABEL_16:
    v8 = 1;
    goto LABEL_17;
  }
LABEL_2:
  v8 = 0;
LABEL_17:

  return v8;
}

- (void)displayImageRequestResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLOneUpGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Displaying image requester result: %@", buf, 0xCu);
  }

  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);
  if (v8
    || (-[PUImageTileViewController placeholderColor](self, "placeholderColor"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUImageTileViewController placeholderColor](self, "placeholderColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  objc_msgSend(v7, "setBackgroundColor:", v9);

  -[PUImageTileViewController setIsDisplayingFullQualityImage:](self, "setIsDisplayingFullQualityImage:", objc_msgSend(v4, "imageIsFullQuality"));
  -[PUImageTileViewController setGainMapImage:](self, "setGainMapImage:", objc_msgSend(v4, "gainMapImage"));
  objc_msgSend(v4, "gainMapValue");
  -[PUImageTileViewController setGainMapValue:](self, "setGainMapValue:");
  -[PUImageTileViewController setDisplayedImageRequestResult:](self, "setDisplayedImageRequestResult:", v4);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullQualityCrossfadeDuration");
  v14 = v13;

  if (-[PUImageTileViewController shouldAnimateAppearanceOfResult:overExistingResult:](self, "shouldAnimateAppearanceOfResult:overExistingResult:", v4, v6)&& v14 > 0.0)
  {
    objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "addSubview:", v15);
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__PUImageTileViewController_displayImageRequestResult___block_invoke;
    v24[3] = &unk_1E58ABD10;
    v25 = v15;
    v19 = v17;
    v20 = 3221225472;
    v21 = __55__PUImageTileViewController_displayImageRequestResult___block_invoke_2;
    v22 = &unk_1E58A9910;
    v23 = v25;
    v18 = v25;
    objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 2, v24, &v19, v14, 0.0);

  }
  -[PUImageTileViewController _updateAssetLoadingStage](self, "_updateAssetLoadingStage", v19, v20, v21, v22);
  -[PUImageTileViewController _configureImageViewPreferredImageDynamicRange](self, "_configureImageViewPreferredImageDynamicRange");
  -[PUImageTileViewController _invalidateImageLayerModulatorInput](self, "_invalidateImageLayerModulatorInput");
  -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
  if (v8 && objc_msgSend(v4, "imageIsFullQuality"))
  {
    -[PUImageTileViewController _notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded](self, "_notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded");
    -[PUImageTileViewController _notifyFullQualityImageDisplayed](self, "_notifyFullQualityImageDisplayed");
  }
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_notifyFullQualityImageDisplayed
{
  id v3;

  if (self->_presentingDelegateFlags.respondsToFullQualityImageDisplayed)
  {
    -[PUImageTileViewController presentingDelegate](self, "presentingDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageTileViewController:didDisplayFullQualityImageWithDeferredProcessingFinished:", self, -[PUImageTileViewController isDeferredProcessingFinished](self, "isDeferredProcessingFinished"));

  }
}

- (void)_invalidateImageLayerModulatorManager
{
  -[PUImageTileViewController _setNeedsUpdateImageLayerModulatorManager:](self, "_setNeedsUpdateImageLayerModulatorManager:", 1);
}

- (void)_updateImageLayerModulatorManagerIfNeeded
{
  if (-[PUImageTileViewController _needsUpdateImageLayerModulatorManager](self, "_needsUpdateImageLayerModulatorManager"))
  {
    -[PUImageTileViewController _setNeedsUpdateImageLayerModulatorManager:](self, "_setNeedsUpdateImageLayerModulatorManager:", 0);
    -[PUImageTileViewController _updateModulatorManager](self, "_updateModulatorManager");
  }
}

- (void)_updateModulatorManager
{
  id v2;

  -[PUImageTileViewController imageModulationManager](self, "imageModulationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsEnabledUpdate");

}

- (void)_invalidateImageLayerModulator
{
  -[PUImageTileViewController _setNeedsUpdateImageLayerModulator:](self, "_setNeedsUpdateImageLayerModulator:", 1);
}

- (void)_updateImageLayerModulatorIfNeeded
{
  if (-[PUImageTileViewController _needsUpdateImageLayerModulator](self, "_needsUpdateImageLayerModulator"))
  {
    -[PUImageTileViewController _setNeedsUpdateImageLayerModulator:](self, "_setNeedsUpdateImageLayerModulator:", 0);
    -[PUImageTileViewController updateModulator](self, "updateModulator");
  }
}

- (void)updateModulator
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[PUTileController tilingView](self, "tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDisplayHDR");

  if (v4)
  {
    -[PUImageTileViewController imageModulationManager](self, "imageModulationManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D7B500];
    -[PUImageTileViewController asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "optionsForAsset:", v6);
    v9 = v8;

    -[PUImageTileViewController imageLayerModulator](self, "imageLayerModulator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkInImageLayerModulator:", v10);

    objc_msgSend(v12, "checkoutImageLayerModulatorWithOptions:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController setImageLayerModulator:](self, "setImageLayerModulator:", v11);

  }
}

- (void)_invalidateImageLayerModulatorInput
{
  -[PUImageTileViewController _setNeedsUpdateImageLayerModulatorInput:](self, "_setNeedsUpdateImageLayerModulatorInput:", 1);
}

- (void)_updateImageLayerModulatorInputIfNeeded
{
  if (-[PUImageTileViewController _needsUpdateImageLayerModulatorInput](self, "_needsUpdateImageLayerModulatorInput"))
  {
    -[PUImageTileViewController _setNeedsUpdateImageLayerModulatorInput:](self, "_setNeedsUpdateImageLayerModulatorInput:", 0);
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
      -[PUImageTileViewController updateModulatorInputs](self, "updateModulatorInputs");
  }
}

- (void)updateModulatorInputs
{
  void *v3;
  _QWORD v4[5];

  -[PUImageTileViewController imageLayerModulator](self, "imageLayerModulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PUImageTileViewController_updateModulatorInputs__block_invoke;
  v4[3] = &unk_1E58A9E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)updateMutableImageLayerModulator:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUTileViewController originalView](self, "originalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayer:", v5);

  if (-[PUImageTileViewController gainMapImageIsAvailable](self, "gainMapImageIsAvailable"))
  {
    objc_msgSend(v6, "setGainMapImage:animated:", -[PUImageTileViewController gainMapImage](self, "gainMapImage"), 1);
    -[PUImageTileViewController gainMapValue](self, "gainMapValue");
    objc_msgSend(v6, "setGainMapValue:");
  }

}

- (void)_updateAssetLoadingStage
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v6, "cloudPlaceholderKind") - 2, v4 <= 5))
    v5 = qword_1AB0EFAC8[v4];
  else
    v5 = 0;
  -[PUImageTileViewController _setAssetLoadingStage:](self, "_setAssetLoadingStage:", v5);

}

- (void)_invalidateFullSizeImageMetadata
{
  -[PUImageTileViewController _setNeedsUpdateFullSizeImageMetadata:](self, "_setNeedsUpdateFullSizeImageMetadata:", 1);
}

- (void)_updateFullSizeImageMetadataIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;

  if (-[PUImageTileViewController _needsUpdateFullSizeImageMetadata](self, "_needsUpdateFullSizeImageMetadata"))
  {
    -[PUImageTileViewController _setNeedsUpdateFullSizeImageMetadata:](self, "_setNeedsUpdateFullSizeImageMetadata:", 0);
    v10 = *MEMORY[0x1E0C9D820];
    -[PUImageTileViewController _fullSizeImageData](self, "_fullSizeImageData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController _fullSizeImageURL](self, "_fullSizeImageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PLGetOrientationAndUntransformedSizeFromImageURL();
    }
    else if (v3)
    {
      PLGetOrientationAndUntransformedSizeFromImageData();
    }
    v5 = PLImageOrientationFromExifOrientation();
    PLOrientationTransformImageSize();
    v7 = v6;
    v9 = v8;
    -[PUImageTileViewController _setFullSizeImageOrientation:](self, "_setFullSizeImageOrientation:", v5);
    -[PUImageTileViewController _setFullSizeImageUntransformedSize:](self, "_setFullSizeImageUntransformedSize:", v10);
    -[PUImageTileViewController _setFullSizeImageSize:](self, "_setFullSizeImageSize:", v7, v9);

  }
}

- (void)_invalidateFullSizeTiledLayer
{
  -[PUImageTileViewController _setNeedsUpdateFullSizeTiledLayer:](self, "_setNeedsUpdateFullSizeTiledLayer:", 1);
}

- (void)_updateFullSizeTiledLayerIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
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
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  CGImage *v37;
  _BOOL8 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  int v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double Width;
  CGFloat v91;
  BOOL v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double Height;
  CGFloat v98;
  BOOL v99;
  CGFloat v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  _BOOL8 v116;
  double v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  __int128 v121;
  CGFloat v122;
  void *v123;
  CGFloat v124;
  void *v125;
  void *v126;
  CGFloat MidY;
  void *v128;
  CGColorSpace *ColorSpace;
  CGFloat MidX;
  unint64_t v131;
  __int128 v132;
  void *v133;
  __int128 v134;
  double v135;
  _QWORD v136[4];
  id v137;
  CGFloat v138;
  CGFloat v139;
  CGAffineTransform v140;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v143;
  CGAffineTransform v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  if (-[PUImageTileViewController _needsUpdateFullSizeTiledLayer](self, "_needsUpdateFullSizeTiledLayer"))
  {
    -[PUImageTileViewController _setNeedsUpdateFullSizeTiledLayer:](self, "_setNeedsUpdateFullSizeTiledLayer:", 0);
    -[PUImageTileViewController _fullSizeImageData](self, "_fullSizeImageData");
    v3 = objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController _fullSizeImageURL](self, "_fullSizeImageURL");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v3 | v4)
    {
      v5 = -[PUTileViewController isViewLoaded](self, "isViewLoaded");
      -[PUImageTileViewController _fullSizeTiledLayer](self, "_fullSizeTiledLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[PUImageTileViewController _imageView](self, "_imageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (-[PUImageTileViewController _fullSizeImageOrientation](self, "_fullSizeImageOrientation") - 2) & 0xFFFFFFFFFFFFFFFALL;
        if (!v6)
        {
          v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
          objc_msgSend(v7, "frame");
          v10 = (void *)objc_msgSend(v9, "initWithFrame:");
          -[PUImageTileViewController setTiledLayerHostingView:](self, "setTiledLayerHostingView:", v10);
          objc_msgSend(v10, "setAutoresizingMask:", 18);
          objc_msgSend(v7, "addSubview:", v10);
          objc_msgSend(v7, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "insertSublayer:atIndex:", v12, 0);

          -[PUTileViewController view](self, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "screen");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "nativeBounds");
          v17 = v16;
          v19 = v18;

          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v20;
          if (objc_msgSend(v20, "enableFigPhotoTiledLayer"))
          {
            if (objc_msgSend(v20, "enableFigPhotoBackgroundSizeBasedDisplay"))
            {
              -[PUImageTileViewController image](self, "image");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "size");
              -[PUImageTileViewController image](self, "image");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "scale");
              PXSizeScale();
              v24 = v23;
              v26 = v25;

            }
            else
            {
              v24 = *MEMORY[0x1E0C9D820];
              v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
            }
            v131 = v8;
            if (objc_msgSend(v20, "simulateWorstCaseFigPhotoBackgroundSize"))
            {
              -[PUImageTileViewController image](self, "image");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "size");
              -[PUImageTileViewController image](self, "image");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v125, "size");
              -[PUTileViewController view](self, "view");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "window");
              v128 = v7;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "bounds");
              PFSizeWithAspectRatioFittingSize();
              -[PUTileViewController view](self, "view");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "window");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "screen");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "scale");
              PXSizeScale();
              v24 = v32;
              v26 = v33;

              v7 = v128;
            }
            if (v8)
              v34 = v26;
            else
              v34 = v24;
            if (!v8)
              v24 = v26;
            if (v3)
            {
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09248]), "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", v3, 0, v24, v34, v17, v19);
            }
            else if (v4)
            {
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09248]), "initWithContainerURL:containerImageIndex:backgroundImageSize:screenSize:", v4, 0, v24, v34, v17, v19);
            }
            else
            {
              v35 = 0;
            }
            v6 = v35;
            if (-[PUImageTileViewController didRequestHDR](self, "didRequestHDR"))
            {
              -[PUImageTileViewController image](self, "image");
              v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v37 = (CGImage *)objc_msgSend(v36, "CGImage");

              ColorSpace = CGImageGetColorSpace(v37);
              v38 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
              v39 = v38 ? 1 : 2;
              objc_msgSend(v6, "setDecodeToHDROutputMode:", v39);
              objc_msgSend(v6, "setShouldDisplayHDR:", v38);
              +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
              v40 = v7;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "enableFlexGTC");

              v7 = v40;
              if (v38)
              {
                if (v42)
                  objc_msgSend(v6, "setFlexGTCColorSpace:", ColorSpace);
              }
            }
            objc_msgSend(v6, "prepareForDecode");
            -[PUImageTileViewController _registerIfPossibleForHeadroomUsageTraitChangesOfView:](self, "_registerIfPossibleForHeadroomUsageTraitChangesOfView:", v7);

            v8 = v131;
          }
          else if (v3)
          {
            v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D714C0]), "initWithJPEGData:placeholderImage:screenSize:", v3, 0, v17, v19);
          }
          else
          {
            v6 = 0;
          }
          v43 = *MEMORY[0x1E0C9D538];
          v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          -[PUImageTileViewController _fullSizeImageUntransformedSize](self, "_fullSizeImageUntransformedSize");
          objc_msgSend(v6, "setBounds:", v43, v44, v45, v46);
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "useDebuggingColors");

          if (v48)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 0.25);
            v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v6, "setBorderColor:", objc_msgSend(v49, "CGColor"));

            objc_msgSend(v6, "setBorderWidth:", 100.0);
          }
          objc_msgSend(v10, "layer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addSublayer:", v6);

          -[PUImageTileViewController tiledLayerAlphaAnimator](self, "tiledLayerAlphaAnimator");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v51)
          {
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD50]), "initWithValue:", 0.0);
            -[PUImageTileViewController setTiledLayerAlphaAnimator:](self, "setTiledLayerAlphaAnimator:", v52);

            -[PUImageTileViewController tiledLayerAlphaAnimator](self, "tiledLayerAlphaAnimator");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "registerChangeObserver:context:", self, tiledLayerAlphaAnimatorContext);

          }
          -[PUImageTileViewController tiledLayerAlphaAnimator](self, "tiledLayerAlphaAnimator");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "performChangesWithoutAnimation:", &__block_literal_global_317);

          objc_msgSend(v10, "setAlpha:", 0.0);
          -[PUImageTileViewController tiledLayerAlphaAnimator](self, "tiledLayerAlphaAnimator");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "performChangesWithDuration:curve:changes:", 4, &__block_literal_global_318, 1.0);

          -[PUImageTileViewController _setFullSizeTiledLayer:](self, "_setFullSizeTiledLayer:", v6);
        }
        -[PUImageTileViewController tiledLayerHostingView](self, "tiledLayerHostingView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bounds");
        v58 = v57;
        v60 = v59;
        v62 = v61;
        v64 = v63;

        v145.origin.x = v58;
        v145.origin.y = v60;
        v145.size.width = v62;
        v145.size.height = v64;
        MidX = CGRectGetMidX(v145);
        v146.origin.x = v58;
        v146.origin.y = v60;
        v65 = v60;
        v146.size.width = v62;
        v124 = v62;
        v146.size.height = v64;
        MidY = CGRectGetMidY(v146);
        v132 = *MEMORY[0x1E0C9BAA8];
        v134 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v144.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v144.c = v134;
        v121 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(_OWORD *)&v144.tx = v121;
        -[PUImageTileViewController _fullSizeImageSize](self, "_fullSizeImageSize");
        v67 = v66;
        v69 = v68;
        v147.origin.x = v58;
        v147.origin.y = v65;
        v147.size.width = v62;
        v147.size.height = v64;
        v70 = CGRectGetWidth(v147) / v67;
        v148.origin.x = v58;
        v148.origin.y = v65;
        v148.size.width = v62;
        v148.size.height = v64;
        v71 = CGRectGetHeight(v148) / v69;
        if (v70 > v71)
          v71 = v70;
        *(_OWORD *)&v143.a = v132;
        *(_OWORD *)&v143.c = v134;
        *(_OWORD *)&v143.tx = v121;
        CGAffineTransformScale(&v144, &v143, v71, v71);
        -[PUImageTileViewController _fullSizeImageOrientation](self, "_fullSizeImageOrientation");
        PLTransformForImageOrientation();
        t1 = v144;
        CGAffineTransformConcat(&v143, &t1, &t2);
        v144 = v143;
        -[PUTileViewController view](self, "view");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "window");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "screen");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "nativeScale");
        v135 = v75;

        -[PUTileViewController visibleRect](self, "visibleRect");
        v77 = v76;
        v79 = v78;
        v81 = v80;
        v83 = v82;
        -[PUImageTileViewController tiledLayerHostingView](self, "tiledLayerHostingView");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "layer");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "convertRect:fromLayer:", v85, v77, v79, v81, v83);
        v120 = v87;
        v122 = v86;
        v118 = v88;
        v119 = v89;

        v149.origin.x = v77;
        v149.origin.y = v79;
        v149.size.width = v81;
        v149.size.height = v83;
        Width = CGRectGetWidth(v149);
        v150.origin.x = v58;
        v150.origin.y = v65;
        v150.size.width = v124;
        v150.size.height = v64;
        v91 = CGRectGetWidth(v150);
        v92 = Width < v91;
        if (Width >= v91)
          v93 = v58;
        else
          v93 = v77;
        if (v92)
          v94 = v79;
        else
          v94 = v65;
        if (v92)
          v95 = v81;
        else
          v95 = v124;
        if (v92)
          v96 = v83;
        else
          v96 = v64;
        v117 = v135 * CGRectGetWidth(*(CGRect *)&v93);
        v151.origin.x = v77;
        v151.origin.y = v79;
        v151.size.width = v81;
        v151.size.height = v83;
        Height = CGRectGetHeight(v151);
        v152.origin.x = v58;
        v152.origin.y = v65;
        v152.size.width = v124;
        v152.size.height = v64;
        v98 = CGRectGetHeight(v152);
        v99 = Height < v98;
        if (Height >= v98)
          v100 = v58;
        else
          v100 = v77;
        v101 = v79;
        if (v99)
        {
          v102 = v81;
        }
        else
        {
          v101 = v65;
          v102 = v124;
        }
        v103 = v118;
        v104 = v119;
        if (v99)
          v105 = v83;
        else
          v105 = v64;
        v106 = v135 * CGRectGetHeight(*(CGRect *)&v100);
        if (v8)
          v107 = v117;
        else
          v107 = v106;
        if (v8)
          v108 = v106;
        else
          v108 = v117;
        v109 = v120;
        v153.origin.x = v122;
        v153.origin.y = v120;
        v153.size.width = v118;
        v153.size.height = v119;
        v110 = v107 / CGRectGetWidth(v153);
        v154.origin.x = v122;
        v154.origin.y = v120;
        v154.size.width = v118;
        v154.size.height = v119;
        v111 = v108 / CGRectGetHeight(v154);
        if (v110 >= v111)
          v112 = v111;
        else
          v112 = v110;
        v113 = v122;
        v114 = (void *)MEMORY[0x1E0CD27A8];
        -[PUTileViewController view](self, "view", *(_QWORD *)&v117);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_3;
        v136[3] = &unk_1E58A0140;
        v6 = v6;
        v137 = v6;
        v138 = MidX;
        v139 = MidY;
        v140 = v144;
        objc_msgSend(v114, "pu_animateAlongsideView:animations:", v115, v136);

        v155.origin.x = v122;
        v155.origin.y = v120;
        v155.size.width = v118;
        v155.size.height = v119;
        if (CGRectIsNull(v155))
        {
          v113 = *MEMORY[0x1E0C9D648];
          v109 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v103 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v104 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        }
        objc_msgSend(v6, "setVisibleRectangle:zoomScale:", v113, v109, v103, v104, v112);
        v116 = 1;
        -[PUImageTileViewController setIsDisplayingFullQualityImage:](self, "setIsDisplayingFullQualityImage:", 1);
        if (-[PUImageTileViewController canUseFullSizeTiledLayer](self, "canUseFullSizeTiledLayer"))
          v116 = -[PUTileController isViewControllerTransitioning](self, "isViewControllerTransitioning");
        objc_msgSend(v6, "setHidden:", v116);

        goto LABEL_77;
      }
    }
    else
    {
      -[PUImageTileViewController _fullSizeTiledLayer](self, "_fullSizeTiledLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v6)
    {
LABEL_78:

      return;
    }
    -[PUImageTileViewController tiledLayerHostingView](self, "tiledLayerHostingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeFromSuperview");

    -[PUImageTileViewController setTiledLayerHostingView:](self, "setTiledLayerHostingView:", 0);
    -[PUImageTileViewController setTiledLayerAlphaAnimator:](self, "setTiledLayerAlphaAnimator:", 0);
    objc_msgSend(v6, "removeFromSuperlayer");
    -[PUImageTileViewController _setFullSizeTiledLayer:](self, "_setFullSizeTiledLayer:", 0);
LABEL_77:

    goto LABEL_78;
  }
}

- (void)_registerIfPossibleForHeadroomUsageTraitChangesOfView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PUImageTileViewController__registerIfPossibleForHeadroomUsageTraitChangesOfView___block_invoke;
  v8[3] = &unk_1E58A0168;
  objc_copyWeak(&v9, &location);
  v7 = (id)objc_msgSend(v4, "registerForTraitChanges:withHandler:", v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_applyHDRSuppressionToWithTraitEnvironment:(id)a3
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUImageTileViewController _fullSizeTiledLayer](self, "_fullSizeTiledLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sublayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v19 = v4;
    objc_msgSend(v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_headroomUsage");

    objc_msgSend(v5, "sublayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_ui_animationForHDRHeadroomUsageEnabled:", v9 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v18, "_ui_configureForHDRHeadroomUsageEnabled:", v9 != 0);
          if (v12)
            objc_msgSend(v18, "addAnimation:forKey:", v12, CFSTR("contentsEDRStrength"));
          else
            objc_msgSend(v18, "removeAnimationForKey:", CFSTR("contentsEDRStrength"));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    v4 = v19;
  }

}

- (void)setIsDisplayingFullQualityImage:(BOOL)a3
{
  if (self->_isDisplayingFullQualityImage != a3)
  {
    self->_isDisplayingFullQualityImage = a3;
    -[PUImageTileViewController _updateReadyForDisplay](self, "_updateReadyForDisplay");
  }
}

- (void)setDisplayedImageRequestResult:(id)a3
{
  PUImageRequesterResult *v5;
  PUImageRequesterResult *v6;

  v5 = (PUImageRequesterResult *)a3;
  if (self->_displayedImageRequestResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayedImageRequestResult, a3);
    -[PUImageTileViewController displayedImageRequestResultDidChange](self, "displayedImageRequestResultDidChange");
    v5 = v6;
  }

}

- (void)_updateReadyForDisplay
{
  -[PUTileViewController _setReadyForDisplay:](self, "_setReadyForDisplay:", -[PUImageTileViewController isDisplayingFullQualityImage](self, "isDisplayingFullQualityImage"));
}

- (id)generateAssetTransitionInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];

  -[PUImageTileViewController _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D7B500];
  -[PUImageTileViewController asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "optionsForAsset:", v6);
  v9 = v8;

  -[PUImageTileViewController imageModulationManager](self, "imageModulationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkoutImageLayerModulatorWithOptions:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke;
  v20[3] = &unk_1E58A9E78;
  v20[4] = self;
  objc_msgSend(v11, "performChanges:", v20);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke_2;
  v17[3] = &unk_1E58A9EA0;
  v17[4] = self;
  v18 = v4;
  v19 = v11;
  v13 = v11;
  v14 = v4;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_cancelAllImageRequests
{
  id v2;

  -[PUImageTileViewController _imageRequester](self, "_imageRequester");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllImageRequests");

}

- (void)_updateImageViewBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[PUImageTileViewController placeholderColor](self, "placeholderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[PUTileController shouldPreserveCurrentContent](self, "shouldPreserveCurrentContent"))
  {
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
    {
      -[PUImageTileViewController _handleAssetViewModel:didChange:](self, "_handleAssetViewModel:didChange:", v9, v6);
    }
    else
    {
      -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v9)
        -[PUImageTileViewController _handleBrowsingViewModel:didChange:](self, "_handleBrowsingViewModel:didChange:", v9, v6);
    }
  }

}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "revealsGainMapImageChanged"))
  {
    -[PUImageTileViewController imageLayerModulator](self, "imageLayerModulator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PUImageTileViewController__handleAssetViewModel_didChange___block_invoke;
    v10[3] = &unk_1E58A9E78;
    v10[4] = self;
    objc_msgSend(v8, "performChanges:", v10);

  }
  if (objc_msgSend(v7, "assetChanged"))
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController _setAssetWithoutUpdateIfNeeded:](self, "_setAssetWithoutUpdateIfNeeded:", v9);

  }
  -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "isPresentedForPreviewDidChange", a3))
    -[PUImageTileViewController _configureImageViewPreferredImageDynamicRange](self, "_configureImageViewPreferredImageDynamicRange");
}

- (void)setPresentingDelegate:(id)a3
{
  id WeakRetained;
  $1B0A5F03BBF8FAFA9831689EB7650128 *p_presentingDelegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentingDelegate, obj);
    p_presentingDelegateFlags = &self->_presentingDelegateFlags;
    p_presentingDelegateFlags->respondsToPPTShouldSignalDeferredProcessingDoneAndFinalImageDisplayed = objc_opt_respondsToSelector() & 1;
    p_presentingDelegateFlags->respondsToFullQualityImageDisplayed = objc_opt_respondsToSelector() & 1;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)tiledLayerAlphaAnimatorContext == a5)
  {
    if ((v6 & 2) != 0)
    {
      v15 = v9;
      -[PUImageTileViewController tiledLayerAlphaAnimator](self, "tiledLayerAlphaAnimator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentationValue");
      v12 = v11;
      -[PUImageTileViewController tiledLayerHostingView](self, "tiledLayerHostingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", v12);

      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXDisplayScreenDynamicRangeObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageTileViewController.m"), 1512, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v15 = v9;
      -[PUImageTileViewController _invalidateDidRequestHDR](self, "_invalidateDidRequestHDR");
      -[PUImageTileViewController _invalidateImage](self, "_invalidateImage");
      -[PUImageTileViewController _invalidateFullSizeTiledLayer](self, "_invalidateFullSizeTiledLayer");
      -[PUImageTileViewController _updateIfNeeded](self, "_updateIfNeeded");
LABEL_7:
      v9 = v15;
    }
  }

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXImageModulationManager)imageModulationManager
{
  return self->_imageModulationManager;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (PUImageTileViewControllerPresentingDelegate)presentingDelegate
{
  return (PUImageTileViewControllerPresentingDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (BOOL)animatesImageTransitions
{
  return self->_animatesImageTransitions;
}

- (void)setAnimatesImageTransitions:(BOOL)a3
{
  self->_animatesImageTransitions = a3;
}

- (BOOL)shouldUseFullSizeImageData
{
  return self->_shouldUseFullSizeImageData;
}

- (BOOL)_needsUpdateImage
{
  return self->__needsUpdateImage;
}

- (void)_setNeedsUpdateImage:(BOOL)a3
{
  self->__needsUpdateImage = a3;
}

- (BOOL)_needsUpdateImageLayerModulatorManager
{
  return self->__needsUpdateImageLayerModulatorManager;
}

- (void)_setNeedsUpdateImageLayerModulatorManager:(BOOL)a3
{
  self->__needsUpdateImageLayerModulatorManager = a3;
}

- (BOOL)_needsUpdateImageLayerModulator
{
  return self->__needsUpdateImageLayerModulator;
}

- (void)_setNeedsUpdateImageLayerModulator:(BOOL)a3
{
  self->__needsUpdateImageLayerModulator = a3;
}

- (BOOL)_needsUpdateImageLayerModulatorInput
{
  return self->__needsUpdateImageLayerModulatorInput;
}

- (void)_setNeedsUpdateImageLayerModulatorInput:(BOOL)a3
{
  self->__needsUpdateImageLayerModulatorInput = a3;
}

- (BOOL)_needsUpdateFullSizeImageMetadata
{
  return self->__needsUpdateFullSizeImageMetadata;
}

- (void)_setNeedsUpdateFullSizeImageMetadata:(BOOL)a3
{
  self->__needsUpdateFullSizeImageMetadata = a3;
}

- (BOOL)_needsUpdateFullSizeTiledLayer
{
  return self->__needsUpdateFullSizeTiledLayer;
}

- (void)_setNeedsUpdateFullSizeTiledLayer:(BOOL)a3
{
  self->__needsUpdateFullSizeTiledLayer = a3;
}

- (BOOL)_needsUpdateDidRequestHDR
{
  return self->__needsUpdateDidRequestHDR;
}

- (void)_setNeedsUpdateDidRequestHDR:(BOOL)a3
{
  self->__needsUpdateDidRequestHDR = a3;
}

- (BOOL)didRequestHDR
{
  return self->_didRequestHDR;
}

- (CGSize)_targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->__targetSize.width;
  height = self->__targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)needsUpdateTargetSize
{
  return self->_needsUpdateTargetSize;
}

- (void)setNeedsUpdateTargetSize:(BOOL)a3
{
  self->_needsUpdateTargetSize = a3;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIView)tiledLayerHostingView
{
  return self->_tiledLayerHostingView;
}

- (void)setTiledLayerHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_tiledLayerHostingView, a3);
}

- (PXNumberAnimator)tiledLayerAlphaAnimator
{
  return self->_tiledLayerAlphaAnimator;
}

- (void)setTiledLayerAlphaAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_tiledLayerAlphaAnimator, a3);
}

- (NSData)_fullSizeImageData
{
  return self->__fullSizeImageData;
}

- (NSURL)_fullSizeImageURL
{
  return self->__fullSizeImageURL;
}

- (int64_t)_fullSizeImageOrientation
{
  return self->__fullSizeImageOrientation;
}

- (void)_setFullSizeImageOrientation:(int64_t)a3
{
  self->__fullSizeImageOrientation = a3;
}

- (CGSize)_fullSizeImageUntransformedSize
{
  double width;
  double height;
  CGSize result;

  width = self->__fullSizeImageUntransformedSize.width;
  height = self->__fullSizeImageUntransformedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setFullSizeImageUntransformedSize:(CGSize)a3
{
  self->__fullSizeImageUntransformedSize = a3;
}

- (CGSize)_fullSizeImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__fullSizeImageSize.width;
  height = self->__fullSizeImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setFullSizeImageSize:(CGSize)a3
{
  self->__fullSizeImageSize = a3;
}

- (PLTileableLayer)_fullSizeTiledLayer
{
  return self->__fullSizeTiledLayer;
}

- (void)_setFullSizeTiledLayer:(id)a3
{
  objc_storeStrong((id *)&self->__fullSizeTiledLayer, a3);
}

- (int64_t)_assetLoadingStage
{
  return self->__assetLoadingStage;
}

- (NSDate)_assetLoadingStartDate
{
  return self->__assetLoadingStartDate;
}

- (void)_setAssetLoadingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->__assetLoadingStartDate, a3);
}

- (BOOL)canUseFullSizeTiledLayer
{
  return self->_canUseFullSizeTiledLayer;
}

- (BOOL)requiresFullQualityImage
{
  return self->_requiresFullQualityImage;
}

- (void)setRequiresFullQualityImage:(BOOL)a3
{
  self->_requiresFullQualityImage = a3;
}

- (BOOL)shouldAnimateToFullQualityResult
{
  return self->_shouldAnimateToFullQualityResult;
}

- (BOOL)shouldRetainNonFinalImageUntilZoom
{
  return self->_shouldRetainNonFinalImageUntilZoom;
}

- (void)setShouldRetainNonFinalImageUntilZoom:(BOOL)a3
{
  self->_shouldRetainNonFinalImageUntilZoom = a3;
}

- (PUImageRequester)_imageRequester
{
  return self->__imageRequester;
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (PXEventCoalescer)targetSizeUpdateRateLimiter
{
  return self->_targetSizeUpdateRateLimiter;
}

- (BOOL)isDisplayingFullQualityImage
{
  return self->_isDisplayingFullQualityImage;
}

- (PUImageRequesterResult)displayedImageRequestResult
{
  return self->_displayedImageRequestResult;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedImageRequestResult, 0);
  objc_storeStrong((id *)&self->_targetSizeUpdateRateLimiter, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->__imageRequester, 0);
  objc_storeStrong((id *)&self->__assetLoadingStartDate, 0);
  objc_storeStrong((id *)&self->__fullSizeTiledLayer, 0);
  objc_storeStrong((id *)&self->__fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->__fullSizeImageData, 0);
  objc_storeStrong((id *)&self->_tiledLayerAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_tiledLayerHostingView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

void __61__PUImageTileViewController__handleAssetViewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assetViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRevealsGainMapImage:", objc_msgSend(v4, "revealsGainMapImage"));

}

void __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setGainMapImage:", objc_msgSend(v3, "gainMapImage"));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(v4, "setGainMapValue:");

}

void __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:", v4);

  objc_msgSend(v5, "setImage:", a1[5]);
  objc_msgSend(v5, "setImageLayerModulator:", a1[6]);

}

void __83__PUImageTileViewController__registerIfPossibleForHeadroomUsageTraitChangesOfView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_applyHDRSuppressionToWithTraitEnvironment:", v3);

}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  CGAffineTransform v5;
  CATransform3D v6;

  objc_msgSend(*(id *)(a1 + 32), "pu_setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 88);
  CATransform3DMakeAffineTransform(&v6, &v5);
  return objc_msgSend(v2, "pu_setTransform:", &v6);
}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

uint64_t __50__PUImageTileViewController_updateModulatorInputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMutableImageLayerModulator:", a2);
}

uint64_t __55__PUImageTileViewController_displayImageRequestResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __55__PUImageTileViewController_displayImageRequestResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __49__PUImageTileViewController__updateImageIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "setIncludeGainMap:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setRequestHDR:", *(unsigned __int8 *)(a1 + 81));
  objc_msgSend(*(id *)(a1 + 32), "setTargetHDRHeadroom:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setTargetSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setUseLowMemoryMode:", objc_msgSend(*(id *)(a1 + 40), "lowMemoryMode"));
  objc_msgSend(*(id *)(a1 + 32), "setRequestFullSizeImageDataUTTypes:", *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "focusValue");
  return objc_msgSend(v2, "setHighPriorityRequest:", fabs(v3) < 0.9);
}

uint64_t __47__PUImageTileViewController_setPreloadedImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePreloadedImage:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__PUImageTileViewController__notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPPT_isDeferredProcessingDoneAndFinalImageDisplayed:", 1);
}

uint64_t __60__PUImageTileViewController__updateImageRequesterTargetSize__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_targetSize");
  return objc_msgSend(*(id *)(a1 + 32), "setTargetSize:");
}

void __77__PUImageTileViewController__updateImageRequesterFullSizeImageDataProperties__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_imageRequester");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestFullSizeImageDataUTTypes:", *(_QWORD *)(a1 + 40));

}

void __74__PUImageTileViewController__configureImageViewPreferredImageDynamicRange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredImageDynamicRange:", v1);

}

+ (id)_supportedZoomImageFormats
{
  if (_supportedZoomImageFormats_onceToken != -1)
    dispatch_once(&_supportedZoomImageFormats_onceToken, &__block_literal_global_34892);
  return (id)_supportedZoomImageFormats_supportedZoomImageFormats;
}

void __55__PUImageTileViewController__supportedZoomImageFormats__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v0);

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "enableFigPhotoTiledLayer");

  if (v2)
    objc_msgSend(v5, "addObjectsFromArray:", &unk_1E59BA048);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)_supportedZoomImageFormats_supportedZoomImageFormats;
  _supportedZoomImageFormats_supportedZoomImageFormats = v3;

}

@end
