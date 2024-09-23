@implementation SBLegacyTodayViewSpotlightPresentableViewController

- (SBLegacyTodayViewSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3 searchBarViewController:(id)a4 scrollView:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBLegacyTodayViewSpotlightPresentableViewController *v12;
  SBLegacyTodayViewSpotlightPresentableViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  v12 = -[SBLegacyTodayViewSpotlightPresentableViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spotlightMultiplexingViewController, a3);
    objc_storeStrong((id *)&v13->_searchBarViewController, a4);
    objc_storeStrong((id *)&v13->_scrollView, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  -[SBLegacyTodayViewSpotlightPresentableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBLegacyTodayViewSpotlightPresentableViewController _setUpSearchBackdrop](self, "_setUpSearchBackdrop");
  -[SBLegacyTodayViewSpotlightPresentableViewController _setUpSearchBar](self, "_setUpSearchBar");
  -[SBSpotlightMultiplexingViewController setSpotlightDelegate:](self->_spotlightMultiplexingViewController, "setSpotlightDelegate:", self);
  -[SBLegacyTodayViewSpotlightPresentableViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_spotlightMultiplexingViewController);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;

  if (a3)
  {
    -[SBLegacyTodayViewSpotlightPresentableViewController _setUpSearchBackdropMatchMoveAnimation](self, "_setUpSearchBackdropMatchMoveAnimation", a3, a4);
    -[SBLegacyTodayViewSpotlightPresentableViewController _setUpFeatherBackgroundMatchMoveAnimations](self, "_setUpFeatherBackgroundMatchMoveAnimations");
  }
  else
  {
    -[MTMaterialView layer](self->_searchBackdropView, "layer", 0, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a4;
  -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView layer](self->_searchBackdropView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationForKey:", CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));
  objc_msgSend(v6, "setHidden:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__SBLegacyTodayViewSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E8EAF278;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v12);

}

uint64_t __106__SBLegacyTodayViewSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));
  return objc_msgSend(*(id *)(a1 + 48), "setHidden:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLegacyTodayViewSpotlightPresentableViewController;
  -[SBLegacyTodayViewSpotlightPresentableViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBLegacyTodayViewSpotlightPresentableViewController _updateMaskLayers](self, "_updateMaskLayers");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBSpotlightMultiplexingViewController *spotlightMultiplexingViewController;
  uint64_t v17;
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
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  MTMaterialView *searchBackdropView;
  double v35;
  NSLayoutConstraint *featherBlurHeightConstraint;
  double v37;
  double v38;
  double v39;
  id v40;

  -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view", a3, a4, a5);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchBarController view](self->_searchBarViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaInsets");
  v13 = v12;
  -[SBLegacyTodayViewSpotlightPresentableViewController topOffset](self, "topOffset");
  v15 = v14;
  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  v39 = v13;
  if (spotlightMultiplexingViewController)
  {
    v17 = -[SBSpotlightMultiplexingViewController interfaceOrientation](spotlightMultiplexingViewController, "interfaceOrientation");
    v18 = 38.0;
    if ((unint64_t)(v17 - 1) < 2)
      v18 = 36.0;
    v38 = v18;
  }
  else
  {
    v38 = 36.0;
  }
  objc_msgSend(v40, "bounds");
  UIRectGetCenter();
  v20 = v19;
  v22 = v21;
  objc_msgSend(v11, "center");
  v24 = v23;
  v26 = v25;
  v27 = a4 / 3.0 + v15;
  objc_msgSend(v11, "size");
  v29 = v28 * 0.5;
  if (a6)
  {
    if (a6 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538], v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_scaledValueForValue:", v38);
      UIRoundToViewScale();
      v26 = v39 + v32 + 6.0;

      v27 = v15;
    }
    else
    {
      v30 = v39 + v27 + v29;
      if (a6 == 1)
      {
        v26 = v30;
        v22 = v15 + a4 + v22;
      }
    }
  }
  else
  {
    v22 = v15 + v22;
    v26 = v39 + v27 + v29;
  }
  objc_msgSend(v10, "setCenter:", v20, v22);
  -[NSLayoutConstraint setConstant:](self->_searchBarViewTopConstraint, "setConstant:", v27);
  -[_UIPortalView setCenter:](self->_searchBarPortalView, "setCenter:", v24, v26);
  -[SBLegacyTodayViewSpotlightPresentableViewController _sharedRemoteSearchViewController](self, "_sharedRemoteSearchViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRevealProgress:", a3);

  searchBackdropView = self->_searchBackdropView;
  objc_msgSend(v40, "bounds");
  -[MTMaterialView setFrame:](searchBackdropView, "setFrame:");
  -[MTMaterialView setWeighting:](self->_searchBackdropView, "setWeighting:", a3);
  objc_msgSend(v10, "setAlpha:", (a3 + -0.3) / 0.7 + 0.0);
  v35 = 1.0;
  if (a6 == 2)
    v35 = 0.0;
  objc_msgSend(v11, "setAlpha:", v35);
  featherBlurHeightConstraint = self->_featherBlurHeightConstraint;
  objc_msgSend(v11, "bounds");
  -[NSLayoutConstraint setConstant:](featherBlurHeightConstraint, "setConstant:", v15 + v37 + 12.0);
  -[SBLegacyTodayViewSpotlightPresentableViewController _updateMaskLayers](self, "_updateMaskLayers");

}

