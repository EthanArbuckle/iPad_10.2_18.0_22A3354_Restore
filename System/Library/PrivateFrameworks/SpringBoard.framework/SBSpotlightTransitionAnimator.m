@implementation SBSpotlightTransitionAnimator

- (SBSpotlightTransitionAnimator)init
{
  SBSpotlightTransitionAnimator *v2;
  uint64_t v3;
  SBSystemAnimationSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightTransitionAnimator;
  v2 = -[SBSpotlightTransitionAnimator init](&v6, sel_init);
  if (v2)
  {
    +[SBSystemAnimationDomain rootSettings](SBSystemAnimationDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSystemAnimationSettings *)v3;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    -[SBSpotlightTransitionAnimator _prototypeSettingsChanged](v2, "_prototypeSettingsChanged");
  }
  return v2;
}

- (BOOL)shouldMoveIntoSearch
{
  return self->_operation == 0;
}

- (BOOL)shouldMoveIntoSearchOnCancel
{
  return self->_operation != 0;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (void)animateTransition:(id)a3
{
  id v6;
  UIView *v7;
  UIView *containerView;
  unint64_t v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  _QWORD v20[5];
  BOOL v21;
  _QWORD v22[5];

  v6 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  objc_msgSend(v6, "containerView");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  containerView = self->_containerView;
  self->_containerView = v7;

  if (!self->_containerView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_containerView"));

  }
  if (objc_msgSend(v6, "isInteractive"))
  {
    -[SBSpotlightTransitionAnimator _animateInteractiveTransition:](self, "_animateInteractiveTransition:", v6);
  }
  else
  {
    v9 = self->_transitionToken + 1;
    self->_transitionToken = v9;
    v10 = objc_msgSend(v6, "transitionWasRestarted");
    v11 = MEMORY[0x1E0C809B0];
    if ((v10 & 1) == 0)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke;
      v22[3] = &unk_1E8E9DED8;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v22);
    }
    v12 = -[SBSpotlightTransitionAnimator shouldMoveIntoSearch](self, "shouldMoveIntoSearch");
    -[SBSpotlightTransitionAnimator transitionDuration:](self, "transitionDuration:", v6);
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v19 = v9;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_2;
    v20[3] = &unk_1E8E9F508;
    v20[4] = self;
    v21 = v12;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_3;
    v17[3] = &unk_1E8EAD9C8;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v15, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v20, v17, v14, 0.0);

  }
}

uint64_t __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareToAnimate");
}

uint64_t __51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateIntoSearch:", *(unsigned __int8 *)(a1 + 40));
}

_QWORD *__51__SBSpotlightTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 32);
  if (v2 == result[5])
  {
    objc_msgSend(result, "_cleanupAfterAnimating:", 1);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
  }
  return result;
}

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  void *v7;

  if ((-[SBViewControllerContextTransitioning isAnimated](self->_transitionContext, "isAnimated", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_transitionContext isAnimated]"));

  }
  -[SBSpotlightTransitionAnimator _updateTransitionIntoSearch:percentComplete:](self, "_updateTransitionIntoSearch:percentComplete:", -[SBSpotlightTransitionAnimator shouldMoveIntoSearch](self, "shouldMoveIntoSearch"), a4);
  if (-[SBSpotlightTransitionAnimator shouldMoveIntoSearch](self, "shouldMoveIntoSearch"))
    -[SPUIRemoteSearchViewController setRevealProgress:](self->_spotlightViewController, "setRevealProgress:", a4);
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  _QWORD v19[5];
  BOOL v20;

  v8 = a3;
  v9 = objc_opt_class();
  SBSafeCast(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "initiallyInteractive"))
  {
    -[SBSpotlightTransitionAnimator _cancelInteractiveTransition:withCompletionSpeed:completionCurve:](self, "_cancelInteractiveTransition:withCompletionSpeed:completionCurve:", v8, a5, a4);
  }
  else
  {
    v11 = self->_transitionToken + 1;
    self->_transitionToken = v11;
    v12 = -[SBSpotlightTransitionAnimator shouldMoveIntoSearchOnCancel](self, "shouldMoveIntoSearchOnCancel");
    -[SBSpotlightTransitionAnimator transitionDuration:](self, "transitionDuration:", v8);
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v18 = v11;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    v19[3] = &unk_1E8E9F508;
    v19[4] = self;
    v20 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke_2;
    v16[3] = &unk_1E8EAD9C8;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v15, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v19, v16, v14, 0.0);

  }
}

