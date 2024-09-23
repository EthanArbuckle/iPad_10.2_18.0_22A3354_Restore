@implementation PKNavigationDashboardAnimatedTransitioningHandler

- (void)_updateWithTransitionContext:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKPassthroughView *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PKPassthroughView *v17;
  PKPassthroughView *v18;
  PKPassthroughView *v19;
  PKPassthroughView *navigationItemsView;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  PKPassthroughView *v27;
  BOOL v28;
  id v29;
  double (**v30)(void *, void *, void *);
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
  PKPassthroughView *v45;
  void *v46;
  _QWORD aBlock[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  v6 = *MEMORY[0x1E0DC55B8];
  v7 = *MEMORY[0x1E0DC55C8];
  if (self->_presenting)
    v8 = *MEMORY[0x1E0DC55B8];
  else
    v8 = *MEMORY[0x1E0DC55C8];
  objc_msgSend(v5, "viewControllerForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC55C0];
  v11 = *MEMORY[0x1E0DC55D0];
  if (self->_presenting)
    v12 = *MEMORY[0x1E0DC55C0];
  else
    v12 = *MEMORY[0x1E0DC55D0];
  objc_msgSend(v5, "viewForKey:", v12);
  v13 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_presentingVC, v9);
  objc_storeWeak((id *)&self->_presentingView, v13);
  if (self->_presenting)
    v14 = v7;
  else
    v14 = v6;
  objc_msgSend(v5, "viewControllerForKey:", v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
    v16 = v11;
  else
    v16 = v10;
  objc_msgSend(v5, "viewForKey:", v16);
  v17 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_presentedVC, v15);
  objc_storeWeak((id *)&self->_presentedView, v17);
  v18 = [PKPassthroughView alloc];
  v19 = -[PKPassthroughView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  navigationItemsView = self->_navigationItemsView;
  self->_navigationItemsView = v19;

  -[PKPassthroughView setHitTestEnabled:](self->_navigationItemsView, "setHitTestEnabled:", 0);
  -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v21, "subviews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        v27 = *(PKPassthroughView **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v28 = v27 == v13 || v27 == v17;
        if (!v28 && v27 != self->_navigationItemsView)
          -[PKPassthroughView removeFromSuperview](v27, "removeFromSuperview");
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v24);
  }

  objc_msgSend(v21, "addSubview:", v13);
  objc_msgSend(v21, "addSubview:", v17);
  objc_msgSend(v21, "addSubview:", self->_navigationItemsView);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKNavigationDashboardAnimatedTransitioningHandler__updateWithTransitionContext___block_invoke;
  aBlock[3] = &unk_1E3E68710;
  v48 = v5;
  v29 = v5;
  v30 = (double (**)(void *, void *, void *))_Block_copy(aBlock);
  v31 = v30[2](v30, v46, v13);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = v30[2](v30, v15, v17);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[PKPassthroughView setFrame:](v13, "setFrame:", v31, v33, v35, v37);
  -[PKPassthroughView setFrame:](v17, "setFrame:", v38, v40, v42, v44);
  v45 = self->_navigationItemsView;
  v55.origin.x = v31;
  v55.origin.y = v33;
  v55.size.width = v35;
  v55.size.height = v37;
  v57.origin.x = v38;
  v57.origin.y = v40;
  v57.size.width = v42;
  v57.size.height = v44;
  v56 = CGRectUnion(v55, v57);
  -[PKPassthroughView setFrame:](v45, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  -[PKPassthroughView layoutIfNeeded](v17, "layoutIfNeeded");

}

double __82__PKNavigationDashboardAnimatedTransitioningHandler__updateWithTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "finalFrameForViewController:", v5);
  x = v14.origin.x;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  if (CGRectEqualToRect(v14, v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "initialFrameForViewController:", v5);
    x = v15.origin.x;
    v17.origin.x = v8;
    v17.origin.y = v9;
    v17.size.width = v10;
    v17.size.height = v11;
    if (CGRectEqualToRect(v15, v17))
    {
      objc_msgSend(v6, "frame");
      x = v12;
    }
  }

  return x;
}

- (void)animateTransition:(id)a3
{
  -[PKNavigationDashboardAnimatedTransitioningHandler _updateWithTransitionContext:](self, "_updateWithTransitionContext:", a3);
  if (!self->_presenting)
    -[PKNavigationDashboardAnimatedTransitioningHandler _dismiss](self, "_dismiss");
}

