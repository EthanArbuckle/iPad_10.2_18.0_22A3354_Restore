@implementation _UITabBarTVTransitioner

- (_UITabBarTVTransitioner)init
{
  _UITabBarTVTransitioner *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabBarTVTransitioner;
  result = -[_UITabBarTVTransitioner init](&v3, sel_init);
  if (result)
    result->_transitionStyle = 0;
  return result;
}

- (void)finishTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 fromViewOriginalShouldRasterize;
  void *v8;
  _BOOL8 toViewOriginalShouldRasterize;
  void *v10;
  double fromViewLayerOriginalRasterizationScale;
  void *v12;
  double toViewLayerOriginalRasterizationScale;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[_UITabBarTVTransitioner transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITabBarTVTransitioner transitionContext](self, "transitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextFromView"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[_UITabBarTVTransitioner transitionContext](self, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextToView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "removeFromSuperview");
    objc_msgSend(v18, "setAlpha:", 1.0);
    fromViewOriginalShouldRasterize = self->_fromViewOriginalShouldRasterize;
    objc_msgSend(v18, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldRasterize:", fromViewOriginalShouldRasterize);

    toViewOriginalShouldRasterize = self->_toViewOriginalShouldRasterize;
    objc_msgSend(v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldRasterize:", toViewOriginalShouldRasterize);

    fromViewLayerOriginalRasterizationScale = self->_fromViewLayerOriginalRasterizationScale;
    objc_msgSend(v18, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRasterizationScale:", fromViewLayerOriginalRasterizationScale);

    toViewLayerOriginalRasterizationScale = self->_toViewLayerOriginalRasterizationScale;
    objc_msgSend(v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRasterizationScale:", toViewLayerOriginalRasterizationScale);

    -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[_UITabBarTVTransitioner setToViewXFlippedScreenShot:](self, "setToViewXFlippedScreenShot:", 0);
    }
    -[_UITabBarTVTransitioner transitionContext](self, "transitionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "completeTransition:", 1);

    -[_UITabBarTVTransitioner setTransitionContext:](self, "setTransitionContext:", 0);
  }
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  if (self->_transitionStyle != 1)
    return 0.5;
  -[_UITabBarTVTransitioner slideTimingParameters](self, "slideTimingParameters", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settlingDuration");
  v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  int v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double MinX;
  double MaxX;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  UICubicTimingParameters *v65;
  uint64_t v66;
  id v67;
  id v68;
  UIViewPropertyAnimator *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  UIViewPropertyAnimator *v74;
  uint64_t v75;
  UIViewPropertyAnimator *v76;
  BOOL v77;
  UIViewPropertyAnimator *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  _QWORD v83[5];
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[5];
  _QWORD v88[4];
  id v89;
  id v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  BOOL v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  CATransform3D v100;
  CATransform3D v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v4 = a3;
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextToView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isAnimated");
  if (v6)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    objc_msgSend(v7, "addSubview:", v6);
  }
  if (v8)
  {
    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fromViewOriginalShouldRasterize = objc_msgSend(v9, "shouldRasterize");

    objc_msgSend(v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rasterizationScale");
    self->_fromViewLayerOriginalRasterizationScale = v11;

    objc_msgSend(v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_toViewOriginalShouldRasterize = objc_msgSend(v12, "shouldRasterize");

    objc_msgSend(v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rasterizationScale");
    self->_toViewLayerOriginalRasterizationScale = v14;

    v15 = _AXSReduceMotionEnabled();
    if (self->_transitionStyle != 1 || v15)
    {
      objc_msgSend(v5, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setShouldRasterize:", 0);

      objc_msgSend(v6, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setShouldRasterize:", 0);

      -[_UITabBarTVTransitioner setTransitionContext:](self, "setTransitionContext:", v4);
      v27 = MEMORY[0x1E0C809B0];
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_5;
      v84[3] = &unk_1E16B1B50;
      v85 = v5;
      v86 = v6;
      v83[0] = v27;
      v83[1] = 3221225472;
      v83[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_6;
      v83[3] = &unk_1E16B3FD8;
      v83[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v84, v83, 0.5);

      v28 = v85;
    }
    else
    {
      objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
      v16 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)v16;
      if (v16)
      {
        objc_msgSend(v4, "finalFrameForViewController:", v16);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
      }
      else
      {
        v18 = *MEMORY[0x1E0C9D648];
        v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      v29 = -[_UITabBarTVTransitioner transitionFromRight](self, "transitionFromRight");
      objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabBarTVTransitioner setToViewXFlippedScreenShot:](self, "setToViewXFlippedScreenShot:", v30);

      -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v81 = v24;
        v32 = v22;
        v33 = v20;
        v34 = v18;
        CATransform3DMakeScale(&v101, -1.0, 1.0, 1.0);
        -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v101;
        objc_msgSend(v36, "setTransform:", &v100);

        -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "frame");
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;

        v46 = v39;
        v47 = v41;
        v48 = v43;
        v49 = v45;
        if (v29)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v46);
          v102.origin.x = v39;
          v102.origin.y = v41;
          v102.size.width = v43;
          v102.size.height = v45;
          MaxX = MinX - CGRectGetMaxX(v102);
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v46);
        }
        -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setFrame:", MaxX, v41, v43, v45);

        -[_UITabBarTVTransitioner toViewXFlippedScreenShot](self, "toViewXFlippedScreenShot");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSubview:", v53);

        v18 = v34;
        v20 = v33;
        v22 = v32;
        v24 = v81;
      }
      v77 = v29;
      if (v29)
        v54 = 113.0;
      else
        v54 = -113.0;
      v103.origin.x = v18;
      v103.origin.y = v20;
      v103.size.width = v22;
      v103.size.height = v24;
      v104 = CGRectOffset(v103, v54, 0.0);
      objc_msgSend(v6, "setFrame:", v104.origin.x, v104.origin.y, v104.size.width, v104.size.height);
      objc_msgSend(v5, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setShouldRasterize:", 1);

      objc_msgSend(v5, "layer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "traitCollection");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "displayScale");
      objc_msgSend(v56, "setRasterizationScale:");

      objc_msgSend(v6, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setShouldRasterize:", 1);

      objc_msgSend(v6, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "traitCollection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "displayScale");
      objc_msgSend(v59, "setRasterizationScale:");

      LODWORD(v61) = 1051260355;
      LODWORD(v62) = 1059816735;
      LODWORD(v63) = 0;
      LODWORD(v64) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v61, v63, v62, v64);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[UICubicTimingParameters initWithCustomCurve:]([UICubicTimingParameters alloc], "initWithCustomCurve:", v79);
      v82 = v7;
      v78 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v65, 0.15);
      v66 = MEMORY[0x1E0C809B0];
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke;
      v98[3] = &unk_1E16B1B28;
      v67 = v5;
      v99 = v67;
      -[UIViewPropertyAnimator addAnimations:](v78, "addAnimations:", v98);
      v76 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v65, 0.37);
      v96[0] = v66;
      v96[1] = 3221225472;
      v96[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_2;
      v96[3] = &unk_1E16B1B28;
      v68 = v6;
      v97 = v68;
      -[UIViewPropertyAnimator addAnimations:](v76, "addAnimations:", v96);
      -[_UITabBarTVTransitioner setTransitionContext:](self, "setTransitionContext:", v4);
      v69 = [UIViewPropertyAnimator alloc];
      -[_UITabBarTVTransitioner slideTimingParameters](self, "slideTimingParameters");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "settlingDuration");
      v72 = v71;
      -[_UITabBarTVTransitioner slideTimingParameters](self, "slideTimingParameters");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v69, "initWithDuration:timingParameters:", v73, v72);

      v75 = MEMORY[0x1E0C809B0];
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_3;
      v88[3] = &unk_1E16B7080;
      v89 = v67;
      v95 = v77;
      v90 = v68;
      v91 = v18;
      v92 = v20;
      v93 = v22;
      v94 = v24;
      -[UIViewPropertyAnimator addAnimations:](v74, "addAnimations:", v88);
      v87[0] = v75;
      v87[1] = 3221225472;
      v87[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_4;
      v87[3] = &unk_1E16B42D0;
      v87[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v74, "addCompletion:", v87);
      -[UIViewPropertyAnimator startAnimation](v78, "startAnimation");
      -[UIViewPropertyAnimator startAnimation](v76, "startAnimation");
      -[UIViewPropertyAnimator startAnimation](v74, "startAnimation");

      v7 = v82;
      v28 = v80;
    }

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");
    objc_msgSend(v6, "setAlpha:", 1.0);
    objc_msgSend(v4, "completeTransition:", 1);
  }

}

- (UISpringTimingParameters)slideTimingParameters
{
  UISpringTimingParameters *slideTimingParameters;
  UISpringTimingParameters *v4;
  UISpringTimingParameters *v5;

  slideTimingParameters = self->_slideTimingParameters;
  if (!slideTimingParameters)
  {
    v4 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 100.0, 30.0, 0.0, 0.0);
    v5 = self->_slideTimingParameters;
    self->_slideTimingParameters = v4;

    slideTimingParameters = self->_slideTimingParameters;
  }
  return slideTimingParameters;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (BOOL)transitionFromRight
{
  return self->_transitionFromRight;
}

- (void)setTransitionFromRight:(BOOL)a3
{
  self->_transitionFromRight = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (void)setSlideTimingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_slideTimingParameters, a3);
}

- (UIView)toViewXFlippedScreenShot
{
  return self->_toViewXFlippedScreenShot;
}

- (void)setToViewXFlippedScreenShot:(id)a3
{
  objc_storeStrong((id *)&self->_toViewXFlippedScreenShot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewXFlippedScreenShot, 0);
  objc_storeStrong((id *)&self->_slideTimingParameters, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
