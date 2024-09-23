@implementation SXAudioComponentView

- (SXAudioComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 resourceDataSource:(id)a9 host:(id)a10
{
  id v16;
  id v17;
  SXAudioComponentView *v18;
  SXAudioComponentView *v19;
  SXAudioComponentOverlayView *v20;
  void *v21;
  uint64_t v22;
  SXAudioComponentOverlayView *overlayView;
  SXAudioComponentOverlayView *v24;
  void *v25;
  void *v26;
  id v28;
  objc_super v29;

  v16 = a4;
  v28 = a9;
  v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SXAudioComponentView;
  v18 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v29, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, v16, a5, a6, a7, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_host, a10);
    objc_storeStrong((id *)&v19->_resourceDataSource, a9);
    v20 = [SXAudioComponentOverlayView alloc];
    -[SXComponentView contentView](v19, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v22 = -[SXAudioComponentOverlayView initWithFrame:](v20, "initWithFrame:");
    overlayView = v19->_overlayView;
    v19->_overlayView = (SXAudioComponentOverlayView *)v22;

    -[SXAudioComponentOverlayView setAutoresizingMask:](v19->_overlayView, "setAutoresizingMask:", 18);
    v24 = v19->_overlayView;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentOverlayView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[SXAudioComponentOverlayView setUserInteractionEnabled:](v19->_overlayView, "setUserInteractionEnabled:", 1);
    -[SXAudioComponentOverlayView playButton](v19->_overlayView, "playButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addTarget:action:forControlEvents:", v19, sel_playButtonTapped_, 64);

    objc_msgSend(v16, "addViewportChangeListener:forOptions:", v19, 8);
  }

  return v19;
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  objc_super v5;

  var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXAudioComponentView;
  -[SXComponentView presentComponentWithChanges:](&v5, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (var0)
    -[SXAudioComponentView layoutViews](self, "layoutViews");
}

- (void)renderContents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXAudioComponentView;
  -[SXComponentView renderContents](&v9, sel_renderContents);
  -[SXComponentView component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stillImageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXComponentView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentView overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[SXAudioComponentView loadImage](self, "loadImage");
  }
  else
  {
    -[SXAudioComponentView player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[SXAudioComponentView loadAudio](self, "loadAudio");
      -[SXAudioComponentView player](self, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXAudioComponentView setupPlayerViewControllerWithPlayer:](self, "setupPlayerViewControllerWithPlayer:", v8);

    }
  }
  -[SXAudioComponentView layoutViews](self, "layoutViews");
}

- (void)discardContents
{
  void *v3;
  int v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SXAudioComponentView;
  -[SXComponentView discardContents](&v15, sel_discardContents);
  -[SXAudioComponentView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackStatus");

  if (v4 != 2)
  {
    -[SXAudioComponentView cancelHandler](self, "cancelHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SXAudioComponentView cancelHandler](self, "cancelHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      -[SXAudioComponentView setCancelHandler:](self, "setCancelHandler:", 0);
    }
    -[SXAudioComponentView overlayView](self, "overlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);

    -[SXAudioComponentView overlayView](self, "overlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SXAudioComponentView overlayView](self, "overlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

    -[SXAudioComponentView setPlayer:](self, "setPlayer:", 0);
    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "willMoveToParentViewController:", 0);

    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromParentViewController");

    -[SXAudioComponentView setPlayerViewController:](self, "setPlayerViewController:", 0);
    -[SXAudioComponentView setStartPlaybackWhenReady:](self, "setStartPlaybackWhenReady:", 0);
  }
}

- (void)layoutViews
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
  void *v15;
  id v16;

  -[SXAudioComponentView overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentView playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXAudioComponentView overlayView](self, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 == v6)
  {
    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOverlayView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v8, "setFrame:");

  }
  else
  {
    objc_msgSend(v7, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    -[SXAudioComponentView overlayView](self, "overlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v8, "setFrame:");
  }

LABEL_6:
  -[SXAudioComponentView playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v15, "setFrame:");

  }
}

- (void)playButtonTapped:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[SXAudioComponentView overlayView](self, "overlayView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startActivityIndicator");

  -[SXAudioComponentView setStartPlaybackWhenReady:](self, "setStartPlaybackWhenReady:", 1);
  -[SXAudioComponentView submitMediaEngageEventForUserAction:](self, "submitMediaEngageEventForUserAction:", 4);
  v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SXAudioComponentView_playButtonTapped___block_invoke;
  block[3] = &unk_24D6874A8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

void __41__SXAudioComponentView_playButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "loadAudio");
  objc_msgSend(MEMORY[0x24BE90748], "sharedSessionForMode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addInterestForPlayer:withMode:", v3, 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupPlayerViewControllerWithPlayer:", v5);

  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v11, "setFrame:");

}

