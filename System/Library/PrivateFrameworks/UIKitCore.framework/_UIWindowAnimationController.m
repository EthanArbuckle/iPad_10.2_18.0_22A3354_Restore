@implementation _UIWindowAnimationController

+ (_UIWindowAnimationController)animationControllerWithWindow:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWindow:", v3);

  return (_UIWindowAnimationController *)v4;
}

- (_UIWindowAnimationController)initWithWindow:(id)a3
{
  id v4;
  _UIWindowAnimationController *v5;
  _UIWindowAnimationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowAnimationController;
  v5 = -[_UIWindowAnimationController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIWindowAnimationController setWindow:](v5, "setWindow:", v4);
    objc_msgSend(v4, "_setAnimationController:", v6);
  }

  return v6;
}

- (void)setWindow:(id)a3
{
  self->_window = (UIWindow *)a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (double)transitionDuration:(id)a3
{
  return 0.15;
}

- (void)_performCrossfadeAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _QWORD *v8;
  UIWindow *v9;
  uint64_t v10;
  double v11;
  UIViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  UIViewController *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  UIViewController *v26;
  _UIWindowAnimationController *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[3];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "containerView");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9 = [UIWindow alloc];
  objc_msgSend(v8, "frame");
  v10 = -[UIWindow initWithFrame:](v9, "initWithFrame:");
  objc_msgSend((id)v10, "setHidden:", 0);
  objc_msgSend(v8, "level");
  objc_msgSend((id)v10, "setLevel:", v11 + 1.0);
  v12 = objc_alloc_init(UIViewController);
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
    -[UIViewController _setAllowsAutorotation:](v12, "_setAllowsAutorotation:", 0);
  objc_storeStrong((id *)(v10 + 568), v12);
  objc_storeWeak((id *)(v10 + 448), v12);
  objc_msgSend((id)v10, "_updateTransformLayer");
  v13 = *(void **)(v10 + 544);
  v14 = (void *)v8[68];
  if (v14)
    objc_msgSend(v14, "affineTransform");
  else
    memset(v37, 0, sizeof(v37));
  objc_msgSend(v13, "setAffineTransform:", v37);
  objc_msgSend(v8, "frame");
  objc_msgSend((id)v10, "setFrame:");
  objc_msgSend(v8, "snapshotView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  -[UIViewController view](v12, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v15);

  v7[2](v7);
  objc_msgSend(v6, "__runAlongsideAnimations");
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  objc_msgSend(v8, "transform");
  CGAffineTransformMakeScale(&v33, 0.0, 0.0);
  objc_msgSend(v8, "setTransform:", &v33);
  v17 = (void *)UIApp;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke;
  v23[3] = &unk_1E16C2C80;
  v24 = v8;
  v25 = v15;
  v26 = v12;
  v27 = self;
  v28 = v6;
  v29 = (id)v10;
  v30 = v34;
  v31 = v35;
  v32 = v36;
  v18 = (id)v10;
  v19 = v6;
  v20 = v12;
  v21 = v15;
  v22 = v8;
  objc_msgSend(v17, "_performBlockAfterCATransactionCommits:", v23);

}

- (void)_performLayoutAnimationWithContext:(id)a3 windowGeometryUpdatingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWindowAnimationController transitionDuration:](self, "transitionDuration:", v8);
  v11 = v10;
  v12 = objc_msgSend(v8, "_completionCurve");
  v13 = MEMORY[0x1E0C809B0];
  v14 = v12 << 16;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke;
  v21[3] = &unk_1E16B2F48;
  v23 = v7;
  v15 = v8;
  v22 = v15;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2;
  v18[3] = &unk_1E16B2218;
  v19 = v15;
  v20 = v9;
  v16 = v9;
  v17 = v7;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v14, v21, v18, v11, 0.0);

}

- (void)animateTransition:(id)a3
{
  id v4;
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
  _QWORD aBlock[4];
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAnimated"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UIWindowAnimationController_animateTransition___block_invoke;
    aBlock[3] = &unk_1E16B20D8;
    v17 = v14;
    v18 = v7;
    v19 = v9;
    v20 = v11;
    v21 = v13;
    v15 = _Block_copy(aBlock);
    if (-[_UIWindowAnimationController shouldCrossfade](self, "shouldCrossfade"))
      -[_UIWindowAnimationController _performCrossfadeAnimationWithContext:windowGeometryUpdatingBlock:](self, "_performCrossfadeAnimationWithContext:windowGeometryUpdatingBlock:", v4, v15);
    else
      -[_UIWindowAnimationController _performLayoutAnimationWithContext:windowGeometryUpdatingBlock:](self, "_performLayoutAnimationWithContext:windowGeometryUpdatingBlock:", v4, v15);
    objc_msgSend(v4, "_setTransitionIsInFlight:", 1);

  }
  else
  {
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
    objc_msgSend(v4, "__runAlongsideAnimations");
    objc_msgSend(v4, "completeTransition:", 1);
    objc_msgSend(v4, "_setAnimator:", 0);
    objc_msgSend(v14, "_setAnimationController:", 0);
  }

}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

@end
