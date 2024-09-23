@implementation _UIClickPresentationAssistant

- (_UIClickPresentationAssistant)initWithClickPresentation:(id)a3
{
  id v4;
  _UIClickPresentationAssistant *v5;
  _UIClickPresentationAssistant *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIClickPresentationAssistant;
  v5 = -[_UIClickPresentationAssistant init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIClickPresentationAssistant setPresentation:](v5, "setPresentation:", v4);
    v6->_currentState = 1;
  }

  return v6;
}

- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "_presentsSelf");

  if ((_DWORD)v10)
  {
    objc_msgSend(v14, "parentViewController");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  -[_UIClickPresentationAssistant _stashParentViewControllerIfNecessary](self, "_stashParentViewControllerIfNecessary");
  objc_msgSend(v14, "_setOverrideUseCustomPresentation:", 1);
  objc_msgSend(v14, "_setOverrideTransitioningDelegate:", self);
  -[_UIClickPresentationAssistant setSourcePreview:](self, "setSourcePreview:", v7);

  -[_UIClickPresentationAssistant setLifecycleCompletion:](self, "setLifecycleCompletion:", v6);
  objc_msgSend(v11, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  if (self->_currentState == 2)
  {
    handleEvent(stateMachineSpec_4, 2, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
  }
  else
  {
    -[_UIClickPresentationAssistant presentation](self, "presentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79___UIClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke;
    v9[3] = &unk_1E16B1BF8;
    v10 = v6;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

  }
}

- (void)_didTransitionToPresented
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appearanceTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIClickPresentationAssistant transitionCompletion](self, "transitionCompletion");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, uint64_t))v4)[2](v4, v5, 1);

  -[_UIClickPresentationAssistant setTransitionCompletion:](self, "setTransitionCompletion:", 0);
}

- (void)_didTransitionToDismissingFromState:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 3)
  {
    v3 = 0;
    goto LABEL_4;
  }
  if (a3 == 2)
  {
    v3 = 1;
LABEL_4:
    -[_UIClickPresentationAssistant _animateDismissalIsInterruption:](self, "_animateDismissalIsInterruption:", v3);
    return;
  }
  os_variant_has_internal_diagnostics();
}

- (void)_didTransitionToPossibleEndingTransition:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v3 = a3;
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "appearanceTransition");
  else
    objc_msgSend(v5, "disappearanceTransition");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIClickPresentationAssistant transitionCompletion](self, "transitionCompletion");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, BOOL))v7)[2](v7, v8, !v3);

  -[_UIClickPresentationAssistant setTransitionCompletion:](self, "setTransitionCompletion:", 0);
  -[_UIClickPresentationAssistant _postInteractionCleanup](self, "_postInteractionCleanup");

}

- (void)_animatePresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD aBlock[5];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;

  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appearanceTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIClickPresentationAssistant sourcePreview](self, "sourcePreview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourcePreview:", v5);

  }
  -[UIViewControllerContextTransitioning containerView](self->_currentContext, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning viewForKey:](self->_currentContext, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning viewForKey:](self->_currentContext, "viewForKey:", CFSTR("UITransitionContextToView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke;
    v34[3] = &unk_1E16B6F18;
    v34[4] = self;
    v35 = v7;
    v36 = v6;
    v37 = v4;
    v38 = v8;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v34);

  }
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customViewForTouchContinuation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v14, v12);

  }
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_2;
  aBlock[3] = &unk_1E16B6F18;
  aBlock[4] = self;
  v30 = v4;
  v31 = v7;
  v32 = v8;
  v33 = v6;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v18 = v4;
  v19 = _Block_copy(aBlock);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_3;
  v28[3] = &unk_1E16B1B28;
  v28[4] = self;
  v20 = _Block_copy(v28);
  -[_UIClickPresentationAssistant _createPropertyAnimatorIfNecessaryForTransition:isAppearing:](self, "_createPropertyAnimatorIfNecessaryForTransition:isAppearing:", v18, 1);
  -[_UIClickPresentationAssistant presentationAnimator](self, "presentationAnimator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_4;
  v26[3] = &unk_1E16B1BF8;
  v27 = v19;
  v22 = v19;
  objc_msgSend(v21, "addAnimations:", v26);
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_5;
  v24[3] = &unk_1E16C2BB8;
  v24[4] = self;
  v25 = v20;
  v23 = v20;
  objc_msgSend(v21, "addCompletion:", v24);
  objc_msgSend(v21, "startAnimation");

}