- (double)transitionDuration:(id)a3
{
  double duration;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;

  -[PKNavigationDashboardAnimatedTransitioningHandler _updateWithTransitionContext:](self, "_updateWithTransitionContext:", a3);
  duration = self->_duration;
  if (!self->_presenting)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    objc_msgSend(WeakRetained, "dashboardVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNavigationDashboardAnimatedTransitioningHandler _contentOffsetAnimationDurationForCollectionView:](self, "_contentOffsetAnimationDurationForCollectionView:", v7);
    duration = duration + v8;

  }
  return duration;
}

- (void)animationEnded:(BOOL)a3
{
  PKNavigationDashboardPassViewController **p_presentedVC;
  id WeakRetained;
  UIViewControllerContextTransitioning *transitionContext;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v8;

  if (!self->_completed)
  {
    self->_completed = 1;
    p_presentedVC = &self->_presentedVC;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    objc_msgSend(WeakRetained, "noteTransitionCompleted");

    objc_storeWeak((id *)&self->_presentingView, 0);
    objc_storeWeak((id *)&self->_presentingVC, 0);
    objc_storeWeak((id *)p_presentedVC, 0);
    objc_storeWeak((id *)&self->_presentedView, 0);
    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;

    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if (!-[PKPGSVTransitionInterstitialController isActive](interstitialController, "isActive"))
      {
        -[PKPGSVTransitionInterstitialController invalidate](self->_interstitialController, "invalidate");
        v8 = self->_interstitialController;
        self->_interstitialController = 0;

      }
    }
  }
}

- (void)startInteractiveTransition:(id)a3
{
  -[PKNavigationDashboardAnimatedTransitioningHandler _updateWithTransitionContext:](self, "_updateWithTransitionContext:", a3);
  if (self->_presenting)
    -[PKNavigationDashboardAnimatedTransitioningHandler _startPresentation](self, "_startPresentation");
}

- (BOOL)wantsInteractiveStart
{
  return 0;
}

- (void)cancel
{
  if (self->_presenting)
    -[PKNavigationDashboardAnimatedTransitioningHandler _cancelPresentation](self, "_cancelPresentation");
}

- (void)boostPresentation
{
  PKDashboardPresentationTimingCurveProvider *v3;

  if (!self->_boostedPresentation)
  {
    self->_boostedPresentation = 1;
    v3 = objc_alloc_init(PKDashboardPresentationTimingCurveProvider);
    -[UIViewPropertyAnimator fractionComplete](self->_alphaPropertyAnimator, "fractionComplete");
    -[PKDashboardPresentationTimingCurveProvider setFractionComplete:](v3, "setFractionComplete:");
    -[PKDashboardPresentationTimingCurveProvider setType:](v3, "setType:", 2);
    -[UIViewPropertyAnimator pauseAnimation](self->_alphaPropertyAnimator, "pauseAnimation");
    -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self->_alphaPropertyAnimator, "continueAnimationWithTimingParameters:durationFactor:", v3, 0.05 / (self->_duration + -0.13));

  }
}

- (void)completePresentationImmediately
{
  -[UIViewPropertyAnimator stopAnimation:](self->_alphaPropertyAnimator, "stopAnimation:", 0);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_alphaPropertyAnimator, "finishAnimationAtPosition:", 0);
}

