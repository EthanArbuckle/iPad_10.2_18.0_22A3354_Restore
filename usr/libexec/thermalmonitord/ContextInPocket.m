@implementation ContextInPocket

- (int)numberOfFields
{
  return 1;
}

- (void)updateContextActiveState
{
  dispatch_time_t v3;
  unint64_t v4;
  BOOL v5;
  dispatch_time_t v6;
  unint64_t v7;
  BOOL v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned int v14;
  int v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  unsigned int v19;
  unsigned int v20;
  _BOOL4 carSessionActive;
  unsigned int v22;
  unsigned int v23;
  _BOOL4 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  ContextInPocket *v27;
  uint64_t v28;
  TGraphSampler *v29;
  uint64_t v30;
  int v31;
  int v32;
  uint8_t buf[4];
  _BOOL4 v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  unsigned int v48;

  dispatch_assert_queue_V2((dispatch_queue_t)-[ContextInPocket inPocketQueue](self, "inPocketQueue"));
  v3 = dispatch_time(0, 0);
  v4 = -[ContextInPocket wakeInProgressUntilTime](self, "wakeInProgressUntilTime");
  v5 = v3 <= v4;
  v6 = dispatch_time(0, 0);
  v7 = -[ContextInPocket stockholmFieldDetectInProgressUntilTime](self, "stockholmFieldDetectInProgressUntilTime");
  v8 = v6 <= v7;
  v9 = -[ContextInPocket backlightIsOn](self, "backlightIsOn");
  v10 = v9;
  if (!byte_1000A2491)
  {
    if (byte_1000A2492)
    {
      v12 = 0;
      if (v9)
      {
LABEL_13:
        if (!-[ContextInPocket contextIsActive](self, "contextIsActive"))
          goto LABEL_38;
        v11 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v13 = -[ContextInPocket connectedExternally](self, "connectedExternally");
      if (byte_1000A2460)
        v12 = 0;
      else
        v12 = v13;
      if (v10)
        goto LABEL_13;
    }
    if ((v12 & 1) == 0
      && !-[ContextInPocket audioIsOn](self, "audioIsOn")
      && !self->_carSessionActive
      && v3 > v4
      && v6 > v7)
    {
      v11 = -[ContextInPocket powerIsOn](self, "powerIsOn");
      if (v11 == -[ContextInPocket contextIsActive](self, "contextIsActive"))
        goto LABEL_38;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (-[ContextInPocket contextIsActive](self, "contextIsActive"))
    goto LABEL_38;
  v11 = 1;
LABEL_15:
  -[ContextInPocket setContextIsActive:](self, "setContextIsActive:", v11);
  v14 = -[ContextInPocket contextIsActive](self, "contextIsActive");
  v15 = byte_10009A1F0;
  v16 = byte_10009A1F1;
  v17 = qword_1000A28A0;
  v18 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
  if (v14 && v15 && v16)
  {
    if (v18)
    {
      v19 = -[ContextInPocket connectedExternally](self, "connectedExternally");
      v31 = byte_1000A2460;
      v20 = -[ContextInPocket audioIsOn](self, "audioIsOn");
      carSessionActive = self->_carSessionActive;
      *(_DWORD *)buf = 67110912;
      v34 = v10;
      v35 = 1024;
      v36 = v19;
      v37 = 1024;
      v38 = v31;
      v39 = 1024;
      v40 = v20;
      v41 = 1024;
      v42 = carSessionActive;
      v43 = 1024;
      v44 = v3 <= v4;
      v45 = 1024;
      v46 = v6 <= v7;
      v47 = 1024;
      v48 = -[ContextInPocket powerIsOn](self, "powerIsOn");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Engaging HiP - backlightIsOn %d, connectedExternally %d, toppingOff %d, audioIsOn %d, carSessionActive %d, wakeInProgress %d, fieldDetectInProgress %d, powerIsOn %d", buf, 0x32u);
    }
    kdebug_trace(728039428, 0, 0, 0, 0);
    if (-[ContextInPocket usesPackagePowerControl](self, "usesPackagePowerControl"))
    {
      objc_msgSend((id)qword_1000A2E38, "setPackagePowerCeiling:fromDecisionSource:", self->_minPackagePower, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    else
    {
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:forDVD1Contributor:", self->_minCPU, 1);
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:fromDecisionSource:", self->_minCPU, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
      objc_msgSend((id)qword_1000A2E38, "setGPUPowerCeiling:fromDecisionSource:", self->_minGPU, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    v8 = v6 <= v7;
    v5 = v3 <= v4;
    v25 = v6 <= v7;
    v26 = v3 <= v4;
    v27 = self;
    v28 = 1;
  }
  else
  {
    if (v18)
    {
      v22 = -[ContextInPocket connectedExternally](self, "connectedExternally");
      v32 = byte_1000A2460;
      v23 = -[ContextInPocket audioIsOn](self, "audioIsOn");
      v24 = self->_carSessionActive;
      *(_DWORD *)buf = 67110912;
      v34 = v10;
      v35 = 1024;
      v36 = v22;
      v37 = 1024;
      v38 = v32;
      v39 = 1024;
      v40 = v23;
      v41 = 1024;
      v42 = v24;
      v43 = 1024;
      v44 = v3 <= v4;
      v45 = 1024;
      v46 = v6 <= v7;
      v47 = 1024;
      v48 = -[ContextInPocket powerIsOn](self, "powerIsOn");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Disengaging HiP - backlightIsOn %d, connectedExternally %d, toppingOff %d, audioIsOn %d, carSessionActive %d, wakeInProgress %d, fieldDetectInProgress %d, powerIsOn %d", buf, 0x32u);
    }
    kdebug_trace(728039432, 0, 0, 0, 0);
    if (-[ContextInPocket usesPackagePowerControl](self, "usesPackagePowerControl"))
    {
      objc_msgSend((id)qword_1000A2E38, "setPackagePowerCeiling:fromDecisionSource:", 65000, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    else
    {
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:forDVD1Contributor:", 101, 1);
      objc_msgSend((id)qword_1000A2E38, "setCPUPowerCeiling:fromDecisionSource:", 101, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
      objc_msgSend((id)qword_1000A2E38, "setGPUPowerCeiling:fromDecisionSource:", 100, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    v8 = v6 <= v7;
    v5 = v3 <= v4;
    v25 = v6 <= v7;
    v26 = v3 <= v4;
    v27 = self;
    v28 = 0;
  }
  -[ContextInPocket logHiPSignalsToPowerLog::::](v27, "logHiPSignalsToPowerLog::::", v28, v10, v25, v26);
  if (!byte_1000A2DC0)
  {
    if (-[ContextInPocket usesPackagePowerControl](self, "usesPackagePowerControl"))
    {
      objc_msgSend((id)qword_1000A2E38, "updatePackage");
    }
    else
    {
      objc_msgSend((id)qword_1000A2E38, "updateCPU");
      objc_msgSend((id)qword_1000A2E38, "updateGPU");
    }
  }
  v29 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
  if (-[ContextInPocket contextIsActive](self, "contextIsActive"))
    v30 = 100;
  else
    v30 = 0;
  -[TGraphSampler updatePowerlogMiscState:value:](v29, "updatePowerlogMiscState:value:", 1, v30);
LABEL_38:
  *(float *)&dword_1000A2AEC = (float)-[ContextInPocket contextIsActive](self, "contextIsActive");
  byte_1000A2493 = v10;
  byte_1000A2494 = -[ContextInPocket connectedExternally](self, "connectedExternally");
  byte_1000A2495 = byte_1000A2460;
  byte_1000A2496 = -[ContextInPocket audioIsOn](self, "audioIsOn");
  byte_1000A2497 = self->_carSessionActive;
  byte_1000A2498 = v5;
  byte_1000A2499 = v8;
  if (byte_1000A2DC0)
  {
    -[SensorExchangeHelper updateAllSensorExchangeData](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "updateAllSensorExchangeData");
    -[SensorExchangeHelper sendSensorExchangeDataToSMC](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "sendSensorExchangeDataToSMC");
  }
}

- (BOOL)contextIsActive
{
  return self->contextIsActive;
}

- (BOOL)connectedExternally
{
  return self->connectedExternally;
}

- (unint64_t)wakeInProgressUntilTime
{
  return self->wakeInProgressUntilTime;
}

- (unint64_t)stockholmFieldDetectInProgressUntilTime
{
  return self->stockholmFieldDetectInProgressUntilTime;
}

- (OS_dispatch_queue)inPocketQueue
{
  return self->_inPocketQueue;
}

- (BOOL)backlightIsOn
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomic_isBacklightOn);
  return v2 & 1;
}

- (BOOL)audioIsOn
{
  return self->audioIsOn;
}

- (BOOL)synchContext
{
  return 1;
}

- (void)setUncapRequestClientID:(int)a3
{
  self->_uncapRequestClientID = a3;
}

- (void)setStockholmFieldDetectInProgressUntilTime:(unint64_t)a3
{
  self->stockholmFieldDetectInProgressUntilTime = a3;
}

- (void)setConnectedExternally:(BOOL)a3
{
  self->connectedExternally = a3;
}

- (void)setAudioIsOn:(BOOL)a3
{
  self->audioIsOn = a3;
}

- (unsigned)pmuPowerService
{
  return self->pmuPowerService;
}

- (int)getContextState
{
  return -[ContextInPocket contextIsActive](self, "contextIsActive");
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), -[ContextInPocket getContextState](self, "getContextState"));
}

- (void)handleCurrentTopOffStatusWithContext:(id)a3
{
  byte_1000A2460 = (char *)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", qword_1000A1D70), "unsignedIntegerValue")- 5 < (char *)2;
}

- (void)registerForTopOffStatusChanges
{
  id v3;
  id v4;
  _QWORD v5[6];

  v3 = +[_CDClientContext userContext](_CDClientContext, "userContext");
  qword_1000A1D70 = +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/charging/topOffCheckpoint"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024C78;
  v5[3] = &unk_10007DBA8;
  v5[4] = self;
  v5[5] = v3;
  v4 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.cltm.obcstatus"), +[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", qword_1000A1D70), CFSTR("com.apple.cltm.context"), v5);
  -[ContextInPocket handleCurrentTopOffStatusWithContext:](self, "handleCurrentTopOffStatusWithContext:", v3);
  -[ContextInPocket updateContextActiveState](self, "updateContextActiveState");
  objc_msgSend(v3, "registerCallback:", v4);
}

- (ContextInPocket)initWithParams:(id)a3
{
  ContextInPocket *v4;
  ContextInPocket *v5;
  NSObject *v6;
  uint64_t v7;
  CARSessionStatus *v8;
  _QWORD v10[5];
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v11.receiver = self;
  v11.super_class = (Class)ContextInPocket;
  v4 = -[ContextInPocket init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->super.ctxType = 1;
    -[ContextInPocket setContextIsActive:](v4, "setContextIsActive:", 0);
    -[ContextInPocket setConnectedExternally:](v5, "setConnectedExternally:", 1);
    -[ContextInPocket setAudioIsOn:](v5, "setAudioIsOn:", 1);
    -[ContextInPocket setPowerIsOn:](v5, "setPowerIsOn:", 1);
    v5->_carSessionActive = 0;
    atomic_store(1u, (unsigned __int8 *)&v5->_atomic_isBacklightOn);
    -[ContextInPocket setUsesPackagePowerControl:](v5, "setUsesPackagePowerControl:", 0);
    if (a3)
    {
      sub_1000048B0((CFDictionaryRef)a3, CFSTR("minPackagePower"), kCFNumberIntType, &v5->_minPackagePower);
      if (v5->_minPackagePower < 1)
      {
        v5->_minCPU = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("minCPU")), "intValue");
        v5->_minGPU = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("minGPU")), "intValue");
      }
      else
      {
        -[ContextInPocket setUsesPackagePowerControl:](v5, "setUsesPackagePowerControl:", 1);
      }
    }
    else
    {
      v5->_minCPU = 0;
      v5->_minGPU = 0;
    }
    v5->_inPocketQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ThermalMonitor.context.pocket", 0);
    -[ContextInPocket setBrightnessSystemMonitor:](v5, "setBrightnessSystemMonitor:", objc_opt_new(BrightnessSystemClient));
    if (v5->_inPocketQueue)
    {
      -[ContextInPocket setMitigationControllerListID:](v5, "setMitigationControllerListID:", objc_msgSend((id)qword_1000A2E38, "requestListID"));
      -[ContextInPocket initPowerHandling](v5, "initPowerHandling");
      -[ContextInPocket _acquireBacklightAssertion](v5, "_acquireBacklightAssertion");
      -[ContextInPocket initAudioHandling](v5, "initAudioHandling");
      -[ContextInPocket initStockholmHandling](v5, "initStockholmHandling");
    }
    else
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050A00(v6);
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = sub_100025E38;
    v17 = sub_100025E48;
    v7 = qword_1000A1D78;
    v18 = qword_1000A1D78;
    if (!qword_1000A1D78)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100025E54;
      v12[3] = &unk_10007DBF8;
      v12[4] = &v13;
      sub_100025E54((uint64_t)v12);
      v7 = v14[5];
    }
    _Block_object_dispose(&v13, 8);
    v8 = (CARSessionStatus *)objc_opt_new(v7);
    v5->_carSessionStatus = v8;
    -[CARSessionStatus addSessionObserver:](v8, "addSessionObserver:", v5);
    v5->_carSessionActive = -[CARSessionStatus currentSession](v5->_carSessionStatus, "currentSession") != 0;
    if (-[ContextInPocket inPocketQueue](v5, "inPocketQueue"))
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100025070;
      v10[3] = &unk_10007D248;
      v10[4] = v5;
      dispatch_async((dispatch_queue_t)-[ContextInPocket inPocketQueue](v5, "inPocketQueue"), v10);
    }
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 11, CFSTR("zETM"), 11);
      *(float *)&dword_1000A2AEC = (float)-[ContextInPocket contextIsActive](v5, "contextIsActive");
    }
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v5);
  }
  return v5;
}

