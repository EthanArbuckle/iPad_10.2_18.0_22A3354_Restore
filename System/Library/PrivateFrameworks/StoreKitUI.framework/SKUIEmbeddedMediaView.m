@implementation SKUIEmbeddedMediaView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v4), 0);
  v5 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v5), 0);
  v6 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v6), 0);

  v7.receiver = self;
  v7.super_class = (Class)SKUIEmbeddedMediaView;
  -[SKUIEmbeddedMediaView dealloc](&v7, sel_dealloc);
}

- (void)beginInlinePlaybackWithURL:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MPMoviePlayerController *v13;
  MPMoviePlayerController *moviePlayer;
  void *v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView beginInlinePlaybackWithURL:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
  v13 = -[SKUIEmbeddedMediaView _newMoviePlayerControllerWithURL:](self, "_newMoviePlayerControllerWithURL:", v4);

  moviePlayer = self->_moviePlayer;
  self->_moviePlayer = v13;

  self->_usingInlinePlayback = 1;
  -[MPMoviePlayerController view](self->_moviePlayer, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEmbeddedMediaView bounds](self, "bounds");
  objc_msgSend(v15, "setFrame:");
  -[SKUIEmbeddedMediaView addSubview:](self, "addSubview:", v15);

}

- (void)beginPlaybackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MPMoviePlayerController *moviePlayer;
  void *v14;
  MPMoviePlayerController *v15;
  MPMoviePlayerController *v16;
  void *v17;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView beginPlaybackAnimated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_mediaURLString)
  {
    moviePlayer = self->_moviePlayer;
    if (moviePlayer)
    {
      -[MPMoviePlayerController play](moviePlayer, "play");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SKUIEmbeddedMediaView _newMoviePlayerControllerWithURL:](self, "_newMoviePlayerControllerWithURL:", v14);
      v16 = self->_moviePlayer;
      self->_moviePlayer = v15;

      self->_usingInlinePlayback = 0;
      -[MPMoviePlayerController view](self->_moviePlayer, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIEmbeddedMediaView bounds](self, "bounds");
      objc_msgSend(v17, "setFrame:");
      -[SKUIEmbeddedMediaView addSubview:](self, "addSubview:", v17);
      -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 1, v3);

    }
  }
}

- (void)endPlaybackAnimated:(BOOL)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MPMoviePlayerController *moviePlayer;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView endPlaybackAnimated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    -[MPMoviePlayerController stop](moviePlayer, "stop");
    if (a3)
    {
      if (-[MPMoviePlayerController isFullscreen](self->_moviePlayer, "isFullscreen"))
      {
        -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 0, 1);
      }
      else
      {
        -[UIImageView setAlpha:](self->_playerDecorationView, "setAlpha:", 0.0);
        -[UIImageView setAlpha:](self->_thumbnailReflectionView, "setAlpha:", 0.0);
        -[UIImageView setAlpha:](self->_thumbnailView, "setAlpha:", 0.0);
        -[MPMoviePlayerController view](self->_moviePlayer, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIEmbeddedMediaView sendSubviewToBack:](self, "sendSubviewToBack:", v14);

        v15[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke;
        v16[3] = &unk_1E739FD38;
        v16[4] = self;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2;
        v15[3] = &unk_1E73A0108;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v16, v15, 0.2);
      }
    }
    else
    {
      -[SKUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
    }
  }
}

uint64_t __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setAlpha:", 1.0);
}

uint64_t __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownMoviePlayer");
}

- (int64_t)playbackState
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t result;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmbeddedMediaView playbackState].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  result = (int64_t)self->_moviePlayer;
  if (result)
  {
    v12 = objc_msgSend((id)result, "playbackState");
    if ((unint64_t)(v12 - 1) > 4)
      return 0;
    else
      return qword_1BBED2938[v12 - 1];
  }
  return result;
}

