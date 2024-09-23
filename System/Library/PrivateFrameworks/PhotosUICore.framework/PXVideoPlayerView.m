@implementation PXVideoPlayerView

- (PXVideoPlayerView)initWithFrame:(CGRect)a3
{
  PXVideoPlayerView *v3;
  PXVideoPlayerView *v4;
  id v5;
  uint64_t v6;
  UIImageView *previewImageView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXVideoPlayerView;
  v3 = -[PXVideoPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_placeholderDisplayMode = 0;
    v3->_videoAppearanceCrossfadeDuration = 0.0;
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PXVideoPlayerView bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    previewImageView = v4->_previewImageView;
    v4->_previewImageView = (UIImageView *)v6;

    -[UIImageView setUserInteractionEnabled:](v4->_previewImageView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_previewImageView, "setBackgroundColor:", v8);

    v4->_displayingPlaceholder = 1;
    -[PXVideoPlayerView addSubview:](v4, "addSubview:", v4->_previewImageView);
    -[PXVideoPlayerView setVideoViewContentMode:](v4, "setVideoViewContentMode:", 0);
    -[PXVideoPlayerView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PXVideoPlayerView _updateContentMode](v4, "_updateContentMode");
    -[PXVideoPlayerView _updateEdgeAntialiasing](v4, "_updateEdgeAntialiasing");
    -[PXVideoPlayerView _updateSubviewsVisibility](v4, "_updateSubviewsVisibility");
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXVideoPlayerView;
  -[PXVideoPlayerView layoutSubviews](&v11, sel_layoutSubviews);
  -[PXVideoPlayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_previewImageView, "setFrame:");
  -[PXVideoView setFrame:](self->_videoView, "setFrame:", v4, v6, v8, v10);
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[UIImageView setImage:](self->_previewImageView, "setImage:", v5);
  }

}

- (void)setPlaceholderImageFilters:(id)a3
{
  NSArray *v4;
  void *v5;
  char v6;
  NSArray *v7;
  NSArray *placeholderImageFilters;
  void *v9;
  _BOOL8 v10;
  void *v11;
  NSArray *v12;

  v12 = (NSArray *)a3;
  v4 = self->_placeholderImageFilters;
  v5 = v12;
  if (v4 == v12)
    goto LABEL_4;
  v6 = -[NSArray isEqual:](v12, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSArray *)-[NSArray copy](v12, "copy");
    placeholderImageFilters = self->_placeholderImageFilters;
    self->_placeholderImageFilters = v7;

    -[UIImageView layer](self->_previewImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v12);

    v10 = -[NSArray count](v12, "count") != 0;
    -[UIImageView layer](self->_previewImageView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldRasterize:", v10);

    -[UIImageView layer](self->_previewImageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRasterizationScale:", 0.5);
LABEL_4:

  }
}

- (void)setPlaceholderDisplayMode:(int64_t)a3
{
  -[PXVideoPlayerView setPlaceholderDisplayMode:completion:](self, "setPlaceholderDisplayMode:completion:", a3, 0);
}

- (void)setPlaceholderDisplayMode:(int64_t)a3 completion:(id)a4
{
  void (**v6)(void);
  void *v7;
  id visibilityChangeCompletionHandler;
  void (**v9)(void);

  v6 = (void (**)(void))a4;
  if (self->_placeholderDisplayMode != a3)
  {
    v9 = v6;
    v7 = (void *)objc_msgSend(v6, "copy");
    visibilityChangeCompletionHandler = self->_visibilityChangeCompletionHandler;
    self->_visibilityChangeCompletionHandler = v7;

    self->_placeholderDisplayMode = a3;
    -[PXVideoPlayerView _updateSubviewsVisibility](self, "_updateSubviewsVisibility");
    goto LABEL_5;
  }
  if (v6)
  {
    v9 = v6;
    v6[2]();
LABEL_5:
    v6 = v9;
  }

}

- (void)setPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  ISWrappedAVPlayer *v6;

  v5 = (ISWrappedAVPlayer *)a3;
  if (self->_player != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_player, a3);
    -[PXVideoPlayerView _updateVideoView](self, "_updateVideoView");
    v5 = v6;
  }

}

