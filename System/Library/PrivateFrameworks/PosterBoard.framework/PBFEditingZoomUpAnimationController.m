@implementation PBFEditingZoomUpAnimationController

- (double)transitionDuration:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isAnimated");
  result = 0.0;
  if (v3)
    return 0.5;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  double sx;
  CGFloat v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double rect;
  _QWORD v63[5];
  _QWORD v64[4];
  id v65;
  id v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  uint64_t v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v12 = objc_opt_class();
    v13 = v8;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    objc_msgSend(v15, "bottomViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    v18 = v16;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v11 = v19;

  }
  objc_msgSend(v5, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "window");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayCornerRadius");
  v57 = v22;

  objc_msgSend(v60, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  rect = v29;
  objc_msgSend(v11, "setShowsContentWhenReady:", 1);
  objc_msgSend(v11, "addObserver:", self);
  -[PBFEditingZoomAnimationController previewView](self, "previewView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFEditingZoomAnimationController buildDimmingView](self, "buildDimmingView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFEditingZoomAnimationController complicationsView](self, "complicationsView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFEditingZoomAnimationController buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:](self, "buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:", v58, v20, v32, v24, v26, v28, v30);
  v59 = v5;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v31);
  objc_msgSend(v34, "addSubview:", v33);
  objc_msgSend(v34, "bounds");
  objc_msgSend(v31, "setFrame:");
  objc_msgSend(v31, "setAlpha:", 0.0);
  -[PBFEditingZoomAnimationController previewFrame](self, "previewFrame");
  x = v74.origin.x;
  y = v74.origin.y;
  width = v74.size.width;
  height = v74.size.height;
  v39 = CGRectGetWidth(v74);
  v75.origin.x = v24;
  v75.origin.y = v26;
  v75.size.width = v28;
  v75.size.height = rect;
  sx = v39 / CGRectGetWidth(v75);
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  v40 = CGRectGetHeight(v76);
  v77.origin.x = v24;
  v77.origin.y = v26;
  v56 = v28;
  v77.size.width = v28;
  v77.size.height = rect;
  v41 = v40 / CGRectGetHeight(v77);
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v28, rect);
  UIRectGetCenter();
  objc_msgSend(v33, "setCenter:");
  CGAffineTransformMakeScale(&v73, sx, v41);
  objc_msgSend(v33, "setTransform:", &v73);
  objc_msgSend(v33, "bounds");
  objc_msgSend(v20, "setFrame:");
  -[PBFEditingZoomAnimationController previewCornerRadius](self, "previewCornerRadius");
  objc_msgSend(v33, "_setContinuousCornerRadius:", v42 / v41);
  objc_msgSend(v32, "bounds");
  v44 = v43;
  v46 = v45;
  v78.origin.x = v24;
  v78.origin.y = v26;
  v78.size.width = v56;
  v78.size.height = rect;
  v47 = CGRectGetWidth(v78) / v44;
  v79.origin.x = v24;
  v79.origin.y = v26;
  v79.size.width = v56;
  v79.size.height = rect;
  v48 = CGRectGetHeight(v79);
  CGAffineTransformMakeScale(&v72, v47, v48 / v46);
  objc_msgSend(v32, "setTransform:", &v72);
  objc_msgSend(v33, "bounds");
  UIRectGetCenter();
  objc_msgSend(v32, "setCenter:");
  -[PBFEditingZoomUpAnimationController setTransitionContext:](self, "setTransitionContext:", v4);
  -[PBFEditingZoomUpAnimationController setDimmingView:](self, "setDimmingView:", v31);
  -[PBFEditingZoomUpAnimationController setZoomingView:](self, "setZoomingView:", v33);
  -[PBFEditingZoomUpAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v50 = v49;
  v51 = v11;
  v52 = (void *)MEMORY[0x1E0DC3F10];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke;
  v64[3] = &unk_1E86F5AC0;
  v67 = v24;
  v68 = v26;
  v69 = v56;
  v70 = rect;
  v71 = v57;
  v65 = v33;
  v66 = v31;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke_2;
  v63[3] = &unk_1E86F5AE8;
  v63[4] = self;
  v53 = v31;
  v54 = v33;
  objc_msgSend(v52, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v64, v63, v50, 0.0, 1.0, 0.0);

}

uint64_t __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v6);
  v4 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationFinished:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "finishTransitionIfPossible");
}

- (void)finishTransitionIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PBFEditingZoomUpAnimationController isAnimationFinished](self, "isAnimationFinished"))
  {
    if (-[PBFEditingZoomUpAnimationController isContentReady](self, "isContentReady"))
    {
      -[PBFEditingZoomUpAnimationController transitionContext](self, "transitionContext");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFEditingZoomUpAnimationController dimmingView](self, "dimmingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFEditingZoomUpAnimationController zoomingView](self, "zoomingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");
      objc_msgSend(v7, "removeFromSuperview");
      objc_msgSend(v5, "addSubview:", v4);
      objc_msgSend(v8, "finalFrameForViewController:", v3);
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v8, "completeTransition:", objc_msgSend(v8, "transitionWasCancelled") ^ 1);

    }
  }
}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  -[PBFEditingZoomUpAnimationController setContentReady:](self, "setContentReady:", 1);
  -[PBFEditingZoomUpAnimationController finishTransitionIfPossible](self, "finishTransitionIfPossible");
}

- (BOOL)isContentReady
{
  return self->_contentReady;
}

- (void)setContentReady:(BOOL)a3
{
  self->_contentReady = a3;
}

- (BOOL)isAnimationFinished
{
  return self->_animationFinished;
}

- (void)setAnimationFinished:(BOOL)a3
{
  self->_animationFinished = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (UIView)zoomingView
{
  return self->_zoomingView;
}

- (void)setZoomingView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
