@implementation WiFiBatteryManager

- (WiFiBatteryManager)initWithContext:(void *)a3
{
  WiFiBatteryManager *v4;
  WiFiBatteryManager *v5;
  uint64_t v6;
  NSDate *asyncPPMBudgetTimestamp;
  NSMutableDictionary *v8;
  NSMutableDictionary *cachedBudget;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CPMSAgentProtocol *cpmsAgent;
  uint64_t v15;
  CPMSClientDescription *wifiClientDescriptionRef;
  CPMSClientDescription *v17;
  CPMSClientDescription *v18;
  uint64_t v19;
  PPMClient *wifiPpmClientRef;
  NSMutableArray *v21;
  NSMutableArray *pendingRequests;
  void *v23;
  void *v25;
  NSMutableArray *v26;
  CPMSClientDescription *v27;
  CPMSAgentProtocol *v28;
  PPMClient *v29;
  NSMutableDictionary *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)WiFiBatteryManager;
  v4 = -[WiFiBatteryManager init](&v31, "init");
  v5 = v4;
  if (!v4)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : unable to super initialize WiFiBatteryManagerClient.", "-[WiFiBatteryManager initWithContext:]");
    goto LABEL_23;
  }
  v4->_manager = (__WiFiManager *)a3;
  if (!a3)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : null wifi manager ref!?.", "-[WiFiBatteryManager initWithContext:]");
    goto LABEL_23;
  }
  *(_WORD *)&v4->_wifiClientRegistered = 0;
  v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
  asyncPPMBudgetTimestamp = v5->_asyncPPMBudgetTimestamp;
  v5->_asyncPPMBudgetTimestamp = (NSDate *)v6;

  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  cachedBudget = v5->_cachedBudget;
  v5->_cachedBudget = v8;

  if (!objc_opt_class(CPMSAgent))
  {
    -[WiFiBatteryManager setCpmsActive:](v5, "setCpmsActive:", 0);
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error! CPMS FWK does not exist! ", "-[WiFiBatteryManager initWithContext:]");
    objc_autoreleasePoolPop(v12);
    goto LABEL_17;
  }
  v10 = +[CPMSAgent isCPMSSupported](CPMSAgent, "isCPMSSupported");
  v5->_cpmsActive = v10;
  if (v10)
  {
    if (v5->_cpmsAgent)
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : cpms agent exists ", "-[WiFiBatteryManager initWithContext:]");
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[CPMSAgent sharedCPMSAgent](CPMSAgent, "sharedCPMSAgent"));
      cpmsAgent = v5->_cpmsAgent;
      v5->_cpmsAgent = (CPMSAgentProtocol *)v13;

      if (!v5->_cpmsAgent)
      {
        v25 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error: couldn't get sharedCPMSAgent", "-[WiFiBatteryManager initWithContext:]");
        goto LABEL_23;
      }
      v5->_wifiCPMSHandle = 2;
    }
    v15 = objc_opt_class(CPMSClientDescription);
    wifiClientDescriptionRef = v5->_wifiClientDescriptionRef;
    if (!v15)
    {
      v5->_wifiClientDescriptionRef = 0;

      v25 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error: cpms is active but [CPMSClientDescription class] fails!", "-[WiFiBatteryManager initWithContext:]");
      goto LABEL_23;
    }
    if (!wifiClientDescriptionRef)
    {
      v17 = (CPMSClientDescription *)objc_alloc_init((Class)CPMSClientDescription);
      v18 = v5->_wifiClientDescriptionRef;
      v5->_wifiClientDescriptionRef = v17;

      if (!v5->_wifiClientDescriptionRef)
      {
        v25 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error: unable to alloc and init CPMSClientDescription", "-[WiFiBatteryManager initWithContext:]");
        goto LABEL_23;
      }
    }
LABEL_17:
    if (v5->_cpmsActive)
      goto LABEL_19;
  }
  v19 = objc_claimAutoreleasedReturnValue(+[PPMClient sharedInstanceWithClientRepresentation:error:](PPMClient, "sharedInstanceWithClientRepresentation:error:", CFSTR("com.apple.duet.ppm-attr.wifi"), 0));
  wifiPpmClientRef = v5->_wifiPpmClientRef;
  v5->_wifiPpmClientRef = (PPMClient *)v19;

  if (!v5->_wifiPpmClientRef)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  No PPM support.", "-[WiFiBatteryManager initWithContext:]");
    goto LABEL_23;
  }
