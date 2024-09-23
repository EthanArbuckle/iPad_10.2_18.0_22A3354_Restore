@implementation SBHLibrarySearchController

- (BOOL)isActive
{
  return -[SBHLibrarySearchController searchState](self, "searchState") == 2;
}

- (int64_t)searchState
{
  return self->_searchState;
}

- (SBHLibrarySearchController)initWithSearchResultsController:(id)a3 contentViewController:(id)a4 usingPlatterAppearance:(BOOL)a5
{
  id v9;
  id v10;
  SBHLibrarySearchController *v11;
  SBHLibrarySearchController *v12;
  uint64_t v13;
  UIScrollView *scrollView;
  void *v15;
  uint64_t v16;
  SBHHomePullToSearchSettings *pullToSearchSettings;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHLibrarySearchController;
  v11 = -[SBHLibrarySearchController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_containingIconLocation, CFSTR("SBIconLocationAppLibrary"));
    objc_storeStrong((id *)&v12->_searchResultsController, a3);
    -[SBHIconLibraryTableViewController setLayoutDelegate:](v12->_searchResultsController, "setLayoutDelegate:", v12);
    objc_storeStrong((id *)&v12->_contentViewController, a4);
    objc_msgSend(v10, "contentScrollView");
    v13 = objc_claimAutoreleasedReturnValue();
    scrollView = v12->_scrollView;
    v12->_scrollView = (UIScrollView *)v13;

    -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider setLibrarySearchControllerScrollViewDelegate:](v12->_contentViewController, "setLibrarySearchControllerScrollViewDelegate:", v12);
    v12->_usesPlatterAppearance = a5;
    v12->_searchBarAppearance = 0;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "libraryPullToSearchSettings");
    v16 = objc_claimAutoreleasedReturnValue();
    pullToSearchSettings = v12->_pullToSearchSettings;
    v12->_pullToSearchSettings = (SBHHomePullToSearchSettings *)v16;

    -[PTSettings addKeyObserver:](v12->_pullToSearchSettings, "addKeyObserver:", v12);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_needsLowQualityBackgroundEffects = objc_msgSend(v18, "sbf_animatedBlurRadiusGraphicsQuality") < 41;

    }
    else
    {
      v12->_needsLowQualityBackgroundEffects = 0;
    }
    -[SBHLibrarySearchController _setupSearchAnimationSettings](v12, "_setupSearchAnimationSettings");
  }

  return v12;
}