- (void)_startPresentation
{
  PKNavigationDashboardPassViewController **p_presentedVC;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v11;
  PKPGSVTransitionInterstitialController *v12;
  PKPassthroughView *navigationItemsView;
  PKNavigationDashboardAnimatedTransitioningHandler *v14;
  PKPGSVTransitionInterstitialController *v15;
  void *v16;
  id v17;
  int v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  if (!self->_completed)
  {
    p_presentedVC = &self->_presentedVC;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    v5 = objc_loadWeakRetained((id *)&self->_presentedView);
    -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dashboardVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passGroupView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_animationStartTime = CACurrentMediaTime();
    objc_msgSend(v5, "setOpaque:", 0);
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(v7, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScrollEnabled:", 0);

    objc_msgSend(WeakRetained, "groupViewIsAvailable:", v8);
    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if (-[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated"))
      {
        v11 = self->_interstitialController;
        self->_interstitialController = 0;

      }
      if (self->_interstitialController)
      {
        objc_initWeak(&location, self);
        v12 = self->_interstitialController;
        navigationItemsView = self->_navigationItemsView;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke;
        v27[3] = &unk_1E3E68738;
        objc_copyWeak(&v28, &location);
        -[PKPGSVTransitionInterstitialController transferToView:withDeactivationHandler:](v12, "transferToView:withDeactivationHandler:", navigationItemsView, v27);
        v14 = -[PKPGSVTransitionInterstitialController context](self->_interstitialController, "context");
        v15 = self->_interstitialController;
        if (v14 == self)
        {
          objc_msgSend(WeakRetained, "interstitialProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPGSVTransitionInterstitialController updateCurrentProvider:withContainerAlpha:](v15, "updateCurrentProvider:withContainerAlpha:", v16, 1.0);
        }
        else
        {
          objc_msgSend(WeakRetained, "interstitialProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPGSVTransitionInterstitialController pushProvider:withContainerAlpha:context:](v15, "pushProvider:withContainerAlpha:context:", v16, self, 1.0);
        }

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
    v17 = objc_loadWeakRetained((id *)p_presentedVC);
    v18 = objc_msgSend(v17, "isInvalidated");

    if (v18)
    {
      -[PKNavigationDashboardAnimatedTransitioningHandler _cancelPresentation](self, "_cancelPresentation");
    }
    else
    {
      objc_initWeak(&location, self);
      v19 = dispatch_time(0, 130000000);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_2;
      v20[3] = &unk_1E3E68788;
      objc_copyWeak(&v26, &location);
      v21 = v8;
      v22 = v6;
      v23 = WeakRetained;
      v24 = v7;
      v25 = v5;
      dispatch_after(v19, MEMORY[0x1E0C80D38], v20);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }

  }
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (id)WeakRetained[12] == v5)
  {
    if (*((_BYTE *)WeakRetained + 65))
    {
      objc_msgSend(v5, "invalidate");
      v4 = (void *)WeakRetained[12];
      WeakRetained[12] = 0;

    }
  }
  else
  {
    objc_msgSend(v5, "invalidate");
  }

}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  double v15;
  PKDashboardPresentationTimingCurveProvider *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v2 = (id *)(a1 + 72);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 65))
    {
      v5 = WeakRetained[6];
      if (v5)
      {
        if ((objc_msgSend(v5, "transitionWasCancelled") & 1) == 0)
        {
          objc_msgSend(v4, "_moveGroupView:toView:belowView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4[5]);
          objc_msgSend(*(id *)(a1 + 32), "pageControl");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "superview");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = *(void **)(a1 + 40);

          if (v7 == v8)
            objc_msgSend(*(id *)(a1 + 40), "insertSubview:belowSubview:", v6, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 48), "receiver");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "groupViewDidMoveToReceiver:", *(_QWORD *)(a1 + 32));
          v10 = *(void **)(a1 + 56);
          objc_msgSend(v10, "frontmostPass");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "nfcPayload");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "requiresAuthentication") ^ 1;

          objc_msgSend(v10, "shouldPresentAllContent:animated:", v13, 0);
          v14 = objc_alloc(MEMORY[0x1E0DC3F38]);
          v15 = *((double *)v4 + 11) + -0.13;
          v16 = objc_alloc_init(PKDashboardPresentationTimingCurveProvider);
          v17 = objc_msgSend(v14, "initWithDuration:timingParameters:", v16, v15);
          v18 = v4[9];
          v4[9] = (id)v17;

          objc_msgSend(v4[9], "setInterruptible:", 1);
          v19 = MEMORY[0x1E0C809B0];
          v20 = v4[9];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_3;
          v27[3] = &unk_1E3E612E8;
          v28 = *(id *)(a1 + 64);
          objc_msgSend(v20, "addAnimations:", v27);
          v21 = v4[9];
          v22 = v19;
          v23 = 3221225472;
          v24 = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_4;
          v25 = &unk_1E3E68760;
          objc_copyWeak(&v26, v2);
          objc_msgSend(v21, "addCompletion:", &v22);
          objc_msgSend(v4[9], "startAnimation", v22, v23, v24, v25);
          objc_destroyWeak(&v26);

        }
      }
    }
  }

}

uint64_t __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6[2];

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_5;
    v5[3] = &unk_1E3E66D38;
    objc_copyWeak(v6, v3);
    v6[1] = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(v6);
  }

}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == 1)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_completeCancelledPresentation");
      goto LABEL_6;
    }
    if (!v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_completePresentation");
LABEL_6:
      WeakRetained = v4;
    }
  }

}

