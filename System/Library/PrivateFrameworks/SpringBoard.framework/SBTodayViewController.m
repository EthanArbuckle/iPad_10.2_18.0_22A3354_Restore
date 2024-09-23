@implementation SBTodayViewController

- (BOOL)isSpotlightVisible
{
  return -[SBTodayViewSpotlightPresenter isPresenting](self->_spotlightPresenter, "isPresenting");
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController loadView](&v3, sel_loadView);
  -[SBTodayViewController _setUpGestureRecognizers](self, "_setUpGestureRecognizers");
  -[SBTodayViewController _setUpSearchPresenter](self, "_setUpSearchPresenter");
}

- (void)_setUpGestureRecognizers
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *dismissTapGestureRecognizer;
  id v5;

  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__dismissTodayViewOverlay_);
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v3;

  -[UITapGestureRecognizer setAllowableMovement:](self->_dismissTapGestureRecognizer, "setAllowableMovement:", 10.0);
  -[UITapGestureRecognizer setDelegate:](self->_dismissTapGestureRecognizer, "setDelegate:", self);
  -[SBTodayViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_dismissTapGestureRecognizer);

}

- (void)_setUpSearchPresenter
{
  void *v3;
  uint64_t v4;
  void *v5;
  SBFTouchPassThroughView *v6;
  SBFTouchPassThroughView *spotlightContainerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBTodayViewSpotlightPresenter *v15;
  SBFTouchPassThroughView *v16;
  void *v17;
  SBTodayViewSpotlightPresenter *v18;
  SBTodayViewSpotlightPresenter *spotlightPresenter;
  SBTodayViewSpotlightPresenter *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[SBTodayViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E0DA9F28]);
    spotlightContainerView = self->_spotlightContainerView;
    self->_spotlightContainerView = v6;

    -[SBFTouchPassThroughView setTranslatesAutoresizingMaskIntoConstraints:](self->_spotlightContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", self->_spotlightContainerView);
    v23 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView leadingAnchor](self->_spotlightContainerView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v26;
    objc_msgSend(v5, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView trailingAnchor](self->_spotlightContainerView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v22;
    objc_msgSend(v5, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView topAnchor](self->_spotlightContainerView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v10;
    objc_msgSend(v5, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView bottomAnchor](self->_spotlightContainerView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v14);

    v15 = [SBTodayViewSpotlightPresenter alloc];
    v16 = self->_spotlightContainerView;
    -[SBHTodayViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBTodayViewSpotlightPresenter initWithSearchBarViewController:containerView:scrollView:delegate:](v15, "initWithSearchBarViewController:containerView:scrollView:delegate:", 0, v16, v17, self);
    spotlightPresenter = self->_spotlightPresenter;
    self->_spotlightPresenter = v18;

    v20 = self->_spotlightPresenter;
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTodayViewSpotlightPresenter setLegibilitySettings:](v20, "setLegibilitySettings:", v21);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (-[SBHTodayViewController location](self, "location") == 2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerExternalBehaviorProvider:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[SBHTodayViewController location](self, "location") == 2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterExternalBehaviorProvider:", self);

  }
}

- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[SBTodayViewSpotlightPresenter spotlightViewController](self->_spotlightPresenter, "spotlightViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBTodayViewController childViewControllers](self, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if (v13 != v7)
          -[SBTodayViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v13, v5, v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[SBTodayViewSpotlightPresenter spotlightViewController](self->_spotlightPresenter, "spotlightViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBTodayViewController childViewControllers](self, "childViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (v11 != v5)
          -[SBTodayViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v11, v3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)SBTodayViewController;
  v6 = a3;
  -[SBHTodayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  -[SBTodayViewSpotlightPresenter containerViewDidMoveToWindow:](self->_spotlightPresenter, "containerViewDidMoveToWindow:", v6, v7.receiver, v7.super_class);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateScrollViewContentInset
{
  double *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  double v31;
  id v32;

  v3 = (double *)MEMORY[0x1E0CEB4B0];
  -[SBTodayViewSpotlightPresenter searchBarViewController](self->_spotlightPresenter, "searchBarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  if (v4)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    -[SBHTodayViewController searchBarTopOffset](self, "searchBarTopOffset");
    v9 = v8 + v7;

  }
  else
  {
    v9 = *v3;
  }
  v10 = v3[1];
  v11 = v3[2];
  v12 = v3[3];
  if (-[SBTodayViewController isEditing](self, "isEditing"))
  {
    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "presentingEdge");

    if ((v14 & 4) != 0)
      v11 = 100.0;
  }
  -[SBHTodayViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentInset");
  if (v10 == v19 && v9 == v16 && v12 == v18)
  {
    v22 = v17;

    if (v11 == v22)
      goto LABEL_19;
  }
  else
  {

  }
  -[SBHTodayViewController scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentOffset");
  -[SBHTodayViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "adjustedContentInset");
  v25 = BSFloatLessThanOrEqualToFloat();

  -[SBHTodayViewController scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentInset:", v9, v10, v11, v12);

  if (v25)
  {
    -[SBHTodayViewController scrollView](self, "scrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isDragging");

    if ((v28 & 1) == 0)
    {
      -[SBHTodayViewController scrollView](self, "scrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHTodayViewController scrollView](self, "scrollView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "adjustedContentInset");
      objc_msgSend(v29, "setContentOffset:", 0.0, -v31);

    }
  }
LABEL_19:

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBTodayViewSpotlightPresenter layout](self->_spotlightPresenter, "layout");
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
  -[SBTodayViewSpotlightPresenter presentSpotlightAnimated:](self->_spotlightPresenter, "presentSpotlightAnimated:", a3);
}

- (void)dismissSpotlightAnimated:(BOOL)a3
{
  -[SBTodayViewSpotlightPresenter dismissSpotlightAnimated:](self->_spotlightPresenter, "dismissSpotlightAnimated:", a3);
}

- (void)updateViewsWithLegibilitySettings
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController updateViewsWithLegibilitySettings](&v4, sel_updateViewsWithLegibilitySettings);
  -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTodayViewSpotlightPresenter setLegibilitySettings:](self->_spotlightPresenter, "setLegibilitySettings:", v3);

}

- (void)_dismissTodayViewOverlay:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBTodayViewController dismissTapGestureRecognizer](self, "dismissTapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 == v8)
  {
    v6 = objc_msgSend(v8, "state") == 3;
    v5 = v8;
    if (v6)
    {
      -[SBHTodayViewController dismissalDelegate](self, "dismissalDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "overlayControllerRequestsDismissal:", self);

      v5 = v8;
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SBTodayViewController dismissTapGestureRecognizer](self, "dismissTapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SBHTodayViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v11 == v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  _BOOL4 v20;
  char v21;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  CGPoint v28;
  CGRect v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  -[SBTodayViewController dismissTapGestureRecognizer](self, "dismissTapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBHTodayViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    if (-[SBTodayViewController isEditing](self, "isEditing"))
    {
      *((_BYTE *)v25 + 24) = 0;
    }
    else
    {
      -[SBTodayViewSpotlightPresenter searchBarViewController](self->_spotlightPresenter, "searchBarViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "locationInView:", self->_spotlightContainerView);
        v16 = v15;
        v18 = v17;
        objc_msgSend(v14, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v28.x = v16;
        v28.y = v18;
        v20 = CGRectContainsPoint(v29, v28);

        if (v20)
          *((_BYTE *)v25 + 24) = 0;
      }

      if (*((_BYTE *)v25 + 24))
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __62__SBTodayViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v23[3] = &unk_1E8EABAB0;
        v23[6] = v11;
        v23[7] = v13;
        v23[4] = self;
        v23[5] = &v24;
        -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", v23);
      }
    }
  }
  v21 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return v21;
}

BOOL __62__SBTodayViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  _BOOL8 result;
  CGRect v24;

  v5 = a2;
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  result = CGRectContainsPoint(v24, *(CGPoint *)(a1 + 48));
  if (result)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (id)spotlightHeaderAcquiringViewController
{
  return -[SBTodayViewSpotlightPresenter spotlightViewController](self->_spotlightPresenter, "spotlightViewController");
}

- (void)spotlightPresenterSearchBarDidFocus:(id)a3
{
  id v4;

  -[SBHTodayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todayViewWantsToEndEditing:", self);

}

- (void)spotlightPresenterWillPresentSpotlight:(id)a3
{
  id v4;

  -[SBHTodayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todayViewControllerWillPresentSpotlight:", self);

}

- (void)spotlightPresenterDidPresentSpotlight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBHTodayViewController location](self, "location", a3) == 2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalBehaviorProviderBehaviorChanged:", self);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBHTodayViewController observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "todayViewControllerDidPresentSearch:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)spotlightPresenterDidDismissSpotlight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBHTodayViewController location](self, "location", a3) == 2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalBehaviorProviderBehaviorChanged:", self);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBHTodayViewController observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "todayViewControllerDidDismissSearch:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (double)todayViewControllerLocationForSpotlightPresenter:(id)a3
{
  return (double)-[SBHTodayViewController location](self, "location", a3);
}

- (BOOL)spotlightPresenterAllowsPullToSearch:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpotlightAllowed");

  if (v5)
    return -[SBTodayViewController isEditing](self, "isEditing") ^ 1;
  else
    return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBTodayViewController;
  v4 = a3;
  -[SBHTodayViewController scrollViewWillBeginDragging:](&v5, sel_scrollViewWillBeginDragging_, v4);
  -[SBTodayViewSpotlightPresenter scrollViewWillBeginDragging:](self->_spotlightPresenter, "scrollViewWillBeginDragging:", v4, v5.receiver, v5.super_class);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController scrollViewDidScroll:](&v6, sel_scrollViewDidScroll_, v4);
  -[SBHTodayViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[SBTodayViewSpotlightPresenter scrollViewDidScroll:](self->_spotlightPresenter, "scrollViewDidScroll:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SBTodayViewController;
  v9 = a3;
  -[SBHTodayViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  -[SBTodayViewSpotlightPresenter scrollViewWillEndDragging:withVelocity:](self->_spotlightPresenter, "scrollViewWillEndDragging:withVelocity:", v9, x, y, v10.receiver, v10.super_class);

}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[SBHTodayViewController cancelTouchesForAllWidgets](self, "cancelTouchesForAllWidgets");
  -[SBHTodayViewController beginDisablingWidgetHitTestingForReason:](self, "beginDisablingWidgetHitTestingForReason:", *MEMORY[0x1E0DAA900]);
  -[SBHTodayViewController setIsOverlayViewDisappearing:](self, "setIsOverlayViewDisappearing:", 1);
  objc_msgSend(v4, "presentationProgress");
  v6 = v5;

  -[SBHTodayViewController setMostRecentPresentationProgress:](self, "setMostRecentPresentationProgress:", v6);
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    objc_msgSend(a3, "presentationProgress");
    -[SBHTodayViewController setMostRecentPresentationProgress:](self, "setMostRecentPresentationProgress:");
    if (((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
      && -[SBHTodayViewController isOverlayViewDisappearing](self, "isOverlayViewDisappearing"))
    {
      -[SBHTodayViewController invalidateAllCancelTouchesAssertions](self, "invalidateAllCancelTouchesAssertions");
      -[SBHTodayViewController endDisablingWidgetHitTestingForReason:](self, "endDisablingWidgetHitTestingForReason:", *MEMORY[0x1E0DAA900]);
      -[SBHTodayViewController setIsOverlayViewDisappearing:](self, "setIsOverlayViewDisappearing:", 0);
    }
    -[SBTodayViewController _setStatusBarSettingsAssertionActive:](self, "_setStatusBarSettingsAssertionActive:", BSFloatGreaterThanFloat());
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SBHTodayViewController observers](self, "observers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "todayViewController:didChangePresentationProgress:newPresentationProgress:fromLeading:", self, 1, a4, a5);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (BOOL)_shouldIconViewForbidJiggling:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  unint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  double MaxY;
  CGFloat v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v4 = a3;
  -[SBHTodayViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if (!v6)
    goto LABEL_4;
  -[SBHTodayViewController listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (!v10)
    goto LABEL_4;
  -[SBHTodayViewController onScreenIconIndexRangeByIconListView](self, "onScreenIconIndexRangeByIconListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController listView](self, "listView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rangeValue");
  v16 = v15;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBTodayViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTodayViewController spotlightPresenter](self, "spotlightPresenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "searchBarViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHTodayViewController scrollView](self, "scrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adjustedContentInset");
    v25 = v24;

    objc_msgSend(v22, "frame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v22, "superview");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:fromView:", v34, v27, v29, v31, v33);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    -[SBHTodayViewController listView](self, "listView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "indexOfIcon:", v44);

    v17 = 1;
    if (v45 >= v14 && v45 - v14 < v16)
    {
      v46 = v42 + v25 + v38;
      objc_msgSend(v4, "frame");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;
      objc_msgSend(v4, "superview");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertRect:fromView:", v55, v48, v50, v52, v54);
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;

      v64 = v25 + v59;
      v71.origin.y = 0.0;
      v67.origin.x = v57;
      v67.origin.y = v64;
      v67.size.width = v61;
      v67.size.height = v63;
      v71.origin.x = v36;
      v71.size.width = v40;
      v71.size.height = v46;
      if (CGRectIntersectsRect(v67, v71))
      {
        v68.origin.y = 0.0;
        v68.origin.x = v36;
        v68.size.width = v40;
        v68.size.height = v46;
        MaxY = CGRectGetMaxY(v68);
        v69.origin.x = v57;
        v69.origin.y = v64;
        v69.size.width = v61;
        v69.size.height = v63;
        v66 = MaxY - CGRectGetMinY(v69);
        v70.origin.x = v57;
        v70.origin.y = v64;
        v70.size.width = v61;
        v70.size.height = v63;
        v17 = v66 > CGRectGetHeight(v70);
      }
      else
      {
        v17 = 0;
      }
    }

  }
  else
  {
LABEL_4:
    v17 = 0;
  }

  return v17;
}

- (void)cleanupViews
{
  objc_super v3;

  if (-[SBTodayViewController isSpotlightVisible](self, "isSpotlightVisible"))
    -[SBTodayViewSpotlightPresenter dismissSpotlightAnimated:](self->_spotlightPresenter, "dismissSpotlightAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  -[SBHTodayViewController cleanupViews](&v3, sel_cleanupViews);
}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBMutableStatusBarSettings *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[SBTodayViewController statusBarSettingsAssertion](self, "statusBarSettingsAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    v14 = 0;
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setLegibilitySettings:](v9, "setLegibilitySettings:", v10);

    v11 = (void *)objc_msgSend(v8, "newSettingsAssertionWithSettings:atLevel:reason:", v9, 2, CFSTR("Today View"));
    __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acquireWithAnimationParameters:", v12);

    -[SBTodayViewController setStatusBarSettingsAssertion:](self, "setStatusBarSettingsAssertion:", v11);
LABEL_7:
    v5 = v14;
    goto LABEL_8;
  }
  if (!v3 && v5)
  {
    v14 = v5;
    __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateWithAnimationParameters:", v13);

    -[SBTodayViewController setStatusBarSettingsAssertion:](self, "setStatusBarSettingsAssertion:", 0);
    goto LABEL_7;
  }
LABEL_8:

}

id __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke()
{
  void *v0;
  double v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
  objc_msgSend(v0, "duration");
  objc_msgSend(v0, "setDuration:", v1 * 0.6);
  return v0;
}

- (int64_t)idleTimerDuration
{
  void *v2;
  int64_t v3;

  -[SBTodayViewController spotlightPresenter](self, "spotlightPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPresenting"))
    v3 = 6;
  else
    v3 = 5;

  return v3;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 4096;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  NSObject *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  int v10;
  SBTodayViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Determining participantState for %@", (uint8_t *)&v10, 0xCu);
  }

  -[SBHTodayViewController mostRecentPresentationProgress](self, "mostRecentPresentationProgress");
  v4 = BSFloatLessThanFloat();
  -[SBTodayViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (-[SBTodayViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) != 0)
  {

LABEL_6:
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Determined participantState for %@ to be Inactive", (uint8_t *)&v10, 0xCu);
    }
    v8 = 1;
    goto LABEL_9;
  }

  if ((v4 & 1) != 0)
    goto LABEL_6;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Determined participantState for %@ to be ACTIVE", (uint8_t *)&v10, 0xCu);
  }
  v8 = 2;
LABEL_9:

  return v8;
}

- (SBViewControllerTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion
{
  return self->_statusBarSettingsAssertion;
}

- (void)setStatusBarSettingsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, a3);
}

- (SBTodayViewSpotlightPresenter)spotlightPresenter
{
  return self->_spotlightPresenter;
}

- (void)setSpotlightPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightPresenter, a3);
}

- (SBFTouchPassThroughView)spotlightContainerView
{
  return self->_spotlightContainerView;
}

- (void)setSpotlightContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightContainerView, a3);
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (void)setDismissTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spotlightContainerView, 0);
  objc_storeStrong((id *)&self->_spotlightPresenter, 0);
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