- (void)dealloc
{
  io_object_t notification;
  io_object_t ioIterator;
  TMInvalidatable *backlightAssertion;
  int audioRunningToken;
  int stockholmToken;
  objc_super v8;

  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  ioIterator = self->_ioIterator;
  if (ioIterator)
    IOObjectRelease(ioIterator);
  backlightAssertion = self->_backlightAssertion;
  if (backlightAssertion)
    -[TMInvalidatable invalidate](backlightAssertion, "invalidate");
  audioRunningToken = self->_audioRunningToken;
  if (audioRunningToken)
    notify_cancel(audioRunningToken);
  stockholmToken = self->_stockholmToken;
  if (stockholmToken)
    notify_cancel(stockholmToken);
  if (-[ContextInPocket notificationPort](self, "notificationPort"))
    IONotificationPortDestroy(-[ContextInPocket notificationPort](self, "notificationPort"));
  -[CARSessionStatus removeSessionObserver:](self->_carSessionStatus, "removeSessionObserver:", self);
  v8.receiver = self;
  v8.super_class = (Class)ContextInPocket;
  -[ContextInPocket dealloc](&v8, "dealloc");
}

- (void)initPowerHandling
{
  const __CFDictionary *v3;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;

  -[ContextInPocket setNotificationPort:](self, "setNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
  v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    IOServiceAddMatchingNotification(-[ContextInPocket notificationPort](self, "notificationPort"), "IOServiceFirstPublish", v3, (IOServiceMatchingCallback)sub_100025214, self, &self->_ioIterator);
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(-[ContextInPocket notificationPort](self, "notificationPort"));
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    sub_100025214(self, self->_ioIterator);
  }
}

