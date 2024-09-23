@implementation PXVideoSessionUIView

- (PXVideoSessionUIView)initWithFrame:(CGRect)a3
{
  PXVideoSessionUIView *v3;
  PXVideoSessionUIView *v4;
  UIImageView *v5;
  UIImageView *placeholderImageView;
  UIView *v7;
  UIView *videoContainerView;
  CGSize v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXVideoSessionUIView;
  v3 = -[PXVideoSessionUIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_videoGravity, (id)*MEMORY[0x1E0C8A6E0]);
    v4->_placeholderVisible = 1;
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    placeholderImageView = v4->_placeholderImageView;
    v4->_placeholderImageView = v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    videoContainerView = v4->_videoContainerView;
    v4->_videoContainerView = v7;

    -[UIView setClipsToBounds:](v4->_videoContainerView, "setClipsToBounds:", 1);
    v9 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    v4->_contentsRect.origin = *(CGPoint *)off_1E50B86D0;
    v4->_contentsRect.size = v9;
    -[PXVideoSessionUIView addSubview:](v4, "addSubview:", v4->_placeholderImageView);
    -[PXVideoSessionUIView addSubview:](v4, "addSubview:", v4->_videoContainerView);
    -[PXVideoSessionUIView setContentMode:](v4, "setContentMode:", 2);
    -[PXVideoSessionUIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PXVideoSessionUIView _updateEdgeAntialiasing](v4, "_updateEdgeAntialiasing");
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
  v11.super_class = (Class)PXVideoSessionUIView;
  -[PXVideoSessionUIView layoutSubviews](&v11, sel_layoutSubviews);
  -[PXVideoSessionUIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  -[UIView setFrame:](self->_videoContainerView, "setFrame:", v4, v6, v8, v10);
  -[PXVideoSessionUIView _updateVideoViewFrame](self, "_updateVideoViewFrame");
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXVideoSessionUIView;
  -[PXVideoSessionUIView setContentMode:](&v5, sel_setContentMode_);
  -[PXVideoView setContentMode:](self->_adoptedVideoView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", a3);
  -[UIView setContentMode:](self->_videoContainerView, "setContentMode:", a3);
}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v5;
  PXVideoSession **p_videoSession;
  PXVideoSession *videoSession;
  PXVideoView *adoptedVideoView;
  PXVideoView *v9;
  PXVideoView *v10;
  PXVideoView *v11;
  void *v12;
  PXVideoSession *v13;

  v5 = (PXVideoSession *)a3;
  p_videoSession = &self->_videoSession;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    v13 = v5;
    -[PXVideoSession unregisterChangeObserver:context:](videoSession, "unregisterChangeObserver:context:", self, VideoSessionContext);
    adoptedVideoView = self->_adoptedVideoView;
    if (adoptedVideoView)
    {
      -[PXVideoView setDelegate:](adoptedVideoView, "setDelegate:", 0);
      -[PXVideoView removeFromSuperview](self->_adoptedVideoView, "removeFromSuperview");
      -[PXVideoSession recycleVideoView:](*p_videoSession, "recycleVideoView:", self->_adoptedVideoView);
      v9 = self->_adoptedVideoView;
      self->_adoptedVideoView = 0;

    }
    objc_storeStrong((id *)&self->_videoSession, a3);
    -[PXVideoSession registerChangeObserver:context:](*p_videoSession, "registerChangeObserver:context:", self, VideoSessionContext);
    -[PXVideoSession dequeueVideoView](v13, "dequeueVideoView");
    v10 = (PXVideoView *)objc_claimAutoreleasedReturnValue();
    v11 = self->_adoptedVideoView;
    self->_adoptedVideoView = v10;

    -[PXVideoSessionUIView videoGravity](self, "videoGravity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoView setVideoGravity:](self->_adoptedVideoView, "setVideoGravity:", v12);

    -[PXVideoView setContentMode:](self->_adoptedVideoView, "setContentMode:", -[PXVideoSessionUIView contentMode](self, "contentMode"));
    -[PXVideoView setToneMapToStandardDynamicRange:](self->_adoptedVideoView, "setToneMapToStandardDynamicRange:", -[PXVideoSessionUIView toneMapToStandardDynamicRange](self, "toneMapToStandardDynamicRange"));
    -[PXVideoView setDelegate:](self->_adoptedVideoView, "setDelegate:", self);
    -[UIView addSubview:](self->_videoContainerView, "addSubview:", self->_adoptedVideoView);
    -[PXVideoSessionUIView setNeedsLayout](self, "setNeedsLayout");
    -[PXVideoSessionUIView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
    -[PXVideoSessionUIView _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
    -[PXVideoSessionUIView _updateVideoViewFrame](self, "_updateVideoViewFrame");
    v5 = v13;
  }

}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v5);
  }

}

