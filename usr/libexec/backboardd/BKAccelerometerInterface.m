@implementation BKAccelerometerInterface

- (void)_updateSettings
{
  NSMutableSet *v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  float v8;
  double v9;
  void *i;
  void *v11;
  double v12;
  double lock_samplingInterval;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BKOrientationManager *lock_orientationManager;
  NSObject *queue;
  BKOrientationManager *v28;
  NSObject *v29;
  BKOrientationManager *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void **block;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  BKOrientationManager *v40;
  double v41;
  _BYTE v42[128];

  -[NSLock lock](self->_lock, "lock");
  self->_lock_samplingInterval = 0.0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self->_lock_accelerometerClients;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (!v4)
  {
    v6 = 0;
    v8 = 0.0;
    v9 = 0.0;
    goto LABEL_50;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v33;
  v8 = 0.0;
  v9 = 0.0;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v11, "accelerometerUpdateInterval", (_QWORD)v32);
      if (v12 > 0.0)
      {
        lock_samplingInterval = self->_lock_samplingInterval;
        if (lock_samplingInterval <= 0.0 || v12 < lock_samplingInterval)
        {
          if (lock_samplingInterval <= 0.0)
            v9 = v12;
          else
            v9 = self->_lock_samplingInterval;
          self->_lock_samplingInterval = v12;
        }
        else if (lock_samplingInterval == v9 || v12 < v9)
        {
          v9 = v12;
        }
      }
      objc_msgSend(v11, "xThreshold");
      if (v16 > 0.0)
      {
        if (v16 >= v8)
          v17 = v8;
        else
          v17 = v16;
        if (v8 > 0.0)
          v8 = v17;
        else
          v8 = v16;
      }
      objc_msgSend(v11, "yThreshold");
      if (v18 >= v8)
        v19 = v8;
      else
        v19 = v18;
      if (v8 <= 0.0)
        v19 = v18;
      if (v18 > 0.0)
        v20 = v19;
      else
        v20 = v8;
      objc_msgSend(v11, "zThreshold");
      if (v21 <= 0.0)
      {
        v8 = v20;
        if ((v6 & 1) != 0)
          goto LABEL_41;
      }
      else
      {
        v8 = v21;
        if (v20 > 0.0 && v21 >= v20)
          v8 = v20;
        if ((v6 & 1) != 0)
        {
LABEL_41:
          v6 = 1;
          continue;
        }
      }
      if (objc_msgSend(v11, "wantsOrientationEvents"))
        v6 = objc_msgSend(v11, "passiveOrientationEvents") ^ 1;
      else
        v6 = 0;
    }
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  }
  while (v5);
LABEL_50:

  v22 = self->_lock_samplingInterval;
  if (v22 >= 0.0)
    v23 = self->_lock_samplingInterval;
  else
    v23 = 0.0;
  if (v9 >= 0.0)
    v24 = v9;
  else
    v24 = 0.0;
  if (v24 / v23 > 1.25 && v24 / v23 < 1.75)
    v25 = v23 * 0.5;
  else
    v25 = v23;
  if (v22 < 0.0 || v24 / v23 > 1.25 && v24 / v23 < 1.75)
    self->_lock_samplingInterval = v25;
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v32);
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    queue = lock_orientationManager->_queue;
    block = _NSConcreteStackBlock;
    v37 = 3221225472;
    v38 = sub_100019088;
    v39 = &unk_1000ECB60;
    v40 = lock_orientationManager;
    v41 = v25;
    dispatch_async(queue, &block);
    v28 = self->_lock_orientationManager;
    if (v28)
    {
      v29 = v28->_queue;
      block = _NSConcreteStackBlock;
      v37 = 3221225472;
      v38 = sub_100019014;
      v39 = &unk_1000EC950;
      v40 = v28;
      *(float *)&v41 = v8;
      dispatch_async(v29, &block);
      v30 = self->_lock_orientationManager;
      if (v30)
      {
        v31 = v30->_queue;
        block = _NSConcreteStackBlock;
        v37 = 3221225472;
        v38 = sub_100018EC4;
        v39 = &unk_1000EC978;
        v40 = v30;
        LOBYTE(v41) = v6;
        dispatch_async(v31, &block);
      }
    }
  }
}

