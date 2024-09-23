@implementation SBVolumeHardwareButton

- (void)dealloc
{
  BSInvalidatable *volumeIncreaseActiveAssertion;
  BSInvalidatable *volumeDecreaseActiveAssertion;
  objc_super v5;

  -[BSInvalidatable invalidate](self->_volumeIncreaseActiveAssertion, "invalidate");
  volumeIncreaseActiveAssertion = self->_volumeIncreaseActiveAssertion;
  self->_volumeIncreaseActiveAssertion = 0;

  -[BSInvalidatable invalidate](self->_volumeDecreaseActiveAssertion, "invalidate");
  volumeDecreaseActiveAssertion = self->_volumeDecreaseActiveAssertion;
  self->_volumeDecreaseActiveAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBVolumeHardwareButton;
  -[SBVolumeHardwareButton dealloc](&v5, sel_dealloc);
}

- (SBVolumeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeButtonType:(int64_t)a5
{
  id v9;
  id v10;
  SBVolumeHardwareButton *v11;
  SBVolumeHardwareButton *v12;
  SBVolumeHardwareButtonActions *v13;
  SBVolumeHardwareButtonActions *buttonActions;
  SBPressSequenceObserver *v15;
  SBPressSequenceObserver *volumeIncreaseSequenceObserver;
  SBPressSequenceObserver *v17;
  SBPressSequenceObserver *volumeDecreaseSequenceObserver;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBVolumeHardwareButton;
  v11 = -[SBVolumeHardwareButton init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_homeButtonType = a5;
    v13 = objc_alloc_init(SBVolumeHardwareButtonActions);
    buttonActions = v12->_buttonActions;
    v12->_buttonActions = v13;

    v15 = -[SBPressSequenceObserver initWithPressName:]([SBPressSequenceObserver alloc], "initWithPressName:", CFSTR("VolumeUp"));
    volumeIncreaseSequenceObserver = v12->_volumeIncreaseSequenceObserver;
    v12->_volumeIncreaseSequenceObserver = v15;

    v17 = -[SBPressSequenceObserver initWithPressName:]([SBPressSequenceObserver alloc], "initWithPressName:", CFSTR("VolumeDown"));
    volumeDecreaseSequenceObserver = v12->_volumeDecreaseSequenceObserver;
    v12->_volumeDecreaseSequenceObserver = v17;

    objc_storeStrong((id *)&v12->_screenshotGestureRecognizer, a3);
    objc_storeStrong((id *)&v12->_shutdownGestureRecognizer, a4);
    -[SBVolumeHardwareButton _createGestureRecognizers](v12, "_createGestureRecognizers");
  }

  return v12;
}

- (void)addVolumePressBandit:(id)a3
{
  -[SBVolumeHardwareButtonActions addVolumePressBandit:](self->_buttonActions, "addVolumePressBandit:", a3);
}

- (void)removeVolumePressBandit:(id)a3
{
  -[SBVolumeHardwareButtonActions removeVolumePressBandit:](self->_buttonActions, "removeVolumePressBandit:", a3);
}

- (void)cancelVolumePress
{
  -[SBVolumeHardwareButtonActions cancelVolumePress](self->_buttonActions, "cancelVolumePress");
}

- (void)_createGestureRecognizers
{
  SBPressGestureRecognizer *v3;
  SBPressGestureRecognizer *volumeIncreaseButtonPressGestureRecognizer;
  void *v5;
  SBPressGestureRecognizer *v6;
  SBPressGestureRecognizer *volumeDecreaseButtonPressGestureRecognizer;
  void *v8;
  SBPressGestureRecognizer *v9;
  SBPressGestureRecognizer *rawVolumeButtonPressGestureRecognizer;
  id v11;

  v3 = -[SBPressGestureRecognizer initWithTarget:action:]([SBPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_volumeIncreasePress_);
  volumeIncreaseButtonPressGestureRecognizer = self->_volumeIncreaseButtonPressGestureRecognizer;
  self->_volumeIncreaseButtonPressGestureRecognizer = v3;

  -[SBPressGestureRecognizer setName:](self->_volumeIncreaseButtonPressGestureRecognizer, "setName:", CFSTR("VolumeIncrease"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_volumeIncreaseButtonPressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE1A0);
  -[SBPressGestureRecognizer setDelegate:](self->_volumeIncreaseButtonPressGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_volumeIncreaseButtonPressGestureRecognizer, 88);

  v6 = -[SBPressGestureRecognizer initWithTarget:action:]([SBPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_volumeDecreasePress_);
  volumeDecreaseButtonPressGestureRecognizer = self->_volumeDecreaseButtonPressGestureRecognizer;
  self->_volumeDecreaseButtonPressGestureRecognizer = v6;

  -[SBPressGestureRecognizer setName:](self->_volumeDecreaseButtonPressGestureRecognizer, "setName:", CFSTR("VolumeDecrease"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_volumeDecreaseButtonPressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE1B8);
  -[SBPressGestureRecognizer setDelegate:](self->_volumeDecreaseButtonPressGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:withType:", self->_volumeDecreaseButtonPressGestureRecognizer, 89);

  v9 = -[SBPressGestureRecognizer initWithTarget:action:]([SBPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__rawVolumePress_);
  rawVolumeButtonPressGestureRecognizer = self->_rawVolumeButtonPressGestureRecognizer;
  self->_rawVolumeButtonPressGestureRecognizer = v9;

  -[SBPressGestureRecognizer setName:](self->_rawVolumeButtonPressGestureRecognizer, "setName:", CFSTR("VolumeRaw"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_rawVolumeButtonPressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE1D0);
  -[SBPressGestureRecognizer setDelegate:](self->_rawVolumeButtonPressGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:withType:", self->_rawVolumeButtonPressGestureRecognizer, 90);

}

- (void)volumeIncreasePress:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  SBLogButtonsVolume();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5 == 1;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "RECEIVED volumeIncreasePress down:%{BOOL}u", (uint8_t *)v8, 8u);
  }

  -[SBVolumeHardwareButton _aggdLogVolumeIncreaseButtonDown:](self, "_aggdLogVolumeIncreaseButtonDown:", v5 == 1);
  -[SBVolumeHardwareButton _logVolumeButtonWithObserver:down:](self, "_logVolumeButtonWithObserver:down:", self->_volumeIncreaseSequenceObserver, v5 == 1);
  if (v5 == 1)
  {
    objc_msgSend(v4, "_activeEventOfType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVolumeHardwareButtonActions volumeIncreasePressDownWithModifiers:](self->_buttonActions, "volumeIncreasePressDownWithModifiers:", objc_msgSend(v7, "modifierFlags"));

  }
  else
  {
    -[SBVolumeHardwareButtonActions volumeIncreasePressUp](self->_buttonActions, "volumeIncreasePressUp");
  }

}

- (void)volumeDecreasePress:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  SBLogButtonsVolume();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5 == 1;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "RECEIVED volumeDecreasePress down:%{BOOL}u", (uint8_t *)v8, 8u);
  }

  -[SBVolumeHardwareButton _aggdLogVolumeDecreaseButtonDown:](self, "_aggdLogVolumeDecreaseButtonDown:", v5 == 1);
  -[SBVolumeHardwareButton _logVolumeButtonWithObserver:down:](self, "_logVolumeButtonWithObserver:down:", self->_volumeDecreaseSequenceObserver, v5 == 1);
  if (v5 == 1)
  {
    objc_msgSend(v4, "_activeEventOfType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVolumeHardwareButtonActions volumeDecreasePressDownWithModifiers:](self->_buttonActions, "volumeDecreasePressDownWithModifiers:", objc_msgSend(v7, "modifierFlags"));

  }
  else
  {
    -[SBVolumeHardwareButtonActions volumeDecreasePressUp](self->_buttonActions, "volumeDecreasePressUp");
  }

}

- (void)_logVolumeButtonWithObserver:(id)a3 down:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  objc_msgSend(a3, "pressCollector");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SBPressCollector currentTimeStamp](SBPressCollector, "currentTimeStamp");
  if (v4)
    objc_msgSend(v5, "registerPressDownWithTimeStamp:");
  else
    objc_msgSend(v5, "registerPressUpWithTimeStamp:");

}

- (void)_aggdLogVolumeIncreaseButtonDown:(BOOL)a3
{
  double v4;
  double v5;
  double v6;

  if (a3)
  {
    self->_volumeUpAggdStartTime = mach_absolute_time();
  }
  else if (self->_volumeUpAggdStartTime)
  {
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    v5 = v4;
    BSAbsoluteTimeFromMachTime();
    if (v5 - v6 > 2.5)
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    self->_volumeUpAggdStartTime = 0;
  }
}

- (void)_aggdLogVolumeDecreaseButtonDown:(BOOL)a3
{
  double v4;
  double v5;
  double v6;

  if (a3)
  {
    self->_volumeDownAggdStartTime = mach_absolute_time();
  }
  else if (self->_volumeDownAggdStartTime)
  {
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    v5 = v4;
    BSAbsoluteTimeFromMachTime();
    if (v5 - v6 > 2.5)
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    self->_volumeDownAggdStartTime = 0;
  }
}

- (void)_rawVolumePress:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "latestPressType");
  v6 = objc_msgSend(v4, "latestPressPhase");

  if (v6 > 4 || ((1 << v6) & 0x19) == 0)
  {
    SBLogButtonsVolume();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring rawVolumePress phase: %li", (uint8_t *)&v9, 0xCu);
    }

  }
  else if (v5 == 103)
  {
    -[SBVolumeHardwareButton _rawVolumeDecreasePress:](self, "_rawVolumeDecreasePress:", v6 == 0);
  }
  else if (v5 == 102)
  {
    -[SBVolumeHardwareButton _rawVolumeIncreasePress:](self, "_rawVolumeIncreasePress:", v6 == 0);
  }
}

