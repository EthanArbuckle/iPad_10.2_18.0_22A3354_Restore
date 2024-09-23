@implementation _UIBannerWindow

- (_UIBannerWindow)init
{
  _UIBannerWindow *v2;
  UIViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBannerWindow;
  v2 = -[UIWindow init](&v5, sel_init);
  -[UIView setOpaque:](v2, "setOpaque:", 0);
  -[UIWindow setWindowLevel:](v2, "setWindowLevel:", 1000.0);
  v3 = objc_alloc_init(UIViewController);
  -[UIWindow setRootViewController:](v2, "setRootViewController:", v3);

  -[UIView setBackgroundColor:](v2, "setBackgroundColor:", 0);
  return v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UIBannerWindow *v5;
  void *v6;
  _UIBannerWindow *v7;
  _UIBannerWindow *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIBannerWindow;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UIBannerWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[UIWindow rootViewController](self, "rootViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "view"),
        v7 = (_UIBannerWindow *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
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

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintBanner");
}

@end