uint64_t __86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateIntoSearch:", *(unsigned __int8 *)(a1 + 40));
}

_QWORD *__86__SBSpotlightTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 32);
  if (v2 == result[5])
  {
    objc_msgSend(result, "_cleanupAfterAnimating:", 0);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 0);
  }
  return result;
}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = objc_opt_class();
  SBSafeCast(v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "initiallyInteractive"))
    -[SBSpotlightTransitionAnimator _finishInteractiveTransition:withCompletionSpeed:completionCurve:](self, "_finishInteractiveTransition:withCompletionSpeed:completionCurve:", v10, a5, a4);

}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("spotlightNoninteractiveAnimationDuration")))
    -[SBSpotlightTransitionAnimator _prototypeSettingsChanged](self, "_prototypeSettingsChanged");
}

- (void)_prepareToAnimate
{
  SBUISpotlightInitiating *v4;
  SBUISpotlightInitiating *initiatingViewController;
  SPUIRemoteSearchViewController *v6;
  SPUIRemoteSearchViewController *spotlightViewController;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *searchView;
  void *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  __int128 v19;
  unint64_t operation;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIView *v30;
  UIView *touchSwallowingView;
  void *v32;
  void *v33;
  void *v34;
  SBSearchBackdropView *backdropView;
  SBSearchBackdropView *v36;
  SBSearchBackdropView *v37;
  BOOL v38;
  SBSearchBackdropView *v39;
  void *v40;
  _OWORD v41[3];

  if ((-[SBViewControllerContextTransitioning isAnimated](self->_transitionContext, "isAnimated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_transitionContext isAnimated]"));

  }
  -[SBViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("SBSpotlightInitiatingViewControllerKey"));
  v4 = (SBUISpotlightInitiating *)objc_claimAutoreleasedReturnValue();
  initiatingViewController = self->_initiatingViewController;
  self->_initiatingViewController = v4;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
  v6 = (SPUIRemoteSearchViewController *)objc_claimAutoreleasedReturnValue();
  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = v6;

  self->_pulldownInterval.start.value = -141.0;
  self->_pulldownInterval.start.inclusive = 1;
  *(_QWORD *)(&self->_pulldownInterval.start.inclusive + 1) = 0;
  self->_pulldownInterval.end.value = 0.0;
  self->_pulldownInterval.end.inclusive = 1;
  *(_DWORD *)(&self->_pulldownInterval.end.inclusive + 1) = 0;
  *((_DWORD *)&self->_pulldownInterval.end.inclusive + 1) = 0;
  -[SBViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self->_operation = 0;
    -[SBViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 1.0);
    -[SPUIRemoteSearchViewController view](self->_spotlightViewController, "view");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    searchView = self->_searchView;
    self->_searchView = v10;

    -[SPUIRemoteSearchViewController setEdgesForExtendedLayout:](self->_spotlightViewController, "setEdgesForExtendedLayout:", -[SPUIRemoteSearchViewController edgesForExtendedLayout](self->_spotlightViewController, "edgesForExtendedLayout") & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    -[SBViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      self->_operation = 1;
      -[SBViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 1.0);
      -[SPUIRemoteSearchViewController view](self->_spotlightViewController, "view");
      v13 = (UIView *)objc_claimAutoreleasedReturnValue();
      v14 = self->_searchView;
      self->_searchView = v13;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 200, CFSTR("Can only transition in or out of search."));

      v9 = 0;
    }
  }
  v16 = self->_searchView;
  -[SPUIRemoteSearchViewController view](self->_spotlightViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "center");
  -[UIView setCenter:](v16, "setCenter:");

  -[UIView layer](self->_searchView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v41[0] = *MEMORY[0x1E0C9BAA8];
  v41[1] = v19;
  v41[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v18, "setAffineTransform:", v41);

  -[UIView _setIgnoresLayerTransformForSafeAreaInsets:](self->_searchView, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
  operation = self->_operation;
  if (operation)
  {
    if (operation != 1)
      goto LABEL_13;
    v21 = 1.0;
  }
  else
  {
    v21 = 0.0;
  }
  -[UIView setAlpha:](self->_searchView, "setAlpha:", v21);
LABEL_13:
  -[UIView bounds](self->_containerView, "bounds");
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  if (!self->_operation)
  {
    v30 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v22, v23, v24, v25);
    touchSwallowingView = self->_touchSwallowingView;
    self->_touchSwallowingView = v30;

    -[UIView setUserInteractionEnabled:](self->_touchSwallowingView, "setUserInteractionEnabled:", 1);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_touchSwallowingView);
    -[UIView bringSubviewToFront:](self->_containerView, "bringSubviewToFront:", self->_touchSwallowingView);
    -[SPUIRemoteSearchViewController navigationController](self->_spotlightViewController, "navigationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

  }
  -[SBViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", CFSTR("SBSpotlightSearchBackdropViewKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  backdropView = self->_backdropView;
  if (backdropView && self->_ownsBackdropView)
  {
    -[SBSearchBackdropView removeFromSuperview](backdropView, "removeFromSuperview");
    v36 = self->_backdropView;
    self->_backdropView = 0;

  }
  if (v34)
  {
    v37 = v34;
    v38 = 0;
  }
  else
  {
    v37 = (SBSearchBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA660]), "initWithFrame:", v26, v27, v28, v29);
    v38 = 1;
  }
  v39 = self->_backdropView;
  self->_backdropView = v37;

  self->_ownsBackdropView = v38;
  -[SBSearchBackdropView prepareForTransitionToBlurred:](self->_backdropView, "prepareForTransitionToBlurred:", self->_operation == 0);
  if (!v34)
    -[UIView insertSubview:belowSubview:](self->_containerView, "insertSubview:belowSubview:", self->_backdropView, v9);

}

