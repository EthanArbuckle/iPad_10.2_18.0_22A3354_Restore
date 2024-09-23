@implementation NCFullScreenPresentableViewController

- (NCFullScreenPresentableViewController)initWithNotificationRequest:(id)a3
{
  id v4;
  NCFullScreenPresentableViewController *v5;
  uint64_t v6;
  NCNotificationRequest *notificationRequest;
  NCFullScreenPresentableTransitioningDelegate *v8;
  NCFullScreenPresentableTransitioningDelegate *transitioningDelegate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCFullScreenPresentableViewController;
  v5 = -[NCFullScreenPresentableViewController init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    notificationRequest = v5->_notificationRequest;
    v5->_notificationRequest = (NCNotificationRequest *)v6;

    v8 = objc_alloc_init(NCFullScreenPresentableTransitioningDelegate);
    transitioningDelegate = v5->_transitioningDelegate;
    v5->_transitioningDelegate = v8;

    -[NCFullScreenPresentableViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v5->_transitioningDelegate);
  }

  return v5;
}

- (int64_t)bannerStage
{
  if (-[NCFullScreenPresentableViewController isViewLoaded](self, "isViewLoaded"))
    return -[NCFullScreenStagingBannerView stage](self->_bannerView, "stage");
  else
    return 0;
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  void *v3;

  if (-[NCFullScreenPresentableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[NCFullScreenStagingBannerView staticContentProvider](self->_bannerView, "staticContentProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NCNotificationStaticContentProviding *)v3;
}

- (BOOL)isStaticContentLoadingComplete
{
  NCFullScreenPresentableViewController *v2;
  void *v3;
  char v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NCFullScreenPresentableViewController staticContentProvider](v2, "staticContentProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "isImageAssetLoadingComplete");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)invalidateStaticContent
{
  id WeakRetained;
  NCNotificationRequestFullScreenContentProvider *v4;
  void *v5;
  NCNotificationRequestFullScreenContentProvider *v6;

  if (self->_bannerView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(WeakRetained, "notificationRequestPresenter:staticContentProviderForNotificationRequest:", self, self->_notificationRequest), (v6 = (NCNotificationRequestFullScreenContentProvider *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = [NCNotificationRequestFullScreenContentProvider alloc];
      -[NCFullScreenPresentableViewController notificationRequest](self, "notificationRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:](v4, "initWithNotificationRequest:", v5);

    }
    -[NCNotificationRequestContentProvider setDelegate:](v6, "setDelegate:", self);
    -[NCFullScreenStagingBannerView setStaticContentProvider:](self->_bannerView, "setStaticContentProvider:", v6);

  }
}

- (void)loadStaticContentWithCompletion:(id)a3
{
  id v4;
  NCFullScreenPresentableViewController *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NCFullScreenPresentableViewController isStaticContentLoadingComplete](v5, "isStaticContentLoadingComplete"))
  {
    -[NCFullScreenPresentableViewController loadViewIfNeeded](v5, "loadViewIfNeeded");
    -[NCFullScreenPresentableViewController staticContentProvider](v5, "staticContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__NCFullScreenPresentableViewController_loadStaticContentWithCompletion___block_invoke;
      v7[3] = &unk_1E8D1B170;
      v8 = v4;
      objc_msgSend(v6, "loadImageAssetsWithCompletion:", v7);

    }
  }
  objc_sync_exit(v5);

}

uint64_t __73__NCFullScreenPresentableViewController_loadStaticContentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadView
{
  _NCFullScreenPresentableViewControllerView *v3;
  _NCFullScreenPresentableViewControllerView *v4;
  id v5;

  v3 = [_NCFullScreenPresentableViewControllerView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v4 = -[_NCFullScreenPresentableViewControllerView initWithFrame:](v3, "initWithFrame:");
  -[NCFullScreenPresentableViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCFullScreenPresentableViewController;
  -[NCFullScreenPresentableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[NCFullScreenPresentableViewController _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  -[NCFullScreenPresentableViewController _configureBackgroundOpaqueViewIfNecessary](self, "_configureBackgroundOpaqueViewIfNecessary");
  -[NCFullScreenPresentableViewController _configureBannerViewIfNecessary](self, "_configureBannerViewIfNecessary");
  -[NCFullScreenPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("nc-full-screen-presentable-view"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewController;
  -[NCFullScreenPresentableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[NCFullScreenPresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAllowsHitTesting:", 1);
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4;
  NCFullScreenStagingBannerView *bannerView;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCFullScreenPresentableViewController;
  -[NCFullScreenPresentableViewController viewIsAppearing:](&v10, sel_viewIsAppearing_, a3);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke;
  v9[3] = &unk_1E8D1B568;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
  objc_initWeak(&location, self);
  bannerView = self->_bannerView;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke_2;
  v6[3] = &unk_1E8D1D480;
  objc_copyWeak(&v7, &location);
  -[NCFullScreenStagingBannerView transitionToStage:completion:](bannerView, "transitionToStage:completion:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startDetailStageTransitionTimerIfNecessary");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewController;
  -[NCFullScreenPresentableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[NCFullScreenPresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsHitTesting:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  NCFullScreenPresentableViewController *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NCFullScreenPresentableViewController;
  -[NCFullScreenPresentableViewController viewDidDisappear:](&v13, sel_viewDidDisappear_, a3);
  v4 = self;
  objc_sync_enter(v4);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCFullScreenPresentableViewController activeTransitionBlockingAssertions](v4, "activeTransitionBlockingAssertions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidateWithReason:", CFSTR("fullScreenPresentable.invalidationReason.dismissed"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v5;
  double v6;
  CGSize result;

  -[NCFullScreenPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", a4.width, a4.height);
  -[NCFullScreenPresentableViewController preferredContentSize](self, "preferredContentSize");
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSString)requesterIdentifier
{
  if (requesterIdentifier_onceToken != -1)
    dispatch_once(&requesterIdentifier_onceToken, &__block_literal_global_11);
  return (NSString *)(id)requesterIdentifier___requesterIdentifier;
}

void __60__NCFullScreenPresentableViewController_requesterIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)requesterIdentifier___requesterIdentifier;
  requesterIdentifier___requesterIdentifier = v0;

}

- (NSString)requestIdentifier
{
  return (NSString *)-[NCNotificationRequest notificationIdentifier](self->_notificationRequest, "notificationIdentifier");
}

- (BOOL)isDraggingDismissalEnabled
{
  return 0;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
  v5[3] = &unk_1E8D1D450;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v4, "setActionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double Height;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGRect v79;
  CGRect v80;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_bannerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    switch(objc_msgSend(v3, "state"))
    {
      case 1:
        objc_msgSend(v6, "_setPanning:", 1);
        objc_msgSend(v6, "_invalidateDetailStageTransitionTimerIfNecessary");
        goto LABEL_5;
      case 2:
LABEL_5:
        UIRectGetCenter();
        v22 = v21;
        v24 = v23;
        objc_msgSend(v3, "translationInCoordinateSpace:", v8);
        objc_msgSend(*(id *)(a1 + 32), "_rubberbandedTranslationForTranslation:", v25);
        v27 = v26;
        v28 = v24 + v26;
        objc_msgSend(*(id *)(a1 + 32), "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        Height = CGRectGetHeight(v79);
        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "interactiveDismissalThreshold");
        v33 = Height * v32;

        v34 = -v27;
        if (v27 >= 0.0)
          v34 = v27;
        v35 = fmin(fmax(v34 / v33, 0.0), 1.0);
        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "interactiveDismissalMinContentScale");
        v38 = 1.0 - v35 + v35 * v37;

        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "interactiveDismissalMinContentAlpha");
        v41 = 1.0 - v35 + v35 * v40;

        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "interactiveDismissalMinBackgroundProgress");
        v44 = 1.0 - v35 + v35 * v43;

        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "interactiveDismissalTrackingSettings");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_2;
        v71[3] = &unk_1E8D1D4C8;
        v74 = v22;
        v75 = v28;
        v76 = v38;
        v77 = v41;
        v72 = v7;
        v73 = v6;
        v78 = v44;
        objc_msgSend(v46, "animateTracking:animations:completion:", 1, v71, 0);

        v20 = v72;
        goto LABEL_8;
      case 3:
        objc_msgSend(v3, "translationInCoordinateSpace:", v8);
        v48 = v47;
        objc_msgSend(v3, "velocityInCoordinateSpace:", v8);
        v50 = v49;
        objc_msgSend(v8, "traitCollection");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "displayScale");
        v53 = NCTranslationWithVelocityAndDefaultScrollViewAcceleration(v50, v52);

        objc_msgSend(*(id *)(a1 + 32), "_rubberbandedTranslationForTranslation:", v48 + v53);
        v55 = v54;
        objc_msgSend(*(id *)(a1 + 32), "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bounds");
        v57 = CGRectGetHeight(v80);
        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "interactiveDismissalThreshold");
        v60 = v57 * v59;

        v61 = -v55;
        if (v55 >= 0.0)
          v61 = v55;
        if (v61 <= v60)
          goto LABEL_3;
        objc_msgSend(v6, "_setPanning:", 0);
        objc_msgSend(v6, "_requestDismissalWithReason:", *MEMORY[0x1E0D01030]);
        break;
      case 4:
      case 5:
LABEL_3:
        objc_msgSend(v6, "_setPanning:", 0);
        +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "interactiveDismissalAutomaticSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = MEMORY[0x1E0C809B0];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_3;
        v64[3] = &unk_1E8D1D4F0;
        v67 = v10;
        v68 = v12;
        v69 = v14;
        v70 = v16;
        v65 = v7;
        v66 = v6;
        v62[0] = v19;
        v62[1] = 3221225472;
        v62[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_4;
        v62[3] = &unk_1E8D1D480;
        objc_copyWeak(&v63, v4);
        objc_msgSend(v18, "animateTracking:animations:completion:", 0, v64, v62);

        objc_destroyWeak(&v63);
        v20 = v65;
LABEL_8:

        break;
      default:
        break;
    }

  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  objc_msgSend(v2, "setTransform:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "_backgroundMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWeighting:", *(double *)(a1 + 80));

  if (objc_msgSend(*(id *)(a1 + 32), "stage") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_backgroundOpaqueView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 80));

  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[3];

  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "_backgroundMaterialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", 1.0);

  if (objc_msgSend(*(id *)(a1 + 32), "stage") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_backgroundOpaqueView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_4(uint64_t a1, int a2, char a3)
{
  id WeakRetained;

  if (a2)
  {
    if ((a3 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_startDetailStageTransitionTimerIfNecessary");

    }
  }
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NCFullScreenPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_1E8D1D518;
  v7 = v4;
  v5 = v4;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillAppearAsBanner_, v6);

}

uint64_t __71__NCFullScreenPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__NCFullScreenPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_1E8D1D518;
  v7 = v4;
  v5 = v4;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidAppearAsBanner_, v6);

}

uint64_t __70__NCFullScreenPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__NCFullScreenPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E8D1D540;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillDisappearAsBanner_withReason_, v10);

}

uint64_t __85__NCFullScreenPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__NCFullScreenPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E8D1D540;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidDisappearAsBanner_withReason_, v10);

}

uint64_t __84__NCFullScreenPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__NCFullScreenPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E8D1D518;
  v7 = v4;
  v5 = v4;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionWillBeginForBannerForPresentable_, v6);

}

uint64_t __89__NCFullScreenPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionWillBeginForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__NCFullScreenPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E8D1D518;
  v7 = v4;
  v5 = v4;
  -[NCFullScreenPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionDidEndForBannerForPresentable_, v6);

}

uint64_t __86__NCFullScreenPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionDidEndForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)addPresentableObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removePresentableObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (NSDictionary)notificationUsageTrackingState
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "notificationRequestPresenterNotificationUsageTrackingState:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSSet)activeTransitionBlockingAssertions
{
  NCFullScreenPresentableViewController *v2;
  id v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2->_reasonsToTransitionBlockingAssertions;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](v2->_reasonsToTransitionBlockingAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isValid"))
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return (NSSet *)v3;
}

