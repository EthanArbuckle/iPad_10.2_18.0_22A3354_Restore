@implementation PUVideoPlayerView

- (PUVideoPlayerView)initWithFrame:(CGRect)a3
{
  PUVideoPlayerView *v3;
  id v4;
  uint64_t v5;
  UIImageView *previewImageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUVideoPlayerView;
  v3 = -[PUVideoPlayerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PUVideoPlayerView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    previewImageView = v3->_previewImageView;
    v3->_previewImageView = (UIImageView *)v5;

    -[UIImageView setUserInteractionEnabled:](v3->_previewImageView, "setUserInteractionEnabled:", 0);
    -[PUVideoPlayerView addSubview:](v3, "addSubview:", v3->_previewImageView);
    v3->_isDisplayingPlaceholder = 1;
    v3->_isReadyForVideoDisplay = 0;
    -[PUVideoPlayerView setVideoViewContentMode:](v3, "setVideoViewContentMode:", 0);
    -[PUVideoPlayerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PUVideoPlayerView _updateContentMode](v3, "_updateContentMode");
    -[PUVideoPlayerView _updateEdgeAntialiasing](v3, "_updateEdgeAntialiasing");
  }
  return v3;
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
  v11.super_class = (Class)PUVideoPlayerView;
  -[PUVideoPlayerView layoutSubviews](&v11, sel_layoutSubviews);
  -[PUVideoPlayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_previewImageView, "setFrame:");
  -[_PUVideoView setFrame:](self->_videoView, "setFrame:", v4, v6, v8, v10);
  -[PUVideoPlayerView _updateSubviewsVisibility](self, "_updateSubviewsVisibility");
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

- (void)configureWithAVPlayer:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[_PUVideoView player](self->_videoView, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[PUVideoPlayerView setIsDisplayingPlaceholder:](self, "setIsDisplayingPlaceholder:", 1);
    -[PUVideoPlayerView setIsReadyForVideoDisplay:](self, "setIsReadyForVideoDisplay:", 0);
    -[PUVideoPlayerView _installNewVideoViewIfNecessaryWithPlayer:](self, "_installNewVideoViewIfNecessaryWithPlayer:", v5);
  }

}

- (void)setIsDisplayingPlaceholder:(BOOL)a3
{
  if (self->_isDisplayingPlaceholder != a3)
  {
    self->_isDisplayingPlaceholder = a3;
    -[PUVideoPlayerView _updateSubviewsVisibility](self, "_updateSubviewsVisibility");
  }
}

