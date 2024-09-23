@implementation SBTodayViewSpotlightPresenter

- (BOOL)isPresenting
{
  return -[SBSearchPresenter isPresenting](self->_presenter, "isPresenting");
}

- (SBTodayViewSpotlightPresenter)initWithSearchBarViewController:(id)a3 containerView:(id)a4 scrollView:(id)a5 delegate:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  SBTodayViewSpotlightPresenter *v17;
  SBTodayViewSpotlightPresenter *v18;
  SBSearchPresenter *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SBSearchPresenter *presenter;
  void *v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTodayViewSpotlightPresenter.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTodayViewSpotlightPresenter.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)SBTodayViewSpotlightPresenter;
  v17 = -[SBTodayViewSpotlightPresenter init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_searchBarViewController, a3);
    objc_storeStrong((id *)&v18->_containerView, a4);
    objc_storeStrong((id *)&v18->_scrollView, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_msgSend(v12, "setDelegate:", v18);
    v19 = [SBSearchPresenter alloc];
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "todayViewPullToSearchSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBSearchPresenter initWithSettings:identifier:](v19, "initWithSettings:identifier:", v21, CFSTR("TodayView"));
    presenter = v18->_presenter;
    v18->_presenter = (SBSearchPresenter *)v22;

    -[SBSearchPresenter setSearchPresenterDelegate:](v18->_presenter, "setSearchPresenterDelegate:", v18);
    -[SBTodayViewSpotlightPresenter _setUpFeatherBlur](v18, "_setUpFeatherBlur");
  }

  return v18;
}

