@implementation BKHIDProximityEventProcessor

- (BKHIDProximityEventProcessor)initWithContext:(id)a3
{
  id v4;
  BKHIDProximityEventProcessor *v5;
  BKHIDProximityEventProcessor *v6;
  uint64_t v7;
  BKSProximityDetectionMaskChangeEvent *lock_lastEvent;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BKHIDDomainServiceServer *v13;
  BKHIDDomainServiceServer *server;
  uint64_t v15;
  BKHIDUISensorController *sensorController;
  uint64_t v17;
  BSInvalidatable *sensorModeChangeObserverToken;
  BSMutableIntegerMap *v19;
  BSMutableIntegerMap *eventClients;
  id v21;
  id v22;
  void *v23;
  id v24;
  SLGNotificationActivatedLogger *v25;
  SLGNotificationActivatedLogger *studyLog;
  SLGNotificationActivatedLogger *v27;
  SLGNotificationActivatedLogger *v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BKHIDProximityEventProcessor;
  v5 = -[BKHIDProximityEventProcessor init](&v35, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_lock_shouldSuppressTouchesWhileObjectWithinProximity = 1;
    v7 = objc_claimAutoreleasedReturnValue(+[BKSProximityDetectionMaskChangeEvent build:](BKSProximityDetectionMaskChangeEvent, "build:", &stru_1000EABA0));
    lock_lastEvent = v6->_lock_lastEvent;
    v6->_lock_lastEvent = (BKSProximityDetectionMaskChangeEvent *)v7;

    v9 = objc_alloc((Class)BKHIDDomainServiceServer);
    v10 = BKSProximitySensorBSServiceName;
    v11 = BKLogUISensor(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (BKHIDDomainServiceServer *)objc_msgSend(v9, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", v6, v6, &OBJC_PROTOCOL___BKSProximitySensorServer_IPC, &OBJC_PROTOCOL___BKSProximitySensorClient_IPC, v10, &_dispatch_main_q, v12, BKProximityDetectionEntitlement);
    server = v6->_server;
    v6->_server = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[BKHIDUISensorController sharedInstance](BKHIDUISensorController, "sharedInstance"));
    sensorController = v6->_sensorController;
    v6->_sensorController = (BKHIDUISensorController *)v15;

    v17 = objc_claimAutoreleasedReturnValue(-[BKHIDUISensorController addSensorModeChangeObserver:](v6->_sensorController, "addSensorModeChangeObserver:", v6));
    sensorModeChangeObserverToken = v6->_sensorModeChangeObserverToken;
    v6->_sensorModeChangeObserverToken = (BSInvalidatable *)v17;

    v19 = (BSMutableIntegerMap *)objc_alloc_init((Class)BSMutableIntegerMap);
    eventClients = v6->_eventClients;
    v6->_eventClients = v19;

    objc_initWeak(&location, v6);
    v21 = objc_alloc((Class)SLGNotificationActivatedLogger);
    v22 = objc_alloc((Class)SLGActivatableLogger);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v24 = objc_msgSend(v22, "initWithLogger:", v23);
    v25 = (SLGNotificationActivatedLogger *)objc_msgSend(v21, "initWithLogger:", v24);
    studyLog = v6->_studyLog;
    v6->_studyLog = v25;

    -[SLGNotificationActivatedLogger addBeginNotification:endNotification:](v6->_studyLog, "addBeginNotification:endNotification:", CFSTR("SBStudyLogBeginCameraButtonLogging"), CFSTR("SBStudyLogEndCameraButtonLogging"));
    v27 = v6->_studyLog;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100047F4C;
    v32[3] = &unk_1000EABC8;
    objc_copyWeak(&v33, &location);
    -[SLGNotificationActivatedLogger setActivationHandler:](v27, "setActivationHandler:", v32);
    v28 = v6->_studyLog;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100047FF4;
    v30[3] = &unk_1000EABC8;
    objc_copyWeak(&v31, &location);
    -[SLGNotificationActivatedLogger setDeactivationHandler:](v28, "setDeactivationHandler:", v30);
    -[BKHIDDomainServiceServer activate](v6->_server, "activate");
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_sensorModeChangeObserverToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKHIDProximityEventProcessor;
  -[BKHIDProximityEventProcessor dealloc](&v3, "dealloc");
}

- (BOOL)isObjectWithinProximity
{
  BKHIDProximityEventProcessor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_objectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isProximityDetectionActive
{
  BKHIDProximityEventProcessor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_proximityDetectionActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldSuppressTouchesWhileObjectWithinProximity
{
  BKHIDProximityEventProcessor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldSuppressTouchesWhileObjectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldSuppressTouchesWhileObjectWithinProximity:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldSuppressTouchesWhileObjectWithinProximity = a3;
  -[BKHIDProximityEventProcessor _locked_updateTouchSuppressionAssertion](self, "_locked_updateTouchSuppressionAssertion");
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t ConciseDescription;
  void *v14;
  os_unfair_lock_s *p_lock;
  _BOOL4 v16;
  SLGNotificationActivatedLogger *studyLog;
  unsigned int IntegerValue;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  __IOHIDEvent *v41;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  BOOL v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  v11 = BKLogUISensor(v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    ConciseDescription = BKSHIDEventGetConciseDescription(*a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
    *(_DWORD *)buf = 138543362;
    v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-> %{public}@", buf, 0xCu);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lastProximitySender, v8);
  objc_storeWeak((id *)&self->_lastProximityDispatcher, v9);
  if (-[SLGNotificationActivatedLogger isEnabled](self->_studyLog, "isEnabled"))
  {
    v16 = IOHIDEventGetIntegerValue(v10, 917504) != 0;
    if (self->_studyLogProxState != v16)
    {
      studyLog = self->_studyLog;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100047EAC;
      v49[3] = &unk_1000EABE8;
      v50 = v16;
      -[SLGNotificationActivatedLogger logBlock:domain:](studyLog, "logBlock:domain:", v49, CFSTR("com.apple.backboard.hid.proximity"));
      self->_studyLogProxState = v16;
    }
  }
  IntegerValue = IOHIDEventGetIntegerValue(v10, 917504);
  self->_rawDetectionMask = IntegerValue;
  if (self->_proximityDetectionActive)
    v19 = 64;
  else
    v19 = 1024;
  v20 = v19 & IntegerValue;
  kdebug_trace(730464696, v20, 0, 0, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (self->_modeDetectionMask != (_DWORD)v20)
  {
    v41 = v10;
    v42 = v9;
    v43 = v8;
    self->_modeDetectionMask = v20;
    if (self->_proximityDetectionActive)
      -[BKHIDProximityEventProcessor _locked_setObjectWithinProximity:notify:](self, "_locked_setObjectWithinProximity:notify:", (v20 >> 6) & 1, 1);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap allValues](self->_eventClients, "allValues"));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v25);
          if (v26)
            v27 = (void *)v26[1];
          else
            v27 = 0;
          if ((objc_msgSend(v27, "unsignedIntValue") & v20) == 0)
          {
            if (v26)
              v28 = (void *)v26[3];
            else
              v28 = 0;
            v29 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v29));
            if (v26)
              v31 = v26[2];
            else
              v31 = 0;
            -[BKHIDProximityEventProcessor _locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:](self, "_locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:", 0, v30, v31, CFSTR("client mask mismatch"));

            objc_msgSend(v44, "addObject:", v29);
            -[BSMutableIntegerMap removeObjectForKey:](self->_eventClients, "removeObjectForKey:", (int)objc_msgSend(v29, "pid"));

          }
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v32 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        v23 = v32;
      }
      while (v32);
    }

    if ((v20 & 0x40) != 0 && self->_proximityDetectionActive)
    {
      -[BKHIDProximityEventProcessor _lock_postSyntheticEventWithDetectionMaskToClients:](self, "_lock_postSyntheticEventWithDetectionMaskToClients:", 64);
      v9 = v42;
      v8 = v43;
      p_lock = &self->_lock;
      v10 = v41;
    }
    else
    {
      v9 = v42;
      v8 = v43;
      p_lock = &self->_lock;
      v10 = v41;
      if (v20 >= 0x400)
      {
        -[BKHIDProximityEventProcessor _lock_postSyntheticEventWithDetectionMaskToClients:](self, "_lock_postSyntheticEventWithDetectionMaskToClients:", 1024);
      }
      else if ((_DWORD)v20)
      {
        v34 = BKLogUISensor(v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = BKSHIDEventGetConciseDescription(v41);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          *(_DWORD *)buf = 138543362;
          v53 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Ignoring %{public}@", buf, 0xCu);

        }
      }
    }
  }
  if (!self->_rawDetectionMask)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationsForEvent:fromSender:", v10, v8));
    if (objc_msgSend(v38, "count"))
    {
      v39 = objc_msgSend(v38, "mutableCopy");
      objc_msgSend(v39, "minusSet:", v44);
      -[BKHIDProximityEventProcessor _locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:](self, "_locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:", 0, v39, v9, CFSTR("HID zero mask"));

    }
  }
  -[BKHIDProximityEventProcessor _locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:](self, "_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:", IOHIDEventGetTimeStamp(v10));
  os_unfair_lock_unlock(p_lock);

  return 1;
}