- (void)setupPlayerViewControllerWithPlayer:(id)a3
{
  id v4;
  SXAudioPlayerViewController *v5;
  AVPlayerViewController *playerViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (!self->_playerViewController)
  {
    v4 = a3;
    v5 = objc_alloc_init(SXAudioPlayerViewController);
    playerViewController = self->_playerViewController;
    self->_playerViewController = &v5->super;

    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](self->_playerViewController, "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController setPlayer:](self->_playerViewController, "setPlayer:", v4);

    -[AVPlayerViewController setDelegate:](self->_playerViewController, "setDelegate:", self);
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentingContentViewController");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addChildViewController:", self->_playerViewController);
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v8, "setFrame:");

    -[SXComponentView contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[AVPlayerViewController didMoveToParentViewController:](self->_playerViewController, "didMoveToParentViewController:", v20);
    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "setBackgroundColor:", v13);

    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_opt_respondsToSelector();

    v15 = v20;
    if ((v12 & 1) != 0)
    {
      -[SXAudioComponentView playerViewController](self, "playerViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v17, "audioOnlyIndicatorView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBackgroundColor:", v19);

      }
      v15 = v20;
    }

  }
}

- (void)loadImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  SXImageRequest *v9;
  void *v10;
  void *v11;
  SXImageRequest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stillImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageResourceForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
    v7 = 6;
  else
    v7 = 4;
  v8 = objc_msgSend(v6, "wideColorSpace");
  objc_initWeak(&location, self);
  v9 = [SXImageRequest alloc];
  objc_msgSend(v6, "imageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __33__SXAudioComponentView_loadImage__block_invoke;
  v18 = &unk_24D687758;
  objc_copyWeak(&v19, &location);
  v12 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v9, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v10, v7, v11, v8, &v15, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  -[SXAudioComponentView resourceDataSource](self, "resourceDataSource", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loadImagesForImageRequest:completionBlock:", v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentView setCancelHandler:](self, "setCancelHandler:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __33__SXAudioComponentView_loadImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(WeakRetained, "setIsDisplayingMedia:", 1);
    v7 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(WeakRetained, "overlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __33__SXAudioComponentView_loadImage__block_invoke_2;
    v9[3] = &unk_24D687408;
    v9[4] = WeakRetained;
    v10 = v3;
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v9, 0, 0.25);

  }
}

void __33__SXAudioComponentView_loadImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

}

- (void)loadAudio
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXAudioComponentView player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDB26C8]);
    objc_msgSend(v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDB21F0];
    v19[0] = &unk_24D6FEF68;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithURL:options:", v9, v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithAsset:automaticallyLoadedAssetKeys:", v11, &unk_24D702FF0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90738]), "initWithPlayerItem:audioMode:", v12, 3);
    -[SXAudioComponentView setPlayer:](self, "setPlayer:", v13);

    objc_initWeak(&location, self);
    -[SXAudioComponentView player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __33__SXAudioComponentView_loadAudio__block_invoke;
    v15[3] = &unk_24D68B630;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v14, "setPlaybackStatusBlock:", v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __33__SXAudioComponentView_loadAudio__block_invoke(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  switch(a3)
  {
    case 1:
      objc_msgSend(WeakRetained, "setIsDisplayingMedia:", 1);
      if (objc_msgSend(v6, "shouldAutoStartPlayback"))
        objc_msgSend(v10, "play");
      break;
    case 2:
      objc_msgSend(WeakRetained, "overlayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopActivityIndicator");

      objc_msgSend(v6, "overlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      objc_msgSend(v6, "setStartPlaybackWhenReady:", 0);
      if (objc_msgSend(v10, "playbackPosition"))
        objc_msgSend(v6, "playbackResumed");
      else
        objc_msgSend(v6, "playbackStarted");
      break;
    case 3:
      objc_msgSend(WeakRetained, "playbackPaused");
      break;
    case 4:
      objc_msgSend(WeakRetained, "playbackFinished");
      objc_msgSend(v10, "seekToStartWithCompletionBlock:", 0);
      break;
    default:
      break;
  }

}

- (BOOL)shouldAutoStartPlayback
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v3 = -[SXAudioComponentView startPlaybackWhenReady](self, "startPlaybackWhenReady");
  if (v3)
  {
    -[SXAudioComponentView host](self, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "active");

    if (!v5 || -[SXAudioComponentView audioHasPlayed](self, "audioHasPlayed"))
      goto LABEL_10;
    -[SXAudioComponentView player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "playbackStatus"))
      goto LABEL_9;
    -[SXAudioComponentView player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "playbackStatus") == 5)
    {
LABEL_8:

LABEL_9:
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    -[SXAudioComponentView player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "playbackStatus") == 2)
    {

      goto LABEL_8;
    }
    -[SXAudioComponentView player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "playbackStatus");

    if (v10 == 4)
      goto LABEL_10;
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)playbackPaused
{
  -[SXAudioComponentView submitMediaEngageEventForUserAction:](self, "submitMediaEngageEventForUserAction:", 2);
}

