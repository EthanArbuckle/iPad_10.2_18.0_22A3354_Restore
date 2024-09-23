@implementation PGPictureInPictureViewController

- (PGPictureInPictureViewController)initWithApplication:(id)a3 sourceSceneSessionPersistentIdentifier:(id)a4 controlsStyle:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PGPictureInPictureViewController *v11;
  PGPictureInPictureViewController *v12;
  PGControlsViewModel *v13;
  PGControlsViewModel *viewModel;
  PGControlsContainerView *v15;
  uint64_t v16;
  PGControlsContainerView *controlsContainerView;
  PGControlsContainerView *v18;
  uint64_t v19;
  PGMobilePIPSettings *settings;
  double v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, int);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  PGLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureViewController initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:].cold.1();

  v29.receiver = self;
  v29.super_class = (Class)PGPictureInPictureViewController;
  v11 = -[PGPictureInPictureViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_stashTabHidden = 1;
    v11->_canStartShowingChrome = 1;
    v11->_controlsStyle = a5;
    v13 = objc_alloc_init(PGControlsViewModel);
    viewModel = v12->_viewModel;
    v12->_viewModel = v13;

    objc_storeWeak((id *)&v12->_application, v8);
    objc_storeStrong((id *)&v12->_sourceSceneSessionPersistentIdentifier, a4);
    v12->_shouldDisablePointerInteraction = 0;
    if ((unint64_t)(a5 - 1) <= 3)
    {
      v15 = [PGControlsContainerView alloc];
      v16 = -[PGControlsContainerView initWithFrame:viewModel:](v15, "initWithFrame:viewModel:", v12->_viewModel, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      controlsContainerView = v12->_controlsContainerView;
      v12->_controlsContainerView = (PGControlsContainerView *)v16;

      -[PGControlsContainerView setControlsContainerHidden:animated:](v12->_controlsContainerView, "setControlsContainerHidden:animated:", 1, 0);
      -[PGControlsContainerView setCommandHandler:](v12->_controlsContainerView, "setCommandHandler:", v12);
      objc_initWeak(&location, v12);
      v18 = v12->_controlsContainerView;
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __109__PGPictureInPictureViewController_initWithApplication_sourceSceneSessionPersistentIdentifier_controlsStyle___block_invoke;
      v26 = &unk_1E6230458;
      objc_copyWeak(&v27, &location);
      -[PGControlsContainerView setCoordinatedAnimationsForControlsVisibiity:](v18, "setCoordinatedAnimationsForControlsVisibiity:", &v23);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    -[PGPictureInPictureViewController setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("PG-PictureInPictureViewController"), v23, v24, v25, v26);
    +[PGMobilePIPSettingsDomain rootSettings](PGMobilePIPSettingsDomain, "rootSettings");
    v19 = objc_claimAutoreleasedReturnValue();
    settings = v12->_settings;
    v12->_settings = (PGMobilePIPSettings *)v19;

    -[PTSettings addKeyPathObserver:](v12->_settings, "addKeyPathObserver:", v12);
    objc_msgSend((id)objc_opt_class(), "defaultContentCornerRadius");
    v12->_currentContentCornerRadius = v21;
  }

  return v12;
}

void __109__PGPictureInPictureViewController_initWithApplication_sourceSceneSessionPersistentIdentifier_controlsStyle___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v4;
  double v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 143);
    if (objc_msgSend(v4, "pictureInPictureViewControllerShouldHideTetheredViewControllerAlongsideControls:", v8) ^ 1 | a2)v5 = 1.0;
    else
      v5 = 0.0;

    v6 = objc_loadWeakRetained(v8 + 153);
    objc_msgSend(v6, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v5);

    WeakRetained = v8;
  }

}

- (PGPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  _PGLogMethodProem(self, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithControlsStyle:]."), v7, v9);

  return -[PGPictureInPictureViewController initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:](self, "initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:", 0, 0, 0);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureController init].cold.1();

  if (-[PGPictureInPictureViewController prefersIdleTimerDisabled](self, "prefersIdleTimerDisabled"))
  {
    self->_prefersIdleTimerDisabled = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("PGPictureInPictureViewControllerPrefersIdleTimerDisabledDidChangeNotification"), 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)PGPictureInPictureViewController;
  -[PGPictureInPictureViewController dealloc](&v5, sel_dealloc);
}

- (PGPictureInPictureViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v7);

  return -[PGPictureInPictureViewController initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:](self, "initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:", 0, 0, 0);
}

- (int64_t)contentType
{
  void *v2;
  int64_t v3;

  -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentType");

  return v3;
}

- (void)setStashed:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *stashedTapGestureRecognizer;
  void *v8;
  id WeakRetained;
  id v10;

  if (self->_stashed != a3)
  {
    v3 = a3;
    self->_stashed = a3;
    v5 = 0.0;
    if (a3)
      v5 = 1.0;
    -[PGPictureInPictureViewController setStashProgress:](self, "setStashProgress:", v5);
    if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (v3)
      {
        v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapWhileStashedGestureRecognizer_);
        stashedTapGestureRecognizer = self->_stashedTapGestureRecognizer;
        self->_stashedTapGestureRecognizer = v6;

        -[PGPictureInPictureViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addGestureRecognizer:", self->_stashedTapGestureRecognizer);
      }
      else
      {
        -[PGPictureInPictureViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeGestureRecognizer:", self->_stashedTapGestureRecognizer);
      }

      -[PGPictureInPictureViewController _updatePrefersIdleTimerDisabled](self, "_updatePrefersIdleTimerDisabled");
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pictureInPictureViewController:didTransitionToStashed:", self, v3);

    v10 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    objc_msgSend(v10, "pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:stashed:", self->_analyticsSessionUUID, v3);

  }
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return self->_hostedWindowHostingHandle;
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  PGHostedWindowHostingHandle **p_hostedWindowHostingHandle;
  PGHostedWindowHostingHandle *v6;
  PGHostedWindowHostingHandle *v7;
  PGHostedWindowHostingHandle *v8;
  PGHostedWindowHostingHandle *v9;

  p_hostedWindowHostingHandle = &self->_hostedWindowHostingHandle;
  v6 = (PGHostedWindowHostingHandle *)a3;
  v9 = v6;
  if (*p_hostedWindowHostingHandle != v6)
  {
    objc_storeStrong((id *)&self->_hostedWindowHostingHandle, a3);
    v6 = *p_hostedWindowHostingHandle;
  }
  -[PGLayerHostView hostedWindowHostingHandle](self->_contentView, "hostedWindowHostingHandle");
  v7 = (PGHostedWindowHostingHandle *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v6 != v7)
  {
    -[PGLayerHostView setHostedWindowHostingHandle:](self->_contentView, "setHostedWindowHostingHandle:", v9);
    v8 = v9;
  }

}

- (void)setSceneView:(id)a3
{
  void *v5;
  UIView *v6;

  v6 = (UIView *)a3;
  if (self->_sceneView != v6)
  {
    objc_storeStrong((id *)&self->_sceneView, a3);
    -[UIView layer](v6, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    -[PGLayerHostView setSceneView:](self->_contentView, "setSceneView:", v6);
  }

}

- (void)setContentContainer:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_contentContainer);

    if (v6)
      *(_BYTE *)&self->_contentContainerRespondsTo &= 0xC0u;
    objc_storeWeak((id *)&self->_contentContainer, obj);
    -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isRoutingVideoToHostedWindow"))
    {
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
        objc_msgSend(obj, "playbackSourceDidUpdateIsRoutingVideoToHostedWindow:", 1);
    }
    else
    {

    }
    v9 = objc_loadWeakRetained((id *)&self->_contentContainer);

    v5 = obj;
    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_contentContainer);
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

      v11 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 2;
      else
        v12 = 0;
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xFD | v12;

      v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 4;
      else
        v14 = 0;
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xFB | v14;

      v15 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 8;
      else
        v16 = 0;
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xF7 | v16;

      v17 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 16;
      else
        v18 = 0;
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xEF | v18;

      v19 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = 32;
      else
        v20 = 0;
      *(_BYTE *)&self->_contentContainerRespondsTo = *(_BYTE *)&self->_contentContainerRespondsTo & 0xDF | v20;

      v5 = obj;
    }
  }

}

