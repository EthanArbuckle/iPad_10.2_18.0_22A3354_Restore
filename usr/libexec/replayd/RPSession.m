@implementation RPSession

- (RPSession)initWithClientProxy:(id)a3 sessionType:(int)a4 callingPID:(int)a5 bundleID:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  BOOL v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  RPReportingAgent *v30;
  void *v31;
  RPReportingAgent *v32;
  void *v33;
  void *v34;
  RPApplicationStateMonitor *v35;
  void *v36;
  RPStatusBarAssertion *v37;
  void *v38;
  id v39;
  void *v40;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  char *v51;

  v42 = a3;
  v13 = a6;
  v14 = a7;
  v43.receiver = self;
  v43.super_class = (Class)RPSession;
  v15 = -[RPSession init](&v43, "init");
  v16 = objc_opt_class(v15);
  v17 = v16 != objc_opt_class(RPSession) || dword_100095B40 > 2;
  if (!v17 && (v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)))
  {
    sub_10004CF98(v18, v19, v20, v21, v22, v23, v24, v25);
    if (!v15)
      goto LABEL_16;
  }
  else if (!v15)
  {
    goto LABEL_16;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class(v15);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 136446978;
    v45 = "-[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]";
    v46 = 1024;
    v47 = 148;
    v48 = 2112;
    v49 = v28;
    v50 = 2048;
    v51 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);

  }
  objc_storeStrong((id *)v15 + 2, a3);
  v29 = (void *)*((_QWORD *)v15 + 43);
  *((_QWORD *)v15 + 43) = 0;

  *(CGSize *)(v15 + 360) = CGSizeZero;
  objc_storeStrong((id *)v15 + 42, a6);
  *((_DWORD *)v15 + 21) = a4;
  v30 = [RPReportingAgent alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serviceNameForReporting"));
  v32 = -[RPReportingAgent initWithServiceName:](v30, "initWithServiceName:", v31);
  v33 = (void *)*((_QWORD *)v15 + 44);
  *((_QWORD *)v15 + 44) = v32;

  objc_storeStrong((id *)v15 + 3, a7);
  v34 = (void *)*((_QWORD *)v15 + 12);
  *((_QWORD *)v15 + 12) = 0;

  v15[88] = 0;
  *((_QWORD *)v15 + 21) = 0x4020000000000000;
  *((_OWORD *)v15 + 2) = *(_OWORD *)&kCMTimeInvalid.value;
  *((_QWORD *)v15 + 6) = kCMTimeInvalid.epoch;
  *(_OWORD *)(v15 + 56) = *(_OWORD *)&kCMTimeZero.value;
  *((_QWORD *)v15 + 9) = kCMTimeZero.epoch;
  v15[80] = 0;
  *((_WORD *)v15 + 165) = 0;
  *((_WORD *)v15 + 88) = 0;
  *((_DWORD *)v15 + 83) = 3;
  *((_DWORD *)v15 + 2) = a5;
  v35 = objc_alloc_init(RPApplicationStateMonitor);
  v36 = (void *)*((_QWORD *)v15 + 16);
  *((_QWORD *)v15 + 16) = v35;

  objc_msgSend(*((id *)v15 + 16), "addObserver:processIdentifier:", v15, *((unsigned int *)v15 + 2));
  if (*((_DWORD *)v15 + 21) == 6)
    objc_msgSend(*((id *)v15 + 16), "addSystemObserver:", v15);
  v37 = objc_alloc_init(RPStatusBarAssertion);
  v38 = (void *)*((_QWORD *)v15 + 20);
  *((_QWORD *)v15 + 20) = v37;

  *((_QWORD *)v15 + 13) = 0;
  if ((*((_DWORD *)v15 + 21) - 5) > 2)
  {
    v40 = (void *)*((_QWORD *)v15 + 14);
    *((_QWORD *)v15 + 14) = 0;
  }
  else
  {
    v39 = objc_alloc_init((Class)CXCallObserver);
    v40 = (void *)*((_QWORD *)v15 + 14);
    *((_QWORD *)v15 + 14) = v39;
  }

  objc_msgSend(v15, "setUpFrontBoardServices");
  objc_msgSend(v15, "setDeviceLocked:", 0);
  v15[328] = 0;
  objc_msgSend(v15, "setUpDeviceLockNotifications");
  pthread_mutex_init((pthread_mutex_t *)(v15 + 200), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 264), 0);
LABEL_16:

  return (RPSession *)v15;
}

- (void)invalidate
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  RPSession *v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 136446978;
    v7 = "-[RPSession invalidate]";
    v8 = 1024;
    v9 = 215;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);

  }
  -[RPApplicationStateMonitor removeObserverWithProcessIdentifier:](self->_applicationStateMonitor, "removeObserverWithProcessIdentifier:", self->_callingPID);
  if (self->_sessionType == 6)
    -[RPApplicationStateMonitor removeSystemObserver](self->_applicationStateMonitor, "removeSystemObserver");
}

- (void)dealloc
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  RPSession *v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 136446978;
    v8 = "-[RPSession dealloc]";
    v9 = 1024;
    v10 = 225;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);

  }
  pthread_mutex_destroy(&self->_videoMutex);
  pthread_mutex_destroy(&self->_audioMutex);
  if (self->_aksEvent)
  {
    AKSEventsUnregister();
    self->_aksEvent = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RPSession;
  -[RPSession dealloc](&v6, "dealloc");
}

- (void)startWithContextID:(id)a3 windowSize:(CGSize)a4
{
  double height;
  double width;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *contextID;
  NSString *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  RPSession *v24;

  height = a4.height;
  width = a4.width;
  v7 = (NSString *)a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = 136446978;
    v18 = "-[RPSession startWithContextID:windowSize:]";
    v19 = 1024;
    v20 = 237;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v17, 0x26u);

  }
  contextID = self->_contextID;
  self->_contextID = v7;
  v12 = v7;

  +[RPHardwareUtility limitRecordingWindowSizeFromSize:](RPHardwareUtility, "limitRecordingWindowSizeFromSize:", width, height);
  v14 = v13;
  v16 = v15;

  self->_windowSize.width = v14;
  self->_windowSize.height = v16;
  *(_OWORD *)&self->_lastSampleTimestamp.value = *(_OWORD *)&kCMTimeInvalid.value;
  self->_lastSampleTimestamp.epoch = kCMTimeInvalid.epoch;
  *(_OWORD *)&self->_sampleTimeOffset.value = *(_OWORD *)&kCMTimeZero.value;
  self->_sampleTimeOffset.epoch = kCMTimeZero.epoch;
  self->_sessionIsResuming = 0;
  -[RPSession addObserversForSession](self, "addObserversForSession");
  -[RPSession setSessionState:](self, "setSessionState:", 0);
  -[RPSession checkForAcknowledgementAlertTimeout](self, "checkForAcknowledgementAlertTimeout");
}

- (void)addObserversForSession
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  RPSession *v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7 = 136446978;
    v8 = "-[RPSession addObserversForSession]";
    v9 = 1024;
    v10 = 250;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v7, 0x26u);

  }
  -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v6, "addObserver:", self);

}

