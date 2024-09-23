@implementation UIViewControllerBuiltinTransitionViewAnimator

- (UIViewControllerBuiltinTransitionViewAnimator)initWithTransition:(int)a3
{
  UIViewControllerBuiltinTransitionViewAnimator *v4;
  UIViewControllerBuiltinTransitionViewAnimator *v5;
  UIViewControllerBuiltinTransitionViewAnimator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerBuiltinTransitionViewAnimator;
  v4 = -[UIViewControllerBuiltinTransitionViewAnimator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_transition = a3;
    v6 = v4;
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3;
  double result;
  id WeakRetained;
  double v7;
  double v8;

  v3 = *(_QWORD *)&a3;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", v3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "durationForTransition:", v3);
    v8 = v7;

    return v8;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  double result;

  -[UIViewControllerBuiltinTransitionViewAnimator durationForTransition:](self, "durationForTransition:", self->_transition);
  return result;
}

- (void)animateTransition:(id)a3
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  UIViewControllerContextTransitioning **p_transitionContext;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int transition;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIView **p_toView;
  id v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  int v43;
  void *v44;
  uint64_t v45;
  _UIFlippingView *v46;
  id v47;
  _UIFlippingView *v48;
  id v49;
  void *v50;
  double v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  int v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  uint64_t v82;
  id v83;
  void *v84;
  char v85;
  char v86;
  _QWORD v87[5];
  id v88;
  _UIFlippingView *v89;
  id v90;
  CATransform3D v91;
  char v92;
  char v93;
  _QWORD v94[4];
  _UIFlippingView *v95;
  uint64_t v96;
  double v97;
  _OWORD v98[5];
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  CATransform3D v103;
  CATransform3D v104;
  CATransform3D v105;
  CATransform3D v106;
  _QWORD v107[5];
  id v108;
  _QWORD v109[5];
  id v110;
  CATransform3D *v111;
  _QWORD v112[4];
  id v113;
  UIViewControllerBuiltinTransitionViewAnimator *v114;
  CATransform3D *v115;

  v6 = a3;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "_toView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_toView, v8);

      objc_msgSend(v7, "_fromView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_fromView, v9);
LABEL_6:

      goto LABEL_7;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_toView);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v7 = 0;
    goto LABEL_6;
  }
  v7 = objc_loadWeakRetained((id *)&self->_fromView);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerBuiltinTransitionViewAnimator.m"), 74, CFSTR("toView or fromView should be set in order for UIViewControllerBuiltinTransitionViewAnimator to work."));
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:
  p_transitionContext = &self->_transitionContext;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  objc_msgSend(v6, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = objc_opt_class();

  if (v13 != v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerBuiltinTransitionViewAnimator.m"), 77, CFSTR("UIViewControllerBuiltinTransitionViewAnimator can only operate on a container view of type UITransitionView."));

  }
  objc_msgSend(v6, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    transition = self->_transition;
    if (transition == 17 || transition == 13)
    {
      objc_msgSend(v16, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layoutIfNeeded");

    }
    objc_msgSend(v15, "setIgnoresInteractionEvents:", 0);
    objc_msgSend(v15, "setShouldNotifyDidCompleteImmediately:", 1);
    -[UIViewControllerContextTransitioning finalFrameForViewController:](self->_transitionContext, "finalFrameForViewController:", v17);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    p_toView = &self->_toView;
    v29 = objc_loadWeakRetained((id *)&self->_toView);
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

    v30 = self->_transition;
    if ((v30 - 10) < 2)
    {
      v31 = objc_loadWeakRetained((id *)&self->_fromView);
      objc_msgSend(v31, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v32, "isDoubleSided");

      v33 = objc_loadWeakRetained((id *)&self->_toView);
      objc_msgSend(v33, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = objc_msgSend(v34, "isDoubleSided");

      memset(&v106, 0, sizeof(v106));
      v35 = objc_loadWeakRetained((id *)&self->_toView);
      objc_msgSend(v35, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v85 = (char)v32;
      if (v36)
        objc_msgSend(v36, "transform");
      else
        memset(&v106, 0, sizeof(v106));

      v48 = objc_alloc_init(_UIFlippingView);
      objc_msgSend(v15, "frame");
      -[UIView setFrame:](v48, "setFrame:");
      -[UIView setAutoresizingMask:](v48, "setAutoresizingMask:", 18);
      v49 = objc_loadWeakRetained((id *)&self->_toView);
      objc_msgSend(v49, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setDoubleSided:", 0);

      v104 = v106;
      v51 = 1.0;
      CATransform3DRotate(&v105, &v104, 3.14159265, 0.0, 1.0, 0.0);
      v52 = objc_loadWeakRetained((id *)&self->_toView);
      objc_msgSend(v52, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v105;
      objc_msgSend(v53, "setTransform:", &v103);

      v54 = objc_loadWeakRetained((id *)&self->_fromView);
      objc_msgSend(v54, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setDoubleSided:", 0);

      objc_msgSend(v15, "addSubview:", v48);
      v56 = objc_loadWeakRetained((id *)&self->_toView);
      -[UIView addSubview:](v48, "addSubview:", v56);

      v57 = objc_loadWeakRetained((id *)&self->_fromView);
      -[UIView addSubview:](v48, "addSubview:", v57);

      objc_msgSend(v15, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v98[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v98[3] = v59;
      v98[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v60 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
      v61 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v98[0] = *MEMORY[0x1E0CD2610];
      v98[1] = v61;
      v99 = v60;
      v100 = 0x3F4B4E81B4E81B4FLL;
      v62 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v101 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v102 = v62;
      objc_msgSend(v58, "setSublayerTransform:", v98);

      v63 = self->_transition;
      -[UIView layer](v48, "layer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v64;
      if (v63 == 10)
        v66 = 1.0;
      else
        v66 = -1.0;
      if (v63 == 10)
        v51 = 0.0;
      objc_msgSend(v64, "position");
      v68 = v67;
      objc_msgSend(v65, "bounds");
      v70 = v69;
      objc_msgSend(v65, "anchorPoint");
      v72 = v68 + v70 * (v51 - v71);
      objc_msgSend(v65, "position");
      v74 = v73;
      objc_msgSend(v65, "bounds");
      v76 = v75;
      objc_msgSend(v65, "anchorPoint");
      objc_msgSend(v65, "setPosition:", v72, v74 + v76 * (0.5 - v77));
      objc_msgSend(v65, "setAnchorPoint:", v51, 0.5);

      if (objc_msgSend(v6, "isInteractive"))
        v78 = 196608;
      else
        v78 = 0;
      if (objc_msgSend(v7, "_allowUserInteraction"))
        v79 = v78 | 2;
      else
        v79 = v78;
      -[UIViewControllerBuiltinTransitionViewAnimator transitionDuration:](self, "transitionDuration:", v6);
      v81 = v80;
      v82 = MEMORY[0x1E0C809B0];
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_5;
      v94[3] = &unk_1E16B4E70;
      v95 = v48;
      v96 = 0x4072C00000000000;
      v97 = v66;
      v87[0] = v82;
      v87[1] = 3221225472;
      v87[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_7;
      v87[3] = &unk_1E16C2658;
      v87[4] = self;
      v88 = v15;
      v89 = v95;
      v91 = v106;
      v92 = v85;
      v93 = v86;
      v90 = v6;
      v46 = v95;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v79, v94, v87, v81, 0.0);

LABEL_42:
LABEL_43:

      goto LABEL_44;
    }
    if (v30)
    {
      if (objc_msgSend(v6, "isInteractive"))
        objc_msgSend(v15, "setAnimationTimingCurve:", 3);
      v45 = self->_transition;
      v46 = (_UIFlippingView *)objc_loadWeakRetained((id *)&self->_fromView);
      v47 = objc_loadWeakRetained((id *)p_toView);
      objc_msgSend(v15, "transition:fromView:toView:removeFromView:", v45, v46, v47, 0);

      goto LABEL_42;
    }
    if (v7)
    {
      if ((objc_msgSend(v7, "_isDeferred") & 1) != 0)
      {
LABEL_22:
        v104.m11 = 0.0;
        *(_QWORD *)&v104.m12 = &v104;
        *(_QWORD *)&v104.m13 = 0x2020000000;
        LOBYTE(v104.m14) = 0;
        v106.m11 = 0.0;
        *(_QWORD *)&v106.m12 = &v106;
        *(_QWORD *)&v106.m13 = 0x3032000000;
        *(_QWORD *)&v106.m14 = __Block_byref_object_copy__61;
        *(_QWORD *)&v106.m21 = __Block_byref_object_dispose__61;
        v106.m22 = 0.0;
        v41 = MEMORY[0x1E0C809B0];
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke;
        v112[3] = &unk_1E16BDBB0;
        v113 = v15;
        v114 = self;
        v115 = &v106;
        v109[0] = v41;
        v109[1] = 3221225472;
        v109[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_3;
        v109[3] = &unk_1E16C2608;
        v111 = &v104;
        v109[4] = self;
        v42 = v6;
        v110 = v42;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v112, v109, 0.0, 0.0);
        v43 = objc_msgSend(*(id *)(*(_QWORD *)&v106.m12 + 40), "_didEndCount");
        *(_BYTE *)(*(_QWORD *)&v104.m12 + 24) = v43 > 0;
        if (v43 <= 0)
        {
          v44 = (void *)UIApp;
          v107[0] = v41;
          v107[1] = 3221225472;
          v107[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_4;
          v107[3] = &unk_1E16B1B50;
          v107[4] = self;
          v108 = v42;
          objc_msgSend(v44, "_performBlockAfterCATransactionCommits:", v107);

        }
        _Block_object_dispose(&v106, 8);

        _Block_object_dispose(&v104, 8);
        goto LABEL_43;
      }
    }
    else if (+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions"))
    {
      goto LABEL_22;
    }
    v83 = objc_loadWeakRetained((id *)&self->_toView);
    objc_msgSend(v15, "addSubview:", v83);

    -[UIViewControllerContextTransitioning completeTransition:](*p_transitionContext, "completeTransition:", objc_msgSend(v6, "transitionWasCancelled") ^ 1);
    goto LABEL_43;
  }
  v38 = self->_transition;
  v39 = objc_loadWeakRetained((id *)&self->_fromView);
  v40 = objc_loadWeakRetained((id *)&self->_toView);
  objc_msgSend(v15, "transition:fromView:toView:removeFromView:", v38, v39, v40, self->_removeFromView);

LABEL_44:
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (void)transitionViewDidStart:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel_transitionDidStart, 0, 0.0);
  }
  else
  {
    objc_msgSend(WeakRetained, "transitionViewDidStart:", v5);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fromView);
  objc_destroyWeak((id *)&self->_toView);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

- (int)transition
{
  return self->_transition;
}

- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y;
  double x;
  uint64_t v8;
  id v11;
  id v12;
  void *WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int transition;
  BOOL v19;
  int v20;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:beginOriginForToView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    goto LABEL_9;
  }
  -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning finalFrameForViewController:](self->_transitionContext, "finalFrameForViewController:", WeakRetained);
  v16 = v14;
  v17 = v15;
  transition = self->_transition;
  v19 = transition > 0x14;
  v20 = (1 << transition) & 0x137E40;
  if (v19 || v20 == 0)
  {
    -[UIViewControllerBuiltinTransitionViewAnimator _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v14, v15);
LABEL_9:
    v16 = v22;
    v17 = v23;
  }

  v24 = v16;
  v25 = v17;
  result.y = v25;
  result.x = v24;
  return result;
}

- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5
{
  double y;

  if ((a5 - 1) >= 2)
  {
    if (((1 << a5) & 0x1C1388) == 0)
      a4.x = result.x;
    if (a5 <= 0x14)
      result.x = a4.x;
    a4.y = result.y;
  }
  y = a4.y;
  result.y = y;
  return result;
}

- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y;
  double x;
  uint64_t v8;
  id v11;
  id v12;
  void *WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewControllerContextTransitioning finalFrameForViewController:](self->_transitionContext, "finalFrameForViewController:", WeakRetained);
    if (v14 != 1.79769313e308 || v15 != 1.79769313e308)
    {
      x = v14;
      y = v15;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:endOriginForToView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    x = v16;
    y = v17;
  }

  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  -[UIViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", -[UIViewControllerContextTransitioning transitionWasCancelled](self->_transitionContext, "transitionWasCancelled", a3, a4, a5, a6) ^ 1);
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_2;
  v10 = &unk_1E16B1B50;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = v2;
  v12 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v7);
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState", v7, v8, v9, v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(v1, "addSubview:", WeakRetained);

}

uint64_t __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 8), "completeTransition:", objc_msgSend(*(id *)(result + 40), "transitionWasCancelled") ^ 1);
  return result;
}

uint64_t __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "position");
  v4 = v3;

  v5 = *(double *)(a1 + 40);
  if (v5 >= 0.0)
  {
    v6 = 0.0;
    v7 = 1;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = v6 / v5;
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_6;
      v11[3] = &unk_1E16C2630;
      v16 = v7 - 1;
      v13 = v5;
      v10 = 1.0 / v5;
      v12 = *(id *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = v4;
      +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v11, v9, v10);

      v6 = (double)v7;
      v5 = *(double *)(a1 + 40);
      ++v7;
    }
    while (v5 >= v6);
  }
}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_6(uint64_t a1)
{
  long double v2;
  double v3;
  long double v4;
  void *v5;
  long double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;

  v2 = (double)*(int *)(a1 + 64) / *(double *)(a1 + 40) * 3.14159265;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = (1.0 - cos(v2)) * (v3 * 0.5);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeRotation(&v13, -(*(double *)(a1 + 48) * v2), 0.0, 1.0, 0.0);
  v12 = v13;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v5, "setTransform:", &v11);

  v6 = *(double *)(a1 + 56) + v4 * *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosition:", (double)v6, v9);

}

