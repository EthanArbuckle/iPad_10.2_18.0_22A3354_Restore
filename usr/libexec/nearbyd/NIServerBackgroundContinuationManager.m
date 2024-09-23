@implementation NIServerBackgroundContinuationManager

- (NIServerBackgroundContinuationManager)initWithSessionIdentifier:(id)a3 appStateMonitor:(id)a4 queue:(id)a5 analyticsManager:(id)a6 backgroundAuthHandler:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  NIServerBackgroundContinuationManager *v18;
  NIServerBackgroundContinuationManager *v19;
  id v20;
  id authHandler;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  double backgroundDiscoveryTimeoutSeconds;
  double backgroundInteractionTimeoutSeconds;
  NSString *sessionIdentifier;
  void *v30;
  NSBackgroundActivityScheduler *v31;
  NSBackgroundActivityScheduler *stateTimeoutScheduler;
  unsigned int v33;
  uint64_t v34;
  NIServerBackgroundContinuationManager *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  objc_super v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  NSString *v50;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v43 = a6;
  v16 = a7;
  v42 = v13;
  if (!v13)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBackgroundContinuationManager.mm"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  }
  v17 = v14;
  if (v14)
  {
    if (v15)
      goto LABEL_5;
LABEL_21:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBackgroundContinuationManager.mm"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v16)
      goto LABEL_6;
    goto LABEL_22;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBackgroundContinuationManager.mm"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appStateMonitor"));

  if (!v15)
    goto LABEL_21;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_22:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerBackgroundContinuationManager.mm"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authHandler"));

LABEL_6:
  dispatch_assert_queue_V2(v15);
  v44.receiver = self;
  v44.super_class = (Class)NIServerBackgroundContinuationManager;
  v18 = -[NIServerBackgroundContinuationManager init](&v44, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v19->_appStateMonitor, a4);
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeStrong((id *)&v19->_analyticsManager, a6);
    v20 = objc_retainBlock(v16);
    authHandler = v19->_authHandler;
    v19->_authHandler = v20;

    v19->_currentSessionAuthState = 0;
    *(_OWORD *)&v19->_backgroundDiscoveryTimeoutSeconds = xmmword_10046F000;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v22, "doubleForKey:", CFSTR("BackgroundContinuationDiscoveryTimeoutSecondsOverride"));
    v24 = v23;
    objc_msgSend(v22, "doubleForKey:", CFSTR("BackgroundContinuationInteractionTimeoutSecondsOverride"));
    if (v24 > 0.0)
      v19->_backgroundDiscoveryTimeoutSeconds = v24;
    if (v25 > 0.0)
      v19->_backgroundInteractionTimeoutSeconds = v25;
    v26 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      backgroundDiscoveryTimeoutSeconds = v19->_backgroundDiscoveryTimeoutSeconds;
      backgroundInteractionTimeoutSeconds = v19->_backgroundInteractionTimeoutSeconds;
      sessionIdentifier = v19->_sessionIdentifier;
      *(_DWORD *)buf = 134218498;
      v46 = backgroundDiscoveryTimeoutSeconds;
      v47 = 2048;
      v48 = backgroundInteractionTimeoutSeconds;
      v49 = 2112;
      v50 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#bg-continuation,Initialized. Discovery timeout: %.1f [s]. Interaction timeout: %.1f [s]. Session identifier: %@", buf, 0x20u);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.nearbyd.backgroundContinuation.stateTimer."), v19->_sessionIdentifier));
    v31 = (NSBackgroundActivityScheduler *)objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", v30);
    stateTimeoutScheduler = v19->_stateTimeoutScheduler;
    v19->_stateTimeoutScheduler = v31;

    -[NSBackgroundActivityScheduler invalidate](v19->_stateTimeoutScheduler, "invalidate");
    -[PRAppStateMonitorProtocol addObserver:](v19->_appStateMonitor, "addObserver:", v19);
    v33 = -[PRAppStateMonitorProtocol currentAppState](v19->_appStateMonitor, "currentAppState");
    if (v33 == 2)
    {
      v34 = 2;
    }
    else
    {
      if (v33 != 3)
      {
LABEL_18:
        v35 = v19;

        goto LABEL_19;
      }
      v34 = 1;
    }
    -[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:](v19, "_changeSessionAuthStateTo:", v34);
    goto LABEL_18;
  }
LABEL_19:

  return v19;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerBackgroundContinuationManager _cancelStateTimer](self, "_cancelStateTimer");
  -[PRAppStateMonitorProtocol removeObserver:](self->_appStateMonitor, "removeObserver:", self);
}

- (void)measurementReceived
{
  NSObject *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D5F04((uint64_t)self, v3);
  if (self->_currentSessionAuthState == 3)
    -[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:](self, "_changeSessionAuthStateTo:", 4);
}