- (void)_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:(unint64_t)a3
{
  unsigned int modeDetectionMask;
  int detectionMode;
  BKSProximityDetectionMaskChangeEvent *v7;
  BKSProximityDetectionMaskChangeEvent *lock_lastEvent;
  _QWORD v9[5];
  unsigned int v10;
  int v11;

  modeDetectionMask = self->_modeDetectionMask;
  detectionMode = self->_detectionMode;
  if (-[BKSProximityDetectionMaskChangeEvent detectionMask](self->_lock_lastEvent, "detectionMask") == modeDetectionMask)
    a3 = (unint64_t)-[BKSProximityDetectionMaskChangeEvent timestamp](self->_lock_lastEvent, "timestamp");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100047E58;
  v9[3] = &unk_1000EAC08;
  v9[4] = a3;
  v10 = modeDetectionMask;
  v11 = detectionMode;
  v7 = (BKSProximityDetectionMaskChangeEvent *)objc_claimAutoreleasedReturnValue(+[BKSProximityDetectionMaskChangeEvent build:](BKSProximityDetectionMaskChangeEvent, "build:", v9));
  lock_lastEvent = self->_lock_lastEvent;
  self->_lock_lastEvent = v7;

  -[BKHIDProximityEventProcessor _lock_postDetectionMaskChangeToObservers](self, "_lock_postDetectionMaskChangeToObservers");
}

