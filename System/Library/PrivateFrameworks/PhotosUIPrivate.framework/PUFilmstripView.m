@implementation PUFilmstripView

- (PUFilmstripView)initWithFrame:(CGRect)a3
{
  PUFilmstripView *v3;
  PUTileViewAnimator *v4;
  PUTileViewAnimator *animator;
  void *v6;
  double v7;
  PUFilmstripDataSource *v8;
  PUFilmstripTilingLayout *v9;
  PUFilmstripTilingLayout *v10;
  PUTilingView *v11;
  PUTilingView *v12;
  PUTilingView *tilingView;
  PUTilingView *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUFilmstripView;
  v3 = -[PUFilmstripView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PUTileViewAnimator);
    animator = v3->_animator;
    v3->_animator = v4;

    +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filmstripAspectRatio");
    v3->__thumbnailAspectRatio = v7;

    v8 = -[PUFilmstripDataSource initWithAsset:numberOfIndexes:indicatorInfos:]([PUFilmstripDataSource alloc], "initWithAsset:numberOfIndexes:indicatorInfos:", 0, 0, 0);
    -[PUFilmstripView _setDataSource:](v3, "_setDataSource:", v8);
    v9 = [PUFilmstripTilingLayout alloc];
    v10 = -[PUFilmstripTilingLayout initWithDataSource:contentSize:](v9, "initWithDataSource:contentSize:", v8, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v11 = [PUTilingView alloc];
    -[PUFilmstripView bounds](v3, "bounds");
    v12 = -[PUTilingView initWithFrame:layout:](v11, "initWithFrame:layout:", v10);
    -[PUTilingView setShowsHorizontalScrollIndicator:](v12, "setShowsHorizontalScrollIndicator:", 0);
    -[PUTilingView setShowsVerticalScrollIndicator:](v12, "setShowsVerticalScrollIndicator:", 0);
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v12, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUFilmstripImageTileViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v12, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUTileKindItemContentFilmStripIndicator"));
    -[PUTilingView setTileSource:](v12, "setTileSource:", v3);
    -[PUTilingView setTileTransitionDelegate:](v12, "setTileTransitionDelegate:", v3);
    -[PUTilingView setDelegate:](v12, "setDelegate:", v3);
    -[PUTilingView setTileAnimator:](v12, "setTileAnimator:", v3->_animator);
    -[PUTilingView setClipsToBounds:](v12, "setClipsToBounds:", 0);
    -[PUTilingView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    tilingView = v3->__tilingView;
    v3->__tilingView = v12;
    v14 = v12;

    -[PUFilmstripView addSubview:](v3, "addSubview:", v14);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUFilmstripView setBackgroundColor:](v3, "setBackgroundColor:", v15);
  }
  return v3;
}

- (void)setAsset:(id)a3
{
  -[PUFilmstripView setAsset:videoComposition:](self, "setAsset:videoComposition:", a3, self->_videoComposition);
}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  AVVideoComposition *v7;
  AVAsset *asset;
  void *v9;
  char v10;
  AVAsset *v11;

  v11 = (AVAsset *)a3;
  v7 = (AVVideoComposition *)a4;
  asset = self->_asset;
  if (asset != v11 && !-[AVAsset isEqual:](asset, "isEqual:", v11)
    || self->_videoComposition != v7 && (-[AVVideoComposition isEqual:](v7, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "disableVideoFilmstrip");

    if ((v10 & 1) == 0)
      -[PUFilmstripView reloadThumbnails](self, "reloadThumbnails");
  }

}

