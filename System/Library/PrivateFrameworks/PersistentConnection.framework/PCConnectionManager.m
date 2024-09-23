@implementation PCConnectionManager

- (void)setKeepAliveGracePeriod:(double)a3
{
  PCConnectionManager *v4;
  double v5;
  NSObject *logObject;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (a3 > 2.22044605e-16)
  {
    v5 = PCScheduledWakeRTCPrecision() * 2.0 + 5.0;
    if (a3 + 5.0 >= v5)
      a3 = a3 + 5.0;
    else
      a3 = v5;
  }
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Setting keep alive grace period to %g", (uint8_t *)&v8, 0xCu);
  }
  v4->_keepAliveGracePeriod = a3;
  -[PCConnectionManager _currentGrowthAlgorithm](v4, "_currentGrowthAlgorithm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsServerOriginatedKeepAlive:", a3 > 2.22044605e-16);

  objc_sync_exit(v4);
}

- (unint64_t)countOfGrowthActions
{
  PCConnectionManager *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countOfGrowthActions");

  objc_sync_exit(v2);
  return v4;
}

- (void)_clearTimersReleasingPowerAssertion:(BOOL)a3
{
  _BOOL4 v3;
  PCPersistentTimer *intervalTimer;
  PCPersistentTimer *reconnectWakeTimer;
  PCPersistentTimer *delayTimer;

  v3 = a3;
  self->_isRunning = 0;
  -[PCPersistentTimer invalidate](self->_intervalTimer, "invalidate");
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = 0;

  -[PCPersistentTimer invalidate](self->_reconnectWakeTimer, "invalidate");
  reconnectWakeTimer = self->_reconnectWakeTimer;
  self->_reconnectWakeTimer = 0;

  -[PCPersistentTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  -[PCConnectionManager _adjustInterfaceAssertions](self, "_adjustInterfaceAssertions");
  if (v3)
    -[PCConnectionManager _releasePowerAssertion](self, "_releasePowerAssertion");
  self->_lastStopTime = CFAbsoluteTimeGetCurrent();
}

- (void)_setupTimerForPushWithKeepAliveInterval:(double)a3
{
  PCGrowthAlgorithm *v6;
  PCGrowthAlgorithm *lastScheduledGrowthAlgorithm;
  PCPersistentTimer *v8;
  PCPersistentTimer *intervalTimer;
  NSObject *logObject;
  NSObject *v11;
  double nonCellularEarlyFireConstantInterval;
  void *v13;
  double v14;
  NSObject *v15;
  double v16;
  PCPersistentTimer *v17;
  void *v18;
  void *v19;
  int v20;
  PCConnectionManager *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PCConnectionManager.m"), 1111, CFSTR("timers already exist"));

  }
  self->_onTimeKeepAliveTime = CFAbsoluteTimeGetCurrent() + a3;
  -[PCConnectionManager _currentGrowthAlgorithm](self, "_currentGrowthAlgorithm");
  v6 = (PCGrowthAlgorithm *)objc_claimAutoreleasedReturnValue();
  lastScheduledGrowthAlgorithm = self->_lastScheduledGrowthAlgorithm;
  self->_lastScheduledGrowthAlgorithm = v6;

  v8 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:guidancePriority:target:selector:userInfo:]([PCPersistentTimer alloc], "initWithTimeInterval:serviceIdentifier:guidancePriority:target:selector:userInfo:", self->_serviceIdentifier, self->_guidancePriority, self, sel__intervalTimerFired, 0, self->_keepAliveGracePeriod + a3);
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v8;

  if (self->_disableEarlyFire)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = self;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ - early fire has been manually disabled for this timer!", (uint8_t *)&v20, 0xCu);
    }
    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_intervalTimer, "setMinimumEarlyFireProportion:", 1.0);
  }
  if (!self->_interfaceIdentifier && self->_nonCellularEarlyFireConstantInterval > 0.0)
  {
    v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      nonCellularEarlyFireConstantInterval = self->_nonCellularEarlyFireConstantInterval;
      v20 = 138412546;
      v21 = self;
      v22 = 2048;
      v23 = nonCellularEarlyFireConstantInterval;
      _os_log_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEFAULT, "%@ - setting early fire constant interval to %f!", (uint8_t *)&v20, 0x16u);
    }
    -[PCPersistentTimer setEarlyFireConstantInterval:](self->_intervalTimer, "setEarlyFireConstantInterval:", self->_nonCellularEarlyFireConstantInterval);
  }
  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "doesWWANInterfaceExist") & 1) == 0 && (objc_msgSend(v13, "isWakeOnWiFiSupported") & 1) == 0)
  {
    -[PCConnectionManager pollingInterval](self, "pollingInterval");
    if (v14 < 2.22044605e-16)
    {
      v15 = self->_logObject;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "Trying to push no persistent interface exists and the poll interval is 'manual', so disabling waking to conserve power", (uint8_t *)&v20, 2u);
      }
      -[PCPersistentTimer setDisableSystemWaking:](self->_intervalTimer, "setDisableSystemWaking:", 1);
    }
  }
  -[PCPersistentTimer fireTime](self->_intervalTimer, "fireTime");
  self->_lastScheduledIntervalTime = v16;
  v17 = self->_intervalTimer;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v17, "scheduleInRunLoop:", v18);

}

- (void)_adjustInterfaceAssertions
{
  void *v3;
  unsigned int v4;
  int v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (self->_intervalTimer)
  {
    v4 = -[PCConnectionManager currentStyle](self, "currentStyle");
    v5 = objc_msgSend(v8, "isWWANInterfaceUp");
    if (v4 >= 2)
    {
      objc_msgSend(v8, "enableWiFiAutoAssociation:forDelegate:", 0, self);
      goto LABEL_11;
    }
    if (!v5)
    {
      objc_msgSend(v8, "enableWiFiAutoAssociation:forDelegate:", self->_interfaceIdentifier != 1, self);
      if (!v4)
      {
LABEL_16:
        v7 = self->_interfaceIdentifier != 1;
        goto LABEL_12;
      }
LABEL_11:
      v7 = 0;
LABEL_12:
      v6 = v8;
      goto LABEL_13;
    }
    if (!self->_enableNonCellularConnections)
    {
      objc_msgSend(v8, "enableWiFiAutoAssociation:forDelegate:", 0, self);
      v6 = v8;
      v7 = 0;
      if (v4)
        goto LABEL_13;
LABEL_15:
      if (self->_enableNonCellularConnections)
        goto LABEL_16;
      goto LABEL_11;
    }
    objc_msgSend(v8, "enableWiFiAutoAssociation:forDelegate:", self->_interfaceIdentifier != 1, self);
    v6 = v8;
    if (!v4)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(v3, "enableWiFiAutoAssociation:forDelegate:", 0, self);
    v6 = v8;
  }
  v7 = 0;
LABEL_13:
  objc_msgSend(v6, "enableWakeOnWiFi:forDelegate:", v7, self);

}

- (id)persistentInterfaceManager
{
  return +[PCPersistentInterfaceManager sharedInstance](PCPersistentInterfaceManager, "sharedInstance");
}

- (PCKeepAliveState)currentKeepAliveState
{
  PCConnectionManager *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  PCKeepAliveState *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "growthStage");

  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "previousAction");

  v6 = -[PCKeepAliveState initWithKeepAliveState:subState:]([PCKeepAliveState alloc], "initWithKeepAliveState:subState:", v4, v3);
  objc_sync_exit(v2);

  return v6;
}

- (void)resumeManagerWithAction:(int)a3 forceGrow:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  PCConnectionManager *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double onTimeKeepAliveTime;
  double v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  PCGrowthAlgorithm *v31;
  PCGrowthAlgorithm *v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double lastStopTime;
  PCGrowthAlgorithm *lastScheduledGrowthAlgorithm;
  NSObject *logObject;
  double v40;
  const __CFString *v41;
  double v42;
  double v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  NSString *serviceIdentifier;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  -[PCConnectionManager _clearTimers](v6, "_clearTimers");
  -[PCConnectionManager _validateActionForCurrentStyle:](v6, "_validateActionForCurrentStyle:", v5);
  *(_WORD *)&v6->_hasStarted = 257;
  v6->_lastResumeTime = CFAbsoluteTimeGetCurrent();
  v6->_lastElapsedInterval = 0.0;
  v7 = -[PCConnectionManager currentStyle](v6, "currentStyle");
  -[PCConnectionManager _resolveStateWithAction:](v6, "_resolveStateWithAction:", v5);
  if (!v6->_isInReconnectMode)
  {
    if (v7)
    {
      if (v7 != 1)
      {
        if (v7 != 2)
          goto LABEL_62;
        v10 = v6->_logObject;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v12;
          _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Resuming manual keep alive timer in normal mode with action %@", buf, 0xCu);

        }
        goto LABEL_16;
      }
      v20 = v6->_logObject;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v21;
        _os_log_impl(&dword_1CBC1B000, v20, OS_LOG_TYPE_DEFAULT, "Resuming poll keep alive timer in normal mode with action %@", buf, 0xCu);

      }
      -[PCConnectionManager _setupTimerForPollForAdjustment:](v6, "_setupTimerForPollForAdjustment:", 0);
      goto LABEL_62;
    }
    v16 = v6->_logObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v63 = v17;
      _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "Resuming push keep alive timer in normal mode with action %@", buf, 0xCu);

    }
    onTimeKeepAliveTime = v6->_onTimeKeepAliveTime;
    if (v6->_keepAliveGracePeriod <= 2.22044605e-16)
    {
      v19 = onTimeKeepAliveTime + PCScheduledWakeRTCPrecision() * -2.0;
      onTimeKeepAliveTime = v6->_onTimeKeepAliveTime;
    }
    else
    {
      v19 = onTimeKeepAliveTime + -5.0;
    }
    v22 = onTimeKeepAliveTime == 0.0 || v6->_lastStopTime < v19;
    v23 = v6->_logObject;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v22;
      if (v22)
        v24 = "early";
      else
        v24 = "on time";
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6->_lastStopTime);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v25);
      v26 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6->_onTimeKeepAliveTime);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v27);
      *(double *)&v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v29 = (void *)v28;
      v30 = CFSTR("NO");
      *(_DWORD *)buf = 136315906;
      v63 = (void *)v24;
      v64 = 2112;
      if (onTimeKeepAliveTime == 0.0)
        v30 = CFSTR("YES");
      v65 = v26;
      v66 = 2112;
      v67 = *(double *)&v28;
      v68 = 2112;
      v69 = v30;
      _os_log_impl(&dword_1CBC1B000, v23, OS_LOG_TYPE_DEFAULT, "Last timer interruption was %s: [%@]. Expected fire time was [%@]. {lastKeepAliveWasUntracked: %@}", buf, 0x2Au);

      v22 = v59;
    }

    -[PCConnectionManager _currentGrowthAlgorithm](v6, "_currentGrowthAlgorithm");
    v31 = (PCGrowthAlgorithm *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!(_DWORD)v5)
    {
      v33 = !v4;
      if (onTimeKeepAliveTime != 0.0)
        v33 = 0;
      if (v33 || !v22)
      {
        if (!v33)
        {
LABEL_58:
          -[PCGrowthAlgorithm currentKeepAliveInterval](v32, "currentKeepAliveInterval");
          -[PCGrowthAlgorithm setLastSuccessfulKeepAliveInterval:](v32, "setLastSuccessfulKeepAliveInterval:");
          v5 = 0;
          goto LABEL_59;
        }
      }
      else
      {
        v34 = v6->_onTimeKeepAliveTime;
        -[PCGrowthAlgorithm currentKeepAliveInterval](v31, "currentKeepAliveInterval");
        v36 = v34 - v35;
        lastStopTime = v6->_lastStopTime;
        lastScheduledGrowthAlgorithm = v6->_lastScheduledGrowthAlgorithm;
        logObject = v6->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v6->_onTimeKeepAliveTime;
          *(double *)&v41 = COERCE_DOUBLE(CFSTR("NO"));
          v42 = v6->_lastStopTime;
          if (lastScheduledGrowthAlgorithm == v32)
            *(double *)&v41 = COERCE_DOUBLE(CFSTR("YES"));
          *(_DWORD *)buf = 138413314;
          v63 = v6;
          v64 = 2112;
          v65 = *(double *)&v41;
          v66 = 2048;
          v67 = v36;
          v68 = 2048;
          v69 = *(const __CFString **)&v40;
          v70 = 2048;
          v71 = v42;
          _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@: lastKeepAliveWasEarly - Examining sameAlgorithm %@ timeKeepAliveWasScheduled %f, onTimeKeepAliveTime: %f, lastStopTime %f", buf, 0x34u);
        }
        if (lastScheduledGrowthAlgorithm == v32)
        {
          v43 = lastStopTime - v36;
          if (-[PCGrowthAlgorithm useIntervalIfImprovement:](v32, "useIntervalIfImprovement:", v43))
          {
            v44 = v6->_logObject;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v63 = v6;
              v64 = 2048;
              v65 = v43;
              _os_log_impl(&dword_1CBC1B000, v44, OS_LOG_TYPE_DEFAULT, "%@: This grow action is early but we're past the interval our previous growth was based on. Regrowing based on this interval %f.", buf, 0x16u);
            }
            goto LABEL_58;
          }
        }
        v45 = v6->_logObject;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", 0);
          *(double *)&v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v47 = (void *)v46;
          *(double *)&v48 = COERCE_DOUBLE("NO");
          *(_DWORD *)buf = 138412802;
          v63 = v6;
          if (v4)
            *(double *)&v48 = COERCE_DOUBLE("YES");
          v64 = 2080;
          v65 = *(double *)&v48;
          v66 = 2112;
          v67 = *(double *)&v46;
          _os_log_impl(&dword_1CBC1B000, v45, OS_LOG_TYPE_DEFAULT, "%@ Last keep alive was early {forceGrow: %s, action: %@}", buf, 0x20u);

        }
        if (v4)
          goto LABEL_58;
      }
      v5 = 2;
    }
