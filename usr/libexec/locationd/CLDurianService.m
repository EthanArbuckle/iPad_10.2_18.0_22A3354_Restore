@implementation CLDurianService

- (void)scanForNearbyOwner
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian scanForNearbyOwner\"}", (uint8_t *)v4, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
    -[CLAvengerScannerClient performTemporaryAggressiveScan](self->_scannerClient, "performTemporaryAggressiveScan");
  else
    -[CLAvengerScannerServiceProtocol performTemporaryAggressiveScan:](self->_avengerScannerProxy, "performTemporaryAggressiveScan:", CLISP_ME_TOKEN);
}

- (void)onAggressiveScanStarted
{
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAggressiveScanStarted\"}", (uint8_t *)v3, 0x12u);
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  id v16;
  id v17;
  unsigned int v18;
  _BOOL4 v19;
  const char *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  const char *v38;

  if (objc_msgSend(a3, "address"))
  {
    if (!_os_feature_enabled_impl("CoreLocation", "StandardUT")
      || (objc_msgSend(a3, "status") & 0x10) != 0
      || (objc_msgSend(a3, "status") & 0x20) != 0)
    {
      if ((objc_msgSend(a3, "status") & 0x10) != 0
        || (objc_msgSend(a3, "status") & 0x20) != 0)
      {
        if (objc_msgSend(objc_msgSend(a3, "advertisementData"), "length"))
          v12 = 2;
        else
          v12 = (objc_msgSend(a3, "status") & 4) == 0;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC278);
        v14 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v15 = sub_10024882C(objc_msgSend(a3, "address"));
          v16 = objc_msgSend(a3, "scanDate");
          v17 = objc_msgSend(a3, "advertisementData");
          v18 = objc_msgSend(a3, "status");
          v19 = objc_msgSend(objc_msgSend(a3, "advertisementData"), "length") != 0;
          if (objc_msgSend(a4, "uuid"))
            v20 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "UTF8String");
          else
            v20 = "";
          *(_DWORD *)buf = 68290819;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2113;
          v26 = v15;
          v27 = 2114;
          v28 = v16;
          v29 = 2113;
          v30 = v17;
          v31 = 1025;
          v32 = v18;
          v33 = 1025;
          v34 = v12;
          v35 = 1025;
          v36 = v19;
          v37 = 2081;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement\", \"address\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"data\":%{private, location:escape_only}@, \"status\":%{private}d, \"needsmaint\":%{private}d, \"isWild\":%{private}d, \"uuid\":%{private, location:escape_only}s}", buf, 0x4Cu);
        }
        -[CLDurianDeviceManager addScanResultAtDate:address:advertisementData:rssi:maintenanceReason:reserved:reconciledInformation:](self->_deviceManager, "addScanResultAtDate:address:advertisementData:rssi:maintenanceReason:reserved:reconciledInformation:", objc_msgSend(a3, "scanDate"), objc_msgSend(a3, "address"), objc_msgSend(a3, "advertisementData"), objc_msgSend(a3, "rssi"), v12, objc_msgSend(a3, "reserved"), a4);
        if (objc_msgSend(a4, "uuid") && objc_msgSend(a4, "type") == (id)1)
          -[CLDurianCommuteMetricManager didObserveScanForDevice:](self->_commuteMetricManager, "didObserveScanForDevice:", objc_msgSend(a4, "uuid"));
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC278);
        v7 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 1026;
          LODWORD(v26) = objc_msgSend(a3, "status");
          v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - not durian/hawkeye\", \"status\":%{public}d}";
          goto LABEL_15;
        }
      }
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v7 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289282;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 1026;
        LODWORD(v26) = objc_msgSend(a3, "status");
        v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - not durian/hawkeye or not Apple advertisement\", \"
             "status\":%{public}d}";
LABEL_15:
        v9 = v7;
        v10 = OS_LOG_TYPE_DEBUG;
        v11 = 24;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - no address\"}";
      v9 = v13;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 18;
      goto LABEL_22;
    }
  }
}

- (id)clientIdentifier
{
  return CFSTR("CLDurianService");
}

- (CLDurianService)init
{
  CLDurianService *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianService;
  result = -[CLDurianService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDurianServiceProtocol, &OBJC_PROTOCOL___CLDurianClientProtocol);
  result->_carLastScanned = 2.22507386e-308;
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230F8E8 != -1)
    dispatch_once(&qword_10230F8E8, &stru_1021BC108);
  return (id)qword_10230F8E0;
}

+ (BOOL)isSupported
{
  if (qword_10230F8F8 != -1)
    dispatch_once(&qword_10230F8F8, &stru_1021BC128);
  return (byte_10230F8F0 & 1) == 0;
}

- (void)beginService
{
  NSObject *v3;
  CLDurianAppMonitor *v4;
  CLDurianDeviceManager *v5;
  CLDurianCompanionDeviceManager *v6;
  CLDurianCompanionDeviceObserver *v7;
  CLDurianSystemMonitor *v8;
  UARPController *v9;
  SPOwnerInterface *v10;
  CLAvengerScannerServiceProtocol *v11;
  RadiosPreferences *v12;
  NSObject *queue;
  id v14;
  unsigned int v15;
  NSURL *localHawkeyeFirmwareDirectory;
  NSObject *v17;
  NSURL *v18;
  const char *v19;
  NSURL *v20;
  NSObject *v21;
  NSObject *v22;
  NSDictionary *v23;
  _QWORD handler[5];
  _QWORD v25[5];
  NSFileAttributeKey v26;
  NSNumber *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  NSDictionary *v33;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2114;
    v33 = +[CLDurianSettings settingsDictionary](CLDurianSettings, "settingsDictionary");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian service being brought up\", \"settings\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  self->_queue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(-[CLDurianService universe](self, "universe"), "silo"), "queue");
  self->_taskClientMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_pendingTaskMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_assetIdMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_clients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_devicesUndergoingFirmwareUpdate = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_roseOnForClientOnDevice = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_eventCounterOnForDevice = 0;
  v4 = -[CLDurianAppMonitor initWithQueue:]([CLDurianAppMonitor alloc], "initWithQueue:", self->_queue);
  self->_appMonitor = v4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1014DA63C;
  v25[3] = &unk_10212BB58;
  v25[4] = self;
  -[CLDurianAppMonitor setFindMyAppDidBackgroundOrExitHandler:](v4, "setFindMyAppDidBackgroundOrExitHandler:", v25);
  v5 = -[CLDurianDeviceManager initWithUniverse:]([CLDurianDeviceManager alloc], "initWithUniverse:", -[CLDurianService universe](self, "universe"));
  self->_deviceManager = v5;
  -[CLDurianDeviceManager setDeviceDelegate:](v5, "setDeviceDelegate:", self);
  v6 = -[CLDurianCompanionDeviceManager initWithUniverse:]([CLDurianCompanionDeviceManager alloc], "initWithUniverse:", -[CLDurianService universe](self, "universe"));
  self->_companionDeviceManager = v6;
  -[CLDurianCompanionDeviceManager setDeviceObservationDelegate:](v6, "setDeviceObservationDelegate:", self->_deviceManager);
  v7 = -[CLDurianCompanionDeviceObserver initWithUniverse:]([CLDurianCompanionDeviceObserver alloc], "initWithUniverse:", -[CLDurianService universe](self, "universe"));
  self->_companionDeviceObserver = v7;
  -[CLDurianCompanionDeviceObserver setDelegate:](v7, "setDelegate:", self->_companionDeviceManager);
  self->_metricManager = -[CLDurianMetricManager initWithQueue:]([CLDurianMetricManager alloc], "initWithQueue:", self->_queue);
  self->_commuteMetricManager = (CLDurianCommuteMetricManager *)-[CLDurianCommuteMetricManager initInUniverse:]([CLDurianCommuteMetricManager alloc], "initInUniverse:", -[CLDurianService universe](self, "universe"));
  v8 = -[CLDurianSystemMonitor initWithUniverse:]([CLDurianSystemMonitor alloc], "initWithUniverse:", -[CLDurianService universe](self, "universe"));
  self->_systemMonitor = v8;
  -[CLDurianSystemMonitor setDelegate:](v8, "setDelegate:", self);
  v9 = (UARPController *)objc_alloc_init((Class)UARPController);
  self->_uarpController = v9;
  -[UARPController setDelegate:](v9, "setDelegate:", self);
  v10 = (SPOwnerInterface *)objc_alloc_init((Class)SPOwnerInterface);
  self->_spOwnerInterface = v10;
  self->_spFirmwareUpdateSession = (SPFirmwareUpdateSessionProtocol *)-[SPOwnerInterface firmwareUpdateSession](v10, "firmwareUpdateSession");
  self->_assetLocationType = +[CLDurianSettings uarpAssetLocationType](CLDurianSettings, "uarpAssetLocationType");
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLDurianService universe](self, "universe"), "silo"), "queue"));
  }
  else
  {
    v11 = (CLAvengerScannerServiceProtocol *)objc_msgSend(objc_msgSend(-[CLDurianService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLAvengerScanner"));
    self->_avengerScannerProxy = v11;
    -[CLAvengerScannerServiceProtocol registerDelegate:inSilo:](v11, "registerDelegate:inSilo:", self, -[CLDurianService silo](self, "silo"));
    -[CLAvengerScannerServiceProtocol setDelegateEntityName:](self->_avengerScannerProxy, "setDelegateEntityName:", "CLDurianService");
    -[CLAvengerScannerServiceProtocol startMonitoringAvengerAdvertisementsForClient:clientName:](self->_avengerScannerProxy, "startMonitoringAvengerAdvertisementsForClient:clientName:", CLISP_ME_TOKEN, CFSTR("CLDurianService"));
  }
  self->_connectionStateChangeClients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v12 = (RadiosPreferences *)objc_msgSend(objc_alloc((Class)RadiosPreferences), "initWithQueue:", self->_queue);
  self->_radiosPreferences = v12;
  if (v12)
  {
    -[RadiosPreferences setDelegate:](v12, "setDelegate:", self);
    -[CLDurianDeviceManager setAirplaneModeEnabled:](self->_deviceManager, "setAirplaneModeEnabled:", -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode"));
  }
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1014DA644;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch("com.apple.locationd.hawkeye.stopUARPCapture", &self->_stopUARPCaptureToken, queue, handler);
  self->_localHawkeyeFirmwareDirectory = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", NSTemporaryDirectory(), 1), "URLByAppendingPathComponent:", CFSTR("HawkeyeFirmware"));
  self->_localFirmwareUpdateAssetMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_firmwareUpdateClientMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_runningFindMyCertificationAssistant = +[CLDurianSettings runningFindMyCertificationAssistant](CLDurianSettings, "runningFindMyCertificationAssistant");
  v23 = 0;
  v14 = objc_alloc_init((Class)NSFileManager);
  v15 = objc_msgSend(v14, "fileExistsAtPath:", -[NSURL path](self->_localHawkeyeFirmwareDirectory, "path"));
  localHawkeyeFirmwareDirectory = self->_localHawkeyeFirmwareDirectory;
  v26 = NSFilePosixPermissions;
  v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 457);
  if ((objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", localHawkeyeFirmwareDirectory, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1), &v23) & 1) != 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v17 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_localHawkeyeFirmwareDirectory;
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = (NSDictionary *)v18;
      v19 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate path has been created \", \"_localHawkeyeFirmwareDirectory\"
            ":%{public, location:escape_only}@}";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x1Cu);
    }
  }
  else if (v15)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v17 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_localHawkeyeFirmwareDirectory;
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = (NSDictionary *)v20;
      v19 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate path already exists \", \"_localHawkeyeFirmwareDirectory\":%"
            "{public, location:escape_only}@}";
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v21 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory\", \"reason\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v22 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory\", \"reason\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }

  self->_trackingAvoidanceProxy = (CLTrackingAvoidanceServiceProtocol *)objc_msgSend(objc_msgSend(-[CLDurianService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTrackingAvoidanceService"));
}

- (void)endService
{
  RadiosPreferences *radiosPreferences;
  RadiosPreferences *v4;
  id *p_scannerClient;

  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    -[RadiosPreferences setDelegate:](radiosPreferences, "setDelegate:", 0);
    v4 = self->_radiosPreferences;
  }
  else
  {
    v4 = 0;
  }

  self->_radiosPreferences = 0;
  -[CLDurianCommuteMetricManager cleanup](self->_commuteMetricManager, "cleanup");

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    -[CLAvengerScannerServiceProtocol stopMonitoringAvengerAdvertisementsForClient:](self->_avengerScannerProxy, "stopMonitoringAvengerAdvertisementsForClient:", CLISP_ME_TOKEN);
  }

}

- (void)device:(id)a3 didUpdateActivePeripheral:(id)a4 withError:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  NSMutableSet *clients;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t buf;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  id v38;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v11 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
    v12 = -[NSMutableSet count](self->_clients, "count");
    buf = 68290051;
    v29 = 2082;
    v30 = "";
    v31 = 2113;
    v32 = v10;
    v33 = 2113;
    v34 = v11;
    v35 = 1026;
    v36 = v12;
    v37 = 2113;
    v38 = objc_msgSend(a3, "address");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian didUpdateActivePeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"clients\":%{public}d, \"addr\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  clients = self->_clients;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(clients);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = objc_msgSend(a3, "uuid");
        if (a4)
          objc_msgSend(v18, "didConnectToTag:withMacAddress:withError:", v19, objc_msgSend(a3, "address"), a5);
        else
          objc_msgSend(v18, "didDisconnectFromTag:withError:", v19, a5);
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }
  if (objc_msgSend(a3, "isHawkeyeAccessory"))
  {
    v20 = -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3);
    if (!a4 && v20 && -[CLDurianService deviceUndergoingFirmwareUpdate:](self, "deviceUndergoingFirmwareUpdate:", a3))
    {
      -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", a3, a5);
      return;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v21 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      buf = 68289283;
      v29 = 2082;
      v30 = "";
      v31 = 2113;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate  We are not monitoring this accessory for updates\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  if (a4)
    -[CLDurianCommuteMetricManager didObserveScanForDevice:](self->_commuteMetricManager, "didObserveScanForDevice:", objc_msgSend(a3, "uuid"));
}

- (void)didFailToConnectDevice:(id)a3 withError:(int64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  NSMutableSet *clients;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v7 = objc_alloc((Class)NSError);
  v8 = kCLErrorDomainPrivate;
  v20 = NSLocalizedDescriptionKey;
  v21 = sub_101536DEC(a4);
  v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, a4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  clients = self->_clients;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "didConnectToTag:withMacAddress:withError:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "address"), v9);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)device:(id)a3 didPrepareForRangingWithError:(id)a4
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  v6 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a3, "uuid"));
  if (v6)
  {
    _objc_msgSend(v6, "didPrepareRangingOnTag:error:", objc_msgSend(a3, "uuid"), a4);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289283;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didPrepareForRanging missing client\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
    }
  }
}

- (void)device:(id)a3 didAcknowledgeCommandForTask:(id)a4
{
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unsigned int v18;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    v12[0] = 68289539;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v17 = 1026;
    v18 = objc_msgSend(a4, "translatedOpcode");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian didAcknowledgeCommandForTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)v12, 0x22u);
  }
  v8 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a4, "uuid"));
  v9 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
  if (v9 <= 767)
  {
    if (v9 > 174)
    {
      if (v9 == 175)
        goto LABEL_23;
      if (v9 == 208)
      {
        v11 = objc_opt_class(CLHawkeyeTask, v10);
        if ((objc_opt_isKindOfClass(a4, v11) & 1) != 0 && objc_msgSend(a4, "hawkeyeOpcode") == 527)
          objc_msgSend(v8, "didStartAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), 0);
      }
    }
    else
    {
      if (v9 == 3)
        goto LABEL_24;
      if (v9 == 40)
        objc_msgSend(v8, "didStartPlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
    }
  }
  else
  {
    if (v9 > 793)
    {
      if (v9 == 794)
        goto LABEL_23;
      if (v9 != 2051)
      {
        if (v9 != 2061)
          return;
LABEL_23:
        objc_msgSend(v8, "didStartPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
        return;
      }
LABEL_24:
      objc_msgSend(v8, "didStartRangingOnTag:error:", objc_msgSend(a3, "uuid"), 0);
      return;
    }
    if (v9 == 768)
      goto LABEL_23;
    if (v9 == 772)
      objc_msgSend(v8, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), 0);
  }
}

+ (unint64_t)convertBatteryStatus:(unsigned __int8)a3
{
  return qword_101CC5C18[a3 & 3];
}

- (void)device:(id)a3 didReceiveHawkeyeDataFragment:(id)a4 duringActiveTask:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;

  v8 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a5, "uuid"));
  if (objc_msgSend(a3, "isHawkeyeAccessory")
    && (v10 = objc_opt_class(CLHawkeyeTask, v9), (objc_opt_isKindOfClass(a5, v10) & 1) != 0))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 68290051;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v21 = 1025;
      v22 = objc_msgSend(a5, "hawkeyeOpcode");
      v23 = 2113;
      v24 = a4;
      v25 = 1025;
      v26 = v8 != 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"activeTaskOpcode\":%{private}d, \"dataFragment\":%{private, location:escape_only}@, \"client\":%{private}hhd}", (uint8_t *)&v16, 0x32u);
    }
    objc_msgSend(v8, "didReceiveHawkeyeDataFragment:withOpcode:fromDevice:error:", a4, objc_msgSend(a5, "hawkeyeOpcode", v16), objc_msgSend(a3, "uuid"), 0);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v16 = 68289539;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v21 = 1026;
      v22 = objc_msgSend(a5, "translatedOpcode");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian device type and task not supported for didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v16, 0x22u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v13 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v15 = objc_msgSend(a5, "translatedOpcode");
      v16 = 68289539;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v14;
      v21 = 1026;
      v22 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian device type and task not supported for didReceiveHawkeyeDataFragment", "{\"msg%{public}.0s\":\"#durian device type and task not supported for didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v16, 0x22u);
    }
  }
}

- (BOOL)isPoshTask:(unsigned __int16)a3
{
  BOOL result;

  result = 1;
  if ((a3 - 3) >= 0xA && ((a3 - 768) > 0x1A || ((1 << a3) & 0x4000013) == 0))
    return a3 == 1028;
  return result;
}

