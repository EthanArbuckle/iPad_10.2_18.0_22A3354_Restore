@implementation PKNavigationDashboardPassViewController

- (PKNavigationDashboardPassViewController)init
{

  return 0;
}

- (PKNavigationDashboardPassViewController)initWithPassGroupView:(id)a3 groupsController:(id)a4 groupViewReceiver:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKNavigationDashboardPassViewController *v15;
  PKNavigationDashboardPassViewController *v16;
  uint64_t v17;
  PKGroup *group;
  PKSecureElement *v19;
  PKSecureElement *secureElement;
  void *v21;
  void *v22;
  PKNavigationDashboardPassViewController *v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    v25.receiver = self;
    v25.super_class = (Class)PKNavigationDashboardPassViewController;
    v15 = -[PKNavigationController init](&v25, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_passGroupView, a3);
      -[PKPassGroupView group](v16->_passGroupView, "group");
      v17 = objc_claimAutoreleasedReturnValue();
      group = v16->_group;
      v16->_group = (PKGroup *)v17;

      v19 = (PKSecureElement *)objc_alloc_init(MEMORY[0x1E0D67630]);
      secureElement = v16->_secureElement;
      v16->_secureElement = v19;

      -[PKSecureElement registerObserver:](v16->_secureElement, "registerObserver:", v16);
      objc_storeStrong((id *)&v16->_groupsController, a4);
      +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_activeState = ($77BFE790A1370D46B4241309C9753022)objc_msgSend(v21, "registerObserver:", v16);

      objc_storeStrong((id *)&v16->_context, a6);
      v16->_snapshotViewIsHidden = 1;
      objc_storeWeak((id *)&v16->_receiver, v13);
      -[PKNavigationDashboardPassViewController _setUpDashboardVC](v16, "_setUpDashboardVC");
      v26[0] = v16->_dashboardVC;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKNavigationDashboardPassViewController setViewControllers:](v16, "setViewControllers:", v22);

      -[PKNavigationDashboardPassViewController setTransitioningDelegate:](v16, "setTransitioningDelegate:", v16);
      -[PKNavigationDashboardPassViewController _registerForTextTraitChanges](v16, "_registerForTextTraitChanges");
    }
    self = v16;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_setUpDashboardVC
{
  PKDashboardPassViewController *v3;
  PKDashboardPassViewController *dashboardVC;
  PKDashboardPassViewController *v5;
  void *v6;
  void *v7;
  double v8;

  v3 = -[PKDashboardPassViewController initWithPassGroupView:context:presentingViewController:]([PKDashboardPassViewController alloc], "initWithPassGroupView:context:presentingViewController:", self->_passGroupView, self->_context, self);
  dashboardVC = self->_dashboardVC;
  self->_dashboardVC = v3;

  v5 = self->_dashboardVC;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController setFrontmostPass:](v5, "setFrontmostPass:", v7);

  -[PKDashboardViewController setShouldUseClearNavigationBar:](self->_dashboardVC, "setShouldUseClearNavigationBar:", 1);
  -[PKDashboardViewController setDelegate:](self->_dashboardVC, "setDelegate:", self);
  +[PKDashboardPassFlowLayout topMarginInFirstSection](PKDashboardPassFlowLayout, "topMarginInFirstSection");
  self->_topMargin = v8;
  -[PKNavigationDashboardPassViewController _setLeftBarButtonItem](self, "_setLeftBarButtonItem");
}

- (void)dealloc
{
  objc_super v3;

  -[PKSecureElement unregisterObserver:](self->_secureElement, "unregisterObserver:", self);
  if (!self->_invalidated)
    -[PKNavigationDashboardPassViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", self);

    -[PKPassFooterView invalidate](self->_passFooterView, "invalidate");
    -[PKDashboardPassViewController invalidate](self->_dashboardVC, "invalidate");
    if (self->_updatingOffsets)
      _UIUpdateRequestDeactivate();
  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PKPassView *v9;
  void *v10;
  UIView *v11;
  UIView *snapshotView;
  PKPassthroughView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PKPassthroughView *v18;
  PKPassthroughView *passthroughView;
  PKPassthroughView *v20;
  PKPassthroughView *portalledPassthroughView;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController loadView](&v22, sel_loadView);
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "passType") == 1)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "associatedAccountServiceAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v6, "associatedAccountFeatureIdentifier") != 3)
  {

  }
  else
  {
    objc_msgSend(v6, "dynamicLayerConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_10;
  }
  if ((PKIsLowEndDevice() & 1) != 0)
  {
LABEL_10:
    v9 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v4, 4, 2039);
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v9, "snapshotOfFrontFaceWithRequestedSize:", 80.0, 80.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    snapshotView = self->_snapshotView;
    self->_snapshotView = v11;

    -[UIView setContentMode:](self->_snapshotView, "setContentMode:", 1);
    -[UIView setAccessibilityIgnoresInvertColors:](self->_snapshotView, "setAccessibilityIgnoresInvertColors:", 1);

    goto LABEL_12;
  }
  self->_shouldUpdateSnapshotView = 1;
LABEL_12:
  v13 = [PKPassthroughView alloc];
  v14 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = -[PKPassthroughView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
  passthroughView = self->_passthroughView;
  self->_passthroughView = v18;

  v20 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v14, v15, v16, v17);
  portalledPassthroughView = self->_portalledPassthroughView;
  self->_portalledPassthroughView = v20;

  if (self->_passFooterView)
    -[PKPassthroughView addSubview:](self->_portalledPassthroughView, "addSubview:");
  -[PKPassthroughView setPortal:](self->_passthroughView, "setPortal:", self->_portalledPassthroughView);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PKDashboardPassViewController *dashboardVC;
  void *v7;
  uint64_t v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKDashboardPassViewController view](self->_dashboardVC, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_passthroughView);
  objc_msgSend(v3, "insertSubview:belowSubview:", self->_portalledPassthroughView, v4);
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:", self, sel__handleScrollViewPanGroupGesture_);

  objc_initWeak(&location, self);
  dashboardVC = self->_dashboardVC;
  v8 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v9, &location);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0, v8, 3221225472, __54__PKNavigationDashboardPassViewController_viewDidLoad__block_invoke, &unk_1E3E61C58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController setActionForVisibilityChange:indexPath:](dashboardVC, "setActionForVisibilityChange:indexPath:", &v8, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __54__PKNavigationDashboardPassViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateNavigationBarWithPassAppeared:", a2);
    WeakRetained = v4;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  self->_visibilityState = 1;
  if (!v3 || !self->_isPresentedWithAnimationTransitioner)
  {
    if (-[PKNavigationDashboardPassViewController isBeingPresented](self, "isBeingPresented"))
    {
      -[PKNavigationDashboardPassViewController transitionCoordinator](self, "transitionCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCancelled");

      if ((v6 & 1) == 0)
        -[PKNavigationDashboardPassViewController _ensureCardPresence](self, "_ensureCardPresence");
    }
  }
  -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
  -[PKNavigationDashboardPassViewController _startReportingSessionForPassIfNecessary](self, "_startReportingSessionForPassIfNecessary");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  self->_visibilityState = 0;
  if (!v3 || !self->_isDismissedWithAnimationTransitioner)
  {
    if (-[PKNavigationDashboardPassViewController isBeingDismissed](self, "isBeingDismissed"))
    {
      -[PKNavigationDashboardPassViewController transitionCoordinator](self, "transitionCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCancelled");

      if ((v6 & 1) == 0)
        -[PKNavigationDashboardPassViewController relinquishGroupView](self, "relinquishGroupView");
    }
  }
  -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
  v9 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNavigationDashboardPassViewController reportEventForPassIfNecessary:](self, "reportEventForPassIfNecessary:", v7);

  -[PKNavigationDashboardPassViewController _endReportingSessionForPassIfNecessary](self, "_endReportingSessionForPassIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_visibilityState = 2;
  -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
  -[PKNavigationDashboardPassViewController _updateSnapshotView](self, "_updateSnapshotView");
  -[PKNavigationDashboardPassViewController _startReportingSessionForPassIfNecessary](self, "_startReportingSessionForPassIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  PKStoreKitReviewPromptHelper *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  if (self->_shouldPromptForReviewOnDismissal)
  {
    -[PKNavigationDashboardPassViewController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v6 = objc_alloc_init(PKStoreKitReviewPromptHelper);
      -[PKNavigationDashboardPassViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStoreKitReviewPromptHelper requestReviewInSceneIfEligible:trigger:](v6, "requestReviewInSceneIfEligible:trigger:", v9, self->_reviewTrigger);

    }
  }
  self->_visibilityState = 3;
  -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
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
  void *v12;
  PKPassGroupView *passGroupView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[PKDashboardPassViewController view](self->_dashboardVC, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPassthroughView setFrame:](self->_passthroughView, "setFrame:", v5, v7, v9, v11);
  -[PKPassthroughView setFrame:](self->_portalledPassthroughView, "setFrame:", v5, v7, v9, v11);
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  if (self->_groupViewNeedsToBeMovedWithContentOffset && !self->_passGroupViewIsInCollectionView)
  {
    passGroupView = self->_passGroupView;
    -[PKPassGroupView center](passGroupView, "center");
    -[PKPassGroupView setCenter:](passGroupView, "setCenter:");
  }
  -[PKPassGroupView layoutIfNeeded](self->_passGroupView, "layoutIfNeeded");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  PKPassFooterView *passFooterView;
  CGRect v15;
  CGRect slice;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView superview](self->_passGroupView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameOfVisibleFace");
  objc_msgSend(v9, "convertRect:fromView:", v8);

  PKSizeRoundToPixel();
  v11 = v10;
  memset(&slice, 0, sizeof(slice));
  -[PKPassthroughView bounds](self->_portalledPassthroughView, "bounds");
  v15 = v18;
  CGRectDivide(v18, &slice, &v15, v5, CGRectMinYEdge);
  CGRectDivide(v15, &slice, &v15, v11 + self->_topMargin, CGRectMinYEdge);
  CGRectDivide(v15, &v15, &slice, v7, CGRectMaxYEdge);
  -[PKPassGroupView updatePageControlFrameAnimated:](self->_passGroupView, "updatePageControlFrameAnimated:", 0);
  -[PKPassFooterView configuration](self->_passFooterView, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "style");
  PKPassFrontFaceContentSize();
  passFooterView = self->_passFooterView;
  PKSizeAlignedInRect();
  -[PKPassFooterView setFrame:](passFooterView, "setFrame:");

}

- (void)_pushViewControllerWhenNavigationAvailable:(id)a3 animated:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PKNavigationDashboardPassViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable called with existing presentedViewController. Ignoring %@.", buf, 0xCu);
    }
LABEL_4:

    goto LABEL_15;
  }
  if (self->_isPendingVCPresentation)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable called with queued push still pending. Ignoring %@.", buf, 0xCu);
    }
    goto LABEL_4;
  }
  self->_isPendingVCPresentation = 1;
  objc_initWeak((id *)buf, self);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke;
  aBlock[3] = &unk_1E3E687B0;
  objc_copyWeak(&v20, (id *)buf);
  v18 = v8;
  v21 = a4;
  v19 = v9;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKNavigationDashboardPassViewController transitionCoordinator](self, "transitionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && ((-[PKNavigationDashboardPassViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
     || -[PKNavigationDashboardPassViewController isBeingDismissed](self, "isBeingDismissed")))
  {
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke_2;
    v15[3] = &unk_1E3E67BD0;
    v16 = v13;
    objc_msgSend(v14, "animateAlongsideTransition:completion:", 0, v15);

  }
  else
  {
    v13[2](v13);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_15:

}

void __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "pushViewController:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    WeakRetained = v4;
    *((_BYTE *)v4 + 1744) = 0;
  }

}

uint64_t __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerForTextTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[PKNavigationDashboardPassViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, &__block_literal_global_62);

}

uint64_t __71__PKNavigationDashboardPassViewController__registerForTextTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setLeftBarButtonItem");
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationController navigationController:willShowViewController:animated:](&v26, sel_navigationController_willShowViewController_animated_, v8, v9, v5);
  -[PKNavigationDashboardPassViewController transitionCoordinator](self, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "transitionCoordinator");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    -[PKNavigationDashboardPassViewController _updateTopViewController:](self, "_updateTopViewController:", v9);
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__PKNavigationDashboardPassViewController_navigationController_willShowViewController_animated___block_invoke;
    v22[3] = &unk_1E3E68818;
    objc_copyWeak(&v24, &location);
    v23 = v15;
    objc_msgSend(v13, "notifyWhenInteractionChangesUsingBlock:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKNavigationDashboardPassViewController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "state");

    if (v17 <= 5 && ((1 << v17) & 0x31) != 0)
      -[PKNavigationDashboardPassViewController _updateTopViewController:](self, "_updateTopViewController:", v9);
  }
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "secureElementPass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isIdentityPass");

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PKNavigationDashboardPassViewController _endReportingSessionForPassIfNecessary](self, "_endReportingSessionForPassIfNecessary");
        -[PKNavigationDashboardPassViewController _startReportingSessionForPassIfNecessary](self, "_startReportingSessionForPassIfNecessary");
      }
    }
  }

}

void __96__PKNavigationDashboardPassViewController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend(v4, "isCancelled"))
    objc_msgSend(WeakRetained, "_updateTopViewController:", *(_QWORD *)(a1 + 32));

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)PKNavigationDashboardPassViewController;
  v8 = a4;
  -[PKNavigationController navigationController:didShowViewController:animated:](&v9, sel_navigationController_didShowViewController_animated_, a3, v8, v5);
  -[PKNavigationDashboardPassViewController _updateTopViewController:](self, "_updateTopViewController:", v8, v9.receiver, v9.super_class);

}

- (id)interstitialProvider
{
  return -[PKDashboardPassViewController interstitialProvider](self->_dashboardVC, "interstitialProvider");
}

- (void)_updateTopViewController:(id)a3
{
  self->_dashboardIsVisible = self->_dashboardVC == a3;
  -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
}

