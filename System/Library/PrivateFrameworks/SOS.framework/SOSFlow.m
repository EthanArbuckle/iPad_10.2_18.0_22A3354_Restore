@implementation SOSFlow

- (SOSFlow)initWithTriggerMechanism:(int64_t)a3 healthStore:(id)a4
{
  id v7;
  SOSFlow *v8;
  SOSFlow *v9;
  id v10;
  uint64_t v11;
  NSUserDefaults *healthUserDefaults;
  uint64_t v13;
  NSHashTable *observers;
  _HKMedicalIDData *medicalIDData;
  uint64_t v16;
  SOSCoreAnalyticsReporting *coreAnalyticsReporter;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SOSFlow;
  v8 = -[SOSFlow init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sosFlowTrigger = a3;
    v8->_sosFlowType = +[SOSFlow sosFlowTypeForTriggerMechanism:](SOSFlow, "sosFlowTypeForTriggerMechanism:", a3);
    v9->_currentState = 14;
    v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v11 = objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0CB76B8]);
    healthUserDefaults = v9->_healthUserDefaults;
    v9->_healthUserDefaults = (NSUserDefaults *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v13;

    v9->_isUserResponsive = +[SOSFlow isTriggerMechanismUserInitiated:](SOSFlow, "isTriggerMechanismUserInitiated:", a3);
    v9->_shouldIgnoreMotionCancel = 0;
    objc_storeStrong((id *)&v9->_healthStore, a4);
    medicalIDData = v9->_medicalIDData;
    v9->_medicalIDData = 0;

    v9->_didSeeUnresponsiveResting = 0;
    -[SOSFlow _prefetchMedicalID](v9, "_prefetchMedicalID");
    +[SOSCoreAnalyticsReporter sharedInstance](SOSCoreAnalyticsReporter, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsReporter = v9->_coreAnalyticsReporter;
    v9->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v16;

  }
  return v9;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOSFlow observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOSFlow observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)handleSOSFlowEvent:(unint64_t)a3 withMetaData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v6 = a4;
  -[SOSFlow willHandleEvent:withMetaData:](self, "willHandleEvent:withMetaData:", a3, v6);
  +[SOSFlow validEventsforState:](SOSFlow, "validEventsforState:", -[SOSFlow currentState](self, "currentState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
  {

    goto LABEL_4;
  }
  v9 = +[SOSFlow isInterruptingEvent:](SOSFlow, "isInterruptingEvent:", a3);

  if (v9)
  {
LABEL_4:
    switch(a3)
    {
      case 0uLL:
        -[SOSFlow eventTriggered](self, "eventTriggered");
        break;
      case 2uLL:
        -[SOSFlow _invalidateTimer](self, "_invalidateTimer");
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E5F82D78);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        -[SOSFlow userRespondedToConfirmationWith:](self, "userRespondedToConfirmationWith:", v12);
        break;
      case 3uLL:
        -[SOSFlow userDismissedCallCountdown](self, "userDismissedCallCountdown");
        break;
      case 4uLL:
      case 5uLL:
        -[SOSFlow callFinished](self, "callFinished");
        break;
      case 6uLL:
        -[SOSFlow countdownRequestedDial](self, "countdownRequestedDial");
        break;
      case 7uLL:
        -[SOSFlow contactsCountdownDismissed](self, "contactsCountdownDismissed");
        break;
      case 8uLL:
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E5F82D90);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        -[SOSFlow userRespondedToRestingStateWith:](self, "userRespondedToRestingStateWith:", v14);
        break;
      case 9uLL:
        -[SOSFlow timerRequestsCountdownToAutoCall](self, "timerRequestsCountdownToAutoCall");
        break;
      case 0xAuLL:
        -[SOSFlow motionDidCancel](self, "motionDidCancel");
        break;
      case 0xBuLL:
        -[SOSFlow handleEmergencyFallback](self, "handleEmergencyFallback");
        break;
      case 0xCuLL:
        -[SOSFlow setShouldIgnoreMotionCancel:](self, "setShouldIgnoreMotionCancel:", 1);
        break;
      case 0xDuLL:
        -[SOSFlow handleEmergencyCallInititated](self, "handleEmergencyCallInititated");
        break;
      case 0xEuLL:
        -[SOSFlow handleUserExited](self, "handleUserExited");
        break;
      default:
        goto LABEL_9;
    }
    goto LABEL_9;
  }
  sos_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SOSFlow handleSOSFlowEvent:withMetaData:].cold.1(a3, self, v10);