- (id)requestTransitionBlockingAssertionWithReason:(id)a3
{
  id v4;
  NCFullScreenPresentableViewController *v5;
  NCAssertion *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMapTable *reasonsToTransitionBlockingAssertions;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NCFullScreenPresentableViewController activeTransitionBlockingAssertionForReason:](v5, "activeTransitionBlockingAssertionForReason:", v4);
    v6 = (NCAssertion *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (id)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[NCNotificationRequest notificationIdentifier](v5->_notificationRequest, "notificationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "un_logDigest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2114;
        v19 = v4;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "New transition blocking assertion requested for full screen presentable view controller for request '%{public}@' with reason '%{public}@' – invalidating detail stage transition timer", buf, 0x16u);

      }
      -[NCFullScreenPresentableViewController _invalidateDetailStageTransitionTimerIfNecessary](v5, "_invalidateDetailStageTransitionTimerIfNecessary");
      if (!v5->_reasonsToTransitionBlockingAssertions)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
        v10 = objc_claimAutoreleasedReturnValue();
        reasonsToTransitionBlockingAssertions = v5->_reasonsToTransitionBlockingAssertions;
        v5->_reasonsToTransitionBlockingAssertions = (NSMapTable *)v10;

      }
      v6 = -[NCAssertion initWithInstantiationReason:]([NCAssertion alloc], "initWithInstantiationReason:", v4);
      objc_initWeak((id *)buf, v5);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __86__NCFullScreenPresentableViewController_requestTransitionBlockingAssertionWithReason___block_invoke;
      v14[3] = &unk_1E8D1B1F0;
      objc_copyWeak(&v15, (id *)buf);
      -[NCAssertion addInvalidationBlock:](v6, "addInvalidationBlock:", v14);
      -[NSMapTable setObject:forKey:](v5->_reasonsToTransitionBlockingAssertions, "setObject:forKey:", v6, v4);
      WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "notificationRequestPresenter:didVendTransitionBlockingAssertion:", v5, v6);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __86__NCFullScreenPresentableViewController_requestTransitionBlockingAssertionWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(WeakRetained, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Transition blocking assertion for full screen presentable view controller for request '%{public}@' invalidated with reason '%{public}@' – starting detail stage transition timer", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(WeakRetained, "_startDetailStageTransitionTimerIfNecessary");

}