- (void)playbackResumed
{
  void *v3;
  void *v4;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaPlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v4, self);

  -[SXAudioComponentView submitMediaEngageEventForUserAction:](self, "submitMediaEngageEventForUserAction:", 3);
}

- (void)playbackStarted
{
  void *v3;
  void *v4;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaPlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v4, self);

  -[SXAudioComponentView setAudioHasPlayed:](self, "setAudioHasPlayed:", 1);
  -[SXAudioComponentView submitMediaEngageEventForUserAction:](self, "submitMediaEngageEventForUserAction:", 1);
}

- (void)pauseMediaPlayback
{
  id v2;

  -[SXAudioComponentView player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)pauseMediaPlaybackForDisappearance
{
  id v2;

  -[SXAudioComponentView player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)showPlaybackControls
{
  id v2;

  -[SXAudioComponentView playerViewController](self, "playerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsPlaybackControls:", 1);

}

- (void)hidePlaybackControls
{
  id v2;

  -[SXAudioComponentView playerViewController](self, "playerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsPlaybackControls:", 0);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CGFloat Width;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(a3, "anyObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentView bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  -[SXAudioComponentView bounds](self, "bounds");
  v6 = CGRectGetHeight(v18) + -50.0;
  -[SXAudioComponentView overlayView](self, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = Width;
  v19.size.height = v6;
  v16.x = v9;
  v16.y = v11;
  if (CGRectContainsPoint(v19, v16))
  {
    -[SXAudioComponentView playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SXAudioComponentView playerViewController](self, "playerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "showsPlaybackControls");

      if (v14)
      {
        -[SXAudioComponentView hidePlaybackControls](self, "hidePlaybackControls");
        -[SXAudioComponentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showPlaybackControls, 0, 3.0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showPlaybackControls, 0);
        -[SXAudioComponentView showPlaybackControls](self, "showPlaybackControls");
      }
    }
  }

}

- (unint64_t)analyticsMediaType
{
  return 3;
}

- (void)submitMediaEngageEventForUserAction:(unint64_t)a3
{
  void *v5;
  void *v6;
  double Seconds;
  void *v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  CMTime time;

  -[SXAudioComponentView player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserAction:", a3);
  -[SXAudioComponentView player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "totalTimePlayed");
  v11 = v10;

  if (a3 != 4)
  {
    v12 = (unint64_t)Seconds;
    -[SXAudioComponentView player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    v15 = v14;

    -[SXAudioComponentView player](self, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frameRate");
    v18 = v17;

    objc_msgSend(v8, "setMediaDuration:", v15);
    objc_msgSend(v8, "setMediaFrameRate:", v18);
    if (a3 == 3)
    {
      objc_msgSend(v8, "setMediaResumePosition:", v12);
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      objc_msgSend(v8, "setMediaPausePosition:", v12);
LABEL_9:
      objc_msgSend(v8, "setMediaTimePlayed:", v11);
    }
  }
  objc_msgSend(v8, "determineEndDate");
  -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reportEvent:", v8);

}

- (void)submitMediaEngageCompleteEvent
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[SXAudioComponentView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  -[SXAudioComponentView player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameRate");
  v8 = v7;

  -[SXAudioComponentView player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "totalTimePlayed");
  v11 = v10;

  -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaDuration:", v5);
  objc_msgSend(v13, "setMediaFrameRate:", v8);
  objc_msgSend(v13, "setMediaTimePlayed:", v11);
  objc_msgSend(v13, "determineEndDate");
  -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reportEvent:", v13);

}

- (BOOL)allowHierarchyRemoval
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXAudioComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v8, sel_allowHierarchyRemoval);
  if (v3)
  {
    -[SXAudioComponentView player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "playbackStatus") == 2)
    {

    }
    else
    {
      -[SXAudioComponentView player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "playbackStatus");

      if (v6 != 1)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BE90748], "sharedSessionForMode:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentView player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInterestForPlayer:withMode:", v5, 1);

  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = objc_msgSend(a3, "appearState") != 0;
  -[SXAudioComponentView playerViewController](self, "playerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUpdatesNowPlayingInfoCenter:", v5);

}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SXHost)host
{
  return self->_host;
}

- (SXAudioComponentOverlayView)overlayView
{
  return self->_overlayView;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (BOOL)audioHasPlayed
{
  return self->_audioHasPlayed;
}

- (void)setAudioHasPlayed:(BOOL)a3
{
  self->_audioHasPlayed = a3;
}

- (BOOL)startPlaybackWhenReady
{
  return self->_startPlaybackWhenReady;
}

- (void)setStartPlaybackWhenReady:(BOOL)a3
{
  self->_startPlaybackWhenReady = a3;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 928);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
}

@end
