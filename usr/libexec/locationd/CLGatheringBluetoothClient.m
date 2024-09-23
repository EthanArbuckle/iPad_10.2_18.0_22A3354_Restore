@implementation CLGatheringBluetoothClient

+ (BOOL)hasAopPath
{
  if (qword_102307420 != -1)
    dispatch_once(&qword_102307420, &stru_10217C0F8);
  return byte_102307418;
}

- (CLGatheringBluetoothClient)initWithQueue:(id)a3 withSettings:(id)a4
{
  CLGatheringBluetoothClient *v6;
  CLGatheringBluetoothClient *v7;
  BOOL v8;
  id v9;
  OS_dispatch_queue *queue;
  objc_super v12;
  uint64_t v13;
  void *v14;

  v12.receiver = self;
  v12.super_class = (Class)CLGatheringBluetoothClient;
  v6 = -[CLGatheringBluetoothClient init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    -[CLGatheringBluetoothClient setQueue:](v6, "setQueue:", a3);
    -[CLGatheringBluetoothClient setSettings:](v7, "setSettings:", a4);
    if (+[CLGatheringBluetoothClient hasAopPath](CLGatheringBluetoothClient, "hasAopPath"))
      v8 = !-[CLGatheringSettings scanForceNoAopPolicy](-[CLGatheringBluetoothClient settings](v7, "settings"), "scanForceNoAopPolicy");
    else
      v8 = 0;
    v7->_scanningWithAop = v8;
    v7->_gascanner = -[CLGatheringBluetoothScanner initWithQueue:withSettings:withPolicy:]([CLGatheringBluetoothScanner alloc], "initWithQueue:withSettings:withPolicy:", -[CLGatheringBluetoothClient queue](v7, "queue"), a4, v7->_scanningWithAop);
    v7->_iCloudSignedIn = -[CLGatheringBluetoothClient _isSignedIn](v7, "_isSignedIn");
    -[CLGatheringBluetoothClient _installICloudMonitor](v7, "_installICloudMonitor");
    v9 = objc_alloc((Class)CBCentralManager);
    queue = v7->_queue;
    v13 = CBCentralManagerOptionReceiveSystemEvents;
    v14 = &__kCFBooleanTrue;
    v7->_centralManager = (CBCentralManager *)objc_msgSend(v9, "initWithDelegate:queue:options:", v7, queue, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v7->_bluetoothIsON = 1;
    v7->_rootDomainConnect = 0;
    v7->_notifyPortRef = 0;
    v7->_notifierObject = 0;
  }
  return v7;
}

- (void)dealloc
{
  id timeoutDiscoveryBlock;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  -[CLGatheringBluetoothClient setQueue:](self, "setQueue:", 0);
  -[CLGatheringBluetoothClient setSettings:](self, "setSettings:", 0);

  self->_gascanner = 0;
  -[CBAdvertiser invalidate](self->_advertiser, "invalidate");

  self->_advertiser = 0;
  timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
  if (timeoutDiscoveryBlock)
  {
    dispatch_block_cancel(timeoutDiscoveryBlock);

    self->_timeoutDiscoveryBlock = 0;
  }
  -[CLGatheringBluetoothClient _cancelExistingStopScanningBlock](self, "_cancelExistingStopScanningBlock");

  -[CLGatheringBluetoothClient _cancelICloudMonitor](self, "_cancelICloudMonitor");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CLGatheringBluetoothClient;
  -[CLGatheringBluetoothClient dealloc](&v5, "dealloc");
}

- (void)setScannerDelegate:(id)a3
{
  -[CLGatheringBluetoothScanner setDelegate:](self->_gascanner, "setDelegate:", a3);
}

- (void)_runAdv
{
  -[CLGatheringBluetoothClient _startAdvertising](self, "_startAdvertising");
}

- (void)_runScan
{
  if (-[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly"))
  {
    -[CLGatheringBluetoothClient _installScreenWakeMonitor](self, "_installScreenWakeMonitor");
  }
  if (self->_scanningWithAop)
  {
    -[CLGatheringBluetoothClient _startPermanentScanning](self, "_startPermanentScanning");
  }
  else
  {
    -[CLGatheringBluetoothClient _armPeriodicScanTimer](self, "_armPeriodicScanTimer");
    -[CLGatheringBluetoothClient _installApSleepWakeCallBack](self, "_installApSleepWakeCallBack");
  }
}

- (void)run
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 iCloudSignedIn;
  _BOOL4 bluetoothIsON;
  _BOOL4 v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint8_t buf[4];
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;

  if (self->_iCloudSignedIn && self->_bluetoothIsON)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v3 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "btclient run", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "btclient run", v13, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient run]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLGatheringBluetoothClient _runAdv](self, "_runAdv");
    -[CLGatheringBluetoothClient _runScan](self, "_runScan");
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      iCloudSignedIn = self->_iCloudSignedIn;
      bluetoothIsON = self->_bluetoothIsON;
      *(_DWORD *)buf = 67109376;
      v17 = iCloudSignedIn;
      v18 = 1024;
      v19 = bluetoothIsON;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "btclient not run: _iCloudSignedIn %d _bluetoothIsON %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v7 = self->_iCloudSignedIn;
      v8 = self->_bluetoothIsON;
      v13[0] = 67109376;
      v13[1] = v7;
      v14 = 1024;
      v15 = v8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "btclient not run: _iCloudSignedIn %d _bluetoothIsON %d", v13, 14);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient run]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)_stopScanning
{
  -[CLGatheringBluetoothClient _stopScanningWithReason:](self, "_stopScanningWithReason:", 6);
  -[CLGatheringBluetoothClient _cancelApSleepWakeCallBack](self, "_cancelApSleepWakeCallBack");
  -[CLGatheringBluetoothClient _cancelPeriodicScanTimer](self, "_cancelPeriodicScanTimer");
  -[CLGatheringBluetoothClient _cancelScreenWakeMonitor](self, "_cancelScreenWakeMonitor");
}