- (id)activeTransitionBlockingAssertionForReason:(id)a3
{
  id v4;
  NCFullScreenPresentableViewController *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_reasonsToTransitionBlockingAssertions, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
  -[NCFullScreenPresentableViewController _askDelegateToExecuteAction:withParameters:animated:](self, "_askDelegateToExecuteAction:withParameters:animated:", a4, MEMORY[0x1E0C9AA70], a5);
}

- (double)transitionDuration:(id)a3
{
  return 1.0;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (-[NCFullScreenPresentableViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared"))
  {
    objc_initWeak(&location, self);
    -[NCFullScreenPresentableViewController _backgroundAnimationSettingsForStage:](self, "_backgroundAnimationSettingsForStage:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke;
    v14[3] = &unk_1E8D1CB40;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_2;
    v12[3] = &unk_1E8D1B8A8;
    v13 = v15;
    NCPerformActionsAnimatingIfNecessary(v5, v14, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_3;
    v10[3] = &unk_1E8D1B568;
    v11 = v4;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_4;
    v8[3] = &unk_1E8D1B8A8;
    v9 = v11;
    -[NCFullScreenPresentableViewController _animateDismissalWithAdditionalAnimations:completion:](self, "_animateDismissalWithAdditionalAnimations:completion:", v10, v8);

  }
}

void __59__NCFullScreenPresentableViewController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backgroundMaterialView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWeighting:", 1.0);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");

}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  return result;
}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (id)_backgroundAnimationSettingsForStage:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch(a3)
  {
    case 3:
      objc_msgSend(v4, "dismissBackgroundSettings");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v4, "detailBackgroundSettings");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v4, "briefBackgroundSettings");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3
{
  void (**v5)(void *, uint64_t);
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NCNotificationRequest *notificationRequest;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[5];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NCFullScreenStagingBannerView stage](self->_bannerView, "stage") > 1)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      v13 = v11;
      -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "un_logDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "Notification request '%{public}@' is already at least at detail stage – aborting transition attempt", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke;
    aBlock[3] = &unk_1E8D1D568;
    objc_copyWeak(&v21, &location);
    aBlock[4] = self;
    v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    -[NCNotificationRequest options](self->_notificationRequest, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "revealsAdditionalContentOnPresentation");

    if (v7)
    {
      v8 = (id)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NCNotificationRequest notificationIdentifier](self->_notificationRequest, "notificationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "un_logDigest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v10;
        _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Notification request '%{public}@' specifies revealing additional content on presentation – transitioning to detail stage", buf, 0xCu);

      }
      v5[2](v5, 1);
    }
    else
    {
      -[NCFullScreenPresentableViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "notificationRequestPresenter:shouldTransitionToStage:forTrigger:completionBlock:", self, CFSTR("fullScreenPresentable.presentingStage.detail"), a3, v5);
      }
      else
      {
        v17 = (id)*MEMORY[0x1E0DC5F70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[NCNotificationRequest notificationIdentifier](self->_notificationRequest, "notificationIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "un_logDigest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v19;
          _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "Delegate for full screen presentable view controller for request '%{public}@' doesn't respond to selector – denying transition to detail stage", buf, 0xCu);

        }
        v5[2](v5, 0);
      }

    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v7 = v5;
      objc_msgSend(WeakRetained, "notificationRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning notification request '%{public}@' to detail stage", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_backgroundAnimationSettingsForStage:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke_58;
    v17[3] = &unk_1E8D1B568;
    v17[4] = WeakRetained;
    NCPerformActionsAnimatingIfNecessary(v11, v17, 0);

    objc_msgSend(WeakRetained, "_bannerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transitionToStage:completion:", 2, 0);

    objc_msgSend(WeakRetained, "_invalidateDetailStageTransitionTimerIfNecessary");
  }
  else if (v6)
  {
    v13 = v5;
    objc_msgSend(WeakRetained, "notificationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "Delegate for full screen presentable view controller for request '%{public}@' returned 'NO' – denying transition to detail stage", buf, 0xCu);

  }
}