LABEL_19:
  *(_OWORD *)&v5->_availableResource = xmmword_1001BB980;
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](v5, "pendingRequests"));
  if (!v23)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  null pending requests!", "-[WiFiBatteryManager initWithContext:]");
LABEL_23:
    objc_autoreleasePoolPop(v25);
    v26 = v5->_pendingRequests;
    v5->_pendingRequests = 0;

    v27 = v5->_wifiClientDescriptionRef;
    v5->_wifiClientDescriptionRef = 0;

    v28 = v5->_cpmsAgent;
    v5->_cpmsAgent = 0;

    v29 = v5->_wifiPpmClientRef;
    v5->_wifiPpmClientRef = 0;

    v30 = v5->_cachedBudget;
    v5->_cachedBudget = 0;

    return 0;
  }
  return v5;
}

- (void)resetDevice
{
  self->_deviceManager = 0;
}

- (BOOL)setupDevice:(void *)deviceManager
{
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;

  self->_deviceManager = (__WiFiDeviceManager *)deviceManager;
  if (!deviceManager)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : null wifi device manager ref!?.", "-[WiFiBatteryManager setupDevice:]");
    goto LABEL_37;
  }
  if (!self->_wifiClientRegistered)
  {
    if (self->_cpmsActive)
    {
      v4 = sub_1000161D4((uint64_t)deviceManager);
      v5 = sub_10007516C(v4, (uint64_t)&self->_wifiChipPowerTable);
      if (self->_wifiChipPowerTable.dutyCycleTable[0] != 100
        || v5
        || self->_wifiChipPowerTable.powerTable[0] < self->_wifiChipPowerTable.powerTable[9])
      {
        v6 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error! Failed to read power duty cyle table from driver. Using presets. ", "-[WiFiBatteryManager setupDevice:]");
        objc_autoreleasePoolPop(v6);
        *(_DWORD *)&self->_wifiChipPowerTable.dutyCycleTable[10] = 0;
        *(_OWORD *)&self->_wifiChipPowerTable.version = xmmword_1001BB990;
        *(_OWORD *)&self->_wifiChipPowerTable.powerTable[6] = unk_1001BB9A0;
        *(_OWORD *)&self->_wifiChipPowerTable.dutyCycleTable[2] = xmmword_1001BB9B0;
      }
      self->_minBatteryIndex = self->_wifiChipPowerTable.dutyCycleTable[9];
      v7 = sub_1000161D4((uint64_t)self->_deviceManager);
      v8 = sub_1000780B0(v7);
      self->_cpmsContPowerSupport = v8 != 0;
      if (v8)
      {
        v9 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Continous CPMS power budget issupported  ", "-[WiFiBatteryManager setupDevice:]");
        objc_autoreleasePoolPop(v9);
        v10 = self->_wifiChipPowerTable.dutyCycleTable[9];
        self->_pUnconstrained = self->_wifiChipPowerTable.powerTable[0];
        self->_dutyMin = v10;
        v11 = self->_wifiChipPowerTable.powerTable[1];
        v12 = self->_wifiChipPowerTable.powerTable[9];
        self->_pMin = v12;
        self->_pMax = v11;
        if ((_DWORD)v11 != (_DWORD)v12)
          self->_ratioDutyPower = (float)(self->_wifiChipPowerTable.dutyCycleTable[1] - v10) / (float)(v11 - v12);
      }
      else
      {
        v13 = self->_wifiChipPowerTable.powerTable[0];
        self->_pMin = self->_wifiChipPowerTable.powerTable[9];
        self->_pMax = v13;
      }
      for (i = 0; i != 10; ++i)
      {
        v15 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Power : %d    Duty Cycle : %d", "-[WiFiBatteryManager setupDevice:]", self->_wifiChipPowerTable.powerTable[i], self->_wifiChipPowerTable.dutyCycleTable[i]);
        objc_autoreleasePoolPop(v15);
      }
    }
    if (-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::](self, "configureWiFiClientAndRegisterWithBatteryModule::::", -[WiFiBatteryManager cpmsActive](self, "cpmsActive"), self->_manager, self->_wifiPpmClientRef, self->_cpmsAgent))
    {
      self->_wifiClientRegistered = 1;
      deviceManager = self->_deviceManager;
      goto LABEL_22;
    }
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  init done and got cpms/ppm handle But registering with battery module fails!?", "-[WiFiBatteryManager setupDevice:]");
LABEL_37:
    v20 = 0;
    goto LABEL_30;
  }
