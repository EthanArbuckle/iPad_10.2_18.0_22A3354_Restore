@implementation _UIPreviewPresentationController

- (_UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UIPreviewPresentationController *v4;
  _UIPreviewPresentationController *v5;
  _UIVelocityIntegrator *v6;
  _UIPreviewPresentationController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewPresentationController;
  v4 = -[UIPreviewPresentationController initWithPresentedViewController:presentingViewController:](&v9, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPresentationController setSourceRect:](v4, "setSourceRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UIPreviewPresentationController setCurrentPresentationPhase:](v5, "setCurrentPresentationPhase:", 0);
    v6 = objc_alloc_init(_UIVelocityIntegrator);
    -[_UIPreviewPresentationController setRevealPanningVelocityIntegrator:](v5, "setRevealPanningVelocityIntegrator:", v6);

    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPreviewPresentationController setPanningGestureRecognizer:](self, "setPanningGestureRecognizer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController;
  -[UIPresentationController dealloc](&v3, sel_dealloc);
}

- (double)presentationViewCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setPresentationViewCornerRadius:(double)a3
{
  id v4;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_UIPreviewPresentationController;
  -[UIPreviewPresentationController _presentationTransitionWillBeginForContainerEffectView:](&v25, sel__presentationTransitionWillBeginForContainerEffectView_, a3);
  -[_UIPreviewPresentationController _preferredSourceViewRect](self, "_preferredSourceViewRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIPreviewPresentationController _updateRevealContainerViewForSourceRect:](self, "_updateRevealContainerViewForSourceRect:");
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[UIPresentationController sourceView](self, "sourceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v15, v5, v7, v9, v11);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *v6;
  double v7;
  double v8;
  _UIPreviewPresentationContainerView *v9;
  _UIPreviewPresentationContainerView *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_UIPreviewPresentationController;
  -[UIPreviewPresentationController presentationTransitionWillBegin](&v32, sel_presentationTransitionWillBegin);
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [UIScrollView alloc];
  objc_msgSend(v4, "bounds");
  v6 = -[UIScrollView initWithFrame:](v5, "initWithFrame:");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setScrollEnabled:](v6, "setScrollEnabled:", 0);
  objc_msgSend(v4, "bounds");
  -[UIScrollView setContentSize:](v6, "setContentSize:", v7, v8);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v4, "addSubview:", v6);
  -[_UIPreviewPresentationController setContainerScrollView:](self, "setContainerScrollView:", v6);
  v9 = [_UIPreviewPresentationContainerView alloc];
  objc_msgSend(v4, "bounds");
  v10 = -[_UIPreviewPresentationContainerView initWithFrame:](v9, "initWithFrame:");
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationContainerView setContentView:](v10, "setContentView:", v12);

  -[UIView setHidden:](v10, "setHidden:", 1);
  -[_UIPreviewPresentationController setPresentationContainerView:](self, "setPresentationContainerView:", v10);
  -[UIView addSubview:](v6, "addSubview:", v10);
  v13 = [UIView alloc];
  objc_msgSend(v4, "bounds");
  v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v14);
  -[_UIPreviewPresentationController setActionSheetContainerView:](self, "setActionSheetContainerView:", v14);
  _NSDictionaryOfVariableBindings(CFSTR("containerScrollView,actionSheetContainerView"), v6, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v6, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController setContainerScrollViewXConstraint:](self, "setContainerScrollViewXConstraint:", v18);

  -[UIView widthAnchor](v6, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[_UIPreviewPresentationController containerScrollViewXConstraint](self, "containerScrollViewXConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[containerScrollView]|"), 0, 0, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v24);

  v25 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[actionSheetContainerView]|"), 0, 0, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

  v27 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[actionSheetContainerView]|"), 0, 0, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v28);

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationContainerView setContentView:](v10, "setContentView:", v30);

  -[UIView setHidden:](v10, "setHidden:", 1);
  -[_UIPreviewPresentationController setPresentationContainerView:](self, "setPresentationContainerView:", v10);
  -[UIView addSubview:](v6, "addSubview:", v10);
  -[_UIPreviewPresentationController forcePresentationControllerDelegate](self, "forcePresentationControllerDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v31, "forcePresentationTransitionWillBegin:", self);
  -[_UIPreviewPresentationController _unhighlightPreviewCellSnapshotViewsIfNeeded](self, "_unhighlightPreviewCellSnapshotViewsIfNeeded");

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController;
  -[UIPreviewPresentationController presentationTransitionDidEnd:](&v4, sel_presentationTransitionDidEnd_, a3);
  -[_UIPreviewPresentationController _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded](self, "_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded");
}

- (void)dismissalTransitionWillBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController;
  -[UIPreviewPresentationController dismissalTransitionWillBegin](&v3, sel_dismissalTransitionWillBegin);
  -[_UIPreviewPresentationController _hideQuickActions](self, "_hideQuickActions");
  -[_UIPreviewPresentationController _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded](self, "_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded");
  -[_UIPreviewPresentationController _endBreathing](self, "_endBreathing");
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController;
  -[UIPreviewPresentationController dismissalTransitionDidEnd:](&v4, sel_dismissalTransitionDidEnd_, a3);
  -[_UIPreviewPresentationController _triggerQuickActionHandlerIfNeeded](self, "_triggerQuickActionHandlerIfNeeded");
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  -[UIPresentationController containerViewWillLayoutSubviews](&v6, sel_containerViewWillLayoutSubviews);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  objc_msgSend(v3, "setPreferredContentSize:");

  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (id)_viewsParticipatingInNavigationControllerTransition
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_animatorForContainmentTransition
{
  _UIPreviewTransitionController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = -[_UIPreviewTransitionController initWithInteractionProgress:targetPresentationPhase:]([_UIPreviewTransitionController alloc], "initWithInteractionProgress:targetPresentationPhase:", 0, 4);
  v11[0] = CFSTR("backgroundView");
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("containerView");
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("presentationContainerView");
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("presentationView");
  -[UIPresentationController _presentationView](self, "_presentationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewTransitionController setViewsParticipatingInCommitTransition:](v3, "setViewsParticipatingInCommitTransition:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69___UIPreviewPresentationController__animatorForContainmentTransition__block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  -[_UIPreviewTransitionController setAnimations:completion:forPresentationPhase:](v3, "setAnimations:completion:forPresentationPhase:", v10, 0, 4);
  return v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  -[UIPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v6, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSize");
  objc_msgSend(v4, "setPreferredContentSize:");

  objc_msgSend(v4, "setNeedsLayout");
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  -[UIPresentationController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v6, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, a3);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSize");
  objc_msgSend(v4, "setPreferredContentSize:");

  objc_msgSend(v4, "setNeedsLayout");
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[_UIPreviewPresentationController interactionProgressForCommit](self, "interactionProgressForCommit");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (!-[_UIPreviewPresentationController hasAskedForCommitInternally](self, "hasAskedForCommitInternally"))
    {
      objc_msgSend(v4, "percentComplete");
      if (v7 >= 1.0)
      {
        if (-[_UIPreviewPresentationController _canCommitPresentation](self, "_canCommitPresentation"))
          -[_UIPreviewPresentationController _invokeCommitHandlerFromInteractionProgress](self, "_invokeCommitHandlerFromInteractionProgress");
      }
    }
  }
  else
  {
    -[_UIPreviewPresentationController interactionProgressForBreathing](self, "interactionProgressForBreathing");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65___UIPreviewPresentationController_interactionProgressDidUpdate___block_invoke;
      v8[3] = &unk_1E16B1B50;
      v8[4] = self;
      v9 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    }
    else
    {
      objc_msgSend(v4, "percentComplete");
      -[_UIPreviewPresentationController _layoutForPreviewInteractionProgress:](self, "_layoutForPreviewInteractionProgress:");
    }
  }

}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[_UIPreviewPresentationController interactionProgressForCommit](self, "interactionProgressForCommit");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6
    && !-[_UIPreviewPresentationController hasAskedForCommitInternally](self, "hasAskedForCommitInternally")
    && v4)
  {
    if (-[_UIPreviewPresentationController _canCommitPresentation](self, "_canCommitPresentation"))
      -[_UIPreviewPresentationController _invokeCommitHandlerFromInteractionProgress](self, "_invokeCommitHandlerFromInteractionProgress");
  }
}

- (void)_beginBreathing
{
  self->_breathing = 1;
}

- (void)_endBreathing
{
  self->_breathing = 0;
  -[_UIPreviewPresentationController _updateBreathingTransformWithProgress:animated:](self, "_updateBreathingTransformWithProgress:animated:", 0, 0.0);
}