void __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke_58(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundOpaqueView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_animateDismissalWithAdditionalAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  char v26;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = BSEqualStrings();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke;
  aBlock[3] = &unk_1E8D1D590;
  objc_copyWeak(&v25, &location);
  v26 = v8;
  v10 = v6;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_2;
  v21[3] = &unk_1E8D1B278;
  objc_copyWeak(&v22, &location);
  v12 = _Block_copy(v21);
  if (v8)
  {
    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interactiveDismissalAutomaticSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NCPerformActionsAnimatingIfNecessary(v14, v11, 0);

    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interactiveDismissalBackgoundSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NCPerformActionsAnimatingIfNecessary(v16, v12, v7);

  }
  else
  {
    -[NCFullScreenPresentableViewController _backgroundAnimationSettingsForStage:](self, "_backgroundAnimationSettingsForStage:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_3;
    v18[3] = &unk_1E8D1D5B8;
    v19 = v11;
    v20 = v12;
    NCPerformActionsAnimatingIfNecessary(v17, v18, 0);

    -[NCFullScreenStagingBannerView transitionToStage:completion:](self->_bannerView, "transitionToStage:completion:", 3, v7);
    v15 = v19;
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  CGAffineTransform v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "_bannerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactiveDismissalFinalContentScale");
    v7 = v6;

    CGAffineTransformMakeScale(&v9, v7, v7);
    objc_msgSend(v4, "setTransform:", &v9);
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_backgroundMaterialView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWeighting:", 0.0);

  objc_msgSend(WeakRetained, "_backgroundOpaqueView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

uint64_t __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_startDetailStageTransitionTimerIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  NCNotificationRequest *notificationRequest;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSTimer *v15;
  NSTimer *detailStageTransitionTimer;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_detailStageTransitionTimer
    && -[NCFullScreenStagingBannerView stage](self->_bannerView, "stage") <= 1
    && !self->_panning)
  {
    -[NCFullScreenPresentableViewController activeTransitionBlockingAssertions](self, "activeTransitionBlockingAssertions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      v5 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        notificationRequest = self->_notificationRequest;
        v7 = v5;
        -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "un_logDigest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v9;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Starting transition timer for full screen presentable view controller for request '%{public}@'", buf, 0xCu);

      }
      +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_detailStageTransitionRemainingAttempts = objc_msgSend(v10, "detailStageTransitionMaxAttempts");

      objc_initWeak((id *)buf, self);
      v11 = (void *)MEMORY[0x1E0C99E88];
      +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detailStageTransitionDelay");
      v14 = v13;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__NCFullScreenPresentableViewController__startDetailStageTransitionTimerIfNecessary__block_invoke;
      v17[3] = &unk_1E8D1D5E0;
      objc_copyWeak(&v18, (id *)buf);
      objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v17, v14);
      v15 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      detailStageTransitionTimer = self->_detailStageTransitionTimer;
      self->_detailStageTransitionTimer = v15;

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __84__NCFullScreenPresentableViewController__startDetailStageTransitionTimerIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[124];
    v4 = v3 < 1;
    v5 = v3 - 1;
    if (v4)
    {
      v12 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_msgSend(v2, "notificationRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notificationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "un_logDigest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "Ceasing attempts to animate transition of notification request '%{public}@' to detail stage – no attempts remaining", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(v2, "_invalidateDetailStageTransitionTimerIfNecessary");
    }
    else
    {
      WeakRetained[124] = v5;
      v6 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        objc_msgSend(v2, "notificationRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notificationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "un_logDigest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v2[124];
        v17 = 138543618;
        v18 = v10;
        v19 = 2050;
        v20 = v11;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to animate transition of notification request '%{public}@' to detail stage – %{public}ld attempts remaining", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(v2, "_animateTransitionToDetailStateForTrigger:", 7);
    }
  }

}

- (void)_invalidateDetailStageTransitionTimerIfNecessary
{
  void *v3;
  NCNotificationRequest *notificationRequest;
  NSObject *v5;
  void *v6;
  void *v7;
  NSTimer *detailStageTransitionTimer;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    v5 = v3;
    -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "un_logDigest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating transition timer for full screen presentable view controller for request '%{public}@'", (uint8_t *)&v9, 0xCu);

  }
  -[NSTimer invalidate](self->_detailStageTransitionTimer, "invalidate");
  detailStageTransitionTimer = self->_detailStageTransitionTimer;
  self->_detailStageTransitionTimer = 0;

}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  void *v3;
  void *v4;
  MTMaterialView *v5;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v7;
  id v8;

  if (!self->_backgroundMaterialView)
  {
    v3 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("fullScreenBannerBackground"), v4, 0, 0, 0.0);
    v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v5;

    -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self->_backgroundMaterialView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
    -[NCFullScreenPresentableViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = self->_backgroundMaterialView;
    objc_msgSend(v8, "bounds");
    -[MTMaterialView setFrame:](v7, "setFrame:");
    objc_msgSend(v8, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);

  }
}