- (void)_lock_postDetectionMaskChangeToObservers
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  os_unfair_lock_assert_owner(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_observingProximityConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
        v9 = objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v8, (_QWORD)v17));
        v10 = (void *)v9;
        if (v9)
          v11 = *(void **)(v9 + 8);
        else
          v11 = 0;
        v12 = v11;
        v13 = objc_msgSend(v12, "detectionMask");
        v14 = -[BKSProximityDetectionMaskChangeEvent detectionMask](self->_lock_lastEvent, "detectionMask");

        if (v13 != v14)
        {
          sub_100044A54((uint64_t)v10, self->_lock_lastEvent);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteTarget"));
          objc_msgSend(v15, "proximityDetectionMaskDidChange:", self->_lock_lastEvent);

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v5 = v16;
    }
    while (v16);
  }

}

- (void)_locked_postEventWithDetectionMask:(unsigned int)a3 toDestinations:(id)a4 dispatcher:(id)a5 reason:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const void *ProximtyEvent;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t ConciseDescription;
  uint64_t v27;
  uint64_t v28;
  _UNKNOWN **v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  BKHIDProximityEventProcessor *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];

  v9 = a4;
  v10 = a5;
  v32 = a6;
  v35 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v9;
  v12 = v10;
  obj = v11;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    v16 = a3;
    v17 = &AWStartAttentionAwarenessServer_ptr;
    do
    {
      v18 = 0;
      v33 = v14;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v18);
        v20 = mach_absolute_time();
        ProximtyEvent = (const void *)IOHIDEventCreateProximtyEvent(0, v20, a3, 0);
        IOHIDEventSetIntegerValue(ProximtyEvent, 917504, v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[389], "baseAttributesFromProvider:", v19));
        objc_msgSend(v22, "setProximityDetectionMode:", v35->_detectionMode);
        v23 = BKSHIDEventSetAttributes(ProximtyEvent, v22);
        v24 = BKLogUISensor(v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          ConciseDescription = BKSHIDEventGetConciseDescription(ProximtyEvent);
          v27 = v16;
          v28 = v15;
          v29 = v17;
          v30 = v12;
          v31 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
          *(_DWORD *)buf = 138543874;
          v42 = v31;
          v43 = 2114;
          v44 = v19;
          v45 = 2114;
          v46 = v32;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "send prox event:%{public}@ to %{public}@ [%{public}@]", buf, 0x20u);

          v12 = v30;
          v17 = v29;
          v15 = v28;
          v16 = v27;
          v14 = v33;
        }

        objc_msgSend(v12, "postEvent:toDestination:", ProximtyEvent, v19);
        CFRelease(ProximtyEvent);

        v18 = (char *)v18 + 1;
      }
      while (v14 != v18);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v14);
  }

}

