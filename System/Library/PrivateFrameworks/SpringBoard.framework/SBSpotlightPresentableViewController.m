@implementation SBSpotlightPresentableViewController

- (SBSpotlightPresentableViewController)initWithSpotlightMultiplexingViewController:(id)a3
{
  id v5;
  SBSpotlightPresentableViewController *v6;
  SBSpotlightPresentableViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  BSInvalidatable *stateCaptureHandle;
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSpotlightPresentableViewController;
  v6 = -[SBSpotlightPresentableViewController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spotlightMultiplexingViewController, a3);
    v7->_hasUnifiedKeyboardBackground = objc_msgSend(MEMORY[0x1E0DA9D10], "useUnifiedBackground");
    v7->_supportsSeparateSearchBarBackground = objc_msgSend(MEMORY[0x1E0DA9D10], "separateHeaderBlurLayeringEnabled");
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[SBSpotlightPresentableViewController succinctDescription](v7, "succinctDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("SpringBoard - Spotlight - %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v7);
    v11 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v15, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v12 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v7->_stateCaptureHandle;
    v7->_stateCaptureHandle = (BSInvalidatable *)v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v7;
}

id __84__SBSpotlightPresentableViewController_initWithSpotlightMultiplexingViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIViewFloatAnimatableProperty invalidate](self->_scaleProperty, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_backgroundBlurProperty, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_searchContentFadeProperty, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_searchAffordanceReferenceBackgroundFadeProperty, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_keyboardFadeProperty, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController dealloc](&v3, sel_dealloc);
}

- (void)invalidateBackgroundView
{
  double v3;
  double v4;
  SBSpotlightBackgroundWeighting *searchBackgroundView;

  -[SBSpotlightBackgroundWeighting spotlightBackgroundWeighting](self->_searchBackgroundView, "spotlightBackgroundWeighting");
  v4 = v3;
  -[SBSpotlightBackgroundWeighting removeFromSuperview](self->_searchBackgroundView, "removeFromSuperview");
  searchBackgroundView = self->_searchBackgroundView;
  self->_searchBackgroundView = 0;

  -[SBSpotlightPresentableViewController _setUpSearchBackground](self, "_setUpSearchBackground");
  -[SBSpotlightPresentableViewController _tearDownBackgroundBlurProperty](self, "_tearDownBackgroundBlurProperty");
  -[SBSpotlightPresentableViewController _createBackgroundBlurProperty](self, "_createBackgroundBlurProperty");
  -[UIViewFloatAnimatableProperty setValue:](self->_backgroundBlurProperty, "setValue:", v4);
  -[SBSpotlightBackgroundWeighting setSpotlightBackgroundWeighting:](self->_searchBackgroundView, "setSpotlightBackgroundWeighting:", v4);
}

- (void)invalidateSearchAffordanceView
{
  UIView *searchAffordanceContentContainerView;
  SBHSearchAffordance *searchAffordance;
  UIView *v5;
  UIView *searchAffordanceReferenceView;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double presentationProgress;
  double presentationOffset;
  int64_t presentationState;
  int64_t previousPresentationState;
  int64_t anticipatedPresentationState;
  int64_t searchAffordancePresentationState;
  CGSize searchBarSize;
  __int128 v18;
  CGSize v19;
  CGSize dockedSearchBarSize;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  CGSize v32;
  CGSize v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  -[UIView removeFromSuperview](self->_searchAffordanceContentContainerView, "removeFromSuperview");
  searchAffordanceContentContainerView = self->_searchAffordanceContentContainerView;
  self->_searchAffordanceContentContainerView = 0;

  -[SBHSearchAffordance removeFromSuperview](self->_searchAffordance, "removeFromSuperview");
  searchAffordance = self->_searchAffordance;
  self->_searchAffordance = 0;

  -[SBSpotlightPresentableViewController _setUpSearchAffordance](self, "_setUpSearchAffordance");
  if (self->_presentationState == 2)
  {
    -[SBHSearchAffordance searchAffordanceReferenceView](self->_searchAffordance, "searchAffordanceReferenceView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
    self->_searchAffordanceReferenceView = v5;

    -[SBHSearchAffordance searchAffordanceReferenceFrame](self->_searchAffordance, "searchAffordanceReferenceFrame");
    self->_searchAffordanceReferenceFrame.origin.x = v7;
    self->_searchAffordanceReferenceFrame.origin.y = v8;
    self->_searchAffordanceReferenceFrame.size.width = v9;
    self->_searchAffordanceReferenceFrame.size.height = v10;
    v43 = 0;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    presentationProgress = self->_presentationProgress;
    presentationOffset = self->_presentationOffset;
    presentationState = self->_presentationState;
    v37 = 0u;
    v38 = 0u;
    previousPresentationState = self->_previousPresentationState;
    v35 = 0u;
    v36 = 0u;
    anticipatedPresentationState = self->_anticipatedPresentationState;
    v33 = (CGSize)0;
    v34 = 0u;
    searchAffordancePresentationState = self->_searchAffordancePresentationState;
    v31 = 0u;
    v32 = (CGSize)0;
    searchBarSize = self->_hostedContentMetrics.searchBarSize;
    v18 = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
    v19 = searchBarSize;
    dockedSearchBarSize = self->_hostedContentMetrics.dockedSearchBarSize;
    *(double *)&v21 = self->_hostedContentMetrics.searchBarCornerRadius;
    -[SBSpotlightPresentableViewController _presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:](self, "_presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:", presentationState, previousPresentationState, anticipatedPresentationState, presentationState, searchAffordancePresentationState, &v18, presentationProgress, presentationOffset, 0.0);
    v28 = v41;
    v29 = v42;
    v30 = v43;
    v24 = v37;
    v25 = v38;
    v26 = v39;
    v27 = v40;
    dockedSearchBarSize = v33;
    v21 = v34;
    v22 = v35;
    v23 = v36;
    v18 = v31;
    v19 = v32;
    -[SBSpotlightPresentableViewController _layoutSearchAffordanceWithMetrics:](self, "_layoutSearchAffordanceWithMetrics:", &v18);
    v28 = v41;
    v29 = v42;
    v30 = v43;
    v24 = v37;
    v25 = v38;
    v26 = v39;
    v27 = v40;
    dockedSearchBarSize = v33;
    v21 = v34;
    v22 = v35;
    v23 = v36;
    v18 = v31;
    v19 = v32;
    -[SBSpotlightPresentableViewController _positionKeyboardAlignedElementsWithMetrics:](self, "_positionKeyboardAlignedElementsWithMetrics:", &v18);
  }
}

- (SBHSearchAffordance)searchAffordanceView
{
  return self->_searchAffordance;
}

- (UIView)scalingContentView
{
  return self->_scaleView;
}

- (void)setSpotlightScale:(double)a3 interactive:(BOOL)a4
{
  _BOOL4 v4;
  SBFFluidBehaviorSettings *scaleSettings;
  uint64_t v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[6];

  v4 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0)
    -[SBSpotlightPresentableViewController _setCornerRounded:](self, "_setCornerRounded:", 1);
  scaleSettings = self->_scaleSettings;
  if (v4)
    v8 = 5;
  else
    v8 = 3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke;
  v11[3] = &unk_1E8E9DE88;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke_2;
  v9[3] = &unk_1E8EA33D8;
  v10 = v4;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v8, v11, v9);
}

uint64_t __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setValue:", *(double *)(a1 + 40));
}

uint64_t __70__SBSpotlightPresentableViewController_setSpotlightScale_interactive___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_setCornerRounded:", 0);
  return result;
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBSpotlightPresentableViewController setView:](self, "setView:", v4);

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
  UIView *scaleView;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[SBSpotlightPresentableViewController _createScaleProperty](self, "_createScaleProperty");
  -[SBSpotlightPresentableViewController _createBackgroundBlurProperty](self, "_createBackgroundBlurProperty");
  -[SBSpotlightPresentableViewController _createSearchContentFadeProperty](self, "_createSearchContentFadeProperty");
  -[SBSpotlightPresentableViewController _createKeyboardFadeProperty](self, "_createKeyboardFadeProperty");
  -[SBSpotlightPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v4, v6, v8, v10);
  scaleView = self->_scaleView;
  self->_scaleView = v12;

  -[UIView setAutoresizingMask:](self->_scaleView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_scaleView);
  -[SBSpotlightPresentableViewController _setUpSearchBackground](self, "_setUpSearchBackground");
  -[SBSpotlightMultiplexingViewController setSpotlightDelegate:](self->_spotlightMultiplexingViewController, "setSpotlightDelegate:", self);
  -[SBSpotlightPresentableViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_spotlightMultiplexingViewController, self->_scaleView);
  -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  -[SBSpotlightPresentableViewController _setUpSearchAffordance](self, "_setUpSearchAffordance");
  -[SBSpotlightPresentableViewController _setUpHomeAffordance](self, "_setUpHomeAffordance");
  -[SBSpotlightPresentableViewController _setUpSearchAnimationSettings](self, "_setUpSearchAnimationSettings");

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v4;

  if (a3)
  {
    -[SBSpotlightPresentableViewController _setUpSearchBackgroundMatchMoveAnimation](self, "_setUpSearchBackgroundMatchMoveAnimation", a3, a4);
  }
  else
  {
    -[SBSpotlightBackgroundWeighting layer](self->_searchBackgroundView, "layer", 0, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAnimationForKey:", CFSTR("SBSearchBackgroundMatchMoveAnimation"));

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  SBSpotlightBackgroundWeighting *searchBackgroundView;
  void *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  searchBackgroundView = self->_searchBackgroundView;
  if (searchBackgroundView)
  {
    -[SBSpotlightBackgroundWeighting layer](searchBackgroundView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationForKey:", CFSTR("SBSearchBackgroundMatchMoveAnimation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("SBSearchBackgroundMatchMoveAnimation"));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v17[3] = &unk_1E8EAC0A0;
    v17[4] = self;
    *(double *)&v17[5] = width;
    *(double *)&v17[6] = height;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v14[3] = &unk_1E8EA1AD8;
    v15 = v9;
    v16 = v10;
    v11 = v10;
    v12 = v9;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, v14);

  }
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  BSRectWithSize();
  return objc_msgSend(v1, "setFrame:");
}

uint64_t __91__SBSpotlightPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SBSearchBackgroundMatchMoveAnimation"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBSpotlightPresentableViewController _updateHomeAffordanceInteractionEnablement](self, "_updateHomeAffordanceInteractionEnablement");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightPresentableViewController;
  -[SBSpotlightPresentableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBSpotlightPresentableViewController _updateHomeAffordanceInteractionEnablement](self, "_updateHomeAffordanceInteractionEnablement");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  -[SBSpotlightMultiplexingViewController invalidate](self->_spotlightMultiplexingViewController, "invalidate");
}

- (void)setSearchTransitionSettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[SBHHomePullToSearchSettings isEqual:](self->_searchTransitionSettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchTransitionSettings, a3);
    objc_msgSend(v5, "addKeyObserver:", self);
    if (-[SBSpotlightPresentableViewController isViewLoaded](self, "isViewLoaded"))
      -[SBSpotlightPresentableViewController _setUpSearchAnimationSettings](self, "_setUpSearchAnimationSettings");
  }

}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  int64_t presentationState;
  BOOL v11;

  presentationState = self->_presentationState;
  if (a6 != 1 || presentationState != 1)
  {
    self->_previousPresentationState = presentationState;
    if (presentationState != a6)
    {
      self->_presentationState = a6;
      if (!a6)
      {
        v11 = 0;
        goto LABEL_9;
      }
      if (!self->_previousPresentationState
        && -[SBSpotlightPresentableViewController _activeTransitionCount](self, "_activeTransitionCount") >= 2)
      {
        v11 = 1;
LABEL_9:
        self->_cancellingDismissAnimation = v11;
      }
    }
  }
  self->_presentationProgress = a3;
  self->_presentationOffset = a4;
  -[SBSpotlightPresentableViewController _updatePresentationProgress:withOffset:velocity:presentationState:previousPresentationState:](self, "_updatePresentationProgress:withOffset:velocity:presentationState:previousPresentationState:", self->_presentationState, self->_previousPresentationState, a3, a4, a5);
}

- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6 previousPresentationState:(int64_t)a7
{
  void *v13;
  SBSpotlightBackgroundWeighting *searchBackgroundView;
  int v15;
  uint64_t v16;
  _BOOL4 v17;
  int64_t v18;
  _BOOL4 v19;
  int64_t searchAffordancePresentationState;
  int64_t v21;
  int64_t anticipatedPresentationState;
  CGSize searchBarSize;
  int v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  BOOL v29;
  __int128 v30;
  __int128 v31;
  unint64_t outstandingAnimationCount;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  _QWORD v34[5];
  _QWORD v35[5];
  __int128 v36;
  CGSize v37;
  CGSize v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  CGSize v50;
  CGSize dockedSearchBarSize;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  CGSize v63;
  CGSize v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  -[SBSpotlightPresentableViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  searchBackgroundView = self->_searchBackgroundView;
  objc_msgSend(v13, "bounds");
  -[SBSpotlightBackgroundWeighting setFrame:](searchBackgroundView, "setFrame:");
  v15 = -[SBSpotlightMultiplexingViewController isSearchContentAvailable](self->_spotlightMultiplexingViewController, "isSearchContentAvailable");
  v16 = -[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count");
  self->_searchContentFadeInStartValue = 0.0;
  if (a6 == 2)
  {
    v17 = (v16 != 0) & ~v15;
    self->_waitingForSearchContentAvailabilityForFadeIn = v17;
    if (v17)
      v18 = 2 * (self->_searchBarPortalView != 0);
    else
      v18 = 2;
  }
  else
  {
    self->_waitingForSearchContentAvailabilityForFadeIn = 0;
    v18 = a6;
  }
  v19 = self->_outstandingAnimationCount != 0;
  searchAffordancePresentationState = self->_searchAffordancePresentationState;
  v21 = -[SBSpotlightPresentableViewController _searchAffordancePresentationStateWithOffset:presentationState:previousSearchAffordancePresentationState:](self, "_searchAffordancePresentationStateWithOffset:presentationState:previousSearchAffordancePresentationState:", a6, searchAffordancePresentationState, a4);
  v74 = 0;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = (CGSize)0;
  v65 = 0u;
  anticipatedPresentationState = self->_anticipatedPresentationState;
  v62 = 0u;
  v63 = (CGSize)0;
  searchBarSize = self->_hostedContentMetrics.searchBarSize;
  v49 = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
  v50 = searchBarSize;
  dockedSearchBarSize = self->_hostedContentMetrics.dockedSearchBarSize;
  *(double *)&v52 = self->_hostedContentMetrics.searchBarCornerRadius;
  -[SBSpotlightPresentableViewController _presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:](self, "_presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:", a6, a7, anticipatedPresentationState, v18, v21, &v49, a3, a4, a5);
  v24 = v18 == 1 && v19;
  if (v18 != 1 || v21 == searchAffordancePresentationState || v21 == 1)
  {
    v26 = v24 ^ 1;
    if (v21 != 2)
      v26 = 1;
    if ((v26 & 1) == 0)
    {
      -[UIView layer](self->_keyboardView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "presentationLayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v28, "position");
        v24 = BSFloatGreaterThanOrEqualToFloat() ^ 1;
      }
      else
      {
        v24 = 1;
      }

    }
    v25 = 4;
  }
  else
  {
    v24 = 1;
    v25 = 3;
  }
  v59 = v72;
  v60 = v73;
  v61 = v74;
  v55 = v68;
  v56 = v69;
  v57 = v70;
  v58 = v71;
  dockedSearchBarSize = v64;
  v52 = v65;
  v53 = v66;
  v54 = v67;
  v49 = v62;
  v50 = v63;
  -[SBSpotlightPresentableViewController _layoutSearchContentWithMetrics:](self, "_layoutSearchContentWithMetrics:", &v49);
  self->_searchAffordancePresentationState = v21;
  self->_keyboardFadeInStartValue = 0.0;
  if (self->_searchAffordancePresentationState == 2)
    v29 = !-[SBSpotlightMultiplexingViewController externalKeyboardViewContainsKeyboard](self->_spotlightMultiplexingViewController, "externalKeyboardViewContainsKeyboard");
  else
    v29 = 0;
  self->_waitingForKeyboardPresentationForFadeIn = v29;
  if (v24)
  {
    v45 = v71;
    v46 = v72;
    v47 = v73;
    v30 = v66;
    v41 = v67;
    v42 = v68;
    v43 = v69;
    v44 = v70;
    v31 = v62;
    v37 = v63;
    v38 = v64;
    outstandingAnimationCount = self->_outstandingAnimationCount;
    v39 = v65;
    self->_outstandingAnimationCount = outstandingAnimationCount + 1;
    searchAnimationSettings = self->_searchAnimationSettings;
    v35[0] = MEMORY[0x1E0C809B0];
    v40 = v30;
    v35[1] = 3221225472;
    v35[2] = __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke;
    v35[3] = &unk_1E8EBCD50;
    v35[4] = self;
    v48 = v74;
    v36 = v31;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke_2;
    v34[3] = &unk_1E8EA46E8;
    v34[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, v25, v35, v34);
  }
  else
  {
    v59 = v72;
    v60 = v73;
    v61 = v74;
    v55 = v68;
    v56 = v69;
    v57 = v70;
    v58 = v71;
    dockedSearchBarSize = v64;
    v52 = v65;
    v53 = v66;
    v54 = v67;
    v49 = v62;
    v50 = v63;
    -[SBSpotlightPresentableViewController _layoutSearchAffordanceWithMetrics:](self, "_layoutSearchAffordanceWithMetrics:", &v49);
    v59 = v72;
    v60 = v73;
    v61 = v74;
    v55 = v68;
    v56 = v69;
    v57 = v70;
    v58 = v71;
    dockedSearchBarSize = v64;
    v52 = v65;
    v53 = v66;
    v54 = v67;
    v49 = v62;
    v50 = v63;
    -[SBSpotlightPresentableViewController _positionKeyboardAlignedElementsWithMetrics:](self, "_positionKeyboardAlignedElementsWithMetrics:", &v49);
  }

}

uint64_t __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 184);
  v4 = *(_OWORD *)(a1 + 216);
  v27 = *(_OWORD *)(a1 + 200);
  v28 = v4;
  v29 = *(_QWORD *)(a1 + 232);
  v5 = *(_OWORD *)(a1 + 120);
  v6 = *(_OWORD *)(a1 + 152);
  v23 = *(_OWORD *)(a1 + 136);
  v24 = v6;
  v25 = *(_OWORD *)(a1 + 168);
  v26 = v3;
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 88);
  v19 = *(_OWORD *)(a1 + 72);
  v20 = v8;
  v21 = *(_OWORD *)(a1 + 104);
  v22 = v5;
  v17 = *(_OWORD *)(a1 + 40);
  v18 = v7;
  objc_msgSend(v2, "_layoutSearchAffordanceWithMetrics:", &v17);
  v9 = *(void **)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 184);
  v11 = *(_OWORD *)(a1 + 216);
  v27 = *(_OWORD *)(a1 + 200);
  v28 = v11;
  v29 = *(_QWORD *)(a1 + 232);
  v12 = *(_OWORD *)(a1 + 120);
  v13 = *(_OWORD *)(a1 + 152);
  v23 = *(_OWORD *)(a1 + 136);
  v24 = v13;
  v25 = *(_OWORD *)(a1 + 168);
  v26 = v10;
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_OWORD *)(a1 + 88);
  v19 = *(_OWORD *)(a1 + 72);
  v20 = v15;
  v21 = *(_OWORD *)(a1 + 104);
  v22 = v12;
  v17 = *(_OWORD *)(a1 + 40);
  v18 = v14;
  return objc_msgSend(v9, "_positionKeyboardAlignedElementsWithMetrics:", &v17);
}

uint64_t __132__SBSpotlightPresentableViewController__updatePresentationProgress_withOffset_velocity_presentationState_previousPresentationState___block_invoke_2(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 1200);
  return result;
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  -[SBSpotlightMultiplexingViewController setTargetDisplayConfiguration:](self->_spotlightMultiplexingViewController, "setTargetDisplayConfiguration:", a3);
}

- (void)_layoutWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGPoint keyboardCenter;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double keyboardVelocity;

  v5 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  v34 = v5;
  keyboardVelocity = a3->keyboardVelocity;
  v6 = *(_OWORD *)&a3->fullSearchBarSize.height;
  v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  v30 = v6;
  v7 = *(_OWORD *)&a3->keyboardAlpha;
  keyboardCenter = a3->keyboardCenter;
  v32 = v7;
  v8 = *(_OWORD *)&a3->searchAffordanceSize.height;
  v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  v26 = v8;
  v9 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  v28 = v9;
  v10 = *(_OWORD *)&a3->searchContentCenter.y;
  v23 = *(_OWORD *)&a3->backgroundWeighting;
  v24 = v10;
  -[SBSpotlightPresentableViewController _layoutSearchContentWithMetrics:](self, "_layoutSearchContentWithMetrics:", &v23);
  v11 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  v34 = v11;
  keyboardVelocity = a3->keyboardVelocity;
  v12 = *(_OWORD *)&a3->fullSearchBarSize.height;
  v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  v30 = v12;
  v13 = *(_OWORD *)&a3->keyboardAlpha;
  keyboardCenter = a3->keyboardCenter;
  v32 = v13;
  v14 = *(_OWORD *)&a3->searchAffordanceSize.height;
  v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  v26 = v14;
  v15 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  v28 = v15;
  v16 = *(_OWORD *)&a3->searchContentCenter.y;
  v23 = *(_OWORD *)&a3->backgroundWeighting;
  v24 = v16;
  -[SBSpotlightPresentableViewController _layoutSearchAffordanceWithMetrics:](self, "_layoutSearchAffordanceWithMetrics:", &v23);
  v17 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  v33 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  v34 = v17;
  keyboardVelocity = a3->keyboardVelocity;
  v18 = *(_OWORD *)&a3->fullSearchBarSize.height;
  v29 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  v30 = v18;
  v19 = *(_OWORD *)&a3->keyboardAlpha;
  keyboardCenter = a3->keyboardCenter;
  v32 = v19;
  v20 = *(_OWORD *)&a3->searchAffordanceSize.height;
  v25 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  v26 = v20;
  v21 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  v27 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  v28 = v21;
  v22 = *(_OWORD *)&a3->searchContentCenter.y;
  v23 = *(_OWORD *)&a3->backgroundWeighting;
  v24 = v22;
  -[SBSpotlightPresentableViewController _positionKeyboardAlignedElementsWithMetrics:](self, "_positionKeyboardAlignedElementsWithMetrics:", &v23);
}

- (void)_layoutSearchContentWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  void *v5;
  id v6;

  -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCenter:", a3->searchContentCenter.x, a3->searchContentCenter.y);
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, a3->searchContentVelocity);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setVelocity:forKey:", v5, CFSTR("position"));

  }
  -[UIViewFloatAnimatableProperty setValue:](self->_backgroundBlurProperty, "setValue:", a3->backgroundWeighting);
  -[UIViewFloatAnimatableProperty setValue:](self->_searchContentFadeProperty, "setValue:", a3->searchContentAlpha);

}

- (void)_layoutSearchAffordanceWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *searchAffordanceReferenceView;
  double v14;
  double v15;
  int v16;
  _UIPortalView *searchBarPortalView;
  _UIPortalView *searchBarBackgroundPortalView;
  _UIPortalView *v19;
  CGFloat v20;
  _UIPortalView *v21;
  CGAffineTransform *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  BSRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  -[UIViewFloatAnimatableProperty setValue:](self->_searchAffordanceReferenceBackgroundFadeProperty, "setValue:", a3->searchAffordanceBackgroundAlpha);
  -[UIView setBounds:](self->_searchAffordanceContentContainerView, "setBounds:", v6, v8, v10, v12);
  -[SBHSearchAffordance setSearchAffordanceContentAlignment:](self->_searchAffordance, "setSearchAffordanceContentAlignment:", a3->searchAffordanceContentAlignment);
  -[SBHSearchAffordance setAppliesSearchAffordanceCornerRadius:](self->_searchAffordance, "setAppliesSearchAffordanceCornerRadius:", 1);
  -[SBHSearchAffordance setSearchAffordanceCornerRadius:](self->_searchAffordance, "setSearchAffordanceCornerRadius:", a3->searchAffordanceCornerRadius);
  -[SBHSearchAffordance setBounds:](self->_searchAffordance, "setBounds:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_searchAffordanceReferenceBackgroundView, "setFrame:", v6, v8, v10, v12);
  -[UIView _setContinuousCornerRadius:](self->_searchAffordanceReferenceBackgroundView, "_setContinuousCornerRadius:", a3->searchAffordanceCornerRadius);
  -[SBHSearchAffordance layoutIfNeeded](self->_searchAffordance, "layoutIfNeeded");
  -[SBHSearchAffordance setAlpha:](self->_searchAffordance, "setAlpha:", a3->searchAffordanceAlpha);
  if (!searchAffordanceReferenceView || !self->_supportsSeparateSearchBarBackground)
    -[UIView setAlpha:](self->_searchAffordanceContentContainerView, "setAlpha:", a3->searchAffordanceAlpha);
  -[UIView setBounds:](self->_searchAffordanceBackgroundCapturingView, "setBounds:", v6, v8, v10, v12);
  -[UIView setBounds:](self->_searchBarPortalClippingContainerView, "setBounds:", v6, v8, v10, v12);
  -[UIView _setContinuousCornerRadius:](self->_searchBarPortalClippingContainerView, "_setContinuousCornerRadius:", a3->searchAffordanceCornerRadius);
  v14 = v10 / a3->fullSearchBarSize.width;
  v15 = v12 / a3->fullSearchBarSize.height;
  if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
  {
    v16 = 1120;
    searchBarPortalView = self->_searchBarPortalView;
    v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v25 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v28.c = v24;
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v28.tx = v23;
    -[_UIPortalView setTransform:](searchBarPortalView, "setTransform:", &v28);
    if (self->_supportsSeparateSearchBarBackground)
    {
      searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
      *(_OWORD *)&v28.a = v25;
      *(_OWORD *)&v28.c = v24;
      *(_OWORD *)&v28.tx = v23;
      -[_UIPortalView setTransform:](searchBarBackgroundPortalView, "setTransform:", &v28);
    }
  }
  else
  {
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, v14, v15);
    if (self->_supportsSeparateSearchBarBackground)
    {
      v19 = self->_searchBarBackgroundPortalView;
      v27 = v28;
      -[_UIPortalView setTransform:](v19, "setTransform:", &v27);
      memset(&v27.c, 0, 32);
      if (v14 <= v15)
        v20 = v14;
      else
        v20 = v15;
      *(_OWORD *)&v27.a = 0uLL;
      CGAffineTransformMakeScale(&v27, v20, v20);
      v16 = 1120;
      v21 = self->_searchBarPortalView;
      v26 = v27;
      v22 = &v26;
    }
    else
    {
      v16 = 1120;
      v21 = self->_searchBarPortalView;
      v27 = v28;
      v22 = &v27;
    }
    -[_UIPortalView setTransform:](v21, "setTransform:", v22);
  }
  UIRectGetCenter();
  if (self->_supportsSeparateSearchBarBackground)
    v16 = 1128;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v16), "setCenter:");
  if (searchAffordanceReferenceView)
    -[UIView setAlpha:](self->_searchBarPortalClippingContainerView, "setAlpha:", a3->searchBarAlpha);
}

- (void)_positionKeyboardAlignedElementsWithMetrics:(SBSpotlightPresentationMetrics *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGPoint keyboardCenter;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;

  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.backgroundWeighting = *(_OWORD *)&a3->backgroundWeighting;
  v5 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  v7 = *(_OWORD *)&a3->searchContentCenter.y;
  v6 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceSize.height = *(_OWORD *)&a3->searchAffordanceSize.height;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCenter.y = v5;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchContentCenter.y = v7;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceBackgroundAlpha = v6;
  keyboardCenter = a3->keyboardCenter;
  v10 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  v9 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.fullSearchBarSize.height = *(_OWORD *)&a3->fullSearchBarSize.height;
  self->_appliedKeyboardAlignedElementsMetrics.keyboardCenter = keyboardCenter;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceContentAlignment = v10;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCornerRadius = v9;
  v12 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  v11 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  v13 = *(_OWORD *)&a3->keyboardAlpha;
  self->_appliedKeyboardAlignedElementsMetrics.keyboardVelocity = a3->keyboardVelocity;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardProtectorCenter.y = v12;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.homeAffordanceCenter.y = v11;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardAlpha = v13;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, a3->keyboardVelocity);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__SBSpotlightPresentableViewController__positionKeyboardAlignedElementsWithMetrics___block_invoke;
  v17[3] = &unk_1E8EBCD78;
  v15 = v14;
  v18 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v17);
  -[SBHSearchAffordance setCenter:](self->_searchAffordance, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(_QWORD, SBHSearchAffordance *))v16)[2](v16, self->_searchAffordance);
  -[UIView setCenter:](self->_searchAffordanceContentContainerView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(_QWORD, UIView *))v16)[2](v16, self->_searchAffordanceContentContainerView);
  -[UIView setCenter:](self->_searchAffordanceBackgroundCapturingView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(_QWORD, UIView *))v16)[2](v16, self->_searchAffordanceBackgroundCapturingView);
  -[UIView setCenter:](self->_searchBarPortalClippingContainerView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
  ((void (**)(_QWORD, UIView *))v16)[2](v16, self->_searchBarPortalClippingContainerView);
  if (self->_supportsSeparateSearchBarBackground)
  {
    -[_UIPortalView setCenter:](self->_searchBarPortalView, "setCenter:", a3->searchAffordanceCenter.x, a3->searchAffordanceCenter.y);
    ((void (**)(_QWORD, _UIPortalView *))v16)[2](v16, self->_searchBarPortalView);
  }
  -[UIViewFloatAnimatableProperty setValue:](self->_keyboardFadeProperty, "setValue:", a3->keyboardAlpha);
  -[UIView setCenter:](self->_keyboardView, "setCenter:", a3->keyboardCenter.x, a3->keyboardCenter.y);
  ((void (**)(_QWORD, UIView *))v16)[2](v16, self->_keyboardView);
  -[_UIPortalView setCenter:](self->_keyboardProtectorPortalView, "setCenter:", a3->keyboardProtectorCenter.x, a3->keyboardProtectorCenter.y);
  ((void (**)(_QWORD, _UIPortalView *))v16)[2](v16, self->_keyboardProtectorPortalView);
  -[SBHomeGrabberView setCenter:](self->_homeAffordance, "setCenter:", a3->homeAffordanceCenter.x, a3->homeAffordanceCenter.y);
  ((void (**)(_QWORD, SBHomeGrabberView *))v16)[2](v16, self->_homeAffordance);

}

uint64_t __84__SBSpotlightPresentableViewController__positionKeyboardAlignedElementsWithMetrics___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(a2, "_setVelocity:forKey:", v2, CFSTR("position"));
  return result;
}