- (void)initAudioHandling
{
  OS_dispatch_queue *inPocketQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  inPocketQueue = self->_inPocketQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003684;
  v4[3] = &unk_10007D0E8;
  objc_copyWeak(&v5, &location);
  sub_1000358D8("com.apple.coreaudio.IORunning", &self->_audioRunningToken, inPocketQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)initStockholmHandling
{
  OS_dispatch_queue *inPocketQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  inPocketQueue = self->_inPocketQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004040;
  v4[3] = &unk_10007D0E8;
  objc_copyWeak(&v5, &location);
  sub_1000358D8("com.apple.request.hipuncap", &self->_stockholmToken, inPocketQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)logHiPSignalsToPowerLog:(char)a3 :(BOOL)a4 :(BOOL)a5 :(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v6 = a6;
  v7 = a5;
  v8 = a3;
  if (a4)
    v10 = 128;
  else
    v10 = 0;
  if (-[ContextInPocket connectedExternally](self, "connectedExternally"))
    v11 = 64;
  else
    v11 = 0;
  v12 = byte_1000A2460;
  if (-[ContextInPocket audioIsOn](self, "audioIsOn"))
    v13 = 16;
  else
    v13 = 0;
  if (v6)
    v14 = 4;
  else
    v14 = 0;
  if (v7)
    v15 = 2;
  else
    v15 = 0;
  -[TGraphSampler updatePowerLogLiteHiP:client:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "updatePowerLogLiteHiP:client:", v8, (v15 | v10 | v14 | v11 | (32 * v12) | v13 | (8 * self->_carSessionActive))+ -[ContextInPocket powerIsOn](self, "powerIsOn"));
}

- (void)updateSystemPowerState:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[ContextInPocket inPocketQueue](self, "inPocketQueue"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10002564C;
    v5[3] = &unk_10007D8E0;
    v5[4] = self;
    v6 = a3;
    dispatch_async((dispatch_queue_t)-[ContextInPocket inPocketQueue](self, "inPocketQueue"), v5);
  }
}

- (void)setBacklightIsOn:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_atomic_isBacklightOn);
}

