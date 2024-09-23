@implementation _TVAppDocumentRequestController

- (_TVAppDocumentRequestController)initWithAppDocument:(id)a3
{
  _TVAppDocumentRequestController *v3;
  TVObservableEventController *v4;
  TVObservableEventController *observableEventController;
  TVTemplateFeaturesManager *v6;
  TVTemplateFeaturesManager *featuresManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVAppDocumentRequestController;
  v3 = -[_TVAppDocumentController initWithAppDocument:](&v9, sel_initWithAppDocument_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(TVObservableEventController);
    observableEventController = v3->_observableEventController;
    v3->_observableEventController = v4;

    v6 = objc_alloc_init(TVTemplateFeaturesManager);
    featuresManager = v3->_featuresManager;
    v3->_featuresManager = v6;

    -[TVTemplateFeaturesManager setDelegate:](v3->_featuresManager, "setDelegate:", v3);
    -[TVTemplateFeaturesManager pushContext:forFeature:](v3->_featuresManager, "pushContext:forFeature:", v3, &unk_2557D1F48);
    v3->_showcaseFactor = NAN;
  }
  return v3;
}

- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3
{
  return -[_TVAppDocumentRequestController initWithDocumentServiceRequest:loadImmediately:](self, "initWithDocumentServiceRequest:loadImmediately:", a3, 1);
}

- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3 loadImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  _TVAppDocumentRequestController *v9;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "appDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_TVAppDocumentRequestController initWithAppDocument:](self, "initWithAppDocument:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentServiceRequest, a3);
    -[IKDocumentServiceRequest setDelegate:](v9->_documentServiceRequest, "setDelegate:", v9);
    if (v4)
    {
      v9->_flags.initialRequestSent = 1;
      -[IKDocumentServiceRequest send](v9->_documentServiceRequest, "send");
    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[TVTemplateFeaturesManager popContext:forFeature:](self->_featuresManager, "popContext:forFeature:", self, &unk_2557D1F48);
  -[_TVAppDocumentRequestController setShowcasingController:](self, "setShowcasingController:", 0);
  -[_TVAppDocumentRequestController setMediaProvider:](self, "setMediaProvider:", 0);
  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController dealloc](&v5, sel_dealloc);
}

- (void)setAppDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController setAppDelegate:](&v6, sel_setAppDelegate_, v4);
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_2557DFFE8) & 1) != 0)
  {
    self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange = objc_opt_respondsToSelector() & 1;
    self->_adrcDelegateFlags.hasDidHideUI = objc_opt_respondsToSelector() & 1;
    self->_adrcDelegateFlags.hasShowcaseFactorDidChange = objc_opt_respondsToSelector() & 1;
    v5 = objc_opt_respondsToSelector();
  }
  else
  {
    v5 = 0;
    *(_WORD *)&self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange = 0;
    self->_adrcDelegateFlags.hasShowcaseFactorDidChange = 0;
  }
  self->_adrcDelegateFlags.hasDidCompleteDocumentCreation = v5 & 1;

}

- (void)setMediaController:(id)a3
{
  TVMediaController **p_mediaController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TVMediaPlaybackManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TVMediaController *v18;

  p_mediaController = &self->_mediaController;
  v18 = (TVMediaController *)a3;
  if (*p_mediaController != v18)
  {
    if (-[_TVAppDocumentRequestController isViewLoaded](self, "isViewLoaded"))
    {
      -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[TVMediaController view](*p_mediaController, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "menuGestureRecognizer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeGestureRecognizer:", v9);

        -[_TVAppDocumentRequestController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "swipeUpGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeGestureRecognizer:", v12);

      }
    }
    -[_TVAppDocumentRequestController setMediaPlaybackManager:](self, "setMediaPlaybackManager:", 0);
    objc_storeStrong((id *)&self->_mediaController, a3);
    if (*p_mediaController)
    {
      -[TVMediaController setDelegate:](*p_mediaController, "setDelegate:", self);
      v13 = -[TVMediaPlaybackManager initWithMediaController:]([TVMediaPlaybackManager alloc], "initWithMediaController:", *p_mediaController);
      -[_TVAppDocumentRequestController setMediaPlaybackManager:](self, "setMediaPlaybackManager:", v13);

      -[TVMediaPlaybackManager setDelegate:](self->_mediaPlaybackManager, "setDelegate:", self);
      if (-[_TVAppDocumentRequestController isViewLoaded](self, "isViewLoaded"))
      {
        -[TVMediaController view](*p_mediaController, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVMediaPlaybackManager menuGestureRecognizer](self->_mediaPlaybackManager, "menuGestureRecognizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addGestureRecognizer:", v15);

        -[_TVAppDocumentRequestController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVMediaPlaybackManager swipeUpGestureRecognizer](self->_mediaPlaybackManager, "swipeUpGestureRecognizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addGestureRecognizer:", v17);

      }
    }
  }

}