- (void)_handleAccelerometerRequestForPort:(id)a3 auditToken:(id *)a4 updateBlock:(id)a5
{
  void (**v8)(id, BKAccelerometerClientBKSAccelerometer *);
  BKAccelerometerClientBKSAccelerometer *v9;
  id v10;

  v10 = a3;
  v8 = (void (**)(id, BKAccelerometerClientBKSAccelerometer *))a5;
  -[NSLock lock](self->_lock, "lock");
  v9 = (BKAccelerometerClientBKSAccelerometer *)objc_claimAutoreleasedReturnValue(-[BKAccelerometerInterface _lock_existingClientForSendRight:](self, "_lock_existingClientForSendRight:", v10));
  if (!v9)
  {
    v9 = -[BKAccelerometerClientBKSAccelerometer initWithPid:sendRight:]([BKAccelerometerClientBKSAccelerometer alloc], "initWithPid:sendRight:", BSPIDForAuditToken(a4), v10);
    -[BKAccelerometerClientBKSAccelerometer setDelegate:](v9, "setDelegate:", self);
    if (v9)
      -[NSMutableSet addObject:](self->_lock_accelerometerClients, "addObject:", v9);
  }
  if (v8)
    v8[2](v8, v9);
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");

}

- (id)_lock_existingClientForSendRight:(id)a3
{
  id v4;
  NSMutableSet *lock_accelerometerClients;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10005B828;
  v16 = sub_10005B838;
  v17 = 0;
  lock_accelerometerClients = self->_lock_accelerometerClients;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000060C4;
  v9[3] = &unk_1000EB5C8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableSet enumerateObjectsUsingBlock:](lock_accelerometerClients, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  __IOHIDEvent *v6;
  uint64_t TimeStamp;
  double v8;
  double FloatValue;
  double v10;
  double v11;
  int IntegerValue;
  id v13;
  NSObject *v14;
  NSMutableSet *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  SLGNotificationActivatedLogger *studyLog;
  _QWORD v28[7];
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;

  v6 = *a3;
  TimeStamp = IOHIDEventGetTimeStamp(*a3);
  v8 = BSMonotonicReferencedTimeFromMachTime(TimeStamp);
  FloatValue = IOHIDEventGetFloatValue(v6, 851968);
  v10 = IOHIDEventGetFloatValue(v6, 851969);
  v11 = IOHIDEventGetFloatValue(v6, 851970);
  IntegerValue = IOHIDEventGetIntegerValue(v6, 851971);
  v13 = sub_100010F8C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    v36 = IntegerValue;
    v37 = 2048;
    v38 = FloatValue;
    v39 = 2048;
    v40 = v10;
    v41 = 2048;
    v42 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Acc (type %d): %f %f %f", buf, 0x26u);
  }

  -[NSLock lock](self->_lock, "lock");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_lock_accelerometerClients;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v20 = v16;
    v21 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v15);
        v22 = FloatValue;
        *(float *)&v17 = v22;
        v23 = v10;
        *(float *)&v18 = v23;
        v24 = v11;
        *(float *)&v19 = v24;
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v25), "handleAccelerometerEventWithTimestamp:x:y:z:samplingInterval:", v8, v17, v18, v19, self->_lock_samplingInterval);
        v25 = (char *)v25 + 1;
      }
      while (v20 != v25);
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  -[NSLock unlock](self->_lock, "unlock");
  if ((-[BKSLocalDefaults disableStudyLogAccelerometerLogging](self->_localDefaults, "disableStudyLogAccelerometerLogging") & 1) == 0)
  {
    studyLog = self->_studyLog;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005B840;
    v28[3] = &unk_1000EB5A0;
    *(double *)&v28[4] = FloatValue;
    *(double *)&v28[5] = v10;
    *(double *)&v28[6] = v11;
    v29 = IntegerValue;
    -[SLGNotificationActivatedLogger logBlock:domain:](studyLog, "logBlock:domain:", v28, CFSTR("com.apple.backboard.hid.accelerometer"));
  }
  return 1;
}

- (void)bksAccelerometerClientRequestedAccelerometerEvents:(id)a3 updateInterval:(double)a4 xThreshold:(float)a5 yThreshold:(float)a6 zThreshold:(float)a7 auditToken:(id *)a8
{
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019098;
  v8[3] = &unk_1000EB560;
  *(double *)&v8[4] = a4;
  v9 = a5;
  v10 = a6;
  v11 = a7;
  -[BKAccelerometerInterface _handleAccelerometerRequestForPort:auditToken:updateBlock:](self, "_handleAccelerometerRequestForPort:auditToken:updateBlock:", a3, a8, v8);
}

+ (id)sharedInstance
{
  if (qword_100117458 != -1)
    dispatch_once(&qword_100117458, &stru_1000EB540);
  return (id)qword_100117450;
}

