@implementation UIView(PGAdditions)

- (uint64_t)PG_allowsEdgeAntialiasing
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "allowsEdgeAntialiasing");

  return v2;
}

- (void)PG_setAllowsEdgeAntialiasing:()PGAdditions
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "setContentsScale:");

  objc_msgSend(a1, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", a3);

}

- (uint64_t)PG_allowsGroupBlending
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "allowsGroupBlending");

  return v2;
}

- (void)PG_setAllowsGroupBlending:()PGAdditions
{
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", a3);

}

- (double)PG_anchorPoint
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anchorPoint");
  v3 = v2;

  return v3;
}

- (void)PG_setAnchorPoint:()PGAdditions
{
  id v5;

  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnchorPoint:", a2, a3);

}

- (id)PG_compositingFilter
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "compositingFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)PG_setCompositingFilter:()PGAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v4);

}

- (double)PG_cornerRadius
{
  void *v1;
  double v2;
  double v3;

  objc_getAssociatedObject(a1, "UIView.CornerRadius");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "doubleValue");
    v2 = v3;
  }

  return v2;
}

- (uint64_t)PG_disablesLayerCloning
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_msgSend(v1, "disableUpdateMask") >> 4) & 1;

  return v2;
}

+ (void)PG_performWithoutAnimation:()PGAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIView_PGAdditions__PG_performWithoutAnimation___block_invoke;
  v6[3] = &unk_1E62300A8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "performWithoutAnimation:", v6);

}

+ (void)PG_performWithoutRetargetingAnimation:()PGAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIView_PGAdditions__PG_performWithoutRetargetingAnimation___block_invoke;
  v6[3] = &unk_1E62300A8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_performWithoutRetargetingAnimations:", v6);

}

+ (uint64_t)PG_animateUsingDefaultTimingWithAnimations:()PGAdditions completion:
{
  return objc_msgSend(a1, "PG_animateUsingDefaultTimingWithOptions:animations:completion:", 0, a3, a4);
}

+ (void)PG_animateUsingDefaultTimingWithOptions:()PGAdditions animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__UIView_PGAdditions__PG_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke;
  v10[3] = &unk_1E6230AA0;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:", a3, v10, a5);

}

+ (void)PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:()PGAdditions animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__UIView_PGAdditions__PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity_animations_completion___block_invoke;
  v10[3] = &unk_1E6230AA0;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  objc_msgSend(a1, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v10, a5, 0.0, a2);

}

- (id)PG_acquireAssertionToPreventAutoHideOfControlsWithReason:()PGAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PG_acquireAssertionToPreventAutoHideOfControlsWithReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