- (void)setCanStartShowingChrome:(BOOL)a3
{
  void (**waitForUIFinalizationCompletionBlock)(id, SEL);
  id v6;

  if (self->_canStartShowingChrome == a3)
  {
    if (!a3)
      return;
  }
  else
  {
    if (!a3)
    {
      -[PGPictureInPictureViewController setStashed:](self, "setStashed:", 0);
      -[PGPictureInPictureViewController showChrome:animated:](self, "showChrome:animated:", 0, 0);
      self->_canStartShowingChrome = a3;
      return;
    }
    self->_canStartShowingChrome = a3;
    waitForUIFinalizationCompletionBlock = (void (**)(id, SEL))self->_waitForUIFinalizationCompletionBlock;
    if (waitForUIFinalizationCompletionBlock)
    {
      waitForUIFinalizationCompletionBlock[2](waitForUIFinalizationCompletionBlock, a2);
      v6 = self->_waitForUIFinalizationCompletionBlock;
      self->_waitForUIFinalizationCompletionBlock = 0;

    }
  }
  if (!self->_waitForUIFinalizationCompletionBlock)
    -[PGPictureInPictureViewController _insertContentContainerViewIfNeeded](self, "_insertContentContainerViewIfNeeded");
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    -[PGControlsContainerView setInteractivelyResizing:](self->_controlsContainerView, "setInteractivelyResizing:");
    -[PGPictureInPictureViewController _resetStashTabViewsIfPossible](self, "_resetStashTabViewsIfPossible");
    -[PGPictureInPictureViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[PGPictureInPictureViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)setAnalyticsDelegate:(id)a3 analyticsSourceUUID:(id)a4
{
  NSUUID *v6;
  NSUUID *analyticsSourceUUID;
  id obj;

  obj = a3;
  v6 = (NSUUID *)objc_msgSend(a4, "copy");
  analyticsSourceUUID = self->_analyticsSourceUUID;
  self->_analyticsSourceUUID = v6;

  objc_storeWeak((id *)&self->_analyticsDelegate, obj);
}

- (void)notePictureInPictureStartedAutomatically:(BOOL)a3
{
  self->_startedAutomatically = a3;
}

- (void)notePictureInPictureWillStopForAppRequest:(BOOL)a3 preferredFullScreenRestore:(BOOL)a4
{
  _BOOL8 v5;
  _BOOL8 v6;
  id WeakRetained;
  id v8;

  if (self->_analyticsSessionUUID && self->_analyticsSourceUUID)
  {
    v5 = a4;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    objc_msgSend(WeakRetained, "pictureInPictureDidDeactivateAnalyticsSessionWithUUID:analyticsSourceUUID:appStoppedSession:restoredFullScreen:", self->_analyticsSessionUUID, self->_analyticsSourceUUID, v6, v5);

    v8 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    objc_msgSend(v8, "pictureInPictureDidDestroyAnalyticsSessionWithUUID:", self->_analyticsSessionUUID);

  }
  objc_storeWeak((id *)&self->_analyticsDelegate, 0);
}

- (void)deactivateAnalyticsSessionIfNeeded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  if (WeakRetained)
    -[PGPictureInPictureViewController notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:](self, "notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:", 0, 0);
}

- (BOOL)prefersIdleTimerDisabled
{
  return self->_prefersIdleTimerDisabled;
}

- (PGControlsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(WeakRetained, "setMinimumStashTabSize:", width, height);

      -[PGStashView setStashedTabWidth:](self->_stashView, "setStashedTabWidth:", width);
    }
  }
}

- (void)flashControls
{
  -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", 0, 1);
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  PGPictureInPicturePagingAccessoryViewController *v7;
  PGPictureInPicturePagingAccessoryViewController *pagingAccessoryViewController;

  if (a4 >= 2 && !self->_pagingAccessoryViewController)
  {
    v7 = objc_alloc_init(PGPictureInPicturePagingAccessoryViewController);
    pagingAccessoryViewController = self->_pagingAccessoryViewController;
    self->_pagingAccessoryViewController = v7;

  }
  -[PGPictureInPicturePagingAccessoryViewController setCurrentPage:numberOfPages:](self->_pagingAccessoryViewController, "setCurrentPage:numberOfPages:", a3, a4);
}

+ (double)defaultContentCornerRadius
{
  return 15.0;
}

+ (void)tetherViewController:(id)a3 toViewController:(id)a4 mode:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setTetheredViewController:mode:", v8, a5);
  objc_msgSend(v8, "setTetheringViewController:mode:", v7, a5);

}

- (void)setTetheredViewController:(id)a3 mode:(int64_t)a4
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredViewController);

  if (WeakRetained != obj)
    objc_storeWeak((id *)&self->_tetheredViewController, obj);
  if (self->_tetheringMode != a4)
    self->_tetheringMode = a4;
  -[PGPictureInPictureViewController _noteTetheringDidUpdate](self, "_noteTetheringDidUpdate");

}

- (void)setTetheringViewController:(id)a3 mode:(int64_t)a4
{
  id WeakRetained;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);

  if (WeakRetained != obj)
    objc_storeWeak((id *)&self->_tetheringViewController, obj);
  if (self->_tetheringMode != a4)
    self->_tetheringMode = a4;
  -[PGPictureInPictureViewController _noteTetheringDidUpdate](self, "_noteTetheringDidUpdate");
  v7 = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  objc_msgSend(v7, "invalidate");

}

- (void)_noteTetheringDidUpdate
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  -[PGPictureInPictureViewController _updateCornerRadii](self, "_updateCornerRadii");
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);

  if (!WeakRetained)
  {
    -[PGPictureInPictureViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

  }
  v6 = objc_loadWeakRetained((id *)&self->_contentContainer);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(v9, "notePictureInPictureViewControllerTetheringDidUpdate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_contentContainer);

  }
}

- (void)showChrome:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSObject *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  BOOL v15;

  v4 = a4;
  v5 = a3;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  self->_isShowingChrome = v5;
  if (!v5 || self->_canStartShowingChrome)
  {
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__PGPictureInPictureViewController_showChrome_animated___block_invoke;
    v14[3] = &unk_1E622FC80;
    v14[4] = self;
    v15 = v5;
    v9 = (void (**)(_QWORD))MEMORY[0x1B5E0FE80](v14);
    v10 = v9;
    if (v4)
    {
      v11 = (void *)MEMORY[0x1E0CEABB0];
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __56__PGPictureInPictureViewController_showChrome_animated___block_invoke_2;
      v12[3] = &unk_1E62300A8;
      v13 = v9;
      objc_msgSend(v11, "PG_animateUsingDefaultTimingWithAnimations:completion:", v12, 0);

    }
    else
    {
      v9[2](v9);
    }
    -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", !v5, v4);

  }
}

uint64_t __56__PGPictureInPictureViewController_showChrome_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadShadowViewIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_loadTabShadowViewIfNeeded");
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 0.0;
  if (!*(_BYTE *)(v4 + 1194))
  {
    v5 = 1.0;
    if (!*(_BYTE *)(a1 + 40))
      v5 = 0.0;
  }
  objc_msgSend(*(id *)(v4 + 1024), "setAlpha:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadii");
}

uint64_t __56__PGPictureInPictureViewController_showChrome_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)currentContentCornerRadius
{
  if (self->_isShowingChrome)
    return self->_currentContentCornerRadius;
  else
    return 0.0;
}

- (void)setContentCornerRadius:(double)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_currentContentCornerRadius != a3)
  {
    self->_currentContentCornerRadius = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __68__PGPictureInPictureViewController_setContentCornerRadius_animated___block_invoke;
      v4[3] = &unk_1E622F8C0;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v4, 0);
    }
    else
    {
      -[PGPictureInPictureViewController _updateCornerRadii](self, "_updateCornerRadii");
    }
  }
}

uint64_t __68__PGPictureInPictureViewController_setContentCornerRadius_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadii");
}

