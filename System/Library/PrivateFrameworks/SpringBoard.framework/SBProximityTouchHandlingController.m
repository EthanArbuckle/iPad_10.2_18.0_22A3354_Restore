@implementation SBProximityTouchHandlingController

- (SBProximityTouchHandlingController)initWithSettings:(id)a3 touchHandlingDelegate:(id)a4
{
  id v6;
  id v7;
  SBProximityTouchHandlingController *v8;
  _SBProximityTouchHandlingViewController *v9;
  _SBProximityTouchHandlingViewController *proxTouchHandlingViewController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBProximityTouchHandlingController;
  v8 = -[SBProximityTouchHandlingController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_SBProximityTouchHandlingViewController);
    proxTouchHandlingViewController = v8->_proxTouchHandlingViewController;
    v8->_proxTouchHandlingViewController = v9;

    -[_SBProximityTouchHandlingViewController setDelegate:](v8->_proxTouchHandlingViewController, v7);
    -[_SBProximityTouchHandlingViewController setProximitySettings:]((uint64_t)v8->_proxTouchHandlingViewController, v6);
    BKSHIDServicesSetObjectInProximityIgnoresTouches();
  }

  return v8;
}

- (void)invalidate
{
  UIWindow *proxTouchHandlingWindow;

  -[UIWindow setHidden:](self->_proxTouchHandlingWindow, "setHidden:", 1);
  proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
  self->_proxTouchHandlingWindow = 0;

}

- (void)windowSceneDidConnect:(id)a3
{
  UIWindow *proxTouchHandlingWindow;
  id v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_windowScene, a3);
  proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
  if (proxTouchHandlingWindow)
  {
    -[UIWindow windowScene](proxTouchHandlingWindow, "windowScene");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
      -[UIWindow setWindowScene:](self->_proxTouchHandlingWindow, "setWindowScene:", v7);
  }

}

- (_QWORD)_createNewWindow
{
  _QWORD *v1;
  NSObject *v2;
  _BOOL4 v3;

  if (a1)
  {
    v1 = a1;
    if (!a1[4])
    {
      SBLogCommon();
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

      if (v3)
        NSLog(CFSTR("Trying to create the prox touch handling window before we've connected to a scene."));
    }
    +[_SBProximityTouchHandlingWindow proximityTouchHandlingWindowWithScene:viewController:]((uint64_t)_SBProximityTouchHandlingWindow, (void *)v1[4], (void *)v1[6]);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setAbsorbTouchesBelowStatusBar:(BOOL)a3
{
  _BOOL4 v3;
  UIWindow *v5;
  UIWindow *proxTouchHandlingWindow;
  NSObject *v7;
  _BOOL4 v8;
  double statusBarHeight;
  void *suppressSystemGestures;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  int v14;
  double v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_proxTouchHandlingWindow)
  {
    -[SBProximityTouchHandlingController _createNewWindow](self);
    v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
    self->_proxTouchHandlingWindow = v5;

  }
  SBLogProximitySensor();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v8)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Not absorbing touches", (uint8_t *)&v14, 2u);
    }

    -[UIWindow setHidden:](self->_proxTouchHandlingWindow, "setHidden:", 1);
    -[BSInvalidatable invalidate](self->_suppressSystemGestures, "invalidate");
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = 0;
    goto LABEL_12;
  }
  if (v8)
  {
    statusBarHeight = self->_statusBarHeight;
    v14 = 134217984;
    v15 = statusBarHeight;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Absorbing touches below y:%g", (uint8_t *)&v14, 0xCu);
  }

  -[UIWindow setHidden:](self->_proxTouchHandlingWindow, "setHidden:", 0);
  if (!self->_suppressSystemGestures && self->_statusBarHeight == 0.0)
  {
    BKSHIDServicesCancelTouchesOnMainDisplay();
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    suppressSystemGestures = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSystemGestureManager deviceHardwareButtonGestureTypes](SBSystemGestureManager, "deviceHardwareButtonGestureTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(suppressSystemGestures, "acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:", CFSTR("objectInProximity"), v11);
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_suppressSystemGestures;
    self->_suppressSystemGestures = v12;

LABEL_12:
  }
}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_statusBarHeight = a3;
    -[_SBProximityTouchHandlingViewController setStatusBarHeight:]((double *)self->_proxTouchHandlingViewController, a3);
  }
}

- (BOOL)absorbTouchesBelowStatusBar
{
  return self->_absorbTouchesBelowStatusBar;
}

- (NSSet)allowedSystemGestureTypes
{
  return self->_allowedSystemGestureTypes;
}

- (void)setAllowedSystemGestureTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedSystemGestureTypes, a3);
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
  objc_storeStrong((id *)&self->_suppressBackBoardTouchCancellation, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingViewController, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingWindow, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_allowedSystemGestureTypes, 0);
}

@end