- (BOOL)handleCompletionForPoshTask:(id)a3 withCompletionCommand:(id)a4 onDevice:(id)a5
{
  id v9;
  int v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSError *v19;
  NSObject *v20;
  id v22;
  NSObject *v23;
  id v24;
  const char *v25;
  id v26;
  id v27;
  NSError *v28;
  id v29;
  id v30;
  const __CFString *v31;
  NSError *v32;
  id v33;
  id v34;
  const __CFString *v35;
  NSError *v36;
  id v37;
  id v38;
  NSError *v39;
  uint64_t v40;
  id v41;
  id v42;
  NSError *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  NSObject *v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  NSObject *v75;
  id v76;
  id v77;
  NSObject *v78;
  id v79;
  id v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  NSObject *v86;
  id v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  NSObject *v91;
  id v92;
  NSObject *v93;
  id v94;
  NSObject *v95;
  id v96;
  uint64_t v97;
  NSObject *v98;
  id v99;
  uint64_t v100;
  NSObject *v101;
  id v102;
  uint64_t v103;
  NSObject *v104;
  id v105;
  uint64_t v106;
  NSObject *v107;
  id v108;
  uint64_t v109;
  NSObject *v110;
  id v111;
  const char *v112;
  uint8_t *v113;
  _WORD v114[8];
  NSErrorUserInfoKey v115;
  const __CFString *v116;
  NSErrorUserInfoKey v117;
  const __CFString *v118;
  NSErrorUserInfoKey v119;
  const __CFString *v120;
  NSErrorUserInfoKey v121;
  const __CFString *v122;
  NSErrorUserInfoKey v123;
  const __CFString *v124;
  NSErrorUserInfoKey v125;
  const __CFString *v126;
  uint8_t buf[4];
  int v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  id v132;
  __int16 v133;
  _BYTE v134[34];
  __int16 v135;
  id v136;
  __int16 v137;
  id v138;
  __int16 v139;
  _BOOL4 v140;

  v9 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a3, "uuid"));
  v10 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
    v13 = objc_msgSend(a3, "translatedOpcode");
    objc_msgSend(a3, "queueDuration");
    v15 = v14;
    objc_msgSend(a3, "executionDuration");
    *(_DWORD *)buf = 68291075;
    v128 = 0;
    v129 = 2082;
    v130 = "";
    v131 = 2113;
    v132 = v12;
    v133 = 1025;
    *(_DWORD *)v134 = v13;
    *(_WORD *)&v134[4] = 2113;
    *(_QWORD *)&v134[6] = a3;
    *(_WORD *)&v134[14] = 2050;
    *(_QWORD *)&v134[16] = v15;
    *(_WORD *)&v134[24] = 2050;
    *(_QWORD *)&v134[26] = v16;
    v135 = 2113;
    v136 = a4;
    v137 = 2113;
    v138 = objc_msgSend(a4, "payload");
    v139 = 1025;
    v140 = v9 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"completion command\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"client\":%{private}hhd}", buf, 0x5Au);
  }
  if (a4)
  {
    if (v10 > 767)
    {
      switch(v10)
      {
        case 768:
          v22 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v23 = qword_1022A0038;
          if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            goto LABEL_82;
          v24 = objc_msgSend(objc_msgSend(v22, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289283;
          v128 = 0;
          v129 = 2082;
          v130 = "";
          v131 = 2113;
          v132 = v24;
          v25 = "{\"msg%{public}.0s\":\"#durian #posh got start sound opcode\", \"item\":%{private, location:escape_only}@}";
          goto LABEL_81;
        case 769:
          v70 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v71 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v72 = objc_msgSend(objc_msgSend(v70, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289283;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v72;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didStopPlayingUnauthorizedSoundOnTag\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          objc_msgSend(v9, "didStopPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a5, "uuid"), 0);
          break;
        case 770:
          v73 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v74 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v75 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v76 = objc_msgSend(objc_msgSend(v74, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289539;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v76;
            v133 = 2113;
            *(_QWORD *)v134 = v73;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh got sound response\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
          }
          objc_msgSend(v9, "didStartPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a5, "uuid"), 0);
          break;
        case 771:
          v77 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v78 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v79 = objc_msgSend(objc_msgSend(v77, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289283;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v79;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh got sound completion\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          break;
        case 772:
          v80 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v81 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v82 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v83 = objc_msgSend(objc_msgSend(v81, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289795;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v83;
            v133 = 2113;
            *(_QWORD *)v134 = v80;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh started non-owner aggressive advertising for BT finding\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
          }
          objc_msgSend(v9, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", v81, 0);
          objc_msgSend(a5, "setDisconnectionReason:", CFSTR("BtFind"));
          -[CLDurianDeviceManager disconnectDevice:](self->_deviceManager, "disconnectDevice:", a5);
          break;
        default:
          if (v10 == 794)
          {
            v84 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v23 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v85 = objc_msgSend(objc_msgSend(v84, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v128 = 0;
              v129 = 2082;
              v130 = "";
              v131 = 2113;
              v132 = v85;
              v25 = "{\"msg%{public}.0s\":\"#durian #posh got start short sound opcode\", \"item\":%{private, location:escape_only}@}";
LABEL_81:
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x1Cu);
            }
LABEL_82:
            objc_msgSend(v9, "didCompletePlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a5, "uuid"), 0);
            -[CLTrackingAvoidanceServiceProtocol didSuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didSuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a5, "uuid"), objc_msgSend(a5, "addressFromUnknownBeacon"));
          }
          else if (v10 == 1028)
          {
            v26 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
            v27 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
            if (objc_msgSend(v26, "length"))
            {
              v28 = 0;
            }
            else
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v93 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
              {
                v94 = objc_msgSend(objc_msgSend(v27, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v128 = 0;
                v129 = 2082;
                v130 = "";
                v131 = 2113;
                v132 = v94;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC278);
              }
              v95 = qword_1022A0038;
              if (os_signpost_enabled((os_log_t)qword_1022A0038))
              {
                v96 = objc_msgSend(objc_msgSend(v27, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v128 = 0;
                v129 = 2082;
                v130 = "";
                v131 = 2113;
                v132 = v96;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string", "{\"msg%{public}.0s\":\"#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              v97 = kCLErrorDomainPrivate;
              v125 = NSLocalizedDescriptionKey;
              v126 = sub_101536DEC(0x27uLL);
              v28 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v97, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
            }
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v98 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v99 = objc_msgSend(objc_msgSend(v27, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289795;
              v128 = 0;
              v129 = 2082;
              v130 = "";
              v131 = 2113;
              v132 = v99;
              v133 = 2113;
              *(_QWORD *)v134 = v26;
              *(_WORD *)&v134[8] = 2114;
              *(_QWORD *)&v134[10] = v28;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve serial number\", \"item\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
            }
            objc_msgSend(v9, "didFetchAISSerialNumberFromDevice:serialNumber:error:", objc_msgSend(a5, "uuid"), v26, v28);
          }
          break;
      }
    }
    else
    {
      switch(v10)
      {
        case 3:
          v17 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v18 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (objc_msgSend(v17, "length"))
          {
            v19 = 0;
          }
          else
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v86 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
            {
              v87 = objc_msgSend(objc_msgSend(v18, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v128 = 0;
              v129 = 2082;
              v130 = "";
              v131 = 2113;
              v132 = v87;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh didFetchAISProductName failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
            }
            v88 = qword_1022A0038;
            if (os_signpost_enabled((os_log_t)qword_1022A0038))
            {
              v89 = objc_msgSend(objc_msgSend(v18, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v128 = 0;
              v129 = 2082;
              v130 = "";
              v131 = 2113;
              v132 = v89;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh didFetchAISProductName failed to convert to string", "{\"msg%{public}.0s\":\"#durian #posh didFetchAISProductName failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            v90 = kCLErrorDomainPrivate;
            v123 = NSLocalizedDescriptionKey;
            v124 = sub_101536DEC(0x27uLL);
            v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v90, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
          }
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v91 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v92 = objc_msgSend(objc_msgSend(v18, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v129 = 2082;
            v128 = 0;
            v130 = "";
            v131 = 2113;
            v132 = v92;
            v133 = 2113;
            *(_QWORD *)v134 = v17;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = v17;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = v19;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve product data\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"productData\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISProductDataFromDevice:productData:error:", v18, v17, v19);
          break;
        case 4:
          v29 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v30 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (objc_msgSend(v29, "length"))
          {
            v31 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v29, "bytes"));
            v32 = 0;
          }
          else
          {
            v100 = kCLErrorDomainPrivate;
            v119 = NSLocalizedDescriptionKey;
            v120 = sub_101536DEC(0x27uLL);
            v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v100, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
            v31 = &stru_1021D8FB8;
          }
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v101 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v102 = objc_msgSend(objc_msgSend(v30, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v129 = 2082;
            v128 = 0;
            v130 = "";
            v131 = 2113;
            v132 = v102;
            v133 = 2113;
            *(_QWORD *)v134 = v29;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = v31;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = v32;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve manufacturer name\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"manufacturerName\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISManufacturerNameFromDevice:manufacturerName:error:", v30, v31, v32);
          break;
        case 5:
          v33 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v34 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (objc_msgSend(v33, "length"))
          {
            v35 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v33, "bytes"));
            v36 = 0;
          }
          else
          {
            v103 = kCLErrorDomainPrivate;
            v121 = NSLocalizedDescriptionKey;
            v122 = sub_101536DEC(0x27uLL);
            v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v103, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
            v35 = &stru_1021D8FB8;
          }
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v104 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v105 = objc_msgSend(objc_msgSend(v34, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v129 = 2082;
            v128 = 0;
            v130 = "";
            v131 = 2113;
            v132 = v105;
            v133 = 2113;
            *(_QWORD *)v134 = v33;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = v35;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = v36;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve model name\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"modelName\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISModelNameFromDevice:modelName:error:", v34, v35, v36);
          break;
        case 6:
          v37 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v38 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (objc_msgSend(v37, "length"))
          {
            v39 = 0;
            v40 = *(unsigned __int8 *)objc_msgSend(v37, "bytes");
          }
          else
          {
            v106 = kCLErrorDomainPrivate;
            v117 = NSLocalizedDescriptionKey;
            v118 = sub_101536DEC(0x27uLL);
            v39 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v106, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1));
            v40 = 0;
          }
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v107 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v108 = objc_msgSend(objc_msgSend(v38, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v108;
            v133 = 2113;
            *(_QWORD *)v134 = v37;
            *(_WORD *)&v134[8] = 2049;
            *(_QWORD *)&v134[10] = v40;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = v39;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  accessory category\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"accessoryCategory\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISAccessoryCategoryFromDevice:accessoryCategory:error:", v38, v40, v39);
          break;
        case 7:
          v41 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v42 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          if (objc_msgSend(v41, "length"))
          {
            v43 = 0;
            v44 = *(unsigned int *)objc_msgSend(v41, "bytes");
          }
          else
          {
            v109 = kCLErrorDomainPrivate;
            v115 = NSLocalizedDescriptionKey;
            v116 = sub_101536DEC(0x27uLL);
            v43 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v109, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
            v44 = 0;
          }
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v110 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v111 = objc_msgSend(objc_msgSend(v42, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v111;
            v133 = 2113;
            *(_QWORD *)v134 = v41;
            *(_WORD *)&v134[8] = 2049;
            *(_QWORD *)&v134[10] = v44;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = v43;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  protocol implementation\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"protocolImplementation\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISProtocolImplementationFromDevice:protocolImplementation:error:", v42, v44, v43);
          break;
        case 8:
          v45 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v46 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          v47 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v45, "bytes"));
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v48 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v49 = objc_msgSend(objc_msgSend(v46, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v129 = 2082;
            v128 = 0;
            v130 = "";
            v131 = 2113;
            v132 = v49;
            v133 = 2113;
            *(_QWORD *)v134 = v45;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = v47;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve accessory capabilities\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", v46, v45, 0);
          break;
        case 9:
          v50 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v51 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          v52 = *(unsigned __int8 *)objc_msgSend(v50, "bytes");
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v53 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v54 = objc_msgSend(objc_msgSend(v51, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v54;
            v133 = 2113;
            *(_QWORD *)v134 = v50;
            *(_WORD *)&v134[8] = 2049;
            *(_QWORD *)&v134[10] = v52;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  network id\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"networkID\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISNetworkIDFromDevice:networkID:error:", v51, v52, 0);
          break;
        case 10:
          v55 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v56 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v55, "bytes"));
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v58 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v59 = objc_msgSend(objc_msgSend(v56, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v129 = 2082;
            v128 = 0;
            v130 = "";
            v131 = 2113;
            v132 = v59;
            v133 = 2113;
            *(_QWORD *)v134 = v55;
            *(_WORD *)&v134[8] = 2114;
            *(_QWORD *)&v134[10] = v57;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve firmware version\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"firmwareVersion\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISFirmwareVersionFromDevice:firmwareVersion:error:", v56, v55, 0);
          break;
        case 11:
          v60 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v61 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          v62 = *(unsigned __int8 *)objc_msgSend(v60, "bytes");
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v63 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v64 = objc_msgSend(objc_msgSend(v61, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v64;
            v133 = 2113;
            *(_QWORD *)v134 = v60;
            *(_WORD *)&v134[8] = 2049;
            *(_QWORD *)&v134[10] = v62;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve battery type\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"batteryType\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISBatteryTypeFromDevice:batteryType:error:", v61, v62, 0);
          break;
        case 12:
          v65 = objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          v66 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a5);
          v67 = *(unsigned __int8 *)objc_msgSend(v65, "bytes");
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v68 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v69 = objc_msgSend(objc_msgSend(v66, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68290051;
            v128 = 0;
            v129 = 2082;
            v130 = "";
            v131 = 2113;
            v132 = v69;
            v133 = 2113;
            *(_QWORD *)v134 = v65;
            *(_WORD *)&v134[8] = 2049;
            *(_QWORD *)&v134[10] = v67;
            *(_WORD *)&v134[18] = 2114;
            *(_QWORD *)&v134[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve battery level\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend(v9, "didFetchAISBatteryLevelFromDevice:batteryLevel:error:", v66, v67, 0);
          break;
        default:
          return a4 != 0;
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#durian #posh #ut completionCommand is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v114[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 16, "#durian #posh #ut completionCommand is nil", v114, 2);
      v113 = (uint8_t *)v112;
      sub_100512490("Generic", 1, 0, 0, "-[CLDurianService handleCompletionForPoshTask:withCompletionCommand:onDevice:]", "%s\n", v112);
      if (v113 != buf)
        free(v113);
    }
  }
  return a4 != 0;
}

- (void)device:(id)a3 didCompleteTask:(id)a4 withCompletionCommand:(id)a5
{
  id v9;
  id v10;
  unsigned __int8 *v11;
  NSObject *v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  id v30;
  unsigned int *v31;
  NSObject *v32;
  id v33;
  unsigned int v34;
  NSObject *v35;
  id v36;
  unsigned int v37;
  CLDurianDeviceManager *deviceManager;
  NSObject *v39;
  id v40;
  unsigned int v41;
  NSObject *v42;
  id v43;
  unsigned int v44;
  const __CFString *v45;
  NSMutableSet *clients;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  unsigned int v55;
  unsigned int v56;
  NSMutableSet *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *j;
  NSObject *v62;
  id v63;
  uint64_t v64;
  id v65;
  const char *v66;
  id v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  uint32_t v71;
  int v72;
  unsigned int v73;
  int v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  const __CFString *v81;
  id v82;
  uint64_t v83;
  char *v84;
  unsigned int v85;
  uint64_t v86;
  NSObject *v87;
  id v88;
  unsigned int v89;
  unsigned int *v90;
  uint64_t v91;
  NSDate *v92;
  uint64_t v93;
  NSDate *v94;
  CLDurianDeviceManager *v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  uint64_t v102;
  NSObject *v103;
  id v104;
  NSObject *v105;
  id v106;
  unsigned __int8 *v107;
  id v108;
  double v109;
  id v110;
  int v111;
  id v112;
  id v113;
  NSObject *v114;
  id v115;
  const char *v116;
  id v117;
  id v118;
  NSObject *v119;
  id v120;
  const __CFString *v121;
  const __CFString *v122;
  void *v123;
  id v124;
  NSError *v125;
  id v126;
  id v127;
  NSObject *v128;
  id v129;
  const __CFString *v130;
  const __CFString *v131;
  void *v132;
  id v133;
  NSError *v134;
  id v135;
  NSObject *v136;
  id v137;
  id v138;
  id v139;
  NSObject *v140;
  id v141;
  const char *v142;
  id v143;
  id v144;
  NSObject *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  NSObject *v151;
  id v152;
  id v153;
  NSObject *v154;
  id v155;
  const char *v156;
  id v157;
  NSObject *v158;
  id v159;
  const char *v160;
  id v161;
  unsigned __int8 *v162;
  NSObject *v163;
  id v164;
  unint64_t v165;
  id v166;
  NSObject *v167;
  id v168;
  const char *v169;
  int v170;
  NSDate *v171;
  uint64_t v172;
  NSObject *v173;
  id v174;
  NSObject *v175;
  id v176;
  uint64_t v177;
  NSObject *v178;
  id v179;
  NSObject *v180;
  id v181;
  uint64_t v182;
  NSObject *v183;
  id v184;
  unsigned int v185;
  int v186;
  NSObject *v187;
  id v188;
  id v189;
  id v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  unsigned int v194;
  id v195;
  id v196;
  id v197;
  id v198;
  NSObject *v199;
  id v200;
  const __CFString *v201;
  const __CFString *v202;
  id v203;
  NSObject *v204;
  id v205;
  const __CFString *v206;
  const __CFString *v207;
  id v208;
  NSObject *v209;
  id v210;
  NSObject *v211;
  id v212;
  id v213;
  id v214;
  NSObject *v215;
  id v216;
  id v217;
  NSDate *v218;
  uint64_t v219;
  NSDate *v220;
  double v221;
  NSObject *v222;
  id v223;
  NSObject *v224;
  id v225;
  uint64_t v226;
  NSError *v227;
  NSObject *v228;
  id v229;
  NSObject *v230;
  id v231;
  uint64_t v232;
  NSError *v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  char v242[16];
  _BYTE v243[128];
  _BYTE v244[128];
  NSErrorUserInfoKey v245;
  const __CFString *v246;
  NSErrorUserInfoKey v247;
  const __CFString *v248;
  NSErrorUserInfoKey v249;
  const __CFString *v250;
  NSErrorUserInfoKey v251;
  const __CFString *v252;
  uint8_t buf[4];
  int v254;
  __int16 v255;
  const char *v256;
  __int16 v257;
  id v258;
  __int16 v259;
  _BYTE v260[24];
  _BYTE v261[10];
  __int16 v262;
  id v263;
  __int16 v264;
  id v265;
  __int16 v266;
  _BOOL4 v267;

  if (a4)
  {
    v9 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a4, "uuid"));
    objc_msgSend(a4, "complete");
    v10 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
    v11 = (unsigned __int8 *)objc_msgSend(objc_msgSend(a5, "payload"), "bytes");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v14 = objc_msgSend(a4, "translatedOpcode");
      objc_msgSend(a4, "queueDuration");
      v16 = v15;
      objc_msgSend(a4, "executionDuration");
      *(_DWORD *)buf = 68291075;
      v254 = 0;
      v255 = 2082;
      v256 = "";
      v257 = 2113;
      v258 = v13;
      v259 = 1025;
      *(_DWORD *)v260 = v14;
      *(_WORD *)&v260[4] = 2113;
      *(_QWORD *)&v260[6] = a4;
      *(_WORD *)&v260[14] = 2050;
      *(_QWORD *)&v260[16] = v16;
      *(_WORD *)v261 = 2050;
      *(_QWORD *)&v261[2] = v17;
      v262 = 2113;
      v263 = a5;
      v264 = 2113;
      v265 = objc_msgSend(a5, "payload");
      v266 = 1025;
      v267 = v9 != 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"completion command\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"client\":%{private}hhd}", buf, 0x5Au);
    }
    if (objc_msgSend(a3, "pendingDisconnect") && objc_msgSend(a3, "isTaskQueueEmpty"))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v19 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v254 = 0;
        v255 = 2082;
        v256 = "";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device pending disconnection completed tasks, scheduling for disconnection\"}", buf, 0x12u);
      }
      -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self->_deviceManager, "scheduleDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(a3, "uuid"));
    }
    if ((_DWORD)v10 != 208
      || (v20 = objc_opt_class(CLHawkeyeTask, v18), (objc_opt_isKindOfClass(a4, v20) & 1) != 0))
    {
      if (-[CLDurianService isPoshTask:](self, "isPoshTask:", v10) && objc_msgSend(a3, "isPoshAccessory"))
      {
        -[CLDurianService handleCompletionForPoshTask:withCompletionCommand:onDevice:](self, "handleCompletionForPoshTask:withCompletionCommand:onDevice:", a4, a5, a3);
LABEL_18:
        if (objc_msgSend(a3, "isHawkeyeAccessory"))
        {
          v22 = objc_opt_class(CLHawkeyeTask, v21);
          if ((objc_opt_isKindOfClass(a4, v22) & 1) != 0)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v23 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v24 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v25 = objc_msgSend(a4, "hawkeyeOpcode");
              v26 = -[NSMutableSet count](self->_clients, "count");
              *(_DWORD *)buf = 68289795;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v24;
              v259 = 1025;
              *(_DWORD *)v260 = v25;
              *(_WORD *)&v260[4] = 1026;
              *(_DWORD *)&v260[6] = v26;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            v240 = 0u;
            v241 = 0u;
            v238 = 0u;
            v239 = 0u;
            clients = self->_clients;
            v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v238, v244, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v239;
              do
              {
                for (i = 0; i != v48; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v239 != v49)
                    objc_enumerationMutation(clients);
                  objc_msgSend(*(id *)(*((_QWORD *)&v238 + 1) + 8 * (_QWORD)i), "didCompleteHawkeyeTaskWithOpcode:fromDevice:withError:", objc_msgSend(a4, "hawkeyeOpcode"), objc_msgSend(a3, "uuid"), 0);
                }
                v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v238, v244, 16);
              }
              while (v48);
            }
          }
        }
        if (objc_msgSend(a3, "isAirTag"))
        {
          v52 = objc_opt_class(CLDurianGATTWriteTask, v51);
          if ((objc_opt_isKindOfClass(a4, v52) & 1) != 0)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v53 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v54 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v55 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
              v56 = -[NSMutableSet count](self->_clients, "count");
              *(_DWORD *)buf = 68289795;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v54;
              v259 = 1025;
              *(_DWORD *)v260 = v55;
              *(_WORD *)&v260[4] = 1026;
              *(_DWORD *)&v260[6] = v56;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            v236 = 0u;
            v237 = 0u;
            v234 = 0u;
            v235 = 0u;
            v57 = self->_clients;
            v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v234, v243, 16);
            if (v58)
            {
              v59 = v58;
              v60 = *(_QWORD *)v235;
              do
              {
                for (j = 0; j != v59; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v235 != v60)
                    objc_enumerationMutation(v57);
                  objc_msgSend(*(id *)(*((_QWORD *)&v234 + 1) + 8 * (_QWORD)j), "didCompleteHawkeyeTaskWithOpcode:fromDevice:withError:", objc_msgSend(objc_msgSend(a4, "command"), "opcode"), objc_msgSend(a3, "uuid"), 0);
                }
                v59 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v234, v243, 16);
              }
              while (v59);
            }
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_taskClientMap, "removeObjectForKey:", objc_msgSend(a4, "uuid"));
        -[NSMutableDictionary removeObjectForKey:](self->_pendingTaskMap, "removeObjectForKey:", objc_msgSend(a4, "uuid"));
        -[CLDurianDeviceManager scheduleConnectionEvaluationForDevice:](self->_deviceManager, "scheduleConnectionEvaluationForDevice:", a3);
        -[CLDurianMetricManager submitTaskMetricsForDevice:task:completed:errorCode:](self->_metricManager, "submitTaskMetricsForDevice:task:completed:errorCode:", a3, a4, 1, -1);
        return;
      }
      if ((int)v10 > 173)
      {
        switch((int)v10)
        {
          case 174:
            v30 = objc_msgSend(a4, "characteristicPayload");
            v31 = (unsigned int *)objc_msgSend(v30, "bytes");
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v32 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v33 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v34 = *v31;
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v33;
              v259 = 1025;
              *(_DWORD *)v260 = v34;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetched current key index\", \"item\":%{private, location:escape_only}@, \"index\":%{private}u}", buf, 0x22u);
            }
            -[CLDurianDeviceManager setCurrentKeyIndex:forDevice:](self->_deviceManager, "setCurrentKeyIndex:forDevice:", *v31, a3);
            if ((unint64_t)objc_msgSend(v30, "length") >= 5)
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v35 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v36 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                v37 = v31[1];
                *(_DWORD *)buf = 68289539;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v36;
                v259 = 1025;
                *(_DWORD *)v260 = v37;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetched current wild key index\", \"item\":%{private, location:escape_only}@, \"index\":%{private}u}", buf, 0x22u);
              }
              -[CLDurianDeviceManager setCurrentWildKeyIndex:forDevice:forEvent:](self->_deviceManager, "setCurrentWildKeyIndex:forDevice:forEvent:", v31[1], a3, CFSTR("fetchkeyindex"));
            }
            objc_msgSend(a3, "setDisconnectionReason:", CFSTR("Task:FetchCurrentKeyIndex"));
            deviceManager = self->_deviceManager;
            goto LABEL_115;
          case 175:
            if (objc_msgSend(a3, "isHawkeyeAccessory"))
              objc_msgSend(v9, "didCompletePlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
            if (objc_msgSend(a3, "isAirTag"))
              objc_msgSend(v9, "didStartPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
            goto LABEL_141;
          case 176:
          case 178:
          case 179:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 187:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 196:
          case 197:
          case 198:
          case 204:
          case 205:
          case 206:
          case 207:
          case 219:
            goto LABEL_18;
          case 177:
            if (objc_msgSend(a3, "isAirTag"))
              -[CLDurianDeviceManager setKeyRollTimeout:forDevice:](self->_deviceManager, "setKeyRollTimeout:forDevice:", *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "subdataWithRange:", 1, 4), "bytes")/ 0x3E8uLL, a3);
            if (!objc_msgSend(a3, "isHawkeyeAccessory"))
              goto LABEL_18;
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v64 = qword_1022A0038;
            if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              goto LABEL_18;
            v96 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289283;
            v254 = 0;
            v255 = 2082;
            v256 = "";
            v257 = 2113;
            v258 = v96;
            v66 = "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeSetKeyRotationTimeout TBD\", \"item\":%{p"
                  "rivate, location:escape_only}@}";
            goto LABEL_149;
          case 180:
            v97 = *((unsigned __int8 *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "bytes") + 1);
            v98 = objc_msgSend(a4, "characteristicPayload");
            v99 = objc_msgSend(a3, "uuid");
            v100 = v9;
            v101 = v98;
            v102 = v97;
            goto LABEL_152;
          case 181:
            if (v11[1])
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v103 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v104 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v104;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian detected crashes on device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              if (+[CLDurianSettings crashAlertEnabled](CLDurianSettings, "crashAlertEnabled"))
              {
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC278);
                v105 = qword_1022A0038;
                if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                {
                  v106 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                  *(_DWORD *)buf = 68289283;
                  v254 = 0;
                  v255 = 2082;
                  v256 = "";
                  v257 = 2113;
                  v258 = v106;
                  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian displaying crash alert\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                }
                sub_101535E48(a3, (char *)v11[1]);
                -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_clients, "makeObjectsPerformSelector:withObject:", "didDetectCrashOnTag:", objc_msgSend(a3, "uuid"));
              }
            }
            goto LABEL_18;
          case 195:
            objc_msgSend(v9, "didSetUnauthorizedPlaySoundRateLimitFromTag:error:", objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 199:
            objc_msgSend(v9, "didSetAccelerometerSlopeModeConfigurationOnTag:error:", objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 200:
            objc_msgSend(v9, "didSetAccelerometerOrientationModeConfigurationOnTag:error:", objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 201:
            v107 = (unsigned __int8 *)objc_msgSend(objc_msgSend(a5, "payload"), "bytes");
            v108 = objc_alloc((Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration);
            LODWORD(v109) = 0;
            v110 = objc_msgSend(v108, "initWithThreshold:sampleCount:sampleRate:", *v107, v107[3], v109);
            objc_msgSend(v9, "didFetchAccelerometerSlopeModeConfiguration:onTag:error:", v110, objc_msgSend(a3, "uuid"), 0);

            goto LABEL_18;
          case 202:
            objc_msgSend(v9, "didFetchAccelerometerOrientationModeConfiguration:onTag:error:", 0, objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 203:
            objc_msgSend(v9, "didFetchAccelerometerMode:onTag:error:", 0, objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 208:
            v111 = objc_msgSend(a4, "hawkeyeOpcode");
            if (v111 <= 771)
            {
              switch(v111)
              {
                case 527:
                  objc_msgSend(v9, "didCompleteAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), 0);
                  goto LABEL_18;
                case 528:
                  objc_msgSend(v9, "didStopAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), 0);
                  goto LABEL_18;
                case 529:
                  v189 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                  v242[0] = 0;
                  objc_msgSend(v189, "getBytes:length:", v242, 1);
                  if (qword_1022A0030 != -1)
                    dispatch_once(&qword_1022A0030, &stru_1021BC278);
                  v167 = qword_1022A0038;
                  if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_242;
                  v190 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                  *(_DWORD *)buf = 68289795;
                  v254 = 0;
                  v255 = 2082;
                  v256 = "";
                  v257 = 2113;
                  v258 = v190;
                  v259 = 2113;
                  *(_QWORD *)v260 = v189;
                  *(_WORD *)&v260[8] = 1025;
                  *(_DWORD *)&v260[10] = v242[0];
                  v169 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (owner)\", \"item\":%{private, location"
                         ":escape_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
                  goto LABEL_241;
                case 530:
                case 531:
                case 532:
                case 533:
                case 534:
                case 535:
                case 536:
                case 539:
                case 540:
                  break;
                case 537:
                case 538:
                case 541:
                  goto LABEL_18;
                default:
                  if (v111 == 517)
                  {
                    v218 = +[NSDate date](NSDate, "date");
                    v219 = mach_continuous_time();
                    v220 = -[NSDate dateByAddingTimeInterval:](v218, "dateByAddingTimeInterval:", -TMConvertTicksToSeconds(v219 - (_QWORD)objc_msgSend(a4, "completionTime")));
                    objc_msgSend(a4, "executionDuration");
                    -[CLDurianDeviceManager setAlignmentUncertainty:atIndex:date:forDevice:](self->_deviceManager, "setAlignmentUncertainty:atIndex:date:forDevice:", objc_msgSend(a4, "currentIndex"), v220, a3, v221);
                    goto LABEL_18;
                  }
                  if (v111 == 551)
                    goto LABEL_18;
                  break;
              }
            }
            else
            {
              if (v111 <= 1023)
              {
                switch(v111)
                {
                  case 772:
                    objc_msgSend(v9, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), 0);
                    v81 = CFSTR("BtFind");
                    goto LABEL_114;
                  case 773:
                    v195 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    v242[0] = 0;
                    objc_msgSend(v195, "getBytes:length:", v242, 1);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v167 = qword_1022A0038;
                    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_242;
                    v196 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289795;
                    v254 = 0;
                    v255 = 2082;
                    v256 = "";
                    v257 = 2113;
                    v258 = v196;
                    v259 = 2113;
                    *(_QWORD *)v260 = v195;
                    *(_WORD *)&v260[8] = 1025;
                    *(_DWORD *)&v260[10] = v242[0];
                    v169 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (non-owner)\", \"item\":%{private, lo"
                           "cation:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
                    goto LABEL_241;
                  case 774:
                    v112 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    v113 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v114 = qword_1022A0038;
                    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_179;
                    v197 = objc_msgSend(objc_msgSend(v113, "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289539;
                    v254 = 0;
                    v255 = 2082;
                    v256 = "";
                    v257 = 2113;
                    v258 = v197;
                    v259 = 2113;
                    *(_QWORD *)v260 = v112;
                    v116 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchProductDataAIS NonOwner\", \"item\":%{private"
                           ", location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_178;
                  case 775:
                    v198 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v199 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    {
                      v200 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289539;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v200;
                      v259 = 2113;
                      *(_QWORD *)v260 = v198;
                      _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    v201 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v198, 4);
                    if (v201)
                    {
                      v202 = v201;
                      v124 = objc_msgSend(a3, "uuid");
                      v123 = v9;
                      v122 = v202;
                      goto LABEL_186;
                    }
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v222 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
                    {
                      v223 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289283;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v223;
                      _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      if (qword_1022A0030 != -1)
                        dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    }
                    v224 = qword_1022A0038;
                    if (os_signpost_enabled((os_log_t)qword_1022A0038))
                    {
                      v225 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289283;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v225;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v224, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    v226 = kCLErrorDomainPrivate;
                    v247 = NSLocalizedDescriptionKey;
                    v248 = sub_101536DEC(0x27uLL);
                    v227 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v226, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1));
                    v124 = objc_msgSend(a3, "uuid");
                    v122 = &stru_1021D8FB8;
                    v123 = v9;
                    v125 = v227;
                    goto LABEL_254;
                  case 776:
                    v203 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v204 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    {
                      v205 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289539;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v205;
                      v259 = 2113;
                      *(_QWORD *)v260 = v203;
                      _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    v206 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v203, 4);
                    if (v206)
                    {
                      v207 = v206;
                      v133 = objc_msgSend(a3, "uuid");
                      v132 = v9;
                      v131 = v207;
                      goto LABEL_193;
                    }
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v228 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
                    {
                      v229 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289283;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v229;
                      _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      if (qword_1022A0030 != -1)
                        dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    }
                    v230 = qword_1022A0038;
                    if (os_signpost_enabled((os_log_t)qword_1022A0038))
                    {
                      v231 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289283;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v231;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v230, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    v232 = kCLErrorDomainPrivate;
                    v245 = NSLocalizedDescriptionKey;
                    v246 = sub_101536DEC(0x27uLL);
                    v233 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v232, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1));
                    v133 = objc_msgSend(a3, "uuid");
                    v131 = &stru_1021D8FB8;
                    v132 = v9;
                    v134 = v233;
                    break;
                  case 777:
                    v138 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    v139 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v140 = qword_1022A0038;
                    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_204;
                    v208 = objc_msgSend(objc_msgSend(v139, "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289539;
                    v254 = 0;
                    v255 = 2082;
                    v256 = "";
                    v257 = 2113;
                    v258 = v208;
                    v259 = 2113;
                    *(_QWORD *)v260 = v138;
                    v142 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCategoryAIS NonOwner\", \"item\":%{p"
                           "rivate, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_203;
                  case 778:
                    v143 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v209 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    {
                      v210 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289539;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v210;
                      v259 = 2113;
                      *(_QWORD *)v260 = v143;
                      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCapabilitiesAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    v148 = objc_msgSend(a3, "uuid");
                    v147 = v9;
                    goto LABEL_210;
                  case 779:
                    v77 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v211 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    {
                      v212 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289539;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v212;
                      v259 = 2113;
                      *(_QWORD *)v260 = v77;
                      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFirmwareVersionAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    goto LABEL_112;
                  case 780:
                    v153 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v154 = qword_1022A0038;
                    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_222;
                    v213 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289539;
                    v254 = 0;
                    v255 = 2082;
                    v256 = "";
                    v257 = 2113;
                    v258 = v213;
                    v259 = 2113;
                    *(_QWORD *)v260 = v153;
                    v156 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFindMyVersionAIS NonOwner\", \"item\":%{priva"
                           "te, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_221;
                  case 781:
                    v157 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v158 = qword_1022A0038;
                    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_228;
                    v214 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289539;
                    v254 = 0;
                    v255 = 2082;
                    v256 = "";
                    v257 = 2113;
                    v258 = v214;
                    v259 = 2113;
                    *(_QWORD *)v260 = v157;
                    v160 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryTypeAIS NonOwner\", \"item\":%{private"
                           ", location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_227;
                  case 782:
                    v161 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    v162 = (unsigned __int8 *)objc_msgSend(v161, "bytes");
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v163 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_232;
                    goto LABEL_233;
                  default:
                    goto LABEL_299;
                }
LABEL_263:
                objc_msgSend(v132, "didFetchHawkeyeAISModelNameFromDevice:modelName:error:", v133, v131, v134);
                goto LABEL_18;
              }
              if (v111 <= 1027)
              {
                if (v111 == 1024)
                {
                  objc_msgSend(v9, "didFetchHawkeyeCurrentPrimaryKeyFromDevice:currentPrimaryKey:error:", objc_msgSend(a3, "uuid"), objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2), 0);
                  goto LABEL_18;
                }
                if (v111 == 1025)
                {
                  objc_msgSend(v9, "didFetchHawkeyeiCloudIdentifierFromDevice:iCloudIdentifier:error:", objc_msgSend(a3, "uuid"), objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2), 0);
                  goto LABEL_18;
                }
              }
              else
              {
                switch(v111)
                {
                  case 1285:
                    objc_msgSend(v9, "didSetHawkeyeUTMotionConfigForDevice:withError:", objc_msgSend(a3, "uuid"), 0);
                    goto LABEL_18;
                  case 1281:
                    if (qword_1022A0030 != -1)
                      dispatch_once(&qword_1022A0030, &stru_1021BC278);
                    v215 = qword_1022A0038;
                    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                    {
                      v216 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                      *(_DWORD *)buf = 68289283;
                      v254 = 0;
                      v255 = 2082;
                      v256 = "";
                      v257 = 2113;
                      v258 = v216;
                      _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye log final\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    v217 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2);
                    v99 = objc_msgSend(a3, "uuid");
                    v100 = v9;
                    v101 = v217;
                    v102 = 4;
LABEL_152:
                    objc_msgSend(v100, "didDumpLogs:ofType:fromTag:withError:", v101, v102, v99, 0);
                    goto LABEL_18;
                  case 1028:
                    objc_msgSend(v9, "didFetchHawkeyeSerialNumberFromDevice:serialNumber:error:", objc_msgSend(a3, "uuid"), objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2), 0);
                    goto LABEL_18;
                }
              }
            }
LABEL_299:
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v191 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v192 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v193 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
              v194 = objc_msgSend(a4, "hawkeyeOpcode");
              *(_DWORD *)buf = 68289795;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v192;
              v259 = 2049;
              *(_QWORD *)v260 = v193;
              *(_WORD *)&v260[8] = 2049;
              *(_QWORD *)&v260[10] = v194;
              v66 = "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didComplete hawkeye task\", \"item\":%{private, lo"
                    "cation:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}";
              v70 = v191;
              v71 = 48;
              goto LABEL_150;
            }
            break;
          case 209:
            v112 = objc_msgSend(a4, "characteristicPayload");
            v113 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v114 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v115 = objc_msgSend(objc_msgSend(v113, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v115;
              v259 = 2113;
              *(_QWORD *)v260 = v112;
              v116 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchProductDataAIS\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_178:
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, v116, buf, 0x26u);
            }
LABEL_179:
            objc_msgSend(v9, "didFetchHawkeyeAISProductDataFromDevice:productData:error:", v113, v112, 0);
            goto LABEL_18;
          case 210:
            v117 = objc_msgSend(a4, "characteristicPayload");
            v118 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v119 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v120 = objc_msgSend(objc_msgSend(v118, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v120;
              v259 = 2113;
              *(_QWORD *)v260 = v117;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            v121 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v117, "bytes"));
            if (v121)
            {
              v122 = v121;
              v123 = v9;
              v124 = v118;
LABEL_186:
              v125 = 0;
            }
            else
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v173 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
              {
                v174 = objc_msgSend(objc_msgSend(v118, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v174;
                _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC278);
              }
              v175 = qword_1022A0038;
              if (os_signpost_enabled((os_log_t)qword_1022A0038))
              {
                v176 = objc_msgSend(objc_msgSend(v118, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v176;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v175, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              v177 = kCLErrorDomainPrivate;
              v251 = NSLocalizedDescriptionKey;
              v252 = sub_101536DEC(0x27uLL);
              v125 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v177, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1));
              v122 = &stru_1021D8FB8;
              v123 = v9;
              v124 = v118;
            }
LABEL_254:
            objc_msgSend(v123, "didFetchHawkeyeAISManufacturerNameFromDevice:manufacturerName:error:", v124, v122, v125);
            goto LABEL_18;
          case 211:
            v126 = objc_msgSend(a4, "characteristicPayload");
            v127 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v128 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v129 = objc_msgSend(objc_msgSend(v127, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v129;
              v259 = 2113;
              *(_QWORD *)v260 = v126;
              _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            v130 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(v126, "bytes"));
            if (v130)
            {
              v131 = v130;
              v132 = v9;
              v133 = v127;
LABEL_193:
              v134 = 0;
            }
            else
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v178 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
              {
                v179 = objc_msgSend(objc_msgSend(v127, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v179;
                _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC278);
              }
              v180 = qword_1022A0038;
              if (os_signpost_enabled((os_log_t)qword_1022A0038))
              {
                v181 = objc_msgSend(objc_msgSend(v127, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v181;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v180, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchModelNameAIS failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              v182 = kCLErrorDomainPrivate;
              v249 = NSLocalizedDescriptionKey;
              v250 = sub_101536DEC(0x27uLL);
              v134 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v182, 39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1));
              v131 = &stru_1021D8FB8;
              v132 = v9;
              v133 = v127;
            }
            goto LABEL_263;
          case 212:
            v135 = objc_msgSend(a4, "characteristicPayload");
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v136 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v137 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v137;
              v259 = 2113;
              *(_QWORD *)v260 = v135;
              _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelColorCodeAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            objc_msgSend(v9, "didFetchHawkeyeAISModelColorCodeFromDevice:modelColorCode:error:", objc_msgSend(a3, "uuid"), v135, 0);
            goto LABEL_18;
          case 213:
            v138 = objc_msgSend(a4, "characteristicPayload");
            v139 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v140 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v141 = objc_msgSend(objc_msgSend(v139, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v141;
              v259 = 2113;
              *(_QWORD *)v260 = v138;
              v142 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCategoryAIS\", \"item\":%{private, locatio"
                     "n:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_203:
              _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, v142, buf, 0x26u);
            }
LABEL_204:
            objc_msgSend(v9, "didFetchHawkeyeAISAccessoryCategoryFromDevice:accessoryCategory:error:", v139, v138, 0);
            goto LABEL_18;
          case 214:
            v143 = objc_msgSend(a4, "characteristicPayload");
            v144 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v145 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v146 = objc_msgSend(objc_msgSend(v144, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v146;
              v259 = 2113;
              *(_QWORD *)v260 = v143;
              _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCapabilitiesAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            v147 = v9;
            v148 = v144;
LABEL_210:
            objc_msgSend(v147, "didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", v148, v143, 0);
            goto LABEL_18;
          case 215:
            v149 = objc_msgSend(a4, "characteristicPayload");
            v150 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v151 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v152 = objc_msgSend(objc_msgSend(v150, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v152;
              v259 = 2113;
              *(_QWORD *)v260 = v149;
              _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFirmwareVersionAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            v79 = v9;
            v80 = v149;
            v78 = v150;
            goto LABEL_216;
          case 216:
            v153 = objc_msgSend(a4, "characteristicPayload");
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v154 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v155 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v155;
              v259 = 2113;
              *(_QWORD *)v260 = v153;
              v156 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFindMyVersionAIS\", \"item\":%{private, location:es"
                     "cape_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_221:
              _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, v156, buf, 0x26u);
            }
LABEL_222:
            objc_msgSend(v9, "didFetchHawkeyeAISFindMyVersionFromDevice:findMyVersion:error:", objc_msgSend(a3, "uuid"), *(unsigned int *)objc_msgSend(v153, "bytes"), 0);
            goto LABEL_18;
          case 217:
            v157 = objc_msgSend(a4, "characteristicPayload");
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v158 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v159 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v159;
              v259 = 2113;
              *(_QWORD *)v260 = v157;
              v160 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryTypeAIS\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_227:
              _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, v160, buf, 0x26u);
            }
LABEL_228:
            objc_msgSend(v9, "didFetchHawkeyeAISBatteryTypeFromDevice:batteryType:error:", objc_msgSend(a3, "uuid"), v157, 0);
            goto LABEL_18;
          case 218:
            v161 = objc_msgSend(a4, "characteristicPayload");
            v162 = (unsigned __int8 *)objc_msgSend(v161, "bytes");
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v163 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
LABEL_232:
              v164 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v164;
              v259 = 2113;
              *(_QWORD *)v260 = v161;
              _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryLevelAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
LABEL_233:
            v83 = *v162;
            goto LABEL_234;
          case 220:
            if (objc_msgSend(a3, "isHawkeyeAccessory"))
              objc_msgSend(v9, "didStopPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          case 221:
            v166 = objc_msgSend(a4, "characteristicPayload");
            v242[0] = 0;
            objc_msgSend(v166, "getBytes:length:", v242, 1);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v167 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v168 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289795;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v168;
              v259 = 2113;
              *(_QWORD *)v260 = v166;
              *(_WORD *)&v260[8] = 1025;
              *(_DWORD *)&v260[10] = v242[0];
              v169 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (gatt)\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
LABEL_241:
              _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, v169, buf, 0x2Cu);
            }
LABEL_242:
            objc_msgSend(v9, "didFetchTxPower:fromDevice:withError:", +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v242[0]), objc_msgSend(a3, "uuid"), 0);
            goto LABEL_18;
          default:
            switch((int)v10)
            {
              case 2049:
                goto LABEL_79;
              case 2050:
                goto LABEL_80;
              case 2051:
                goto LABEL_81;
              case 2052:
                goto LABEL_18;
              case 2053:
                goto LABEL_82;
              default:
                if ((_DWORD)v10 != 2061)
                  goto LABEL_18;
                if (objc_msgSend(a3, "isAirTag"))
                  objc_msgSend(v9, "didCompletePlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
                break;
            }
LABEL_141:
            -[CLTrackingAvoidanceServiceProtocol didSuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didSuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "addressFromUnknownBeacon"));
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      switch((int)v10)
      {
        case 1:
LABEL_79:
          -[CLDurianService completeRangingInit:client:data:opcode:](self, "completeRangingInit:client:data:opcode:", objc_msgSend(a3, "uuid"), v9, v11, v10);
          goto LABEL_18;
        case 3:
LABEL_81:
          -[CLDurianService completeRangingStart:client:data:opcode:](self, "completeRangingStart:client:data:opcode:", objc_msgSend(a3, "uuid"), v9, v11, v10);
          goto LABEL_18;
        case 6:
LABEL_82:
          -[CLDurianService completeRangingDeinit:client:data:opcode:](self, "completeRangingDeinit:client:data:opcode:", objc_msgSend(a3, "uuid"), v9, v11, v10);
          goto LABEL_18;
        case 8:
          objc_msgSend(v9, "didStopPlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          if ((objc_msgSend(a3, "isRoseInitialized") & 1) == 0)
          {
            v45 = CFSTR("SoundStop");
            goto LABEL_124;
          }
          goto LABEL_18;
        case 10:
          if (objc_msgSend(a3, "isAirTag")
            && !*((_BYTE *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "bytes") + 2)
            && objc_msgSend(a3, "isOnlyRemainingTask")
            && !-[CLDurianDeviceManager shouldHoldLeashForDevice:](self->_deviceManager, "shouldHoldLeashForDevice:", a3)&& (objc_msgSend(a3, "firmwareUpdateMode") & 1) == 0)
          {
            objc_msgSend(a3, "setDisconnectionReason:", CFSTR("LeashDisable"));
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v62 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v63 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v63;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disconnecting peripheral from leash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDeviceManager disconnectDevice:](self->_deviceManager, "disconnectDevice:", a3);
          }
          if (objc_msgSend(a3, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v64 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v65 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v65;
              v66 = "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeLeashing TBD\", \"item\":%{private, loc"
                    "ation:escape_only}@}";
LABEL_149:
              v70 = v64;
              v71 = 28;
              goto LABEL_150;
            }
          }
          goto LABEL_18;
        case 12:
          v67 = objc_msgSend(a3, "getMultiStatusFromData:", v11);
          objc_msgSend(v9, "didGetMultiStatus:forTag:withError:", v67, objc_msgSend(a3, "uuid"), 0);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v68 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v69 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289539;
            v254 = 0;
            v255 = 2082;
            v256 = "";
            v257 = 2113;
            v258 = v69;
            v259 = 1026;
            *(_DWORD *)v260 = (_DWORD)v67;
            v66 = "{\"msg%{public}.0s\":\"#durian didGetMultiStatus\", \"item\":%{private, location:escape_only}@, \"multi\":%{public}d}";
            v70 = v68;
            v71 = 34;
LABEL_150:
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, v66, buf, v71);
          }
          goto LABEL_18;
        case 13:
          objc_msgSend(v9, "didSetObfuscatedIdentifierOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 14:
          v72 = *v11;
          v73 = v11[1];
          v74 = v11[2];
          if (v72)
          {
            if (v72 != 1)
              goto LABEL_270;
            if (v73 < 2)
            {
              v75 = a3;
              v76 = 3;
LABEL_269:
              objc_msgSend(v75, "setMutexState:", v76);
              goto LABEL_270;
            }
            if (v73 == 4)
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v187 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v188 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v254 = 0;
                v255 = 2082;
                v256 = "";
                v257 = 2113;
                v258 = v188;
                _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex BUSY\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              objc_msgSend(a3, "setMutexState:", 4);
              objc_msgSend(a3, "handleMutexErrorOnAction:", 1);
            }
          }
          else if (v73 == 3 || !v73)
          {
            v75 = a3;
            v76 = 0;
            goto LABEL_269;
          }
LABEL_270:
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v183 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v184 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            v185 = objc_msgSend(a3, "mutexState");
            v186 = v74 & 8;
            *(_DWORD *)buf = 68290563;
            v254 = 0;
            v255 = 2082;
            v256 = "";
            v257 = 2113;
            v258 = v184;
            v259 = 1025;
            *(_DWORD *)v260 = v72;
            *(_WORD *)&v260[4] = 1025;
            *(_DWORD *)&v260[6] = v73;
            *(_WORD *)&v260[10] = 1025;
            *(_DWORD *)&v260[12] = v185;
            *(_WORD *)&v260[16] = 1025;
            *(_DWORD *)&v260[18] = v74;
            *(_WORD *)&v260[22] = 1025;
            *(_DWORD *)v261 = v186;
            _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task response\", \"item\":%{private, location:escape_only}@, \"mutexAction\":%{private}d, \"mutexResponse\":%{private}d, \"mutexState\":%{private}d, \"status\":%{private}d, \"fwdl\":%{private}d}", buf, 0x3Au);
          }
          else
          {
            v186 = v74 & 8;
          }
          if (v186)
            objc_msgSend(a3, "handleMultiDownloading");
          goto LABEL_18;
        case 15:
          objc_msgSend(v9, "didSetNearOwnerTimeoutOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 18:
          v77 = objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 1);
LABEL_112:
          v78 = objc_msgSend(a3, "uuid");
          v79 = v9;
          v80 = v77;
LABEL_216:
          objc_msgSend(v79, "didFetchFirmwareVersion:fromTag:withError:", v80, v78, 0);
          goto LABEL_18;
        case 19:
          objc_msgSend(v9, "didUnpairFromTag:withError:", objc_msgSend(a3, "uuid"), 0);
          v81 = CFSTR("Task:Unpair");
LABEL_114:
          objc_msgSend(a3, "setDisconnectionReason:", v81);
          deviceManager = self->_deviceManager;
LABEL_115:
          -[CLDurianDeviceManager disconnectDevice:](deviceManager, "disconnectDevice:", a3);
          goto LABEL_18;
        case 21:
LABEL_80:
          -[CLDurianService completeRangingConfigure:client:data:opcode:](self, "completeRangingConfigure:client:data:opcode:", objc_msgSend(a3, "uuid"), v9, v11, v10);
          goto LABEL_18;
        case 23:
          v82 = objc_msgSend(objc_alloc((Class)CLFindMyAccessoryUserStats), "initWithPayloadV2:", objc_msgSend(a4, "userStatsData"));
          -[CLDurianMetricManager submitUserStats:payload:](self->_metricManager, "submitUserStats:payload:", a3, v82);
          goto LABEL_119;
        case 24:
          objc_msgSend(v9, "didFetchUserStats_Deprecated:fromTag:withError:", objc_msgSend(a5, "payload"), objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 25:
          v82 = objc_msgSend(objc_alloc((Class)CLFindMyAccessoryUserStats), "initWithPayloadV1:", objc_msgSend(a5, "payload"));
LABEL_119:
          objc_msgSend(v9, "didFetchUserStats:fromTag:withError:", v82, objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 38:
          objc_msgSend(v9, "didSetTagTypeOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 39:
          v83 = v11[1];
LABEL_234:
          v165 = +[CLDurianService convertBatteryStatus:](CLDurianService, "convertBatteryStatus:", v83);
          objc_msgSend(v9, "didFetchBatteryStatus:fromTag:withError:", v165, objc_msgSend(a3, "uuid"), 0);
          -[CLDurianDeviceManager updateBatteryStatus:forDevice:](self->_deviceManager, "updateBatteryStatus:forDevice:", v165, a3);
          goto LABEL_18;
        case 40:
          objc_msgSend(v9, "didCompletePlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          if ((objc_msgSend(a3, "isRoseInitialized") & 1) == 0)
          {
            v45 = CFSTR("SoundDone");
LABEL_124:
            objc_msgSend(a3, "releaseMutexWithReason:", v45);
          }
          goto LABEL_18;
        case 42:
          v84 = (char *)objc_msgSend(objc_msgSend(a5, "payload"), "bytes");
          if (objc_msgSend(objc_msgSend(a5, "payload"), "length") == (id)13)
          {
            v85 = *(_DWORD *)(v84 + 9);
          }
          else
          {
            v170 = *(_DWORD *)(v84 + 5);
            v85 = v170 - objc_msgSend(objc_msgSend(a4, "configuration"), "keysRemaining");
          }
          v91 = v85;
          -[CLDurianDeviceManager setWildKeyBase:interval:fallback:forDevice:](self->_deviceManager, "setWildKeyBase:interval:fallback:forDevice:", *(unsigned int *)(v84 + 5), objc_msgSend(objc_msgSend(a4, "configuration"), "keyCount"), *(unsigned int *)(v84 + 1), a3);
          v171 = +[NSDate date](NSDate, "date");
          v172 = mach_continuous_time();
          v94 = -[NSDate dateByAddingTimeInterval:](v171, "dateByAddingTimeInterval:", -TMConvertTicksToSeconds(v172 - (_QWORD)objc_msgSend(a4, "completionTime")));
          objc_msgSend(a4, "executionDuration");
          v95 = self->_deviceManager;
          goto LABEL_245;
        case 43:
          if (objc_msgSend(a3, "isAirTag"))
          {
            v86 = *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 1, 4), "bytes");
            -[CLDurianDeviceManager setCurrentWildKeyIndex:forDevice:forEvent:](self->_deviceManager, "setCurrentWildKeyIndex:forDevice:forEvent:", v86, a3, CFSTR("rollwild"));
            objc_msgSend(a3, "setLastObservedIndex:", v86);
          }
          if (objc_msgSend(a3, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v87 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v88 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v89 = objc_msgSend(a3, "lastObservedIndex");
              *(_DWORD *)buf = 68289539;
              v254 = 0;
              v255 = 2082;
              v256 = "";
              v257 = 2113;
              v258 = v88;
              v259 = 1026;
              *(_DWORD *)v260 = v89;
              _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeRollWildKey\", \"item\":%{private, location:escape_only}@, \"lastObserved\":%{public}d}", buf, 0x22u);
            }
            -[CLDurianDeviceManager setCurrentWildKeyIndex:forDevice:forEvent:](self->_deviceManager, "setCurrentWildKeyIndex:forDevice:forEvent:", objc_msgSend(a3, "lastObservedIndex"), a3, CFSTR("latchresponse"));
          }
          objc_msgSend(a3, "alignClockWithCurrentIndex:", objc_msgSend(a3, "lastObservedIndex"));
          objc_msgSend(v9, "didRollWildKeyOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        case 45:
          v90 = (unsigned int *)objc_msgSend(objc_msgSend(a5, "payload"), "bytes");
          v91 = v90[2];
          -[CLDurianDeviceManager setWildKeyBase:interval:fallback:forDevice:](self->_deviceManager, "setWildKeyBase:interval:fallback:forDevice:", v90[1], 96, *v90, a3);
          v92 = +[NSDate date](NSDate, "date");
          v93 = mach_continuous_time();
          v94 = -[NSDate dateByAddingTimeInterval:](v92, "dateByAddingTimeInterval:", -TMConvertTicksToSeconds(v93 - (_QWORD)objc_msgSend(a4, "completionTime")));
          objc_msgSend(a4, "executionDuration");
          v95 = self->_deviceManager;
LABEL_245:
          -[CLDurianDeviceManager setAlignmentUncertainty:atIndex:date:forDevice:](v95, "setAlignmentUncertainty:atIndex:date:forDevice:", v91, v94, a3);
          objc_msgSend(v9, "didSetWildModeConfigruationOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
          goto LABEL_18;
        default:
          goto LABEL_18;
      }
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v39 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v41 = objc_msgSend(a4, "translatedOpcode");
      *(_DWORD *)buf = 68289795;
      v254 = 0;
      v255 = 2082;
      v256 = "";
      v257 = 2113;
      v258 = v40;
      v259 = 1025;
      *(_DWORD *)v260 = v41;
      *(_WORD *)&v260[4] = 2113;
      *(_QWORD *)&v260[6] = a4;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v42 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v43 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v44 = objc_msgSend(a4, "translatedOpcode");
      *(_DWORD *)buf = 68289795;
      v254 = 0;
      v255 = 2082;
      v256 = "";
      v257 = 2113;
      v258 = v43;
      v259 = 1025;
      *(_DWORD *)v260 = v44;
      *(_WORD *)&v260[4] = 2113;
      *(_QWORD *)&v260[6] = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye mismatch opcode/task", "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v27 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "#durian didCompleteTask task is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      *(_WORD *)v242 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 2, "#durian didCompleteTask task is nil", v242, 2);
      v29 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLDurianService device:didCompleteTask:withCompletionCommand:]", "%s\n", v28);
      if (v29 != buf)
        free(v29);
    }
  }
}

- (void)device:(id)a3 didFailToCompleteTask:(id)a4 withError:(int64_t)a5 andDisconnect:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  uint64_t v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  id v28;
  const char *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  unsigned __int8 v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  unsigned int v40;
  unsigned int v41;
  NSMutableSet *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *k;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  unsigned int v51;
  unsigned int v52;
  NSMutableSet *clients;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  unsigned int v62;
  unsigned int v63;
  NSMutableSet *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *j;
  id v69;
  NSObject *v70;
  id v71;
  unsigned int v72;
  id v73;
  double v74;
  CLLocation *v75;
  CLLocation *v76;
  double v77;
  double v78;
  _BOOL8 v79;
  id v80;
  unsigned __int8 v81;
  id v82;
  uint64_t v83;
  id v84;
  void *v85;
  NSData *v86;
  uint64_t v87;
  int v88;
  id v89;
  NSData *v90;
  void *v91;
  id v92;
  id v93;
  const __CFString *v94;
  void *v95;
  id v96;
  id v97;
  const __CFString *v98;
  void *v99;
  id v100;
  id v101;
  NSData *v102;
  void *v103;
  id v104;
  id v105;
  NSData *v106;
  void *v107;
  id v108;
  id v109;
  NSData *v110;
  void *v111;
  id v112;
  id v113;
  NSData *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  uint64_t v119;
  id v120;
  id v121;
  NSObject *v122;
  id v123;
  uint64_t v124;
  unsigned int v125;
  NSObject *v126;
  id v127;
  uint64_t v128;
  unsigned int v129;
  NSObject *v130;
  id v131;
  NSData *v132;
  _BOOL4 v133;
  int64_t v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _WORD v148[8];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  NSErrorUserInfoKey v152;
  const __CFString *v153;
  uint8_t buf[4];
  int v155;
  __int16 v156;
  const char *v157;
  __int16 v158;
  id v159;
  __int16 v160;
  _BYTE v161[24];
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  _BOOL4 v165;
  __int16 v166;
  _BOOL4 v167;

  if (a4)
  {
    v6 = a6;
    v135 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", objc_msgSend(a4, "uuid"));
    v11 = objc_alloc((Class)NSError);
    v12 = kCLErrorDomainPrivate;
    v152 = NSLocalizedDescriptionKey;
    v153 = sub_101536DEC(a5);
    v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, a5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
    v14 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v15 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      objc_msgSend(a4, "queueDuration");
      v18 = v17;
      objc_msgSend(a4, "executionDuration");
      *(_DWORD *)buf = 68290819;
      v155 = 0;
      v156 = 2082;
      v157 = "";
      v158 = 2113;
      v159 = v16;
      v160 = 1025;
      *(_DWORD *)v161 = v14;
      *(_WORD *)&v161[4] = 2113;
      *(_QWORD *)&v161[6] = a4;
      *(_WORD *)&v161[14] = 2050;
      *(_QWORD *)&v161[16] = v18;
      v162 = 2050;
      v163 = v19;
      v164 = 1025;
      v165 = v135 != 0;
      v166 = 1026;
      v167 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"client\":%{private}hhd, \"disconnect\":%{public}hhd}", buf, 0x4Cu);
    }
    if (objc_msgSend(a3, "pendingDisconnect")
      && objc_msgSend(a3, "isTaskQueueEmpty")
      && !v6)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v21 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v155 = 0;
        v156 = 2082;
        v157 = "";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device pending disconnection finished all tasks, scheduling for disconnection\"}", buf, 0x12u);
      }
      -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self->_deviceManager, "scheduleDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(a3, "uuid"));
    }
    if (v14 != 208
      || (v22 = objc_opt_class(CLHawkeyeTask, v20), (objc_opt_isKindOfClass(a4, v22) & 1) != 0))
    {
      v134 = a5;
      v133 = v6;
      if (!objc_msgSend(a3, "isPoshAccessory"))
      {
        if (v14 <= 173)
        {
          switch(v14)
          {
            case 1:
LABEL_55:
              objc_msgSend(v135, "didInitRangingOnTag:withStatus:error:", objc_msgSend(a3, "uuid"), 0, v13);
              break;
            case 3:
LABEL_67:
              v35 = objc_msgSend(a3, "isRanging");
              v36 = objc_msgSend(a3, "uuid");
              if ((v35 & 1) != 0)
                objc_msgSend(v135, "didCompleteRangingOnTag:withStatus:endReason:error:", v36, 0, 0, v13);
              else
                objc_msgSend(v135, "didStartRangingOnTag:error:", v36, v13);
              break;
            case 6:
LABEL_69:
              objc_msgSend(v135, "didDeinitRangingOnTag:withStatus:error:", objc_msgSend(a3, "uuid"), 0, v13);
              break;
            case 8:
              objc_msgSend(v135, "didStopPlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 10:
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v70 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v71 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                v72 = objc_msgSend(a3, "leashState");
                v73 = objc_msgSend(a3, "lastAlertDate");
                *(_DWORD *)buf = 68289795;
                v155 = 0;
                v156 = 2082;
                v157 = "";
                v158 = 2113;
                v159 = v71;
                v160 = 1025;
                *(_DWORD *)v161 = v72;
                *(_WORD *)&v161[4] = 2113;
                *(_QWORD *)&v161[6] = v73;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian leash break\", \"item\":%{private, location:escape_only}@, \"leashstate\":%{private}d, \"last\":%{private, location:escape_only}@}", buf, 0x2Cu);
              }
              if (objc_msgSend(a3, "isLeashSlotInUse"))
              {
                if (!objc_msgSend(a3, "lastAlertDate")
                  || (-[NSDate timeIntervalSinceDate:](+[NSDate now](NSDate, "now"), "timeIntervalSinceDate:", objc_msgSend(a3, "lastAlertDate")), fabs(v74) > 60.0))
                {
                  objc_msgSend(a3, "setLastAlertDate:", +[NSDate now](NSDate, "now"));
                  v75 = -[CLDurianDeviceManager lastLocation](self->_deviceManager, "lastLocation");
                  v79 = 0;
                  if (v75)
                  {
                    v76 = v75;
                    -[CLLocation horizontalAccuracy](v75, "horizontalAccuracy");
                    if (v77 <= 65.0)
                    {
                      -[NSDate timeIntervalSinceNow](-[CLLocation timestamp](v76, "timestamp"), "timeIntervalSinceNow");
                      if (fabs(v78) <= 30.0)
                        v79 = 1;
                    }
                  }
                  -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self->_deviceManager, "sendSeparationStateForDevice:state:includeLocation:", a3, SPTagSeparationStateLeashFailed, v79);
                }
              }
              break;
            case 12:
              objc_msgSend(v135, "didGetMultiStatus:forTag:withError:", 0, objc_msgSend(a3, "uuid"), v13);
              break;
            case 13:
              objc_msgSend(v135, "didSetObfuscatedIdentifierOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 15:
              objc_msgSend(v135, "didSetNearOwnerTimeoutOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 18:
LABEL_187:
              v112 = objc_msgSend(a3, "uuid");
              v111 = v135;
              v110 = 0;
LABEL_188:
              objc_msgSend(v111, "didFetchFirmwareVersion:fromTag:withError:", v110, v112, v13);
              break;
            case 19:
              objc_msgSend(v135, "didUnpairFromTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 21:
LABEL_66:
              objc_msgSend(v135, "didConfigureRangingOnTag:withStatus:error:", objc_msgSend(a3, "uuid"), 0, v13);
              break;
            case 23:
            case 25:
              objc_msgSend(v135, "didFetchUserStats:fromTag:withError:", 0, objc_msgSend(a3, "uuid"), v13);
              break;
            case 24:
              objc_msgSend(v135, "didFetchUserStats_Deprecated:fromTag:withError:", 0, objc_msgSend(a3, "uuid"), v13);
              break;
            case 32:
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
              v27 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v80 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v155 = 0;
                v156 = 2082;
                v157 = "";
                v158 = 2113;
                v159 = v80;
                v29 = "{\"msg%{public}.0s\":\"#durian abortfwdl failed to complete\", \"item\":%{private, location:escape_only}@}";
LABEL_143:
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0x1Cu);
              }
              break;
            case 38:
              objc_msgSend(v135, "didSetTagTypeOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 40:
              v81 = objc_msgSend(a3, "isPlayingSound");
              v82 = objc_msgSend(a3, "uuid");
              if ((v81 & 1) != 0)
                objc_msgSend(v135, "didCompletePlayingSoundOnTag:withError:", v82, v13);
              else
                objc_msgSend(v135, "didStartPlayingSoundOnTag:withError:", v82, v13);
              break;
            case 42:
            case 45:
              objc_msgSend(v135, "didSetWildModeConfigruationOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            case 43:
              objc_msgSend(v135, "didRollWildKeyOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
              break;
            default:
              goto LABEL_85;
          }
          goto LABEL_85;
        }
        switch(v14)
        {
          case 174:
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v27 = qword_1022A0038;
            if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              break;
            v28 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289283;
            v155 = 0;
            v156 = 2082;
            v157 = "";
            v158 = 2113;
            v159 = v28;
            v29 = "{\"msg%{public}.0s\":\"#durian failed to fetch current key index\", \"item\":%{private, location:escape_only}@}";
            goto LABEL_143;
          case 175:
LABEL_117:
            if ((objc_msgSend(a3, "isPlayingSound") & 1) != 0)
            {
              v69 = objc_msgSend(a3, "uuid");
              if (a5 == 5)
              {
                objc_msgSend(v135, "didCompletePlayingUnauthorizedSoundOnTag:withError:", v69, 0);
                -[CLTrackingAvoidanceServiceProtocol didSuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didSuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "addressFromUnknownBeacon"));
                break;
              }
              objc_msgSend(v135, "didCompletePlayingUnauthorizedSoundOnTag:withError:", v69, v13);
            }
            else
            {
              objc_msgSend(v135, "didStartPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
            }
            -[CLTrackingAvoidanceServiceProtocol didUnsuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didUnsuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "addressFromUnknownBeacon"));
            break;
          case 176:
          case 177:
          case 178:
          case 179:
          case 181:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 187:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 196:
          case 197:
          case 198:
          case 204:
          case 205:
          case 206:
          case 207:
            break;
          case 180:
            v83 = *((unsigned __int8 *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "bytes") + 1);
            v84 = objc_msgSend(a3, "uuid");
            v85 = v135;
            v86 = 0;
            v87 = v83;
            goto LABEL_149;
          case 195:
            objc_msgSend(v135, "didSetUnauthorizedPlaySoundRateLimitFromTag:error:", objc_msgSend(a3, "uuid"), v13);
            break;
          case 199:
            objc_msgSend(v135, "didSetAccelerometerSlopeModeConfigurationOnTag:error:", objc_msgSend(a3, "uuid"), v13);
            break;
          case 200:
            objc_msgSend(v135, "didSetAccelerometerOrientationModeConfigurationOnTag:error:", objc_msgSend(a3, "uuid"), v13);
            break;
          case 201:
            objc_msgSend(v135, "didFetchAccelerometerSlopeModeConfiguration:onTag:error:", 0, objc_msgSend(a3, "uuid"), v13);
            break;
          case 202:
            objc_msgSend(v135, "didFetchAccelerometerOrientationModeConfiguration:onTag:error:", 0, objc_msgSend(a3, "uuid"), v13);
            break;
          case 203:
            objc_msgSend(v135, "didFetchAccelerometerMode:onTag:error:", 0, objc_msgSend(a3, "uuid"), v13);
            break;
          case 208:
            v88 = objc_msgSend(a4, "hawkeyeOpcode");
            if (v88 <= 771)
            {
              switch(v88)
              {
                case 527:
                  v120 = objc_msgSend(a3, "btFindingState");
                  v121 = objc_msgSend(a3, "uuid");
                  if (v120 == (id)2)
                    objc_msgSend(v135, "didCompleteAggressiveAdvertisingOnDevice:withError:", v121, v13);
                  else
                    objc_msgSend(v135, "didStartAggressiveAdvertisingOnDevice:withError:", v121, v13);
                  goto LABEL_85;
                case 528:
                  objc_msgSend(v135, "didStopAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), v13);
                  goto LABEL_85;
                case 529:
                  goto LABEL_189;
                case 530:
                case 531:
                case 532:
                case 533:
                case 534:
                case 535:
                case 536:
                case 539:
                case 540:
                  goto LABEL_203;
                case 537:
                case 541:
                  goto LABEL_85;
                case 538:
                  goto LABEL_187;
                default:
                  if (v88 == 517)
                    goto LABEL_85;
                  if (v88 != 551)
                    goto LABEL_203;
                  objc_msgSend(v135, "didReceiveGroupRelationStatus:maintenanceStatus:onTag:withError:", 255, 255, objc_msgSend(a3, "uuid"), v13);
                  break;
              }
            }
            else
            {
              if (v88 > 1023)
              {
                if (v88 <= 1027)
                {
                  if (v88 == 1024)
                  {
                    objc_msgSend(v135, "didFetchHawkeyeCurrentPrimaryKeyFromDevice:currentPrimaryKey:error:", objc_msgSend(a3, "uuid"), +[NSData data](NSData, "data"), v13);
                    break;
                  }
                  if (v88 == 1025)
                  {
                    objc_msgSend(v135, "didFetchHawkeyeiCloudIdentifierFromDevice:iCloudIdentifier:error:", objc_msgSend(a3, "uuid"), +[NSData data](NSData, "data"), v13);
                    break;
                  }
                }
                else
                {
                  switch(v88)
                  {
                    case 1285:
                      objc_msgSend(v135, "didSetHawkeyeUTMotionConfigForDevice:withError:", objc_msgSend(a3, "uuid"), v13);
                      goto LABEL_85;
                    case 1281:
                      if (qword_1022A0030 != -1)
                        dispatch_once(&qword_1022A0030, &stru_1021BC278);
                      v130 = qword_1022A0038;
                      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      {
                        v131 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                        *(_DWORD *)buf = 68289283;
                        v155 = 0;
                        v156 = 2082;
                        v157 = "";
                        v158 = 2113;
                        v159 = v131;
                        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye log final fail\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      }
                      v132 = +[NSData data](NSData, "data");
                      v84 = objc_msgSend(a3, "uuid");
                      v85 = v135;
                      v86 = v132;
                      v87 = 4;
LABEL_149:
                      objc_msgSend(v85, "didDumpLogs:ofType:fromTag:withError:", v86, v87, v84, v13);
                      goto LABEL_85;
                    case 1028:
                      objc_msgSend(v135, "didFetchHawkeyeSerialNumberFromDevice:serialNumber:error:", objc_msgSend(a3, "uuid"), +[NSData data](NSData, "data"), v13);
                      goto LABEL_85;
                  }
                }
LABEL_203:
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC278);
                v122 = qword_1022A0038;
                if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
                {
                  v123 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                  v124 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
                  v125 = objc_msgSend(a4, "hawkeyeOpcode");
                  *(_DWORD *)buf = 68289795;
                  v155 = 0;
                  v156 = 2082;
                  v157 = "";
                  v158 = 2113;
                  v159 = v123;
                  v160 = 2049;
                  *(_QWORD *)v161 = v124;
                  *(_WORD *)&v161[8] = 2049;
                  *(_QWORD *)&v161[10] = v125;
                  _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didFail hawkeye task\", \"item\":%{private, location:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}", buf, 0x30u);
                  if (qword_1022A0030 != -1)
                    dispatch_once(&qword_1022A0030, &stru_1021BC278);
                }
                v126 = qword_1022A0038;
                if (os_signpost_enabled((os_log_t)qword_1022A0038))
                {
                  v127 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                  v128 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
                  v129 = objc_msgSend(a4, "hawkeyeOpcode");
                  *(_DWORD *)buf = 68289795;
                  v155 = 0;
                  v156 = 2082;
                  v157 = "";
                  v158 = 2113;
                  v159 = v127;
                  v160 = 2049;
                  *(_QWORD *)v161 = v128;
                  *(_WORD *)&v161[8] = 2049;
                  *(_QWORD *)&v161[10] = v129;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v126, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unhandled didFail hawkeye task", "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didFail hawkeye task\", \"item\":%{private, location:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}", buf, 0x30u);
                }
                break;
              }
              switch(v88)
              {
                case 772:
                  objc_msgSend(v135, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), v13);
                  break;
                case 773:
                  goto LABEL_189;
                case 774:
                  v92 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
                  v91 = v135;
                  v90 = 0;
                  goto LABEL_162;
                case 775:
                  v96 = objc_msgSend(a3, "uuid");
                  v94 = &stru_1021D8FB8;
                  v95 = v135;
                  goto LABEL_164;
                case 776:
                  v100 = objc_msgSend(a3, "uuid");
                  v98 = &stru_1021D8FB8;
                  v99 = v135;
                  goto LABEL_166;
                case 777:
                  v104 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
                  v103 = v135;
                  v102 = 0;
                  goto LABEL_169;
                case 778:
                  v108 = objc_msgSend(a3, "uuid");
                  v107 = v135;
                  v106 = 0;
                  goto LABEL_171;
                case 779:
                  goto LABEL_187;
                case 780:
                  goto LABEL_160;
                case 781:
                  v116 = objc_msgSend(a3, "uuid");
                  v115 = v135;
                  v114 = 0;
                  goto LABEL_174;
                case 782:
                  v117 = objc_msgSend(a3, "uuid");
                  v118 = v135;
                  v119 = 0;
                  goto LABEL_176;
                default:
                  goto LABEL_203;
              }
            }
            break;
          case 209:
            v89 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v90 = +[NSData data](NSData, "data");
            v91 = v135;
            v92 = v89;
LABEL_162:
            objc_msgSend(v91, "didFetchHawkeyeAISProductDataFromDevice:productData:error:", v92, v90, v13);
            break;
          case 210:
            v93 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v94 = +[NSString string](NSString, "string");
            v95 = v135;
            v96 = v93;
LABEL_164:
            objc_msgSend(v95, "didFetchHawkeyeAISManufacturerNameFromDevice:manufacturerName:error:", v96, v94, v13);
            break;
          case 211:
            v97 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v98 = +[NSString string](NSString, "string");
            v99 = v135;
            v100 = v97;
LABEL_166:
            objc_msgSend(v99, "didFetchHawkeyeAISModelNameFromDevice:modelName:error:", v100, v98, v13);
            break;
          case 212:
            objc_msgSend(v135, "didFetchHawkeyeAISModelColorCodeFromDevice:modelColorCode:error:", objc_msgSend(a3, "uuid"), +[NSData data](NSData, "data"), v13);
            break;
          case 213:
            v101 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v102 = +[NSData data](NSData, "data");
            v103 = v135;
            v104 = v101;
LABEL_169:
            objc_msgSend(v103, "didFetchHawkeyeAISAccessoryCategoryFromDevice:accessoryCategory:error:", v104, v102, v13);
            break;
          case 214:
            v105 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v106 = +[NSData data](NSData, "data");
            v107 = v135;
            v108 = v105;
LABEL_171:
            objc_msgSend(v107, "didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", v108, v106, v13);
            break;
          case 215:
            v109 = -[CLDurianService getDeviceUUID:](self, "getDeviceUUID:", a3);
            v110 = +[NSData data](NSData, "data");
            v111 = v135;
            v112 = v109;
            goto LABEL_188;
          case 216:
LABEL_160:
            objc_msgSend(v135, "didFetchHawkeyeAISFindMyVersionFromDevice:findMyVersion:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 217:
            v113 = objc_msgSend(a3, "uuid");
            v114 = +[NSData data](NSData, "data");
            v115 = v135;
            v116 = v113;
LABEL_174:
            objc_msgSend(v115, "didFetchHawkeyeAISBatteryTypeFromDevice:batteryType:error:", v116, v114, v13);
            break;
          case 218:
            v117 = objc_msgSend(a3, "uuid");
            v118 = v135;
            v119 = 4;
LABEL_176:
            objc_msgSend(v118, "didFetchBatteryStatus:fromTag:withError:", v119, v117, v13);
            break;
          case 219:
            -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", a3, v13);
            break;
          case 220:
            if (objc_msgSend(a3, "isHawkeyeAccessory"))
              objc_msgSend(v135, "didStopPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
            break;
          case 221:
LABEL_189:
            objc_msgSend(v135, "didFetchTxPower:fromDevice:withError:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), objc_msgSend(a3, "uuid"), v13);
            break;
          default:
            switch(v14)
            {
              case 2049:
                goto LABEL_55;
              case 2050:
                goto LABEL_66;
              case 2051:
                goto LABEL_67;
              case 2052:
                goto LABEL_85;
              case 2053:
                goto LABEL_69;
              default:
                if (v14 == 2061)
                  goto LABEL_117;
                break;
            }
            break;
        }
LABEL_85:
        if (objc_msgSend(a3, "isHawkeyeAccessory"))
        {
          v48 = objc_opt_class(CLHawkeyeTask, v47);
          if ((objc_opt_isKindOfClass(a4, v48) & 1) != 0)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v49 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v50 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v51 = objc_msgSend(a4, "hawkeyeOpcode");
              v52 = -[NSMutableSet count](self->_clients, "count");
              *(_DWORD *)buf = 68289795;
              v155 = 0;
              v156 = 2082;
              v157 = "";
              v158 = 2113;
              v159 = v50;
              v160 = 1025;
              *(_DWORD *)v161 = v51;
              *(_WORD *)&v161[4] = 1026;
              *(_DWORD *)&v161[6] = v52;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            v142 = 0u;
            v143 = 0u;
            v140 = 0u;
            v141 = 0u;
            clients = self->_clients;
            v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v141;
              do
              {
                for (i = 0; i != v55; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v141 != v56)
                    objc_enumerationMutation(clients);
                  objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)i), "didCompleteHawkeyeTaskWithOpcode:fromDevice:withError:", objc_msgSend(a4, "hawkeyeOpcode"), objc_msgSend(a3, "uuid"), v13);
                }
                v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
              }
              while (v55);
            }
          }
        }
        if (objc_msgSend(a3, "isAirTag"))
        {
          v59 = objc_opt_class(CLDurianGATTWriteTask, v58);
          if ((objc_opt_isKindOfClass(a4, v59) & 1) != 0)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v60 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v61 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v62 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
              v63 = -[NSMutableSet count](self->_clients, "count");
              *(_DWORD *)buf = 68289795;
              v155 = 0;
              v156 = 2082;
              v157 = "";
              v158 = 2113;
              v159 = v61;
              v160 = 1025;
              *(_DWORD *)v161 = v62;
              *(_WORD *)&v161[4] = 1026;
              *(_DWORD *)&v161[6] = v63;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            v138 = 0u;
            v139 = 0u;
            v136 = 0u;
            v137 = 0u;
            v64 = self->_clients;
            v65 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
            if (v65)
            {
              v66 = v65;
              v67 = *(_QWORD *)v137;
              do
              {
                for (j = 0; j != v66; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v137 != v67)
                    objc_enumerationMutation(v64);
                  objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)j), "didCompleteHawkeyeTaskWithOpcode:fromDevice:withError:", objc_msgSend(objc_msgSend(a4, "command"), "opcode"), objc_msgSend(a3, "uuid"), v13);
                }
                v66 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
              }
              while (v66);
            }
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_taskClientMap, "removeObjectForKey:", objc_msgSend(a4, "uuid"));
        -[NSMutableDictionary removeObjectForKey:](self->_pendingTaskMap, "removeObjectForKey:", objc_msgSend(a4, "uuid"));
        if (objc_msgSend(a3, "activePeripheral"))
        {
          if (v133)
          {
            objc_msgSend(a3, "setDisconnectionReason:", CFSTR("TaskFailed"));
            -[CLDurianDeviceManager disconnectDevice:](self->_deviceManager, "disconnectDevice:", a3);
            objc_msgSend(a3, "resetLeashState");
          }
        }
        -[CLDurianMetricManager submitTaskMetricsForDevice:task:completed:errorCode:](self->_metricManager, "submitTaskMetricsForDevice:task:completed:errorCode:", a3, a4, 0, v134);
        return;
      }
      if (v14 <= 767)
      {
        switch(v14)
        {
          case 3:
            objc_msgSend(v135, "didFetchAISProductDataFromDevice:productData:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 4:
            objc_msgSend(v135, "didFetchAISManufacturerNameFromDevice:manufacturerName:error:", objc_msgSend(a3, "uuid"), &stru_1021D8FB8, v13);
            break;
          case 5:
            objc_msgSend(v135, "didFetchAISModelNameFromDevice:modelName:error:", objc_msgSend(a3, "uuid"), &stru_1021D8FB8, v13);
            break;
          case 6:
            objc_msgSend(v135, "didFetchAISAccessoryCategoryFromDevice:accessoryCategory:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 7:
            objc_msgSend(v135, "didFetchAISProtocolImplementationFromDevice:protocolImplementation:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 8:
            objc_msgSend(v135, "didFetchAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 9:
            objc_msgSend(v135, "didFetchAISNetworkIDFromDevice:networkID:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 10:
            objc_msgSend(v135, "didFetchAISFirmwareVersionFromDevice:firmwareVersion:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 11:
            objc_msgSend(v135, "didFetchAISBatteryTypeFromDevice:batteryType:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          case 12:
            objc_msgSend(v135, "didFetchAISBatteryLevelFromDevice:batteryLevel:error:", objc_msgSend(a3, "uuid"), 0, v13);
            break;
          default:
            goto LABEL_73;
        }
        goto LABEL_73;
      }
      if (v14 > 793)
      {
        if (v14 != 794)
        {
          if (v14 == 1028)
            objc_msgSend(v135, "didFetchAISSerialNumberFromDevice:serialNumber:error:", objc_msgSend(a3, "uuid"), 0, v13);
          goto LABEL_73;
        }
      }
      else if (v14 != 768)
      {
        if (v14 == 772)
          objc_msgSend(v135, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", objc_msgSend(a3, "uuid"), v13);
        goto LABEL_73;
      }
      if ((objc_msgSend(a3, "isPlayingSound") & 1) != 0)
      {
        v34 = objc_msgSend(a3, "uuid");
        if (a5 == 5)
        {
          objc_msgSend(v135, "didCompletePlayingUnauthorizedSoundOnTag:withError:", v34, 0);
          -[CLTrackingAvoidanceServiceProtocol didSuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didSuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "addressFromUnknownBeacon"));
          goto LABEL_73;
        }
        objc_msgSend(v135, "didCompletePlayingUnauthorizedSoundOnTag:withError:", v34, v13);
      }
      else
      {
        objc_msgSend(v135, "didStartPlayingUnauthorizedSoundOnTag:withError:", objc_msgSend(a3, "uuid"), v13);
      }
      -[CLTrackingAvoidanceServiceProtocol didUnsuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didUnsuccessfullyPlayUnauthorizedSound:address:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "addressFromUnknownBeacon"));
LABEL_73:
      v37 = objc_opt_class(CLDurianGATTWriteTask, v23);
      if ((objc_opt_isKindOfClass(a4, v37) & 1) != 0)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC278);
        v38 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v39 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
          v40 = objc_msgSend(objc_msgSend(a4, "command"), "opcode");
          v41 = -[NSMutableSet count](self->_clients, "count");
          *(_DWORD *)buf = 68289795;
          v155 = 0;
          v156 = 2082;
          v157 = "";
          v158 = 2113;
          v159 = v39;
          v160 = 1025;
          *(_DWORD *)v161 = v40;
          *(_WORD *)&v161[4] = 1026;
          *(_DWORD *)&v161[6] = v41;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
        }
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v42 = self->_clients;
        v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v145;
          do
          {
            for (k = 0; k != v44; k = (char *)k + 1)
            {
              if (*(_QWORD *)v145 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)k), "didCompleteHawkeyeTaskWithOpcode:fromDevice:withError:", objc_msgSend(objc_msgSend(a4, "command"), "opcode"), objc_msgSend(a3, "uuid"), v13);
            }
            v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
          }
          while (v44);
        }
      }
      goto LABEL_85;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v30 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289795;
      v155 = 0;
      v156 = 2082;
      v157 = "";
      v158 = 2113;
      v159 = v31;
      v160 = 1025;
      *(_DWORD *)v161 = 208;
      *(_WORD *)&v161[4] = 2113;
      *(_QWORD *)&v161[6] = a4;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v32 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v33 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289795;
      v155 = 0;
      v156 = 2082;
      v157 = "";
      v158 = 2113;
      v159 = v33;
      v160 = 1025;
      *(_DWORD *)v161 = 208;
      *(_WORD *)&v161[4] = 2113;
      *(_QWORD *)&v161[6] = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye mismatch opcode/task", "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v24 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#durian didFailToCompleteTask task is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v148[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 2, "#durian didFailToCompleteTask task is nil", v148, 2);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLDurianService device:didFailToCompleteTask:withError:andDisconnect:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
  }
}