- (void)removeObserversForSession
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  RPSession *v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7 = 136446978;
    v8 = "-[RPSession removeObserversForSession]";
    v9 = 1024;
    v10 = 261;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v7, 0x26u);

  }
  -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v6, "removeObserver:", self);

}

- (void)setSessionState:(int)a3
{
  uint64_t v3;
  objc_class *v5;
  NSString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  RPSession *v15;
  __int16 v16;
  int v17;

  v3 = *(_QWORD *)&a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 136447234;
    v9 = "-[RPSession setSessionState:]";
    v10 = 1024;
    v11 = 272;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 1024;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p session state change to %d", (uint8_t *)&v8, 0x2Cu);

  }
  if (self->_sessionState != (_DWORD)v3)
    -[RPSession sendBiomeEventWithSessionState:](self, "sendBiomeEventWithSessionState:", v3);
  self->_sessionState = v3;
  if ((_DWORD)v3 == 3)
    -[RPSession removeObserversForSession](self, "removeObserversForSession");
}

- (void)reportSessionEndReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPSession serviceNameForReporting](self, "serviceNameForReporting"));
  +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:](RPReportingAgent, "reportSessionEnded:endReason:withServiceName:clientBundleId:", 2, v4, v5, self->_bundleID);

}

- (void)reportSummaryEvent:(int64_t)a3 recordedFileSize:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  objc_msgSend(v7, "setRecordedFileSize:", a4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  objc_msgSend(v8, "setEndReason:", a3);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectSummaryEventMetrics"));
  objc_msgSend(v11, "reportEventWithType:dictionary:clientBundleId:", 1, v10, self->_bundleID);

}

- (void)checkForAcknowledgementAlertTimeout
{
  unsigned int sessionType;
  BOOL v4;
  int v5;
  void *v7;
  double v8;
  double v9;
  _BOOL4 isExempt;
  NSDate *lastExemptTime;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  _BOOL4 v19;

  sessionType = self->_sessionType;
  v4 = sessionType > 7;
  v5 = (1 << sessionType) & 0xE8;
  if (v4 || v5 == 0)
  {
    if (self->_lastExemptTime)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastExemptTime);
      v9 = v8 / 60.0;

      if (self->_privacyAcknowledgementAlertTimeoutMinutes >= v9)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          isExempt = self->_isExempt;
          v12 = 136446978;
          v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          v14 = 1024;
          v15 = 311;
          v16 = 2048;
          v17 = v9;
          v18 = 1024;
          v19 = isExempt;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement exempt %d", (uint8_t *)&v12, 0x22u);
        }
      }
      else
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136446722;
          v13 = "-[RPSession checkForAcknowledgementAlertTimeout]";
          v14 = 1024;
          v15 = 306;
          v16 = 2048;
          v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d after %.2f minutes, user acknowledgement required", (uint8_t *)&v12, 0x1Cu);
        }
        self->_isExempt = 0;
        *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
      }
    }
    lastExemptTime = self->_lastExemptTime;
    self->_lastExemptTime = 0;

  }
  else
  {
    self->_isExempt = 0;
    *(_WORD *)&self->_didAcceptMicrophonePermission = 0;
  }
}

- (void)startAcknowledgementAlertTimer
{
  unsigned int sessionType;
  BOOL v3;
  int v4;
  _BOOL4 isExempt;
  _BOOL4 v8;
  NSDate *v9;
  NSDate *lastExemptTime;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;

  sessionType = self->_sessionType;
  v3 = sessionType > 7;
  v4 = (1 << sessionType) & 0xE8;
  if (v3 || v4 == 0)
  {
    if (self->_lastExemptTime)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        isExempt = self->_isExempt;
        v11 = 136446722;
        v12 = "-[RPSession startAcknowledgementAlertTimer]";
        v13 = 1024;
        v14 = 329;
        v15 = 1024;
        v16 = isExempt;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d timer already running for user acknowledgement exempt %d", (uint8_t *)&v11, 0x18u);
      }
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_isExempt;
        v11 = 136446722;
        v12 = "-[RPSession startAcknowledgementAlertTimer]";
        v13 = 1024;
        v14 = 326;
        v15 = 1024;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting timer for user acknowledgement exempt %d", (uint8_t *)&v11, 0x18u);
      }
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      lastExemptTime = self->_lastExemptTime;
      self->_lastExemptTime = v9;

    }
  }
}

- (void)updateReportingSampleCount:(int)a3
{
  id v3;
  id v4;
  id v5;

  switch(a3)
  {
    case 2:
      v4 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v4, "setMicFrameCount:", (char *)objc_msgSend(v4, "micFrameCount") + 1);

      break;
    case 1:
      v5 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v5, "setAppAudioFrameCount:", (char *)objc_msgSend(v5, "appAudioFrameCount") + 1);

      break;
    case 0:
      v3 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
      objc_msgSend(v3, "setVideoFrameCount:", (char *)objc_msgSend(v3, "videoFrameCount") + 1);

      break;
  }
}

- (void)updateClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5
{
  uint64_t v6;
  id v9;
  NSString *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t callingPID;
  objc_class *v15;
  NSString *v16;
  void *v17;
  NSString *bundleID;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  RPSession *v26;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = (NSString *)a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v19 = 136446978;
    v20 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
    v21 = 1024;
    v22 = 363;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v19, 0x26u);

  }
  objc_storeStrong((id *)&self->_clientProxy, a3);
  callingPID = self->_callingPID;
  if ((_DWORD)callingPID != (_DWORD)v6)
  {
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class(self);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v19 = 136446978;
        v20 = "-[RPSession updateClientProxy:callingPID:bundleID:]";
        v21 = 1024;
        v22 = 366;
        v23 = 2112;
        v24 = v17;
        v25 = 2048;
        v26 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p pid changed", (uint8_t *)&v19, 0x26u);

      }
      callingPID = self->_callingPID;
    }
    -[RPApplicationStateMonitor removeObserverWithProcessIdentifier:](self->_applicationStateMonitor, "removeObserverWithProcessIdentifier:", callingPID);
    -[RPApplicationStateMonitor addObserver:processIdentifier:](self->_applicationStateMonitor, "addObserver:processIdentifier:", self, v6);
    self->_callingPID = v6;
  }
  bundleID = self->_bundleID;
  self->_bundleID = v10;

}