LABEL_59:
    v6->_lastProcessedAction = v5;
    -[PCGrowthAlgorithm processNextAction:](v32, "processNextAction:", v5);
    -[PCConnectionManager currentKeepAliveInterval](v6, "currentKeepAliveInterval");
    -[PCConnectionManager _setupTimerForPushWithKeepAliveInterval:](v6, "_setupTimerForPushWithKeepAliveInterval:");
    if (v32 == v6->_wwanGrowthAlgorithm[v6->_currentAddressFamily])
      -[PCConnectionManager _saveWWANKeepAliveInterval](v6, "_saveWWANKeepAliveInterval");

    goto LABEL_62;
  }
  -[PCConnectionManager persistentInterfaceManager](v6, "persistentInterfaceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "areAllNetworkInterfacesDisabled");

  if (v9)
  {
    v10 = v6->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v63 = v11;
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Choosing not to resume keep alive in reconnect mode since all interfaces are disabled. Action %@", buf, 0xCu);

    }
LABEL_16:

    goto LABEL_62;
  }
  if (!v6->_powerOptimizationsForExpensiveNetworkingDisabled
    && +[PCInterfaceMonitor isNetworkingPowerExpensiveToUse](PCInterfaceMonitor, "isNetworkingPowerExpensiveToUse"))
  {
    v10 = v6->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v63 = v13;
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Choosing not to resume keep alive in reconnect mode since interface is networking power expensive to use. Action %@", buf, 0xCu);

    }
    goto LABEL_16;
  }
  v14 = v6->_logObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _stringForAction:](v6, "_stringForAction:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v63 = v15;
    _os_log_impl(&dword_1CBC1B000, v14, OS_LOG_TYPE_DEFAULT, "Resuming keep alive in reconnect mode with action %@", buf, 0xCu);

  }
  -[PCConnectionManager _setupKeepAliveForReconnect](v6, "_setupKeepAliveForReconnect");
  v6->_lastReconnectTime = CFAbsoluteTimeGetCurrent();
LABEL_62:
  -[PCConnectionManager _adjustInterfaceAssertions](v6, "_adjustInterfaceAssertions");
  if (!v7)
  {
    v49 = v6->_logObject;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      serviceIdentifier = v6->_serviceIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v51);
      v52 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
      -[PCConnectionManager currentKeepAliveInterval](v6, "currentKeepAliveInterval");
      *(_DWORD *)buf = 138412802;
      v63 = serviceIdentifier;
      v64 = 2112;
      v65 = v52;
      v66 = 1024;
      LODWORD(v67) = (int)v53;
      _os_log_impl(&dword_1CBC1B000, v49, OS_LOG_TYPE_INFO, "logKeepAlive {identifier: %@, currentDate: %@, keepAliveInterval: %i}", buf, 0x1Cu);

    }
    if (resumeManagerWithAction_forceGrow___pred_PLLogRegisteredEventPowerLog != -1)
      dispatch_once(&resumeManagerWithAction_forceGrow___pred_PLLogRegisteredEventPowerLog, &__block_literal_global_1);
    v60[0] = CFSTR("KeepAliveInterval");
    v54 = (void *)MEMORY[0x1E0CB37E8];
    -[PCConnectionManager currentKeepAliveInterval](v6, "currentKeepAliveInterval");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v55;
    v60[1] = CFSTR("ServiceIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6->_serviceIdentifier);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v56;
    v60[2] = CFSTR("IsInReconnectMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6->_isInReconnectMode);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (resumeManagerWithAction_forceGrow___PLLogRegisteredEvent)
      resumeManagerWithAction_forceGrow___PLLogRegisteredEvent(3, CFSTR("PC APSD Resume PCConnectionManager"), v58, 0);

  }
  objc_sync_exit(v6);

}

- (double)currentKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (id)_currentGrowthAlgorithm
{
  int64_t interfaceIdentifier;
  PCGrowthAlgorithm *v4;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  interfaceIdentifier = self->_interfaceIdentifier;
  if (!interfaceIdentifier)
  {
    v4 = self->_wifiGrowthAlgorithm[self->_currentAddressFamily];
    return v4;
  }
  if (interfaceIdentifier == 1)
  {
    v4 = self->_wwanGrowthAlgorithm[self->_currentAddressFamily];
    return v4;
  }
  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWWANInterfaceUp");
  v8 = 112;
  if (v7)
    v8 = 96;
  v9 = *(id *)((char *)&self->super.isa + 8 * self->_currentAddressFamily + v8);

  return v9;
}

- (int)currentGrowthStage
{
  void *v2;
  int v3;

  -[PCConnectionManager _currentGrowthAlgorithm](self, "_currentGrowthAlgorithm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "growthStage");

  return v3;
}

- (void)_validateActionForCurrentStyle:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *logObject;
  id v17;

  v3 = *(_QWORD *)&a3;
  if (a3 < 7)
  {
    v6 = -[PCConnectionManager currentStyle](self, "currentStyle");
    if ((v6 - 1) >= 2)
    {
      if (!v6 && (_DWORD)v3 == 4)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[PCConnectionManager _stringForAction:](self, "_stringForAction:", 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Action %@ not appropriate for push style."), v15);
        v5 = objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_18;
      }
    }
    else if (v3 <= 3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[PCConnectionManager _stringForAction:](self, "_stringForAction:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCConnectionManager _stringForStyle:](self, "_stringForStyle:", -[PCConnectionManager currentStyle](self, "currentStyle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCConnectionManager _stringForStyle:](self, "_stringForStyle:", self->_prefsStyle);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_forceManualWhenRoaming ? CFSTR("YES") : CFSTR("NO");
      v12 = self->_onlyAllowedStyleSet ? CFSTR("YES") : CFSTR("NO");
      -[PCConnectionManager _stringForStyle:](self, "_stringForStyle:", self->_onlyAllowedStyle);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Action %@ not appropriate for %@. PrefsStyle=%@. _forceManualWhenRoaming = %@  onlyAllowedStyleSet=%@ onlyAllowedStyle=%@"), v8, v9, v10, v11, v12, v13);
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
      {
LABEL_18:
        logObject = self->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_ERROR))
          -[PCConnectionManager _validateActionForCurrentStyle:].cold.1(v5, logObject);
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v17);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid action type: %i"), *(_QWORD *)&a3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_18;
  }
}

void __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke(uint64_t a1, int token)
{
  void *v3;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTimerGuidance:", (double)state64 / 1000.0);

}

- (void)_setTimerGuidance:(double)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_timerGuidance = a3;
  -[PCConnectionManager _adjustPollTimerIfNecessary](obj, "_adjustPollTimerIfNecessary");
  objc_sync_exit(obj);

}

- (void)_adjustPollTimerIfNecessary
{
  int v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  NSObject *logObject;
  const __CFString *v8;
  _BOOL4 isInReconnectMode;
  const __CFString *v10;
  PCPersistentTimer *intervalTimer;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  PCPersistentTimer *v15;
  int v16;
  PCConnectionManager *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  PCPersistentTimer *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[PCConnectionManager currentStyle](self, "currentStyle");
  v4 = -[PCPersistentTimer firingIsImminent](self->_intervalTimer, "firingIsImminent");
  v5 = v4;
  if (v3 == 1 && self->_isRunning && !self->_isInReconnectMode)
  {
    if (self->_intervalTimer)
      v6 = !v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    isInReconnectMode = self->_isInReconnectMode;
    if (v3 == 1)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    intervalTimer = self->_intervalTimer;
    if (self->_isRunning)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v16 = 138413826;
    if (isInReconnectMode)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v17 = self;
    if (v5)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v19 = v10;
    v18 = 2112;
    if (v6)
      v8 = CFSTR("YES");
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = intervalTimer;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ _adjustPollTimerIfNecessary  rightStyle %@  isRunning %@  isInReconnectMode %@   intervalTimer %@  firingIsImminent %@ - should Adjust? %@", (uint8_t *)&v16, 0x48u);
  }
  if (v6)
  {
    -[PCPersistentTimer invalidate](self->_intervalTimer, "invalidate");
    v15 = self->_intervalTimer;
    self->_intervalTimer = 0;

    -[PCConnectionManager _setupTimerForPollForAdjustment:](self, "_setupTimerForPollForAdjustment:", 1);
  }
}

- (int)currentStyle
{
  PCConnectionManager *v2;
  void *v3;
  char v4;
  int prefsStyle;
  int onlyAllowedStyle;
  int v7;
  double v10;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_forceManualWhenRoaming
    && (-[PCConnectionManager persistentInterfaceManager](v2, "persistentInterfaceManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isWWANInHomeCountry"),
        v3,
        (v4 & 1) == 0))
  {
    v7 = 2;
  }
  else
  {
    prefsStyle = v2->_prefsStyle;
    if (v2->_onlyAllowedStyleSet && (onlyAllowedStyle = v2->_onlyAllowedStyle, prefsStyle != onlyAllowedStyle))
    {
      v7 = 2;
      if (!prefsStyle && onlyAllowedStyle == 1)
      {
        -[PCConnectionManager pollingInterval](v2, "pollingInterval");
        if (v10 > -2.22044605e-16)
        {
          v7 = 1;
          goto LABEL_15;
        }
      }
    }
    else
    {
      v7 = v2->_prefsStyle;
    }
    if (v2->_pollingIntervalOverrideSet && v7 == 2)
    {
      if (v2->_pollingIntervalOverride > -2.22044605e-16)
        v7 = 1;
      else
        v7 = 2;
    }
  }
LABEL_15:
  objc_sync_exit(v2);

  return v7;
}

- (id)_stringForAction:(int)a3
{
  if (a3 > 6)
    return CFSTR("unknown action");
  else
    return off_1E8743458[a3];
}

- (void)_resolveStateWithAction:(int)a3
{
  unsigned int v3;

  if (a3 >= 5)
  {
    if ((a3 - 5) <= 1)
    {
      if (self->_isInReconnectMode)
        v3 = self->_reconnectIteration + 1;
      else
        v3 = 1;
      self->_isInReconnectMode = 1;
      self->_reconnectIteration = v3;
      self->_reconnectWithKeepAliveDelay = a3 == 6;
    }
  }
  else
  {
    self->_isInReconnectMode = 0;
  }
}

- (void)_releasePowerAssertion
{
  OUTLINED_FUNCTION_0(&dword_1CBC1B000, a2, a3, "Unable to release power assertion. IOPMAssertionRelease() returned %#x.", a5, a6, a7, a8, 0);
}

- (void)_clearTimers
{
  -[PCConnectionManager _clearTimersReleasingPowerAssertion:](self, "_clearTimersReleasingPowerAssertion:", !self->_inCallback);
}

- (void)setUsingServerStatsAggressively:(BOOL)a3
{
  _BOOL8 v3;
  PCConnectionManager *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  PCConnectionManager *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("NO");
    v10 = 138412802;
    v11 = v4;
    v12 = 2112;
    if (v3)
      v8 = CFSTR("YES");
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting usingServerStatsAggressively for %@ to %@", (uint8_t *)&v10, 0x20u);

  }
  -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsingServerStatsAggressively:", v3);

  objc_sync_exit(v4);
}

- (void)setServerStatsMinKeepAliveInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  PCConnectionManager *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats min keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);

  }
  -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerStatsMinKeepAliveInterval:", a3);

  objc_sync_exit(v4);
}

- (void)setServerStatsExpectedKeepAliveInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  PCConnectionManager *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats expected keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);

  }
  -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerStatsExpectedKeepAliveInterval:", a3);

  objc_sync_exit(v4);
}

- (void)setServerStatsMaxKeepAliveInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  PCConnectionManager *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_logObject;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting server stats max keep alive interval for %@ to %g", (uint8_t *)&v8, 0x20u);

  }
  -[PCConnectionManager _growthAlgorithmOnInterface:](v4, "_growthAlgorithmOnInterface:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerStatsMaxKeepAliveInterval:", a3);

  objc_sync_exit(v4);
}

