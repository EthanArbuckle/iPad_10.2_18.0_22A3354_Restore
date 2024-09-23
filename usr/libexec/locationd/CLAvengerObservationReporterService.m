@implementation CLAvengerObservationReporterService

- (id)onAppMonitorNotification:(int)a3 data:(uint64_t)a4
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v9;
  const void **v10;
  uint64_t *v11;
  unsigned __int8 *v12;
  NSObject *v13;
  const char *v14;
  unsigned int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  unsigned int v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const void **v28;

  v4 = a3;
  v20 = a3;
  v5 = *(unsigned __int8 *)(a4 + 31);
  if ((v5 & 0x80u) == 0)
    v6 = *(unsigned __int8 *)(a4 + 31);
  else
    v6 = *(_QWORD *)(a4 + 16);
  v7 = qword_102308938;
  if (byte_102308947 >= 0)
    v7 = byte_102308947;
  if (v6 != v7)
    return result;
  v9 = (unsigned __int8 *)result;
  v10 = (const void **)(a4 + 8);
  if (byte_102308947 >= 0)
    v11 = &qword_102308930;
  else
    v11 = (uint64_t *)qword_102308930;
  if ((v5 & 0x80) != 0)
  {
    result = (id)memcmp(*v10, v11, *(_QWORD *)(a4 + 16));
    if ((_DWORD)result)
      return result;
    goto LABEL_17;
  }
  if (!*(_BYTE *)(a4 + 31))
  {
LABEL_17:
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102189938);
    v13 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v14 = sub_1000BD874((int *)&v20);
      if (*(char *)(a4 + 31) < 0)
        v10 = (const void **)*v10;
      *(_DWORD *)buf = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2081;
      v26 = v14;
      v27 = 2081;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAppMonitorNotification\", \"notification\":%{private, location:escape_only}s, \"bundleId\":%{private, location:escape_only}s}", buf, 0x26u);
      v4 = v20;
    }
    v15 = v9[8];
    if (v4 <= 0xB)
    {
      if (((1 << v4) & 0xDA1) != 0)
      {
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102189938);
        v16 = qword_1022A0208;
        if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
        {
          v17 = sub_1000BD874((int *)&v20);
          *(_DWORD *)buf = 68289283;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2081;
          v26 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID\", \"notification\":%{private, location:escape_only}s}", buf, 0x1Cu);
          if (qword_1022A0200 != -1)
            dispatch_once(&qword_1022A0200, &stru_102189938);
        }
        v18 = qword_1022A0208;
        if (os_signpost_enabled((os_log_t)qword_1022A0208))
        {
          v19 = sub_1000BD874((int *)&v20);
          *(_DWORD *)buf = 68289283;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2081;
          v26 = v19;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID", "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID\", \"notification\":%{private, location:escape_only}s}", buf, 0x1Cu);
        }
      }
      else
      {
        v15 = ((1 << v4) & 0x258) != 0;
      }
    }
    return objc_msgSend(v9, "updateContext:", v15);
  }
  v12 = (unsigned __int8 *)(a4 + 8);
  while (*v12 == *(unsigned __int8 *)v11)
  {
    ++v12;
    v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v5)
      goto LABEL_17;
  }
  return result;
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  unsigned int v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  CLAvengerObservationReporterService *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT")
    && (objc_msgSend(a3, "isApple") & 1) == 0)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102189938);
    v16 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAvengerAdvertisementDetected: dropping non-Apple advertisement\"}", buf, 0x12u);
    }
  }
  else if (a4 && objc_msgSend(a4, "type"))
  {
    v22 = self;
    v7 = +[SPAdvertisement instancesRespondToSelector:](SPAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:")));
    v8 = objc_alloc((Class)SPAdvertisement);
    v9 = objc_msgSend(a3, "address");
    v10 = objc_msgSend(a3, "advertisementData");
    v11 = objc_msgSend(a3, "status");
    v12 = objc_msgSend(a3, "reserved");
    v13 = objc_msgSend(a3, "rssi");
    v14 = objc_msgSend(a3, "scanDate");
    if (v7)
    {
      LOBYTE(v21) = objc_msgSend(a3, "isPosh");
      v15 = objc_msgSend(v8, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:", v9, v10, v11, v12, v13, v14, v21);
    }
    else
    {
      v15 = objc_msgSend(v8, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", v9, v10, v11, v12, v13, v14);
    }
    v17 = objc_msgSend(objc_alloc((Class)SPBeaconPayload), "initWithAdvertisement:location:", v15, 0);
    objc_msgSend(v17, "setObservationValue:", 0);
    v18 = -[CLAvengerBeaconPayloadDedupingCache isNewPayload:](v22->_beaconPayloadCache, "isNewPayload:", v17);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102189938);
    v19 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68290051;
      v27 = 2082;
      v26 = 0;
      v28 = "";
      v29 = 2113;
      v30 = objc_msgSend(a3, "address");
      v31 = 2113;
      v32 = objc_msgSend(a3, "advertisementData");
      v33 = 2113;
      v34 = objc_msgSend(a4, "uuid");
      v35 = 1025;
      v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAvengerAdvertisementDetected: saveBeaconPayloads\", \"address\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@, \"validity\":%{private}hhd}", buf, 0x36u);
    }
    if (v18)
    {
      v20 = -[SPFinderInterface beaconPayloadCache](v22->_spFinderInterface, "beaconPayloadCache");
      v24 = v17;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100E02608;
      v23[3] = &unk_102143618;
      v23[4] = v22;
      objc_msgSend(v20, "saveBeaconPayloads:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1), v23);
    }
  }
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
  if (qword_102308950 != -1)
    dispatch_once(&qword_102308950, &stru_1021898F8);
  return (id)qword_102308948;
}