- (id)getDeviceUUID:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "uuid");
  if (objc_msgSend(a3, "taUnknownBeacon"))
    return objc_msgSend(objc_msgSend(a3, "taUnknownBeacon"), "identifier");
  else
    return v4;
}

- (void)device:(id)a3 didReceiveInvalidDataWithError:(int64_t)a4
{
  if (objc_msgSend(a3, "activePeripheral"))
  {
    objc_msgSend(a3, "setDisconnectionReason:", CFSTR("InvalidRxData"));
    -[CLDurianDeviceManager disconnectDevice:](self->_deviceManager, "disconnectDevice:", a3);
    objc_msgSend(a3, "resetLeashState");
  }
}

- (void)device:(id)a3 checkForEchoOfOpcode:(unsigned __int16)a4 fromAck:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  unsigned int v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t buf;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;

  v5 = a5;
  v6 = a4;
  v9 = a4 == 40 && a5;
  v10 = a4 == 40 && !a5;
  v11 = a4 != 8 && v9;
  if (a4 == 8)
    v12 = !a5;
  else
    v12 = v10;
  v13 = a4 == 8 || a4 == 40;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v13;
    v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v16 = -[NSMutableSet count](self->_clients, "count");
    buf = 68290819;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = v15;
    v34 = 1025;
    v35 = v6;
    v36 = 1025;
    v37 = v5;
    v38 = 1026;
    v39 = v23;
    v40 = 1025;
    v41 = v16;
    v42 = 1025;
    v43 = v11;
    v44 = 1025;
    v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian opcode echo\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"ack\":%{private}d, \"multi\":%{public}d, \"clients\":%{private}d, \"soundstart\":%{private}d, \"soundcomplete\":%{private}d}", (uint8_t *)&buf, 0x40u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = -[NSMutableSet allObjects](self->_clients, "allObjects");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (v11)
          objc_msgSend(v22, "didStartPlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
        if (v12)
          objc_msgSend(v22, "didCompletePlayingSoundOnTag:withError:", objc_msgSend(a3, "uuid"), 0);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }
}