- (void)_animateDismissalIsInterruption:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  BOOL v34;
  _QWORD aBlock[5];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;

  v3 = a3;
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disappearanceTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIClickPresentationAssistant sourcePreview](self, "sourcePreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourcePreview:", v7);

  }
  -[UIViewControllerContextTransitioning containerView](self->_currentContext, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  -[UIViewControllerContextTransitioning viewForKey:](self->_currentContext, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning viewForKey:](self->_currentContext, "viewForKey:", CFSTR("UITransitionContextToView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[_UIClickPresentationAssistant presentation](self, "presentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appearanceTransition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "transitionWillReverse");

  }
  else
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke;
    v40[3] = &unk_1E16B6F18;
    v40[4] = self;
    v41 = v10;
    v42 = v8;
    v43 = v6;
    v44 = v9;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v40);

  }
  aBlock[0] = v12;
  aBlock[1] = 3221225472;
  aBlock[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_2;
  aBlock[3] = &unk_1E16B6F18;
  aBlock[4] = self;
  v15 = v6;
  v36 = v15;
  v16 = v9;
  v37 = v16;
  v17 = v11;
  v38 = v17;
  v18 = v8;
  v39 = v18;
  v19 = _Block_copy(aBlock);
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_3;
  v33[3] = &unk_1E16B1B78;
  v33[4] = self;
  v34 = v3;
  v20 = _Block_copy(v33);
  if (-[UIViewControllerContextTransitioning isAnimated](self->_currentContext, "isAnimated"))
  {
    -[_UIClickPresentationAssistant _createPropertyAnimatorIfNecessaryForTransition:isAppearing:](self, "_createPropertyAnimatorIfNecessaryForTransition:isAppearing:", v15, 0);
    -[_UIClickPresentationAssistant presentationAnimator](self, "presentationAnimator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v3)
    {
      objc_msgSend(v21, "pauseAnimation");
      objc_msgSend(v22, "_setCompletions:", 0);
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_4;
      v31[3] = &unk_1E16BDBD8;
      v23 = &v32;
      v32 = v20;
      objc_msgSend(v22, "addCompletion:", v31);
      objc_msgSend(v22, "setReversed:", 1);
      objc_msgSend(v22, "continueAnimation");
    }
    else
    {
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_5;
      v29[3] = &unk_1E16B1BF8;
      v23 = &v30;
      v30 = v19;
      objc_msgSend(v22, "addAnimations:", v29);
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_6;
      v27[3] = &unk_1E16BDBD8;
      v28 = v20;
      objc_msgSend(v22, "addCompletion:", v27);
      objc_msgSend(v22, "startAnimation");

    }
  }
  else
  {
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_7;
    v24[3] = &unk_1E16B6740;
    v25 = v19;
    v26 = v20;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);

    v22 = v25;
  }

}

- (void)_postInteractionCleanup
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  -[_UIClickPresentationAssistant setSourcePreview:](self, "setSourcePreview:", 0);
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setOverrideUseCustomPresentation:", 0);
  objc_msgSend(v5, "_setOverrideTransitioningDelegate:", 0);
  -[_UIClickPresentationAssistant lifecycleCompletion](self, "lifecycleCompletion");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationAssistant setLifecycleCompletion:](self, "setLifecycleCompletion:", 0);
  if (v4)
    v4[2](v4, 1);
  -[_UIClickPresentationAssistant _applyStashedParentViewControllerIfNecessary](self, "_applyStashedParentViewControllerIfNecessary");

}

- (void)_stashParentViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIClickPresentationAssistant setStashedParentViewController:](self, "setStashedParentViewController:", v5);

    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIClickPresentationAssistant setStashedSuperView:](self, "setStashedSuperView:", v7);

    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromParentViewController");
  }

}

- (void)_applyStashedParentViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  -[_UIClickPresentationAssistant stashedParentViewController](self, "stashedParentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIClickPresentationAssistant presentation](self, "presentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    aBlock[4] = self;
    v7 = v5;
    v13 = v7;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v7, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3;
      v10[3] = &unk_1E16B1CC8;
      v11 = v8;
      objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

    }
    else
    {
      v8[2](v8);
    }

  }
}