- (void)_updateBreathingTransformWithProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CATransform3D v35;
  CGAffineTransform m;
  CATransform3D v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CATransform3D v42;
  CGAffineTransform v43;
  CATransform3D v44;
  _OWORD v45[8];
  CATransform3D v46;
  CGAffineTransform v47;

  v4 = a4;
  if (-[_UIPreviewPresentationController isBreathing](self, "isBreathing"))
  {
    -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "sublayerTransform");
    else
      memset(&v46, 0, sizeof(v46));
    CATransform3DGetAffineTransform(&v47, &v46);
    v9 = v47.a + v47.c;
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentVelocity");
    v12 = v11;

    v13 = 1.0;
    v14 = 0.0;
    if (-[_UIPreviewPresentationController _canCommitPresentation](self, "_canCommitPresentation"))
    {
      v15 = -v12;
      if (v12 >= 0.0)
        v15 = v12;
      if (v15 < 50.0)
      {
        v16 = fmin(fmax(a3, 0.0), 1.0);
        v13 = 1.0 - v16 + v16 * 1.05;
        v14 = v16 * 10.0 + (1.0 - v16) * 0.0;
      }
    }
    if (v13 != v9)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("sublayerTransform"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDuration:", 0.1);
        objc_msgSend(v18, "setTimingFunction:", v17);
        v19 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v8, "presentationLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          objc_msgSend(v20, "sublayerTransform");
        else
          memset(v45, 0, sizeof(v45));
        objc_msgSend(v19, "valueWithCATransform3D:", v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFromValue:", v22);

        v23 = (void *)MEMORY[0x1E0CB3B18];
        CGAffineTransformMakeScale(&v43, v13, v13);
        CATransform3DMakeAffineTransform(&v44, &v43);
        objc_msgSend(v23, "valueWithCATransform3D:", &v44);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setToValue:", v24);

        objc_msgSend(v8, "addAnimation:forKey:", v18, CFSTR("com.apple.breathing"));
        v25 = (void *)MEMORY[0x1E0CB3B18];
        CGAffineTransformMakeScale(&v41, v13, v13);
        CATransform3DMakeAffineTransform(&v42, &v41);
        objc_msgSend(v25, "valueWithCATransform3D:", &v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v26, CFSTR("sublayerTransform"));

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "setDuration:", 0.1);
        objc_msgSend(v27, "setTimingFunction:", v17);
        v28 = (void *)MEMORY[0x1E0CB3B18];
        CGAffineTransformMakeTranslation(&v40, 0.0, -v14);
        objc_msgSend(v28, "valueWithCGAffineTransform:", &v40);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setToValue:", v29);

        -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAnimation:forKey:", v27, CFSTR("com.apple.breathing.arrow"));

        CGAffineTransformMakeTranslation(&v39, 0.0, -v14);
        -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v39;
        objc_msgSend(v32, "setTransform:", &v38);

      }
      else
      {
        CGAffineTransformMakeScale(&m, v13, v13);
        CATransform3DMakeAffineTransform(&v37, &m);
        v35 = v37;
        objc_msgSend(v8, "setSublayerTransform:", &v35);
        CGAffineTransformMakeTranslation(&v34, 0.0, -v14);
        -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v34;
        objc_msgSend(v17, "setTransform:", &v33);
      }

    }
  }
}

- (NSArray)previewActionItems
{
  NSArray *previewActionItems;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  previewActionItems = self->_previewActionItems;
  if (!previewActionItems)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewActionItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    v7 = self->_previewActionItems;
    self->_previewActionItems = v6;

    previewActionItems = self->_previewActionItems;
  }
  return previewActionItems;
}

- (UIPreviewAction)leadingPreviewAction
{
  UIPreviewAction *leadingPreviewAction;
  void *v4;
  void *v5;
  UIPreviewAction *v6;
  UIPreviewAction *v7;

  leadingPreviewAction = self->_leadingPreviewAction;
  if (!leadingPreviewAction)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingPreviewAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIPreviewAction *)objc_msgSend(v5, "copy");
    v7 = self->_leadingPreviewAction;
    self->_leadingPreviewAction = v6;

    leadingPreviewAction = self->_leadingPreviewAction;
  }
  return leadingPreviewAction;
}

- (UIPreviewAction)trailingPreviewAction
{
  UIPreviewAction *trailingPreviewAction;
  void *v4;
  void *v5;
  UIPreviewAction *v6;
  UIPreviewAction *v7;

  trailingPreviewAction = self->_trailingPreviewAction;
  if (!trailingPreviewAction)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingPreviewAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIPreviewAction *)objc_msgSend(v5, "copy");
    v7 = self->_trailingPreviewAction;
    self->_trailingPreviewAction = v6;

    trailingPreviewAction = self->_trailingPreviewAction;
  }
  return trailingPreviewAction;
}

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldApplyVisualEffectsToPresentingView"))
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____UIPreviewPresentationController;
    objc_msgSendSuper2(&v9, sel__backgroundEffectForTraitCollection_interactive_, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_shouldApplyVisualEffectsToPresentingView
{
  return 1;
}

- (void)_configureInitialActionSheetViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  if (-[_UIPreviewPresentationController _hasPreviewActions](self, "_hasPreviewActions"))
  {
    -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[_UIPreviewPresentationController previewActionItems](self, "previewActionItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:](self, "_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController setPreviewActionSheet:](self, "setPreviewActionSheet:", v5);

      -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController _dismissedActionSheetCenterForActionSheet:](self, "_dismissedActionSheetCenterForActionSheet:", v11);
      v7 = v6;
      v9 = v8;
      -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCenter:", v7, v9);

    }
  }
}

- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_managedSafeAreaInsets");
  v9 = v8;

  if (fabs(v9) >= 2.22044605e-16)
  {
    -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    v12 = v11;

    y = y - (v9 - v12);
  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_layoutForRevealTransition
{
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  -[_UIPreviewPresentationController setCurrentPresentationPhase:](self, "setCurrentPresentationPhase:", 1);
  CGAffineTransformMakeScale(&v5, 1.0175, 1.0175);
  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

- (void)_layoutForRevealUnhighlightTransition:(double)a3
{
  double v3;
  id v4;

  v3 = 1.0 - a3;
  -[_UIPreviewPresentationController initialSourceViewSnapshot](self, "initialSourceViewSnapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)_revealTransitionDidComplete:(BOOL)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[_UIPreviewPresentationController presentationPhaseCompletionBlock](self, "presentationPhaseCompletionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIPreviewPresentationController presentationPhaseCompletionBlock](self, "presentationPhaseCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

  }
  -[_UIPreviewPresentationController _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded](self, "_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded");
}

- (void)_preparePresentationContainerViewForPreviewTransition
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  __int128 v32;
  CGAffineTransform *v33;
  CGFloat MidX;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double MidY;
  CGFloat v39;
  double Height;
  CGFloat v41;
  CGFloat v42;
  double tx;
  __int128 v44;
  _OWORD v45[3];
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  _QWORD v50[5];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __89___UIPreviewPresentationController__preparePresentationContainerViewForPreviewTransition__block_invoke;
  v50[3] = &unk_1E16B1B28;
  v50[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v50);
  objc_msgSend(v12, "platterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v12, "platterView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(v12, "setAlpha:", 0.0);
  if (_AXSReduceMotionEnabled())
  {
    objc_msgSend(v12, "setBlurRadius:", 0.0);
    v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v45[0] = *MEMORY[0x1E0C9BAA8];
    v45[1] = v32;
    v45[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v33 = (CGAffineTransform *)v45;
  }
  else
  {
    objc_msgSend(v12, "setBlurRadius:", 60.0);
    v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v49.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v49.c = v44;
    *(_OWORD *)&v49.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v51.origin.x = v5;
    v51.origin.y = v7;
    v51.size.width = v9;
    v51.size.height = v11;
    MidX = CGRectGetMidX(v51);
    v52.size.height = v31;
    v42 = v31;
    v35 = MidX;
    v52.origin.x = v25;
    v52.origin.y = v27;
    v52.size.width = v29;
    tx = v35 - CGRectGetMidX(v52);
    v53.origin.x = v5;
    v36 = v5;
    v53.origin.y = v7;
    v53.size.width = v9;
    v53.size.height = v11;
    v37 = v7;
    MidY = CGRectGetMidY(v53);
    v54.origin.x = v25;
    v54.origin.y = v27;
    v54.size.width = v29;
    v54.size.height = v42;
    v39 = CGRectGetMidY(v54);
    *(_OWORD *)&v48.a = *(_OWORD *)&v49.a;
    *(_OWORD *)&v48.c = v44;
    *(_OWORD *)&v48.tx = *(_OWORD *)&v49.tx;
    CGAffineTransformTranslate(&v49, &v48, tx, MidY - v39);
    v55.origin.x = v36;
    v55.origin.y = v37;
    v55.size.width = v9;
    v55.size.height = v11;
    Height = CGRectGetHeight(v55);
    v56.origin.x = v25;
    v56.origin.y = v27;
    v56.size.width = v29;
    v56.size.height = v42;
    v41 = CGRectGetHeight(v56);
    v47 = v49;
    CGAffineTransformScale(&v48, &v47, Height / v41, Height / v41);
    *(_OWORD *)&v49.tx = *(_OWORD *)&v48.tx;
    v46 = v48;
    v33 = &v46;
  }
  objc_msgSend(v12, "setTransform:", v33);
  objc_msgSend(v12, "setHidden:", 0);
  objc_msgSend(v12, "setShouldRasterizeForTransition:", 1);

}

- (void)_layoutForPreviewTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63___UIPreviewPresentationController__layoutForPreviewTransition__block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
  -[_UIPreviewPresentationController setCurrentPresentationPhase:](self, "setCurrentPresentationPhase:", 2);
  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlurRadius:", 60.0);

  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlurRadius:", 0.0);

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v8;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v7, "setTransform:", v9);

}

- (void)_previewTransitionDidComplete:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);

  v3 = a3;
  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldRasterizeForTransition:", 0);

  if (v3)
  {
    -[_UIPreviewPresentationController _preparePresentationContainerViewForPreviewInteraction](self, "_preparePresentationContainerViewForPreviewInteraction");
    -[_UIPreviewPresentationController presentationPhaseCompletionBlock](self, "presentationPhaseCompletionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIPreviewPresentationController presentationPhaseCompletionBlock](self, "presentationPhaseCompletionBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 2);

    }
    -[_UIPreviewPresentationController _configureActionSheetChromeViews](self, "_configureActionSheetChromeViews");
    -[_UIPreviewPresentationController _updateVisibiltyOfPreviewActionChromeForCurrentState](self, "_updateVisibiltyOfPreviewActionChromeForCurrentState");
  }
  -[_UIPreviewPresentationController _setupInteractionProgressForBreathing](self, "_setupInteractionProgressForBreathing");
  if (-[_UIPreviewPresentationController _hasPreviewActions](self, "_hasPreviewActions"))
    -[_UIPreviewPresentationController _configureDynamicsController](self, "_configureDynamicsController");
}

