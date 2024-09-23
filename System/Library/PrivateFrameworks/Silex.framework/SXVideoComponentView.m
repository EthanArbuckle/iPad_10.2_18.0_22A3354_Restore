@implementation SXVideoComponentView

- (SXVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSource:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  SXVideoComponentView *v21;
  SXVideoComponentView *v22;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v17 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v29 = a12;
  v18 = a13;
  v19 = a14;
  v20 = a15;
  v33.receiver = self;
  v33.super_class = (Class)SXVideoComponentView;
  v21 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v33, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, a4, a5, a6, a7, v17);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_resourceDataSource, a10);
    objc_storeStrong((id *)&v22->_reachabilityProvider, a11);
    objc_storeStrong((id *)&v22->_appStateMonitor, a8);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v22->_scrollObserverManager, a12);
    objc_storeStrong((id *)&v22->_videoPlayerViewControllerManager, a13);
    objc_storeStrong((id *)&v22->_bookmarkManager, a14);
    objc_storeStrong((id *)&v22->_prerollAdFactory, a15);
  }

  return v22;
}

- (void)loadComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SXVideoComponentAnalyticsReporting *v18;
  void *v19;
  void *v20;
  SXVideoComponentAnalyticsReporting *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SXVideoAnalyticsRouter *v27;
  SXVideoAnalyticsRouter *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id from;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id location;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SXVideoComponentView;
  -[SXComponentView loadComponent:](&v46, sel_loadComponent_, v4);
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SXVideoComponentView posterFrame](self, "posterFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_4;
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceForIdentifier:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__1;
    v43 = __Block_byref_object_dispose__1;
    v44 = 0;
    -[SXVideoComponentView videoPlayerViewControllerManager](self, "videoPlayerViewControllerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __38__SXVideoComponentView_loadComponent___block_invoke;
    v37[3] = &unk_24D68B7A0;
    objc_copyWeak(&v38, &location);
    v37[4] = &v39;
    objc_msgSend(v10, "videoPlayerViewControllerForURL:receiveOwnershipBlock:", v11, v37);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v40[5];
    v40[5] = v13;

    if (objc_msgSend((id)v40[5], "shouldAutoplay"))
    {
      objc_initWeak(&from, self);
      v34[0] = v12;
      v34[1] = 3221225472;
      v34[2] = __38__SXVideoComponentView_loadComponent___block_invoke_2;
      v34[3] = &unk_24D6873B8;
      objc_copyWeak(&v35, &from);
      -[SXVideoComponentView setPresentationBlock:](self, "setPresentationBlock:", v34);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&from);
    }
    -[SXVideoComponentView appStateMonitor](self, "appStateMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    v30 = 3221225472;
    v31 = __38__SXVideoComponentView_loadComponent___block_invoke_3;
    v32 = &unk_24D6873B8;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v15, "performOnApplicationDidEnterBackground:", &v29);

    -[SXVideoComponentView reachabilityProvider](self, "reachabilityProvider", v29, v30, v31, v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addReachabilityObserver:", self);

    -[SXComponentView viewport](self, "viewport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addViewportChangeListener:forOptions:", self, 8);

    -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1);
    v18 = [SXVideoComponentAnalyticsReporting alloc];
    -[SXComponentView component](self, "component");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SXVideoComponentAnalyticsReporting initWithComponent:analyticsProviding:](v18, "initWithComponent:analyticsProviding:", v19, v20);
    -[SXVideoComponentView setVideoComponentAnalyticsReporter:](self, "setVideoComponentAnalyticsReporter:", v21);

    objc_msgSend((id)v40[5], "analyticsRouter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend((id)v40[5], "analyticsRouter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXVideoComponentView setAnalyticsRouter:](self, "setAnalyticsRouter:", v23);

      -[SXVideoComponentView analyticsRouter](self, "analyticsRouter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXVideoComponentView videoComponentAnalyticsReporter](self, "videoComponentAnalyticsReporter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAnalyticsReporter:forPlaybackLocation:", v25, 2);

      -[SXVideoComponentView analyticsRouter](self, "analyticsRouter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCurrentPlaybackLocation:", 2);
    }
    else
    {
      v27 = [SXVideoAnalyticsRouter alloc];
      -[SXVideoComponentView videoComponentAnalyticsReporter](self, "videoComponentAnalyticsReporter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SXVideoAnalyticsRouter initWithInitiatedPlaybackLocation:analyticsReporter:](v27, "initWithInitiatedPlaybackLocation:analyticsReporter:", 2, v26);
      -[SXVideoComponentView setAnalyticsRouter:](self, "setAnalyticsRouter:", v28);

    }
    if ((objc_msgSend((id)v40[5], "expectVideoPlayerViewController") & 1) == 0)
      -[SXVideoComponentView showPosterFrame](self, "showPosterFrame");
    objc_destroyWeak(&v33);
    _Block_object_dispose(&v39, 8);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

LABEL_4:
}