- (void)_updateVideoView
{
  PXVideoView *v3;
  PXVideoView *v4;
  PXVideoView *videoView;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (!self->_videoView)
  {
    v3 = [PXVideoView alloc];
    -[PXVideoPlayerView bounds](self, "bounds");
    v4 = -[PXVideoView initWithFrame:](v3, "initWithFrame:");
    videoView = self->_videoView;
    self->_videoView = v4;

    -[PXVideoView setUserInteractionEnabled:](self->_videoView, "setUserInteractionEnabled:", 0);
    -[PXVideoView setAutoresizingMask:](self->_videoView, "setAutoresizingMask:", 18);
    -[PXVideoView setToneMapToStandardDynamicRange:](self->_videoView, "setToneMapToStandardDynamicRange:", -[PXVideoPlayerView toneMapToStandardDynamicRange](self, "toneMapToStandardDynamicRange"));
    -[PXVideoPlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_videoView, 0);
    objc_initWeak(&location, self);
    -[PXVideoView layer](self->_videoView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __37__PXVideoPlayerView__updateVideoView__block_invoke;
    v11 = &unk_1E5148D30;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "setReadyForDisplayChangeHandler:", &v8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  -[PXVideoPlayerView player](self, "player", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoView setPlayer:](self->_videoView, "setPlayer:", v7);
  -[PXVideoPlayerView _updateContentMode](self, "_updateContentMode");
  -[PXVideoPlayerView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  -[PXVideoPlayerView _updateSubviewsVisibility](self, "_updateSubviewsVisibility");
  -[PXVideoPlayerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  self->_toneMapToStandardDynamicRange = a3;
  -[PXVideoView setToneMapToStandardDynamicRange:](self->_videoView, "setToneMapToStandardDynamicRange:");
}

- (void)setPlaceholderImageContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_placeholderImageContentsRect;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_placeholderImageContentsRect = &self->_placeholderImageContentsRect;
  if (!CGRectEqualToRect(a3, self->_placeholderImageContentsRect))
  {
    p_placeholderImageContentsRect->origin.x = x;
    p_placeholderImageContentsRect->origin.y = y;
    p_placeholderImageContentsRect->size.width = width;
    p_placeholderImageContentsRect->size.height = height;
    -[UIImageView layer](self->_previewImageView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);

  }
}

- (void)setVideoViewContentMode:(int64_t)a3
{
  if (self->_videoViewContentMode != a3)
  {
    self->_videoViewContentMode = a3;
    -[PXVideoPlayerView _updateContentMode](self, "_updateContentMode");
  }
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    -[PXVideoPlayerView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  }
}

- (void)_updateContentMode
{
  int64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;

  v3 = -[PXVideoPlayerView videoViewContentMode](self, "videoViewContentMode");
  v4 = v3;
  if (v3 == 1)
  {
    v5 = (_QWORD *)MEMORY[0x1E0C8A6D8];
  }
  else
  {
    if (v3)
      return;
    v5 = (_QWORD *)MEMORY[0x1E0C8A6E0];
    v4 = 2;
  }
  -[UIImageView setContentMode:](self->_previewImageView, "setContentMode:", v4);
  -[PXVideoView layer](self->_videoView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:", *v5);

}

- (void)_updateEdgeAntialiasing
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PXVideoPlayerView allowsEdgeAntialiasing](self, "allowsEdgeAntialiasing");
  -[UIImageView layer](self->_previewImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

  -[PXVideoView layer](self->_videoView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v3);

}

- (void)_updateSubviewsVisibility
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  float v7;
  int v8;
  int64_t v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[6];
  char v13;

  v3 = -[PXVideoPlayerView placeholderDisplayMode](self, "placeholderDisplayMode");
  -[PXVideoView layer](self->_videoView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReadyForDisplay");

  if (v3 == 1)
    goto LABEL_9;
  if (v3)
  {
    v3 = 0;
    goto LABEL_9;
  }
  v3 = v5 ^ 1u;
  -[PXVideoPlayerView player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rate");
  if (v7 <= 0.0)
    v8 = 1;
  else
    v8 = v5;
  if (v8 == 1)
  {

LABEL_9:
    v9 = self->_placeholderVisibilityRequestID + 1;
    self->_placeholderVisibilityRequestID = v9;
LABEL_10:
    -[PXVideoPlayerView _setDisplayingPlaceholder:requestID:](self, "_setDisplayingPlaceholder:requestID:", v3, v9);
    return;
  }
  -[PXVideoPlayerView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->_placeholderVisibilityRequestID + 1;
  self->_placeholderVisibilityRequestID = v9;
  if (!v10)
    goto LABEL_10;
  v11 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXVideoPlayerView__updateSubviewsVisibility__block_invoke;
  block[3] = &unk_1E512C5E8;
  v13 = v3;
  block[4] = self;
  block[5] = v9;
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);
}

- (void)_setDisplayingPlaceholder:(BOOL)a3 requestID:(int64_t)a4
{
  _BOOL8 v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  BOOL v9;

  if (self->_placeholderVisibilityRequestID == a4 && (v5 = a3, self->_displayingPlaceholder != a3))
  {
    self->_displayingPlaceholder = a3;
    -[PXVideoPlayerView videoAppearanceCrossfadeDuration](self, "videoAppearanceCrossfadeDuration");
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke;
    v8[3] = &unk_1E5144398;
    v8[4] = self;
    v9 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke_2;
    v7[3] = &unk_1E5147360;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v8, v7);
    -[PXVideoPlayerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerView:isDisplayingPlaceholderDidChange:", self, v5);

  }
  else
  {
    -[PXVideoPlayerView _runVisibilityChangeCompletionHandler](self, "_runVisibilityChangeCompletionHandler", a3);
  }
}

- (void)_runVisibilityChangeCompletionHandler
{
  void (**visibilityChangeCompletionHandler)(id, SEL);
  id v4;

  visibilityChangeCompletionHandler = (void (**)(id, SEL))self->_visibilityChangeCompletionHandler;
  if (visibilityChangeCompletionHandler)
  {
    visibilityChangeCompletionHandler[2](visibilityChangeCompletionHandler, a2);
    v4 = self->_visibilityChangeCompletionHandler;
    self->_visibilityChangeCompletionHandler = 0;

  }
}

- (id)generateSnapshotImage
{
  double v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  CGImage *v15;
  CGImage *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  __int128 v25;
  uint64_t v26;

  -[UIImageView alpha](self->_previewImageView, "alpha");
  if (v3 > 0.0)
    return self->_placeholderImage;
  -[PXVideoView player](self->_videoView, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v25 = 0uLL;
  v26 = 0;
  if (v5)
    objc_msgSend(v5, "currentTime");
  memset(v24, 0, sizeof(v24));
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAppliesPreferredTrackTransform:", 1);
  v10 = (__int128 *)MEMORY[0x1E0CA2E68];
  v22 = *MEMORY[0x1E0CA2E68];
  v23 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v9, "setRequestedTimeToleranceAfter:", &v22);
  v20 = *v10;
  v21 = *((_QWORD *)v10 + 2);
  objc_msgSend(v9, "setRequestedTimeToleranceBefore:", &v20);
  objc_msgSend(v7, "videoComposition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoComposition:", v11);

  objc_msgSend(v9, "customVideoCompositor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NUVideoPlaybackCompositor"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "customVideoCompositor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", CFSTR("PXVideoPlayerView-generateSnapshotImage"), CFSTR("label"));

  }
  v18 = v25;
  v19 = v26;
  v15 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v9, &v18, v24, 0);
  if (v15)
  {
    v16 = v15;
    if (CGImageGetWidth(v15) && CGImageGetHeight(v16))
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v16);
    else
      v17 = 0;
    CFRelease(v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PXVideoPlayerViewDelegate)delegate
{
  return (PXVideoPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ISWrappedAVPlayer)player
{
  return self->_player;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSArray)placeholderImageFilters
{
  return self->_placeholderImageFilters;
}

- (double)videoAppearanceCrossfadeDuration
{
  return self->_videoAppearanceCrossfadeDuration;
}

- (void)setVideoAppearanceCrossfadeDuration:(double)a3
{
  self->_videoAppearanceCrossfadeDuration = a3;
}

- (CGRect)placeholderImageContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_placeholderImageContentsRect.origin.x;
  y = self->_placeholderImageContentsRect.origin.y;
  width = self->_placeholderImageContentsRect.size.width;
  height = self->_placeholderImageContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)placeholderDisplayMode
{
  return self->_placeholderDisplayMode;
}

- (BOOL)isDisplayingPlaceHolder
{
  return self->_displayingPlaceholder;
}

- (int64_t)videoViewContentMode
{
  return self->_videoViewContentMode;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImageFilters, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_visibilityChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_previewImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_videoViewConstraints, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

uint64_t __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", v1);
}

uint64_t __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runVisibilityChangeCompletionHandler");
}

uint64_t __46__PXVideoPlayerView__updateSubviewsVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDisplayingPlaceholder:requestID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __37__PXVideoPlayerView__updateVideoView__block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v1);
}

void __37__PXVideoPlayerView__updateVideoView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSubviewsVisibility");

}

@end
