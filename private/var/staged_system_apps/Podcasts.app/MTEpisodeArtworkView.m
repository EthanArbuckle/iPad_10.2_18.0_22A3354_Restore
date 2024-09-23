@implementation MTEpisodeArtworkView

- (MTEpisodeArtworkView)initWithFrame:(CGRect)a3
{
  MTEpisodeArtworkView *v3;
  MTEpisodeArtworkView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTEpisodeArtworkView;
  v3 = -[MTEpisodeArtworkView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](v3, "imageView"));
    -[MTEpisodeArtworkView addSubview:](v4, "addSubview:", v5);

    -[MTEpisodeArtworkView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeArtworkView;
  -[MTEpisodeArtworkView dealloc](&v4, "dealloc");
}

- (UIImage)artwork
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setArtwork:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  objc_msgSend(v4, "setImage:", v8);

  v5 = -[MTEpisodeArtworkView isCurrentPlayerItem](self, "isCurrentPlayerItem");
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView _blurredArtworkForArtwork:](self, "_blurredArtworkForArtwork:", v8));
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
  objc_msgSend(v7, "setImage:", v6);

  if (v5)
}

- (MTVibrantImageView)vibrantImageView
{
  MTVibrantImageView *vibrantImageView;
  MTVibrantImageView *v4;
  MTVibrantImageView *v5;
  void *v6;

  vibrantImageView = self->_vibrantImageView;
  if (!vibrantImageView)
  {
    v4 = objc_opt_new(MTVibrantImageView);
    v5 = self->_vibrantImageView;
    self->_vibrantImageView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView barsView](self, "barsView"));
    -[MTVibrantImageView setMaskView:](self->_vibrantImageView, "setMaskView:", v6);

    vibrantImageView = self->_vibrantImageView;
  }
  return vibrantImageView;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_currentPlayerItem != a3)
  {
    self->_currentPlayerItem = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView dimmingView](self, "dimmingView"));
      -[MTEpisodeArtworkView addSubview:](self, "addSubview:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));

      if (!v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView artwork](self, "artwork"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView _blurredArtworkForArtwork:](self, "_blurredArtworkForArtwork:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
        objc_msgSend(v9, "setImage:", v8);

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
      -[MTEpisodeArtworkView addSubview:](self, "addSubview:", v10);

      -[MTEpisodeArtworkView startObservingPlaybackState](self, "startObservingPlaybackState");
    }
    else
    {
      -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
      -[MTVibrantImageView removeFromSuperview](self->_vibrantImageView, "removeFromSuperview");
      -[MTEpisodeArtworkView stopObservingPlaybackState](self, "stopObservingPlaybackState");
    }
    -[MTEpisodeArtworkView updatePlaybackState](self, "updatePlaybackState");
  }
}

- (void)startObservingPlaybackState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updatePlaybackState", IMAVPlayerNotification_StateDidChange, 0);

}

- (void)stopObservingPlaybackState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, IMAVPlayerNotification_StateDidChange, 0);

}

- (void)updatePlaybackState
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  if (-[MTEpisodeArtworkView isCurrentPlayerItem](self, "isCurrentPlayerItem"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v4 = objc_msgSend(v3, "isTargetPlaying");

    if (v4)
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  -[MTNowPlayingIndicatorView setPlaybackState:](self->_barsView, "setPlaybackState:", v5);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[MTEpisodeArtworkView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_dimmingView, "superview"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView dimmingView](self, "dimmingView"));
    objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTVibrantImageView superview](self->_vibrantImageView, "superview"));

  if (v14)
  {
    -[MTVibrantImageView setFrame:](self->_vibrantImageView, "setFrame:", v4, v6, v8, v10);
    -[MTEpisodeArtworkView _updateBarMetricsForArtworkSize:](self, "_updateBarMetricsForArtworkSize:", v8, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_opt_new(UIImageView);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor artworkBorderColor](UIColor, "artworkBorderColor")));
    v7 = objc_msgSend(v6, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v8, "setBorderColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "scale");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v12, "setBorderWidth:", 1.0 / v11);

    imageView = self->_imageView;
  }
  return imageView;
}

