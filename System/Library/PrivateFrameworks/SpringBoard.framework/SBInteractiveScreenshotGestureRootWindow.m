@implementation SBInteractiveScreenshotGestureRootWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBInteractiveScreenshotGestureRootWindow *v5;
  SBInteractiveScreenshotGestureRootWindow *v6;
  SBInteractiveScreenshotGestureRootWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureRootWindow;
  -[SBInteractiveScreenshotGestureRootWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBInteractiveScreenshotGestureRootWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (self == a5)
  {
    v10 = v5;
    v11 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SBInteractiveScreenshotGestureRootWindow;
    -[SBInteractiveScreenshotGestureRootWindow _hitTest:withEvent:windowServerHitTestWindow:](&v9, sel__hitTest_withEvent_windowServerHitTestWindow_, a4, self, a3.x, a3.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end