- (void)_locked_updateTouchSuppressionAssertion
{
  BOOL objectWithinProximity;
  BSInvalidatable *v4;
  BSInvalidatable **p_suppressTouchesAssertion;
  BSInvalidatable *suppressTouchesAssertion;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  BSInvalidatable *v15;
  void *v16;

  os_unfair_lock_assert_owner(&self->_lock);
  objectWithinProximity = self->_objectWithinProximity;
  if (objectWithinProximity)
  {
    suppressTouchesAssertion = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    v4 = suppressTouchesAssertion;
    objectWithinProximity = *((_BYTE *)p_suppressTouchesAssertion - 80) != 0;
    v7 = suppressTouchesAssertion == 0;
    if (*((_BYTE *)p_suppressTouchesAssertion - 80))
      v8 = v4 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
      v11 = objc_msgSend(v9, "eventProcessorOfClass:", objc_opt_class(BKHIDDirectTouchEventProcessor, v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cancelAndSuppressTouchesOnDisplay:reason:", 0, CFSTR("objectWithinProximity")));
      v13 = *p_suppressTouchesAssertion;
      *p_suppressTouchesAssertion = (BSInvalidatable *)v12;

      return;
    }
  }
  else
  {
    v14 = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    v4 = v14;
    v7 = v14 == 0;
  }
  if (!v7 && !objectWithinProximity)
  {
    -[BSInvalidatable invalidate](v4, "invalidate");
    v15 = *p_suppressTouchesAssertion;
    *p_suppressTouchesAssertion = 0;

  }
}

- (void)_locked_setObjectWithinProximity:(BOOL)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int v7;

  v4 = a4;
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_objectWithinProximity != v5)
  {
    self->_objectWithinProximity = v5;
    if (v4)
    {
      v7 = dword_100115D80;
      if (dword_100115D80 != -1
        || (notify_register_check("com.apple.backboard.proximity.changed", &dword_100115D80),
            v7 = dword_100115D80,
            dword_100115D80 != -1))
      {
        notify_set_state(v7, v5);
        notify_post("com.apple.backboard.proximity.changed");
      }
    }
    -[BKHIDProximityEventProcessor _locked_updateTouchSuppressionAssertion](self, "_locked_updateTouchSuppressionAssertion");
  }
}