+ (BOOL)isSupported
{
  _BOOL4 v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  _WORD v8[8];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;

  if (objc_opt_class(SPFinderInterface, a2))
  {
    if ((_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures") & 1) != 0)
      LOBYTE(v2) = 1;
    else
      LOBYTE(v2) = +[CLAvengerScanner isSupported](CLAvengerScanner, "isSupported");
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_102189918);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLAvengerObservationReporterService: not supported on this platform because SPFinder.framework is not present", buf, 2u);
    }
    v2 = sub_1001BFF7C(115, 2);
    if (v2)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_102189918);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 0, "CLAvengerObservationReporterService: not supported on this platform because SPFinder.framework is not present", v8, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "+[CLAvengerObservationReporterService isSupported]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
      LOBYTE(v2) = 0;
    }
  }
  byte_102308958 = v2;
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102189938);
  v6 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 1026;
    v14 = byte_102308958;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService isSupported\", \"supported\":%{public}hhd}", buf, 0x18u);
  }
  return byte_102308958;
}

- (CLAvengerObservationReporterService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAvengerObservationReporterService;
  return -[CLAvengerObservationReporterService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAvengerObservationReporterServiceProtocol, &OBJC_PROTOCOL___CLAvengerObservationReporterClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102189938);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService beginService\"}", (uint8_t *)v4, 0x12u);
  }
  self->_spFinderInterface = (SPFinderInterface *)objc_alloc_init((Class)SPFinderInterface);
  self->_beaconPayloadCache = objc_alloc_init(CLAvengerBeaconPayloadDedupingCache);
  -[CLAvengerObservationReporterService registerForAppMonitorNotification](self, "registerForAppMonitorNotification");
  self->_currentState = 0;
  -[CLAvengerObservationReporterService updateContext:](self, "updateContext:", self->_currentContext.cameraForegrounded);
}

- (void)endService
{
  -[CLAvengerObservationReporterService unregisterForAppMonitorNotification](self, "unregisterForAppMonitorNotification");
  -[CLAvengerObservationReporterService unregisterForAvengerScanner](self, "unregisterForAvengerScanner");

}