- (UIView)dimmingView
{
  UIView *dimmingView;
  UIView *v4;
  UIView *v5;
  void *v6;

  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_dimmingView;
    self->_dimmingView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.32));
    -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v6);

    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (MTNowPlayingIndicatorView)barsView
{
  MTNowPlayingIndicatorView *barsView;
  MTNowPlayingIndicatorView *v4;
  MTNowPlayingIndicatorView *v5;
  uint64_t v6;
  uint64_t v7;

  barsView = self->_barsView;
  if (!barsView)
  {
    v4 = objc_opt_new(MTNowPlayingIndicatorView);
    v5 = self->_barsView;
    self->_barsView = v4;

    if (isTV(v6))
      v7 = 3;
    else
      v7 = 4;
    -[MTNowPlayingIndicatorView setNumberOfLevels:](self->_barsView, "setNumberOfLevels:", v7);
    -[MTNowPlayingIndicatorView setBounceStyle:](self->_barsView, "setBounceStyle:", 1);
    -[MTNowPlayingIndicatorView setLevelWidth:](self->_barsView, "setLevelWidth:", 3.5);
    -[MTNowPlayingIndicatorView setInterLevelSpacing:](self->_barsView, "setInterLevelSpacing:", 2.0);
    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", 1.0);
    barsView = self->_barsView;
  }
  return barsView;
}

- (id)_blurredArtworkForArtwork:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2020));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(v4, "setBlurRadius:", 1.0 / v7 * 8.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_applyBackdropViewSettings:includeTints:includeBlur:", v4, 1, 1));

  return v8;
}

- (void)_updateBarMetricsForArtworkSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
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

  if (self->_barsView)
  {
    height = a3.height;
    width = a3.width;
    v6 = isTV(self);
    v7 = v6;
    v8 = isTV(v6);
    v9 = v8;
    v10 = isTV(v8);
    if ((_DWORD)v10)
      v11 = 0.200000003;
    else
      v11 = 0.25;
    if (isTV(v10))
      v12 = 0.319999993;
    else
      v12 = 0.34375;
    v13 = -[MTNowPlayingIndicatorView numberOfLevels](self->_barsView, "numberOfLevels");
    v14 = height * v11;
    v15 = width * v12;
    v16 = width * v12 / ((double)(unint64_t)v13 + (double)((unint64_t)v13 - 1) * 0.5);
    v17 = v16 * 0.5;
    v18 = isTV(v13);
    v33 = IMRoundToPixel(v14);
    v19 = IMRoundToPixel(v16);
    if (v19 < 1.0)
      v19 = 1.0;
    v32 = v19;
    v20 = IMRoundToPixel(v16);
    if (v20 < 2.0)
      v20 = 2.0;
    v31 = v20;
    v22 = IMRoundToPixel(v16 * 0.5);
    if (v22 < 1.0)
      v22 = 1.0;
    v30 = v22;
    v23 = 0.0;
    if ((isTV(v21) & 1) == 0)
    {
      v24 = v17 * 0.5;
      if (v18)
        v24 = 0.0;
      if (v9)
        v23 = 0.0;
      else
        v23 = 4.0;
      if (v7)
        v25 = 0.0;
      else
        v25 = 1.0;
      v26 = IMRoundToPixel(v24);
      if (v26 < v25)
        v26 = v25;
      if (v26 < v23)
        v23 = v26;
    }
    v27 = IMRoundToPixel(v15);
    v28 = IMRoundToPixel(v14);
    v29 = IMRoundToPixel((width - v15) * 0.5);
    -[MTNowPlayingIndicatorView setFrame:](self->_barsView, "setFrame:", v29, IMRoundToPixel((height - v14) * 0.5), v27, v28);
    -[MTNowPlayingIndicatorView setMaximumLevelHeight:](self->_barsView, "setMaximumLevelHeight:", v33);
    -[MTNowPlayingIndicatorView setMinimumLevelHeight:](self->_barsView, "setMinimumLevelHeight:", v32);
    -[MTNowPlayingIndicatorView setLevelWidth:](self->_barsView, "setLevelWidth:", v31);
    -[MTNowPlayingIndicatorView setInterLevelSpacing:](self->_barsView, "setInterLevelSpacing:", v30);
    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", v23);
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void)setVibrantImageView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantImageView, a3);
}

- (void)setBarsView:(id)a3
{
  objc_storeStrong((id *)&self->_barsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_vibrantImageView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