- (void)reloadThumbnails
{
  -[PUFilmstripView _invalidateThumbnailAspectRatio](self, "_invalidateThumbnailAspectRatio");
  -[PUFilmstripView _invalidateMediaProvider](self, "_invalidateMediaProvider");
  -[PUFilmstripView _invalidateDataSource](self, "_invalidateDataSource");
  -[PUFilmstripView _invalidateGeneratedPlaceholderImage](self, "_invalidateGeneratedPlaceholderImage");
  -[PUFilmstripView _invalidateLayout](self, "_invalidateLayout");
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[PUFilmstripView _invalidateThumbnailAspectRatio](self, "_invalidateThumbnailAspectRatio");
    -[PUFilmstripView _updateMediaProviderPlaceholderImage](self, "_updateMediaProviderPlaceholderImage");
    v5 = v6;
  }

}

- (void)setGeneratesPlaceholderImage:(BOOL)a3
{
  if (self->_generatesPlaceholderImage != a3)
  {
    self->_generatesPlaceholderImage = a3;
    -[PUFilmstripView _invalidateGeneratedPlaceholderImage](self, "_invalidateGeneratedPlaceholderImage");
  }
}

- (void)setGeneratedPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_generatedPlaceholderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_generatedPlaceholderImage, a3);
    -[PUFilmstripView _updateMediaProviderPlaceholderImage](self, "_updateMediaProviderPlaceholderImage");
    v5 = v6;
  }

}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleRect;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleRect = &self->_visibleRect;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    p_visibleRect->origin.x = x;
    p_visibleRect->origin.y = y;
    p_visibleRect->size.width = width;
    p_visibleRect->size.height = height;
    -[PUFilmstripView bounds](self, "bounds");
    v13 = PUInsetsOfRectInRect(x, y, width, height, v9, v10, v11, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[PUFilmstripView _tilingView](self, "_tilingView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLoadingInsets:", v13, v15, v17, v19);

  }
}

- (void)setIndicatorInfos:(id)a3
{
  NSArray *v4;
  NSArray *indicatorInfos;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_indicatorInfos) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    indicatorInfos = self->_indicatorInfos;
    self->_indicatorInfos = v4;

    -[PUFilmstripView _invalidateDataSource](self, "_invalidateDataSource");
  }

}

- (void)setUseContentAspectRatio:(BOOL)a3
{
  if (self->_useContentAspectRatio != a3)
  {
    self->_useContentAspectRatio = a3;
    -[PUFilmstripView _invalidateThumbnailAspectRatio](self, "_invalidateThumbnailAspectRatio");
  }
}

- (double)desiredClippingOutset
{
  return 0.0;
}

- (PUFilmstripMediaProvider)_mediaProvider
{
  void *v3;
  char v4;
  PUFilmstripMediaProvider *v5;
  void *v6;
  void *v7;
  PUFilmstripMediaProvider *v8;
  PUFilmstripMediaProvider *mediaProvider;

  if (!self->__mediaProvider)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "disableVideoFilmstrip");

    if ((v4 & 1) == 0)
    {
      v5 = [PUFilmstripMediaProvider alloc];
      -[PUFilmstripView asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFilmstripView videoComposition](self, "videoComposition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PUFilmstripMediaProvider initWithAVAsset:videoComposition:](v5, "initWithAVAsset:videoComposition:", v6, v7);
      mediaProvider = self->__mediaProvider;
      self->__mediaProvider = v8;

      -[PUFilmstripMediaProvider setDeliversImagesInOrder:](self->__mediaProvider, "setDeliversImagesInOrder:", 1);
      -[PUFilmstripView _updateMediaProviderPlaceholderImage](self, "_updateMediaProviderPlaceholderImage");
    }
  }
  return self->__mediaProvider;
}

- (void)_setThumbnailAspectRatio:(double)a3
{
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    self->__thumbnailAspectRatio = a3;
    -[PUFilmstripView _invalidateDataSource](self, "_invalidateDataSource");
    -[PUFilmstripView _invalidateGeneratedPlaceholderImage](self, "_invalidateGeneratedPlaceholderImage");
  }
}

