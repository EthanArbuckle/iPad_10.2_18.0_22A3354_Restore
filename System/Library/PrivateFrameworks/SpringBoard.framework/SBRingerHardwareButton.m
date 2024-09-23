@implementation SBRingerHardwareButton

- (SBRingerHardwareButton)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBRingerHardwareButton *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBRingerHardwareButton *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("SBRingerHardwareButton.m");
    v17 = 1024;
    v18 = 109;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBRingerHardwareButton *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (SBRingerHardwareButton)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBRingerHardwareButton *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("SBRingerHardwareButton.m");
    v17 = 1024;
    v18 = 113;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBRingerHardwareButton *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (uint64_t)initWithSystemActionControl:(void *)a3 suppressionManager:
{
  id v6;
  id v7;
  id *v8;
  SBHIDButtonStateArbiter *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    if ((SBUIHasHIDRingerButton() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should not instantiate SBRingerHardwareButton on devices without a ringer button"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBRingerHardwareButton initWithSystemActionControl:suppressionManager:].cold.2();
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0913290);
    }
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemActionControl != ((void *)0)"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBRingerHardwareButton initWithSystemActionControl:suppressionManager:].cold.1();
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0913238);
    }
    v22.receiver = (id)a1;
    v22.super_class = (Class)SBRingerHardwareButton;
    v8 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = (uint64_t)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      -[SBSystemActionControl addObserver:](*(_QWORD *)(a1 + 24), (void *)a1);
      objc_storeStrong((id *)(a1 + 32), a3);
      -[SBSystemActionSuppressionManager addObserver:](*(_QWORD *)(a1 + 32), (void *)a1);
      v9 = objc_alloc_init(SBHIDButtonStateArbiter);
      v10 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v9;

      objc_msgSend(*(id *)(a1 + 88), "setDelegate:", a1);
      +[SBRingerHardwareButtonDomain rootSettings](SBRingerHardwareButtonDomain, "rootSettings");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v11;

      objc_msgSend(*(id *)(a1 + 16), "ringerButtonParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v14;

      -[SBRingerHardwareButton _configureButtonArbiter](a1);
      objc_msgSend(*(id *)(a1 + 16), "addKeyObserver:", a1);
      SBLogButtonsRinger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v24 = v17;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "initial parameters: %{public}@", buf, 0xCu);
      }

      v18 = +[SBSystemActionAnalyticsTracker sharedTracker]();
    }
  }

  return a1;
}

- (void)setParameters:(uint64_t)a1
{
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;

    -[SBRingerHardwareButton _configureButtonArbiter](a1);
  }
}

- (uint64_t)handleRingerButtonEvent:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = result;
    if (IOHIDEventGetType() != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("IOHIDEventGetType(event) == kIOHIDEventTypeKeyboard"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBRingerHardwareButton handleRingerButtonEvent:].cold.3();
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D09133B4);
    }
    if (IOHIDEventGetIntegerValue() != 11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("IOHIDEventGetIntegerValue(event, kIOHIDEventFieldKeyboardUsagePage) == kHIDPage_Telephony"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBRingerHardwareButton handleRingerButtonEvent:].cold.2();
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0913418);
    }
    if (IOHIDEventGetIntegerValue() != 45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("IOHIDEventGetIntegerValue(event, kIOHIDEventFieldKeyboardUsage) == kHIDUsage_Tfon_RingEnable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBRingerHardwareButton handleRingerButtonEvent:].cold.1();
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D091347CLL);
    }
    return objc_msgSend(*(id *)(v3 + 88), "processEvent:", a2);
  }
  return result;
}

