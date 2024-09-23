@implementation SBSOSLockGestureObserver

- (SBSOSLockGestureObserver)init
{
  return -[SBSOSLockGestureObserver initWithConfiguration:](self, "initWithConfiguration:", 1);
}

- (SBSOSLockGestureObserver)initWithConfiguration:(int64_t)a3
{
  SBSOSLockGestureObserver *v4;
  SBSOSLockGestureObserver *v5;
  SBPressSequenceObserver *v6;
  SBPressSequenceObserver *sosLockPressSequenceObserver;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSOSLockGestureObserver;
  v4 = -[SBSOSLockGestureObserver init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_configuration = a3;
    -[SBSOSLockGestureObserver _configure](v4, "_configure");
    v6 = -[SBPressSequenceObserver initWithPressName:]([SBPressSequenceObserver alloc], "initWithPressName:", CFSTR("Lock"));
    sosLockPressSequenceObserver = v5->_sosLockPressSequenceObserver;
    v5->_sosLockPressSequenceObserver = v6;

  }
  return v5;
}

- (void)setSOSEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  self->_sosEnabled = a3;
  SBLogButtonsCombo();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Set SOS Lock Gesture Enabled: %{BOOL}u", (uint8_t *)&v8, 0x12u);

  }
  if (v3)
  {
    +[SBSOSEventHandler sharedInstance](SBSOSEventHandler, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "run");

  }
}

- (int64_t)triggerMechanism
{
  if (self->_configuration == 2)
    return 1;
  else
    return 2;
}

- (void)registerPressDownWithTimestamp:(double)a3
{
  NSObject *v5;
  void *v6;

  if (-[SBSOSLockGestureObserver isSOSEnabled](self, "isSOSEnabled"))
  {
    -[SBPressSequenceRecognizer registerPressDownWithTimestamp:](self->_recognizer, "registerPressDownWithTimestamp:", a3);
    SBLogButtonsCombo();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBSOSLockGestureObserver registerPressDownWithTimestamp:].cold.1();

  }
  if (-[SBSOSLockGestureObserver isGestureLoggingEnabled](self, "isGestureLoggingEnabled"))
  {
    -[SBPressSequenceObserver pressCollector](self->_sosLockPressSequenceObserver, "pressCollector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerPressDownWithTimeStamp:", a3);

  }
}

- (void)registerPressUpWithTimestamp:(double)a3
{
  NSObject *v5;
  void *v6;

  if (-[SBSOSLockGestureObserver isSOSEnabled](self, "isSOSEnabled"))
  {
    -[SBPressSequenceRecognizer registerPressUpWithTimestamp:](self->_recognizer, "registerPressUpWithTimestamp:", a3);
    SBLogButtonsCombo();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBSOSLockGestureObserver registerPressUpWithTimestamp:].cold.1();

  }
  if (-[SBSOSLockGestureObserver isGestureLoggingEnabled](self, "isGestureLoggingEnabled"))
  {
    -[SBPressSequenceObserver pressCollector](self->_sosLockPressSequenceObserver, "pressCollector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerPressUpWithTimeStamp:", a3);

  }
}

- (void)resetWithNewConfiguration:(int64_t)a3
{
  self->_configuration = a3;
  -[SBSOSLockGestureObserver _configure](self, "_configure");
  -[SBPressSequenceRecognizer resetWithNewValidator:numberOfPresses:](self->_recognizer, "resetWithNewValidator:numberOfPresses:", self->_validator, -[SBPressSequenceSettings numberOfPresses](self->_settings, "numberOfPresses"));
}

- (void)noteDidBeginSOSWithUUID:(id)a3
{
  -[SBPressSequenceObserver noteDidBeginSOSWithUUID:](self->_sosLockPressSequenceObserver, "noteDidBeginSOSWithUUID:", a3);
}