LABEL_9:
}

+ (BOOL)isInterruptingEvent:(unint64_t)a3
{
  return a3 - 13 < 2;
}

+ (BOOL)isTerminalState:(int64_t)a3
{
  return ((a3 - 6) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

+ (BOOL)isInterruptibleState:(int64_t)a3
{
  return ((unint64_t)a3 < 0xE) & (0x3B80u >> a3);
}

+ (BOOL)isPreCallState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (unint64_t)sosFlowTypeForTriggerMechanism:(int64_t)a3
{
  if (a3 == 7)
    return 2;
  else
    return a3 != 5;
}

- (void)eventTriggered
{
  unint64_t v3;
  uint64_t v4;
  SOSFlow *v5;
  uint64_t v6;

  v3 = -[SOSFlow sosFlowTrigger](self, "sosFlowTrigger");
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x158) != 0)
    {
      v5 = self;
      v6 = 3;
      goto LABEL_6;
    }
    v4 = 1 << v3;
    v5 = self;
    if ((v4 & 7) != 0)
    {
      v6 = 2;
LABEL_6:
      -[SOSFlow updateState:](v5, "updateState:", v6);
      return;
    }
    -[SOSFlow startAnomalyFlow](self, "startAnomalyFlow");
  }
}

- (void)startAnomalyFlow
{
  -[SOSFlow startTimerToAutoDial](self, "startTimerToAutoDial");
  -[SOSFlow updateState:](self, "updateState:", 1);
}

- (void)userRespondedToConfirmationWith:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 2)
    v3 = 3;
  else
    v3 = 6;
  -[SOSFlow updateState:](self, "updateState:", v3);
}

- (void)callFinished
{
  int64_t v3;
  SOSContactsManager *v4;
  BOOL v5;

  if (-[SOSFlow didSeeUnresponsiveResting](self, "didSeeUnresponsiveResting"))
  {
    v3 = 10;
  }
  else
  {
    v4 = objc_alloc_init(SOSContactsManager);
    v5 = -[SOSContactsManager hasValidContactsToMessage](v4, "hasValidContactsToMessage");

    if (v5)
      v3 = 5;
    else
      v3 = -[SOSFlow restingState](self, "restingState");
  }
  -[SOSFlow updateState:](self, "updateState:", v3);
}

- (void)userDismissedCallCountdown
{
  -[SOSFlow updateState:](self, "updateState:", 6);
}

- (void)countdownRequestedDial
{
  uint64_t v3;

  if (+[SOSUtilities shouldSkipNewtonCall](SOSUtilities, "shouldSkipNewtonCall"))
  {
    v3 = 7;
  }
  else if (+[SOSFlow isTriggerMechanismUserInitiated:](SOSFlow, "isTriggerMechanismUserInitiated:", -[SOSFlow sosFlowTrigger](self, "sosFlowTrigger")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 4;
  }
  -[SOSFlow updateState:](self, "updateState:", v3);
}

- (void)contactsCountdownDismissed
{
  -[SOSFlow updateState:](self, "updateState:", -[SOSFlow restingState](self, "restingState"));
}

- (void)timerRequestsCountdownToAutoCall
{
  -[SOSFlow updateState:](self, "updateState:", 2);
}

- (void)motionDidCancel
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[SOSFlow shouldIgnoreMotionCancel](self, "shouldIgnoreMotionCancel"))
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SOSFlow motionDidCancel]";
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s: Ignoring SOSFlowEventMotionDidCancel", (uint8_t *)&v4, 0xCu);
    }

  }
  else
  {
    -[SOSFlow updateState:](self, "updateState:", 12);
    -[SOSFlow _invalidateTimer](self, "_invalidateTimer");
  }
}

- (void)userRespondedToRestingStateWith:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      v5 = 10;
      goto LABEL_7;
    case 1:
      v5 = 8;
      goto LABEL_7;
    case 0:
      v5 = 3;
LABEL_7:
      -[SOSFlow updateState:](self, "updateState:", v5);
      goto LABEL_11;
  }
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[SOSFlow userRespondedToRestingStateWith:]";
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "%s: Unexpected SOSResponse from resting state", (uint8_t *)&v8, 0xCu);
  }