- (void)_changeSessionAuthStateTo:(unsigned __int8)a3
{
  int v3;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSString *sessionIdentifier;
  NSObject *v9;
  int currentSessionAuthState;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  NSString *v20;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    if ((self->_currentSessionAuthState - 1) > 3u)
      v6 = CFSTR("Initializing");
    else
      v6 = off_10080B620[(char)(self->_currentSessionAuthState - 1)];
    if ((v3 - 1) > 3u)
      v7 = CFSTR("Initializing");
    else
      v7 = off_10080B620[(char)(v3 - 1)];
    sessionIdentifier = self->_sessionIdentifier;
    v15 = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = sessionIdentifier;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#bg-continuation,Change session auth state. Current: %@. New: %@. Session identifier: %@", (uint8_t *)&v15, 0x20u);

  }
  currentSessionAuthState = self->_currentSessionAuthState;
  if (currentSessionAuthState == 1)
  {
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D5F7C(v11);
  }
  else if (currentSessionAuthState != v3)
  {
    -[NIServerBackgroundContinuationManager _cancelStateTimer](self, "_cancelStateTimer");
    v14 = self->_currentSessionAuthState;
    self->_currentSessionAuthState = v3;
    switch(v3)
    {
      case 0:
        sub_1003D5FBC();
      case 1:
        (*((void (**)(id, _QWORD, uint64_t, uint64_t))self->_authHandler + 2))(self->_authHandler, 0, v12, v13);
        break;
      case 2:
        if (!v14)
          (*((void (**)(id, uint64_t, uint64_t, uint64_t))self->_authHandler + 2))(self->_authHandler, 1, v12, v13);
        break;
      case 3:
        -[NIServerBackgroundContinuationManager _startStateTimer:](self, "_startStateTimer:", self->_backgroundDiscoveryTimeoutSeconds);
        break;
      case 4:
        -[NIServerBackgroundContinuationManager _startStateTimer:](self, "_startStateTimer:", self->_backgroundInteractionTimeoutSeconds);
        break;
      default:
        return;
    }
  }
}

- (void)_startStateTimer:(double)a3
{
  xpc_object_t v5;
  NSBackgroundActivityScheduler *stateTimeoutScheduler;
  _QWORD v7[4];
  id v8;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerBackgroundContinuationManager _cancelStateTimer](self, "_cancelStateTimer");
  -[NSBackgroundActivityScheduler invalidate](self->_stateTimeoutScheduler, "invalidate");
  -[NSBackgroundActivityScheduler setQualityOfService:](self->_stateTimeoutScheduler, "setQualityOfService:", 17);
  -[NSBackgroundActivityScheduler setDelay:](self->_stateTimeoutScheduler, "setDelay:", a3);
  -[NSBackgroundActivityScheduler setTolerance:](self->_stateTimeoutScheduler, "setTolerance:", 60.0);
  -[NSBackgroundActivityScheduler setRepeats:](self->_stateTimeoutScheduler, "setRepeats:", 0);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, (uint64_t)a3);
  -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:](self->_stateTimeoutScheduler, "_setAdditionalXPCActivityProperties:", v5);
  objc_initWeak(&location, self);
  stateTimeoutScheduler = self->_stateTimeoutScheduler;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A3B00;
  v7[3] = &unk_10080B600;
  objc_copyWeak(&v8, &location);
  -[NSBackgroundActivityScheduler scheduleWithBlock:](stateTimeoutScheduler, "scheduleWithBlock:", v7);
  self->_stateTimerStartedMachContTimeSeconds = sub_10000883C();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_cancelStateTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSBackgroundActivityScheduler invalidate](self->_stateTimeoutScheduler, "invalidate");
}

- (void)_stateTimerExpired
{
  double v3;
  void *v4;
  double v5;
  const __CFString *v6;
  NSString *sessionIdentifier;
  NSObject *v8;
  int currentSessionAuthState;
  _BYTE v10[24];
  NSString *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = sub_10000883C();
  v4 = (void *)qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v3 - self->_stateTimerStartedMachContTimeSeconds;
    if ((self->_currentSessionAuthState - 1) > 3u)
      v6 = CFSTR("Initializing");
    else
      v6 = off_10080B620[(char)(self->_currentSessionAuthState - 1)];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)v10 = 138412802;
    *(_QWORD *)&v10[4] = v6;
    *(_WORD *)&v10[12] = 2048;
    *(double *)&v10[14] = v5;
    *(_WORD *)&v10[22] = 2112;
    v11 = sessionIdentifier;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#bg-continuation,State timeout (state: %@, time elapsed: %.1f [s]). Session identifier: %@", v10, 0x20u);

  }
  -[NIServerBackgroundContinuationManager _cancelStateTimer](self, "_cancelStateTimer", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  currentSessionAuthState = self->_currentSessionAuthState;
  if (currentSessionAuthState == 4)
  {
    -[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:](self, "_changeSessionAuthStateTo:", 1);
    -[NIServerAnalyticsManager backgroundContinuationInteractionTimeout](self->_analyticsManager, "backgroundContinuationInteractionTimeout");
  }
  else if (currentSessionAuthState == 3)
  {
    -[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:](self, "_changeSessionAuthStateTo:", 1);
    -[NIServerAnalyticsManager backgroundContinuationDiscoveryTimeout](self->_analyticsManager, "backgroundContinuationDiscoveryTimeout");
  }
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSString *sessionIdentifier;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1001BBB88(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    sessionIdentifier = self->_sessionIdentifier;
    v12[0] = 67109634;
    v12[1] = a3;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#bg-continuation,PID %d changed state: %@. Session identifier: %@", (uint8_t *)v12, 0x1Cu);

  }
  switch(a4)
  {
    case 2:
      v11 = 2;
LABEL_11:
      -[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:](self, "_changeSessionAuthStateTo:", v11);
      return;
    case 3:
      if (self->_currentSessionAuthState == 2)
        v11 = 3;
      else
        v11 = 1;
      goto LABEL_11;
    case 0:
      sub_1003D5FE4();
  }
}

- (id)updatesQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTimeoutScheduler, 0);
  objc_storeStrong(&self->_authHandler, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