- (void)pressSequenceRecognizerDidCompleteSequence:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BSAction *v7;
  BSAction *triggerAction;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[5];

  v4 = a3;
  if (!self->_triggerAction)
  {
    v5 = objc_alloc(MEMORY[0x1E0D01698]);
    -[SBSOSLockGestureObserver _watchdogInterval](self, "_watchdogInterval");
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke;
    v13[3] = &unk_1E8EB4D58;
    v13[4] = self;
    v7 = (BSAction *)objc_msgSend(v5, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, MEMORY[0x1E0C80D38], v13);
    triggerAction = self->_triggerAction;
    self->_triggerAction = v7;

    objc_initWeak(&location, self->_triggerAction);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke_2;
    v10[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v11, &location);
    objc_msgSend(WeakRetained, "sosLockDidTriggerSOS:completion:", self, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

uint64_t __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteTriggerActionRecievedResponse");
}

void __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D016A8], "response");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendResponse:", v1);

}

- (void)pressSequenceRecognizer:(id)a3 didBeginPressDownAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 2)
  {
    self->_lastKnownActiveState = 1;
    v7 = v6;
    -[SBSOSLockGestureObserver _noteTriggerDidBecomeActive](self, "_noteTriggerDidBecomeActive");
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  if (a4 <= 1 && self->_lastKnownActiveState)
  {
    self->_lastKnownActiveState = 0;
    v7 = v6;
    -[SBSOSLockGestureObserver _noteTriggerDidBecomeInactive](self, "_noteTriggerDidBecomeInactive");
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_noteTriggerActionRecievedResponse
{
  BSAction *triggerAction;

  triggerAction = self->_triggerAction;
  self->_triggerAction = 0;

  -[SBSOSLockGestureObserver _noteTriggerDidBecomeInactive](self, "_noteTriggerDidBecomeInactive");
}

- (void)_noteTriggerDidBecomeActive
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sosLockTriggerDidBecomeActive:", self);

}

- (void)_noteTriggerDidBecomeInactive
{
  id WeakRetained;

  if (!self->_triggerAction)
  {
    self->_lastKnownActiveState = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sosLockTriggerDidBecomeInactive:", self);

  }
}

- (void)_configure
{
  SBPressSequenceSettings *v3;
  SBPressSequenceSettings *settings;
  SBPressSequenceValidator *v5;
  SBPressSequenceValidator *validator;
  SBPressSequenceRecognizer *v7;
  SBPressSequenceRecognizer *recognizer;

  v3 = objc_alloc_init(SBPressSequenceSettings);
  settings = self->_settings;
  self->_settings = v3;

  -[SBSOSLockGestureObserver _configureSettings](self, "_configureSettings");
  v5 = -[SBPressSequenceValidator initWithSettings:]([SBPressSequenceValidator alloc], "initWithSettings:", self->_settings);
  validator = self->_validator;
  self->_validator = v5;

  v7 = -[SBPressSequenceRecognizer initWithValidator:numberOfPresses:]([SBPressSequenceRecognizer alloc], "initWithValidator:numberOfPresses:", self->_validator, -[SBPressSequenceSettings numberOfPresses](self->_settings, "numberOfPresses"));
  recognizer = self->_recognizer;
  self->_recognizer = v7;

  -[SBPressSequenceRecognizer setDelegate:](self->_recognizer, "setDelegate:", self);
}

- (void)_configureSettings
{
  float v3;
  float v4;
  float v5;
  float v6;
  int64_t configuration;
  SBPressSequenceSettings **p_settings;
  SBPressSequenceSettings *v9;
  double v10;
  SBPressSequenceSettings *v11;
  uint64_t v12;
  SBPressSequenceSettings *settings;
  double v14;
  double v15;

  _AXSLockClickDownPressDurationScaleFactor();
  v4 = v3;
  _AXSLockClickVarianceScaleFactor();
  v6 = v5;
  configuration = self->_configuration;
  if (configuration == 2)
  {
    settings = self->_settings;
    p_settings = &self->_settings;
    -[SBPressSequenceSettings setNumberOfPresses:](settings, "setNumberOfPresses:", 3);
    v14 = v4 * 0.35;
    -[SBPressSequenceSettings setMaxDefaultPressDownDuration:](*p_settings, "setMaxDefaultPressDownDuration:", v14);
    -[SBPressSequenceSettings setMaxDefaultPressUpDuration:](*p_settings, "setMaxDefaultPressUpDuration:", v14);
    -[SBPressSequenceSettings setMaxDownToDownDuration:](*p_settings, "setMaxDownToDownDuration:", v14);
    -[SBPressSequenceSettings setIndexOfPressDownToUseForVarianceAndGrowth:](*p_settings, "setIndexOfPressDownToUseForVarianceAndGrowth:", 1);
    -[SBPressSequenceSettings setNumberOfPressDownGrowthTerms:](*p_settings, "setNumberOfPressDownGrowthTerms:", 1);
    -[SBPressSequenceSettings setIndexOfPressUpToUseForVarianceAndGrowth:](*p_settings, "setIndexOfPressUpToUseForVarianceAndGrowth:", 0);
    v11 = *p_settings;
    v12 = 0;
  }
  else
  {
    if (configuration != 1)
      return;
    v9 = self->_settings;
    p_settings = &self->_settings;
    -[SBPressSequenceSettings setNumberOfPresses:](v9, "setNumberOfPresses:", 5);
    v10 = v4;
    -[SBPressSequenceSettings setMaxDefaultPressDownDuration:](*p_settings, "setMaxDefaultPressDownDuration:", v10 * 0.5);
    -[SBPressSequenceSettings setMaxDefaultPressUpDuration:](*p_settings, "setMaxDefaultPressUpDuration:", v10 * 0.35);
    -[SBPressSequenceSettings setMaxDownToDownDuration:](*p_settings, "setMaxDownToDownDuration:", -1.0);
    -[SBPressSequenceSettings setIndexOfPressDownToUseForVarianceAndGrowth:](*p_settings, "setIndexOfPressDownToUseForVarianceAndGrowth:", 1);
    -[SBPressSequenceSettings setNumberOfPressDownGrowthTerms:](*p_settings, "setNumberOfPressDownGrowthTerms:", 1);
    -[SBPressSequenceSettings setIndexOfPressUpToUseForVarianceAndGrowth:](*p_settings, "setIndexOfPressUpToUseForVarianceAndGrowth:", 0);
    v11 = *p_settings;
    v12 = 1;
  }
  -[SBPressSequenceSettings setNumberOfPressUpGrowthTerms:](v11, "setNumberOfPressUpGrowthTerms:", v12);
  v15 = v6 * 0.1;
  -[SBPressSequenceSettings setPressDownVariance:](*p_settings, "setPressDownVariance:", v15);
  -[SBPressSequenceSettings setPressUpVariance:](*p_settings, "setPressUpVariance:", v15);
}

- (void)_setRecognizer:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_recognizer, a3);
  v5 = a3;
  -[SBPressSequenceRecognizer setDelegate:](self->_recognizer, "setDelegate:", self);

}

