@implementation PUFilmstripTileViewController

- (id)loadView
{
  void *v3;
  PUFilmstripWrapperView *v4;
  PUFilmstripWrapperView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController loadView](&v7, sel_loadView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PUFilmstripWrapperView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[PUFilmstripWrapperView initWithFrame:](v4, "initWithFrame:");
  -[PUFilmstripWrapperView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  -[PUFilmstripTileViewController expandedSize](self, "expandedSize");
  -[PUFilmstripWrapperView setExpandedSize:](v5, "setExpandedSize:");
  objc_storeStrong((id *)&self->_wrapperView, v5);
  -[PUFilmstripWrapperView setBackgroundView:](v5, "setBackgroundView:", v3);

  return v5;
}

- (void)applyLayoutInfo:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController applyLayoutInfo:](&v18, sel_applyLayoutInfo_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripTileViewController.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[layoutInfo isKindOfClass:PUExpandableTileLayoutInfo.class]"));

  }
  v6 = v5;
  objc_msgSend(v6, "expandedSize");
  -[PUFilmstripTileViewController setExpandedSize:](self, "setExpandedSize:");
  -[PUFilmstripTileViewController setExpanded:](self, "setExpanded:", objc_msgSend(v6, "isExpanded"));
  objc_msgSend(v6, "unexpandedSize");
  -[PUFilmstripTileViewController setUnexpandedSize:](self, "setUnexpandedSize:");
  objc_msgSend(v6, "cornerRadius");
  v8 = v7;
  -[PUImageTileViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8);

  objc_msgSend(v6, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v11);

  v14 = objc_msgSend(v6, "cornerMask");
  -[PUImageTileViewController imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMaskedCorners:", v14);

}

- (CGSize)targetSizeForProposedTargetSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUFilmstripTileViewController unexpandedSize](self, "unexpandedSize");
  if (v7 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PUTileViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;

    if (v13 < 1.0)
    {
      -[PUTileController tilingView](self, "tilingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "screen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      v13 = v17;

    }
    if (v13 < 1.0 && PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    -[PUFilmstripTileViewController unexpandedSize](self, "unexpandedSize");
    PXSizeScale();
    PXSizeMin();
    width = v18;
    height = v19;
  }
  v20 = width;
  v21 = height;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)becomeReusable
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController becomeReusable](&v4, sel_becomeReusable);
  -[PUImageTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUFilmstripTileViewController setExpanded:](self, "setExpanded:", 0);
  -[PUFilmstripTileViewController setExpandedSize:](self, "setExpandedSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PUFilmstripTileViewController wrapperView](self, "wrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchoredLeft:", 0);

}

- (BOOL)wantsVisibleRectChanges
{
  return 1;
}

- (void)didChangeVisibleRect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController didChangeVisibleRect](&v3, sel_didChangeVisibleRect);
  -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");
}

- (void)didChangeAnimating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripTileViewController;
  -[PUTileController didChangeAnimating](&v3, sel_didChangeAnimating);
  -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");
}

- (void)assetViewModelDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController assetViewModelDidChange:](&v6, sel_assetViewModelDidChange_, a3);
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilmstripTileViewController setVideoPlayer:](self, "setVideoPlayer:", v5);

  -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");
}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *videoPlayer;
  PUBrowsingVideoPlayer *v7;

  v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    v7 = v5;
    -[PUBrowsingVideoPlayer unregisterTimeObserver:](videoPlayer, "unregisterTimeObserver:", self);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerTimeObserver:](self->_videoPlayer, "registerTimeObserver:", self);
    v5 = v7;
  }

}

- (void)setExpandedSize:(CGSize)a3
{
  if (self->_expandedSize.width != a3.width || self->_expandedSize.height != a3.height)
  {
    self->_expandedSize = a3;
    -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");
  }
}

- (void)_updateFilmStripContents
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
  void *v14;
  id v15;

  -[PUFilmstripTileViewController wrapperView](self, "wrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filmstripView");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "irisPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "videoPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "videoComposition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAsset:videoComposition:", v7, v14);
}