- (void)device:(id)a3 didReceiveKeyRollIndex:(unsigned int)a4
{
  uint64_t v4;
  NSMutableSet *clients;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = *(_QWORD *)&a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  clients = self->_clients;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "didReceiveKeyRollIndex:onTag:", v4, objc_msgSend(a3, "uuid"));
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)device:(id)a3 didReceiveGroupRelationStatus:(unsigned __int8)a4 andMainteanceStatus:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  NSMutableSet *clients;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a5;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  clients = self->_clients;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "didReceiveGroupRelationStatus:maintenanceStatus:onTag:withError:", v6, v5, objc_msgSend(a3, "uuid"), 0);
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (void)device:(id)a3 didReceiveRangingResponse:(id)a4 withOpcode:(unsigned __int16)a5
{
  uint64_t v5;
  id v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;

  v5 = a5;
  v9 = 0;
  if (a5 != 20 && a5 != 2060)
  {
    if (!objc_msgSend(objc_msgSend(a4, "payload", a3, 0), "length"))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 68289539;
        v11[1] = 0;
        v12 = 2082;
        v13 = "";
        v14 = 2113;
        v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v16 = 1026;
        v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian payload is empty\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)v11, 0x22u);
      }
      return;
    }
    if ((_DWORD)v5 == 2060)
      goto LABEL_18;
    v9 = objc_msgSend(objc_msgSend(a4, "payload"), "bytes");
  }
  if ((int)v5 <= 1801)
  {
    if ((int)v5 > 35)
    {
      if ((_DWORD)v5 == 36 || (_DWORD)v5 == 1801)
        goto LABEL_28;
    }
    else
    {
      if ((_DWORD)v5 == 20)
        goto LABEL_18;
      if ((_DWORD)v5 == 34)
        goto LABEL_19;
    }
  }
  else
  {
    if ((int)v5 > 2056)
    {
      if ((_DWORD)v5 != 2057)
      {
        if ((_DWORD)v5 != 2060)
        {
          if ((_DWORD)v5 != 2058)
            return;
LABEL_19:
          objc_msgSend(a3, "getRangingStatusForOpcode:data:", v5, v9);
          -[CLDurianClientProtocol didReceiveRangingErrorFromTag:withStatus:](self->_activeRangingClient, "didReceiveRangingErrorFromTag:withStatus:", objc_msgSend(a3, "uuid"));
          return;
        }
LABEL_18:
        -[CLDurianClientProtocol didHaveRangingMovementOnTag:](self->_activeRangingClient, "didHaveRangingMovementOnTag:", objc_msgSend(a3, "uuid"));
        return;
      }
LABEL_28:
      objc_msgSend(objc_msgSend(a4, "payload"), "bytes");
      -[CLDurianClientProtocol didReceiveRangingTimestampsFromTag:eventStatus:rtt:tat:cycleIndex:](self->_activeRangingClient, "didReceiveRangingTimestampsFromTag:eventStatus:rtt:tat:cycleIndex:", objc_msgSend(a3, "uuid"));
      return;
    }
    if ((_DWORD)v5 == 1802)
      goto LABEL_19;
    if ((_DWORD)v5 == 1804)
      goto LABEL_18;
  }
}

