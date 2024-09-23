@implementation SBBrightnessControl

- (SBBrightnessControl)initWithHUDController:(id)a3
{
  id v6;
  SBBrightnessControl *v7;
  SBBrightnessControl *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBrightnessControl.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUDController"));

  }
  v12.receiver = self;
  v12.super_class = (Class)SBBrightnessControl;
  v7 = -[SBBrightnessControl init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_HUDController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__controlCenterWillPresent_, CFSTR("SBControlCenterControllerWillPresentNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__controlCenterWillDismiss_, CFSTR("SBControlCenterControllerWillDismissNotification"), 0);

  }
  return v8;
}

+ (BOOL)handlesKeyCommandsForRoute:(int64_t)a3
{
  __objc2_class **v3;

  if (a3 == 1)
  {
    v3 = off_1E8E959C8;
    return -[__objc2_class handlesKeyCommands](*v3, "handlesKeyCommands");
  }
  if (a3 == 2)
  {
    v3 = off_1E8E96B00;
    return -[__objc2_class handlesKeyCommands](*v3, "handlesKeyCommands");
  }
  return 0;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3 forRoute:(int64_t)a4
{
  id v5;

  -[SBBrightnessControl _controllerForRoute:](self, "_controllerForRoute:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleBrightnessKeyPressEvent:", a3);

}

- (void)setBrightnessLevel:(float)a3 forRoute:(int64_t)a4
{
  double v5;
  id v6;

  -[SBBrightnessControl _controllerForRoute:](self, "_controllerForRoute:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v6, "setBrightnessLevel:animated:", 1, v5);

}

- (void)cancelBrightnessKeyPressEvents
{
  -[SBKeyboardBrightnessController cancelBrightnessKeyPressEvent](self->_keyboardBrightnessController, "cancelBrightnessKeyPressEvent");
  -[SBDisplayBrightnessController cancelBrightnessKeyPressEvent](self->_displayBrightnessController, "cancelBrightnessKeyPressEvent");
}

- (id)acquireBrightnessHUDHiddenAssertionForReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SBBrightnessControl cancelBrightnessKeyPressEvents](self, "cancelBrightnessKeyPressEvents");
  -[SBHUDController acquireHUDHiddenAssertionForIdentifier:withReason:](self->_HUDController, "acquireHUDHiddenAssertionForIdentifier:withReason:", *MEMORY[0x1E0DAB7D8], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)brightnessController:(id)a3 performCoordinatedBrightnessChangeForIncrementKeyDown:(BOOL)a4 decrementKeyDown:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v5 = a5;
  v6 = a4;
  v15 = a3;
  -[SBBrightnessControl setActiveController:](self, "setActiveController:");
  -[SBBrightnessControl _handleUpdateBrightnessIncrementKeyIsDown:decrementKeyIsDown:](self, "_handleUpdateBrightnessIncrementKeyIsDown:decrementKeyIsDown:", v6, v5);
  if (v6 || v5)
  {
    objc_msgSend(v15, "brightnessLevel");
    v9 = *(float *)&v8 + -0.0625;
    if ((float)(*(float *)&v8 + -0.0625) < 0.0)
      v9 = 0.0;
    v10 = fminf(*(float *)&v8 + 0.0625, 1.0);
    if (v6)
      v11 = v10;
    else
      v11 = v9;
    if (*(float *)&v8 != v11)
    {
      -[SBBrightnessControl presentedBrightnessHUDViewController](self, "presentedBrightnessHUDViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v13 = v11;
      objc_msgSend(v12, "noteValueWillDeltaStepToValue:", v13);

    }
    *(float *)&v8 = v11;
    objc_msgSend(v15, "setBrightnessLevel:animated:", 1, v8);
    *(float *)&v14 = v11;
    -[SBBrightnessControl _presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:](self, "_presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:", v14);
  }

}

- (float)elasticValueViewControllerCurrentValue:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[SBBrightnessControl activeDataSource](self, "activeDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brightnessLevel");
  v5 = v4;

  return v5;
}

- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4
{
  void *v5;
  double v6;
  char v7;

  -[SBBrightnessControl activeDataSource](self, "activeDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  v7 = objc_msgSend(v5, "setBrightnessLevel:animated:", 0, v6);

  return v7;
}

- (int64_t)elasticBrightnessViewControllerBrightnessRouteType:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBBrightnessControl activeDataSource](self, "activeDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "brightnessRouteType");

  return v4;
}

