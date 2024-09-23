@implementation CMContinuityCaptureDServer

- (CMContinuityCaptureDServer)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureDServer *v6;
  CMContinuityCaptureDServer *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *shieldLaunchCheckQueue;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *sidebandMessageQueue;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *sessionsPendingActivation;
  CMContinuityCaptureLockScreenLayoutMonitor *v19;
  CMContinuityCaptureLockScreenLayoutMonitor *lockScreenLayoutMonitor;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CMContinuityCaptureDServer;
  v6 = -[CMContinuityCaptureDServer init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_checkLastUserPressedPauseState = 1;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.continuitycapture.shieldlaunch", v9);
    shieldLaunchCheckQueue = v7->_shieldLaunchCheckQueue;
    v7->_shieldLaunchCheckQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.continuitycapture.sidebandMessageQueue", v13);
    sidebandMessageQueue = v7->_sidebandMessageQueue;
    v7->_sidebandMessageQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v7, CFSTR("activeSession"), 3, 0);

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessionsPendingActivation = v7->_sessionsPendingActivation;
    v7->_sessionsPendingActivation = v17;

    objc_initWeak(&location, v7);
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100006B44;
    v25 = &unk_100018670;
    objc_copyWeak(&v26, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    atomic_store(1u, (unsigned __int8 *)&v7->_observingActiveKVOs);
    v19 = (CMContinuityCaptureLockScreenLayoutMonitor *)objc_alloc_init((Class)CMContinuityCaptureLockScreenLayoutMonitor);
    lockScreenLayoutMonitor = v7->_lockScreenLayoutMonitor;
    v7->_lockScreenLayoutMonitor = v19;

    -[CMContinuityCaptureLockScreenLayoutMonitor setDelegate:](v7->_lockScreenLayoutMonitor, "setDelegate:", v7, v22, v23, v24, v25);
    -[CMContinuityCaptureDServer setupRPRemoteDisplayDiscovery](v7, "setupRPRemoteDisplayDiscovery");
    -[CMContinuityCaptureDServer setupDisplayServer](v7, "setupDisplayServer");
    -[CMContinuityCaptureDServer setupSidebandRPClient](v7, "setupSidebandRPClient");
  }

  return v7;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_observingActiveKVOs);
  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("activeSession"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureCallStateKVOKey, 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureDServer;
  -[CMContinuityCaptureDServer dealloc](&v6, "dealloc");
}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  CMContinuityCaptureDServer *v12;
  __int16 v13;
  const char *v14;

  v4 = (void (**)(id, void *))a3;
  v6 = CMContinuityCaptureLog(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2080;
    v14 = "-[CMContinuityCaptureDServer requestContinuityCaptureUIConfiguration:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", (uint8_t *)&v11, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSession"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
  v4[2](v4, v10);

}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[4];
  id v10[2];
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  objc_initWeak(&location, self);
  v6 = CMContinuityCaptureLog(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2080;
    v15 = "-[CMContinuityCaptureDServer resumeStreamingForEvent:]";
    v16 = 1024;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s event %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006ECC;
  block[3] = &unk_1000188B0;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)pauseSessionForEvent:(int64_t)a3
{
  NSObject *queue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006FF8;
  v6[3] = &unk_1000188D8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)disconnectSession
{
  -[CMContinuityCaptureDServer disconnectSession:reason:](self, "disconnectSession:reason:", 1, kCMContinuityCaptureSessionExitReasonUserDisconnect);
}

- (void)disconnectSession:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CMContinuityCaptureDServer *v17;
  id v18;
  id v19;
  BOOL v20;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeSession"));

  v10 = CMContinuityCaptureLog(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v23 = self;
    v24 = 2080;
    v25 = "-[CMContinuityCaptureDServer disconnectSession:reason:]";
    v26 = 2114;
    v27 = v6;
    v28 = 1024;
    v29 = v4;
    v30 = 2114;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s reason %{public}@ relayMessage %d activeSession %{public}@", buf, 0x30u);
  }

  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000073F4;
  v15[3] = &unk_100018900;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = self;
  v18 = v6;
  v20 = v4;
  v13 = v6;
  v14 = v8;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)skipPlacementStep
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v11;
  __int16 v12;
  const char *v13;

  objc_initWeak(&location, self);
  v4 = CMContinuityCaptureLog(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureDServer skipPlacementStep]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007900;
  v7[3] = &unk_100018670;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)prepareForPullConversation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v15;
  __int16 v16;
  const char *v17;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = CMContinuityCaptureLog(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2080;
    v17 = "-[CMContinuityCaptureDServer prepareForPullConversation:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007A98;
  block[3] = &unk_100018928;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)postCameraCapabilitiesToDeviceWithIdentifier:(id)a3 andModel:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  CMContinuityCaptureDServer *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100007D08;
  v18 = sub_100007D18;
  v19 = 0;
  v7 = &_dispatch_main_q;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D20;
  block[3] = &unk_100018950;
  block[4] = &v14;
  dispatch_async_and_wait((dispatch_queue_t)&_dispatch_main_q, block);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15[5], "dictionaryRepresentation"));
  if (v9)
  {
    v10 = CMContinuityCaptureLog(0, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      v24 = 2114;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ capabilities dispatched to %{public}@", buf, 0x16u);
    }

    v20[0] = ContinuityCaptureRapportClientMessageTypeKey;
    v20[1] = ContinuityCaptureRapportClientEventCapabilitiesPayloadKey;
    v21[0] = &off_100018FD0;
    v21[1] = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v12, v6, a4);

  }
  _Block_object_dispose(&v14, 8);

}

- (void)postEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  CMContinuityCaptureDServer *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v9 = CMContinuityCaptureLog(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ event %{public}@ dispatch event to %{public}@", buf, 0x20u);
  }

  v12[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v12[1] = ContinuityCaptureRapportClientEventNameKey;
  v13[0] = &off_100018FB8;
  v13[1] = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v11, v7, 0);

}