void __38__SXVideoComponentView_loadComponent___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  SXComponentVisiblePercentageProvider *v6;
  void *v7;
  SXComponentVisiblePercentageProvider *v8;
  SXVideoComponentVisibilityMonitor *v9;
  id v10;
  SXVideoComponentVisibilityMonitor *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v14)
    objc_msgSend(WeakRetained, "setupVideoPlayerViewController:", v14);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "shouldAutoplay"))
    objc_msgSend(v14, "playWithButtonTapped:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "visibilityMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [SXComponentVisiblePercentageProvider alloc];
    objc_msgSend(v4, "viewport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SXComponentVisiblePercentageProvider initWithViewport:](v6, "initWithViewport:", v7);

    v9 = [SXVideoComponentVisibilityMonitor alloc];
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = -[SXVisibilityMonitor initWithObject:visiblePercentageProvider:](v9, "initWithObject:visiblePercentageProvider:", v10, v8);

    -[SXVisibilityMonitor updateVisibility](v11, "updateVisibility");
    objc_msgSend(v4, "scrollObserverManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addScrollObserver:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "visibilityMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVisibilityMonitor:", v11);

  }
}

void __38__SXVideoComponentView_loadComponent___block_invoke_2(uint64_t a1)
{
  void *v1;
  SXComponentBookmark *v2;
  void *v3;
  void *v4;
  SXComponentBookmark *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "transitionViewIsVisible") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "bookmarkManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = [SXComponentBookmark alloc];
    objc_msgSend(WeakRetained, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SXComponentBookmark initWithComponentIdentifier:](v2, "initWithComponentIdentifier:", v4);
    objc_msgSend(v1, "applyBookmark:", v5);

  }
}

void __38__SXVideoComponentView_loadComponent___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "videoPlayerViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");

  objc_msgSend(WeakRetained, "unloadVideoPlayerIfShowingAd");
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXVideoComponentView;
  -[SXComponentView presentComponentWithChanges:](&v11, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[SXVideoComponentView presentationBlock](self, "presentationBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXVideoComponentView presentationBlock](self, "presentationBlock");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    -[SXVideoComponentView setPresentationBlock:](self, "setPresentationBlock:", 0);
  }
}

- (void)renderContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXVideoComponentView;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  -[SXVideoComponentView loadPosterFrameImage](self, "loadPosterFrameImage");
}

- (void)discardContents
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXVideoComponentView;
  -[SXComponentView discardContents](&v12, sel_discardContents);
  -[SXVideoComponentView thumbnailRequestCancelHandler](self, "thumbnailRequestCancelHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXVideoComponentView thumbnailRequestCancelHandler](self, "thumbnailRequestCancelHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[SXVideoComponentView setThumbnailRequestCancelHandler:](self, "setThumbnailRequestCancelHandler:", 0);
  }
  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPlaying");

  if ((v7 & 1) == 0)
  {
    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willMoveToParentViewController:", 0);

    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromParentViewController");

    -[SXVideoComponentView setVideoPlayerViewController:](self, "setVideoPlayerViewController:", 0);
    -[SXVideoComponentView showPosterFrame](self, "showPosterFrame");
  }
}