- (void)setBrightnessSystemMonitor:(id)a3
{
  TMInvalidatable *backlightAssertion;

  if (-[ContextInPocket brightnessSystemMonitor](self, "brightnessSystemMonitor") != a3)
  {
    self->_brightnessSystemMonitor = (BrightnessSystemMonitorable *)a3;
    backlightAssertion = self->_backlightAssertion;
    if (backlightAssertion)
    {
      -[TMInvalidatable invalidate](backlightAssertion, "invalidate");
      self->_backlightAssertion = 0;
      -[ContextInPocket _acquireBacklightAssertion](self, "_acquireBacklightAssertion");
    }
  }
}

- (BOOL)_acquireBacklightAssertion
{
  NSObject *v4;
  BrightnessSystemMonitorable *brightnessSystemMonitor;
  _QWORD v6[5];
  id v7;
  id buf[2];

  if (self->_backlightAssertion || !self->_brightnessSystemMonitor)
    return 0;
  v4 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> HIP: Reacquiring Backlight Assertion", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  brightnessSystemMonitor = self->_brightnessSystemMonitor;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000259C4;
  v6[3] = &unk_10007DBD0;
  objc_copyWeak(&v7, buf);
  v6[4] = self;
  self->_backlightAssertion = (TMInvalidatable *)-[BrightnessSystemMonitorable monitorDisplayOnStateForReason:handler:](brightnessSystemMonitor, "monitorDisplayOnStateForReason:handler:", CFSTR("HotInPocket Backlight Signal"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
  return 1;
}

- (void)sessionDidConnect:(id)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025B48;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)-[ContextInPocket inPocketQueue](self, "inPocketQueue"), block);
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025BF8;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)-[ContextInPocket inPocketQueue](self, "inPocketQueue"), block);
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("ContextInPocket state");
}