- (id)_growthAlgorithmOnInterface:(int64_t)a3
{
  PCGrowthAlgorithm *v5;
  NSObject *logObject;
  int v8;
  PCConnectionManager *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v5 = self->_wifiGrowthAlgorithm[self->_currentAddressFamily];
    return v5;
  }
  if (a3 == 1)
  {
    v5 = self->_wwanGrowthAlgorithm[self->_currentAddressFamily];
    return v5;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Asked to get growth algorithm with invalid interface %ld", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

- (void)setCurrentAddressFamily:(int)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentAddressFamily = a3;
  objc_sync_exit(obj);

}

+ (Class)growthAlgorithmClass
{
  return (Class)objc_opt_class();
}

- (id)_initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 delegateQueue:(id)a7 serviceIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  char *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  char v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  const char *v64;
  id v65;
  void *v66;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD handler[4];
  id v76;
  objc_super v77;
  uint8_t buf[4];
  char *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v77.receiver = self;
  v77.super_class = (Class)PCConnectionManager;
  v18 = -[PCConnectionManager init](&v77, sel_init);
  if (!v18)
    goto LABEL_16;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PCConnectionManager.m"), 121, CFSTR("delegate must not be nil"));

    if (v17)
      goto LABEL_4;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PCConnectionManager.m"), 122, CFSTR("serviceIdentifer must not be nil"));

    goto LABEL_4;
  }
  if (!v17)
    goto LABEL_18;
LABEL_4:
  v19 = objc_retainAutorelease(v17);
  +[PCLog logWithCategory:](PCLog, "logWithCategory:", objc_msgSend(v19, "UTF8String"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v18 + 11);
  *((_QWORD *)v18 + 11) = v20;

  *((_QWORD *)v18 + 21) = 0;
  *((_QWORD *)v18 + 7) = a4;
  *((_DWORD *)v18 + 2) = a3;
  objc_storeWeak((id *)v18 + 2, v15);
  v22 = objc_msgSend(v19, "copy");
  v23 = (void *)*((_QWORD *)v18 + 3);
  *((_QWORD *)v18 + 3) = v22;

  *((_QWORD *)v18 + 8) = a5;
  *((_DWORD *)v18 + 82) = 0;
  if (v16)
  {
    v24 = v16;
    v25 = (void *)*((_QWORD *)v18 + 10);
    *((_QWORD *)v18 + 10) = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v26 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v18 + 9);
    *((_QWORD *)v18 + 9) = v26;
  }
  v72 = v15;

  *((_DWORD *)v18 + 40) = 0;
  v27 = *((_QWORD *)v18 + 11);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *((_QWORD *)v18 + 3);
    v29 = *((_QWORD *)v18 + 7);
    *(_DWORD *)buf = 138412802;
    v79 = v18;
    v80 = 2112;
    v81 = v28;
    v82 = 2048;
    v83 = v29;
    _os_log_impl(&dword_1CBC1B000, v27, OS_LOG_TYPE_DEFAULT, "Creating PCManager %@ with identifier %@ and interfaceIdentifier %ld", buf, 0x20u);
  }
  v70 = v17;
  v71 = v16;
  notify_register_check("PCPushIsConnectedToken", (int *)v18 + 63);
  if (!*((_QWORD *)v18 + 7))
    goto LABEL_13;
  v30 = 0;
  v31 = v18 + 96;
  v32 = 1;
  do
  {
    v33 = v32;
    objc_msgSend(v18, "_getCachedWWANKeepAliveIntervalForAddressFamily:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = *((_QWORD *)v18 + 3);
    objc_msgSend(v18, "_stringForAddressFamily:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-%@"), v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "_stringForAddressFamily:", v30);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("WWAN growth algorithm-%@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "growthAlgorithmClass")), "initWithCacheInfo:loggingIdentifier:algorithmName:", v34, v38, v41);
    v43 = *(void **)&v31[8 * v30];
    *(_QWORD *)&v31[8 * v30] = v42;

    objc_msgSend(*(id *)&v31[8 * v30], "setSignalAvoidanceRange:", 1680.0, 240.0);
    v32 = 0;
    v30 = 1;
  }
  while ((v33 & 1) != 0);
  if (*((_QWORD *)v18 + 7) != 1)
  {
LABEL_13:
    v44 = 0;
    v45 = v18 + 112;
    v46 = 1;
    do
    {
      v47 = v46;
      v48 = (void *)MEMORY[0x1E0CB3940];
      v49 = *((_QWORD *)v18 + 3);
      objc_msgSend(v18, "_stringForAddressFamily:", v44);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@-%@"), v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "_stringForAddressFamily:", v44);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("WiFi growth algorithm-%@"), v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "growthAlgorithmClass")), "initWithCacheInfo:loggingIdentifier:algorithmName:", 0, v51, v54);
      v56 = *(void **)&v45[8 * v44];
      *(_QWORD *)&v45[8 * v44] = v55;

      objc_msgSend(*(id *)&v45[8 * v44], "setMaximumKeepAliveInterval:", 1800.0);
      v46 = 0;
      v44 = 1;
    }
    while ((v47 & 1) != 0);
  }
  v57 = dispatch_queue_create("PCConnectionManager-noteQueue", 0);
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addDelegate:queue:", v18, v57);

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addDelegate:queue:", v18, v57);

  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v18);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke;
  handler[3] = &unk_1E87433F0;
  v62 = v60;
  v76 = v62;
  notify_register_dispatch("PCPersistentTimerGuidanceNotification", (int *)v18 + 62, v57, handler);
  objc_msgSend(v18, "persistentInterfaceManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addDelegate:queue:", v18, v57);

  v64 = (const char *)-[__CFString cStringUsingEncoding:](objc_retainAutorelease(CFSTR("PCPreferencesDidChangeNotification")), "cStringUsingEncoding:", 4);
  v73[0] = v61;
  v73[1] = 3221225472;
  v73[2] = __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke_2;
  v73[3] = &unk_1E87433F0;
  v74 = v62;
  v65 = v62;
  notify_register_dispatch(v64, (int *)v18 + 64, v57, v73);
  objc_msgSend(v18, "_loadPreferencesGeneratingEvent:", 0);
  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addDelegate:", v18);

  v16 = v71;
  v15 = v72;
  v17 = v70;
LABEL_16:

  return v18;
}

void __126__PCConnectionManager__initWithConnectionClass_interfaceIdentifier_guidancePriority_delegate_delegateQueue_serviceIdentifier___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_preferencesChanged");

}

- (void)carrierBundleDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PCConnectionManager_carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E8743348;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __45__PCConnectionManager_carrierBundleDidChange__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "interfaceIdentifier");
  if (result)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "%@ carrier bundle changed", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_preferencesChanged");
  }
  return result;
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 delegateQueue:(id)a5 serviceIdentifier:(id)a6
{
  return (PCConnectionManager *)-[PCConnectionManager _initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:delegateQueue:serviceIdentifier:](self, "_initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:delegateQueue:serviceIdentifier:", *(_QWORD *)&a3, 2, -1, a4, a5, a6);
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 interfaceIdentifier:(int64_t)a4 guidancePriority:(unint64_t)a5 delegate:(id)a6 serviceIdentifier:(id)a7
{
  return (PCConnectionManager *)-[PCConnectionManager _initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:delegateQueue:serviceIdentifier:](self, "_initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:delegateQueue:serviceIdentifier:", *(_QWORD *)&a3, a4, a5, a6, 0, a7);
}

- (PCConnectionManager)initWithConnectionClass:(int)a3 delegate:(id)a4 serviceIdentifier:(id)a5
{
  return -[PCConnectionManager initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:serviceIdentifier:](self, "initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:serviceIdentifier:", *(_QWORD *)&a3, 2, -1, a4, a5);
}

- (void)setDelegate:(id)a3
{
  id v4;
  PCConnectionManager *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (PCConnectionManagerDelegate)delegate
{
  PCConnectionManager *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (PCConnectionManagerDelegate *)WeakRetained;
}

- (void)setDuetIdentifier:(id)a3
{
  NSString *v4;
  PCConnectionManager *v5;
  NSObject *logObject;
  NSString *duetIdentifier;
  uint64_t v8;
  NSString *v9;
  int v10;
  PCConnectionManager *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_duetIdentifier != v4)
  {
    logObject = v5->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      duetIdentifier = v5->_duetIdentifier;
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = duetIdentifier;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Changing duetIdentifier from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    v8 = -[NSString copy](v4, "copy");
    v9 = v5->_duetIdentifier;
    v5->_duetIdentifier = (NSString *)v8;

  }
  objc_sync_exit(v5);

}

- (NSString)duetIdentifier
{
  PCConnectionManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSString copy](v2->_duetIdentifier, "copy");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  PCGrowthAlgorithm *lastScheduledGrowthAlgorithm;
  void *v7;
  objc_super v8;

  -[PCConnectionManager _clearTimers](self, "_clearTimers");
  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableWiFiAutoAssociation:forDelegate:", 0, self);
  objc_msgSend(v3, "enableWakeOnWiFi:forDelegate:", 0, self);
  objc_msgSend(v3, "removeDelegate:", self);
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:", self);

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", self);

  lastScheduledGrowthAlgorithm = self->_lastScheduledGrowthAlgorithm;
  self->_lastScheduledGrowthAlgorithm = 0;

  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDelegate:", self);

  notify_cancel(self->_timerGuidanceToken);
  notify_cancel(self->_pushIsConnectedToken);
  notify_cancel(self->_prefsChangedToken);

  v8.receiver = self;
  v8.super_class = (Class)PCConnectionManager;
  -[PCConnectionManager dealloc](&v8, sel_dealloc);
}

- (void)_preferencesChanged
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PCConnectionManager _loadPreferencesGeneratingEvent:](obj, "_loadPreferencesGeneratingEvent:", 1);
  objc_sync_exit(obj);

}

