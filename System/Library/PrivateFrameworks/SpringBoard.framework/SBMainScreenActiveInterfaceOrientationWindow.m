@implementation SBMainScreenActiveInterfaceOrientationWindow

- (SBMainScreenActiveInterfaceOrientationWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SBMainScreenActiveInterfaceOrientationWindow *v16;
  _SBMainScreenActiveInterfaceOrientationWindowRootViewController *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  objc_super v29;
  objc_super v30;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CEA950];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30.receiver = self;
  v30.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  v16 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v30, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v8, 0, 0, v12, v15);

  if (v16)
  {
    v17 = objc_alloc_init(_SBMainScreenActiveInterfaceOrientationWindowRootViewController);
    objc_msgSend(v8, "screen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[_SBMainScreenActiveInterfaceOrientationWindowRootViewController view](v17, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    v29.receiver = v16;
    v29.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
    -[SBMainScreenActiveInterfaceOrientationWindow setRootViewController:](&v29, sel_setRootViewController_, v17);

  }
  return v16;
}

- (SBMainScreenActiveInterfaceOrientationWindow)initWithRole:(id)a3 debugName:(id)a4
{
  return -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:](self, "initWithWindowScene:role:debugName:", 0, a3, a4);
}

- (id)rootViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](&v7, sel_rootViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setRootViewController:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s is not supported."), "-[SBMainScreenActiveInterfaceOrientationWindow setRootViewController:]");
}

- (BOOL)_canBecomeKeyWindow
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  -[SBWindow setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  }
  else
  {
    -[SBMainScreenActiveInterfaceOrientationWindow _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:](self, "_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:", 0.0);
    -[SBMainScreenActiveInterfaceOrientationWindow _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded](self, "_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded");
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBMainScreenActiveInterfaceOrientationWindow *v5;
  void *v6;
  SBMainScreenActiveInterfaceOrientationWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBMainScreenActiveInterfaceOrientationWindow *)objc_claimAutoreleasedReturnValue();
  if (-[SBMainScreenActiveInterfaceOrientationWindow passesTouchesThrough](self, "passesTouchesThrough"))
  {
    if (v5 == self
      || (-[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "view"),
          v7 = (SBMainScreenActiveInterfaceOrientationWindow *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v5 == v7))
    {

      v5 = 0;
    }
  }
  return v5;
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  id *p_contentViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIViewController *v24;

  v5 = (UIViewController *)a3;
  p_contentViewController = (id *)&self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v24 = v5;
    -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*p_contentViewController)
    {
      objc_msgSend(v7, "bs_removeChildViewController:");
      objc_msgSend(v8, "setContentViewController:", 0);
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend((id)objc_opt_class(), "layoutContentViewControllerWithConstraints");
      if (v11)
      {
        objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      else
      {
        objc_msgSend(v9, "bounds");
        objc_msgSend(v10, "setFrame:");
        objc_msgSend(v10, "setAutoresizingMask:", 18);
      }
      objc_msgSend(v8, "bs_addChildViewController:", *p_contentViewController);
      objc_msgSend(v8, "setContentViewController:", *p_contentViewController);
      if (v11)
      {
        objc_msgSend(v10, "leftAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "leftAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setActive:", 1);

        objc_msgSend(v10, "rightAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rightAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActive:", 1);

        objc_msgSend(v10, "topAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActive:", 1);

        objc_msgSend(v10, "bottomAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bottomAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 1);

      }
    }
    -[SBMainScreenActiveInterfaceOrientationWindow _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded](self, "_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded");

    v5 = v24;
  }

}

- (void)disableInterfaceOrientationChangesForReason:(id)a3
{
  id v4;
  NSCountedSet *orientationUpdateDisableReasons;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  orientationUpdateDisableReasons = self->_orientationUpdateDisableReasons;
  v8 = v4;
  if (!orientationUpdateDisableReasons)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v7 = self->_orientationUpdateDisableReasons;
    self->_orientationUpdateDisableReasons = v6;

    v4 = v8;
    orientationUpdateDisableReasons = self->_orientationUpdateDisableReasons;
  }
  -[NSCountedSet addObject:](orientationUpdateDisableReasons, "addObject:", v4);
  -[SBMainScreenActiveInterfaceOrientationWindow _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded](self, "_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded");

}

- (void)enableInterfaceOrientationChangesForReason:(id)a3
{
  -[NSCountedSet removeObject:](self->_orientationUpdateDisableReasons, "removeObject:", a3);
  if (!-[NSCountedSet count](self->_orientationUpdateDisableReasons, "count"))
  {
    -[SBMainScreenActiveInterfaceOrientationWindow _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:](self, "_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:", 0.0);
    -[SBMainScreenActiveInterfaceOrientationWindow _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded](self, "_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded");
  }
}

- (BOOL)isDisablingInterfaceOrientationChanges
{
  return -[NSCountedSet count](self->_orientationUpdateDisableReasons, "count") != 0;
}