- (void)setTargetDisplayConfiguration:(id)a3
{
  -[SBSpotlightMultiplexingViewController setTargetDisplayConfiguration:](self->_spotlightMultiplexingViewController, "setTargetDisplayConfiguration:", a3);
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[4];
  __CFString *v17;
  id v18;
  id location;

  if (a3 == 2)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", 2, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("AnimatedPresentation-%@"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  else
  {
    if (a3)
    {
      v7 = 0;
      v11 = CFSTR("SBTodayViewSearchPortalRequiredForInteractivePresentationReason");
      goto LABEL_7;
    }
    v7 = self->_searchBarPortalView == 0;
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("AnimatedDismissal-%@"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[SBLegacyTodayViewSpotlightPresentableViewController _beginRequiringSearchBarPortalViewForReason:](self, "_beginRequiringSearchBarPortalViewForReason:", v11);
  *a5 = v7;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __130__SBLegacyTodayViewSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
  v16[3] = &unk_1E8E9F280;
  objc_copyWeak(&v18, &location);
  v17 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x1D17E5550](v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v14;
}

void __130__SBLegacyTodayViewSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_endRequiringSearchBarPortalViewForReason:", *(_QWORD *)(a1 + 32));

}

- (void)dismissSearchView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "legacyTodayViewSpotlightPresentableViewControllerShouldDismiss:", self);

}