- (void)_loadPreferencesGeneratingEvent:(BOOL)a3
{
  _BOOL4 v3;
  PCConnectionManager *v4;
  NSObject *logObject;
  int v6;
  double defaultPollingInterval;
  unsigned int ForceManualWhenRoamingForMCCAccount;
  int GlobalMCCForceManualWhenRoaming;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  CFIndex AppIntegerValue;
  double v34;
  NSObject *v35;
  CFIndex v36;
  double v37;
  NSObject *v38;
  BOOL v39;
  char v40;
  uint64_t v41;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "_loadPreferencesGeneratingEvent", buf, 2u);
  }
  v6 = -[PCConnectionManager currentStyle](v4, "currentStyle");
  defaultPollingInterval = v4->_defaultPollingInterval;
  v4->_prefsStyle = PCSettingsGetStyle(v4->_connectionClass, (const __CFString *)v4->_serviceIdentifier);
  v4->_defaultPollingInterval = (double)(int)PCSettingsGetPollInterval(v4->_connectionClass, (const __CFString *)v4->_serviceIdentifier);
  if (v4->_connectionClass == 1)
  {
    ForceManualWhenRoamingForMCCAccount = PCSettingsGetForceManualWhenRoamingForMCCAccount((const __CFString *)v4->_serviceIdentifier);
    GlobalMCCForceManualWhenRoaming = PCSettingsGetGlobalMCCForceManualWhenRoaming();
    v10 = v4->_logObject;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (ForceManualWhenRoamingForMCCAccount)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v44 = (const __CFString *)v4;
      v46 = *(double *)&v12;
      v45 = 2112;
      if (GlobalMCCForceManualWhenRoaming)
        v11 = CFSTR("YES");
      v47 = 2112;
      v48 = v11;
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "%@ Loading forceManualWhenRoaming: accountSetting %@  globalSetting %@", buf, 0x20u);
    }
    v4->_forceManualWhenRoaming = (ForceManualWhenRoamingForMCCAccount | GlobalMCCForceManualWhenRoaming) != 0;
  }
  else
  {
    v4->_forceManualWhenRoaming = 0;
  }
  -[PCConnectionManager _stringForStyle:](v4, "_stringForStyle:", v4->_prefsStyle);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v4->_logObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v4->_defaultPollingInterval / 60.0;
    *(_DWORD *)buf = 138412546;
    v44 = v13;
    v45 = 2048;
    v46 = v15;
    _os_log_impl(&dword_1CBC1B000, v14, OS_LOG_TYPE_DEFAULT, "Loaded preferences. Style is %@ and default poll interval is %g minutes.", buf, 0x16u);
  }
  if (v4->_forceManualWhenRoaming)
  {
    v16 = v4->_logObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "Forcing manual when roaming.", buf, 2u);
    }
  }
  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyValueFromPushBundleForKey:error:", CFSTR("PCForcedMinimumHBI"), 0);

  v19 = objc_msgSend(v18, "integerValue");
  if (v18 && v19 >= 1)
  {
    v20 = (double)v19;
    v21 = v4->_logObject;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v44 = *(const __CFString **)&v20;
      _os_log_impl(&dword_1CBC1B000, v21, OS_LOG_TYPE_DEFAULT, "Carrier bundle override for minimum HBI set. Setting minimum keep alive interval to %g seconds.", buf, 0xCu);
    }
    -[PCConnectionManager _setMinimumKeepAliveInterval:onInterface:](v4, "_setMinimumKeepAliveInterval:onInterface:", 1, v20);
  }

  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyValueFromPushBundleForKey:error:", CFSTR("PCForcedMaximumHBI"), 0);

  v24 = objc_msgSend(v23, "integerValue");
  if (v23 && v24 >= 1)
  {
    v25 = (double)v24;
    v26 = v4->_logObject;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v44 = *(const __CFString **)&v25;
      _os_log_impl(&dword_1CBC1B000, v26, OS_LOG_TYPE_DEFAULT, "Carrier bundle override for maximum HBI set. Setting maximum keep alive interval to %g seconds.", buf, 0xCu);
    }
    -[PCConnectionManager _setMaximumKeepAliveInterval:onInterface:](v4, "_setMaximumKeepAliveInterval:onInterface:", 1, v25);
  }

  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copyValueFromPushBundleForKey:error:", CFSTR("PCAllowMinimumIntervalFallback"), 0);

  v29 = objc_msgSend(v28, "BOOLValue");
  if (v28)
  {
    v30 = v29;
    v31 = v4->_logObject;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = CFSTR("NO");
      if ((_DWORD)v30)
        v32 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v44 = v32;
      _os_log_impl(&dword_1CBC1B000, v31, OS_LOG_TYPE_DEFAULT, "Operator bundle set PCAllowMinimumIntervalFallback to %@", buf, 0xCu);
    }
    -[PCConnectionManager setOperatorMinimumIntervalFallbackAllowed:](v4, "setOperatorMinimumIntervalFallbackAllowed:", v30);
  }
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PCForceDemoMaxHBI"), CFSTR("com.apple.persistentconnection"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppIntegerValue >= 1)
  {
    v34 = (double)AppIntegerValue;
    v35 = v4->_logObject;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = CFSTR("PCForceDemoMaxHBI");
      v45 = 2048;
      v46 = v34;
      _os_log_impl(&dword_1CBC1B000, v35, OS_LOG_TYPE_DEFAULT, "%@ set. Setting maximum keep alive interval to %g seconds for demo mode.", buf, 0x16u);
    }
    -[PCConnectionManager setMaximumKeepAliveInterval:](v4, "setMaximumKeepAliveInterval:", v34);
  }
  v36 = CFPreferencesGetAppIntegerValue(CFSTR("PCForceMinHBI"), CFSTR("com.apple.persistentconnection"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v36 >= 1)
  {
    v37 = (double)v36;
    v38 = v4->_logObject;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = CFSTR("PCForceMinHBI");
      v45 = 2048;
      v46 = v37;
      _os_log_impl(&dword_1CBC1B000, v38, OS_LOG_TYPE_DEFAULT, "%@ set. Setting minimum keep alive interval to %g seconds for demo mode.", buf, 0x16u);
    }
    -[PCConnectionManager setMinimumKeepAliveInterval:](v4, "setMinimumKeepAliveInterval:", v37);
  }
  -[PCConnectionManager _adjustInterfaceAssertions](v4, "_adjustInterfaceAssertions");
  v39 = (!v4->_pollingIntervalOverrideSet || fabs(v4->_pollingIntervalOverride) >= 2.22044605e-16)
     && fabs(v4->_defaultPollingInterval) >= 2.22044605e-16;
  v40 = -[PCConnectionManager currentStyle](v4, "currentStyle") != 1 || v39;
  if ((v40 & 1) != 0)
    -[PCConnectionManager _deregisterForDeviceConditionsNotifications](v4, "_deregisterForDeviceConditionsNotifications");
  else
    -[PCConnectionManager _registerForDeviceConditionsNotifications](v4, "_registerForDeviceConditionsNotifications");
  if (v4->_isRunning && v3)
  {
    if (v6 != -[PCConnectionManager currentStyle](v4, "currentStyle"))
    {
      -[PCConnectionManager _clearTimers](v4, "_clearTimers");
      v41 = 5;
      goto LABEL_63;
    }
    if (v6 == 1
      && !v4->_isInReconnectMode
      && defaultPollingInterval != v4->_defaultPollingInterval
      && !v4->_pollingIntervalOverrideSet)
    {
      -[PCConnectionManager _clearTimers](v4, "_clearTimers");
      v41 = 3;
LABEL_63:
      -[PCConnectionManager _calloutWithEvent:context:](v4, "_calloutWithEvent:context:", v41, 0);
    }
  }

  objc_sync_exit(v4);
}

- (void)_registerForDeviceConditionsNotifications
{
  NSObject *logObject;
  id duetContextRegistration;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  PCConnectionManager *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_duetContextRegistration)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      duetContextRegistration = self->_duetContextRegistration;
      *(_DWORD *)buf = 138412547;
      v24 = self;
      v25 = 2113;
      v26 = duetContextRegistration;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ is already registered for contextual change notifications, {Registration: %{private}@}", buf, 0x16u);
    }
  }
  v5 = (void *)CUTWeakLinkClass();
  v6 = (void *)CUTWeakLinkClass();
  v7 = (void *)CUTWeakLinkClass();
  v8 = (void *)CUTWeakLinkClass();
  objc_msgSend(v5, "userContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "keyPathForWiFiConnectionQuality");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "keyPathForWiFiConnectionQuality");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(v10, v12);

    }
    objc_msgSend(v6, "keyPathForThermalPressureLevel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "keyPathForThermalPressureLevel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(v10, v14);

    }
    objc_msgSend(v6, "keyPathForPluginStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6, "keyPathForPluginStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(v10, v16);

    }
    objc_msgSend(v6, "keyPathForEnergyBudgetRemainingStatus");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "keyPathForEnergyBudgetRemainingStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(v10, v18);

    }
  }
  objc_msgSend(v7, "predicateForChangeAtKeyPaths:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__PCConnectionManager__registerForDeviceConditionsNotifications__block_invoke;
  v22[3] = &unk_1E8743418;
  v22[4] = self;
  objc_msgSend(v8, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.pc.automatictimer.goodconditions"), v19, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_duetContextRegistration;
  self->_duetContextRegistration = v20;

  objc_msgSend(v9, "registerCallback:", self->_duetContextRegistration);
  -[PCConnectionManager _handleDeviceConditionChangeCallback](self, "_handleDeviceConditionChangeCallback");

}

uint64_t __64__PCConnectionManager__registerForDeviceConditionsNotifications__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleDeviceConditionChangeCallback");
  return 1;
}

- (void)_deregisterForDeviceConditionsNotifications
{
  NSObject *logObject;
  id duetContextRegistration;
  void *v5;
  void *v6;
  id v7;
  int v8;
  PCConnectionManager *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_duetContextRegistration)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      duetContextRegistration = self->_duetContextRegistration;
      v8 = 138412547;
      v9 = self;
      v10 = 2113;
      v11 = duetContextRegistration;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ request to deregister contextual change notifications {Registration: %{private}@}", (uint8_t *)&v8, 0x16u);
    }
    v5 = (void *)CUTWeakLinkClass();
    CUTWeakLinkClass();
    objc_msgSend(v5, "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "deregisterCallback:", self->_duetContextRegistration);
    v7 = self->_duetContextRegistration;
    self->_duetContextRegistration = 0;

  }
}

- (void)_handleDeviceConditionChangeCallback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  _BOOL4 v14;
  NSObject *logObject;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  PCConnectionManager *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CUTWeakLinkClass();
  v4 = (void *)CUTWeakLinkClass();
  objc_msgSend(v3, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPathForThermalPressureLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "keyPathForWiFiConnectionQuality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "keyPathForPluginStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = (v10 > 49) & ~(_BYTE)v3 & v13;
  if (self->_deviceUnderGoodCondition != v14)
  {
    self->_deviceUnderGoodCondition = v14;
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceUnderGoodCondition)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = logObject;
      objc_msgSend(v4, "keyPathForThermalPressureLevel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyPathForWiFiConnectionQuality");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyPathForPluginStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413314;
      v25 = self;
      v26 = 2114;
      v27 = v16;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v21;
      v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_1CBC1B000, v17, OS_LOG_TYPE_DEFAULT, "%@ Query duet context for device condition, {GoodCondition:%{public}@, thermalPressureLevel:%{public}@, wifiConnectionQuality:%{public}@, pluggedIn:%{public}@}", (uint8_t *)&v24, 0x34u);

    }
    -[PCConnectionManager _processDeviceConditionChanges](self, "_processDeviceConditionChanges");
  }

}

- (void)_processDeviceConditionChanges
{
  int v2;
  BOOL v3;
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[PCConnectionManager currentStyle](obj, "currentStyle");
  v3 = (!obj->_pollingIntervalOverrideSet || fabs(obj->_pollingIntervalOverride) >= 2.22044605e-16)
    && fabs(obj->_defaultPollingInterval) >= 2.22044605e-16;
  if (v2 == 1 && !v3)
  {
    if (!obj->_deviceUnderGoodCondition)
      -[PCConnectionManager _calloutWithEvent:context:](obj, "_calloutWithEvent:context:", 6, 0);
    if (obj->_isRunning)
    {
      if (obj->_deviceUnderGoodCondition)
        -[PCConnectionManager _setupTimerForPollForAdjustment:](obj, "_setupTimerForPollForAdjustment:", 0);
      else
        -[PCConnectionManager _pauseTimers](obj, "_pauseTimers");
    }
  }
  objc_sync_exit(obj);

}

- (void)setOnlyAllowedStyle:(int)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_onlyAllowedStyle = a3;
  obj->_onlyAllowedStyleSet = 1;
  -[PCConnectionManager _adjustInterfaceAssertions](obj, "_adjustInterfaceAssertions");
  objc_sync_exit(obj);

}

- (void)startManager
{
  uint64_t v2;
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[PCConnectionManager currentStyle](obj, "currentStyle"))
    v2 = 4;
  else
    v2 = 2;
  -[PCConnectionManager resumeManagerWithAction:](obj, "resumeManagerWithAction:", v2);
  objc_sync_exit(obj);

}

- (void)resumeManagerWithAction:(int)a3
{
  -[PCConnectionManager resumeManagerWithAction:forceGrow:](self, "resumeManagerWithAction:forceGrow:", *(_QWORD *)&a3, 0);
}

uint64_t (*__57__PCConnectionManager_resumeManagerWithAction_forceGrow___block_invoke())(_QWORD, _QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  resumeManagerWithAction_forceGrow___PLLogRegisteredEvent = result;
  return result;
}

- (void)stopManager
{
  PCConnectionManager *v2;
  NSObject *logObject;
  uint8_t v4[16];

  v2 = self;
  objc_sync_enter(v2);
  logObject = v2->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "PCConnectionManager was stopped by client", v4, 2u);
  }
  -[PCConnectionManager _clearTimers](v2, "_clearTimers");
  objc_sync_exit(v2);

}

- (void)stopAndResetManager
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PCConnectionManager stopManager](obj, "stopManager");
  obj->_isInReconnectMode = 0;
  obj->_reconnectIteration = 0;
  objc_sync_exit(obj);

}

- (BOOL)isRunning
{
  PCConnectionManager *v2;
  BOOL isRunning;

  v2 = self;
  objc_sync_enter(v2);
  isRunning = v2->_isRunning;
  objc_sync_exit(v2);

  return isRunning;
}

- (double)minimumKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (void)setMinimumKeepAliveInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *logObject;
  uint64_t v6;
  char v7;
  char v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Setting minimum keep alive interval to %g", (uint8_t *)&v9, 0xCu);
  }
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    -[PCGrowthAlgorithm setMinimumKeepAliveInterval:](v4->_wwanGrowthAlgorithm[v6], "setMinimumKeepAliveInterval:", a3);
    -[PCGrowthAlgorithm setMinimumKeepAliveInterval:](v4->_wifiGrowthAlgorithm[v6], "setMinimumKeepAliveInterval:", a3);
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  objc_sync_exit(v4);

}

- (void)_setMinimumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4
{
  PCConnectionManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  PCConnectionManager *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_logObject;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](v6, "_growthAlgorithmOnInterface:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_1CBC1B000, v7, OS_LOG_TYPE_DEFAULT, "%@ Setting minimum keep alive interval for %@ to %g", (uint8_t *)&v10, 0x20u);

  }
  -[PCConnectionManager _growthAlgorithmOnInterface:](v6, "_growthAlgorithmOnInterface:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumKeepAliveInterval:", a3);

  objc_sync_exit(v6);
}

- (double)maximumKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (void)setMaximumKeepAliveInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *logObject;
  uint64_t v6;
  char v7;
  char v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Setting maximum keep alive interval to %g", (uint8_t *)&v9, 0xCu);
  }
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    -[PCGrowthAlgorithm setMaximumKeepAliveInterval:](v4->_wwanGrowthAlgorithm[v6], "setMaximumKeepAliveInterval:", a3);
    -[PCGrowthAlgorithm setMaximumKeepAliveInterval:](v4->_wifiGrowthAlgorithm[v6], "setMaximumKeepAliveInterval:", a3);
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  objc_sync_exit(v4);

}