- (void)showPosterFrame
{
  void *v3;
  SXPosterFrameView *v4;
  void *v5;
  SXPosterFrameView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [SXPosterFrameView alloc];
    -[SXComponentView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[SXPosterFrameView initWithFrame:](v4, "initWithFrame:");
    -[SXVideoComponentView setPosterFrame:](self, "setPosterFrame:", v6);

    -[SXVideoComponentView posterFrame](self, "posterFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_playButtonTapped, 64);

    v9 = -[SWReachabilityProvider isNetworkReachable](self->_reachabilityProvider, "isNetworkReachable");
    -[SXVideoComponentView posterFrame](self, "posterFrame");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", v9);

  }
  -[SXComponentView contentView](self, "contentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

}

- (void)loadPosterFrameImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SXImageRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  SXImageRequest *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stillImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageResourceForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v6, "dimensions");
  v14 = v9 / v12;
  v15 = v11 / v13;
  if (v11 / v13 >= v9 / v12)
  {
    if (v14 < v15)
      v11 = v13 * v14;
  }
  else
  {
    v9 = v12 * v15;
  }
  objc_initWeak(&location, self);
  v16 = [SXImageRequest alloc];
  -[SXComponentView component](self, "component");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stillImageIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __44__SXVideoComponentView_loadPosterFrameImage__block_invoke;
  v26 = &unk_24D687758;
  objc_copyWeak(&v27, &location);
  v20 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v16, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v18, 4, v19, 1, &v23, v9, v11);

  -[SXVideoComponentView resourceDataSource](self, "resourceDataSource", v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "loadImagesForImageRequest:completionBlock:", v20, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentView setThumbnailRequestCancelHandler:](self, "setThumbnailRequestCancelHandler:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __44__SXVideoComponentView_loadPosterFrameImage__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(WeakRetained, "visibilityState") == 1 && objc_msgSend(WeakRetained, "presentationState") == 2;
  objc_msgSend(WeakRetained, "posterFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImage:animated:", v6, v4);
  objc_msgSend(WeakRetained, "setThumbnailRequestCancelHandler:", 0);

}

- (void)playButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BE90770]);
  -[SXVideoComponentView setupVideoPlayerViewController:](self, "setupVideoPlayerViewController:", v5);
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playWithButtonTapped:", 1);

  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)unloadVideoPlayerIfShowingAd
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  SXPosterFrameView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    v4 = objc_msgSend(v3, "mode") == 1;
    v3 = v13;
    if (v4)
    {
      objc_msgSend(v13, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v13;
      if (!v5)
      {
        objc_msgSend(v13, "willUnload");
        objc_msgSend(v13, "willMoveToParentViewController:", 0);
        objc_msgSend(v13, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

        objc_msgSend(v13, "removeFromParentViewController");
        -[SXVideoComponentView setVideoPlayerViewController:](self, "setVideoPlayerViewController:", 0);
        -[SXVideoComponentView posterFrame](self, "posterFrame");
        v7 = (SXPosterFrameView *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          v7 = objc_alloc_init(SXPosterFrameView);
          -[SXVideoComponentView setPosterFrame:](self, "setPosterFrame:", v7);
        }
        -[SXComponentView contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", v7);

        -[SXVideoComponentView posterFrame](self, "posterFrame");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentView contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        objc_msgSend(v9, "setFrame:");

        -[SXPosterFrameView playButton](v7, "playButton");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_playButtonTapped, 64);

        -[SXPosterFrameView image](v7, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          -[SXVideoComponentView loadPosterFrameImage](self, "loadPosterFrameImage");

        v3 = v13;
      }
    }
  }

}

- (void)setupVideoPlayerViewController:(id)a3
{
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

  -[SXVideoComponentView setVideoPlayerViewController:](self, "setVideoPlayerViewController:", a3);
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFullscreenBehavior:", 0);

  -[SXVideoComponentView registerAsMediaPlaybackDelegate](self, "registerAsMediaPlaybackDelegate");
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingContentViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addChildViewController:", v8);

  -[SXComponentView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v11);

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v13, "setFrame:");

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", v16);

}

- (id)videoForVideoPlayerViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXVideoProvider *v8;
  void *v9;
  SXVideoProvider *v10;
  void *v11;

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [SXVideoProvider alloc];
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SXVideoProvider initWithURL:](v8, "initWithURL:", v9);

  -[SXVideoComponentView analyticsRouter](self, "analyticsRouter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoProvider setAnalyticsReporter:](v10, "setAnalyticsReporter:", v11);

  return v10;
}

- (id)videoAdForVideoPlayerViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsPrerollAds");

  if (v6)
  {
    -[SXVideoComponentView prerollAdFactory](self, "prerollAdFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXVideoComponentView analyticsRouter](self, "analyticsRouter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createVideoAdProviderForComponentView:videoPlayerViewController:analyticsReporter:", self, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4
{
  -[SXVideoComponentView registerAsMediaPlaybackDelegate](self, "registerAsMediaPlaybackDelegate", a3, a4);
  -[SXVideoComponentView pausePrerollIfNeeded](self, "pausePrerollIfNeeded");
}

- (BOOL)videoPlayerViewControllerShouldStartPlayback:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = !objc_msgSend(v4, "mode")
    && (-[SXComponentView visibilityState](self, "visibilityState") == 1
     || (-[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "isFullscreenInProgress"),
         v6,
         (v7 & 1) != 0))
    || objc_msgSend(v4, "mode") == 1
    && -[SXVideoComponentView videoPlayerIsMoreThan50PercentVisible](self, "videoPlayerIsMoreThan50PercentVisible");

  return v5;
}

- (void)registerAsMediaPlaybackDelegate
{
  void *v3;
  id v4;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlaybackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v3, self);

}

