@implementation _UISystemGestureWindow

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UISystemGestureWindow *v5;
  _UISystemGestureWindow *v6;
  _UISystemGestureWindow *v7;
  CGAffineTransform v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UISystemGestureWindow;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISystemGestureWindow *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics() && hitTest_withEvent__onceToken != -1)
    dispatch_once(&hitTest_withEvent__onceToken, &__block_literal_global_261);
  if (_UIApplicationProcessIsSpringBoard() && !v5)
  {
    -[_UIRootWindow _additionalRootLayerAffineTransform](self, "_additionalRootLayerAffineTransform");
    if (CGAffineTransformIsIdentity(&v9))
    {
      v5 = 0;
    }
    else
    {
      -[_UISystemGestureWindow _systemGestureView](self, "_systemGestureView");
      v5 = (_UISystemGestureWindow *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v5 == self)
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (_UISystemGestureWindow)initWithDisplay:(id)a3
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureWindow.m"), 72, CFSTR("you can't call this"));

  return -[_UISystemGestureWindow initWithDisplayConfiguration:](self, "initWithDisplayConfiguration:", a3);
}

- (_UISystemGestureWindow)initWithScreen:(id)a3
{
  void *v6;
  void *v7;
  _UISystemGestureWindow *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureWindow.m"), 77, CFSTR("you can't call this"));

  objc_msgSend(a3, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UISystemGestureWindow initWithDisplayConfiguration:](self, "initWithDisplayConfiguration:", v7);

  return v8;
}

- (_UISystemGestureWindow)initWithDisplayConfiguration:(id)a3
{
  _UISystemGestureWindow *v3;
  _UISystemGestureWindow *v4;
  UISystemGestureView *v5;
  uint64_t v6;
  UISystemGestureView *systemGestureView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISystemGestureWindow;
  v3 = -[_UIRootWindow initWithDisplay:](&v9, sel_initWithDisplay_, a3);
  v4 = v3;
  if (v3)
  {
    -[_UIRootWindow setHidden:](v3, "setHidden:", 0);
    -[UIWindow setLevel:](v4, "setLevel:", 0.0);
    v5 = [UISystemGestureView alloc];
    -[UIView bounds](v4, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    systemGestureView = v4->_systemGestureView;
    v4->_systemGestureView = (UISystemGestureView *)v6;

    -[UIView setAutoresizingMask:](v4->_systemGestureView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v4, "addSubview:", v4->_systemGestureView);
  }
  return v4;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (id)_systemGestureView
{
  return self->_systemGestureView;
}

- (BOOL)_isSystemGestureWindow
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGestureView, 0);
}

@end
