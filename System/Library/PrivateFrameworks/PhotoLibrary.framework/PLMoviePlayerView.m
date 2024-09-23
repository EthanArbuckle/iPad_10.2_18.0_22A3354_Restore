@implementation PLMoviePlayerView

- (PLMoviePlayerView)initWithFrame:(CGRect)a3
{
  PLMoviePlayerView *v3;
  PLAVPlayerView *v4;
  PLAVPlayerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLMoviePlayerView;
  v3 = -[PLMoviePlayerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PLAVPlayerView alloc];
    -[PLMoviePlayerView bounds](v3, "bounds");
    v5 = -[PLAVPlayerView initWithFrame:](v4, "initWithFrame:");
    v3->_avPlayerView = v5;
    -[PLAVPlayerView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[PLMoviePlayerView reattachVideoView](v3, "reattachVideoView");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLMoviePlayerView;
  -[PLMoviePlayerView dealloc](&v3, sel_dealloc);
}

- (UIView)videoView
{
  return &self->_avPlayerView->super;
}

- (void)reattachVideoView
{
  PLAVPlayerView *avPlayerView;
  __int128 v4;
  PLAVPlayerView *v5;
  _OWORD v6[3];

  -[PLAVPlayerView removeFromSuperview](self->_avPlayerView, "removeFromSuperview");
  -[PLAVPlayerView setAutoresizingMask:](self->_avPlayerView, "setAutoresizingMask:", 18);
  avPlayerView = self->_avPlayerView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PLAVPlayerView setTransform:](avPlayerView, "setTransform:", v6);
  v5 = self->_avPlayerView;
  -[PLMoviePlayerView bounds](self, "bounds");
  -[PLAVPlayerView setFrame:](v5, "setFrame:");
  -[PLMoviePlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_avPlayerView, 0);
}

- (AVPlayer)player
{
  return -[PLAVPlayerView player](self->_avPlayerView, "player");
}

- (void)setPlayer:(id)a3
{
  -[PLAVPlayerView setPlayer:](self->_avPlayerView, "setPlayer:", a3);
}

- (void)setScaleMode:(int64_t)a3
{
  -[PLAVPlayerView setScaleMode:duration:](self->_avPlayerView, "setScaleMode:duration:", a3, 0.0);
}

- (void)setScaleMode:(int64_t)a3 duration:(double)a4
{
  -[PLAVPlayerView setScaleMode:duration:](self->_avPlayerView, "setScaleMode:duration:", a3, a4);
}

- (BOOL)isDestinationPlaceholderHidden
{
  return self->_destinationPlaceholderHidden;
}

- (void)setDestinationPlaceholderHidden:(BOOL)a3
{
  if (self->_destinationPlaceholderHidden != a3)
    self->_destinationPlaceholderHidden = a3;
}

- (void)_installBackgroundView:(id)a3
{
  -[PLMoviePlayerView bounds](self, "bounds");
  objc_msgSend(a3, "setFrame:");
  objc_msgSend(a3, "setAutoresizingMask:", 18);
  objc_msgSend(a3, "setHidden:", self->_destinationPlaceholderHidden);
  -[PLMoviePlayerView addSubview:](self, "addSubview:", a3);
}

- (int64_t)destinationPlaceholderStyle
{
  return self->_destinationPlaceholderStyle;
}

@end