- (NSString)description
{
  return (NSString *)-[SBMainScreenActiveInterfaceOrientationWindow descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBMainScreenActiveInterfaceOrientationWindow succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBMainScreenActiveInterfaceOrientationWindow descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[SBMainScreenActiveInterfaceOrientationWindow succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainScreenActiveInterfaceOrientationWindow _debugName](self, "_debugName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, 0);

  -[SBMainScreenActiveInterfaceOrientationWindow frame](self, "frame");
  _SBWindowFrameDescription(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("frame"));

  v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBMainScreenActiveInterfaceOrientationWindow isHidden](self, "isHidden"), CFSTR("hidden"), 1);
  -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "supportedInterfaceOrientations");
  BSInterfaceOrientationMaskDescription();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v15, CFSTR("rootVCSupportedInterfaceOrientations"));

  -[SBMainScreenActiveInterfaceOrientationWindow interfaceOrientation](self, "interfaceOrientation");
  BSInterfaceOrientationDescription();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v16, CFSTR("interfaceOrientation"));

  -[NSCountedSet allObjects](self->_orientationUpdateDisableReasons, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeMultilinePrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v17, CFSTR("updateDisableReasons"), v18, 1);

  -[SBMainScreenActiveInterfaceOrientationWindow layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:", v19, CFSTR("layer"));

  return v4;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  SBMainScreenActiveInterfaceOrientationWindow *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  BKLogOrientationClient();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BSInterfaceOrientationDescription();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Attempting to rotate active interface orientation following window (%{public}@) from orientation: %{public}@ to orientation %{public}@.", (uint8_t *)&v12, 0x20u);

  }
  +[SBAnimationUtilities adjustedRotationAnimationDurationForDuration:fromOrientation:toOrientation:](SBAnimationUtilities, "adjustedRotationAnimationDurationForDuration:fromOrientation:toOrientation:", a5, a3, a4);
  -[SBMainScreenActiveInterfaceOrientationWindow _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:](self, "_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:");
}

+ (BOOL)layoutContentViewControllerWithConstraints
{
  return 1;
}

- (void)_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:(double)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  SBMainScreenActiveInterfaceOrientationWindow *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSCountedSet count](self->_orientationUpdateDisableReasons, "count"))
  {
    -[SBMainScreenActiveInterfaceOrientationWindow _roleHint](self, "_roleHint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

    if ((v6 & 1) == 0)
    {
      -[SBMainScreenActiveInterfaceOrientationWindow effectiveRootViewControllerSupportedInterfaceOrientations](self, "effectiveRootViewControllerSupportedInterfaceOrientations");
      v7 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
      if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
      {
        v8 = XBInterfaceOrientationMaskForInterfaceOrientation();
        -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSupportedInterfaceOrientations:", v8);

        BKLogOrientationClient();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          BSInterfaceOrientationDescription();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = self;
          v15 = 2114;
          v16 = v11;
          v12 = "Really rotating active interface orientation following window (%{public}@) to orientation: %{public}@.";
LABEL_8:
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x16u);

        }
      }
      else
      {
        v7 = SBFFirstInterfaceOrientationInInterfaceOrientationMask();
        BKLogOrientationClient();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          BSInterfaceOrientationDescription();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = self;
          v15 = 2114;
          v16 = v11;
          v12 = "Overriding orientation of window (%{public}@) to orientation: %{public}@, because the root view controll"
                "er does not support the active interface orientation.";
          goto LABEL_8;
        }
      }

      -[SBMainScreenActiveInterfaceOrientationWindow _legacySetRotatableViewOrientation:duration:](self, "_legacySetRotatableViewOrientation:duration:", v7, a3);
    }
  }
}

- (unint64_t)effectiveRootViewControllerSupportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[SBMainScreenActiveInterfaceOrientationWindow contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");
  if (v3)
    v4 = v3;
  else
    v4 = 30;

  return v4;
}

+ (BOOL)sb_autorotates
{
  return objc_msgSend(a1, "_traitsArbiterOrientationActuationEnabled") ^ 1;
}

+ (BOOL)_traitsArbiterOrientationActuationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_traitsArbiterOrientationActuationRole");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBTraitsArbiterOrientationActuationEnabledForRole(v2);

  return v3;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return 0;
}

- (void)_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend((id)objc_opt_class(), "_traitsArbiterOrientationActuationEnabled"))
  {
    if (-[SBMainScreenActiveInterfaceOrientationWindow isDisablingInterfaceOrientationChanges](self, "isDisablingInterfaceOrientationChanges"))
    {
      -[SBMainScreenActiveInterfaceOrientationWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
      v3 = XBInterfaceOrientationMaskForInterfaceOrientation();
    }
    else
    {
      v3 = -[SBMainScreenActiveInterfaceOrientationWindow effectiveRootViewControllerSupportedInterfaceOrientations](self, "effectiveRootViewControllerSupportedInterfaceOrientations");
    }
    v4 = v3;
    -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportedInterfaceOrientations:", v4);

  }
}

- (BOOL)isActive
{
  return 0;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_orientationUpdateDisableReasons, 0);
}

@end