- (void)setUpStatusBarAssertionWithServiceName:(id)a3
{
  id v4;
  CFPropertyListRef v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _BOOL4 v12;

  v4 = a3;
  if (!os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.replayd"), "UTF8String")))
    goto LABEL_7;
  v5 = CFPreferencesCopyAppValue(CFSTR("RPHideStatusBar"), CFSTR("com.apple.replayd"));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPSession setUpStatusBarAssertionWithServiceName:]";
    v9 = 1024;
    v10 = 386;
    v11 = 1024;
    v12 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d hideStatusBar=%d", buf, 0x18u);
  }
  if (v5)
  {
    CFRelease(v5);
  }
  else
  {
LABEL_7:
    -[RPStatusBarAssertion setDelegate:](self->_statusBarAssertion, "setDelegate:", self);
    -[RPStatusBarAssertion setAssertionDelegate:](self->_statusBarAssertion, "setAssertionDelegate:", self);
    -[RPStatusBarAssertion setBroadcasting:](self->_statusBarAssertion, "setBroadcasting:", self->_sessionType == 6);
    -[RPStatusBarAssertion setBroadcastServiceName:](self->_statusBarAssertion, "setBroadcastServiceName:", v4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E830;
    block[3] = &unk_100080E00;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)clearSystemRecordingUI
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  __CFUserNotification *userNotificationStopRecording;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  RPSession *v14;

  if ((self->_sessionType - 5) <= 2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (objc_class *)objc_opt_class(self);
      v4 = NSStringFromClass(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v7 = 136446978;
      v8 = "-[RPSession clearSystemRecordingUI]";
      v9 = 1024;
      v10 = 410;
      v11 = 2112;
      v12 = v5;
      v13 = 2048;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p stop monitoring foreground apps", (uint8_t *)&v7, 0x26u);

    }
    userNotificationStopRecording = self->_userNotificationStopRecording;
    if (userNotificationStopRecording)
      CFUserNotificationCancel(userNotificationStopRecording);
    -[RPStatusBarAssertion invalidateStatusBar](self->_statusBarAssertion, "invalidateStatusBar");
  }
}

- (void)notifyClientSessionDidStopWithError:(int64_t)a3 movieURL:(id)a4 showAlert:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", a3, 0));
  -[RPSessionDelegate sessionDidStop](self->_delegate, "sessionDidStop");
  -[RPClientProtocol recordingDidStopWithError:movieURL:](self->_clientProxy, "recordingDidStopWithError:movieURL:", v9, v8);

  if (v5)
    -[RPSession showAlertRecordingCaptureSessionWithError:](self, "showAlertRecordingCaptureSessionWithError:", v9);

}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  v3 = *(_QWORD *)&a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
    v8 = 1024;
    v9 = 441;
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid: %d", (uint8_t *)&v6, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    if ((int)v3 < 1)
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004D028();
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136446722;
        v7 = "-[RPSession updateProcessIDForAudioCaptureWithPID:]";
        v8 = 1024;
        v9 = 445;
        v10 = 1024;
        v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resuming audio capture for pid: %d", (uint8_t *)&v6, 0x18u);
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
      objc_msgSend(v5, "restartAppAudioCaptureForProcessID:", v3);

    }
  }
}

- (void)pauseSession
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  RPSession *v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 136446978;
    v7 = "-[RPSession pauseSession]";
    v8 = 1024;
    v9 = 458;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);

  }
  -[RPSession setSessionState:](self, "setSessionState:", 4);
  -[RPStatusBarAssertion pauseSession](self->_statusBarAssertion, "pauseSession");
}

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  objc_class *v8;
  NSString *v9;
  void *v10;
  _BOOL4 microphoneEnabled;
  int sessionState;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  RPSession *v25;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v18 = 136446978;
    v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    v20 = 1024;
    v21 = 466;
    v22 = 2112;
    v23 = v10;
    v24 = 2048;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v18, 0x26u);

  }
  if (self->_sessionState == 4)
  {
    -[RPSession checkForAcknowledgementAlertTimeout](self, "checkForAcknowledgementAlertTimeout");
    -[RPSession setContextID:](self, "setContextID:", v6);
    microphoneEnabled = self->_microphoneEnabled;
    if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:](self, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:", self->_microphoneEnabled, self->_cameraEnabled))
    {
      if (microphoneEnabled && self->_sessionType == 2 && !self->_microphoneEnabled)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class(self);
          v16 = NSStringFromClass(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = 136446978;
          v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
          v20 = 1024;
          v21 = 487;
          v22 = 2112;
          v23 = v17;
          v24 = 2048;
          v25 = self;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p resume capture with mic, but session will silence mic", (uint8_t *)&v18, 0x26u);

        }
        self->_microphoneEnabled = 1;
        -[RPSession handleResumeCaptureWithCompletionHandler:](self, "handleResumeCaptureWithCompletionHandler:", v7);
        self->_microphoneEnabled = 0;
      }
      else
      {
        -[RPSession handleResumeCaptureWithCompletionHandler:](self, "handleResumeCaptureWithCompletionHandler:", v7);
      }
      -[RPStatusBarAssertion resumeSession](self->_statusBarAssertion, "resumeSession");
      goto LABEL_19;
    }
    -[RPSession setSessionState:](self, "setSessionState:", 3);
    if (!v7)
      goto LABEL_19;
    v13 = -5801;
LABEL_18:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", v13, 0));
    v7[2](v7, v14);

    goto LABEL_19;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    sessionState = self->_sessionState;
    v18 = 136446722;
    v19 = "-[RPSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    v20 = 1024;
    v21 = 500;
    v22 = 1024;
    LODWORD(v23) = sessionState;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Cannot resume session as it was not in paused state. Session state:%d", (uint8_t *)&v18, 0x18u);
  }
  if (v7)
  {
    v13 = -5832;
    goto LABEL_18;
  }
LABEL_19:

}

- (void)updatePauseOffsetFromVideoBuffer:(opaqueCMSampleBuffer *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_sampleTimeOffset;
  CMTimeEpoch epoch;
  $95D729B680665BEAEFA1D6FCA8238556 sampleTimeOffset;
  CMTime time1;
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMSampleBufferGetPresentationTimeStamp(&v9, a3);
  if (self->_sessionIsResuming)
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMake(&v8, v9.value - self->_lastSampleTimestamp.value, v9.timescale);
    p_sampleTimeOffset = &self->_sampleTimeOffset;
    time1 = kCMTimeZero;
    sampleTimeOffset = self->_sampleTimeOffset;
    if (CMTimeCompare(&time1, (CMTime *)&sampleTimeOffset))
    {
      CMTimeMake(&time1, p_sampleTimeOffset->value + v8.value, v8.timescale);
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&time1.value;
      epoch = time1.epoch;
    }
    else
    {
      *(_OWORD *)&p_sampleTimeOffset->value = *(_OWORD *)&v8.value;
      epoch = v8.epoch;
    }
    self->_sampleTimeOffset.epoch = epoch;
    self->_sessionIsResuming = 0;
  }
  else
  {
    self->_lastSampleTimestamp = ($95D729B680665BEAEFA1D6FCA8238556)v9;
  }
}

