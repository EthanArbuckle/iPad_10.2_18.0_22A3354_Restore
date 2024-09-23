@implementation SBBiometricEventLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_43 != -1)
    dispatch_once(&sharedInstance_onceToken_43, &__block_literal_global_275);
  return (id)sharedInstance___sharedInstance_22;
}

void __40__SBBiometricEventLogger_sharedInstance__block_invoke()
{
  SBBiometricEventLogger *v0;
  void *v1;

  v0 = objc_alloc_init(SBBiometricEventLogger);
  v1 = (void *)sharedInstance___sharedInstance_22;
  sharedInstance___sharedInstance_22 = (uint64_t)v0;

}

+ (void)logEvent:(unsigned int)a3
{
  uint64_t v3;
  BOOL v4;

  v3 = *(_QWORD *)&a3;
  if (__loadBiometricKitIfNecessary_onceToken != -1)
    dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_141);
  if (__loadBiometricKitIfNecessary_biometricKit)
    v4 = BKLogEventFn == 0;
  else
    v4 = 1;
  if (!v4)
    BKLogEventFn(v3);
}

+ (void)logClass:(unsigned __int8)a3 code:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (__loadBiometricKitIfNecessary_onceToken != -1)
    dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_141);
  if (__loadBiometricKitIfNecessary_biometricKit)
    v6 = BKLogCodeFn == 0;
  else
    v6 = 1;
  if (!v6)
    BKLogCodeFn(v5, v4);
}

- (SBBiometricEventLogger)init
{
  SBBiometricEventLogger *v2;
  void *v3;
  uint64_t v4;
  SBUIBiometricResource *biometricResource;
  uint64_t v6;
  BiometricKit *biometricKit;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBBiometricEventLogger;
  v2 = -[SBBiometricEventLogger init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__screenTurnedOn_, *MEMORY[0x1E0DAC2E0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__backlightLevelChanged_, *MEMORY[0x1E0DAC2F8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__fingerOn_, CFSTR("SBBiometricEventTimestampNotificationFingerOn"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__tryAgain_, CFSTR("SBBiometricEventTimestampNotificationTryAgain"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__keybagBioUnlock_, CFSTR("SBBiometricEventTimestampNotificationKeybagUnlock"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__unlockAnimationWillStart_, CFSTR("SBCoverSheetWillAnimateDeactivation"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__prearmMatch_, CFSTR("SBBiometricEventTimestampNotificationPrearmMatch"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__authRequestCompleted_, *MEMORY[0x1E0DAA230], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__systemDidWakeFromSleep_, CFSTR("SBWorkspaceDidWakeFromSleepNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passcodePromptCancelled_, CFSTR("SBBiometricEventTimestampNotificationPasscodeCancelled"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__coversheetSwipedForDismissal_, CFSTR("SBBiometricEventTimestampNotificationCoversheetSwipedForDismissal"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passcodeViewTransitionedToPasscode_, *MEMORY[0x1E0DAC8E0], 0);
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    biometricResource = v2->_biometricResource;
    v2->_biometricResource = (SBUIBiometricResource *)v4;

    -[SBUIBiometricResource addObserver:](v2->_biometricResource, "addObserver:", v2);
    if (__loadBiometricKitIfNecessary_onceToken != -1)
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_141);
    if (__loadBiometricKitIfNecessary_biometricKit)
    {
      -[objc_class manager](NSClassFromString(CFSTR("BiometricKit")), "manager");
      v6 = objc_claimAutoreleasedReturnValue();
      biometricKit = v2->_biometricKit;
      v2->_biometricKit = (BiometricKit *)v6;

    }
  }
  return v2;
}

- (void)_clearEverything
{
  -[SBBiometricEventLogger setFingerOnTime:](self, "setFingerOnTime:", 0);
  -[SBBiometricEventLogger setKeybagUnlockTime:](self, "setKeybagUnlockTime:", 0);
  -[SBBiometricEventLogger setFingerOnWithScreenOn:](self, "setFingerOnWithScreenOn:", 0);
}

- (void)_screenTurnedOn:(id)a3
{
  -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 0);
}

- (void)_backlightLevelChanged:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");

  self->_isScreenOn = BSFloatGreaterThanFloat();
  -[SBBiometricEventLogger _resetPasscodeStateMachine](self, "_resetPasscodeStateMachine");
}

- (void)_fingerOn:(id)a3
{
  -[SBBiometricEventLogger setFingerOnTime:](self, "setFingerOnTime:", mach_absolute_time());
  -[SBBiometricEventLogger setFingerOnWithScreenOn:](self, "setFingerOnWithScreenOn:", self->_isScreenOn);
  -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 1);
  -[BiometricKit timestampEvent:](self->_biometricKit, "timestampEvent:", 0);
}

- (void)_tryAgain:(id)a3
{
  -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 2);
  -[BiometricKit timestampEvent:](self->_biometricKit, "timestampEvent:", 1);
}

- (void)_keybagBioUnlock:(id)a3
{
  -[SBBiometricEventLogger setKeybagUnlockTime:](self, "setKeybagUnlockTime:", mach_absolute_time());
  if (-[SBBiometricEventLogger fingerOnTime](self, "fingerOnTime"))
    ADClientAddValueForScalarKey();
  -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 3);
  -[BiometricKit timestampEvent:](self->_biometricKit, "timestampEvent:", 2);
  -[SBBiometricEventLogger _biometricAuthenticationSucceeded](self, "_biometricAuthenticationSucceeded");
}

- (void)_unlockAnimationWillStart:(id)a3
{
  if (-[SBBiometricEventLogger fingerOnTime](self, "fingerOnTime", a3)
    && -[SBBiometricEventLogger keybagUnlockTime](self, "keybagUnlockTime"))
  {
    -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 4);
    -[BiometricKit timestampEvent:](self->_biometricKit, "timestampEvent:", 3);
  }
  -[SBBiometricEventLogger _clearEverything](self, "_clearEverything");
}

- (void)_prearmMatch:(id)a3
{
  -[SBBiometricEventLogger timestampEvent:](self, "timestampEvent:", 5);
  -[BiometricKit timestampEvent:](self->_biometricKit, "timestampEvent:", 4);
}

- (void)_authRequestCompleted:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DAA228]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DAA238]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && objc_msgSend(v4, "integerValue") == 1)
  {
    v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAA240]);
    v9 = (void *)objc_opt_class();
    if (v8)
      v10 = 458752;
    else
      v10 = 458754;
    objc_msgSend(v9, "logEvent:", v10);
    if (v8)
      -[SBBiometricEventLogger _passcodeAuthenticationSucceeded](self, "_passcodeAuthenticationSucceeded");
  }

}