- (void)_releaseAVObjects
{
  PUFilmstripMediaProvider *mediaProvider;
  AVAsset *asset;
  AVVideoComposition *videoComposition;

  mediaProvider = self->__mediaProvider;
  self->__mediaProvider = 0;

  asset = self->_asset;
  self->_asset = 0;

  videoComposition = self->_videoComposition;
  self->_videoComposition = 0;

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFilmstripView;
  -[PUFilmstripView layoutSubviews](&v4, sel_layoutSubviews);
  -[PUFilmstripView bounds](self, "bounds");
  -[PUFilmstripView _filmstripLayout](self, "_filmstripLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");

  if ((PUSizeIsEqualToSizeWithTolerance() & 1) == 0)
  {
    self->_needsUpdateDataSource = 1;
    self->_needsUpdateLayout = 1;
  }
  -[PUFilmstripView _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_invalidateThumbnailAspectRatio
{
  self->_needsUpdateThumbnailAspectRatio = 1;
  -[PUFilmstripView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateThumbnailAspectRatioIfNeeded
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;

  if (self->_needsUpdateThumbnailAspectRatio)
  {
    self->_needsUpdateThumbnailAspectRatio = 0;
    +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filmstripAspectRatio");
    v5 = v4;

    if (-[PUFilmstripView useContentAspectRatio](self, "useContentAspectRatio"))
    {
      -[PUFilmstripView asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFilmstripView videoComposition](self, "videoComposition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "renderSize");
        v5 = v9 / v10;
      }
      else
      {
        objc_msgSend(v6, "tracks");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "naturalSize");
          v15 = v14;
          v17 = v16;
          v25 = 0u;
          v26 = 0u;
          v24 = 0u;
          if (v13)
            objc_msgSend(v13, "preferredTransform");
          v27.size.width = v17 * 0.0 + 0.0 * v15;
          v27.size.height = v27.size.width;
          v27.origin.x = 0.0;
          v27.origin.y = 0.0;
          v28 = CGRectStandardize(v27);
          v5 = v28.size.width / v28.size.height;

        }
        else
        {
          -[PUFilmstripView placeholderImage](self, "placeholderImage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[PUFilmstripView placeholderImage](self, "placeholderImage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "size");
            v21 = v20;
            v23 = v22;

            v5 = v21 / v23;
          }
        }
      }

    }
    -[PUFilmstripView _setThumbnailAspectRatio:](self, "_setThumbnailAspectRatio:", fabs(v5), v24, v25, v26);
  }
}