LABEL_22:
  v16 = sub_1000161D4((uint64_t)deviceManager);
  if (sub_100074FA8(v16, 0x64u))
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Default Power index cannot be set!", "-[WiFiBatteryManager setupDevice:]");
    objc_autoreleasePoolPop(v17);
  }
  v18 = sub_1000161D4((uint64_t)self->_deviceManager);
  if (!sub_100074CD4(v18, 0x64u))
    return 1;
  v19 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Default thermal index cannot be set!", "-[WiFiBatteryManager setupDevice:]");
  v20 = 1;
LABEL_30:
  objc_autoreleasePoolPop(v19);
  return v20;
}

- (BOOL)configureWiFiClientAndRegisterWithBatteryModule:(BOOL)a3 :(__WiFiManager *)a4 :(id)a5 :(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned __int8 v16;
  BOOL v17;
  char v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  if (!self)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  self unintialized.?", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]");
    goto LABEL_12;
  }
  if (!v8)
  {
    -[WiFiBatteryManager WiFiBatteryManagerPpmCallbackConfiguration:](self, "WiFiBatteryManagerPpmCallbackConfiguration:", a4);
    v16 = objc_msgSend(v10, "registerForNotificationsWithError:handler:", 0, self->_WiFiBatteryManagerPpmAsyncNotificationHandler);
    v15 = 0;
    goto LABEL_6;
  }
  if (!self->_wifiClientDescriptionRef)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  WiFiClient Configuration failed!", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]");
LABEL_12:
    objc_autoreleasePoolPop(v19);
    v16 = 0;
    v17 = 0;
LABEL_13:
    v18 = v17 & v16;
    goto LABEL_14;
  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CPMSClientDescription setIsContinuous:](self->_wifiClientDescriptionRef, "setIsContinuous:", 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C11F8;
  v22[3] = &unk_100231078;
  objc_copyWeak(&v23, &location);
  -[CPMSClientDescription setGetCurrentPower:](self->_wifiClientDescriptionRef, "setGetCurrentPower:", v22);
  -[CPMSClientDescription setPowerBudgetUpdateMinimumPeriod:](self->_wifiClientDescriptionRef, "setPowerBudgetUpdateMinimumPeriod:", 1000);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager WiFiBatteryManagerPopulatePowerTable](self, "WiFiBatteryManagerPopulatePowerTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
  -[CPMSClientDescription setPowerLevels:](self->_wifiClientDescriptionRef, "setPowerLevels:", v13);

  -[CPMSClientDescription setClientId:](self->_wifiClientDescriptionRef, "setClientId:", -[WiFiBatteryManager wifiCPMSHandle](self, "wifiCPMSHandle"));
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  -[WiFiBatteryManager WiFiBatteryManagerCpmsCallbackConfiguration:](self, "WiFiBatteryManagerCpmsCallbackConfiguration:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager cpmsAsyncNotificationCallback](self, "cpmsAsyncNotificationCallback"));
  -[CPMSClientDescription setNotificationCallback:](self->_wifiClientDescriptionRef, "setNotificationCallback:", v14);

  v15 = objc_msgSend(v11, "registerClientWithDescription:error:", self->_wifiClientDescriptionRef, 0);
  v16 = 0;
LABEL_6:
  v17 = !v8;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Registration with CPMS/PPM failed!", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]");
    objc_autoreleasePoolPop(v21);
  }
  if ((v15 & v8 & 1) == 0)
    goto LABEL_13;
  v18 = 1;
LABEL_14:

  return v18;
}