- (void)updatePauseOffsetForSampleBuffer:(opaqueCMSampleBuffer *)a3 withSampleType:(int)a4 handler:(id)a5
{
  _QWORD *v8;
  _QWORD *v9;
  CMSampleBufferRef v10;
  void (*v11)(_QWORD *, CMSampleBufferRef);
  CMSampleBufferRef v12;
  CMTime sampleTimeOffset;
  CMTime time2;
  CMTime time1;
  CMTime v16;

  v8 = a5;
  v9 = v8;
  if (!a4)
  {
    -[RPSession updatePauseOffsetFromVideoBuffer:](self, "updatePauseOffsetFromVideoBuffer:", a3);
LABEL_5:
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, a3);
    time1 = (CMTime)self->_sampleTimeOffset;
    time2 = kCMTimeZero;
    if (CMTimeCompare(&time1, &time2))
    {
      memset(&time1, 0, sizeof(time1));
      time2 = v16;
      sampleTimeOffset = (CMTime)self->_sampleTimeOffset;
      CMTimeSubtract(&time1, &time2, &sampleTimeOffset);
      memset(&time2, 0, sizeof(time2));
      sampleTimeOffset = time1;
      CMTimeConvertScale(&time2, &sampleTimeOffset, v16.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      sampleTimeOffset = time2;
      v10 = sub_100046AF8(a3, (uint64_t)&sampleTimeOffset);
      v11 = (void (*)(_QWORD *, CMSampleBufferRef))v9[2];
      if (v10)
      {
        v12 = v10;
        v11(v9, v10);
        CFRelease(v12);
        goto LABEL_10;
      }
    }
    else
    {
      v11 = (void (*)(_QWORD *, CMSampleBufferRef))v9[2];
    }
    v11(v9, a3);
    goto LABEL_10;
  }
  if (!self->_sessionIsResuming)
    goto LABEL_5;
  ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
LABEL_10:

}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4 movieWriter:(id)a5
{
  id v8;
  __int128 v9;
  _OWORD v10[3];
  _BYTE buf[32];
  __int128 v12;

  v8 = a5;
  if (self->_sessionState == 4)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[RPSession processSampleBuffer:transformFlags:movieWriter:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 567;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is paused discard sample", buf, 0x12u);
    }
  }
  else
  {
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)buf = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf[16] = v9;
    v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ((self->_sessionType - 5) <= 2)
      -[RPSession CGAffineTransformFromFigTransformFlags:](self, "CGAffineTransformFromFigTransformFlags:", a4);
    v10[0] = *(_OWORD *)buf;
    v10[1] = *(_OWORD *)&buf[16];
    v10[2] = v12;
    objc_msgSend(v8, "appendVideoSampleBuffer:withWindowTransform:", a3, v10);
  }

}

- (CGAffineTransform)CGAffineTransformFromFigTransformFlags:(SEL)a3
{
  char v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform buf;

  v4 = a4;
  v6 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  v8 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v8;
  if ((a4 & 4) != 0)
  {
    v13 = v8;
    v14 = v7;
    v15 = v6;
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(_QWORD *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 587;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d rotate clockwise", (uint8_t *)&buf, 0x12u);
    }
    CGAffineTransformMakeRotation(&t2, 1.57079633);
    *(_OWORD *)&buf.a = v15;
    *(_OWORD *)&buf.c = v14;
    *(_OWORD *)&buf.tx = v13;
    self = CGAffineTransformConcat(retstr, &buf, &t2);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        return self;
      goto LABEL_13;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.a) = 136446466;
    *(_QWORD *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
    WORD2(buf.b) = 1024;
    *(_DWORD *)((char *)&buf.b + 6) = 591;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flip x", (uint8_t *)&buf, 0x12u);
  }
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  self = CGAffineTransformScale(&buf, &v16, -1.0, 1.0);
  v10 = *(_OWORD *)&buf.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  if ((v4 & 1) != 0)
  {
LABEL_13:
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 136446466;
      *(_QWORD *)((char *)&buf.a + 4) = "-[RPSession CGAffineTransformFromFigTransformFlags:]";
      WORD2(buf.b) = 1024;
      *(_DWORD *)((char *)&buf.b + 6) = 595;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flip y", (uint8_t *)&buf, 0x12u);
    }
    v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v16.c = v11;
    *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
    self = CGAffineTransformScale(&buf, &v16, 1.0, -1.0);
    v12 = *(_OWORD *)&buf.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&buf.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&buf.tx;
  }
  return self;
}

- (void)checkAndPlaySystemSessionSound:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if ((+[RPHardwareUtility supportsShutterSound](RPHardwareUtility, "supportsShutterSound")
     || +[RPHardwareUtility isVoiceOverRunning](RPHardwareUtility, "isVoiceOverRunning"))
    && (self->_sessionType - 5) <= 2)
  {
    if (v3)
      AudioServicesPlaySystemSound(0x45Du);
    else
      AudioServicesPlaySystemSound(0x45Eu);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", a3, a4));
  if (objc_msgSend(v5, "effectiveBoolValueForSetting:", MCFeatureScreenRecordingAllowed) == 2)
    -[RPSession handleDeviceRestrictionWarning](self, "handleDeviceRestrictionWarning");

}

- (void)setUpDeviceLockNotifications
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  CFPropertyListRef v6;
  _BOOL4 enableLockedRecording;
  dispatch_queue_global_t global_queue;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  RPSession *v18;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 136446978;
    v12 = "-[RPSession setUpDeviceLockNotifications]";
    v13 = 1024;
    v14 = 642;
    v15 = 2112;
    v16 = v5;
    v17 = 2048;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);

  }
  if (os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.replayd"), "UTF8String")))
  {
    v6 = CFPreferencesCopyAppValue(CFSTR("RPEnableLockedRecording"), CFSTR("com.apple.replayd"));
    self->_enableLockedRecording = v6 != 0;
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      enableLockedRecording = self->_enableLockedRecording;
      *(_DWORD *)buf = 136446722;
      v12 = "-[RPSession setUpDeviceLockNotifications]";
      v13 = 1024;
      v14 = 649;
      v15 = 1024;
      LODWORD(v16) = enableLockedRecording;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableLockedRecording=%d", buf, 0x18u);
    }
  }
  else
  {
    v6 = 0;
  }
  if (self->_enableLockedRecording)
    goto LABEL_15;
  if (self->_aksEvent)
    AKSEventsUnregister();
  global_queue = dispatch_get_global_queue(2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F924;
  v10[3] = &unk_1000811F8;
  v10[4] = self;
  self->_aksEvent = (_AKSEvent *)AKSEventsRegister(v9, v10);

  if (self->_aksEvent
    || dword_100095B40 > 2
    || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
LABEL_15:
    if (!v6)
      return;
  }
  else
  {
    sub_10004D0A0();
    if (!v6)
      return;
  }
  CFRelease(v6);
}

- (BOOL)checkMultiWindow
{
  return +[RPHardwareUtility isIPad](RPHardwareUtility, "isIPad");
}

- (void)setUpFrontBoardServices
{
  void *v3;
  NSObject *v4;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *layoutMonitor;
  void **v7;
  uint64_t v8;
  intptr_t (*v9)(uint64_t);
  void *v10;
  RPSession *v11;
  dispatch_semaphore_t v12;

  self->_levelOneElementCount = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  objc_msgSend(v3, "setNeedsUserInteractivePriority:", 1);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10000FA94;
  v10 = &unk_100081220;
  v11 = self;
  v12 = dispatch_semaphore_create(0);
  v4 = v12;
  objc_msgSend(v3, "setTransitionHandler:", &v7);
  v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3, v7, v8, v9, v10, v11));
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v5;

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)handleUpdateDisplayLayout:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *i;
  void *v13;
  int64_t levelOneElementCount;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int64_t v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
  v6 = objc_msgSend(v5, "systemBannerEnabled");

  if (v6)
    -[RPSession handleDisplayBacklightUpdate:](self, "handleDisplayBacklightUpdate:", v4);
  if (-[RPSession checkMultiWindow](self, "checkMultiWindow"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elements", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "bundleIdentifier"));

          if (v13)
            ++v10;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      }
      while (v9);

      self->_levelOneElementCount = v10;
      if (v10 >= 2)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          levelOneElementCount = self->_levelOneElementCount;
          *(_DWORD *)buf = 136446722;
          v20 = "-[RPSession handleUpdateDisplayLayout:]";
          v21 = 1024;
          v22 = 783;
          v23 = 2048;
          v24 = levelOneElementCount;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop recording from split mode with %ld elements", buf, 0x1Cu);
        }
        -[RPSession handleDisplayWarning](self, "handleDisplayWarning");
      }
    }
    else
    {

      self->_levelOneElementCount = 0;
    }
  }

}