- (void)_layoutForDismissTransition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  int v32;
  _OWORD *v33;
  __int128 v34;
  double v35;
  CGAffineTransform *v36;
  double MidY;
  CGFloat v38;
  double Height;
  CGFloat v40;
  __int128 v41;
  void *v42;
  double tx;
  double txa;
  CGFloat rect;
  CGFloat rect_8;
  __int128 v47;
  _OWORD v48[3];
  _OWORD v49[3];
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController revealContainerView](self, "revealContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, "platterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v4, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = _AXSReduceMotionEnabled();
  v33 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  if (v32)
  {
    v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v49[0] = *MEMORY[0x1E0C9BAA8];
    v49[1] = v34;
    v49[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v35 = 0.0;
    v36 = (CGAffineTransform *)v49;
  }
  else
  {
    v47 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v53.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v53.c = v47;
    *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v54.origin.x = v25;
    v54.origin.y = v27;
    v54.size.width = v29;
    v54.size.height = v31;
    tx = CGRectGetMidX(v54);
    rect = v25;
    v55.origin.x = v17;
    rect_8 = v17;
    v55.origin.y = v19;
    v55.size.width = v21;
    v55.size.height = v23;
    txa = tx - CGRectGetMidX(v55);
    v56.origin.x = v25;
    v56.origin.y = v27;
    v56.size.width = v29;
    v56.size.height = v31;
    MidY = CGRectGetMidY(v56);
    v57.origin.x = v17;
    v57.origin.y = v19;
    v57.size.width = v21;
    v57.size.height = v23;
    v38 = CGRectGetMidY(v57);
    *(_OWORD *)&v52.a = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.c = v47;
    *(_OWORD *)&v52.tx = *(_OWORD *)&v53.tx;
    CGAffineTransformTranslate(&v53, &v52, txa, MidY - v38);
    v58.origin.x = rect;
    v58.origin.y = v27;
    v58.size.width = v29;
    v58.size.height = v31;
    Height = CGRectGetHeight(v58);
    v59.origin.x = rect_8;
    v59.origin.y = v19;
    v59.size.width = v21;
    v59.size.height = v23;
    v40 = CGRectGetHeight(v59);
    v51 = v53;
    CGAffineTransformScale(&v52, &v51, Height / v40, Height / v40);
    *(_OWORD *)&v53.tx = *(_OWORD *)&v52.tx;
    v50 = v52;
    v36 = &v50;
    v35 = 60.0;
  }
  objc_msgSend(v3, "setTransform:", v36);
  objc_msgSend(v3, "setBlurRadius:", v35);
  objc_msgSend(v3, "setAlpha:", 0.0);
  v41 = v33[1];
  v48[0] = *v33;
  v48[1] = v41;
  v48[2] = v33[2];
  objc_msgSend(v4, "setTransform:", v48);
  objc_msgSend(v4, "setAlpha:", 1.0);
  objc_msgSend(v4, "setBlurRadius:", 0.0);
  -[UIPresentationController containerView](self, "containerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUserInteractionEnabled:", 0);

  -[_UIPreviewPresentationController setCurrentPresentationPhase:](self, "setCurrentPresentationPhase:", 0);
}

- (void)_preparePresentationContainerViewForPreviewInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSampleRate:", 0.0);

  +[_UIStatistics previewInteractionPeekCount](_UIStatistics, "previewInteractionPeekCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementValueBy:", 1);

  +[_UIStatistics previewInteractionPeekDuration](_UIStatistics, "previewInteractionPeekDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimingForObject:", self);

  _UIPowerLogPeekBegan();
  -[_UIPreviewPresentationController interactionProgressForPresentation](self, "interactionProgressForPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addProgressObserver:", self);

  -[_UIPreviewPresentationController _configureInitialActionSheetViewIfNeeded](self, "_configureInitialActionSheetViewIfNeeded");
}

- (void)_layoutForPreviewInteractionProgress:(double)a3
{
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  CGAffineTransformMakeScale(&v6, a3, a3);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

- (void)_willCommitPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIPreviewPresentationController _endBreathing](self, "_endBreathing");
  -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAnimator");

  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

}

- (BOOL)_canDismissPresentation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  void *v12;

  if (-[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") - 4 < 0xFFFFFFFFFFFFFFFELL)
    goto LABEL_9;
  if (-[_UIPreviewPresentationController _hasPreviewActions](self, "_hasPreviewActions"))
  {
    -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocity");
      v6 = v5;

      if (v6 < 0.0 && fabs(v6) > -300.0)
      {
        -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "offset");
        v9 = fabs(v8);

        if (v9 >= 44.0)
        {
LABEL_13:
          LOBYTE(v10) = 0;
          return v10;
        }
      }
    }
  }
  if (!-[_UIPreviewPresentationController hasAskedForDismissalInternally](self, "hasAskedForDismissalInternally")
    && !-[_UIPreviewPresentationController hasAskedForCommitInternally](self, "hasAskedForCommitInternally"))
  {
    if (-[_UIPreviewPresentationController _platterIsInInitialPositionMostly](self, "_platterIsInInitialPositionMostly")&& !-[_UIPreviewPresentationController preDismissAnimationsInflight](self, "preDismissAnimationsInflight"))
    {
      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isMenuPresenting") ^ 1;

      return v10;
    }
    goto LABEL_13;
  }
LABEL_9:
  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)_canCommitPresentation
{
  return -[_UIPreviewPresentationController _platterIsInInitialPositionMostly](self, "_platterIsInInitialPositionMostly")|| -[_UIPreviewPresentationController hasAskedForCommitInternally](self, "hasAskedForCommitInternally");
}

- (void)_triggerQuickActionHandlerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected"))
  {
    -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "quickAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = v9;
      objc_msgSend(v9, "quickAction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v8)[2](v8, v14, v15);

    }
  }
  else if (-[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected"))
  {
    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quickAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "quickAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }

}

- (void)_prepareInitialSourceViewSnapshot
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _UIPreviewInteractionTransitionWindow *v13;
  id v14;

  -[UIPresentationController sourceView](self, "sourceView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController sourceRect](self, "sourceRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIPreviewPresentationController previewingContext](self, "previewingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customViewForInteractiveHighlight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v14, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v4, v6, v8, v10, 0.0, 0.0, 0.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController setInitialSourceViewSnapshot:](self, "setInitialSourceViewSnapshot:", v12);
  }
  v13 = objc_alloc_init(_UIPreviewInteractionTransitionWindow);
  objc_msgSend(v14, "convertRect:toView:", 0, v4, v6, v8, v10);
  -[UIWindow setFrame:](v13, "setFrame:");
  -[UIWindow setHidden:](v13, "setHidden:", 0);
  -[UIView addSubview:](v13, "addSubview:", v12);
  -[UIView bounds](v13, "bounds");
  objc_msgSend(v12, "setFrame:");
  -[_UIPreviewPresentationController setInitialSourceViewSnapshotWindow:](self, "setInitialSourceViewSnapshotWindow:", v13);

}

- (void)_updateRevealContainerViewForSourceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIPreviewPresentationEffectView *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = -[_UIPreviewPresentationEffectView initWithFrame:]([_UIPreviewPresentationEffectView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
  -[UIPresentationController sourceView](self, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIPreviewPresentationController previewingContext](self, "previewingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customViewForInteractiveHighlight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIView addSubview:](v13, "addSubview:", v10);
    }
    else if (!-[_UIPreviewPresentationController _sourceViewSnapshotAndScaleTransformSuppressed](self, "_sourceViewSnapshotAndScaleTransformSuppressed"))
    {
      objc_msgSend(v8, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, x, y, width, height, 0.0, 0.0, 0.0, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 18);
      -[UIView addSubview:](v13, "addSubview:", v11);
      -[_UIPreviewPresentationController initialSourceViewSnapshot](self, "initialSourceViewSnapshot");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:aboveSubview:](v13, "insertSubview:aboveSubview:", v12, v11);

    }
  }
  -[_UIPreviewPresentationController setRevealContainerView:](self, "setRevealContainerView:", v13);

}