- (void)setVideoGravity:(id)a3
{
  NSString *v4;
  NSString *videoGravity;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_videoGravity) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    videoGravity = self->_videoGravity;
    self->_videoGravity = v4;

    -[PXVideoView setVideoGravity:](self->_adoptedVideoView, "setVideoGravity:", self->_videoGravity);
  }

}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentsRect;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[UIImageView layer](self->_placeholderImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);

    -[PXVideoSessionUIView _updateVideoViewFrame](self, "_updateVideoViewFrame");
  }
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  if (self->_toneMapToStandardDynamicRange != a3)
  {
    self->_toneMapToStandardDynamicRange = a3;
    -[PXVideoView setToneMapToStandardDynamicRange:](self->_adoptedVideoView, "setToneMapToStandardDynamicRange:");
  }
}

- (void)_updateVideoViewFrame
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;

  -[PXVideoSessionUIView videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoAspectRatio");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[PXVideoSessionUIView contentsRect](self, "contentsRect");
  -[PXVideoSessionUIView bounds](self, "bounds");
  objc_msgSend(v19, "floatValue");
  v6 = v5;
  -[PXVideoSessionUIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v17 = v6;
  v18 = v8;
  PFFrameApplyingContentsRectInBounds();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[PXVideoView setFrame:](self->_adoptedVideoView, "setFrame:", v10, v12, v14, v16, *(_QWORD *)&v17, v18);
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    -[PXVideoSessionUIView _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  }
}

- (id)generateSnapshotImage
{
  void *v3;
  void *v4;
  CGImage *v5;

  if (-[PXVideoSessionUIView placeholderVisible](self, "placeholderVisible"))
  {
    -[PXVideoSessionUIView placeholderImage](self, "placeholderImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXVideoSessionUIView videoSession](self, "videoSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CGImage *)objc_msgSend(v4, "generateSnapshotImage");

    if (v5)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v5);
      CGImageRelease(v5);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (UIView)viewForSnapshotting
{
  PXVideoView *adoptedVideoView;

  adoptedVideoView = self->_adoptedVideoView;
  if (adoptedVideoView)
  {
    if (-[PXVideoView videoIsReadyForDisplay](adoptedVideoView, "videoIsReadyForDisplay"))
      adoptedVideoView = self->_adoptedVideoView;
    else
      adoptedVideoView = 0;
  }
  return (UIView *)adoptedVideoView;
}

- (AVPlayerLayer)activePlayerLayer
{
  return (AVPlayerLayer *)-[PXVideoView playerLayer](self->_adoptedVideoView, "playerLayer");
}

- (BOOL)isVideoLayerReadyForDisplay
{
  return -[PXVideoView videoIsReadyForDisplay](self->_adoptedVideoView, "videoIsReadyForDisplay");
}

- (void)dealloc
{
  PXVideoSession *videoSession;
  objc_super v4;

  if (self->_adoptedVideoView)
  {
    videoSession = self->_videoSession;
    if (videoSession)
      -[PXVideoSession recycleVideoView:](videoSession, "recycleVideoView:");
  }
  v4.receiver = self;
  v4.super_class = (Class)PXVideoSessionUIView;
  -[PXVideoSessionUIView dealloc](&v4, sel_dealloc);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x4000) != 0 && (void *)VideoSessionContext == a5)
    px_dispatch_on_main_queue_sync();
}

- (void)_updatePlaceholderVisibility
{
  -[PXVideoSessionUIView setPlaceholderVisible:](self, "setPlaceholderVisible:", -[PXVideoView videoIsReadyForDisplay](self->_adoptedVideoView, "videoIsReadyForDisplay") ^ 1);
}

- (void)setPlaceholderVisible:(BOOL)a3
{
  double v4;
  id v5;

  if (self->_placeholderVisible != a3)
  {
    self->_placeholderVisible = a3;
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[UIImageView setAlpha:](self->_placeholderImageView, "setAlpha:", v4);
    -[PXVideoSessionUIView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoSessionViewPlaceholderVisibilityChanged:", self);

  }
}

- (void)_updateEdgeAntialiasing
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PXVideoSessionUIView allowsEdgeAntialiasing](self, "allowsEdgeAntialiasing");
  -[UIImageView layer](self->_placeholderImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

  -[PXVideoView layer](self->_adoptedVideoView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v3);

}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)placeholderVisible
{
  return self->_placeholderVisible;
}

- (PXVideoSessionUIViewDelegate)delegate
{
  return (PXVideoSessionUIViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoGravity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_adoptedVideoView, 0);
  objc_storeStrong((id *)&self->_videoContainerView, 0);
}

void __53__PXVideoSessionUIView_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setPlayer:", v2);

}

@end