- (id)_sourcePreviewPortal
{
  void *v3;
  _UIPortalView *v4;
  void *v5;
  _UIPortalView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  -[_UIClickPresentationAssistant sourcePreview](self, "sourcePreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [_UIPortalView alloc];
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = -[_UIPortalView initWithFrame:](v4, "initWithFrame:");

  if (_AXSReduceMotionEnabled())
  {
    -[_UIPortalView setHidesSourceView:](v6, "setHidesSourceView:", 0);
  }
  else
  {
    -[_UIClickPresentationAssistant presentation](self, "presentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPortalView setHidesSourceView:](v6, "setHidesSourceView:", objc_msgSend(v7, "_presentsSelf") ^ 1);

  }
  -[_UIPortalView setAllowsBackdropGroups:](v6, "setAllowsBackdropGroups:", 1);
  -[_UIPortalView setMatchesAlpha:](v6, "setMatchesAlpha:", 1);
  objc_msgSend(v3, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView setSourceView:](v6, "setSourceView:", v8);

  objc_msgSend(v3, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "transform");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  -[UIView setTransform:](v6, "setTransform:", v12);

  -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UIPresentationController *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UIClickPresentationAssistant presentation](self, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationController");
  v12 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](v12, "_setContainerIgnoresDirectTouchEvents:", 0);
  -[_UIClickPresentationAssistant _sourcePreviewPortal](self, "_sourcePreviewPortal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationAssistant setPresentationSourcePortalView:](self, "setPresentationSourcePortalView:", v13);

  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v22[3] = &unk_1E16C4288;
  objc_copyWeak(&v23, &from);
  -[UIPresentationController set_containerSuperviewForCurrentTransition:](v12, "set_containerSuperviewForCurrentTransition:", v22);
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v19[3] = &unk_1E16DC3F8;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  -[UIPresentationController set_customFromViewForCurrentTransition:](v12, "set_customFromViewForCurrentTransition:", v19);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3;
  v16[3] = &unk_1E16DC3F8;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  -[UIPresentationController set_customToViewForCurrentTransition:](v12, "set_customToViewForCurrentTransition:", v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (double)transitionDuration:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_UIClickPresentationAssistant presentationAnimator](self, "presentationAnimator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.4;
  -[_UIClickPresentationAssistant presentationAnimator](self, "presentationAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v5;
  id v6;
  unint64_t currentState;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentContext, a3);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51___UIClickPresentationAssistant_animateTransition___block_invoke;
  v9[3] = &unk_1E16DC420;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v10 = v6;
  -[_UIClickPresentationAssistant setTransitionCompletion:](self, "setTransitionCompletion:", v9);
  currentState = self->_currentState;
  if (currentState == 3)
  {
    v8 = 2;
    goto LABEL_5;
  }
  if (currentState == 1)
  {
    v8 = 0;
LABEL_5:
    handleEvent(stateMachineSpec_4, currentState, v8, (uint64_t)self, (uint64_t *)&self->_currentState);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_createPropertyAnimatorIfNecessaryForTransition:(id)a3 isAppearing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *presentationAnimator;
  UIViewPropertyAnimator *v9;
  double v10;
  double v11;
  UIViewPropertyAnimator *v12;
  UIViewPropertyAnimator *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (!self->_presentationAnimator)
  {
    v14 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "customAnimator");
      v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
      presentationAnimator = self->_presentationAnimator;
      self->_presentationAnimator = v7;

    }
    v9 = self->_presentationAnimator;
    if (!v9)
    {
      if (v4)
        v10 = 0.4;
      else
        v10 = 0.35;
      if (v4)
        v11 = 0.85;
      else
        v11 = 1.0;
      v12 = -[UIViewPropertyAnimator initWithDuration:dampingRatio:animations:]([UIViewPropertyAnimator alloc], "initWithDuration:dampingRatio:animations:", 0, v10, v11);
      v13 = self->_presentationAnimator;
      self->_presentationAnimator = v12;

      v9 = self->_presentationAnimator;
    }
    -[UIViewPropertyAnimator _setShouldLayoutSubviews:](v9, "_setShouldLayoutSubviews:", 0);
    v6 = v14;
  }

}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (_UIClickPresentation)presentation
{
  return self->presentation;
}

- (void)setPresentation:(id)a3
{
  objc_storeStrong((id *)&self->presentation, a3);
}

- (id)lifecycleCompletion
{
  return self->lifecycleCompletion;
}

- (void)setLifecycleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)keyboardAssertionInvalidationHandler
{
  return self->keyboardAssertionInvalidationHandler;
}

- (void)setKeyboardAssertionInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_UIPortalView)presentationSourcePortalView
{
  return self->_presentationSourcePortalView;
}

- (void)setPresentationSourcePortalView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSourcePortalView, a3);
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (UIViewController)stashedParentViewController
{
  return self->_stashedParentViewController;
}

- (void)setStashedParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stashedParentViewController, a3);
}

- (UIView)stashedSuperView
{
  return self->_stashedSuperView;
}

- (void)setStashedSuperView:(id)a3
{
  objc_storeStrong((id *)&self->_stashedSuperView, a3);
}

- (id)transitionCompletion
{
  return self->_transitionCompletion;
}

- (void)setTransitionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionCompletion, 0);
  objc_storeStrong((id *)&self->_stashedSuperView, 0);
  objc_storeStrong((id *)&self->_stashedParentViewController, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong(&self->keyboardAssertionInvalidationHandler, 0);
  objc_storeStrong(&self->lifecycleCompletion, 0);
  objc_storeStrong((id *)&self->presentation, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
}

@end