- (void)_unhighlightPreviewCellSnapshotViewsIfNeeded
{
  _UIPreviewPresentationAnimator *v3;
  _UIPreviewPresentationAnimator *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, double);
  void *v8;
  id v9;
  id location;

  if (!-[_UIPreviewPresentationController _sourceViewSnapshotAndScaleTransformSuppressed](self, "_sourceViewSnapshotAndScaleTransformSuppressed"))
  {
    objc_initWeak(&location, self);
    v3 = [_UIPreviewPresentationAnimator alloc];
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __80___UIPreviewPresentationController__unhighlightPreviewCellSnapshotViewsIfNeeded__block_invoke;
    v8 = &unk_1E16DABC8;
    objc_copyWeak(&v9, &location);
    v4 = -[_UIPreviewPresentationAnimator initWithDuration:advanceBlock:](v3, "initWithDuration:advanceBlock:", &v5, 0.4);
    -[_UIPreviewPresentationController setUnhighlightPreviewCellSnapshotViewAnimator:](self, "setUnhighlightPreviewCellSnapshotViewAnimator:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded
{
  void *v3;

  -[_UIPreviewPresentationController unhighlightPreviewCellSnapshotViewAnimator](self, "unhighlightPreviewCellSnapshotViewAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation");

  -[_UIPreviewPresentationController setUnhighlightPreviewCellSnapshotViewAnimator:](self, "setUnhighlightPreviewCellSnapshotViewAnimator:", 0);
  -[_UIPreviewPresentationController setInitialSourceViewSnapshotWindow:](self, "setInitialSourceViewSnapshotWindow:", 0);
}

- (CGRect)_preferredSourceViewRect
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIPresentationController sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController sourceRect](self, "sourceRect");
  +[UIForcePresentationHelper sourceRectForView:proposedSourceRect:](UIForcePresentationHelper, "sourceRectForView:proposedSourceRect:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)platterContainerCenterX
{
  void *v2;
  double MidX;
  CGRect v5;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)platterContainerCenterY
{
  void *v2;
  double MidY;
  CGRect v5;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  MidY = CGRectGetMidY(v5);

  return MidY;
}

- (CGRect)platterBounds
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
  CGRect result;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)platterView
{
  void *v2;
  void *v3;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)platterContainerBounds
{
  void *v2;
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
  CGRect result;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewPresented
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController centerForPlatterWithMenuViewPresentedForActionSheet:](self, "centerForPlatterWithMenuViewPresentedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewDismissed
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[_UIPreviewPresentationController platterContainerCenterX](self, "platterContainerCenterX");
  v4 = v3;
  -[_UIPreviewPresentationController platterContainerCenterY](self, "platterContainerCenterY");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)centerForMenuPresented
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController centerForMenuPresentedForActionSheet:](self, "centerForMenuPresentedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)centerForMenuDismissed
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController centerForMenuDismissedForActionSheet:](self, "centerForMenuDismissedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)minimumSpacingBetweenPlatterAndMenu
{
  return 0.0;
}

- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  y = a5.y;
  x = a5.x;
  v16 = a4;
  -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v16)
  {
    -[_UIPreviewPresentationController _leadingQuickActionOffsetForCenterPosition:swipeView:](self, "_leadingQuickActionOffsetForCenterPosition:swipeView:", x, y);
    v12 = v14;
    -[_UIPreviewPresentationController leadingQuickActionViewEdgeConstraint](self, "leadingQuickActionViewEdgeConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  if (v9 == v16)
  {
    -[_UIPreviewPresentationController _trailingQuickActionOffsetForCenterPosition:swipeView:](self, "_trailingQuickActionOffsetForCenterPosition:swipeView:", x, y);
    v12 = v11;
    -[_UIPreviewPresentationController trailingQuickActionViewEdgeConstraint](self, "trailingQuickActionViewEdgeConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = v13;
    objc_msgSend(v13, "setConstant:", v12);

    v10 = v16;
  }

}

- (double)_trailingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4
{
  double x;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGRect v11;

  x = a3.x;
  objc_msgSend(a4, "bounds", a3.x, a3.y);
  v6 = x + CGRectGetWidth(v11) * 0.5;
  -[UIPresentationController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  return v6 - v9;
}

- (double)_leadingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4
{
  double x;
  double v5;

  x = a3.x;
  objc_msgSend(a4, "bounds", a3.x, a3.y);
  return -(x + v5 * -0.5);
}

- (CGPoint)initialCenterForLeadingSwipeActionView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[_UIPreviewPresentationController leadingSwipeActionView](self, "leadingSwipeActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPreviewPresentationController centerForPlatterWithMenuViewDismissed](self, "centerForPlatterWithMenuViewDismissed");
    v5 = v4;
    v7 = v6;
    -[_UIPreviewPresentationController platterView](self, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v13 = round(v7 - v11 * 0.5);
    v14 = round(v5 - v9 * 0.5);

    objc_msgSend(v3, "bounds");
    v16 = v15;
    v23.origin.x = v14;
    v23.origin.y = v13;
    v23.size.width = v10;
    v23.size.height = v12;
    v17 = CGRectGetMinX(v23) + v16 * 0.5 + 2.0;
    -[UIPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = CGRectGetHeight(v24) * 0.5;

  }
  else
  {
    v17 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)initialCenterForTrailingSwipeActionView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[_UIPreviewPresentationController trailingSwipeActionView](self, "trailingSwipeActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPreviewPresentationController centerForPlatterWithMenuViewDismissed](self, "centerForPlatterWithMenuViewDismissed");
    v5 = v4;
    v7 = v6;
    -[_UIPreviewPresentationController platterView](self, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v13 = round(v7 - v11 * 0.5);
    v14 = round(v5 - v9 * 0.5);

    objc_msgSend(v3, "bounds");
    v16 = v15;
    v23.origin.x = v14;
    v23.origin.y = v13;
    v23.size.width = v10;
    v23.size.height = v12;
    v17 = CGRectGetMaxX(v23) - (v16 * 0.5 + 2.0);
    -[UIPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = CGRectGetHeight(v24) * 0.5;

  }
  else
  {
    v17 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  CGPoint result;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  -[_UIPreviewPresentationController platterContainerBounds](self, "platterContainerBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UIPreviewPresentationController platterContainerCenterY](self, "platterContainerCenterY");
  v14 = v13;
  objc_msgSend(v4, "bounds");
  v16 = v15;

  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  Height = CGRectGetHeight(v26);
  -[_UIPreviewPresentationController minimumSpacingBetweenPlatterAndMenu](self, "minimumSpacingBetweenPlatterAndMenu");
  v19 = Height - (v16 + v18 + v18);
  -[_UIPreviewPresentationController platterBounds](self, "platterBounds");
  v20 = v19 + CGRectGetHeight(v27) * -0.5;
  -[_UIPreviewPresentationController platterContainerCenterY](self, "platterContainerCenterY");
  if (v14 + -40.0 < v20 && v20 > v21)
    v20 = v14 + -40.0;
  -[_UIPreviewPresentationController platterContainerCenterX](self, "platterContainerCenterX");
  v24 = v20;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)centerForMenuPresentedForActionSheet:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Height;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;

  v4 = a3;
  -[_UIPreviewPresentationController platterContainerBounds](self, "platterContainerBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v14 = v13;

  -[_UIPreviewPresentationController platterContainerCenterX](self, "platterContainerCenterX");
  v16 = v15;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  -[_UIPreviewPresentationController minimumSpacingBetweenPlatterAndMenu](self, "minimumSpacingBetweenPlatterAndMenu");
  -[_UIPreviewPresentationController _applyLayoutAdjustmentsForManagedViewWithPosition:](self, "_applyLayoutAdjustmentsForManagedViewWithPosition:", v16, Height - (v14 * 0.5 + v18));
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)centerForMenuDismissedForActionSheet:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  -[_UIPreviewPresentationController platterContainerBounds](self, "platterContainerBounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v7;

  -[_UIPreviewPresentationController platterContainerCenterX](self, "platterContainerCenterX");
  v10 = v6 + v8 * 0.5;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_configureDynamicsController
{
  void *v3;
  _UIPlatterMenuDynamicsController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  _UIPlatterMenuDynamicsController *v21;

  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = [_UIPlatterMenuDynamicsController alloc];
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_UIPlatterMenuDynamicsController initWithContainerView:platterView:menuView:delegate:](v4, "initWithContainerView:platterView:menuView:delegate:", v5, v7, v8, self);

  if (!-[_UIPreviewPresentationController _hasPreviewQuickActions](self, "_hasPreviewQuickActions"))
    -[_UIPlatterMenuDynamicsController lockIntoYAxis](v21, "lockIntoYAxis");
  -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v14 = 0.0;
    v12 = 0.0;
    goto LABEL_15;
  }
  -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "velocity");
  v12 = v11;
  v14 = v13;

  if (v14 < 0.0)
  {
    -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "velocity");
    if (fabs(v15) > -300.0)
    {
      -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "offset");
      v18 = fabs(v17);

      LODWORD(v9) = v18 > 44.0;
      if (v18 > 44.0)
        v12 = 0.0;
      goto LABEL_14;
    }

  }
  LODWORD(v9) = 0;
LABEL_14:
  -[_UIPreviewPresentationController setRevealPanningVelocityIntegrator:](self, "setRevealPanningVelocityIntegrator:", 0);
LABEL_15:
  -[_UIPreviewPresentationController setPlatterMenuController:](self, "setPlatterMenuController:", v21);
  v19 = -[_UIPreviewPresentationController panningGestureRecognizerInProgress](self, "panningGestureRecognizerInProgress");
  if ((_DWORD)v9
    && !v19
    && (-[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 2
     || -[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 3))
  {
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_animateToPlatterPresentedWithVelocity:", v12, v14);

  }
}

- (void)_invokeCommitHandlerFromInteractionProgress
{
  id v3;

  -[_UIPreviewPresentationController setInteractionProgressForCommit:](self, "setInteractionProgressForCommit:", 0);
  -[_UIPreviewPresentationController setHasAskedForCommitInternally:](self, "setHasAskedForCommitInternally:", 1);
  -[_UIPreviewPresentationController forcePresentationControllerDelegate](self, "forcePresentationControllerDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "forcePresentationControllerWantsToCommit:", self);

}

- (void)_dismissPresentation
{
  void *v3;

  -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAnimator");

  -[_UIPreviewPresentationController _dismissPresentationWithCompletion:](self, "_dismissPresentationWithCompletion:", 0);
}

- (void)_hideQuickActions
{
  void *v3;
  id v4;

  -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (double)_quickActionSelectionOffset
{
  void *v3;
  double Width;
  void *v5;
  double result;
  CGRect v7;
  CGRect v8;

  -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v7);

  if (Width <= 2.22044605e-16)
  {
    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Width = CGRectGetWidth(v8);

  }
  result = 44.0;
  if (Width <= 44.0)
    return Width;
  return result;
}

- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3
{
  double v4;
  double v5;

  -[_UIPreviewPresentationController _quickActionSelectionOffset](self, "_quickActionSelectionOffset");
  v5 = 2.0;
  if (a3 == 2)
    v5 = 3.5;
  return v5 * v4;
}

- (void)_updateVisibiltyOfPreviewActionChromeForCurrentState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v16[6];

  if (-[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 2
    || -[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 3)
  {
    if (-[_UIPreviewPresentationController _hasPreviewQuickActions](self, "_hasPreviewQuickActions"))
    {
      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentTranslation");
      v5 = fabs(v4);

      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      if (v5 < 2.22044605e-16 != v7)
      {
        -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView", 2.22044605e-16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHidden:", v5 < 2.22044605e-16);

      }
      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isHidden");

      if (v5 < 2.22044605e-16 != v10)
      {
        -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView", 2.22044605e-16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setHidden:", v5 < 2.22044605e-16);

      }
    }
    if (-[_UIPreviewPresentationController _hasPreviewActions](self, "_hasPreviewActions"))
    {
      if (-[_UIPreviewPresentationController _platterIsInInitialPositionMostly](self, "_platterIsInInitialPositionMostly"))
      {
        v12 = 1.0;
      }
      else
      {
        v12 = 0.0;
      }
      -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "alpha");
      v15 = v14;

      if (v12 != v15)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __88___UIPreviewPresentationController__updateVisibiltyOfPreviewActionChromeForCurrentState__block_invoke;
        v16[3] = &unk_1E16B1888;
        v16[4] = self;
        *(double *)&v16[5] = v12;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.2);
      }
    }
  }
}

- (BOOL)_hasPreviewQuickActions
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UIPreviewPresentationController leadingPreviewAction](self, "leadingPreviewAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[_UIPreviewPresentationController trailingPreviewAction](self, "trailingPreviewAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_hasSelectedQuickAction
{
  return -[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected")
      || -[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected");
}

- (BOOL)_hasPreviewActions
{
  void *v2;
  BOOL v3;

  -[_UIPreviewPresentationController previewActionItems](self, "previewActionItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[7];
  id location[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "_actions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:](self, "_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIPreviewPresentationController previewActionSheet](self, "previewActionSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      -[UIPresentationController containerView](self, "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 0);

      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resetAnimator");

      -[_UIPreviewPresentationController centerForPlatterWithMenuViewPresentedForActionSheet:](self, "centerForPlatterWithMenuViewPresentedForActionSheet:", v9);
      v42 = v15;
      v43 = v14;
      -[_UIPreviewPresentationController centerForMenuPresentedForActionSheet:](self, "centerForMenuPresentedForActionSheet:", v10);
      v17 = v16;
      v19 = v18;
      -[_UIPreviewPresentationController centerForMenuDismissedForActionSheet:](self, "centerForMenuDismissedForActionSheet:", v10);
      v21 = v20;
      v23 = v22;
      -[_UIPreviewPresentationController centerForMenuDismissedForActionSheet:](self, "centerForMenuDismissedForActionSheet:", v9);
      v25 = v24;
      v27 = v26;
      -[_UIPreviewPresentationController centerForMenuPresentedForActionSheet:](self, "centerForMenuPresentedForActionSheet:", v9);
      v29 = v28;
      v31 = v30;
      objc_msgSend(v9, "setCenter:", v25, v27);
      objc_msgSend(v10, "setCenter:", v17, v19);
      v32 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke;
      aBlock[3] = &unk_1E16B4E70;
      aBlock[4] = self;
      aBlock[5] = v43;
      aBlock[6] = v42;
      v33 = _Block_copy(aBlock);
      v59[0] = v32;
      v59[1] = 3221225472;
      v59[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_2;
      v59[3] = &unk_1E16B4E70;
      v44 = v10;
      v60 = v44;
      v61 = v21;
      v62 = v23;
      v34 = _Block_copy(v59);
      v55[0] = v32;
      v55[1] = 3221225472;
      v55[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_3;
      v55[3] = &unk_1E16B4E70;
      v35 = v9;
      v56 = v35;
      v57 = v29;
      v58 = v31;
      v36 = _Block_copy(v55);
      v53[0] = v32;
      v53[1] = 3221225472;
      v53[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_4;
      v53[3] = &unk_1E16B1BF8;
      v37 = v33;
      v54 = v37;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v53, &__block_literal_global_418, 0.4);
      v51[0] = v32;
      v51[1] = 3221225472;
      v51[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_6;
      v51[3] = &unk_1E16B1BF8;
      v38 = v34;
      v52 = v38;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v51, &__block_literal_global_67_0, 0.2, 0.0);
      v49[0] = v32;
      v49[1] = 3221225472;
      v49[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_8;
      v49[3] = &unk_1E16B1BF8;
      v39 = v36;
      v50 = v39;
      v45[0] = v32;
      v45[1] = 3221225472;
      v45[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_9;
      v45[3] = &unk_1E16B6FB8;
      objc_copyWeak(&v48, location);
      v40 = v35;
      v46 = v40;
      v41 = v44;
      v47 = v41;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v49, v45, 0.2, 0.2);

      objc_destroyWeak(&v48);
      objc_destroyWeak(location);

    }
  }

}

- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  _UIPreviewActionSheetView *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id from;
  id location;
  CGRect v22;

  v4 = a3;
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_standardPreferredContentSize");
  v7 = v6;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v22) * 0.7;

  v10 = -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:]([_UIPreviewActionSheetView alloc], "initWithFrame:title:items:contentInsets:", 0, v4, 0.0, 0.0, v7, v9, 20.0, 0.0, 20.0, 0.0);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);

  objc_initWeak(&from, self);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke;
  v17 = &unk_1E16DAC18;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  -[_UIPreviewActionSheetView setCompletionHandler:](v10, "setCompletionHandler:", &v14);
  -[_UIPreviewPresentationController actionSheetContainerView](self, "actionSheetContainerView", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v10);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setNeedsLayout](v10, "setNeedsLayout");
  -[UIView layoutIfNeeded](v10, "layoutIfNeeded");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
  -[_UIPreviewPresentationController _dismissedActionSheetCenterForActionSheet:](self, "_dismissedActionSheetCenterForActionSheet:", v10);
  -[UIView setCenter:](v10, "setCenter:");
  -[_UIPreviewActionSheetView setDelegate:](v10, "setDelegate:", self);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v10;
}

- (CGPoint)_dismissedActionSheetCenterForActionSheet:(id)a3
{
  id v3;
  void *v4;
  CGFloat MidX;
  void *v6;
  double Height;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = a3;
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v20);
  objc_msgSend(v3, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v21);
  objc_msgSend(v3, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v16 = Height + CGRectGetHeight(v22) * 0.5;

  v17 = MidX;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)_presentedActionSheetCenterForActionSheet:(id)a3
{
  id v3;
  void *v4;
  CGFloat MidX;
  void *v6;
  double Height;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = a3;
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v20);
  objc_msgSend(v3, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v21);
  objc_msgSend(v3, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v16 = Height + CGRectGetHeight(v22) * -0.5 + -20.0;

  v17 = MidX;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)_dismissPresentationWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  -[_UIPreviewPresentationController setPreDismissAnimationsInflight:](self, "setPreDismissAnimationsInflight:", 1);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E16B1D18;
  aBlock[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[_UIPreviewPresentationController actionSheetAvailableImageView](self, "actionSheetAvailableImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  if (!-[_UIPreviewPresentationController _platterIsSelectingPreviewActions](self, "_platterIsSelectingPreviewActions"))
  {
    -[_UIPreviewPresentationController _hideQuickActions](self, "_hideQuickActions");
    if (-[_UIPreviewPresentationController _platterIsInInitialPosition](self, "_platterIsInInitialPosition"))
    {
      v7[2](v7);
      goto LABEL_9;
    }
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_3;
    v10[3] = &unk_1E16B1BF8;
    v11 = v7;
    -[_UIPreviewPresentationController _restorePlatterToInitialStatePositionAnimatedWithCompletion:](self, "_restorePlatterToInitialStatePositionAnimatedWithCompletion:", v10);
    v9 = v11;
LABEL_8:

    goto LABEL_9;
  }
  if (!-[_UIPreviewPresentationController _hasSelectedQuickAction](self, "_hasSelectedQuickAction"))
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_2;
    v12[3] = &unk_1E16B1BF8;
    v13 = v7;
    -[_UIPreviewPresentationController _restorePlatterToInitialStatePositionAnimatedWithCompletion:](self, "_restorePlatterToInitialStatePositionAnimatedWithCompletion:", v12);
    v9 = v13;
    goto LABEL_8;
  }
  -[_UIPreviewPresentationController _dismissForSelectionQuickActionAnimated](self, "_dismissForSelectionQuickActionAnimated");
LABEL_9:

}

- (BOOL)_platterIsSelectingPreviewActions
{
  void *v2;
  double v3;
  BOOL v4;

  -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTranslation");
  v4 = fabs(v3) > 2.0;

  return v4;
}

- (void)_configureActionSheetChromeViews
{
  void *v3;
  _BOOL4 v4;
  double *v5;
  _UIPreviewQuickActionView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIPreviewQuickActionView *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _UIPreviewQuickActionView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIPreviewQuickActionView *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIImageView *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  -[_UIPreviewPresentationController leadingPreviewAction](self, "leadingPreviewAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3 != 0;
  v5 = (double *)MEMORY[0x1E0C9D648];
  if (v3)
  {
    v6 = -[_UIPreviewQuickActionView initWithFrame:]([_UIPreviewQuickActionView alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIPreviewPresentationController leadingPreviewAction](self, "leadingPreviewAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView setQuickAction:](v6, "setQuickAction:", v7);

    -[UIView layoutIfNeeded](v6, "layoutIfNeeded");
    -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    -[_UIPreviewPresentationController containerScrollView](self, "containerScrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v6;
    -[_UIPreviewPresentationController containerScrollView](self, "containerScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:below:", v11, v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController setLeadingQuickActionViewEdgeConstraint:](self, "setLeadingQuickActionViewEdgeConstraint:", v16);

    -[_UIPreviewPresentationController initialCenterForLeadingSwipeActionView](self, "initialCenterForLeadingSwipeActionView");
    -[_UIPreviewPresentationController _leadingQuickActionOffsetForCenterPosition:swipeView:](self, "_leadingQuickActionOffsetForCenterPosition:swipeView:", v11);
    v18 = v17;
    -[_UIPreviewPresentationController leadingQuickActionViewEdgeConstraint](self, "leadingQuickActionViewEdgeConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", v18);

    -[_UIPreviewPresentationController leadingQuickActionViewEdgeConstraint](self, "leadingQuickActionViewEdgeConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

    objc_msgSend(v10, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView centerYAnchor](v11, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v13);
    -[_UIPreviewPresentationController setLeadingQuickActionView:](self, "setLeadingQuickActionView:", v11);

    -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

  }
  -[_UIPreviewPresentationController trailingPreviewAction](self, "trailingPreviewAction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = -[_UIPreviewQuickActionView initWithFrame:]([_UIPreviewQuickActionView alloc], "initWithFrame:", *v5, v5[1], v5[2], v5[3]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIPreviewPresentationController trailingPreviewAction](self, "trailingPreviewAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView setQuickAction:](v26, "setQuickAction:", v27);

    -[UIView layoutIfNeeded](v26, "layoutIfNeeded");
    -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v26);

    -[_UIPreviewPresentationController containerScrollView](self, "containerScrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v26;
    -[_UIPreviewPresentationController containerScrollView](self, "containerScrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "insertSubview:below:", v31, v32);

    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView trailingAnchor](v31, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController setTrailingQuickActionViewEdgeConstraint:](self, "setTrailingQuickActionViewEdgeConstraint:", v36);

    -[_UIPreviewPresentationController initialCenterForTrailingSwipeActionView](self, "initialCenterForTrailingSwipeActionView");
    -[_UIPreviewPresentationController _trailingQuickActionOffsetForCenterPosition:swipeView:](self, "_trailingQuickActionOffsetForCenterPosition:swipeView:", v31);
    v38 = v37;
    -[_UIPreviewPresentationController trailingQuickActionViewEdgeConstraint](self, "trailingQuickActionViewEdgeConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setConstant:", v38);

    -[_UIPreviewPresentationController trailingQuickActionViewEdgeConstraint](self, "trailingQuickActionViewEdgeConstraint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v40);

    -[_UIPreviewQuickActionView centerYAnchor](v31, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v43);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v33);
    -[_UIPreviewPresentationController setTrailingQuickActionView:](self, "setTrailingQuickActionView:", v31);

    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
    objc_msgSend(v44, "setHidden:", 1);

  }
  if (-[_UIPreviewPresentationController _hasPreviewActions](self, "_hasPreviewActions"))
  {
    -[_UIPreviewPresentationController containerScrollView](self, "containerScrollView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "superview");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    _UIImageWithName(CFSTR("uippc-arrow-up-gray.png"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "imageWithRenderingMode:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v48);
    +[UIColor _controlForegroundColor](UIColor, "_controlForegroundColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v49, "setTintColor:", v50);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v46, "addSubview:", v49);
    -[_UIPreviewPresentationController platterView](self, "platterView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v49, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[UIView bottomAnchor](v49, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, -12.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UIView setAlpha:](v49, "setAlpha:", 0.0);
    -[_UIPreviewPresentationController setActionSheetAvailableImageView:](self, "setActionSheetAvailableImageView:", v49);

  }
  if (v4)
  {
    -[UIPresentationController containerView](self, "containerView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setNeedsLayout");

    -[UIPresentationController containerView](self, "containerView");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "layoutIfNeeded");

  }
}

- (BOOL)_platterIsInInitialPositionMostly
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MidX;
  CGFloat v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v13 = round(CGRectGetMidY(v22) + -22.0);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "platterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "center");
  v20.x = v16;
  v20.y = v17;
  v23.size.width = 44.0;
  v23.origin.x = round(MidX + -22.0);
  v23.origin.y = v13;
  v23.size.height = 44.0;
  v18 = CGRectContainsPoint(v23, v20);

  return v18;
}

- (BOOL)_platterIsInInitialPosition
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MidX;
  CGFloat v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v13 = round(CGRectGetMidY(v22) + -1.0);
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "platterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "center");
  v20.x = v16;
  v20.y = v17;
  v23.size.width = 2.0;
  v23.size.height = 2.0;
  v23.origin.x = round(MidX + -1.0);
  v23.origin.y = v13;
  v18 = CGRectContainsPoint(v23, v20);

  return v18;
}

- (void)_restorePlatterToInitialStatePositionAnimated
{
  -[_UIPreviewPresentationController _restorePlatterToInitialStatePositionAnimatedWithCompletion:](self, "_restorePlatterToInitialStatePositionAnimatedWithCompletion:", 0);
}

- (void)_restorePlatterToInitialStatePositionAnimatedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke_2;
  v8[3] = &unk_1E16BC218;
  v8[4] = self;
  v7 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v8, 0.175);

}

- (void)_dismissForSelectionQuickActionAnimated
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD aBlock[5];

  -[_UIPreviewPresentationController setPreDismissAnimationsInflight:](self, "setPreDismissAnimationsInflight:", 1);
  if (-[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected"))
  {
    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v3;
    objc_msgSend(v3, "setHidden:", 1);

    goto LABEL_6;
  }
  if (-[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected"))
  {
    -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_2;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_3;
  v8[3] = &unk_1E16B1BA0;
  v9 = _Block_copy(v10);
  v7 = v9;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v8, 0.2);

}

- (void)_dismissForHandledActionWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _UIPreviewPresentationController *v15;
  id v16;
  id v17;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v11 = v5;
  v12 = 3221225472;
  v13 = __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke_2;
  v14 = &unk_1E16C9138;
  v15 = self;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  v7 = v4;
  v8 = v16;
  v9 = _Block_copy(&v11);
  -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetAnimator");

  -[_UIPreviewPresentationController setHasAskedForDismissalInternally:](self, "setHasAskedForDismissalInternally:", 1);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v9, 0.225);

}

- (void)setPanningGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v5;
  UIGestureRecognizer **p_panningGestureRecognizer;
  UIGestureRecognizer *panningGestureRecognizer;
  UIGestureRecognizer *v8;

  v5 = (UIGestureRecognizer *)a3;
  p_panningGestureRecognizer = &self->_panningGestureRecognizer;
  panningGestureRecognizer = self->_panningGestureRecognizer;
  v8 = v5;
  if (panningGestureRecognizer != v5)
  {
    if (panningGestureRecognizer)
      -[UIGestureRecognizer removeTarget:action:](panningGestureRecognizer, "removeTarget:action:", self, 0);
    objc_storeStrong((id *)&self->_panningGestureRecognizer, a3);
    if (*p_panningGestureRecognizer)
      -[UIGestureRecognizer addTarget:action:](*p_panningGestureRecognizer, "addTarget:action:", self, sel__panningGestureRecognizerDidFire_);
  }

}

- (void)_panningGestureRecognizerDidFire:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "state") == 1 || objc_msgSend(v26, "state") == 2)
  {
    v4 = 1;
  }
  else
  {
    if (objc_msgSend(v26, "state") != 3 && objc_msgSend(v26, "state") != 5 && objc_msgSend(v26, "state") != 4)
      goto LABEL_9;
    v4 = 0;
  }
  -[_UIPreviewPresentationController setPanningGestureRecognizerInProgress:](self, "setPanningGestureRecognizerInProgress:", v4);
LABEL_9:
  -[_UIPreviewPresentationController presentationContainerView](self, "presentationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 1
    || -[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 2)
  {
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_UIPreviewPresentationController revealPanningVelocityIntegrator](self, "revealPanningVelocityIntegrator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "locationInView:", v5);
      objc_msgSend(v7, "addSample:");

    }
  }
  if (-[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 2
    || -[_UIPreviewPresentationController currentPresentationPhase](self, "currentPresentationPhase") == 3)
  {
    objc_msgSend(v26, "locationInView:", v5);
    v9 = v8;
    v11 = v10;
    if (objc_msgSend(v26, "state") == 1)
    {
      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "didBeginPanningWithPoint:", v9, v11);

        -[_UIPreviewPresentationController setDidSendBeginEvent:](self, "setDidSendBeginEvent:", 1);
      }
    }
    else if (objc_msgSend(v26, "state") == 2)
    {
      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!-[_UIPreviewPresentationController didSendBeginEvent](self, "didSendBeginEvent"))
        {
          -[_UIPreviewPresentationController setDidSendBeginEvent:](self, "setDidSendBeginEvent:", 1);
          -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "didBeginPanningWithPoint:", v9, v11);

        }
        -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "didPanWithPoint:", v9, v11);

        -[_UIPreviewPresentationController _updateVisibiltyOfPreviewActionChromeForCurrentState](self, "_updateVisibiltyOfPreviewActionChromeForCurrentState");
        -[_UIPreviewPresentationController updateSwipeActionsIfApplicable](self, "updateSwipeActionsIfApplicable");
      }
    }
    else
    {
      -[_UIPreviewPresentationController setupAdditionalModalGestureRecognizers](self, "setupAdditionalModalGestureRecognizers");
      -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[_UIPreviewPresentationController setDidSendBeginEvent:](self, "setDidSendBeginEvent:", 0);
        -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "didEndPanningWithPoint:", v9, v11);

        -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        if ((objc_msgSend(v19, "isMenuPresented") & 1) == 0)
        {
          -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isMenuPresenting");

          v20 = v22 ^ 1;
        }

        -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isSelectingSwipeAction");

        if ((v20 & 1) != 0 || v24)
        {
          -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "resetAnimator");

          -[_UIPreviewPresentationController _dismissPresentation](self, "_dismissPresentation");
        }
      }
    }
  }

}