- (void)stop
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "btclient stop", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "btclient stop", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient stop]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLGatheringBluetoothClient _stopAdvertising](self, "_stopAdvertising");
  -[CLGatheringBluetoothClient _stopScanning](self, "_stopScanning");
}

- (BOOL)getEnablementStatus
{
  return self->_iCloudSignedIn && self->_bluetoothIsON;
}

- (void)_startPermanentScanning
{
  unsigned __int8 v3;
  NSObject *v4;
  CLGatheringBluetoothScannerDelegate *v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  _BOOL4 bluetoothIsON;
  _BOOL4 screenIsON;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  unsigned int v17;
  const char *v18;
  uint8_t *v19;
  int v20;
  int v21;
  _BOOL4 v22;
  __int16 v23;
  unsigned int v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  unsigned int v32;

  if (self->_screenIsON)
    v3 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
  else
    v3 = 0;
  if (!-[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled")
    || (v3 & 1) != 0)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v8 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      v9 = -[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled");
      bluetoothIsON = self->_bluetoothIsON;
      screenIsON = self->_screenIsON;
      *(_DWORD *)buf = 67109888;
      v26 = v9;
      v27 = 1024;
      v28 = bluetoothIsON;
      v29 = 1024;
      v30 = screenIsON;
      v31 = 1024;
      v32 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "did not _startPermanentScanning: s.scanEnabled %d, _bluetoothIsON %d, _screenIsON %d, s.forceScreenOffOnly %d", buf, 0x1Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v14 = qword_1022A0158;
      -[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled");
      v15 = self->_bluetoothIsON;
      v16 = self->_screenIsON;
      v17 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
      LOWORD(v21) = 1024;
      HIWORD(v21) = v15;
      v22 = v16;
      v23 = 1024;
      v24 = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "did not _startPermanentScanning: s.scanEnabled %d, _bluetoothIsON %d, _screenIsON %d, s.forceScreenOffOnly %d", &v20, 26, 67109888, v21);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startPermanentScanning]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_startPermanentScanning", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_startPermanentScanning", &v20, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startPermanentScanning]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    -[CLGatheringBluetoothScanner startPermanentDeviceDiscovery](self->_gascanner, "startPermanentDeviceDiscovery");
    v5 = -[CLGatheringBluetoothScanner delegate](self->_gascanner, "delegate");
    v6 = sub_1001FCBB4();
    if (self->_screenIsON)
      v7 = 2;
    else
      v7 = 1;
    -[CLGatheringBluetoothScannerDelegate markScanStartTimeFromBoot:withReason:withRate:](v5, "markScanStartTimeFromBoot:withReason:withRate:", v7, -[CLGatheringSettings scanAonDutyCycle](-[CLGatheringBluetoothClient settings](self, "settings"), "scanAonDutyCycle"), v6);
  }
}