- (void)pauseMediaPlayback
{
  id v2;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)pauseMediaPlaybackForDisappearance
{
  void *v3;
  char v4;
  id v5;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullscreenInProgress");

  if ((v4 & 1) == 0)
  {
    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pause");

  }
}

- (void)registerForViewportDynamicBoundsChanges
{
  void *v3;

  if (!-[SXVideoComponentView isReceivingViewportDynamicBoundsChanges](self, "isReceivingViewportDynamicBoundsChanges"))
  {
    -[SXComponentView viewport](self, "viewport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addViewportChangeListener:forOptions:", self, 2);

  }
  -[SXVideoComponentView setIsReceivingViewportDynamicBoundsChanges:](self, "setIsReceivingViewportDynamicBoundsChanges:", 1);
}

- (void)unregisterForViewportDynamicBoundsChanges
{
  void *v3;

  if (-[SXVideoComponentView isReceivingViewportDynamicBoundsChanges](self, "isReceivingViewportDynamicBoundsChanges"))
  {
    -[SXComponentView viewport](self, "viewport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeViewportChangeListener:forOptions:", self, 2);

  }
  -[SXVideoComponentView setIsReceivingViewportDynamicBoundsChanges:](self, "setIsReceivingViewportDynamicBoundsChanges:", 0);
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (objc_msgSend((id)-[SXVideoComponentView superclass](self, "superclass"), "instancesRespondToSelector:", sel_viewport_dynamicBoundsDidChangeFromBounds_))
  {
    v10.receiver = self;
    v10.super_class = (Class)SXVideoComponentView;
    -[SXMediaComponentView viewport:dynamicBoundsDidChangeFromBounds:](&v10, sel_viewport_dynamicBoundsDidChangeFromBounds_, v9, x, y, width, height);
  }
  -[SXVideoComponentView pausePrerollIfNeeded](self, "pausePrerollIfNeeded");

}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  void *v5;
  char v6;
  void *v7;

  if (!objc_msgSend(a3, "appearState"))
  {
    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFullscreenInProgress");

    if ((v6 & 1) == 0)
    {
      -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pause");

      -[SXVideoComponentView unloadVideoPlayerIfShowingAd](self, "unloadVideoPlayerIfShowingAd");
    }
  }
}

- (void)viewport:(id)a3 interfaceOrientationChangedFromOrientation:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullscreenVideoPlaybackManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "interfaceOrientation");
  if ((unint64_t)(v7 - 3) > 1)
    -[SXFullscreenVideoPlaybackManager removeCandidate:]((uint64_t)v8, (uint64_t)self);
  else
    -[SXFullscreenVideoPlaybackManager addCandidate:]((uint64_t)v8, (uint64_t)self);

}

- (BOOL)videoPlayerIsMoreThan50PercentVisible
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double Height;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullscreenInProgress");

  if ((v4 & 1) != 0)
    return 1;
  if (-[SXComponentView visibilityState](self, "visibilityState") != 1)
    return 0;
  -[SXComponentView viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dynamicBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v24.origin.x = v15;
  v24.origin.y = v16;
  v24.size.width = v17;
  v24.size.height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v22 = CGRectIntersection(v21, v24);
  Height = CGRectGetHeight(v22);
  -[SXVideoComponentView bounds](self, "bounds");
  v5 = Height > CGRectGetHeight(v23) * 0.5;

  return v5;
}

- (void)pausePrerollIfNeeded
{
  BOOL v3;
  id v4;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "mode") == 1)
  {
    v3 = -[SXVideoComponentView videoPlayerIsMoreThan50PercentVisible](self, "videoPlayerIsMoreThan50PercentVisible");

    if (v3)
      return;
    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");
  }

}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXVideoComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v7, sel_visibilityStateDidChangeFromState_);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    -[SXComponentView viewport](self, "viewport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addViewportChangeListener:forOptions:", self, 64);
LABEL_6:

    return;
  }
  v6 = -[SXComponentView visibilityState](self, "visibilityState");
  if (a3 == 1 && v6 == 2)
  {
    -[SXComponentView viewport](self, "viewport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeViewportChangeListener:forOptions:", self, 64);
    goto LABEL_6;
  }
}