- (void)updateSwipeActionsIfApplicable
{
  void *v3;
  double v4;
  double v5;
  _DWORD *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  _BOOL8 v32;
  id v33;

  if (-[_UIPreviewPresentationController _hasPreviewQuickActions](self, "_hasPreviewQuickActions"))
  {
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTranslation");
    v5 = v4;

    -[UIPresentationController containerView](self, "containerView");
    v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v6[30];

    -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quickAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "quickAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", objc_msgSend(v11, "style"));
      v13 = v12;

      if (v13 > 0.0)
      {
        v14 = (*(_QWORD *)&v7 & 0x80000) != 0 ? v5 > v13 : v5 < -v13;
        -[_UIPreviewPresentationController setLeadingQuickActionViewSelected:](self, "setLeadingQuickActionViewSelected:", v14);
        if (-[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected"))
          -[_UIPreviewPresentationController setTrailingQuickActionViewSelected:](self, "setTrailingQuickActionViewSelected:", 0);
      }
    }
    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quickAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "quickAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", objc_msgSend(v18, "style"));
      v20 = v19;

      if (v20 > 0.0)
      {
        v21 = (*(_QWORD *)&v7 & 0x80000) != 0 ? v5 < -v20 : v5 > v20;
        -[_UIPreviewPresentationController setTrailingQuickActionViewSelected:](self, "setTrailingQuickActionViewSelected:", v21);
        if (-[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected"))
        {
          -[_UIPreviewPresentationController setLeadingQuickActionViewSelected:](self, "setLeadingQuickActionViewSelected:", 0);
        }
      }
    }
    if (-[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected"))
    {
      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHidden:", 0);

      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 1);

    }
    if (-[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected"))
    {
      -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", 0);

      -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHidden:", 1);

    }
    v26 = -[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected");
    -[_UIPreviewPresentationController trailingQuickActionView](self, "trailingQuickActionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSelected:", v26);

    v28 = -[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected");
    -[_UIPreviewPresentationController leadingQuickActionView](self, "leadingQuickActionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSelected:", v28);

    v30 = -[_UIPreviewPresentationController leadingQuickActionViewSelected](self, "leadingQuickActionViewSelected");
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLeadingSwipeActionViewSelected:", v30);

    v32 = -[_UIPreviewPresentationController trailingQuickActionViewSelected](self, "trailingQuickActionViewSelected");
    -[_UIPreviewPresentationController platterMenuController](self, "platterMenuController");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTrailingSwipeActionViewSelected:", v32);

  }
}

- (void)_setupInteractionProgressForBreathing
{
  void *v3;
  UIPreviewForceInteractionProgress *v4;
  void *v5;
  void *v6;
  UIPreviewForceInteractionProgress *v7;
  void *v8;
  void *v9;

  -[_UIPreviewPresentationController interactionProgressForBreathing](self, "interactionProgressForBreathing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [UIPreviewForceInteractionProgress alloc];
    -[_UIPreviewPresentationController actionSheetContainerView](self, "actionSheetContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIPreviewForceInteractionProgress initWithView:targetState:](v4, "initWithView:targetState:", v6, 3);
    -[_UIPreviewPresentationController setInteractionProgressForBreathing:](self, "setInteractionProgressForBreathing:", v7);

    -[_UIPreviewPresentationController interactionProgressForBreathing](self, "interactionProgressForBreathing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompletesAtTargetState:", 0);

    -[_UIPreviewPresentationController interactionProgressForBreathing](self, "interactionProgressForBreathing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addProgressObserver:", self);

  }
  -[_UIPreviewPresentationController _beginBreathing](self, "_beginBreathing");
}

- (void)setupAdditionalModalGestureRecognizers
{
  void *v3;
  UIPreviewForceInteractionProgress *v4;
  void *v5;
  void *v6;
  UIPreviewForceInteractionProgress *v7;
  void *v8;
  void *v9;
  void *v10;
  UIPanGestureRecognizer *v11;
  void *v12;
  void *v13;
  UITapGestureRecognizer *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[_UIPreviewPresentationController interactionProgressForCommit](self, "interactionProgressForCommit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [UIPreviewForceInteractionProgress alloc];
    -[_UIPreviewPresentationController actionSheetContainerView](self, "actionSheetContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIPreviewForceInteractionProgress initWithView:targetState:](v4, "initWithView:targetState:", v6, 3);
    -[_UIPreviewPresentationController setInteractionProgressForCommit:](self, "setInteractionProgressForCommit:", v7);

    -[_UIPreviewPresentationController interactionProgressForCommit](self, "interactionProgressForCommit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompletesAtTargetState:", 0);

    -[_UIPreviewPresentationController interactionProgressForCommit](self, "interactionProgressForCommit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addProgressObserver:", self);

  }
  -[_UIPreviewPresentationController setPanningGestureRecognizer:](self, "setPanningGestureRecognizer:", 0);
  -[_UIPreviewPresentationController modalPreviewActionsPanningGestureRecognizer](self, "modalPreviewActionsPanningGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__panningGestureRecognizerDidFire_);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v11, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v11, "setMaximumNumberOfTouches:", 1);
    -[UIPresentationController containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

    -[_UIPreviewPresentationController setModalPreviewActionsPanningGestureRecognizer:](self, "setModalPreviewActionsPanningGestureRecognizer:", v11);
  }
  -[_UIPreviewPresentationController tapToDismissGestureRecognizer](self, "tapToDismissGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__tapToDismissPreviewWithActionsDidFire_);
    -[_UIPreviewPresentationController setTapToDismissGestureRecognizer:](self, "setTapToDismissGestureRecognizer:", v14);

    -[_UIPreviewPresentationController tapToDismissGestureRecognizer](self, "tapToDismissGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfTapsRequired:", 1);

    -[_UIPreviewPresentationController tapToDismissGestureRecognizer](self, "tapToDismissGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfTouchesRequired:", 1);

    -[UIPresentationController containerView](self, "containerView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController tapToDismissGestureRecognizer](self, "tapToDismissGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addGestureRecognizer:", v17);

  }
}

- (BOOL)previewActionSheetCanSelectItem:(id)a3
{
  return 1;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 0;
}

- (UIGestureRecognizer)panningGestureRecognizer
{
  return self->_panningGestureRecognizer;
}

- (id)presentationPhaseCompletionBlock
{
  return self->_presentationPhaseCompletionBlock;
}

- (void)setPresentationPhaseCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed
{
  return self->_sourceViewSnapshotAndScaleTransformSuppressed;
}

- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3
{
  self->_sourceViewSnapshotAndScaleTransformSuppressed = a3;
}

- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate
{
  return (_UIForcePresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_forcePresentationControllerDelegate);
}

- (void)setForcePresentationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forcePresentationControllerDelegate, a3);
}

- (BOOL)didSendBeginEvent
{
  return self->_didSendBeginEvent;
}

- (void)setDidSendBeginEvent:(BOOL)a3
{
  self->_didSendBeginEvent = a3;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (UIView)actionSheetContainerView
{
  return self->_actionSheetContainerView;
}

- (void)setActionSheetContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_actionSheetContainerView, a3);
}

- (UIScrollView)containerScrollView
{
  return self->_containerScrollView;
}

- (void)setContainerScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_containerScrollView, a3);
}

- (_UIPreviewActionSheetView)previewActionSheet
{
  return self->_previewActionSheet;
}

- (void)setPreviewActionSheet:(id)a3
{
  objc_storeStrong((id *)&self->_previewActionSheet, a3);
}

- (UIPreviewForceInteractionProgress)interactionProgressForCommit
{
  return self->_interactionProgressForCommit;
}

- (void)setInteractionProgressForCommit:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgressForCommit, a3);
}

- (UIPreviewForceInteractionProgress)interactionProgressForBreathing
{
  return self->_interactionProgressForBreathing;
}

- (void)setInteractionProgressForBreathing:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgressForBreathing, a3);
}