- (void)_startTimedScanningWithReason:(int64_t)a3
{
  NSObject *v4;
  double v5;
  uint8_t *v6;
  uint8_t *v7;
  double v9;
  double v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned __int8 v13;
  NSObject *v14;
  char *v15;
  id timeoutDiscoveryBlock;
  NSObject *v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  char *v22;
  unsigned int v23;
  _BOOL4 bluetoothIsON;
  _BOOL4 screenIsON;
  uint64_t v26;
  char *v27;
  const char *v28;
  uint8_t *v29;
  uint64_t v30;
  char *v31;
  unsigned int v32;
  _BOOL4 v33;
  _BOOL4 v34;
  double v35;
  uint8_t *v36;
  const char *v37;
  uint8_t *v38;
  id v39;
  const char *v40;
  uint8_t *v41;
  uint64_t v42;
  int v43;
  void **block;
  uint64_t v45;
  id (*v46)(uint64_t);
  void *v47;
  CLGatheringBluetoothClient *v48;
  int v49;
  int64_t v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  double v58;
  __int16 v59;
  unsigned int v60;
  uint8_t buf[4];
  int64_t v62;
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  unsigned int v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  double v70;
  __int16 v71;
  unsigned int v72;

  if (a3 < 10)
  {
    v9 = sub_1001FCBB4();
    v10 = v9 - self->_lastTimedScanningStartTime;
    if (v10 >= (double)-[CLGatheringSettings scanPeriodicInterval](-[CLGatheringBluetoothClient settings](self, "settings"), "scanPeriodicInterval"))
    {
      v12 = 0;
    }
    else
    {
      v11 = -[CLGatheringSettings scanPeriodicInterval](-[CLGatheringBluetoothClient settings](self, "settings"), "scanPeriodicInterval");
      v12 = v11 > -[CLGatheringSettings scanBackoffTimeout](-[CLGatheringBluetoothClient settings](self, "settings"), "scanBackoffTimeout");
    }
    if (self->_screenIsON)
      v13 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
    else
      v13 = 0;
    if (!-[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled")
      || v12
      || (v13 & 1) != 0)
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v21 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
      {
        v22 = (&off_1022FAC70)[a3];
        v23 = -[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled");
        bluetoothIsON = self->_bluetoothIsON;
        screenIsON = self->_screenIsON;
        *(_DWORD *)buf = 136316418;
        v62 = (int64_t)v22;
        v63 = 1024;
        v64 = v23;
        v65 = 1024;
        v66 = bluetoothIsON;
        v67 = 1024;
        v68 = screenIsON;
        v69 = 2048;
        v70 = v10;
        v71 = 1024;
        v72 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "did not _startTimedScanningWithReason %s, s.scanEnabled %d, _bluetoothIsON %d _screenIsON %d, timeSinceLastTimedScan %.1f, s.forceScreenOffOnly %d", buf, 0x2Eu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        v30 = qword_1022A0158;
        v31 = (&off_1022FAC70)[a3];
        v32 = -[CLGatheringSettings scanEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "scanEnabled");
        v33 = self->_bluetoothIsON;
        v34 = self->_screenIsON;
        v49 = 136316418;
        v50 = (int64_t)v31;
        v51 = 1024;
        v52 = v32;
        v53 = 1024;
        v54 = v33;
        v55 = 1024;
        v56 = v34;
        v57 = 2048;
        v58 = v10;
        v59 = 1024;
        v60 = -[CLGatheringSettings scanForceScreenOffOnly](-[CLGatheringBluetoothClient settings](self, "settings"), "scanForceScreenOffOnly");
        v35 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v30, 2, "did not _startTimedScanningWithReason %s, s.scanEnabled %d, _bluetoothIsON %d _screenIsON %d, timeSinceLastTimedScan %.1f, s.forceScreenOffOnly %d", (const char *)&v49, 46, v43, (_DWORD)block, *(double *)&v45, (_DWORD)v46);
        v7 = v36;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v35);
        goto LABEL_51;
      }
    }
    else
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v14 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
      {
        v15 = (&off_1022FAC70)[a3];
        *(_DWORD *)buf = 136315650;
        v62 = (int64_t)v15;
        v63 = 1024;
        v64 = -[CLGatheringSettings scanPeriodicInterval](-[CLGatheringBluetoothClient settings](self, "settings"), "scanPeriodicInterval");
        v65 = 1024;
        v66 = -[CLGatheringSettings scanBackoffTimeout](-[CLGatheringBluetoothClient settings](self, "settings"), "scanBackoffTimeout");
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "_startTimedScanningWithReason %s, period %d [s], timeout %d [s]", buf, 0x18u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        v26 = qword_1022A0158;
        v27 = (&off_1022FAC70)[a3];
        v49 = 136315650;
        v50 = (int64_t)v27;
        v51 = 1024;
        v52 = -[CLGatheringSettings scanPeriodicInterval](-[CLGatheringBluetoothClient settings](self, "settings"), "scanPeriodicInterval");
        v53 = 1024;
        v54 = -[CLGatheringSettings scanBackoffTimeout](-[CLGatheringBluetoothClient settings](self, "settings"), "scanBackoffTimeout");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v26, 2, "_startTimedScanningWithReason %s, period %d [s], timeout %d [s]", (const char *)&v49, 24, v43);
        v29 = (uint8_t *)v28;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v28);
        if (v29 != buf)
          free(v29);
      }
      self->_lastTimedScanningStartTime = v9;
      -[CLGatheringBluetoothScanner startDeviceDiscovery](self->_gascanner, "startDeviceDiscovery");
      -[CLGatheringBluetoothScannerDelegate markScanStartTimeFromBoot:withReason:withRate:](-[CLGatheringBluetoothScanner delegate](self->_gascanner, "delegate"), "markScanStartTimeFromBoot:withReason:withRate:", a3, -[CLGatheringSettings scanDutyCycle](-[CLGatheringBluetoothClient settings](self, "settings"), "scanDutyCycle"), v9);
      timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
      if (timeoutDiscoveryBlock)
      {
        if (!dispatch_block_testcancel(timeoutDiscoveryBlock))
        {
          if (qword_1022A0150 != -1)
            dispatch_once(&qword_1022A0150, &stru_10217C138);
          v17 = qword_1022A0158;
          if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
          {
            v18 = self->_timeoutDiscoveryBlock;
            *(_DWORD *)buf = 138412290;
            v62 = (int64_t)v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "_start dispatch_block_cancel %@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0150 != -1)
              dispatch_once(&qword_1022A0150, &stru_10217C138);
            v39 = self->_timeoutDiscoveryBlock;
            v49 = 138412290;
            v50 = (int64_t)v39;
            LODWORD(v42) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_start dispatch_block_cancel %@", &v49, v42);
            v41 = (uint8_t *)v40;
            sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v40);
            if (v41 != buf)
              free(v41);
          }
          dispatch_block_cancel(self->_timeoutDiscoveryBlock);
        }
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        v19 = qword_1022A0158;
        if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "invalidating timeout discovery block", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0150 != -1)
            dispatch_once(&qword_1022A0150, &stru_10217C138);
          LOWORD(v49) = 0;
          LODWORD(v42) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "invalidating timeout discovery block", &v49, v42);
          v38 = (uint8_t *)v37;
          sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v37);
          if (v38 != buf)
            free(v38);
        }

        self->_timeoutDiscoveryBlock = 0;
      }
      block = _NSConcreteStackBlock;
      v45 = 3221225472;
      v46 = sub_100C5E540;
      v47 = &unk_10212BB58;
      v48 = self;
      self->_timeoutDiscoveryBlock = dispatch_block_create((dispatch_block_flags_t)0, &block);
      v20 = dispatch_time(0, 1000000000* -[CLGatheringSettings scanBackoffTimeout](-[CLGatheringBluetoothClient settings](self, "settings"), "scanBackoffTimeout"));
      dispatch_after(v20, (dispatch_queue_t)-[CLGatheringBluetoothClient queue](self, "queue"), self->_timeoutDiscoveryBlock);
    }
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v62 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_startTimedScanningWithReason with unknown reason %ld!", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v49 = 134217984;
      v50 = a3;
      v5 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "_startTimedScanningWithReason with unknown reason %ld!", &v49);
      v7 = v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _startTimedScanningWithReason:]", "%s\n", v5);