- (void)_lock_postSyntheticEventWithDetectionMaskToClients:(unsigned int)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t ProximtyEvent;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  BKGenericClientEventRecord *v18;
  void *v19;
  SEL v20;
  NSObject *v21;
  BKHIDEventDispatcher *v22;
  BKSHIDEventDeferringResolution *v23;
  NSObject *context;
  NSObject *v25;
  BKHIDEventDispatcher *eventDispatcher;
  BKHIDEventDispatcher *v27;
  BKSHIDEventDeferringResolution *destination;
  const void *Copy;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t ConciseDescription;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  CFTypeRef cf;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  _BYTE v47[24];

  WeakRetained = objc_loadWeakRetained((id *)&self->_lastProximitySender);
  v5 = objc_loadWeakRetained((id *)&self->_lastProximityDispatcher);
  v38 = v5;
  if (!WeakRetained || (v6 = v5) == 0)
  {
    v7 = BKLogUISensor(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v47 = a3;
      *(_WORD *)&v47[4] = 2114;
      *(_QWORD *)&v47[6] = v38;
      *(_WORD *)&v47[14] = 2114;
      *(_QWORD *)&v47[16] = WeakRetained;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "ignoring synth:0x%X dispatcher:%{public}@ sender:%{public}@", buf, 0x1Cu);
    }

    v6 = v38;
  }
  v9 = mach_absolute_time();
  ProximtyEvent = IOHIDEventCreateProximtyEvent(0, v9, a3, 0);
  IOHIDEventSetIntegerValue(ProximtyEvent, 917504, a3);
  cf = (CFTypeRef)ProximtyEvent;
  v36 = WeakRetained;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationsForEvent:fromSender:", ProximtyEvent, WeakRetained));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  v12 = v6;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v17 = objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_eventClients, "objectForKey:", (int)objc_msgSend(v16, "pid")));
        if (v17)
        {
          v18 = (BKGenericClientEventRecord *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3));
          objc_setProperty_nonatomic_copy(v18, v20, v19, 8);

        }
        else
        {
          v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3));
          v22 = v12;
          v23 = v16;
          objc_opt_self(BKGenericClientEventRecord);
          v18 = objc_alloc_init(BKGenericClientEventRecord);
          context = v18->_context;
          v18->_context = v21;
          v25 = v21;

          eventDispatcher = v18->_eventDispatcher;
          v18->_eventDispatcher = v22;
          v27 = v22;

          destination = v18->_destination;
          v18->_destination = v23;

          -[BSMutableIntegerMap setObject:forKey:](self->_eventClients, "setObject:forKey:", v18, (int)-[BKSHIDEventDeferringResolution pid](v23, "pid"));
        }
        Copy = (const void *)IOHIDEventCreateCopy(0, cf);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventProximityAttributes baseAttributesFromProvider:](BKSHIDEventProximityAttributes, "baseAttributesFromProvider:", v16));
        objc_msgSend(v30, "setProximityDetectionMode:", self->_detectionMode);
        v31 = BKSHIDEventSetAttributes(Copy, v30);
        v32 = BKLogUISensor(v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          ConciseDescription = BKSHIDEventGetConciseDescription(Copy);
          v35 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v47 = v35;
          *(_WORD *)&v47[8] = 2114;
          *(_QWORD *)&v47[10] = v16;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "send prox event:%{public}@ to %{public}@", buf, 0x16u);

        }
        v12 = v38;
        objc_msgSend(v38, "postEvent:toDestination:", Copy, v16);
        CFRelease(Copy);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v13);
  }
  CFRelease(cf);

}

- (BOOL)_shouldPostLPATransitionEvents
{
  return !-[BKHIDUISensorController supportsProximityLPAEventTransitions](self->_sensorController, "supportsProximityLPAEventTransitions");
}