- (void)_updateCornerRadii
{
  double v3;
  double v4;
  id WeakRetained;

  -[PGPictureInPictureViewController currentContentCornerRadius](self, "currentContentCornerRadius");
  v4 = v3;
  -[PGPictureInPictureViewControllerClippingView _setContinuousCornerRadius:](self->_contentClippingView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:", v4);
  -[PGPictureInPictureViewControllerBackgroundView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v4);
  -[PGControlsContainerView _setContinuousCornerRadius:](self->_controlsContainerView, "_setContinuousCornerRadius:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  objc_msgSend(WeakRetained, "_setContinuousCornerRadius:", v4);

  -[PGStashView _setContinuousCornerRadius:](self->_stashView, "_setContinuousCornerRadius:", v4);
}

+ (void)animateViewWithAnimationType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[3];
  _QWORD v17[4];
  _QWORD v18[3];

  v10 = a5;
  v11 = a6;
  if (a3 == 1)
  {
    v14 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke_2;
    v15[3] = &unk_1E6230480;
    v16[1] = a1;
    *(double *)&v16[2] = a4;
    v13 = (id *)v16;
    v16[0] = v10;
    objc_msgSend(v14, "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v15, v11, a4);
    goto LABEL_5;
  }
  if (!a3)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke;
    v17[3] = &unk_1E6230480;
    v18[1] = a1;
    v18[2] = 0;
    v13 = (id *)v18;
    v18[0] = v10;
    objc_msgSend(v12, "PG_animateUsingDefaultTimingWithAnimations:completion:", v17, v11);
LABEL_5:

  }
}

void __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v2, "PGPictureInPictureViewController.AnimationType", v3, (void *)1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_setAssociatedObject(*(id *)(a1 + 40), "PGPictureInPictureViewController.AnimationType", 0, (void *)1);
}

void __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v2, "PGPictureInPictureViewController.InitialSpringVelocity", v3, (void *)1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_setAssociatedObject(*(id *)(a1 + 40), "PGPictureInPictureViewController.InitialSpringVelocity", 0, (void *)1);
}

- (void)updateHostedWindowSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_class();
  objc_getAssociatedObject(v6, "PGPictureInPictureViewController.InitialSpringVelocity");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    v8 = v7;
    v9 = 2;
  }
  else
  {
    v10 = (void *)objc_opt_class();
    objc_getAssociatedObject(v10, "PGPictureInPictureViewController.AnimationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v11 != 0;
    v8 = 0.0;
  }
  -[PGPictureInPictureViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pictureInPictureViewController:updateHostedWindowSize:animationType:initialSpringVelocity:", self, v9, width, height, v8);

}

- (void)hostedWindowSizeChangeBegan
{
  void *v3;
  id WeakRetained;

  -[PGPictureInPictureViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureViewControllerHostedWindowSizeChangeBegan:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)hostedWindowSizeChangeEnded
{
  void *v3;
  id WeakRetained;

  -[PGPictureInPictureViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureViewControllerHostedWindowSizeChangeEnded:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)setStashProgress:(double)a3
{
  double v6;
  _BOOL4 v7;
  BOOL v8;
  char IsZero;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  _QWORD v16[6];
  _QWORD v17[7];
  char v18;
  _QWORD v19[6];
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PGStashView blurProgress](self->_stashView, "blurProgress");
  v7 = v6 != 0.0 || a3 >= 0.2;
  v8 = v6 == a3 || !v7;
  if (!v8 && -[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
  {
    IsZero = BSFloatIsZero();
    if ((IsZero & 1) == 0 && -[PGStashView isHidden](self->_stashView, "isHidden"))
    {
      PGLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v11;
        v23 = 1024;
        v24 = 608;
        v25 = 2114;
        v26 = CFSTR("not hidden");
        _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", buf, 0x1Cu);

      }
      -[PGStashView setHidden:](self->_stashView, "setHidden:", 0);
    }
    v12 = self->_inFlightStashProgressAnimationIdentifier + 1;
    self->_inFlightStashProgressAnimationIdentifier = v12;
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke;
    v19[3] = &unk_1E622FE30;
    v19[4] = self;
    v20 = IsZero;
    *(double *)&v19[5] = a3;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke_2;
    v17[3] = &unk_1E62304A8;
    v18 = IsZero;
    v17[4] = self;
    v17[5] = v12;
    v17[6] = a2;
    objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v19, v17);
    v14 = 1.0 - a3;
    v8 = BSFloatIsZero() == 0;
    v15 = 0.5;
    if (!v8)
      v15 = 0.2;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke_115;
    v16[3] = &unk_1E622FC00;
    v16[4] = self;
    *(double *)&v16[5] = v14;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v16, 0, v15, 0.0);
  }
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setBlurProgress:", *(double *)(a1 + 40));
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 56))
  {
    v1 = result;
    if (*(_QWORD *)(result + 40) == *(_QWORD *)(*(_QWORD *)(result + 32) + 1104))
    {
      PGLogCommon();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(v1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = 138543874;
        v5 = v3;
        v6 = 1024;
        v7 = 618;
        v8 = 2114;
        v9 = CFSTR("hidden");
        _os_log_impl(&dword_1B0CD6000, v2, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", (uint8_t *)&v4, 0x1Cu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1040), "setHidden:", 1);
      return objc_msgSend(*(id *)(v1 + 32), "_resetStashTabViewsIfPossible");
    }
  }
  return result;
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setPrefersStashTabSuppressed:(BOOL)a3
{
  if (self->_prefersStashTabSuppressed != a3)
  {
    self->_prefersStashTabSuppressed = a3;
    -[PGPictureInPictureViewController _updateStashTabStateWithBehavior:](self, "_updateStashTabStateWithBehavior:", self->_stashTabSpringBehavior);
  }
}

- (BOOL)wantsStashTabSuppression
{
  PGPictureInPictureViewController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "pictureInPictureViewControllerWantsStashTabSuppression:", v2);

  return (char)v2;
}

- (BOOL)isStashTabHidden
{
  return self->_stashTabHidden;
}

- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = a5;
  objc_storeStrong(&self->_stashTabSpringBehavior, a5);
  if (__PAIR64__(self->_stashTabShownLeft, self->_stashTabHidden) != __PAIR64__(v6, v7))
  {
    self->_stashTabHidden = v7;
    self->_stashTabShownLeft = v6 & ~v7;
    -[PGPictureInPictureViewController _updateStashTabStateWithBehavior:](self, "_updateStashTabStateWithBehavior:", v9);
  }

}

- (void)_updateStashTabStateWithBehavior:(id)a3
{
  int stashTabHidden;
  unint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];
  BOOL v7;

  stashTabHidden = self->_stashTabHidden;
  if (self->_prefersStashTabSuppressed)
    stashTabHidden |= self->_stashed;
  v4 = self->_inFlightStashTabAnimationIdentifier + 1;
  self->_inFlightStashTabAnimationIdentifier = v4;
  v5[5] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke;
  v6[3] = &unk_1E622FC80;
  v6[4] = self;
  v7 = stashTabHidden != 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke_2;
  v5[3] = &unk_1E62304D0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", a3, 0, v6, v5);
}

uint64_t __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStashedTabHidden:left:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1077));
}

_QWORD *__69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke_2(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == result[137])
    return (_QWORD *)objc_msgSend(result, "_resetStashTabViewsIfPossible");
  return result;
}

- (BOOL)showsPictureInPictureUnavailableIndicator
{
  return -[PGControlsContainerView showsPictureInPictureUnavailableIndicator](self->_controlsContainerView, "showsPictureInPictureUnavailableIndicator");
}

- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3
{
  -[PGControlsContainerView setShowsPictureInPictureUnavailableIndicator:](self->_controlsContainerView, "setShowsPictureInPictureUnavailableIndicator:", a3);
}