- (_UIPreviewPresentationContainerView)presentationContainerView
{
  return self->_presentationContainerView;
}

- (void)setPresentationContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContainerView, a3);
}

- (_UIPreviewPresentationEffectView)revealContainerView
{
  return self->_revealContainerView;
}

- (void)setRevealContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_revealContainerView, a3);
}

- (UIWindow)initialSourceViewSnapshotWindow
{
  return self->_initialSourceViewSnapshotWindow;
}

- (void)setInitialSourceViewSnapshotWindow:(id)a3
{
  objc_storeStrong((id *)&self->_initialSourceViewSnapshotWindow, a3);
}

- (UIView)initialSourceViewSnapshot
{
  return self->_initialSourceViewSnapshot;
}

- (void)setInitialSourceViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_initialSourceViewSnapshot, a3);
}

- (_UIPreviewPresentationAnimator)unhighlightPreviewCellSnapshotViewAnimator
{
  return self->_unhighlightPreviewCellSnapshotViewAnimator;
}

- (void)setUnhighlightPreviewCellSnapshotViewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightPreviewCellSnapshotViewAnimator, a3);
}

- (void)setPreviewActionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setLeadingPreviewAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void)setTrailingPreviewAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (_UIPreviewQuickActionView)leadingQuickActionView
{
  return self->_leadingQuickActionView;
}