- (void)layout
{
  -[SBSearchPresenter layout](self->_presenter, "layout");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = a3;
  -[SBTodayViewSpotlightPresenter _setUpStartingScrollOffset](self, "_setUpStartingScrollOffset");
  -[SBSearchPresenter scrollViewWillBeginDragging:](self->_presenter, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  -[SBTodayViewSpotlightPresenter _updateFeatherBlurMaskLayers](self, "_updateFeatherBlurMaskLayers");
  -[SBSearchPresenter scrollViewDidScroll:](self->_presenter, "scrollViewDidScroll:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  -[SBSearchPresenter scrollViewWillEndDragging:withVelocity:](self->_presenter, "scrollViewWillEndDragging:withVelocity:", a3, a4.x, a4.y);
}

- (id)searchPresentablesForPresenter:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_spotlightViewController)
  {
    v5[0] = self->_spotlightViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  return -[UIView _sbDisplayConfiguration](self->_containerView, "_sbDisplayConfiguration", a3);
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  SBTodayViewSpotlightPresenter *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "spotlightPresenterAllowsPullToSearch:", v3);

  return (char)v3;
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  UIViewController *spotlightViewController;
  UIView *v9;
  double v10;
  uint64_t v11;
  _SBTodaySpotlightViewController *v12;
  _SBTodaySpotlightViewController *spotlightMultiplexingViewController;
  _SBTodaySpotlightViewController *v14;
  void *v15;
  void *v16;
  SBSpotlightPresentableViewController *v17;
  UIViewController *p_super;
  UIViewController *v19;
  void *v20;
  void *v21;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "spotlightPresenterWillPresentSpotlight:", self);
  objc_msgSend(WeakRetained, "parentViewControllerForSpotlightPresenter:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  spotlightViewController = self->_spotlightViewController;
  if (spotlightViewController)
  {
    objc_msgSend(v6, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", spotlightViewController, 1, v4);
  }
  else
  {
    v9 = self->_containerView;
    objc_msgSend(WeakRetained, "todayViewControllerLocationForSpotlightPresenter:", self);
    v11 = (uint64_t)v10;
    v12 = objc_alloc_init(_SBTodaySpotlightViewController);
    spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
    self->_spotlightMultiplexingViewController = v12;

    v14 = self->_spotlightMultiplexingViewController;
    -[SBTodayViewSpotlightPresenter legibilitySettings](self, "legibilitySettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController setLegibilitySettings:](v14, "setLegibilitySettings:", v15);

    -[_SBTodaySpotlightViewController setLocation:](self->_spotlightMultiplexingViewController, "setLocation:", v11);
    -[_SBTodaySpotlightViewController view](self->_spotlightMultiplexingViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](v9, "bounds");
    objc_msgSend(v16, "setFrame:");

    if (MEMORY[0x1D17E3C78]())
      v17 = -[SBSpotlightPresentableViewController initWithSpotlightMultiplexingViewController:]([SBSpotlightPresentableViewController alloc], "initWithSpotlightMultiplexingViewController:", self->_spotlightMultiplexingViewController);
    else
      v17 = -[SBLegacyTodayViewSpotlightPresentableViewController initWithSpotlightMultiplexingViewController:searchBarViewController:scrollView:]([SBLegacyTodayViewSpotlightPresentableViewController alloc], "initWithSpotlightMultiplexingViewController:searchBarViewController:scrollView:", self->_spotlightMultiplexingViewController, self->_searchBarViewController, self->_scrollView);
    p_super = &v17->super;
    -[SBSpotlightPresentableViewController setDelegate:](v17, "setDelegate:", self);
    v19 = self->_spotlightViewController;
    self->_spotlightViewController = p_super;

    -[UIViewController view](self->_spotlightViewController, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAutoresizingMask:", 18);
    -[UIView bounds](v9, "bounds");
    objc_msgSend(v20, "setFrame:");
    objc_msgSend(v7, "addChildViewController:", self->_spotlightViewController);
    objc_msgSend(v7, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_spotlightViewController, 1, 0);
    -[UIView addSubview:](v9, "addSubview:", v20);

  }
  -[UIViewController view](self->_spotlightViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bs_setHitTestingDisabled:", 0);

}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (self->_spotlightViewController)
  {
    v9 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parentViewControllerForSpotlightPresenter:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_spotlightViewController, 1);
    -[UIViewController didMoveToParentViewController:](self->_spotlightViewController, "didMoveToParentViewController:", v7);
    objc_msgSend(WeakRetained, "spotlightPresenterDidPresentSpotlight:", self);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_spotlightViewController != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBTodayViewSpotlightPresenter searchPresenterDidPresentSearch:].cold.1(a2, (uint64_t)self, (uint64_t)v8);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id WeakRetained;
  id v8;

  v4 = a4;
  -[UIViewController willMoveToParentViewController:](self->_spotlightViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_spotlightViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setHitTestingDisabled:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parentViewControllerForSpotlightPresenter:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_spotlightViewController, 0, v4);
}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  void *v4;
  void *v5;
  _SBTodaySpotlightViewController *spotlightMultiplexingViewController;
  UIViewController *spotlightViewController;
  id WeakRetained;

  -[UIViewController view](self->_spotlightViewController, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parentViewControllerForSpotlightPresenter:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_spotlightViewController, 0);
  -[UIViewController removeFromParentViewController](self->_spotlightViewController, "removeFromParentViewController");
  -[SBSpotlightMultiplexingViewController invalidate](self->_spotlightMultiplexingViewController, "invalidate");
  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  self->_spotlightMultiplexingViewController = 0;

  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = 0;

  objc_msgSend(WeakRetained, "spotlightPresenterDidDismissSpotlight:", self);
}

- (double)_topOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  double v10;

  -[UIViewController view](self->_spotlightViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  -[SBSearchPresenter interactivePresentationMetrics](self->_presenter, "interactivePresentationMetrics");
  v7 = v5 - v6;

  if (self->_searchBarViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "searchBarTopOffsetForSpotlightPresenter:", self);
    else
      v10 = 8.0;
    v7 = v7 + v10;

  }
  return v7;
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
  -[SBSearchPresenter presentSearchAnimated:](self->_presenter, "presentSearchAnimated:", a3);
}

- (void)dismissSpotlightAnimated:(BOOL)a3
{
  -[SBSearchPresenter dismissSearchAnimated:](self->_presenter, "dismissSearchAnimated:", a3);
}

- (void)searchBarDidFocus
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "spotlightPresenterSearchBarDidFocus:", self);

  -[SBTodayViewSpotlightPresenter presentSpotlightAnimated:](self, "presentSpotlightAnimated:", 1);
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  -[SBTodayViewSpotlightPresenter dismissSpotlightAnimated:](self, "dismissSpotlightAnimated:", 1);
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc(MEMORY[0x1E0DAA660]);
  -[UIView bounds](self->_containerView, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:style:", 3);
  objc_msgSend(v5, "prepareForTransitionToBlurred:", 1);
  return v5;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return -[_SBTodaySpotlightViewController location](self->_spotlightMultiplexingViewController, "location", a3) == 1;
}