- (void)sensorModeDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  int v6;
  unsigned int detectionMode;
  unsigned int v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  BSMutableIntegerMap *eventClients;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  BSMutableIntegerMap *v36;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend(v4, "proximityDetectionMode");
  detectionMode = self->_detectionMode;
  if (detectionMode == v6)
    goto LABEL_33;
  v8 = v6;
  self->_detectionMode = v6;
  self->_modeDetectionMask = 0;
  v28 = v4;
  if (v6 == 3)
  {
    if (detectionMode == 6 && (self->_rawDetectionMask & 0x240) != 0)
      self->_modeDetectionMask = 64;
  }
  else
  {
    if (v6 != 6)
    {
      self->_proximityDetectionActive = 0;
      v25 = BKLogUISensor(-[BKHIDProximityEventProcessor _locked_setObjectWithinProximity:notify:](self, "_locked_setObjectWithinProximity:notify:", 0, 1));
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        eventClients = self->_eventClients;
        *(_DWORD *)buf = 138543362;
        v36 = eventClients;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "inactive mode -- synthesizing prox cancel for clients:%{public}@", buf, 0xCu);
      }

      if (v8 > 5)
        v9 = 64;
      else
        v9 = dword_1000B3D08[v8];
      goto LABEL_13;
    }
    if (-[BKHIDProximityEventProcessor _shouldPostLPATransitionEvents](self, "_shouldPostLPATransitionEvents"))
    {
      if ((self->_rawDetectionMask & 0x240) != 0)
      {
        self->_modeDetectionMask = 64;
        if (detectionMode <= 0xD && ((1 << detectionMode) & 0x3006) != 0)
        {
          -[BKHIDProximityEventProcessor _locked_setObjectWithinProximity:notify:](self, "_locked_setObjectWithinProximity:notify:", 1, 1);
          -[BKHIDProximityEventProcessor _lock_postSyntheticEventWithDetectionMaskToClients:](self, "_lock_postSyntheticEventWithDetectionMaskToClients:", 64);
        }
      }
    }
  }
  self->_proximityDetectionActive = 1;
  v9 = 1024;
LABEL_13:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap allValues](self->_eventClients, "allValues"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
        if (v14)
          v15 = (void *)v14[1];
        else
          v15 = 0;
        if ((objc_msgSend(v15, "unsignedIntValue") & v9) != 0)
        {
          if (v14)
            v16 = (void *)v14[3];
          else
            v16 = 0;
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v17));
          if (v14)
            v19 = (void *)v14[2];
          else
            v19 = 0;
          v20 = v19;
          v21 = BKSNSStringFromIOHIDProximityDetectionMask(v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("remove clients with (%@)"), v22));
          -[BKHIDProximityEventProcessor _locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:](self, "_locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:", 0, v18, v20, v23);

          -[BSMutableIntegerMap removeObjectForKey:](self->_eventClients, "removeObjectForKey:", (int)objc_msgSend(v17, "pid"));
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v11 = v24;
    }
    while (v24);
  }

  -[BKHIDProximityEventProcessor _locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:](self, "_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:", mach_absolute_time());
  p_lock = &self->_lock;
  v4 = v28;
LABEL_33:
  os_unfair_lock_unlock(p_lock);

}

- (id)setObservesProximitySensorDetectionMaskChanges:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  BKProximityServerClientRecord *v7;
  unsigned int v8;
  BKSProximityDetectionMaskChangeEvent *v9;
  NSMutableSet *v11;
  NSMutableSet *observingProximityConnections;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (BKProximityServerClientRecord *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v5));
  v8 = objc_msgSend(v4, "BOOLValue");

  if (!v8)
  {
    sub_100044A54((uint64_t)v7, 0);
    -[NSMutableSet removeObject:](self->_observingProximityConnections, "removeObject:", v5);
    goto LABEL_7;
  }
  if (self->_observingProximityConnections)
  {
    if (v7)
      goto LABEL_4;
  }
  else
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observingProximityConnections = self->_observingProximityConnections;
    self->_observingProximityConnections = v11;

    if (v7)
      goto LABEL_4;
  }
  v7 = objc_alloc_init(BKProximityServerClientRecord);
  -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v7, v5);
LABEL_4:
  if ((-[NSMutableSet containsObject:](self->_observingProximityConnections, "containsObject:", v5) & 1) != 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[NSMutableSet addObject:](self->_observingProximityConnections, "addObject:", v5);
  v9 = self->_lock_lastEvent;
  sub_100044A54((uint64_t)v7, v9);
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_observingProximityConnections, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_sensorModeChangeObserverToken, 0);
  objc_storeStrong((id *)&self->_studyLog, 0);
  objc_destroyWeak((id *)&self->_lastProximityDispatcher);
  objc_destroyWeak((id *)&self->_lastProximitySender);
  objc_storeStrong((id *)&self->_sensorController, 0);
  objc_storeStrong((id *)&self->_observingProximityConnections, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_eventClients, 0);
  objc_storeStrong((id *)&self->_lock_lastEvent, 0);
}

@end
