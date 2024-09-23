@implementation SBInteractiveScreenshotGestureHostWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBInteractiveScreenshotGestureHostWindow *v5;
  SBInteractiveScreenshotGestureHostWindow *v6;
  SBInteractiveScreenshotGestureHostWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureHostWindow;
  -[SBInteractiveScreenshotGestureHostWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBInteractiveScreenshotGestureHostWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)sb_autorotates
{
  return 0;
}

@end