void __67__UIViewControllerBuiltinTransitionViewAnimator_animateTransition___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  _OWORD v18[8];
  _OWORD v19[8];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v3);
  objc_msgSend(WeakRetained, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  v4 = *(_OWORD *)(a1 + 144);
  v19[4] = *(_OWORD *)(a1 + 128);
  v19[5] = v4;
  v5 = *(_OWORD *)(a1 + 176);
  v19[6] = *(_OWORD *)(a1 + 160);
  v19[7] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v19[0] = *(_OWORD *)(a1 + 64);
  v19[1] = v6;
  v7 = *(_OWORD *)(a1 + 112);
  v19[2] = *(_OWORD *)(a1 + 96);
  v19[3] = v7;
  objc_msgSend(v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransform:", v19);

  v9 = *(unsigned __int8 *)(a1 + 192);
  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDoubleSided:", v9);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v18[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v18[5] = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v18[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v18[7] = v13;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v18[0] = *MEMORY[0x1E0CD2610];
  v18[1] = v14;
  v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v18[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v18[3] = v15;
  objc_msgSend(v11, "setSublayerTransform:", v18);

  v16 = *(unsigned __int8 *)(a1 + 193);
  objc_msgSend(WeakRetained, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDoubleSided:", v16);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "completeTransition:", objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled") ^ 1);
}

- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4
{
  id v4;

  objc_msgSend(a3, "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_completeRunningTransition");

}

- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "durationForTransition:", v4);
  v6 = v5;
  objc_msgSend(v12, "keyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UIKeyboardAutomaticIsOffScreen() & 1) == 0)
  {
    objc_msgSend(v7, "responder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "_containsResponder:", v8);

    if (v9)
    {
      objc_msgSend(v7, "_beginIgnoringReloadInputViews");
      objc_msgSend(v7, "setAutomaticAppearanceInternalEnabled:", 0);
      objc_msgSend(v12, "endEditing:", 1);
      objc_msgSend(v7, "setAutomaticAppearanceInternalEnabled:", 1);
      objc_msgSend(v7, "_endIgnoringReloadInputViews");
      v10 = +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v4);
      if (objc_msgSend(v7, "currentState") != 2)
        objc_msgSend(v7, "forceOrderOutAutomaticToDirection:withDuration:", v10, v6);
    }
  }
  if ((_DWORD)v4)
  {
    +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", 1, +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v4), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushAnimationStyle:", v11);

  }
}

- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "transitionView:startCustomTransitionWithDuration:", v7, a4);

}

- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y;
  double x;
  uint64_t v8;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    objc_msgSend(v12, "frame");
    -[UIViewControllerBuiltinTransitionViewAnimator _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v13, v14);
    v16 = v15;
    v18 = v17;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "transitionView:endOriginForFromView:forTransition:defaultOrigin:", v11, v12, v8, x, y);
    v16 = v20;
    v18 = v21;

  }
  v22 = v16;
  v23 = v18;
  result.y = v23;
  result.x = v22;
  return result;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (UIView)toView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_toView);
}

- (void)setToView:(id)a3
{
  objc_storeWeak((id *)&self->_toView, a3);
}

- (UIView)fromView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_fromView);
}

- (void)setFromView:(id)a3
{
  objc_storeWeak((id *)&self->_fromView, a3);
}

- (BOOL)removeFromView
{
  return self->_removeFromView;
}

- (void)setRemoveFromView:(BOOL)a3
{
  self->_removeFromView = a3;
}

- (void)setTransition:(int)a3
{
  self->_transition = a3;
}

@end