- (void)handleDisplayBacklightUpdate:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  unsigned int v10;

  v4 = a3;
  if (objc_msgSend(v4, "displayBacklightLevel"))
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446722;
      v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      v7 = 1024;
      v8 = 798;
      v9 = 1024;
      v10 = objc_msgSend(v4, "displayBacklightLevel");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Display layout updated displayBacklightLevel=%d", (uint8_t *)&v5, 0x18u);
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "-[RPSession handleDisplayBacklightUpdate:]";
      v7 = 1024;
      v8 = 793;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Display layout updated to minimum backlight", (uint8_t *)&v5, 0x12u);
    }
    if (!self->_enableLockedRecording)
      -[RPSession handleDeviceLockedWarning](self, "handleDeviceLockedWarning");
  }

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isOutgoing") & 1) == 0 && (objc_msgSend(v5, "hasEnded") & 1) == 0)
    -[RPSession handleIncomingCallWarning](self, "handleIncomingCallWarning");

}

- (id)checkCaptureRequirementsWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 windowSize:(CGSize)a5
{
  double height;
  double width;
  objc_class *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int sessionType;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  RPSession *v24;

  height = a5.height;
  width = a5.width;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = 136446978;
    v18 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    v19 = 1024;
    v20 = 821;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v17, 0x26u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[RPSession checkSufficientFreeSpace](self, "checkSufficientFreeSpace"));
  v12 = (void *)v11;
  if ((self->_sessionType - 8) <= 0xFFFFFFFC && v11 == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkContextIDRequirement](self, "checkContextIDRequirement"));
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkApplicationForegroundRequirement](self, "checkApplicationForegroundRequirement"));
      if (!v12)
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkMultiWindowRequirement](self, "checkMultiWindowRequirement"));
    }
  }
  sessionType = self->_sessionType;
  if ((sessionType - 5) < 2)
  {
    if (v12)
      goto LABEL_20;
    goto LABEL_17;
  }
  if (sessionType == 7 && !v12)
  {
LABEL_17:
    v15 = objc_claimAutoreleasedReturnValue(-[RPSession checkDeviceLockedRequirement](self, "checkDeviceLockedRequirement"));

    v12 = (void *)v15;
  }
  if (!v12)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkMinWindowSizeRequirement:](self, "checkMinWindowSizeRequirement:", width, height));
LABEL_20:
  if (v12 && dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136446722;
    v18 = "-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:]";
    v19 = 1024;
    v20 = 863;
    v21 = 2112;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Check requirements error %@", (uint8_t *)&v17, 0x1Cu);
  }
  return v12;
}

- (id)checkDeviceLockedRequirement
{
  void *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (self->_deviceLocked)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446466;
      v5 = "-[RPSession checkDeviceLockedRequirement]";
      v6 = 1024;
      v7 = 872;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d failed to start system recording because device was in locked state", (uint8_t *)&v4, 0x12u);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5809, 0));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)checkContextIDRequirement
{
  RPSession *v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  NSString *contextID;

  v2 = self;
  contextID = self->_contextID;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &contextID, 1));
  LOBYTE(v2) = -[RPSession checkContextIDsMatch:](v2, "checkContextIDsMatch:", v3);

  if ((v2 & 1) != 0)
    return 0;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPSession checkContextIDRequirement]";
    v7 = 1024;
    v8 = 887;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d contextIDs do not match", (uint8_t *)&v5, 0x12u);
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
}

- (BOOL)checkContextIDsMatch:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t ClientPort;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPStringUtility numberFromString:](RPStringUtility, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8), (_QWORD)v16));
      v10 = objc_msgSend(v9, "unsignedIntValue");

      ClientPort = CARenderServerGetClientPort(0, v10);
      if (!(_DWORD)ClientPort)
        break;
      v12 = +[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", CARenderServerGetClientProcessId(0, ClientPort));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession getCallingConnectionBundleID](self, "getCallingConnectionBundleID"));
      mach_port_deallocate(mach_task_self_, ClientPort);
      LODWORD(ClientPort) = objc_msgSend(v13, "isEqualToString:", v14);

      if (!(_DWORD)ClientPort)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        LOBYTE(ClientPort) = 1;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(ClientPort) = 1;
  }

  return ClientPort;
}

- (id)getCallingConnectionBundleID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](RPConnectionManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentConnection"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", objc_msgSend(v3, "processIdentifier")));
  return v4;
}

- (id)checkSufficientFreeSpace
{
  void *v2;
  unsigned __int8 v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "_srDeviceHasSufficientFreeSpaceForRecording");

  if ((v3 & 1) != 0)
    return 0;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPSession checkSufficientFreeSpace]";
    v7 = 1024;
    v8 = 946;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d insufficient disk space for recording", (uint8_t *)&v5, 0x12u);
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5805, 0));
}

- (id)checkApplicationForegroundRequirement
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (-[RPApplicationStateMonitor isApplicationInForegroundWithBundleIdentifier:](self->_applicationStateMonitor, "isApplicationInForegroundWithBundleIdentifier:", self->_bundleID))
  {
    return 0;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPSession checkApplicationForegroundRequirement]";
    v5 = 1024;
    v6 = 958;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start recording with application not in the foreground", (uint8_t *)&v3, 0x12u);
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
}

- (id)checkMultiWindowRequirement
{
  void *v2;
  BOOL v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (self->_levelOneElementCount < 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5807, 0));
    if (v2)
      v3 = dword_100095B40 > 1;
    else
      v3 = 1;
    if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "-[RPSession checkMultiWindowRequirement]";
      v7 = 1024;
      v8 = 970;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start recording in split mode, bailing out", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2;
}

