@implementation _UIPreviewTransitionController

- (_UIPreviewTransitionController)initWithInteractionProgress:(id)a3 targetPresentationPhase:(unint64_t)a4
{
  id v7;
  _UIPreviewTransitionController *v8;
  void *v9;
  void *v10;
  _UIPreviewTransitionController *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIPreviewTransitionController;
  v8 = -[UIPercentDrivenInteractiveTransition init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewTransitionController setAnimationsByPresentationPhase:](v8, "setAnimationsByPresentationPhase:", v9);

    objc_msgSend(v7, "addProgressObserver:", v8);
    -[_UIPreviewTransitionController setInteractionProgress:](v8, "setInteractionProgress:", v7);
    -[_UIPreviewTransitionController setTargetPresentationPhase:](v8, "setTargetPresentationPhase:", a4);
    if (a4 > 5 || ((1 << a4) & 0x34) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("_UIPreviewTransitionController.m"), 58, CFSTR("The targetPresentationPhase needs to be Preview, Commit or Cancelled."));

    }
    v11 = v8;
  }

  return v8;
}

- (void)setAnimations:(id)a3 completion:(id)a4 forPresentationPhase:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id aBlock;

  aBlock = a4;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _Block_copy(v9);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("animations"));
  if (aBlock)
  {
    v12 = _Block_copy(aBlock);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("completion"));

  }
  -[_UIPreviewTransitionController animationsByPresentationPhase](self, "animationsByPresentationPhase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v14);

}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UIPreviewTransitionController setTransitionContext:](self, "setTransitionContext:");
  if (-[_UIPreviewTransitionController targetPresentationPhase](self, "targetPresentationPhase") == 2)
  {
    -[_UIPreviewTransitionController interactionProgress](self, "interactionProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIPreviewTransitionController _animateRevealTransition:](self, "_animateRevealTransition:", v5);
    }
    else
    {
      -[_UIPreviewTransitionController _layoutForPresentationPhase:](self, "_layoutForPresentationPhase:", 1);
      objc_msgSend(v5, "completeTransition:", 1);
      -[_UIPreviewTransitionController _completeAnimationWithPresentationPhase:finished:](self, "_completeAnimationWithPresentationPhase:finished:", 1, 1);
    }
  }
  else if (-[_UIPreviewTransitionController targetPresentationPhase](self, "targetPresentationPhase") == 4)
  {
    -[_UIPreviewTransitionController _animateCommitTransition:](self, "_animateCommitTransition:", v5);
  }
  else
  {
    -[_UIPreviewTransitionController _animateDismissTransition:](self, "_animateDismissTransition:", v5);
  }

}

- (void)startInteractiveTransition:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPreviewTransitionController;
  v4 = a3;
  -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](&v5, sel_startInteractiveTransition_, v4);
  -[_UIPreviewTransitionController setTransitionContext:](self, "setTransitionContext:", v4, v5.receiver, v5.super_class);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[UIInteractionProgress didEnd](self->_interactionProgress, "didEnd"))
      -[_UIPreviewTransitionController finishInteractiveTransition](self, "finishInteractiveTransition");
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionController;
  -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](&v3, sel_updateInteractiveTransition_, a3);
}

- (void)cancelInteractiveTransition
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewTransitionController;
  -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](&v2, sel_cancelInteractiveTransition);
}

- (void)finishInteractiveTransition
{
  objc_super v3;

  -[UIPercentDrivenInteractiveTransition setCompletionSpeed:](self, "setCompletionSpeed:", 10.0);
  -[UIPercentDrivenInteractiveTransition setCompletionCurve:](self, "setCompletionCurve:", 3);
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionController;
  -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](&v3, sel_finishInteractiveTransition);
}