- (void)relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *sidebandMessageQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  sidebandMessageQueue = self->_sidebandMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007F80;
  block[3] = &unk_100018978;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(sidebandMessageQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_relayMessage:(id)a3 toDeviceWithIdentifier:(id)a4 andModel:(int64_t)a5
{
  id v8;
  id v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  dispatch_time_t v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sidebandMessageQueue);
  global_queue = dispatch_get_global_queue(2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
  objc_msgSend(v13, "setIdentifier:", v9);
  v14 = objc_alloc_init((Class)RPCompanionLinkClient);
  objc_msgSend(v14, "setDispatchQueue:", v11);
  v15 = (unint64_t)objc_msgSend(v14, "controlFlags");
  if (a5 == 1)
    v16 = 65542;
  else
    v16 = 0x180000010006;
  objc_msgSend(v14, "setControlFlags:", v15 | v16);
  objc_msgSend(v14, "setDestinationDevice:", v13);
  v18 = CMContinuityCaptureLog(0, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_loadWeakRetained(&location);
    *(_DWORD *)buf = 138544130;
    v35 = v20;
    v36 = 2114;
    v37 = v13;
    v38 = 2114;
    v39 = v14;
    v40 = 1024;
    v41 = a5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Device to Connect %{public}@ overClient %{public}@ model %d", buf, 0x26u);

  }
  if (v13)
  {
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_1000082A8;
    v27 = &unk_1000189C8;
    objc_copyWeak(&v32, &location);
    v21 = v12;
    v28 = v21;
    v29 = v8;
    v22 = v14;
    v30 = v22;
    v31 = v13;
    objc_msgSend(v22, "activateWithCompletion:", &v24);
    v23 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v21, v23);
    objc_msgSend(v22, "invalidate", v24, v25, v26, v27);

    objc_destroyWeak(&v32);
  }

  objc_destroyWeak(&location);
}

- (void)shieldDidDisconnect
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008750;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)shieldDidConnect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  objc_msgSend(v2, "shieldDidConnect");

}

- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v10 = CMContinuityCaptureLog(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v21 = self;
    v22 = 2080;
    v23 = "-[CMContinuityCaptureDServer incomingCall:data:shouldDisplayNotification:]";
    v24 = 1024;
    v25 = v6;
    v26 = 1024;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d shouldDisplayNotification: %d", buf, 0x22u);
  }

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008AD4;
  v14[3] = &unk_1000189F0;
  objc_copyWeak(&v16, &location);
  v17 = v6;
  v15 = v8;
  v18 = v5;
  v13 = v8;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)callActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *queue;
  _QWORD block[4];
  id v19;
  BOOL v20;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  _BOOL4 v27;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeSession"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v10 = objc_msgSend(v9, "clientDeviceModel");

    if (v10 == (id)2)
    {
      v12 = CMContinuityCaptureLog(0, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v23 = self;
        v24 = 2080;
        v25 = "-[CMContinuityCaptureDServer callActive:]";
        v26 = 1024;
        v27 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d, ignore event for atv session", buf, 0x1Cu);
      }

      return;
    }
  }
  else
  {

  }
  objc_initWeak(&location, self);
  v15 = CMContinuityCaptureLog(0, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2080;
    v25 = "-[CMContinuityCaptureDServer callActive:]";
    v26 = 1024;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %s status %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E88;
  block[3] = &unk_100018A18;
  objc_copyWeak(&v19, &location);
  v20 = v3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)activate
{
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  NSObject *queue;
  _QWORD *v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v14;
  __int16 v15;
  const char *v16;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2080;
    v16 = "-[CMContinuityCaptureDServer activate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000090B0;
  v11[3] = &unk_100018838;
  objc_copyWeak(&v12, (id *)buf);
  v5 = objc_retainBlock(v11);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009198;
  block[3] = &unk_100018928;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000927C;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  BOOL v21;
  BOOL v22;
  id location;

  v12 = a3;
  v13 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000093BC;
  v17[3] = &unk_100018A40;
  objc_copyWeak(v20, &location);
  v18 = v12;
  v19 = v13;
  v20[1] = (id)a5;
  v21 = a6;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)_launchShieldUIForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *shieldLaunchCheckQueue;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  BOOL v24;
  BOOL v25;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  _BOOL4 v34;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = CMContinuityCaptureLog(0, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v28 = self;
    v29 = 2080;
    v30 = "-[CMContinuityCaptureDServer _launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:]";
    v31 = 2114;
    v32 = v12;
    v33 = 1024;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ %s identifier %{public}@ skipPlacementStep %d", buf, 0x26u);
  }

  shieldLaunchCheckQueue = self->_shieldLaunchCheckQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000095E0;
  v20[3] = &unk_100018A40;
  objc_copyWeak(v23, &location);
  v23[1] = (id)a5;
  v24 = v8;
  v21 = v12;
  v22 = v13;
  v25 = a7;
  v18 = v13;
  v19 = v12;
  dispatch_async(shieldLaunchCheckQueue, v20);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)teardownShieldUI
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009FF0;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_teardownShieldUI
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v17;
  __int16 v18;
  const char *v19;

  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeSession"));
  v5 = v4 == 0;

  if (!v5)
  {
    v7 = CMContinuityCaptureLog(0, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2080;
      v19 = "-[CMContinuityCaptureDServer _teardownShieldUI]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pauseStateSolver"));
    objc_msgSend(v11, "saveUserPauseState:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    objc_msgSend(v12, "tearDownShield");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A1F8;
    v13[3] = &unk_100018670;
    objc_copyWeak(&v14, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

- (void)teardownSession
{
  uint64_t v3;
  NSObject *v4;
  CMContinuityCaptureRapportServer *rpServer;
  CMContinuityCaptureRapportServer *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  CMContinuityCaptureRapportServer *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id sessionClearOutBlock;
  id v21;
  void *v22;
  CMContinuityCaptureRapportServer *v23;
  RPRemoteDisplaySession *connectedRPDisplaySession;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  _QWORD block[5];
  _QWORD v43[2];
  _QWORD v44[2];
  uint8_t buf[4];
  CMContinuityCaptureDServer *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  CMContinuityCaptureRapportServer *v50;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rpServer = self->_rpServer;
    *(_DWORD *)buf = 138543874;
    v46 = self;
    v47 = 2080;
    v48 = "-[CMContinuityCaptureDServer teardownSession]";
    v49 = 2112;
    v50 = rpServer;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = self->_rpServer;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](v6, "compositeDevice"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer localDevice](self->_rpServer, "localDevice"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
      v10 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

      v11 = (CMContinuityCaptureRapportServer *)-[CMContinuityCaptureRapportServer currentSessionID](self->_rpServer, "currentSessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
      v15 = objc_msgSend(v14, "clientDeviceModel");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "queue"));
      dispatch_assert_queue_not_V2(v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A71C;
      block[3] = &unk_100018798;
      block[4] = self;
      dispatch_async_and_wait(v19, block);

      -[CMContinuityCaptureRapportServer removeObserver:forKeyPath:context:](self->_rpServer, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureRemoteStreamPreStartConfigKVOKey, 0);
      +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 0);
      sessionClearOutBlock = self->_sessionClearOutBlock;
      if (sessionClearOutBlock)
      {
        dispatch_block_cancel(sessionClearOutBlock);
        v21 = self->_sessionClearOutBlock;
        self->_sessionClearOutBlock = 0;

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
      objc_msgSend(v22, "invalidate");

      -[CMContinuityCaptureRapportServer cancel](self->_rpServer, "cancel");
      v23 = self->_rpServer;
      self->_rpServer = 0;

      connectedRPDisplaySession = self->_connectedRPDisplaySession;
      self->_connectedRPDisplaySession = 0;

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activeSession"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pauseStateSolver"));
      objc_msgSend(v27, "saveUserPauseState:", 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "activeSession"));

      if (v29)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "activeSession"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "configuration"));
        objc_msgSend(v33, "setCompositeState:", 0);

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "activeSession"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "configuration"));
        objc_msgSend(v34, "updateClientsWithConfiguration:", v37);

      }
      v38 = CMContinuityCaptureLog(0, v30);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v46 = self;
        v47 = 2114;
        v48 = v10;
        v49 = 2048;
        v50 = v11;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ teardown session event for %{public}@ currentSessionID %llx", buf, 0x20u);
      }

      v43[0] = ContinuityCaptureRapportClientMessageTypeKey;
      v43[1] = ContinuityCaptureRapportClientTransportSessionIDKey;
      v44[0] = &off_100018FE8;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      v44[1] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
      -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v41, v10, v15);

    }
  }
}