- (int64_t)_searchAffordancePresentationStateWithOffset:(double)a3 presentationState:(int64_t)a4 previousSearchAffordancePresentationState:(int64_t)a5
{
  uint64_t v8;
  _UIPortalView *searchBarPortalView;
  UIView *searchAffordanceReferenceView;
  int *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v15;
  int64_t v16;
  BOOL v17;
  char v18;
  int v19;
  int v20;

  v8 = -[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count");
  searchBarPortalView = self->_searchBarPortalView;
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  if (a4 == 2)
  {
    if (v8)
      v17 = searchBarPortalView == 0;
    else
      v17 = 0;
    if (v17)
      return searchAffordanceReferenceView != 0;
    else
      return 2;
  }
  else if (a4 == 1)
  {
    v11 = &OBJC_IVAR___SBSpotlightPresentableViewController__allowsKeyboardWhileInteractive;
    if (!searchAffordanceReferenceView)
      v11 = &OBJC_IVAR___SBSpotlightPresentableViewController__allowsKeyboardWhileInteractiveWithoutSearchAffordance;
    v12 = *v11;
    v13 = *((unsigned __int8 *)&self->super.super.super.isa + v12);
    if (*((_BYTE *)&self->super.super.super.isa + v12))
      v14 = searchBarPortalView == 0;
    else
      v14 = 1;
    if (v14)
    {
      v15 = 1;
      v16 = 1;
    }
    else
    {
      v18 = BSFloatLessThanOrEqualToFloat();
      if (a5 == 2 && (v18 & 1) != 0)
      {
        v15 = 0;
        v16 = 0;
      }
      else
      {
        v19 = BSFloatGreaterThanOrEqualToFloat();
        if (a5 == 2)
          v20 = 1;
        else
          v20 = v19;
        v15 = v20 ^ 1;
        v14 = v20 == 0;
        v16 = 1;
        if (!v14)
          v16 = 2;
      }
    }
    if (searchAffordanceReferenceView)
      v15 = 0;
    if (!v13)
      v15 = 1;
    if (v15)
      return 0;
    else
      return v16;
  }
  return a4;
}

- (SBSpotlightPresentationMetrics)_presentationMetricsWithProgress:(SEL)a3 offset:(double)a4 velocity:(double)a5 presentationState:(double)a6 previousPresentationState:(int64_t)a7 anticipatedPresentationState:(int64_t)a8 searchContentPresentationState:(int64_t)a9 searchAffordancePresentationState:(int64_t)a10 hostedContentMetrics:(int64_t)a11
{
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  UIView *searchAffordanceReferenceBackgroundView;
  double v29;
  double v30;
  double v31;
  double v32;
  UIView *searchAffordanceReferenceView;
  CGFloat width;
  CGFloat height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double keyboardProtectorHeight;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  double v53;
  char v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  BOOL v76;
  double injectedVelocityForNonInteractiveTransitions;
  double v78;
  char v79;
  double v80;
  void *v81;
  uint64_t v82;
  int *v83;
  double v84;
  SBSpotlightPresentationMetrics *result;
  double searchBarCornerRadius;
  double v89;
  void *v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  double v97;
  double v98;
  CGFloat v99[4];

  retstr->keyboardVelocity = 0.0;
  *(_OWORD *)&retstr->keyboardProtectorCenter.y = 0u;
  *(_OWORD *)&retstr->homeAffordanceCenter.y = 0u;
  retstr->keyboardCenter = 0u;
  *(_OWORD *)&retstr->keyboardAlpha = 0u;
  *(_OWORD *)&retstr->searchAffordanceCornerRadius = 0u;
  *(_OWORD *)&retstr->fullSearchBarSize.height = 0u;
  *(_OWORD *)&retstr->searchAffordanceCenter.y = 0u;
  *(_OWORD *)&retstr->searchAffordanceContentAlignment = 0u;
  *(_OWORD *)&retstr->searchAffordanceBackgroundAlpha = 0u;
  *(_OWORD *)&retstr->searchAffordanceSize.height = 0u;
  *(_OWORD *)&retstr->backgroundWeighting = 0u;
  *(_OWORD *)&retstr->searchContentCenter.y = 0u;
  -[SBSpotlightPresentableViewController view](self, "view", a7, a8, a9, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  UIRectGetCenter();
  v24 = v23;
  v26 = v25;
  -[SBSpotlightPresentableViewController topOffset](self, "topOffset");
  searchAffordanceReferenceBackgroundView = self->_searchAffordanceReferenceBackgroundView;
  v29 = 0.0;
  v30 = 1.0;
  if (searchAffordanceReferenceBackgroundView)
    v30 = 0.0;
  if (a7)
  {
    if (a7 == 2)
    {
      v30 = 1.0;
      v29 = 1.0;
      v31 = 1.0;
      v32 = v26;
    }
    else
    {
      v31 = 0.0;
      v32 = v26;
      if (a7 == 1)
      {
        v32 = v26 + v27 + a5;
        v30 = 1.0;
        v31 = fmin(fmax(a5 / self->_backgroundInteractiveBlurDistance + 0.0, 0.0), 1.0);
        v29 = fmin(fmax(a5 / self->_searchContentInteractiveFadeInDistance + 0.0, 0.0), 1.0);
        if (searchAffordanceReferenceBackgroundView)
          v30 = fmin(fmax(a5 / self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance + 0.0, 0.0), 1.0);
      }
    }
  }
  else
  {
    v32 = v26 + v27;
    v31 = 0.0;
  }
  v89 = a5;
  retstr->backgroundWeighting = v31;
  retstr->searchContentCenter.x = v24;
  retstr->searchContentCenter.y = v32;
  retstr->searchContentAlpha = v29;
  retstr->searchAffordanceBackgroundAlpha = v30;
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  width = a12->searchBarSize.width;
  height = a12->searchBarSize.height;
  v93 = height;
  v94 = width;
  v92 = v24;
  searchBarCornerRadius = a12->searchBarCornerRadius;
  UIRectGetCenter();
  v91 = v36;
  v38 = v37;
  if (searchAffordanceReferenceView)
  {
    *(CGSize *)v99 = self->_searchAffordanceReferenceFrame.size;
    v39 = v99[1];
  }
  else
  {
    v99[0] = width;
    v99[1] = height;
    v39 = height;
  }
  v40 = v39 * 0.5;
  v98 = v39 * 0.5;
  objc_msgSend(MEMORY[0x1E0DA9D10], "bottomPaddingToKeyboard");
  v42 = v41;
  v43 = -[SBSpotlightMultiplexingViewController externalKeyboardViewContainsKeyboard](self->_spotlightMultiplexingViewController, "externalKeyboardViewContainsKeyboard");
  keyboardProtectorHeight = a12->keyboardProtectorHeight;
  v45 = v26 + a12->keyboardHeight;
  v46 = v45 - v22;
  v47 = 1.0;
  if (a11)
  {
    if (a11 != 2)
    {
      v48 = 0.0;
      if (a11 == 1)
      {
        v49 = a12->keyboardProtectorHeight;
        v96 = 0x3FF0000000000000;
        v97 = 1.0;
        v95 = 0.0;
        -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](self, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", a7, &v97, &v96, &v95, v99, &v98, v99[0], v39, v89);
        v38 = v38 + v95;
        v50 = 1.0;
        if (!searchAffordanceReferenceView)
          v50 = fmin(fmax(a4 / self->_searchAffordanceTransientFadeInThreshold + 0.0, 0.0), 1.0);
        v46 = v45 - v22;
        v45 = v45 - v22 + v38 + v99[1] * 0.5;
        v51 = 1;
        keyboardProtectorHeight = v49;
      }
      else
      {
        v51 = 1;
        v50 = 1.0;
      }
      goto LABEL_57;
    }
    v51 = a9 == 0;
    if (a9)
    {
      v54 = !self->_cancellingDismissAnimation || v43;
      if ((v54 & 1) != 0)
        goto LABEL_27;
    }
    else if (v43)
    {
LABEL_27:
      v55 = v99[0];
      v56 = v22 - a12->keyboardHeight + v93 * -0.5 - v42;
      v99[0] = v94;
      v99[1] = v93;
      if (a7 == 1 && self->_keyboardFollowsSpotlightContent)
      {
        if (searchAffordanceReferenceView)
        {
          v97 = 0.0;
          v57 = v39;
          v58 = keyboardProtectorHeight;
          -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](self, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", 1, 0, 0, &v97, 0, 0, v55, v57, self->_interactiveKeyboardPresentationThreshold);
          v46 = v45 - v22;
          keyboardProtectorHeight = v58;
          v59 = v38 + v97 + self->_interactiveKeyboardPresentationOffset;
          v60 = v89 - self->_interactiveKeyboardPresentationThreshold;
          v38 = v59 + v60;
          v45 = v60 + v42 + v45 - v22 + v59 + v99[1] * 0.5;
          v98 = searchBarCornerRadius;
LABEL_43:
          v47 = 1.0;
          v50 = 0.0;
          if (self->_supportsSeparateSearchBarBackground && self->_scalesSearchAffordanceContentWhileFading)
          {
            v66 = v46;
            v67 = keyboardProtectorHeight;
            v68 = self->_searchAffordanceContentFadeRange.end - self->_searchBarContentFadeRange.start;
            if (BSFloatGreaterThanFloat())
            {
              v69 = v68 * 0.5 + self->_searchBarContentFadeRange.start;
              v70 = v99[1] / v93;
              if (v99[1] / v93 > v99[0] / v94)
                v70 = v99[0] / v94;
              v48 = 1.0;
              v71 = v93 * (v70 + v69 * (1.0 - v70)) / v99[1];
              v72 = v93 / v99[1];
              if (v93 / v99[1] > v94 / v99[0])
                v72 = v94 / v99[0];
              v47 = v71
                  * (1.0
                   / (v69 * (v72 + -1.0) + 1.0))
                  * ((self->_searchAffordanceContentFadeRange.end - self->_searchAffordanceContentFadeRange.start)
                   / v69);
            }
            else
            {
              v48 = 1.0;
            }
            keyboardProtectorHeight = v67;
            v46 = v66;
            v50 = 0.0;
            goto LABEL_57;
          }
LABEL_56:
          v48 = 1.0;
          goto LABEL_57;
        }
        v38 = v56 + v89;
        v45 = v26 + v89;
        v98 = searchBarCornerRadius;
LABEL_55:
        v50 = 0.0;
        goto LABEL_56;
      }
      v38 = v56;
      v45 = v26;
LABEL_42:
      v98 = searchBarCornerRadius;
      if (searchAffordanceReferenceView)
        goto LABEL_43;
      v47 = 1.0;
      goto LABEL_55;
    }
    v61 = a12->keyboardProtectorHeight;
    v62 = 0.0;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "safeAreaInsetsPortrait");
      v90 = v20;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bottomInset");
      v62 = v65;

      v20 = v90;
    }
    v38 = v22 - (v42 + v62) + a12->dockedSearchBarSize.height * -0.5;
    *(CGSize *)v99 = a12->dockedSearchBarSize;
    keyboardProtectorHeight = v61;
    v46 = v45 - v22;
    goto LABEL_42;
  }
  if (searchAffordanceReferenceView)
  {
    v48 = 0.0;
    v50 = 1.0;
    if (a7 == 1)
    {
      v97 = 0.0;
      v52 = v39;
      v53 = keyboardProtectorHeight;
      -[SBSpotlightPresentableViewController _getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:](self, "_getSearchAffordanceMetricsForDefaultSize:presentationState:presentationOffset:scaleX:scaleY:offset:size:cornerRadius:", 1, 0, 0, &v97, v99, &v98, v99[0], v52, v89, 1.0);
      v50 = 1.0;
      v46 = v45 - v22;
      keyboardProtectorHeight = v53;
      v38 = v38 + v97;
    }
  }
  else
  {
    v50 = 0.0;
    if (a8 == 2)
      v48 = 0.0;
    else
      v48 = 1.0;
    v99[0] = v94;
    v99[1] = v93;
    v98 = searchBarCornerRadius;
    v40 = v93 * 0.5;
    v38 = v22 + v93 * 0.5;
  }
  v45 = v42 + v46 + v38 + v40;
  v51 = 1;
LABEL_57:
  if (self->_hasUnifiedKeyboardBackground)
    v73 = v22 * 0.5 - keyboardProtectorHeight * 0.5 + v45;
  else
    v73 = v45 - (v46 + keyboardProtectorHeight * 0.5);
  v76 = a7 != 2 || a8 == 2 || !self->_allowsVelocityInjection;
  if (a8 != 1 && !v76)
  {
    if (!self->_injectsVelocityForNonInteractiveTransitions)
    {
      injectedVelocityForNonInteractiveTransitions = 0.0;
      v78 = 0.0;
      goto LABEL_88;
    }
    goto LABEL_83;
  }
  v79 = a8 != 1 || v76;
  if ((v79 & 1) == 0 && self->_injectsVelocityOnlyForShortSwipes)
  {
    v80 = v50;
    -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_velocityForKey:", CFSTR("position"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v82, "CGPointValue");

    LOBYTE(v82) = BSFloatGreaterThanOrEqualToFloat();
    v50 = v80;
    injectedVelocityForNonInteractiveTransitions = 0.0;
    v78 = 0.0;
    if ((v82 & 1) != 0)
      goto LABEL_88;
LABEL_82:
    injectedVelocityForNonInteractiveTransitions = self->_injectedPercentageOfGestureVelocity * a6;
    goto LABEL_84;
  }
  injectedVelocityForNonInteractiveTransitions = 0.0;
  v78 = 0.0;
  if (v76)
    goto LABEL_88;
  if (a8 == 1)
    goto LABEL_82;
LABEL_83:
  injectedVelocityForNonInteractiveTransitions = self->_injectedVelocityForNonInteractiveTransitions;
LABEL_84:
  v78 = 0.0;
  if (a11 == 2)
  {
    v83 = &OBJC_IVAR___SBSpotlightPresentableViewController__keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
    if (a8 == 1)
      v83 = &OBJC_IVAR___SBSpotlightPresentableViewController__keyboardInjectedVelocityPercentage;
    v78 = injectedVelocityForNonInteractiveTransitions * *(double *)((char *)&self->super.super.super.isa + *v83);
  }
LABEL_88:
  retstr->searchAffordanceSize = *(CGSize *)v99;
  retstr->searchAffordanceCenter.x = v91;
  retstr->searchAffordanceCenter.y = v38;
  retstr->searchAffordanceAlpha = v50;
  retstr->searchAffordanceContentAlignment = v51;
  v84 = v98;
  retstr->searchAffordanceContentScale = v47;
  retstr->searchAffordanceCornerRadius = v84;
  retstr->fullSearchBarSize.width = v94;
  retstr->fullSearchBarSize.height = v93;
  retstr->searchBarAlpha = v48;
  retstr->keyboardCenter.x = v92;
  retstr->keyboardCenter.y = v45;
  retstr->keyboardAlpha = v48;
  retstr->keyboardProtectorCenter.x = v92;
  retstr->keyboardProtectorCenter.y = v73;
  retstr->homeAffordanceCenter.x = v92;
  retstr->homeAffordanceCenter.y = v45;
  retstr->searchContentVelocity = injectedVelocityForNonInteractiveTransitions;
  retstr->keyboardVelocity = v78;

  return result;
}