- (void)_setMaximumKeepAliveInterval:(double)a3 onInterface:(int64_t)a4
{
  PCConnectionManager *v6;
  NSObject *logObject;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  int v14;
  PCConnectionManager *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  logObject = v6->_logObject;
  v8 = os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT);
  if (a4 < 2)
  {
    if (v8)
    {
      v14 = 138412802;
      v15 = v6;
      v16 = 2048;
      v17 = a4;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Setting maximum keep alive interval for %lu to %g", (uint8_t *)&v14, 0x20u);
    }
    v9 = 0;
    v10 = 112;
    if (a4 == 1)
      v10 = 96;
    v11 = (char *)v6 + v10;
    v12 = 1;
    do
    {
      v13 = v12;
      objc_msgSend(*(id *)&v11[8 * v9], "setMaximumKeepAliveInterval:", a3);
      v12 = 0;
      v9 = 1;
    }
    while ((v13 & 1) != 0);
  }
  else if (v8)
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Asked to set maximum keep alive interval on invalid interface %ld", (uint8_t *)&v14, 0x16u);
  }
  objc_sync_exit(v6);

}

- (double)serverStatsMaxKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _growthAlgorithmOnInterface:](v2, "_growthAlgorithmOnInterface:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverStatsMaxKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (double)serverStatsMinKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _growthAlgorithmOnInterface:](v2, "_growthAlgorithmOnInterface:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverStatsMinKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (double)serverStatsExpectedKeepAliveInterval
{
  PCConnectionManager *v2;
  void *v3;
  double v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _growthAlgorithmOnInterface:](v2, "_growthAlgorithmOnInterface:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverStatsExpectedKeepAliveInterval");
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)usingServerStatsAggressively
{
  PCConnectionManager *v2;
  void *v3;
  char v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PCConnectionManager _growthAlgorithmOnInterface:](v2, "_growthAlgorithmOnInterface:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usingServerStatsAggressively");

  objc_sync_exit(v2);
  return v4;
}

- (void)setKeepAliveOverrideOnInterface:(int64_t)a3 interval:(double)a4 timeout:(double)a5
{
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_interfaceIdentifier == a3)
  {
    -[PCConnectionManager _growthAlgorithmOnInterface:](self, "_growthAlgorithmOnInterface:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minimumKeepAliveInterval");
    v11 = v10;

    v15 = 0;
    v16 = 0;
    v12 = 112;
    if (a3 == 1)
    {
      v12 = 96;
      v13 = 104;
    }
    else
    {
      v13 = 120;
    }
    v15 = *(id *)((char *)&self->super.isa + v12);
    v16 = *(id *)((char *)&self->super.isa + v13);
    objc_msgSend(v15, "setMinimumKeepAliveInterval:", a4);
    objc_msgSend(v15, "setMaximumKeepAliveInterval:", v11);
    objc_msgSend(v15, "setLastSuccessfulKeepAliveInterval:", a4);
    objc_msgSend(v15, "setMinimumIntervalFallbackStateTimeout:", a5);
    objc_msgSend(v15, "setMinimumIntervalFallbackEnabled:", 1);
    objc_msgSend(v16, "setMinimumKeepAliveInterval:", a4);
    objc_msgSend(v16, "setMaximumKeepAliveInterval:", v11);
    objc_msgSend(v16, "setLastSuccessfulKeepAliveInterval:", a4);
    objc_msgSend(v16, "setMinimumIntervalFallbackStateTimeout:", a5);
    objc_msgSend(v16, "setMinimumIntervalFallbackEnabled:", 1);
    self->_minimumIntervalFallbackEnabled = 1;
    -[PCConnectionManager resumeManagerWithAction:forceGrow:](self, "resumeManagerWithAction:forceGrow:", 3, 0);
    -[PCConnectionManager resumeManagerWithAction:forceGrow:](self, "resumeManagerWithAction:forceGrow:", 1, 0);
    for (i = 8; i != -8; i -= 8)

  }
}

- (void)setNonCellularEarlyFireConstantInterval:(double)a3
{
  PCConnectionManager *v4;
  NSObject *logObject;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  logObject = v4->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Setting NonCellular early fire constant interval to %g", (uint8_t *)&v6, 0xCu);
  }
  v4->_nonCellularEarlyFireConstantInterval = a3;
  objc_sync_exit(v4);

}

- (BOOL)_isPushConnected
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_pushIsConnectedToken, &state64);
  return state64 != 0;
}

- (double)pollingInterval
{
  PCConnectionManager *v2;
  double pollingIntervalOverride;
  double defaultPollingInterval;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  defaultPollingInterval = v2->_defaultPollingInterval;
  pollingIntervalOverride = v2->_pollingIntervalOverride;
  if (fabs(pollingIntervalOverride) < 2.22044605e-16 && v2->_deviceUnderGoodCondition)
    pollingIntervalOverride = 3600.0;
  if (fabs(defaultPollingInterval) < 2.22044605e-16 && v2->_deviceUnderGoodCondition)
    defaultPollingInterval = 3600.0;
  if (!v2->_pollingIntervalOverrideSet)
  {
    if (defaultPollingInterval < 2.22044605e-16)
      goto LABEL_13;
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isInterfaceHistoricallyUsable") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isInterfaceHistoricallyUsable");

    }
    if ((-[PCConnectionManager _isPushConnected](v2, "_isPushConnected") & v6 & 1) != 0)
    {
LABEL_13:
      pollingIntervalOverride = defaultPollingInterval;
    }
    else
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isBadLinkQuality") & 1) != 0)
      {
        +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isBadLinkQuality");

        if (v10)
          v11 = 3600.0;
        else
          v11 = 1800.0;
      }
      else
      {

        v10 = 0;
        v11 = 1800.0;
      }
      if (defaultPollingInterval >= v11)
        pollingIntervalOverride = defaultPollingInterval;
      else
        pollingIntervalOverride = v11;
      v12 = v2->_logObject;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = -[PCConnectionManager _isPushConnected](v2, "_isPushConnected");
        v14 = CFSTR("NO");
        v18 = 138413314;
        if (v13)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v19 = v15;
        v20 = 2112;
        if (v6)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        v21 = v16;
        v22 = 2112;
        if (v10)
          v14 = CFSTR("YES");
        v23 = v14;
        v24 = 2048;
        v25 = defaultPollingInterval;
        v26 = 2048;
        v27 = v11;
        _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "Push is connected? %@  networkIsHistoricallyUsable? %@  isBadLQ? %@ -- choosing pollInterval = MAX(%g, %g)", (uint8_t *)&v18, 0x34u);
      }

    }
  }
  objc_sync_exit(v2);

  return pollingIntervalOverride;
}

- (void)setPollingIntervalOverride:(double)a3
{
  PCConnectionManager *v4;
  NSObject *logObject;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_pollingIntervalOverrideSet || v4->_pollingIntervalOverride != a3)
  {
    logObject = v4->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Setting polling interval override to %g", (uint8_t *)&v6, 0xCu);
    }
    v4->_pollingIntervalOverride = a3;
    v4->_pollingIntervalOverrideSet = 1;
  }
  objc_sync_exit(v4);

}

- (void)cancelPollingIntervalOverride
{
  PCConnectionManager *v2;
  NSObject *logObject;
  uint8_t v4[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_pollingIntervalOverrideSet)
  {
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Cacnceling polling interval override", v4, 2u);
    }
    v2->_pollingIntervalOverrideSet = 0;
  }
  objc_sync_exit(v2);

}

- (BOOL)shouldClientScheduleReconnectDueToFailure
{
  PCConnectionManager *v2;
  double Current;
  double lastReachableTime;
  double v5;
  NSObject *v6;
  void *v7;
  char *v8;
  NSObject *logObject;
  double lastResumeTime;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  NSObject *v18;
  const char *v19;
  int v21;
  const char *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  Current = CFAbsoluteTimeGetCurrent();
  lastReachableTime = v2->_lastReachableTime;
  if (lastReachableTime == 0.0)
    goto LABEL_29;
  v5 = Current - lastReachableTime;
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 >= 10.0)
  {
LABEL_29:
    if (v2->_isInReconnectMode)
    {
      logObject = v2->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Advising client to enter reconnect mode in response to a connection failure since currently in reconnect mode", (uint8_t *)&v21, 2u);
      }
      LOBYTE(v6) = 1;
    }
    else
    {
      lastResumeTime = v2->_lastResumeTime;
      if (-[PCConnectionManager currentStyle](v2, "currentStyle"))
      {
        -[PCConnectionManager pollingInterval](v2, "pollingInterval");
        v12 = v11;
      }
      else
      {
        -[PCConnectionManager _currentGrowthAlgorithm](v2, "_currentGrowthAlgorithm");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "minimumKeepAliveInterval");
        v12 = v14;

      }
      v15 = Current - lastResumeTime;
      v16 = fabs(v12);
      v17 = v15 < v12 + v2->_keepAliveGracePeriod + 15.0;
      if (v15 <= 2.22044605e-16)
        v17 = 0;
      if (v16 < 2.22044605e-16)
        v17 = 1;
      LODWORD(v6) = !v2->_hasStarted || v17;
      v18 = v2->_logObject;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = "issue a shrink";
        if ((_DWORD)v6)
          v19 = "enter reconnect mode";
        v21 = 136315394;
        v22 = v19;
        v23 = 2048;
        v24 = v15;
        _os_log_impl(&dword_1CBC1B000, v18, OS_LOG_TYPE_DEFAULT, "Advising client to %s in response to a connection failure after elapsed time from start %g seconds", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    v6 = v2->_logObject;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v2->_lastReachableTime);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v7);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1CBC1B000, v6, OS_LOG_TYPE_DEFAULT, "Advising client to not enter reconnect mode since the network just became reachable at %@", (uint8_t *)&v21, 0xCu);

    }
    LOBYTE(v6) = 0;
    v2->_lastReachableTime = 0.0;
  }
  objc_sync_exit(v2);

  return (char)v6;
}

- (void)setEnableNonCellularConnections:(BOOL)a3
{
  _BOOL4 v3;
  PCConnectionManager *v4;
  NSObject *logObject;
  const __CFString *v6;
  int v7;
  PCConnectionManager *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_enableNonCellularConnections != v3)
  {
    logObject = v4->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@: enableNonCellularConnections changed to %@", (uint8_t *)&v7, 0x16u);
    }
    v4->_enableNonCellularConnections = v3;
    -[PCConnectionManager _adjustInterfaceAssertions](v4, "_adjustInterfaceAssertions");
  }
  objc_sync_exit(v4);

}

- (BOOL)disableEarlyFire
{
  PCConnectionManager *v2;
  BOOL disableEarlyFire;

  v2 = self;
  objc_sync_enter(v2);
  disableEarlyFire = v2->_disableEarlyFire;
  objc_sync_exit(v2);

  return disableEarlyFire;
}

- (void)setDisableEarlyFire:(BOOL)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_disableEarlyFire = a3;
  objc_sync_exit(obj);

}

- (BOOL)minimumIntervalFallbackEnabled
{
  PCConnectionManager *v2;
  BOOL minimumIntervalFallbackEnabled;

  v2 = self;
  objc_sync_enter(v2);
  minimumIntervalFallbackEnabled = v2->_minimumIntervalFallbackEnabled;
  objc_sync_exit(v2);

  return minimumIntervalFallbackEnabled;
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_minimumIntervalFallbackEnabled = a3;
  -[PCConnectionManager _adjustMinimumIntervalFallback](obj, "_adjustMinimumIntervalFallback");
  objc_sync_exit(obj);

}

- (BOOL)operatorMinimumIntervalFallbackAllowed
{
  PCConnectionManager *v2;
  BOOL operatorMinimumIntervalFallbackAllowed;

  v2 = self;
  objc_sync_enter(v2);
  operatorMinimumIntervalFallbackAllowed = v2->_operatorMinimumIntervalFallbackAllowed;
  objc_sync_exit(v2);

  return operatorMinimumIntervalFallbackAllowed;
}

- (void)setOperatorMinimumIntervalFallbackAllowed:(BOOL)a3
{
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_operatorMinimumIntervalFallbackAllowed = a3;
  -[PCConnectionManager _adjustMinimumIntervalFallback](obj, "_adjustMinimumIntervalFallback");
  objc_sync_exit(obj);

}

- (void)_adjustMinimumIntervalFallback
{
  _BOOL8 v3;
  int64_t interfaceIdentifier;
  void *v5;
  id v6;

  v3 = self->_minimumIntervalFallbackEnabled && self->_operatorMinimumIntervalFallbackAllowed;
  interfaceIdentifier = self->_interfaceIdentifier;
  if (interfaceIdentifier == 1)
  {
    -[PCConnectionManager _currentGrowthAlgorithm](self, "_currentGrowthAlgorithm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumIntervalFallbackEnabled:", v3);

    interfaceIdentifier = self->_interfaceIdentifier;
  }
  if (!interfaceIdentifier)
  {
    -[PCConnectionManager _currentGrowthAlgorithm](self, "_currentGrowthAlgorithm");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumIntervalFallbackEnabled:", self->_minimumIntervalFallbackEnabled);

  }
}