LABEL_51:
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)_stopScanningWithReason:(int64_t)a3
{
  id timeoutDiscoveryBlock;
  NSObject *v6;
  id v7;
  id v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
  if (timeoutDiscoveryBlock)
  {
    if (!dispatch_block_testcancel(self->_timeoutDiscoveryBlock))
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v6 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
      {
        v7 = self->_timeoutDiscoveryBlock;
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_stop dispatch_block_cancel %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        v8 = self->_timeoutDiscoveryBlock;
        v11 = 138412290;
        v12 = v8;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_stop dispatch_block_cancel %@", &v11, 12);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopScanningWithReason:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
      dispatch_block_cancel(self->_timeoutDiscoveryBlock);
      timeoutDiscoveryBlock = self->_timeoutDiscoveryBlock;
    }

    self->_timeoutDiscoveryBlock = 0;
  }
  -[CLGatheringBluetoothScanner stopDeviceDiscovery](self->_gascanner, "stopDeviceDiscovery");
  -[CLGatheringBluetoothScannerDelegate markScanEndTimeFromBoot:withReason:withPolicy:](-[CLGatheringBluetoothScanner delegate](self->_gascanner, "delegate"), "markScanEndTimeFromBoot:withReason:withPolicy:", a3, self->_scanningWithAop, sub_1001FCBB4());
}