- (void)loadView
{
  PGHitTestExtendableView *v3;
  PGHitTestExtendableView *v4;

  v3 = [PGHitTestExtendableView alloc];
  v4 = -[PGHitTestExtendableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PGPictureInPictureViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  _PGPictureInPictureContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *containerView;
  UIView *v10;
  void *v11;
  PGPictureInPictureViewControllerBackgroundView *v12;
  PGPictureInPictureViewControllerBackgroundView *backgroundView;
  PGPictureInPictureViewControllerClippingView *v14;
  PGPictureInPictureViewControllerClippingView *contentClippingView;
  PGLayerHostView *v16;
  PGLayerHostView *contentView;
  PGPortalView *v18;
  PGPortalView *leftSideContentPortalView;
  PGPortalView *v20;
  PGPortalView *v21;
  PGPortalView *rightSideContentPortalView;
  PGPortalView *v23;
  PGStashView *v24;
  PGStashView *v25;
  PGStashView *stashView;
  NSObject *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  objc_super v34;
  CGAffineTransform v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PGPictureInPictureViewController;
  -[PGPictureInPictureViewController viewDidLoad](&v34, sel_viewDidLoad);
  v3 = [_PGPictureInPictureContainerView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[_PGPictureInPictureContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[UIView setVcForDebugging:](v8, "setVcForDebugging:", self);
  containerView = self->_containerView;
  self->_containerView = v8;
  v10 = v8;

  -[PGPictureInPictureViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_containerView);

  v12 = -[PGPictureInPictureViewControllerBackgroundView initWithFrame:]([PGPictureInPictureViewControllerBackgroundView alloc], "initWithFrame:", v4, v5, v6, v7);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_backgroundView);
  v14 = -[PGPictureInPictureViewControllerClippingView initWithFrame:]([PGPictureInPictureViewControllerClippingView alloc], "initWithFrame:", v4, v5, v6, v7);
  contentClippingView = self->_contentClippingView;
  self->_contentClippingView = v14;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_contentClippingView);
  v16 = -[PGLayerHostView initWithFrame:]([PGLayerHostView alloc], "initWithFrame:", v4, v5, v6, v7);
  contentView = self->_contentView;
  self->_contentView = v16;

  -[PGLayerHostView setHostedWindowHostingHandle:](self->_contentView, "setHostedWindowHostingHandle:", self->_hostedWindowHostingHandle);
  -[PGLayerHostView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", 0);
  -[PGPictureInPictureViewControllerClippingView addSubview:](self->_contentClippingView, "addSubview:", self->_contentView);
  -[PGPictureInPictureViewControllerClippingView setClipsToBounds:](self->_contentClippingView, "setClipsToBounds:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_controlsContainerView);
  v18 = -[PGPortalView initWithFrame:]([PGPortalView alloc], "initWithFrame:", v4, v5, v6, v7);
  leftSideContentPortalView = self->_leftSideContentPortalView;
  self->_leftSideContentPortalView = v18;

  v20 = self->_leftSideContentPortalView;
  v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v35.a = *MEMORY[0x1E0C9BAA8];
  v30 = *(_OWORD *)&v35.a;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v29 = *(_OWORD *)&v35.tx;
  CGAffineTransformScale(&v33, &v35, -1.0, 1.0);
  -[PGPortalView setTransform:](v20, "setTransform:", &v33);
  -[PGPortalView setUserInteractionEnabled:](self->_leftSideContentPortalView, "setUserInteractionEnabled:", 0);
  -[PGPortalView setHidden:](self->_leftSideContentPortalView, "setHidden:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_leftSideContentPortalView);
  v21 = -[PGPortalView initWithFrame:]([PGPortalView alloc], "initWithFrame:", v4, v5, v6, v7);
  rightSideContentPortalView = self->_rightSideContentPortalView;
  self->_rightSideContentPortalView = v21;

  v23 = self->_rightSideContentPortalView;
  *(_OWORD *)&v35.a = v30;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = v29;
  CGAffineTransformScale(&v32, &v35, -1.0, 1.0);
  -[PGPortalView setTransform:](v23, "setTransform:", &v32);
  -[PGPortalView setHidden:](self->_rightSideContentPortalView, "setHidden:", 1);
  -[PGPortalView setUserInteractionEnabled:](self->_leftSideContentPortalView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_rightSideContentPortalView);
  v24 = [PGStashView alloc];
  -[UIView bounds](self->_containerView, "bounds");
  v25 = -[PGStashView initWithFrame:](v24, "initWithFrame:");
  stashView = self->_stashView;
  self->_stashView = v25;

  -[PGStashView setHidden:](self->_stashView, "setHidden:", 1);
  -[PGStashView setUserInteractionEnabled:](self->_stashView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_stashView);

  -[PGPictureInPictureViewController _addMaskViewSubviewIfNeeded](self, "_addMaskViewSubviewIfNeeded");
  PGLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[PGPictureInPictureViewController delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35.a) = 136315650;
    *(_QWORD *)((char *)&v35.a + 4) = "-[PGPictureInPictureViewController viewDidLoad]";
    WORD2(v35.b) = 2048;
    *(_QWORD *)((char *)&v35.b + 6) = self;
    HIWORD(v35.c) = 2114;
    *(_QWORD *)&v35.d = v28;
    _os_log_impl(&dword_1B0CD6000, v27, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", (uint8_t *)&v35, 0x20u);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  __int128 v30;
  PGLayerHostView *contentView;
  PGLayerHostView *v32;
  PGLayerHostView *v33;
  __int128 v34;
  PGPictureInPictureViewControllerBackgroundView *backgroundView;
  CGAffineTransform v36;
  CGAffineTransform v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)PGPictureInPictureViewController;
  -[PGPictureInPictureViewController viewWillLayoutSubviews](&v38, sel_viewWillLayoutSubviews);
  -[PGPictureInPictureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  -[PGPictureInPictureViewControllerClippingView setFrame:](self->_contentClippingView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  -[UIView bounds](self->_containerView, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PGPictureInPictureViewControllerClippingView frame](self->_contentClippingView, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (self->_interactivelyResizing)
  {
    -[PGLayerHostView bounds](self->_contentView, "bounds");
    v29 = v17 / v28;
    memset(&v37, 0, sizeof(v37));
    v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v36.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v36.c = v30;
    *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v37, &v36, v29, v29);
    contentView = self->_contentView;
    v36 = v37;
    -[PGLayerHostView setTransform:](contentView, "setTransform:", &v36);
    v32 = self->_contentView;
    -[PGPictureInPictureViewControllerClippingView bounds](self->_contentClippingView, "bounds");
    UIRectGetCenter();
    -[PGLayerHostView setCenter:](v32, "setCenter:");
  }
  else
  {
    v33 = self->_contentView;
    v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v37.c = v34;
    *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[PGLayerHostView setTransform:](v33, "setTransform:", &v37);
    -[PGLayerHostView setFrame:](self->_contentView, "setFrame:", v13, v15, v17, v19);
  }
  -[UIView PG_setAllowsEdgeAntialiasing:](self->_backgroundView, "PG_setAllowsEdgeAntialiasing:", self->_interactivelyResizing);
  -[UIView PG_setAllowsEdgeAntialiasing:](self->_contentClippingView, "PG_setAllowsEdgeAntialiasing:", self->_interactivelyResizing);
  -[UIView PG_setAllowsEdgeAntialiasing:](self->_controlsContainerView, "PG_setAllowsEdgeAntialiasing:", self->_interactivelyResizing);
  -[UIView PG_setAllowsEdgeAntialiasing:](self->_contentView, "PG_setAllowsEdgeAntialiasing:", self->_interactivelyResizing);
  backgroundView = self->_backgroundView;
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  v40 = CGRectInset(v39, 1.0, 1.0);
  -[PGPictureInPictureViewControllerBackgroundView setFrame:](backgroundView, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  -[PGControlsContainerView setFrame:](self->_controlsContainerView, "setFrame:", v21, v23, v25, v27);
  -[PGPictureInPictureViewControllerBackgroundView layoutIfNeeded](self->_backgroundView, "layoutIfNeeded");
  -[PGLayerHostView setNeedsLayout](self->_contentView, "setNeedsLayout");
  -[PGLayerHostView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
  -[PGControlsContainerView layoutIfNeeded](self->_controlsContainerView, "layoutIfNeeded");
  -[PGPictureInPictureViewController _layoutStashTabViewsIfNeeded](self, "_layoutStashTabViewsIfNeeded");
}

- (void)_layoutStashTabViewsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  UIView *tabShadowView;
  id v17;
  UIView *v18;
  id v19;
  PGPortalView *leftSideContentPortalView;
  PGPortalView *rightSideContentPortalView;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[UIView bounds](self->_containerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  if (WeakRetained && self->_tabShadowView)
  {
    v22 = WeakRetained;
    v12 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    objc_msgSend(v12, "bounds");
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    v13 = CGRectEqualToRect(v23, v28);

    if (!v13)
    {
      v14 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

      v15 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(v15, "layoutIfNeeded");

      tabShadowView = self->_tabShadowView;
      v17 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(v17, "tabViewBounds");
      -[UIView setBounds:](tabShadowView, "setBounds:");

      v18 = self->_tabShadowView;
      v19 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(v19, "position");
      -[UIView setPosition:](v18, "setPosition:");

      -[UIView layoutIfNeeded](self->_tabShadowView, "layoutIfNeeded");
      leftSideContentPortalView = self->_leftSideContentPortalView;
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.width = v8;
      v24.size.height = v10;
      v25 = CGRectOffset(v24, -(v8 + -1.0), 0.0);
      -[PGPortalView setFrame:](leftSideContentPortalView, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
      rightSideContentPortalView = self->_rightSideContentPortalView;
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      v27 = CGRectOffset(v26, v8 + -1.0, 0.0);
      -[PGPortalView setFrame:](rightSideContentPortalView, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
      -[PGPortalView layoutIfNeeded](self->_leftSideContentPortalView, "layoutIfNeeded");
      -[PGPortalView layoutIfNeeded](self->_rightSideContentPortalView, "layoutIfNeeded");
      -[PGStashView setFrame:](self->_stashView, "setFrame:", v4, v6, v8, v10);
      -[PGStashView layoutIfNeeded](self->_stashView, "layoutIfNeeded");
    }
  }
  else
  {

  }
}

- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id WeakRetained;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[UIView setAlpha:](self->_tabShadowView, "setAlpha:", 0.0);
    -[UIView setHidden:](self->_tabShadowView, "setHidden:", 0);
    -[PGPictureInPictureViewController _setPortalActive:left:](self, "_setPortalActive:left:", 1, v4);
    -[PGPictureInPictureViewController _setStashMaskActive:](self, "_setStashMaskActive:", 1);
  }
  -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", !self->_isShowingChrome, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  objc_msgSend(WeakRetained, "setTabHidden:left:", v5, v4);

  -[PGStashView setChevronHidden:left:](self->_stashView, "setChevronHidden:left:", v5, v4);
}

- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4
{
  _BOOL4 v4;
  PGPortalView *leftSideContentPortalView;
  _BOOL4 v7;
  _BOOL4 v8;
  PGLayerHostView *contentView;
  uint64_t v10;
  PGLayerHostView *v11;

  v4 = a4;
  if (self->_portalsWereActive != a3 || self->_portalsWereActiveLeft != a4)
  {
    self->_portalsWereActive = a3;
    self->_portalsWereActiveLeft = a4;
    leftSideContentPortalView = self->_leftSideContentPortalView;
    v7 = !a3;
    v8 = a3 && a4;
    if (a3 && a4)
      contentView = self->_contentView;
    else
      contentView = 0;
    -[PGPortalView setSourceView:](leftSideContentPortalView, "setSourceView:", contentView);
    v10 = v7 | v4;
    if ((v10 & 1) != 0)
      v11 = 0;
    else
      v11 = self->_contentView;
    -[PGPortalView setSourceView:](self->_rightSideContentPortalView, "setSourceView:", v11);
    -[PGPortalView setHidden:](self->_leftSideContentPortalView, "setHidden:", !v8);
    -[PGPortalView setHidden:](self->_rightSideContentPortalView, "setHidden:", v10);
  }
}

- (void)_setStashMaskActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  UIView *containerView;
  id v8;
  void *v9;
  id v10;

  v3 = a3;
  if (!a3)
  {
    objc_storeWeak((id *)&self->_stashMaskView, 0);
    -[UIView setMaskView:](self->_containerView, "setMaskView:", 0);
    -[PGPictureInPictureViewController _addMaskViewSubviewIfNeeded](self, "_addMaskViewSubviewIfNeeded");
    -[PGPictureInPictureViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHitTestExtenderView:", 0);
    goto LABEL_5;
  }
  -[UIView maskView](self->_containerView, "maskView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
    objc_msgSend(WeakRetained, "setHidden:", 0);

    containerView = self->_containerView;
    v8 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    -[UIView setMaskView:](containerView, "setMaskView:", v8);

    -[PGPictureInPictureViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    objc_msgSend(v9, "setHitTestExtenderView:", v10);

LABEL_5:
  }
  -[PGPictureInPictureViewController _updateContentCornerRadiusForMaskActive:](self, "_updateContentCornerRadiusForMaskActive:", v3);
}

- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PGPictureInPictureViewController__updateContentCornerRadiusForMaskActive___block_invoke;
  v3[3] = &unk_1E622FC80;
  v4 = a3;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "PG_performWithoutRetargetingAnimation:", v3);
}

uint64_t __76__PGPictureInPictureViewController__updateContentCornerRadiusForMaskActive___block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "ignoreCornerRadiusUpdates"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setIgnoreCornerRadiusUpdates:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setIgnoreCornerRadiusUpdates:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadii");
}

- (void)_resetStashTabViewsIfPossible
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (self->_stashTabHidden)
  {
    -[UIView maskView](self->_containerView, "maskView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (self->_interactivelyResizing || !-[PGStashView isHidden](self->_stashView, "isHidden"))
      {
        -[PGPictureInPictureViewController _updateContentCornerRadiusForMaskActive:](self, "_updateContentCornerRadiusForMaskActive:", 0);
      }
      else
      {
        PGLogCommon();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "[Layout] Removing Stash Tab Views", buf, 2u);
        }

        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __65__PGPictureInPictureViewController__resetStashTabViewsIfPossible__block_invoke;
        v5[3] = &unk_1E622F8C0;
        v5[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "PG_performWithoutRetargetingAnimation:", v5);
      }
    }
  }
}

uint64_t __65__PGPictureInPictureViewController__resetStashTabViewsIfPossible__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setPortalActive:left:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setStashMaskActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "resetChevronState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "layoutIfNeeded");
}

- (UIView)contentContainerView
{
  return self->_containerView;
}

- (double)preferredMinimumWidth
{
  double result;

  -[PGControlsViewModel preferredMinimumWidth](self->_viewModel, "preferredMinimumWidth");
  return result;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  id WeakRetained;

  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(WeakRetained, "preferredContentSizeDidChangeForPictureInPictureViewController");

  }
}

- (BOOL)shouldAutorotate
{
  return self->_controlsStyle != 5;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  objc_super v4;

  if (!-[PGPictureInPictureViewController shouldAutorotate](self, "shouldAutorotate"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureViewController;
  return (int64_t)-[PGPictureInPictureViewController interfaceOrientation](&v4, sel_interfaceOrientation);
}

- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void (**v11)(_QWORD);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 IsNull;
  id WeakRetained;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(_QWORD))a5;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  PGLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    NSStringFromCGRect(v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_1B0CD6000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing animation with initial layer frame: %@", buf, 0x16u);

  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  IsNull = CGRectIsNull(v29);
  self->_initialLayerFrameIsNull = IsNull;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  v18 = WeakRetained;
  if (IsNull)
  {
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
    {
      -[PGPictureInPictureViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", 0.0);

      -[PGPictureInPictureViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CGAffineTransformMakeScale(&v22, 0.100000001, 0.100000001);
      objc_msgSend(v21, "setTransform:", &v22);

    }
    v11[2](v11);
  }
  else
  {
    objc_msgSend(WeakRetained, "prepareStartAnimationWithInitialInterfaceOrientation:initialLayerFrame:completionHandler:", a3, v11, x, y, width, height);

  }
}

- (void)performStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  char v12;
  id v13;
  NSObject *v14;
  int64_t v15;
  NSUUID *v16;
  NSUUID *analyticsSessionUUID;
  id v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  id v24;
  dispatch_time_t v25;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[5];
  id v30;

  v4 = a3;
  v6 = a4;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke;
  v29[3] = &unk_1E6230148;
  v29[4] = self;
  v9 = v6;
  v30 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1B5E0FE80](v29);
  -[PGPictureInPictureViewController acquireInterfaceOrientationLock](self, "acquireInterfaceOrientationLock");
  -[PGPictureInPictureViewController showChrome:animated:](self, "showChrome:animated:", 0, 0);
  if (v4)
  {
    -[PGPictureInPictureViewController _performStartAnimationWithCompletionHandler:](self, "_performStartAnimationWithCompletionHandler:", v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      objc_msgSend(v13, "performStartInIsolationWithCompletionHandler:", v10);

    }
    else
    {
      v10[2](v10);
    }
  }
  if (self->_analyticsSessionUUID)
  {
    PGLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController performStartAnimated:withCompletionHandler:].cold.1(v14);

  }
  v15 = -[PGPictureInPictureViewController contentType](self, "contentType");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  analyticsSessionUUID = self->_analyticsSessionUUID;
  self->_analyticsSessionUUID = v16;

  v18 = objc_loadWeakRetained((id *)&self->_application);
  objc_msgSend(v18, "bundleIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("com.apple.MissingBundleIdentifier");
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  v23 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  objc_msgSend(v23, "pictureInPictureDidCreateAnalyticsSessionWithUUID:bundleIdentifier:contentType:", self->_analyticsSessionUUID, v22, v15);

  v24 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  objc_msgSend(v24, "pictureInPictureDidActivateAnalyticsSessionWithUUID:analyticsSourceUUID:automatically:", self->_analyticsSessionUUID, self->_analyticsSourceUUID, self->_startedAutomatically);

  if (-[PGPictureInPictureViewController contentType](self, "contentType") == 6)
  {
    objc_initWeak(&location, self);
    v25 = dispatch_time(0, 5000000000);
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_135;
    v26[3] = &unk_1E6230520;
    objc_copyWeak(&v27, &location);
    dispatch_after(v25, MEMORY[0x1E0C80D38], v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v2 = *(_BYTE **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[1193])
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "showChrome:animated:", 1, 0);
      objc_msgSend(*(id *)(a1 + 32), "relinquishInterfaceOrientationLock");
      objc_msgSend(*(id *)(a1 + 32), "_insertContentContainerViewIfNeeded");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    }
  }
  else if (v3)
  {
    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E62304F8;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 40);
    v4 = MEMORY[0x1B5E0FE80](v7);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1272);
    *(_QWORD *)(v5 + 1272) = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "_insertContentContainerViewIfNeeded");
}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateCornerRadii");
    objc_msgSend(WeakRetained, "showChrome:animated:", 1, 1);
    objc_msgSend(WeakRetained, "relinquishInterfaceOrientationLock");
    objc_msgSend(WeakRetained, "_insertContentContainerViewIfNeeded");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_135(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "contentType") == 6 && (objc_msgSend(WeakRetained, "stashed") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "contentContainer");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_opt_respondsToSelector();

    if ((v2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "contentContainer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pictureInPictureClientDidRequestStashing");

    }
  }

}