- (id)checkMinWindowSizeRequirement:(CGSize)a3
{
  double height;
  double width;
  void *v5;

  height = a3.height;
  width = a3.width;
  if (a3.height <= 0.0 || a3.width <= 0.0)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D118(width, height);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5834, 0));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)getAcknowledgementAlertResultsWithMicrophone:(BOOL)a3 cameraEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned __int8 v7;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  RPSession *v25;

  v4 = a4;
  v5 = a3;
  if ((self->_sessionType - 5) < 3
    || +[RPConnectionManager hasUnitTestEntitlement](RPConnectionManager, "hasUnitTestEntitlement"))
  {
    -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v5);
    -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v4);
    return 1;
  }
  if (-[RPSession shouldSupressAlert](self, "shouldSupressAlert"))
  {
    -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v5);
    -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v4);
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136446722;
      v19 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      v20 = 1024;
      v21 = 1002;
      v22 = 2080;
      v23 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %s internal settings suppressAlert", (uint8_t *)&v18, 0x1Cu);
    }
    return 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession showAcknowledgementAlertWithMicrophone:camera:](self, "showAcknowledgementAlertWithMicrophone:camera:", v5, v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("microphoneEnabled")));
  self->_didAcceptMicrophonePermission |= objc_msgSend(v10, "BOOLValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("cameraEnabled")));
  self->_didAcceptCameraPermission |= objc_msgSend(v11, "BOOLValue");

  v12 = self->_didAcceptMicrophonePermission && v5;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v12);
  v13 = self->_didAcceptCameraPermission && v4;
  -[RPSession setCameraEnabled:](self, "setCameraEnabled:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("alertResponse")));
  v7 = objc_msgSend(v14, "BOOLValue");

  if ((v7 & 1) == 0 && dword_100095B40 <= 1)
  {
    v7 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v17 = (char *)objc_claimAutoreleasedReturnValue(v16);
      v18 = 136446978;
      v19 = "-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:]";
      v20 = 1024;
      v21 = 1017;
      v22 = 2112;
      v23 = v17;
      v24 = 2048;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p user declined session", (uint8_t *)&v18, 0x26u);

      return 0;
    }
  }
  return v7;
}

- (BOOL)shouldSupressAlert
{
  CFPropertyListRef v3;
  BOOL v4;
  CFPropertyListRef v5;
  double v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;

  if (!os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.replayd"), "UTF8String")))
    return 0;
  v3 = CFPreferencesCopyAppValue(CFSTR("RPSuppressAlert"), CFSTR("com.apple.replayd"));
  v4 = v3 != 0;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "-[RPSession shouldSupressAlert]";
    v10 = 1024;
    v11 = 1031;
    v12 = 1024;
    v13 = v3 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d suppressAlert=%d", (uint8_t *)&v8, 0x18u);
  }
  v5 = CFPreferencesCopyAppValue(CFSTR("RPEnableShortPrivacyTrigger"), CFSTR("com.apple.replayd"));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "-[RPSession shouldSupressAlert]";
    v10 = 1024;
    v11 = 1033;
    v12 = 1024;
    v13 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d shortPrivacyPrompt=%d", (uint8_t *)&v8, 0x18u);
  }
  v6 = 0.333333333;
  if (!v5)
    v6 = 8.0;
  self->_privacyAcknowledgementAlertTimeoutMinutes = v6;
  if (v3)
  {
    CFRelease(v3);
    return 1;
  }
  return v4;
}

- (id)showAcknowledgementAlertWithMicrophone:(BOOL)a3 camera:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_class *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __CFDictionary *Mutable;
  void *v16;
  void *v17;
  _BOOL4 v18;
  int sessionType;
  const void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  __CFUserNotification *v28;
  __CFUserNotification *v29;
  BOOL v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  int v43;
  char v44;
  void *v45;
  void *v46;
  void *value;
  void *v48;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  _BYTE v55[10];
  RPSession *v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;

  v4 = a4;
  v5 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 136447490;
    v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    v52 = 1024;
    v53 = 1055;
    v54 = 2112;
    *(_QWORD *)v55 = v9;
    *(_WORD *)&v55[8] = 2048;
    v56 = self;
    v57 = 1024;
    v58 = v5;
    v59 = 1024;
    v60 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p microphoneEnabled: %d cameraEnabled: %d", buf, 0x32u);

  }
  if (!self->_didAcceptCameraPermission && v4
    || (!self->_didAcceptMicrophonePermission ? (v10 = !v5) : (v10 = 1), !v10))
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
      v52 = 1024;
      v53 = 1059;
      v54 = 1024;
      *(_DWORD *)v55 = v4;
      *(_WORD *)&v55[4] = 1024;
      *(_DWORD *)&v55[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement required requesting camera %d and microphone %d", buf, 0x1Eu);
    }
    self->_isExempt = 0;
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  if (!self->_isExempt)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession getNotificationTitleTextForSessionType:bundleID:](self, "getNotificationTitleTextForSessionType:bundleID:", self->_sessionType, self->_bundleID));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession getNotificationBodyTextForSessionType:cameraEnabled:microphoneEnabled:](self, "getNotificationBodyTextForSessionType:cameraEnabled:microphoneEnabled:", self->_sessionType, v4, v5));
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v14);
    v45 = v16;
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](NSBundle, "_rpFrameworkBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleURL"));

    value = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON")));
    HIDWORD(v42) = !v4;
    v18 = !v5;
    LODWORD(v42) = !v5 || !v4;
    if ((v42 & 1) != 0)
    {
      if (v18 || v4)
      {
        sessionType = self->_sessionType;
        if (HIDWORD(v42) | v5)
        {
          v20 = v48;
          if (sessionType == 3)
            v21 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED");
          else
            v21 = CFSTR("ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_DISABLED");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v21, v42));
          v27 = 0;
          goto LABEL_34;
        }
        v22 = CFSTR("ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_CAMERA");
        v23 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_CAMERA");
      }
      else
      {
        sessionType = self->_sessionType;
        v22 = CFSTR("ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1");
        v23 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1");
      }
    }
    else
    {
      sessionType = self->_sessionType;
      v22 = CFSTR("ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED");
      v23 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_1_MICROPHONE_CAMERA_ENABLED");
    }
    if (sessionType == 3)
      v24 = v23;
    else
      v24 = v22;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v24, v42));
    if (self->_sessionType == 3)
      v26 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_ACCEPT_BUTTON_2");
    else
      v26 = CFSTR("ACKNOWLEDGEMENT_ALERT_ACCEPT_BUTTON_2");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v26));
    v20 = v48;
LABEL_34:
    v46 = v27;
    if (v25)
    {
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v25);
      v27 = v46;
    }
    if (v27)
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v27);
    CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, value);
    if (v20)
      CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v20);
    v28 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, Mutable);
    if (!v28)
    {
      if (Mutable)
        CFRelease(Mutable);
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004D1CC();
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v11, "setObject:forKey:", v32, CFSTR("cameraEnabled"));

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v11, "setObject:forKey:", v33, CFSTR("microphoneEnabled"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v11, "setObject:forKey:", v34, CFSTR("alertResponse"));

      self->_isExempt = 0;
      v35 = v45;
      goto LABEL_73;
    }
    v29 = v28;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v28, 0.0, &responseFlags);
    if (responseFlags != 2)
    {
      if (responseFlags != 1)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
          v52 = 1024;
          v53 = 1175;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement refused", buf, 0x12u);
        }
        v31 = 0;
        v36 = 0;
        v37 = 0;
        goto LABEL_71;
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
        v52 = 1024;
        v53 = 1142;
        v54 = 1024;
        *(_DWORD *)v55 = v4;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)&v55[6] = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement accepted for camera %d and microphone %d", buf, 0x1Eu);
      }
      if (v43)
      {
        if (v18 || v4)
        {
          v30 = v44 | v5;
          v31 = 1;
          if (v30)
            goto LABEL_72;
          goto LABEL_60;
        }
        v31 = 0;
      }
      else
      {
        v31 = 1;
      }
      v36 = 1;
      goto LABEL_70;
    }
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
      v52 = 1024;
      v53 = 1166;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user acknowledgement accepted, but no consent for microphone or camera", buf, 0x12u);
    }
    v31 = 0;