- (void)_startAdvertising
{
  int64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  CBAdvertiser *advertiser;
  unsigned int v10;
  _BOOL4 bluetoothIsON;
  _BOOL4 iCloudSignedIn;
  uint64_t v13;
  CBAdvertiser *v14;
  unsigned int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  int v25;
  _BYTE v26[14];
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;

  v3 = -[CLGatheringSettings advertisePeriod](-[CLGatheringBluetoothClient settings](self, "settings"), "advertisePeriod");
  v4 = v3;
  if ((int)v3 > 39)
  {
    if ((int)v3 <= 44)
    {
      if ((_DWORD)v3 == 40)
      {
        v5 = "Medium";
        goto LABEL_25;
      }
      if ((_DWORD)v3 == 42)
      {
        v5 = "MediumMid";
        goto LABEL_25;
      }
    }
    else
    {
      switch((_DWORD)v3)
      {
        case '-':
          v5 = "MediumHigh";
          goto LABEL_25;
        case '2':
          v5 = "High";
          goto LABEL_25;
        case '<':
          v5 = "Max";
          goto LABEL_25;
      }
    }
  }
  else if ((int)v3 <= 14)
  {
    if (!(_DWORD)v3)
    {
      v5 = "Default";
      goto LABEL_25;
    }
    if ((_DWORD)v3 == 10)
    {
      v5 = "Periodic";
      goto LABEL_25;
    }
  }
  else
  {
    switch((_DWORD)v3)
    {
      case 0xF:
        v5 = "PeriodicHigh";
        goto LABEL_25;
      case 0x14:
        v5 = "Background";
        goto LABEL_25;
      case 0x1E:
        v5 = "Low";
        goto LABEL_25;
    }
  }
  v5 = "?";
LABEL_25:
  if (!strcmp(v5, "?"))
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v6 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v32 = v4;
      *(_WORD *)&v32[4] = 2080;
      *(_QWORD *)&v32[6] = "Background";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "advertisePeriod %d not recognised, defaulting to %s", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v25 = 67109378;
      *(_DWORD *)v26 = v4;
      *(_WORD *)&v26[4] = 2080;
      *(_QWORD *)&v26[6] = "Background";
      LODWORD(v24) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "advertisePeriod %d not recognised, defaulting to %s", &v25, v24);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
    v4 = 20;
  }
  if (self->_advertiser
    || !-[CLGatheringSettings advertiseEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "advertiseEnabled"))
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v8 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      advertiser = self->_advertiser;
      v10 = -[CLGatheringSettings advertiseEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "advertiseEnabled");
      bluetoothIsON = self->_bluetoothIsON;
      iCloudSignedIn = self->_iCloudSignedIn;
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v32 = advertiser;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v10;
      v33 = 1024;
      v34 = bluetoothIsON;
      v35 = 1024;
      v36 = iCloudSignedIn;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "did not _startAdvertising: advertiser %@ s.advertiseEnabled %d _bluetoothIsON %d _iCloudSignedIn %d", buf, 0x1Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v13 = qword_1022A0158;
      v14 = self->_advertiser;
      v15 = -[CLGatheringSettings advertiseEnabled](-[CLGatheringBluetoothClient settings](self, "settings"), "advertiseEnabled");
      v16 = self->_bluetoothIsON;
      v17 = self->_iCloudSignedIn;
      v25 = 138413058;
      *(_QWORD *)v26 = v14;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)&v26[10] = v15;
      v27 = 1024;
      v28 = v16;
      v29 = 1024;
      v30 = v17;
      LODWORD(v24) = 30;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 2, "did not _startAdvertising: advertiser %@ s.advertiseEnabled %d _bluetoothIsON %d _iCloudSignedIn %d", &v25, v24);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_startAdvertising", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      LOWORD(v25) = 0;
      LODWORD(v24) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "_startAdvertising", &v25, v24);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _startAdvertising]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    self->_advertiser = (CBAdvertiser *)objc_alloc_init((Class)CBAdvertiser);
    -[CBAdvertiser setDispatchQueue:](self->_advertiser, "setDispatchQueue:", -[CLGatheringBluetoothClient queue](self, "queue"));
    -[CBAdvertiser setAdvertiseRate:](self->_advertiser, "setAdvertiseRate:", v4);
    -[CBAdvertiser setNearbyInfoV2DecryptedFlags:](self->_advertiser, "setNearbyInfoV2DecryptedFlags:", 2);
    -[CBAdvertiser setUseCase:](self->_advertiser, "setUseCase:", 0x80000);
    -[CBAdvertiser activateWithCompletion:](self->_advertiser, "activateWithCompletion:", &stru_10217C118);
  }
}

