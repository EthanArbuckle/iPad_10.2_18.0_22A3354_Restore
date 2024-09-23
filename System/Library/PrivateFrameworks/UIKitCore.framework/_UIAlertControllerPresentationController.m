@implementation _UIAlertControllerPresentationController

- (BOOL)_canDismissPresentation
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInteractive");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_canCommitPresentation
{
  return 0;
}

- (_UIAlertControllerPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  _UIAlertControllerPresentationController *v7;
  _UIAlertControllerPresentationController *v8;
  _UIKeyboardLayoutAlignmentView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _UIKeyboardLayoutAlignmentView *keyboardLayoutAlignmentView;
  UIView *v16;
  UIView *keyboardLayoutAlignmentAvailableSpaceView;
  void *v18;
  void *v19;
  _UIStatesFeedbackGenerator *v20;
  void *v21;
  _UIStatesFeedbackGenerator *v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIAlertControllerPresentationController;
  v7 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v24, sel_initWithPresentedViewController_presentingViewController_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[_UIAlertControllerPresentationController setDelegate:](v7, "setDelegate:", v7);
    v9 = [_UIKeyboardLayoutAlignmentView alloc];
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = -[_UIKeyboardLayoutAlignmentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    keyboardLayoutAlignmentView = v8->keyboardLayoutAlignmentView;
    v8->keyboardLayoutAlignmentView = (_UIKeyboardLayoutAlignmentView *)v14;

    v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
    keyboardLayoutAlignmentAvailableSpaceView = v8->keyboardLayoutAlignmentAvailableSpaceView;
    v8->keyboardLayoutAlignmentAvailableSpaceView = v16;

    -[UIView setUserInteractionEnabled:](v8->keyboardLayoutAlignmentAvailableSpaceView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->keyboardLayoutAlignmentAvailableSpaceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[_UIStatesFeedbackGeneratorPreviewConfiguration defaultConfiguration](_UIStatesFeedbackGeneratorPreviewConfiguration, "defaultConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("previewInteractionPresentation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [_UIStatesFeedbackGenerator alloc];
    objc_msgSend(v6, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v20, "initWithConfiguration:view:", v19, v21);
    -[_UIAlertControllerPresentationController setFeedbackGenerator:](v8, "setFeedbackGenerator:", v22);

  }
  return v8;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  -[_UIAlertControllerPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
  -[_UIAlertControllerPresentationController _prepareConstraintsIfNecessary](self, "_prepareConstraintsIfNecessary");
  -[_UIAlertControllerPresentationController _updateConstraintsIfNecessary](self, "_updateConstraintsIfNecessary");
}

- (void)containerViewDidLayoutSubviews
{
  UIView *dimmingView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPresentationController;
  -[UIPresentationController containerViewDidLayoutSubviews](&v5, sel_containerViewDidLayoutSubviews);
  dimmingView = self->_dimmingView;
  if (dimmingView)
  {
    -[UIPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[UIView setFrame:](dimmingView, "setFrame:");

  }
}

- (BOOL)shouldPresentInFullscreen
{
  return !-[_UIAlertControllerPresentationController _isCurrentContext](self, "_isCurrentContext");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UIAlertControllerPresentationController;
  -[UIPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v24, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v7 = v6;
  v8 = v5;
  if (v6 != *MEMORY[0x1E0C9D820] || v5 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v4, "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsetsForContainerView:", v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = v7 + v15 + v19;
    v21 = v8 + v13 + v17;
    -[UIPresentationController preferredContentSize](self, "preferredContentSize");
    if (v20 >= v22)
      v22 = v20;
    if (v21 >= v23)
      v23 = v21;
    -[UIPresentationController _setPreferredContentSize:](self, "_setPreferredContentSize:", v22, v23);

  }
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_prepareDimmingViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *dimmingView;
  UIView *v10;
  void *v11;
  id v12;

  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPresentationController _dimmingView](self, "_dimmingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || v4 || !v3)
  {
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v12, "_allowsShowingDimmingView"))
  {
    -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPresentationController _dimmingView](self, "_dimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(v4, "_visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dimmingViewForAlertController:", v4);
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    dimmingView = self->_dimmingView;
    self->_dimmingView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = self->_dimmingView;
    if (v10)
    {
      objc_msgSend(v5, "insertSubview:atIndex:", v10, 0);
      objc_msgSend(v5, "sendSubviewToBack:", v10);
      if (objc_msgSend(v4, "_canDismissWithGestureRecognizer"))
      {
        objc_msgSend(v4, "_dismissGestureRecognizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView addGestureRecognizer:](v10, "addGestureRecognizer:", v11);

      }
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerPresentationController;
  -[UIPresentationController _willRunTransitionForCurrentStateDeferred:](&v4, sel__willRunTransitionForCurrentStateDeferred_, a3);
  if (!-[UIPresentationController presenting](self, "presenting"))
    -[_UIKeyboardLayoutAlignmentView setAutomaticKeyboardFrameTrackingDisabled:](self->keyboardLayoutAlignmentView, "setAutomaticKeyboardFrameTrackingDisabled:", 1);
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UIPresentationController containerView](self, "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "_transitionCoordinator");

  objc_msgSend(v12, "insertSubview:atIndex:", self->keyboardLayoutAlignmentView, 0);
  objc_msgSend(v12, "insertSubview:atIndex:", self->keyboardLayoutAlignmentAvailableSpaceView, 0);
  -[UIPresentationController presentedView](self, "presentedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v5);

  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateProvidedStyleWithTraitCollection:", v8);

  -[_UIAlertControllerPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
  -[_UIAlertControllerPresentationController _prepareConstraintsIfNecessary](self, "_prepareConstraintsIfNecessary");
  objc_msgSend(v12, "layoutIfNeeded");
  -[_UIAlertControllerPresentationController forcePresentationControllerDelegate](self, "forcePresentationControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "forcePresentationTransitionWillBegin:", self);
    +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSampleRate:", 0.0);

    +[_UIStatistics previewInteractionAlertPresentationCount](_UIStatistics, "previewInteractionAlertPresentationCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementValueBy:", 1);

  }
}

- (BOOL)_preserveResponderAcrossWindows
{
  void *v2;
  void *v3;
  char v4;

  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPreserveRespondersAcrossWindows");

  return v4;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return !-[_UIAlertControllerPresentationController _preserveResponderAcrossWindows](self, "_preserveResponderAcrossWindows");
}

- (BOOL)_shouldOccludeDuringPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldOccludeDuringPresentation");

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_UIAlertControllerPresentationController;
  v7 = a4;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95___UIAlertControllerPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E16B2150;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)_prepareConstraintsIfNecessary
{
  void *v3;
  UIView *v4;
  void *v5;
  UIAlertVisualStyleUpdatableConstraints *v7;
  UIAlertVisualStyleUpdatableConstraints *visualStyleUpdatableConstraints;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  UIView *keyboardLayoutAlignmentAvailableSpaceView;
  UIView *v16;
  id v17;
  UIView *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  UIView *v24;
  _UIAlertControllerPresentationController *v25;
  id v26;
  UIView *v27;

  if (!self->constraintsPrepared)
  {
    -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isDescendantOfView:", v4))
    {
      if (-[UIView isDescendantOfView:](self->keyboardLayoutAlignmentAvailableSpaceView, "isDescendantOfView:", v4)
        && v5 != 0)
      {
        self->constraintsPrepared = 1;
        v7 = (UIAlertVisualStyleUpdatableConstraints *)objc_opt_new();
        visualStyleUpdatableConstraints = self->_visualStyleUpdatableConstraints;
        self->_visualStyleUpdatableConstraints = v7;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->keyboardLayoutAlignmentAvailableSpaceView, 3, 0, v4, 3, 1.0, 0.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->keyboardLayoutAlignmentAvailableSpaceView, 4, 0, self->keyboardLayoutAlignmentView, 3, 1.0, 0.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->keyboardLayoutAlignmentAvailableSpaceView, 7, 0, v4, 7, 1.0, 0.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->keyboardLayoutAlignmentAvailableSpaceView, 1, 0, v4, 1, 1.0, 0.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

        v14 = objc_msgSend(v19, "_alignsToKeyboard");
        keyboardLayoutAlignmentAvailableSpaceView = v4;
        if (v14)
          keyboardLayoutAlignmentAvailableSpaceView = self->keyboardLayoutAlignmentAvailableSpaceView;
        v16 = keyboardLayoutAlignmentAvailableSpaceView;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __74___UIAlertControllerPresentationController__prepareConstraintsIfNecessary__block_invoke;
        v20[3] = &unk_1E16B2AF0;
        v21 = v5;
        v22 = v19;
        v23 = v3;
        v24 = v16;
        v25 = self;
        v26 = v9;
        v27 = v4;
        v17 = v9;
        v18 = v16;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);

      }
    }

  }
}

- (void)_updateConstraintsIfNecessary
{
  UIView *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UIView *keyboardLayoutAlignmentAvailableSpaceView;
  UIView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (self->constraintsPrepared)
  {
    v17 = v3;
    v4 = !-[UIAlertVisualStyleUpdatableConstraints hasUpdatableConstraints](self->_visualStyleUpdatableConstraints, "hasUpdatableConstraints");
    v3 = v17;
    v4 = v4 || v17 == 0;
    if (!v4)
    {
      -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_msgSend(v5, "_alignsToKeyboard");
        keyboardLayoutAlignmentAvailableSpaceView = v17;
        if (v8)
          keyboardLayoutAlignmentAvailableSpaceView = self->keyboardLayoutAlignmentAvailableSpaceView;
        v10 = keyboardLayoutAlignmentAvailableSpaceView;
        objc_msgSend(v5, "_visualStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "positionContentsOfAlertController:alertContentView:availableSpaceView:visualStyle:updatableConstraints:", v5, v6, v10, v11, self->_visualStyleUpdatableConstraints);
        -[UIPresentationController containerView](self, "containerView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentInsetsForContainerView:", v12);
        v14 = v13;
        v16 = v15;

        -[NSLayoutConstraint setConstant:](self->_topAvailableSpaceConstraint, "setConstant:", v14);
        -[NSLayoutConstraint setConstant:](self->_bottomAvailableSpaceConstraint, "setConstant:", -v16);

      }
      v3 = v17;
    }
  }

}

- (void)_presentedAlertControllerDidAdapt
{
  UIAlertVisualStyleUpdatableConstraints *visualStyleUpdatableConstraints;
  NSLayoutConstraint *topAvailableSpaceConstraint;
  NSLayoutConstraint *bottomAvailableSpaceConstraint;

  self->constraintsPrepared = 0;
  visualStyleUpdatableConstraints = self->_visualStyleUpdatableConstraints;
  self->_visualStyleUpdatableConstraints = 0;

  topAvailableSpaceConstraint = self->_topAvailableSpaceConstraint;
  self->_topAvailableSpaceConstraint = 0;

  bottomAvailableSpaceConstraint = self->_bottomAvailableSpaceConstraint;
  self->_bottomAvailableSpaceConstraint = 0;

}

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "styleForAlertPresentationController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIAlertControllerPresentationController;
    -[UIPresentationController _createVisualStyleForProvider:](&v7, sel__createVisualStyleForProvider_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  _UIAlertControllerPresentationController *v5;
  void *v6;
  objc_super v7;

  v5 = (_UIAlertControllerPresentationController *)a3;
  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlertControllerPresentationController.m"), 346, CFSTR("The presentation controller of an alert controller presenting as an alert must not have its delegate modified"));

  }
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerPresentationController;
  -[UIPresentationController setDelegate:](&v7, sel_setDelegate_, v5);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (id)_presentedAlertController
{
  void *v4;
  void *v5;
  void *v7;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EDE346C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlertControllerPresentationController.m"), 369, CFSTR("presentedViewController of _UIAlertControllerPresentationController does not contain an alert controller"));

  }
  objc_msgSend(v4, "_containedAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPanningGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIAlertControllerPresentationController _presentedAlertController](self, "_presentedAlertController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSystemProvidedGestureRecognizer:", v4);

}

- (void)_setChromeHidden:(BOOL)a3
{
  if (self->_chromeHidden != a3)
  {
    self->_chromeHidden = a3;
    -[UIView setHidden:](self->_dimmingView, "setHidden:");
  }
}

- (UIView)_dimmingView
{
  return (UIView *)objc_getProperty(self, a2, 352, 1);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate
{
  return (_UIForcePresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_forcePresentationControllerDelegate);
}

- (void)setForcePresentationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forcePresentationControllerDelegate, a3);
}

- (UIView)_revealContainerView
{
  return self->_revealContainerView;
}

- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed
{
  return self->_sourceViewSnapshotAndScaleTransformSuppressed;
}

- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3
{
  self->_sourceViewSnapshotAndScaleTransformSuppressed = a3;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)_isChromeHidden
{
  return self->_chromeHidden;
}

- (BOOL)_isCurrentContext
{
  return self->__isCurrentContext;
}

- (void)_setIsCurrentContext:(BOOL)a3
{
  self->__isCurrentContext = a3;
}

- (BOOL)_shouldRespectNearestCurrentContextPresenter
{
  return self->__shouldRespectNearestCurrentContextPresenter;
}

- (void)_setShouldRespectNearestCurrentContextPresenter:(BOOL)a3
{
  self->__shouldRespectNearestCurrentContextPresenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_revealContainerView, 0);
  objc_destroyWeak((id *)&self->_forcePresentationControllerDelegate);
  objc_storeStrong(&self->_presentationPhaseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_panningGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomAvailableSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_topAvailableSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_visualStyleUpdatableConstraints, 0);
  objc_storeStrong((id *)&self->keyboardLayoutAlignmentAvailableSpaceView, 0);
  objc_storeStrong((id *)&self->keyboardLayoutAlignmentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