- (void)_setUpSearchBar
{
  void *v3;
  double v4;
  double v5;
  SBFFeatherBlurView *v6;
  SBFFeatherBlurView *featherBlurView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *searchBarViewTopConstraint;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *featherBlurHeightConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  void *v29;
  NSArray *v30;
  NSArray *searchBarGradientMaskLayers;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];

  v43[7] = *MEMORY[0x1E0C80C00];
  if (self->_searchBarViewController)
  {
    -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLegacyTodayViewSpotlightPresentableViewController topOffset](self, "topOffset");
    v5 = v4;
    v6 = (SBFFeatherBlurView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E00]), "initWithRecipe:", 0);
    featherBlurView = self->_featherBlurView;
    self->_featherBlurView = v6;

    -[SBFFeatherBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_featherBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", self->_featherBlurView);
    -[SBLegacyTodayViewSpotlightPresentableViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_searchBarViewController, v3);
    -[SPUISearchBarController view](self->_searchBarViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, v5);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    searchBarViewTopConstraint = self->_searchBarViewTopConstraint;
    self->_searchBarViewTopConstraint = v12;

    -[SBFFeatherBlurView bottomAnchor](self->_featherBlurView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v5 + v17);
    v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    featherBlurHeightConstraint = self->_featherBlurHeightConstraint;
    self->_featherBlurHeightConstraint = v18;

    v34 = (void *)MEMORY[0x1E0CB3718];
    v43[0] = self->_searchBarViewTopConstraint;
    objc_msgSend(v3, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v8;
    objc_msgSend(v8, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v39;
    objc_msgSend(v3, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v35;
    -[SBFFeatherBlurView topAnchor](self->_featherBlurView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v20;
    -[SBFFeatherBlurView leadingAnchor](self->_featherBlurView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v3;
    v36 = v3;
    objc_msgSend(v3, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v24;
    -[SBFFeatherBlurView trailingAnchor](self->_featherBlurView, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self->_featherBlurHeightConstraint;
    v43[5] = v27;
    v43[6] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v29);

    objc_msgSend(MEMORY[0x1E0DA9E00], "configureGradientMaskForFeatherBlurRecipe:onContentView:", 0, self->_scrollView);
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v30;

  }
}

- (void)_setUpSearchBackdrop
{
  id WeakRetained;
  MTMaterialView *v4;
  MTMaterialView *searchBackdropView;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "backdropViewForLegacyTodayViewSpotlightPresentableViewController:", self);
  v4 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  searchBackdropView = self->_searchBackdropView;
  self->_searchBackdropView = v4;

  -[MTMaterialView bs_setHitTestingDisabled:](self->_searchBackdropView, "bs_setHitTestingDisabled:", 1);
  -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_searchBackdropView);
  objc_msgSend(v6, "sendSubviewToBack:", self->_searchBackdropView);

}

- (void)_setUpFeatherBackgroundMatchMoveAnimations
{
  void *v3;
  SBFFeatherBlurView *featherBlurView;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSArray mutableCopy](self->_searchBarGradientMaskLayers, "mutableCopy");
  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  featherBlurView = self->_featherBlurView;
  if (featherBlurView)
  {
    -[SBFFeatherBlurView layer](featherBlurView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0DA9E00];
        objc_msgSend(v13, "frame", (_QWORD)v16);
        objc_msgSend(v14, "matchMoveAnimationForFrame:relativeToView:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAnimation:forKey:", v15, CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_setUpSearchBackdropMatchMoveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DA9D88];
  -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchMoveAnimationForPinningToView:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MTMaterialView addAnimation:forKey:](self->_searchBackdropView, "addAnimation:forKey:", v6, CFSTR("SBTodayViewSearchBackdropMatchMoveAnimation"));
}

- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3
{
  id v5;
  NSMutableSet *searchBarPortalRequirementReasons;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  _UIPortalView *v13;
  _UIPortalView *searchBarPortalView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLegacyTodayViewSpotlightPresentableViewController.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  if (self->_searchBarViewController)
  {
    searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
    v19 = v5;
    if (!searchBarPortalRequirementReasons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v8 = self->_searchBarPortalRequirementReasons;
      self->_searchBarPortalRequirementReasons = v7;

      searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
    }
    -[NSMutableSet addObject:](searchBarPortalRequirementReasons, "addObject:", v19);
    v5 = v19;
    if (!self->_searchBarPortalView)
    {
      -[SBLegacyTodayViewSpotlightPresentableViewController _sharedRemoteSearchViewController](self, "_sharedRemoteSearchViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "searchHeaderLayerRenderID");
      v11 = objc_msgSend(v9, "searchHeaderContextID");
      if (v10 && v11)
      {
        -[SPUISearchBarController view](self->_searchBarViewController, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setHidden:", 1);

        v13 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E0CEAE58]);
        searchBarPortalView = self->_searchBarPortalView;
        self->_searchBarPortalView = v13;

        -[_UIPortalView bs_setHitTestingDisabled:](self->_searchBarPortalView, "bs_setHitTestingDisabled:", 1);
        -[_UIPortalView setHidesSourceView:](self->_searchBarPortalView, "setHidesSourceView:", 1);
        -[_UIPortalView portalLayer](self->_searchBarPortalView, "portalLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSourceLayerRenderId:", objc_msgSend(v9, "searchHeaderLayerRenderID"));

        -[_UIPortalView portalLayer](self->_searchBarPortalView, "portalLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSourceContextId:", objc_msgSend(v9, "searchHeaderContextID"));

        -[SBLegacyTodayViewSpotlightPresentableViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", self->_searchBarPortalView);

      }
      v5 = v19;
    }
  }

}

- (void)_endRequiringSearchBarPortalViewForReason:(id)a3
{
  void *v4;
  _UIPortalView *searchBarPortalView;

  -[NSMutableSet removeObject:](self->_searchBarPortalRequirementReasons, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count"))
  {
    if (self->_searchBarPortalView)
    {
      -[SPUISearchBarController view](self->_searchBarViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 0);

      -[_UIPortalView removeFromSuperview](self->_searchBarPortalView, "removeFromSuperview");
      searchBarPortalView = self->_searchBarPortalView;
      self->_searchBarPortalView = 0;

    }
  }
}

- (void)_updateMaskLayers
{
  double v3;
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
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v4 = v3;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v6 = v4 + v5;
  objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBFFeatherBlurView frame](self->_featherBlurView, "frame");
  v32 = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = self->_searchBarGradientMaskLayers;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = v21 - (v8 + v12);
    v26 = v19 - (v10 + v14);
    v27 = v8 + v17;
    v28 = v10 + v32;
    v29 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v22);
        v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v31, "setFrame:", v28, v27, v26, v25);
        objc_msgSend(v31, "setHidden:", v6 <= 0.0);
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v24);
  }

  -[SBLegacyTodayViewSpotlightPresentableViewController _setUpFeatherBackgroundMatchMoveAnimations](self, "_setUpFeatherBackgroundMatchMoveAnimations");
  -[SBFFeatherBlurView setHidden:](self->_featherBlurView, "setHidden:", v6 <= 0.0);
}