- (int)currentAddressFamily
{
  PCConnectionManager *v2;
  int currentAddressFamily;

  v2 = self;
  objc_sync_enter(v2);
  currentAddressFamily = v2->_currentAddressFamily;
  objc_sync_exit(v2);

  return currentAddressFamily;
}

- (void)_setupTimerForPollForAdjustment:(BOOL)a3
{
  _BOOL4 v3;
  double v6;
  double v7;
  NSObject *logObject;
  double lastElapsedInterval;
  double v10;
  NSObject *v11;
  NSObject *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  const char *v25;
  id v26;
  int v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  NSObject *v32;
  const __CFString *v33;
  NSObject *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double Current;
  double v41;
  NSObject *v42;
  double v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  int v50;
  double lastScheduledIntervalTime;
  const __CFString *v52;
  NSObject *v53;
  NSObject *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  NSObject *v68;
  PCPersistentTimer *v69;
  PCPersistentTimer *intervalTimer;
  void *v71;
  int v72;
  NSObject *v73;
  double v74;
  PCPersistentTimer *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  NSObject *log;
  void *v81;
  uint8_t buf[4];
  PCConnectionManager *v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  double v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  const __CFString *v101;
  uint64_t v102;

  v3 = a3;
  v102 = *MEMORY[0x1E0C80C00];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PCConnectionManager.m"), 1166, CFSTR("timers already exist"));

  }
  -[PCConnectionManager pollingInterval](self, "pollingInterval");
  v7 = v6;
  if (v6 < 2.22044605e-16)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      v84 = 2050;
      v85 = v7;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ Unable to setup a poll timer with {pollingInterval: %{public}f}, start when on power", buf, 0x16u);
    }
    return;
  }
  lastElapsedInterval = self->_lastElapsedInterval;
  if (lastElapsedInterval > 2.22044605e-16)
  {
    v10 = v7 - lastElapsedInterval;
    v7 = v10 >= 0.0 ? v10 : 0.0;
    v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[PCConnectionManager pollingInterval](self, "pollingInterval");
      v13 = self->_lastElapsedInterval;
      *(_DWORD *)buf = 138413058;
      v83 = self;
      v84 = 2048;
      v85 = v14;
      v86 = 2048;
      v87 = v7;
      v88 = 2048;
      v89 = v13;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%@ adjust polling interval {pollingInterval: %f, adjustedPollingInterval: %f, lastElapsedInterval: %f}.", buf, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_timerGuidance);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15
    && (objc_msgSend(v15, "timeIntervalSinceNow"), v17 > 2.22044605e-16)
    && (objc_msgSend(v16, "timeIntervalSinceNow"), v18 < 7200.0))
  {
    objc_msgSend(v16, "timeIntervalSinceNow");
    v20 = v19 > (v7 + v7) / 3.0;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastScheduledIntervalTime);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceNow");
  v23 = v22;
  if (v7 >= 2.22044605e-16)
  {
    if (v20)
    {
      v26 = v16;
      if (v3)
      {
        v27 = 0;
        v28 = CFAbsoluteTimeGetCurrent() - self->_lastResumeTime;
        v29 = v7 + v7;
        LODWORD(v30) = v28 > v7 + v7;
        v31 = 0.0;
        if (v23 > 2.22044605e-16 && v23 < v29 && v28 <= v29)
        {
          LODWORD(v30) = 0;
          v31 = self->_lastScheduledIntervalTime + -120.0;
          v27 = 1;
        }
      }
      else
      {
        if (v23 <= 2.22044605e-16 || v23 >= v7 || fabs(self->_lastElapsedInterval) >= 2.22044605e-16)
        {
          Current = CFAbsoluteTimeGetCurrent();
          v27 = 0;
        }
        else
        {
          Current = self->_lastScheduledIntervalTime;
          v27 = 1;
        }
        LODWORD(v30) = 0;
        v31 = v7 + Current + -120.0;
      }
      v42 = self->_logObject;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        log = v42;
        PCStringFromDate(v26);
        v81 = v21;
        v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (v3)
          *(double *)&v44 = COERCE_DOUBLE(CFSTR("YES"));
        else
          *(double *)&v44 = COERCE_DOUBLE(CFSTR("NO"));
        v78 = v44;
        if (v27)
          *(double *)&v45 = COERCE_DOUBLE(CFSTR("YES"));
        else
          *(double *)&v45 = COERCE_DOUBLE(CFSTR("NO"));
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastResumeTime);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        PCStringFromDate(v79);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = CFAbsoluteTimeGetCurrent() - self->_lastResumeTime;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastScheduledIntervalTime);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        PCStringFromDate(v48);
        *(double *)&v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v50 = (int)v30;
        v30 = (void *)v49;
        lastScheduledIntervalTime = self->_lastScheduledIntervalTime;
        v52 = CFSTR("YES");
        if (!v50)
          v52 = CFSTR("NO");
        *(_DWORD *)buf = 138414594;
        v83 = self;
        v84 = 2112;
        v85 = v43;
        v86 = 2112;
        v87 = *(double *)&v78;
        v88 = 2112;
        v89 = *(double *)&v45;
        v90 = 2112;
        v91 = v46;
        v92 = 2048;
        v93 = v47;
        v94 = 2112;
        v95 = *(double *)&v49;
        v96 = 2048;
        v97 = lastScheduledIntervalTime;
        v98 = 2048;
        v99 = v23;
        v100 = 2112;
        v101 = v52;
        _os_log_impl(&dword_1CBC1B000, log, OS_LOG_TYPE_DEFAULT, "%@ scheduling the next poll to align with the next push keepAlive date (%@). isAdjustment %@  isLastTimeIntervalValid? %@, lastResumeTime %@ (%f), lastScheduledIntervalTime (%@) %f, timeDiff %f. Should fire immediately? %@", buf, 0x66u);

        LOBYTE(v30) = v50;
        v21 = v81;

      }
      if ((v30 & 1) != 0)
      {
        v7 = 0.0;
      }
      else
      {
        v53 = self->_logObject;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v53;
          objc_msgSend(v26, "timeIntervalSinceNow");
          v56 = v55;
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v31);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          PCStringFromDate(v57);
          v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138413058;
          v83 = self;
          v84 = 2048;
          v85 = v56;
          v86 = 2048;
          v87 = v7;
          v88 = 2112;
          v89 = v58;
          _os_log_impl(&dword_1CBC1B000, v54, OS_LOG_TYPE_DEFAULT, "%@ nextPollDate timeIntervalSinceNow %f  pollingInterval %f  earliestAllowableFire %@", buf, 0x2Au);

        }
        objc_msgSend(v26, "timeIntervalSinceNow");
        if (v59 > v7 + 120.0)
        {
          while (1)
          {
            objc_msgSend(v26, "timeIntervalSinceReferenceDate");
            if (v60 - v7 <= v31)
              break;
            objc_msgSend(v26, "dateByAddingTimeInterval:", -v7);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = self->_logObject;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = v62;
              PCStringFromDate(v61);
              v64 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              objc_msgSend(v61, "timeIntervalSinceNow");
              *(_DWORD *)buf = 138412802;
              v83 = self;
              v84 = 2112;
              v85 = v64;
              v86 = 2048;
              v87 = v65;
              _os_log_impl(&dword_1CBC1B000, v63, OS_LOG_TYPE_DEFAULT, "%@ nextPollDate whittled down by a polling interval to %@, %f", buf, 0x20u);

            }
            objc_msgSend(v61, "timeIntervalSinceNow");
            v26 = v61;
            if (v66 <= v7 + 120.0)
              goto LABEL_73;
          }
        }
        v61 = v26;
LABEL_73:
        objc_msgSend(v61, "timeIntervalSinceNow");
        v7 = v67;
        v26 = v61;
      }
      v68 = self->_logObject;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v83 = self;
        v84 = 2048;
        v85 = v7;
        _os_log_impl(&dword_1CBC1B000, v68, OS_LOG_TYPE_DEFAULT, "%@ using nextPollInterval = %f.", buf, 0x16u);
      }

      goto LABEL_77;
    }
    v32 = self->_logObject;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        *(double *)&v33 = COERCE_DOUBLE(CFSTR("YES"));
      else
        *(double *)&v33 = COERCE_DOUBLE(CFSTR("NO"));
      v34 = v32;
      PCStringFromDate(v16);
      v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "timeIntervalSinceNow");
      v37 = v36;
      PCStringFromDate(v21);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v83 = self;
      v84 = 2112;
      v85 = *(double *)&v33;
      v86 = 2112;
      v87 = v35;
      v88 = 2048;
      v89 = v37;
      v90 = 2112;
      v91 = v38;
      v92 = 2048;
      v93 = v23;
      v94 = 2048;
      v95 = v7;
      _os_log_impl(&dword_1CBC1B000, v34, OS_LOG_TYPE_DEFAULT, "%@ scheduling next poll - isAdjustment %@. PushDate %@ is not valid - timeIntervalSinceNow %f. Last scheduled fire date %@. TimeDiff = %f, pollingInterval %f", buf, 0x48u);

    }
    if (v3)
    {
      if (v23 < v7 + v7 && v23 > 2.22044605e-16)
        v7 = v23;
    }
    else if (v23 > 2.22044605e-16 && v23 < v7 + -120.0)
    {
      v41 = -0.0;
      if (fabs(self->_lastElapsedInterval) < 2.22044605e-16)
        v41 = v23;
      v7 = v7 + v41;
    }
    v24 = self->_logObject;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      v84 = 2048;
      v85 = v7;
      v25 = "%@ using nextPollInterval = %f.";
      goto LABEL_49;
    }
  }
  else
  {
    v24 = self->_logObject;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = self;
      v84 = 2048;
      v85 = v7;
      v25 = "%@ firing immediately {nextPollInterval:%f}.";
LABEL_49:
      _os_log_impl(&dword_1CBC1B000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
    }
  }
LABEL_77:
  v69 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCPersistentTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", self->_serviceIdentifier, self, sel__intervalTimerFired, 0, v7);
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v69;

  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "areAllNetworkInterfacesDisabled");

  if (v72)
  {
    v73 = self->_logObject;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC1B000, v73, OS_LOG_TYPE_DEFAULT, "All network interfaces are disabled, so not scheduling any wakes in polling mode", buf, 2u);
    }
    -[PCPersistentTimer setDisableSystemWaking:](self->_intervalTimer, "setDisableSystemWaking:", 1);
  }
  -[PCPersistentTimer fireTime](self->_intervalTimer, "fireTime");
  self->_lastScheduledIntervalTime = v74;
  v75 = self->_intervalTimer;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v75, "scheduleInRunLoop:", v76);

  self->_lastStartTime = CFAbsoluteTimeGetCurrent();
}

- (void)_setupKeepAliveForReconnect
{
  unint64_t v2;
  double v5;
  void *v6;
  NSObject *logObject;
  double v8;
  const char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  unsigned int reconnectIteration;
  PCPersistentTimer *v17;
  PCPersistentTimer *intervalTimer;
  double v19;
  PCPersistentTimer *v20;
  void *v21;
  NSObject *v22;
  PCPersistentTimer *v23;
  PCPersistentTimer *v24;
  PCPersistentTimer *reconnectWakeTimer;
  PCPersistentTimer *v26;
  void *v27;
  NSObject *v28;
  PCPersistentTimer *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  _BYTE v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (*(_OWORD *)&self->_intervalTimer != 0 || self->_delayTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PCConnectionManager.m"), 1273, CFSTR("timers already exist"));

  }
  LODWORD(v2) = self->_reconnectIteration;
  v5 = fmin((double)v2 * 60.0, 900.0);
  -[PCConnectionManager persistentInterfaceManager](self, "persistentInterfaceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "areAllNetworkInterfacesDisabled"))
  {
    logObject = self->_logObject;
    v8 = 0.0;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v36) = 0;
    v9 = "All network interfaces are disabled, so not scheduling any wakes in reconnect mode";
    goto LABEL_6;
  }
  if (!-[PCConnectionManager currentStyle](self, "currentStyle")
    && ((objc_msgSend(v6, "doesWWANInterfaceExist") & 1) != 0 || objc_msgSend(v6, "isWakeOnWiFiSupported")))
  {
    v30 = self->_reconnectIteration == 1;
    if (CFAbsoluteTimeGetCurrent() - self->_lastReconnectTime >= 3600.0)
    {
      v8 = dbl_1CBC3AA00[v30];
    }
    else
    {
      v31 = self->_logObject;
      v8 = 1800.0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_1CBC1B000, v31, OS_LOG_TYPE_DEFAULT, "Experienced recent dropped connection. Using 30 minute wake interval", (uint8_t *)&v36, 2u);
      }
    }
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isBadLinkQuality") & 1) != 0)
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isBadLinkQuality");

      if (v34)
      {
        logObject = self->_logObject;
        v5 = 300.0;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          v9 = "Network interfaces reporting BAD LQM. Altering timer interval to 5 minutes";
LABEL_6:
          _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v36, 2u);
        }
      }
    }
    else
    {

    }
  }
  else
  {
    -[PCConnectionManager pollingInterval](self, "pollingInterval");
    v8 = v10;
  }