- (id)WiFiBatteryManagerPopulatePowerTable
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  if (v3)
  {
    v4 = 35;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned __int16 *)&self->super.isa + v4)));
      objc_msgSend(v3, "addObject:", v5);

      v6 = v4 - 25;
      --v4;
    }
    while (v6 > 1);
  }
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  if (v7)
  {
    v8 = 47;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned __int16 *)&self->super.isa + v8)));
      objc_msgSend(v7, "addObject:", v9);

      v10 = v8 - 37;
      --v8;
    }
    while (v10 > 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v3, v7));
  -[WiFiBatteryManager setDutyCycleToPowerTable100ms:](self, "setDutyCycleToPowerTable100ms:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v7, v3));
  -[WiFiBatteryManager setPowerToDutyCycleTable100ms:](self, "setPowerToDutyCycleTable100ms:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v3, kCPMSPowerTimeScale100ms));
  -[WiFiBatteryManager setWifiDevicePowerLevels100ms:](self, "setWifiDevicePowerLevels100ms:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager wifiDevicePowerLevels100ms](self, "wifiDevicePowerLevels100ms"));
  return v14;
}

- (void)WiFiBatteryManagerCpmsCallbackConfiguration:(__WiFiManager *)a3
{
  _QWORD *v4;
  id cpmsAsyncNotificationCallback;
  _QWORD v6[4];
  id v7;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C1440;
  v6[3] = &unk_1002310C8;
  objc_copyWeak(&v7, &location);
  v4 = objc_retainBlock(v6);
  cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_cpmsAsyncNotificationCallback = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)WiFiBatteryManagerPpmCallbackConfiguration:(__WiFiManager *)a3
{
  _QWORD *v4;
  id WiFiBatteryManagerPpmAsyncNotificationHandler;
  _QWORD *v6;
  id WiFiBatteryManagerPpmAdmissionResultHandler;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C1870;
  v10[3] = &unk_1002310C8;
  objc_copyWeak(&v11, &location);
  v4 = objc_retainBlock(v10);
  WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_WiFiBatteryManagerPpmAsyncNotificationHandler = v4;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C1BC4;
  v8[3] = &unk_100231118;
  objc_copyWeak(&v9, &location);
  v6 = objc_retainBlock(v8);
  WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_WiFiBatteryManagerPpmAdmissionResultHandler = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id WiFiBatteryManagerPpmAsyncNotificationHandler;
  id WiFiBatteryManagerPpmAdmissionResultHandler;
  id cpmsAsyncNotificationCallback;
  NSDictionary *powerToDutyCycleTable100ms;
  NSDictionary *dutyCycleToPowerTable100ms;
  NSDictionary *wifiDevicePowerLevels100ms;
  NSMutableDictionary *cachedBudget;
  NSMutableArray *pendingRequests;
  CPMSAgentProtocol *cpmsAgent;
  PPMClient *wifiPpmClientRef;
  CPMSClientDescription *wifiClientDescriptionRef;
  objc_super v14;

  WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_WiFiBatteryManagerPpmAsyncNotificationHandler = 0;

  WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_WiFiBatteryManagerPpmAdmissionResultHandler = 0;

  cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_cpmsAsyncNotificationCallback = 0;

  powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
  self->_powerToDutyCycleTable100ms = 0;

  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  self->_dutyCycleToPowerTable100ms = 0;

  wifiDevicePowerLevels100ms = self->_wifiDevicePowerLevels100ms;
  self->_wifiDevicePowerLevels100ms = 0;

  cachedBudget = self->_cachedBudget;
  self->_cachedBudget = 0;

  pendingRequests = self->_pendingRequests;
  self->_pendingRequests = 0;

  cpmsAgent = self->_cpmsAgent;
  self->_cpmsAgent = 0;

  wifiPpmClientRef = self->_wifiPpmClientRef;
  self->_wifiPpmClientRef = 0;

  wifiClientDescriptionRef = self->_wifiClientDescriptionRef;
  self->_wifiClientDescriptionRef = 0;

  v14.receiver = self;
  v14.super_class = (Class)WiFiBatteryManager;
  -[WiFiBatteryManager dealloc](&v14, "dealloc");
}

- (void)WiFiBatteryManagerHandlePowerAdmissionResponse:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  if (!self)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Self uninitialized.", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]");
    goto LABEL_27;
  }
  if (-[WiFiBatteryManager availableResource](self, "availableResource") != a3)
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Changed budget from battery module. Previous value :%lu and new value :%lu ", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]", -[WiFiBatteryManager availableResource](self, "availableResource"), a3);
    objc_autoreleasePoolPop(v12);
    -[WiFiBatteryManager setAvailableResource:](self, "setAvailableResource:", a3);
    if (a3)
      v13 = -[WiFiBatteryManager availableResource](self, "availableResource");
    else
      v13 = 0;
    -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", v13);
    -[WiFiBatteryManager WiFiDeviceManagerHandleInterfaceAvailability:](self, "WiFiDeviceManagerHandleInterfaceAvailability:", -[WiFiBatteryManager availableResource](self, "availableResource"));
    -[WiFiBatteryManager WiFiDeviceManagerHandlePowerBudgetChange:](self, "WiFiDeviceManagerHandlePowerBudgetChange:", -[WiFiBatteryManager availableResource](self, "availableResource"));
    goto LABEL_15;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : No Pending Admission Request", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]");