- (void)_configureButtonArbiter
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[SBSystemActionSuppressionManager suppressionStatus](*(uint64_t **)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBCameraActivationManager workspace]((uint64_t)v2);
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      v5 = 8;
      if (v3 == 1)
        v5 = 16;
      v6 = *(double *)(v4 + v5);
    }
    else
    {
      v6 = 0.0;
    }

    objc_msgSend(*(id *)(a1 + 88), "setLongPressTimeout:", v6);
    SBLogButtonsRinger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = a1;
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@) button arbiter longPressTimeout: %f", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_performActionForEvent:(uint64_t)a1 interactionTime:(uint64_t)a2
{
  void *v4;
  int v5;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;

  if (a1)
  {
    v21 = (id *)*(id *)(a1 + 24);
    -[SBSystemActionSuppressionManager suppressionStatus](*(uint64_t **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    switch(a2)
    {
      case 0:
        +[SBSystemActionAnalyticsTracker sharedTracker]();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        BSMonotonicReferencedTimeFromMachTime();
        -[SBSystemActionAnalyticsTracker trackPressDownForLatencyMeasurement:]((uint64_t)v6, v7);

        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 88), "longPressTimeout");
        -[SBSystemActionSuppressionManager systemActionInteractionDidStartWithLongPressTimeout:](v8, v9);
        -[SBSystemActionControl previewSelectedActionFromSource:withSuppressionStatus:](v21, CFSTR("SBRingerHardwareButton"), v4);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v10;
        goto LABEL_7;
      case 1:
        -[SBRingerHardwareButton _dateFromMachAbsoluteTimestamp:](a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)-[SBSystemActionInteractionContext initWithPreciseTimestamp:type:suppressionStatus:]((uint64_t)[SBSystemActionInteractionContext alloc], v11, 1, v4);
        -[SBSystemActionControl performSelectedActionFromSource:withContext:]((uint64_t)v21, CFSTR("SBRingerHardwareButton"), v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v13;

        goto LABEL_7;
      case 2:
        goto LABEL_6;
      case 3:
        v5 = 1;
LABEL_6:
        +[SBSystemActionAnalyticsTracker sharedTracker]();
        v15 = (double *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 72) != 0;
        v17 = (void *)-[SBSystemActionControl selectedActionAnalyticsData](*(_QWORD *)(a1 + 24));
        v19 = v18;
        -[SBSystemActionAnalyticsTracker trackPressUpForLatencyMeasurement:cancelled:longPressTriggered:selectedActionIdentifier:](v15, v4, v5, v16, v17);

        objc_msgSend(*(id *)(a1 + 64), "invalidate");
        v20 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = 0;

        objc_msgSend(*(id *)(a1 + 72), "invalidate");
        v11 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;
LABEL_7:

        break;
      default:
        break;
    }

  }
}

- (id)_dateFromMachAbsoluteTimestamp:(uint64_t)a1
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    mach_absolute_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    objc_msgSend(v1, "dateByAddingTimeInterval:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_sendRingerButtonDownToSceneOverride
{
  uint64_t v1;
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "physicalButtonSceneOverrideManager");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[SBPhysicalButtonSceneOverrideManager sendRingerButtonDown](v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = v4;

    v1 = *(_QWORD *)(v1 + 48) != 0;
  }
  return v1;
}

- (void)performActionsForButtonDown:(id)a3
{
  id v4;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *buttonActiveAssertion;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_buttonActiveAssertion)
  {
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    -[SBRingerHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHardwareButtonCoordinator assertButtonIsActive:dropletHintIdentifier:](hardwareButtonCoordinator, "assertButtonIsActive:dropletHintIdentifier:", v6, 8);
    v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    buttonActiveAssertion = self->_buttonActiveAssertion;
    self->_buttonActiveAssertion = v7;

    v9 = -[SBHardwareButtonCoordinator buttonShouldStart:](self->_hardwareButtonCoordinator, "buttonShouldStart:", CFSTR("Ringer"));
    self->_inhibitActions = !v9;
    if (v9)
    {
      v10 = -[SBRingerHardwareButton _sendRingerButtonDownToSceneOverride]((uint64_t)self);
      SBLogButtonsRinger();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          v13 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
          v16 = 67109120;
          v17 = v13;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "button down (sq%d): sent to scene override", (uint8_t *)&v16, 8u);
        }

      }
      else
      {
        if (v12)
        {
          v14 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
          v16 = 67109120;
          v17 = v14;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "button down (sq%d): performing action", (uint8_t *)&v16, 8u);
        }

        objc_msgSend(v4, "downTime");
        -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 0);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", *MEMORY[0x1E0DAC378], 0);

    }
  }

}