- (BKAccelerometerInterface)init
{
  BKAccelerometerInterface *v2;
  NSLock *v3;
  NSLock *lock;
  NSMutableSet *v5;
  NSMutableSet *lock_accelerometerClients;
  id v7;
  uint64_t v8;
  BKOrientationManager *lock_orientationManager;
  id *v10;
  uint64_t v11;
  id lock_orientationManagerObservationAssertion;
  uint64_t v13;
  uint64_t v14;
  BKOrientationManager *v15;
  NSObject *queue;
  _BOOL8 v17;
  uint64_t v18;
  BKSLocalDefaults *localDefaults;
  id v20;
  id v21;
  void *v22;
  id v23;
  SLGNotificationActivatedLogger *v24;
  SLGNotificationActivatedLogger *studyLog;
  objc_super v27;
  _QWORD block[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v27.receiver = self;
  v27.super_class = (Class)BKAccelerometerInterface;
  v2 = -[BKAccelerometerInterface init](&v27, "init");
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_accelerometerClients = v2->_lock_accelerometerClients;
    v2->_lock_accelerometerClients = v5;

    v7 = sub_10001A7F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    lock_orientationManager = v2->_lock_orientationManager;
    v2->_lock_orientationManager = (BKOrientationManager *)v8;

    v10 = sub_10008BB88((id *)&v2->_lock_orientationManager->super.isa, v2);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    lock_orientationManagerObservationAssertion = v2->_lock_orientationManagerObservationAssertion;
    v2->_lock_orientationManagerObservationAssertion = (id)v11;

    v13 = (uint64_t)v2->_lock_orientationManager;
    v14 = sub_10008B304(v13);
    v15 = v2->_lock_orientationManager;
    if (v15)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      queue = v15->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008B3B4;
      block[3] = &unk_1000ECDD0;
      block[4] = v15;
      block[5] = &v29;
      dispatch_sync(queue, block);
      v17 = *((_BYTE *)v30 + 24) != 0;
      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v17 = 0;
    }
    -[BKAccelerometerInterface orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:](v2, "orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:", v13, v14, 0, v17);
    v18 = objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    localDefaults = v2->_localDefaults;
    v2->_localDefaults = (BKSLocalDefaults *)v18;

    v20 = objc_alloc((Class)SLGNotificationActivatedLogger);
    v21 = objc_alloc((Class)SLGActivatableLogger);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v23 = objc_msgSend(v21, "initWithLogger:", v22);
    v24 = (SLGNotificationActivatedLogger *)objc_msgSend(v20, "initWithLogger:", v23);
    studyLog = v2->_studyLog;
    v2->_studyLog = v24;

    -[SLGNotificationActivatedLogger addBeginNotification:endNotification:](v2->_studyLog, "addBeginNotification:endNotification:", CFSTR("SBStudyLogBeginCameraButtonLogging"), CFSTR("SBStudyLogEndCameraButtonLogging"));
  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKAccelerometerInterface *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("this object should not be deallocated")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138544642;
    v12 = v6;
    v13 = 2114;
    v14 = v10;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("BKAccelerometerInterface.m");
    v19 = 1024;
    v20 = 90;
    v21 = 2114;
    v22 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
}

- (void)bksAccelerometerClientRequestedOrientationEvents:(id)a3 enabled:(BOOL)a4 passiveEvents:(BOOL)a5 auditToken:(id *)a6
{
  _QWORD v6[4];
  BOOL v7;
  BOOL v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B998;
  v6[3] = &unk_1000EB580;
  v7 = a4;
  v8 = a5;
  -[BKAccelerometerInterface _handleAccelerometerRequestForPort:auditToken:updateBlock:](self, "_handleAccelerometerRequestForPort:auditToken:updateBlock:", a3, a6, v6);
}