- (id)contentScrollView
{
  _BOOL4 v3;
  int *v4;

  v3 = -[SBHLibrarySearchController isActive](self, "isActive");
  v4 = &OBJC_IVAR___SBHLibrarySearchController__contentViewController;
  if (v3)
    v4 = &OBJC_IVAR___SBHLibrarySearchController__searchResultsController;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "contentScrollView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
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
  UIView *v12;
  UIView *containerView;
  UIView *v14;
  UIView *contentContainerView;
  UIView *v16;
  UIView *searchResultsContainerView;
  int *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  UIView *searchResultsPlatterView;
  UIView *v26;
  SBHLibraryCategoryPodBackgroundView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SBHSearchBar *v40;
  SBHSearchBar *searchBar;
  void *v42;
  uint64_t v43;
  SBHSearchBar *v44;
  uint64_t v45;
  void *v46;
  SBHSearchTextField *v47;
  SBHSearchTextField *searchField;
  UIView *v49;
  UIView *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  SBHLibrarySearchSimplifiedBackgroundView *v59;
  void *v60;
  uint64_t v61;
  __CFString *v62;
  void *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  UIView *searchBackgroundView;
  SBHLibrarySearchSimplifiedBackgroundView *v68;
  void *v69;
  void *v70;
  NSArray *v71;
  NSArray *contentViewGradientMaskLayers;
  void *v73;
  void *v74;
  NSArray *v75;
  NSArray *searchResultsGradientMaskLayers;
  UIView *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  _QWORD v84[2];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v83.receiver = self;
  v83.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewDidLoad](&v83, sel_viewDidLoad);
  -[SBHLibrarySearchController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  containerView = self->_containerView;
  self->_containerView = v12;

  v78 = v3;
  objc_msgSend(v3, "addSubview:", self->_containerView);
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;

  -[UIView setAutoresizingMask:](self->_contentContainerView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_contentContainerView);
  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E10]), "initWithFrame:", v5, v7, v9, v11);
  searchResultsContainerView = self->_searchResultsContainerView;
  self->_searchResultsContainerView = v16;

  -[UIView setAutoresizingMask:](self->_searchResultsContainerView, "setAutoresizingMask:", 18);
  -[UIView _setIgnoreBackdropViewsWhenHiding:](self->_searchResultsContainerView, "_setIgnoreBackdropViewsWhenHiding:", 1);
  v18 = &OBJC_IVAR___SBFloatingDockViewController__suggestionsViewController;
  if (-[SBHLibrarySearchController usesPlatterAppearance](self, "usesPlatterAppearance"))
  {
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v24 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
    -[UIView setClipsToBounds:](v24, "setClipsToBounds:", 1);
    -[UIView setAlpha:](v24, "setAlpha:", 0.0);
    searchResultsPlatterView = self->_searchResultsPlatterView;
    self->_searchResultsPlatterView = v24;
    v26 = v24;

    -[UIView insertSubview:atIndex:](self->_searchResultsContainerView, "insertSubview:atIndex:", v26, 0);
    v27 = -[SBHVisualStylingView initWithFrame:]([SBHLibraryCategoryPodBackgroundView alloc], "initWithFrame:", v20, v21, v22, v23);
    -[SBHLibraryCategoryPodBackgroundView setAutoresizingMask:](v27, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_searchResultsPlatterView, "addSubview:", v27);
    -[SBHLibrarySearchController containingIconLocation](self, "containingIconLocation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibrarySearchController listLayoutProvider](self, "listLayoutProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutForIconLocation:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "appLibraryVisualConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "searchContinuousCornerRadius");
    v33 = v32;
    -[UIView _setContinuousCornerRadius:](self->_searchResultsPlatterView, "_setContinuousCornerRadius:");
    -[SBHIconLibraryTableViewController contentScrollView](self->_searchResultsController, "contentScrollView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setVerticalScrollIndicatorInsets:", v33, 0.0, v33, 0.0);

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_endEditingForSearchField);
    objc_msgSend(v35, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self->_searchResultsContainerView, "addGestureRecognizer:", v35);

    v18 = &OBJC_IVAR___SBFloatingDockViewController__suggestionsViewController;
  }
  -[SBHLibrarySearchController _calculateSearchBarFrame:](self, "_calculateSearchBarFrame:", 0);
  v40 = -[SBHSearchBar initWithFrame:]([SBHSearchBar alloc], "initWithFrame:", v36, v37, v38, v39);
  searchBar = self->_searchBar;
  self->_searchBar = v40;

  -[SBHSearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  if ((v43 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SBHSearchBar setBackgroundViewBottomInsetToTextField:](self->_searchBar, "setBackgroundViewBottomInsetToTextField:", 24.0);
  v44 = self->_searchBar;
  v45 = v18[64];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "focusGroupIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchBar setFocusGroupIdentifier:](v44, "setFocusGroupIdentifier:", v46);

  objc_msgSend(v3, "addSubview:", self->_searchBar);
  -[SBHLibrarySearchController _updateEffectiveSearchVisualConfiguration](self, "_updateEffectiveSearchVisualConfiguration");
  -[SBHSearchBar searchTextField](self->_searchBar, "searchTextField");
  v47 = (SBHSearchTextField *)objc_claimAutoreleasedReturnValue();
  searchField = self->_searchField;
  self->_searchField = v47;

  v49 = self->_searchResultsPlatterView;
  if (!v49)
    v49 = self->_searchResultsContainerView;
  v50 = v49;
  -[SBHLibrarySearchController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_contentViewController, self->_contentContainerView);
  v77 = v50;
  -[SBHLibrarySearchController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", *(Class *)((char *)&self->super.super.super.isa + v45), v50);
  -[SBHLibrarySearchController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bringSubviewToFront:", self->_searchBar);

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v52 = *(uint64_t *)((char *)&self->super.super.super.isa + v45);
  v84[0] = self->_contentViewController;
  v84[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v80 != v56)
          objc_enumerationMutation(v53);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "view");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bounds](self->_containerView, "bounds");
        objc_msgSend(v58, "setFrame:");

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v55);
  }

  if (self->_needsLowQualityBackgroundEffects)
  {
    v59 = -[SBHVisualStylingView initWithFrame:]([SBHLibrarySearchSimplifiedBackgroundView alloc], "initWithFrame:", v5, v7, v9, v11);
    -[SBHLibrarySearchSimplifiedBackgroundView setAutoresizingMask:](v59, "setAutoresizingMask:", 18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "userInterfaceIdiom");

    if ((v61 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v62 = CFSTR("homeScreenOverlayLibrarySearch-iPad");
    else
      v62 = CFSTR("homeScreenOverlayLibrarySearch");
    v63 = (void *)MEMORY[0x1E0D47498];
    v64 = v62;
    SBHBundle();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v64, v65, 0, 0, 0.0);
    v59 = (SBHLibrarySearchSimplifiedBackgroundView *)objc_claimAutoreleasedReturnValue();

    -[SBHLibrarySearchSimplifiedBackgroundView setGroupNameBase:](v59, "setGroupNameBase:", CFSTR("SBHLibrarySearchControllerBackdropView"));
    -[SBHLibrarySearchSimplifiedBackgroundView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:](v59, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", 1);
    SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibrarySearchSimplifiedBackgroundView setBackdropScaleAdjustment:](v59, "setBackdropScaleAdjustment:", v66);

  }
  -[SBHLibrarySearchSimplifiedBackgroundView bs_setHitTestingDisabled:](v59, "bs_setHitTestingDisabled:", 1);
  searchBackgroundView = self->_searchBackgroundView;
  self->_searchBackgroundView = &v59->super.super;
  v68 = v59;

  -[UIView insertSubview:atIndex:](self->_searchResultsContainerView, "insertSubview:atIndex:", v68, 0);
  v69 = (void *)MEMORY[0x1E0DA9E00];
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider view](self->_contentViewController, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "configureGradientMaskForFeatherBlurRecipe:onContentView:", 1, v70);
  v71 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contentViewGradientMaskLayers = self->_contentViewGradientMaskLayers;
  self->_contentViewGradientMaskLayers = v71;

  v73 = (void *)MEMORY[0x1E0DA9E00];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "configureGradientMaskForFeatherBlurRecipe:onContentView:", 3, v74);
  v75 = (NSArray *)objc_claimAutoreleasedReturnValue();
  searchResultsGradientMaskLayers = self->_searchResultsGradientMaskLayers;
  self->_searchResultsGradientMaskLayers = v75;

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[SBHLibrarySearchController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SBHLibrarySearchController searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPortraitOrientation:", v5 < v7);

  if (-[SBHLibrarySearchController _rotatingToInterfaceOrientation](self, "_rotatingToInterfaceOrientation"))
    v9 = 1;
  else
    v9 = 4;
  if (-[SBHLibrarySearchController _appearState](self, "_appearState"))
    v10 = v9;
  else
    v10 = 1;
  -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", v10, 0);
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  SBHLibrarySearchControllerContentViewControllerScrollViewProvider *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  CGFloat MaxY;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  UIEdgeInsets result;

  v6 = (SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)a3;
  v7 = MEMORY[0x1E0DC49E8];
  -[SBHLibrarySearchController _windowSafeAreaInsets](self, "_windowSafeAreaInsets");
  v9 = v8;
  if (self->_contentViewController == v6)
  {
    -[SBHLibrarySearchController _inactiveSearchConfiguration](self, "_inactiveSearchConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibrarySearchController _calculateSearchBarFrame:forExplicitVisualConfiguration:](self, "_calculateSearchBarFrame:forExplicitVisualConfiguration:", 0, v12);
    MaxY = CGRectGetMaxY(v20);

    goto LABEL_6;
  }
  if ((SBHLibrarySearchControllerContentViewControllerScrollViewProvider *)self->_searchResultsController != v6
    || (v10 = 0.0, MaxY = 0.0, !-[SBHLibrarySearchController usesPlatterAppearance](self, "usesPlatterAppearance")))
  {
    -[SBHLibrarySearchController _calculateSearchBarFrame:](self, "_calculateSearchBarFrame:", 0);
    MaxY = CGRectGetMaxY(v19);
LABEL_6:
    v10 = v9;
  }
  v13 = *(double *)(v7 + 8);
  v14 = *(double *)(v7 + 24);
  if (a4)
    *a4 = 1;

  v15 = MaxY;
  v16 = v13;
  v17 = v10;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView frame](self->_containerView, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider bs_beginAppearanceTransition:animated:](self->_contentViewController, "bs_beginAppearanceTransition:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider bs_endAppearanceTransition](self->_contentViewController, "bs_endAppearanceTransition");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider bs_beginAppearanceTransition:animated:](self->_contentViewController, "bs_beginAppearanceTransition:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[SBHLibrarySearchController isActive](self, "isActive"))
    -[SBHLibrarySearchController _dismissPresentation:](self, "_dismissPresentation:", 0);
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider bs_endAppearanceTransition](self->_contentViewController, "bs_endAppearanceTransition");
  -[SBHIconLibraryTableViewController contentScrollView](self->_searchResultsController, "contentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scrollToTopIfPossible:", 0);

  -[SBHLibrarySearchController resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:](self, "resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:", 0, 1, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SBHLibrarySearchController;
  v7 = a4;
  -[SBHLibrarySearchController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[UIView layer](self->_searchBackgroundView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", CFSTR("SBLibrarySearchMatchMoveAnimation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBLibrarySearchMatchMoveAnimation"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SBHLibrarySearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E8D8AEB8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v12);

}

uint64_t __81__SBHLibrarySearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SBLibrarySearchMatchMoveAnimation"));
}

- (id)keyCommands
{
  void *v3;
  const __CFString *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController keyCommands](&v11, sel_keyCommands);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHSearchBar showsCancelButton](self->_searchBar, "showsCancelButton"))
  {
    v4 = (const __CFString *)*MEMORY[0x1E0DC4DA0];
    v5 = sel_endEditingForSearchField;
    v6 = 0;
  }
  else
  {
    v5 = sel_beginEditingForSearchField;
    v4 = CFSTR("f");
    v6 = 0x100000;
  }
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v4, v6, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    objc_msgSend(v3, "arrayByAddingObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibrarySearchController;
  -[SBHLibrarySearchController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[SBHLibrarySearchController _updateContentOverlayInsetsFromParentForChildren](self, "_updateContentOverlayInsetsFromParentForChildren");
  -[SBHLibrarySearchController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (BOOL)isTransitionInProgress
{
  return -[SBHLibrarySearchController searchState](self, "searchState") == 1;
}

- (void)setActive:(BOOL)a3
{
  if (a3)
    -[UISearchTextField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
  else
    -[SBHLibrarySearchController _dismissPresentation:](self, "_dismissPresentation:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
}

- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3
{
  double y;
  double v4;
  double v5;
  double result;

  y = a3.y;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset", a3.x);
  v5 = -v4;
  result = -(y + v4);
  if (y >= v5)
    return 0.0;
  return result;
}

- (double)_searchPresentationProgressForOffset:(double)a3
{
  double v4;

  -[SBHHomePullToSearchSettings pullTransitionDistance](self->_pullToSearchSettings, "pullTransitionDistance");
  return a3 / v4 + 0.0;
}

- (void)_layoutSearchViewsWithMode:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  searchAnimationSettings = self->_searchAnimationSettings;
  v11 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke;
  v12[3] = &unk_1E8D84C50;
  v12[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke_2;
  v10[3] = &unk_1E8D86EC8;
  v9 = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, a3, v12, v10);

}

uint64_t __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSearchViews");
}

uint64_t __72__SBHLibrarySearchController__layoutSearchViewsWithMode_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_layoutSearchViews
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
  UIView *v12;
  void *v13;
  void *v14;
  UIScrollView *v15;
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
  int64_t searchState;
  double v30;
  double v31;
  double v32;
  UIView *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  SBHSearchBar *searchBar;
  SBHSearchBar *v53;
  void *v54;
  UIView *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _BOOL8 v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  NSArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  NSArray *v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t j;
  double v103;
  double v104;
  UIScrollView *v105;
  void *v106;
  double v107;
  UIView *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  -[SBHLibrarySearchController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = self->_containerView;
  -[UIView setFrame:](v12, "setFrame:", v5, v7, v9, v11);
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider view](self->_contentViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[SBHIconLibraryTableViewController view](self->_searchResultsController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_scrollView;
  v108 = v12;
  -[UIView bounds](v12, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  UIRectGetCenter();
  v25 = v24;
  v27 = v26;
  -[UIScrollView contentOffset](v15, "contentOffset");
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  searchState = self->_searchState;
  v105 = v15;
  v104 = v17;
  if (searchState == 2)
  {
    v32 = 1.0;
    v30 = 0.0;
  }
  else if (searchState == 1)
  {
    v30 = v28;
    -[SBHLibrarySearchController _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
    v32 = v31;
  }
  else
  {
    v30 = 0.0;
    v32 = 0.0;
  }
  v33 = self->_searchResultsPlatterView;
  v107 = v23;
  if (v33)
  {
    -[SBHLibrarySearchController _activeSearchConfiguration](self, "_activeSearchConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_searchState == 2)
    {
      -[SBHLibrarySearchController _calculateSearchBarFrame:forExplicitVisualConfiguration:](self, "_calculateSearchBarFrame:forExplicitVisualConfiguration:", 0, v34);
      v36 = v35;
    }
    else
    {
      -[SBHLibrarySearchController _inactiveSearchConfiguration](self, "_inactiveSearchConfiguration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibrarySearchController _calculateSearchBarFrame:forExplicitVisualConfiguration:](self, "_calculateSearchBarFrame:forExplicitVisualConfiguration:", 0, v37);
      v36 = v38;

    }
    -[SBHLibrarySearchController _bottomLayoutInsetForSearchResultsView](self, "_bottomLayoutInsetForSearchResultsView");
    v39 = v19 + v36;
    v41 = v23 - (v40 + v36);
    objc_msgSend(v34, "textFieldWidth");
    v43 = v42;
    if (v42 <= 0.0)
    {
      if (v23 <= v21)
        objc_msgSend(v34, "textFieldLandscapeLayoutInsets");
      else
        objc_msgSend(v34, "textFieldPortraitLayoutInsets");
      v43 = v21 - (v44 + v45);
    }
    objc_msgSend(v14, "frame");
    -[UIView setFrame:](v33, "setFrame:", (v21 - v43) * 0.5, v30 + v39, v43, v41);
    -[UIView bounds](v33, "bounds");
    objc_msgSend(v14, "setFrame:");

  }
  else
  {
    objc_msgSend(v14, "setCenter:", v25, v27 + v30);
  }
  -[SBHLibrarySearchController _calculateSearchBarFrame:](self, "_calculateSearchBarFrame:", 1);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[UIView bringSubviewToFront:](v12, "bringSubviewToFront:", self->_searchBar);
  searchBar = self->_searchBar;
  BSRectWithSize();
  -[SBHSearchBar setBounds:](searchBar, "setBounds:");
  v53 = self->_searchBar;
  v103 = v47;
  UIRectGetCenter();
  -[SBHSearchBar setCenter:](v53, "setCenter:");
  -[SBHLibrarySearchControllerContentViewControllerScrollViewProvider contentScrollView](self->_contentViewController, "contentScrollView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = self->_searchBackgroundView;
  -[UIView setFrame:](v55, "setFrame:", v104, v19, v21, v23);
  if (self->_needsLowQualityBackgroundEffects)
  {
    objc_msgSend(v54, "setAlpha:", 1.0 - ((v32 + -0.15) / 0.4 + 0.0));
    -[UIView setAlpha:](v55, "setAlpha:", v32);
  }
  else
  {
    -[UIView setWeighting:](v55, "setWeighting:", v32);
  }
  -[UIView setAlpha:](v33, "setAlpha:", (v32 + -0.3) / 0.7 + 0.0);
  objc_msgSend(v14, "setAlpha:", (v32 + -0.3) / 0.7 + 0.0);
  objc_msgSend(v54, "adjustedContentInset");
  v57 = v56;
  objc_msgSend(v54, "contentOffset");
  v59 = v57 + v58;
  v60 = v57 + v58 <= 0.0;
  -[SBHSearchBar backgroundView](self->_searchBar, "backgroundView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setHidden:", v60);

  objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 1);
  v63 = v62;
  v65 = v64;
  v68 = v51 - (v66 + v67);
  -[SBHSearchBar backgroundViewBottomInsetToTextField](self->_searchBar, "backgroundViewBottomInsetToTextField");
  v70 = v69;
  v106 = v14;
  if (v69 != *MEMORY[0x1E0DC55F0])
  {
    -[SBHLibrarySearchController _inactiveSearchConfiguration](self, "_inactiveSearchConfiguration");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if (v107 <= v21)
      objc_msgSend(v71, "textFieldLandscapeLayoutInsets", v107);
    else
      objc_msgSend(v71, "textFieldPortraitLayoutInsets", v107);
    v68 = v68 - (v73 - v70);

  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v74 = self->_contentViewGradientMaskLayers;
  v75 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v114 != v77)
          objc_enumerationMutation(v74);
        v79 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        objc_msgSend(v79, "setFrame:", v103 + v63, 0.0, v49 - (v63 + v65), v68);
        objc_msgSend(v79, "setHidden:", v59 <= 0.0);
      }
      v76 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
    }
    while (v76);
  }

  objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 3);
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  -[SBHIconLibraryTableViewController headerBlurView](self->_searchResultsController, "headerBlurView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "bounds");
  objc_msgSend(v88, "convertRect:toView:", v108);
  v90 = v89;
  v92 = v91;
  v94 = v93;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v95 = self->_searchResultsGradientMaskLayers;
  v96 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
  if (v96)
  {
    v97 = v96;
    v98 = v94 - (v81 + v85);
    v99 = v92 - (v83 + v87);
    v100 = v83 + v90;
    v101 = *(_QWORD *)v110;
    do
    {
      for (j = 0; j != v97; ++j)
      {
        if (*(_QWORD *)v110 != v101)
          objc_enumerationMutation(v95);
        objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * j), "setFrame:", v100, 0.0, v99, v98);
      }
      v97 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    }
    while (v97);
  }

  -[SBHLibrarySearchController _setUpFeatherMaskLayerMatchMoveAnimations](self, "_setUpFeatherMaskLayerMatchMoveAnimations");
}

- (void)_setUpFeatherMaskLayerMatchMoveAnimations
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_contentViewGradientMaskLayers, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_contentViewGradientMaskLayers);
  if (-[NSArray count](self->_searchResultsGradientMaskLayers, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_searchResultsGradientMaskLayers);
  -[UIView window](self->_containerView, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0DA9E00];
        objc_msgSend(v10, "frame", (_QWORD)v13);
        objc_msgSend(v11, "matchMoveAnimationForFrame:relativeToView:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAnimation:forKey:", v12, CFSTR("SBLibrarySearchMatchMoveAnimation"));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (CGRect)_calculateSearchBarFrame:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBHLibrarySearchController _calculateSearchBarFrame:forExplicitVisualConfiguration:](self, "_calculateSearchBarFrame:forExplicitVisualConfiguration:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_calculateSearchBarFrame:(BOOL)a3 forExplicitVisualConfiguration:(id)a4
{
  _BOOL4 v4;
  id v6;
  UIScrollView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SBHSearchBar *searchBar;
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
  CGRect result;

  v4 = a3;
  v6 = a4;
  v7 = self->_scrollView;
  -[SBHLibrarySearchController _windowSafeAreaInsets](self, "_windowSafeAreaInsets");
  v9 = v8;
  v10 = v8;
  -[UIScrollView contentOffset](v7, "contentOffset");
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (v4 && self->_searchState != 2)
    v10 = v9 + v11 / 3.0;
  -[UIView bounds](self->_containerView, "bounds");
  searchBar = self->_searchBar;
  if (v6)
    -[SBHSearchBar sizeThatFits:forVisualConfiguration:](searchBar, "sizeThatFits:forVisualConfiguration:", v6, v12, v13);
  else
    -[SBHSearchBar sizeThatFits:](searchBar, "sizeThatFits:", v12, v13);
  -[SBHLibrarySearchController needsToManageTopInset](self, "needsToManageTopInset");
  BSRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v16;
  v22 = v10 - v9;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_updateContentOverlayInsetsFromParentForChildren
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBHLibrarySearchController childViewControllers](self, "childViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateContentOverlayInsetsFromParentIfNecessary");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateEffectiveSearchVisualConfiguration
{
  unint64_t v3;
  uint64_t v4;
  SBHSearchVisualConfiguration *v5;
  SBHSearchVisualConfiguration *obj;

  v3 = -[SBHLibrarySearchController searchBarAppearance](self, "searchBarAppearance");
  if (v3 == 2)
  {
    -[SBHAppLibraryVisualConfiguration extendedSearchVisualConfiguration](self->_libraryVisualConfiguration, "extendedSearchVisualConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[SBHAppLibraryVisualConfiguration compactSearchVisualConfiguration](self->_libraryVisualConfiguration, "compactSearchVisualConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[SBHAppLibraryVisualConfiguration standardSearchVisualConfiguration](self->_libraryVisualConfiguration, "standardSearchVisualConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  obj = (SBHSearchVisualConfiguration *)v4;
  -[SBHSearchBar setInactiveSearchConfiguration:](self->_searchBar, "setInactiveSearchConfiguration:", v4);
  v5 = obj;
  if (self->_searchVisualConfiguration != obj)
  {
    objc_storeStrong((id *)&self->_searchVisualConfiguration, obj);
    -[SBHLibrarySearchController _updateContentOverlayInsetsFromParentForChildren](self, "_updateContentOverlayInsetsFromParentForChildren");
    v5 = obj;
  }

}

- (id)_inactiveSearchConfiguration
{
  return self->_searchVisualConfiguration;
}

- (id)_activeSearchConfiguration
{
  return -[SBHAppLibraryVisualConfiguration activeSearchVisualConfiguration](self->_libraryVisualConfiguration, "activeSearchVisualConfiguration");
}

- (BOOL)isSearchFieldEditing
{
  return -[SBHSearchTextField isEditing](self->_searchField, "isEditing");
}

- (void)setSearchBarAppearance:(unint64_t)a3
{
  if (self->_searchBarAppearance != a3)
  {
    self->_searchBarAppearance = a3;
    -[SBHLibrarySearchController _updateEffectiveSearchVisualConfiguration](self, "_updateEffectiveSearchVisualConfiguration");
  }
}

- (void)setListLayoutProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  SBHAppLibraryVisualConfiguration *v8;
  double v9;
  double v10;
  void *v11;
  SBHAppLibraryVisualConfiguration *libraryVisualConfiguration;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_listLayoutProvider, obj);
    -[SBHSearchBar setListLayoutProvider:](self->_searchBar, "setListLayoutProvider:", obj);
    -[SBHLibrarySearchController containingIconLocation](self, "containingIconLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "layoutForIconLocation:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLibraryVisualConfiguration");
    v8 = (SBHAppLibraryVisualConfiguration *)objc_claimAutoreleasedReturnValue();
    if (-[SBHLibrarySearchController usesPlatterAppearance](self, "usesPlatterAppearance"))
    {
      -[SBHAppLibraryVisualConfiguration searchContinuousCornerRadius](v8, "searchContinuousCornerRadius");
      v10 = v9;
      -[UIView _setContinuousCornerRadius:](self->_searchResultsPlatterView, "_setContinuousCornerRadius:");
      -[SBHIconLibraryTableViewController contentScrollView](self->_searchResultsController, "contentScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setVerticalScrollIndicatorInsets:", v10, 0.0, v10, 0.0);

    }
    libraryVisualConfiguration = self->_libraryVisualConfiguration;
    self->_libraryVisualConfiguration = v8;

    -[SBHLibrarySearchController _updateEffectiveSearchVisualConfiguration](self, "_updateEffectiveSearchVisualConfiguration");
    v5 = obj;
  }

}

- (void)setSearchResultsUpdater:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_searchResultsUpdater, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setSearchController:", self);

}

- (void)ppt_setDisablePullToSearch:(BOOL)a3
{
  if (self->_disablePullToSearch != a3)
  {
    self->_disablePullToSearch = a3;
    -[SBHLibrarySearchController _dismissPresentation:](self, "_dismissPresentation:", 0);
  }
}

- (void)endEditingForSearchField
{
  -[SBHLibrarySearchController _dismissPresentation:](self, "_dismissPresentation:", 1);
}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  -[SBHSearchBar setAlignsTextFieldOnPixelBoundaries:](self->_searchBar, "setAlignsTextFieldOnPixelBoundaries:", 0);
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  -[SBHSearchBar setAlignsTextFieldOnPixelBoundaries:](self->_searchBar, "setAlignsTextFieldOnPixelBoundaries:", 1);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  objc_msgSend(v4, "adjustedContentInset");

  -[SBHHomePullToSearchSettings pullGestureBeganFromTopLeeway](self->_pullToSearchSettings, "pullGestureBeganFromTopLeeway");
  self->_scrollViewBeganScrollingFromTop = BSFloatLessThanOrEqualToFloat();
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4;

  objc_msgSend(a3, "contentOffset");
  -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (!self->_disablePullToSearch
    && self->_scrollViewBeganScrollingFromTop
    && BSFloatGreaterThanFloat()
    && !self->_searchState)
  {
    self->_searchState = 1;
    -[SBHLibrarySearchController _willPresentSearchAnimated:](self, "_willPresentSearchAnimated:", 1);
  }
  if (self->_searchState == 1)
    v4 = 2;
  else
    v4 = 4;
  -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", v4, 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  char v19;
  _QWORD v20[5];
  char v21;

  v6 = a3;
  v7 = v6;
  if (!self->_disablePullToSearch)
  {
    self->_scrollViewBeganScrollingFromTop = 0;
    if (self->_searchState == 1 && !self->_disablePullToSearch)
    {
      v8 = *MEMORY[0x1E0DC5360];
      objc_msgSend(v6, "contentOffset");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v7, "panGestureRecognizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "velocityInView:", v7);
      v15 = v14;
      v17 = v16;

      -[SBHLibrarySearchController _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:", v10 - v8 * (v15 / 1000.0) / (1.0 - v8), v12 - v8 * (v17 / 1000.0) / (1.0 - v8));
      -[SBHLibrarySearchController _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
      -[SBHHomePullToSearchSettings pullTransitionActivationThreshold](self->_pullToSearchSettings, "pullTransitionActivationThreshold");
      v18 = BSFloatGreaterThanFloat();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
        -[UISearchTextField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
        -[SBHLibrarySearchController _didPresentSearch](self, "_didPresentSearch");
      }
      else
      {
        -[SBHLibrarySearchController _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:", 1);
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __89__SBHLibrarySearchController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2;
      v20[3] = &unk_1E8D87F20;
      v21 = v19;
      v20[4] = self;
      -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", 3, v20);
    }
  }

}

uint64_t __89__SBHLibrarySearchController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "searchState");
    if (!result)
      return objc_msgSend(*(id *)(v1 + 32), "_didDismissSearch");
  }
  return result;
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  BOOL v4;

  if ((-[SBHLibrarySearchController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared", a3) & 1) != 0
    || -[SBHLibrarySearchController forcedSearchTextFieldNoneditable](self, "forcedSearchTextFieldNoneditable"))
  {
    -[SBHLibrarySearchController setForcedSearchTextFieldNoneditable:](self, "setForcedSearchTextFieldNoneditable:", 0);
    return 0;
  }
  else
  {
    v4 = 1;
    if (self->_searchState != 1)
      -[SBHLibrarySearchController _performPresentation:](self, "_performPresentation:", 1);
  }
  return v4;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  if (!-[SBHLibrarySearchController isTransitionInProgress](self, "isTransitionInProgress", a3))
  {
    if (-[SBHLibrarySearchController isActive](self, "isActive"))
      -[SBHLibrarySearchController _dismissPresentation:](self, "_dismissPresentation:", 1);
  }
}

- (BOOL)searchBarShouldReturn:(id)a3
{
  SBHLibrarySearchController *v3;
  void *v4;

  v3 = self;
  -[SBHLibrarySearchController searchResultsUpdater](self, "searchResultsUpdater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "searchControllerShouldReturn:", v3);

  return (char)v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;

  -[SBHLibrarySearchController searchResultsUpdater](self, "searchResultsUpdater", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSearchResultsForSearchController:", self);

}

- (void)searchBarDidInvalidateIntrinsicContentSize:(id)a3
{
  SBHSearchBar *searchBar;
  SBHSearchBar *v5;

  -[SBHLibrarySearchController _calculateSearchBarFrame:](self, "_calculateSearchBarFrame:", 0);
  searchBar = self->_searchBar;
  BSRectWithSize();
  -[SBHSearchBar setBounds:](searchBar, "setBounds:");
  v5 = self->_searchBar;
  UIRectGetCenter();
  -[SBHSearchBar setCenter:](v5, "setCenter:");
}

- (UIEdgeInsets)safeAreaInsetsForSearchBar:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  if (-[SBHLibrarySearchController needsToManageTopInset](self, "needsToManageTopInset", a3))
  {
    -[SBHLibrarySearchController _windowSafeAreaInsets](self, "_windowSafeAreaInsets");
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    v4 = *MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_bottomLayoutInsetForSearchResultsView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SBHLibrarySearchController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[SBHLibrarySearchController _activeSearchConfiguration](self, "_activeSearchConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= v5)
    objc_msgSend(v8, "textFieldLandscapeLayoutInsets");
  else
    objc_msgSend(v8, "textFieldPortraitLayoutInsets");
  v11 = v10;
  v12 = 0.0;
  if (-[SBHLibrarySearchController usesPlatterAppearance](self, "usesPlatterAppearance"))
  {
    -[SBHLibrarySearchController _windowSafeAreaInsets](self, "_windowSafeAreaInsets");
    v12 = v11 + v13 + -10.0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  SBHIconLibraryTableViewController *searchResultsController;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  searchResultsController = self->_searchResultsController;
  v5 = a4;
  -[SBHIconLibraryTableViewController view](searchResultsController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "locationInView:", v6);
  v16 = v15;
  v18 = v17;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v20.x = v16;
  v20.y = v18;
  LOBYTE(v5) = !CGRectContainsPoint(v21, v20);

  return (char)v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_setupSearchAnimationSettings
{
  SBFFluidBehaviorSettings *v3;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  SBFFluidBehaviorSettings *v5;
  SBFFluidBehaviorSettings *v6;
  SBFFluidBehaviorSettings *v7;
  id v8;
  CAFrameRateRange v9;

  v3 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;

  -[SBHHomePullToSearchSettings pullTransitionAnimationSettings](self->_pullToSearchSettings, "pullTransitionAnimationSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self->_searchAnimationSettings;
  objc_msgSend(v8, "dampingRatio");
  -[SBFFluidBehaviorSettings setDampingRatio:](v5, "setDampingRatio:");
  v6 = self->_searchAnimationSettings;
  objc_msgSend(v8, "response");
  -[SBFFluidBehaviorSettings setResponse:](v6, "setResponse:");
  v7 = self->_searchAnimationSettings;
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v7, "setFrameRateRange:highFrameRateReason:", 1114128, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);

}

- (void)beginEditingForSearchField
{
  -[SBHLibrarySearchController setActive:](self, "setActive:", 1);
}

- (void)_performPresentation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  -[SBHLibrarySearchController _willPresentSearchAnimated:](self, "_willPresentSearchAnimated:");
  if (v3)
  {
    -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", 2, 0);
    v5 = 3;
  }
  else
  {
    v5 = 4;
  }
  -[SBHLibrarySearchController _didPresentSearch](self, "_didPresentSearch");
  -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", v5, 0);
}

- (void)_dismissPresentation:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3)
  {
    -[SBHLibrarySearchController searchField](self, "searchField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", 0);

    -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", 2, 0);
    -[SBHLibrarySearchController _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:", 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__SBHLibrarySearchController__dismissPresentation___block_invoke;
    v5[3] = &unk_1E8D84F68;
    v5[4] = self;
    -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", 3, v5);
  }
  else
  {
    -[SBHLibrarySearchController _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:");
    -[SBHLibrarySearchController _didDismissSearch](self, "_didDismissSearch");
    -[SBHLibrarySearchController _layoutSearchViewsWithMode:withCompletion:](self, "_layoutSearchViewsWithMode:withCompletion:", 4, 0);
  }
}

uint64_t __51__SBHLibrarySearchController__dismissPresentation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "searchState");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_didDismissSearch");
  return result;
}

- (void)_willPresentSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIView *searchResultsContainerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  -[UIView superview](self->_searchResultsContainerView, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBHLibrarySearchController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_searchResultsController, 1, v3);
    -[SBHIconLibraryTableViewController contentScrollView](self->_searchResultsController, "contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scrollToTopIfPossible:", 0);

  }
  else
  {
    searchResultsContainerView = self->_searchResultsContainerView;
    -[UIView bounds](self->_containerView, "bounds");
    -[UIView setFrame:](searchResultsContainerView, "setFrame:");
    -[SBHLibrarySearchController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_searchResultsController, 1, v3);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_searchResultsContainerView);
    -[UIView layoutIfNeeded](self->_searchResultsContainerView, "layoutIfNeeded");
  }
  v8 = (void *)MEMORY[0x1E0DA9D88];
  -[UIView window](self->_containerView, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchMoveAnimationForPinningToView:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAppliesX:", 1);
  -[UIView layer](self->_searchBackgroundView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v10, CFSTR("SBLibrarySearchMatchMoveAnimation"));

  -[SBHLibrarySearchController searchResultsUpdater](self, "searchResultsUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateSearchResultsForSearchController:", self);

  -[UIView bs_setHitTestingDisabled:](self->_searchResultsContainerView, "bs_setHitTestingDisabled:", 0);
  -[UIView setHidden:](self->_searchResultsContainerView, "setHidden:", 0);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_searchResultsGradientMaskLayers;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17++), "setHidden:", 0, (_QWORD)v20);
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:", CFSTR("SBHLibraryViewControllerWillPresentSearchPPTNotification"), self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "willPresentSearchController:", self);

}

- (void)_didPresentSearch
{
  void *v3;
  id WeakRetained;

  self->_searchState = 2;
  -[SBHLibrarySearchController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_searchResultsController, 1);
  -[SBHSearchTextField setAlignmentBehavior:animated:](self->_searchField, "setAlignmentBehavior:animated:", 1, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBHLibraryViewControllerDidPresentSearchPPTNotification"), self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didPresentSearchController:", self);

}

- (void)_willDismissSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  self->_searchState = 0;
  -[UIView bs_setHitTestingDisabled:](self->_searchResultsContainerView, "bs_setHitTestingDisabled:", 1);
  -[SBHSearchBar endEditing:](self->_searchBar, "endEditing:", 1);
  -[SBHSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 0, v3);
  -[SBHLibrarySearchController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_searchResultsController, 0, v3);
  -[SBHLibrarySearchController resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:](self, "resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:", v3, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBHLibraryViewControllerWillDismissSearchPPTNotification"), self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "willDismissSearchController:", self);

}

- (void)_didDismissSearch
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIView setHidden:](self->_searchResultsContainerView, "setHidden:", 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_searchResultsGradientMaskLayers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "setHidden:", 1, (_QWORD)v12);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[SBHIconLibraryTableViewController contentScrollView](self->_searchResultsController, "contentScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scrollToTopIfPossible:", 0);

  -[SBHLibrarySearchController resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:](self, "resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:", 0, 1, 0);
  -[SBHLibrarySearchController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_searchResultsController, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("SBHLibraryViewControllerDidDismissSearchPPTNotification"), self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didDismissSearchController:", self);
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self, (_QWORD)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_focusEnvironmentWillDisappear:", self);

}

- (void)resetSearchController:(BOOL)a3 clearSearchResults:(BOOL)a4 resetSearchBarTransformAndAlpha:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v9;
  SBHSearchBar *searchBar;
  __int128 v11;
  _OWORD v12[3];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[SBHSearchTextField setAlignmentBehavior:animated:](self->_searchField, "setAlignmentBehavior:animated:", 0, a3);
  -[UISearchTextField setText:](self->_searchField, "setText:", 0);
  if (v6)
  {
    -[SBHLibrarySearchController searchResultsUpdater](self, "searchResultsUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSearchResultsForSearchController:", self);

  }
  -[SBHSearchBar endEditing:](self->_searchBar, "endEditing:", 1);
  -[SBHSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 0, v7);
  if (v5)
  {
    searchBar = self->_searchBar;
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12[0] = *MEMORY[0x1E0C9BAA8];
    v12[1] = v11;
    v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[SBHSearchBar setTransform:](searchBar, "setTransform:", v12);
    -[SBHSearchBar setAlpha:](self->_searchBar, "setAlpha:", 1.0);
  }
}

- (UIEdgeInsets)_windowSafeAreaInsets
{
  void *v2;
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
  UIEdgeInsets result;

  -[SBHLibrarySearchController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)needsToManageTopInset
{
  void *v2;
  char v3;

  -[SBHLibrarySearchController containingIconLocation](self, "containingIconLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBIconLocationAppLibraryOverlay"));

  return v3;
}

- (SBHLibrarySearchControllerContentViewControllerScrollViewProvider)contentViewController
{
  return self->_contentViewController;
}

- (SBHIconLibraryTableViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (SBHSearchBar)searchBar
{
  return self->_searchBar;
}

- (unint64_t)searchBarAppearance
{
  return self->_searchBarAppearance;
}

- (BOOL)usesPlatterAppearance
{
  return self->_usesPlatterAppearance;
}

- (SBHSearchResultsUpdating)searchResultsUpdater
{
  return (SBHSearchResultsUpdating *)objc_loadWeakRetained((id *)&self->_searchResultsUpdater);
}

- (SBHLibrarySearchControllerDelegate)delegate
{
  return (SBHLibrarySearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)searchDimmingView
{
  return self->_searchDimmingView;
}

- (void)setSearchDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_searchDimmingView, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return (SBIconListLayoutProvider *)objc_loadWeakRetained((id *)&self->_listLayoutProvider);
}

- (BOOL)forcedSearchTextFieldNoneditable
{
  return self->_forcedSearchTextFieldNoneditable;
}

- (void)setForcedSearchTextFieldNoneditable:(BOOL)a3
{
  self->_forcedSearchTextFieldNoneditable = a3;
}

- (NSString)containingIconLocation
{
  return self->_containingIconLocation;
}

- (void)setContainingIconLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (SBHSearchTextField)searchField
{
  return self->_searchField;
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchAnimationSettings, a3);
}

- (BOOL)scrollViewBeganScrollingFromTop
{
  return self->_scrollViewBeganScrollingFromTop;
}

- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3
{
  self->_scrollViewBeganScrollingFromTop = a3;
}

- (NSArray)contentViewGradientMaskLayers
{
  return self->_contentViewGradientMaskLayers;
}

- (NSArray)searchResultsGradientMaskLayers
{
  return self->_searchResultsGradientMaskLayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_contentViewGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_containingIconLocation, 0);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_storeStrong((id *)&self->_searchDimmingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_searchResultsUpdater);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_libraryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_searchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_searchResultsPlatterView, 0);
  objc_storeStrong((id *)&self->_searchBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchResultsContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