- (void)_cancelPresentation
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v8;
  uint64_t v9;
  void *v10;
  PKPGSVTransitionInterstitialController *v11;
  PKPassthroughView *navigationItemsView;
  PKPGSVTransitionInterstitialController *v13;
  PKPGSVTransitionInterstitialController *v14;
  UIViewPropertyAnimator *alphaPropertyAnimator;
  double v16;
  double v17;
  double v18;
  PKDashboardPresentationTimingCurveProvider *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;

  if (!self->_completed)
  {
    -[UIViewControllerContextTransitioning pauseInteractiveTransition](self->_transitionContext, "pauseInteractiveTransition");
    -[UIViewControllerContextTransitioning cancelInteractiveTransition](self->_transitionContext, "cancelInteractiveTransition");
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    objc_msgSend(WeakRetained, "dashboardVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passGroupView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_dragged)
      objc_msgSend(v4, "shouldPresentAllContent:animated:", 0, 1);
    objc_msgSend(WeakRetained, "receiver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      interstitialController = self->_interstitialController;
      if (interstitialController
        && -[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated"))
      {
        v8 = self->_interstitialController;
        self->_interstitialController = 0;

      }
      objc_msgSend(WeakRetained, "interstitialProvider");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = self->_interstitialController;
      if (!v11 && v9)
      {
        objc_initWeak(&location, self);
        navigationItemsView = self->_navigationItemsView;
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __72__PKNavigationDashboardAnimatedTransitioningHandler__cancelPresentation__block_invoke;
        v23 = &unk_1E3E68738;
        objc_copyWeak(&v24, &location);
        v13 = +[PKPGSVTransitionInterstitialController createInView:withProvider:containerAlpha:deactivationHandler:](PKPGSVTransitionInterstitialController, "createInView:withProvider:containerAlpha:deactivationHandler:", navigationItemsView, v10, &v20, 1.0);
        v14 = self->_interstitialController;
        self->_interstitialController = v13;

        if (self->_interstitialController)
          objc_msgSend(WeakRetained, "interstitialControllerAvailable:", v20, v21, v22, v23);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
        v11 = self->_interstitialController;
      }
      if (v11)
        objc_msgSend(v6, "interstitialControllerAvailable:");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "groupViewWillBeAvailable:", v5);

    }
    alphaPropertyAnimator = self->_alphaPropertyAnimator;
    if (alphaPropertyAnimator)
    {
      -[UIViewPropertyAnimator fractionComplete](alphaPropertyAnimator, "fractionComplete");
      v17 = v16;
      -[UIViewPropertyAnimator pauseAnimation](self->_alphaPropertyAnimator, "pauseAnimation");
      -[UIViewPropertyAnimator setReversed:](self->_alphaPropertyAnimator, "setReversed:", 1);
      v18 = fmin(v17 * (self->_duration + -0.13), 0.3) / (self->_duration + -0.13);
      v19 = objc_alloc_init(PKDashboardPresentationTimingCurveProvider);
      -[PKDashboardPresentationTimingCurveProvider setType:](v19, "setType:", 1);
      -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self->_alphaPropertyAnimator, "continueAnimationWithTimingParameters:durationFactor:", v19, v18);

    }
    else
    {
      -[PKNavigationDashboardAnimatedTransitioningHandler _completeCancelledPresentation](self, "_completeCancelledPresentation");
    }

  }
}

void __72__PKNavigationDashboardAnimatedTransitioningHandler__cancelPresentation__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 12) == v5)
  {
    *((_QWORD *)WeakRetained + 12) = 0;

  }
}

- (void)_completePresentation
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  if (!self->_completed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
    v3 = objc_loadWeakRetained((id *)&self->_presentedVC);
    v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    objc_msgSend(v3, "dashboardVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passGroupView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertGroupView");
    objc_msgSend(v7, "setNeedsLayout");
    objc_msgSend(v6, "setScrollEnabled:", 1);
    objc_msgSend(v4, "setOpaque:", 1);
    objc_msgSend(WeakRetained, "removeFromSuperview");
    -[UIViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", 1);

  }
}