LABEL_27:
    objc_autoreleasePoolPop(v20);
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

  if (v21)
  {
    v8 = objc_retainAutorelease(v21);
    v9 = objc_msgSend(v8, "bytes");
    if (v9)
    {
      v10 = v9;
      -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", -[WiFiBatteryManager availableResource](self, "availableResource"));
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Claimed resource is %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]", -[WiFiBatteryManager claimedResource](self, "claimedResource"));
      objc_autoreleasePoolPop(v11);
      -[WiFiBatteryManager WiFiDeviceManagerHandlePowerUnchangedPowerBudget::](self, "WiFiDeviceManagerHandlePowerUnchangedPowerBudget::", -[WiFiBatteryManager availableResource](self, "availableResource"), v10);

LABEL_15:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
        objc_msgSend(v16, "removeLastObject");

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
      v18 = objc_msgSend(v17, "count");

      if (v18)
        -[WiFiBatteryManager admissionCheck](self, "admissionCheck");
      return;
    }
  }
  v19 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : NULL Request", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]");
  objc_autoreleasePoolPop(v19);

}

- (BOOL)isPowerResourceAvailable:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  __CFString *v10;
  __CFString *v11;

  if (self)
  {
    if (a3 > 1)
    {
      v6 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : unknown resource type %@", "-[WiFiBatteryManager isPowerResourceAvailable:]", CFSTR("Unknown"));
      objc_autoreleasePoolPop(v6);
      v5 = 0;
    }
    else
    {
      v5 = -[WiFiBatteryManager claimedResource](self, "claimedResource") != 0;
    }
  }
  else
  {
    v5 = 1;
  }
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    if (v5)
      v9 = "available";
    else
      v9 = "unavailable";
    v10 = CFSTR("Unknown");
    if (a3 == 1)
      v10 = CFSTR("Hosted Network");
    if (!a3)
      v10 = CFSTR("AutoJoin");
    v11 = v10;
    objc_msgSend(v8, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : resource is %s for type %@. claimedResource is %lu", "-[WiFiBatteryManager isPowerResourceAvailable:]", v9, v11, -[WiFiBatteryManager claimedResource](self, "claimedResource"));

  }
  objc_autoreleasePoolPop(v7);
  return v5;
}

- (int)requestPowerResource:(unint64_t)a3 withDetails:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[0] = a3;
  v19[1] = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v19, 16);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
    objc_msgSend(v7, "addObject:", v6);

    v8 = objc_autoreleasePoolPush();
    v9 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v10 = CFSTR("Unknown");
      if (a3 == 1)
        v10 = CFSTR("Hosted Network");
      if (!a3)
        v10 = CFSTR("AutoJoin");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
      objc_msgSend(v9, "WFLog:message:", 3, "WiFiBatteryMgmt : %s: Power resource request for %@ added. Pending=%lu.", "-[WiFiBatteryManager requestPowerResource:withDetails:]", v11, objc_msgSend(v12, "count"));

    }
    objc_autoreleasePoolPop(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
    v14 = objc_msgSend(v13, "count");

    if (v14 == (id)1)
    {
      v15 = -[WiFiBatteryManager admissionCheck](self, "admissionCheck");
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
        objc_msgSend(v16, "removeObjectAtIndex:", 0);

      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : null dataRef.", "-[WiFiBatteryManager requestPowerResource:withDetails:]");
    objc_autoreleasePoolPop(v17);
    v15 = -3901;
  }

  return v15;
}