- (void)_updatePausedState
{
  _BOOL4 v2;

  v2 = !self->_visibilityState || !self->_dashboardIsVisible || !self->_snapshotViewIsHidden;
  if (self->_shouldPauseDynamicCard != v2)
  {
    self->_shouldPauseDynamicCard = v2;
    -[PKPassGroupView setPaused:](self->_passGroupView, "setPaused:");
  }
}

- (void)_updateSnapshotView
{
  void *v3;
  void *v4;
  void *v5;
  PKPassView *v6;
  double v7;
  CGFloat v8;
  void *v9;
  UIView *snapshotView;
  CATransform3D v11;

  if (self->_shouldUpdateSnapshotView && !self->_snapshotView)
  {
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rendererState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKPassView initWithPass:content:suppressedContent:rendererState:]([PKPassView alloc], "initWithPass:content:suppressedContent:rendererState:", v4, 4, 1527, v5);
    -[PKPassView setModallyPresented:](v6, "setModallyPresented:", 1);
    -[PKPassView setPaused:](v6, "setPaused:", 1);
    -[PKPassView sizeOfFrontFace](v6, "sizeOfFrontFace");
    v8 = 52.0 / v7;
    -[PKPassView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v11, v8, v8, 1.0);
    objc_msgSend(v9, "setTransform:", &v11);

    snapshotView = self->_snapshotView;
    self->_snapshotView = &v6->super;

  }
}

- (void)_updateNavigationBarWithPassAppeared:(BOOL)a3
{
  _BOOL4 v3;
  UIView *snapshotView;
  PKAnimatedNavigationBarTitleView **p_titleView;
  void *v7;
  double v8;
  PKAnimatedNavigationBarTitleView *v9;
  PKAnimatedNavigationBarTitleView *v10;
  void *v11;

  v3 = a3;
  if ((-[PKNavigationDashboardPassViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0
    && (-[PKNavigationDashboardPassViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    if (!v3)
    {
      p_titleView = &self->_titleView;
      if (!self->_titleView)
      {
        -[PKNavigationDashboardPassViewController navigationBar](self, "navigationBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "frame");
        v9 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v8 + v8, v8);
        v10 = *p_titleView;
        *p_titleView = v9;

        -[PKDashboardPassViewController navigationItem](self->_dashboardVC, "navigationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pkui_setCenterAlignedTitleView:", *p_titleView);

      }
      self->_snapshotViewIsHidden = 0;
      -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
      snapshotView = self->_snapshotView;
      goto LABEL_9;
    }
    self->_snapshotViewIsHidden = 1;
    -[PKNavigationDashboardPassViewController _updatePausedState](self, "_updatePausedState");
    snapshotView = 0;
LABEL_8:
    p_titleView = &self->_titleView;
LABEL_9:
    -[PKAnimatedNavigationBarTitleView setTitleView:animated:](*p_titleView, "setTitleView:animated:", snapshotView, 1);
    return;
  }
  if (v3)
  {
    snapshotView = 0;
    goto LABEL_8;
  }
}

- (void)_setLeftBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKDashboardPassViewController navigationItem](self->_dashboardVC, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "sizeToFit");
  }
  else
  {
    -[PKDashboardPassViewController doneButton](self->_dashboardVC, "doneButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v4);
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

}

- (void)acquireGroupView:(id)a3
{
  PKPassGroupView *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  UIPanGestureRecognizer *v10;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PKNavigationDashboardPassViewController *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (PKPassGroupView *)a3;
  if (self->_passGroupView == v4 && !self->_panGestureRecognizer)
  {
    -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134349312;
      v16 = self;
      v17 = 2050;
      v18 = (const char *)v4;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): Acquiring group view (%{public}p)", (uint8_t *)&v15, 0x16u);
    }

    self->_passGroupViewAcquired = 1;
    -[PKPassGroupView delegate](self->_passGroupView, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_formerGroupViewDelegate, v7);

    -[PKPassGroupView setDelegate:](self->_passGroupView, "setDelegate:", self);
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134349314;
        v16 = self;
        v17 = 2080;
        v18 = "-[PKNavigationDashboardPassViewController acquireGroupView:]";
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v15, 0x16u);
      }

    }
    -[PKDashboardPassViewController setFrontmostPass:](self->_dashboardVC, "setFrontmostPass:", v9);
    v10 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanGroupGesture_);
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v10;

    -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
    -[PKPassGroupView addGestureRecognizer:](self->_passGroupView, "addGestureRecognizer:", self->_panGestureRecognizer);
    -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_panGestureRecognizer);

    objc_msgSend(v5, "setNeedsLayout");
    -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);
    -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)relinquishGroupView
{
  NSObject *v3;
  PKPassGroupView *v4;
  PKPassGroupView *passGroupView;
  UIPanGestureRecognizer *panGestureRecognizer;
  id WeakRetained;
  id v8;
  void *v9;
  int v10;
  PKNavigationDashboardPassViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_passGroupView)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): Relinquishing group view", (uint8_t *)&v10, 0xCu);
    }

    self->_passGroupViewAcquired = 0;
    v4 = self->_passGroupView;
    passGroupView = self->_passGroupView;
    self->_passGroupView = 0;

    -[PKDashboardPassViewController setFrontmostPass:](self->_dashboardVC, "setFrontmostPass:", 0);
    -[PKPassGroupView removeGestureRecognizer:](v4, "removeGestureRecognizer:", self->_panGestureRecognizer);
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
    if (WeakRetained)
      -[PKPassGroupView setDelegate:](v4, "setDelegate:", WeakRetained);
    objc_storeWeak((id *)&self->_formerGroupViewDelegate, 0);
    v8 = objc_loadWeakRetained((id *)&self->_receiver);
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "groupViewIsAvailable:", v4);
    -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);

  }
}

- (void)_ensureCardPresence
{
  void *v3;
  _QWORD v4[5];

  if (self->_activeState.foregroundActive)
  {
    if (PKViewVisibilityStateIsVisible())
    {
      -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __62__PKNavigationDashboardPassViewController__ensureCardPresence__block_invoke_2;
      v4[3] = &unk_1E3E62288;
      v4[4] = self;
      objc_msgSend(v3, "performBatchUpdates:completion:", &__block_literal_global_252, v4);

    }
  }
}

void __62__PKNavigationDashboardPassViewController__ensureCardPresence__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "insertGroupView");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1832);
  objc_msgSend(v2, "frontmostPass");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nfcPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiresAuthentication") ^ 1;

  objc_msgSend(v2, "shouldPresentAllContent:animated:", v4, 1);
}

- (void)scrollToTop
{
  PKDashboardPassViewController *dashboardVC;
  void *v4;
  double v5;
  id v6;

  dashboardVC = self->_dashboardVC;
  -[PKNavigationDashboardPassViewController _cardIndexPath](self, "_cardIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController setActionForVisibilityChange:indexPath:](dashboardVC, "setActionForVisibilityChange:indexPath:", 0, v4);

  -[PKNavigationDashboardPassViewController _updateNavigationBarWithPassAppeared:](self, "_updateNavigationBarWithPassAppeared:", 1);
  -[PKNavigationDashboardPassViewController _setOffsetAnimation:](self, "_setOffsetAnimation:", 0);
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedContentInset");
  objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, -v5);

}

- (id)_cardIndexPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
}

- (void)_dismissIfPossibleWithVelocity:(double)a3 byDragging:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  id WeakRetained;
  id v14;
  void *v15;
  id v16;

  v4 = a4;
  -[PKNavigationDashboardPassViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = v7;
    -[PKNavigationDashboardPassViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "isCancelled") ^ 1;
    else
      v10 = 1;
    v11 = -[PKNavigationDashboardPassViewController isBeingPresented](self, "isBeingPresented");
    v12 = -[PKNavigationDashboardPassViewController isBeingDismissed](self, "isBeingDismissed");
    if (v10)
    {
      if ((v12 & 1) != 0)
        goto LABEL_21;
    }
    else if ((v11 & 1) != 0)
    {
LABEL_21:

      v7 = v16;
      goto LABEL_22;
    }
    self->_dismissedByDragging = v4;
    if (a3 > 0.0 && v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "groupViewNeedsAnimating:withVelocity:dragging:", self->_passGroupView, 1, a3);

    }
    if (v11)
    {
      v14 = objc_loadWeakRetained((id *)&self->_transitioningHandler);
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "setDragged:", self->_dismissedByDragging);
        objc_msgSend(v15, "cancel");
      }
      else
      {
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);
      }

    }
    else
    {
      objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    self->_dismissedByDragging = 0;
    goto LABEL_21;
  }
LABEL_22:

}

- (BOOL)isFrontmostPassAuthorized
{
  return -[PKPassFooterView isPassAuthorized](self->_passFooterView, "isPassAuthorized");
}

- (void)groupViewTapped:(id)a3
{
  -[PKNavigationDashboardPassViewController _dismissIfPossibleWithVelocity:byDragging:](self, "_dismissIfPossibleWithVelocity:byDragging:", 0, 0.0);
}

- (BOOL)groupViewShouldAllowPanning:(id)a3
{
  return 0;
}

- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3
{
  return 5;
}

- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4
{
  id v6;
  id WeakRetained;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(WeakRetained, "groupViewContentModeForFrontmostPassWhenPiled:withDefaultContentMode:", v6, a4);

  return a4;
}

- (unint64_t)groupViewPassesSuppressedContent:(id)a3
{
  id v4;
  id WeakRetained;
  unint64_t v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "groupViewPassesSuppressedContent:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)groupView:(id)a3 didUpdatePassView:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupViewDidUpdatePassView:", v11);

  }
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);
    objc_msgSend(v11, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassViewController setFrontmostPass:](self->_dashboardVC, "setFrontmostPass:", v10);

  }
}

- (void)_cancelPostTransactionTimer
{
  NSObject *postTransactionTimer;
  OS_dispatch_source *v4;

  postTransactionTimer = self->_postTransactionTimer;
  if (postTransactionTimer)
  {
    dispatch_source_cancel(postTransactionTimer);
    v4 = self->_postTransactionTimer;
    self->_postTransactionTimer = 0;

  }
}

- (void)_startPostTransactionTimerIfNeccessary
{
  OS_dispatch_source *v3;
  OS_dispatch_source *postTransactionTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD handler[5];

  if (!self->_postTransactionTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    postTransactionTimer = self->_postTransactionTimer;
    self->_postTransactionTimer = v3;

    v5 = self->_postTransactionTimer;
    v6 = dispatch_time(0, 2500000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v7 = self->_postTransactionTimer;
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke;
    handler[3] = &unk_1E3E612E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    v9 = self->_postTransactionTimer;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke_2;
    v10[3] = &unk_1E3E612E8;
    v10[4] = self;
    dispatch_source_set_cancel_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_postTransactionTimer);
  }
}

uint64_t __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 1800);
  if (v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 1800) = 0;

    return objc_msgSend(*(id *)(v3 + 32), "_updateDashboardAndFooterContentPostTransaction:", 0);
  }
  return result;
}

void __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1800);
  *(_QWORD *)(v1 + 1800) = 0;

}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PKDashboardPassViewController passFlowLayout](self->_dashboardVC, "passFlowLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFade:", 1);

    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupViewDidChangeFrontmostPassView:withContext:", v15, v7);

  }
  -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[PKNavigationDashboardPassViewController _updateDashboardAndFooterContentPostTransaction:](self, "_updateDashboardAndFooterContentPostTransaction:", 0);
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDashboardPassViewController setFrontmostPass:](self->_dashboardVC, "setFrontmostPass:", v14);
}

- (void)groupView:(id)a3 faceViewFrameDidChangeForFrontmostPassView:(id)a4
{
  id v4;

  -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setFooterSuppressed:(BOOL)a3
{
  void *v4;

  if (((!self->_footerSuppressed ^ a3) & 1) == 0)
  {
    self->_footerSuppressed = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");

    }
    -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);
  }
}

- (id)_createPassFooterConfigurationForPassView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKPassFooterViewConfiguration *v8;

  if (!a3 || self->_invalidated)
    return 0;
  v4 = a3;
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKValueAddedServicesEnabledForPass())
  {
    if (-[PKSecureElement isInRestrictedMode](self->_secureElement, "isInRestrictedMode"))
      v6 = 3;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  v8 = -[PKPassFooterViewConfiguration initWithPassView:state:]([PKPassFooterViewConfiguration alloc], "initWithPassView:state:", v4, v6);

  return v8;
}

- (void)_updatePassFooterViewIfNecessaryPostTransaction:(BOOL)a3
{
  -[PKNavigationDashboardPassViewController _updatePassFooterViewWithReload:postTransaction:](self, "_updatePassFooterViewWithReload:postTransaction:", 0, a3);
}

- (void)_updatePassFooterView
{
  -[PKNavigationDashboardPassViewController _updatePassFooterViewWithReload:postTransaction:](self, "_updatePassFooterViewWithReload:postTransaction:", 1, 0);
}

