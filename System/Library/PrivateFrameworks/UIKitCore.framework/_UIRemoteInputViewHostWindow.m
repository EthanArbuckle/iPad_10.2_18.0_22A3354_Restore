@implementation _UIRemoteInputViewHostWindow

- (_UIRemoteInputViewHostWindow)initWithWindowScene:(id)a3
{
  _UIRemoteInputViewHostWindow *v3;
  _UIRemoteInputViewHostWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteInputViewHostWindow;
  v3 = -[UIApplicationRotationFollowingWindow initWithWindowScene:](&v6, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIWindow setWindowLevel:](v3, "setWindowLevel:", -1.79769313e308);
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v3;

  -[_UIRemoteInputViewHostWindow hostWindowDelegate](self, "hostWindowDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateInputViewsIfNecessary");

}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (id)firstResponder
{
  void *v2;
  void *v3;

  objc_msgSend((id)UIApp, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_isHostedInAnotherProcess
{
  return 0;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_isRemoteInputHostWindow
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (BOOL)inhibitSetupOrientation
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAutorotate");

  return v4;
}

- (_UIRemoteInputViewHostWindowDelegate)hostWindowDelegate
{
  return (_UIRemoteInputViewHostWindowDelegate *)objc_loadWeakRetained((id *)&self->_hostWindowDelegate);
}

- (void)setHostWindowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostWindowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostWindowDelegate);
}

@end
