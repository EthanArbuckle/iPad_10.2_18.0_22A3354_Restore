@implementation PassThroughWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  PassThroughWindow *v6;
  PassThroughWindow *v7;
  PassThroughWindow *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PassThroughWindow;
  v5 = -[PassThroughWindow hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (PassThroughWindow *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 == self)
    v6 = 0;
  v8 = v6;

  return v8;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end