- (BOOL)activeCallSession
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  if (objc_msgSend(v2, "callState"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
    v4 = objc_msgSend(v3, "activeCallCountOnMainQueue") != 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)createSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  OS_dispatch_queue *queue;
  CMContinuityCaptureRapportServer *v17;
  CMContinuityCaptureRapportServer *rpServer;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  CMContinuityCaptureDServer *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unsigned int v29;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_rpServer)
  {
    v6 = CMContinuityCaptureLog(0, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ skip create session", buf, 0xCu);
    }
  }
  else
  {
    +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 1);
    v7 = objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery dedicatedDevice](self->_rpRemoteDisplayDiscovery, "dedicatedDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));
    v10 = objc_msgSend(v9, "isEqual:", v7);

    v11 = (void *)voucher_copy();
    v13 = CMContinuityCaptureLog(0, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v23 = self;
      v24 = 2114;
      v25 = v4;
      v26 = 2112;
      v27 = v11;
      v28 = 1024;
      v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ create session for %{public}@ voucher %@ isDedicated: %d", buf, 0x26u);
    }

    v15 = objc_alloc((Class)CMContinuityCaptureRapportServer);
    queue = self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000AA58;
    v21[3] = &unk_100018A90;
    v21[4] = self;
    v17 = (CMContinuityCaptureRapportServer *)objc_msgSend(v15, "initWithRapportDisplaySession:queue:voucher:incomingStreamRequestHandler:", v4, queue, v11, v21);
    rpServer = self->_rpServer;
    self->_rpServer = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
      objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CMContinuityCaptureRemoteCompositeStateKVOKey, 3, 0);

      -[CMContinuityCaptureRapportServer addObserver:forKeyPath:options:context:](self->_rpServer, "addObserver:forKeyPath:options:context:", self, CMContinuityCaptureRemoteStreamPreStartConfigKVOKey, 3, 0);
    }
    -[CMContinuityCaptureDServer _resolveUserPauseState](self, "_resolveUserPauseState");

  }
}

- (void)invalidateCurrentSession
{
  CMContinuityCaptureRapportServer *rpServer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  rpServer = self->_rpServer;
  if (rpServer)
    -[CMContinuityCaptureRapportServer invalidateCurrentSession:](rpServer, "invalidateCurrentSession:", 0);
}

+ (id)sessionIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
  if (v7
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceIdentifier")),
        objc_msgSend(v4, "length")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

    if (!v7)
      goto LABEL_6;
  }

LABEL_6:
  if (v9)
    v11 = v9;
  else
    v11 = &stru_100018E78;

  return v11;
}

