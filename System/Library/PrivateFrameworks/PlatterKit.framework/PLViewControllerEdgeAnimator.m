@implementation PLViewControllerEdgeAnimator

+ (BOOL)drivesAnimation
{
  return 1;
}

- (id)_newPropertyAnimator
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9D8]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 300.0, 0.0, 0.0);
  v4 = (void *)objc_msgSend(v2, "initWithDuration:timingParameters:", v3, 0.0);

  return v4;
}

- (void)_performTransitionWithContext:(id)a3
{
  -[PLViewControllerEdgeAnimator _animateTransitionToEdge:withTransitionContext:](self, "_animateTransitionToEdge:withTransitionContext:", 4, a3);
}

- (void)_animateTransitionToEdge:(unint64_t)a3 withTransitionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double MaxY;
  void *v16;
  void *v17;
  CGAffineTransform v18;
  CGRect v19;

  v5 = a4;
  -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedPlatterPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameOfPresentedViewInContainerView");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  MaxY = CGRectGetMaxY(v19);
  -[PLViewControllerAnimator _sourceViewForPresentation:withTransitionContext:](self, "_sourceViewForPresentation:withTransitionContext:", 0, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLViewControllerAnimator _presentedViewForPresentation:withTransitionContext:](self, "_presentedViewForPresentation:withTransitionContext:", 0, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAlpha:", 1.0);
  PLSetViewFrameMaintainingTransform(v17, v9, MaxY, v11, v13);
  CGAffineTransformMakeScale(&v18, 0.9, 0.9);
  objc_msgSend(v17, "setTransform:", &v18);

}

@end