- (void)_configureBackgroundOpaqueViewIfNecessary
{
  _NCFullScreenPresentableViewControllerOpaqueBackgroundView *v3;
  UIView *v4;
  UIView *backgroundOpaqueView;
  UIView *v6;
  void *v7;
  UIView *v8;
  id v9;

  if (!self->_backgroundOpaqueView)
  {
    -[NCFullScreenPresentableViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [_NCFullScreenPresentableViewControllerOpaqueBackgroundView alloc];
    objc_msgSend(v9, "bounds");
    v4 = -[_NCFullScreenPresentableViewControllerOpaqueBackgroundView initWithFrame:](v3, "initWithFrame:");
    backgroundOpaqueView = self->_backgroundOpaqueView;
    self->_backgroundOpaqueView = v4;

    v6 = self->_backgroundOpaqueView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setAlpha:](self->_backgroundOpaqueView, "setAlpha:", 0.0);
    v8 = self->_backgroundOpaqueView;
    if (self->_backgroundMaterialView)
      objc_msgSend(v9, "insertSubview:aboveSubview:", v8);
    else
      objc_msgSend(v9, "insertSubview:atIndex:", v8);
    -[UIView setAutoresizingMask:](self->_backgroundOpaqueView, "setAutoresizingMask:", 18);

  }
}