- (void)_getSearchAffordanceMetricsForDefaultSize:(CGSize)a3 presentationState:(int64_t)a4 presentationOffset:(double)a5 scaleX:(double *)a6 scaleY:(double *)a7 offset:(double *)a8 size:(CGSize *)a9 cornerRadius:(double *)a10
{
  double height;
  CGFloat width;
  double searchAffordanceMaxScaleX;
  double v20;
  CGFloat v21;
  double searchAffordanceMaxScaleY;
  double v23;
  CGFloat v24;
  uint64_t v25;
  double searchAffordanceMaxOffset;
  void *v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  __int128 v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;

  height = a3.height;
  width = a3.width;
  searchAffordanceMaxScaleX = self->_searchAffordanceMaxScaleX;
  v38 = 0x3FF0000000000000;
  v40 = searchAffordanceMaxScaleX;
  v39 = 1;
  v41 = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  v21 = v20;
  if (a6)
    *a6 = v20;
  searchAffordanceMaxScaleY = self->_searchAffordanceMaxScaleY;
  v34 = 0x3FF0000000000000;
  v36 = searchAffordanceMaxScaleY;
  v35 = 1;
  v37 = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  v24 = v23;
  if (a7)
    *a7 = v23;
  v25 = 0;
  if (a4 != 2)
  {
    searchAffordanceMaxOffset = self->_searchAffordanceMaxOffset;
    v31 = 0u;
    v33 = 1;
    v32 = searchAffordanceMaxOffset;
    BYTE8(v31) = 1;
    BSUIConstrainValueToIntervalWithRubberBand();
  }
  if (a8)
    *(_QWORD *)a8 = v25;
  if (!BSFloatEqualToFloat() || (BSFloatEqualToFloat() & 1) == 0)
  {
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, v21, v24);
    -[SBSpotlightPresentableViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    UISizeRoundToViewScale();
    width = v28;
    height = v29;

  }
  if (a9)
  {
    a9->width = width;
    a9->height = height;
  }
  if (a10)
    *a10 = height * 0.5;
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  _BOOL4 v6;
  UIView *v9;
  UIView *searchAffordanceReferenceView;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int64_t presentationState;
  _BOOL8 v22;
  _UIPortalView *searchBarPortalView;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  SBSpotlightPresentableViewController *v35;
  id v36;
  id location;

  v6 = a4;
  self->_anticipatedPresentationState = a3;
  if (self->_presentationState != 2)
  {
    -[SBHSearchAffordance searchAffordanceReferenceView](self->_searchAffordance, "searchAffordanceReferenceView");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
    self->_searchAffordanceReferenceView = v9;

    -[SBHSearchAffordance searchAffordanceReferenceFrame](self->_searchAffordance, "searchAffordanceReferenceFrame");
    self->_searchAffordanceReferenceFrame.origin.x = v11;
    self->_searchAffordanceReferenceFrame.origin.y = v12;
    self->_searchAffordanceReferenceFrame.size.width = v13;
    self->_searchAffordanceReferenceFrame.size.height = v14;
  }
  if (a3)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 2)
      objc_msgSend(v15, "stringWithFormat:", CFSTR("AnimatedPresentation-%@"), v17);
    else
      objc_msgSend(v15, "stringWithFormat:", CFSTR("InteractivePresentation-%@"), v17);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("AnimatedDismissal-%@"), v17);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v6;
  else
    v20 = 0;
  presentationState = self->_presentationState;
  if (a3)
    v22 = 0;
  else
    v22 = v6;
  searchBarPortalView = self->_searchBarPortalView;
  v24 = presentationState == 2;
  v25 = presentationState == 2 && a3 == 0;
  v26 = v24 && v22;
  v27 = searchBarPortalView == 0;
  if (searchBarPortalView)
    v28 = 0;
  else
    v28 = v20;
  v29 = v25 || v28;
  v30 = v27 && v26;
  self->_dismissingFromFullyPresented = v30;
  if (v20)
  {
    -[SBSpotlightPresentableViewController _beginRequiringSearchBarPortalViewForReason:](self, "_beginRequiringSearchBarPortalViewForReason:", v19);
    -[SBSpotlightPresentableViewController _setHitTestingDisabledOnHostedContent:](self, "_setHitTestingDisabledOnHostedContent:", a3 == 0);
    *a5 = v29;
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
    v33[3] = &unk_1E8EA5EB0;
    objc_copyWeak(&v36, &location);
    v34 = v19;
    v35 = self;
    v31 = (void *)MEMORY[0x1D17E5550](v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SBSpotlightPresentableViewController _setHitTestingDisabledOnHostedContent:](self, "_setHitTestingDisabledOnHostedContent:", v22);
    v31 = 0;
    *a5 = v29;
  }

  return v31;
}

void __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _QWORD v14[5];
  id *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[3];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_endRequiringSearchBarPortalViewForReason:", *(_QWORD *)(a1 + 32));
    if (!v3[140])
    {
      objc_msgSend(v3, "_setHitTestingDisabledOnHostedContent:", 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 971) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 972) = 0;
    }
    if (v3[146] == (id)2 && !v3[138])
    {
      objc_msgSend(v3[133], "alpha");
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v4 = *(_QWORD *)(a1 + 40);
        v5 = *(_QWORD *)(v4 + 1184);
        v6 = *(_QWORD *)(v4 + 1176);
        v7 = *(_QWORD *)(v4 + 1168);
        v8 = *(double *)(v4 + 1160);
        v9 = *(double *)(v4 + 1152);
        v10 = *(_OWORD *)(v4 + 1576);
        v11 = *(_OWORD *)(v4 + 1592);
        v12 = *(_OWORD *)(v4 + 1608);
        v30 = *(_QWORD *)(v4 + 1624);
        v29[1] = v11;
        v29[2] = v12;
        v29[0] = v10;
        objc_msgSend(v3, "_presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:", v7, v6, v5, v7, v7, v29, v9, v8, 0.0);
        v13 = (void *)MEMORY[0x1E0CEABB0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_2;
        v14[3] = &unk_1E8EBCDA0;
        v14[4] = *(_QWORD *)(a1 + 40);
        v15 = v3;
        v26 = v41;
        v27 = v42;
        v28 = v43;
        v22 = v37;
        v23 = v38;
        v25 = v40;
        v24 = v39;
        v18 = v33;
        v19 = v34;
        v21 = v36;
        v20 = v35;
        v17 = v32;
        v16 = v31;
        objc_msgSend(v13, "performWithoutAnimation:", v14);

      }
    }
  }

}

void __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_3;
  v12[3] = &unk_1E8EBCD50;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v12[1] = 3221225472;
  v5 = v2;
  v6 = *(_OWORD *)(a1 + 176);
  v23 = *(_OWORD *)(a1 + 192);
  v7 = *(_OWORD *)(a1 + 224);
  v24 = *(_OWORD *)(a1 + 208);
  v25 = v7;
  v8 = *(_OWORD *)(a1 + 112);
  v19 = *(_OWORD *)(a1 + 128);
  v9 = *(_OWORD *)(a1 + 160);
  v20 = *(_OWORD *)(a1 + 144);
  v21 = v9;
  v22 = v6;
  v10 = *(_OWORD *)(a1 + 48);
  v15 = *(_OWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 96);
  v16 = *(_OWORD *)(a1 + 80);
  v17 = v11;
  v18 = v8;
  v13 = v5;
  v26 = *(_QWORD *)(a1 + 240);
  v14 = v10;
  objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v3, 2, v12, 0);

}

uint64_t __115__SBSpotlightPresentableViewController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  uint64_t v10;

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 184);
  v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  v10 = *(_QWORD *)(a1 + 232);
  v4 = *(_OWORD *)(a1 + 120);
  v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return objc_msgSend(v1, "_layoutWithMetrics:", v9);
}

- (void)spotlightMultiplexingViewController:(id)a3 searchContentAvailabilityDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  _UIPortalView *searchBarPortalView;
  int64_t presentationState;
  BOOL v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  double presentationProgress;
  double presentationOffset;
  int64_t previousPresentationState;
  CGSize searchBarSize;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  SBFFluidBehaviorSettings *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[3];
  double searchBarCornerRadius;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (self->_waitingForSearchContentAvailabilityForFadeIn)
    {
      self->_waitingForSearchContentAvailabilityForFadeIn = 0;
      -[UIViewFloatAnimatableProperty presentationValue](self->_searchContentFadeProperty, "presentationValue");
      self->_searchContentFadeInStartValue = v7;
    }
    if (self->_presentationState)
    {
      searchBarPortalView = self->_searchBarPortalView;
      if (searchBarPortalView)
      {
        if (!-[SBSpotlightPresentableViewController _setUpHostedContentMetrics](self, "_setUpHostedContentMetrics"))
          goto LABEL_19;
      }
      else
      {
        -[SBSpotlightPresentableViewController _configureHostedContent](self, "_configureHostedContent");
      }
      -[SBSpotlightPresentableViewController _beginRequiringSearchBarPortalViewForReason:](self, "_beginRequiringSearchBarPortalViewForReason:", CFSTR("SBWaitingForSearchBarPortalReason"));
      presentationState = self->_presentationState;
      if (searchBarPortalView)
        v10 = presentationState == 1;
      else
        v10 = 1;
      v11 = MEMORY[0x1E0C809B0];
      if (!v10)
        goto LABEL_18;
      v12 = self->_searchAffordanceReferenceView != 0;
      v52 = 0;
      v50 = 0u;
      v51 = 0u;
      v13 = presentationState == 1 ? 1 : 2;
      v48 = 0uLL;
      v49 = 0uLL;
      v46 = 0uLL;
      v47 = 0uLL;
      presentationProgress = self->_presentationProgress;
      v44 = 0uLL;
      v45 = 0uLL;
      presentationOffset = self->_presentationOffset;
      v42 = 0uLL;
      v43 = 0uLL;
      previousPresentationState = self->_previousPresentationState;
      v40 = 0uLL;
      v41 = 0uLL;
      searchBarSize = self->_hostedContentMetrics.searchBarSize;
      v38[0] = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
      v38[1] = searchBarSize;
      v38[2] = self->_hostedContentMetrics.dockedSearchBarSize;
      searchBarCornerRadius = self->_hostedContentMetrics.searchBarCornerRadius;
      -[SBSpotlightPresentableViewController _presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:](self, "_presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:", v13, previousPresentationState, v13, presentationState == 1, v12, v38, presentationProgress, presentationOffset, 0.0);
      v34 = v49;
      v35 = v50;
      v36 = v51;
      v30 = v45;
      v31 = v46;
      v32 = v47;
      v33 = v48;
      v26 = v41;
      v27 = v42;
      v28 = v43;
      searchAnimationSettings = self->_searchAnimationSettings;
      v24[0] = v11;
      v29 = v44;
      v24[1] = 3221225472;
      v24[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke;
      v24[3] = &unk_1E8EBCD50;
      v24[4] = self;
      v37 = v52;
      v25 = v40;
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_2;
      v22[3] = &unk_1E8EA33D8;
      v23 = presentationState == 1;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, 2, v24, v22);
      if (presentationState != 1)
      {
LABEL_18:
        v19 = self->_searchAnimationSettings;
        v20[4] = self;
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_3;
        v21[3] = &unk_1E8E9DED8;
        v21[4] = self;
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_4;
        v20[3] = &unk_1E8EA46E8;
        objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v19, 3, v21, v20);
      }
    }
  }
LABEL_19:

}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  uint64_t v10;

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 184);
  v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  v10 = *(_QWORD *)(a1 + 232);
  v4 = *(_OWORD *)(a1 + 120);
  v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return objc_msgSend(v1, "_layoutWithMetrics:", v9);
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_endRequiringSearchBarPortalViewForReason:", CFSTR("SBWaitingForSearchBarPortalReason"));
  return result;
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentationProgress:withOffset:velocity:presentationState:previousPresentationState:", 2, 0, *(double *)(*(_QWORD *)(a1 + 32) + 1152), *(double *)(*(_QWORD *)(a1 + 32) + 1160), 0.0);
}

uint64_t __111__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_searchContentAvailabilityDidChange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endRequiringSearchBarPortalViewForReason:", CFSTR("SBWaitingForSearchBarPortalReason"));
}

- (void)spotlightMultiplexingViewController:(id)a3 externalKeyboardViewContainsKeyboardDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v8;
  double presentationProgress;
  double presentationOffset;
  int64_t presentationState;
  int64_t previousPresentationState;
  int64_t anticipatedPresentationState;
  int64_t searchAffordancePresentationState;
  CGSize searchBarSize;
  int64_t v16;
  uint64_t v17;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  _QWORD v19[5];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _OWORD v34[3];
  double searchBarCornerRadius;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v4 = a4;
  v6 = a3;
  if (!self->_initializingKeyboardView && v4)
  {
    if (self->_waitingForKeyboardPresentationForFadeIn)
    {
      self->_waitingForKeyboardPresentationForFadeIn = 0;
      -[UIViewFloatAnimatableProperty presentationValue](self->_keyboardFadeProperty, "presentationValue");
      self->_keyboardFadeInStartValue = v8;
    }
    if (self->_presentationState)
    {
      -[SBSpotlightPresentableViewController _setUpHostedContentMetrics](self, "_setUpHostedContentMetrics");
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        v48 = 0;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        presentationProgress = self->_presentationProgress;
        presentationOffset = self->_presentationOffset;
        presentationState = self->_presentationState;
        previousPresentationState = self->_previousPresentationState;
        anticipatedPresentationState = self->_anticipatedPresentationState;
        searchAffordancePresentationState = self->_searchAffordancePresentationState;
        searchBarSize = self->_hostedContentMetrics.searchBarSize;
        v34[0] = *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight;
        v34[1] = searchBarSize;
        v34[2] = self->_hostedContentMetrics.dockedSearchBarSize;
        searchBarCornerRadius = self->_hostedContentMetrics.searchBarCornerRadius;
        -[SBSpotlightPresentableViewController _presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:](self, "_presentationMetricsWithProgress:offset:velocity:presentationState:previousPresentationState:anticipatedPresentationState:searchContentPresentationState:searchAffordancePresentationState:hostedContentMetrics:", presentationState, previousPresentationState, anticipatedPresentationState, presentationState, searchAffordancePresentationState, v34, presentationProgress, presentationOffset, 0.0);
        -[SBSpotlightPresentableViewController _beginRequiringSearchBarPortalViewForReason:](self, "_beginRequiringSearchBarPortalViewForReason:", CFSTR("SBKeyboardAdjustmentAnimationReason"));
        v30 = v45;
        v31 = v46;
        v32 = v47;
        v26 = v41;
        v27 = v42;
        v28 = v43;
        v29 = v44;
        v22 = v37;
        v23 = v38;
        v16 = self->_presentationState;
        v24 = v39;
        if (v16 == 1)
          v17 = 2;
        else
          v17 = 3;
        searchAnimationSettings = self->_searchAnimationSettings;
        v20[0] = MEMORY[0x1E0C809B0];
        v25 = v40;
        v20[1] = 3221225472;
        v20[2] = __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke;
        v20[3] = &unk_1E8EBCD50;
        v20[4] = self;
        v33 = v48;
        v21 = v36;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke_2;
        v19[3] = &unk_1E8EA46E8;
        v19[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, v17, v20, v19);
      }
    }
  }

}

uint64_t __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  uint64_t v10;

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 184);
  v3 = *(_OWORD *)(a1 + 216);
  v9[10] = *(_OWORD *)(a1 + 200);
  v9[11] = v3;
  v10 = *(_QWORD *)(a1 + 232);
  v4 = *(_OWORD *)(a1 + 120);
  v5 = *(_OWORD *)(a1 + 152);
  v9[6] = *(_OWORD *)(a1 + 136);
  v9[7] = v5;
  v9[8] = *(_OWORD *)(a1 + 168);
  v9[9] = v2;
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 88);
  v9[2] = *(_OWORD *)(a1 + 72);
  v9[3] = v7;
  v9[4] = *(_OWORD *)(a1 + 104);
  v9[5] = v4;
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v6;
  return objc_msgSend(v1, "_positionKeyboardAlignedElementsWithMetrics:", v9);
}

uint64_t __122__SBSpotlightPresentableViewController_spotlightMultiplexingViewController_externalKeyboardViewContainsKeyboardDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endRequiringSearchBarPortalViewForReason:", CFSTR("SBKeyboardAdjustmentAnimationReason"));
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (-[SBSpotlightPresentableViewController isViewLoaded](self, "isViewLoaded", a3, a4))
    -[SBSpotlightPresentableViewController _setUpSearchAnimationSettings](self, "_setUpSearchAnimationSettings");
}