- (void)updateContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  int64_t v4;
  NSObject *v5;
  int64_t currentState;
  _BOOL4 cameraForegrounded;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;

  self->_currentContext = a3;
  v4 = -[CLAvengerObservationReporterService determineStateWithContext:](self, "determineStateWithContext:", a3.cameraForegrounded);
  if (v4 != self->_currentState)
  {
    self->_currentState = v4;
    if (v4)
    {
      if (v4 == 1)
        -[CLAvengerObservationReporterService registerForAvengerScanner](self, "registerForAvengerScanner");
    }
    else
    {
      -[CLAvengerObservationReporterService unregisterForAvengerScanner](self, "unregisterForAvengerScanner");
    }
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102189938);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      currentState = self->_currentState;
      cameraForegrounded = self->_currentContext.cameraForegrounded;
      v8[0] = 68289538;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 1026;
      v12 = currentState;
      v13 = 1026;
      v14 = cameraForegrounded;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService changed state\", \"_currentState\":%{public}d, \"_currentContext.cameraForegrounded\":%{public}hhd}", (uint8_t *)v8, 0x1Eu);
    }
  }
}

- (int64_t)determineStateWithContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  return ~*(_DWORD *)&a3.cameraForegrounded & 1;
}

- (id)clientIdentifier
{
  return CFSTR("CLAvengerObservationReporterService");
}

- (void)registerForAvengerScanner
{
  NSObject *v3;
  CLAvengerScannerServiceProtocol *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102189938);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService received avenger scanner registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (!self->_scannerClient)
      self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:optedIn:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:optedIn:", self, objc_msgSend(objc_msgSend(-[CLAvengerObservationReporterService universe](self, "universe"), "silo"), "queue"), 0);
  }
  else if (!self->_avengerScannerProxy)
  {
    v4 = (CLAvengerScannerServiceProtocol *)objc_msgSend(objc_msgSend(-[CLAvengerObservationReporterService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLAvengerScanner"));
    self->_avengerScannerProxy = v4;
    -[CLAvengerScannerServiceProtocol registerDelegate:inSilo:](v4, "registerDelegate:inSilo:", self, -[CLAvengerObservationReporterService silo](self, "silo"));
    -[CLAvengerScannerServiceProtocol setDelegateEntityName:](self->_avengerScannerProxy, "setDelegateEntityName:", "CLAvengerObservationReporterService");
    -[CLAvengerScannerServiceProtocol startMonitoringAvengerAdvertisementsForClient:clientName:](self->_avengerScannerProxy, "startMonitoringAvengerAdvertisementsForClient:clientName:", CLISP_ME_TOKEN, CFSTR("CLAvengerObservationReporterService"));
  }
}

- (void)unregisterForAvengerScanner
{
  NSObject *v3;
  id *p_scannerClient;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102189938);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService received avenger scanner unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    if (!*p_scannerClient)
      return;
    objc_msgSend(*p_scannerClient, "stopMonitoringAvengerAdvertisementsForClient:", CLISP_ME_TOKEN);
  }

  *p_scannerClient = 0;
}

- (void)registerForAppMonitorNotification
{
  Client *value;

  value = self->_appMonitorClient.__ptr_.__value_;
  if (!value)
  {
    -[CLAvengerObservationReporterService universe](self, "universe");
    sub_1011482D0();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 4, 0);
  objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 3, 0);
  objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 2, 0);
  objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 1, 0);
}

- (void)unregisterForAppMonitorNotification
{
  Client *value;
  Client *v4;

  value = self->_appMonitorClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 4);
    objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 3);
    objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 2);
    objc_msgSend(*((id *)self->_appMonitorClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_appMonitorClient.__ptr_.__value_ + 1), 1);
    v4 = self->_appMonitorClient.__ptr_.__value_;
    self->_appMonitorClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_appMonitorClient.__ptr_.__value_;
  self->_appMonitorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