- (void)elasticBrightnessViewControllerValueUpdatesWillBegin:(id)a3
{
  id v3;

  -[SBBrightnessControl activeDataSource](self, "activeDataSource", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteValueUpdatesWillBegin");

}

- (void)elasticBrightnessViewControllerValueUpdatesDidEnd:(id)a3
{
  id v3;

  -[SBBrightnessControl activeDataSource](self, "activeDataSource", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteValueUpdatesDidEnd");

}

- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  return -[SBBrightnessControl _HUDIsDisplayableWithReason:](self, "_HUDIsDisplayableWithReason:", a4);
}

- (void)elasticHUDViewControllerRequestsDismissal:(id)a3
{
  id v3;

  -[SBHUDController presentedHUDControllerForIdentifier:](self->_HUDController, "presentedHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7D8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAnimated:", 0);

}

- (void)_controlCenterWillPresent:(id)a3
{
  id v3;

  if (!self->_controlCenterIsPresented)
  {
    self->_controlCenterIsPresented = 1;
    -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7D8]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissAnimated:", 1);

  }
}

- (void)_controlCenterWillDismiss:(id)a3
{
  self->_controlCenterIsPresented = 0;
}

- (id)presentedBrightnessHUDViewController
{
  void *v2;
  void *v3;

  -[SBHUDController presentedHUDControllerForIdentifier:](self->_HUDController, "presentedHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HUDViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)existingBrightnessHUDViewController
{
  void *v2;
  void *v3;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HUDViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:(float)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBElasticHUDViewController *v10;
  double v11;
  id v12;
  id v13;

  if (-[SBBrightnessControl _HUDIsDisplayable](self, "_HUDIsDisplayable"))
  {
    v5 = *MEMORY[0x1E0DAB7D8];
    -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7D8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HUDViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[SBElasticValueViewControllerFactory factoryWithBrightnessDataSource:](SBElasticValueViewControllerFactory, "factoryWithBrightnessDataSource:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBElasticHUDViewController initWithFactory:]([SBElasticHUDViewController alloc], "initWithFactory:", v9);

      -[SBElasticHUDViewController setDelegate:](v10, "setDelegate:", self);
      -[SBHUDController HUDSessionForViewController:identifier:](self->_HUDController, "HUDSessionForViewController:identifier:", v10, v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v12;
      v7 = v10;
    }
    v13 = v8;
    objc_msgSend(v8, "presentWithDismissalInterval:animated:", 0, 60.0);
    *(float *)&v11 = a3;
    objc_msgSend(v7, "noteValueDidChange:", v11);
    if (v6)
      goto LABEL_13;
    if (self->_brightnessIncrementKeyIsDown)
    {
      if (!self->_brightnessDecrementKeyIsDown)
        goto LABEL_12;
    }
    else if (!self->_brightnessDecrementKeyIsDown)
    {
      goto LABEL_13;
    }
    objc_msgSend(v7, "noteButtonDownWasHit:", 1);
    if (self->_brightnessIncrementKeyIsDown)
LABEL_12:
      objc_msgSend(v7, "noteButtonUpWasHit:", 1);
LABEL_13:

  }
}

- (BOOL)_HUDIsDisplayable
{
  return -[SBBrightnessControl _HUDIsDisplayableWithReason:](self, "_HUDIsDisplayableWithReason:", 0);
}

- (BOOL)_HUDIsDisplayableWithReason:(id *)a3
{
  _BOOL4 controlCenterIsPresented;

  controlCenterIsPresented = self->_controlCenterIsPresented;
  if (self->_controlCenterIsPresented && a3 != 0)
    *a3 = CFSTR("Control Center is presented");
  return !controlCenterIsPresented;
}

- (void)_handleUpdateBrightnessIncrementKeyIsDown:(BOOL)a3 decrementKeyIsDown:(BOOL)a4
{
  int v4;
  int v5;
  uint64_t v7;
  int brightnessIncrementKeyIsDown;
  int brightnessDecrementKeyIsDown;
  _BOOL4 v10;
  int v11;
  int v12;
  id v14;

  v4 = a4;
  v5 = a3;
  -[SBBrightnessControl presentedBrightnessHUDViewController](self, "presentedBrightnessHUDViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  brightnessIncrementKeyIsDown = self->_brightnessIncrementKeyIsDown;
  brightnessDecrementKeyIsDown = self->_brightnessDecrementKeyIsDown;
  v14 = (id)v7;
  if (v7)
  {
    v10 = -[SBBrightnessControl _HUDIsDisplayable](self, "_HUDIsDisplayable");
    if (brightnessIncrementKeyIsDown != v5 && (v5 & 1) == 0)
      objc_msgSend(v14, "noteButtonUpWasHit:", 0);
    if (brightnessDecrementKeyIsDown != v4 && (v4 & 1) == 0)
      objc_msgSend(v14, "noteButtonDownWasHit:", 0);
    v11 = !v10;
    if (brightnessIncrementKeyIsDown != v5 && v5 && (v11 & 1) == 0)
      objc_msgSend(v14, "noteButtonUpWasHit:", 1);
    v12 = v4 ^ 1;
    if (brightnessDecrementKeyIsDown == v4)
      v12 = 1;
    if (((v12 | v11) & 1) == 0)
      objc_msgSend(v14, "noteButtonDownWasHit:", 1);
  }
  if (brightnessIncrementKeyIsDown != v5 || brightnessDecrementKeyIsDown != v4)
    -[SBBrightnessControl _resetIdleTimerForUserInteractionIfNecessary](self, "_resetIdleTimerForUserInteractionIfNecessary");
  self->_brightnessIncrementKeyIsDown = v5;
  self->_brightnessDecrementKeyIsDown = v4;

}

- (id)activeDataSource
{
  return self->_activeController;
}

- (void)setActiveController:(id)a3
{
  SBBrightnessRouteControlling *v5;
  SBBrightnessRouteControlling *activeController;
  SBBrightnessRouteControlling *v7;
  void *v8;
  SBBrightnessRouteControlling *v9;

  v5 = (SBBrightnessRouteControlling *)a3;
  activeController = self->_activeController;
  if (activeController != v5)
  {
    v9 = v5;
    v7 = activeController;
    objc_storeStrong((id *)&self->_activeController, a3);
    if (v7)
    {
      -[SBBrightnessRouteControlling noteValueUpdatesDidEnd](v7, "noteValueUpdatesDidEnd");
      -[SBBrightnessControl existingBrightnessHUDViewController](self, "existingBrightnessHUDViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadData");

    }
    v5 = v9;
  }

}

- (id)_controllerForRoute:(int64_t)a3
{
  SBBrightnessControl *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *keyboardBrightnessController;
  SBKeyboardBrightnessController *v7;
  SBKeyboardBrightnessController *v8;
  SBDisplayBrightnessController *v9;
  SBDisplayBrightnessController *displayBrightnessController;

  v3 = self;
  switch(a3)
  {
    case 2:
      keyboardBrightnessController = self->_keyboardBrightnessController;
      if (!keyboardBrightnessController)
      {
        v7 = -[SBKeyboardBrightnessController initWithCoordinator:]([SBKeyboardBrightnessController alloc], "initWithCoordinator:", self);
        v8 = v3->_keyboardBrightnessController;
        v3->_keyboardBrightnessController = v7;

        keyboardBrightnessController = v3->_keyboardBrightnessController;
      }
      goto LABEL_11;
    case 1:
      keyboardBrightnessController = self->_displayBrightnessController;
      if (!keyboardBrightnessController)
      {
        v9 = -[SBDisplayBrightnessController initWithCoordinator:]([SBDisplayBrightnessController alloc], "initWithCoordinator:", self);
        displayBrightnessController = v3->_displayBrightnessController;
        v3->_displayBrightnessController = v9;

        keyboardBrightnessController = v3->_displayBrightnessController;
      }
LABEL_11:
      self = keyboardBrightnessController;
      return self;
    case 0:
      SBLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

      if (v5)
        NSLog(CFSTR("Attempting to control brightness route SBBrightnessRouteTypeUnknown."));
      self = 0;
      break;
  }
  return self;
}

- (void)_resetIdleTimerForUserInteractionIfNecessary
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isUILocked"))
  {
    objc_msgSend(v8, "lockScreenEnvironment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backlightController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInScreenOffMode");

    if ((v4 & 1) == 0)
    {
      +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists](SBIdleTimerGlobalCoordinator, "sharedInstanceIfExists");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resetIdleTimerForReason:", v7);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeController, 0);
  objc_storeStrong((id *)&self->_displayBrightnessController, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessController, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
}

@end