- (void)_updatePassFooterViewWithReload:(BOOL)a3 postTransaction:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  double v9;
  int v10;
  void *v11;
  int passFooterViewVisible;
  double v13;
  double v14;
  void *v15;
  int v16;
  int v17;
  unsigned int passFooterViewVisibilityToken;
  PKPassFooterView *v19;
  PKPassFooterView *passFooterView;
  NSObject *v21;
  PKPassFooterView *v22;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[6];
  _QWORD aBlock[4];
  unsigned int v39;
  BOOL v40;
  char v41;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v43;
  __int16 v44;
  PKPassFooterView *v45;
  uint64_t v46;

  v4 = a4;
  v5 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (!a4)
    -[PKNavigationDashboardPassViewController _cancelPostTransactionTimer](self, "_cancelPostTransactionTimer");
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKNavigationDashboardPassViewController _createPassFooterConfigurationForPassView:](self, "_createPassFooterConfigurationForPassView:", v33);
  v8 = v7;
  v9 = 0.0;
  if (self->_invalidated
    || !objc_msgSend(v7, "state")
    || self->_passDeletionInitiated
    || !self->_passGroupViewAcquired
    || self->_footerSuppressed)
  {
    v10 = 0;
    v5 = 0;
    v11 = v8;
    v8 = 0;
  }
  else
  {
    objc_msgSend(v33, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)-[PKNavigationDashboardPassViewController _passFooterAlphaForPass:postTransaction:](self, "_passFooterAlphaForPass:postTransaction:", v11, v4);
    v10 = 1;
  }

  passFooterViewVisible = self->_passFooterViewVisible;
  -[PKPassFooterView alpha](self->_passFooterView, "alpha");
  v14 = v13;
  -[PKPassFooterView configuration](self->_passFooterView, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PKEqualObjects();

  v17 = v16 ^ 1;
  if ((v10 & v5 & 1) != 0 || passFooterViewVisible != v10 || (v17 & 1) != 0 || v14 != v9)
  {
    -[PKNavigationDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_passFooterViewVisible = v10;
    passFooterViewVisibilityToken = self->_passFooterViewVisibilityToken;
    if (passFooterViewVisible == v10)
    {
      if (!v10)
        goto LABEL_35;
    }
    else
    {
      self->_passFooterViewVisibilityToken = ++passFooterViewVisibilityToken;
      if ((v10 & 1) == 0)
      {
        -[PKPassFooterView willBecomeHiddenAnimated:](self->_passFooterView, "willBecomeHiddenAnimated:", 1);
LABEL_35:
        v26 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke;
        aBlock[3] = &__block_descriptor_38_e52_v20__0__PKNavigationDashboardPassViewController_8B16l;
        v40 = passFooterViewVisible != v10;
        v39 = passFooterViewVisibilityToken;
        v41 = v10;
        v27 = _Block_copy(aBlock);
        v37[0] = v26;
        v37[1] = 3221225472;
        v37[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_2;
        v37[3] = &unk_1E3E62010;
        v37[4] = self;
        *(double *)&v37[5] = v9;
        v28 = _Block_copy(v37);
        v29 = v28;
        if (v32)
          v30 = v14 != v9;
        else
          v30 = 0;
        if (v30)
        {
          objc_initWeak((id *)buf, self);
          v31 = (void *)MEMORY[0x1E0DC3F10];
          v34[0] = v26;
          v34[1] = 3221225472;
          v34[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_3;
          v34[3] = &unk_1E3E61C30;
          objc_copyWeak(&v36, (id *)buf);
          v35 = v27;
          objc_msgSend(v31, "animateWithDuration:delay:options:animations:completion:", 6, v29, v34, 0.25, 0.0);

          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          (*((void (**)(void *))v28 + 2))(v28);
          (*((void (**)(void *, PKNavigationDashboardPassViewController *, uint64_t))v27 + 2))(v27, self, 1);
        }

        goto LABEL_42;
      }
    }
    if (!self->_passFooterView)
    {
      v19 = objc_alloc_init(PKPassFooterView);
      passFooterView = self->_passFooterView;
      self->_passFooterView = v19;

      -[PKPassFooterView setDelegate:](self->_passFooterView, "setDelegate:", self);
      if (v32)
      {
        -[PKPassFooterView setAlpha:](self->_passFooterView, "setAlpha:", 0.0);
        -[PKPassthroughView insertSubview:atIndex:](self->_portalledPassthroughView, "insertSubview:atIndex:", self->_passFooterView, 0);
      }
    }
    if ((v5 | v17) == 1)
    {
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_passFooterView;
        *(_DWORD *)buf = 134349312;
        v43 = self;
        v44 = 2050;
        v45 = v22;
        _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): configuring PKPassFooterView %{public}p.", buf, 0x16u);
      }

      v24 = v14 > 0.0 && passFooterViewVisible != 0 || self->_passFooterViewOutstandingAnimations != 0;
      v25 = 2;
      if (!v5)
        v25 = 0;
      -[PKPassFooterView configureWithConfiguration:context:options:](self->_passFooterView, "configureWithConfiguration:context:options:", v8, 0, v24 | v25);
    }
    objc_msgSend(v32, "setNeedsLayout");
    objc_msgSend(v32, "layoutIfNeeded");
    if (passFooterViewVisible != v10)
      -[PKPassFooterView willBecomeVisibleAnimated:](self->_passFooterView, "willBecomeVisibleAnimated:", 1);
    goto LABEL_35;
  }
LABEL_42:

}

void __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *((_DWORD *)v3 + 429) - 1;
  *((_DWORD *)v3 + 429) = v4;
  if (*(_BYTE *)(a1 + 36))
  {
    if (*((_DWORD *)v3 + 430) == *(_DWORD *)(a1 + 32))
    {
      v6 = v3;
      v5 = (void *)*((_QWORD *)v3 + 213);
      if (*(_BYTE *)(a1 + 37))
        objc_msgSend(v5, "didBecomeVisibleAnimated:", 1);
      else
        objc_msgSend(v5, "didBecomeHiddenAnimated:", 1);
      v3 = v6;
    }
    v4 = *((_DWORD *)v3 + 429);
  }
  if (!v4 && !*((_BYTE *)v3 + 1713))
  {
    v7 = v3;
    objc_msgSend(*((id *)v3 + 213), "configureWithConfiguration:context:options:", 0, 0, 0);
    v3 = v7;
  }

}

uint64_t __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_2(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1716);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1704), "setAlpha:", *(double *)(a1 + 40));
}

void __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (int64_t)_passFooterAlphaForPass:(id)a3 postTransaction:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(v6, "style") == 9)
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4 || !objc_msgSend(v7, "hasContent"))
    {
      LODWORD(self) = 1;
    }
    else if (self->_passFooterDidAuthenticate)
    {
      LODWORD(self) = 0;
    }
    else
    {
      -[PKDashboardPassViewController frontmostPass](self->_dashboardVC, "frontmostPass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nfcPayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(self) = objc_msgSend(v11, "requiresAuthentication");

    }
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "passType"))
  {
    objc_msgSend(v6, "nfcPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = v8 != 0;
LABEL_10:
    self = (PKNavigationDashboardPassViewController *)self;

    goto LABEL_11;
  }
  self = 0;
LABEL_11:

  return (int64_t)self;
}

- (int64_t)modalPresentationStyle
{
  return 4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  PKPresentationControllerForOpaqueViewControllerDestination *v5;
  id v7;
  id v8;
  void *v9;

  if (a3 == self)
  {
    v7 = a4;
    v8 = a3;
    v5 = -[PKPresentationControllerForOpaqueViewControllerDestination initWithPresentedViewController:presentingViewController:]([PKPresentationControllerForOpaqueViewControllerDestination alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

    objc_msgSend(MEMORY[0x1E0DC3E88], "_traitCollectionWithBackgroundLevel:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPresentationControllerForOpaqueViewControllerDestination setOverrideTraitCollection:](v5, "setOverrideTraitCollection:", v9);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  PKNavigationDashboardAnimatedTransitioningHandler *v6;

  self->_isPresentedWithAnimationTransitioner = 1;
  v6 = objc_alloc_init(PKNavigationDashboardAnimatedTransitioningHandler);
  -[PKNavigationDashboardAnimatedTransitioningHandler setPresenting:](v6, "setPresenting:", 1);
  -[PKNavigationDashboardAnimatedTransitioningHandler setDuration:](v6, "setDuration:", self->_presentationDuration);
  -[PKNavigationDashboardAnimatedTransitioningHandler setInterstitialController:](v6, "setInterstitialController:", self->_interstitialController);
  objc_storeWeak((id *)&self->_transitioningHandler, v6);
  return v6;
}

- (id)interactionControllerForPresentation:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_transitioningHandler);
}

- (id)animationControllerForDismissedController:(id)a3
{
  PKNavigationDashboardAnimatedTransitioningHandler *v4;

  self->_isDismissedWithAnimationTransitioner = 1;
  v4 = objc_alloc_init(PKNavigationDashboardAnimatedTransitioningHandler);
  -[PKNavigationDashboardAnimatedTransitioningHandler setPresenting:](v4, "setPresenting:", 0);
  -[PKNavigationDashboardAnimatedTransitioningHandler setDuration:](v4, "setDuration:", 0.3);
  -[PKNavigationDashboardAnimatedTransitioningHandler setInterstitialController:](v4, "setInterstitialController:", self->_interstitialController);
  -[PKNavigationDashboardAnimatedTransitioningHandler setDragged:](v4, "setDragged:", self->_dismissedByDragging);
  objc_storeWeak((id *)&self->_transitioningHandler, v4);
  return v4;
}

- (void)insertGroupView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (self->_passGroupView && !self->_invalidated)
  {
    -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v20[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "reloadItemsAtIndexPaths:", v6);

      objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupView superview](self->_passGroupView, "superview");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v7 == (void *)v8;
    else
      v10 = 1;
    if (!v10)
    {
      objc_msgSend(v7, "addSubview:", self->_passGroupView);
      -[PKPassGroupView bounds](self->_passGroupView, "bounds");
      -[PKPassGroupView anchorPoint](self->_passGroupView, "anchorPoint");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v7, "bounds");
      PKSizeAlignedInRect();
      -[PKPassGroupView setCenter:](self->_passGroupView, "setCenter:", v15 + v12 * v16, v17 + v14 * v18);
      -[PKPassGroupView layer](self->_passGroupView, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeAllAnimations");

      -[PKPassGroupView updatePageControlFrameAnimated:](self->_passGroupView, "updatePageControlFrameAnimated:", 0);
      -[PKNavigationDashboardPassViewController setPassGroupViewIsInCollectionView:](self, "setPassGroupViewIsInCollectionView:", 1);
    }

  }
}

- (void)noteTransitionCompleted
{
  objc_storeWeak((id *)&self->_transitioningHandler, 0);
}

- (BOOL)shouldOverrideContentOffset
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  return (unint64_t)(v5 - 1) >= 2 && self->_updatingOffsets;
}

- (CGPoint)preferredContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastPreferredOffset.x;
  y = self->_lastPreferredOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)contentDidScroll
{
  void *v3;
  double v4;
  double v5;

  -[PKNavigationDashboardPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[PKNavigationDashboardPassViewController _alphaForPassthroughView](self, "_alphaForPassthroughView");
  v5 = v4;
  -[PKPassthroughView setAlpha:](self->_passthroughView, "setAlpha:");
  -[PKPassthroughView setAlpha:](self->_portalledPassthroughView, "setAlpha:", v5);
}

- (void)setPassGroupViewIsInCollectionView:(BOOL)a3
{
  self->_passGroupViewIsInCollectionView = a3;
  if (a3)
    self->_groupViewNeedsToBeMovedWithContentOffset = 0;
}

- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5
{
  _BOOL8 v5;
  PKDashboardPassViewControllerDelegate **p_passDashboardDelegate;
  id v8;
  id v9;
  id WeakRetained;

  if (!self->_passDeletionInitiated)
  {
    v5 = a5;
    p_passDashboardDelegate = &self->_passDashboardDelegate;
    v8 = a4;
    v9 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_passDashboardDelegate);
    objc_msgSend(WeakRetained, "dashboardPassViewController:didRequestPaymentForPass:fromButton:", v9, v8, v5);

  }
}

- (BOOL)canRequestPaymentForPass:(id)a3
{
  return 1;
}

- (void)dashboardContentForPassLoaded:(id)a3
{
  -[PKNavigationDashboardPassViewController _updateDashboardAndFooterContentPostTransaction:](self, "_updateDashboardAndFooterContentPostTransaction:", 0);
}

- (void)passFooterViewDidSucceedAtAuthorization:(id)a3
{
  self->_passFooterDidAuthenticate = 1;
  -[PKNavigationDashboardPassViewController _updateDashboardAndFooterContentPostTransaction:](self, "_updateDashboardAndFooterContentPostTransaction:", 0);
}

- (void)passFooterViewDidEndAuthorization:(id)a3
{
  self->_passFooterDidAuthenticate = 0;
}

- (void)passFooterViewDidTransact:(id)a3 success:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "style");

  if (v7 == 9)
    -[PKNavigationDashboardPassViewController _updateDashboardAndFooterContentPostTransaction:](self, "_updateDashboardAndFooterContentPostTransaction:", 1);
}

- (void)_updateDashboardAndFooterContentPostTransaction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v3 = a3;
  -[PKDashboardPassViewController passFlowLayout](self->_dashboardVC, "passFlowLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFade:", 1);

  -[PKDashboardPassViewController frontmostPass](self->_dashboardVC, "frontmostPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKNavigationDashboardPassViewController _passFooterAlphaForPass:postTransaction:](self, "_passFooterAlphaForPass:postTransaction:", v6, v3) == 0;

  -[PKDashboardViewController shouldPresentAllContent:animated:](self->_dashboardVC, "shouldPresentAllContent:animated:", v7, 1);
  -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", v3);
  -[PKDashboardPassViewController passFlowLayout](self->_dashboardVC, "passFlowLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFade:", 0);

  if (v3)
    -[PKNavigationDashboardPassViewController _startPostTransactionTimerIfNeccessary](self, "_startPostTransactionTimerIfNeccessary");
}

- (BOOL)isPassFooterViewInGroup:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKPassGroupView group](self->_passGroupView, "group", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "passCount") > 1;

  return v4;
}

- (unint64_t)suppressedContentForPassFooter:(id)a3
{
  return 0;
}

- (void)secureElementDidEnterRestrictedMode:(id)a3
{
  -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);
}

- (void)secureElementDidLeaveRestrictedMode:(id)a3
{
  -[PKNavigationDashboardPassViewController _updatePassFooterViewIfNecessaryPostTransaction:](self, "_updatePassFooterViewIfNecessaryPostTransaction:", 0);
}

- (void)_setOffsetAnimation:(id)a3
{
  _UIDynamicValueAnimation *v5;
  _UIDynamicValueAnimation *offsetAnimation;
  _UIDynamicValueAnimation *v7;

  v5 = (_UIDynamicValueAnimation *)a3;
  offsetAnimation = self->_offsetAnimation;
  if (offsetAnimation != v5)
  {
    v7 = v5;
    if (offsetAnimation)
      -[_UIDynamicValueAnimation stop](offsetAnimation, "stop");
    objc_storeStrong((id *)&self->_offsetAnimation, a3);
    -[PKNavigationDashboardPassViewController _updateUpdatingOffsets](self, "_updateUpdatingOffsets");
    v5 = v7;
  }

}