- (void)_configureBannerViewIfNecessary
{
  NCFullScreenStagingBannerView *v3;
  void *v4;
  NCFullScreenStagingBannerView *v5;
  NCFullScreenStagingBannerView *bannerView;
  NCFullScreenStagingBannerView *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NCFullScreenStagingBannerView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NCFullScreenStagingBannerView *v19;
  void *v20;
  void *v21;
  NCFullScreenStagingBannerView *v22;
  id *v23;
  id *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_bannerView)
  {
    v3 = [NCFullScreenStagingBannerView alloc];
    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NCFullScreenStagingBannerView initWithSettings:](v3, "initWithSettings:", v4);
    bannerView = self->_bannerView;
    self->_bannerView = v5;

    objc_initWeak(&location, self);
    v7 = self->_bannerView;
    v8 = (void *)MEMORY[0x1E0DC3428];
    v9 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke;
    v31[3] = &unk_1E8D1B1C8;
    v23 = &v32;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v8, "actionWithHandler:", v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCFullScreenStagingBannerView setContentTapAction:](v7, "setContentTapAction:", v10);

    v11 = self->_bannerView;
    v12 = (void *)MEMORY[0x1E0DC3428];
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke_2;
    v29[3] = &unk_1E8D1B1C8;
    v24 = &v30;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v12, "actionWithHandler:", v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCFullScreenStagingBannerView setDefaultTapAction:](v11, "setDefaultTapAction:", v13);

    -[NCFullScreenPresentableViewController _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NCFullScreenStagingBannerView requiredVisualStyleCategories](self->_bannerView, "requiredVisualStyleCategories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v14);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "integerValue", v23, v24);
          v19 = self->_bannerView;
          -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundMaterialView, "visualStylingProviderForCategory:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCFullScreenStagingBannerView setVisualStylingProvider:forCategory:](v19, "setVisualStylingProvider:forCategory:", v20, v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v15);
    }

    -[NCFullScreenPresentableViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_bannerView;
    objc_msgSend(v21, "bounds");
    -[NCFullScreenStagingBannerView setFrame:](v22, "setFrame:");
    objc_msgSend(v21, "addSubview:", self->_bannerView);
    -[NCFullScreenStagingBannerView setAutoresizingMask:](self->_bannerView, "setAutoresizingMask:", 18);
    -[NCFullScreenPresentableViewController invalidateStaticContent](self, "invalidateStaticContent");

    objc_destroyWeak(v24);
    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

void __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleBannerContentTap");

}

