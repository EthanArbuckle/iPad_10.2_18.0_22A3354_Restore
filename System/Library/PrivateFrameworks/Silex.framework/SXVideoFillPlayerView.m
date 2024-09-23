@implementation SXVideoFillPlayerView

- (SXVideoFillPlayerView)initWithVideoResource:(id)a3 imageView:(id)a4
{
  id v7;
  id v8;
  SXVideoFillPlayerView *v9;
  SXVideoFillPlayerView *v10;
  SXImageView *stillImageView;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SVAVPlayer *player;
  SVAVPlayer *v20;
  void *v21;
  uint64_t v22;
  SXPlayerLayer *playerLayer;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SXVideoFillPlayerView;
  v9 = -[SXVideoFillPlayerView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoResource, a3);
    objc_storeStrong((id *)&v10->_stillImageView, a4);
    stillImageView = v10->_stillImageView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setBackgroundColor:](stillImageView, "setBackgroundColor:", v12);

    objc_initWeak(&location, v10);
    v13 = objc_alloc(MEMORY[0x24BDB26C8]);
    objc_msgSend(v7, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDB21F0];
    v30[0] = &unk_24D6FEF50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithURL:options:", v14, v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithAsset:automaticallyLoadedAssetKeys:", v16, &unk_24D702FD8);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE90738]), "initWithPlayerItem:audioMode:", v17, 2);
    player = v10->_player;
    v10->_player = (SVAVPlayer *)v18;

    -[SVAVPlayer setPreventsDisplaySleepDuringVideoPlayback:](v10->_player, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[SVAVPlayer setMuted:](v10->_player, "setMuted:", 1);
    v20 = v10->_player;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke;
    v25[3] = &unk_24D68B630;
    objc_copyWeak(&v26, &location);
    -[SVAVPlayer setPlaybackStatusBlock:](v20, "setPlaybackStatusBlock:", v25);
    -[SXVideoFillPlayerView player](v10, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVPlayerLayer playerLayerWithPlayer:](SXPlayerLayer, "playerLayerWithPlayer:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    playerLayer = v10->_playerLayer;
    v10->_playerLayer = (SXPlayerLayer *)v22;

    -[SXPlayerLayer addObserver:forKeyPath:options:context:](v10->_playerLayer, "addObserver:forKeyPath:options:context:", v10, CFSTR("readyForDisplay"), 1, 0);
    -[SXVideoFillPlayerView addSubview:](v10, "addSubview:", v10->_stillImageView);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }

  return v10;
}

void __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3 == 4)
  {
    if (objc_msgSend(WeakRetained, "shouldLoop"))
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke_2;
      v8[3] = &unk_24D6874A8;
      v9 = v5;
      objc_msgSend(v9, "seekToStartWithCompletionBlock:", v8);

    }
  }
  else if (a3 == 1)
  {
    objc_msgSend(WeakRetained, "playIfPossible");
  }

}

uint64_t __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillPlayerView;
  -[SXVideoFillPlayerView layoutSubviews](&v5, sel_layoutSubviews);
  -[SXVideoFillPlayerView stillImageView](self, "stillImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoFillPlayerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoFillPlayerView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)play
{
  void *v3;
  void *v4;
  BOOL IsReduceMotionEnabled;

  -[SXVideoFillPlayerView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") != 1)
    goto LABEL_6;
  -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isReadyForDisplay") & 1) == 0)
  {

    goto LABEL_6;
  }
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (!IsReduceMotionEnabled)
  {
    -[SXVideoFillPlayerView switchToPlayer](self, "switchToPlayer");
    -[SXVideoFillPlayerView player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "play");
LABEL_6:

  }
  -[SXVideoFillPlayerView setHasRequestedPlayback:](self, "setHasRequestedPlayback:", 1);
}

- (void)pause
{
  void *v3;

  -[SXVideoFillPlayerView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[SXVideoFillPlayerView setHasRequestedPlayback:](self, "setHasRequestedPlayback:", 0);
}

- (void)setFillMode:(unint64_t)a3
{
  void *v4;
  _QWORD *v5;
  id v6;

  self->_fillMode = a3;
  -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = (_QWORD *)MEMORY[0x24BDB1C70];
  if (a3 != 2)
    v5 = (_QWORD *)MEMORY[0x24BDB1C80];
  objc_msgSend(v4, "setVideoGravity:", *v5);

}

- (void)reset
{
  void *v3;
  uint64_t v4;
  id v5;

  -[SXVideoFillPlayerView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 1)
  {
    -[SXVideoFillPlayerView player](self, "player");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekToStartWithCompletionBlock:", 0);

  }
}

- (void)switchToPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SXVideoFillPlayerView stillImageView](self, "stillImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXVideoFillPlayerView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSublayer:atIndex:", v5, 0);

    -[SXVideoFillPlayerView stillImageView](self, "stillImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SXVideoFillPlayerView setStillImageView:](self, "setStillImageView:", 0);
  }
}

- (void)playIfPossible
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[SXVideoFillPlayerView hasRequestedPlayback](self, "hasRequestedPlayback"))
  {
    -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isReadyForDisplay") & 1) != 0)
    {
      -[SXVideoFillPlayerView player](self, "player");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "status");

      if (v4 == 1)
        -[SXVideoFillPlayerView play](self, "play");
    }
    else
    {

    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  BOOL IsReduceMotionEnabled;
  id v11;

  v11 = a3;
  v8 = a4;
  -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v8 && objc_msgSend(v11, "isEqualToString:", CFSTR("readyForDisplay")))
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

    if (!IsReduceMotionEnabled)
    {
      -[SXVideoFillPlayerView switchToPlayer](self, "switchToPlayer");
      -[SXVideoFillPlayerView playIfPossible](self, "playIfPossible");
    }
  }
  else
  {

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXVideoFillPlayerView playerLayer](self, "playerLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("readyForDisplay"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillPlayerView;
  -[SXVideoFillPlayerView dealloc](&v5, sel_dealloc);
}

- (unint64_t)fillMode
{
  return self->_fillMode;
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (void)setShouldLoop:(BOOL)a3
{
  self->_shouldLoop = a3;
}

- (SXVideoResource)videoResource
{
  return self->_videoResource;
}

- (void)setVideoResource:(id)a3
{
  objc_storeStrong((id *)&self->_videoResource, a3);
}

- (SXPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (SXImageView)stillImageView
{
  return self->_stillImageView;
}

- (void)setStillImageView:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageView, a3);
}

- (BOOL)hasRequestedPlayback
{
  return self->_hasRequestedPlayback;
}

- (void)setHasRequestedPlayback:(BOOL)a3
{
  self->_hasRequestedPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageView, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_videoResource, 0);
}

@end