- (void)_updateUpdatingOffsets
{
  _BOOL4 v3;
  UIPanGestureRecognizer *panGestureRecognizer;

  if (self->_offsetAnimation)
  {
    v3 = 1;
  }
  else
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
      v3 = (unint64_t)(-[UIPanGestureRecognizer state](panGestureRecognizer, "state") - 1) < 2;
    else
      v3 = 0;
  }
  if (self->_updatingOffsets != v3)
  {
    self->_updatingOffsets = v3;
    if (!self->_invalidated)
    {
      if (v3)
      {
        *(_OWORD *)&self->_updateRequest.flags = xmmword_19DF159C0;
        self->_updateRequest.phase = 0;
        self->_updateRequest.load = 0;
        self->_updateReason = 2162689;
        _UIUpdateRequestActivate();
      }
      else
      {
        _UIUpdateRequestDeactivate();
      }
    }
  }
}

- (void)_handlePanGroupGesture:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double y;
  double v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49[3];
  id location;

  v4 = a3;
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[PKNavigationDashboardPassViewController _setOffsetAnimation:](self, "_setOffsetAnimation:", 0);
      if (self->_passGroupViewIsInCollectionView)
      {
        objc_msgSend(v5, "contentOffset");
        self->_lastPreferredOffset.x = v6;
        self->_lastPreferredOffset.y = v7;
        self->_offsetBeforeDrag = v7;
      }
      else
      {
        self->_groupViewNeedsToBeMovedWithContentOffset = 0;
        -[PKPassGroupView layer](self->_passGroupView, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "presentationLayer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "position");
        self->_positionBeforeDrag.x = v35;
        self->_positionBeforeDrag.y = v36;

        objc_msgSend(v33, "removeAllAnimations");
        v37 = self->_topMargin - self->_positionBeforeDrag.y;
        self->_offsetBeforeDrag = v37;
        self->_lastPreferredOffset.x = 0.0;
        self->_lastPreferredOffset.y = v37;

      }
      -[PKDashboardPassViewController passFlowLayout](self->_dashboardVC, "passFlowLayout");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "passPanDidBegin");

      goto LABEL_19;
    case 2:
LABEL_19:
      objc_msgSend(v4, "translationInView:", self->_passGroupView);
      v40 = v39;
      if (!self->_passGroupViewIsInCollectionView)
      {
        -[PKPassGroupView setCenter:](self->_passGroupView, "setCenter:", self->_positionBeforeDrag.x, v39 + self->_positionBeforeDrag.y);
        -[PKPassGroupView updatePageControlFrameAnimated:](self->_passGroupView, "updatePageControlFrameAnimated:", 0);
      }
      objc_msgSend(v5, "contentOffset");
      v42 = v41;
      PKFloatFloorToPixel();
      self->_lastPreferredOffset.x = v42;
      self->_lastPreferredOffset.y = v43;
      objc_msgSend(v5, "setContentOffset:", v42, v43);
      if (!-[PKNavigationDashboardPassViewController isBeingPresented](self, "isBeingPresented"))
        goto LABEL_28;
      WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningHandler);
      if (WeakRetained)
      {
        y = self->_lastPreferredOffset.y;
        objc_msgSend(v5, "adjustedContentInset");
        if (y <= -v45)
        {
          if (v40 < 0.0)
            objc_msgSend(WeakRetained, "boostPresentation");
        }
        else
        {
          objc_msgSend(WeakRetained, "completePresentationImmediately");
        }
      }
LABEL_27:

LABEL_28:
      -[PKNavigationDashboardPassViewController _updateUpdatingOffsets](self, "_updateUpdatingOffsets");

      return;
    case 3:
      objc_msgSend(v5, "contentOffset");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v5, "adjustedContentInset");
      v13 = v12;
      self->_offsetBeforeDrag = 0.0;
      objc_msgSend(v4, "velocityInView:", self->_passGroupView);
      v15 = v14;
      if (*(double *)&v11 >= -80.0 - v13 || v14 < 0.0)
      {
        v24 = -v13;
        if (self->_passGroupViewIsInCollectionView
          || (self->_groupViewNeedsToBeMovedWithContentOffset = 1, v25 = v24, self->_passGroupViewIsInCollectionView))
        {
          objc_msgSend(v5, "contentSize");
          v27 = v26;
          objc_msgSend(v5, "frame");
          v29 = v27 - v28;
          objc_msgSend(v5, "safeAreaInsets");
          v25 = fmax(v24, v30 + v29);
        }
        v31 = -[PKNavigationDashboardPassViewController _createAnimationForUpperBoundaryWithStart:upperBoundary:lowerBoundary:initialVelocity:](self, "_createAnimationForUpperBoundaryWithStart:upperBoundary:lowerBoundary:initialVelocity:", *(double *)&v11, v25, v24, -v15);
        -[PKNavigationDashboardPassViewController _setOffsetAnimation:](self, "_setOffsetAnimation:", v31);
        objc_initWeak(&location, self);
        v32 = MEMORY[0x1E0C809B0];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __66__PKNavigationDashboardPassViewController__handlePanGroupGesture___block_invoke;
        v48[3] = &unk_1E3E68880;
        objc_copyWeak(v49, &location);
        v49[1] = v9;
        v49[2] = v11;
        v46[0] = v32;
        v46[1] = 3221225472;
        v46[2] = __66__PKNavigationDashboardPassViewController__handlePanGroupGesture___block_invoke_2;
        v46[3] = &unk_1E3E61C58;
        objc_copyWeak(&v47, &location);
        objc_msgSend(v31, "runWithValueApplier:completion:", v48, v46);
        objc_destroyWeak(&v47);
        objc_destroyWeak(v49);
        objc_destroyWeak(&location);

      }
      else
      {
        -[PKNavigationDashboardPassViewController _dismissIfPossibleWithVelocity:byDragging:](self, "_dismissIfPossibleWithVelocity:byDragging:", 1, v14);
      }
      -[PKDashboardPassViewController passFlowLayout](self->_dashboardVC, "passFlowLayout");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "passPanDidEnd");
      goto LABEL_27;
    case 4:
      -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "contentOffset");
      v18 = v17;
      v20 = v19;
      objc_msgSend(WeakRetained, "pkui_naturalRestingBounds");
      if (v18 != v22 || v20 != v21)
        objc_msgSend(WeakRetained, "setContentOffset:animated:", self->_activeState.foreground);
      goto LABEL_27;
    default:
      goto LABEL_28;
  }
}

void __66__PKNavigationDashboardPassViewController__handlePanGroupGesture___block_invoke(uint64_t a1, int a2)
{
  char *WeakRetained;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained + 1616;
    v6 = *(_QWORD *)(a1 + 40);
    v9 = (id *)WeakRetained;
    PKFloatFloorToPixel();
    *(_QWORD *)v5 = v6;
    *((_QWORD *)v5 + 1) = v7;
    objc_msgSend(v9[229], "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentOffset:", *(double *)v5, *((double *)v5 + 1));

    WeakRetained = (char *)v9;
  }

}

void __66__PKNavigationDashboardPassViewController__handlePanGroupGesture___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setOffsetAnimation:", 0);
    WeakRetained = v2;
  }

}

- (void)_handleScrollViewPanGroupGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
    -[PKNavigationDashboardPassViewController _setOffsetAnimation:](self, "_setOffsetAnimation:", 0);
}

- (id)_createAnimationForUpperBoundaryWithStart:(double)a3 upperBoundary:(double)a4 lowerBoundary:(double)a5 initialVelocity:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v10 = objc_alloc(MEMORY[0x1E0DC4130]);
  v11 = (void *)objc_msgSend(v10, "initWithValue:velocity:unitSize:", a3, a6, *MEMORY[0x1E0DC5810]);
  objc_msgSend(MEMORY[0x1E0DC4120], "lowerBoundary:ofType:", 1, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addActiveValue:", v12);
  objc_msgSend(MEMORY[0x1E0DC4120], "upperBoundary:ofType:", 1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addActiveValue:", v13);
  return v11;
}

- (double)_alphaForPassthroughView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!self->_updatingOffsets)
    return 1.0;
  -[PKDashboardPassViewController collectionView](self->_dashboardVC, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  objc_msgSend(v2, "adjustedContentInset");
  v6 = v4 + v5;
  v7 = 1.0;
  if (v6 < 0.0)
  {
    v7 = 0.0;
    if (v6 > -50.0)
      v7 = 1.0 - fmin(fmax(v6 / -50.0, 0.0), 1.0);
  }

  return v7;
}

- (void)interstitialControllerAvailable:(id)a3
{
  id v5;
  PKPGSVTransitionInterstitialController **p_interstitialController;
  PKPGSVTransitionInterstitialController *interstitialController;
  _BOOL4 v8;
  PKPGSVTransitionInterstitialController *v9;
  char v10;
  void *v11;
  id WeakRetained;
  id v13;

  v5 = a3;
  p_interstitialController = &self->_interstitialController;
  interstitialController = self->_interstitialController;
  v13 = v5;
  if (interstitialController)
  {
    v8 = -[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated");
    v5 = v13;
    if (v8)
    {
      v9 = *p_interstitialController;
      *p_interstitialController = 0;

      v5 = v13;
    }
  }
  v10 = objc_msgSend(v5, "isInvalidated");
  v11 = v13;
  if ((v10 & 1) == 0 && v13 && !*p_interstitialController)
  {
    objc_storeStrong((id *)&self->_interstitialController, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningHandler);
    objc_msgSend(WeakRetained, "setInterstitialController:", *p_interstitialController);

    v11 = v13;
  }

}

- (void)setTransitionDuration:(double)a3
{
  self->_presentationDuration = a3;
}

- (void)presentCombinedActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 balanceModel:(id)a5 mode:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[2];
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v29 = self;
      v30 = 2080;
      v31 = "-[PKNavigationDashboardPassViewController presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:]";
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  objc_msgSend(v14, "paymentPass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isTransitPass"))
  {
    objc_msgSend(v16, "actionGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        PKLogFacilityTypeGetObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349314;
          v29 = self;
          v30 = 2080;
          v31 = "-[PKNavigationDashboardPassViewController presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:]";
          _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
        }

      }
      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke;
      v21[3] = &unk_1E3E688D0;
      objc_copyWeak(v27, (id *)buf);
      v21[4] = self;
      v22 = v16;
      v20 = v17;
      v23 = v20;
      v24 = v10;
      v25 = v11;
      v26 = v12;
      v27[1] = (id)a6;
      objc_msgSend(v18, "executeAfterContentIsLoaded:", v21);

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke(uint64_t a1)
{
  PKPaymentPassCombinedActionDataController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v2 = -[PKPaymentPassCombinedActionDataController initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:]([PKPaymentPassCombinedActionDataController alloc], "initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1784);
    *(_QWORD *)(v3 + 1784) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1784);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke_2;
    v7[3] = &unk_1E3E688A8;
    v7[4] = WeakRetained;
    objc_msgSend(v5, "fetchViewController:", v7);
  }

}

void __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v6, 1);
  }

}

- (void)presentActionGroupsWithPaymentDataProvider:(id)a3 balanceModel:(id)a4 webService:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v26 = self;
      v27 = 2080;
      v28 = "-[PKNavigationDashboardPassViewController presentActionGroupsWithPaymentDataProvider:balanceModel:webService:]";
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  objc_msgSend(v12, "paymentPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isTransitPass"))
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v26 = self;
        v27 = 2080;
        v28 = "-[PKNavigationDashboardPassViewController presentActionGroupsWithPaymentDataProvider:balanceModel:webService:]";
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke;
    v18[3] = &unk_1E3E688F8;
    objc_copyWeak(&v24, (id *)buf);
    v18[4] = self;
    v19 = v14;
    v20 = v15;
    v21 = v8;
    v22 = v10;
    v23 = v9;
    objc_msgSend(v16, "executeAfterContentIsLoaded:", v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

void __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke(uint64_t a1)
{
  PKPaymentPassCombinedActionDataController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v2 = -[PKPaymentPassCombinedActionDataController initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:]([PKPaymentPassCombinedActionDataController alloc], "initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1784);
    *(_QWORD *)(v3 + 1784) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1784);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke_2;
    v7[3] = &unk_1E3E688A8;
    v7[4] = WeakRetained;
    objc_msgSend(v5, "fetchViewController:", v7);
  }

}

void __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v6, 1);
  }

}

- (BOOL)presentAddMoney
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v13;
  int v14;
  PKNavigationDashboardPassViewController *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134349314;
      v15 = self;
      v16 = 2080;
      v17 = "-[PKNavigationDashboardPassViewController presentAddMoney]";
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v14, 0x16u);
    }

  }
  objc_msgSend(v4, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isTransitPass") & 1) != 0 || objc_msgSend(v6, "isEMoneyPass"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v6);
    objc_msgSend(MEMORY[0x1E0D67748], "passPropertiesForPass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
    objc_msgSend(v7, "setTransitProperties:andApplyStoredValueBalances:", v8, 1);
    v10 = objc_alloc_init(MEMORY[0x1E0D67100]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNavigationDashboardPassViewController presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:](self, "presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:", v10, v11, 1, v7);

  }
  else if (objc_msgSend(v6, "isAppleBalancePass"))
  {
    -[PKNavigationDashboardPassViewController presentAddMoneyAppleBalance](self, "presentAddMoneyAppleBalance");
    v9 = 1;
  }
  else if (objc_msgSend(v6, "isPeerPaymentPass"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    -[PKNavigationDashboardPassViewController presentPeerPaymentActionViewControllerForAction:pass:passLibraryDataProvider:](self, "presentPeerPaymentActionViewControllerForAction:pass:passLibraryDataProvider:", 1, v6, v13);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)presentActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 actionType:(unint64_t)a5 transitBalanceModel:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v28 = self;
      v29 = 2080;
      v30 = "-[PKNavigationDashboardPassViewController presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:]";
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  objc_msgSend(v14, "paymentPass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "availableActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isStoredValuePass"))
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v28 = self;
        v29 = 2080;
        v30 = "-[PKNavigationDashboardPassViewController presentActionsWithPaymentDataProvider:webService:actionType:tran"
              "sitBalanceModel:]";
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke;
    v20[3] = &unk_1E3E688D0;
    objc_copyWeak(v26, (id *)buf);
    v20[4] = self;
    v21 = v16;
    v22 = v17;
    v23 = v10;
    v24 = v11;
    v26[1] = (id)a5;
    v25 = v12;
    objc_msgSend(v18, "executeAfterContentIsLoaded:", v20);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);

  }
}