- (void)setContextIsActive:(BOOL)a3
{
  self->contextIsActive = a3;
}

- (BOOL)powerIsOn
{
  return self->powerIsOn;
}

- (void)setPowerIsOn:(BOOL)a3
{
  self->powerIsOn = a3;
}

- (void)setWakeInProgressUntilTime:(unint64_t)a3
{
  self->wakeInProgressUntilTime = a3;
}

- (int)mitigationControllerListID
{
  return self->mitigationControllerListID;
}

- (void)setMitigationControllerListID:(int)a3
{
  self->mitigationControllerListID = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)audioRunningToken
{
  return self->_audioRunningToken;
}

- (void)setAudioRunningToken:(int)a3
{
  self->_audioRunningToken = a3;
}

- (int)uncapRequestClientID
{
  return self->_uncapRequestClientID;
}

- (int)stockholmToken
{
  return self->_stockholmToken;
}

- (void)setStockholmToken:(int)a3
{
  self->_stockholmToken = a3;
}

- (unsigned)minCPU
{
  return self->_minCPU;
}

- (void)setMinCPU:(unsigned __int8)a3
{
  self->_minCPU = a3;
}

- (unsigned)minGPU
{
  return self->_minGPU;
}

- (void)setMinGPU:(unsigned __int8)a3
{
  self->_minGPU = a3;
}

- (void)setPmuPowerService:(unsigned int)a3
{
  self->pmuPowerService = a3;
}

- (IONotificationPort)notificationPort
{
  return self->notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->notificationPort = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (unsigned)ioIterator
{
  return self->_ioIterator;
}

- (void)setIoIterator:(unsigned int)a3
{
  self->_ioIterator = a3;
}

- (void)setInPocketQueue:(id)a3
{
  self->_inPocketQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)usesPackagePowerControl
{
  return self->usesPackagePowerControl;
}

- (void)setUsesPackagePowerControl:(BOOL)a3
{
  self->usesPackagePowerControl = a3;
}

- (int)minPackagePower
{
  return self->_minPackagePower;
}

- (void)setMinPackagePower:(int)a3
{
  self->_minPackagePower = a3;
}

- (BrightnessSystemMonitorable)brightnessSystemMonitor
{
  return self->_brightnessSystemMonitor;
}

@end