LABEL_11:
  -[SOSFlow coreAnalyticsReporter](self, "coreAnalyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportSOSRestingResponse:restingResponse:hasMedicalID:", -[SOSFlow sosFlowTrigger](self, "sosFlowTrigger"), a3, -[SOSFlow shouldShowMedicalID](self, "shouldShowMedicalID"));

}

- (void)handleEmergencyFallback
{
  -[SOSFlow updateState:](self, "updateState:", 11);
}

- (void)handleEmergencyCallInititated
{
  if (+[SOSFlow isPreCallState:](SOSFlow, "isPreCallState:", -[SOSFlow currentState](self, "currentState")))
  {
    -[SOSFlow updateState:](self, "updateState:", 10);
  }
}

- (void)handleUserExited
{
  -[SOSFlow updateState:](self, "updateState:", 0);
}

- (void)_prefetchMedicalID
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "SOSFlow, prefetchMedicalID", a5, a6, a7, a8, 0);
}

void __29__SOSFlow__prefetchMedicalID__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 7, a2);

}

- (BOOL)shouldShowMedicalID
{
  void *v2;
  void *v3;
  char v4;

  if (!self->_medicalIDData)
    return 0;
  -[SOSFlow healthUserDefaults](self, "healthUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB7698]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)restingState
{
  if (-[SOSFlow sosFlowTrigger](self, "sosFlowTrigger") == 7 && !-[SOSFlow isUserResponsive](self, "isUserResponsive"))
    return 9;
  if (-[SOSFlow shouldShowMedicalID](self, "shouldShowMedicalID"))
    return 8;
  return 10;
}

- (void)updateState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    SOSStringForSOSFlowState(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSFlow: Updating state to %@", buf, 0xCu);

  }
  -[SOSFlow setCurrentState:](self, "setCurrentState:", a3);
  if (-[SOSFlow currentState](self, "currentState") == 9)
    -[SOSFlow setDidSeeUnresponsiveResting:](self, "setDidSeeUnresponsiveResting:", 1);
  +[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSOSFlowState:", a3);

  -[SOSFlow startFlowStateHeartbeatTimer](self, "startFlowStateHeartbeatTimer");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SOSFlow observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "sosFlow:didChangeToState:", self, -[SOSFlow currentState](self, "currentState"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if ((unint64_t)(a3 - 3) <= 1)
  {
    v14 = -[SOSFlow isUserResponsive](self, "isUserResponsive");
    v15 = a3 == 3 || v14;
    -[SOSFlow setIsUserResponsive:](self, "setIsUserResponsive:", v15);
  }
}

- (void)willHandleEvent:(unint64_t)a3 withMetaData:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sosFlowEventDescription(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSFlow: Will handle event %@", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SOSFlow observers](self, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "sosFlow:willHandleEvent:withMetaData:", self, a3, v6);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (double)checkInTimeoutForSOSFlowType:(unint64_t)a3
{
  double result;

  result = 32.0;
  if (a3 == 2)
    return 10.0;
  return result;
}

- (void)startTimerToAutoDial
{
  double v3;
  double v4;
  NSObject *v5;
  PCPersistentTimer *v6;
  PCPersistentTimer *timer;
  PCPersistentTimer *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SOSFlow checkInTimeoutForSOSFlowType:](self, "checkInTimeoutForSOSFlowType:", -[SOSFlow sosFlowType](self, "sosFlowType"));
  v4 = v3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = v4;
    v12 = 2112;
    v13 = CFSTR("com.apple.sos.sosFlow");
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Starting countdown: %f for service identifier: %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.sos.sosFlow"), self, sel_timerFired_, 0, v4);
  timer = self->_timer;
  self->_timer = v6;

  -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_timer, "setMinimumEarlyFireProportion:", 1.0);
  v8 = self->_timer;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v8, "scheduleInRunLoop:", v9);

}

- (void)timerFired:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "Timer fired for autodial", buf, 2u);
  }

  if (-[SOSFlow canDeviceTriggerAutoDialForSOSFlowType:](self, "canDeviceTriggerAutoDialForSOSFlowType:", -[SOSFlow sosFlowType](self, "sosFlowType")))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__SOSFlow_timerFired___block_invoke;
    block[3] = &unk_1E5F75E48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Skipping autodial countdown", buf, 2u);
    }

  }
}