- (void)_performStartAnimationWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 initialLayerFrameIsNull;
  id WeakRetained;
  void *v11;
  char v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E6230148;
  v18[4] = self;
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x1B5E0FE80](v18);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginIgnoringInteractionEvents");

  -[PGPictureInPictureViewController showChrome:animated:](self, "showChrome:animated:", 1, 1);
  initialLayerFrameIsNull = self->_initialLayerFrameIsNull;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  v11 = WeakRetained;
  if (initialLayerFrameIsNull)
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      objc_msgSend(v13, "performStartInIsolationWithCompletionHandler:", v7);

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_2;
      v17[3] = &unk_1E622F8C0;
      v17[4] = self;
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E6230548;
      v16 = v7;
      objc_msgSend(v14, "PG_animateUsingDefaultTimingWithAnimations:completion:", v17, v15);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "performStartAnimationWithCompletionHandler:", v7);

  }
}

uint64_t __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1193))
    objc_msgSend(*(id *)(v2 + 1008), "setControlsContainerHidden:animated:", 0, 1);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endIgnoringInteractionEvents");

  objc_msgSend(*(id *)(a1 + 32), "relinquishInterfaceOrientationLock");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

uint64_t __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performStopAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v11;
  void (**v13)(_QWORD);
  NSObject *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v13 = (void (**)(_QWORD))a6;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  if (v11)
  {
    -[PGPictureInPictureViewController _performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:](self, "_performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", a4, v13, x, y, width, height);
  }
  else
  {
    -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", 1, 0);
    v13[2](v13);
  }

}

- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  id WeakRetained;
  char v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
  v25[3] = &unk_1E622F8C0;
  v25[4] = self;
  v13 = (void (**)(_QWORD))MEMORY[0x1B5E0FE80](v25);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v23[3] = &unk_1E6230148;
  v23[4] = self;
  v14 = v11;
  v24 = v14;
  v15 = (void *)MEMORY[0x1B5E0FE80](v23);
  v13[2](v13);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectIsNull(v26))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CEABB0];
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
      v22[3] = &unk_1E622F8C0;
      v22[4] = self;
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4;
      v20[3] = &unk_1E6230548;
      v21 = v15;
      objc_msgSend(v19, "PG_animateUsingDefaultTimingWithAnimations:completion:", v22, v20);

      goto LABEL_7;
    }
    v18 = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(v18, "performStopInIsolationWithCompletionHandler:", v15);
  }
  else
  {
    -[PGPictureInPictureViewController showChrome:animated:](self, "showChrome:animated:", 0, 1);
    v18 = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(v18, "performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", a3, v15, x, y, width, height);
  }

LABEL_7:
}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginIgnoringInteractionEvents");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setControlsContainerHidden:animated:", 1, 0);
}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endIgnoringInteractionEvents");

  objc_msgSend(*(id *)(a1 + 32), "relinquishInterfaceOrientationLock");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.100000001, 0.100000001);
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performSuspendAnimationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  self->_isSuspended = 1;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginIgnoringInteractionEvents");

  -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", 1, 1);
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v10 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E622F8C0;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6230260;
  v9[4] = self;
  v8 = v4;
  objc_msgSend(v7, "PG_animateUsingDefaultTimingWithAnimations:completion:", v11, v9);

}

void __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.100000001, 0.100000001);
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endIgnoringInteractionEvents");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrefersIdleTimerDisabled");
}

- (void)performResumeAnimationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  self->_isSuspended = 0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginIgnoringInteractionEvents");

  v7 = (void *)MEMORY[0x1E0CEABB0];
  v10 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E622F8C0;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6230570;
  v9[4] = self;
  v8 = v4;
  objc_msgSend(v7, "PG_animateUsingDefaultTimingWithAnimations:completion:", v11, v9);

}

void __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

uint64_t __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1193))
    objc_msgSend(*(id *)(v2 + 1008), "setControlsContainerHidden:animated:", 0, 1);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endIgnoringInteractionEvents");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrefersIdleTimerDisabled");
}

- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginIgnoringInteractionEvents");

  -[PGControlsContainerView setControlsContainerHidden:animated:](self->_controlsContainerView, "setControlsContainerHidden:animated:", 1, 0);
  if ((*(_BYTE *)&self->_contentContainerRespondsTo & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__PGPictureInPictureViewController_performRotateAnimationWithRotation_completionHandler___block_invoke;
    v10[3] = &unk_1E6230148;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(WeakRetained, "performRotateAnimationWithRotation:completionHandler:", a3, v10);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __89__PGPictureInPictureViewController_performRotateAnimationWithRotation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setControlsContainerHidden:animated:", 0, 0);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endIgnoringInteractionEvents");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)prepareStopAnimationWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  id WeakRetained;

  v4 = (void (**)(_QWORD))a3;
  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  -[PGPictureInPictureViewController acquireInterfaceOrientationLock](self, "acquireInterfaceOrientationLock");
  if ((*(_BYTE *)&self->_contentContainerRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(WeakRetained, "prepareStopAnimationWithCompletionHandler:", v4);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)acquireInterfaceOrientationLock
{
  NSObject *v3;
  id WeakRetained;

  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  if ((*(_BYTE *)&self->_contentContainerRespondsTo & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(WeakRetained, "acquireInterfaceOrientationLock");

  }
}

- (void)relinquishInterfaceOrientationLock
{
  NSObject *v3;
  id WeakRetained;

  if ((-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureViewController showChrome:animated:].cold.1();

  }
  if ((*(_BYTE *)&self->_contentContainerRespondsTo & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(WeakRetained, "relinquishInterfaceOrientationLock");

  }
}

- (BOOL)isInterrupted
{
  return -[PGControlsViewModel isInterrupted](self->_viewModel, "isInterrupted");
}

- (void)setInterrupted:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v3 = a3;
  v5 = -[PGPictureInPictureViewController isInterrupted](self, "isInterrupted");
  -[PGControlsViewModel setInterrupted:](self->_viewModel, "setInterrupted:", v3);
  -[PGPictureInPictureViewController _updatePrefersIdleTimerDisabled](self, "_updatePrefersIdleTimerDisabled");
  if (v5 != v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);
    objc_msgSend(WeakRetained, "flashControls");

    if (!v3)
    {
      if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[PGPictureInPictureViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alpha");
        v9 = v8;

        if (v9 == 0.0)
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __51__PGPictureInPictureViewController_setInterrupted___block_invoke;
          v10[3] = &unk_1E622F8C0;
          v10[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v10, 0);
        }
      }
    }
  }
}