- (int)admissionCheck
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    if (v6 && (v6 = objc_retainAutorelease(v6), (v7 = objc_msgSend(v6, "bytes")) != 0))
    {
      v8 = v7;
      if (-[WiFiBatteryManager isPowerResourceAvailable:](self, "isPowerResourceAvailable:", *v7))
      {
        v9 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
        {
          v10 = CFSTR("Unknown");
          if (*v8 == 1)
            v10 = CFSTR("Hosted Network");
          if (*v8)
            v11 = v10;
          else
            v11 = CFSTR("AutoJoin");
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : resource is already known and available for %@ request type.", "-[WiFiBatteryManager admissionCheck]", v11);
        }
        objc_autoreleasePoolPop(v9);
        -[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:](self, "WiFiBatteryManagerHandlePowerAdmissionResponse:", -[WiFiBatteryManager availableResource](self, "availableResource"));
        goto LABEL_21;
      }
      if (-[WiFiBatteryManager cpmsActive](self, "cpmsActive"))
      {
        v13 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : requesting resource %d", "-[WiFiBatteryManager admissionCheck]", -[WiFiBatteryManager cpmsActive](self, "cpmsActive"));
        objc_autoreleasePoolPop(v13);
        v24 = kCPMSPowerTimeScale100ms;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
        v25 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

        v16 = -[CPMSAgentProtocol copyPowerBudgetForRequest:forClient:error:](self->_cpmsAgent, "copyPowerBudgetForRequest:forClient:error:", v15, self->_wifiCPMSHandle, 0);
        -[CPMSAgentProtocol acknowledgePowerBudget:forClientId:error:](self->_cpmsAgent, "acknowledgePowerBudget:forClientId:error:", v16, self->_wifiCPMSHandle, 0);
        v17 = -[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:](self, "WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:", v16);
        v18 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : WiFiBatteryMgmt Admission Handler being called properly! and minvalue is %lu", "-[WiFiBatteryManager admissionCheck]", v17);
        objc_autoreleasePoolPop(v18);
        -[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:](self, "WiFiBatteryManagerHandlePowerAdmissionResponse:", v17);

        goto LABEL_21;
      }
      if ((-[PPMClient admissionCheckWithLevel:options:error:handler:](self->_wifiPpmClientRef, "admissionCheckWithLevel:options:error:handler:", &off_100252D68, 0, 0, self->_WiFiBatteryManagerPpmAdmissionResultHandler) & 1) != 0)
      {
LABEL_21:
        v12 = 0;
        goto LABEL_22;
      }
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
      {
        v21 = CFSTR("Unknown");
        if (*v8 == 1)
          v21 = CFSTR("Hosted Network");
        if (*v8)
          v22 = v21;
        else
          v22 = CFSTR("AutoJoin");
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  failed to perform admission check for resource type %@", "-[WiFiBatteryManager admissionCheck]", v22);
      }
      objc_autoreleasePoolPop(v20);
      v12 = -3906;
    }
    else
    {
      v12 = -3901;
    }
  }
  else
  {
    v23 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  No pending requests, exiting", "-[WiFiBatteryManager admissionCheck]");
    objc_autoreleasePoolPop(v23);
    v12 = 0;
    v6 = 0;
  }
LABEL_22:

  return v12;
}

- (void)releasePowerResources
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", -[WiFiBatteryManager minBatteryIndex](self, "minBatteryIndex")));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Releasing battery power resource because of disassoc", "-[WiFiBatteryManager releasePowerResources]");
  objc_autoreleasePoolPop(v4);
  if (-[WiFiBatteryManager cpmsActive](self, "cpmsActive"))
  {
    v5 = -[WiFiBatteryManager cpmsActive](self, "cpmsActive");
    v6 = objc_autoreleasePoolPush();
    if (v5)
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Requesting minPower : %@ for resource release", "-[WiFiBatteryManager releasePowerResources]", v3);
      objc_autoreleasePoolPop(v6);
      v9 = kCPMSPowerTimeScale100ms;
      v10 = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      v8 = -[CPMSAgentProtocol copyPowerBudgetForRequest:forClient:error:](self->_cpmsAgent, "copyPowerBudgetForRequest:forClient:error:", v7, self->_wifiCPMSHandle, 0);
      -[CPMSAgentProtocol acknowledgePowerBudget:forClientId:error:](self->_cpmsAgent, "acknowledgePowerBudget:forClientId:error:", v8, self->_wifiCPMSHandle, 0);
      -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", 0);

    }
    else
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Fatal error. No power modules active!? self should have been nil", "-[WiFiBatteryManager releasePowerResources]");
      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {
    -[PPMClient activityStoppedWithLevel:options:error:](self->_wifiPpmClientRef, "activityStoppedWithLevel:options:error:", 0, 0, 0);
    -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", 0);
  }

}

- (id)getPowerNumberForDutyCycle:(int)a3
{
  NSDictionary *dutyCycleToPowerTable100ms;
  void *v4;
  void *v5;

  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](dutyCycleToPowerTable100ms, "objectForKey:", v4));

  return v5;
}

- (id)getDutyCycleForPowerNumber:(unint64_t)a3
{
  unint64_t pMin;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  NSDictionary *powerToDutyCycleTable100ms;
  void *v8;
  _UNKNOWN **v9;

  if (self->_cpmsContPowerSupport)
  {
    if (self->_pMax <= a3)
    {
      v9 = &off_100252D68;
    }
    else
    {
      pMin = self->_pMin;
      v4 = a3 >= pMin;
      v5 = a3 - pMin;
      if (v4)
        v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (LODWORD(self->_dutyMin) + (int)(float)(self->_ratioDutyPower * (float)v5))));
      else
        v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_minBatteryIndex));
      v9 = (_UNKNOWN **)v6;
    }
  }
  else
  {
    powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
    v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](powerToDutyCycleTable100ms, "objectForKey:", v8));

  }
  return v9;
}