uint64_t __22__SOSFlow_timerFired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "Calling SOSFlow countdownRequestedDial", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "timerRequestsCountdownToAutoCall");
}

- (void)_invalidateTimer
{
  NSObject *v3;
  PCPersistentTimer *timer;
  uint8_t v5[16];

  if (self->_timer)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating SOSFlow timer", v5, 2u);
    }

    -[PCPersistentTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (BOOL)canDeviceTriggerAutoDialForSOSFlowType:(unint64_t)a3
{
  return 1;
}

- (void)startFlowStateHeartbeatTimer
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  -[SOSFlow clearFlowStateHeartbeatTimer](self, "clearFlowStateHeartbeatTimer");
  v3 = +[SOSFlow needsHeartbeatForState:](SOSFlow, "needsHeartbeatForState:", -[SOSFlow currentState](self, "currentState"));
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,starting flow state heartbeat timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke;
    v8[3] = &unk_1E5F764A0;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, 35.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSFlow setFlowStateHeartbeatTimer:](self, "setFlowStateHeartbeatTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,not starting flow state heartbeat timer", (uint8_t *)buf, 2u);
    }

  }
}

void __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[SOSFlow needsHeartbeatForState:](SOSFlow, "needsHeartbeatForState:", objc_msgSend(WeakRetained, "currentState"));
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,sos flow state heartbeat timer fired", v13, 2u);
    }

    +[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSOSFlowState:", objc_msgSend(WeakRetained, "currentState"));

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(WeakRetained, "clearFlowStateHeartbeatTimer");
  }

}

- (void)clearFlowStateHeartbeatTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[SOSFlow flowStateHeartbeatTimer](self, "flowStateHeartbeatTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSFlow,clearing sos flow state heartbeat timer", v6, 2u);
    }

    -[SOSFlow flowStateHeartbeatTimer](self, "flowStateHeartbeatTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SOSFlow setFlowStateHeartbeatTimer:](self, "setFlowStateHeartbeatTimer:", 0);
  }
}

+ (BOOL)needsHeartbeatForState:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1A06u >> a3);
}

+ (id)validEventsforState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
    return &unk_1E5F830D0;
  else
    return (id)qword_1E5F76530[a3 - 1];
}

+ (BOOL)isTriggerMechanismUserInitiated:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x15Eu >> a3);
}

+ (int64_t)sosFlowStateForString:(id)a3
{
  return +[SOSUtilities SOSFlowStateForString:](SOSUtilities, "SOSFlowStateForString:", a3);
}

- (unint64_t)sosFlowType
{
  return self->_sosFlowType;
}

- (void)setSosFlowType:(unint64_t)a3
{
  self->_sosFlowType = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (NSUserDefaults)healthUserDefaults
{
  return self->_healthUserDefaults;
}

- (void)setHealthUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_healthUserDefaults, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (int64_t)sosFlowTrigger
{
  return self->_sosFlowTrigger;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isUserResponsive
{
  return self->_isUserResponsive;
}

- (void)setIsUserResponsive:(BOOL)a3
{
  self->_isUserResponsive = a3;
}

- (BOOL)shouldIgnoreMotionCancel
{
  return self->_shouldIgnoreMotionCancel;
}

- (void)setShouldIgnoreMotionCancel:(BOOL)a3
{
  self->_shouldIgnoreMotionCancel = a3;
}

- (BOOL)didSeeUnresponsiveResting
{
  return self->_didSeeUnresponsiveResting;
}

- (void)setDidSeeUnresponsiveResting:(BOOL)a3
{
  self->_didSeeUnresponsiveResting = a3;
}

- (NSTimer)flowStateHeartbeatTimer
{
  return self->_flowStateHeartbeatTimer;
}

- (void)setFlowStateHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flowStateHeartbeatTimer, a3);
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_flowStateHeartbeatTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_healthUserDefaults, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)handleSOSFlowEvent:(NSObject *)a3 withMetaData:.cold.1(unint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sosFlowEventDescription(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SOSStringForSOSFlowState(objc_msgSend(a2, "currentState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1AF4DC000, a3, OS_LOG_TYPE_ERROR, "Invalid event %@ for current state %@!", (uint8_t *)&v7, 0x16u);

}

void __39__SOSFlow_startFlowStateHeartbeatTimer__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "SOSFlow,heartbeat timer fired unexpectedly", a5, a6, a7, a8, 0);
}

@end
