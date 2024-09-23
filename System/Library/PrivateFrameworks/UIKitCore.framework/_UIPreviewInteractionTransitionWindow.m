@implementation _UIPreviewInteractionTransitionWindow

- (_UIPreviewInteractionTransitionWindow)init
{
  _UIPreviewInteractionTransitionWindow *v2;
  _UIPreviewInteractionTransitionWindow *v3;
  void *v4;
  _UIPreviewInteractionTransitionWindow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionTransitionWindow;
  v2 = -[UIWindow init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIWindow setWindowLevel:](v2, "setWindowLevel:", 2150.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = v3;
  }

  return v3;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintPeekAndPop");
}

@end