- (void)_stopAdvertising
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (self->_advertiser)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v3 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_stopAdvertising", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "_stopAdvertising", v9, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopAdvertising]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    -[CBAdvertiser invalidate](self->_advertiser, "invalidate");

    self->_advertiser = 0;
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "did not _stopAdvertising (null)", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "did not _stopAdvertising (null)", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _stopAdvertising]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (BOOL)_isSignedIn
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  const char *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  if (v3)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = objc_msgSend(v2, "aa_primaryAppleAccount");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_isSignedIn: aa_primaryAppleAccount %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      return v3 != 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v5 = qword_1022A0158;
    v11 = 138412290;
    v12 = objc_msgSend(v2, "aa_primaryAppleAccount");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 2, "_isSignedIn: aa_primaryAppleAccount %@", &v11, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _isSignedIn]", "%s\n", v6);
    if (v7 == buf)
      return v3 != 0;
LABEL_20:
    free(v7);
    return v3 != 0;
  }
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v8 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_isSignedIn: NO", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    LOWORD(v11) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_isSignedIn: NO", &v11, 2);
    v7 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _isSignedIn]", "%s\n", v10);
    if (v7 != buf)
      goto LABEL_20;
  }
  return v3 != 0;
}

- (void)_installICloudMonitor
{
  NSObject *v3;
  NSNotificationCenter *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_installICloudMonitor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_installICloudMonitor", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installICloudMonitor]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v4, "addObserver:selector:name:object:", self, "_accountStoreDidChange:", ACDAccountStoreDidChangeNotification, 0);
}