- (void)postEvent:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id from;
  id location;
  _QWORD v16[2];
  _QWORD v17[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v16[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v16[1] = ContinuityCaptureRapportClientEventNameKey;
  v17[0] = &off_100018FD0;
  v17[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AEBC;
  v10[3] = &unk_100018AB8;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  objc_copyWeak(&v13, &from);
  objc_msgSend(v7, "sendEventID:event:destinationID:options:completion:", ContinuityCaptureSessionEventID, v8, RPDestinationIdentifierDirectPeer, 0, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)resetCurrentSession:(id)a3 added:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v9;
  void (**v10)(_QWORD);
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  CMContinuityCaptureRapportServer *rpServer;
  RPRemoteDisplaySession *connectedRPDisplaySession;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  RPRemoteDisplaySession **p_connectedRPDisplaySession;
  CMContinuityCaptureRapportServer *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  NSObject *v30;
  RPRemoteDisplaySession *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  RPRemoteDisplaySession *v38;
  CMContinuityCaptureRapportServer *v39;
  void *v40;
  RPRemoteDisplaySession *v41;
  RPRemoteDisplaySession *v42;
  CMContinuityCaptureRapportServer *v43;
  void *v44;
  unsigned __int8 v45;
  CMContinuityCaptureRapportServer *v46;
  void *v47;
  unsigned __int8 v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  char *v61;
  id v62;
  void *v63;
  void *v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  _BOOL4 v69;
  CMContinuityCaptureRapportServer *v70;
  RPRemoteDisplaySession **v71;
  void *v72;
  void (**v73)(_QWORD);
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v79;
  CMContinuityCaptureRapportServer *v80;
  uint64_t v81;
  CMContinuityCaptureRapportServer *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  unsigned __int8 v86;
  uint64_t v87;
  NSObject *v88;
  char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  RPRemoteDisplaySession *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  char *v103;
  RPRemoteDisplaySession *v104;
  CMContinuityCaptureRapportServer *v105;
  unsigned __int8 v106;
  void (**v107)(_QWORD);
  id obj;
  uint64_t v109;
  unsigned int v110;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  CMContinuityCaptureRapportServer *v116;
  __int16 v117;
  RPRemoteDisplaySession *v118;
  __int16 v119;
  id v120;
  __int16 v121;
  _BOOL4 v122;
  __int16 v123;
  char *v124;

  v6 = a4;
  v7 = a3;
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  v11 = (char *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
  v14 = CMContinuityCaptureDeviceModelFromModelString();

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery dedicatedDevice](self->_rpRemoteDisplayDiscovery, "dedicatedDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsDeviceIdentifier"));
  v110 = objc_msgSend(v16, "isEqual:", v11);

  v18 = CMContinuityCaptureLog(0, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    rpServer = self->_rpServer;
    connectedRPDisplaySession = self->_connectedRPDisplaySession;
    *(_DWORD *)buf = 138544898;
    v112 = self;
    v113 = 2080;
    v114 = "-[CMContinuityCaptureDServer resetCurrentSession:added:completion:]";
    v115 = 2114;
    v116 = rpServer;
    v117 = 2114;
    v118 = connectedRPDisplaySession;
    v119 = 2114;
    v120 = v9;
    v121 = 1024;
    v122 = v6;
    v123 = 2114;
    v124 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s rpServer %{public}@ _connectedRPDisplaySession %{public}@ resetSession %{public}@ added %d destinationDeviceIdentifier %{public}@", buf, 0x44u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!FigContinuityCaptureGetUserPreferenceDisabled() || !v6)
  {
    v109 = v14;
    p_connectedRPDisplaySession = &self->_connectedRPDisplaySession;
    if (self->_connectedRPDisplaySession)
    {
      v26 = self->_rpServer;
      if (!v26)
        goto LABEL_21;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](v26, "displaySession"));
      v28 = objc_msgSend(v27, "isEqual:", v9);

      if (v28)
      {
        v29 = CMContinuityCaptureLog(0, v22);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v112 = self;
          v113 = 2114;
          v114 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidate current session %{public}@", buf, 0x16u);
        }

        v31 = self->_connectedRPDisplaySession;
        self->_connectedRPDisplaySession = 0;

        -[CMContinuityCaptureDServer invalidateCurrentSession](self, "invalidateCurrentSession");
        if (-[NSMutableArray count](self->_sessionsPendingActivation, "count")
          && (v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject")),
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v32)), v34 = objc_msgSend(v33, "isEqualToString:", v11), v33, v32, v34))
        {
          v36 = CMContinuityCaptureLog(0, v35);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = (RPRemoteDisplaySession *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
            *(_DWORD *)buf = 138544130;
            v112 = self;
            v113 = 2114;
            v114 = v11;
            v115 = 2114;
            v116 = (CMContinuityCaptureRapportServer *)v9;
            v117 = 2114;
            v118 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset (from pending activation) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);

          }
          v39 = self->_rpServer;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
          -[CMContinuityCaptureRapportServer resetDisplaySession:](v39, "resetDisplaySession:", v40);

          v41 = (RPRemoteDisplaySession *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
          v42 = self->_connectedRPDisplaySession;
          self->_connectedRPDisplaySession = v41;

        }
        else
        {
          if (!-[NSMutableArray count](self->_sessionsPendingActivation, "count"))
            goto LABEL_79;
          if (self->_sessionClearOutBlock)
          {
            v82 = self->_rpServer;
            if (!v82)
              goto LABEL_79;
            v83 = objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](v82, "displaySession"));
            if (!v83)
              goto LABEL_79;
            v84 = (void *)v83;
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
            v86 = objc_msgSend(v85, "isEqual:", v9);

            if ((v86 & 1) != 0)
              goto LABEL_79;
          }
          v87 = CMContinuityCaptureLog(0, v81);
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = (char *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
            *(_DWORD *)buf = 138543618;
            v112 = self;
            v113 = 2114;
            v114 = v89;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection (from pending activation) %{public}@", buf, 0x16u);

          }
          -[CMContinuityCaptureDServer teardownSession](self, "teardownSession");
          -[CMContinuityCaptureDServer teardownShieldUI](self, "teardownShieldUI");
          v90 = kCMContinuityCaptureEventCaptureSessionEnded;
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
          -[CMContinuityCaptureDServer postEvent:toSession:](self, "postEvent:toSession:", v90, v91);

        }
        -[NSMutableArray removeObjectAtIndex:](self->_sessionsPendingActivation, "removeObjectAtIndex:", 0);
LABEL_79:
        v10[2](v10);
        -[CMContinuityCaptureDServer _resolveUserPauseState](self, "_resolveUserPauseState");
        goto LABEL_80;
      }
      if (*p_connectedRPDisplaySession)
        goto LABEL_21;
    }
    v43 = self->_rpServer;
    if (!v43
      || (v44 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](v43, "displaySession")),
          v45 = objc_msgSend(v44, "isEqual:", v9),
          v44,
          (v45 & 1) != 0))
    {
LABEL_21:
      v46 = self->_rpServer;
      if (v46)
      {
LABEL_22:
        if (!*p_connectedRPDisplaySession)
          goto LABEL_24;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](v46, "displaySession"));
        v48 = objc_msgSend(v47, "isEqual:", v9);

        if ((v48 & 1) != 0)
          goto LABEL_24;
        if (v6)
        {
          v62 = v7;
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v63));
          v65 = objc_msgSend(v64, "isEqualToString:", v11);

          v67 = CMContinuityCaptureLog(0, v66);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
          if (v65)
          {
            if (v69)
            {
              v70 = (CMContinuityCaptureRapportServer *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
              *(_DWORD *)buf = 138544130;
              v112 = self;
              v113 = 2114;
              v114 = v11;
              v115 = 2114;
              v116 = v70;
              v117 = 2114;
              v118 = (RPRemoteDisplaySession *)v9;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset ((ongoing session) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);

            }
            -[CMContinuityCaptureDServer invalidateCurrentSession](self, "invalidateCurrentSession");
            -[CMContinuityCaptureRapportServer resetDisplaySession:](self->_rpServer, "resetDisplaySession:", v9);
            v71 = &self->_connectedRPDisplaySession;
            v72 = v62;
LABEL_58:
            objc_storeStrong((id *)v71, v72);
            goto LABEL_79;
          }
          if (v69)
          {
            v104 = self->_connectedRPDisplaySession;
            *(_DWORD *)buf = 138543874;
            v112 = self;
            v113 = 2114;
            v114 = (const char *)v9;
            v115 = 2114;
            v116 = v104;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@ (ongoing session: %{public}@)", buf, 0x20u);
          }
          goto LABEL_77;
        }
        if (!-[NSMutableArray containsObject:](self->_sessionsPendingActivation, "containsObject:", v9))
          goto LABEL_79;
        v97 = CMContinuityCaptureLog(0, v96);
        v98 = objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          v99 = self->_connectedRPDisplaySession;
          *(_DWORD *)buf = 138543874;
          v112 = self;
          v113 = 2114;
          v114 = (const char *)v9;
          v115 = 2114;
          v116 = v99;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection removed %{public}@ (ongoing session: %{public}@)", buf, 0x20u);
        }