void __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke(uint64_t a1)
{
  PKPaymentPassActionDataController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v2 = -[PKPaymentPassActionDataController initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:]([PKPaymentPassActionDataController alloc], "initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1776);
    *(_QWORD *)(v3 + 1776) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1776);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_2;
    v7[3] = &unk_1E3E688A8;
    v7[4] = WeakRetained;
    objc_msgSend(v5, "fetchViewController:", v7);
  }

}

void __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_3;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(result + 40), "presentViewController:animated:completion:", v1, 1, 0);
  v2 = *(_QWORD *)(result + 48);
  if (v2)
    return objc_msgSend(*(id *)(result + 40), "pushViewController:animated:", v2, 1);
  return result;
}

- (void)presentTransitCardNumber
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v13 = self;
      v14 = 2080;
      v15 = "-[PKNavigationDashboardPassViewController presentTransitCardNumber]";
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isStoredValuePass"))
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v13 = self;
        v14 = 2080;
        v15 = "-[PKNavigationDashboardPassViewController presentTransitCardNumber]";
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__PKNavigationDashboardPassViewController_presentTransitCardNumber__block_invoke;
    v9[3] = &unk_1E3E61B68;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v6;
    objc_msgSend(v7, "executeAfterContentIsLoaded:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);

  }
}

void __67__PKNavigationDashboardPassViewController_presentTransitCardNumber__block_invoke(uint64_t a1)
{
  PKTransitCardNumberViewController *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[PKTransitCardNumberViewController initWithPass:]([PKTransitCardNumberViewController alloc], "initWithPass:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "pushViewController:animated:", v2, 1);

  }
}

- (void)presentManageBarcodePassNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  PKManageBarcodePassNotificationsViewController *v6;
  int v7;
  PKNavigationDashboardPassViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134349314;
      v8 = self;
      v9 = 2080;
      v10 = "-[PKNavigationDashboardPassViewController presentManageBarcodePassNotifications]";
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v7, 0x16u);
    }

  }
  v6 = -[PKManageBarcodePassNotificationsViewController initWithPass:]([PKManageBarcodePassNotificationsViewController alloc], "initWithPass:", v4);
  -[PKNavigationDashboardPassViewController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);

}

- (void)presentManagePaymentPassNotificationsControllerWithDataProvider:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v33 = self;
      v34 = 2080;
      v35 = "-[PKNavigationDashboardPassViewController presentManagePaymentPassNotificationsControllerWithDataProvider:pe"
            "erPaymentAccount:bankConnectAccount:account:]";
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  objc_msgSend(v15, "paymentPass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    PKLogFacilityTypeGetObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v33 = self;
      v34 = 2080;
      v35 = "-[PKNavigationDashboardPassViewController presentManagePaymentPassNotificationsControllerWithDataProvider:pe"
            "erPaymentAccount:bankConnectAccount:account:]";
      _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }

  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __153__PKNavigationDashboardPassViewController_presentManagePaymentPassNotificationsControllerWithDataProvider_peerPaymentAccount_bankConnectAccount_account___block_invoke;
  v25[3] = &unk_1E3E68788;
  objc_copyWeak(&v31, (id *)buf);
  v20 = v17;
  v26 = v20;
  v21 = v10;
  v27 = v21;
  v22 = v11;
  v28 = v22;
  v23 = v12;
  v29 = v23;
  v24 = v13;
  v30 = v24;
  objc_msgSend(v18, "executeAfterContentIsLoaded:", v25);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

void __153__PKNavigationDashboardPassViewController_presentManagePaymentPassNotificationsControllerWithDataProvider_peerPaymentAccount_bankConnectAccount_account___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PKManagePaymentPassNotificationsViewController *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v2);
    v4 = -[PKManagePaymentPassNotificationsViewController initWithPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:transactionSourceCollection:]([PKManagePaymentPassNotificationsViewController alloc], "initWithPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:transactionSourceCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3);
    objc_msgSend(WeakRetained, "pushViewController:animated:", v4, 1);

  }
}

- (void)presentCardNumbers
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PKNavigationDashboardPassViewController *v13;
  id v14;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to present virtual card and card numbers", buf, 2u);
  }

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v16 = self;
        v17 = 2080;
        v18 = "-[PKNavigationDashboardPassViewController presentCardNumbers]";
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }

    }
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_initWeak((id *)buf, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke;
      v10[3] = &unk_1E3E65CC0;
      objc_copyWeak(&v14, (id *)buf);
      v11 = v4;
      v12 = v8;
      v13 = self;
      objc_msgSend(v11, "executeAfterContentIsLoaded:", v10);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v16 = self;
        v17 = 2080;
        v18 = "-[PKNavigationDashboardPassViewController presentCardNumbers]";
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
      }

    }
  }

}

void __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  PKPhysicalCardController *v6;
  uint64_t v7;
  void *v8;
  PKPhysicalCardController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PKAccountCardNumbersPresenter *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  _QWORD v24[5];
  id v25;
  char v26;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PKPhysicalCardController alloc];
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "physicalCards");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:](v6, "initWithAccountService:paymentPass:account:accountUser:physicalCards:", v4, v7, v5, 0, v8);

  objc_msgSend(v5, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "virtualCards");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKVirtualCardEnabledWithWebService() & 1) == 0)
  {

    goto LABEL_6;
  }
  v14 = objc_msgSend(*(id *)(a1 + 40), "hasActiveVirtualCard");

  if (!v14)
  {
LABEL_6:
    v23 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D67778], "cardsForPaymentPass:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = objc_claimAutoreleasedReturnValue();

  v23 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1504), "setAuthenticating:", 1);
  v12 = (void *)v16;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "peerPaymentAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [PKAccountCardNumbersPresenter alloc];
  if (-[PKPhysicalCardController hasExpiredPhysicalCardOnly](v9, "hasExpiredPhysicalCardOnly"))
    -[PKPhysicalCardController expiredPhysicalCard](v9, "expiredPhysicalCard");
  else
    -[PKPhysicalCardController primaryPhysicalCard](v9, "primaryPhysicalCard");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PKAccountCardNumbersPresenter initWithVirtualCard:physicalCard:account:peerPaymentAccount:pass:context:](v18, "initWithVirtualCard:physicalCard:account:peerPaymentAccount:pass:context:", v12, v19, v5, v17, *(_QWORD *)(a1 + 40), 0);
  v21 = (void *)*((_QWORD *)WeakRetained + 220);
  *((_QWORD *)WeakRetained + 220) = v20;

  objc_msgSend(*((id *)WeakRetained + 219), "setEnabled:", 0);
  v22 = (void *)*((_QWORD *)WeakRetained + 220);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_2;
  v24[3] = &unk_1E3E68920;
  objc_copyWeak(&v25, v2);
  v26 = v23;
  v24[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v22, "presentCardNumbersWithCompletion:", v24);
  objc_destroyWeak(&v25);

LABEL_11:
}

void __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[6];
  id v7;
  char v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_3;
    v6[3] = &unk_1E3E64E10;
    v8 = *(_BYTE *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_3(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1504), "setAuthenticating:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1752), "setEnabled:", 1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if ((isKindOfClass & 1) != 0)
    return objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);
  else
    return objc_msgSend(v3, "_pushViewControllerWhenNavigationAvailable:animated:handler:", v4, 1, 0);
}

- (void)presentPassDetailsAnimated:(BOOL)a3 handler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "passType");
    if (v9 == 1)
    {
      objc_msgSend(v8, "paymentPass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKNavigationDashboardPassViewController _paymentPassDetailsViewControllerForPaymentPass:](self, "_paymentPassDetailsViewControllerForPaymentPass:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __78__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_handler___block_invoke;
      v20 = &unk_1E3E618A0;
      v21 = v13;
      v22 = v6;
      v10 = v13;
      -[PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable:animated:handler:](self, "_pushViewControllerWhenNavigationAvailable:animated:handler:", v10, v4, &v17);

    }
    else
    {
      if (v9)
      {
LABEL_9:
        v14 = *MEMORY[0x1E0D68B18];
        v15 = *MEMORY[0x1E0D68858];
        v23[0] = *MEMORY[0x1E0D68AA0];
        v23[1] = v15;
        v16 = *MEMORY[0x1E0D688F0];
        v24[0] = v14;
        v24[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2, v17, v18, v19, v20);
        v11 = objc_claimAutoreleasedReturnValue();
        -[PKNavigationDashboardPassViewController reportEventForPassIfNecessary:](self, "reportEventForPassIfNecessary:", v11);
        goto LABEL_10;
      }
      -[PKNavigationDashboardPassViewController _barcodePassDetailsViewControllerForBarcodePass:](self, "_barcodePassDetailsViewControllerForBarcodePass:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable:animated:handler:](self, "_pushViewControllerWhenNavigationAvailable:animated:handler:", v10, v4, 0);
    }

    goto LABEL_9;
  }
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v26 = self;
    v27 = 2080;
    v28 = "-[PKNavigationDashboardPassViewController presentPassDetailsAnimated:handler:]";
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
  }
LABEL_10:

}

uint64_t __78__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentPassDetailsAnimated:(BOOL)a3 action:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_action___block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0__PKPaymentPassDetailViewController_8l;
  v4[4] = a4;
  -[PKNavigationDashboardPassViewController presentPassDetailsAnimated:handler:](self, "presentPassDetailsAnimated:handler:", a3, v4);
}

void __77__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  switch(*(_QWORD *)(a1 + 32))
  {
    case 1:
      objc_msgSend(v3, "presentSchedulePayments");
      goto LABEL_12;
    case 2:
      objc_msgSend(v3, "presentBankAccounts");
      goto LABEL_12;
    case 3:
      objc_msgSend(v3, "presentISO18013Details");
      goto LABEL_12;
    case 4:
      objc_msgSend(v3, "presentShareAccount");
      goto LABEL_12;
    case 5:
      objc_msgSend(v3, "presentMakeDefaultAtApple");
      goto LABEL_12;
    case 6:
      objc_msgSend(v3, "presentOrderPhysicalCard");
      goto LABEL_12;
    case 7:
      objc_msgSend(v3, "presentActivatePhysicalCard");
      goto LABEL_12;
    case 8:
      objc_msgSend(v3, "presentTrackPhysicalCard");
      goto LABEL_12;
    case 9:
      objc_msgSend(v3, "presentAutoReload");
      goto LABEL_12;
    case 0xALL:
      objc_msgSend(v3, "presentReplacePhysicalCard");
LABEL_12:
      v3 = v4;
      break;
    default:
      break;
  }

}

- (void)presentSpendingSummaryWithType:(unint64_t)a3 categorization:(unint64_t)a4 unit:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14[4];
  id location;

  v10 = a6;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__PKNavigationDashboardPassViewController_presentSpendingSummaryWithType_categorization_unit_completion___block_invoke;
  v12[3] = &unk_1E3E68968;
  v12[4] = self;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = (id)a5;
  v14[3] = (id)a4;
  v11 = v10;
  v13 = v11;
  -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __105__PKNavigationDashboardPassViewController_presentSpendingSummaryWithType_categorization_unit_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PKSpendingSummaryViewController *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKSpendingSummaryViewController *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_msgSend(WeakRetained[229], "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [PKSpendingSummaryViewController alloc];
    objc_msgSend(v7, "familyCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountUserCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalCards");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summaryFetcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "weeks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "months");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "years");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "currentMonthTransactions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pendingPayments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "upcomingScheduledPayments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKSpendingSummaryViewController initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:](v22, "initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:", v25, v24, v21, v20, v19, v18, v23, v17, v16, v8, v15, v9, v10, v11, v12, 0);

    -[PKSpendingSummaryViewController setCategorization:](v13, "setCategorization:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v6, "pushViewController:animated:", v13, 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 0;
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(void))(v14 + 16))();

  }
}

- (void)summaryTypeDidChange
{
  id v2;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryTypeDidChange");

}

- (void)presentBalanceDetailsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKNavigationDashboardPassViewController_presentBalanceDetailsWithCompletion___block_invoke;
  v6[3] = &unk_1E3E68990;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __79__PKNavigationDashboardPassViewController_presentBalanceDetailsWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  PKCreditBalanceDetailsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKCreditBalanceDetailsViewController *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 1;
    objc_msgSend(WeakRetained[229], "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PKCreditBalanceDetailsViewController alloc];
    objc_msgSend(v7, "familyCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountUserCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalCards");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:](v8, "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 0, v16, v9, v10, v11, v12, v13, 0, 0);

    objc_msgSend(v6, "pushViewController:animated:", v14, 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 0;

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(void))(v15 + 16))();
  }

}

- (void)showStatement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PKNavigationDashboardPassViewController_showStatement_completion___block_invoke;
    v9[3] = &unk_1E3E68990;
    objc_copyWeak(&v12, &location);
    v11 = v8;
    v10 = v6;
    -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

void __68__PKNavigationDashboardPassViewController_showStatement_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  PKCreditBalanceDetailsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKCreditBalanceDetailsViewController *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained[229], "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PKCreditBalanceDetailsViewController alloc];
    objc_msgSend(v7, "familyCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountUserCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalCards");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:](v9, "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 0, v16, v10, v11, v8, v12, v13, 0, 0);

    objc_msgSend(v6, "pushViewController:animated:", v14, 0);
    -[PKCreditBalanceDetailsViewController showStatement:style:](v14, "showStatement:style:", *(_QWORD *)(a1 + 32), 0);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(void))(v15 + 16))();
  }

}

- (void)_canPresentCreditDetailsViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      if (self->_isPendingVCPresentation)
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      }
      else
      {
        -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          PKLogFacilityTypeGetObject();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            v18 = self;
            v19 = 2080;
            v20 = "-[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:]";
            _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
          }

        }
        objc_initWeak((id *)buf, self);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke;
        v12[3] = &unk_1E3E670F8;
        objc_copyWeak(&v16, (id *)buf);
        v15 = v4;
        v13 = v7;
        v11 = v9;
        v14 = v11;
        objc_msgSend(v11, "executeAfterContentIsLoaded:", v12);

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);

      }
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v18 = self;
      v19 = 2080;
      v20 = "-[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:]";
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
}

