@implementation ISVideoPlayerUIView

- (void)setVideoPlayer:(id)a3
{
  ISWrappedAVPlayer **p_videoPlayer;
  void *v6;
  ISWrappedAVPlayer *v7;

  p_videoPlayer = &self->_videoPlayer;
  v7 = (ISWrappedAVPlayer *)a3;
  if (*p_videoPlayer != v7)
  {
    -[ISAVPlayerUIView playerLayer](self->_playerView, "playerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayer:", v7);
    objc_storeStrong((id *)p_videoPlayer, a3);

  }
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISVideoPlayerUIView;
  -[ISVideoPlayerUIView setContentMode:](&v4, sel_setContentMode_, a3);
  -[ISVideoPlayerUIView _updateVideoGravity](self, "_updateVideoGravity");
}

- (void)_updateVideoGravity
{
  uint64_t v3;
  id *v4;
  id *v5;
  void *v6;
  id v7;

  v3 = -[ISVideoPlayerUIView contentMode](self, "contentMode");
  v4 = (id *)MEMORY[0x1E0C8A6D8];
  v5 = (id *)MEMORY[0x1E0C8A6E0];
  if (v3 != 2)
    v5 = (id *)MEMORY[0x1E0C8A6D0];
  if (v3 != 1)
    v4 = v5;
  v7 = *v4;
  -[ISAVPlayerUIView playerLayer](self->_playerView, "playerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:", v7);

}

- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISVideoPlayerUIView playerLayer](self, "playerLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReadyForDisplayChangeHandler:", v4);

}

- (id)playerLayer
{
  return -[ISAVPlayerUIView playerLayer](self->_playerView, "playerLayer");
}

- (ISVideoPlayerUIView)initWithFrame:(CGRect)a3
{
  ISVideoPlayerUIView *v3;
  ISVideoPlayerUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISVideoPlayerUIView;
  v3 = -[ISVideoPlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ISVideoPlayerUIView _ISVideoPlayerUIView_commonInitialization](v3, "_ISVideoPlayerUIView_commonInitialization");
  return v4;
}

- (ISVideoPlayerUIView)initWithCoder:(id)a3
{
  ISVideoPlayerUIView *v3;
  ISVideoPlayerUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISVideoPlayerUIView;
  v3 = -[ISVideoPlayerUIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ISVideoPlayerUIView _ISVideoPlayerUIView_commonInitialization](v3, "_ISVideoPlayerUIView_commonInitialization");
  return v4;
}

- (void)_ISVideoPlayerUIView_commonInitialization
{
  void *v3;
  id v4;
  void *v5;
  ISAVPlayerUIView *v6;
  ISAVPlayerUIView *v7;
  ISAVPlayerUIView *playerView;

  -[ISVideoPlayerUIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.1, 0.01);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  -[ISVideoPlayerUIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 1.0);

  v6 = [ISAVPlayerUIView alloc];
  -[ISVideoPlayerUIView bounds](self, "bounds");
  v7 = -[ISAVPlayerUIView initWithFrame:](v6, "initWithFrame:");
  playerView = self->_playerView;
  self->_playerView = v7;

  -[ISAVPlayerUIView setAutoresizingMask:](self->_playerView, "setAutoresizingMask:", 18);
  -[ISVideoPlayerUIView addSubview:](self, "addSubview:", self->_playerView);
  self->_contentsRect = *(CGRect *)ISRectUnit;
}

- (id)videoLayerReadyForDisplayChangeHandler
{
  void *v2;
  void *v3;

  -[ISVideoPlayerUIView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readyForDisplayChangeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentsRect;
  id v9;

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
    -[ISAVPlayerUIView layer](self->_playerView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);

  }
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
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

- (BOOL)videoLayerReadyForDisplay
{
  return self->_videoLayerReadyForDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
}

@end