- (void)_animateInteractiveTransition:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__SBSpotlightTransitionAnimator__animateInteractiveTransition___block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v3);
}

uint64_t __63__SBSpotlightTransitionAnimator__animateInteractiveTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareToAnimate");
}

- (void)_updateTransitionIntoSearch:(BOOL)a3 percentComplete:(double)a4
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  UIView *searchView;

  v5 = a3;
  self->_percentComplete = a4;
  v7 = 1.0 - a4;
  -[SBSpotlightTransitionAnimator _percentVisibleForPercentComplete:](self, "_percentVisibleForPercentComplete:", a4);
  v9 = v8;
  -[SBSpotlightTransitionAnimator _percentVisibleForPercentComplete:](self, "_percentVisibleForPercentComplete:", v7);
  searchView = self->_searchView;
  if (v5)
  {
    -[UIView setAlpha:](searchView, "setAlpha:", v9);
    if ((-[SBViewControllerContextTransitioning isInteractive](self->_transitionContext, "isInteractive") & 1) == 0)
      return;
LABEL_5:
    -[SBSearchBackdropView setTransitionProgress:](self->_backdropView, "setTransitionProgress:", a4);
    return;
  }
  -[UIView setAlpha:](searchView, "setAlpha:");
  if (-[SBViewControllerContextTransitioning isInteractive](self->_transitionContext, "isInteractive"))
    goto LABEL_5;
}

- (void)_cancelInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6;

  v6 = a3;
  -[SBSpotlightTransitionAnimator _cleanupAfterAnimating:](self, "_cleanupAfterAnimating:", 0);
  objc_msgSend(v6, "completeTransition:", 0);

}

- (void)_finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6;

  v6 = a3;
  -[SBSpotlightTransitionAnimator _cleanupAfterAnimating:](self, "_cleanupAfterAnimating:", 1);
  objc_msgSend(v6, "completeTransition:", 1);

}

