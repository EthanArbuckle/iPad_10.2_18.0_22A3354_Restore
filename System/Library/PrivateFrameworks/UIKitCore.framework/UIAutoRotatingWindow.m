@implementation UIAutoRotatingWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIAutoRotatingWindow *v5;
  UIAutoRotatingWindow *v6;
  UIAutoRotatingWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIAutoRotatingWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIAutoRotatingWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)_didRemoveSubview:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAutoRotatingWindow;
  -[UIView _didRemoveSubview:](&v6, sel__didRemoveSubview_, a3);
  if (!-[UIWindow _isTextEffectsWindow](self, "_isTextEffectsWindow"))
  {
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      -[UIWindow setHidden:](self, "setHidden:", 1);
  }
}

- (void)updateForOrientation:(int64_t)a3
{
  objc_super v5;

  if (self->_interfaceOrientation != a3 || self->_unknownOrientation)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAutoRotatingWindow;
    -[UIWindow setupForOrientation:](&v5, sel_setupForOrientation_, a3);
    self->_interfaceOrientation = a3;
    self->_unknownOrientation = -[UIWindow inhibitTextEffectsRotation](self, "inhibitTextEffectsRotation");
  }
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIAutoRotatingWindow;
  v5 = -[UIApplicationRotationFollowingWindow _initWithFrame:debugName:windowScene:](&v7, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "commonInit");
  return v5;
}

- (void)commonInit
{
  void *v3;
  id v4;

  self->_interfaceOrientation = 1;
  self->_unknownOrientation = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_matchDeviceOrientation_, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);

  if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_matchDeviceOrientation_, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), 0);

  }
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAutoRotatingWindow;
  v4 = -[UIApplicationRotationFollowingWindow _initWithFrame:attached:](&v6, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v4, "commonInit");
  return v4;
}

@end