- (NSString)description
{
  return (NSString *)-[SBSpotlightPresentableViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSpotlightPresentableViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSpotlightPresentableViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSpotlightPresentableViewController *v11;

  v4 = a3;
  -[SBSpotlightPresentableViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__SBSpotlightPresentableViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __78__SBSpotlightPresentableViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1168);
  if (v3 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EBCDE0[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("presentationState"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "_appearState");
  SBFStringForAppearState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("appearState"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("searchBarPortalRequirementReasons"), 1);

}

- (void)_createScaleProperty
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty **p_scaleProperty;
  UIViewFloatAnimatableProperty *scaleProperty;
  SBFFluidBehaviorSettings *v6;
  SBFFluidBehaviorSettings *scaleSettings;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  p_scaleProperty = &self->_scaleProperty;
  scaleProperty = self->_scaleProperty;
  self->_scaleProperty = v3;

  -[UIViewFloatAnimatableProperty setValue:](self->_scaleProperty, "setValue:", 1.0);
  v6 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0DA9E08]);
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v6;

  -[SBFFluidBehaviorSettings setBehaviorType:](self->_scaleSettings, "setBehaviorType:", 2);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_scaleSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_scaleSettings, "setResponse:", 0.5);
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = *p_scaleProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SBSpotlightPresentableViewController__createScaleProperty__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__SBSpotlightPresentableViewController__createScaleProperty__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForScalePropertyChanged");

}

- (void)_updateForScalePropertyChanged
{
  CGFloat v3;
  double v4;
  UIView *scaleView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v3 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    -[UIViewFloatAnimatableProperty presentationValue](self->_scaleProperty, "presentationValue");
    v3 = v4;
  }
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, v3, v3);
  scaleView = self->_scaleView;
  v6 = v7;
  -[UIView setTransform:](scaleView, "setTransform:", &v6);
}

- (void)_createSearchContentFadeProperty
{
  SBSpotlightPresentableViewController *v2;
  objc_class *v3;
  Class isa;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v2 = self;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1208);
  isa = v2->super.super.super.isa;
  v2->super.super.super.isa = v3;

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = v2->super.super.super.isa;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke_2;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 151);
    if (v3)
    {
      v7 = v2;
      objc_msgSend(v3, "value");
      v5 = fmin(fmax((v4 - *((double *)v7 + 181)) / (*((double *)v7 + 182) - *((double *)v7 + 181)) + 0.0, 0.0), 1.0);
      objc_msgSend(*((id *)v7 + 124), "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", v5);

      v2 = v7;
    }
  }

}

void __72__SBSpotlightPresentableViewController__createSearchContentFadeProperty__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  char *v2;
  void *v3;
  double v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  id *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char *v15;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 151);
    if (v3)
    {
      v15 = v2;
      objc_msgSend(v3, "value");
      objc_msgSend(*((id *)v15 + 151), "presentationValue");
      v5 = v4;
      v6 = (double *)(v15 + 1448);
      v7 = *((double *)v15 + 181);
      v8 = *((double *)v15 + 182);
      if (BSFloatIsOne())
      {
        v9 = (id *)v15;
        v10 = 0.0;
        if (!v15[973])
        {
          v11 = *((double *)v15 + 154);
          if (v11 < *v6)
            v11 = *v6;
          v10 = fmin(fmax((v5 - v11) / (*((double *)v15 + 182) - v11) + 0.0, 0.0), 1.0);
        }
      }
      else
      {
        v9 = (id *)v15;
        if (v15[972])
          v12 = (v5 - *((double *)v15 + 184)) / (*((double *)v15 + 183) - *((double *)v15 + 184));
        else
          v12 = (v5 - v7) / (v8 - v7);
        v10 = fmin(fmax(v12 + 0.0, 0.0), 1.0);
      }
      objc_msgSend(v9[124], "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setPresentationValue:forKey:", v14, CFSTR("opacity"));

      v2 = v15;
    }
  }

}

- (void)_createSearchAffordanceReferenceBackgroundFadeProperty
{
  SBSpotlightPresentableViewController *v2;
  objc_class *v3;
  Class isa;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v2 = self;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1216);
  isa = v2->super.super.super.isa;
  v2->super.super.super.isa = v3;

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = v2->super.super.super.isa;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke_2;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  double v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[152];
    if (v3)
    {
      v5 = v2;
      objc_msgSend(v3, "value");
      objc_msgSend(v5[135], "setAlpha:", fmin(fmax((v4 - *((double *)v5 + 186)) / (*((double *)v5 + 185) - *((double *)v5 + 186)) + 0.0, 0.0), 1.0));
      v2 = v5;
    }
  }

}

void __94__SBSpotlightPresentableViewController__createSearchAffordanceReferenceBackgroundFadeProperty__block_invoke_2(uint64_t a1)
{
  double *WeakRetained;
  double *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double *v7;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 152);
    if (v3)
    {
      v7 = v2;
      objc_msgSend(v3, "presentationValue");
      v5 = (void *)*((_QWORD *)v7 + 135);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(fmax((v4 - v7[186]) / (v7[185] - v7[186]) + 0.0, 0.0), 1.0));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setPresentationValue:forKey:", v6, CFSTR("opacity"));

      v2 = v7;
    }
  }

}

- (void)_tearDownSearchAffordanceReferenceBackgroundFadeProperty
{
  UIViewFloatAnimatableProperty *searchAffordanceReferenceBackgroundFadeProperty;
  UIViewFloatAnimatableProperty *v4;

  searchAffordanceReferenceBackgroundFadeProperty = self->_searchAffordanceReferenceBackgroundFadeProperty;
  if (searchAffordanceReferenceBackgroundFadeProperty)
  {
    if ((-[UIViewFloatAnimatableProperty isInvalidated](searchAffordanceReferenceBackgroundFadeProperty, "isInvalidated") & 1) == 0)-[UIViewFloatAnimatableProperty invalidate](self->_searchAffordanceReferenceBackgroundFadeProperty, "invalidate");
    v4 = self->_searchAffordanceReferenceBackgroundFadeProperty;
    self->_searchAffordanceReferenceBackgroundFadeProperty = 0;

  }
}

- (void)_createBackgroundBlurProperty
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty **p_backgroundBlurProperty;
  UIViewFloatAnimatableProperty *backgroundBlurProperty;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  p_backgroundBlurProperty = &self->_backgroundBlurProperty;
  backgroundBlurProperty = self->_backgroundBlurProperty;
  self->_backgroundBlurProperty = v3;

  v6 = (void *)MEMORY[0x1E0CEABB0];
  v11[0] = *p_backgroundBlurProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SBSpotlightPresentableViewController__createBackgroundBlurProperty__block_invoke;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__SBSpotlightPresentableViewController__createBackgroundBlurProperty__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  char *v2;
  void *v3;
  double v4;
  double *v5;
  double *v6;
  char *v7;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 153);
    if (v3)
    {
      v7 = v2;
      objc_msgSend(v3, "presentationValue");
      if (v7[972])
      {
        v5 = (double *)(v7 + 1432);
        v6 = (double *)(v7 + 1440);
      }
      else
      {
        v6 = (double *)(v7 + 1416);
        v5 = (double *)(v7 + 1424);
      }
      objc_msgSend(*((id *)v7 + 128), "setSpotlightBackgroundWeighting:", fmin(fmax((v4 - *v6) / (*v5 - *v6) + 0.0, 0.0), 1.0));
      v2 = v7;
    }
  }

}

- (void)_tearDownBackgroundBlurProperty
{
  UIViewFloatAnimatableProperty *backgroundBlurProperty;
  UIViewFloatAnimatableProperty *v4;

  backgroundBlurProperty = self->_backgroundBlurProperty;
  if (backgroundBlurProperty)
  {
    if ((-[UIViewFloatAnimatableProperty isInvalidated](backgroundBlurProperty, "isInvalidated") & 1) == 0)
      -[UIViewFloatAnimatableProperty invalidate](self->_backgroundBlurProperty, "invalidate");
    v4 = self->_backgroundBlurProperty;
    self->_backgroundBlurProperty = 0;

  }
}

- (void)_createKeyboardFadeProperty
{
  SBSpotlightPresentableViewController *v2;
  objc_class *v3;
  Class isa;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v2 = self;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (objc_class *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v2 = (SBSpotlightPresentableViewController *)((char *)v2 + 1240);
  isa = v2->super.super.super.isa;
  v2->super.super.super.isa = v3;

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = v2->super.super.super.isa;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke_2;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  __int128 v9;
  CGAffineTransform *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[155];
    if (v3)
    {
      v4 = *((_QWORD *)v2 + 137);
      objc_msgSend(v3, "value");
      v6 = v5;
      objc_msgSend(*((id *)v2 + 138), "setAlpha:");
      objc_msgSend(*((id *)v2 + 139), "setAlpha:", v6);
      if (v4)
      {
        if (*((_BYTE *)v2 + 970))
        {
          objc_msgSend(*((id *)v2 + 140), "setAlpha:", v6);
          objc_msgSend(*((id *)v2 + 133), "setAlpha:", 1.0 - v6);
          v7 = *((double *)v2 + 215);
          if (BSFloatIsOne())
          {
            v8 = (void *)*((_QWORD *)v2 + 133);
            v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
            *(_OWORD *)&v12.a = *MEMORY[0x1E0C9BAA8];
            *(_OWORD *)&v12.c = v9;
            *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
            v10 = &v12;
          }
          else
          {
            memset(&v12, 0, sizeof(v12));
            CGAffineTransformMakeScale(&v12, v7, v7);
            v8 = (void *)*((_QWORD *)v2 + 133);
            v11 = v12;
            v10 = &v11;
          }
          objc_msgSend(v8, "setTransform:", v10, *(_OWORD *)&v11.a, *(_OWORD *)&v11.c, *(_OWORD *)&v11.tx, *(_QWORD *)&v12.a, *(_QWORD *)&v12.b, *(_QWORD *)&v12.c, *(_QWORD *)&v12.d, *(_QWORD *)&v12.tx, *(_QWORD *)&v12.ty);
        }
      }
      else
      {
        if (*((_BYTE *)v2 + 970))
          objc_msgSend(*((id *)v2 + 140), "setAlpha:", v6);
        objc_msgSend(*((id *)v2 + 142), "setAlpha:", v6);
      }
    }
  }

}

void __67__SBSpotlightPresentableViewController__createKeyboardFadeProperty__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGAffineTransform v32;
  CATransform3D v33;
  CGAffineTransform v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[155];
    if (v3)
    {
      v4 = *((_QWORD *)v2 + 137);
      objc_msgSend(v3, "value");
      objc_msgSend(*((id *)v2 + 155), "presentationValue");
      v6 = v5;
      if (BSFloatIsOne())
      {
        v7 = 0.0;
        if (!*((_BYTE *)v2 + 974))
          v7 = fmin(fmax((v6 - *((double *)v2 + 156)) / (1.0 - *((double *)v2 + 156)) + 0.0, 0.0), 1.0);
      }
      else if (*((_BYTE *)v2 + 972))
      {
        v7 = fmin(fmax((v6 - *((double *)v2 + 184)) / (*((double *)v2 + 183) - *((double *)v2 + 184)) + 0.0, 0.0), 1.0);
      }
      else
      {
        v7 = v6;
      }
      v8 = (void *)*((_QWORD *)v2 + 138);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setPresentationValue:forKey:", v9, CFSTR("opacity"));

      v10 = (void *)*((_QWORD *)v2 + 139);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setPresentationValue:forKey:", v11, CFSTR("opacity"));

      if (!v4)
      {
        if (*((_BYTE *)v2 + 970))
        {
          v25 = (void *)*((_QWORD *)v2 + 140);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_setPresentationValue:forKey:", v26, CFSTR("opacity"));

        }
        v18 = (void *)*((_QWORD *)v2 + 142);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("opacity");
        goto LABEL_18;
      }
      if (*((_BYTE *)v2 + 970))
      {
        v12 = fmin(fmax((v6 - *((double *)v2 + 188)) / (*((double *)v2 + 187) - *((double *)v2 + 188)) + 0.0, 0.0), 1.0);
        v13 = (void *)*((_QWORD *)v2 + 140);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(fmax((v6 - *((double *)v2 + 189)) / (*((double *)v2 + 190) - *((double *)v2 + 189)) + 0.0, 0.0), 1.0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setPresentationValue:forKey:", v14, CFSTR("opacity"));

        v15 = (void *)*((_QWORD *)v2 + 133);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_setPresentationValue:forKey:", v16, CFSTR("opacity"));

        v17 = *((double *)v2 + 215);
        if (BSFloatIsOne())
        {
          v18 = (void *)*((_QWORD *)v2 + 133);
          v19 = (void *)MEMORY[0x1E0CB3B18];
          v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
          v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
          v37 = v20;
          v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
          v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
          v39 = v21;
          v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
          *(_OWORD *)&v34.a = *MEMORY[0x1E0CD2610];
          *(_OWORD *)&v34.c = v22;
          v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
          *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
          v35 = v23;
          v24 = &v34;
        }
        else
        {
          v29 = fmax((v17 + -1.0) * (v6 - *((double *)v2 + 187)) / (*((double *)v2 + 188) - *((double *)v2 + 187)) + 1.0, 0.0);
          memset(&v34, 0, sizeof(v34));
          v30 = fmin(v29, 1.0);
          CGAffineTransformMakeScale(&v34, v30, v30);
          v18 = (void *)*((_QWORD *)v2 + 133);
          v31 = (void *)MEMORY[0x1E0CB3B18];
          v32 = v34;
          CATransform3DMakeAffineTransform(&v33, &v32);
          v24 = &v33;
          v19 = v31;
        }
        objc_msgSend(v19, "valueWithCATransform3D:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("transform");
LABEL_18:
        objc_msgSend(v18, "_setPresentationValue:forKey:", v27, v28);

      }
    }
  }

}

- (void)_tearDownKeyboardFadeProperty
{
  UIViewFloatAnimatableProperty *keyboardFadeProperty;
  UIViewFloatAnimatableProperty *v4;

  keyboardFadeProperty = self->_keyboardFadeProperty;
  if (keyboardFadeProperty)
  {
    if ((-[UIViewFloatAnimatableProperty isInvalidated](keyboardFadeProperty, "isInvalidated") & 1) == 0)
      -[UIViewFloatAnimatableProperty invalidate](self->_keyboardFadeProperty, "invalidate");
    v4 = self->_keyboardFadeProperty;
    self->_keyboardFadeProperty = 0;

  }
}

- (void)_setCornerRounded:(BOOL)a3
{
  _BOOL8 v3;
  UIView *scaleView;
  void *v6;
  void *v7;

  v3 = a3;
  scaleView = self->_scaleView;
  if (a3)
  {
    -[SBSpotlightPresentableViewController _screen](self, "_screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayCornerRadius");
    -[UIView _setContinuousCornerRadius:](scaleView, "_setContinuousCornerRadius:");

  }
  else
  {
    -[UIView _setContinuousCornerRadius:](self->_scaleView, "_setContinuousCornerRadius:", 0.0);
  }
  -[UIView setClipsToBounds:](self->_scaleView, "setClipsToBounds:", v3);
}