- (void)animationEnded:(BOOL)a3
{
  id v4;

  if (a3 && -[_UIPreviewTransitionController targetPresentationPhase](self, "targetPresentationPhase") == 2)
  {
    -[_UIPreviewTransitionController transitionContext](self, "transitionContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewTransitionController _animatePreviewTransition:](self, "_animatePreviewTransition:", v4);

  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  double v4;
  double v5;
  id v6;

  objc_msgSend(a3, "percentComplete");
  if (v4 > 1.0)
    v4 = 1.0;
  v5 = fmax(v4, 0.0);
  -[_UIPreviewTransitionController updateInteractiveTransition:](self, "updateInteractiveTransition:", v5);
  -[_UIPreviewTransitionController feedbackGenerator](self, "feedbackGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionToState:updated:", CFSTR("preview"), v5);

}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[_UIPreviewTransitionController transitionContext](self, "transitionContext", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInteractive") & 1) != 0)
  {
    -[_UIPreviewTransitionController transitionContext](self, "transitionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "transitionWasCancelled");

    if ((v7 & 1) == 0)
    {
      if (v4)
        -[_UIPreviewTransitionController finishInteractiveTransition](self, "finishInteractiveTransition");
      else
        -[_UIPreviewTransitionController cancelInteractiveTransition](self, "cancelInteractiveTransition");
    }
  }
  else
  {

  }
}

- (void)_animateRevealTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  -[_UIPreviewTransitionController transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59___UIPreviewTransitionController__animateRevealTransition___block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___UIPreviewTransitionController__animateRevealTransition___block_invoke_2;
  v8[3] = &unk_1E16B2218;
  v8[4] = self;
  v7 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v10, v8, v6, 0.0);

}

- (void)_animatePreviewTransition:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke_2;
  v8[3] = &unk_1E16B3FD8;
  v8[4] = self;
  v6 = _Block_copy(v8);
  if (_AXSReduceMotionEnabled())
  {
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v5, v6, 0.2, 0.0);
  }
  else
  {
    objc_opt_self();
    _durationOfSpringAnimation(2.0, 1500.0, 93.0, 0.0);
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v5, v6);
  }
  -[_UIPreviewTransitionController feedbackGenerator](self, "feedbackGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionToState:ended:", CFSTR("preview"), 1);

}

- (void)_animateDismissTransition:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIPreviewTransitionController__animateDismissTransition___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60___UIPreviewTransitionController__animateDismissTransition___block_invoke_2;
  v9[3] = &unk_1E16B2218;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  v8 = _Block_copy(v9);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v8, 0.25);

}