- (void)_rawVolumeIncreasePress:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BSInvalidatable *volumeIncreaseActiveAssertion;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "RECEIVED rawVolumeIncreasePress down:%{BOOL}u", (uint8_t *)v11, 8u);
  }

  volumeIncreaseActiveAssertion = self->_volumeIncreaseActiveAssertion;
  if (v3)
  {
    if (volumeIncreaseActiveAssertion)
      return;
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    -[SBVolumeHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHardwareButtonCoordinator assertButtonIsActive:dropletHintIdentifier:](hardwareButtonCoordinator, "assertButtonIsActive:dropletHintIdentifier:", v8, 3);
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_volumeIncreaseActiveAssertion;
    self->_volumeIncreaseActiveAssertion = v9;

  }
  else
  {
    -[BSInvalidatable invalidate](volumeIncreaseActiveAssertion, "invalidate");
    v8 = self->_volumeIncreaseActiveAssertion;
    self->_volumeIncreaseActiveAssertion = 0;
  }

}

- (void)_rawVolumeDecreasePress:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BSInvalidatable *volumeDecreaseActiveAssertion;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "RECEIVED rawVolumeDecreasePress down:%{BOOL}u", (uint8_t *)v11, 8u);
  }

  volumeDecreaseActiveAssertion = self->_volumeDecreaseActiveAssertion;
  if (v3)
  {
    if (volumeDecreaseActiveAssertion)
      return;
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    -[SBVolumeHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHardwareButtonCoordinator assertButtonIsActive:dropletHintIdentifier:](hardwareButtonCoordinator, "assertButtonIsActive:dropletHintIdentifier:", v8, 4);
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_volumeDecreaseActiveAssertion;
    self->_volumeDecreaseActiveAssertion = v9;

  }
  else
  {
    -[BSInvalidatable invalidate](volumeDecreaseActiveAssertion, "invalidate");
    v8 = self->_volumeDecreaseActiveAssertion;
    self->_volumeDecreaseActiveAssertion = 0;
  }

}