- (void)requestDisconnectionForDevice:(id)a3
{
  -[CLDurianDeviceManager requestDisconnectionForDevice:](self->_deviceManager, "requestDisconnectionForDevice:", a3);
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
  -[CLDurianDeviceManager cancelConnectionTimeoutForPeripheral:](self->_deviceManager, "cancelConnectionTimeoutForPeripheral:", a3);
}

- (void)didRetrievePersonalizationInfo:(id)a3 forDevice:(id)a4 error:(id)a5
{
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68290051;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    v15 = 2113;
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    v17 = 2113;
    v18 = a3;
    v19 = 2113;
    v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Durian Service, notify client - didRetrievePersonalizationInfo\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"info\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x3Au);
  }
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_firmwareUpdateClientMap, "objectForKeyedSubscript:", objc_msgSend(a4, "uuid")), "didRetrievePersonalizationInformation:forTag:error:", a3, objc_msgSend(a4, "uuid"), a5);
  if (a5)
  {
    if (objc_msgSend(a4, "activePeripheral"))
      -[CLDurianDeviceManager scheduleConnectionEvaluationForDevice:](self->_deviceManager, "scheduleConnectionEvaluationForDevice:", a4);
  }
}

- (void)didUpdateFirmwareForDevice:(id)a3 error:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289795;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v16 = 2113;
    v17 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    v18 = 2113;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Durian Service, notify client - didUpdateFirmwareForDevice\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x30u);
  }
  if (+[CLDurianSettings uarpPacketCaptureEnabled](CLDurianSettings, "uarpPacketCaptureEnabled"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate didUpdateFirmwareForDevice - stopping UARP Packet Capture\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
    -[UARPController stopPacketCapture](self->_uarpController, "stopPacketCapture");
  }
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_firmwareUpdateClientMap, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid")), "didUpdateFirmwareForTag:error:", objc_msgSend(a3, "uuid"), a4);
  -[NSMutableArray removeObject:](self->_devicesUndergoingFirmwareUpdate, "removeObject:", objc_msgSend(a3, "uuid"));
  -[NSMutableDictionary removeObjectForKey:](self->_firmwareUpdateClientMap, "removeObjectForKey:", objc_msgSend(a3, "uuid"));
  if (objc_msgSend(a3, "activePeripheral"))
    -[CLDurianDeviceManager scheduleConnectionEvaluationForDevice:](self->_deviceManager, "scheduleConnectionEvaluationForDevice:", a3);
}

- (void)didReceiveUarpMessage:(id)a3 fromDevice:(id)a4
{
  NSObject *v7;
  NSMutableArray *devicesUndergoingFirmwareUpdate;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t buf;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289539;
    v21 = 2082;
    v22 = "";
    v23 = 2113;
    v24 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    v25 = 2113;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - got UARP message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  devicesUndergoingFirmwareUpdate = self->_devicesUndergoingFirmwareUpdate;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesUndergoingFirmwareUpdate, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(devicesUndergoingFirmwareUpdate);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "isEqual:", objc_msgSend(a4, "uuid")))
        {
          -[UARPController recvDataFromAccessory:data:error:](self->_uarpController, "recvDataFromAccessory:data:error:", -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a4), a3, 0);
          return;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesUndergoingFirmwareUpdate, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    buf = 68289283;
    v21 = 2082;
    v22 = "";
    v23 = 2113;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - received random UARP message when not doing firmware update from accessory\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
}

- (void)requestDiscoveryScan
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requestDiscoveryScan\"}", (uint8_t *)v4, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
    -[CLAvengerScannerClient performTemporaryAggressiveScan](self->_scannerClient, "performTemporaryAggressiveScan");
  else
    -[CLAvengerScannerServiceProtocol performTemporaryAggressiveScan:](self->_avengerScannerProxy, "performTemporaryAggressiveScan:", CLISP_ME_TOKEN);
}

- (double)getLastCarScanTime
{
  return self->_carLastScanned;
}

- (void)sendConnectionMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitConnectionMetrics:forDevice:](self->_metricManager, "submitConnectionMetrics:forDevice:", a3, a4);
}

- (void)sendFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitFirmwareUpdateMetrics:forDevice:](self->_metricManager, "submitFirmwareUpdateMetrics:forDevice:", a3, a4);
}

