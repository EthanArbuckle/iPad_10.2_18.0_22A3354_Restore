@implementation ContactTracingDaemonBridge

- (ContactTracingDaemonBridge)init
{
  ContactTracingDaemonBridge *v2;
  ENDaemon *v3;
  ENDaemon *daemon;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  ContactTracingDaemonBridge *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ContactTracingDaemonBridge;
  v2 = -[ContactTracingDaemonBridge init](&v9, "init");
  if (v2)
  {
    v3 = (ENDaemon *)objc_alloc_init((Class)ENDaemon);
    daemon = v2->_daemon;
    v2->_daemon = v3;

    -[ENDaemon setDelegate:](v2->_daemon, "setDelegate:", v2);
    v5 = objc_claimAutoreleasedReturnValue(-[ENDaemon dispatchQueue](v2->_daemon, "dispatchQueue"));
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

+ (id)sharedDaemonBridge
{
  if (qword_100993F48 != -1)
    dispatch_once(&qword_100993F48, &stru_10093E1E8);
  return (id)qword_100993F40;
}

- (void)activate
{
  -[ENDaemon activate](self->_daemon, "activate");
}

- (void)invalidate
{
  -[ENDaemon invalidate](self->_daemon, "invalidate");
}

- (id)createAdvertisementQuerySessionWithThreshold:(unsigned __int8)a3 error:(id *)a4
{
  if (qword_10097B1C0 != -1)
    dispatch_once(&qword_10097B1C0, &stru_10093E220);
  return sub_100507200((uint64_t)off_10097B1B8, a3, (uint64_t)a4);
}

- (void)performPeriodicAdvertisementDatabasePurgeWithDate:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = v3;
  if (qword_10097B1C0 == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&qword_10097B1C0, &stru_10093E220);
    v4 = v5;
  }
  sub_100507094((uint64_t)off_10097B1B8, v4);

}

- (void)purgeAdvertisementDatabase
{
  if (qword_10097B1C0 != -1)
    dispatch_once(&qword_10097B1C0, &stru_10093E220);
  sub_100506E3C((uint64_t)off_10097B1B8);
}

- (id)retrieveTEKHistoryIncludingActive:(BOOL)a3 generateNewTEK:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_10093E240);
  return sub_1006A3AF0(qword_1009778B0, a3, v4);
}

- (void)resetTEKHistory
{
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_10093E240);
  sub_1006A37CC(qword_1009778B0);
}

- (id)retrieveCurrentAdvertisingPayload
{
  uint64_t v2;
  NSData *v3;
  void *v4;
  uint64_t (**v6)();
  unsigned int *v7;

  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  v6 = 0;
  v7 = 0;
  sub_100419728((uint64_t)off_10097B178, &v6);
  v2 = sub_10003EB18((uint64_t)&v6);
  v3 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v2, sub_10003F8C4((uint64_t)&v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = &off_100918258;
  if (v7)
    sub_100056AAC(v7);
  return v4;
}

- (unsigned)storedAdvertisementCount
{
  if (qword_10097B1C0 != -1)
    dispatch_once(&qword_10097B1C0, &stru_10093E220);
  return sub_100507348((uint64_t)off_10097B1B8);
}

- (void)switchToCentralAdvertisementStoreAsync
{
  if (qword_10097B1C0 != -1)
    dispatch_once(&qword_10097B1C0, &stru_10093E220);
  sub_100506FBC((uint64_t)off_10097B1B8);
}

- (void)registerStateMetricPullCallback:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = sub_100065478();
  (*(void (**)(uint64_t, id))(*(_QWORD *)v3 + 472))(v3, v4);

}

- (void)sendOnBoardingMetricWithTrigger:(unsigned int)a3 completed:(BOOL)a4 firstTime:(BOOL)a5 countryCode:(id)a6 subdivisionCode:(id)a7 legalConsent:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  v8 = a8;
  v10 = a5;
  v11 = a4;
  v12 = *(_QWORD *)&a3;
  v15 = a6;
  v13 = a7;
  v14 = sub_100065478();
  (*(void (**)(uint64_t, uint64_t, _BOOL8, _BOOL8, id, id, _BOOL8))(*(_QWORD *)v14 + 464))(v14, v12, v11, v10, v15, v13, v8);

}