- (id)preemptablePressGestureRecognizers
{
  SBPressGestureRecognizer *volumeDecreaseButtonPressGestureRecognizer;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  volumeDecreaseButtonPressGestureRecognizer = self->_volumeDecreaseButtonPressGestureRecognizer;
  v4[0] = self->_volumeIncreaseButtonPressGestureRecognizer;
  v4[1] = volumeDecreaseButtonPressGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBPressGestureRecognizer *v4;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  BOOL v13;
  int v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (SBPressGestureRecognizer *)a3;
  if (self->_rawVolumeButtonPressGestureRecognizer != v4)
  {
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    -[SBVolumeHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(hardwareButtonCoordinator) = -[SBHardwareButtonCoordinator buttonShouldStart:](hardwareButtonCoordinator, "buttonShouldStart:", v6);

    if ((hardwareButtonCoordinator & 1) == 0)
    {
      SBLogButtonsVolume();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring volume buttons events because hardware button coordinator says nope", (uint8_t *)&v17, 2u);
      }
      v13 = 0;
      goto LABEL_14;
    }
    objc_msgSend((id)SBApp, "restartManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (-[NSObject startupTransition](v7, "startupTransition"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      v15 = -[NSObject isPendingExit](v8, "isPendingExit");
      SBLogButtonsVolume();
      v10 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (v16)
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "will begin volume button press", (uint8_t *)&v17, 2u);
        }
        v13 = 1;
        goto LABEL_9;
      }
      if (v16)
      {
        -[NSObject pendingRestartTransitionRequest](v8, "pendingRestartTransitionRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v11;
        v12 = "Ignoring volume buttons event because we are pending a restart: %@";
        goto LABEL_7;
      }
    }
    else
    {
      SBLogButtonsVolume();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject startupTransition](v8, "startupTransition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v11;
        v12 = "Ignoring volume buttons events because we're in a startup transition: %@";
LABEL_7:
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0xCu);

      }
    }
    v13 = 0;