void __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  void (**v3)(void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E3E689B8;
    v12 = a1[6];
    v10 = a1[4];
    v11 = a1[5];
    v3 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(a1[5], "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "creditDetails");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "accountSummary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v3[2](v3, objc_msgSend(v8, "requiresDebtCollectionNotices") ^ 1);

      }
      else
      {
        v3[2](v3, 0);
      }

    }
    else
    {
      v3[2](v3, 1);
    }

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 40), "accountUserCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "accountUsers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithAccountUser:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          objc_msgSend(v3, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = objc_alloc(MEMORY[0x1E0D67738]);
    v13 = (void *)objc_msgSend(v3, "copy");
    v14 = (void *)objc_msgSend(v12, "initWithTransactionSources:", v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 0);
  }
}

- (void)presentDailyCashForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (a4 - 1 >= 2)
  {
    if (a4 == 3)
      -[PKNavigationDashboardPassViewController _presentDailyCashOnAccountForDateComponents:redemptionType:completion:](self, "_presentDailyCashOnAccountForDateComponents:redemptionType:completion:", v9, 3, v8);
  }
  else
  {
    -[PKNavigationDashboardPassViewController _presentDailyCashOnPassForDateComponents:completion:](self, "_presentDailyCashOnPassForDateComponents:completion:", v9, v8);
  }

}

- (void)_presentDailyCashOnPassForDateComponents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v20 = self;
      v21 = 2080;
      v22 = "-[PKNavigationDashboardPassViewController _presentDailyCashOnPassForDateComponents:completion:]";
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (v7)
  {
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v20 = self;
        v21 = 2080;
        v22 = "-[PKNavigationDashboardPassViewController _presentDailyCashOnPassForDateComponents:completion:]";
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __95__PKNavigationDashboardPassViewController__presentDailyCashOnPassForDateComponents_completion___block_invoke;
    v14[3] = &unk_1E3E689E0;
    objc_copyWeak(&v18, (id *)buf);
    v13 = v11;
    v15 = v13;
    v16 = v6;
    v17 = v7;
    -[NSObject executeAfterContentIsLoaded:](v13, "executeAfterContentIsLoaded:", v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
LABEL_10:

  }
}

void __95__PKNavigationDashboardPassViewController__presentDailyCashOnPassForDateComponents_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  PKTransactionHistoryViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKTransactionHistoryViewController *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "transactionFetcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cashbackGroupForDateComponents:cashbackTransactionSourceCollection:", *(_QWORD *)(a1 + 40), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [PKTransactionHistoryViewController alloc];
      objc_msgSend(*(id *)(a1 + 32), "transactionSourceCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "familyCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accountUserCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "physicalCards");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v5, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v4, v6, v7, v8, v9, v10, 0, 0, 0);

      -[PKTransactionHistoryViewController setShouldPromptForReview:](v11, "setShouldPromptForReview:", 1);
      objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    WeakRetained = v12;
  }

}

- (void)_presentDailyCashOnAccountForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a5;
  if (a4 == 3)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke;
    v11[3] = &unk_1E3E643E8;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    v12 = v8;
    objc_msgSend(v10, "defaultAccountForFeature:completion:", 5, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  PKAccountViewInterfaceConfiguration *v5;
  PKPassPresentationContext *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    -[PKAccountViewInterfaceConfiguration setAccount:](v5, "setAccount:", v3);
    -[PKAccountViewInterfaceConfiguration setRewardsDateComponents:](v5, "setRewardsDateComponents:", *(_QWORD *)(a1 + 32));
    -[PKAccountViewInterfaceConfiguration setDestination:](v5, "setDestination:", 9);
    -[PKAccountViewInterfaceConfiguration setViewStyle:](v5, "setViewStyle:", 0);
    v6 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setPresentationSource:](v6, "setPresentationSource:", 5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke_2;
    v8[3] = &unk_1E3E614F0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "presentAccountWithConfiguration:presentationContext:animated:completion:", v5, v6, 1, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  PKDashboardPassViewController *dashboardVC;
  id v5;
  void *v6;
  PKPaymentPassDetailViewController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentPassDetailViewController *v14;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  PKGroupsController *groupsController;
  PKGroup *group;
  PKPaymentPassDetailViewController *v23;

  if (a3)
  {
    dashboardVC = self->_dashboardVC;
    v5 = a3;
    -[PKDashboardViewController dataSource](dashboardVC, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v7 = [PKPaymentPassDetailViewController alloc];
    group = self->_group;
    v23 = v7;
    groupsController = self->_groupsController;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rendererState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)v8;
    v14 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:](v23, "initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:", v5, group, groupsController, v20, v17, v8, 0, v16, v18, v9, 0, v10, v11, v12);

    -[PKPaymentPassDetailViewController setDeleteOverrider:](v14, "setDeleteOverrider:", self);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  id v4;
  PKBarcodePassDetailViewController *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[PKBarcodePassDetailViewController initWithPass:]([PKBarcodePassDetailViewController alloc], "initWithPass:", v4);

    -[PKBarcodePassDetailViewController setDeleteOverrider:](v5, "setDeleteOverrider:", self);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)presentTransaction:(id)a3 forPaymentPass:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke;
  v10[3] = &unk_1E3E68A08;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && a2)
  {
    v18 = objc_msgSend(a1[4], "hasAssociatedPeerPaymentAccount")
       && objc_msgSend(a1[5], "transactionType") == 3
       && objc_msgSend(a1[5], "peerPaymentStatus") != 1;
    *((_BYTE *)WeakRetained + 1744) = 1;
    v8 = *((id *)WeakRetained + 229);
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(v8, "transactionPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[5];
    objc_msgSend(v9, "familyCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountUserCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "physicalCards");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke_2;
    v19[3] = &unk_1E3E62638;
    objc_copyWeak(&v20, v6);
    LOBYTE(v15) = v18;
    objc_msgSend(v10, "viewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:forcePreventHistory:completion:", v17, v5, v11, v12, v13, 0, v14, v15, v19);

    objc_destroyWeak(&v20);
  }

}

void __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pushViewController:animated:", v5, 1);
    v4[1744] = 0;
  }

}

- (void)presentTransaction:(id)a3 forAccount:(id)a4
{
  id v6;
  PKAccountViewInterfaceConfiguration *v7;
  PKPassPresentationContext *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "type") == 4)
  {
    v7 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    -[PKAccountViewInterfaceConfiguration setAccount:](v7, "setAccount:", v6);
    -[PKAccountViewInterfaceConfiguration setTransaction:](v7, "setTransaction:", v9);
    -[PKAccountViewInterfaceConfiguration setDestination:](v7, "setDestination:", 8);
    -[PKAccountViewInterfaceConfiguration setViewStyle:](v7, "setViewStyle:", 0);
    v8 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setPresentationSource:](v8, "setPresentationSource:", 5);
    -[PKNavigationDashboardPassViewController presentAccountWithConfiguration:presentationContext:animated:completion:](self, "presentAccountWithConfiguration:presentationContext:animated:completion:", v7, v8, 1, 0);

  }
}

- (void)presentPayLaterFinancingPlan:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPayLaterPaymentIntentController *v13;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlanViewController *v15;
  PKPayLaterFinancingPlanViewController *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  PKPayLaterFinancingPlanViewController *v20;
  id v21;
  id location;

  v4 = a3;
  if (v4)
  {
    self->_isPendingVCPresentation = 1;
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    v7 = objc_alloc(MEMORY[0x1E0D67048]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    objc_msgSend(v6, "defaultPaymentPassUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (PKPayLaterPaymentIntentController *)objc_msgSend(v7, "initWithPayLaterAccount:paymentWebService:passLibrary:peerPaymentWebService:accountService:defaultPassUniqueIdentifier:", v5, v8, v9, v10, v11, v12);
    paymentIntentController = self->_paymentIntentController;
    self->_paymentIntentController = v13;

    v15 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:]([PKPayLaterFinancingPlanViewController alloc], "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", v4, v5, self->_paymentIntentController, 0, 0);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__PKNavigationDashboardPassViewController_presentPayLaterFinancingPlan___block_invoke;
    v19[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v21, &location);
    v16 = v15;
    v20 = v16;
    -[PKPayLaterFinancingPlanViewController preflightWithCompletion:](v16, "preflightWithCompletion:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __72__PKNavigationDashboardPassViewController_presentPayLaterFinancingPlan___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);
    WeakRetained = v3;
    *((_BYTE *)v3 + 1744) = 1;
  }

}

- (void)presentScheduledPayments
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  PKNavigationDashboardPassViewController *v13;
  id v14;
  id location;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke;
  v9[3] = &unk_1E3E623E8;
  objc_copyWeak(&v14, &location);
  v6 = v3;
  v10 = v6;
  v7 = v5;
  v11 = v7;
  v8 = v4;
  v12 = v8;
  v13 = self;
  objc_msgSend(v6, "executeAfterContentIsLoaded:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  PKCreditAccountPaymentDetailsViewController *v7;
  PKAccountAutomaticPaymentsController *v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recurringPayments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:detailViewStyle:]([PKCreditAccountPaymentDetailsViewController alloc], "initWithAccount:payment:paymentWebService:detailViewStyle:", v4, v6, *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(WeakRetained, "pushViewController:animated:", v7, 1);

    }
    else
    {
      v8 = -[PKAccountAutomaticPaymentsController initWithAccountService:paymentWebService:account:context:]([PKAccountAutomaticPaymentsController alloc], "initWithAccountService:paymentWebService:account:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v4, 0);
      -[PKAccountAutomaticPaymentsController setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 56));
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke_2;
      v9[3] = &unk_1E3E62638;
      objc_copyWeak(&v10, v2);
      -[PKAccountAutomaticPaymentsController nextViewControllerFromViewController:withCompletion:](v8, "nextViewControllerFromViewController:withCompletion:", 0, v9);
      objc_destroyWeak(&v10);

    }
  }

}

void __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  PKNavigationController *v5;

  v3 = a2;
  v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)presentInstallmentPlan:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKNavigationDashboardPassViewController _presentInstallmentPlans:](self, "_presentInstallmentPlans:", v4);

  }
}

- (void)presentInstallmentPlans
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installmentPlans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKNavigationDashboardPassViewController _presentInstallmentPlans:](self, "_presentInstallmentPlans:", v5);
}

- (void)_presentInstallmentPlans:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKTransactionHistoryViewController *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKTransactionHistoryViewController *v18;
  PKInstallmentPlansViewController *v19;
  PKNavigationDashboardPassViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = objc_msgSend(v25, "count");
  if (v4)
  {
    v5 = v4;
    -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paymentPass");
    v9 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v10);
    if (v5 == 1)
    {
      v12 = [PKTransactionHistoryViewController alloc];
      objc_msgSend(v25, "anyObject");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "familyCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountUserCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "physicalCards");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](v12, "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v13, v11, v14, v15, v16, v17);
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D67100]);
      v19 = [PKInstallmentPlansViewController alloc];
      objc_msgSend(v6, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountUserCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "physicalCards");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "familyCollection");
      v23 = v6;
      v20 = self;
      v21 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKInstallmentPlansViewController initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:](v19, "initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:", v14, v15, v16, v17, v11, v22, v13);

      v10 = v21;
      self = v20;
      v6 = v23;
    }

    if (v18)
      -[PKNavigationDashboardPassViewController pushViewController:animated:](self, "pushViewController:animated:", v18, 1);

  }
}

- (void)presentRewardsHubWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PKNavigationDashboardPassViewController_presentRewardsHubWithCompletion___block_invoke;
  v6[3] = &unk_1E3E68A30;
  v7 = v4;
  v5 = v4;
  -[PKNavigationDashboardPassViewController _presentRewardsHubWithCompletion:](self, "_presentRewardsHubWithCompletion:", v6);

}

uint64_t __75__PKNavigationDashboardPassViewController_presentRewardsHubWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentAccountPromotionWithProgramIdentifier:(id)a3 completion:(id)a4
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
  v10[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3E68A58;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKNavigationDashboardPassViewController _presentRewardsHubWithCompletion:](self, "_presentRewardsHubWithCompletion:", v10);

}

void __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E3E65388;
    v7 = v3;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_3;
  v3[3] = &unk_1E3E614F0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "scrollToPromotionWithProgramIdentifier:animated:completion:", v2, 1, v3);

}

uint64_t __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentRewardsHubMerchantsWithPrivateIdentifier:(id)a3 completion:(id)a4
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
  v10[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3E68A58;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKNavigationDashboardPassViewController _presentRewardsHubWithCompletion:](self, "_presentRewardsHubWithCompletion:", v10);

}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E3E65388;
    v7 = v3;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_3;
  v3[3] = &unk_1E3E68A80;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentEnhancedMerchantsListWithCompletion:", v3);

}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_4;
  v4[3] = &unk_1E3E614F0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "scrollToMerchantWithPrivateIdentifier:animated:completion:", v3, 1, v4);

}

uint64_t __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentRewardsHubWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if ((PKRewardsCenterEnabled() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke;
    v5[3] = &unk_1E3E68AA8;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKRewardsHubViewController *v13;
  void *v14;
  void *v15;
  PKRewardsHubViewController *v16;
  PKRewardsHubViewController *v17;
  uint64_t v18;
  _QWORD v19[5];
  PKRewardsHubViewController *v20;
  id v21;
  _QWORD aBlock[5];
  id v23;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E3E68A58;
    aBlock[4] = WeakRetained;
    v23 = *(id *)(a1 + 32);
    v9 = _Block_copy(aBlock);
    *((_BYTE *)v7 + 1744) = 1;
    objc_msgSend(*((id *)v7 + 229), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "feature");

    if (v12 == 2)
    {
      v13 = [PKRewardsHubViewController alloc];
      objc_msgSend(v10, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKRewardsHubViewController initWithAccount:transactionSourceCollection:accountService:](v13, "initWithAccount:transactionSourceCollection:accountService:", v14, v5, v15);

      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_3;
      v19[3] = &unk_1E3E66EF0;
      v19[4] = v7;
      v20 = v16;
      v21 = v9;
      v17 = v16;
      -[PKRewardsHubViewController preflightWithCompletion:](v17, "preflightWithCompletion:", v19);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v9 + 2))(v9, 0);
    }

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
  }

}