- (void)_cancelICloudMonitor
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cancelICloudMonitor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_cancelICloudMonitor", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelICloudMonitor]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
}

- (void)_accountStoreDidChange:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v5 = objc_msgSend(a3, "userInfo");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", ACAccountIdentifierKey);
  v7 = objc_msgSend(a3, "userInfo");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", ACAccountTypeIdentifierKey);
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v9 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "_accountStoreDidChange: accountIdentifier %@ accountTypeIdentifier %@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_accountStoreDidChange: accountIdentifier %@ accountTypeIdentifier %@", &v17, 22);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _accountStoreDidChange:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  if (objc_msgSend(v8, "isEqualToString:", ACAccountTypeIdentifierAppleAccount))
  {
    v10 = -[CLGatheringBluetoothClient _isSignedIn](self, "_isSignedIn");
    if (self->_iCloudSignedIn == v10)
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v11 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "no change to iCloud sign in status - skip updating", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        LOWORD(v17) = 0;
        LODWORD(v16) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "no change to iCloud sign in status - skip updating", &v17, v16);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _accountStoreDidChange:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
    }
    else
    {
      self->_iCloudSignedIn = v10;
      if (v10)
        -[CLGatheringBluetoothClient run](self, "run");
      else
        -[CLGatheringBluetoothClient stop](self, "stop");
    }
  }
}

- (void)_armPeriodicScanTimer
{
  NSObject *v3;
  uint64_t v4;
  OS_dispatch_source *v5;
  NSObject *periodicScanTimer;
  dispatch_time_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD handler[6];
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_armPeriodicScanTimer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_armPeriodicScanTimer", v11, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _armPeriodicScanTimer]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (!self->_periodicScanTimer)
  {
    v4 = 1000
       * -[CLGatheringSettings scanPeriodicInterval](-[CLGatheringBluetoothClient settings](self, "settings"), "scanPeriodicInterval");
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)-[CLGatheringBluetoothClient queue](self, "queue"));
    self->_periodicScanTimer = v5;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100C5FE4C;
    handler[3] = &unk_102131360;
    handler[4] = self;
    handler[5] = v4;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    periodicScanTimer = self->_periodicScanTimer;
    v7 = dispatch_time(0x8000000000000000, 1000000000);
    dispatch_source_set_timer(periodicScanTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_periodicScanTimer);
  }
}

- (void)_cancelPeriodicScanTimer
{
  NSObject *v3;
  NSObject *periodicScanTimer;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cancelPeriodicScanTimer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_cancelPeriodicScanTimer", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelPeriodicScanTimer]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  periodicScanTimer = self->_periodicScanTimer;
  if (periodicScanTimer)
  {
    dispatch_source_cancel(periodicScanTimer);

    self->_periodicScanTimer = 0;
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  const __CFString *v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  const __CFString *v16;
  uint8_t buf[4];
  const __CFString *v18;

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v5 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = (const __CFString *)objc_msgSend(a3, "state");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "centralManagerDidUpdateState %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v9 = qword_1022A0158;
    v15 = 134217984;
    v16 = (const __CFString *)objc_msgSend(a3, "state");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 2, "centralManagerDidUpdateState %ld", &v15);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient centralManagerDidUpdateState:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  v6 = objc_msgSend(a3, "state") == (id)5;
  if (self->_bluetoothIsON != v6)
  {
    self->_bluetoothIsON = v6;
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bluetoothIsON)
        v8 = CFSTR("On");
      else
        v8 = CFSTR("Off");
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth state changed to %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      if (self->_bluetoothIsON)
        v12 = CFSTR("On");
      else
        v12 = CFSTR("Off");
      v15 = 138412290;
      v16 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "Bluetooth state changed to %@", &v15, 12);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient centralManagerDidUpdateState:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    if (self->_bluetoothIsON)
      -[CLGatheringBluetoothClient run](self, "run");
    else
      -[CLGatheringBluetoothClient stop](self, "stop");
  }
}