- (void)_setUpSearchAnimationSettings
{
  SBFFluidBehaviorSettings *v3;
  SBFFluidBehaviorSettings *searchAnimationSettings;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  -[SBHHomePullToSearchSettings pullTransitionAnimationSettings](self->_searchTransitionSettings, "pullTransitionAnimationSettings");
  v3 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;

  -[SBHHomePullToSearchSettings pullTransitionActivationThreshold](self->_searchTransitionSettings, "pullTransitionActivationThreshold");
  self->_spotlightActivationThreshold = v5;
  -[SBHHomePullToSearchSettings backgroundBlurInteractiveTransitionDistance](self->_searchTransitionSettings, "backgroundBlurInteractiveTransitionDistance");
  self->_backgroundInteractiveBlurDistance = v6;
  -[SBHHomePullToSearchSettings backgroundBlurStartThreshold](self->_searchTransitionSettings, "backgroundBlurStartThreshold");
  v8 = v7;
  -[SBHHomePullToSearchSettings backgroundBlurEndThreshold](self->_searchTransitionSettings, "backgroundBlurEndThreshold");
  self->_backgroundBlurRange.start = v8;
  self->_backgroundBlurRange.end = v9;
  -[SBHHomePullToSearchSettings backgroundUnblurStartThreshold](self->_searchTransitionSettings, "backgroundUnblurStartThreshold");
  v11 = v10;
  -[SBHHomePullToSearchSettings backgroundUnblurEndThreshold](self->_searchTransitionSettings, "backgroundUnblurEndThreshold");
  self->_backgroundUnblurRange.start = v11;
  self->_backgroundUnblurRange.end = v12;
  -[SBHHomePullToSearchSettings searchContentFadeInteractiveTransitionDistance](self->_searchTransitionSettings, "searchContentFadeInteractiveTransitionDistance");
  self->_searchContentInteractiveFadeInDistance = v13;
  -[SBHHomePullToSearchSettings searchContentFadeInStartThreshold](self->_searchTransitionSettings, "searchContentFadeInStartThreshold");
  v15 = v14;
  -[SBHHomePullToSearchSettings searchContentFadeInEndThreshold](self->_searchTransitionSettings, "searchContentFadeInEndThreshold");
  self->_searchContentFadeInRange.start = v15;
  self->_searchContentFadeInRange.end = v16;
  -[SBHHomePullToSearchSettings searchContentFadeOutStartThreshold](self->_searchTransitionSettings, "searchContentFadeOutStartThreshold");
  v18 = v17;
  -[SBHHomePullToSearchSettings searchContentFadeOutEndThreshold](self->_searchTransitionSettings, "searchContentFadeOutEndThreshold");
  self->_searchContentFadeOutRange.start = v18;
  self->_searchContentFadeOutRange.end = v19;
  -[SBHHomePullToSearchSettings searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance](self->_searchTransitionSettings, "searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance");
  self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance = v20;
  -[SBHHomePullToSearchSettings searchAffordanceBackgroundMaterialFadeStartThreshold](self->_searchTransitionSettings, "searchAffordanceBackgroundMaterialFadeStartThreshold");
  v22 = v21;
  -[SBHHomePullToSearchSettings searchAffordanceBackgroundMaterialFadeEndThreshold](self->_searchTransitionSettings, "searchAffordanceBackgroundMaterialFadeEndThreshold");
  self->_searchAffordanceBackgroundMaterialFadeRange.start = v22;
  self->_searchAffordanceBackgroundMaterialFadeRange.end = v23;
  -[SBHHomePullToSearchSettings searchAffordanceContentFadeStartThreshold](self->_searchTransitionSettings, "searchAffordanceContentFadeStartThreshold");
  v25 = v24;
  -[SBHHomePullToSearchSettings searchAffordanceContentFadeEndThreshold](self->_searchTransitionSettings, "searchAffordanceContentFadeEndThreshold");
  self->_searchAffordanceContentFadeRange.start = v25;
  self->_searchAffordanceContentFadeRange.end = v26;
  -[SBHHomePullToSearchSettings searchBarContentFadeStartThreshold](self->_searchTransitionSettings, "searchBarContentFadeStartThreshold");
  v28 = v27;
  -[SBHHomePullToSearchSettings searchBarContentFadeEndThreshold](self->_searchTransitionSettings, "searchBarContentFadeEndThreshold");
  self->_searchBarContentFadeRange.start = v28;
  self->_searchBarContentFadeRange.end = v29;
  self->_scalesSearchAffordanceContentWhileFading = -[SBHHomePullToSearchSettings scalesSearchAffordanceContentWhileFading](self->_searchTransitionSettings, "scalesSearchAffordanceContentWhileFading");
  -[SBHHomePullToSearchSettings searchAffordanceTransformStartThreshold](self->_searchTransitionSettings, "searchAffordanceTransformStartThreshold");
  v31 = v30;
  -[SBHHomePullToSearchSettings searchAffordanceTransformEndThreshold](self->_searchTransitionSettings, "searchAffordanceTransformEndThreshold");
  self->_searchAffordanceScaleAndTranslateRange.start = v31;
  self->_searchAffordanceScaleAndTranslateRange.end = v32;
  -[SBHHomePullToSearchSettings searchAffordanceMaxScaleX](self->_searchTransitionSettings, "searchAffordanceMaxScaleX");
  self->_searchAffordanceMaxScaleX = v33;
  -[SBHHomePullToSearchSettings searchAffordanceMaxScaleY](self->_searchTransitionSettings, "searchAffordanceMaxScaleY");
  self->_searchAffordanceMaxScaleY = v34;
  -[SBHHomePullToSearchSettings searchAffordanceScaleRubberbandingRange](self->_searchTransitionSettings, "searchAffordanceScaleRubberbandingRange");
  self->_searchAffordanceScaleRubberbandingRange = v35;
  -[SBHHomePullToSearchSettings searchAffordanceMaxOffset](self->_searchTransitionSettings, "searchAffordanceMaxOffset");
  self->_searchAffordanceMaxOffset = v36;
  -[SBHHomePullToSearchSettings searchAffordanceOffsetRubberbandingRange](self->_searchTransitionSettings, "searchAffordanceOffsetRubberbandingRange");
  self->_searchAffordanceOffsetRubberbandingRange = v37;
  -[SBHHomePullToSearchSettings searchAffordanceTransientFadeInThreshold](self->_searchTransitionSettings, "searchAffordanceTransientFadeInThreshold");
  self->_searchAffordanceTransientFadeInThreshold = v38;
  -[SBHHomePullToSearchSettings pullTransitionDistance](self->_searchTransitionSettings, "pullTransitionDistance");
  self->_pullTransitionDistance = v39;
  self->_allowsKeyboardWhileInteractive = -[SBHHomePullToSearchSettings allowsKeyboardWhileInteractive](self->_searchTransitionSettings, "allowsKeyboardWhileInteractive");
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = -[SBHHomePullToSearchSettings allowsKeyboardWhileInteractiveWithoutSearchAffordance](self->_searchTransitionSettings, "allowsKeyboardWhileInteractiveWithoutSearchAffordance");
  -[SBHHomePullToSearchSettings interactiveKeyboardPresentationThreshold](self->_searchTransitionSettings, "interactiveKeyboardPresentationThreshold");
  self->_interactiveKeyboardPresentationThreshold = v40;
  -[SBHHomePullToSearchSettings interactiveKeyboardPresentationOffset](self->_searchTransitionSettings, "interactiveKeyboardPresentationOffset");
  self->_interactiveKeyboardPresentationOffset = v41;
  self->_keyboardFollowsSpotlightContent = -[SBHHomePullToSearchSettings keyboardFollowsSpotlightContent](self->_searchTransitionSettings, "keyboardFollowsSpotlightContent");
  self->_allowsVelocityInjection = -[SBHHomePullToSearchSettings allowsVelocityInjection](self->_searchTransitionSettings, "allowsVelocityInjection");
  self->_injectsVelocityOnlyForShortSwipes = -[SBHHomePullToSearchSettings injectsVelocityOnlyForShortSwipes](self->_searchTransitionSettings, "injectsVelocityOnlyForShortSwipes");
  -[SBHHomePullToSearchSettings shortSwipeMaximumPercentageOfExpectedVelocity](self->_searchTransitionSettings, "shortSwipeMaximumPercentageOfExpectedVelocity");
  self->_shortSwipeMaximumPercentageOfExpectedVelocity = v42;
  -[SBHHomePullToSearchSettings injectedPercentageOfGestureVelocity](self->_searchTransitionSettings, "injectedPercentageOfGestureVelocity");
  self->_injectedPercentageOfGestureVelocity = v43;
  -[SBHHomePullToSearchSettings keyboardInjectedVelocityPercentage](self->_searchTransitionSettings, "keyboardInjectedVelocityPercentage");
  self->_keyboardInjectedVelocityPercentage = v44;
  self->_injectsVelocityForNonInteractiveTransitions = -[SBHHomePullToSearchSettings injectsVelocityForNonInteractiveTransitions](self->_searchTransitionSettings, "injectsVelocityForNonInteractiveTransitions");
  -[SBHHomePullToSearchSettings injectedVelocityForNonInteractiveTransitions](self->_searchTransitionSettings, "injectedVelocityForNonInteractiveTransitions");
  self->_injectedVelocityForNonInteractiveTransitions = v45;
  -[SBHHomePullToSearchSettings keyboardInjectedVelocityPercentageForNonInteractiveTransitions](self->_searchTransitionSettings, "keyboardInjectedVelocityPercentageForNonInteractiveTransitions");
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = v46;
}

- (void)_setUpSearchBackground
{
  SBSpotlightBackgroundWeighting *v3;
  SBSpotlightBackgroundWeighting *searchBackgroundView;
  SBSpotlightBackgroundWeighting *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "backgroundViewForSpotlightPresentableViewController:", self);
    v3 = (SBSpotlightBackgroundWeighting *)objc_claimAutoreleasedReturnValue();
    searchBackgroundView = self->_searchBackgroundView;
    self->_searchBackgroundView = v3;

  }
  v5 = self->_searchBackgroundView;
  if (v5)
  {
    -[SBSpotlightBackgroundWeighting bs_setHitTestingDisabled:](v5, "bs_setHitTestingDisabled:", 1);
    -[SBSpotlightPresentableViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_searchBackgroundView);
    objc_msgSend(v6, "sendSubviewToBack:", self->_searchBackgroundView);

  }
}

- (void)_setUpSearchAffordance
{
  UIView *searchAffordanceReferenceBackgroundView;
  SBHSearchAffordance *v4;
  SBHSearchAffordance *searchAffordance;
  UIView *v6;
  UIView *searchAffordanceContentContainerView;
  void *v8;
  UIView *v9;
  UIView *v10;
  UIView *searchAffordanceBackgroundCapturingView;
  UIView *v12;
  UIView *v13;
  id WeakRetained;

  -[UIView removeFromSuperview](self->_searchAffordanceReferenceBackgroundView, "removeFromSuperview");
  searchAffordanceReferenceBackgroundView = self->_searchAffordanceReferenceBackgroundView;
  self->_searchAffordanceReferenceBackgroundView = 0;

  -[SBSpotlightPresentableViewController _tearDownSearchAffordanceReferenceBackgroundFadeProperty](self, "_tearDownSearchAffordanceReferenceBackgroundFadeProperty");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "searchAffordanceViewForSpotlightPresentableViewController:", self);
    v4 = (SBHSearchAffordance *)objc_claimAutoreleasedReturnValue();
    searchAffordance = self->_searchAffordance;
    self->_searchAffordance = v4;

  }
  if (self->_searchAffordance)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    searchAffordanceContentContainerView = self->_searchAffordanceContentContainerView;
    self->_searchAffordanceContentContainerView = v6;

    -[UIView bs_setHitTestingDisabled:](self->_searchAffordanceContentContainerView, "bs_setHitTestingDisabled:", 1);
    -[SBHSearchAffordance searchAffordanceContentView](self->_searchAffordance, "searchAffordanceContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");
    -[UIView addSubview:](self->_searchAffordanceContentContainerView, "addSubview:", v8);
    v9 = self->_scaleView;
    if (self->_supportsSeparateSearchBarBackground && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBHSearchAffordance makeSearchAffordanceBackgroundCapturingView](self->_searchAffordance, "makeSearchAffordanceBackgroundCapturingView");
      v10 = (UIView *)objc_claimAutoreleasedReturnValue();
      searchAffordanceBackgroundCapturingView = self->_searchAffordanceBackgroundCapturingView;
      self->_searchAffordanceBackgroundCapturingView = v10;

      -[UIView addSubview:](v9, "addSubview:", self->_searchAffordanceBackgroundCapturingView);
    }
    -[SBHSearchAffordance searchAffordanceReferenceBackgroundView](self->_searchAffordance, "searchAffordanceReferenceBackgroundView");
    v12 = (UIView *)objc_claimAutoreleasedReturnValue();
    v13 = self->_searchAffordanceReferenceBackgroundView;
    self->_searchAffordanceReferenceBackgroundView = v12;

    -[UIView addSubview:](v9, "addSubview:", self->_searchAffordance);
    if (self->_searchAffordanceReferenceBackgroundView)
      -[SBHSearchAffordance addSubview:](self->_searchAffordance, "addSubview:");
    -[UIView addSubview:](v9, "addSubview:", self->_searchAffordanceContentContainerView);
    -[SBSpotlightPresentableViewController _createSearchAffordanceReferenceBackgroundFadeProperty](self, "_createSearchAffordanceReferenceBackgroundFadeProperty");

  }
}

- (void)_setUpHomeAffordance
{
  UIView *v3;
  SBHomeGrabberView *v4;
  SBHomeGrabberView *v5;
  SBHomeGrabberView *homeAffordance;
  id WeakRetained;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(WeakRetained, "wantsHomeAffordanceForSpotlightPresentableViewController:", self))
      {
        v3 = self->_scaleView;
        v4 = [SBHomeGrabberView alloc];
        -[UIView bounds](v3, "bounds");
        v5 = -[SBHomeGrabberView initWithFrame:](v4, "initWithFrame:");
        homeAffordance = self->_homeAffordance;
        self->_homeAffordance = v5;

        -[SBHomeGrabberView setAutoresizingMask:](self->_homeAffordance, "setAutoresizingMask:", 18);
        -[SBHomeGrabberView setColorBias:](self->_homeAffordance, "setColorBias:", 2);
        -[SBHomeGrabberView setPointerClickDelegate:](self->_homeAffordance, "setPointerClickDelegate:", self);
        -[UIView addSubview:](v3, "addSubview:", self->_homeAffordance);

      }
    }

  }
}

- (void)_setUpSearchBackgroundMatchMoveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_searchBackgroundView)
  {
    v3 = (void *)MEMORY[0x1E0DA9D88];
    -[SBSpotlightPresentableViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchMoveAnimationForPinningToView:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBSpotlightBackgroundWeighting addAnimation:forKey:](self->_searchBackgroundView, "addAnimation:forKey:", v6, CFSTR("SBSearchBackgroundMatchMoveAnimation"));
  }
}

- (BOOL)_setUpHostedContentMetrics
{
  SBSpotlightMultiplexingViewController *spotlightMultiplexingViewController;
  double keyboardHeight;
  BOOL result;

  spotlightMultiplexingViewController = self->_spotlightMultiplexingViewController;
  if (spotlightMultiplexingViewController)
    -[SBSpotlightMultiplexingViewController spotlightHostedContentMetrics](spotlightMultiplexingViewController, "spotlightHostedContentMetrics");
  keyboardHeight = self->_hostedContentMetrics.keyboardHeight;
  result = keyboardHeight != 0.0;
  if (keyboardHeight != 0.0)
    self->_hostedContentMetrics.keyboardHeight = 0.0;
  if (self->_hostedContentMetrics.keyboardProtectorHeight != 0.0)
  {
    self->_hostedContentMetrics.keyboardProtectorHeight = 0.0;
    result = 1;
  }
  if (self->_hostedContentMetrics.searchBarSize.width != 0.0 || self->_hostedContentMetrics.searchBarSize.height != 0.0)
  {
    self->_hostedContentMetrics.searchBarSize = 0u;
    result = 1;
  }
  if (self->_hostedContentMetrics.dockedSearchBarSize.width != 0.0
    || self->_hostedContentMetrics.dockedSearchBarSize.height != 0.0)
  {
    self->_hostedContentMetrics.dockedSearchBarSize = 0u;
    result = 1;
  }
  if (self->_hostedContentMetrics.searchBarCornerRadius != 0.0)
  {
    self->_hostedContentMetrics.searchBarCornerRadius = 0.0;
    return 1;
  }
  return result;
}

- (void)_beginRequiringSearchBarPortalViewForReason:(id)a3
{
  id v5;
  NSMutableSet *searchBarPortalRequirementReasons;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightPresentableViewController.m"), 1361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
  if (!searchBarPortalRequirementReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_searchBarPortalRequirementReasons;
    self->_searchBarPortalRequirementReasons = v7;

    searchBarPortalRequirementReasons = self->_searchBarPortalRequirementReasons;
  }
  -[NSMutableSet addObject:](searchBarPortalRequirementReasons, "addObject:", v5);
  SBLogSpotlight();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSpotlightPresentableViewController succinctDescription](self, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count");
    *(_DWORD *)buf = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v5;
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ requiring search bar portal for reason: %{public}@ -- new count: %lu", buf, 0x20u);

  }
  -[SBSpotlightPresentableViewController _sharedRemoteSearchViewController](self, "_sharedRemoteSearchViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRevealProgress:", 1.0);

  -[SBSpotlightPresentableViewController _configureHostedContent](self, "_configureHostedContent");
}