- (void)setMediaType:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIImageView *playerDecorationView;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView setMediaType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    -[UIImageView removeFromSuperview](self->_playerDecorationView, "removeFromSuperview");
    playerDecorationView = self->_playerDecorationView;
    self->_playerDecorationView = 0;

    -[SKUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsThumbnailReflection:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *thumbnailReflectionView;
  void *v17;
  UIImageView *v18;
  CATransform3D v19;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView setShowsThumbnailReflection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (-[SKUIEmbeddedMediaView showsThumbnailReflection](self, "showsThumbnailReflection") != v3)
  {
    if (v3)
    {
      v13 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[UIImageView image](self->_thumbnailView, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
      thumbnailReflectionView = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = v15;

      -[UIImageView setContentMode:](self->_thumbnailReflectionView, "setContentMode:", -[UIImageView contentMode](self->_thumbnailView, "contentMode"));
      -[UIImageView layer](self->_thumbnailReflectionView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CATransform3DMakeScale(&v19, -1.0, -1.0, 1.0);
      objc_msgSend(v17, "setTransform:", &v19);

      -[SKUIEmbeddedMediaView addSubview:](self, "addSubview:", self->_thumbnailReflectionView);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_thumbnailReflectionView, "removeFromSuperview");
      v18 = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = 0;

    }
    -[SKUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setThumbnailContentMode:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView setThumbnailContentMode:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentMode:", a3);

  -[UIImageView setContentMode:](self->_thumbnailReflectionView, "setContentMode:", a3);
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView setThumbnailImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView image](self->_thumbnailView, "image");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    -[SKUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v4);
    -[UIImageView setImage:](self->_thumbnailReflectionView, "setImage:", v4);
    -[SKUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (BOOL)showsThumbnailReflection
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmbeddedMediaView showsThumbnailReflection].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return self->_thumbnailReflectionView != 0;
}

- (int64_t)thumbnailContentMode
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmbeddedMediaView thumbnailContentMode].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contentMode");

  return v12;
}

- (UIImage)thumbnailImage
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmbeddedMediaView thumbnailImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIImageView image](self->_thumbnailView, "image");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmbeddedMediaView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_mediaType != 2)
    -[UIImageView setBackgroundColor:](self->_thumbnailView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIEmbeddedMediaView;
  -[SKUIEmbeddedMediaView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)didMoveToWindow
{
  OUTLINED_FUNCTION_1();
}

- (void)_didExitFullscreen:(id)a3
{
  if (!self->_usingInlinePlayback)
  {
    -[SKUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer", a3);
    -[SKUIEmbeddedMediaView _sendPlaybackStateChanged](self, "_sendPlaybackStateChanged");
  }
}

- (void)_didFinishPlayback:(id)a3
{
  if (-[MPMoviePlayerController isFullscreen](self->_moviePlayer, "isFullscreen", a3))
  {
    -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 0, 1);
  }
  else
  {
    -[SKUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
    -[SKUIEmbeddedMediaView _sendPlaybackStateChanged](self, "_sendPlaybackStateChanged");
  }
}

- (id)_newMoviePlayerControllerWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = SKUIMediaPlayerFramework();
  v6 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("MPMoviePlayerController"), v5)), "initWithContentURL:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didExitFullscreen_, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v8), v6);
  v9 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didFinishPlayback_, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v9), v6);
  v10 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v10), v6);

  return v6;
}

- (void)_sendPlaybackStateChanged
{
  id v3;

  -[SKUIEmbeddedMediaView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaView:playbackStateDidChange:", self, -[SKUIEmbeddedMediaView playbackState](self, "playbackState"));

}

- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double v7;
  float v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3.height;
  v7 = a3.width;
  if (-[SKUIEmbeddedMediaView thumbnailContentMode](self, "thumbnailContentMode", a3.width, a3.height, a4.origin.x, a4.origin.y) == 1&& (v7 > width || v6 > height))
  {
    v9 = v6 * (width / v7);
    v6 = ceilf(v9);
    v7 = width;
  }
  v10 = v7;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_tearDownMoviePlayer
{
  MPMoviePlayerController *moviePlayer;
  void *v4;
  void *v5;
  void *v6;
  MPMoviePlayerController *v7;
  id v8;

  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    -[MPMoviePlayerController stop](moviePlayer, "stop");
    -[MPMoviePlayerController view](self->_moviePlayer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v5), self->_moviePlayer);
    v6 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v6), self->_moviePlayer);
    v7 = self->_moviePlayer;
    self->_moviePlayer = 0;

  }
}

- (id)_thumbnailView
{
  UIImageView *thumbnailView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;

  thumbnailView = self->_thumbnailView;
  if (!thumbnailView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_thumbnailView;
    self->_thumbnailView = v4;

    v6 = self->_thumbnailView;
    -[SKUIEmbeddedMediaView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIImageView setContentMode:](self->_thumbnailView, "setContentMode:", 1);
    -[SKUIEmbeddedMediaView addSubview:](self, "addSubview:", self->_thumbnailView);
    thumbnailView = self->_thumbnailView;
  }
  return thumbnailView;
}

- (SKUIEmbeddedMediaViewDelegate)delegate
{
  return (SKUIEmbeddedMediaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_thumbnailReflectionView, 0);
  objc_storeStrong((id *)&self->_playerDecorationView, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)beginInlinePlaybackWithURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)beginPlaybackAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)endPlaybackAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)playbackState
{
  OUTLINED_FUNCTION_1();
}

- (void)setMediaType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShowsThumbnailReflection:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setThumbnailContentMode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setThumbnailImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)showsThumbnailReflection
{
  OUTLINED_FUNCTION_1();
}

- (void)thumbnailContentMode
{
  OUTLINED_FUNCTION_1();
}

- (void)thumbnailImage
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