- (void)startMonitoringDeviceForFirmwareUpdate:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSString *v8;
  id v9;
  NSObject *v10;
  int *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSString *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSURL *v25;
  id v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;

  if (objc_msgSend(a3, "isCapableOfFirmwareUpdate"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring Apple manufactured Hawkeye accessory for UARP firmware updates\"}", buf, 0x12u);
    }
  }
  else if (!-[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3))
  {
    v6 = +[NSString convertToHexString:](NSString, "convertToHexString:", objc_msgSend(objc_msgSend(a3, "beacon"), "vendorId"));
    v7 = +[NSString convertToHexString:](NSString, "convertToHexString:", objc_msgSend(objc_msgSend(a3, "beacon"), "productId"));
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
    v9 = objc_msgSend(objc_alloc((Class)UARPAccessory), "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:", objc_msgSend(objc_msgSend(a3, "beacon"), "manufacturerName"), objc_msgSend(objc_msgSend(a3, "beacon"), "modelName"), objc_msgSend(objc_msgSend(a3, "beacon"), "serialNumber"), objc_msgSend(objc_msgSend(a3, "beacon"), "systemVersion"), v6, v7);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v10 = qword_1022A0038;
    v11 = &OBJC_IVAR___CLPencilStateAdapter__pencilState;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v32 = objc_msgSend(objc_msgSend(a3, "beacon"), "manufacturerName");
      v31 = objc_msgSend(objc_msgSend(a3, "beacon"), "modelName");
      v12 = objc_msgSend(objc_msgSend(a3, "beacon"), "serialNumber");
      v13 = objc_msgSend(objc_msgSend(a3, "beacon"), "systemVersion");
      v30 = objc_msgSend(v6, "UTF8String");
      v14 = objc_msgSend(v7, "UTF8String");
      v15 = -[NSString UTF8String](v8, "UTF8String");
      v16 = v9;
      v17 = v8;
      v18 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v8), "UTF8String");
      v19 = UARPAssetLocationTypeToString(self->_assetLocationType);
      *(_DWORD *)buf = 68291587;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2113;
      v39 = v33;
      v40 = 2113;
      v41 = v32;
      v42 = 2113;
      v43 = v31;
      v44 = 2113;
      v45 = v12;
      v46 = 2113;
      v47 = v13;
      v48 = 2081;
      v49 = v30;
      v50 = 2081;
      v51 = v14;
      v52 = 2081;
      v53 = v15;
      v11 = &OBJC_IVAR___CLPencilStateAdapter__pencilState;
      v54 = 2081;
      v55 = v18;
      v8 = v17;
      v9 = v16;
      v56 = 2081;
      v57 = v19;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Start monitoring device with detailed information for firmware updates\", \"item\":%{private, location:escape_only}@, \"manufacturer\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@, \"serialNumber\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@, \"productGroup\":%{private, location:escape_only}s, \"productNumber\":%{private, location:escape_only}s, \"productInfo\":%{private, location:escape_only}s, \"user provided asset\":%{private, location:escape_only}s, \"assetLocationType\":%{private, location:escape_only}s}", buf, 0x76u);
    }
    objc_msgSend(v9, "setUuid:", objc_msgSend(a3, "uuid"));
    objc_msgSend(v9, "setTransport:", 3);
    if (self->_runningFindMyCertificationAssistant
      && -[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v8))
    {
      v20 = objc_alloc((Class)UARPAssetID);
      v21 = (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v8);
      v22 = v20;
      v23 = 0;
    }
    else
    {
      v24 = v11[672];
      if (*(_QWORD *)&self->CLIntersiloService_opaque[v24])
      {
        v22 = objc_alloc((Class)UARPAssetID);
        v23 = *(_QWORD *)&self->CLIntersiloService_opaque[v24];
        v21 = 0;
      }
      else
      {
        v25 = -[NSURL URLByAppendingPathComponent:](self->_localHawkeyeFirmwareDirectory, "URLByAppendingPathComponent:", CFSTR("HawkeyeUARPSuperBinary.uarp"));
        v26 = objc_alloc((Class)UARPAssetID);
        v27 = *(_QWORD *)&self->CLIntersiloService_opaque[v24];
        v21 = -[NSURL path](v25, "path");
        v22 = v26;
        v23 = v27;
      }
    }
    v28 = objc_msgSend(v22, "initWithLocationType:remotePath:", v23, v21);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v29 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2113;
      v39 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate asset to add\", \"AssetID\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    -[UARPController addAccessory:assetID:](self->_uarpController, "addAccessory:assetID:", v9, v28);
    -[UARPController updateProperty:value:forAccessory:](self->_uarpController, "updateProperty:value:forAccessory:", 4, objc_msgSend(objc_msgSend(a3, "beacon"), "systemVersion"), v9);
  }
}

- (void)stopMonitoringDeviceForFirmwareUpdate:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (objc_msgSend(a3, "isCapableOfFirmwareUpdate"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - No need to stop monitoring Apple manufactured Hawkeye accessory for UARP firmware updates\"}", (uint8_t *)v6, 0x12u);
    }
  }
  else
  {
    -[UARPController removeAccessory:](self->_uarpController, "removeAccessory:", -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3));
  }
}

- (void)performTask:(id)a3 forClient:(id)a4 onDevice:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  NSObject *v13;
  id v14;
  CLDurianService *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  SEL v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  id v37;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290051;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
    v34 = 1026;
    *(_DWORD *)v35 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
    *(_WORD *)&v35[4] = 2050;
    *(_QWORD *)&v35[6] = a4;
    v36 = 2113;
    v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian performing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"clientPtr\":\"%{public}p\", \"task\":%{private, location:escape_only}@}", buf, 0x36u);
  }
  if (objc_msgSend(a5, "isHawkeyeAccessory")
    && -[CLDurianService deviceUndergoingFirmwareUpdate:](self, "deviceUndergoingFirmwareUpdate:", a5)
    && objc_msgSend(objc_msgSend(a3, "command"), "opcode") != 219)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v26 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate device undergoing firmware update - blocking other interactions\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v15 = self;
    v16 = a5;
    v17 = a3;
    v18 = 9;
    v19 = 0;
    goto LABEL_37;
  }
  if (a4)
  {
    -[NSMutableSet addObject:](self->_clients, "addObject:", a4);
    -[NSMutableDictionary setObject:forKey:](self->_taskClientMap, "setObject:forKey:", a4, objc_msgSend(a3, "uuid"));
  }
  -[NSMutableDictionary setObject:forKey:](self->_pendingTaskMap, "setObject:forKey:", a3, objc_msgSend(a3, "uuid"));
  if (!-[CLDurianDeviceManager ready](self->_deviceManager, "ready"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ignoring task, device manager not ready\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v15 = self;
    v16 = a5;
    v17 = a3;
    v18 = 43;
    v19 = 1;
LABEL_37:
    -[CLDurianService device:didFailToCompleteTask:withError:andDisconnect:](v15, "device:didFailToCompleteTask:withError:andDisconnect:", v16, v17, v18, v19);
    return;
  }
  objc_msgSend(a5, "setConnectionReason:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Task:%@"), objc_msgSend(a3, "opcodeDescription")));
  -[CLDurianDeviceManager attemptConnectionToDevice:](self->_deviceManager, "attemptConnectionToDevice:", a5);
  objc_msgSend(a5, "setDelegate:", self);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
    v12 = objc_msgSend(a3, "requiresMutex");
    *(_DWORD *)buf = 68289539;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = v11;
    v34 = 1026;
    *(_DWORD *)v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex check\", \"item\":%{private, location:escape_only}@, \"required\":%{public}d}", buf, 0x22u);
  }
  if (objc_msgSend(a3, "requiresMutex"))
  {
    if (objc_msgSend(a5, "mutexState") == (id)4)
    {
      objc_msgSend(a5, "handleMutexAlreadyHeldOnTask:", a3);
      return;
    }
    objc_msgSend(a5, "acquireMutexForTask:", a3);
  }
  else if (objc_msgSend(a5, "isTAAISDevice") && objc_msgSend(a5, "unownedBeacon"))
  {
    v20 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh");
    v21 = NSSelectorFromString(CFSTR("isPosh"));
    if ((objc_opt_respondsToSelector(objc_msgSend(a5, "unownedBeacon"), v21) & 1) != 0)
      v20 = objc_msgSend(objc_msgSend(a5, "unownedBeacon"), "performSelector:", v21) != 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v22 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
      v24 = objc_msgSend(a5, "uuid");
      *(_DWORD *)buf = 68289795;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v23;
      v34 = 2113;
      *(_QWORD *)v35 = v24;
      *(_WORD *)&v35[8] = 1025;
      *(_DWORD *)&v35[10] = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian two durian devices associated with the same peripheral  for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x2Cu);
    }
    v25 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self->_deviceManager, "deviceWithUUID:beaconType:isPosh:", objc_msgSend(objc_msgSend(a5, "unownedBeacon"), "identifier"), objc_msgSend(objc_msgSend(a5, "unownedBeacon"), "type"), v20);
    goto LABEL_40;
  }
  v25 = a5;
LABEL_40:
  objc_msgSend(v25, "enqueueTask:", a3);
}

- (void)onConnectionStateChangeForDeviceWithUUID:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v9;
  NSMutableSet *connectionStateChangeClients;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t buf;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289283;
    v21 = 2082;
    v22 = "";
    v23 = 2113;
    v24 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian device connection state change\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  connectionStateChangeClients = self->_connectionStateChangeClients;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](connectionStateChangeClients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(connectionStateChangeClients);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "didChangeConnectionStateForDevice:fromState:toState:", a3, a4, a5);
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](connectionStateChangeClients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

- (void)onObservationForDeviceWithUUID:(id)a3 type:(int64_t)a4
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int64_t v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v13 = 2050;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian device observation\", \"item\":%{private, location:escape_only}@, \"type\":%{public}ld}", (uint8_t *)v8, 0x26u);
  }
  if (a4 == 2)
    -[CLDurianCommuteMetricManager didObserveScanForDevice:](self->_commuteMetricManager, "didObserveScanForDevice:", a3);
}

- (void)fetchFirmwareVersionFromTag:(id)a3 forClient:(id)a4 includeCrashLogs:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v5 = a5;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v10 = objc_msgSend(v9, "createFetchFirmwareVersionTaskWithCrashLogs:", v5);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a4, v9);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchFirmwareVersion:fromTag:withError:", 0, a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchBatteryStateFromTag:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v8 = objc_msgSend(v7, "createFetchBatteryStatusTask");
  if (v8)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
  }
  else
  {
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchBatteryStatus:fromTag:withError:", 4, a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)));
  }
}

- (void)setBatteryStatus:(unint64_t)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createSetBatteryStatusTaskWithStatus:", a3);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a5, "didSetBatteryStatusOnTag:error:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromTag:(id)a4 forClient:(id)a5
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSError *v11;
  id v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v7 = a3;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createFetchUserStatsTaskWithPersistence:", v7);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("Not supported for this device type");
    v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v12 = objc_msgSend(v9, "buildNumber");
    if (v12 <= (id)+[CLDurianVersionNumberUtilities getNumberFromString:](CLDurianVersionNumberUtilities, "getNumberFromString:", CFSTR("2.0.36")))objc_msgSend(a5, "didFetchUserStats_Deprecated:fromTag:withError:", +[NSData data](NSData, "data"), a4, v11);
    else
      objc_msgSend(a5, "didFetchUserStats:fromTag:withError:", 0, a4, v11);
  }
}

- (void)unpairFromTag:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v8 = objc_msgSend(v7, "createStopPlayingSoundTask");
  if (self->_activeRangingClient)
    -[CLDurianService deinitRangingOnTag:forClient:](self, "deinitRangingOnTag:forClient:", a3, a4);
  if (objc_msgSend(v7, "isPlayingSound"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
  if (objc_msgSend(v7, "isMultiConnectionEnabled"))
  {
    v10 = objc_msgSend(v7, "createSetMaxConnectionsTaskWithCount:", 1);
    if (v10)
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a4, v7);
  }
  v11 = objc_msgSend(v7, "createUnpairDeviceTask");
  if (v11)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v11, a4, v7);
}

- (void)unpairFromTagWithAddress:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager connectToDeviceWithAddress:](self->_deviceManager, "connectToDeviceWithAddress:", a3);
  v7 = objc_msgSend(v6, "createUnpairDeviceTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)setObfuscatedIdentifier:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createSetObfuscatedIdentifierTaskWithIdentifier:", a3);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a5, "didSetObfuscatedIdentifierOnTag:withError:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BOOL v10;

  v6 = a3;
  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  objc_msgSend(v8, "setNearOwnerTimeoutOverride:", v6);
  v9 = objc_msgSend(v8, "createSetNearOwnerTimeoutTaskInSeconds:", v6);
  if (objc_msgSend(v8, "isConnected"))
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a5, v8);
}

- (void)setTagType:(unsigned __int8)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v8 = objc_msgSend(-[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4), "createSetTagTypeTaskWithType:", a3);
  if (v8)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a5, -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4));
  }
  else
  {
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Stop sound not supported for this device type");
    objc_msgSend(a5, "didSetTagTypeOnTag:withError:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)));
  }
}

- (void)setWildModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;

  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v9 = objc_msgSend(v8, "createSetWildModeTaskWithConfiguration:", a3);
  if (v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a5, v8);
}

- (void)rollWildKeyOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createRollWildKeyTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)playSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createPlaySoundTaskWithSequence:", a3);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to construct play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v12 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to construct play sound task", "{\"msg%{public}.0s\":\"#durian failed to construct play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    objc_msgSend(a5, "didStartPlayingSoundOnTag:withError:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, 0));
  }
}

- (void)playUnauthorizedSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createPlayUnauthorizedSoundTaskWithSequence:", a3);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to construct non-owner play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v12 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to construct non-owner play sound task", "{\"msg%{public}.0s\":\"#durian failed to construct non-owner play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    objc_msgSend(a5, "didStartPlayingUnauthorizedSoundOnTag:withError:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, 0));
  }
}

- (void)stopPlayingSoundOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  if (objc_msgSend(v6, "cancelAnyPendingPlaySound"))
  {
    v7 = objc_alloc((Class)NSError);
    v8 = kCLErrorDomainPrivate;
    v9 = NSLocalizedDescriptionKey;
    v10 = sub_101536DEC(0x2DuLL);
    objc_msgSend(a4, "didStartPlayingSoundOnTag:withError:", objc_msgSend(v6, "uuid"), objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 45, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)));
    objc_msgSend(a4, "didStopPlayingSoundOnTag:withError:", objc_msgSend(v6, "uuid"), 0);
    if (objc_msgSend(v6, "isOnlyRemainingTask"))
      -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](self->_deviceManager, "cancelConnectionAttemptToDevice:", v6);
  }
  else
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", objc_msgSend(v6, "createStopPlayingSoundTask"), a4, v6);
  }
}

- (void)stopPlayingUnauthorizedSoundOnTag:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v8 = objc_msgSend(v7, "createStopPlayingUnauthorizedSoundTask");
  if (v8)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
  }
  else
  {
    v9 = objc_alloc((Class)NSError);
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("Stop sound not supported for this device type");
    objc_msgSend(a4, "didStopPlayingUnauthorizedSoundOnTag:withError:", a3, objc_msgSend(v9, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
  }
}

- (void)connectToTag:(id)a3 forClient:(id)a4
{
  id v7;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  objc_msgSend(v7, "setDelegate:", self);
  -[NSMutableSet addObject:](self->_clients, "addObject:", a4);
  if (objc_msgSend(v7, "activePeripheral"))
  {
    objc_msgSend(a4, "didConnectToTag:withMacAddress:withError:", a3, objc_msgSend(v7, "address"), 0);
    -[CLDurianDeviceManager scheduleConnectionEvaluationForDevice:](self->_deviceManager, "scheduleConnectionEvaluationForDevice:", v7);
  }
  else
  {
    objc_msgSend(v7, "setConnectionReason:", CFSTR("Prewarm"));
    -[CLDurianDeviceManager attemptConnectionToDevice:](self->_deviceManager, "attemptConnectionToDevice:", v7);
  }
}

- (void)disconnectFromTag:(id)a3 forClient:(id)a4
{
  id v6;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  objc_msgSend(v6, "setDelegate:", self);
  -[NSMutableSet addObject:](self->_clients, "addObject:", a4);
  if (objc_msgSend(v6, "isConnected"))
  {
    objc_msgSend(v6, "setDisconnectionReason:", CFSTR("SPI"));
    -[CLDurianDeviceManager requestDisconnectionForDevice:](self->_deviceManager, "requestDisconnectionForDevice:", v6);
  }
  else
  {
    objc_msgSend(a4, "didDisconnectFromTag:withError:", objc_msgSend(v6, "uuid"), 0);
  }
}

- (void)shouldDisconnectReconnectForDevice:(id)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;

  v5 = objc_msgSend(a3, "commandedLatency") == (id)-6 || objc_msgSend(a3, "currentLatency") == (id)-6;
  v6 = 0;
  v7 = -[CLDurianSystemMonitor coexImpactState](self->_systemMonitor, "coexImpactState") & 3;
  if (v5 && !v7)
    v6 = objc_msgSend(a3, "numPendingTasks") == 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68290307;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v14 = 1026;
    v15 = v6;
    v16 = 1026;
    v17 = v5;
    v18 = 1026;
    v19 = v7;
    v20 = 1026;
    v21 = objc_msgSend(a3, "numPendingTasks");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disreconnect\", \"item\":%{private, location:escape_only}@, \"reconnect\":%{public}hhd, \"990\":%{public}d, \"coex\":%{public}d, \"tasks\":%{public}d}", (uint8_t *)v9, 0x34u);
  }
  if (v6)
    -[CLDurianDeviceManager reconnectDevice:](self->_deviceManager, "reconnectDevice:", a3);
}

- (void)initRangingWithMacAddress:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSMutableSet *roseOnForClientOnDevice;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  RoseOnClientAndDevicePair *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createInitRangingTaskWithMacAddress:", a3);
  if (v10)
  {
    v11 = v10;
    -[CLDurianService shouldDisconnectReconnectForDevice:](self, "shouldDisconnectReconnectForDevice:", v9);
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v11, a5, v9);
    self->_activeRangingClient = (CLDurianClientProtocol *)a5;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(roseOnForClientOnDevice);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "client") == a5)
          break;
        if (v14 == (id)++v16)
        {
          v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v18 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      {
        v21 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289539;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2113;
        v31 = v21;
        v32 = 2113;
        v33 = a5;
        v20 = "{\"msg%{public}.0s\":\"#durian #rose already initialize by client\", \"item\":%{private, location:escape_o"
              "nly}@, \"client\":%{private, location:escape_only}@}";
        goto LABEL_18;
      }
    }
    else
    {
LABEL_10:
      v17 = objc_alloc_init(RoseOnClientAndDevicePair);
      -[RoseOnClientAndDevicePair setClient:](v17, "setClient:", a5);
      -[RoseOnClientAndDevicePair setDeviceUUID:](v17, "setDeviceUUID:", a4);
      -[NSMutableSet addObject:](self->_roseOnForClientOnDevice, "addObject:", v17);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v18 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289539;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 2113;
        v31 = v19;
        v32 = 2113;
        v33 = a5;
        v20 = "{\"msg%{public}.0s\":\"#durian #rose added client to rose on list\", \"item\":%{private, location:escape_o"
              "nly}@, \"client\":%{private, location:escape_only}@}";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, buf, 0x26u);
      }
    }
  }
}

- (void)deinitRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createDeinitRangingTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)configureRangingWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8 onTag:(id)a9 forClient:(id)a10
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v17;
  id v18;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v17 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a9);
  v18 = objc_msgSend(v17, "createConfigureRangingTaskWithMacAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:", a3, v14, v13, v12, v11, v10);
  if (v18)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v18, a10, v17);
}

- (void)prepareRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  if (objc_msgSend(v6, "isHeleAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289283;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
    }
  }
  else
  {
    if (a4)
    {
      -[NSMutableSet addObject:](self->_clients, "addObject:", a4);
      -[NSMutableDictionary setObject:forKey:](self->_taskClientMap, "setObject:forKey:", a4, objc_msgSend(v6, "uuid"));
    }
    objc_msgSend(v6, "checkPrepareRanging");
  }
}

- (void)startRangingWithTargetEventCounter:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v9 = objc_msgSend(v8, "createStartRangingTaskWithTargetEventCounter:", v6);
  if (v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a5, v8);
}

- (void)stopRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createStopRangingTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)startEventCounterOnTag:(id)a3 forClient:(id)a4
{
  CLDurianDevice *v7;
  NSObject *v8;
  CLDurianDevice *eventCounterOnForDevice;
  BOOL v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (-[CLDurianDevice isHeleAccessory](v7, "isHeleAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289283;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](v7, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    eventCounterOnForDevice = self->_eventCounterOnForDevice;
    if (eventCounterOnForDevice)
      v10 = v7 == eventCounterOnForDevice;
    else
      v10 = 1;
    if (!v10)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 68289283;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2113;
        v18 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](v7, "uuid"), "description"), "substringToIndex:", 8);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Turning off an event counter before turning it on for another device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
      }
      -[CLDurianDevice stopEventCounter](self->_eventCounterOnForDevice, "stopEventCounter");
    }
    v12 = -[CLDurianDevice startEventCounter](v7, "startEventCounter");
    if (v12)
      objc_msgSend(a4, "didFailRangingEventCounterActionForTag:error:", a3, v12);
    self->_eventCounterOnForDevice = v7;
  }
}

- (void)stopEventCounterOnTag:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (objc_msgSend(v7, "isHeleAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289283;
      v10[1] = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x1Cu);
    }
  }
  else
  {
    v9 = objc_msgSend(v7, "stopEventCounter");
    if (v9)
      objc_msgSend(a4, "didFailRangingEventCounterActionForTag:error:", a3, v9);
    self->_eventCounterOnForDevice = 0;
  }
}

- (void)getMultiStatusForTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createGetMultiStatusTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)getGroupStatusForTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createGetGroupStatusTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)completeRangingInit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6;
  id v9;

  v6 = a6;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  objc_msgSend(a4, "didInitRangingOnTag:withStatus:error:", objc_msgSend(v9, "uuid"), objc_msgSend(v9, "getRangingStatusForOpcode:data:", v6, a5), 0);
}

- (void)completeRangingConfigure:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6;
  id v9;

  v6 = a6;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  objc_msgSend(a4, "didConfigureRangingOnTag:withStatus:error:", objc_msgSend(v9, "uuid"), objc_msgSend(v9, "getRangingStatusForOpcode:data:", v6, a5), 0);
}

- (void)completeRangingStart:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6;
  id v9;

  v6 = a6;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3, a4);
  -[CLDurianClientProtocol didCompleteRangingOnTag:withStatus:endReason:error:](self->_activeRangingClient, "didCompleteRangingOnTag:withStatus:endReason:error:", objc_msgSend(v9, "uuid"), objc_msgSend(v9, "getRangingStatusForOpcode:data:", v6, a5), objc_msgSend(v9, "getRangeEndReasonForOpcode:data:", v6, a5), 0);
}

- (void)completeRangingDeinit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  unsigned int v6;
  id v10;
  NSObject *v11;
  NSMutableSet *roseOnForClientOnDevice;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSObject *v18;
  id v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t buf;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v6 = a6;
  v10 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v20 = v6;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    buf = 68289539;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = objc_msgSend(objc_msgSend(objc_msgSend(v10, "uuid"), "description"), "substringToIndex:", 8);
    v31 = 2113;
    v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose ack for rose stop processed\", \"item\":%{private, location:escape_only}@, \"client\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(roseOnForClientOnDevice);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "client") == a4)
        {
          -[NSMutableSet removeObject:](self->_roseOnForClientOnDevice, "removeObject:", v17);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v18 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(objc_msgSend(objc_msgSend(v10, "uuid"), "description"), "substringToIndex:", 8);
            buf = 68289539;
            v27 = 2082;
            v28 = "";
            v29 = 2113;
            v30 = v19;
            v31 = 2113;
            v32 = a4;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose removed from rose on list\", \"item\":%{private, location:escape_only}@, \"client\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
          }
          goto LABEL_18;
        }
      }
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_18:
  objc_msgSend(a4, "didDeinitRangingOnTag:withStatus:error:", objc_msgSend(v10, "uuid"), objc_msgSend(v10, "getRangingStatusForOpcode:data:", v20, a5), 0);
  objc_msgSend(v10, "releaseMutexWithReason:", CFSTR("RoseStop"));
}

- (void)fetchConnectionStateForTag:(id)a3 forClient:(id)a4
{
  _objc_msgSend(a4, "didFetchConnectionState:forTag:withError:", objc_msgSend(-[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:"), "connectionState"), a3, 0);
}

- (void)dumpLogsOfType:(unint64_t)a3 forTag:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createDumpLogsTaskOfType:", a3);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    v11 = objc_alloc((Class)NSError);
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("Invalid log dump request");
    v12 = objc_msgSend(v11, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(a5, "didDumpLogs:ofType:fromTag:withError:", 0, a3, a4, v12);

  }
}

- (void)setKeyRollInterval:(unsigned int)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  id v10;
  BOOL v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;

  LODWORD(v6) = a3;
  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  if (v6 <= 0x3C)
    v6 = 60;
  else
    v6 = v6;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289539;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "uuid"), "description"), "substringToIndex:", 8);
    v17 = 1026;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setKeyRollInterval\", \"item\":%{private, location:escape_only}@, \"seconds\":%{public}d}", (uint8_t *)v12, 0x22u);
  }
  objc_msgSend(v8, "setKeyRollInterval:", v6);
  v10 = objc_msgSend(v8, "createSetKeyRollTimeoutTaskWithInterval:", v6);
  if (objc_msgSend(v8, "isConnected"))
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v8);
}