- (void)_configureHostedContent
{
  UIView *v3;
  id *p_searchBarPortalView;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  char v12;
  char v13;
  unsigned int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _UIPortalView *v19;
  _UIPortalView *searchBarBackgroundPortalView;
  void *v21;
  void *v22;
  UIView *v23;
  UIView *searchBarPortalClippingContainerView;
  _UIPortalView **p_searchBarBackgroundPortalView;
  _UIPortalView *v26;
  UIView *v27;
  _UIPortalView *v28;
  _UIPortalView *keyboardProtectorPortalView;
  void *v30;
  void *v31;
  _UIPortalView *v32;
  void *v33;
  UIView *v34;
  UIView *keyboardView;
  UIView *v36;
  unsigned int v37;
  uint64_t v38;
  UIView *v39;
  UIView *v40;

  if (-[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count"))
  {
    -[SBSpotlightPresentableViewController _setUpHostedContentMetrics](self, "_setUpHostedContentMetrics");
    -[SBSpotlightMultiplexingViewController setDelegate:](self->_spotlightMultiplexingViewController, "setDelegate:", self);
    v3 = self->_scaleView;
    p_searchBarPortalView = (id *)&self->_searchBarPortalView;
    if (!self->_searchBarPortalView)
    {
      v39 = v3;
      -[SBSpotlightPresentableViewController _sharedRemoteSearchViewController](self, "_sharedRemoteSearchViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "searchHeaderLayerRenderID");
      v7 = objc_msgSend(v5, "searchHeaderContextID");
      v8 = objc_msgSend(v5, "searchHeaderBlurLayerRenderID");
      v9 = objc_msgSend(v5, "searchHeaderBlurContextID");
      v10 = v9;
      if (v8)
        v11 = (_DWORD)v9 == 0;
      else
        v11 = 1;
      v12 = v11;
      if (self->_supportsSeparateSearchBarBackground)
        v13 = v12;
      else
        v13 = 0;
      v38 = objc_msgSend(v5, "searchHeaderBackgroundLayerRenderID");
      v14 = objc_msgSend(v5, "searchHeaderBackgroundContextID");
      if (v6 && (_DWORD)v7 && v38 && v14 && (v13 & 1) == 0)
      {
        v37 = v14;
        v15 = objc_alloc_init(MEMORY[0x1E0CEAE58]);
        v16 = *p_searchBarPortalView;
        *p_searchBarPortalView = v15;

        objc_msgSend(*p_searchBarPortalView, "bs_setHitTestingDisabled:", 1);
        objc_msgSend(*p_searchBarPortalView, "setHidesSourceView:", 1);
        objc_msgSend(*p_searchBarPortalView, "portalLayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSourceLayerRenderId:", v6);

        objc_msgSend(*p_searchBarPortalView, "portalLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSourceContextId:", v7);

        if (self->_supportsSeparateSearchBarBackground)
        {
          v19 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E0CEAE58]);
          searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
          self->_searchBarBackgroundPortalView = v19;

          -[_UIPortalView bs_setHitTestingDisabled:](self->_searchBarBackgroundPortalView, "bs_setHitTestingDisabled:", 1);
          -[_UIPortalView setHidesSourceView:](self->_searchBarBackgroundPortalView, "setHidesSourceView:", 1);
          -[_UIPortalView portalLayer](self->_searchBarBackgroundPortalView, "portalLayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setSourceLayerRenderId:", v8);

          -[_UIPortalView portalLayer](self->_searchBarBackgroundPortalView, "portalLayer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSourceContextId:", v10);

        }
        v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
        searchBarPortalClippingContainerView = self->_searchBarPortalClippingContainerView;
        self->_searchBarPortalClippingContainerView = v23;

        -[UIView setClipsToBounds:](self->_searchBarPortalClippingContainerView, "setClipsToBounds:", 1);
        p_searchBarBackgroundPortalView = &self->_searchBarPortalView;
        if (self->_supportsSeparateSearchBarBackground)
          p_searchBarBackgroundPortalView = &self->_searchBarBackgroundPortalView;
        v26 = *p_searchBarBackgroundPortalView;
        -[UIView addSubview:](self->_searchBarPortalClippingContainerView, "addSubview:", v26);
        v27 = self->_searchBarPortalClippingContainerView;
        if (self->_searchAffordance)
          -[UIView insertSubview:belowSubview:](v39, "insertSubview:belowSubview:", v27);
        else
          -[UIView addSubview:](v39, "addSubview:", v27);
        if (self->_supportsSeparateSearchBarBackground)
          -[UIView addSubview:](v39, "addSubview:", *p_searchBarPortalView);
        v28 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E0CEAE58]);
        keyboardProtectorPortalView = self->_keyboardProtectorPortalView;
        self->_keyboardProtectorPortalView = v28;

        -[_UIPortalView bs_setHitTestingDisabled:](self->_keyboardProtectorPortalView, "bs_setHitTestingDisabled:", 1);
        -[_UIPortalView setHidesSourceView:](self->_keyboardProtectorPortalView, "setHidesSourceView:", 1);
        -[_UIPortalView portalLayer](self->_keyboardProtectorPortalView, "portalLayer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSourceLayerRenderId:", v38);

        -[_UIPortalView portalLayer](self->_keyboardProtectorPortalView, "portalLayer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSourceContextId:", v37);

        v32 = self->_keyboardProtectorPortalView;
        -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:aboveSubview:](v39, "insertSubview:aboveSubview:", v32, v33);

      }
      v3 = v39;
    }
    if (!self->_keyboardView)
    {
      v40 = v3;
      -[SBSpotlightPresentableViewController _tearDownKeyboardFadeProperty](self, "_tearDownKeyboardFadeProperty");
      -[SBSpotlightPresentableViewController _createKeyboardFadeProperty](self, "_createKeyboardFadeProperty");
      self->_initializingKeyboardView = 1;
      -[SBSpotlightMultiplexingViewController setWantsExternalKeyboardView:](self->_spotlightMultiplexingViewController, "setWantsExternalKeyboardView:", 1);
      -[SBSpotlightMultiplexingViewController externalKeyboardView](self->_spotlightMultiplexingViewController, "externalKeyboardView");
      v34 = (UIView *)objc_claimAutoreleasedReturnValue();
      keyboardView = self->_keyboardView;
      self->_keyboardView = v34;

      v36 = self->_keyboardView;
      if (self->_homeAffordance)
        -[UIView insertSubview:belowSubview:](v40, "insertSubview:belowSubview:", v36);
      else
        -[UIView addSubview:](v40, "addSubview:", v36);
      self->_initializingKeyboardView = 0;
      v3 = v40;
    }

  }
}

- (void)_endRequiringSearchBarPortalViewForReason:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  UIView *searchBarPortalClippingContainerView;
  _UIPortalView *searchBarPortalView;
  _UIPortalView *searchBarBackgroundPortalView;
  _UIPortalView *keyboardProtectorPortalView;
  UIView *keyboardView;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count");
  -[NSMutableSet removeObject:](self->_searchBarPortalRequirementReasons, "removeObject:", v4);
  v6 = -[NSMutableSet count](self->_searchBarPortalRequirementReasons, "count");
  SBLogSpotlight();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSpotlightPresentableViewController succinctDescription](self, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v4;
    v19 = 2048;
    v20 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ended requiring search bar portal for reason: %{public}@ -- new count: %lu", (uint8_t *)&v15, 0x20u);

  }
  if (v6)
    v9 = 1;
  else
    v9 = v5 == 0;
  if (!v9)
  {
    -[SBSpotlightMultiplexingViewController setDelegate:](self->_spotlightMultiplexingViewController, "setDelegate:", 0);
    -[UIView removeFromSuperview](self->_searchBarPortalClippingContainerView, "removeFromSuperview");
    searchBarPortalClippingContainerView = self->_searchBarPortalClippingContainerView;
    self->_searchBarPortalClippingContainerView = 0;

    if (self->_supportsSeparateSearchBarBackground)
      -[_UIPortalView removeFromSuperview](self->_searchBarPortalView, "removeFromSuperview");
    searchBarPortalView = self->_searchBarPortalView;
    self->_searchBarPortalView = 0;

    searchBarBackgroundPortalView = self->_searchBarBackgroundPortalView;
    self->_searchBarBackgroundPortalView = 0;

    -[_UIPortalView removeFromSuperview](self->_keyboardProtectorPortalView, "removeFromSuperview");
    keyboardProtectorPortalView = self->_keyboardProtectorPortalView;
    self->_keyboardProtectorPortalView = 0;

    -[UIView bs_setHitTestingDisabled:](self->_keyboardView, "bs_setHitTestingDisabled:", 0);
    -[SBSpotlightMultiplexingViewController setWantsExternalKeyboardView:](self->_spotlightMultiplexingViewController, "setWantsExternalKeyboardView:", 0);
    -[UIView removeFromSuperview](self->_keyboardView, "removeFromSuperview");
    keyboardView = self->_keyboardView;
    self->_keyboardView = 0;

  }
}

- (unint64_t)_activeTransitionCount
{
  void *v2;
  unint64_t v3;

  -[NSMutableSet bs_filter:](self->_searchBarPortalRequirementReasons, "bs_filter:", &__block_literal_global_344);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

uint64_t __62__SBSpotlightPresentableViewController__activeTransitionCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SBWaitingForSearchBarPortalReason")) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBKeyboardAdjustmentAnimationReason")) ^ 1;

  return v3;
}

- (void)_setHitTestingDisabledOnHostedContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[SBSpotlightMultiplexingViewController view](self->_spotlightMultiplexingViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setHitTestingDisabled:", v3);

  -[UIView bs_setHitTestingDisabled:](self->_keyboardView, "bs_setHitTestingDisabled:", v3);
  -[_UIPortalView bs_setHitTestingDisabled:](self->_keyboardProtectorPortalView, "bs_setHitTestingDisabled:", v3);
  -[UIView bs_setHitTestingDisabled:](self->_searchBarPortalClippingContainerView, "bs_setHitTestingDisabled:", v3);
  if (self->_supportsSeparateSearchBarBackground)
    -[_UIPortalView bs_setHitTestingDisabled:](self->_searchBarPortalView, "bs_setHitTestingDisabled:", v3);
}

- (id)_sharedRemoteSearchViewController
{
  return (id)objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
}

- (void)_updateHomeAffordanceInteractionEnablement
{
  SBHomeGrabberView *homeAffordance;

  homeAffordance = self->_homeAffordance;
  if (homeAffordance)
    -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](homeAffordance, "setHomeAffordanceInteractionEnabled:", -[SBSpotlightPresentableViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"));
}

- (void)_requestDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "spotlightPresentableViewControllerShouldDismiss:", self);

}

- (SBSpotlightPresentableViewControllerDelegate)delegate
{
  return (SBSpotlightPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSpotlightMultiplexingViewController)spotlightMultiplexingViewController
{
  return self->_spotlightMultiplexingViewController;
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

- (SBHHomePullToSearchSettings)searchTransitionSettings
{
  return self->_searchTransitionSettings;
}

- (SBSpotlightBackgroundWeighting)searchBackgroundView
{
  return self->_searchBackgroundView;
}

- (void)setSearchBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBackgroundView, a3);
}

- (UIView)scaleView
{
  return self->_scaleView;
}

- (void)setScaleView:(id)a3
{
  objc_storeStrong((id *)&self->_scaleView, a3);
}

- (UIViewFloatAnimatableProperty)scaleProperty
{
  return self->_scaleProperty;
}

- (void)setScaleProperty:(id)a3
{
  objc_storeStrong((id *)&self->_scaleProperty, a3);
}

- (SBFFluidBehaviorSettings)scaleSettings
{
  return self->_scaleSettings;
}

- (void)setScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scaleSettings, a3);
}

- (SBHSearchAffordance)searchAffordance
{
  return self->_searchAffordance;
}

- (void)setSearchAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordance, a3);
}

- (UIView)searchAffordanceContentContainerView
{
  return self->_searchAffordanceContentContainerView;
}

- (void)setSearchAffordanceContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceContentContainerView, a3);
}

- (UIView)searchAffordanceBackgroundCapturingView
{
  return self->_searchAffordanceBackgroundCapturingView;
}

- (void)setSearchAffordanceBackgroundCapturingView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceBackgroundCapturingView, a3);
}

- (UIView)searchAffordanceReferenceBackgroundView
{
  return self->_searchAffordanceReferenceBackgroundView;
}

- (void)setSearchAffordanceReferenceBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, a3);
}

- (SBSpotlightPresentationMetrics)appliedKeyboardAlignedElementsMetrics
{
  CGPoint searchContentCenter;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  searchContentCenter = self[9].searchContentCenter;
  *(_OWORD *)&retstr->keyboardProtectorCenter.y = *(_OWORD *)&self[8].keyboardVelocity;
  *(CGPoint *)&retstr->homeAffordanceCenter.y = searchContentCenter;
  retstr->keyboardVelocity = self[9].searchContentAlpha;
  v4 = *(_OWORD *)&self[8].keyboardAlpha;
  *(CGPoint *)&retstr->searchAffordanceCornerRadius = self[8].keyboardCenter;
  *(_OWORD *)&retstr->fullSearchBarSize.height = v4;
  v5 = *(_OWORD *)&self[8].homeAffordanceCenter.y;
  retstr->keyboardCenter = *(CGPoint *)&self[8].keyboardProtectorCenter.y;
  *(_OWORD *)&retstr->keyboardAlpha = v5;
  v6 = *(_OWORD *)&self[8].searchAffordanceContentAlignment;
  *(_OWORD *)&retstr->searchAffordanceBackgroundAlpha = *(_OWORD *)&self[8].searchAffordanceCenter.y;
  *(_OWORD *)&retstr->searchAffordanceSize.height = v6;
  v7 = *(_OWORD *)&self[8].fullSearchBarSize.height;
  *(_OWORD *)&retstr->searchAffordanceCenter.y = *(_OWORD *)&self[8].searchAffordanceCornerRadius;
  *(_OWORD *)&retstr->searchAffordanceContentAlignment = v7;
  v8 = *(_OWORD *)&self[8].searchAffordanceSize.height;
  *(_OWORD *)&retstr->backgroundWeighting = *(_OWORD *)&self[8].searchAffordanceBackgroundAlpha;
  *(_OWORD *)&retstr->searchContentCenter.y = v8;
  return self;
}

- (void)setAppliedKeyboardAlignedElementsMetrics:(SBSpotlightPresentationMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  CGPoint keyboardCenter;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.backgroundWeighting = *(_OWORD *)&a3->backgroundWeighting;
  v3 = *(_OWORD *)&a3->searchAffordanceCenter.y;
  v5 = *(_OWORD *)&a3->searchContentCenter.y;
  v4 = *(_OWORD *)&a3->searchAffordanceBackgroundAlpha;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceSize.height = *(_OWORD *)&a3->searchAffordanceSize.height;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCenter.y = v3;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchContentCenter.y = v5;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceBackgroundAlpha = v4;
  keyboardCenter = a3->keyboardCenter;
  v8 = *(_OWORD *)&a3->searchAffordanceContentAlignment;
  v7 = *(_OWORD *)&a3->searchAffordanceCornerRadius;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.fullSearchBarSize.height = *(_OWORD *)&a3->fullSearchBarSize.height;
  self->_appliedKeyboardAlignedElementsMetrics.keyboardCenter = keyboardCenter;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceContentAlignment = v8;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.searchAffordanceCornerRadius = v7;
  v10 = *(_OWORD *)&a3->keyboardProtectorCenter.y;
  v9 = *(_OWORD *)&a3->homeAffordanceCenter.y;
  v11 = *(_OWORD *)&a3->keyboardAlpha;
  self->_appliedKeyboardAlignedElementsMetrics.keyboardVelocity = a3->keyboardVelocity;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardProtectorCenter.y = v10;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.homeAffordanceCenter.y = v9;
  *(_OWORD *)&self->_appliedKeyboardAlignedElementsMetrics.keyboardAlpha = v11;
}