uint64_t __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_4;
  block[3] = &unk_1E3E65388;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)presentAccountWithConfiguration:(id)a3 presentationContext:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v26 = self;
      v27 = 2080;
      v28 = "-[PKNavigationDashboardPassViewController presentAccountWithConfiguration:presentationContext:animated:completion:]";
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }

  }
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paymentPass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke;
    v19[3] = &unk_1E3E68B98;
    objc_copyWeak(&v23, (id *)buf);
    v20 = v11;
    v24 = a5;
    v21 = v10;
    v22 = v12;
    objc_msgSend(v13, "executeAfterContentIsLoaded:", v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v26 = self;
      v27 = 2080;
      v28 = "-[PKNavigationDashboardPassViewController presentAccountWithConfiguration:presentationContext:animated:completion:]";
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_2;
    v15[3] = &unk_1E3E68AF8;
    objc_copyWeak(&v17, v2);
    v16 = *(id *)(a1 + 32);
    v18 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v4, "addOperation:", v15);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_5;
    v10[3] = &unk_1E3E68B48;
    objc_copyWeak(&v13, v2);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v14 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v4, "addOperation:", v10);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_8;
    v8[3] = &unk_1E3E68B70;
    v9 = *(id *)(a1 + 48);
    v7 = (id)objc_msgSend(v4, "evaluateWithInput:completion:", v6, v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);

  }
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_3;
    block[3] = &unk_1E3E65F40;
    v10 = *(id *)(a1 + 32);
    v11 = WeakRetained;
    v14 = *(_BYTE *)(a1 + 48);
    v13 = v7;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "presentationSource") == 1
    || objc_msgSend(*(id *)(a1 + 32), "presentationSource") == 2)
  {
    v2 = *(_QWORD **)(a1 + 40);
    v9[0] = v2[229];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setViewControllers:animated:", v3, *(unsigned __int8 *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 40), "transitionCoordinator");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (*(_BYTE *)(a1 + 64) && v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_4;
      v6[3] = &unk_1E3E68AD0;
      v8 = *(id *)(a1 + 56);
      v7 = *(id *)(a1 + 48);
      objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v6);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 0);
  }
}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_6;
  v10[3] = &unk_1E3E68B20;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v14 = v7;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v16 = *(_BYTE *)(a1 + 56);
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v15);
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[229], "accountModulePresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountViewControllerWithConfiguration:presentationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "pushViewController:animated:", v5, *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(v3, "transitionCoordinator");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (*(_BYTE *)(a1 + 72) && v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_7;
      v8[3] = &unk_1E3E68AD0;
      v10 = *(id *)(a1 + 56);
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)presentPeerPaymentRecurringPaymentsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(id, _QWORD);
  id v22;
  id location;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v10, "isPeerPaymentPass"))
    {
      objc_msgSend(v10, "secureElementPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "devicePrimaryPaymentApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "state");

      if (v13 == 7)
      {
        if (v7)
          v7[2](v7, 0);
      }
      else
      {
        objc_initWeak(&location, self);
        -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          PKLogFacilityTypeGetObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            v25 = self;
            v26 = 2080;
            v27 = "-[PKNavigationDashboardPassViewController presentPeerPaymentRecurringPaymentsWithIdentifier:completion:]";
            _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
          }

        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke;
        v18[3] = &unk_1E3E67750;
        objc_copyWeak(&v22, &location);
        v17 = v15;
        v19 = v17;
        v21 = v7;
        v20 = v6;
        objc_msgSend(v17, "executeAfterContentIsLoaded:", v18);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      goto LABEL_16;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v25 = self;
      v26 = 2080;
      v27 = "-[PKNavigationDashboardPassViewController presentPeerPaymentRecurringPaymentsWithIdentifier:completion:]";
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  if (v7)
    v7[2](v7, 0);
LABEL_16:

}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  PKPeerPaymentRecurringPaymentViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentRecurringPaymentViewController *v10;
  PKPeerPaymentRecurringPaymentViewController *v11;
  void (**v12)(id, uint64_t);
  _QWORD v13[4];
  PKPeerPaymentRecurringPaymentViewController *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if ((PKPeerPaymentRecurringPaymentHasShownEducationMessage() & 1) != 0
      || (objc_msgSend(a1[4], "recurringPeerPayments"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "count"),
          v4,
          v5))
    {
      v6 = [PKPeerPaymentRecurringPaymentViewController alloc];
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "transactionSourceCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "familyCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKPeerPaymentRecurringPaymentViewController initWithContext:peerPaymentService:transactionSourceCollection:familyCollection:](v6, "initWithContext:peerPaymentService:transactionSourceCollection:familyCollection:", 0, v7, v8, v9);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_4;
      v13[3] = &unk_1E3E68BC0;
      objc_copyWeak(&v17, v2);
      v11 = v10;
      v14 = v11;
      v15 = a1[5];
      v16 = a1[6];
      -[PKPeerPaymentRecurringPaymentViewController preflightWithCompletion:](v11, "preflightWithCompletion:", v13);

      objc_destroyWeak(&v17);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E3E61B68;
      objc_copyWeak(&v20, v2);
      v19 = a1[4];
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v12 = (void (**)(id, uint64_t))a1[6];
      if (v12)
        v12[2](v12, 1);

      objc_destroyWeak(&v20);
    }
  }

}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  PKPeerPaymentRecurringPaymentEducationViewController *v4;
  void *v5;
  void *v6;
  PKPeerPaymentRecurringPaymentEducationViewController *v7;
  PKNavigationController *v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = [PKPeerPaymentRecurringPaymentEducationViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "transactionSourceCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "familyCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentRecurringPaymentEducationViewController initWithContext:transactionSourceCollection:familyCollection:](v4, "initWithContext:transactionSourceCollection:familyCollection:", 0, v5, v6);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_3;
    v9[3] = &unk_1E3E61310;
    objc_copyWeak(&v10, v2);
    -[PKPeerPaymentRecurringPaymentEducationViewController setAddCardHandler:](v7, "setAddCardHandler:", v9);
    v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

    objc_destroyWeak(&v10);
  }

}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
    WeakRetained = v2;
  }

}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if ((_DWORD)a2)
    {
      objc_msgSend(WeakRetained, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);
      v5 = v7;
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "showDetailsForRecurringPaymentIdentifier:");
        v5 = v7;
      }
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }

}

- (void)presentPeerPaymentActionViewControllerForAction:(unint64_t)a3 pass:(id)a4 passLibraryDataProvider:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  PKNavigationController *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v13 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", a3, v12, &v20, &v19);
  v14 = v19;
  if (v13)
  {
    +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:](PKPeerPaymentActionViewController, "peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:", a3, v8, v10, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);
    v16 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v15);
    -[PKNavigationController setSupportedInterfaceOrientations:](v16, "setSupportedInterfaceOrientations:", 2);
    -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

    v14 = v15;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __120__PKNavigationDashboardPassViewController_presentPeerPaymentActionViewControllerForAction_pass_passLibraryDataProvider___block_invoke;
    v18[3] = &unk_1E3E612E8;
    v18[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v20, v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

uint64_t __120__PKNavigationDashboardPassViewController_presentPeerPaymentActionViewControllerForAction_pass_passLibraryDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __100__PKNavigationDashboardPassViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke;
  v13 = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v8, "deviceTapAmountEntryViewControllerWithInitialAmount:initialMemo:dismissAction:", v6, v7, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __100__PKNavigationDashboardPassViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v8[3] = &unk_1E3E619E0;
      v9 = v3;
      v10 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v8);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      objc_msgSend(v3, "_handleProvisioningError:", v7);
    }

  }
}

uint64_t __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKPaymentSetupNavigationController setGroupsController:](v5, "setGroupsController:", self->_groupsController);
  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (void)presentAuxiliaryPassInformationItemWithIdentifier:(id)a3 informationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  PKDashboardAuxiliaryPassInformationViewController *v21;
  NSObject *v22;
  id *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "secureElementPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      if (v10)
        v10[2](v10, 0);
      goto LABEL_28;
    }
    objc_msgSend(v13, "auxiliaryPassInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15 || !objc_msgSend(v15, "count"))
    {
      if (v10)
        v10[2](v10, 0);
      goto LABEL_27;
    }
    v17 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke;
      v26[3] = &unk_1E3E67508;
      v23 = &v27;
      v27 = v9;
      objc_msgSend(v16, "pk_firstObjectPassingTest:", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_7:
        objc_msgSend(v18, "items");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v17;
        v24[1] = 3221225472;
        v24[2] = __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke_2;
        v24[3] = &unk_1E3E67530;
        v25 = v8;
        objc_msgSend(v19, "pk_firstObjectPassingTest:", v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = -[PKDashboardAuxiliaryPassInformationViewController initWithItem:forPass:]([PKDashboardAuxiliaryPassInformationViewController alloc], "initWithItem:forPass:", v20, v14);
          -[PKNavigationDashboardPassViewController pushViewController:animated:](self, "pushViewController:animated:", v21, 1);
          if (v10)
            v10[2](v10, 1);

        }
        else if (v10)
        {
          v10[2](v10, 0);
        }

LABEL_25:
        if (v9)

LABEL_27:
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(v16, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_7;
    }
    if (v10)
      v10[2](v10, 0);
    goto LABEL_25;
  }
  PKLogFacilityTypeGetObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v29 = self;
    v30 = 2080;
    v31 = "-[PKNavigationDashboardPassViewController presentAuxiliaryPassInformationItemWithIdentifier:informationIdentif"
          "ier:completion:]";
    _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
  }

  if (v10)
    v10[2](v10, 0);
LABEL_29:

}

uint64_t __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)presentEditCalendarEvent:(id)a3 eventStore:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CAA210];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setEditViewDelegate:", self);
  objc_msgSend(v9, "setEventStore:", v7);

  objc_msgSend(v9, "setEvent:", v8);
  -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentExistingCalendarEvent:(id)a3 eventStore:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CAA218];
  v6 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setEvent:", v6);

  v7 = (void *)objc_msgSend((id)objc_opt_new(), "initWithRootViewController:", v8);
  -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentRestrictedGuestAccessScheduleWithHomeIdentifier:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (Class (__cdecl *)())getHUScheduleAccessViewControllerClass;
    v5 = a3;
    v6 = objc_alloc(v4());
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "initWithHomeID:tintColor:", v5, v7);

    -[PKNavigationDashboardPassViewController pushViewController:animated:](self, "pushViewController:animated:", v8, 1);
  }
}

- (void)performPrecursorPassAction
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PKNavigationDashboardPassViewController_performPrecursorPassAction__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "executeAfterContentIsLoaded:", v4);

}

uint64_t __69__PKNavigationDashboardPassViewController_performPrecursorPassAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPrecursorPassAction");
}

- (void)paymentSetupDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_handleProvisioningError:(id)a3
{
  id v4;

  +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
  -[PKNavigationDashboardPassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
  -[PKNavigationDashboardPassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentSearch
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PKNavigationDashboardPassViewController presentSearchWithCompletion:](self, "presentSearchWithCompletion:", &__block_literal_global_337);
  v3 = *MEMORY[0x1E0D68B18];
  v4 = *MEMORY[0x1E0D68858];
  v7[0] = *MEMORY[0x1E0D68AA0];
  v7[1] = v4;
  v5 = *MEMORY[0x1E0D69470];
  v8[0] = v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNavigationDashboardPassViewController reportEventForPassIfNecessary:](self, "reportEventForPassIfNecessary:", v6);

}

- (void)presentSearchWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKNavigationDashboardPassViewController_presentSearchWithCompletion___block_invoke;
  v6[3] = &unk_1E3E614F0;
  v7 = v4;
  v5 = v4;
  -[PKNavigationDashboardPassViewController presentSearchWithQuery:completion:](self, "presentSearchWithQuery:completion:", 0, v6);

}

uint64_t __71__PKNavigationDashboardPassViewController_presentSearchWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentSearchWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  PKNavigationDashboardPassViewController *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v21 = self;
      v22 = 2080;
      v23 = "-[PKNavigationDashboardPassViewController presentSearchWithQuery:completion:]";
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }

  }
  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v21 = self;
      v22 = 2080;
      v23 = "-[PKNavigationDashboardPassViewController presentSearchWithQuery:completion:]";
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "supportsSearchForPassUniqueID:", v13);

  if (v14)
  {
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke;
    v15[3] = &unk_1E3E68C08;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v7;
    v16 = v10;
    v17 = v6;
    -[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:](self, "_canPresentCreditDetailsViewControllerWithCompletion:", v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKSearchResultsSearchController *v8;
  id v9;
  void *v10;
  PKSearchResultsSearchController *v11;
  NSObject *v12;
  PKSearchResultsSearchController *v13;
  void (**v14)(id, _QWORD);
  _QWORD v15[4];
  PKSearchResultsSearchController *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    *((_BYTE *)WeakRetained + 1744) = 1;
    v8 = [PKSearchResultsSearchController alloc];
    v9 = objc_alloc_init(MEMORY[0x1E0D67100]);
    objc_msgSend(a1[4], "familyCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKSearchResultsSearchController initWithPaymentDataProvider:transactionSourceCollection:familyCollection:](v8, "initWithPaymentDataProvider:transactionSourceCollection:familyCollection:", v9, v5, v10);

    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Calling Search preflight", buf, 2u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_339;
    v15[3] = &unk_1E3E670F8;
    objc_copyWeak(&v19, a1 + 7);
    v18 = a1[6];
    v13 = v11;
    v16 = v13;
    v17 = a1[5];
    -[PKSearchResultsSearchController preflightWithCompletion:](v13, "preflightWithCompletion:", v15);

    objc_destroyWeak(&v19);
  }
  else
  {
    v14 = (void (**)(id, _QWORD))a1[6];
    if (v14)
      v14[2](v14, 0);
  }

}

void __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_339(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void (**v5)(void *, _QWORD);
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  void (**v13)(void *, _QWORD);
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_2;
    aBlock[3] = &unk_1E3E669E0;
    aBlock[4] = WeakRetained;
    v16 = *(id *)(a1 + 48);
    v5 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(v3, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Search preflight completed but another VC already presented", buf, 2u);
      }

      v5[2](v5, 0);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Search preflight completed, presenting now", buf, 2u);
      }

      v9 = *(void **)(a1 + 32);
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_340;
      v10[3] = &unk_1E3E65388;
      v11 = v9;
      v12 = *(id *)(a1 + 40);
      v13 = v5;
      objc_msgSend(v3, "presentViewController:animated:completion:", v11, 1, v10);

    }
  }

}