- (unint64_t)getClosestAllowedLowerPowerNumber:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (a3 && self->_pMin <= a3)
  {
    v5 = 0;
    while (1)
    {
      v6 = self->_wifiChipPowerTable.powerTable[v5];
      if (v6 <= a3)
        break;
      if (++v5 == 10)
        return self->_pMin;
    }
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Ignoring invalid power value (%lu) and using max power instead.", "-[WiFiBatteryManager getClosestAllowedLowerPowerNumber:]", a3);
    objc_autoreleasePoolPop(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
    v6 = (int)objc_msgSend(v8, "intValue");

  }
  return v6;
}

- (unint64_t)WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t pUnconstrained;
  void *v15;
  unint64_t pMin;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;

  v4 = a3;
  v5 = kCPMSPowerTimeScale100ms;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kCPMSPowerTimeScale100ms));
  v7 = (int)objc_msgSend(v6, "intValue");

  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : budget100ms : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
  objc_autoreleasePoolPop(v8);
  v9 = kCPMSPowerTimeScale1s;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kCPMSPowerTimeScale1s));
  v11 = (int)objc_msgSend(v10, "intValue");

  v12 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : budget1s : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11);
  objc_autoreleasePoolPop(v12);
  if (!(_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
    v11 = (int)objc_msgSend(v13, "intValue");

  }
  if (self->_cpmsContPowerSupport)
  {
    pUnconstrained = self->_pUnconstrained;
    if (pUnconstrained < v7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
      v7 = (int)objc_msgSend(v15, "intValue");

      pUnconstrained = self->_pUnconstrained;
    }
    pMin = self->_pMin;
    if (v7 <= pMin)
      v7 = self->_pMin;
    if (v11 > pUnconstrained)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getPowerNumberForDutyCycle:](self, "getPowerNumberForDutyCycle:", 100));
      v11 = (int)objc_msgSend(v17, "intValue");

      pMin = self->_pMin;
    }
    if (v11 <= pMin)
      v11 = pMin;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getDutyCycleForPowerNumber:](self, "getDutyCycleForPowerNumber:", v7));
    v19 = objc_msgSend(v18, "intValue");

    if (!v19)
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: WiFiBatteryMgmt : Illegal budget100ms value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
      objc_autoreleasePoolPop(v20);
      v7 = -[WiFiBatteryManager getClosestAllowedLowerPowerNumber:](self, "getClosestAllowedLowerPowerNumber:", v7);
      v21 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Closest lower legal budget100ms value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
      objc_autoreleasePoolPop(v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getDutyCycleForPowerNumber:](self, "getDutyCycleForPowerNumber:", v11));
    v23 = objc_msgSend(v22, "intValue");

    if (!v23)
    {
      v24 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: WiFiBatteryMgmt : Illegal budget1s value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11);
      objc_autoreleasePoolPop(v24);
      v11 = -[WiFiBatteryManager getClosestAllowedLowerPowerNumber:](self, "getClosestAllowedLowerPowerNumber:", v11);
      v25 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Closest lower legal budget1s value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11);
      objc_autoreleasePoolPop(v25);
    }
  }
  if (v7 >= v11)
    v26 = v11;
  else
    v26 = v7;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager cachedBudget](self, "cachedBudget"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  objc_msgSend(v27, "setObject:forKey:", v28, v5);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager cachedBudget](self, "cachedBudget"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  objc_msgSend(v29, "setObject:forKey:", v30, v9);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getDutyCycleForPowerNumber:](self, "getDutyCycleForPowerNumber:", v26));
  v32 = (int)objc_msgSend(v31, "intValue");

  return v32;
}

- (void)WiFiDeviceManagerHandleInterfaceAvailability:(unint64_t)a3
{
  sub_10011AFA8(self->_deviceManager, a3);
}

- (void)WiFiDeviceManagerHandlePowerBudgetChange:(unint64_t)a3
{
  sub_10011AFAC((uint64_t)self->_deviceManager, a3);
}