- (id)_sharedRemoteSearchViewController
{
  return (id)objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
}

- (SBLegacyTodayViewSpotlightPresentableViewControllerDelegate)delegate
{
  return (SBLegacyTodayViewSpotlightPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
}

- (SPUISearchBarController)searchBarViewController
{
  return self->_searchBarViewController;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->_maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->_maxPresentationOffset = a3;
}

- (SBFFeatherBlurView)featherBlurView
{
  return self->_featherBlurView;
}

- (void)setFeatherBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_featherBlurView, a3);
}

- (NSLayoutConstraint)featherBlurHeightConstraint
{
  return self->_featherBlurHeightConstraint;
}

- (void)setFeatherBlurHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_featherBlurHeightConstraint, a3);
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, a3);
}

- (MTMaterialView)searchBackdropView
{
  return self->_searchBackdropView;
}

- (void)setSearchBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBackdropView, a3);
}

- (_UIPortalView)searchBarPortalView
{
  return self->_searchBarPortalView;
}

- (void)setSearchBarPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarPortalView, a3);
}

- (NSLayoutConstraint)searchBarViewTopConstraint
{
  return self->_searchBarViewTopConstraint;
}

- (void)setSearchBarViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarViewTopConstraint, a3);
}

- (NSMutableSet)searchBarPortalRequirementReasons
{
  return self->_searchBarPortalRequirementReasons;
}

- (void)setSearchBarPortalRequirementReasons:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, 0);
  objc_storeStrong((id *)&self->_searchBarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_searchBarPortalView, 0);
  objc_storeStrong((id *)&self->_searchBackdropView, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_featherBlurHeightConstraint, 0);
  objc_storeStrong((id *)&self->_featherBlurView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