LABEL_60:
    v36 = 0;
LABEL_70:
    v37 = 1;
LABEL_71:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v31));
    objc_msgSend(v11, "setObject:forKey:", v38, CFSTR("cameraEnabled"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v36));
    objc_msgSend(v11, "setObject:forKey:", v39, CFSTR("microphoneEnabled"));

    v31 = v37;
LABEL_72:
    v35 = v45;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v31));
    objc_msgSend(v11, "setObject:forKey:", v40, CFSTR("alertResponse"));

    self->_isExempt = v31;
    CFRelease(v29);
    CFRelease(Mutable);
LABEL_73:

    goto LABEL_74;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v51 = "-[RPSession showAcknowledgementAlertWithMicrophone:camera:]";
    v52 = 1024;
    v53 = 1200;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is still exempt from showing the alert", buf, 0x12u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RPSession cameraEnabled](self, "cameraEnabled")));
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("cameraEnabled"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RPSession microphoneEnabled](self, "microphoneEnabled")));
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("microphoneEnabled"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("alertResponse"));
LABEL_74:

  return v11;
}

- (id)getNotificationTitleTextForSessionType:(int)a3 bundleID:(id)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", self->_bundleID, a4));
  switch(self->_sessionType)
  {
    case 1:
      v6 = CFSTR("ACKNOWLEDGEMENT_CAPTURE_ALERT_TITLE");
      goto LABEL_7;
    case 2:
      v6 = CFSTR("ACKNOWLEDGEMENT_ALERT_TITLE");
      goto LABEL_7;
    case 3:
      v6 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_TITLE");
      goto LABEL_7;
    case 4:
      v6 = CFSTR("ACKNOWLEDGEMENT_CLIPS_ALERT_TITLE");
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5));

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)getNotificationBodyTextForSessionType:(int)a3 cameraEnabled:(BOOL)a4 microphoneEnabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  const __CFString *v12;
  int sessionType;
  void *v14;
  uint64_t v15;

  v5 = a5;
  v6 = a4;
  v8 = self->_sessionType - 1;
  if (v8 <= 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", off_100081240[v8]));
    if (!v6)
      goto LABEL_3;
LABEL_7:
    sessionType = self->_sessionType;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR(" ")));
    if (sessionType == 3)
    {
      v12 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_CAMERA");
      goto LABEL_10;
    }
LABEL_9:
    v12 = CFSTR("ACKNOWLEDGEMENT_ALERT_BODY_CAMERA");
    goto LABEL_10;
  }
  v9 = 0;
  if (a4)
    goto LABEL_7;
LABEL_3:
  if (v5)
  {
    v10 = self->_sessionType;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR(" ")));
    if (v10 == 3)
    {
      v12 = CFSTR("ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_MIC");
LABEL_10:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v12));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v14));

      v9 = (void *)v15;
      return v9;
    }
    goto LABEL_9;
  }
  return v9;
}

- (BOOL)shouldBypassAlertForTest
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.replayKit.ReplayKitTestRunneriOS"));

  return v3;
}

- (BOOL)showStopSystemSessionAlert
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  int sessionState;
  __CFUserNotification *v16;
  int sessionType;
  RPClientProtocol *clientProxy;
  const __CFString *v19;
  CFOptionFlags responseFlags;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  RPSession *v31;
  __int16 v32;
  int v33;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 136446978;
    v25 = "-[RPSession showStopSystemSessionAlert]";
    v26 = 1024;
    v27 = 1298;
    v28 = 2112;
    v29 = v5;
    v30 = 2048;
    v31 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);

  }
  if (self->_sessionState == 1)
  {
    -[RPSession pauseSession](self, "pauseSession");
    if (self->_sessionType == 6)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_BODY")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPStatusBarAssertion broadcastServiceName](self->_statusBarAssertion, "broadcastServiceName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_ACCEPT_BUTTON")));

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_TITLE")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_BODY")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_ACCEPT_BUTTON")));
    }
    v22[0] = kCFUserNotificationAlertHeaderKey;
    v22[1] = kCFUserNotificationAlertMessageKey;
    v23[0] = v6;
    v23[1] = v9;
    v22[2] = kCFUserNotificationOtherButtonTitleKey;
    v22[3] = kCFUserNotificationDefaultButtonTitleKey;
    v23[2] = v11;
    v23[3] = v10;
    v16 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));
    self->_userNotificationStopRecording = v16;
    if (v16)
    {
      responseFlags = 0;
      CFUserNotificationReceiveResponse(v16, 0.0, &responseFlags);
      if (responseFlags != 2)
      {
        if (!responseFlags)
        {
          if (dword_100095B40 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v25 = "-[RPSession showStopSystemSessionAlert]";
            v26 = 1024;
            v27 = 1332;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user stop recording or broadcast", buf, 0x12u);
          }
          -[RPSession handleSystemAlertStop](self, "handleSystemAlertStop");
        }
        goto LABEL_30;
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v25 = "-[RPSession showStopSystemSessionAlert]";
        v26 = 1024;
        v27 = 1336;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user canceled stop of recording or broadcast", buf, 0x12u);
      }
      sessionType = self->_sessionType;
      if (sessionType == 6)
      {
        clientProxy = self->_clientProxy;
        v19 = CFSTR("RPSystemBroadcast");
      }
      else
      {
        if (sessionType != 5)
        {
LABEL_30:
          CFRelease(self->_userNotificationStopRecording);
          self->_userNotificationStopRecording = 0;
          goto LABEL_31;
        }
        clientProxy = self->_clientProxy;
        v19 = CFSTR("RPSystemRecording");
      }
      -[RPClientProtocol shouldResumeSessionType:](clientProxy, "shouldResumeSessionType:", v19);
      goto LABEL_30;
    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D244();
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      sessionState = self->_sessionState;
      *(_DWORD *)buf = 136447234;
      v25 = "-[RPSession showStopSystemSessionAlert]";
      v26 = 1024;
      v27 = 1302;
      v28 = 2112;
      v29 = v14;
      v30 = 2048;
      v31 = self;
      v32 = 1024;
      v33 = sessionState;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p ignore stop session in state %d", buf, 0x2Cu);

    }
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v6 = 0;
  }
LABEL_31:

  return 0;
}

- (id)serviceNameForReporting
{
  unsigned int v2;

  v2 = self->_sessionType - 1;
  if (v2 > 5)
    return 0;
  else
    return off_100081260[v2];
}

- (void)sessionReportCameraUsage:(int64_t)a3
{
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  id v7;

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
    v5 = objc_msgSend(v4, "backCameraUsed");
  }
  else
  {
    if (a3 != 2)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
    v5 = objc_msgSend(v4, "frontCameraUsed");
  }
  v6 = v5;

  if ((v6 & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RPSession reportingAgent](self, "reportingAgent"));
    objc_msgSend(v7, "setFrontCameraUsed:", 1);

  }
}