- (BOOL)canEnterFullscreen
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v20;
  char v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  double v29;
  char v30;
  BOOL v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[SXComponentView viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v37.origin.x = v12;
  v37.origin.y = v13;
  v37.size.width = v14;
  v37.size.height = v15;
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v34 = CGRectIntersection(v33, v37);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isPlaying");

  v22 = objc_msgSend(v3, "interfaceOrientation");
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v23 = CGRectGetHeight(v35);
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v24 = CGRectGetHeight(v36);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    v28 = v27 == 0;
  }
  else
  {
    v28 = 1;
  }
  v29 = v24 * 0.1;

  if ((unint64_t)(v22 - 3) < 2)
    v30 = v21;
  else
    v30 = 0;
  if (v23 <= v29)
    v30 = 0;
  v31 = v30 & v28;

  return v31;
}

- (void)enterFullscreen
{
  id v2;

  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enterFullscreenWithCompletionBlock:", 0);

}

- (CGRect)transitionContentFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stillImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageResourceForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v6, "sizeThatFills:", v7, v8);
  v10 = v9;
  v12 = v11;
  -[SXComponentView contentFrame](self, "contentFrame");
  v13 = 0.0;
  v14 = 0.0;
  if (v12 > v15)
  {
    -[SXComponentView contentFrame](self, "contentFrame");
    v14 = (v12 - v16) * -0.5;
  }
  -[SXComponentView contentFrame](self, "contentFrame");
  if (v10 > v17)
  {
    -[SXComponentView contentFrame](self, "contentFrame");
    v13 = (v10 - v18) * -0.5;
  }

  v19 = v13;
  v20 = v14;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stillImageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  void *v4;
  id v5;

  if (a3 == 2)
  {
    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", 0);

    -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromParentViewController");

  }
}

- (unint64_t)analyticsMediaType
{
  return 2;
}

- (unint64_t)analyticsVideoType
{
  return 1;
}

- (void)reachabilityChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (a3 && -[SXComponentView hasRenderedContents](self, "hasRenderedContents"))
  {
    -[SXVideoComponentView posterFrame](self, "posterFrame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[SXVideoComponentView thumbnailRequestCancelHandler](self, "thumbnailRequestCancelHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[SXVideoComponentView loadPosterFrameImage](self, "loadPosterFrameImage");
    }
  }
  -[SXVideoComponentView posterFrame](self, "posterFrame");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

}

- (BOOL)allowHierarchyRemoval
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXVideoComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v6, sel_allowHierarchyRemoval);
  -[SXVideoComponentView videoPlayerViewController](self, "videoPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return !v4 && v3;
}

- (SVVideoPlayerViewController)videoPlayerViewController
{
  return self->_videoPlayerViewController;
}

- (void)setVideoPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerViewController, a3);
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (BOOL)isReceivingViewportDynamicBoundsChanges
{
  return self->_isReceivingViewportDynamicBoundsChanges;
}

- (void)setIsReceivingViewportDynamicBoundsChanges:(BOOL)a3
{
  self->_isReceivingViewportDynamicBoundsChanges = a3;
}

- (SXPosterFrameView)posterFrame
{
  return self->_posterFrame;
}

- (void)setPosterFrame:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrame, a3);
}

- (id)thumbnailRequestCancelHandler
{
  return self->_thumbnailRequestCancelHandler;
}

- (void)setThumbnailRequestCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 936);
}

- (SXVideoAnalyticsRouter)analyticsRouter
{
  return self->_analyticsRouter;
}

- (void)setAnalyticsRouter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsRouter, a3);
}

- (SXVideoComponentAnalyticsReporting)videoComponentAnalyticsReporter
{
  return self->_videoComponentAnalyticsReporter;
}

- (void)setVideoComponentAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_videoComponentAnalyticsReporter, a3);
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXBookmarkManager)bookmarkManager
{
  return self->_bookmarkManager;
}

- (id)presentationBlock
{
  return self->_presentationBlock;
}

- (void)setPresentationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (SXVideoAdProviderFactory)prerollAdFactory
{
  return self->_prerollAdFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerollAdFactory, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_bookmarkManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_videoComponentAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_analyticsRouter, 0);
  objc_storeStrong(&self->_thumbnailRequestCancelHandler, 0);
  objc_storeStrong((id *)&self->_posterFrame, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewController, 0);
}

@end