- (void)_systemDidWakeFromSleep:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "logEvent:", 0x10000);
}

- (void)_passcodePromptCancelled:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "logEvent:", 458753);
}

- (void)_coversheetSwipedForDismissal:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "logEvent:", 131077);
}

- (void)_passcodeViewTransitionedToPasscode:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = 393217;
  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DAC8F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC900]) & 1) != 0)
  {
    v3 = 393219;
LABEL_8:
    objc_msgSend((id)objc_opt_class(), "logEvent:", v3);
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC908]) & 1) != 0)
  {
    v3 = 393221;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC8F8]) & 1) != 0)
  {
    v3 = 393220;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC8E8]))
    goto LABEL_8;
LABEL_9:

}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  objc_msgSend((id)objc_opt_class(), "logClass:code:", 7, a4);
  if (a4 - 9 > 2)
  {
    if (a4 - 25 <= 1)
      objc_msgSend((id)objc_opt_class(), "logEvent:", 393218);
  }
  else
  {
    -[SBBiometricEventLogger _biometricAuthenticationFailed](self, "_biometricAuthenticationFailed");
  }
}

- (void)_passcodeAuthenticationSucceeded
{
  if (self->_passcodeSuccessAfterBioFailureTriggerArmed)
    ADClientAddValueForScalarKey();
  -[SBBiometricEventLogger _resetPasscodeStateMachine](self, "_resetPasscodeStateMachine");
}

- (void)_biometricAuthenticationFailed
{
  self->_passcodeSuccessAfterBioFailureTriggerArmed = 1;
}

- (void)_resetPasscodeStateMachine
{
  self->_passcodeSuccessAfterBioFailureTriggerArmed = 0;
}

- (BOOL)_shouldSyslogTimestamps
{
  if (_shouldSyslogTimestamps_onceToken != -1)
    dispatch_once(&_shouldSyslogTimestamps_onceToken, &__block_literal_global_46);
  return _shouldSyslogTimestamps_shouldLogTimestamps;
}

void __49__SBBiometricEventLogger__shouldSyslogTimestamps__block_invoke()
{
  void *v0;
  id v1;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "biometricAuthenticationDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _shouldSyslogTimestamps_shouldLogTimestamps = objc_msgSend(v0, "isLogTimestampsEnabled");

}

- (void)timestampEvent:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 <= 6 && ((0x4Fu >> a3) & 1) != 0)
    kdebug_trace();
  if (-[SBBiometricEventLogger _shouldSyslogTimestamps](self, "_shouldSyslogTimestamps"))
  {
    mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v6 = v5;
    SBLogBiometricResource();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (a3 - 1 > 5)
        v8 = "ScreenWillTurnOn";
      else
        v8 = off_1E8EB7C38[a3 - 1];
      BSAbsoluteTimeFromMachTime();
      v10 = 134218498;
      v11 = v6;
      v12 = 2080;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "%f MesaPerf %s (mach: %f)", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (unint64_t)_machTimeInMilliseconds
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if (_machTimeInMilliseconds_onceToken != -1)
    dispatch_once(&_machTimeInMilliseconds_onceToken, &__block_literal_global_49_1);
  v2 = mach_absolute_time();
  LODWORD(v3) = _machTimeInMilliseconds_timebaseInfo;
  LODWORD(v4) = *(_DWORD *)algn_1EFC55978;
  return (unint64_t)((double)v2 * (double)v3 / (double)v4 * 0.000001);
}

uint64_t __49__SBBiometricEventLogger__machTimeInMilliseconds__block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_machTimeInMilliseconds_timebaseInfo);
}

- (unint64_t)keybagUnlockTime
{
  return self->_keybagUnlockTime;
}

- (void)setKeybagUnlockTime:(unint64_t)a3
{
  self->_keybagUnlockTime = a3;
}

- (unint64_t)fingerOnTime
{
  return self->_fingerOnTime;
}

- (void)setFingerOnTime:(unint64_t)a3
{
  self->_fingerOnTime = a3;
}

- (BOOL)fingerOnWithScreenOn
{
  return self->_fingerOnWithScreenOn;
}

- (void)setFingerOnWithScreenOn:(BOOL)a3
{
  self->_fingerOnWithScreenOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_biometricKit, 0);
}

@end