- (void)_animateCommitTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _UIBackdropView *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UIView *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _UIBackdropView *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  _UIBackdropView *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  UIView *v54;
  _UIBackdropView *v55;
  _UIBackdropView *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  _UIBackdropView *v78;
  _UIPreviewTransitionController *v79;
  void *v80;
  _QWORD v81[4];
  _UIBackdropView *v82;
  _UIBackdropView *v83;
  UIView *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _UIPreviewTransitionController *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD aBlock[4];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  _UIBackdropView *v106;

  v4 = a3;
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextToView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = self;
  -[_UIPreviewTransitionController viewsParticipatingInCommitTransition](self, "viewsParticipatingInCommitTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("backgroundView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentationContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentationContainerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "platterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentationView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();
  if (objc_msgSend(v5, "_isNestedNavigationController"))
    v14 = v5;
  else
    v14 = v6;
  v15 = v14;
  objc_msgSend(v6, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v15;
  objc_msgSend(v15, "toolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v5);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v64 = v4;
  objc_msgSend(v4, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v9);
  v76 = v17;
  objc_msgSend(v26, "addSubview:", v17);
  v74 = v16;
  objc_msgSend(v26, "addSubview:", v16);
  v27 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", -4);
  -[_UIBackdropView setGroupName:](v27, "setGroupName:", CFSTR("commitAnimation"));
  objc_msgSend(v26, "bounds");
  -[UIView setFrame:](v27, "setFrame:");
  v78 = v27;
  objc_msgSend(v26, "addSubview:", v27);
  objc_msgSend(v26, "addSubview:", v8);
  objc_msgSend(v26, "window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "statusBarHeight");
  v31 = v30;

  v32 = 0.0;
  v33 = 0.0;
  if ((objc_msgSend(v6, "isNavigationBarHidden") & 1) == 0)
  {
    objc_msgSend(v74, "bounds");
    v33 = v34;
  }
  if ((objc_msgSend(v80, "isToolbarHidden") & 1) == 0)
  {
    objc_msgSend(v76, "bounds");
    v32 = v35;
  }
  if ((v13 & 1) != 0)
    v36 = 30.0;
  else
    v36 = 60.0;
  v37 = v31 + v33;
  v38 = objc_alloc_init(UIView);
  objc_msgSend(v26, "bounds");
  v40 = v39;
  objc_msgSend(v26, "bounds");
  -[UIView setBounds:](v38, "setBounds:", 0.0, v37, v40);
  objc_msgSend(v26, "bounds");
  v42 = v41;
  objc_msgSend(v26, "bounds");
  -[UIView setFrame:](v38, "setFrame:", 0.0, v37, v42, v43 - v37 - v32);
  -[UIView setClipsToBounds:](v38, "setClipsToBounds:", 1);
  v44 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", -4);
  -[_UIBackdropView setGroupName:](v44, "setGroupName:", CFSTR("commitAnimation"));
  -[UIView addSubview:](v38, "addSubview:", v44);
  objc_msgSend(v26, "addSubview:", v38);
  objc_msgSend(v11, "addSubview:", v12);
  objc_msgSend(v12, "addSubview:", v68);
  objc_msgSend(v9, "setNeedsLayout");
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v68, "frame");
  -[UIView convertRect:fromView:](v38, "convertRect:fromView:", v12);
  -[UIView setFrame:](v44, "setFrame:");
  v60 = v12;
  v45 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIPreviewTransitionController__animateCommitTransition___block_invoke;
  aBlock[3] = &unk_1E16B2AF0;
  v100 = v6;
  v101 = v5;
  v46 = v9;
  v102 = v46;
  v47 = v8;
  v103 = v47;
  v48 = v68;
  v104 = v48;
  v105 = v11;
  v49 = v44;
  v106 = v49;
  v63 = v11;
  v70 = v5;
  v69 = v6;
  v59 = _Block_copy(aBlock);
  v81[0] = v45;
  v81[1] = 3221225472;
  v81[2] = __59___UIPreviewTransitionController__animateCommitTransition___block_invoke_2;
  v81[3] = &unk_1E16DAC60;
  v82 = v78;
  v83 = v49;
  v84 = v38;
  v85 = v47;
  v86 = v46;
  v87 = v26;
  v95 = v19;
  v96 = v21;
  v97 = v23;
  v98 = v25;
  v88 = v48;
  v89 = v66;
  v90 = v76;
  v91 = v61;
  v92 = v74;
  v93 = v79;
  v94 = v64;
  v65 = v64;
  v75 = v74;
  v62 = v61;
  v77 = v76;
  v50 = v66;
  v67 = v48;
  v51 = v26;
  v52 = v46;
  v53 = v47;
  v54 = v38;
  v55 = v49;
  v56 = v78;
  v57 = _Block_copy(v81);
  +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v59, v57, 0.0, v36);
  -[_UIPreviewTransitionController feedbackGenerator](v79, "feedbackGenerator");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "transitionToState:ended:", CFSTR("commit"), 1);

}