- (void)systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;

  v6 = a4;
  v8 = a3;
  v9 = BKLogOrientationDevice(-[NSLock lock](self->_lock, "lock"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v8;
    v13 = 1024;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "systemAppSetOrientationEventsClient:%{public}@ wantsOrientationEvents:%{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  -[BKAccelerometerInterface _lock_systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:](self, "_lock_systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:", v8, v6, a5);
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");

}

- (NSString)description
{
  void *v3;
  BKOrientationManager *lock_orientationManager;
  NSObject *queue;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    queue = lock_orientationManager->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008A958;
    v12[3] = &unk_1000ECDD0;
    v12[4] = lock_orientationManager;
    v12[5] = &v13;
    dispatch_sync(queue, v12);
    v6 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "appendBool:withName:", v6, CFSTR("eventsEnabled"));
  v8 = objc_msgSend(v3, "appendObject:withName:", self->_lock_accelerometerClients, CFSTR("clients"));
  v9 = objc_msgSend(v3, "appendObject:withName:", self->_lock_systemAppOrientationClient, CFSTR("systemAppOrientationClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v10;
}

- (void)clientDied:(id)a3
{
  NSLock *lock;
  BKAccelerometerClient *v5;
  BKAccelerometerClient *lock_systemAppOrientationClient;

  lock = self->_lock;
  v5 = (BKAccelerometerClient *)a3;
  -[NSLock lock](lock, "lock");
  -[BKAccelerometerClient invalidate](v5, "invalidate");
  -[NSMutableSet removeObject:](self->_lock_accelerometerClients, "removeObject:", v5);
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;

  if (lock_systemAppOrientationClient == v5)
    -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");
}

- (void)_lock_clearSystemAppOrientationClient
{
  BKAccelerometerClient *lock_systemAppOrientationClient;

  if (self->_lock_systemAppOrientationClient)
  {
    -[NSMutableSet removeObject:](self->_lock_accelerometerClients, "removeObject:");
    -[BKAccelerometerClient invalidate](self->_lock_systemAppOrientationClient, "invalidate");
    lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
    self->_lock_systemAppOrientationClient = 0;

  }
}

- (void)_lock_systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  uint64_t ClientConnectionManager;
  void *v10;
  id v11;
  id *p_lock_systemAppOrientationClient;
  BKAccelerometerClientUIApp *v13;
  _BOOL8 v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;

  v5 = a4;
  v7 = a3;
  ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  v11 = objc_msgSend(v10, "pidForBundleID:", v7);

  if (v7 && (int)v11 >= 1 && v5)
  {
    p_lock_systemAppOrientationClient = (id *)&self->_lock_systemAppOrientationClient;
    if (-[BKAccelerometerClient pid](self->_lock_systemAppOrientationClient, "pid") != (_DWORD)v11)
    {
      -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
      v13 = -[BKAccelerometerClientUIApp initWithPid:sendRight:]([BKAccelerometerClientUIApp alloc], "initWithPid:sendRight:", v11, 0);
      -[BKAccelerometerClientUIApp setDelegate:](v13, "setDelegate:", self);
      -[BKAccelerometerClient setWantsOrientationEvents:](v13, "setWantsOrientationEvents:", 1);
      -[NSMutableSet addObject:](self->_lock_accelerometerClients, "addObject:", v13);
      objc_storeStrong((id *)&self->_lock_systemAppOrientationClient, v13);
      v20 = 0;
      v14 = sub_10008B3D8((uint64_t)self->_lock_orientationManager, (uint64_t)&v20);
      v15 = BKLogOrientationDevice(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *p_lock_systemAppOrientationClient;
        v18 = BSDeviceOrientationDescription(v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        v23 = 2114;
        v24 = v19;
        v25 = 1024;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "systemAppSetOrientationEventsClient:%{public}@ currentOrientation:%{public}@ orientationLocked:%{BOOL}u", buf, 0x1Cu);

      }
      if (v20)
        objc_msgSend(*p_lock_systemAppOrientationClient, "handleOrientationEvent:orientationLocked:", v20, v14);

    }
  }
  else
  {
    -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
  }
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  _BOOL8 v6;
  BKAccelerometerClient *lock_systemAppOrientationClient;
  uint64_t v10;
  uint64_t v11;
  uint64_t DeviceOrientationEventWithUsage;
  const void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
  if (lock_systemAppOrientationClient)
  {
    -[BKAccelerometerClient handleOrientationEvent:orientationLocked:](lock_systemAppOrientationClient, "handleOrientationEvent:orientationLocked:", a4, v6);
  }
  else
  {
    if ((unint64_t)(a4 - 1) >= 6)
      v10 = 100;
    else
      v10 = (a4 + 100);
    v11 = mach_absolute_time();
    DeviceOrientationEventWithUsage = IOHIDEventCreateDeviceOrientationEventWithUsage(0, v11, v10, 0);
    if (DeviceOrientationEventWithUsage)
    {
      v13 = (const void *)DeviceOrientationEventWithUsage;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDUnknownSender unknownSenderInfo](BKHIDUnknownSender, "unknownSenderInfo"));
      objc_msgSend(v14, "postEvent:fromSender:", v13, v15);

      CFRelease(v13);
    }
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_studyLog, 0);
  objc_storeStrong(&self->_lock_orientationManagerObservationAssertion, 0);
  objc_storeStrong((id *)&self->_lock_orientationManager, 0);
  objc_storeStrong((id *)&self->_lock_systemAppOrientationClient, 0);
  objc_storeStrong((id *)&self->_lock_accelerometerClients, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