- (void)setLeadingQuickActionView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingQuickActionView, a3);
}

- (_UIPreviewQuickActionView)trailingQuickActionView
{
  return self->_trailingQuickActionView;
}

- (void)setTrailingQuickActionView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingQuickActionView, a3);
}

- (NSLayoutConstraint)leadingQuickActionViewEdgeConstraint
{
  return self->_leadingQuickActionViewEdgeConstraint;
}

- (void)setLeadingQuickActionViewEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingQuickActionViewEdgeConstraint, a3);
}

- (NSLayoutConstraint)trailingQuickActionViewEdgeConstraint
{
  return self->_trailingQuickActionViewEdgeConstraint;
}

- (void)setTrailingQuickActionViewEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingQuickActionViewEdgeConstraint, a3);
}

- (UIImageView)actionSheetAvailableImageView
{
  return self->_actionSheetAvailableImageView;
}

- (void)setActionSheetAvailableImageView:(id)a3
{
  objc_storeStrong((id *)&self->_actionSheetAvailableImageView, a3);
}

- (BOOL)leadingQuickActionViewSelected
{
  return self->_leadingQuickActionViewSelected;
}

- (void)setLeadingQuickActionViewSelected:(BOOL)a3
{
  self->_leadingQuickActionViewSelected = a3;
}

