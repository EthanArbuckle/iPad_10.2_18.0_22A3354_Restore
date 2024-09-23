@implementation UIKeyboardCameraPadPresentationController

- (BOOL)updatesGuideDuringRotation
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  _UIAssertion *v4;
  _UIAssertion *keyboardSuppressionAssertion;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vendKeyboardSuppressionAssertionForReason:", CFSTR("Keyboard Camera"));
  v4 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
  keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
  self->_keyboardSuppressionAssertion = v4;

  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 2, 1);
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 2, 0);
}

- (void)dismissalTransitionWillBegin
{
  _UIAssertion *keyboardSuppressionAssertion;

  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 3, 1);
  keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
  self->_keyboardSuppressionAssertion = 0;

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 3, 0);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", objc_msgSend(v3, "interfaceOrientation"));
  v5 = v4;

  if (v5 > 400.0)
    v6 = v5;
  else
    v6 = 400.0;
  -[UIPresentationController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v16 = CGRectGetHeight(v20) - v6;
  v17 = v6 + -30.0;
  v18 = v9 + 30.0;
  v19 = v13 + -60.0;
  result.size.height = v17;
  result.size.width = v19;
  result.origin.y = v16;
  result.origin.x = v18;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardCameraPadPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x4010000000;
  v13[3] = &unk_18685B0AF;
  v14 = 0u;
  v15 = 0u;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4010000000;
  v10[3] = &unk_18685B0AF;
  v11 = 0u;
  v12 = 0u;
  v8[6] = v10;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E16B3F88;
  v9[4] = self;
  v9[5] = v13;
  v9[6] = v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E16B3FB0;
  v8[4] = self;
  v8[5] = v13;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v13, 8);

}

uint64_t __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double *v13;
  void *v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "frame");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  objc_msgSend(*(id *)(a1 + 32), "frameOfPresentedViewInContainerView");
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  v12 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 2, 1, v12[4], v12[5], v12[6], v12[7], v13[4], v13[5], v13[6], v13[7]);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "setFrame:");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
}

uint64_t __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double *v1;
  double *v2;

  v1 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 2, 0, v1[4], v1[5], v1[6], v1[7], v2[4], v2[5], v2[6], v2[7]);
}

- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3
{
  return 9;
}

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  if (self->_shadowView)
    -[UIKeyboardCameraPadPresentationController _animateDismissTransition:](self, "_animateDismissTransition:", a3);
  else
    -[UIKeyboardCameraPadPresentationController _animatePresentTransition:](self, "_animatePresentTransition:", a3);
}

- (void)_animateDismissTransition:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke_2;
  v5[3] = &unk_1E16B2218;
  v5[4] = self;
  v4 = v6;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v7, v5, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

}

uint64_t __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.6, 0.6);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", a2);
}

- (void)_animatePresentTransition:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UIKeyboardCameraPadPresentationController *v9;
  UIDimmingView *v10;
  UIDimmingView *dimmingView;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *v21;
  UIView *shadowView;
  UIView *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  CGAffineTransform v37;
  CGAffineTransform v38;

  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIgnoresInteractionEvents:", 0);
  objc_msgSend(v8, "setIgnoreDirectTouchEvents:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraPadPresentationController.m"), 150, CFSTR("Keyboard Camera is being presented in something other than a UITransitionView."));

  }
  objc_msgSend(v8, "delegate");
  v9 = (UIKeyboardCameraPadPresentationController *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraPadPresentationController.m"), 151, CFSTR("Expecting to be the delegate of the UITransitionView for UITextEffectsWindow."));

  }
  v10 = objc_alloc_init(UIDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v10;

  -[UIKeyboardCameraPadPresentationController dimmingViewDelegate](self, "dimmingViewDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", v12);

  objc_msgSend(v8, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  objc_msgSend(v5, "finalFrameForViewController:", v6);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_alloc_init(UIView);
  shadowView = self->_shadowView;
  self->_shadowView = v21;

  -[UIView setFrame:](self->_shadowView, "setFrame:", v14, v16, v18, v20);
  -[UIView bounds](self->_shadowView, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setClipsToBounds:", 1);
  objc_msgSend(v7, "_setContinuousCornerRadius:", 15.0);
  -[UIView addSubview:](self->_shadowView, "addSubview:", v7);
  objc_msgSend(v8, "addSubview:", self->_dimmingView);
  objc_msgSend(v8, "addSubview:", self->_shadowView);
  -[UIView setAlpha:](self->_shadowView, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v38, 0.6, 0.6);
  v23 = self->_shadowView;
  v37 = v38;
  -[UIView setTransform:](v23, "setTransform:", &v37);
  -[UIView layer](self->_shadowView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 0.25;
  objc_msgSend(v24, "setShadowOpacity:", v25);

  -[UIView layer](self->_shadowView, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowRadius:", 30.0);

  -[UIView layer](self->_shadowView, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowOffset:", 0.0, -10.0);

  +[UIColor blackColor](UIColor, "blackColor");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend(v28, "CGColor");
  -[UIView layer](self->_shadowView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setShadowColor:", v29);

  v35 = v5;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke;
  v36[3] = &unk_1E16B1B28;
  v36[4] = self;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke_2;
  v34[3] = &unk_1E16B3FD8;
  v31 = v5;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v36, v34, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

}

uint64_t __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setAlpha:", 1.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (UIDimmingViewDelegate)dimmingViewDelegate
{
  return (UIDimmingViewDelegate *)objc_loadWeakRetained((id *)&self->_dimmingViewDelegate);
}

- (void)setDimmingViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dimmingViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dimmingViewDelegate);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionAssertion, 0);
}

@end
