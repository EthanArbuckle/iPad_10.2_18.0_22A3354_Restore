@implementation SBAccessoryController

+ (id)sharedInstance
{
  if (sharedInstance___once_8 != -1)
    dispatch_once(&sharedInstance___once_8, &__block_literal_global_205);
  return (id)__controllerInstance_3;
}

uint64_t __39__SBAccessoryController_sharedInstance__block_invoke()
{
  SBAccessoryController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBAccessoryController);
  v1 = (void *)__controllerInstance_3;
  __controllerInstance_3 = (uint64_t)v0;

  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_3;
}

- (void)_showWindowedAccessoryWindow:(BOOL)a3 forWindowScene:(id)a4
{
  _BOOL4 v4;
  SBWindowedAccessoryWindow *v6;
  SBWindow *window;
  SBWindowedAccessoryViewController *v8;
  SBWindowedAccessoryViewController *windowedAccessoryViewController;
  SBWindowedAccessoryViewController *v10;
  SBWindow *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  if (v4)
  {
    v6 = -[SBWindow initWithWindowScene:role:debugName:]([SBWindowedAccessoryWindow alloc], "initWithWindowScene:role:debugName:", v14, CFSTR("SBTraitsParticipantRoleWindowedAccessory"), CFSTR("Windowed Accessory Window"));
    window = self->_window;
    self->_window = &v6->super.super;

    v8 = objc_alloc_init(SBWindowedAccessoryViewController);
    windowedAccessoryViewController = self->_windowedAccessoryViewController;
    self->_windowedAccessoryViewController = v8;

    -[SBWindowedAccessoryViewController setDelegate:](self->_windowedAccessoryViewController, "setDelegate:", self);
    -[SBWindow setRootViewController:](self->_window, "setRootViewController:", self->_windowedAccessoryViewController);
    -[SBWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 50.0);
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleWindowedAccessory")) & 1) == 0)
      -[SBWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 0, 0, 0.0);
    -[SBWindow setHidden:](self->_window, "setHidden:", 0);
  }
  else
  {
    v10 = self->_windowedAccessoryViewController;
    self->_windowedAccessoryViewController = 0;

    -[SBWindow setHidden:](self->_window, "setHidden:", 1);
    v11 = self->_window;
    self->_window = 0;

  }
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason showWindowedAccessoryWindow](SBKeyboardFocusArbitrationReason, "showWindowedAccessoryWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestArbitrationForSBWindowScene:forReason:", v14, v13);

}

- (void)windowedAccessoryViewControllerForceDetachButtonTapped:(id)a3
{
  id v3;

  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowedAccessoryDismissed");

}

- (BOOL)isWindowedAccessoryWindowVisible
{
  SBWindow *window;

  window = self->_window;
  if (window)
    LOBYTE(window) = -[SBWindow isHidden](window, "isHidden") ^ 1;
  return (char)window;
}

- (SBWindow)window
{
  return self->_window;
}

- (SBWindowedAccessoryViewController)windowedAccessoryViewController
{
  return self->_windowedAccessoryViewController;
}

- (void)setWindowedAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_windowedAccessoryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowedAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