- (void)_installScreenWakeMonitor
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _QWORD handler[5];
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_installScreenWakeMonitor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_installScreenWakeMonitor", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installScreenWakeMonitor]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  if (!self->_backlightLevelToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100C605B4;
    handler[3] = &unk_10213F4C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_backlightLevelToken, (dispatch_queue_t)-[CLGatheringBluetoothClient queue](self, "queue"), handler);
  }
}

- (void)_cancelExistingStopScanningBlock
{
  id stopScanningBlock;

  stopScanningBlock = self->_stopScanningBlock;
  if (stopScanningBlock)
  {
    dispatch_block_cancel(stopScanningBlock);

    self->_stopScanningBlock = 0;
  }
}

- (void)_cancelScreenWakeMonitor
{
  NSObject *v3;
  int backlightLevelToken;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cancelScreenWakeMonitor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_cancelScreenWakeMonitor", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelScreenWakeMonitor]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  backlightLevelToken = self->_backlightLevelToken;
  if (backlightLevelToken)
  {
    notify_cancel(backlightLevelToken);
    self->_backlightLevelToken = 0;
  }
}

- (void)_installApSleepWakeCallBack
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  io_connect_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  _WORD v14[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_installApSleepWakeCallBack", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_installApSleepWakeCallBack", v14, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (self->_notifyPortRef)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_notifyPortRef is not NULL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v14[0] = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "_notifyPortRef is not NULL", v14, v13);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  else
  {
    v7 = IORegisterForSystemPower(self, &self->_notifyPortRef, (IOServiceInterestCallback)sub_100C614A4, &self->_notifierObject);
    self->_rootDomainConnect = v7;
    if (v7)
    {
      IONotificationPortSetDispatchQueue(self->_notifyPortRef, (dispatch_queue_t)-[CLGatheringBluetoothClient queue](self, "queue"));
    }
    else
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v8 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IORegisterForSystemPower failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_10217C138);
        v14[0] = 0;
        LODWORD(v13) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "IORegisterForSystemPower failed", v14, v13);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _installApSleepWakeCallBack]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      -[CLGatheringBluetoothClient _cancelApSleepWakeCallBack](self, "_cancelApSleepWakeCallBack");
    }
  }
}

- (void)_cancelApSleepWakeCallBack
{
  NSObject *v3;
  NSObject *v4;
  io_connect_t rootDomainConnect;
  NSObject *v6;
  IONotificationPort *notifyPortRef;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _WORD v18[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217C138);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cancelApSleepWakeCallBack", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v18[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "_cancelApSleepWakeCallBack", v18, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (self->_notifierObject)
  {
    IODeregisterForSystemPower(&self->_notifierObject);
    self->_notifierObject = 0;
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v4 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_notifierObject is NULL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v18[0] = 0;
      LODWORD(v17) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "_notifierObject is NULL", v18, v17);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
  rootDomainConnect = self->_rootDomainConnect;
  if (rootDomainConnect)
  {
    IOServiceClose(rootDomainConnect);
    self->_rootDomainConnect = 0;
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v6 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_rootDomainConnect is NULL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v18[0] = 0;
      LODWORD(v17) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "_rootDomainConnect is NULL", v18, v17);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
  notifyPortRef = self->_notifyPortRef;
  if (notifyPortRef)
  {
    IONotificationPortSetDispatchQueue(notifyPortRef, 0);
    IONotificationPortDestroy(self->_notifyPortRef);
    self->_notifyPortRef = 0;
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217C138);
    v8 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "_notifyPortRef is NULL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_10217C138);
      v18[0] = 0;
      LODWORD(v17) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "_notifyPortRef is NULL", v18, v17);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringBluetoothClient _cancelApSleepWakeCallBack]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CLGatheringSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  self->_settings = (CLGatheringSettings *)a3;
}

@end