- (id)_validator
{
  return self->_validator;
}

- (unint64_t)_numberOfPressesThatTrigger
{
  return -[SBPressSequenceSettings numberOfPresses](self->_settings, "numberOfPresses");
}

- (unint64_t)_numberOfPressesThatActivate
{
  return 3;
}

- (double)_intervalThatSucceeds
{
  double result;

  -[SBPressSequenceValidator _intervalThatSucceeds](self->_validator, "_intervalThatSucceeds");
  return result;
}

- (double)_watchdogInterval
{
  return 4.5;
}

- (SBPressSequenceObserver)sosLockPressSequenceObserver
{
  return self->_sosLockPressSequenceObserver;
}

- (void)setSosLockPressSequenceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_sosLockPressSequenceObserver, a3);
}

- (SBSOSLockGestureObserverDelegate)delegate
{
  return (SBSOSLockGestureObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (BOOL)isGestureLoggingEnabled
{
  return self->_gestureLoggingEnabled;
}

- (void)setGestureLoggingEnabled:(BOOL)a3
{
  self->_gestureLoggingEnabled = a3;
}

- (BOOL)isSOSEnabled
{
  return self->_sosEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sosLockPressSequenceObserver, 0);
  objc_storeStrong((id *)&self->_triggerAction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)registerPressDownWithTimestamp:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ - Registered SOS Lock Press Down.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)registerPressUpWithTimestamp:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ - Registered SOS Lock Press Up.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