void __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleBannerDefaultTap");

}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if (v17)
  {
    -[NCNotificationRequest userNotification](self->_notificationRequest, "userNotification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x1E0CEC8A8]);
      v14 = objc_msgSend(v12, "copy");

      v7 = (id)v14;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NCFullScreenPresentableViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "notificationRequestPresenter:executeAction:withParameters:completion:", self, v17, v7, 0);

    }
  }

}

- (void)_executeDefaultAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NCFullScreenStagingBannerView staticContentProvider](self->_bannerView, "staticContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v3);
    v5 = v6;
  }

}

- (void)_handleBannerContentTap
{
  void *v3;
  NCNotificationRequest *notificationRequest;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationRequest *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NCNotificationRequest *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  notificationRequest = self->_notificationRequest;
  -[NCFullScreenPresentableViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLookDefaultActionInvokedWithTrigger:forNotificationRequest:withState:", 0, notificationRequest, v5);

  -[NCFullScreenPresentableViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "fullScreenPresentableViewControllerShouldTransitionToDetailStageOnTap:", self)
    && -[NCFullScreenStagingBannerView stage](self->_bannerView, "stage") != 2)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_notificationRequest;
      v9 = v7;
      -[NCNotificationRequest notificationIdentifier](v8, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Notification request presenter tap performing transition to detail stage for request '%{public}@'", (uint8_t *)&v19, 0xCu);

    }
    -[NCFullScreenPresentableViewController _invalidateDetailStageTransitionTimerIfNecessary](self, "_invalidateDetailStageTransitionTimerIfNecessary");
    -[NCFullScreenPresentableViewController _animateTransitionToDetailStateForTrigger:](self, "_animateTransitionToDetailStateForTrigger:", 4);
  }
  else
  {
    -[NCFullScreenStagingBannerView staticContentProvider](self->_bannerView, "staticContentProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_notificationRequest;
        v16 = v14;
        -[NCNotificationRequest notificationIdentifier](v15, "notificationIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "un_logDigest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "Notification request presenter tap performing default action for request '%{public}@'", (uint8_t *)&v19, 0xCu);

      }
      -[NCFullScreenPresentableViewController _executeDefaultAction:](self, "_executeDefaultAction:", 1);
    }
  }

}