- (void)WiFiDeviceManagerHandlePowerUnchangedPowerBudget:(unint64_t)a3 :(id *)a4
{
  sub_10011B1DC((uint64_t)self->_deviceManager, a3, a4);
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (NSDictionary)powerToDutyCycleTable100ms
{
  return self->_powerToDutyCycleTable100ms;
}

- (void)setPowerToDutyCycleTable100ms:(id)a3
{
  objc_storeStrong((id *)&self->_powerToDutyCycleTable100ms, a3);
}

- (NSDictionary)dutyCycleToPowerTable100ms
{
  return self->_dutyCycleToPowerTable100ms;
}

- (void)setDutyCycleToPowerTable100ms:(id)a3
{
  objc_storeStrong((id *)&self->_dutyCycleToPowerTable100ms, a3);
}

- (NSDictionary)wifiDevicePowerLevels100ms
{
  return self->_wifiDevicePowerLevels100ms;
}

- (void)setWifiDevicePowerLevels100ms:(id)a3
{
  objc_storeStrong((id *)&self->_wifiDevicePowerLevels100ms, a3);
}

- (int64_t)wifiCPMSHandle
{
  return self->_wifiCPMSHandle;
}

- (void)setWifiCPMSHandle:(int64_t)a3
{
  self->_wifiCPMSHandle = a3;
}

- (NSMutableDictionary)cachedBudget
{
  return self->_cachedBudget;
}

- (void)setCachedBudget:(id)a3
{
  objc_storeStrong((id *)&self->_cachedBudget, a3);
}

- (unint64_t)availableResource
{
  return self->_availableResource;
}

- (void)setAvailableResource:(unint64_t)a3
{
  self->_availableResource = a3;
}

- (unint64_t)claimedResource
{
  return self->_claimedResource;
}

- (void)setClaimedResource:(unint64_t)a3
{
  self->_claimedResource = a3;
}

- (unint64_t)minBatteryIndex
{
  return self->_minBatteryIndex;
}

- (void)setMinBatteryIndex:(unint64_t)a3
{
  self->_minBatteryIndex = a3;
}

- (float)ratioDutyPower
{
  return self->_ratioDutyPower;
}

- (void)setRatioDutyPower:(float)a3
{
  self->_ratioDutyPower = a3;
}

- (unint64_t)pMin
{
  return self->_pMin;
}

- (void)setPMin:(unint64_t)a3
{
  self->_pMin = a3;
}

- (unint64_t)pMax
{
  return self->_pMax;
}

- (void)setPMax:(unint64_t)a3
{
  self->_pMax = a3;
}

- (unint64_t)pUnconstrained
{
  return self->_pUnconstrained;
}

- (void)setPUnconstrained:(unint64_t)a3
{
  self->_pUnconstrained = a3;
}

- (unint64_t)dutyMin
{
  return self->_dutyMin;
}

- (void)setDutyMin:(unint64_t)a3
{
  self->_dutyMin = a3;
}

- (NSDate)asyncPPMBudgetTimestamp
{
  return self->_asyncPPMBudgetTimestamp;
}

- (void)setAsyncPPMBudgetTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_asyncPPMBudgetTimestamp, a3);
}

- (BOOL)cpmsActive
{
  return self->_cpmsActive;
}

- (void)setCpmsActive:(BOOL)a3
{
  self->_cpmsActive = a3;
}

- (BOOL)cpmsContPowerSupport
{
  return self->_cpmsContPowerSupport;
}

- (void)setCpmsContPowerSupport:(BOOL)a3
{
  self->_cpmsContPowerSupport = a3;
}

- (id)WiFiBatteryManagerPpmAsyncNotificationHandler
{
  return self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
}

- (void)setWiFiBatteryManagerPpmAsyncNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)WiFiBatteryManagerPpmAdmissionResultHandler
{
  return self->_WiFiBatteryManagerPpmAdmissionResultHandler;
}

- (void)setWiFiBatteryManagerPpmAdmissionResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)cpmsAsyncNotificationCallback
{
  return self->_cpmsAsyncNotificationCallback;
}

- (void)setCpmsAsyncNotificationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cpmsAsyncNotificationCallback, 0);
  objc_storeStrong(&self->_WiFiBatteryManagerPpmAdmissionResultHandler, 0);
  objc_storeStrong(&self->_WiFiBatteryManagerPpmAsyncNotificationHandler, 0);
  objc_storeStrong((id *)&self->_asyncPPMBudgetTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedBudget, 0);
  objc_storeStrong((id *)&self->_wifiDevicePowerLevels100ms, 0);
  objc_storeStrong((id *)&self->_dutyCycleToPowerTable100ms, 0);
  objc_storeStrong((id *)&self->_powerToDutyCycleTable100ms, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cpmsAgent, 0);
  objc_storeStrong((id *)&self->_wifiPpmClientRef, 0);
  objc_storeStrong((id *)&self->_wifiClientDescriptionRef, 0);
}

@end
