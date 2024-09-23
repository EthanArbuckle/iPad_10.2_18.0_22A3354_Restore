@implementation SBIdleTimerDescriptorFactory

- (id)idleTimerDescriptorForBehavior:(id)a3
{
  id v4;
  SBIdleTimerDescriptor *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE v28[24];
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "idleTimerMode") == 3)
  {
    objc_msgSend((id)objc_opt_class(), "disabledIdleTimerDescriptor");
    v5 = (SBIdleTimerDescriptor *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForThermalBlockedMode:](self, "updateIdleTimerSettingsForThermalBlockedMode:", v5);
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)v28 = 138543618;
        *(_QWORD *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2048;
        *(_QWORD *)&v28[14] = v4;
        v9 = *(id *)&v28[4];
        v10 = "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> disabled proposed SBFIdleTimerModeDisabled but it was o"
              "verriden due to thermal block";
LABEL_11:
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, v10, v28, 0x16u);

      }
    }
    else if (v8)
    {
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2048;
      *(_QWORD *)&v28[14] = v4;
      v9 = *(id *)&v28[4];
      v10 = "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> returning disabled idle timer descriptor because behavior"
            " provider proposed SBFIdleTimerModeDisabled";
      goto LABEL_11;
    }
  }
  else
  {
    v11 = objc_opt_class();
    v12 = v4;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v7 = v13;

    if (v7)
    {
      SBLogIdleTimer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v7;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "idleTimerDescriptorForBehavior: %{public}@", v28, 0xCu);
      }
    }
    else
    {
      +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", v12);
      v7 = objc_claimAutoreleasedReturnValue();
      SBLogIdleTimer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138543874;
        *(_QWORD *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2048;
        *(_QWORD *)&v28[14] = v12;
        *(_WORD *)&v28[22] = 2114;
        v29 = v7;
        v15 = *(id *)&v28[4];
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> behavior: %{public}@", v28, 0x20u);

      }
    }

    v16 = -[NSObject idleTimerDuration](v7, "idleTimerDuration");
    v17 = -[NSObject idleTimerMode](v7, "idleTimerMode");
    v19 = -[NSObject idleWarnMode](v7, "idleWarnMode") == 2 && v17 != 3;
    v5 = -[SBIdleTimerDescriptor initWithTimerMode:warnInterval:totalInterval:]([SBIdleTimerDescriptor alloc], "initWithTimerMode:warnInterval:totalInterval:", v17, 0.0, 0.0);
    if (v16 == 3)
    {
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForDuration:descriptor:](self, "updateIdleTimerSettingsForDuration:descriptor:", 3, v5);
    }
    else
    {
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForSecurityDefaults:](self, "updateIdleTimerSettingsForSecurityDefaults:", v5);
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForAutoLockTimeout:](self, "updateIdleTimerSettingsForAutoLockTimeout:", v5);
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForTelephony:](self, "updateIdleTimerSettingsForTelephony:", v5);
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForPrototypeSettings:](self, "updateIdleTimerSettingsForPrototypeSettings:", v5);
      -[SBIdleTimerDescriptorFactory sanitizeSettingsAfterInitialSetup:](self, "sanitizeSettingsAfterInitialSetup:", v5);
      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        if (v16 == 13)
        {
          -[SBIdleTimerDescriptorFactory _idleTimerPrototypeSettings](self, "_idleTimerPrototypeSettings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "unlockedIdleTimerCap");
          v22 = v21;

          -[SBIdleTimerDescriptor totalInterval](v5, "totalInterval");
          if (v22 < v23)
            v23 = v22;
          -[SBIdleTimerDescriptor setTotalInterval:](v5, "setTotalInterval:", v23, *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
        }
        else
        {
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForPowerDefaults:](self, "updateIdleTimerSettingsForPowerDefaults:", v5);
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForDefaultWarnInterval:](self, "updateIdleTimerSettingsForDefaultWarnInterval:", v5);
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsWithCustomTimeouts:fromBehavior:](self, "updateIdleTimerSettingsWithCustomTimeouts:fromBehavior:", v5, v7);
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForUnlockedWithMesa:](self, "updateIdleTimerSettingsForUnlockedWithMesa:", v5);
        }
        if (!-[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForBatterySaverMode:](self, "updateIdleTimerSettingsForBatterySaverMode:", v5, *(_QWORD *)v28, *(_QWORD *)&v28[8]))
        {
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForFaceDown:](self, "updateIdleTimerSettingsForFaceDown:", v5);
          -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForWarnInterval:](self, "updateIdleTimerSettingsForWarnInterval:", v5);
        }
      }
      else
      {
        -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForDuration:descriptor:](self, "updateIdleTimerSettingsForDuration:descriptor:", v16, v5);
        -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsWithCustomTimeouts:fromBehavior:](self, "updateIdleTimerSettingsWithCustomTimeouts:fromBehavior:", v5, v7);
        -[SBIdleTimerDescriptorFactory sanitizeDescriptorForLockscreenDefaults:](self, "sanitizeDescriptorForLockscreenDefaults:", v5);
        -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForDefaultWarnInterval:](self, "updateIdleTimerSettingsForDefaultWarnInterval:", v5);
      }
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForThermalBlockedMode:](self, "updateIdleTimerSettingsForThermalBlockedMode:", v5, *(_QWORD *)v28, *(_QWORD *)&v28[8]);
      if (-[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForActiveClientConfiguration:](self, "updateIdleTimerSettingsForActiveClientConfiguration:", v5))
      {
        -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForWarnInterval:](self, "updateIdleTimerSettingsForWarnInterval:", v5);
      }
      if (!v19)
      {
        -[SBIdleTimerDescriptor setWarnInterval:](v5, "setWarnInterval:", 1.79769313e308);
        -[SBIdleTimerDescriptor setQuickUnwarnInterval:](v5, "setQuickUnwarnInterval:", 1.79769313e308);
        -[SBIdleTimerDescriptor addAuditReason:](v5, "addAuditReason:", CFSTR("should not warn"));
      }
      -[SBIdleTimerDescriptorFactory sanitizeSettingsAfterSetup:duration:](self, "sanitizeSettingsAfterSetup:duration:", v5, v16);
      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 0xC
        && -[SBIdleTimerDescriptorFactory _shouldUseAttentionSensor](self, "_shouldUseAttentionSensor")
        && -[SBIdleTimerDescriptor timerMode](v5, "timerMode") != 3)
      {
        -[SBIdleTimerDescriptorFactory _prototypeController](self, "_prototypeController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "rootSettings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attentionAwarenessSettings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "sampleInterval");
        -[SBIdleTimerDescriptor setSampleInterval:](v5, "setSampleInterval:");
        -[SBIdleTimerDescriptor addAuditReason:](v5, "addAuditReason:", CFSTR("should use attention awareness"));

      }
    }
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForThermalBlockedMode:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SBIdleTimerGlobalStateMonitor isThermalBlocked](self->_stateMonitor, "isThermalBlocked");
  if (v5)
  {
    objc_msgSend(v4, "totalInterval");
    v7 = v6;
    objc_msgSend(v4, "warnInterval");
    v9 = v8;
    if ((BSFloatEqualToFloat() & 1) != 0)
    {
      v10 = 20.0;
      v11 = 30.0;
    }
    else
    {
      v11 = 30.0;
      if (v7 <= 30.0)
        v11 = v7;
      v12 = v11 + -10.0;
      if (v9 <= v11 + -10.0)
        v12 = v9;
      if (v12 >= 2.0)
        v10 = v12;
      else
        v10 = 2.0;
    }
    objc_msgSend(v4, "setTotalInterval:", v11);
    objc_msgSend(v4, "setWarnInterval:", v10);
    if (objc_msgSend(v4, "timerMode") == 3)
      objc_msgSend(v4, "setTimerMode:", 1);
    SBIdleTimerIntervalToNSString(30.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBIdleTimerIntervalToNSString(10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAuditReason:", CFSTR("thermally blocked - applying max total interval: %@ and max warn interval: %@ thermal block limits"), v13, v14);

  }
  return v5;
}

- (BOOL)updateIdleTimerSettingsForWarnInterval:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "shouldWarn")
    && (objc_msgSend(v4, "warnInterval"), BSFloatGreaterThanOrEqualToFloat()))
  {
    objc_msgSend(v4, "totalInterval");
    -[SBIdleTimerDescriptorFactory _updateIdleTimerSettingsWarnInterval:totalInterval:](self, "_updateIdleTimerSettingsWarnInterval:totalInterval:", v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsWithCustomTimeouts:(id)a3 fromBehavior:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  char IsZero;
  void *v11;
  const __CFString *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "customIdleExpirationTimeout");
  v9 = v8;
  IsZero = BSFloatIsZero();
  if ((IsZero & 1) == 0)
  {
    if (-[SBIdleTimerDescriptorFactory _isIdleDurationForever:](self, "_isIdleDurationForever:", v9))
    {
      objc_msgSend(v6, "setTotalInterval:", 1.79769313e308);
      SBIdleTimerIntervalToNSString(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAuditReason:", CFSTR("customIdleExpirationTimeout (%@) lt 0"), v11);

    }
    else
    {
      objc_msgSend(v6, "setTotalInterval:", v9);
      if (objc_msgSend(v7, "idleWarnMode") == 1)
      {
        objc_msgSend(v6, "setWarnInterval:", 0.0);
        v12 = CFSTR("Setting totalInterval to custom customIdleExpirationTimeout gte 0");
LABEL_15:
        objc_msgSend(v6, "addAuditReason:", v12);
        goto LABEL_16;
      }
      objc_msgSend(v6, "addAuditReason:", CFSTR("Setting totalInterval to custom customIdleExpirationTimeout gte 0"));
    }
    objc_msgSend(v7, "customIdleWarningTimeout");
    v14 = v13;
    if ((BSFloatIsZero() & 1) == 0 && (BSFloatGreaterThanFloat() & 1) == 0)
    {
      if (-[SBIdleTimerDescriptorFactory _isIdleDurationForever:](self, "_isIdleDurationForever:", v14))
      {
        objc_msgSend(v6, "setWarnInterval:", 1.79769313e308);
        SBIdleTimerIntervalToNSString(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addAuditReason:", CFSTR("customIdleWarningTimeout (%@) lt 0"), v15);

      }
      else
      {
        objc_msgSend(v6, "setWarnInterval:", v14);
        objc_msgSend(v6, "addAuditReason:", CFSTR("Setting warnInterval to custom customIdleWarningTimeout"));
      }
      objc_msgSend(v6, "warnInterval");
      if (v16 == 1.79769313e308)
      {
        objc_msgSend(v6, "totalInterval");
        if (v17 == 1.79769313e308)
        {
          objc_msgSend(v6, "setTimerMode:", 3);
          v12 = CFSTR("warnInterval is <never> and totalInterval is <never>");
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:

  return IsZero ^ 1;
}

- (BOOL)updateIdleTimerSettingsForUnlockedWithMesa:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[SBIdleTimerDescriptorFactory _mainWorkspace](self, "_mainWorkspace");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "isSpringBoardActive");

  -[SBIdleTimerDescriptorFactory _biometricResource](self, "_biometricResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "hasBiometricAuthenticationCapabilityEnabled");

  objc_msgSend(v4, "totalInterval");
  v8 = v6 & ~BSFloatEqualToFloat() & v5;
  if (v8 == 1)
  {
    objc_msgSend(v4, "totalInterval");
    v10 = v9 * 0.5;
    v11 = 30.0;
    if (v10 >= 30.0)
      v11 = v10;
    objc_msgSend(v4, "setTotalInterval:", v11);
    SBIdleTimerIntervalToNSString(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBIdleTimerIntervalToNSString(30.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAuditReason:", CFSTR("sbIsActive and mesaEnabled are YES; calculating totalInterval as half (%@) or MIN_TOTAL_INTERVAL_HOMESCREEN_MESA (%@), whichever is greater"),
      v12,
      v13);

  }
  return v8;
}

- (BOOL)updateIdleTimerSettingsForTelephony:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  int v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SBIdleTimerDescriptorFactory _telephonyManager](self, "_telephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerDescriptorFactory _conferenceManager](self, "_conferenceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInEmergencyCallbackMode"))
  {
    objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
    objc_msgSend(v4, "setWarnInterval:", 1.79769313e308);
    objc_msgSend(v4, "setTimerMode:", 3);
    objc_msgSend(v4, "addAuditReason:", CFSTR("SBTelephonyManager is in emergency call"));
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "inCallUsingSpeakerOrReceiver");
    v9 = objc_msgSend(v6, "activeFaceTimeCallExists");
    -[SBIdleTimerDescriptorFactory _lockScreenManager](self, "_lockScreenManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v7 = 0;
      if (!objc_msgSend(v10, "isUILocked") && v8 | v9)
      {
        objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
        if (v8)
          objc_msgSend(v4, "addAuditReason:", CFSTR("normal call"));
        if (v9)
          objc_msgSend(v4, "addAuditReason:", CFSTR("FaceTime call"));
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)updateIdleTimerSettingsForSecurityDefaults:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  v5 = -[SBIdleTimerGlobalStateMonitor dontLockEver](self->_stateMonitor, "dontLockEver");
  if (v5)
  {
    objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
    objc_msgSend(v4, "setWarnInterval:", 1.79769313e308);
    objc_msgSend(v4, "setTimerMode:", 3);
    objc_msgSend(v4, "addAuditReason:", CFSTR("securityDefaults dontLockEver is YES"));
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForPrototypeSettings:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[SBIdleTimerDescriptorFactory _idleTimerPrototypeSettings](self, "_idleTimerPrototypeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableIdleTimer");

  if (v6)
  {
    objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
    objc_msgSend(v4, "setWarnInterval:", 1.79769313e308);
    objc_msgSend(v4, "setTimerMode:", 3);
    objc_msgSend(v4, "addAuditReason:", CFSTR("SBIdleTimerSettings disableIdleTimer is YES"));
  }

  return v6;
}

- (BOOL)updateIdleTimerSettingsForPowerDefaults:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[SBIdleTimerGlobalStateMonitor dontDimOrLockOnAC](self->_stateMonitor, "dontDimOrLockOnAC")
    && -[SBIdleTimerGlobalStateMonitor isOnACPower](self->_stateMonitor, "isOnACPower"))
  {
    objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
    objc_msgSend(v4, "setWarnInterval:", 1.79769313e308);
    objc_msgSend(v4, "setTimerMode:", 3);
    objc_msgSend(v4, "addAuditReason:", CFSTR("idleTimerDefaults dontDimOrLockWhileConnectedToPower is YES and device is on AC"));
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForFaceDown:(id)a3
{
  id v4;
  BOOL v5;
  double v6;

  v4 = a3;
  if (-[SBIdleTimerGlobalStateMonitor isFaceDownOnTable](self->_stateMonitor, "isFaceDownOnTable")
    && (objc_msgSend(v4, "totalInterval"), (BSFloatEqualToFloat() & 1) == 0))
  {
    objc_msgSend(v4, "totalInterval");
    objc_msgSend(v4, "setTotalInterval:", v6 * 0.25);
    objc_msgSend(v4, "addAuditReason:", CFSTR("facedown on a table - reducing total time by the factor %g"), 0x3FD0000000000000);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForDefaultWarnInterval:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;

  v4 = a3;
  objc_msgSend(v4, "totalInterval");
  v6 = v5;
  v7 = BSFloatGreaterThanFloat();
  if (v7)
    -[SBIdleTimerDescriptorFactory _updateIdleTimerSettingsWarnInterval:totalInterval:](self, "_updateIdleTimerSettingsWarnInterval:totalInterval:", v4, v6);

  return v7;
}

- (BOOL)updateIdleTimerSettingsForBatterySaverMode:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = -[SBIdleTimerGlobalStateMonitor isBatterySaverModeActive](self->_stateMonitor, "isBatterySaverModeActive");
  if (v5)
  {
    objc_msgSend(v4, "totalInterval");
    v7 = v6;
    objc_msgSend(v4, "warnInterval");
    v9 = 30.0;
    if (v7 <= 30.0)
      v9 = v7;
    v10 = v9;
    v11 = v10;
    v12 = v10 + -10.0;
    if (v8 > v12)
      v8 = v12;
    v13 = v8;
    if (v13 >= 2.0)
      v14 = v13;
    else
      v14 = 2.0;
    objc_msgSend(v4, "setTotalInterval:", v11);
    v15 = v14;
    objc_msgSend(v4, "setWarnInterval:", v15);
    objc_msgSend(v4, "addAuditReason:", CFSTR("isBatterySaverModeActive is YES"));
    if (BSFloatLessThanFloat())
    {
      objc_msgSend(v4, "setWarnInterval:", v11 * 0.666666667);
      SBIdleTimerIntervalToNSString(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SBIdleTimerIntervalToNSString(10.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAuditReason:", CFSTR("isBatterySaverModeActive is YES and warnInterval (%@) lt MAX_WARNING_INTERVAL_DELTA_BATTERY_SAVER (%@)"), v16, v17);

    }
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForAutoLockTimeout:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  uint64_t v13;
  double v14;
  int v15;
  char v16;
  _BOOL4 v17;
  double v18;
  void *v19;

  v5 = a3;
  -[SBIdleTimerGlobalStateMonitor autoLockTimeout](self->_stateMonitor, "autoLockTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v9 = v8;
    if (BSFloatLessThanOrEqualToFloat())
    {
      objc_msgSend(v5, "setTotalInterval:", v9);
      SBIdleTimerIntervalToNSString(v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      SBIdleTimerIntervalToNSString(3600.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAuditReason:", CFSTR("MCFeatureAutoLockTime (%@) is lte MAX (%@)"), v3, v10);
    }
    else
    {
      objc_msgSend(v5, "setTotalInterval:", 1.79769313e308);
      objc_msgSend(v5, "setWarnInterval:", 1.79769313e308);
      SBIdleTimerIntervalToNSString(v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      SBIdleTimerIntervalToNSString(3600.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAuditReason:", CFSTR("MCFeatureAutoLockTime (%@) is gt MAX (%@)"), v3, v10);
    }

LABEL_19:
    goto LABEL_20;
  }
  if (__sb__runningInSpringBoard())
  {
    v11 = SBFEffectiveDeviceClass();
    v12 = 60.0;
    if (v11 == 2)
      v12 = 300.0;
    objc_msgSend(v5, "setTotalInterval:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "userInterfaceIdiom");
    v14 = 60.0;
    if (v13 == 1)
      v14 = 300.0;
    objc_msgSend(v5, "setTotalInterval:", v14);

  }
  v15 = __sb__runningInSpringBoard();
  v16 = v15;
  if (v15)
  {
    v17 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "userInterfaceIdiom") == 1;
  }
  v18 = 60.0;
  if (v17)
    v18 = 300.0;
  SBIdleTimerIntervalToNSString(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAuditReason:", CFSTR("ERROR: MCFeatureAutoLockTime is <nil>; setting totalInterval to DEFAULT: %@"),
    v19);

  if ((v16 & 1) == 0)
    goto LABEL_19;
LABEL_20:

  return 1;
}

- (BOOL)updateIdleTimerSettingsForActiveClientConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[SBIdleTimerGlobalStateMonitor aggregateClientConfiguration](self->_stateMonitor, "aggregateClientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "disableTimerSetting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maxExpirationTimeoutSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minExpirationTimeoutSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 != 0;
    if (!v7
      || (objc_msgSend(v4, "setTimerMode:", 3),
          objc_msgSend(v4, "setTotalInterval:", 1.79769313e308),
          objc_msgSend(v4, "setWarnInterval:", 1.79769313e308),
          objc_msgSend(v4, "addAuditReason:", CFSTR("Active client configuration: [%@]"), v6),
          v8)
      && (v11 = objc_msgSend(v8, "highestPrecedence"), v11 >= objc_msgSend(v7, "precedence")))
    {
      objc_msgSend(v6, "resolvedExpirationTimeoutRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowerTimeout");
      v14 = v13;
      objc_msgSend(v12, "upperTimeout");
      v16 = v15;
      objc_msgSend(v4, "totalInterval");
      if (v9 && BSFloatLessThanFloat())
      {
        if (BSFloatLessThanOrEqualToFloat())
        {
          objc_msgSend(v4, "setTotalInterval:", v14);
          SBIdleTimerIntervalToNSString(v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          SBIdleTimerIntervalToNSString(3600.0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addAuditReason:", CFSTR("MinExpirationTimeoutFromService (%@) is lte MAX_TOTAL_INTERVAL (%@)"), v17, v18);
        }
        else
        {
          objc_msgSend(v4, "setTotalInterval:", 1.79769313e308);
          objc_msgSend(v4, "setWarnInterval:", 1.79769313e308);
          SBIdleTimerIntervalToNSString(v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          SBIdleTimerIntervalToNSString(3600.0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addAuditReason:", CFSTR("MinExpirationTimeoutFromService (%@) is gt MAX_TOTAL_INTERVAL (%@)"), v17, v18);
        }

        v10 = 1;
      }
      objc_msgSend(v4, "totalInterval");
      if (v8)
      {
        v20 = v19;
        if (BSFloatGreaterThanFloat())
        {
          objc_msgSend(v4, "setTotalInterval:", v16);
          if (objc_msgSend(v4, "timerMode") == 3)
          {
            objc_msgSend(v4, "setWarnInterval:", v20 * 0.666666667);
            objc_msgSend(v4, "setTimerMode:", 1);
          }
          SBIdleTimerIntervalToNSString(v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          SBIdleTimerIntervalToNSString(3600.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addAuditReason:", CFSTR("MaxExpirationTimeoutFromService"), v21, v22);

          v10 = 1;
        }
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)sanitizeSettingsAfterSetup:(id)a3 duration:(int64_t)a4
{
  id v5;
  int v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;

  v5 = a3;
  objc_msgSend(v5, "addAuditReason:", CFSTR("after setup"));
  objc_msgSend(v5, "totalInterval");
  if (BSFloatEqualToFloat())
  {
    objc_msgSend(v5, "warnInterval");
    if (BSFloatEqualToFloat())
    {
      if (__sb__runningInSpringBoard())
      {
        v6 = SBFEffectiveDeviceClass();
        v7 = 40.0;
        if (v6 == 2)
          v7 = 280.0;
        objc_msgSend(v5, "setWarnInterval:", v7);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "userInterfaceIdiom");
        v10 = 40.0;
        if (v9 == 1)
          v10 = 280.0;
        objc_msgSend(v5, "setWarnInterval:", v10);

      }
      objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, setting default warn interval"));
    }
  }
  objc_msgSend(v5, "warnInterval");
  v12 = v11;
  if (objc_msgSend(v5, "shouldWarn"))
  {
    if (objc_msgSend(v5, "timerMode") == 2)
    {
      objc_msgSend(v5, "setTimerMode:", 1);
      objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, timer mode was: Manual"));
    }
  }
  else if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(v5, "setWarnInterval:", 1.79769313e308);
    SBIdleTimerIntervalToNSString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, warnInterval was %@"), v13);

  }
  v14 = objc_msgSend(v5, "shouldWarn");
  objc_msgSend(v5, "totalInterval");
  if (v14)
    objc_msgSend(v5, "warnInterval");
  if (a4 == 14 || BSFloatEqualToFloat())
  {
    objc_msgSend(v5, "setTotalInterval:", 1.79769313e308);
    objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, should not expire"));
  }
  if ((objc_msgSend(v5, "shouldWarn") & 1) == 0 && BSFloatEqualToFloat())
  {
    objc_msgSend(v5, "setTimerMode:", 3);
    objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, shouldWarn is NO and expireInterval is <never>"));
  }
  objc_msgSend(v5, "warnInterval");
  if (BSFloatEqualToFloat())
  {
    objc_msgSend(v5, "totalInterval");
    if (BSFloatEqualToFloat())
    {
      objc_msgSend(v5, "setTimerMode:", 3);
      objc_msgSend(v5, "addAuditReason:", CFSTR("after setup, warnInterval is <never> and totalInterval is <never>"));
    }
  }

  return 0;
}

- (BOOL)sanitizeSettingsAfterInitialSetup:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  int v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  BOOL v20;

  v3 = a3;
  objc_msgSend(v3, "totalInterval");
  v5 = v4;
  objc_msgSend(v3, "warnInterval");
  v7 = v6;
  if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatIsZero())
  {
    if (__sb__runningInSpringBoard())
    {
      v8 = SBFEffectiveDeviceClass();
      v9 = 60.0;
      if (v8 == 2)
        v9 = 300.0;
      objc_msgSend(v3, "setTotalInterval:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom");
      v12 = 60.0;
      if (v11 == 1)
        v12 = 300.0;
      objc_msgSend(v3, "setTotalInterval:", v12);

    }
    if (__sb__runningInSpringBoard())
    {
      v13 = SBFEffectiveDeviceClass();
      v14 = 40.0;
      if (v13 == 2)
        v14 = 280.0;
      objc_msgSend(v3, "setWarnInterval:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceIdiom");
      v17 = 40.0;
      if (v16 == 1)
        v17 = 280.0;
      objc_msgSend(v3, "setWarnInterval:", v17);

    }
    if (objc_msgSend(v3, "timerMode") != 3)
      objc_msgSend(v3, "setTimerMode:", 1);
    SBIdleTimerIntervalToNSString(v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBIdleTimerIntervalToNSString(v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAuditReason:", CFSTR("totalInterval (%@) and/or warnInterval (%@) is not sane"), v18, v19);

    v20 = 1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_updateIdleTimerSettingsWarnInterval:(id)a3 totalInterval:(double)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "totalInterval");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (BSFloatLessThanOrEqualToFloat())
    {
      objc_msgSend(v6, "setWarnInterval:");
      objc_msgSend(v6, "setQuickUnwarnInterval:", a4 * 0.666666667 + a4 * 0.666666667 * 0.1);
      SBIdleTimerIntervalToNSString(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAuditReason:", CFSTR("totalInterval (%@) lte 30; applying factor (%g) to calculate warnInterval"),
        v5,
        0x3FE5555555555555);
    }
    else
    {
      objc_msgSend(v6, "setWarnInterval:");
      objc_msgSend(v6, "setQuickUnwarnInterval:", a4 + -20.0 + 2.0);
      SBIdleTimerIntervalToNSString(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAuditReason:", CFSTR("totalInterval (%@) lte 30; subtracting delta (%g) to calculate warnInterval"),
        v5,
        0x4034000000000000);
    }

  }
}

- (BOOL)_shouldUseAttentionSensor
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  os_log_type_t v11;
  __int16 v13;
  uint8_t buf[2];
  __int16 v15;

  -[SBIdleTimerDescriptorFactory _prototypeController](self, "_prototypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attentionAwarenessSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "shouldUseAttentionSensor"))
  {
    if (-[SBIdleTimerGlobalStateMonitor disableAttentionAwareness](self->_stateMonitor, "disableAttentionAwareness"))
      v6 = 2;
    else
      v6 = 3;
  }
  else
  {
    v6 = 1;
  }
  if (self->_previousShouldUseAttentionSensorAccess != v6)
  {
    self->_previousShouldUseAttentionSensorAccess = v6;
    if (v6 == 3)
    {
      SBLogIdleTimer();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v13 = 0;
        v8 = "_shouldUseAttentionSensor: YES";
        v9 = (uint8_t *)&v13;
        v10 = v7;
        v11 = OS_LOG_TYPE_INFO;
LABEL_16:
        _os_log_impl(&dword_1D0540000, v10, v11, v8, v9, 2u);
      }
    }
    else if (v6 == 2)
    {
      SBLogIdleTimer();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "_shouldUseAttentionSensor: NO because SBDisableAttentionAwareness is set";
        v9 = buf;
        goto LABEL_15;
      }
    }
    else
    {
      SBLogIdleTimer();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v8 = "_shouldUseAttentionSensor: NO because not supported on this hardware, turned off in accessibility or turned"
             " off by managed config";
        v9 = (uint8_t *)&v15;
LABEL_15:
        v10 = v7;
        v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_16;
      }
    }

  }
  return v6 == 3;
}

- (SBPrototypeController)_prototypeController
{
  SBPrototypeController *override_prototypeController;

  override_prototypeController = self->_override_prototypeController;
  if (override_prototypeController)
    return override_prototypeController;
  +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
  return (SBPrototypeController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBMainWorkspace)_mainWorkspace
{
  SBMainWorkspace *override_mainWorkspace;

  override_mainWorkspace = self->_override_mainWorkspace;
  if (override_mainWorkspace)
    return override_mainWorkspace;
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  return (SBMainWorkspace *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBLockScreenManager)_lockScreenManager
{
  SBLockScreenManager *override_lockScreenManager;

  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
    return override_lockScreenManager;
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  return (SBLockScreenManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBIdleTimerSettings)_idleTimerPrototypeSettings
{
  SBIdleTimerSettings *override_idleTimerPrototypeSettings;

  override_idleTimerPrototypeSettings = self->_override_idleTimerPrototypeSettings;
  if (override_idleTimerPrototypeSettings)
    return override_idleTimerPrototypeSettings;
  +[SBIdleTimerDomain rootSettings](SBIdleTimerDomain, "rootSettings");
  return (SBIdleTimerSettings *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBConferenceManager)_conferenceManager
{
  SBConferenceManager *override_conferenceManager;

  override_conferenceManager = self->_override_conferenceManager;
  if (override_conferenceManager)
    return override_conferenceManager;
  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  return (SBConferenceManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBUIBiometricResource)_biometricResource
{
  SBUIBiometricResource *override_biometricResource;

  override_biometricResource = self->_override_biometricResource;
  if (override_biometricResource)
    return override_biometricResource;
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  return (SBUIBiometricResource *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)disabledIdleTimerDescriptor
{
  return -[SBIdleTimerDescriptor initWithTimerMode:warnInterval:totalInterval:]([SBIdleTimerDescriptor alloc], "initWithTimerMode:warnInterval:totalInterval:", 3, 1.79769313e308, 1.79769313e308);
}

- (SBTelephonyManager)_telephonyManager
{
  SBTelephonyManager *override_telephonyManager;

  override_telephonyManager = self->_override_telephonyManager;
  if (override_telephonyManager)
    return override_telephonyManager;
  +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
  return (SBTelephonyManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBIdleTimerDescriptorFactory)initWithGlobalStateMonitor:(id)a3
{
  id v5;
  SBIdleTimerDescriptorFactory *v6;
  SBIdleTimerDescriptorFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerDescriptorFactory;
  v6 = -[SBIdleTimerDescriptorFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stateMonitor, a3);

  return v7;
}

- (BOOL)sanitizeTotalDuration:(id)a3
{
  id v3;
  double v4;
  double v5;
  int IsZero;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "totalInterval");
  v5 = v4;
  IsZero = BSFloatIsZero();
  if (IsZero)
  {
    if (__sb__runningInSpringBoard())
    {
      v7 = SBFEffectiveDeviceClass();
      v8 = 60.0;
      if (v7 == 2)
        v8 = 300.0;
      objc_msgSend(v3, "setTotalInterval:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");
      v11 = 60.0;
      if (v10 == 1)
        v11 = 300.0;
      objc_msgSend(v3, "setTotalInterval:", v11);

    }
    SBIdleTimerIntervalToNSString(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAuditReason:", CFSTR("totalInterval (%@) is float equals to 0"), v12);

  }
  return IsZero;
}

- (BOOL)sanitizeWarnInterval:(id)a3
{
  id v3;
  double v4;
  double v5;
  int IsZero;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "warnInterval");
  v5 = v4;
  IsZero = BSFloatIsZero();
  if (IsZero)
  {
    if (__sb__runningInSpringBoard())
    {
      v7 = SBFEffectiveDeviceClass();
      v8 = 40.0;
      if (v7 == 2)
        v8 = 280.0;
      objc_msgSend(v3, "setWarnInterval:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");
      v11 = 40.0;
      if (v10 == 1)
        v11 = 280.0;
      objc_msgSend(v3, "setWarnInterval:", v11);

    }
    SBIdleTimerIntervalToNSString(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAuditReason:", CFSTR("warnInterval (%@) is float equals to 0"), v12);

  }
  return IsZero;
}

- (BOOL)sanitizeDescriptorForLockscreenDefaults:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  double v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "totalInterval");
  v6 = v5;
  v7 = BSFloatGreaterThanOrEqualToFloat();
  if (v7)
  {
    -[SBIdleTimerGlobalStateMonitor minimumLockscreenIdleTime](self->_stateMonitor, "minimumLockscreenIdleTime");
    if (v6 >= v8)
      v8 = v6;
    objc_msgSend(v4, "setTotalInterval:", v8);
    SBIdleTimerIntervalToNSString(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAuditReason:", CFSTR("totalInterval (%@) is gte 0"), v9);

  }
  return v7;
}

- (BOOL)updateIdleTimerSettingsForDuration:(int64_t)a3 descriptor:(id)a4
{
  id v6;
  BOOL v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v6 = a4;
  if (objc_msgSend(v6, "timerMode") == 3)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    switch(a3)
    {
      case 0:
      case 1:
        v8 = 6.0;
        goto LABEL_16;
      case 2:
        v8 = 2.0;
        goto LABEL_16;
      case 3:
        objc_msgSend((id)SBApp, "accidentalActivationMitigationSessionCoordinator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "duration");
        objc_msgSend(v6, "setTotalInterval:");

        objc_msgSend(v6, "setWarnInterval:", 0.01);
        goto LABEL_17;
      case 4:
        v8 = 10.0;
        goto LABEL_16;
      case 5:
        v8 = 15.0;
        goto LABEL_16;
      case 6:
      case 7:
        v8 = 20.0;
        goto LABEL_16;
      case 8:
        v8 = 120.0;
        goto LABEL_16;
      case 9:
        v8 = 25.0;
        goto LABEL_16;
      case 10:
        v8 = 30.0;
        goto LABEL_16;
      case 11:
        v8 = 8.0;
        goto LABEL_16;
      case 13:
        -[SBIdleTimerDescriptorFactory _idleTimerPrototypeSettings](self, "_idleTimerPrototypeSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unlockedIdleTimerCap");
        v13 = v12;

        objc_msgSend(v6, "totalInterval");
        if (v13 < v8)
          v8 = v13;
LABEL_16:
        objc_msgSend(v6, "setTotalInterval:", v8);
        goto LABEL_17;
      case 14:
        objc_msgSend(v6, "setTotalInterval:", 1.79769313e308);
        objc_msgSend(v6, "setTimerMode:", 3);
LABEL_17:
        NSStringFromIdleTimerDuration();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addAuditReason:", CFSTR("duration is %@"), v14);

        v7 = 1;
        break;
      default:
        break;
    }
  }

  return v7;
}

- (SBBacklightController)_backlightController
{
  SBBacklightController *override_backlightController;

  override_backlightController = self->_override_backlightController;
  if (override_backlightController)
    return override_backlightController;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  return (SBBacklightController *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isIdleDurationForever:(double)a3
{
  if (a3 == 1.79769313e308)
    return 1;
  else
    return BSFloatLessThanFloat();
}

- (void)_setBacklightController:(id)a3
{
  objc_storeStrong((id *)&self->_override_backlightController, a3);
}

- (void)_setPrototypeController:(id)a3
{
  objc_storeStrong((id *)&self->_override_prototypeController, a3);
}

- (void)_setIdleTimerPrototypeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_override_idleTimerPrototypeSettings, a3);
}

- (void)_setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_lockScreenManager, a3);
}

- (void)_setMainWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_override_mainWorkspace, a3);
}

- (void)_setBiometricResource:(id)a3
{
  objc_storeStrong((id *)&self->_override_biometricResource, a3);
}

- (void)_setTelephonyManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_telephonyManager, a3);
}

- (void)_setConferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_conferenceManager, a3);
}

- (SpringBoard)_springBoard
{
  return self->_springBoard;
}

- (void)_setSpringBoard:(id)a3
{
  objc_storeStrong((id *)&self->_springBoard, a3);
}

- (SBAlertItemsController)_alertItemsController
{
  return self->_alertItemsController;
}

- (void)_setAlertItemsController:(id)a3
{
  objc_storeStrong((id *)&self->_alertItemsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_springBoard, 0);
  objc_storeStrong((id *)&self->_override_backlightController, 0);
  objc_storeStrong((id *)&self->_override_conferenceManager, 0);
  objc_storeStrong((id *)&self->_override_telephonyManager, 0);
  objc_storeStrong((id *)&self->_override_biometricResource, 0);
  objc_storeStrong((id *)&self->_override_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_idleTimerPrototypeSettings, 0);
  objc_storeStrong((id *)&self->_override_prototypeController, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
}

@end