LABEL_72:
        -[CMContinuityCaptureDServer postEvent:toSession:](self, "postEvent:toSession:", kCMContinuityCaptureEventCaptureSessionEnded, v9);
        -[NSMutableArray removeObject:](self->_sessionsPendingActivation, "removeObject:", v9);
        goto LABEL_79;
      }
      obj = v7;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activeSession"));
      if (v52)
      {
        v53 = (void *)v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v107 = v10;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "activeSession"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "deviceIdentifier"));
        v106 = objc_msgSend(v56, "isEqualToString:", v11);

        v10 = v107;
        if ((v106 & 1) == 0)
        {
          v57 = CMContinuityCaptureLog(0, v22);
          v58 = objc_claimAutoreleasedReturnValue(v57);
          v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
          if (v6)
          {
            if (v59)
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
              v61 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "activeSession"));
              *(_DWORD *)buf = 138543874;
              v112 = self;
              v113 = 2114;
              v114 = v61;
              v115 = 2114;
              v116 = (CMContinuityCaptureRapportServer *)v9;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Shield active for %{public}@, set new connection %{public}@ as pending", buf, 0x20u);

            }
            goto LABEL_78;
          }
          if (!v59)
            goto LABEL_71;
          v102 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
          v103 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "activeSession"));
          *(_DWORD *)buf = 138543874;
          v112 = self;
          v113 = 2114;
          v114 = v103;
          v115 = 2114;
          v116 = (CMContinuityCaptureRapportServer *)v9;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Shield active for %{public}@, remove new connection %{public}@ from pending state", buf, 0x20u);

LABEL_70:
LABEL_71:

          goto LABEL_72;
        }
      }
      else
      {

      }
      v46 = self->_rpServer;
      if (!v46 && v6)
      {
        v92 = CMContinuityCaptureLog(0, v22);
        v93 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v112 = self;
          v113 = 2114;
          v114 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@", buf, 0x16u);
        }

        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationDevice"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "name"));
        -[CMContinuityCaptureDServer launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:](self, "launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:", v11, v95, v109, v109 != 2, v110);

        -[CMContinuityCaptureDServer createSession:](self, "createSession:", v9);
        v71 = &self->_connectedRPDisplaySession;
        v72 = obj;
        goto LABEL_58;
      }
      v7 = obj;
      if (!v46)
      {
LABEL_24:
        v49 = CMContinuityCaptureLog(0, v22);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v112 = self;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Unknown case", buf, 0xCu);
        }

        goto LABEL_79;
      }
      goto LABEL_22;
    }
    if (v6)
    {
      v73 = v10;
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureDServer sessionIdentifier:](CMContinuityCaptureDServer, "sessionIdentifier:", v74));
      v76 = objc_msgSend(v75, "isEqualToString:", v11);

      v78 = CMContinuityCaptureLog(0, v77);
      v68 = objc_claimAutoreleasedReturnValue(v78);
      v79 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
      if (v76)
      {
        v10 = v73;
        if (v79)
        {
          v80 = (CMContinuityCaptureRapportServer *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
          *(_DWORD *)buf = 138544130;
          v112 = self;
          v113 = 2114;
          v114 = v11;
          v115 = 2114;
          v116 = v80;
          v117 = 2114;
          v118 = (RPRemoteDisplaySession *)v9;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Reset (with pending termination) for %{public}@ (%{public}@ -> %{public}@)", buf, 0x2Au);

        }
        -[CMContinuityCaptureRapportServer resetDisplaySession:](self->_rpServer, "resetDisplaySession:", v9);
        v71 = &self->_connectedRPDisplaySession;
        v72 = v7;
        goto LABEL_58;
      }
      v10 = v73;
      if (v79)
      {
        v105 = (CMContinuityCaptureRapportServer *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
        *(_DWORD *)buf = 138543874;
        v112 = self;
        v113 = 2114;
        v114 = (const char *)v9;
        v115 = 2114;
        v116 = v105;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ New Connection %{public}@ (with pending termination %{public}@)", buf, 0x20u);

      }
LABEL_77:

LABEL_78:
      -[CMContinuityCaptureDServer postEvent:toSession:](self, "postEvent:toSession:", kCMContinuityCaptureEventCaptureSessionStarted, v9);
      -[NSMutableArray addObject:](self->_sessionsPendingActivation, "addObject:", v9);
      goto LABEL_79;
    }
    if (!-[NSMutableArray containsObject:](self->_sessionsPendingActivation, "containsObject:", v9))
      goto LABEL_79;
    v101 = CMContinuityCaptureLog(0, v100);
    v58 = objc_claimAutoreleasedReturnValue(v101);
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      goto LABEL_71;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
    *(_DWORD *)buf = 138543874;
    v112 = self;
    v113 = 2114;
    v114 = (const char *)v9;
    v115 = 2114;
    v116 = (CMContinuityCaptureRapportServer *)v102;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection removed %{public}@ (with pending termination %{public}@)", buf, 0x20u);
    goto LABEL_70;
  }
  v23 = CMContinuityCaptureLog(0, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v112 = self;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ can't allow connection in user disabled mode", buf, 0xCu);
  }

  -[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:](self, "_exitSessionIfApplicableForDeviceIdentifier:exitReason:", v11, kCMContinuityCaptureSessionExitReasonUserDisabled);