uint64_t __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1744) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_340(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setQuery:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)presentInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__PKNavigationDashboardPassViewController_presentInvitationWithIdentifier_completion___block_invoke;
    v9[3] = &unk_1E3E68C30;
    v10 = v6;
    v11 = v8;
    -[PKNavigationDashboardPassViewController presentPassDetailsAnimated:handler:](self, "presentPassDetailsAnimated:handler:", 1, v9);

  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

uint64_t __86__PKNavigationDashboardPassViewController_presentInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "presentAccountUserInvitationWithIdentifier:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentSharesList
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id location[2];

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D67688]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v8 = (void *)objc_msgSend(v5, "initWithPass:webService:paymentServiceProvider:queue:", v4, v6, v7, MEMORY[0x1E0C80D38]);

    objc_initWeak(location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PKNavigationDashboardPassViewController_presentSharesList__block_invoke;
    v10[3] = &unk_1E3E61B68;
    objc_copyWeak(&v12, location);
    v9 = v8;
    v11 = v9;
    -[NSObject updateSharesWithCompletion:](v9, "updateSharesWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "SharedWith: Tried to present non SE pass!", (uint8_t *)location, 2u);
    }
  }

}

void __60__PKNavigationDashboardPassViewController_presentSharesList__block_invoke(uint64_t a1)
{
  PKPassSharesListViewController *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[PKPassSharesListViewController initWithSharesController:]([PKPassSharesListViewController alloc], "initWithSharesController:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v2);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (void)presentShareFlow
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  PKLinkedApplication *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  PKLinkedApplication *v17;
  id v18;
  id location;

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "passType") == 1)
  {
    objc_msgSend(v3, "secureElementPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D67688]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v8 = (void *)objc_msgSend(v5, "initWithPass:webService:paymentServiceProvider:queue:", v4, v6, v7, MEMORY[0x1E0C80D38]);

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke;
    v15[3] = &unk_1E3E68C58;
    v9 = v8;
    v16 = v9;
    objc_copyWeak(&v18, &location);
    v10 = v4;
    v17 = v10;
    objc_msgSend(v9, "updateEntitlementsWithCompletion:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", v3);
    v11 = (void *)MEMORY[0x1E0D96D28];
    -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pkui_activityControllerForPass:passView:passLinkedApplication:", v3, v12, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_3;
      v13[3] = &unk_1E3E62C38;
      v14 = v3;
      objc_msgSend(v9, "setCompletionWithItemsHandler:", v13);
      -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }

}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_2;
  v3[3] = &unk_1E3E65360;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "canSendInvitationWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  PKShareSecureElementPassViewController *v4;
  void *v5;
  PKShareSecureElementPassViewController *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v8)
    {
      v4 = (PKShareSecureElementPassViewController *)PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      v5 = WeakRetained;
      v6 = v4;
      v7 = 1;
    }
    else
    {
      v4 = -[PKShareSecureElementPassViewController initWithSecureElementPass:environment:isFromPeopleScreen:delegate:]([PKShareSecureElementPassViewController alloc], "initWithSecureElementPass:environment:isFromPeopleScreen:delegate:", *(_QWORD *)(a1 + 32), 0, 0, 0);
      -[PKShareSecureElementPassViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 5);
      v7 = -[PKShareSecureElementPassViewController shouldViewControllerBeAnimatedIn](v4, "shouldViewControllerBeAnimatedIn");
      v5 = WeakRetained;
      v6 = v4;
    }
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, v7, 0);

  }
}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteShared");
    v6 = *MEMORY[0x1E0D68348];
    v8 = CFSTR("activity");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v6, v7);

  }
  else
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68350], 0);
  }

}

- (void)presentRedeemGiftcard
{
  void *v3;
  id v4;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleBalanceAddMoneyUIManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentAMSRedeemGiftcardFromViewController:webViewDelegate:", self, 0);

}

- (void)presentAddMoneyAppleBalance
{
  void *v3;
  id v4;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleBalanceAddMoneyUIManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentAddMoneyFromViewController:dtuConfiguration:inStoreToken:", self, 0, 0);

}

- (void)presentAddMoneyAppleBalanceDirectTopUp
{
  void *v3;
  id v4;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleBalanceAddMoneyUIManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentDirectTopUpFromViewController:context:configuration:promotion:completion:", self, 1, 0, 0, 0);

}

- (void)presentAddMoneyAppleBalanceInStoreTopUp
{
  void *v3;
  id v4;

  -[PKDashboardViewController dataSource](self->_dashboardVC, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleBalanceAddMoneyUIManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentInStoreTopUpFromViewController:context:token:", self, 0, 0);

}

- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4
{
  void *v6;
  PKPassDeleteAnimationController *v7;
  void *v8;
  PKPassDeleteAnimationController *v9;
  PKPassDeleteAnimationController *deleteAnimationController;
  id v11;

  objc_storeStrong((id *)&self->_passBeingDeleted, a4);
  v11 = a4;
  -[PKNavigationDashboardPassViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = [PKPassDeleteAnimationController alloc];
  -[PKPassGroupView frontmostPassView](self->_passGroupView, "frontmostPassView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPassDeleteAnimationController initWithPassView:groupView:](v7, "initWithPassView:groupView:", v8, self->_passGroupView);
  deleteAnimationController = self->_deleteAnimationController;
  self->_deleteAnimationController = v9;

  -[PKPassDeleteAnimationController setDelegate:](self->_deleteAnimationController, "setDelegate:", self);
  -[PKPassDeleteAnimationController showInViewController:](self->_deleteAnimationController, "showInViewController:", self);

}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PKNavigationDashboardPassViewController *v19;
  id v20;

  v6 = a3;
  -[PKPassGroupView group](self->_passGroupView, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v6, "uniqueID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "indexForPassUniqueID:", v8),
        v8,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_storeStrong((id *)&self->_passBeingDeleted, a3);
    -[PKNavigationDashboardPassViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v12 = (void *)MEMORY[0x1E0CD28B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke;
    v18 = &unk_1E3E61388;
    v19 = self;
    v20 = v6;
    objc_msgSend(v12, "setCompletionBlock:", &v15);
    v10 = 1;
    v13 = (id)-[PKNavigationDashboardPassViewController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1, v15, v16, v17, v18, v19);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1840);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentPassWithUniqueID:", v3);

  v4 = dispatch_time(0, 400000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke_2(uint64_t a1)
{
  PKPassDeleteAnimationController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = [PKPassDeleteAnimationController alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1840), "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassDeleteAnimationController initWithPassView:groupView:](v2, "initWithPassView:groupView:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1840));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1536);
  *(_QWORD *)(v5 + 1536) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "setDelegate:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "forceDeleteAnimation");
}

- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3
{
  id WeakRetained;

  self->_passDeletionInitiated = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "willDeletePass:", self->_passBeingDeleted);
  -[PKDashboardViewController shouldPresentAllContent:animated:](self->_dashboardVC, "shouldPresentAllContent:animated:", 0, 1);
  -[PKNavigationDashboardPassViewController _updatePassFooterView](self, "_updatePassFooterView");

}

- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  -[PKNavigationDashboardPassViewController view](self, "view", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

  self->_passDeletionInitiated = 0;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "didDeletePass:", self->_passBeingDeleted);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PKGroup passes](self->_group, "passes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "uniqueID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPass uniqueID](self->_passBeingDeleted, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13;
          v16 = v14;
          if (v15 == v16)
          {

          }
          else
          {
            v17 = v16;
            if (v15)
              v18 = v16 == 0;
            else
              v18 = 1;
            if (v18)
            {

LABEL_22:
              -[PKDashboardViewController shouldPresentAllContent:animated:](self->_dashboardVC, "shouldPresentAllContent:animated:", 1, 1);
              goto LABEL_23;
            }
            v19 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((v19 & 1) == 0)
              goto LABEL_22;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[PKNavigationDashboardPassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_23:

  }
}

- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  PKNavigationDashboardPassViewController *v15;
  id v16;
  id v17;
  char v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = 0;
  if (v9 && v6)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __135__PKNavigationDashboardPassViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke;
    v14 = &unk_1E3E64E10;
    v15 = self;
    v16 = v8;
    v18 = 1;
    v17 = v9;
    v10 = _Block_copy(&v11);

  }
  -[PKNavigationDashboardPassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10, v11, v12, v13, v14, v15);

}

void __135__PKNavigationDashboardPassViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE5741B8))
    objc_msgSend(v2, "dismissDiscoveryArticleViewController:afterActionCompleted:withRelevantPassUniqueIdenitifer:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  id v6;
  BOOL foregroundActive;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  foregroundActive = self->_activeState.foregroundActive;
  self->_activeState = ($77BFE790A1370D46B4241309C9753022)a4;
  if ((*(_WORD *)&a4 & 0xFF00) == 0 || foregroundActive)
  {
    if ((*(_WORD *)&a4 & 0xFF00) == 0 && foregroundActive)
    {
      if (-[PKGroupsController isAuthenticating](self->_groupsController, "isAuthenticating"))
      {
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController: not terminating analytics subject since the user is authenticating", v15, 2u);
        }
        goto LABEL_10;
      }
      -[PKNavigationDashboardPassViewController _endReportingSessionForPassIfNecessary](self, "_endReportingSessionForPassIfNecessary");
      -[PKDashboardPassViewController frontmostPass](self->_dashboardVC, "frontmostPass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nfcPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "requiresAuthentication");

      if (v14)
        -[PKDashboardViewController shouldPresentAllContent:animated:](self->_dashboardVC, "shouldPresentAllContent:animated:", 0, 0);
    }
  }
  else
  {
    -[PKNavigationDashboardPassViewController _ensureCardPresence](self, "_ensureCardPresence");
    -[PKNavigationDashboardPassViewController _startReportingSessionForPassIfNecessary](self, "_startReportingSessionForPassIfNecessary");
    -[PKNavigationDashboardPassViewController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PKNavigationDashboardPassViewController topViewController](self, "topViewController");
      v10 = objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0D68AA0];
      v17[0] = *MEMORY[0x1E0D68C50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject reportEventForPassIfNecessary:](v10, "reportEventForPassIfNecessary:", v11);

LABEL_10:
    }
  }

}

- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4
{
  id v6;
  void *v7;
  PKCreditAccountPaymentDetailsViewController *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "account");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:detailViewStyle:]([PKCreditAccountPaymentDetailsViewController alloc], "initWithAccount:payment:paymentWebService:detailViewStyle:", v9, v6, v7, 0);

  -[PKNavigationDashboardPassViewController pushViewController:animated:](self, "pushViewController:animated:", v8, 1);
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKNavigationDashboardPassViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_startReportingSessionForPassIfNecessary
{
  void *v2;
  BOOL v3;
  void *v4;
  id v5;

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v3 = v2 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v2);
  }

}

- (void)_endReportingSessionForPassIfNecessary
{
  void *v2;
  BOOL v3;
  id v4;

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = v2 == 0;
  else
    v3 = 1;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v2);

}

- (void)reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v4 && v5 != 0)
    {
      v7 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0D68FA8], *MEMORY[0x1E0D68F50]);
      if (objc_msgSend(v4, "passType") == 1)
        objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0D69108], *MEMORY[0x1E0D69028]);
      v8 = (void *)MEMORY[0x1E0D66A58];
      v9 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v8, "subject:sendEvent:", v5, v9);

    }
  }

}

- (void)shouldPromptForReviewOnDismissalWithTrigger:(unint64_t)a3
{
  self->_reviewTrigger = a3;
  self->_shouldPromptForReviewOnDismissal = 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)footerSuppressed
{
  return self->_footerSuppressed;
}

- (PKPassGroupViewReceiver)receiver
{
  return (PKPassGroupViewReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_receiver, a3);
}

- (PKDashboardPassViewControllerDelegate)passDashboardDelegate
{
  return (PKDashboardPassViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_passDashboardDelegate);
}

- (void)setPassDashboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passDashboardDelegate, a3);
}

- (PKDashboardPassViewController)dashboardVC
{
  return self->_dashboardVC;
}

- (void)setDashboardVC:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardVC, a3);
}

- (PKPassGroupView)passGroupView
{
  return self->_passGroupView;
}

- (BOOL)passGroupViewIsInCollectionView
{
  return self->_passGroupViewIsInCollectionView;
}

- (BOOL)shouldPromptForReviewOnDismissal
{
  return self->_shouldPromptForReviewOnDismissal;
}

- (void)setShouldPromptForReviewOnDismissal:(BOOL)a3
{
  self->_shouldPromptForReviewOnDismissal = a3;
}

- (unint64_t)reviewTrigger
{
  return self->_reviewTrigger;
}

- (void)setReviewTrigger:(unint64_t)a3
{
  self->_reviewTrigger = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passGroupView, 0);
  objc_storeStrong((id *)&self->_dashboardVC, 0);
  objc_destroyWeak((id *)&self->_passDashboardDelegate);
  objc_destroyWeak((id *)&self->_receiver);
  objc_storeStrong((id *)&self->_postTransactionTimer, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_actionGroupController, 0);
  objc_storeStrong((id *)&self->_accountCardNumbersPresenter, 0);
  objc_storeStrong((id *)&self->_cardNumbersButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_passFooterView, 0);
  objc_storeStrong((id *)&self->_portalledPassthroughView, 0);
  objc_storeStrong((id *)&self->_passthroughView, 0);
  objc_storeStrong((id *)&self->_offsetAnimation, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_passBeingDeleted, 0);
  objc_storeStrong((id *)&self->_deleteAnimationController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_destroyWeak((id *)&self->_formerGroupViewDelegate);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_transitioningHandler);
  objc_storeStrong((id *)&self->_interstitialController, 0);
}

@end