- (void)_invalidateMediaProvider
{
  -[PUFilmstripView _setMediaProvider:](self, "_setMediaProvider:", 0);
  -[PUFilmstripView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (BOOL)_isMediaProviderValid
{
  return self->__mediaProvider != 0;
}

- (void)_invalidateDataSource
{
  self->_needsUpdateDataSource = 1;
  -[PUFilmstripView _invalidateLayout](self, "_invalidateLayout");
  -[PUFilmstripView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayout
{
  self->_needsUpdateLayout = 1;
  -[PUFilmstripView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateIfNeeded
{
  -[PUFilmstripView _updateThumbnailAspectRatioIfNeeded](self, "_updateThumbnailAspectRatioIfNeeded");
  -[PUFilmstripView _updateGeneratedPlaceholderImageIfNeeded](self, "_updateGeneratedPlaceholderImageIfNeeded");
  -[PUFilmstripView _updateDataSourceIfNeeded](self, "_updateDataSourceIfNeeded");
  -[PUFilmstripView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
}

- (void)_updateDataSourceIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  PUFilmstripDataSource *v8;
  void *v9;
  void *v10;
  PUFilmstripDataSource *v11;

  if (self->_needsUpdateDataSource)
  {
    self->_needsUpdateDataSource = 0;
    -[PUFilmstripView _thumbnailAspectRatio](self, "_thumbnailAspectRatio");
    v4 = v3;
    -[PUFilmstripView bounds](self, "bounds");
    if (v6 <= 0.0)
      v7 = 0;
    else
      v7 = vcvtpd_s64_f64(v5 / (v4 * v6));
    v8 = [PUFilmstripDataSource alloc];
    -[PUFilmstripView asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFilmstripView indicatorInfos](self, "indicatorInfos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUFilmstripDataSource initWithAsset:numberOfIndexes:indicatorInfos:](v8, "initWithAsset:numberOfIndexes:indicatorInfos:", v9, v7, v10);

    -[PUFilmstripView _setDataSource:](self, "_setDataSource:", v11);
  }
}

- (void)_updateLayoutIfNeeded
{
  PUFilmstripTilingLayout *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  PUFilmstripTilingLayout *v9;
  double v10;
  double v11;
  PUFilmstripTilingLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  if (self->_needsUpdateLayout)
  {
    self->_needsUpdateLayout = 0;
    -[PUFilmstripView _filmstripLayout](self, "_filmstripLayout");
    v3 = (PUFilmstripTilingLayout *)objc_claimAutoreleasedReturnValue();
    -[PUFilmstripView _dataSource](self, "_dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingLayout dataSource](v3, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v4, "numberOfIndexes");
    -[PUTilingLayout dataSource](v3, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfIndexes");

    if (v4 == v5)
    {
      v12 = v3;
    }
    else
    {
      v9 = [PUFilmstripTilingLayout alloc];
      -[PUFilmstripView bounds](self, "bounds");
      v12 = -[PUFilmstripTilingLayout initWithDataSource:contentSize:](v9, "initWithDataSource:contentSize:", v4, v10, v11);

      -[PUFilmstripView _tilingView](self, "_tilingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transitionToLayout:", v12);

      -[PUFilmstripView _tilingView](self, "_tilingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutIfNeeded");

      if (-[PUFilmstripView preserveThumbnailsDuringReload](self, "preserveThumbnailsDuringReload"))
      {
        if (v6 == v8)
        {
          -[PUFilmstripView _mediaProvider](self, "_mediaProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUFilmstripView _tilingView](self, "_tilingView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __40__PUFilmstripView__updateLayoutIfNeeded__block_invoke;
          v18[3] = &unk_1E58A3198;
          v19 = v15;
          v20 = v4;
          v17 = v15;
          objc_msgSend(v16, "enumerateAllTileControllersUsingBlock:", v18);

        }
      }
    }

  }
}

- (void)_updateMediaProviderPlaceholderImage
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[PUFilmstripView generatedPlaceholderImage](self, "generatedPlaceholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PUFilmstripView placeholderImage](self, "placeholderImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[PUFilmstripMediaProvider setPlaceholderImage:](self->__mediaProvider, "setPlaceholderImage:", v6);
}

- (void)_invalidateGeneratedPlaceholderImage
{
  self->_needsUpdateGeneratedPlaceholder = 1;
  -[PUFilmstripView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGeneratedPlaceholderImageIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *placeholderGenerationQueue;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  PUFilmstripView *v19;
  id v20[3];
  id location;

  if (self->_needsUpdateGeneratedPlaceholder)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "disableVideoFilmstrip");

    if ((v4 & 1) == 0)
    {
      self->_needsUpdateGeneratedPlaceholder = 0;
      if (-[PUFilmstripView generatesPlaceholderImage](self, "generatesPlaceholderImage"))
      {
        -[PUFilmstripView asset](self, "asset");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          if (!self->_placeholderGenerationQueue)
          {
            dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            v6 = objc_claimAutoreleasedReturnValue();
            v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PUFilmstripView.placeholderGeneration", v6);
            placeholderGenerationQueue = self->_placeholderGenerationQueue;
            self->_placeholderGenerationQueue = v7;

          }
          objc_initWeak(&location, self);
          -[PUFilmstripView asset](self, "asset");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUFilmstripView videoComposition](self, "videoComposition");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUFilmstripView _thumbnailAspectRatio](self, "_thumbnailAspectRatio");
          -[PUFilmstripView bounds](self, "bounds");
          PFSizeWithAspectRatioFittingSize();
          v11 = self->_placeholderGenerationQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke;
          block[3] = &unk_1E589F8A8;
          v17 = v9;
          v18 = v10;
          v20[1] = v12;
          v20[2] = v13;
          v14 = v10;
          v15 = v9;
          objc_copyWeak(v20, &location);
          v19 = self;
          dispatch_async(v11, block);
          objc_destroyWeak(v20);

          objc_destroyWeak(&location);
        }
      }
      else
      {
        -[PUFilmstripView setGeneratedPlaceholderImage:](self, "setGeneratedPlaceholderImage:", 0);
      }
    }
  }
}

- (id)_filmstripLayout
{
  void *v2;
  void *v3;

  -[PUFilmstripView _tilingView](self, "_tilingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    -[PUFilmstripView _dataSource](self, "_dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetAtIndexPath:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUFilmstripImageTileViewReuseIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnimatesImageTransitions:", 1);
    -[PUFilmstripView _mediaProvider](self, "_mediaProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMediaProvider:", v16);

    objc_msgSend(v15, "setAsset:", v14);
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindItemContentFilmStripIndicator")))
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

      v15 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUTileKindItemContentFilmStripIndicator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.200000003);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

    objc_msgSend(v15, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBorderWidth:", 1.0);

  }
  if (!v15)
    goto LABEL_6;
LABEL_7:

  return v15;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  return objc_alloc_init(PUFilmstripTileTransitionCoordinator);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  return 0;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  __objc2_class **v6;

  v6 = off_1E5885948;
  if (!-[PUFilmstripView _isMediaProviderValid](self, "_isMediaProviderValid", a3, a4, a5)
    && !-[PUFilmstripView preserveThumbnailsDuringReload](self, "preserveThumbnailsDuringReload"))
  {
    v6 = off_1E5885F88;
  }
  return objc_alloc_init(*v6);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)generatesPlaceholderImage
{
  return self->_generatesPlaceholderImage;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (BOOL)useContentAspectRatio
{
  return self->_useContentAspectRatio;
}

- (BOOL)preserveThumbnailsDuringReload
{
  return self->_preserveThumbnailsDuringReload;
}

- (void)setPreserveThumbnailsDuringReload:(BOOL)a3
{
  self->_preserveThumbnailsDuringReload = a3;
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (void)_setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->__mediaProvider, a3);
}

- (PUFilmstripDataSource)_dataSource
{
  return self->__dataSource;
}

- (void)_setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->__dataSource, a3);
}

- (double)_thumbnailAspectRatio
{
  return self->__thumbnailAspectRatio;
}

- (UIImage)generatedPlaceholderImage
{
  return self->_generatedPlaceholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_placeholderGenerationQueue, 0);
}

void __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  CGImage *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  id v16;
  _BYTE buf[24];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setVideoComposition:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setMaximumSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v2, "setAppliesPreferredTrackTransform:", 1);
  objc_msgSend(v2, "customVideoCompositor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "customVideoCompositor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", CFSTR("PUFilmstripView-updateGeneratedPlaceholderImageIfNeeded"));

  }
  v16 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v6 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v2, buf, 0, &v16);
  v7 = v16;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke_2;
    block[3] = &unk_1E58AB210;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    v9 = v8;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    CGImageRelease(v6);

    objc_destroyWeak(&v15);
  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "%@ unable to generate placeholder image\n\tAsset: %@\n\tVideo Composition: %@\n\tError: %@", buf, 0x2Au);
    }
  }

}

void __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setGeneratedPlaceholderImage:", v1);

}

void __40__PUFilmstripView__updateLayoutIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "presentationLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    v6 = v8;
    objc_msgSend(v6, "setMediaProvider:", v5);
    objc_msgSend(*(id *)(a1 + 40), "assetAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAsset:", v7);

  }
}

@end