- (BOOL)isUIHidden
{
  return self->_flags.shouldHideUI;
}

- (void)setShowcasingController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_showcasingController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_showcasingController);
    objc_msgSend(v5, "removeObserver:forEvent:", self, CFSTR("TVShowcaseFactorDidChangeEvent"));

    v6 = objc_storeWeak((id *)&self->_showcasingController, obj);
    -[_TVAppDocumentRequestController showcaseInset](self, "showcaseInset");
    objc_msgSend(obj, "setShowcaseInset:");

    v7 = objc_loadWeakRetained((id *)&self->_showcasingController);
    objc_msgSend(v7, "addObserver:forEvent:", self, CFSTR("TVShowcaseFactorDidChangeEvent"));

    -[_TVAppDocumentRequestController _updateShowcaseFactor](self, "_updateShowcaseFactor");
  }

}

- (void)setMediaProvider:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_mediaProvider);
    objc_msgSend(v5, "removeObserver:forEvent:", self, CFSTR("TVSelectedMediaInfoDidChangeEvent"));

    v6 = objc_storeWeak((id *)&self->_mediaProvider, obj);
    objc_msgSend(obj, "addObserver:forEvent:", self, CFSTR("TVSelectedMediaInfoDidChangeEvent"));

    -[_TVAppDocumentRequestController _updateMediaInfo](self, "_updateMediaInfo");
  }

}

