@implementation SBDeviceUnlockAggdLogger

- (SBDeviceUnlockAggdLogger)init
{
  SBDeviceUnlockAggdLogger *v2;
  SBDeviceUnlockAggdLogger *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDeviceUnlockAggdLogger;
  v2 = -[SBDeviceUnlockAggdLogger init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observeDashBoardEvents = 1;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerExternalEventHandler:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coverSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterExternalEventHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceUnlockAggdLogger;
  -[SBDeviceUnlockAggdLogger dealloc](&v5, sel_dealloc);
}

- (void)logDeviceWake
{
  -[SBDeviceUnlockAggdLogger logOrientationAndAccessoryStateForPrefix:](self, "logOrientationAndAccessoryStateForPrefix:", CFSTR("com.apple.springboard.wake"));
}

- (void)logDeviceUnlock
{
  -[SBDeviceUnlockAggdLogger logOrientationAndAccessoryStateForPrefix:](self, "logOrientationAndAccessoryStateForPrefix:", CFSTR("com.apple.springboard.unlock"));
}

- (void)logOrientationAndAccessoryStateForPrefix:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBDeviceUnlockAggdKeyForPrefixAndOrientation((uint64_t)v7, objc_msgSend(v5, "orientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientAddValueForScalarKey();
    if (objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("keyboard"));
      ADClientAddValueForScalarKey();
    }
    if (objc_msgSend((id)SBApp, "smartCoverIsClosed"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("SmartCover"));
      ADClientAddValueForScalarKey();
    }

  }
}

- (void)logIdleTimerScreenDimWarning
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.springboard.idleTimer"), CFSTR("screenDim"));
    ADClientAddValueForScalarKey();
  }
}

- (void)logUserResetIdleTimer
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.springboard.idleTimer"), CFSTR("userAttentionReset"));
    ADClientAddValueForScalarKey();
  }
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBDeviceUnlockAggdLogger _observeDashBoardEvents](self, "_observeDashBoardEvents"))
    return 2;
  else
    return 1;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  SBDeviceUnlockAggdLogger *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 12)
  {
    -[SBDeviceUnlockAggdLogger logDeviceUnlock](self, "logDeviceUnlock");
    v6 = self;
    v7 = 0;
LABEL_7:
    -[SBDeviceUnlockAggdLogger _setObserveDashBoardEvents:](v6, "_setObserveDashBoardEvents:", v7);
    goto LABEL_8;
  }
  if (v5 == 25)
  {
    v6 = self;
    v7 = 1;
    goto LABEL_7;
  }
  if (v5 != 24)
  {
    v8 = 0;
    goto LABEL_10;
  }
  -[SBDeviceUnlockAggdLogger logDeviceWake](self, "logDeviceWake");
LABEL_8:
  v8 = objc_msgSend(v4, "isConsumable");
LABEL_10:

  return v8;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)_observeDashBoardEvents
{
  return self->_observeDashBoardEvents;
}

- (void)_setObserveDashBoardEvents:(BOOL)a3
{
  self->_observeDashBoardEvents = a3;
}

@end