- (BOOL)showAlertRecordingCaptureSessionWithError:(id)a3
{
  id v4;
  BOOL v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFUserNotification *v15;
  __CFUserNotification *v16;
  CFOptionFlags responseFlags;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  RPSession *v28;

  v4 = a3;
  v5 = -[RPSession shouldBypassAlertForTest](self, "shouldBypassAlertForTest");
  if (!v5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class(self);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 136446978;
      v22 = "-[RPSession showAlertRecordingCaptureSessionWithError:]";
      v23 = 1024;
      v24 = 1405;
      v25 = 2112;
      v26 = v8;
      v27 = 2048;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", buf, 0x26u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_FAILED_ALERT_MESSAGE_FORMAT")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_TITLE")));
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_FAILED_ALERT_OK_BUTTON")));
    v19[0] = kCFUserNotificationAlertHeaderKey;
    v19[1] = kCFUserNotificationAlertMessageKey;
    v20[0] = v12;
    v20[1] = v13;
    v19[2] = kCFUserNotificationDefaultButtonTitleKey;
    v20[2] = v14;
    v15 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
    if (v15)
    {
      v16 = v15;
      responseFlags = 0;
      CFUserNotificationReceiveResponse(v15, 0.0, &responseFlags);
      if (!responseFlags
        && dword_100095B40 <= 1
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[RPSession showAlertRecordingCaptureSessionWithError:]";
        v23 = 1024;
        v24 = 1434;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user has hit okay, alert will be dismissed", buf, 0x12u);
      }
      CFRelease(v16);
    }
    else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004D2BC();
    }

  }
  return v5;
}

- (void)checkAndPlaySystemSessionSoundForRecordingOn:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (+[RPHardwareUtility supportsShutterSound](RPHardwareUtility, "supportsShutterSound")
    || +[RPHardwareUtility isVoiceOverRunning](RPHardwareUtility, "isVoiceOverRunning"))
  {
    if (v3)
      AudioServicesPlaySystemSound(0x45Du);
    else
      AudioServicesPlaySystemSound(0x45Eu);
  }
}

+ (unint64_t)getFileSizeForURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v9 = 0;
  v8 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v9, NSURLFileSizeKey, &v8);
  v4 = v9;
  v5 = v8;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v11 = "+[RPSession getFileSizeForURL:]";
      v12 = 1024;
      v13 = 1474;
      v14 = 2048;
      v15 = v6;
      v16 = 2112;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recordedFileSize for URL %lu bytes URL: %@", buf, 0x26u);
    }
  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D334(v5);
    v6 = 0;
  }

  return (unint64_t)v6;
}

- (void)timerDidUpdate:(id)a3
{
  -[RPSession handleTimerDidUpdate:](self, "handleTimerDidUpdate:", a3);
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  void (**v6)(_QWORD);

  v6 = (void (**)(_QWORD))a5;
  -[RPSession showStopSystemSessionAlert](self, "showStopSystemSessionAlert");
  v6[2](v6);

  return 1;
}

- (void)frontmostApplicationDidChange:(id)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  RPSession *v15;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 136446978;
    v9 = "-[RPSession frontmostApplicationDidChange:]";
    v10 = 1024;
    v11 = 1518;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v8, 0x26u);

  }
  -[RPSession handleFrontmostApplicationDidChange:](self, "handleFrontmostApplicationDidChange:", v4);

}

- (void)clientApplicationDidEnterBackground
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  RPSession *v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 136446978;
    v7 = "-[RPSession clientApplicationDidEnterBackground]";
    v8 = 1024;
    v9 = 1524;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);

  }
  -[RPSession handleClientApplicationDidEnterBackground](self, "handleClientApplicationDidEnterBackground");
  -[RPSession startAcknowledgementAlertTimer](self, "startAcknowledgementAlertTimer");
}

- (void)clientApplicationDidEnterForeground
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  RPSession *v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 136446978;
    v7 = "-[RPSession clientApplicationDidEnterForeground]";
    v8 = 1024;
    v9 = 1531;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@ %p", (uint8_t *)&v6, 0x26u);

  }
  -[RPSession handleClientApplicationDidEnterForeground](self, "handleClientApplicationDidEnterForeground");
}

- (void)setupDispatchLimits
{
  self->_dispatchVideoCount = 0;
  self->_dispatchAudioCount = 0;
}

- (BOOL)dispatchLimitReached:(int64_t)a3
{
  int v3;
  uint64_t v5;
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  v5 = 264;
  if (a3 == 1)
    v5 = 200;
  v6 = (pthread_mutex_t *)((char *)self + v5);
  if (a3 == 1)
    v7 = 184;
  else
    v7 = 192;
  pthread_mutex_lock(v6);
  v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  if (v8 <= 4)
    *(Class *)((char *)&self->super.isa + v7) = (Class)(v8 + 1);
  pthread_mutex_unlock(v6);
  v9 = v8 < 5 || dword_100095B40 > 2;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004D3C8(v3);
  return v8 > 4;
}

- (void)dispatchCompleted:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  pthread_mutex_t *v6;

  v4 = 264;
  if (a3 == 1)
  {
    v4 = 200;
    v5 = 184;
  }
  else
  {
    v5 = 192;
  }
  v6 = (pthread_mutex_t *)((char *)self + v4);
  pthread_mutex_lock((pthread_mutex_t *)((char *)self + v4));
  --*(Class *)((char *)&self->super.isa + v5);
  pthread_mutex_unlock(v6);
}

- (void)sendBiomeEventWithSessionState:(int)a3
{
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
    -[RPSession sendBiomeEventIsStarting:](self, "sendBiomeEventIsStarting:", a3 == 1);
}

- (void)sendBiomeEventIsStarting:(BOOL)a3
{
  _BOOL8 v3;
  int sessionType;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  int v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;

  v3 = a3;
  sessionType = self->_sessionType;
  if (sessionType == 6 || sessionType == 3)
  {
    v7 = (void *)objc_opt_new(BMScreenSharingStream, a2);
    v8 = (objc_class *)BMScreenSharingEvent;
  }
  else
  {
    v7 = (void *)objc_opt_new(BMScreenRecordingStream, a2);
    v8 = (objc_class *)BMScreenRecordingEvent;
  }
  v9 = objc_msgSend([v8 alloc], "initWithIsStart:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "source"));
  objc_msgSend(v10, "sendEvent:", v9);

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_sessionType;
    v12 = CFSTR("stop");
    v14 = "-[RPSession sendBiomeEventIsStarting:]";
    v13 = 136446978;
    v15 = 1024;
    if (v3)
      v12 = CFSTR("start");
    v16 = 1654;
    v17 = 1024;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending Biome event for sessionType:%d %@", (uint8_t *)&v13, 0x22u);
  }
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
}

- (BOOL)cameraEnabled
{
  return self->_cameraEnabled;
}

- (void)setCameraEnabled:(BOOL)a3
{
  self->_cameraEnabled = a3;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (RPReportingAgent)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
  objc_storeStrong((id *)&self->_reportingAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingAgent, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_lastExemptTime, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end
