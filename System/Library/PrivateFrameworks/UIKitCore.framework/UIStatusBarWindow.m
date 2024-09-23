@implementation UIStatusBarWindow

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

  +[UIScreen mainScreen](UIScreen, "mainScreen");
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

+ (CGRect)_convertRect:(CGRect)a3 fromSceneReferenceSpaceToSceneSpaceWithOrientation:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)_defaultStatusBarSceneReferenceBoundsForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a1, "_defaultStatusBarSceneReferenceBounds");
  objc_msgSend(a1, "_convertRect:fromSceneReferenceSpaceToSceneSpaceWithOrientation:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)statusBarWindowFrame
{
  void *v4;
  void *v5;
  double v6;
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
  void *v18;
  void *v19;
  CGRect result;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStatusBarWindow.m"), 59, CFSTR("Deprecated SPI only supported for SpringBoard"));

  }
  objc_msgSend((id)UIApp, "statusBarWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStatusBarWindow.m"), 64, CFSTR("+[UIApp statusBarWindow] should have created a window"));

  }
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultStatusBarSceneReferenceBoundsForOrientation:", objc_msgSend(v5, "interfaceOrientation"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_defaultStatusBarSceneBoundsForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v5 = (void *)objc_opt_class();
  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  objc_msgSend(v5, "_convertRect:fromSceneReferenceSpaceToSceneSpaceWithOrientation:", a3);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)statusBarWindowFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIStatusBarWindow _defaultStatusBarSceneBoundsForOrientation:](self, "_defaultStatusBarSceneBoundsForOrientation:", self->_orientation);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIStatusBarWindow)initWithFrame:(CGRect)a3
{
  unint64_t viewOrientation;
  UIStatusBarWindow *v4;
  UIStatusBarWindow *v5;
  uint64_t v6;
  objc_super v8;

  viewOrientation = self->super._viewOrientation;
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarWindow;
  v4 = -[UIWindow initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    if (viewOrientation <= 1)
      v6 = 1;
    else
      v6 = viewOrientation;
    v4->_orientation = v6;
    -[UIStatusBarWindow _defaultStatusBarSceneBoundsForOrientation:](v4, "_defaultStatusBarSceneBoundsForOrientation:");
    -[UIWindow setFrame:](v5, "setFrame:");
    -[UIView setOpaque:](v5, "setOpaque:", 0);
  }
  return v5;
}

- (void)setStatusBar:(id)a3
{
  UIStatusBar *v5;
  UIStatusBar **p_statusBar;
  UIStatusBar *statusBar;
  UIStatusBar *v8;

  v5 = (UIStatusBar *)a3;
  p_statusBar = &self->_statusBar;
  statusBar = self->_statusBar;
  if (statusBar != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](statusBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusBar, a3);
    -[UIView frame](*p_statusBar, "frame");
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](*p_statusBar, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIView setAutoresizingMask:](*p_statusBar, "setAutoresizingMask:", 34);
    -[UIView addSubview:](self, "addSubview:", *p_statusBar);
    v5 = v8;
  }

}