- (void)sendInitialRequestIfNeeded
{
  id v2;

  if (!self->_flags.initialRequestSent)
  {
    self->_flags.initialRequestSent = 1;
    -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "send");

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController viewDidLoad](&v11, sel_viewDidLoad);
  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVAppDocumentRequestController mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v7);

    -[_TVAppDocumentRequestController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "swipeUpGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v10);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL *p_shouldHideUI;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  if (!self->_flags.initialRequestSent)
  {
    self->_flags.initialRequestSent = 1;
    -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "send");

  }
  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isViewLoaded");

    if (v8)
    {
      -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "shouldHideUI"))
      {
        self->_flags.shouldHideUI = 1;
        p_shouldHideUI = &self->_flags.shouldHideUI;
      }
      else
      {
        -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        self->_flags.shouldHideUI = objc_msgSend(v11, "currentUIMode") == 1;
        p_shouldHideUI = &self->_flags.shouldHideUI;

      }
      -[_TVAppDocumentController templateViewController](self, "templateViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0.0;
      if (!*p_shouldHideUI)
        v15 = 1.0;
      objc_msgSend(v13, "setAlpha:", v15);

    }
  }
  -[_TVAppDocumentRequestController _hostMediaControllerIfPossible](self, "_hostMediaControllerIfPossible");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onAppear");

  -[_TVAppDocumentRequestController _hostMediaControllerIfPossible](self, "_hostMediaControllerIfPossible");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onDisappear");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_TVAppDocumentRequestController;
  -[_TVAppDocumentController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[_TVAppDocumentRequestController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[_TVAppDocumentRequestController swipeUpMessageView](self, "swipeUpMessageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  if (v10 > 0.0)
  {
    v11 = v9;
    v12 = v10;
    objc_msgSend(v8, "setCenter:", v5 * 0.5, v7 * 0.5);
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v11, v12);
    -[_TVAppDocumentRequestController showcaseInset](self, "showcaseInset");
    v14 = v13 <= 0.0;
    v15 = 34.0;
    if (!v14)
      v15 = 64.0;
    v16 = v7 * 0.5 - v15;
    objc_msgSend(v8, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", 0.5, v16 / v12);

    objc_msgSend(v3, "bringSubviewToFront:", v8);
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_flags.shouldHideUI
    && (-[_TVAppDocumentRequestController mediaController](self, "mediaController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[_TVAppDocumentRequestController mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVAppDocumentRequestController;
    -[_TVAppDocumentController preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4
{
  void *v5;

  if (self->_flags.shouldHideUI)
  {
    objc_msgSend(a3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    *a4 = 0;
  }
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v6;
  _BOOL4 v7;
  TVMediaTransitionAnimator *v8;
  TVMediaTransitionAnimator *v9;
  objc_super v11;

  v6 = a4;
  v7 = -[_TVAppDocumentController adoptsContext](self, "adoptsContext");
  if (a3 == 1 && v7)
  {
    v8 = objc_alloc_init(TVMediaTransitionAnimator);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_TVAppDocumentRequestController;
    -[_TVAppDocumentController customAnimatorForNavigationControllerOperation:fromViewController:](&v11, sel_customAnimatorForNavigationControllerOperation_fromViewController_, a3, v6);
    v8 = (TVMediaTransitionAnimator *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v6;
  _BOOL4 v7;
  TVMediaTransitionAnimator *v8;
  TVMediaTransitionAnimator *v9;
  objc_super v11;

  v6 = a4;
  v7 = -[_TVAppDocumentController adoptsContext](self, "adoptsContext");
  if (a3 == 2 && v7)
  {
    v8 = objc_alloc_init(TVMediaTransitionAnimator);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_TVAppDocumentRequestController;
    -[_TVAppDocumentController customAnimatorForNavigationControllerOperation:toViewController:](&v11, sel_customAnimatorForNavigationControllerOperation_toViewController_, a3, v6);
    v8 = (TVMediaTransitionAnimator *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)relinquishOwnership
{
  void *v3;
  _TVAppDocumentRequestController *v4;
  void *v5;

  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentRequestController setMediaController:](self, "setMediaController:", 0);
  if (v3)
  {
    objc_msgSend(v3, "parentViewController");
    v4 = (_TVAppDocumentRequestController *)objc_claimAutoreleasedReturnValue();

    if (v4 == self)
    {
      objc_msgSend(v3, "willMoveToParentViewController:", 0);
      objc_msgSend(v3, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      objc_msgSend(v3, "removeFromParentViewController");
    }
  }
  return v3;
}

- (void)adoptMediaController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setShouldZoomWhenTransitioningToBackground:", 1);
  objc_msgSend(v4, "transitionToForeground:animated:", 0, 1);
  -[_TVAppDocumentRequestController setMediaController:](self, "setMediaController:", v4);

}

- (void)featuresManager:(id)a3 currentContextDidChangeForFeature:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (&unk_2557D3360 == v6)
  {
    -[TVTemplateFeaturesManager currentContextForFeature:](self->_featuresManager, "currentContextForFeature:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppDocumentRequestController setShowcasingController:](self, "setShowcasingController:", v8);
    goto LABEL_5;
  }
  if (&unk_2557BDFC8 == v6)
  {
    -[TVTemplateFeaturesManager currentContextForFeature:](self->_featuresManager, "currentContextForFeature:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppDocumentRequestController setMediaProvider:](self, "setMediaProvider:", v8);
LABEL_5:

  }
}

- (void)coverImageDidChangeForMediaController:(id)a3
{
  id v4;

  -[_TVAppDocumentRequestController observableEventController](self, "observableEventController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchEvent:sender:withUserInfo:", CFSTR("TVMediaPlayingCoverImageDidChangeEvent"), self, 0);

}

- (void)stateDidChangeForMediaController:(id)a3
{
  void *v4;
  id v5;

  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onMediaControllerStateDidChange");

  -[_TVAppDocumentRequestController observableEventController](self, "observableEventController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchEvent:sender:withUserInfo:", CFSTR("TVMediaPlayingStateDidChangeEvent"), self, 0);

}

- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  void (**v20)(_QWORD, _QWORD);
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  BOOL v25;
  _QWORD v26[5];
  BOOL v27;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isViewLoaded");

  if ((v16 & 1) != 0)
  {
    if (objc_msgSend(v12, "currentUIMode") == 1)
    {
      -[_TVAppDocumentRequestController shouldHideSupplementaryUI:animated:completion:](self, "shouldHideSupplementaryUI:animated:completion:", v10, v9, v14);
    }
    else if (self->_flags.shouldHideUI != v10)
    {
      self->_flags.shouldHideUI = v10;
      v17 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke;
      v26[3] = &unk_24EB852F8;
      v27 = v10;
      v26[4] = self;
      v18 = (void (**)(_QWORD))MEMORY[0x22767F470](v26);
      v23[0] = v17;
      v23[1] = 3221225472;
      v23[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_2;
      v23[3] = &unk_24EB86B10;
      v25 = v10;
      v23[4] = self;
      v24 = v13;
      v19 = (void (**)(_QWORD))MEMORY[0x22767F470](v23);
      v21[0] = v17;
      v21[1] = 3221225472;
      v21[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_3;
      v21[3] = &unk_24EB882F8;
      v21[4] = self;
      v22 = v14;
      v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v21);
      if (v9)
      {
        v18[2](v18);
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v19, v20, 0.25, 0.0);
      }
      else
      {
        v19[2](v19);
        v20[2](v20, 1);
      }

    }
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

}

- (void)evaluateSwipeUpMessageForMediaPlaybackManager:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[_TVAppDocumentRequestController swipeUpMessageView](self, "swipeUpMessageView", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 4
    || (-[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "swipeUpGestureRecognizer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEnabled"),
        v7,
        v6,
        !v8))
  {
    objc_msgSend(v14, "setEnabled:", 0);
  }
  else
  {
    if (!v14)
    {
      v14 = (id)objc_opt_new();
      _TVMLLocString(CFSTR("TVMediaPlaybackSwipeUpMessage"), CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMessage:", v9);

      objc_msgSend(MEMORY[0x24BDF6950], "tv_opacityColorForType:userInterfaceStyle:", 1, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v10);

      -[_TVAppDocumentRequestController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v14);

      -[_TVAppDocumentRequestController setSwipeUpMessageView:](self, "setSwipeUpMessageView:", v14);
    }
    -[_TVAppDocumentRequestController mediaController](self, "mediaController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v13, "intent") == 0);

  }
}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_TVAppDocumentRequestController observableEventController](self, "observableEventController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forEvent:", v7, v6);

}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_TVAppDocumentRequestController observableEventController](self, "observableEventController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forEvent:", v7, v6);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_TVAppDocumentRequestController observableEventController](self, "observableEventController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v8 = a4;
  v9 = a5;
  if (CFSTR("TVSelectedMediaInfoDidChangeEvent") == v10)
  {
    -[_TVAppDocumentRequestController _updateMediaInfo](self, "_updateMediaInfo");
  }
  else if (CFSTR("TVShowcaseFactorDidChangeEvent") == v10)
  {
    -[_TVAppDocumentRequestController _updateShowcaseFactor](self, "_updateShowcaseFactor");
  }

}

- (UIImage)coverImage
{
  void *v2;
  void *v3;

  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)isPlaying
{
  void *v2;
  uint64_t v3;

  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return (unint64_t)(v3 - 2) < 3;
}

- (void)serviceRequest:(id)a3 didCompleteWithStatus:(int64_t)a4 errorDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v14)
  {
    objc_msgSend(v14, "setDelegate:", 0);
    if (self->_adrcDelegateFlags.hasDidCompleteDocumentCreation)
    {
      -[_TVAppDocumentController appDelegate](self, "appDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appDocumentController:didCompleteDocumentCreationWithStatus:errorDictionary:", self, a4, v8);

    }
    -[_TVAppDocumentRequestController didCompleteDocumentCreationWithStatus:errorDictionary:](self, "didCompleteDocumentCreationWithStatus:errorDictionary:", a4, v8);
  }
  else
  {
    -[_TVAppDocumentRequestController updateServiceRequest](self, "updateServiceRequest");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v14)
    {
      objc_msgSend(v14, "setDelegate:", 0);
      -[_TVAppDocumentRequestController setUpdateServiceRequest:](self, "setUpdateServiceRequest:", 0);
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVDocumentErrorDomain"), a4 != 1, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVDocumentViewController didFailUpdateWithError:](self, "didFailUpdateWithError:", v11);
      }
      else
      {
        objc_msgSend(v14, "serviceContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contextDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVDocumentViewController didUpdateWithContext:](self, "didUpdateWithContext:", v13);

      }
    }
  }

}

- (void)documentDidChangeForDocumentServiceRequest:(id)a3
{
  void *v4;
  id v5;

  -[_TVAppDocumentRequestController documentServiceRequest](self, "documentServiceRequest", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController replaceAppDocumentWithAppDocument:](self, "replaceAppDocumentWithAppDocument:", v4);

}

- (BOOL)tv_handleEventForDocument:(id)a3 eventName:(id)a4 targetResponder:(id)a5 viewElement:(id)a6 extraInfo:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "onEvent");

  objc_msgSend(v13, "tv_associatedViewElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TVDocumentViewController handleEvent:withElement:targetResponder:](self, "handleEvent:withElement:targetResponder:", v11, v15, v12);

  v17 = v16
     || -[_TVAppDocumentRequestController handleEvent:targetResponder:viewElement:extraInfo:](self, "handleEvent:targetResponder:viewElement:extraInfo:", v11, v12, v13, a7);

  return v17;
}

- (void)didChangeDocumentContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[TVDocumentViewController documentContext](self, "documentContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentRequestController updateServiceRequest](self, "updateServiceRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVAppDocumentRequestController updateServiceRequest](self, "updateServiceRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[_TVAppDocumentRequestController updateServiceRequest](self, "updateServiceRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
  v6 = objc_alloc(MEMORY[0x24BE519E0]);
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templateElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithContextDictionary:element:", v14, v8);

  v10 = objc_alloc(MEMORY[0x24BE51A20]);
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithAppContext:serviceContext:", v12, v9);

  objc_msgSend(v13, "setDelegate:", self);
  -[_TVAppDocumentRequestController setUpdateServiceRequest:](self, "setUpdateServiceRequest:", v13);
  objc_msgSend(v13, "send");

}

- (BOOL)automaticallyProvidesMediaController
{
  return 1;
}

- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6
{
  return 0;
}

- (id)interactionPreviewControllerForViewController:(id)a3 presentingView:(id)a4 presentingElement:(id)a5
{
  return 0;
}

- (void)_hostMediaControllerIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = v3;
    objc_msgSend(v3, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v14;
    if (!v4)
    {
      if (objc_msgSend(v14, "isViewLoaded"))
      {
        objc_msgSend(v14, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVAppDocumentRequestController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

        if ((v8 & 1) == 0)
        {
          objc_msgSend(v14, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeFromSuperview");

        }
      }
      -[_TVAppDocumentRequestController addChildViewController:](self, "addChildViewController:", v14);
      objc_msgSend(v14, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentRequestController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v10, "setFrame:");

      -[_TVAppDocumentRequestController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:atIndex:", v13, 0);

      objc_msgSend(v14, "didMoveToParentViewController:", self);
      v3 = v14;
    }
  }

}

- (id)_hostingFocusEnvironment
{
  void *v3;
  void *v4;
  _TVAppDocumentRequestController *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  -[_TVAppDocumentRequestController mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = self;
  v6 = v5;
  if (v4 && v5)
  {
    do
    {
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isDescendantOfView:", v7);

      if ((v8 & 1) != 0)
        break;
      objc_msgSend(v6, "parentViewController");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    while (v9);
  }

  return v6;
}

- (void)_updateMediaInfo
{
  void *v3;
  TVMediaInfo *v4;
  TVMediaInfo *selectedMediaInfo;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  TVMediaInfo *obj;

  -[_TVAppDocumentRequestController mediaProvider](self, "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedMediaInfo");
  obj = (TVMediaInfo *)objc_claimAutoreleasedReturnValue();

  v4 = obj;
  selectedMediaInfo = self->_selectedMediaInfo;
  if (selectedMediaInfo != obj)
  {
    v6 = -[TVMediaInfo isEqual:](selectedMediaInfo, "isEqual:", obj);
    v4 = obj;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_selectedMediaInfo, obj);
      -[_TVAppDocumentRequestController showcaseFactor](self, "showcaseFactor");
      -[_TVAppDocumentRequestController mediaController](self, "mediaController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentRequestController selectedMediaInfo](self, "selectedMediaInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMediaInfo:", v8);

      -[_TVAppDocumentRequestController mediaInfoDidChange](self, "mediaInfoDidChange");
      v4 = obj;
      if (self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange)
      {
        -[_TVAppDocumentController appDelegate](self, "appDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectedMediaInfoDidChangeForAppDocumentController:", self);

        v4 = obj;
      }
    }
  }

}

- (void)_updateShowcaseFactor
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  if (self->_flags.shouldHideUI)
  {
    v3 = NAN;
  }
  else
  {
    -[_TVAppDocumentRequestController showcasingController](self, "showcasingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showcaseFactor");
    v3 = v5;

  }
  if (self->_showcaseFactor != v3)
  {
    self->_showcaseFactor = v3;
    -[_TVAppDocumentRequestController showcaseFactor](self, "showcaseFactor");
    -[_TVAppDocumentRequestController mediaPlaybackManager](self, "mediaPlaybackManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppDocumentRequestController showcaseFactor](self, "showcaseFactor");
    objc_msgSend(v6, "setShowcaseFactor:");

    -[_TVAppDocumentRequestController showcaseFactorDidChange](self, "showcaseFactorDidChange");
    if (self->_adrcDelegateFlags.hasShowcaseFactorDidChange)
    {
      -[_TVAppDocumentController appDelegate](self, "appDelegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showcaseFactorDidChangeForAppDocumentController:", self);

    }
  }
}

- (IKDocumentServiceRequest)documentServiceRequest
{
  return self->_documentServiceRequest;
}

- (TVMediaController)mediaController
{
  return self->_mediaController;
}

- (TVMediaPlaybackManager)mediaPlaybackManager
{
  return self->_mediaPlaybackManager;
}

- (void)setMediaPlaybackManager:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlaybackManager, a3);
}

- (TVMediaInfo)selectedMediaInfo
{
  return self->_selectedMediaInfo;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (double)showcaseInset
{
  return self->_showcaseInset;
}

- (void)setShowcaseInset:(double)a3
{
  self->_showcaseInset = a3;
}

- (TVTemplateFeaturesManager)featuresManager
{
  return self->_featuresManager;
}

- (TVShowcasing)showcasingController
{
  return (TVShowcasing *)objc_loadWeakRetained((id *)&self->_showcasingController);
}

- (TVMediaProviding)mediaProvider
{
  return (TVMediaProviding *)objc_loadWeakRetained((id *)&self->_mediaProvider);
}

- (_TVSwipeUpMessageView)swipeUpMessageView
{
  return self->_swipeUpMessageView;
}

- (void)setSwipeUpMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_swipeUpMessageView, a3);
}

- (TVObservableEventController)observableEventController
{
  return self->_observableEventController;
}

- (void)setObservableEventController:(id)a3
{
  objc_storeStrong((id *)&self->_observableEventController, a3);
}

- (IKUpdateServiceRequest)updateServiceRequest
{
  return self->_updateServiceRequest;
}

- (void)setUpdateServiceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_updateServiceRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateServiceRequest, 0);
  objc_storeStrong((id *)&self->_observableEventController, 0);
  objc_storeStrong((id *)&self->_swipeUpMessageView, 0);
  objc_destroyWeak((id *)&self->_mediaProvider);
  objc_destroyWeak((id *)&self->_showcasingController);
  objc_storeStrong((id *)&self->_featuresManager, 0);
  objc_storeStrong((id *)&self->_selectedMediaInfo, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackManager, 0);
  objc_storeStrong((id *)&self->_mediaController, 0);
  objc_storeStrong((id *)&self->_documentServiceRequest, 0);
}

@end