- (void)_requestDismissalWithReason:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_dismissalRequestReason, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "fullScreenPresentableViewController:requestsDismissalWithReason:", self, v6);

}

- (void)_handleBannerDefaultTap
{
  -[NCFullScreenPresentableViewController _requestDismissalWithReason:](self, "_requestDismissalWithReason:", *MEMORY[0x1E0D01038]);
}

- (double)_rubberbandedTranslationForTranslation:(double)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t rect;
  CGRect v31;

  -[NCFullScreenPresentableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[NCFullScreenStagingBannerView contentFrame](self->_bannerView, "contentFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  rect = v20;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  CGRectGetHeight(v31);
  v21 = v15;
  v22 = v17;
  v23 = v19;
  v24 = rect;
  if (a3 <= 0.0)
    CGRectGetMinY(*(CGRect *)&v21);
  else
    CGRectGetMaxY(*(CGRect *)&v21);
  +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "interactiveDismissalRubberbandingInset");

  +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "interactiveDismissalRubberbandingRange");

  BSUIConstrainValueToIntervalWithRubberBand();
  if (a3 < 0.0)
    v28 = -v27;
  else
    v28 = v27;

  return v28;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NCFullScreenPresentableViewControllerDelegate)delegate
{
  return (NCFullScreenPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UIView)_backgroundOpaqueView
{
  return self->_backgroundOpaqueView;
}

- (NCFullScreenStagingBannerView)_bannerView
{
  return self->_bannerView;
}

- (BOOL)_isPanning
{
  return self->_panning;
}

- (void)_setPanning:(BOOL)a3
{
  self->_panning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_backgroundOpaqueView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_reasonsToTransitionBlockingAssertions, 0);
  objc_storeStrong((id *)&self->_dismissalRequestReason, 0);
  objc_storeStrong((id *)&self->_detailStageTransitionTimer, 0);
  objc_storeStrong((id *)&self->_transitioningDelegate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