- (void)_installNewVideoViewIfNecessaryWithPlayer:(id)a3
{
  id v4;
  _PUVideoView *videoView;
  _PUVideoView *v6;
  _PUVideoView *v7;
  _PUVideoView *v8;
  void *v9;
  id v10;

  v4 = a3;
  videoView = self->_videoView;
  v10 = v4;
  if (!videoView)
  {
    v6 = [_PUVideoView alloc];
    -[PUVideoPlayerView bounds](self, "bounds");
    v7 = -[_PUVideoView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_videoView;
    self->_videoView = v7;

    -[_PUVideoView setUserInteractionEnabled:](self->_videoView, "setUserInteractionEnabled:", 0);
    -[_PUVideoView setAutoresizingMask:](self->_videoView, "setAutoresizingMask:", 18);
    -[PUVideoPlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_videoView, 0);
    -[_PUVideoView layer](self->_videoView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 4, &PUPlayerLayerReadyForDisplayObservingContext);

    v4 = v10;
    videoView = self->_videoView;
  }
  -[_PUVideoView setPlayer:](videoView, "setPlayer:", v4);
  -[PUVideoPlayerView _updateContentMode](self, "_updateContentMode");
  -[PUVideoPlayerView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  -[PUVideoPlayerView setNeedsLayout](self, "setNeedsLayout");

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

- (void)setIsReadyForVideoDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  if (self->_isReadyForVideoDisplay != a3)
  {
    v3 = a3;
    self->_isReadyForVideoDisplay = a3;
    -[PUVideoPlayerView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PUVideoPlayerView delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoPlayerView:isReadyForDisplayDidChange:", self, v3);

    }
  }
}

- (void)setVideoViewContentMode:(unint64_t)a3
{
  if (self->_videoViewContentMode != a3)
  {
    self->_videoViewContentMode = a3;
    -[PUVideoPlayerView _updateContentMode](self, "_updateContentMode");
  }
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    -[PUVideoPlayerView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  }
}

- (void)_updateContentMode
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;

  v3 = -[PUVideoPlayerView videoViewContentMode](self, "videoViewContentMode");
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
  -[_PUVideoView layer](self->_videoView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:", *v5);

}

- (void)_updateEdgeAntialiasing
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PUVideoPlayerView allowsEdgeAntialiasing](self, "allowsEdgeAntialiasing");
  -[UIImageView layer](self->_previewImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

  -[_PUVideoView layer](self->_videoView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v3);

}

- (void)_updateSubviewsVisibility
{
  _BOOL4 isDisplayingPlaceholder;
  UIImageView *previewImageView;

  isDisplayingPlaceholder = self->_isDisplayingPlaceholder;
  previewImageView = self->_previewImageView;
  if (isDisplayingPlaceholder)
  {
    -[UIImageView setAlpha:](previewImageView, "setAlpha:", 1.0);
  }
  else
  {
    -[UIImageView setAlpha:](previewImageView, "setAlpha:", 0.0);
    -[_PUVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");
    -[PUVideoPlayerView addSubview:](self, "addSubview:", self->_videoView);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_PUVideoView layer](self->_videoView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("readyForDisplay"));

  v4.receiver = self;
  v4.super_class = (Class)PUVideoPlayerView;
  -[PUVideoPlayerView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (a6 == &PUPlayerLayerReadyForDisplayObservingContext)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PUVideoPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUVideoPlayerView;
    -[PUVideoPlayerView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)generateSnapshotImage
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CGImage *v11;
  CGImage *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  __int128 v18;
  uint64_t v19;

  if (self->_isDisplayingPlaceholder)
    return self->_placeholderImage;
  v18 = 0uLL;
  v19 = 0;
  -[_PUVideoView player](self->_videoView, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentTime");
  }
  else
  {
    v18 = 0uLL;
    v19 = 0;
  }

  memset(v17, 0, sizeof(v17));
  -[_PUVideoView player](self->_videoView, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAppliesPreferredTrackTransform:", 1);
  v15 = *MEMORY[0x1E0CA2E68];
  v14 = v15;
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v10 = v16;
  objc_msgSend(v9, "setRequestedTimeToleranceBefore:", &v15);
  v15 = v14;
  v16 = v10;
  objc_msgSend(v9, "setRequestedTimeToleranceAfter:", &v15);
  v15 = v18;
  v16 = v19;
  v11 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v9, &v15, v17, 0);
  if (v11)
  {
    v12 = v11;
    if (CGImageGetWidth(v11) && CGImageGetHeight(v12))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
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

- (BOOL)isReadyForVideoDisplay
{
  return self->_isReadyForVideoDisplay;
}

- (BOOL)isDisplayingPlaceholder
{
  return self->_isDisplayingPlaceholder;
}

- (unint64_t)videoViewContentMode
{
  return self->_videoViewContentMode;
}

- (PUVideoPlayerViewDelegate)delegate
{
  return (PUVideoPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)isDisplayingVideo
{
  return self->_isDisplayingVideo;
}

- (void)setIsDisplayingVideo:(BOOL)a3
{
  self->_isDisplayingVideo = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_previewImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_videoViewConstraints, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

uint64_t __68__PUVideoPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForDisplay");

  return objc_msgSend(*(id *)(a1 + 32), "setIsReadyForVideoDisplay:", v3);
}

@end