LABEL_9:
  v11 = (double)arc4random() / 4294967300.0 * 0.5 + 0.75;
  v12 = v5 * v11;
  v13 = v8 * v11;
  if (self->_reconnectWithKeepAliveDelay)
  {
    -[PCConnectionManager currentKeepAliveInterval](self, "currentKeepAliveInterval");
    v12 = v12 + v14;
    if (v13 <= 2.22044605e-16)
      v14 = -0.0;
    v13 = v13 + v14;
  }
  v15 = self->_logObject;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    reconnectIteration = self->_reconnectIteration;
    v36 = 67109632;
    *(_DWORD *)v37 = reconnectIteration;
    *(_WORD *)&v37[4] = 2048;
    *(double *)&v37[6] = v12;
    *(_WORD *)&v37[14] = 2048;
    *(double *)&v37[16] = v13;
    _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "Creating reconnect timers for iteration %i with keep alive interval %.4g and wake interval %.4g", (uint8_t *)&v36, 0x1Cu);
  }
  v17 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCPersistentTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", self->_serviceIdentifier, self, sel__intervalTimerFired, 0, v12);
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = v17;

  -[PCPersistentTimer setDisableSystemWaking:](self->_intervalTimer, "setDisableSystemWaking:", 1);
  -[PCPersistentTimer fireTime](self->_intervalTimer, "fireTime");
  self->_lastScheduledIntervalTime = v19;
  v20 = self->_intervalTimer;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v20, "scheduleInRunLoop:", v21);

  v22 = self->_logObject;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_intervalTimer;
    v36 = 138412546;
    *(_QWORD *)v37 = self;
    *(_WORD *)&v37[8] = 2112;
    *(_QWORD *)&v37[10] = v23;
    _os_log_impl(&dword_1CBC1B000, v22, OS_LOG_TYPE_DEFAULT, "%@ _intervalTimer = %@", (uint8_t *)&v36, 0x16u);
  }
  if (v13 > 2.22044605e-16)
  {
    v24 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCPersistentTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", self->_serviceIdentifier, self, sel__intervalTimerFired, 0, v13);
    reconnectWakeTimer = self->_reconnectWakeTimer;
    self->_reconnectWakeTimer = v24;

    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_reconnectWakeTimer, "setMinimumEarlyFireProportion:", 1.0);
    v26 = self->_reconnectWakeTimer;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCPersistentTimer scheduleInRunLoop:](v26, "scheduleInRunLoop:", v27);

    v28 = self->_logObject;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_reconnectWakeTimer;
      v36 = 138412546;
      *(_QWORD *)v37 = self;
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)&v37[10] = v29;
      _os_log_impl(&dword_1CBC1B000, v28, OS_LOG_TYPE_DEFAULT, "%@ _reconnectWakeTimer = %@", (uint8_t *)&v36, 0x16u);
    }
  }

}

- (BOOL)_hasBudgetRemaining
{
  void *v3;
  int v4;
  NSString *duetIdentifier;
  NSObject *logObject;
  const __CFString *v7;
  int v9;
  PCConnectionManager *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_duetIdentifier)
  {
    objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", self->_duetIdentifier, *(_QWORD *)CUTWeakLinkSymbol(), 0);
    if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      duetIdentifier = self->_duetIdentifier;
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = (const __CFString *)duetIdentifier;
      _os_log_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ DASSystemContext denied discretionary work for %@.", (uint8_t *)&v9, 0x16u);
    }
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v4)
        v7 = CFSTR("YES");
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ got response from DASSystemContext: hasBudget: %@.", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_intervalTimerFired
{
  PCConnectionManager *v3;
  PCPersistentTimer *intervalTimer;
  PCPersistentTimer *reconnectWakeTimer;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  __CFString *v13;
  PCPersistentTimer *v14;
  PCPersistentTimer *delayTimer;
  PCPersistentTimer *v16;
  void *v17;
  NSObject *v18;
  NSObject *logObject;
  NSString *serviceIdentifier;
  NSObject *v21;
  int v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_intervalTimer)
  {
    if (v3->_delayTimer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PCConnectionManager.m"), 1384, CFSTR("delay timer already exists"));

    }
    -[PCConnectionManager _takePowerAssertionWithTimeout:](v3, "_takePowerAssertionWithTimeout:", 30.0);
    -[PCPersistentTimer invalidate](v3->_intervalTimer, "invalidate");
    intervalTimer = v3->_intervalTimer;
    v3->_intervalTimer = 0;

    -[PCPersistentTimer invalidate](v3->_reconnectWakeTimer, "invalidate");
    reconnectWakeTimer = v3->_reconnectWakeTimer;
    v3->_reconnectWakeTimer = 0;

    if (-[PCConnectionManager _hasBudgetRemaining](v3, "_hasBudgetRemaining"))
    {
      -[PCConnectionManager persistentInterfaceManager](v3, "persistentInterfaceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PCConnectionManager currentStyle](v3, "currentStyle") != 1
        && ((objc_msgSend(v6, "isWWANInterfaceUp") & 1) != 0 || (objc_msgSend(v6, "isWakeOnWiFiSupported") & 1) != 0))
      {
        v21 = v3->_logObject;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v6, "isWWANInterfaceUp");
          v23 = objc_msgSend(v6, "isWakeOnWiFiSupported");
          v24 = CFSTR("NO");
          if (v22)
            v25 = CFSTR("YES");
          else
            v25 = CFSTR("NO");
          if (v23)
            v24 = CFSTR("YES");
          v29 = 138412546;
          v30 = *(double *)&v25;
          v31 = 2112;
          v32 = v24;
          _os_log_impl(&dword_1CBC1B000, v21, OS_LOG_TYPE_DEFAULT, "Timer fired. Delay is 0 so scheduling notification immediately. isWWANInterfaceUp %@, isWoWSupported %@", (uint8_t *)&v29, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "performSelector:target:argument:order:modes:", sel__delayTimerFired, v3, 0, 0, v27);

        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(v8, "getCFRunLoop"));
      }
      else
      {
        -[PCConnectionManager persistentInterfaceManager](v3, "persistentInterfaceManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "enableWiFiAutoAssociation:forDelegate:", 1, v3);

        +[PCPersistentTimer lastSystemWakeDate](PCPersistentTimer, "lastSystemWakeDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceNow");
        v10 = v9 + 10.0;
        if (v10 >= 1.0)
          v11 = v10;
        else
          v11 = 1.0;
        v12 = v3->_logObject;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v8);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v29 = 134218242;
          v30 = v11;
          v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "Timer fired. Delaying notification %g seconds. Last system wake: %@", (uint8_t *)&v29, 0x16u);

        }
        v14 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCPersistentTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v3->_serviceIdentifier, v3, sel__delayTimerFired, 0, v11);
        delayTimer = v3->_delayTimer;
        v3->_delayTimer = v14;

        -[PCPersistentTimer setDisableSystemWaking:](v3->_delayTimer, "setDisableSystemWaking:", 1);
        -[PCPersistentTimer setMinimumEarlyFireProportion:](v3->_delayTimer, "setMinimumEarlyFireProportion:", 1.0);
        v16 = v3->_delayTimer;
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PCPersistentTimer scheduleInRunLoop:](v16, "scheduleInRunLoop:", v17);

      }
    }
    else
    {
      logObject = v3->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        serviceIdentifier = v3->_serviceIdentifier;
        v29 = 138412546;
        v30 = *(double *)&v3;
        v31 = 2112;
        v32 = (const __CFString *)serviceIdentifier;
        _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ (%@) does not have budget to perform callout, bailing and starting next timer interval.", (uint8_t *)&v29, 0x16u);
      }
      -[PCConnectionManager _releasePowerAssertion](v3, "_releasePowerAssertion");
      -[PCConnectionManager startManager](v3, "startManager");
    }
  }
  else
  {
    v18 = v3->_logObject;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1CBC1B000, v18, OS_LOG_TYPE_DEFAULT, "_intervalTimer was already invalidated, no need to perform callback", (uint8_t *)&v29, 2u);
    }
  }
  objc_sync_exit(v3);

}

- (void)_delayTimerFired
{
  uint64_t v2;
  unsigned int v3;
  double keepAliveGracePeriod;
  double onTimeKeepAliveTime;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  PCConnectionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PCConnectionManager _clearTimersReleasingPowerAssertion:](obj, "_clearTimersReleasingPowerAssertion:", 0);
  if (obj->_isInReconnectMode)
  {
    v2 = 4;
  }
  else
  {
    v3 = -[PCConnectionManager currentStyle](obj, "currentStyle");
    if (v3 >= 3)
      v2 = 0xFFFFFFFFLL;
    else
      v2 = dword_1CBC3AA10[v3];
  }
  keepAliveGracePeriod = obj->_keepAliveGracePeriod;
  onTimeKeepAliveTime = obj->_onTimeKeepAliveTime;
  if (keepAliveGracePeriod <= 2.22044605e-16)
    v6 = onTimeKeepAliveTime + PCScheduledWakeRTCPrecision() * -2.0;
  else
    v6 = keepAliveGracePeriod + onTimeKeepAliveTime + -5.0;
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", obj->_lastStopTime < v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("PCTimerFireEarlyToCoalesce"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PCConnectionManager _calloutWithEvent:context:](obj, "_calloutWithEvent:context:", v2, v9);
  objc_sync_exit(obj);

}

- (void)_callDelegateWithEventAndContext:(id)a3
{
  id v4;
  PCConnectionManager *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  PCConnectionManager *v10;
  NSObject *logObject;
  uint8_t v12[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  objc_sync_exit(v5);

  objc_msgSend(v4, "objectForKey:", CFSTR("PCEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("PCEventContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "connectionManager:handleEvent:", v5, v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "connectionManager:handleEvent:context:", v5, v8, v9);
  }
  v10 = v5;
  objc_sync_enter(v10);
  v10->_inCallback = 0;
  logObject = v10->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Returned from callout", v12, 2u);
  }
  -[PCConnectionManager _adjustInterfaceAssertions](v10, "_adjustInterfaceAssertions");
  -[PCConnectionManager _releasePowerAssertion](v10, "_releasePowerAssertion");
  objc_sync_exit(v10);

}

- (void)_calloutWithEvent:(int)a3 context:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *logObject;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  NSObject *delegateQueue;
  NSRunLoop *delegateRunLoop;
  void *v16;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PCConnectionManager _takePowerAssertionWithTimeout:](self, "_takePowerAssertionWithTimeout:", 30.0);
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = logObject;
    -[PCConnectionManager _stringForEvent:](self, "_stringForEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = WeakRetained;
    _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "Calling out with reason %@ to delegate %@", buf, 0x16u);

  }
  self->_inCallback = 1;
  v11 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("PCEvent"), v6, CFSTR("PCEventContext"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PCConnectionManager__calloutWithEvent_context___block_invoke;
    block[3] = &unk_1E8743238;
    block[4] = self;
    v18 = v13;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    delegateRunLoop = self->_delegateRunLoop;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRunLoop performSelector:target:argument:order:modes:](delegateRunLoop, "performSelector:target:argument:order:modes:", sel__callDelegateWithEventAndContext_, self, v13, 0, v16);

    CFRunLoopWakeUp(-[NSRunLoop getCFRunLoop](self->_delegateRunLoop, "getCFRunLoop"));
  }

}

uint64_t __49__PCConnectionManager__calloutWithEvent_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callDelegateWithEventAndContext:", *(_QWORD *)(a1 + 40));
}