- (void)_animateIntoSearch:(BOOL)a3
{
  _BOOL4 v3;
  double v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[6];
  BOOL v13;

  v3 = a3;
  if ((-[SBViewControllerContextTransitioning isAnimated](self->_transitionContext, "isAnimated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_transitionContext isAnimated]"));

  }
  if (v3)
    v6 = 0.75;
  else
    v6 = 0.25;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke;
  v12[3] = &unk_1E8EA5AD8;
  v12[4] = self;
  v13 = v3;
  *(double *)&v12[5] = v6;
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v12, 0.0, v6);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_2;
  v10[3] = &unk_1E8E9F508;
  v10[4] = self;
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, v6, 1.0 - v6);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_3;
  v9[3] = &unk_1E8E9DED8;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v9, 0.0, 1.0);
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTransitionIntoSearch:percentComplete:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTransitionIntoSearch:percentComplete:", *(unsigned __int8 *)(a1 + 40), 1.0);
}

uint64_t __52__SBSpotlightTransitionAnimator__animateIntoSearch___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setTransitionProgress:", 1.0);
}

- (void)_cleanupAfterAnimating:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  __int128 v7;
  unint64_t operation;
  UIView *touchSwallowingView;
  UIView *v10;
  void *v11;
  void *v12;
  UIView *searchView;
  SBSearchBackdropView *backdropView;
  void *v15;
  _OWORD v16[3];

  v3 = a3;
  if ((-[SBViewControllerContextTransitioning isAnimated](self->_transitionContext, "isAnimated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_transitionContext isAnimated]"));

  }
  -[UIView layer](self->_searchView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v7;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setAffineTransform:", v16);

  -[UIView setAlpha:](self->_searchView, "setAlpha:", 1.0);
  -[SBSearchBackdropView completeTransitionSuccessfully:](self->_backdropView, "completeTransitionSuccessfully:", v3);
  -[SBSearchBackdropView completeIncrementalTransitionSuccessfully:](self->_backdropView, "completeIncrementalTransitionSuccessfully:", v3);
  if (self->_ownsBackdropView)
  {
    -[SBSearchBackdropView setAlpha:](self->_backdropView, "setAlpha:", 0.0);
    -[SBSearchBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
  }
  operation = self->_operation;
  if (operation == 1)
  {
    if (v3)
      -[SBSpotlightTransitionAnimator _restoreSpotlightHeaderToInitiatingViewController](self, "_restoreSpotlightHeaderToInitiatingViewController");
  }
  else if (!operation)
  {
    touchSwallowingView = self->_touchSwallowingView;
    if (touchSwallowingView)
    {
      -[UIView removeFromSuperview](touchSwallowingView, "removeFromSuperview");
      v10 = self->_touchSwallowingView;
      self->_touchSwallowingView = 0;

      -[SPUIRemoteSearchViewController navigationController](self->_spotlightViewController, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 1);

    }
    if (!v3)
      -[SBSpotlightTransitionAnimator _restoreSpotlightHeaderToInitiatingViewControllerForCancellation:](self, "_restoreSpotlightHeaderToInitiatingViewControllerForCancellation:", 1);
  }
  searchView = self->_searchView;
  self->_searchView = 0;

  backdropView = self->_backdropView;
  self->_backdropView = 0;

}

- (void)_restoreSpotlightHeaderToInitiatingViewController
{
  -[SBSpotlightTransitionAnimator _restoreSpotlightHeaderToInitiatingViewControllerForCancellation:](self, "_restoreSpotlightHeaderToInitiatingViewControllerForCancellation:", 0);
}

- (void)_restoreSpotlightHeaderToInitiatingViewControllerForCancellation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBUISpotlightInitiating spotlightHeaderAcquiringViewController](self->_initiatingViewController, "spotlightHeaderAcquiringViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_canvasView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", CFSTR("SBSpotlightSearchHeaderViewKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setAlpha:", 1.0);

}

- (void)_prototypeSettingsChanged
{
  float v3;

  -[SBSystemAnimationSettings spotlightNoninteractiveAnimationDuration](self->_settings, "spotlightNoninteractiveAnimationDuration");
  self->_transitionDuration = v3;
}

- (double)_percentVisibleForPercentComplete:(double)a3
{
  return a3 * 4.0 + -3.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_initiatingViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_touchSwallowingView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