- (void)sendStateMetricWithVersion:(unsigned int)a3 subdivisionCode:(id)a4 availabilityAlertCount:(unsigned __int8)a5 legalConsentPageCount:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v9 = sub_100065478();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)v9 + 456))(v9, v8, v10, v6, v7);

}

- (void)sendErrorMetricWithType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&a3;
  v4 = sub_100065478();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 480))(v4, v3);
}

- (BOOL)isBluetoothPoweredOn
{
  if (qword_100978130 != -1)
    dispatch_once(&qword_100978130, &stru_10093E280);
  return sub_10002527C((uint64_t)off_100978128) == 1;
}

- (id)bluetoothSystemContainerURL
{
  uint64_t v2;
  void **v3;
  void *v4;
  void *__p[2];
  uint64_t v7;

  __p[0] = 0;
  __p[1] = 0;
  v7 = 0;
  v2 = sub_100038E50();
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v2 + 168))(v2, __p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0));
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  return v4;
}

- (void)printBluetoothDebug
{
  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  sub_10041CD08((uint64_t)off_10097B178);
}

- (void)setAggressiveScanningEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v4;

  v3 = a3;
  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  if (v3)
    v4 = 5;
  else
    v4 = 0;
  sub_10041C2A0((uint64_t)off_10097B178, v4);
}

- (void)setRegionServerConfiguration:(id)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned __int8 v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v3 = objc_msgSend(v8, "dynamicAlgorithmEnabled");
  v4 = objc_msgSend(v8, "dynamicThrottleDownAdvDensity");
  v5 = objc_msgSend(v8, "dynamicThrottleDownRSSI");
  objc_msgSend(v8, "dynamicThrottleDownDuration");
  v7 = (int)v6;
  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  sub_10041CB54((uint64_t)off_10097B178, ((unint64_t)v5 << 32) | (v7 << 48) | (v4 << 16) | (unint64_t)v3);

}

- (void)startPowerMonitoringWithStateChangeHandler:(id)a3
{
  id v4;

  v4 = a3;
  sub_10064F8D8((uint64_t)-[ContactTracingDaemonBridge _getPowerObserver](self, "_getPowerObserver"), v4);

}

- (void)stopPowerMonitoring
{
  sub_10064F998((uint64_t)-[ContactTracingDaemonBridge _getPowerObserver](self, "_getPowerObserver"));
}

- (int)startTracingWithAppBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  double Current;

  v3 = a3;
  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  v4 = off_10097B178;
  Current = CFAbsoluteTimeGetCurrent();
  LODWORD(v4) = sub_10041A04C((uint64_t)v4, v3, Current);

  return (int)v4;
}

- (int)stopTracing
{
  if (qword_10097B180 != -1)
    dispatch_once(&qword_10097B180, &stru_10093E260);
  return sub_10041A444((uint64_t)off_10097B178);
}

- (BOOL)isENLoggingProfileInstalled
{
  uint64_t v2;

  v2 = sub_100027F68();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 168))(v2);
}

- (void)setENAppHasLoggingEntitlement:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = a3;
  v4 = sub_100027F68();
  (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)v4 + 200))(v4, v3);
}

- (void)setLoggingParams:(BOOL)a3 loggingSensitive:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v6;

  v4 = a4;
  v5 = a3;
  v6 = sub_100027F68();
  (*(void (**)(uint64_t, _BOOL8, _BOOL8))(*(_QWORD *)v6 + 232))(v6, v5, v4);
}

- (ContactTracingPowerObserverCPP)_getPowerObserver
{
  ContactTracingPowerObserverCPP *result;

  result = (ContactTracingPowerObserverCPP *)qword_100993F50;
  if (!qword_100993F50)
    operator new();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