- (void)_updateFilmstripView
{
  void *v3;
  PUFilmstripView *v4;
  _BOOL4 v5;
  PUFilmstripView *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  PUFilmstripView *v13;
  _QWORD v14[4];
  PUFilmstripView *v15;

  -[PUFilmstripTileViewController wrapperView](self, "wrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filmstripView");
  v4 = (PUFilmstripView *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUFilmstripTileViewController isExpanded](self, "isExpanded");
  if (v5 && !v4)
  {
    v6 = [PUFilmstripView alloc];
    objc_msgSend(v3, "bounds");
    v4 = -[PUFilmstripView initWithFrame:](v6, "initWithFrame:");
    -[PUFilmstripView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "setFilmstripView:", v4);
  }
  if (v4)
    v7 = v5;
  else
    v7 = 1;
  if ((v7 & 1) == 0 && !-[PUTileController isAnimating](self, "isAnimating"))
  {
    objc_msgSend(v3, "setFilmstripView:leavingPreviousViewInPlace:", 0, 1);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke;
    v14[3] = &unk_1E58ABD10;
    v15 = v4;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke_2;
    v12[3] = &unk_1E58A9910;
    v13 = v15;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v14, v12, 0.25);

    v4 = 0;
  }
  if (!-[PUTileController isAnimating](self, "isAnimating"))
    -[PUFilmstripTileViewController _updateFilmStripContents](self, "_updateFilmStripContents");
  -[PUImageTileViewController image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilmstripView setPlaceholderImage:](v4, "setPlaceholderImage:", v10);

  -[PUFilmstripTileViewController _currentIndicatorInfos](self, "_currentIndicatorInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilmstripView setIndicatorInfos:](v4, "setIndicatorInfos:", v11);

  objc_msgSend(v3, "setAnimating:", -[PUTileController isAnimating](self, "isAnimating"));
  -[PUTileViewController visibleRect](self, "visibleRect");
  objc_msgSend(v3, "setVisibleRect:");
  objc_msgSend(v3, "setExpanded:", -[PUFilmstripTileViewController isExpanded](self, "isExpanded"));
  -[PUFilmstripTileViewController expandedSize](self, "expandedSize");
  objc_msgSend(v3, "setExpandedSize:");

}

- (id)_currentIndicatorInfos
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  double Seconds;
  double v11;
  void *v12;
  PUFilmStripViewIndicatorInfo *v14;
  _QWORD v15[5];
  id v16;
  double v17;
  CMTime time2;
  CMTime time1;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "canPlayPhotoIris"))
  {
    if (v6)
    {
      objc_msgSend(v6, "duration");
      goto LABEL_6;
    }
LABEL_7:
    epoch = 0;
    flags = 0;
    memset(&time1, 0, sizeof(time1));
    goto LABEL_8;
  }
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v5, "currentVideoDuration");
LABEL_6:
  flags = time1.flags;
  epoch = time1.epoch;
LABEL_8:
  value = time1.value;
  timescale = time1.timescale;
  if ((flags & 0x1D) == 1
    && (time1.value = value,
        time1.timescale = timescale,
        time1.flags = flags,
        time1.epoch = epoch,
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
        CMTimeCompare(&time1, &time2)))
  {
    time1.value = value;
    time1.timescale = timescale;
    time1.flags = flags;
    time1.epoch = epoch;
    Seconds = CMTimeGetSeconds(&time1);
  }
  else
  {
    objc_msgSend(v7, "duration");
  }
  v11 = Seconds;
  if (Seconds > 0.0)
  {
    if (v5)
    {
      objc_msgSend(v5, "currentlyDisplayedTimes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__PUFilmstripTileViewController__currentIndicatorInfos__block_invoke;
      v15[3] = &unk_1E589F858;
      v17 = v11;
      v15[4] = self;
      v16 = v3;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

    }
    else if (v6 && objc_msgSend(v6, "desiredPlayState") == 3 && (objc_msgSend(v6, "isActivated") & 1) == 0)
    {
      memset(&time1, 0, sizeof(time1));
      objc_msgSend(v6, "currentTime");
      time2 = time1;
      v14 = -[PUFilmStripViewIndicatorInfo initWithLocation:preferredColor:]([PUFilmStripViewIndicatorInfo alloc], "initWithLocation:preferredColor:", 0, CMTimeGetSeconds(&time2) / v11);
      objc_msgSend(v3, "addObject:", v14);

    }
  }

  return v3;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUFilmstripTileViewController;
  -[PUImageTileViewController viewModel:didChange:](&v16, sel_viewModel_didChange_, a3, v6);
  v7 = objc_msgSend(v6, "highlightTimeRangesChanged");
  if (objc_msgSend(v6, "videoPlayerDidChange"))
  {
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFilmstripTileViewController setVideoPlayer:](self, "setVideoPlayer:", v9);

  }
  objc_msgSend(v6, "videoPlayerChange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "playerItemDidChange") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v6, "videoPlayerChange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "avPlayerDidChange");

    v11 = v13 | v7;
  }

  objc_msgSend(v6, "irisPlayerChange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentlyDisplayedTimesDidChange");

  if ((v15 & 1) != 0 || v11)
    -[PUFilmstripTileViewController _updateFilmstripView](self, "_updateFilmstripView");

}

- (PUFilmstripWrapperView)wrapperView
{
  return self->_wrapperView;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (CGSize)expandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expandedSize.width;
  height = self->_expandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)unexpandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unexpandedSize.width;
  height = self->_unexpandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnexpandedSize:(CGSize)a3
{
  self->_unexpandedSize = a3;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
}

void __55__PUFilmstripTileViewController__currentIndicatorInfos__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  PUFilmStripViewIndicatorInfo *v5;
  void *v6;
  void *v7;
  PUFilmStripViewIndicatorInfo *v8;

  objc_msgSend(a2, "doubleValue");
  v4 = v3 / *(double *)(a1 + 48);
  v5 = [PUFilmStripViewIndicatorInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUFilmStripViewIndicatorInfo initWithLocation:preferredColor:](v5, "initWithLocation:preferredColor:", v7, v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

uint64_t __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