void __51__PGPictureInPictureViewController_setInterrupted___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)setContentViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (-[PGLayerHostView isHidden](self->_contentView, "isHidden") != a3)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(self, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{BOOL}u", (uint8_t *)&v7, 0x12u);

    }
    -[PGLayerHostView setHidden:](self->_contentView, "setHidden:", v3);
  }
}

- (void)setMenuItems:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  BOOL v6;
  NSArray *v7;
  NSArray *menuItems;
  PGPictureInPictureViewControllerContentContainer **p_contentContainer;
  id WeakRetained;
  char v11;
  id v12;
  NSArray *v13;

  v4 = (NSArray *)a3;
  v5 = v4;
  v13 = v4;
  if (self->_menuItems != v4 || (v6 = -[NSArray isEqualToArray:](v4, "isEqualToArray:", v4), v5 = v13, !v6))
  {
    v7 = (NSArray *)-[NSArray copy](v5, "copy");
    menuItems = self->_menuItems;
    self->_menuItems = v7;

    p_contentContainer = &self->_contentContainer;
    WeakRetained = objc_loadWeakRetained((id *)p_contentContainer);
    v11 = objc_opt_respondsToSelector();

    v5 = v13;
    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)p_contentContainer);
      objc_msgSend(v12, "updateMenuItems");

      v5 = v13;
    }
  }

}

- (void)setShouldDisablePointerInteraction:(BOOL)a3
{
  self->_shouldDisablePointerInteraction = a3;
  -[PGControlsContainerView setHoverGestureDisbaled:](self->_controlsContainerView, "setHoverGestureDisbaled:");
}

- (void)_handleTapWhileStashedGestureRecognizer:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_contentContainerRespondsTo & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(WeakRetained, "handleTapWhileStashedGesture");

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (self->_shouldDisablePointerInteraction)
    return 0;
  else
    return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  -[PGPictureInPictureViewController view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isInAWindow");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEAA98]);
    -[PGPictureInPictureViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithView:", v8);

    -[PGPictureInPictureViewController tetheringViewController](self, "tetheringViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA858], "effectWithPreview:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPrefersShadow:", 1);
      objc_msgSend(v11, "setPreferredTintMode:", 0);
    }
    objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PGLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PGPictureInPictureViewController pointerInteraction:styleForRegion:].cold.1(v12);

    v13 = 0;
  }
  return v13;
}

- (void)handleCommand:(id)a3
{
  void *WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  switch(objc_msgSend(v8, "systemAction"))
  {
    case 0:
    case 1:
    case 2:
      -[PGPictureInPictureViewController delegate](self, "delegate");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "pictureInPictureViewController:didReceiveCommand:", self, v8);
      goto LABEL_3;
    case 3:
      -[PGPictureInPictureViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pictureInPictureViewController:didReceiveCommand:", self, v8);

      if (-[PGPictureInPictureViewController isInterrupted](self, "isInterrupted"))
        -[PGLayerHostView setHidden:](self->_contentView, "setHidden:", 1);
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureViewController.m"), 1239, CFSTR("Toggle visibility action should not be sent to PictureInPictureViewController."));

      break;
    case 5:
      if ((*(_BYTE *)&self->_contentContainerRespondsTo & 0x10) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
        objc_msgSend(WeakRetained, "handleDoubleTapGesture");
LABEL_3:

      }
      break;
    default:
      break;
  }
  -[PGPictureInPictureViewController _updatePrefersIdleTimerDisabled](self, "_updatePrefersIdleTimerDisabled");

}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  char v12;
  id v13;
  int prefersHiddenFromClonedDisplay;
  void *v15;
  int v16;
  void *v17;
  PGPictureInPictureViewControllerContentContainer **p_contentContainer;
  id v19;
  char v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  PGPictureInPictureViewController *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315650;
    v23 = "-[PGPictureInPictureViewController updatePlaybackStateWithDiff:]";
    v24 = 2048;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p REMOTE: %{public}@", (uint8_t *)&v22, 0x20u);

  }
  -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRoutingVideoToHostedWindow");

  -[PGControlsViewModel updatePlaybackStateWithDiff:](self->_viewModel, "updatePlaybackStateWithDiff:", v4);
  -[PGPictureInPictureViewController _updatePrefersIdleTimerDisabled](self, "_updatePrefersIdleTimerDisabled");
  -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRoutingVideoToHostedWindow");

  if (v8 != (_DWORD)v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      objc_msgSend(v13, "playbackSourceDidUpdateIsRoutingVideoToHostedWindow:", v10);

    }
  }
  -[PGPictureInPictureViewController _updatePointerEffect](self, "_updatePointerEffect");
  prefersHiddenFromClonedDisplay = self->_prefersHiddenFromClonedDisplay;
  -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "disablesLayerCloning");

  if (prefersHiddenFromClonedDisplay != v16)
  {
    -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_prefersHiddenFromClonedDisplay = objc_msgSend(v17, "disablesLayerCloning");

    p_contentContainer = &self->_contentContainer;
    v19 = objc_loadWeakRetained((id *)p_contentContainer);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_loadWeakRetained((id *)p_contentContainer);
      objc_msgSend(v21, "notePictureInPictureViewControllerPrefersHiddenFromClonedDisplayDidChange");

    }
  }
}

- (void)_loadShadowViewIfNeeded
{
  UIView *v3;
  UIView *shadowView;
  UIView *v5;
  id v6;

  if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_shadowView)
    {
      -[PGPictureInPictureViewController view](self, "view");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v3 = -[PGPictureInPictureViewController _newShadowView](self, "_newShadowView");
      shadowView = self->_shadowView;
      self->_shadowView = v3;

      v5 = self->_shadowView;
      objc_msgSend(v6, "bounds");
      -[UIView setFrame:](v5, "setFrame:");
      objc_msgSend(v6, "insertSubview:atIndex:", self->_shadowView, 0);

    }
  }
}

- (id)_newShadowView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPathIsBounds:", 1);

  -[PGPictureInPictureViewController _applyShadowSettingsToView:](self, "_applyShadowSettingsToView:", v4);
  return v4;
}

- (void)_applyShadowSettingsToView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMobilePIPSettings shadowOffsetX](self->_settings, "shadowOffsetX");
  v6 = v5;
  -[PGMobilePIPSettings shadowOffsetY](self->_settings, "shadowOffsetY");
  objc_msgSend(v4, "setShadowOffset:", v6, v7);

  objc_msgSend(v11, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMobilePIPSettings shadowOpacity](self->_settings, "shadowOpacity");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "setShadowOpacity:", v9);

  objc_msgSend(v11, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMobilePIPSettings shadowRadius](self->_settings, "shadowRadius");
  objc_msgSend(v10, "setShadowRadius:");

  -[PGMobilePIPSettings shadowContinuousCornerRadius](self->_settings, "shadowContinuousCornerRadius");
  objc_msgSend(v11, "_setContinuousCornerRadius:");

}