- (void)setOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a4;
  v7 = v6;
  if (v6 && (v8 = objc_msgSend(v6, "orientationAnimation")) != 0)
  {
    if (self->_orientation != a3)
    {
      self->_orientation = a3;
      if (v8 == 2)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke;
        v15[3] = &unk_1E16B1B28;
        v15[4] = self;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_2;
        v14[3] = &unk_1E16B3FD8;
        v14[4] = self;
        +[UIStatusBarAnimationParameters animateWithParameters:fromCurrentState:animations:completion:](UIStatusBarAnimationParameters, "animateWithParameters:fromCurrentState:animations:completion:", v7, 1, v15, v14);
      }
      else
      {
        objc_msgSend(v7, "duration");
        v10 = v9 * 0.5;
        objc_msgSend(v7, "delay");
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_3;
        v13[3] = &unk_1E16B1B28;
        v13[4] = self;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_4;
        v12[3] = &unk_1E16B7A60;
        v12[4] = self;
        *(double *)&v12[5] = v10;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v13, v12, v10, v11);
      }
    }
  }
  else
  {
    self->_orientation = a3;
    -[UIStatusBarWindow _rotate](self, "_rotate");
  }

}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "_statusBarWillAnimateRotation");
  return objc_msgSend(*(id *)(a1 + 32), "_rotate");
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "_statusBarDidAnimateRotation");
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setAlpha:", 0.0);
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  double v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_rotate");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "isHidden");
  if ((result & 1) == 0)
  {
    v3 = *(double *)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_5;
    v4[3] = &unk_1E16B1B28;
    v4[4] = *(_QWORD *)(a1 + 32);
    return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v4, 0, v3, 0.0);
  }
  return result;
}

uint64_t __56__UIStatusBarWindow_setOrientation_animationParameters___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setAlpha:", 1.0);
}

- (CGRect)_statusBarFrameForOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  -[UIView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[UIView frame](self->_statusBar, "frame");
  Height = CGRectGetHeight(v14);
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = Height;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_rotate
{
  int64_t orientation;
  double v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[UIStatusBar setOrientation:](self->_statusBar, "setOrientation:", self->_orientation);
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UIWindow _rotateWindowToOrientation:updateStatusBar:duration:skipCallbacks:](self, "_rotateWindowToOrientation:updateStatusBar:duration:skipCallbacks:", self->_orientation, 0, 0, 0.0);
  }
  else
  {
    memset(&v6, 0, sizeof(v6));
    orientation = self->_orientation;
    switch(orientation)
    {
      case 1:
        v4 = 0.0;
        break;
      case 3:
        v4 = 1.57079633;
        break;
      case 4:
        v4 = -1.57079633;
        break;
      default:
        v4 = 3.14159265;
        if (orientation != 2)
          v4 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v6, v4);
    *(float64x2_t *)&v6.a = vrndaq_f64(*(float64x2_t *)&v6.a);
    *(float64x2_t *)&v6.c = vrndaq_f64(*(float64x2_t *)&v6.c);
    *(float64x2_t *)&v6.tx = vrndaq_f64(*(float64x2_t *)&v6.tx);
    v5 = v6;
    -[UIView setTransform:](self, "setTransform:", &v5);
    -[UIStatusBarWindow statusBarWindowFrame](self, "statusBarWindowFrame");
    -[UIWindow setFrame:](self, "setFrame:");
  }
}

- (UIEdgeInsets)safeAreaInsets
{
  char v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  UIEdgeInsets result;

  v3 = dyld_program_sdk_at_least();
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((v3 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIStatusBarWindow;
    -[UIWindow safeAreaInsets](&v8, sel_safeAreaInsets, 0.0, 0.0, 0.0, 0.0);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarWindow;
  v7 = a4;
  -[UIWindow _didMoveFromScene:toScene:](&v12, sel__didMoveFromScene_toScene_, v6, v7);
  objc_msgSend((id)UIApp, "_statusBarWindow:didMoveFromScene:toScene:", self, v6, v7, v12.receiver, v12.super_class);
  v8 = (void *)UIApp;
  v9 = objc_msgSend(v7, "_interfaceOrientation");

  if (v6)
    v10 = objc_msgSend(v6, "_interfaceOrientation");
  else
    v10 = 0;
  -[UIWindow windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStatusBarOrientation:fromOrientation:windowScene:animationParameters:updateBlock:", v9, v10, v11, 0, 0);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIStatusBarWindow *v5;
  UIStatusBarWindow *v6;
  UIStatusBarWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIStatusBarWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (BOOL)_isStatusBarWindow
{
  return 1;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  return 1;
}

- (BOOL)_shouldForceTraitPropagationThroughHierarchy
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end