LABEL_9:

LABEL_14:
    goto LABEL_15;
  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  SBPressGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  UIGestureRecognizer *v8;
  int v9;
  NSObject *v10;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (SBPressGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = v7;
  if (self->_rawVolumeButtonPressGestureRecognizer == v6)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if (self->_homeButtonType == 2
      && (self->_volumeIncreaseButtonPressGestureRecognizer == v6
       || self->_volumeDecreaseButtonPressGestureRecognizer == v6)
      && (self->_screenshotGestureRecognizer == v7 || self->_shutdownGestureRecognizer == v7))
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "physicalButtonSceneOverrideManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[SBPhysicalButtonSceneOverrideManager isTargetingButton:withConfigurationIdentifier:](v13, 1, 1);
      v15 = -[SBPhysicalButtonSceneOverrideManager isTargetingButton:withConfigurationIdentifier:](v13, 1, 2);
      v9 = 0;
      if (!v14 && !v15)
      {
        objc_msgSend((id)SBApp, "ringerControl");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SBRingerControl isRingerHUDVisible]((uint64_t)v16) ^ 1;

      }
    }
    else
    {
      v9 = 0;
    }
    SBLogButtonsVolume();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "shouldRequireFailure: %{BOOL}u", (uint8_t *)v17, 8u);
    }

  }
  return v9;
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Volume");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (NSHashTable)volumePressBandits
{
  return (NSHashTable *)objc_loadWeakRetained((id *)&self->_volumePressBandits);
}

- (void)setVolumePressBandits:(id)a3
{
  objc_storeWeak((id *)&self->_volumePressBandits, a3);
}

- (SBPressSequenceObserver)volumeIncreaseSequenceObserver
{
  return self->_volumeIncreaseSequenceObserver;
}

- (SBPressSequenceObserver)volumeDecreaseSequenceObserver
{
  return self->_volumeDecreaseSequenceObserver;
}

- (SBVolumeHardwareButtonActions)buttonActions
{
  return self->_buttonActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSequenceObserver, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseSequenceObserver, 0);
  objc_destroyWeak((id *)&self->_volumePressBandits);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseActiveAssertion, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseActiveAssertion, 0);
  objc_storeStrong((id *)&self->_shutdownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_screenshotGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rawVolumeButtonPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseButtonPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseButtonPressGestureRecognizer, 0);
}

@end