- (void)_completeCancelledPresentation
{
  id v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  v3 = objc_loadWeakRetained((id *)&self->_presentedVC);
  v4 = objc_loadWeakRetained((id *)&self->_presentedView);
  objc_msgSend(WeakRetained, "removeFromSuperview");
  objc_msgSend(v4, "setOpaque:", 1);
  objc_msgSend(v4, "removeFromSuperview");
  objc_msgSend(v3, "relinquishGroupView");
  -[UIViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", 0);

}

- (void)_dismiss
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  double v16;
  double v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  if (!self->_completed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dashboardVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passGroupView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke;
    aBlock[3] = &unk_1E3E68788;
    objc_copyWeak(&v27, &location);
    v10 = v8;
    v22 = v10;
    v11 = v5;
    v23 = v11;
    v12 = WeakRetained;
    v24 = v12;
    v13 = v6;
    v25 = v13;
    v14 = v4;
    v26 = v14;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKNavigationDashboardAnimatedTransitioningHandler _contentOffsetAnimationDurationForCollectionView:](self, "_contentOffsetAnimationDurationForCollectionView:", v7);
    v17 = v16;
    if (v16 <= 0.0)
    {
      v15[2](v15);
    }
    else
    {
      objc_msgSend(v12, "scrollToTop");
      v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_5;
      v19[3] = &unk_1E3E61590;
      v20 = v15;
      dispatch_after(v18, MEMORY[0x1E0C80D38], v19);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_moveGroupView:toView:belowView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), WeakRetained[5]);
    objc_msgSend(*(id *)(a1 + 48), "setPassGroupViewIsInCollectionView:", 0);
    v5 = (void *)v4[12];
    if (v5 && objc_msgSend(v5, "isInvalidated"))
    {
      v6 = (void *)v4[12];
      v4[12] = 0;

    }
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_2;
    aBlock[3] = &unk_1E3E68738;
    objc_copyWeak(&v23, v2);
    v8 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 48), "interstitialProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[12];
    if (v10)
    {
      objc_msgSend(v10, "transferToView:withDeactivationHandler:", v4[5], v8);
    }
    else if (v9)
    {
      v14 = +[PKPGSVTransitionInterstitialController createInView:withProvider:containerAlpha:deactivationHandler:](PKPGSVTransitionInterstitialController, "createInView:withProvider:containerAlpha:deactivationHandler:", v4[5], v9, v8, 1.0);
      v15 = (void *)v4[12];
      v4[12] = v14;

      if (v4[12])
        objc_msgSend(*(id *)(a1 + 48), "interstitialControllerAvailable:");
    }
    objc_msgSend(*(id *)(a1 + 48), "receiver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (v4[12])
        objc_msgSend(v11, "interstitialControllerAvailable:");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "groupViewWillBeAvailable:", *(_QWORD *)(a1 + 32));
    }
    if (*((_BYTE *)v4 + 81))
      objc_msgSend(*(id *)(a1 + 56), "shouldPresentAllContent:animated:", 0, 1);
    objc_msgSend(*(id *)(a1 + 64), "setOpaque:", 0);
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_3;
    v20[3] = &unk_1E3E612E8;
    v21 = *(id *)(a1 + 64);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_4;
    v16[3] = &unk_1E3E63B10;
    objc_copyWeak(&v19, v2);
    v17 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 131076, v20, v16, 0.3, 0.0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
  }

}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (id)WeakRetained[12] == v5)
  {
    if (*((_BYTE *)WeakRetained + 65))
    {
      objc_msgSend(v5, "invalidate");
      v4 = (void *)WeakRetained[12];
      WeakRetained[12] = 0;

    }
  }
  else
  {
    objc_msgSend(v5, "invalidate");
  }

}

uint64_t __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_4(id *a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[4], "setOpaque:", 1);
    objc_msgSend(a1[5], "relinquishGroupView");
    objc_msgSend(WeakRetained[6], "completeTransition:", *((_BYTE *)WeakRetained + 80) == 0);
  }

}

uint64_t __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)_contentOffsetAnimationDurationForCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  double result;

  v4 = a3;
  objc_msgSend(v4, "adjustedContentInset");
  v6 = v5;
  objc_msgSend(v4, "contentOffset");
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
  objc_msgSend(WeakRetained, "topMargin");
  v11 = v10 - v6;

  result = 0.3;
  if (v8 <= v11)
    return 0.0;
  return result;
}

- (void)_moveGroupView:(id)a3 toView:(id)a4 belowView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v10, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v10, "center");
    objc_msgSend(v9, "convertPoint:toView:", v7);
    objc_msgSend(v10, "setCenter:");
  }
  if (v8)
    objc_msgSend(v7, "insertSubview:belowSubview:", v10, v8);
  else
    objc_msgSend(v7, "addSubview:", v10);

}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (PKPGSVTransitionInterstitialController)interstitialController
{
  return self->_interstitialController;
}

- (void)setInterstitialController:(id)a3
{
  objc_storeStrong((id *)&self->_interstitialController, a3);
}

- (BOOL)wasDragged
{
  return self->_dragged;
}

- (void)setDragged:(BOOL)a3
{
  self->_dragged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interstitialController, 0);
  objc_storeStrong((id *)&self->_alphaPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_navigationItemsView, 0);
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_destroyWeak((id *)&self->_presentingVC);
}

@end