LABEL_80:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000BCFC;
  v17[3] = &unk_100018AE0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id sessionClearOutBlock;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned __int8 v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id location;
  uint64_t v93;
  _UNKNOWN **v94;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v96;
  __int16 v97;
  id v98;
  __int16 v99;
  int v100;

  v9 = a3;
  v87 = a4;
  v89 = a5;
  objc_initWeak(&location, self);
  v11 = CMContinuityCaptureLog(0, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v96 = self;
    v97 = 2112;
    v98 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ keypath %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v9, "isEqualToString:", CMContinuityCaptureRemoteCompositeStateKVOKey))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, v87));
    v14 = (unint64_t)objc_msgSend(v13, "integerValue");

    v16 = CMContinuityCaptureLog(0, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v96 = self;
      v97 = 2112;
      v98 = v9;
      v99 = 1024;
      v100 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Observe key %@ state %d", buf, 0x1Cu);
    }

    if ((v14 & 0x10) == 0)
      goto LABEL_34;
    sessionClearOutBlock = self->_sessionClearOutBlock;
    if (sessionClearOutBlock)
      dispatch_block_cancel(sessionClearOutBlock);
    v20 = CMContinuityCaptureLog(0, v18);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
      *(_DWORD *)buf = 138543618;
      v96 = self;
      v97 = 2112;
      v98 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ session %@ terminated", buf, 0x16u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer displaySession](self->_rpServer, "displaySession"));
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_10000C850;
    v90[3] = &unk_100018670;
    objc_copyWeak(&v91, &location);
    -[CMContinuityCaptureDServer resetCurrentSession:added:completion:](self, "resetCurrentSession:added:completion:", v23, 0, v90);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "activeSession"));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "activeSession"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "configuration"));
      v29 = objc_msgSend(v28, "clientDeviceModel") == (id)2;

      if (!v29)
      {
        -[CMContinuityCaptureDServer teardownShieldUI](self, "teardownShieldUI");
LABEL_33:
        objc_destroyWeak(&v91);
LABEL_34:
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "activeSession"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "configuration"));
        objc_msgSend(v55, "setCompositeState:", v14);

        v30 = objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "activeSession"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "configuration"));
        -[NSObject updateClientsWithConfiguration:](v30, "updateClientsWithConfiguration:", v58);

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {

    }
    v14 |= 0x20uLL;
    goto LABEL_33;
  }
  if (objc_msgSend(v9, "isEqualToString:", CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, v87))
  {
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    if (-[NSObject BOOLValue](v30, "BOOLValue"))
    {
      v32 = CMContinuityCaptureLog(0, v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v96 = self;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, " %@ power button pressed", buf, 0xCu);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "activeSession"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pauseStateSolver"));
      objc_msgSend(v36, "sideButtonPressed");

      -[CMContinuityCaptureDServer _resolveUserPauseState](self, "_resolveUserPauseState");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activeSession"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pauseStateSolver"));
      objc_msgSend(v39, "sideButtonReleased");

    }
    goto LABEL_35;
  }
  if (objc_msgSend(v9, "isEqualToString:", CMContinuityCaptureCallStateKVOKey))
  {
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    if (-[NSObject integerValue](v30, "integerValue") == (id)2)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "activeSession"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pauseStateSolver"));
      objc_msgSend(v42, "incomingCallDeclinedStatusUpdated:", 1);

      -[CMContinuityCaptureDServer _resolveUserPauseState](self, "_resolveUserPauseState");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "activeSession"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "pauseStateSolver"));
      objc_msgSend(v45, "incomingCallDeclinedStatusUpdated:", 0);

    }
    if ((-[NSObject integerValue](v30, "integerValue") == (id)2
       || -[NSObject integerValue](v30, "integerValue") == (id)1)
      && -[NSMutableArray count](self->_sessionsPendingActivation, "count"))
    {
      v47 = CMContinuityCaptureLog(0, v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
        *(_DWORD *)buf = 138412546;
        v96 = self;
        v97 = 2114;
        v98 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, " %@ call ended, resume session %{public}@", buf, 0x16u);

      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_sessionsPendingActivation, "firstObject"));
      -[CMContinuityCaptureDServer postEvent:toSession:](self, "postEvent:toSession:", kCMContinuityCaptureEventStreamDisableForDeviceInUseExit, v50);

      -[NSMutableArray removeObjectAtIndex:](self->_sessionsPendingActivation, "removeObjectAtIndex:", 0);
    }
    goto LABEL_35;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CMContinuityCaptureRemoteStreamPreStartConfigKVOKey))
    goto LABEL_41;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (objc_msgSend(v51, "isEqual:", v52))
  {

    goto LABEL_41;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v61 = objc_msgSend(v59, "isEqual:", v60);

  if (!v61)
  {
LABEL_41:
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("activeSession")))
      goto LABEL_36;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if ((objc_msgSend(v65, "isEqual:", v66) & 1) != 0)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if ((v69 & 1) == 0)
      {
        v71 = CMContinuityCaptureLog(0, v70);
        v30 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
          *(_DWORD *)buf = 138412546;
          v96 = self;
          v97 = 2114;
          v98 = v72;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, " %@ session terminated %{public}@", buf, 0x16u);

        }
        goto LABEL_35;
      }
    }
    else
    {

    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (-[NSObject isEqual:](v30, "isEqual:", v73))
    {

    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_36;
      v78 = CMContinuityCaptureLog(0, v77);
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
        *(_DWORD *)buf = 138412546;
        v96 = self;
        v97 = 2114;
        v98 = v80;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, " %@ session started %{public}@", buf, 0x16u);

      }
      v93 = ContinuityCaptureRapportClientMessageTypeKey;
      v94 = &off_100019000;
      v30 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "activeSession"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "deviceIdentifier"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "activeSession"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "configuration"));
      -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v30, v83, objc_msgSend(v86, "clientDeviceModel"));

    }
    goto LABEL_35;
  }
  v63 = CMContinuityCaptureLog(0, v62);
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v96 = self;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, " %@ session prestarted, evaluate shield state", buf, 0xCu);
  }

  -[CMContinuityCaptureDServer _resolveUserPauseState](self, "_resolveUserPauseState");
LABEL_36:
  objc_destroyWeak(&location);

}

- (void)_resolveUserPauseState
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  int v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pauseStateSolver"));
  v6 = objc_msgSend(v5, "resolvePauseState");

  v8 = CMContinuityCaptureLog(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[CMContinuityCaptureDServer _resolveUserPauseState]";
    v16 = 1024;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s paused: %d", (uint8_t *)&v14, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureRapportServer compositeDevice](self->_rpServer, "compositeDevice"));
    v12 = v11;
    v13 = &kCMContinuityCaptureEventUserPause;
    if (!v6)
      v13 = &kCMContinuityCaptureEventUserResume;
    objc_msgSend(v11, "postEvent:entity:data:", *v13, 0, 0);

    +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", v6 ^ 1);
  }
}