- (SBHomeGrabberView)homeAffordance
{
  return self->_homeAffordance;
}

- (void)setHomeAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordance, a3);
}

- (UIView)searchAffordanceReferenceView
{
  return self->_searchAffordanceReferenceView;
}

- (void)setSearchAffordanceReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, a3);
}

- (CGRect)searchAffordanceReferenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_searchAffordanceReferenceFrame.origin.x;
  y = self->_searchAffordanceReferenceFrame.origin.y;
  width = self->_searchAffordanceReferenceFrame.size.width;
  height = self->_searchAffordanceReferenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSearchAffordanceReferenceFrame:(CGRect)a3
{
  self->_searchAffordanceReferenceFrame = a3;
}

- (UIView)keyboardView
{
  return self->_keyboardView;
}

- (void)setKeyboardView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardView, a3);
}

- (BOOL)initializingKeyboardView
{
  return self->_initializingKeyboardView;
}

- (void)setInitializingKeyboardView:(BOOL)a3
{
  self->_initializingKeyboardView = a3;
}

- (BOOL)hasUnifiedKeyboardBackground
{
  return self->_hasUnifiedKeyboardBackground;
}

- (_UIPortalView)keyboardProtectorPortalView
{
  return self->_keyboardProtectorPortalView;
}

- (void)setKeyboardProtectorPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardProtectorPortalView, a3);
}

- (SBSpotlightHostedContentMetrics)hostedContentMetrics
{
  CGSize v3;

  v3 = *(CGSize *)&self[28].searchBarSize.height;
  *(_OWORD *)&retstr->keyboardHeight = *(_OWORD *)&self[28].keyboardProtectorHeight;
  retstr->searchBarSize = v3;
  retstr->dockedSearchBarSize = *(CGSize *)&self[28].dockedSearchBarSize.height;
  retstr->searchBarCornerRadius = self[29].keyboardHeight;
  return self;
}

- (void)setHostedContentMetrics:(SBSpotlightHostedContentMetrics *)a3
{
  CGSize dockedSearchBarSize;
  CGSize searchBarSize;
  __int128 v5;

  searchBarSize = a3->searchBarSize;
  dockedSearchBarSize = a3->dockedSearchBarSize;
  v5 = *(_OWORD *)&a3->keyboardHeight;
  self->_hostedContentMetrics.searchBarCornerRadius = a3->searchBarCornerRadius;
  self->_hostedContentMetrics.searchBarSize = searchBarSize;
  self->_hostedContentMetrics.dockedSearchBarSize = dockedSearchBarSize;
  *(_OWORD *)&self->_hostedContentMetrics.keyboardHeight = v5;
}

- (_UIPortalView)searchBarPortalView
{
  return self->_searchBarPortalView;
}

- (void)setSearchBarPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarPortalView, a3);
}

- (_UIPortalView)searchBarBackgroundPortalView
{
  return self->_searchBarBackgroundPortalView;
}

- (void)setSearchBarBackgroundPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackgroundPortalView, a3);
}

- (UIView)searchBarPortalClippingContainerView
{
  return self->_searchBarPortalClippingContainerView;
}

- (void)setSearchBarPortalClippingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarPortalClippingContainerView, a3);
}

- (NSMutableSet)searchBarPortalRequirementReasons
{
  return self->_searchBarPortalRequirementReasons;
}

- (void)setSearchBarPortalRequirementReasons:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, a3);
}

- (BOOL)supportsSeparateSearchBarBackground
{
  return self->_supportsSeparateSearchBarBackground;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (void)setPresentationProgress:(double)a3
{
  self->_presentationProgress = a3;
}

- (double)presentationOffset
{
  return self->_presentationOffset;
}

- (void)setPresentationOffset:(double)a3
{
  self->_presentationOffset = a3;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (int64_t)previousPresentationState
{
  return self->_previousPresentationState;
}

- (void)setPreviousPresentationState:(int64_t)a3
{
  self->_previousPresentationState = a3;
}

- (int64_t)anticipatedPresentationState
{
  return self->_anticipatedPresentationState;
}

- (void)setAnticipatedPresentationState:(int64_t)a3
{
  self->_anticipatedPresentationState = a3;
}

- (int64_t)searchAffordancePresentationState
{
  return self->_searchAffordancePresentationState;
}

- (void)setSearchAffordancePresentationState:(int64_t)a3
{
  self->_searchAffordancePresentationState = a3;
}

- (unint64_t)outstandingAnimationCount
{
  return self->_outstandingAnimationCount;
}

- (void)setOutstandingAnimationCount:(unint64_t)a3
{
  self->_outstandingAnimationCount = a3;
}

- (BOOL)cancellingDismissAnimation
{
  return self->_cancellingDismissAnimation;
}

- (void)setCancellingDismissAnimation:(BOOL)a3
{
  self->_cancellingDismissAnimation = a3;
}

- (UIViewFloatAnimatableProperty)searchContentFadeProperty
{
  return self->_searchContentFadeProperty;
}

- (void)setSearchContentFadeProperty:(id)a3
{
  objc_storeStrong((id *)&self->_searchContentFadeProperty, a3);
}

- (UIViewFloatAnimatableProperty)searchAffordanceReferenceBackgroundFadeProperty
{
  return self->_searchAffordanceReferenceBackgroundFadeProperty;
}

- (void)setSearchAffordanceReferenceBackgroundFadeProperty:(id)a3
{
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundFadeProperty, a3);
}

- (UIViewFloatAnimatableProperty)backgroundBlurProperty
{
  return self->_backgroundBlurProperty;
}

- (void)setBackgroundBlurProperty:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurProperty, a3);
}

- (BOOL)dismissingFromFullyPresented
{
  return self->_dismissingFromFullyPresented;
}

- (void)setDismissingFromFullyPresented:(BOOL)a3
{
  self->_dismissingFromFullyPresented = a3;
}

- (BOOL)waitingForSearchContentAvailabilityForFadeIn
{
  return self->_waitingForSearchContentAvailabilityForFadeIn;
}

- (void)setWaitingForSearchContentAvailabilityForFadeIn:(BOOL)a3
{
  self->_waitingForSearchContentAvailabilityForFadeIn = a3;
}

- (double)searchContentFadeInStartValue
{
  return self->_searchContentFadeInStartValue;
}

- (void)setSearchContentFadeInStartValue:(double)a3
{
  self->_searchContentFadeInStartValue = a3;
}

- (UIViewFloatAnimatableProperty)keyboardFadeProperty
{
  return self->_keyboardFadeProperty;
}

- (void)setKeyboardFadeProperty:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFadeProperty, a3);
}

- (BOOL)waitingForKeyboardPresentationForFadeIn
{
  return self->_waitingForKeyboardPresentationForFadeIn;
}

- (void)setWaitingForKeyboardPresentationForFadeIn:(BOOL)a3
{
  self->_waitingForKeyboardPresentationForFadeIn = a3;
}

- (double)keyboardFadeInStartValue
{
  return self->_keyboardFadeInStartValue;
}

- (void)setKeyboardFadeInStartValue:(double)a3
{
  self->_keyboardFadeInStartValue = a3;
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchAnimationSettings, a3);
}

- (double)spotlightActivationThreshold
{
  return self->_spotlightActivationThreshold;
}

- (void)setSpotlightActivationThreshold:(double)a3
{
  self->_spotlightActivationThreshold = a3;
}

- (double)backgroundInteractiveBlurDistance
{
  return self->_backgroundInteractiveBlurDistance;
}

- (void)setBackgroundInteractiveBlurDistance:(double)a3
{
  self->_backgroundInteractiveBlurDistance = a3;
}

- (SBSpotlightTransitionRange)backgroundBlurRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_backgroundBlurRange.start;
  end = self->_backgroundBlurRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setBackgroundBlurRange:(SBSpotlightTransitionRange)a3
{
  self->_backgroundBlurRange = a3;
}

- (SBSpotlightTransitionRange)backgroundUnblurRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_backgroundUnblurRange.start;
  end = self->_backgroundUnblurRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setBackgroundUnblurRange:(SBSpotlightTransitionRange)a3
{
  self->_backgroundUnblurRange = a3;
}

- (double)searchContentInteractiveFadeInDistance
{
  return self->_searchContentInteractiveFadeInDistance;
}

- (void)setSearchContentInteractiveFadeInDistance:(double)a3
{
  self->_searchContentInteractiveFadeInDistance = a3;
}

- (SBSpotlightTransitionRange)searchContentFadeInRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchContentFadeInRange.start;
  end = self->_searchContentFadeInRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchContentFadeInRange:(SBSpotlightTransitionRange)a3
{
  self->_searchContentFadeInRange = a3;
}

- (SBSpotlightTransitionRange)searchContentFadeOutRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchContentFadeOutRange.start;
  end = self->_searchContentFadeOutRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchContentFadeOutRange:(SBSpotlightTransitionRange)a3
{
  self->_searchContentFadeOutRange = a3;
}

- (double)searchAffordanceBackgroundMaterialInteractiveFadeDistance
{
  return self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance;
}

- (void)setSearchAffordanceBackgroundMaterialInteractiveFadeDistance:(double)a3
{
  self->_searchAffordanceBackgroundMaterialInteractiveFadeDistance = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceBackgroundMaterialFadeRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchAffordanceBackgroundMaterialFadeRange.start;
  end = self->_searchAffordanceBackgroundMaterialFadeRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchAffordanceBackgroundMaterialFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceBackgroundMaterialFadeRange = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceContentFadeRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchAffordanceContentFadeRange.start;
  end = self->_searchAffordanceContentFadeRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchAffordanceContentFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceContentFadeRange = a3;
}

- (SBSpotlightTransitionRange)searchBarContentFadeRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchBarContentFadeRange.start;
  end = self->_searchBarContentFadeRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchBarContentFadeRange:(SBSpotlightTransitionRange)a3
{
  self->_searchBarContentFadeRange = a3;
}

- (BOOL)scalesSearchAffordanceContentWhileFading
{
  return self->_scalesSearchAffordanceContentWhileFading;
}

- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3
{
  self->_scalesSearchAffordanceContentWhileFading = a3;
}

- (SBSpotlightTransitionRange)searchAffordanceScaleAndTranslateRange
{
  double start;
  double end;
  SBSpotlightTransitionRange result;

  start = self->_searchAffordanceScaleAndTranslateRange.start;
  end = self->_searchAffordanceScaleAndTranslateRange.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setSearchAffordanceScaleAndTranslateRange:(SBSpotlightTransitionRange)a3
{
  self->_searchAffordanceScaleAndTranslateRange = a3;
}

- (double)searchAffordanceMaxScaleX
{
  return self->_searchAffordanceMaxScaleX;
}

- (void)setSearchAffordanceMaxScaleX:(double)a3
{
  self->_searchAffordanceMaxScaleX = a3;
}

- (double)searchAffordanceMaxScaleY
{
  return self->_searchAffordanceMaxScaleY;
}

- (void)setSearchAffordanceMaxScaleY:(double)a3
{
  self->_searchAffordanceMaxScaleY = a3;
}

- (double)searchAffordanceScaleRubberbandingRange
{
  return self->_searchAffordanceScaleRubberbandingRange;
}

- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3
{
  self->_searchAffordanceScaleRubberbandingRange = a3;
}

- (double)searchAffordanceMaxOffset
{
  return self->_searchAffordanceMaxOffset;
}

- (void)setSearchAffordanceMaxOffset:(double)a3
{
  self->_searchAffordanceMaxOffset = a3;
}

- (double)searchAffordanceOffsetRubberbandingRange
{
  return self->_searchAffordanceOffsetRubberbandingRange;
}

- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3
{
  self->_searchAffordanceOffsetRubberbandingRange = a3;
}

- (double)searchAffordanceTransientFadeInThreshold
{
  return self->_searchAffordanceTransientFadeInThreshold;
}

- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3
{
  self->_searchAffordanceTransientFadeInThreshold = a3;
}

- (double)pullTransitionDistance
{
  return self->_pullTransitionDistance;
}

- (void)setPullTransitionDistance:(double)a3
{
  self->_pullTransitionDistance = a3;
}

- (BOOL)allowsKeyboardWhileInteractive
{
  return self->_allowsKeyboardWhileInteractive;
}

- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractive = a3;
}

- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance
{
  return self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance;
}

- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = a3;
}

- (double)interactiveKeyboardPresentationThreshold
{
  return self->_interactiveKeyboardPresentationThreshold;
}

- (void)setInteractiveKeyboardPresentationThreshold:(double)a3
{
  self->_interactiveKeyboardPresentationThreshold = a3;
}

- (double)interactiveKeyboardPresentationOffset
{
  return self->_interactiveKeyboardPresentationOffset;
}

- (void)setInteractiveKeyboardPresentationOffset:(double)a3
{
  self->_interactiveKeyboardPresentationOffset = a3;
}

- (BOOL)keyboardFollowsSpotlightContent
{
  return self->_keyboardFollowsSpotlightContent;
}

- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3
{
  self->_keyboardFollowsSpotlightContent = a3;
}

- (BOOL)allowsVelocityInjection
{
  return self->_allowsVelocityInjection;
}

- (void)setAllowsVelocityInjection:(BOOL)a3
{
  self->_allowsVelocityInjection = a3;
}

- (BOOL)injectsVelocityOnlyForShortSwipes
{
  return self->_injectsVelocityOnlyForShortSwipes;
}

- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3
{
  self->_injectsVelocityOnlyForShortSwipes = a3;
}

- (double)shortSwipeMaximumPercentageOfExpectedVelocity
{
  return self->_shortSwipeMaximumPercentageOfExpectedVelocity;
}

- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3
{
  self->_shortSwipeMaximumPercentageOfExpectedVelocity = a3;
}

- (double)injectedPercentageOfGestureVelocity
{
  return self->_injectedPercentageOfGestureVelocity;
}

- (void)setInjectedPercentageOfGestureVelocity:(double)a3
{
  self->_injectedPercentageOfGestureVelocity = a3;
}

- (double)keyboardInjectedVelocityPercentage
{
  return self->_keyboardInjectedVelocityPercentage;
}

- (void)setKeyboardInjectedVelocityPercentage:(double)a3
{
  self->_keyboardInjectedVelocityPercentage = a3;
}

- (BOOL)injectsVelocityForNonInteractiveTransitions
{
  return self->_injectsVelocityForNonInteractiveTransitions;
}

- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3
{
  self->_injectsVelocityForNonInteractiveTransitions = a3;
}

- (double)injectedVelocityForNonInteractiveTransitions
{
  return self->_injectedVelocityForNonInteractiveTransitions;
}

- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3
{
  self->_injectedVelocityForNonInteractiveTransitions = a3;
}

- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions
{
  return self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
}

- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3
{
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = a3;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_keyboardFadeProperty, 0);
  objc_storeStrong((id *)&self->_backgroundBlurProperty, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundFadeProperty, 0);
  objc_storeStrong((id *)&self->_searchContentFadeProperty, 0);
  objc_storeStrong((id *)&self->_searchBarPortalRequirementReasons, 0);
  objc_storeStrong((id *)&self->_searchBarPortalClippingContainerView, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundPortalView, 0);
  objc_storeStrong((id *)&self->_searchBarPortalView, 0);
  objc_storeStrong((id *)&self->_keyboardProtectorPortalView, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceBackgroundCapturingView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceContentContainerView, 0);
  objc_storeStrong((id *)&self->_searchAffordance, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_scaleProperty, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_searchBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchTransitionSettings, 0);
  objc_storeStrong((id *)&self->_spotlightMultiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