- (void)_layoutForPresentationPhase:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[_UIPreviewTransitionController animationsByPresentationPhase](self, "animationsByPresentationPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("animations"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

- (void)_completeAnimationWithPresentationPhase:(unint64_t)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  __CFString **v10;
  void *v11;
  id v12;

  v4 = a4;
  -[_UIPreviewTransitionController animationsByPresentationPhase](self, "animationsByPresentationPhase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("completion"));
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (a3 == 1 && !v4)
  {
    v10 = _UIStatesFeedbackGeneratorForcePresentationStatePreview;
LABEL_7:
    -[_UIPreviewTransitionController feedbackGenerator](self, "feedbackGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionToState:ended:", *v10, 0);

    goto LABEL_8;
  }
  if (a3 == 5 && v4)
  {
    v10 = _UIStatesFeedbackGeneratorForcePresentationStateCommit;
    goto LABEL_7;
  }
LABEL_8:
  if (v9)
    v9[2](v9, v4);

}

+ (id)performCommitTransitionWithDelegate:(id)a3 forViewController:(id)a4 previewViewController:(id)a5 previewInteractionController:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _UIPreviewInteractionCommitTransition *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v11, "previewInteractionControllerShouldPerformCompatibilityCommitTransition:", v14))
  {
    v27 = -[_UIPreviewInteractionCommitTransition initWithPresentedViewController:]([_UIPreviewInteractionCommitTransition alloc], "initWithPresentedViewController:", v13);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_4;
    v29[3] = &unk_1E16B47A8;
    v30 = v11;
    v31 = v14;
    v32 = v13;
    -[_UIPreviewInteractionCommitTransition performTransitionWithPresentationBlock:completion:](v27, "performTransitionWithPresentationBlock:completion:", v29, v15);

    v18 = v30;
    v17 = v15;
  }
  else
  {
    if (v15)
      v16 = v15;
    else
      v16 = &__block_literal_global_420;
    v17 = _Block_copy(v16);

    v18 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v18, "performsCustomCommitTransitionForPreviewInteractionController:", v14))
    {
      objc_msgSend(v18, "previewInteractionController:performCustomCommitForPreviewViewController:completion:", v14, v13, v17);
    }
    else if (objc_msgSend(v18, "performsViewControllerCommitTransitionForPreviewInteractionController:", v14))
    {
      v19 = v13;
      v20 = v19;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v18, "previewInteractionController:committedViewControllerForPreviewViewController:", v14, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2;
      v46[3] = &unk_1E16B51E8;
      v47 = v19;
      v18 = v18;
      v48 = v18;
      v49 = v14;
      v50 = v20;
      v21 = v20;
      objc_msgSend(v47, "_transitionToViewController:whilePerforming:completion:", v21, v46, v17);

    }
    else
    {
      v22 = objc_opt_class();
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__152;
      v44 = __Block_byref_object_dispose__152;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v12;
      else
        v23 = 0;
      v45 = v23;
      v24 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_41;
      v39[3] = &unk_1E16DAC88;
      v39[4] = &v40;
      v39[5] = v22;
      objc_msgSend(v12, "_traverseViewControllerHierarchyFromLevel:withBlock:", 0, v39);
      v25 = v41[5];
      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Could not find a UINavigationController instance to perform a default commit transition. Please perform a custom view controller hierarchy transition in -commitPreviewViewController:committedViewController: on UIViewControllerPreviewingDelegate."));
        v25 = v41[5];
      }
      v35[0] = v24;
      v35[1] = 3221225472;
      v35[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2_46;
      v35[3] = &unk_1E16DACB0;
      v36 = v13;
      v18 = v18;
      v37 = v18;
      v38 = v14;
      objc_msgSend(v36, "_transitionToNavigationViewController:withWrapper:", v25, v35);
      objc_msgSend((id)v41[5], "transitionCoordinator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v24;
      v33[1] = 3221225472;
      v33[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3_48;
      v33[3] = &unk_1E16B1CC8;
      v17 = v17;
      v34 = v17;
      objc_msgSend(v26, "animateAlongsideTransitionInView:animation:completion:", 0, 0, v33);

      _Block_object_dispose(&v40, 8);
    }
    v27 = 0;
  }

  return v27;
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void)setInteractionProgress:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgress, a3);
}

- (unint64_t)targetPresentationPhase
{
  return self->_targetPresentationPhase;
}

- (void)setTargetPresentationPhase:(unint64_t)a3
{
  self->_targetPresentationPhase = a3;
}

- (NSDictionary)viewsParticipatingInCommitTransition
{
  return self->_viewsParticipatingInCommitTransition;
}

- (void)setViewsParticipatingInCommitTransition:(id)a3
{
  objc_storeStrong((id *)&self->_viewsParticipatingInCommitTransition, a3);
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (NSMutableDictionary)animationsByPresentationPhase
{
  return self->_animationsByPresentationPhase;
}

- (void)setAnimationsByPresentationPhase:(id)a3
{
  objc_storeStrong((id *)&self->_animationsByPresentationPhase, a3);
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return (UIViewControllerContextTransitioning *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (void)setTransitionContext:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_animationsByPresentationPhase, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_viewsParticipatingInCommitTransition, 0);
  objc_storeStrong((id *)&self->_interactionProgress, 0);
}

@end
