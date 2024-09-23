@implementation _UIPreviewInteractionCommitTransition

- (_UIPreviewInteractionCommitTransition)initWithPresentedViewController:(id)a3
{
  id v5;
  _UIPreviewInteractionCommitTransition *v6;
  _UIPreviewInteractionCommitTransition *v7;
  _UIPreviewInteractionCommitTransition *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionCommitTransition.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewInteractionCommitTransition;
  v6 = -[_UIPreviewInteractionCommitTransition init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UIPreviewInteractionCommitTransition setViewController:](v6, "setViewController:", v5);
    v8 = v7;
  }

  return v7;
}

- (void)performTransitionWithPresentationBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIPreviewInteractionTransitionWindow *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _UIPreviewPresentationEffectView *v15;
  _UIPreviewPresentationEffectView *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  _UIPreviewInteractionTransitionWindow *v20;
  id v21;
  _UIPreviewPresentationEffectView *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[5];
  _UIPreviewPresentationEffectView *v37;
  id v38;
  _UIPreviewInteractionTransitionWindow *v39;
  id v40;
  BOOL v41;

  v6 = a3;
  v7 = a4;
  -[_UIPreviewInteractionCommitTransition viewController](self, "viewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "containerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(_UIPreviewInteractionTransitionWindow);
  -[UIWindow setHidden:](v9, "setHidden:", 0);
  -[UIView bounds](v9, "bounds");
  _UISnapshotScreenAtViewRectAfterCommit(v9, 0, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [_UIPreviewPresentationEffectView alloc];
  objc_msgSend(v14, "frame");
  v16 = -[_UIPreviewPresentationEffectView initWithFrame:](v15, "initWithFrame:");
  -[UIView addSubview:](v16, "addSubview:", v14);
  -[UIView addSubview:](v9, "addSubview:", v16);
  -[_UIPreviewInteractionCommitTransition setCurrentCommitEffectWindow:](self, "setCurrentCommitEffectWindow:", v9);
  v17 = -[_UIPreviewInteractionCommitTransition _shouldReduceMotion](self, "_shouldReduceMotion");
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke;
  aBlock[3] = &unk_1E16BADB8;
  v41 = v17;
  aBlock[4] = self;
  v37 = v16;
  v38 = v8;
  v39 = v9;
  v40 = v7;
  v19 = v7;
  v20 = v9;
  v21 = v8;
  v22 = v16;
  v23 = _Block_copy(aBlock);
  objc_msgSend(v21, "windowScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "keyboardSceneDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "_beginDisablingAnimations");
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_5;
  v32[3] = &unk_1E16BC058;
  v33 = v25;
  v34 = v6;
  v35 = v23;
  v26 = v23;
  v27 = v25;
  v28 = v6;
  objc_msgSend(v29, "dismissViewControllerAnimated:completion:", 0, v32);
  +[UIWindow _synchronizeDrawingWithPreCommitHandler:](UIWindow, "_synchronizeDrawingWithPreCommitHandler:", 0);

}

- (id)_preferredTransitionAnimator
{
  UISpringTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 4.2, 620.0, 840.0, 0.0, 0.0);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.0);

  return v3;
}

- (id)_preferredTransitionAnimatorForReducedMotion
{
  UICubicTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 0);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.2);

  return v3;
}

- (void)_applyCommitEffectTransformToView:(id)a3
{
  id v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (a3)
  {
    memset(&v8, 0, sizeof(v8));
    v3 = a3;
    objc_msgSend(v3, "transform");
    v6 = v8;
    CGAffineTransformScale(&v7, &v6, 1.75, 1.75);
    v5 = v7;
    objc_msgSend(v3, "setTransform:", &v5);
    v4 = v8;
    objc_msgSend(v3, "setTransform:", &v4);

  }
}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UIWindow)currentCommitEffectWindow
{
  return self->_currentCommitEffectWindow;
}

- (void)setCurrentCommitEffectWindow:(id)a3
{
  objc_storeStrong((id *)&self->_currentCommitEffectWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommitEffectWindow, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