- (void)_updatePointerEffect
{
  void *v3;
  int v4;
  UIPointerInteraction **p_pointerInteraction;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  -[PGControlsViewModel values](self->_viewModel, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "includesRestoreButton");

  p_pointerInteraction = &self->_pointerInteraction;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  if (v4)
  {
    if (WeakRetained)
    {
      v9 = WeakRetained;
      -[PGPictureInPictureViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeInteraction:", v9);

      objc_storeWeak((id *)p_pointerInteraction, 0);
LABEL_7:
      WeakRetained = v9;
    }
  }
  else if (!WeakRetained)
  {
    if (!-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
      return;
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
    objc_storeWeak((id *)&self->_pointerInteraction, v9);
    -[PGPictureInPictureViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInteraction:", v9);

    goto LABEL_7;
  }

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[PGPictureInPictureViewController _applyShadowSettingsToView:](self, "_applyShadowSettingsToView:", self->_shadowView, a4);
  -[PGPictureInPictureViewController _applyShadowSettingsToView:](self, "_applyShadowSettingsToView:", self->_tabShadowView);
}

- (void)_loadTabShadowViewIfNeeded
{
  UIView *v3;
  UIView *tabShadowView;
  id v5;

  if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_tabShadowView)
    {
      v3 = -[PGPictureInPictureViewController _newShadowView](self, "_newShadowView");
      tabShadowView = self->_tabShadowView;
      self->_tabShadowView = v3;

      -[UIView setHidden:](self->_tabShadowView, "setHidden:", 1);
      -[PGPictureInPictureViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertSubview:atIndex:", self->_tabShadowView, 0);

    }
  }
}

- (void)_addMaskViewSubviewIfNeeded
{
  id WeakRetained;
  PGStashedMaskView *v4;
  PGStashedMaskView *obj;

  if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);

    if (!WeakRetained)
    {
      v4 = [PGStashedMaskView alloc];
      -[UIView bounds](self->_containerView, "bounds");
      obj = -[PGStashedMaskView initWithFrame:minimumStashTabSize:](v4, "initWithFrame:minimumStashTabSize:");
      -[PGPictureInPictureViewController _loadTabShadowViewIfNeeded](self, "_loadTabShadowViewIfNeeded");
      -[PGStashedMaskView setTabShadowView:](obj, "setTabShadowView:", self->_tabShadowView);
      -[PGStashedMaskView setHidden:](obj, "setHidden:", 1);
      -[UIView addSubview:](self->_containerView, "addSubview:", obj);
      objc_storeWeak((id *)&self->_stashMaskView, obj);

    }
  }
}

- (void)_updatePrefersIdleTimerDisabled
{
  int prefersIdleTimerDisabled;
  int v4;
  void *v5;
  unint64_t v6;
  double v7;
  id v8;

  prefersIdleTimerDisabled = self->_prefersIdleTimerDisabled;
  if (self->_stashed || self->_isSuspended || -[PGPictureInPictureViewController isInterrupted](self, "isInterrupted"))
  {
    v4 = 0;
  }
  else
  {
    -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contentType");
    if (v6 > 5)
    {
      v4 = 0;
    }
    else if (((1 << v6) & 0x31) != 0 || ((1 << v6) & 6) == 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v5, "playbackRate");
      v4 = v7 != 0.0;
    }

  }
  if (prefersIdleTimerDisabled != v4)
  {
    self->_prefersIdleTimerDisabled = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("PGPictureInPictureViewControllerPrefersIdleTimerDisabledDidChangeNotification"), self);

  }
}

- (void)_insertContentContainerViewIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  UIView *tabShadowView;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  PGPictureInPictureViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PGPictureInPictureViewController canStartShowingChrome](self, "canStartShowingChrome"))
  {
    if (-[PGPictureInPictureViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIView superview](self->_containerView, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPictureInPictureViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 != v4)
      {
        PGLogCommon();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315394;
          v13 = "-[PGPictureInPictureViewController _insertContentContainerViewIfNeeded]";
          v14 = 2048;
          v15 = self;
          _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v12, 0x16u);
        }

        tabShadowView = self->_tabShadowView;
        v7 = tabShadowView == 0;
        v8 = tabShadowView != 0;
        v9 = 1;
        if (!v7)
          v9 = 2;
        if (self->_shadowView)
          v10 = v9;
        else
          v10 = v8;
        -[PGPictureInPictureViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSubview:atIndex:", self->_containerView, v10);

      }
    }
  }
}

- (void)setCurrentContentCornerRadius:(double)a3
{
  self->_currentContentCornerRadius = a3;
}

- (PGPictureInPictureApplication)application
{
  return (PGPictureInPictureApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (NSString)sourceSceneSessionPersistentIdentifier
{
  return self->_sourceSceneSessionPersistentIdentifier;
}

- (PGPictureInPictureViewControllerContentContainer)contentContainer
{
  return (PGPictureInPictureViewControllerContentContainer *)objc_loadWeakRetained((id *)&self->_contentContainer);
}

- (BOOL)canStartShowingChrome
{
  return self->_canStartShowingChrome;
}

- (PGPictureInPictureViewController)tetheredViewController
{
  return (PGPictureInPictureViewController *)objc_loadWeakRetained((id *)&self->_tetheredViewController);
}

- (PGPictureInPictureViewController)tetheringViewController
{
  return (PGPictureInPictureViewController *)objc_loadWeakRetained((id *)&self->_tetheringViewController);
}

- (int64_t)tetheringMode
{
  return self->_tetheringMode;
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (CGSize)minimumStashTabSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumStashTabSize.width;
  height = self->_minimumStashTabSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PGPictureInPicturePagingAccessoryViewController)pagingAccessoryViewController
{
  return self->_pagingAccessoryViewController;
}

- (void)setPagingAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pagingAccessoryViewController, a3);
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (BOOL)prefersStashTabSuppressed
{
  return self->_prefersStashTabSuppressed;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (BOOL)prefersHiddenFromClonedDisplay
{
  return self->_prefersHiddenFromClonedDisplay;
}

- (UIPointerInteraction)pointerInteraction
{
  return (UIPointerInteraction *)objc_loadWeakRetained((id *)&self->_pointerInteraction);
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_pointerInteraction, a3);
}

- (id)waitForUIFinalizationCompletionBlock
{
  return self->_waitForUIFinalizationCompletionBlock;
}

- (void)setWaitForUIFinalizationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (CGSize)microPIPSize
{
  double width;
  double height;
  CGSize result;

  width = self->_microPIPSize.width;
  height = self->_microPIPSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMicroPIPSize:(CGSize)a3
{
  self->_microPIPSize = a3;
}

- (PGHostedWindowHostingHandle)microPIPHostedWindowHostingHandle
{
  return self->_microPIPHostedWindowHostingHandle;
}

- (void)setMicroPIPHostedWindowHostingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_microPIPHostedWindowHostingHandle, a3);
}

- (PGPictureInPictureViewControllerDelegate)delegate
{
  return (PGPictureInPictureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microPIPHostedWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong(&self->_waitForUIFinalizationCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_pointerInteraction);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_pagingAccessoryViewController, 0);
  objc_destroyWeak((id *)&self->_tetheringViewController);
  objc_destroyWeak((id *)&self->_tetheredViewController);
  objc_storeStrong((id *)&self->_sourceSceneSessionPersistentIdentifier, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_analyticsSessionUUID, 0);
  objc_storeStrong((id *)&self->_analyticsSourceUUID, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_stashedTapGestureRecognizer, 0);
  objc_storeStrong(&self->_stashTabSpringBehavior, 0);
  objc_storeStrong((id *)&self->_rightSideContentPortalView, 0);
  objc_storeStrong((id *)&self->_leftSideContentPortalView, 0);
  objc_destroyWeak((id *)&self->_stashMaskView);
  objc_storeStrong((id *)&self->_stashView, 0);
  objc_storeStrong((id *)&self->_tabShadowView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_controlsContainerView, 0);
  objc_storeStrong((id *)&self->_contentClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
}

- (void)initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  _PGLogMethodProem(v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)showChrome:animated:.cold.1()
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%@ may not be called before view is loaded!", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)performStartAnimated:(os_log_t)log withCompletionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0CD6000, log, OS_LOG_TYPE_DEBUG, "Should have nil _analyticsSessionUUID", v1, 2u);
}

- (void)pointerInteraction:(os_log_t)log styleForRegion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0CD6000, log, OS_LOG_TYPE_ERROR, "Pointer interaction view not in a window", v1, 2u);
}

@end