- (void)_skipPlacementStepIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _UNKNOWN **v24;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placementStepSkipped"));

  if ((objc_msgSend(v6, "isEqualToNumber:", &__kCFBooleanFalse) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSession"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceIdentifier"));

    v23 = ContinuityCaptureRapportClientMessageTypeKey;
    v24 = &off_100019018;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
    -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v11, v10, objc_msgSend(v14, "clientDeviceModel"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeSession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
    objc_msgSend(v17, "setPlacementStepSkipped:", &__kCFBooleanTrue);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeSession"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "configuration"));
    objc_msgSend(v18, "updateClientsWithConfiguration:", v21);

  }
  else
  {
    v22 = CMContinuityCaptureLog(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2080;
      v28 = "-[CMContinuityCaptureDServer _skipPlacementStepIfApplicable]";
      v29 = 2112;
      v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s current active session has placementStepSkipped %@. Ignore processing skip placement step", buf, 0x20u);
    }
  }

}

- (void)_exitSessionIfApplicableForDeviceIdentifier:(id)a3 exitReason:(id)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  RPRemoteDisplayDiscovery *rpRemoteDisplayDiscovery;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  int v21;
  CMContinuityCaptureDServer *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  RPRemoteDisplayDiscovery *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;

  v6 = (char *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    v17 = CMContinuityCaptureLog(0, v8);
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100010374((uint64_t)self, (uint64_t)v7, v14);
    goto LABEL_14;
  }
  if (-[RPRemoteDisplayDiscovery currentState](self->_rpRemoteDisplayDiscovery, "currentState") != 1)
  {
    v18 = CMContinuityCaptureLog(0, v9);
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[RPRemoteDisplayDiscovery currentState](self->_rpRemoteDisplayDiscovery, "currentState");
      v21 = 138544386;
      v22 = self;
      v23 = 2080;
      v24 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
      v25 = 2112;
      v26 = (RPRemoteDisplayDiscovery *)v6;
      v27 = 2112;
      v28 = v7;
      v29 = 1024;
      LODWORD(v30) = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %s igoring request to exit session for device %@ with reason %@. rapport session state %d", (uint8_t *)&v21, 0x30u);
    }
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery peerDeviceIdentifier](self->_rpRemoteDisplayDiscovery, "peerDeviceIdentifier"));
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  v13 = CMContinuityCaptureLog(0, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (v15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery peerDeviceIdentifier](self->_rpRemoteDisplayDiscovery, "peerDeviceIdentifier"));
      v21 = 138544386;
      v22 = self;
      v23 = 2080;
      v24 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
      v25 = 2112;
      v26 = (RPRemoteDisplayDiscovery *)v6;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %s igoring request to exit session for device %@ with reason %@. rapport session device %@", (uint8_t *)&v21, 0x34u);

    }
LABEL_14:

    goto LABEL_7;
  }
  if (v15)
  {
    rpRemoteDisplayDiscovery = self->_rpRemoteDisplayDiscovery;
    v21 = 138544130;
    v22 = self;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = rpRemoteDisplayDiscovery;
    v27 = 2112;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ currently in session with device %@. Calling %@ to exit session for reason %@, ", (uint8_t *)&v21, 0x2Au);
  }

  -[RPRemoteDisplayDiscovery exitDiscoverySessionWithReason:](self->_rpRemoteDisplayDiscovery, "exitDiscoverySessionWithReason:", v7);
LABEL_7:

}

- (void)updateSystemStateForDeviceIdentifier:(id)a3 andModel:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE buf[24];
  id v34;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = objc_alloc((Class)CMContinuityCaptureControl);
  v8 = kCMContinuityCaptureControlBatteryLevel;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "batteryLevel"));
  *(_OWORD *)buf = xmmword_100012490;
  *(_QWORD *)&buf[16] = 0;
  v11 = objc_msgSend(v7, "initWithName:attributes:entity:minimumSupportedVersion:value:", v8, 0, 4, buf, v10);

  v30 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v30));
  v14 = v30;
  if (v12)
  {
    v15 = CMContinuityCaptureLog(0, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2114;
      v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@ to %{public}@", buf, 0x20u);
    }

    objc_msgSend(v6, "addObject:", v12);
  }
  v17 = objc_alloc((Class)CMContinuityCaptureControl);
  v18 = kCMContinuityCaptureControlBatteryState;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "batteryState")));
  *(_OWORD *)buf = xmmword_100012490;
  *(_QWORD *)&buf[16] = 0;
  v21 = objc_msgSend(v17, "initWithName:attributes:entity:minimumSupportedVersion:value:", v18, 0, 4, buf, v20);

  v29 = v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v29));
  v23 = v29;

  if (v22)
  {
    v25 = CMContinuityCaptureLog(0, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2114;
      v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@ to %{public}@", buf, 0x20u);
    }

    objc_msgSend(v6, "addObject:", v22);
  }
  v31[0] = ContinuityCaptureRapportClientMessageTypeKey;
  v31[1] = ContinuityCaptureRapportClientSystemControlsKey;
  v32[0] = &off_100019030;
  v32[1] = v6;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
  -[CMContinuityCaptureDServer relayMessage:toDeviceWithIdentifier:andModel:](self, "relayMessage:toDeviceWithIdentifier:andModel:", v27, v5, a4);

}