- (void)_pauseTimers
{
  PCPersistentTimer *intervalTimer;
  PCPersistentTimer *reconnectWakeTimer;
  PCPersistentTimer *delayTimer;
  double Current;
  double v7;

  -[PCPersistentTimer invalidate](self->_intervalTimer, "invalidate");
  intervalTimer = self->_intervalTimer;
  self->_intervalTimer = 0;

  -[PCPersistentTimer invalidate](self->_reconnectWakeTimer, "invalidate");
  reconnectWakeTimer = self->_reconnectWakeTimer;
  self->_reconnectWakeTimer = 0;

  -[PCPersistentTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  -[PCConnectionManager _adjustInterfaceAssertions](self, "_adjustInterfaceAssertions");
  if (!self->_inCallback)
    -[PCConnectionManager _releasePowerAssertion](self, "_releasePowerAssertion");
  Current = CFAbsoluteTimeGetCurrent();
  self->_lastStopTime = Current;
  v7 = Current - self->_lastStartTime;
  if (v7 < 0.0)
    v7 = 0.0;
  self->_lastElapsedInterval = self->_lastElapsedInterval + v7;
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4;
  id v6;
  PCConnectionManager *v7;
  double v8;
  _BOOL4 v9;
  NSObject *logObject;
  const __CFString *v11;
  id v12;
  _BOOL4 v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[PCConnectionManager _adjustPollTimerIfNecessary](v7, "_adjustPollTimerIfNecessary");
  if ((int)objc_msgSend(v6, "linkQuality") > (int)v4
    && +[PCInterfaceUsabilityMonitor isBadLinkQuality:](PCInterfaceUsabilityMonitor, "isBadLinkQuality:", v4))
  {
    -[PCPersistentTimer startTime](v7->_intervalTimer, "startTime");
    v9 = CFAbsoluteTimeGetCurrent() - v8 > 60.0 && v7->_isRunning && !v7->_delayTimer && v7->_isInReconnectMode;
    logObject = v7->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Persistent interface link quality changed, firing interval timer: %@", (uint8_t *)&v14, 0xCu);
    }
    if (v9)
    {
      -[PCConnectionManager _intervalTimerFired](v7, "_intervalTimerFired");
    }
    else if (!-[PCConnectionManager currentStyle](v7, "currentStyle"))
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v6)
      {
        v13 = v7->_interfaceIdentifier == 1;

        if (v13)
          -[PCConnectionManager _calloutWithEvent:context:](v7, "_calloutWithEvent:context:", 7, 0);
      }
      else
      {

      }
    }
  }
  objc_sync_exit(v7);

}

- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3
{
  id v4;
  PCConnectionManager *v5;
  int v6;
  int v7;
  NSObject *logObject;
  uint64_t v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_interfaceIdentifier == 1)
  {
    -[PCConnectionManager _adjustInterfaceAssertions](v5, "_adjustInterfaceAssertions");
    v6 = objc_msgSend(v4, "isWWANInterfaceUp");
    if (v5->_alwaysWantsInterfaceChangeCallbacks || v5->_isRunning && !v5->_delayTimer)
    {
      v5->_isReachable = objc_msgSend(v4, "isInternetReachable");
      if (v5->_isInReconnectMode && (v5->_intervalTimer ? (v7 = v6) : (v7 = 0), v7 == 1))
      {
        logObject = v5->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Persistent interface went up while in reconnect mode. Firing reconnect timer.", v10, 2u);
        }
        -[PCConnectionManager _intervalTimerFired](v5, "_intervalTimerFired");
      }
      else if (!-[PCConnectionManager currentStyle](v5, "currentStyle"))
      {
        if (v6)
          v9 = 7;
        else
          v9 = 8;
        -[PCConnectionManager _calloutWithEvent:context:](v5, "_calloutWithEvent:context:", v9, 0);
      }
    }
  }
  objc_sync_exit(v5);

}

- (void)interfaceManagerInHomeCountryStatusChanged:(id)a3
{
  PCConnectionManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PCConnectionManager _loadPreferencesGeneratingEvent:](v4, "_loadPreferencesGeneratingEvent:", 1);
  objc_sync_exit(v4);

}

- (void)interfaceManagerInternetReachabilityChanged:(id)a3
{
  id v4;
  PCConnectionManager *v5;
  _BOOL4 isReachable;
  int v7;
  NSObject *v8;
  _BOOL4 isRunning;
  PCPersistentTimer *delayTimer;
  _BOOL4 v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *logObject;
  int v18;
  char v19;
  uint64_t v20;
  _BYTE v21[24];
  const __CFString *v22;
  __int16 v23;
  PCPersistentTimer *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PCConnectionManager _adjustInterfaceAssertions](v5, "_adjustInterfaceAssertions");
  isReachable = v5->_isReachable;
  v7 = objc_msgSend(v4, "isInternetReachable");
  v5->_isReachable = v7;
  if (v7)
    v5->_lastReachableTime = CFAbsoluteTimeGetCurrent();
  v8 = v5->_logObject;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    isRunning = v5->_isRunning;
    delayTimer = v5->_delayTimer;
    v11 = v5->_isReachable;
    v12 = -[PCConnectionManager currentStyle](v5, "currentStyle");
    v13 = CFSTR("YES");
    *(_DWORD *)v21 = 138413826;
    *(_QWORD *)&v21[4] = v5;
    if (v11)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    if (isReachable)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (isRunning)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v4;
    *(_WORD *)&v21[22] = 2112;
    v22 = v16;
    if (v12)
      v13 = CFSTR("NO");
    v23 = 2112;
    v24 = delayTimer;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "%@ interfaceManagerInternetReachabilityChanged: %@ isRunning %@ delayTimer %@ wasReachable %@ isReachable %@ currentStyleIsPush? %@", v21, 0x48u);
  }

  if (v5->_alwaysWantsInterfaceChangeCallbacks || v5->_isRunning && !v5->_delayTimer)
  {
    if (!v5->_isInReconnectMode || isReachable || !v5->_intervalTimer || ((v7 ^ 1) & 1) != 0)
    {
      v18 = -[PCConnectionManager currentStyle](v5, "currentStyle", *(_QWORD *)v21, *(_OWORD *)&v21[8], v22);
      if (isReachable)
        v19 = v7;
      else
        v19 = 0;
      if (!v18 && (v19 & 1) == 0)
      {
        if (v7)
          v20 = 7;
        else
          v20 = 8;
        -[PCConnectionManager _calloutWithEvent:context:](v5, "_calloutWithEvent:context:", v20, 0);
      }
    }
    else
    {
      logObject = v5->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Network went reachable while in reconnect mode. Firing reconnect timer.", v21, 2u);
      }
      -[PCConnectionManager _intervalTimerFired](v5, "_intervalTimerFired", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
    }
  }
  objc_sync_exit(v5);

}

- (void)_takePowerAssertionWithTimeout:(double)a3
{
  unsigned int *p_powerAssertionID;
  NSString *serviceIdentifier;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *logObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IOPMAssertionID v18;
  uint64_t v19;
  uint8_t buf[4];
  IOPMAssertionID v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_powerAssertionID = &self->_powerAssertionID;
  if (!self->_powerAssertionID)
  {
    serviceIdentifier = self->_serviceIdentifier;
    if (serviceIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-connectionmanager(%p)"), serviceIdentifier, self);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("connectionmanager(%p)"), self, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PCPersistentIdentifiers processNamePidAndStringIdentifier:](PCPersistentIdentifiers, "processNamePidAndStringIdentifier:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), v8, CFSTR("Staying awake during callout to clients"), 0, 0, a3, CFSTR("TimeoutActionTurnOff"), p_powerAssertionID);
    logObject = self->_logObject;
    if ((_DWORD)v9)
    {
      v11 = v9;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_FAULT))
        -[PCConnectionManager _takePowerAssertionWithTimeout:].cold.1(v11, logObject, v12, v13, v14, v15, v16, v17);
    }
    else if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *p_powerAssertionID;
      *(_DWORD *)buf = 67109378;
      v21 = v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Preventing sleep with power assertion with identifier %i assertionIdentifier: %@", buf, 0x12u);
    }

  }
}

- (void)_saveWWANKeepAliveInterval
{
  PCGrowthAlgorithm **wwanGrowthAlgorithm;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  NSString *v13;
  id v14;
  id v15;

  wwanGrowthAlgorithm = self->_wwanGrowthAlgorithm;
  if (self->_wwanGrowthAlgorithm[self->_currentAddressFamily])
  {
    if (_saveWWANKeepAliveInterval_pred != -1)
      dispatch_once(&_saveWWANKeepAliveInterval_pred, &__block_literal_global_127);
    v4 = self->_serviceIdentifier;
    -[PCConnectionManager _stringForAddressFamily:](self, "_stringForAddressFamily:", self->_currentAddressFamily);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCGrowthAlgorithm cacheInfo](wwanGrowthAlgorithm[self->_currentAddressFamily], "cacheInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      v9 = (void *)MEMORY[0x1E0CB34C8];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2;
      v12[3] = &unk_1E87431E8;
      v13 = v4;
      v14 = v8;
      v15 = v5;
      v10 = v8;
      objc_msgSend(v9, "blockOperationWithBlock:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_saveWWANKeepAliveInterval_queue, "addOperation:", v11);

    }
  }
}

uint64_t __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_saveWWANKeepAliveInterval_queue;
  _saveWWANKeepAliveInterval_queue = (uint64_t)v0;

  return objc_msgSend((id)_saveWWANKeepAliveInterval_queue, "setMaxConcurrentOperationCount:", 1);
}

void __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  PCDistributedLock *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;

  +[PCConnectionManager _keepAliveCachePath](PCConnectionManager, "_keepAliveCachePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("lock"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = -[PCDistributedLock initWithPath:]([PCDistributedLock alloc], "initWithPath:", v3);
    -[PCDistributedLock lock](v6, "lock");
    +[PCConnectionManager intervalCacheDictionaries](PCConnectionManager, "intervalCacheDictionaries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "objectForKey:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "setObject:forKey:", a1[5], a1[6]);
    objc_msgSend(v8, "setObject:forKey:", v12, a1[4]);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeToFile:atomically:", v2, 1);
    -[PCDistributedLock unlock](v6, "unlock");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PCIntervalCacheChangedNotification"), 0, 0, 0);
  }

}

- (id)_getCachedWWANKeepAliveIntervalForAddressFamily:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  +[PCConnectionManager intervalCacheDictionaries](PCConnectionManager, "intervalCacheDictionaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", self->_serviceIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCConnectionManager _stringForAddressFamily:](self, "_stringForAddressFamily:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)intervalCacheDictionaries
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v32 = a1;
  objc_msgSend(a1, "_keepAliveCachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:", v4);

  v6 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    v24 = *(_QWORD *)v38;
    v25 = v7;
    do
    {
      v11 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v11);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v6 + 3592), "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v12;
          v28 = v13;
          v29 = v11;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v34 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v14, "objectForKey:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v20, "objectForKey:", CFSTR("keepAliveInterval"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKey:", CFSTR("cacheDate"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v21, "doubleValue");
                      if (objc_msgSend(v32, "_isCachedKeepAliveIntervalStillValid:date:", v22))
                        objc_msgSend(v31, "setObject:forKey:", v20, v19);
                    }
                  }

                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v16);
          }

          v6 = 0x1E0C99000;
          v10 = v24;
          v7 = v25;
          v9 = v26;
          v12 = v27;
          v13 = v28;
          v11 = v29;
        }
        objc_msgSend(v30, "setObject:forKey:", v31, v12);

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  return v30;
}

+ (id)_keepAliveCachePath
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v9;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if (v5)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.persistentconnection.intervalcache.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[PCConnectionManager _keepAliveCachePath].cold.1((uint64_t)v3, (uint64_t)v6);
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_isCachedKeepAliveIntervalStillValid:(double)a3 date:(id)a4
{
  double v5;

  objc_msgSend(a4, "timeIntervalSinceNow");
  return v5 > -(a3 + 3600.0);
}

- (id)_stringForStyle:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("manual");
  if (a3 == 1)
    v3 = CFSTR("poll");
  if (!a3)
    v3 = CFSTR("push");
  return v3;
}

- (id)_stringForEvent:(int)a3
{
  if ((a3 - 2) > 6)
    return CFSTR("unknown event");
  else
    return off_1E8743490[a3 - 2];
}

- (id)_stringForAddressFamily:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E87434C8[a3];
}

- (double)keepAliveGracePeriod
{
  return self->_keepAliveGracePeriod;
}

- (int64_t)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (void)setInterfaceIdentifier:(int64_t)a3
{
  self->_interfaceIdentifier = a3;
}

- (int)lastProcessedAction
{
  return self->_lastProcessedAction;
}

- (double)nonCellularEarlyFireConstantInterval
{
  return self->_nonCellularEarlyFireConstantInterval;
}

- (double)lastScheduledIntervalTime
{
  return self->_lastScheduledIntervalTime;
}

- (BOOL)alwaysWantsInterfaceChangeCallbacks
{
  return self->_alwaysWantsInterfaceChangeCallbacks;
}

- (void)setAlwaysWantsInterfaceChangeCallbacks:(BOOL)a3
{
  self->_alwaysWantsInterfaceChangeCallbacks = a3;
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  self->_powerOptimizationsForExpensiveNetworkingDisabled = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong(&self->_duetContextRegistration, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_reconnectWakeTimer, 0);
  objc_storeStrong((id *)&self->_intervalTimer, 0);
  objc_storeStrong((id *)&self->_lastScheduledGrowthAlgorithm, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_wifiGrowthAlgorithm[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_wwanGrowthAlgorithm[j + 1], 0);
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateRunLoop, 0);
  objc_storeStrong((id *)&self->_duetIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_validateActionForCurrentStyle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CBC1B000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_takePowerAssertionWithTimeout:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CBC1B000, a2, a3, "Unable to take power assertion. IOPMAssertionCreateWithName() returned %#x.", a5, a6, a7, a8, 0);
}

void __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unable to write cache dictionary: %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)_keepAliveCachePath
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2114;
  v5 = a2;
  _os_log_fault_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unable to create directory %@ {error:%{public}@}", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