- (void)induceCrashOnTag:(id)a3 forClient:(id)a4
{
  id v6;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", objc_msgSend(v6, "createInduceCrashTask"), a4, v6);
}

- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 onTag:(id)a4 forClient:(id)a5
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v7 = a3;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createSetUnauthorizedPlaySoundRateLimitTask:", v7);
  if (v10)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v10, a5, v9);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a5, "didSetUnauthorizedPlaySoundRateLimitFromTag:error:", a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)getPersonalizationInfoForDevice:(id)a3 forClient:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  _QWORD v28[3];
  _QWORD v29[3];
  NSErrorUserInfoKey v30;
  NSString *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2113;
    v37 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService - getPersonalizationInfoForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v8 = -[NSMutableDictionary objectForKey:](-[CLDurianDeviceManager devices](self->_deviceManager, "devices"), "objectForKey:", a3);
  v9 = v8;
  if (!v8)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown nil device\"}", buf, 0x12u);
      v11 = CFSTR("InvalidRequest");
      v10 = CFSTR("No tag found");
      goto LABEL_34;
    }
    v10 = CFSTR("No tag found");
LABEL_26:
    v11 = CFSTR("InvalidRequest");
LABEL_36:
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[__CFString UTF8String](v11, "UTF8String");
      v22 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      v23 = -[__CFString UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 68289795;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2082;
      v37 = v21;
      v38 = 2113;
      v39 = v22;
      v40 = 2082;
      v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService failed getPersonalizationInfoForDevice \", \"reason\":%{public, location:escape_only}s, \"item\":%{private, location:escape_only}@, \"blockingReason\":%{public, location:escape_only}s}", buf, 0x30u);
    }
    v24 = objc_alloc((Class)NSError);
    v25 = kCLErrorDomainPrivate;
    v30 = NSLocalizedDescriptionKey;
    v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v11, v10);
    objc_msgSend(a4, "didRetrievePersonalizationInformation:forTag:error:", 0, a3, objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 9, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1)));
    v28[0] = CFSTR("event");
    v28[1] = CFSTR("reason");
    v29[0] = CFSTR("firmwareUpdateFailed");
    v29[1] = v11;
    v28[2] = CFSTR("firmwareUpdateblockingTask");
    v29[2] = v10;
    -[CLDurianService sendFirmwareUpdateMetrics:forDevice:](self, "sendFirmwareUpdateMetrics:forDevice:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3), v9);
    return;
  }
  if (!objc_msgSend(v8, "isAirTag")
    || objc_msgSend(v9, "numPendingTasks")
    || (objc_msgSend(v9, "firmwareUpdateMode") & 1) != 0
    || (objc_msgSend(v9, "isRoseInitialized") & 1) != 0)
  {
    if ((objc_msgSend(v9, "isAirTag") & 1) != 0)
    {
      if (objc_msgSend(v9, "numPendingTasks"))
      {
        v10 = (__CFString *)objc_msgSend(v9, "currentTaskName");
        v11 = CFSTR("TagBusy");
      }
      else
      {
        v11 = CFSTR("TagBusy");
        if ((objc_msgSend(v9, "firmwareUpdateMode") & 1) != 0)
        {
          v10 = CFSTR("Already Doing FW update");
        }
        else
        {
          v19 = objc_msgSend(v9, "isRoseInitialized");
          if (v19)
            v10 = CFSTR("Rose Initialized - user in details pane");
          else
            v10 = CFSTR("Unknown");
          if (!v19)
            v11 = CFSTR("Unknown");
        }
      }
      goto LABEL_34;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      v15 = objc_msgSend(objc_msgSend(v9, "beacon"), "type");
      *(_DWORD *)buf = 68289539;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v14;
      v38 = 2113;
      v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v16 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v17 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      v18 = objc_msgSend(objc_msgSend(v9, "beacon"), "type");
      *(_DWORD *)buf = 68289539;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v17;
      v38 = 2113;
      v39 = v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #firmwareUpdate getPersonalizationInfoForDevice unknown", "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", buf, 0x26u);
      v11 = CFSTR("InvalidRequest");
      v10 = CFSTR("Device is not airtag");
LABEL_34:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      goto LABEL_36;
    }
    v10 = CFSTR("Device is not airtag");
    goto LABEL_26;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v26 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2113;
    v37 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService - kicking off getPersonalizationInfoForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_firmwareUpdateClientMap, "setObject:forKeyedSubscript:", a4, a3);
  objc_msgSend(v9, "setConnectionReason:", CFSTR("FWDL:KickOff"));
  -[CLDurianDeviceManager attemptConnectionToDevice:](self->_deviceManager, "attemptConnectionToDevice:", v9);
  objc_msgSend(v9, "getPersonalizationInformation");
  -[NSMutableArray addObject:](self->_devicesUndergoingFirmwareUpdate, "addObject:", a3);
}

- (void)fetchTxPowerForDevice:(id)a3 forClient:(id)a4 asOwner:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v5 = a5;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v10 = objc_msgSend(v9, "createFetchTxPowerTaskAsOwner:", v5);
  if (v10)
  {
    v11 = v10;
    if ((objc_msgSend(v9, "isCapableOfAllHawkeyeServices") & 1) != 0 || v5)
      -[CLDurianService shouldDisconnectReconnectForDevice:](self, "shouldDisconnectReconnectForDevice:", v9);
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v11, a4, v9);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 68289283;
      v13[1] = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchTxPower not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v13, 0x1Cu);
    }
    objc_msgSend(a4, "didFetchTxPower:fromDevice:withError:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), objc_msgSend(v9, "uuid"), +[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError"));
  }
}

- (void)startAggressiveAdvertisingForDevice:(id)a3 withTimeout:(unsigned int)a4 forClient:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;

  v6 = *(_QWORD *)&a4;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 68290051;
    v13[1] = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v18 = 2113;
    v19 = objc_msgSend(v9, "uuid");
    v20 = 1026;
    v21 = v6;
    v22 = 2114;
    v23 = objc_msgSend(v9, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #aggadv requested\", \"item\":%{private, location:escape_only}@, \"device\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v13, 0x36u);
  }
  v11 = objc_msgSend(v9, "createStartAggressiveAdvertisingTaskWithTimeout:", v6);
  if (v11)
  {
    v12 = v11;
    -[CLDurianService shouldDisconnectReconnectForDevice:](self, "shouldDisconnectReconnectForDevice:", v9);
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v12, a5, v9);
    objc_msgSend(v9, "setAggressiveAdvertisingTimeout:", v6);
  }
  else
  {
    objc_msgSend(a5, "didStartAggressiveAdvertisingOnDevice:withError:", objc_msgSend(v9, "uuid"), +[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError"));
  }
}

- (void)stopAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createStopAggressiveAdvertisingTask");
  if (v7)
  {
    v8 = v7;
    -[CLDurianService shouldDisconnectReconnectForDevice:](self, "shouldDisconnectReconnectForDevice:", v6);
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v6);
  }
  else
  {
    objc_msgSend(a4, "didStartAggressiveAdvertisingOnDevice:withError:", objc_msgSend(v6, "uuid"), +[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError"));
  }
}

- (void)startUnauthorizedAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68290051;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v15 = 2113;
    v16 = objc_msgSend(v7, "uuid");
    v17 = 1026;
    v18 = 1;
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #aggadv requested\", \"item\":%{private, location:escape_only}@, \"device\":%{private, location:escape_only}@, \"ut\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x36u);
  }
  v9 = objc_msgSend(v7, "createStartUnauthorizedAggressiveAdvertisingTask");
  if (v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  else
    objc_msgSend(a4, "didStartUnauthorizedAggressiveAdvertisingOnDevice:withError:", objc_msgSend(v7, "uuid"), +[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError"));
}

- (void)setHawkeyeTestMode:(int)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;

  v7 = *(_QWORD *)&a3;
  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v10 = objc_msgSend(v9, "createSetTestModeTaskWithMode:", v7);
  if (v10)
  {
    v11 = v10;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 68289795;
      v13[1] = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = objc_msgSend(objc_msgSend(a4, "description"), "substringToIndex:", 8);
      v18 = 1026;
      v19 = v7;
      v20 = 1026;
      v21 = 1;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye setHawkeyeTestMode\", \"item\":%{private, location:escape_only}@, \"mode\":%{public}d, \"task\":%{public}hhd}", (uint8_t *)v13, 0x28u);
    }
    objc_msgSend(v9, "setHawkeyeTestMode:", v7);
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v11, a5, v9);
  }
}

- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5 forClient:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;

  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v11 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a5);
  v12 = +[CLDurianTask setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:separatedUTBackoffTimeoutSeconds:](CLDurianTask, "setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:separatedUTBackoffTimeoutSeconds:", v9, v8);
  if (v12)
  {
    v13 = v12;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v14 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = objc_msgSend(objc_msgSend(a5, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye induceCrash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v13, a6, v11);
  }
  else
  {
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("Not supported for this device type");
    objc_msgSend(a6, "didSetHawkeyeUTMotionConfigForDevice:withError:", a5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

- (id)getUarpAccessoryForDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[UARPController accessoryList](self->_uarpController, "accessoryList", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqual:", objc_msgSend(a3, "uuid")))
        v7 = v10;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);
  return v7;
}

- (id)getDevicesForProductGroup:(id)a3 andProductNumber:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];

  v7 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[UARPController accessoryList](self->_uarpController, "accessoryList", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v13, "productGroup"), "isEqualToString:", a3)
          && objc_msgSend(objc_msgSend(v13, "productNumber"), "isEqual:", a4))
        {
          objc_msgSend(v7, "addObject:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(v13, "uuid")));
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
    }
    while (v10);
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2114;
    v25 = a3;
    v26 = 2114;
    v27 = a4;
    v28 = 2113;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - found devices with PG/PN\", \"Product group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Devices\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  return v7;
}

- (void)didFailFirmwareUpdateForDevice:(id)a3 withError:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  NSDictionary *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v18 = 2113;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #Hawkeye #firmwareUpdate - Firmware update failed\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
  }
  -[UARPController accessoryUnreachable:](self->_uarpController, "accessoryUnreachable:", -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3));
  -[UARPController cancelFirmwareStagingForAccessory:assetID:](self->_uarpController, "cancelFirmwareStagingForAccessory:assetID:", -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3), -[NSMutableDictionary objectForKeyedSubscript:](self->_assetIdMap, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid")));
  if (!a4)
  {
    v8 = kCLErrorDomainPrivate;
    v10 = NSLocalizedDescriptionKey;
    v11 = sub_101536DEC(0xFFFFFFFFFFFFFFFFLL);
    v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, -1, v9, v10);
  }
  -[CLDurianService didUpdateFirmwareForDevice:error:](self, "didUpdateFirmwareForDevice:error:", a3, a4);
  -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", objc_msgSend(a3, "uuid"), 1, 0, a4, &stru_1021BC168);
}

- (BOOL)deviceUndergoingFirmwareUpdate:(id)a3
{
  NSMutableArray *devicesUndergoingFirmwareUpdate;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSObject *v9;
  _BOOL4 v10;
  BOOL result;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  devicesUndergoingFirmwareUpdate = self->_devicesUndergoingFirmwareUpdate;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesUndergoingFirmwareUpdate, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(devicesUndergoingFirmwareUpdate);
        if (objc_msgSend(objc_msgSend(a3, "uuid"), "isEqual:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)))
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v13 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289283;
            v20 = 0;
            v21 = 2082;
            v22 = "";
            v23 = 2113;
            v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update device undergoing FirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          return 1;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesUndergoingFirmwareUpdate, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v9 = qword_1022A0038;
  v10 = os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v10)
  {
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2113;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update device NOT undergoing FirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    return 0;
  }
  return result;
}

- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4 forClient:(id)a5
{
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  const __CFString **v16;
  NSErrorUserInfoKey *v17;
  void *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;

  v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (objc_msgSend(v9, "isHawkeyeAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update updateFirmwareForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v11 = -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", v9);
    v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assetIdMap, "objectForKeyedSubscript:", a3);
    if (v11)
      v13 = v12 == 0;
    else
      v13 = 1;
    if (!v13)
    {
      v18 = v12;
      -[NSMutableArray addObject:](self->_devicesUndergoingFirmwareUpdate, "addObject:", a3);
      -[CLDurianDeviceManager attemptConnectionToDevice:](self->_deviceManager, "attemptConnectionToDevice:", v9);
      objc_msgSend(v9, "enterFirmwareUpdateMode");
      -[UARPController downloadAvailableFirmwareUpdate:assetID:withUserIntent:](self->_uarpController, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:", v11, v18, 1);
      -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", a3, 0, objc_msgSend(v18, "assetVersion"), 0, &stru_1021BC188);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_firmwareUpdateClientMap, "setObject:forKeyedSubscript:", a5, a3);
      return;
    }
    v14 = objc_alloc((Class)NSError);
    v15 = kCLErrorDomainPrivate;
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("This accessory is not registered or there is no update available for it");
    v16 = &v22;
    v17 = &v21;
  }
  else
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_firmwareUpdateClientMap, "objectForKeyedSubscript:", a3) == a5
      && objc_msgSend(v9, "allowFirmwareUpdate"))
    {
      _objc_msgSend(v9, "updateFirmwareWithAssetURL:", a4);
      return;
    }
    v14 = objc_alloc((Class)NSError);
    v15 = kCLErrorDomainPrivate;
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("Not in firmware update state, please request personalization information first.");
    v16 = &v20;
    v17 = &v19;
  }
  objc_msgSend(a5, "didUpdateFirmwareForTag:error:", a3, objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v19, v20, v21, v22)));
}

- (void)abortFirmwareUpdateForDevice:(id)a3 forClient:(id)a4
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate - abortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)setAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;

  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v9 = objc_msgSend(v8, "createSetAccelerometerSlopeModeTaskWithConfiguration:", a3);
  if (v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a5, v8);
}

- (void)setAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;

  v8 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4);
  v9 = objc_msgSend(v8, "createSetAccelerometerOrientationModeTaskWithConfiguration:", a3);
  if (v9)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a5, v8);
}

- (void)fetchAccelerometerSlopeModeConfigurationOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createFetchAccelerometerSlopeModeTaskWithConfiguration");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)fetchAccelerometerOrientationModeConfigurationOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createFetchAccelerometerOrientationModeTaskWithConfiguration");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)fetchAccelerometerModeOnTag:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
  v7 = objc_msgSend(v6, "createFetchAccelerometerModeTask");
  if (v7)
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v7, a4, v6);
}

- (void)teardownClient:(id)a3
{
  NSObject *v5;
  NSMutableDictionary *taskClientMap;
  NSMutableSet *roseOnForClientOnDevice;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSMutableDictionary *firmwareUpdateClientMap;
  id v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSError *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[7];
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  uint8_t v48[128];
  uint8_t v49[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[8];
  __int128 v57;
  void (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v57) = 2082;
    *(_QWORD *)((char *)&v57 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian teardownClient\"}", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v57 = buf;
  *((_QWORD *)&v57 + 1) = 0x3052000000;
  v58 = sub_1002073C4;
  v59 = sub_100207EB4;
  v60 = 0;
  v60 = objc_alloc_init((Class)NSMutableArray);
  taskClientMap = self->_taskClientMap;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1014E9CE8;
  v45[3] = &unk_1021BC1B0;
  v45[5] = self;
  v45[6] = buf;
  v45[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](taskClientMap, "enumerateKeysAndObjectsUsingBlock:", v45);
  -[NSMutableDictionary removeObjectsForKeys:](self->_taskClientMap, "removeObjectsForKeys:", *(_QWORD *)(v57 + 40));
  -[NSMutableDictionary removeObjectsForKeys:](self->_pendingTaskMap, "removeObjectsForKeys:", *(_QWORD *)(v57 + 40));

  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
  if (self->_activeRangingClient == a3)
    self->_activeRangingClient = 0;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(roseOnForClientOnDevice);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "client") == a3)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v12 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v49 = 68289283;
            v50 = 0;
            v51 = 2082;
            v52 = "";
            v53 = 2113;
            v54 = a3;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose found a device that client was using where rose may be on\", \"client\":%{private, location:escape_only}@}", v49, 0x1Cu);
          }
          v13 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(v11, "deviceUUID"));
          v14 = v13;
          if (v13 && objc_msgSend(v13, "isRoseInitialized"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v15 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v49 = 68289283;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = a3;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #rose client left rose on and is being torn down, turning it off\", \"client\":%{private, location:escape_only}@}", v49, 0x1Cu);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
            }
            v16 = qword_1022A0038;
            if (os_signpost_enabled((os_log_t)qword_1022A0038))
            {
              *(_DWORD *)v49 = 68289283;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = a3;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #rose client left rose on and is being torn down, turning it off", "{\"msg%{public}.0s\":\"#durian #rose client left rose on and is being torn down, turning it off\", \"client\":%{private, location:escape_only}@}", v49, 0x1Cu);
            }
            v17 = objc_msgSend(v14, "createDeinitRangingTask");
            if (v17)
              -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v17, 0, v14);
          }
          -[NSMutableSet removeObject:](self->_roseOnForClientOnDevice, "removeObject:", v11);
          goto LABEL_32;
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](roseOnForClientOnDevice, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_32:
  v36 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  firmwareUpdateClientMap = self->_firmwareUpdateClientMap;
  v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](firmwareUpdateClientMap, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v19)
  {
    v21 = *(_QWORD *)v38;
    v35 = kCLErrorDomainPrivate;
    *(_QWORD *)&v20 = 68289283;
    v34 = v20;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(firmwareUpdateClientMap);
        v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v22);
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_firmwareUpdateClientMap, "objectForKeyedSubscript:", v23, v34) == a3)
        {
          v24 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", v23);
          -[NSMutableArray removeObject:](self->_devicesUndergoingFirmwareUpdate, "removeObject:", v23);
          objc_msgSend(v36, "addObject:", v23);
          v46 = NSLocalizedDescriptionKey;
          v47 = sub_101536DEC(0x2CuLL);
          v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, 44, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
          if (objc_msgSend(v24, "isAirTag"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v26 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_msgSend(objc_msgSend(objc_msgSend(v24, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)v49 = v34;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Stopping firmware update because client disconnected\", \"item\":%{private, location:escape_only}@}", v49, 0x1Cu);
            }
            objc_msgSend(v24, "abortFirmwareUpdate:", v25);
          }
          else if (objc_msgSend(v24, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v28 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(objc_msgSend(objc_msgSend(v24, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)v49 = v34;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye Stopping firmware update because client disconnected\", \"item\":%{private, location:escape_only}@}", v49, 0x1Cu);
            }
            -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", v24, v25);
          }
          else
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v30 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
            {
              v31 = objc_msgSend(objc_msgSend(objc_msgSend(v24, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)v49 = v34;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing\", \"item\":%{private, location:escape_only}@}", v49, 0x1Cu);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
            }
            v32 = qword_1022A0038;
            if (os_signpost_enabled((os_log_t)qword_1022A0038))
            {
              v33 = objc_msgSend(objc_msgSend(objc_msgSend(v24, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)v49 = v34;
              v50 = 0;
              v51 = 2082;
              v52 = "";
              v53 = 2113;
              v54 = v33;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing", "{\"msg%{public}.0s\":\"#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing\", \"item\":%{private, location:escape_only}@}", v49, 0x1Cu);
            }
          }
        }
        v22 = (char *)v22 + 1;
      }
      while (v19 != v22);
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](firmwareUpdateClientMap, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v19);
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_firmwareUpdateClientMap, "removeObjectsForKeys:", v36);
  _Block_object_dispose(buf, 8);
}

- (void)airplaneModeChanged
{
  -[CLDurianDeviceManager setAirplaneModeEnabled:](self->_deviceManager, "setAirplaneModeEnabled:", -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode"));
}

- (void)onAggressiveScanEnded
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAggressiveScanEnded\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLDurianDeviceManager pruneScanCacheToQuarterHour](self->_deviceManager, "pruneScanCacheToQuarterHour");
}

- (void)systemWillSleep:(id)a3
{
  -[CLDurianDeviceManager handleSystemSleep](self->_deviceManager, "handleSystemSleep", a3);
}

- (void)systemConnectivity:(id)a3 isConnected:(BOOL)a4
{
  -[CLDurianDeviceManager networkConnectivity:](self->_deviceManager, "networkConnectivity:", a4);
}

- (void)systemCoexImpact:(id)a3 toState:(int)a4
{
  -[CLDurianDeviceManager coexImpactState:](self->_deviceManager, "coexImpactState:", *(_QWORD *)&a4);
}

- (void)systemMetricHeartbeat
{
  -[CLDurianDeviceManager metricHeartbeat](self->_deviceManager, "metricHeartbeat");
}

- (void)findMyAppDidBackgroundOrExit
{
  -[CLDurianDeviceManager cancelActiveConnectionAttemptsExcludingHele:](self->_deviceManager, "cancelActiveConnectionAttemptsExcludingHele:", 1);
}

- (void)updateSystemLoiType:(unint64_t)a3 isEntry:(BOOL)a4
{
  -[CLDurianDeviceManager updateLoiType:isEntry:](self->_deviceManager, "updateLoiType:isEntry:", a3, a4);
}

- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4
{
  -[CLDurianDeviceManager updateDeviceConnectionState:state:](self->_deviceManager, "updateDeviceConnectionState:state:", a3, a4);
}

- (void)onFirstUnlock
{
  -[CLDurianDeviceManager fetchAllBeaconsWithCompletion:](self->_deviceManager, "fetchAllBeaconsWithCompletion:", &stru_1021BC1D0);
}

- (void)onVehicularState
{
  NSObject *v3;
  CFAbsoluteTime Current;
  double v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #hele requesting discovery scan to speed up proactive maintenance upon connecting to CarPlay or car BT\"}", (uint8_t *)&v10, 0x12u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v5 = vabdd_f64(Current, self->_carLastScanned);
  v6 = -[CLDurianDeviceManager checkIfAllDevicesLastRecentlyDisconnected](self->_deviceManager, "checkIfAllDevicesLastRecentlyDisconnected");
  v7 = v6;
  if (v5 <= 120.0 || (v6 & 1) != 0)
  {
    if (v5 <= 120.0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v8 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian already attempted scanning within the last 2 mins\"}", (uint8_t *)&v10, 0x12u);
      }
    }
    if (v7)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v9 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian all devices have been last connected within the BOM backstop time period (6 hours)\"}", (uint8_t *)&v10, 0x12u);
      }
    }
  }
  else
  {
    self->_carLastScanned = Current;
    -[CLDurianMetricManager submitCarMaintMetrics:](self->_metricManager, "submitCarMaintMetrics:", 1);
    -[CLDurianService requestDiscoveryScan](self, "requestDiscoveryScan");
  }
}

- (void)fetchHawkeyeAISProductDataForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ProductData\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISProductDataTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISProductDataFromDevice:productData:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISManufacturerNameForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ManufacturerName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISManufacturerNameTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISManufacturerNameFromDevice:manufacturerName:error:", a3, &stru_1021D8FB8, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISModelNameForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ModelName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISModelNameTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISModelNameFromDevice:modelName:error:", a3, &stru_1021D8FB8, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISModelColorCodeForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ModelColorCode\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISModelColorCodeTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISModelColorCodeFromDevice:modelColorCode:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS AccessoryCategory\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISAccessoryCategoryTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISAccessoryCategoryFromDevice:accessoryCategory:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS AccessoryCapabilities\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISAccessoryCapabilitiesTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  v8 = objc_msgSend(v7, "createFetchAISFirmwareVersionTask");
  if (v8)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
  }
  else
  {
    v9 = objc_alloc((Class)NSError);
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchFirmwareVersion:fromTag:withError:", 0, a3, objc_msgSend(v9, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
  }
}

- (void)fetchHawkeyeAISFindMyVersionForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS FindMyVersion\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISFindMyVersionTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISFindMyVersionFromDevice:findMyVersion:error:", a3, 0, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeAISBatteryTypeForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2114;
    v20 = objc_msgSend(v7, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS BatteryType\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v9 = objc_msgSend(v7, "createFetchAISBatteryTypeTask");
  if (v9)
  {
    -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v9, a4, v7);
  }
  else
  {
    v10 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Not supported for this device type");
    objc_msgSend(a4, "didFetchHawkeyeAISBatteryTypeFromDevice:batteryType:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchHawkeyeSerialNumber:(id)a3 forClient:(id)a4
{
  NSObject *v7;
  CLDurianDeviceManager *deviceManager;
  _QWORD v9[7];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch serial number request\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1014EB3D4;
  v9[3] = &unk_1021BC1F8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v9);
}

- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3 forClient:(id)a4
{
  NSObject *v7;
  CLDurianDeviceManager *deviceManager;
  _QWORD v9[7];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch current primary key request\", \"UUID\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1014EB6C4;
  v9[3] = &unk_1021BC1F8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v9);
}

- (void)fetchHawkeyeiCloudIdentifier:(id)a3 forClient:(id)a4
{
  NSObject *v7;
  CLDurianDeviceManager *deviceManager;
  _QWORD v9[7];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch iCloud Identifier request\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1014EB9C4;
  v9[3] = &unk_1021BC1F8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v9);
}

- (void)startMonitoringConnectionStateChangeForClient:(id)a3
{
  -[NSMutableSet addObject:](self->_connectionStateChangeClients, "addObject:", a3);
}

- (void)stopMonitoringConnectionStateChangeForClient:(id)a3
{
  -[NSMutableSet removeObject:](self->_connectionStateChangeClients, "removeObject:", a3);
}

- (void)useLocalFirmwareAssetFromUrl:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6 forClient:(id)a7
{
  NSString *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSFileManager *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSDictionary *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSFileAttributeKey v44;
  NSNumber *v45;
  NSErrorUserInfoKey v46;
  NSString *v47;
  NSErrorUserInfoKey v48;
  NSString *v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  NSString *v63;
  __int16 v64;
  id v65;

  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), a4, a5);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    v53 = 0;
    v54 = 2082;
    v55 = "";
    v56 = 2114;
    v57 = a3;
    v58 = 2114;
    v59 = a4;
    v60 = 2114;
    v61 = a5;
    v62 = 2114;
    v63 = v13;
    v64 = 2114;
    v65 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Use local firmware asset from\", \"URL\":%{public, location:escape_only}@, \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@, \"extension\":%{public, location:escape_only}@}", buf, 0x44u);
  }
  v15 = sandbox_extension_consume(objc_msgSend(a6, "UTF8String"));
  if (v15 == -1)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v28 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v53 = 0;
      v54 = 2082;
      v55 = "";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset\"}", buf, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v29 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289026;
      v53 = 0;
      v54 = 2082;
      v55 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset\"}", buf, 0x12u);
    }
    v30 = objc_alloc((Class)NSError);
    v31 = kCLErrorDomainPrivate;
    v50 = NSLocalizedDescriptionKey;
    v51 = CFSTR("Unable to consume sandbox extension for local firmware asset");
    v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v33 = v30;
    v34 = v31;
    v35 = 35;
    goto LABEL_45;
  }
  v16 = v15;
  v17 = -[NSURL URLByAppendingPathComponent:](self->_localHawkeyeFirmwareDirectory, "URLByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR(".uarp")));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", -[NSURL path](v17, "path")))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v18 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v53 = 0;
      v54 = 2082;
      v55 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Deleting existing user provided local file for PG/PN\"}", buf, 0x12u);
    }
    v43 = 0;
    if (!-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", -[NSURL path](v17, "path"), &v43))
    {
      -[CLDurianService releaseExtension:](self, "releaseExtension:", v16);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v39 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v53 = 0;
        v54 = 2082;
        v55 = "";
        v56 = 2114;
        v57 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to delete asset in local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      v40 = objc_alloc((Class)NSError);
      v41 = kCLErrorDomainPrivate;
      v48 = NSLocalizedDescriptionKey;
      v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete asset in local cache with error: %@"), objc_msgSend(v43, "description"));
      v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v33 = v40;
      v34 = v41;
      v35 = 37;
LABEL_45:
      objc_msgSend(a7, "didUseLocalFirmwareAssetRequestForProductGroup:andProductNumber:withError:", a4, a5, objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, v35, v32));
      return;
    }
  }
  v43 = 0;
  if (-[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", objc_msgSend(a3, "path"), -[NSURL path](v17, "path"), &v43))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "setObject:forKeyedSubscript:", -[NSURL path](v17, "path"), v13);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v19 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v13), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v53 = 0;
      v54 = 2082;
      v55 = "";
      v56 = 2114;
      v57 = v13;
      v58 = 2082;
      v59 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Copied local firmware asset to local cache\", \"Product Info\":%{public, location:escape_only}@, \"local cache file\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    v42 = 0;
    v21 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v44 = NSFilePosixPermissions;
    v45 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 493);
    if (!-[NSFileManager setAttributes:ofItemAtPath:error:](v21, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1), -[NSURL path](v17, "path"), &v42))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v22 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v13), "UTF8String");
        *(_DWORD *)buf = 68289539;
        v53 = 0;
        v54 = 2082;
        v55 = "";
        v56 = 2081;
        v57 = v23;
        v58 = 2113;
        v59 = v42;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate failed to set attributes\", \"filename\":%{private, location:escape_only}s, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC278);
      }
      v24 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v25 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v13), "UTF8String");
        *(_DWORD *)buf = 68289539;
        v53 = 0;
        v54 = 2082;
        v55 = "";
        v56 = 2081;
        v57 = v25;
        v58 = 2113;
        v59 = v42;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate failed to set attributes", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate failed to set attributes\", \"filename\":%{private, location:escape_only}s, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
    v26 = a7;
    v27 = v42;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v36 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v53 = 0;
      v54 = 2082;
      v55 = "";
      v56 = 2114;
      v57 = v43;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to copy local firmware asset to local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v37 = objc_alloc((Class)NSError);
    v38 = kCLErrorDomainPrivate;
    v46 = NSLocalizedDescriptionKey;
    v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to copy local firmware asset to local cache with error: %@"), objc_msgSend(v43, "description"));
    v27 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 36, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v26 = a7;
  }
  objc_msgSend(v26, "didUseLocalFirmwareAssetRequestForProductGroup:andProductNumber:withError:", a4, a5, v27);
  -[CLDurianService releaseExtension:](self, "releaseExtension:", v16);
  -[CLDurianService informCoreUarpOfAssetChangeForProductGroup:andProductNumber:](self, "informCoreUarpOfAssetChangeForProductGroup:andProductNumber:", a4, a5);
}

- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5
{
  NSString *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSErrorUserInfoKey v15;
  NSString *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSString *v26;

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), a3, a4);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2114;
    v22 = a3;
    v23 = 2114;
    v24 = a4;
    v25 = 2114;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Use default firmware asset from\", \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@}", buf, 0x30u);
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v9)&& -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", -[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v9))&& (v14 = 0, !-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", -[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v9), &v14)))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2114;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to delete asset in local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v12 = objc_alloc((Class)NSError);
    v13 = kCLErrorDomainPrivate;
    v15 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete asset in local cache with error: %@"), objc_msgSend(v14, "description"));
    objc_msgSend(a5, "didUseDefaultFirmwareAssetRequestForProductGroup:andProductNumber:withError:", a3, a4, objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 37, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_localFirmwareUpdateAssetMap, "removeObjectForKey:", v9);
    objc_msgSend(a5, "didUseDefaultFirmwareAssetRequestForProductGroup:andProductNumber:withError:", a3, a4, 0);
    -[CLDurianService informCoreUarpOfAssetChangeForProductGroup:andProductNumber:](self, "informCoreUarpOfAssetChangeForProductGroup:andProductNumber:", a3, a4);
  }
}

- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5
{
  NSString *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  const char *v24;

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), a3, a4);
  v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v9);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "NO";
    *(_DWORD *)buf = 68290050;
    v14 = 0;
    v16 = "";
    v15 = 2082;
    if (v10)
      v12 = "YES";
    v17 = 2114;
    v18 = a3;
    v19 = 2114;
    v20 = a4;
    v21 = 2114;
    v22 = v9;
    v23 = 2082;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate check whether local firmware asset is in use for\", \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@, \"localAssetInUse\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  objc_msgSend(a5, "didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:andProductNumber:withResult:", a3, a4, v10 != 0);
}

- (void)releaseExtension:(int64_t)a3
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (sandbox_extension_release(a3, a2) == -1)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to release sandbox extension\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
    }
    v4 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Failed to release sandbox extension", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to release sandbox extension\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)informCoreUarpOfAssetChangeForProductGroup:(id)a3 andProductNumber:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v5 = -[CLDurianService getDevicesForProductGroup:andProductNumber:](self, "getDevicesForProductGroup:andProductNumber:", a3, a4);
  if (objc_msgSend(v5, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      *(_QWORD *)&v7 = 68289283;
      v15 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC278);
          v12 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            v24 = 2113;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Restart monitoring for device\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          -[CLDurianService stopMonitoringDeviceForFirmwareUpdate:](self, "stopMonitoringDeviceForFirmwareUpdate:", v11, v15);
          if (objc_msgSend(v11, "beacon"))
          {
            -[CLDurianService startMonitoringDeviceForFirmwareUpdate:](self, "startMonitoringDeviceForFirmwareUpdate:", v11);
          }
          else
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC278);
            v13 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v21 = 0;
              v22 = 2082;
              v23 = "";
              v24 = 2113;
              v25 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC278);
            }
            v14 = qword_1022A0038;
            if (os_signpost_enabled((os_log_t)qword_1022A0038))
            {
              *(_DWORD *)buf = v15;
              v21 = 0;
              v22 = 2082;
              v23 = "";
              v24 = 2113;
              v25 = v11;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      }
      while (v8);
    }
  }
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SPFirmwareUpdateSessionProtocol *spFirmwareUpdateSession;
  id v14;
  id v15;
  Block_layout *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSErrorUserInfoKey v24;
  NSString *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(a3, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetIdMap, "setObject:forKeyedSubscript:", a4, objc_msgSend(a3, "uuid"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2113;
    v31 = a3;
    v32 = 2113;
    v33 = a4;
    v34 = 2081;
    v35 = objc_msgSend(objc_msgSend(a4, "assetVersion"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate assetAvailablityUpdateForAccessoryID\", \"Accessory\":%{private, location:escape_only}@, \"AssetID\":%{private, location:escape_only}@, \"AssetVersion\":%{private, location:escape_only}s}", buf, 0x30u);
  }
  if (objc_msgSend(a4, "downloadStatus") == (id)2
    && -[CLDurianService deviceUndergoingFirmwareUpdate:](self, "deviceUndergoingFirmwareUpdate:", v7))
  {
    v9 = objc_alloc((Class)NSError);
    v10 = objc_msgSend(a4, "downloadStatus");
    v24 = NSLocalizedDescriptionKey;
    v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAssetDownloadStatusToString(objc_msgSend(a4, "downloadStatus")));
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", v7, objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("UARPDownloadFailure"), v10, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1)));
    return;
  }
  v11 = objc_msgSend(a4, "updateAvailabilityStatus");
  if (v11 == (id)3)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v17 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: kUARPFirmwareUpdateAvailabilityStatusOnLocalStorage / kUARPFirmwareUpdateAvailabilityStatusOnDropbox\"}", buf, 0x12u);
    }
    if (!-[CLDurianService deviceUndergoingFirmwareUpdate:](self, "deviceUndergoingFirmwareUpdate:", v7))
    {
      spFirmwareUpdateSession = self->_spFirmwareUpdateSession;
      v14 = objc_msgSend(a3, "uuid");
      v15 = objc_msgSend(a4, "assetVersion");
      v16 = &stru_1021BC238;
LABEL_37:
      -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", v14, 6, v15, 0, v16);
      return;
    }
    if (+[CLDurianSettings uarpPacketCaptureEnabled](CLDurianSettings, "uarpPacketCaptureEnabled"))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v18 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - going to kick off firmware update, starting UARP Packet Capture\"}", buf, 0x12u);
      }
      -[UARPController startPacketCapture:](self->_uarpController, "startPacketCapture:", CFSTR("/tmp/com.apple.locationd/hawkeyeUARPPacketCapture.pcap"));
    }
    -[UARPController accessoryReachable:](self->_uarpController, "accessoryReachable:", a3);
    -[UARPController stageFirmwareUpdateOnAccessoryList:withUserIntent:](self->_uarpController, "stageFirmwareUpdateOnAccessoryList:withUserIntent:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, 0), 1);
  }
  else if (v11 == (id)2)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v19 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = a3;
      v32 = 2113;
      v33 = a4;
      v20 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Downloading Asset\", \"Accessory\":%{private, location:esc"
            "ape_only}@, \"AssetID\":%{private, location:escape_only}@}";
      v21 = v19;
      v22 = 38;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
  else
  {
    if (v11 == (id)1)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: kUARPFirmwareUpdateAvailabilityStatusOnAssetServer\"}", buf, 0x12u);
      }
      spFirmwareUpdateSession = self->_spFirmwareUpdateSession;
      v14 = objc_msgSend(a3, "uuid");
      v15 = objc_msgSend(a4, "assetVersion");
      v16 = &stru_1021BC218;
      goto LABEL_37;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v20 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: other\"}";
      v21 = v23;
      v22 = 18;
      goto LABEL_35;
    }
  }
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  NSObject *v8;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2050;
    v17 = objc_msgSend(a4, "length");
    v18 = 2114;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - sendMessageToAccessory \", \"UARPMessageLength\":%{public}lu, \"uarpMsg\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1014ED4E8;
  block[3] = &unk_10212BBA8;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
  return 1;
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(a3, "uuid")), a5);
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2049;
    v13 = a5;
    v14 = 2049;
    v15 = a6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingProgress\", \"bytesSent\":%{private}lu, \"bytesTotal\":%{private}lu}", (uint8_t *)v9, 0x26u);
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSErrorUserInfoKey v11;
  NSString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;

  if (a5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2081;
      v18 = UARPFirmwareStagingCompletionStatusToString(a5);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingComplete - failed\", \"status\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
    v9 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPFirmwareStagingCompletionStatusToString(a5));
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(a3, "uuid")), objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("UARPStagingFailure"), a5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingComplete - Success, going to apply new FW\"}", buf, 0x12u);
    }
    -[UARPController applyStagedFirmwareOnAccessoryList:withUserIntent:](self->_uarpController, "applyStagedFirmwareOnAccessoryList:withUserIntent:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, 0), 1);
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSErrorUserInfoKey v12;
  NSString *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;

  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assetIdMap, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC278);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2081;
    v19 = UARPFirmwareApplicationStatusToString(a4);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - stagedFirmwareApplicationComplete\", \"status\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v9 = objc_alloc((Class)NSError);
    v12 = NSLocalizedDescriptionKey;
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPFirmwareApplicationStatusToString(a4));
    v10 = 1;
    v11 = objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("UARPFirmwareApplicationFailure"), a4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(a3, "uuid")), v11);
  }
  else
  {
    -[CLDurianService didUpdateFirmwareForDevice:error:](self, "didUpdateFirmwareForDevice:error:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(a3, "uuid")), 0);
    v11 = 0;
    v10 = 2;
  }
  -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", objc_msgSend(a3, "uuid"), v10, objc_msgSend(v7, "assetVersion"), v11, &stru_1021BC258);
}

- (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3
{
  id *v3;

  if (a3 - 1 > 2)
    v3 = (id *)&SPBeaconTypeNone;
  else
    v3 = (id *)*(&off_1021BC2B0 + a3 - 1);
  return *v3;
}

- (void)_attachTAUnknownBeaconToDurianDevice:(id)a3
{
  _BOOL8 v5;
  SEL v6;
  SEL v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[8];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;

  if (objc_msgSend(a3, "identifier"))
  {
    v5 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh");
    v6 = NSSelectorFromString(CFSTR("isPoshAccessory"));
    if (a3)
    {
      v7 = v6;
      if ((objc_opt_respondsToSelector(a3, v6) & 1) != 0)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC278);
        v8 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289283;
          v20 = 0;
          v21 = 2082;
          v22 = "";
          v23 = 2113;
          v24 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh enabled for TAUnknownBeacon\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        v5 = objc_msgSend(a3, "performSelector:", v7) != 0;
      }
    }
    v9 = -[CLDurianService _convertTASPAdvertisementDeviceTypeToSPBeaconType:](self, "_convertTASPAdvertisementDeviceTypeToSPBeaconType:", objc_msgSend(a3, "deviceType"));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289795;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = v11;
      v25 = 2114;
      v26 = v9;
      v27 = 1025;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian attaching TAUnknownBeacon to CLDurianDevice with beacon type\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x2Cu);
    }
    v12 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self->_deviceManager, "deviceWithUUID:beaconType:isPosh:", objc_msgSend(a3, "identifier"), v9, v5);
    if (!objc_msgSend(v12, "taUnknownBeacon"))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v13 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian successfully attach TAUnknownBeacon to CLDurianDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      objc_msgSend(v12, "setTaUnknownBeacon:", a3);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v15 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#durian received nil uuid when attaching TAUnknownBeacon to CLDurianDevice", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC278);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 16, "#durian received nil uuid when attaching TAUnknownBeacon to CLDurianDevice", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLDurianService _attachTAUnknownBeaconToDurianDevice:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
}

- (void)fetchHawkeyeAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISProductDataForDevice:forClient:](self, "fetchHawkeyeAISProductDataForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISManufacturerNameForDevice:forClient:](self, "fetchHawkeyeAISManufacturerNameForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchHawkeyeAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISModelNameForDevice:forClient:](self, "fetchHawkeyeAISModelNameForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISAccessoryCategoryForDevice:forClient:](self, "fetchHawkeyeAISAccessoryCategoryForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISAccessoryCapabilitiesForDevice:forClient:](self, "fetchHawkeyeAISAccessoryCapabilitiesForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchHawkeyeAISFirmwareVersionForDevice:forClient:](self, "fetchHawkeyeAISFirmwareVersionForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISProductDataForDevice:forClient:](self, "fetchAISProductDataForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISManufacturerNameForDevice:forClient:](self, "fetchAISManufacturerNameForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISModelNameForDevice:forClient:](self, "fetchAISModelNameForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISProtocolImplementationForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISProtocolImplementationForDevice:forClient:](self, "fetchAISProtocolImplementationForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISAccessoryCapabilitiesForDevice:forClient:](self, "fetchAISAccessoryCapabilitiesForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISAccessoryCategoryForDevice:forClient:](self, "fetchAISAccessoryCategoryForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISNetworkIDForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISNetworkIDForDevice:forClient:](self, "fetchAISNetworkIDForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISFirmwareVersionForDevice:forClient:](self, "fetchAISFirmwareVersionForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISBatteryTypeForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISBatteryTypeForDevice:forClient:](self, "fetchAISBatteryTypeForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISBatteryLevelForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISBatteryLevelForDevice:forClient:](self, "fetchAISBatteryLevelForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)fetchAISSerialNumberForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  -[CLDurianService fetchAISSerialNumberForDevice:forClient:](self, "fetchAISSerialNumberForDevice:forClient:", objc_msgSend(a3, "identifier"), a4);
}

- (void)cleanUpTAUnknownBeaconRecord:(id)a3
{
  -[CLDurianDeviceManager removeTAUnknownBeaconBackedDevice:](self->_deviceManager, "removeTAUnknownBeaconBackedDevice:", a3);
}

- (void)fetchAISProductDataForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
    v8 = objc_msgSend(v7, "createFetchAISProductDataTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(objc_msgSend(v7, "description"), "substringToIndex:", 8);
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData  - durian service\", \"item\":%{private, location:escape_only}@, \"device\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Not supported for this device type");
      objc_msgSend(a4, "didFetchAISProductDataFromDevice:productData:error:", a3, 0, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
    }
  }
}

- (void)fetchAISManufacturerNameForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
    v8 = objc_msgSend(v7, "createFetchAISManufacturerNameTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      v19 = 2114;
      v20 = objc_msgSend(v7, "prettyBeaconType");
      v21 = 2114;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS ManufacturerName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Not supported for this device type");
      objc_msgSend(a4, "didFetchAISManufacturerNameFromDevice:manufacturerName:error:", a3, &stru_1021D8FB8, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
    }
  }
}

- (void)fetchAISModelNameForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
    v8 = objc_msgSend(v7, "createFetchAISModelNameTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      v19 = 2114;
      v20 = objc_msgSend(v7, "prettyBeaconType");
      v21 = 2114;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS ModelName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Not supported for this device type");
      objc_msgSend(a4, "didFetchAISModelNameFromDevice:modelName:error:", a3, &stru_1021D8FB8, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
    }
  }
}

- (void)fetchAISProtocolImplementationForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
    v8 = objc_msgSend(v7, "createFetchAISProtocolImplementationTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation - durian service\", \"device\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    if (v8)
    {
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Not supported for this device type");
      objc_msgSend(a4, "didFetchAISProtocolImplementationFromDevice:protocolImplementation:error:", a3, 0x7FFFFFFFLL, objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
    }
  }
}

- (void)fetchAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EECFC;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

- (void)fetchAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3);
    v8 = objc_msgSend(v7, "createFetchAISAccessoryCapabilitiesTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC278);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      v19 = 2114;
      v20 = objc_msgSend(v7, "prettyBeaconType");
      v21 = 2114;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS AccessoryCapabilities\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      -[CLDurianService performTask:forClient:onDevice:](self, "performTask:forClient:onDevice:", v8, a4, v7);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Not supported for this device type");
      objc_msgSend(a4, "didFetchAISAccessoryCapabilitiesFromDevice:accessoryCapabilities:error:", a3, +[NSData data](NSData, "data"), objc_msgSend(v10, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
    }
  }
}

- (void)fetchAISNetworkIDForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EF150;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

- (void)fetchAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EF390;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

- (void)fetchAISBatteryTypeForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EF5D0;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

- (void)fetchAISBatteryLevelForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EF810;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

- (void)fetchAISSerialNumberForDevice:(id)a3 forClient:(id)a4
{
  CLDurianDeviceManager *deviceManager;
  _QWORD v8[7];

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1014EFA50;
    v8[3] = &unk_1021BC1F8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    -[CLDurianDeviceManager deviceWithUUID:withCompletion:](deviceManager, "deviceWithUUID:withCompletion:", a3, v8);
  }
}

@end