- (void)performActionsForButtonLongPress:(id)a3
{
  id v4;
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_inhibitActions)
  {
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    SBLogButtonsRinger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (overrideButtonUpHandler)
    {
      if (v7)
      {
        v8 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
        v10 = 67109120;
        v11 = v8;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "long press (sq%d): skipping due to override handler", (uint8_t *)&v10, 8u);
      }

    }
    else
    {
      if (v7)
      {
        v9 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
        v10 = 67109120;
        v11 = v9;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "long press (sq%d): performing action", (uint8_t *)&v10, 8u);
      }

      objc_msgSend(v4, "downTime");
      -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 1);
    }
  }

}

- (void)performActionsForButtonUp:(id)a3
{
  id v4;
  BSInvalidatable *buttonActiveAssertion;
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  SBPhysicalButtonCompletionHandling *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BSInvalidatable invalidate](self->_buttonActiveAssertion, "invalidate");
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = 0;

  if (!self->_inhibitActions)
  {
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    SBLogButtonsRinger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (overrideButtonUpHandler)
    {
      if (v8)
      {
        v9 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
        v12 = 67109120;
        v13 = v9;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "button up (sq%d): invoking override", (uint8_t *)&v12, 8u);
      }

      -[SBPhysicalButtonCompletionHandling completeWithResult:](self->_overrideButtonUpHandler, "completeWithResult:", 0);
      v10 = self->_overrideButtonUpHandler;
      self->_overrideButtonUpHandler = 0;

    }
    else
    {
      if (v8)
      {
        v11 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
        v12 = 67109120;
        v13 = v11;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "button up (sq%d): performing action", (uint8_t *)&v12, 8u);
      }

      objc_msgSend(v4, "downTime");
      -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 2);
    }
  }

}

- (void)systemActionControlDidUpdateActionInteractionConfiguration:(id)a3
{
  NSObject *v4;
  int v5;
  SBRingerHardwareButton *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogButtonsRinger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) configuring button arbiter for system action interaction update", (uint8_t *)&v5, 0xCu);
  }

  -[SBRingerHardwareButton _configureButtonArbiter]((uint64_t)self);
}

- (void)systemActionSuppressionManager:(id)a3 didUpdateSuppressionStatus:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  SBRingerHardwareButton *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogButtonsRinger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) configuring button arbiter for system action suppression update", (uint8_t *)&v8, 0xCu);
  }

  -[SBRingerHardwareButton _configureButtonArbiter]((uint64_t)self);
  +[SBSystemActionAnalyticsTracker sharedTracker]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionAnalyticsTracker trackSuppressionStatusUpdate:]((uint64_t)v7, v5);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  NSObject *v6;
  SBRingerButtonParameters *parameters;
  int v8;
  SBRingerButtonParameters *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_settings == a3)
  {
    objc_msgSend(a3, "ringerButtonParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRingerHardwareButton setParameters:]((uint64_t)self, v5);

    SBLogButtonsRinger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      parameters = self->_parameters;
      v8 = 138543362;
      v9 = parameters;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(key) update button parameters from prototype settings: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)cancelHardwareButtonPress
{
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  SBPhysicalButtonCompletionHandling *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_inhibitActions = 1;
  overrideButtonUpHandler = self->_overrideButtonUpHandler;
  SBLogButtonsRinger();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (overrideButtonUpHandler)
  {
    if (v5)
    {
      v6 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
      v9 = 67109120;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "button cancelled (sq%d): invoking override", (uint8_t *)&v9, 8u);
    }

    -[SBPhysicalButtonCompletionHandling completeWithResult:](self->_overrideButtonUpHandler, "completeWithResult:", 1);
    v7 = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;

  }
  else
  {
    if (v5)
    {
      v8 = -[SBHIDButtonStateArbiter pressSequence](self->_buttonArbiter, "pressSequence");
      v9 = 67109120;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "button cancelled (sq%d): performing action", (uint8_t *)&v9, 8u);
    }

    -[SBHIDButtonStateArbiter downTime](self->_buttonArbiter, "downTime");
    -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 3);
  }
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Ringer");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_systemActionPerformedInteractionAssertion, 0);
  objc_storeStrong((id *)&self->_systemActionPreviewingAssertion, 0);
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_storeStrong((id *)&self->_overrideButtonUpHandler, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_systemActionControl, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)initWithSystemActionControl:suppressionManager:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSystemActionControl:suppressionManager:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)handleRingerButtonEvent:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)handleRingerButtonEvent:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)handleRingerButtonEvent:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