- (BOOL)trailingQuickActionViewSelected
{
  return self->_trailingQuickActionViewSelected;
}

- (void)setTrailingQuickActionViewSelected:(BOOL)a3
{
  self->_trailingQuickActionViewSelected = a3;
}

- (NSLayoutConstraint)containerScrollViewXConstraint
{
  return self->_containerScrollViewXConstraint;
}

- (void)setContainerScrollViewXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerScrollViewXConstraint, a3);
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, a3);
}

- (UIGestureRecognizer)modalPreviewActionsPanningGestureRecognizer
{
  return self->_modalPreviewActionsPanningGestureRecognizer;
}

- (void)setModalPreviewActionsPanningGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_modalPreviewActionsPanningGestureRecognizer, a3);
}

- (BOOL)isAnimatingActionSheet
{
  return self->_isAnimatingActionSheet;
}

- (void)setIsAnimatingActionSheet:(BOOL)a3
{
  self->_isAnimatingActionSheet = a3;
}

- (_UIPlatterMenuDynamicsController)platterMenuController
{
  return self->_platterMenuController;
}

- (void)setPlatterMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_platterMenuController, a3);
}

- (_UIVelocityIntegrator)revealPanningVelocityIntegrator
{
  return self->_revealPanningVelocityIntegrator;
}

- (void)setRevealPanningVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_revealPanningVelocityIntegrator, a3);
}

- (BOOL)hasAskedForDismissalInternally
{
  return self->_hasAskedForDismissalInternally;
}

- (void)setHasAskedForDismissalInternally:(BOOL)a3
{
  self->_hasAskedForDismissalInternally = a3;
}

- (BOOL)hasAskedForCommitInternally
{
  return self->_hasAskedForCommitInternally;
}

- (void)setHasAskedForCommitInternally:(BOOL)a3
{
  self->_hasAskedForCommitInternally = a3;
}

- (BOOL)preDismissAnimationsInflight
{
  return self->_preDismissAnimationsInflight;
}

- (void)setPreDismissAnimationsInflight:(BOOL)a3
{
  self->_preDismissAnimationsInflight = a3;
}

- (BOOL)panningGestureRecognizerInProgress
{
  return self->_panningGestureRecognizerInProgress;
}

- (void)setPanningGestureRecognizerInProgress:(BOOL)a3
{
  self->_panningGestureRecognizerInProgress = a3;
}

- (BOOL)isBreathing
{
  return self->_breathing;
}

- (unint64_t)currentPresentationPhase
{
  return self->_currentPresentationPhase;
}

- (void)setCurrentPresentationPhase:(unint64_t)a3
{
  self->_currentPresentationPhase = a3;
}

- (UIPreviewInteractionController)previewInteractionController
{
  return (UIPreviewInteractionController *)objc_loadWeakRetained((id *)&self->_previewInteractionController);
}

- (void)setPreviewInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_previewInteractionController, a3);
}

- (UIViewControllerPreviewing)previewingContext
{
  return (UIViewControllerPreviewing *)objc_loadWeakRetained((id *)&self->_previewingContext);
}

- (void)setPreviewingContext:(id)a3
{
  objc_storeWeak((id *)&self->_previewingContext, a3);
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->_interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
  objc_destroyWeak((id *)&self->_previewInteractionController);
  objc_storeStrong((id *)&self->_revealPanningVelocityIntegrator, 0);
  objc_storeStrong((id *)&self->_platterMenuController, 0);
  objc_storeStrong((id *)&self->_modalPreviewActionsPanningGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_containerScrollViewXConstraint, 0);
  objc_storeStrong((id *)&self->_actionSheetAvailableImageView, 0);
  objc_storeStrong((id *)&self->_trailingQuickActionViewEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionViewEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_trailingQuickActionView, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionView, 0);
  objc_storeStrong((id *)&self->_trailingPreviewAction, 0);
  objc_storeStrong((id *)&self->_leadingPreviewAction, 0);
  objc_storeStrong((id *)&self->_previewActionItems, 0);
  objc_storeStrong((id *)&self->_unhighlightPreviewCellSnapshotViewAnimator, 0);
  objc_storeStrong((id *)&self->_initialSourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSourceViewSnapshotWindow, 0);
  objc_storeStrong((id *)&self->_revealContainerView, 0);
  objc_storeStrong((id *)&self->_presentationContainerView, 0);
  objc_storeStrong((id *)&self->_interactionProgressForBreathing, 0);
  objc_storeStrong((id *)&self->_interactionProgressForCommit, 0);
  objc_storeStrong((id *)&self->_previewActionSheet, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_actionSheetContainerView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_forcePresentationControllerDelegate);
  objc_storeStrong(&self->_presentationPhaseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_panningGestureRecognizer, 0);
}

@end