- (void)legacyTodayViewSpotlightPresentableViewControllerShouldDismiss:(id)a3
{
  -[SBTodayViewSpotlightPresenter dismissSpotlightAnimated:](self, "dismissSpotlightAnimated:", 1);
}

- (id)backdropViewForLegacyTodayViewSpotlightPresentableViewController:(id)a3
{
  return -[SBTodayViewSpotlightPresenter _newSearchBackdropView](self, "_newSearchBackdropView", a3);
}

- (id)_newSearchBackdropView
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 14, 0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
  return v2;
}

- (void)_setUpFeatherBlur
{
  objc_class *v3;
  UIView *v4;
  SBFFeatherBlurView *v5;
  SBFFeatherBlurView *featherBlurView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *searchBarGradientMaskLayers;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_searchBarViewController)
  {
    v3 = (objc_class *)MEMORY[0x1E0DA9E00];
    v4 = self->_containerView;
    v5 = (SBFFeatherBlurView *)objc_msgSend([v3 alloc], "initWithRecipe:", 0);
    featherBlurView = self->_featherBlurView;
    self->_featherBlurView = v5;

    -[SBFFeatherBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_featherBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", self->_featherBlurView);
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[SBFFeatherBlurView bottomAnchor](self->_featherBlurView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v4, "safeAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[SBFFeatherBlurView topAnchor](self->_featherBlurView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v7;
    -[SBFFeatherBlurView leadingAnchor](self->_featherBlurView, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v10;
    -[SBFFeatherBlurView trailingAnchor](self->_featherBlurView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v14);

    objc_msgSend(MEMORY[0x1E0DA9E00], "configureGradientMaskForFeatherBlurRecipe:onContentView:", 0, self->_scrollView);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v15;

  }
}

- (void)_configureFeatherBlurMatchMoveAnimations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_featherBlurView)
  {
    v3 = (void *)-[NSArray mutableCopy](self->_searchBarGradientMaskLayers, "mutableCopy");
    if (!v3)
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[SBFFeatherBlurView layer](self->_featherBlurView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    -[UIView window](self->_containerView, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
          if (v5)
          {
            v12 = (void *)MEMORY[0x1E0DA9E00];
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "frame");
            objc_msgSend(v12, "matchMoveAnimationForFrame:relativeToView:", v5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addAnimation:forKey:", v13, CFSTR("SBTodayViewFeatherBlurMatchMoveAnimation"));

          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "removeAnimationForKey:", CFSTR("SBTodayViewFeatherBlurMatchMoveAnimation"), (_QWORD)v14);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateFeatherBlurMaskLayers
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
  if (self->_featherBlurView)
  {
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

    -[SBTodayViewSpotlightPresenter _configureFeatherBlurMatchMoveAnimations](self, "_configureFeatherBlurMatchMoveAnimations");
    -[SBFFeatherBlurView setHidden:](self->_featherBlurView, "setHidden:", v6 <= 0.0);
  }
}

- (void)_setUpStartingScrollOffset
{
  -[SBSearchPresenter interactivePresentationMetrics](self->_presenter, "interactivePresentationMetrics");
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  -[SBSearchPresenter setInteractivePresentationMetrics:](self->_presenter, "setInteractivePresentationMetrics:");
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (SPUISearchBarController)searchBarViewController
{
  return self->_searchBarViewController;
}

- (UIViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (SBSearchPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (_SBTodaySpotlightViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
}

- (void)setSpotlightMultiplexingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SBTodayViewSpotlightPresenterDelegate)delegate
{
  return (SBTodayViewSpotlightPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFFeatherBlurView)featherBlurView
{
  return self->_featherBlurView;
}

- (void)setFeatherBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_featherBlurView, a3);
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_featherBlurView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
}

- (void)searchPresenterDidPresentSearch:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBTodayViewSpotlightPresenter.m");
  v16 = 1024;
  v17 = 177;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
