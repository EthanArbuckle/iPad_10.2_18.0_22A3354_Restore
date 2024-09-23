@implementation _UIApplicationModalProgressWindow

- (_UIApplicationModalProgressWindow)initWithFrame:(CGRect)a3
{
  _UIApplicationModalProgressWindow *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIApplicationModalProgressWindow;
  v3 = -[UIWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIWindow setWindowLevel:](v3, "setWindowLevel:", 2000.0);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UIWindow _setWindowControlsStatusBarOrientation:](v3, "_setWindowControlsStatusBarOrientation:", 0);
  return v3;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintProgress");
}

@end