- (void)setupRPRemoteDisplayDiscovery
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  RPRemoteDisplayDiscovery *rpRemoteDisplayDiscovery;
  RPRemoteDisplayDiscovery *v8;
  RPRemoteDisplayDiscovery *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v18;
  __int16 v19;
  const char *v20;

  objc_initWeak(&location, self);
  v4 = CMContinuityCaptureLog(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureDServer setupRPRemoteDisplayDiscovery]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  v6 = objc_alloc_init((Class)RPRemoteDisplayDiscovery);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, v6);
  -[RPRemoteDisplayDiscovery setDispatchQueue:](self->_rpRemoteDisplayDiscovery, "setDispatchQueue:", self->_queue);
  rpRemoteDisplayDiscovery = self->_rpRemoteDisplayDiscovery;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D57C;
  v14[3] = &unk_100018B08;
  objc_copyWeak(&v15, &location);
  -[RPRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:](rpRemoteDisplayDiscovery, "setDiscoverySessionStateChangedHandler:", v14);
  v8 = self->_rpRemoteDisplayDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D720;
  v12[3] = &unk_100018B30;
  objc_copyWeak(&v13, &location);
  -[RPRemoteDisplayDiscovery setDedicatedDeviceChangedHandler:](v8, "setDedicatedDeviceChangedHandler:", v12);
  v9 = self->_rpRemoteDisplayDiscovery;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D908;
  v10[3] = &unk_100018838;
  objc_copyWeak(&v11, &location);
  -[RPRemoteDisplayDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (BOOL)setupSidebandRPClient
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  RPCompanionLinkClient **p_rpSidebandCompanionLinkClient;
  RPCompanionLinkClient *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  RPCompanionLinkClient *v15;
  RPCompanionLinkClient *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v30;
  __int16 v31;
  const char *v32;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = self;
    v31 = 2080;
    v32 = "-[CMContinuityCaptureDServer setupSidebandRPClient]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v5 = objc_alloc_init((Class)RPCompanionLinkClient);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000DDA8;
  v27[3] = &unk_100018670;
  objc_copyWeak(&v28, (id *)buf);
  v6 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000DE5C;
  v25[3] = &unk_100018670;
  objc_copyWeak(&v26, (id *)buf);
  v7 = objc_retainBlock(v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000DF10;
  v22[3] = &unk_100018B58;
  objc_copyWeak(&v24, (id *)buf);
  v8 = v5;
  v23 = v8;
  v9 = objc_retainBlock(v22);
  if (v8)
  {
    p_rpSidebandCompanionLinkClient = &self->_rpSidebandCompanionLinkClient;
    objc_storeStrong((id *)p_rpSidebandCompanionLinkClient, v5);
    v11 = *p_rpSidebandCompanionLinkClient;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.continuitycapture.rapportsideband", v13);
    -[RPCompanionLinkClient setDispatchQueue:](v11, "setDispatchQueue:", v14);

    -[RPCompanionLinkClient setInvalidationHandler:](*p_rpSidebandCompanionLinkClient, "setInvalidationHandler:", v6);
    -[RPCompanionLinkClient setInterruptionHandler:](*p_rpSidebandCompanionLinkClient, "setInterruptionHandler:", v7);
    -[RPCompanionLinkClient setErrorFlagsChangedHandler:](*p_rpSidebandCompanionLinkClient, "setErrorFlagsChangedHandler:", v9);
    -[RPCompanionLinkClient setServiceType:](*p_rpSidebandCompanionLinkClient, "setServiceType:", ContinuityCaptureRapportSidebandServiceType);
    -[RPCompanionLinkClient setControlFlags:](*p_rpSidebandCompanionLinkClient, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](*p_rpSidebandCompanionLinkClient, "controlFlags") | 0x180000010006);
    v15 = *p_rpSidebandCompanionLinkClient;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000DFE0;
    v20[3] = &unk_100018BA8;
    objc_copyWeak(&v21, (id *)buf);
    -[RPCompanionLinkClient registerEventID:options:handler:](v15, "registerEventID:options:handler:", ContinuityCaptureSidebandSessionEventID, 0, v20);
    v16 = *p_rpSidebandCompanionLinkClient;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000ECCC;
    v18[3] = &unk_100018838;
    objc_copyWeak(&v19, (id *)buf);
    -[RPCompanionLinkClient activateWithCompletion:](v16, "activateWithCompletion:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  return v8 != 0;
}

- (void)setupDisplayServer
{
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void ***v8;
  RPRemoteDisplayServer *v9;
  RPRemoteDisplayServer *rpDisplayServer;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  CMContinuityCaptureDServer *v23;
  __int16 v24;
  const char *v25;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2080;
    v25 = "-[CMContinuityCaptureDServer setupDisplayServer]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000F068;
  v20[3] = &unk_100018670;
  objc_copyWeak(&v21, (id *)buf);
  v5 = objc_retainBlock(v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F174;
  v18[3] = &unk_100018670;
  objc_copyWeak(&v19, (id *)buf);
  v6 = objc_retainBlock(v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F228;
  v16[3] = &unk_100018C10;
  objc_copyWeak(&v17, (id *)buf);
  v7 = objc_retainBlock(v16);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10000F3D4;
  v14 = &unk_100018C58;
  objc_copyWeak(&v15, (id *)buf);
  v8 = objc_retainBlock(&v11);
  v9 = (RPRemoteDisplayServer *)objc_alloc_init((Class)RPRemoteDisplayServer);
  rpDisplayServer = self->_rpDisplayServer;
  self->_rpDisplayServer = v9;

  -[RPRemoteDisplayServer setServiceType:](self->_rpDisplayServer, "setServiceType:", ContinuityCaptureRapportServiceType, v11, v12, v13, v14);
  -[RPRemoteDisplayServer setInterruptionHandler:](self->_rpDisplayServer, "setInterruptionHandler:", v5);
  -[RPRemoteDisplayServer setInvalidationHandler:](self->_rpDisplayServer, "setInvalidationHandler:", v6);
  -[RPRemoteDisplayServer setDispatchQueue:](self->_rpDisplayServer, "setDispatchQueue:", self->_queue);
  -[RPRemoteDisplayServer setSessionStartHandler:](self->_rpDisplayServer, "setSessionStartHandler:", v7);
  -[RPRemoteDisplayServer setSessionEndedHandler:](self->_rpDisplayServer, "setSessionEndedHandler:", v8);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)lockScreenLayoutMonitor:(id)a3 didUpdateLayoutWithShieldFrontMost:(BOOL)a4 lockscreenInLayout:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  BOOL v11;
  id location;

  v5 = a5;
  objc_initWeak(&location, self);
  if (v5)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F8F4;
    block[3] = &unk_100018A18;
    objc_copyWeak(&v10, &location);
    v11 = a4;
    dispatch_async(queue, block);
    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandMessageQueue, 0);
  objc_storeStrong((id *)&self->_lockScreenLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, 0);
  objc_storeStrong((id *)&self->_shieldLaunchCheckQueue, 0);
  objc_storeStrong((id *)&self->_rpSidebandCompanionLinkClient, 0);
  objc_storeStrong((id *)&self->_sessionsPendingActivation, 0);
  objc_storeStrong((id *)&self->_connectedRPDisplaySession, 0);
  objc_storeStrong(&self->_sessionClearOutBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rpSidebandDisplayServer, 0);
  objc_storeStrong((id *)&self->_rpDisplayServer, 0);
  objc_storeStrong((id *)&self->_rpServer, 0);
}

@end
