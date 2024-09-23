@implementation SBStatusBarWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBStatusBarWindow *v5;
  SBStatusBarWindow *v6;
  SBStatusBarWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBStatusBarWindow;
  -[SBStatusBarWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBStatusBarWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (id)_initWithOrientation:(int64_t)a3
{
  int64_t v3;
  id result;
  objc_super v5;

  if ((unint64_t)a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBStatusBarWindow;
  result = -[SBStatusBarWindow _initWithOrientation:](&v5, sel__initWithOrientation_, v3);
  if (result)
    *((_QWORD *)result + 115) = v3;
  return result;
}

- (SBStatusBarWindow)initWithFrame:(CGRect)a3
{
  SBStatusBarWindow *v3;
  SBStatusBarWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBStatusBarWindow;
  v3 = -[SBStatusBarWindow initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    -[SBStatusBarWindow _statusBarWindowBoundsForOrientation:](v3, "_statusBarWindowBoundsForOrientation:", 1);
    -[SBStatusBarWindow setFrame:](v4, "setFrame:");
    -[SBStatusBarWindow setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

+ (CGRect)_defaultStatusBarSceneReferenceBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStatusBar")))
  {
    -[UIWindow _sbWindowScene](self, "_sbWindowScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarWindow.m"), 81, CFSTR("should connect to the window scene we are on"));

    }
    -[UIWindow _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsArbiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarWindow.m"), 82, CFSTR("do not call this before the window scene is fully configured!"));

    }
    -[SBStatusBarWindow _setRoleHint:](self, "_setRoleHint:", CFSTR("SBTraitsParticipantRoleStatusBar"));
  }

}

- (void)setStatusBar:(id)a3
{
  STUIStatusBar_Wrapper *v5;
  STUIStatusBar_Wrapper **p_statusBar;
  STUIStatusBar_Wrapper *statusBar;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _SBStatusBarWindowRootViewController *v12;
  _SBStatusBarWindowRootViewController *statusBarWindowRootViewController;
  STUIStatusBar_Wrapper *v14;

  v5 = (STUIStatusBar_Wrapper *)a3;
  p_statusBar = &self->_statusBar;
  statusBar = self->_statusBar;
  v14 = v5;
  if (statusBar != v5)
  {
    -[STUIStatusBar_Wrapper removeFromSuperview](statusBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusBar, a3);
    -[STUIStatusBar_Wrapper frame](*p_statusBar, "frame");
    -[SBStatusBarWindow bounds](self, "bounds");
    -[STUIStatusBar_Wrapper setFrame:](*p_statusBar, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[STUIStatusBar_Wrapper setAutoresizingMask:](*p_statusBar, "setAutoresizingMask:", 34);
    -[STUIStatusBar_Wrapper setOrientation:](*p_statusBar, "setOrientation:", self->_orientation);
    -[SBStatusBarWindow addSubview:](self, "addSubview:", *p_statusBar);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIWindow _sbWindowScene](self, "_sbWindowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isExtendedDisplayWindowScene");

      if ((v11 & 1) == 0)
      {
        v12 = -[_SBStatusBarWindowRootViewController initWithWindow:]([_SBStatusBarWindowRootViewController alloc], "initWithWindow:", self);
        statusBarWindowRootViewController = self->_statusBarWindowRootViewController;
        self->_statusBarWindowRootViewController = v12;

        -[SBStatusBarWindow setRootViewController:](self, "setRootViewController:", self->_statusBarWindowRootViewController);
      }
    }
  }

}

- (void)setOrientation:(int64_t)a3
{
  -[SBStatusBarWindow setOrientation:animationParameters:](self, "setOrientation:animationParameters:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a4;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStatusBar")) & 1) == 0)
  {
    if (v6 && (v7 = objc_msgSend(v6, "orientationAnimation")) != 0)
    {
      if (self->_orientation != a3)
      {
        self->_orientation = a3;
        if (v7 == 2)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke;
          v15[3] = &unk_1E8E9DED8;
          v15[4] = self;
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_2;
          v14[3] = &unk_1E8E9E980;
          v14[4] = self;
          objc_msgSend(MEMORY[0x1E0CEA9F0], "animateWithParameters:fromCurrentState:animations:completion:", v6, 1, v15, v14);
        }
        else
        {
          objc_msgSend(v6, "duration");
          v9 = v8 * 0.5;
          v10 = (void *)MEMORY[0x1E0CEABB0];
          objc_msgSend(v6, "delay");
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_3;
          v13[3] = &unk_1E8E9DED8;
          v13[4] = self;
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_4;
          v12[3] = &unk_1E8EAAB58;
          v12[4] = self;
          *(double *)&v12[5] = v9;
          objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 0x10000, v13, v12, v9, v11);
        }
      }
    }
    else
    {
      self->_orientation = a3;
      -[SBStatusBarWindow _rotate](self, "_rotate");
    }
  }

}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "_statusBarWillAnimateRotation");
  return objc_msgSend(*(id *)(a1 + 32), "_rotate");
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "_statusBarDidAnimateRotation");
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 0.0);
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  double v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_rotate");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "isHidden");
  if ((result & 1) == 0)
  {
    v3 = *(double *)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_5;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v4, 0, v3, 0.0);
  }
  return result;
}

uint64_t __56__SBStatusBarWindow_setOrientation_animationParameters___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 1.0);
}

- (void)_setStatusBarWindowOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_rotate
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStatusBar")) & 1) == 0)
  {
    -[STUIStatusBar_Wrapper setOrientation:](self->_statusBar, "setOrientation:", self->_orientation);
    -[SBStatusBarWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", self->_orientation, 0, 1, 0.0);
  }
}

- (CGRect)_statusBarWindowFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBStatusBarWindow _statusBarWindowBoundsForOrientation:](self, "_statusBarWindowBoundsForOrientation:", self->_orientation);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_statusBarWindowBoundsForOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SBStatusBarWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultStatusBarSceneReferenceBounds");
  }
  _UIWindowConvertRectFromOrientationToOrientation();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_isStatusBarWindow
{
  return 1;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  return 1;
}

- (BOOL)_shouldForceTraitPropagationThroughHierarchy
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (STUIStatusBar_Wrapper)statusBar
{
  return self->_statusBar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWindowRootViewController, 0);
}

@end
