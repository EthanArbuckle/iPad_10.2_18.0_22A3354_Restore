@implementation CLSeparationAlertsService

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  NSObject *v16;
  char *v17;
  _WORD v18[8];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;

  if (a3 < 2)
  {
LABEL_4:
    if (*((_DWORD *)a4 + 33) == 2)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v6 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v7 = "{\"msg%{public}.0s\":\"#sa received china shifted location\"}";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 0x12u);
        return;
      }
    }
    else
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received location\"}", buf, 0x12u);
      }
      v9 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)a4 + 76)), *((unsigned __int8 *)a4 + 672), *(double *)((char *)a4 + 4), *(double *)((char *)a4 + 12), *(double *)((char *)a4 + 20), *(double *)((char *)a4 + 28), *(double *)((char *)a4 + 36), *(double *)((char *)a4 + 44), *(double *)((char *)a4 + 52), *(double *)((char *)a4 + 60), *(_QWORD *)((char *)a4 + 68), *((_QWORD *)a4 + 21),
             *((_QWORD *)a4 + 22),
             *((_QWORD *)a4 + 67),
             *((_QWORD *)a4 + 68),
             *((_QWORD *)a4 + 57),
             *((_QWORD *)a4 + 58));
      -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v9);

    }
    return;
  }
  if (a3 != 22)
  {
    if (a3 != 5)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v16 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "#sa, received unhandled location notification", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v18[0] = 0;
        v17 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled location notification", v18, 2);
        sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onLocationNotification:data:]", "%s\n", v17);
        if (v17 != (char *)buf)
          free(v17);
      }
      return;
    }
    goto LABEL_4;
  }
  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v10 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10104BD1C(*((int **)a4 + 100));
    *(_DWORD *)buf = 68289283;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2049;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received WSB locations\", \"Count\":%{private}lu}", buf, 0x1Cu);
  }
  if (sub_10104BD1C(*((int **)a4 + 100)))
  {
    v12 = 0;
    for (i = 132; ; i += 156)
    {
      v14 = sub_1003471B4(*((_QWORD *)a4 + 100));
      if (*(_DWORD *)(v14 + i) == 2)
        break;
      v15 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v14 + i - 56)), 0, *(double *)(v14 + i - 128), *(double *)(v14 + i - 120), *(double *)(v14 + i - 112), *(double *)(v14 + i - 104), *(double *)(v14 + i - 96), *(double *)(v14 + i - 88), *(double *)(v14 + i - 80), *(double *)(v14 + i - 72), *(_QWORD *)(v14 + i - 64), 0xBFF0000000000000,
              0xBFF0000000000000,
              0,
              0xBFF0000000000000,
              0,
              0xBFF0000000000000);
      -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v15);

      if (++v12 >= (unint64_t)sub_10104BD1C(*((int **)a4 + 100)))
        return;
    }
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v7 = "{\"msg%{public}.0s\":\"#sa received china shifted wifi location\"}";
      goto LABEL_9;
    }
  }
}

- (void)ingestTAEventIfSAServiceRunning:(id)a3
{
  _QWORD v3[6];

  if (a3)
  {
    if (self->_saServiceManager)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_10020B1DC;
      v3[3] = &unk_10212BB30;
      v3[4] = self;
      v3[5] = a3;
      dispatch_async((dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo"), "queue"), v3);
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
  if (qword_102305AE0 != -1)
    dispatch_once(&qword_102305AE0, &stru_1021610E8);
  return (id)qword_102305AD8;
}

+ (BOOL)isSupported
{
  if (qword_102305AF0 != -1)
    dispatch_once(&qword_102305AF0, &stru_102161108);
  return byte_102305AE8;
}

- (CLSeparationAlertsService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSeparationAlertsService;
  return -[CLSeparationAlertsService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSeparationAlertsServiceProtocol, &OBJC_PROTOCOL___CLSeparationAlertsClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  SAServiceManager *v4;
  char v5;
  BOOL v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  SEL v11;
  OS_dispatch_source *v12;
  NSObject *stopLocationRequestTimer;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  const char *v18;
  uint8_t *v19;
  _QWORD handler[5];
  BOOL v21[16];
  uint8_t buf[8];
  std::__shared_weak_count *v23;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#sa initiating service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    *(_WORD *)v21 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 0, "#sa initiating service", v21, 2);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService beginService]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  self->_queue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo"), "queue");
  v4 = (SAServiceManager *)objc_msgSend(objc_alloc((Class)SAServiceManager), "initWithQueue:", self->_queue);
  self->_saServiceManager = v4;
  -[SAServiceManager addClient:](v4, "addClient:", self);
  self->_scheduledAlarms = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_dialogueRemainingAlerts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_scannerClientPoweredOn = 0;
  self->_locationManager = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/FindMyDevice.framework/"), self, self->_queue);
  self->_ownerSession = objc_opt_new(SPOwnerSession);
  sub_1001E4804(buf);
  v21[0] = 0;
  v5 = sub_1001E4874(*(uint64_t *)buf, "SeparationAlertsEnableWatchADVBufferScan", v21);
  if (v21[0])
    v6 = v5;
  else
    v6 = 0;
  self->_enableWatchADVBufferScan = v6;
  v7 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  -[CLSeparationAlertsService registerForClientManagerNotification](self, "registerForClientManagerNotification");
  -[CLSeparationAlertsService registerForGnssNotification](self, "registerForGnssNotification");
  -[CLSeparationAlertsService registerForLocationNotification](self, "registerForLocationNotification");
  -[CLSeparationAlertsService registerForRoutineMonitor](self, "registerForRoutineMonitor");
  -[CLSeparationAlertsService registerForDaemonStatusNotification](self, "registerForDaemonStatusNotification");
  -[CLSeparationAlertsService registerForBluetoothServiceNotification](self, "registerForBluetoothServiceNotification");
  -[CLSeparationAlertsService registerForDurianConnectionStateChange](self, "registerForDurianConnectionStateChange");
  -[CLSeparationAlertsService registerForDataProtectionManagerNotification](self, "registerForDataProtectionManagerNotification");
  -[CLSeparationAlertsService registerForMotionNotification](self, "registerForMotionNotification");
  -[CLSeparationAlertsService registerForVehicleStateNotification](self, "registerForVehicleStateNotification");
  -[CLSeparationAlertsService registerForCompanionConnectionUpdate](self, "registerForCompanionConnectionUpdate");
  v10 = objc_alloc_init((Class)SPOwnerInterface);
  v11 = NSSelectorFromString(CFSTR("separationMonitoringSession"));
  if ((objc_opt_respondsToSelector(v10, v11) & 1) != 0)
    self->_separationMonitoringSession = (SPSeparationMonitoringProtocol *)objc_msgSend(v10, "performSelector:", v11);
  v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_stopLocationRequestTimer = v12;
  dispatch_source_set_timer((dispatch_source_t)v12, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  stopLocationRequestTimer = self->_stopLocationRequestTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10097BF20;
  handler[3] = &unk_10212BB58;
  handler[4] = self;
  dispatch_source_set_event_handler(stopLocationRequestTimer, handler);
  dispatch_resume((dispatch_object_t)self->_stopLocationRequestTimer);
  sub_100197040();
  if (sub_10075D288())
  {
    sub_1001E4804(buf);
    v21[0] = 0;
    v14 = sub_1001E4874(*(uint64_t *)buf, "SeparationAlertsAllowUserFeedback", v21) ^ 1;
    if (v21[0])
      LOBYTE(v14) = 1;
    self->_allowSAUserFeedback = v14;
    v15 = v23;
    if (v23)
    {
      v16 = (unint64_t *)&v23->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    self->_allowSAUserFeedback = 0;
  }
}

- (void)endService
{
  NSObject *v3;
  NSObject *stopLocationRequestTimer;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#sa terminating service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 0, "#sa terminating service", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService endService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  -[CLSeparationAlertsService unregisterForCompanionConnectionUpdate](self, "unregisterForCompanionConnectionUpdate");
  -[CLSeparationAlertsService unregisterForVehicleStateNotification](self, "unregisterForVehicleStateNotification");
  -[CLSeparationAlertsService unregisterForMotionNotification](self, "unregisterForMotionNotification");
  -[CLSeparationAlertsService unregisterForDataProtectionManagerNotification](self, "unregisterForDataProtectionManagerNotification");
  -[CLSeparationAlertsService unregisterForDurianConnectionStateChange](self, "unregisterForDurianConnectionStateChange");
  -[CLSeparationAlertsService unregisterForBluetoothServiceNotification](self, "unregisterForBluetoothServiceNotification");
  -[CLSeparationAlertsService unregisterForAvengerScanner](self, "unregisterForAvengerScanner");
  -[CLSeparationAlertsService unregisterForDaemonStatusNotification](self, "unregisterForDaemonStatusNotification");
  -[CLSeparationAlertsService unregisterForRoutineMonitor](self, "unregisterForRoutineMonitor");
  -[CLSeparationAlertsService unregisterForLocationNotification](self, "unregisterForLocationNotification");
  -[CLSeparationAlertsService unregisterForGnssNotification](self, "unregisterForGnssNotification");
  -[CLSeparationAlertsService unregisterForClientManagerNotification](self, "unregisterForClientManagerNotification");
  -[CLSeparationAlertsService stopLocationSession](self, "stopLocationSession");
  stopLocationRequestTimer = self->_stopLocationRequestTimer;
  if (stopLocationRequestTimer)
  {
    dispatch_source_cancel(stopLocationRequestTimer);
    dispatch_release((dispatch_object_t)self->_stopLocationRequestTimer);
    self->_stopLocationRequestTimer = 0;
  }

  self->_locationManager = 0;
  self->_scheduledAlarms = 0;
  -[SAServiceManager removeClient:](self->_saServiceManager, "removeClient:", self);

  self->_saServiceManager = 0;
  self->_separationMonitoringSession = 0;

  self->_dialogueRemainingAlerts = 0;
  self->_ownerSession = 0;
}

- (void)registerForClientManagerNotification
{
  Client *value;

  value = self->_clientManagerClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_1001B6A0C();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 4, 0);
}

- (void)unregisterForClientManagerNotification
{
  Client *value;
  Client *v4;

  value = self->_clientManagerClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 4);
    v4 = self->_clientManagerClient.__ptr_.__value_;
    self->_clientManagerClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForGnssNotification
{
  if (!self->_gnssClient.__ptr_.__value_)
  {
    if (+[CLGnssProviderAdapter isSupported](CLGnssProviderAdapter, "isSupported"))
    {
      -[CLSeparationAlertsService universe](self, "universe");
      sub_100E087CC();
    }
  }
}

- (void)unregisterForGnssNotification
{
  Client *value;
  Client *v4;

  value = self->_gnssClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 13);
    v4 = self->_gnssClient.__ptr_.__value_;
    self->_gnssClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForLocationNotification
{
  Client *value;

  value = self->_locationClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_1006AA544();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 5, 0);
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 22, 0);
}

- (void)unregisterForLocationNotification
{
  Client *value;
  Client *v4;

  value = self->_locationClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 22);
    v4 = self->_locationClient.__ptr_.__value_;
    self->_locationClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *routineProxy;

  routineProxy = self->_routineProxy;
  if (!routineProxy)
  {
    routineProxy = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    self->_routineProxy = routineProxy;
  }
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](routineProxy, "registerDelegate:inSilo:", self, -[CLSeparationAlertsService silo](self, "silo"));
  -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:](self->_routineProxy, "startLeechingVisitsForClient:", CLISP_ME_TOKEN);
}

- (void)unregisterForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *routineProxy;

  routineProxy = self->_routineProxy;
  if (routineProxy)
  {
    -[CLRoutineMonitorServiceProtocol stopLeechingLowConfidenceVisitsForClient:](routineProxy, "stopLeechingLowConfidenceVisitsForClient:", CLISP_ME_TOKEN);
    -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineProxy, "stopLeechingVisitsForClient:", CLISP_ME_TOKEN);

  }
  self->_routineProxy = 0;
}

- (void)registerForDaemonStatusNotification
{
  Client *value;

  value = self->_daemonStatusClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_100647FA8();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 0, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 1, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 2, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 3, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 6, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 8, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 10, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 15, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 13, 0);
}

- (void)unregisterForDaemonStatusNotification
{
  Client *value;
  Client *v4;

  value = self->_daemonStatusClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 1);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 2);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 3);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 6);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 8);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 10);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 15);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 13);
    v4 = self->_daemonStatusClient.__ptr_.__value_;
    self->_daemonStatusClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForDataProtectionManagerNotification
{
  Client *value;

  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_100E35814();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 1, 0);
}

- (void)unregisterForDataProtectionManagerNotification
{
  Client *value;
  Client *v4;

  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 1);
    v4 = self->_dataProtectionManagerClient.__ptr_.__value_;
    self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForBluetoothServiceNotification
{
  Client *value;

  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_100C10C08();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 9, 0);
  objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 4, 0);
  objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 5, 0);
}

- (void)unregisterForBluetoothServiceNotification
{
  Client *value;
  Client *v4;

  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 9);
    objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 4);
    objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 5);
    v4 = self->_bluetoothServiceClient.__ptr_.__value_;
    self->_bluetoothServiceClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForMotionNotification
{
  Client *value;

  value = self->_motionStateClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_100239888();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 3, 0);
}

- (void)unregisterForMotionNotification
{
  Client *value;
  Client *v4;

  value = self->_motionStateClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 3);
    v4 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *v3;
  _QWORD handler[5];

  if (objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLVehicleStateNotifier"))&& !self->_vehicleStateProxy)
  {
    v3 = (CLVehicleStateNotifierProtocol *)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVehicleStateNotifier"));
    self->_vehicleStateProxy = v3;
    -[CLVehicleStateNotifierProtocol registerDelegate:inSilo:](v3, "registerDelegate:inSilo:", self, -[CLSeparationAlertsService silo](self, "silo"));
    -[CLVehicleStateNotifierProtocol setDelegateEntityName:](self->_vehicleStateProxy, "setDelegateEntityName:", "CLSeparationAlertsService");
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10097CF88;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(kCMVehicularStateChangedNotification, "UTF8String"), &self->_vehicularToken, (dispatch_queue_t)objc_msgSend(-[CLSeparationAlertsService silo](self, "silo"), "queue"), handler);
}

- (void)unregisterForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;

  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)registerForAvengerScanner
{
  NSObject *v3;
  CLAvengerScannerServiceProtocol *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received avenger scanner registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (!self->_scannerClient)
      self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:optedIn:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:optedIn:", self, objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo"), "queue"), 1);
  }
  else if (!self->_avengerScannerProxy)
  {
    v4 = (CLAvengerScannerServiceProtocol *)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLAvengerScanner"));
    self->_avengerScannerProxy = v4;
    -[CLAvengerScannerServiceProtocol registerDelegate:inSilo:](v4, "registerDelegate:inSilo:", self, -[CLSeparationAlertsService silo](self, "silo"));
    -[CLAvengerScannerServiceProtocol setDelegateEntityName:](self->_avengerScannerProxy, "setDelegateEntityName:", "CLSeparationAlertsService");
    -[CLAvengerScannerServiceProtocol startMonitoringAvengerAdvertisementsForClient:clientName:](self->_avengerScannerProxy, "startMonitoringAvengerAdvertisementsForClient:clientName:", CLISP_ME_TOKEN, CFSTR("CLSeparationAlertsService"));
  }
}

- (void)unregisterForAvengerScanner
{
  NSObject *v3;
  CLAvengerScannerServiceProtocol *avengerScannerProxy;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received avenger scanner unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {

    self->_scannerClient = 0;
    self->_scannerClientPoweredOn = 0;
  }
  else
  {
    avengerScannerProxy = self->_avengerScannerProxy;
    if (avengerScannerProxy)
    {
      -[CLAvengerScannerServiceProtocol stopMonitoringAvengerAdvertisementsForClient:](avengerScannerProxy, "stopMonitoringAvengerAdvertisementsForClient:", CLISP_ME_TOKEN);

      self->_avengerScannerProxy = 0;
    }
  }
}

- (void)registerForDurianConnectionStateChange
{
  NSObject *v3;
  CLDurianServiceProtocol *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received durian connection state change registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (!self->_durianServiceProxy)
  {
    v4 = (CLDurianServiceProtocol *)objc_msgSend(objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDurianService"));
    self->_durianServiceProxy = v4;
    -[CLDurianServiceProtocol registerDelegate:inSilo:](v4, "registerDelegate:inSilo:", self, -[CLSeparationAlertsService silo](self, "silo"));
    -[CLDurianServiceProtocol setDelegateEntityName:](self->_durianServiceProxy, "setDelegateEntityName:", "CLSeparationAlertsService");
    -[CLDurianServiceProtocol startMonitoringConnectionStateChangeForClient:](self->_durianServiceProxy, "startMonitoringConnectionStateChangeForClient:", CLISP_ME_TOKEN);
  }
}

- (void)unregisterForDurianConnectionStateChange
{
  NSObject *v3;
  CLDurianServiceProtocol *durianServiceProxy;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received durian connection state change unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  durianServiceProxy = self->_durianServiceProxy;
  if (durianServiceProxy)
  {
    -[CLDurianServiceProtocol stopMonitoringConnectionStateChangeForClient:](durianServiceProxy, "stopMonitoringConnectionStateChangeForClient:", CLISP_ME_TOKEN);

    self->_durianServiceProxy = 0;
  }
}

- (void)registerForCompanionConnectionUpdate
{
  NSObject *v3;
  Client *value;
  uint64_t v5;
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 68289026;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update registration\"}", (uint8_t *)&v5, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (!value)
  {
    -[CLSeparationAlertsService universe](self, "universe");
    sub_1001B6924();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 5, 0, v5);
}

- (void)unregisterForCompanionConnectionUpdate
{
  NSObject *v3;
  Client *value;
  Client *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    v5 = self->_companionClient.__ptr_.__value_;
    self->_companionClient.__ptr_.__value_ = 0;
    if (v5)
      (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  }
}

+ (int64_t)convertCLConnectionStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;

  if (a3)
  {
    if (a4)
      goto LABEL_9;
    if (a3 != 4)
    {
      if (a3 == 2)
        return 0;
LABEL_9:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v5 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
      {
        v7 = 68289026;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa connection state change is not convertible, returning default Disconnected\"}", (uint8_t *)&v7, 0x12u);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
      }
      v6 = qword_1022A0148;
      if (os_signpost_enabled((os_log_t)qword_1022A0148))
      {
        v7 = 68289026;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa connection state change is not convertible, returning default Disconnected", "{\"msg%{public}.0s\":\"#sa connection state change is not convertible, returning default Disconnected\"}", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
    return 1;
  }
  else
  {
    if (a4 != 4)
    {
      if (a4 == 2)
        return 2;
      goto LABEL_9;
    }
    return 3;
  }
}

- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v9;
  id v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;

  if (a4 != a5)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v9 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v11[0] = 68289795;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = a3;
      v16 = 1026;
      v17 = a4;
      v18 = 1026;
      v19 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa connection state updated\", \"deviceID\":%{private, location:escape_only}@, \"oldState\":%{public}d, \"newState\":%{public}d}", (uint8_t *)v11, 0x28u);
    }
    v10 = objc_msgSend(objc_alloc((Class)SAConnectionEvent), "initWithDeviceUUID:state:date:", a3, +[CLSeparationAlertsService convertCLConnectionStateChangeFromState:toState:](CLSeparationAlertsService, "convertCLConnectionStateChangeFromState:toState:", a4, a5), +[NSDate date](NSDate, "date"));
    -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v10);

  }
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (a3
    && objc_msgSend(a3, "hasArrivalDate")
    && (objc_msgSend(a3, "hasDepartureDate") & 1) == 0)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v5 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received visit\"}", (uint8_t *)v6, 0x12u);
    }
    -[CLSeparationAlertsService requestLoiRelatedTo:](self, "requestLoiRelatedTo:", a3);
  }
}

+ (id)convertRTLocationOfInterest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "type");
  if (v4)
    v5 = 2 * (v4 == (id)1);
  else
    v5 = 1;
  v6 = objc_alloc((Class)TALocationOfInterest);
  objc_msgSend(objc_msgSend(a3, "location"), "latitude");
  v8 = v7;
  objc_msgSend(objc_msgSend(a3, "location"), "longitude");
  v10 = v9;
  objc_msgSend(objc_msgSend(a3, "location"), "horizontalUncertainty");
  v12 = objc_msgSend(v6, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:", v5, objc_msgSend(objc_msgSend(a3, "location"), "referenceFrame"), +[NSDate date](NSDate, "date"), v8, v10, v11);
  v13 = v12;
  return v12;
}

- (void)sendVisit:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v5 = objc_alloc((Class)TACLVisit);
  objc_msgSend(a3, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a3, "horizontalAccuracy");
  v11 = objc_msgSend(v5, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", objc_msgSend(a3, "arrivalDate"), objc_msgSend(a3, "departureDate"), objc_msgSend(a3, "detectionDate"), 2, v7, v9, v10);
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v11);

}

- (void)requestLoiRelatedTo:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  _WORD v12[8];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;

  if (a3)
  {
    if (self->_routineProxy)
    {
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier"))
      {
        -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:](self->_routineProxy, "fetchLocationOfInterestWithIdentifier:withReply:");
        return;
      }
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v11 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2113;
        v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #loi no inferred place\", \"visit\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#sa #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v12[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 1, "#sa #loi skip requesting LOI information as routine monitor is no up", v12, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService requestLoiRelatedTo:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
    }
    -[CLSeparationAlertsService sendVisit:](self, "sendVisit:", a3);
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v5 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#sa #loi cannot request LOI information for a nil visit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 16, "#sa #loi cannot request LOI information for a nil visit", v12, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService requestLoiRelatedTo:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)onVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;
  _QWORD v4[5];

  objc_msgSend(-[CLSeparationAlertsService universe](self, "universe"), "silo");
  vehicleStateProxy = self->_vehicleStateProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10097E724;
  v4[3] = &unk_102161158;
  v4[4] = self;
  -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsAndOperatorStateWithReply:](vehicleStateProxy, "fetchVehicularDndStateAndHintsAndOperatorStateWithReply:", v4);
}

- (void)handleCompanionConnectionUpdateWithState:(int64_t)a3
{
  id v5;
  SEL v6;
  _QWORD v7[6];

  v5 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 16, a3 == 3, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v5);

  v6 = NSSelectorFromString(CFSTR("activeCompanionWithCompletion:"));
  if ((objc_opt_respondsToSelector(self->_ownerSession, v6) & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10097ECAC;
    v7[3] = &unk_1021611A8;
    v7[4] = self;
    v7[5] = a3;
    -[SPOwnerSession performSelector:withObject:](self->_ownerSession, "performSelector:withObject:", v6, v7);
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  NSObject *v12;
  _WORD v13[8];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  if (a3 == 5)
  {
    v5 = *(_BYTE *)a4;
    if (*(_BYTE *)a4)
      v6 = 3;
    else
      v6 = 1;
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v7 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1025;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received companion connection update\", \"companionIsNearby\":%{private}d}", buf, 0x18u);
    }
    sub_100197040();
    if (sub_100195F08())
    {
      -[CLSeparationAlertsService handleCompanionConnectionUpdateWithState:](self, "handleCompanionConnectionUpdateWithState:", v6);
      if (self->_enableWatchADVBufferScan)
      {
        if (v5)
          -[CLSeparationAlertsService stopWatchAdvertisementBufferScanning](self, "stopWatchAdvertisementBufferScanning");
        else
          -[CLSeparationAlertsService startWatchAdvertisementBufferScanning](self, "startWatchAdvertisementBufferScanning");
      }
    }
    else
    {
      sub_100197040();
      if (sub_1000C4240())
      {
        -[CLSeparationAlertsService handleCompanionConnectionUpdateWithState:](self, "handleCompanionConnectionUpdateWithState:", v6);
      }
      else
      {
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v11 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa received companion connection update on a non-watch/iphone device\"}", buf, 0x12u);
          if (qword_1022A0140 != -1)
            dispatch_once(&qword_1022A0140, &stru_102161258);
        }
        v12 = qword_1022A0148;
        if (os_signpost_enabled((os_log_t)qword_1022A0148))
        {
          *(_DWORD *)buf = 68289026;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa received companion connection update on a non-watch/iphone device", "{\"msg%{public}.0s\":\"#sa received companion connection update on a non-watch/iphone device\"}", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "#sa, received unhandled companion notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled companion notification", v13, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onCompanionNotification:data:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)startWatchAdvertisementBufferScanning
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v3 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa watch adv buffer scanning not supported\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (!self->_watchScanRequested)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v4 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start scanning on watch\"}", (uint8_t *)&v5, 0x12u);
    }
    -[CLAvengerScannerServiceProtocol startWatchAdvertisementBufferScan:](self->_avengerScannerProxy, "startWatchAdvertisementBufferScan:", CLISP_ME_TOKEN);
    self->_watchScanRequested = 1;
  }
}

- (void)stopWatchAdvertisementBufferScanning
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v3 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa watch adv buffer scanning not supported\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (self->_watchScanRequested)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v4 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop scanning on watch\"}", (uint8_t *)&v5, 0x12u);
    }
    -[CLAvengerScannerServiceProtocol stopWatchAdvertisementBufferScan:](self->_avengerScannerProxy, "stopWatchAdvertisementBufferScan:", CLISP_ME_TOKEN);
    self->_watchScanRequested = 0;
  }
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  _WORD v13[8];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  if (a3 == 4)
  {
    v7 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 8, *((_DWORD *)a4 + 47) == 1, +[NSDate date](NSDate, "date"));
    -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v9 = *((_DWORD *)a4 + 47);
      *(_DWORD *)buf = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1025;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received client status locationServiceEnabled\", \"LocationServicesEnabled\":%{private}d}", buf, 0x18u);
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v10 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "#sa, received unhandled location client manager notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled location client manager notification", v13, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onClientManagerNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)startLocationSessionHighAccuracy
{
  NSObject *v2;
  const char *v3;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *stopLocationRequestTimer;
  dispatch_time_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  _WORD v22[8];
  __int128 v23;
  __int16 v24;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;

  if (self->_isLocationSessionActive)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v2 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v3 = "{\"msg%{public}.0s\":\"#sa location session already active\"}";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, v3, buf, 0x12u);
    }
  }
  else if (self->_authorized)
  {
    if (self->_locationClient.__ptr_.__value_)
    {
      sub_100197040();
      if ((sub_100195F08() & 1) != 0 || (sub_100197040(), (sub_1001CE630() & 1) == 0))
      {
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v12 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v27 = 0;
          v28 = 2082;
          v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start wifi request\"}", buf, 0x12u);
        }
        objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 1, 0);
        self->_isLocationSessionActive = 1;
        stopLocationRequestTimer = self->_stopLocationRequestTimer;
        v14 = dispatch_time(0, 8000000000);
        dispatch_source_set_timer(stopLocationRequestTimer, v14, 0x1DCD65000uLL, 0x1DCD6500uLL);
      }
      else
      {
        if (self->_gnssClient.__ptr_.__value_)
        {
          __asm { FMOV            V0.2D, #-1.0 }
          v23 = _Q0;
          v24 = 0;
          v25 = 11;
          if (qword_1022A0070 != -1)
            dispatch_once(&qword_1022A0070, &stru_102161278);
          v10 = qword_1022A0078;
          if (os_log_type_enabled((os_log_t)qword_1022A0078, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#wigo,on,CLSA", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0070 != -1)
              dispatch_once(&qword_1022A0070, &stru_102161278);
            v22[0] = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0078, 0, "#wigo,on,CLSA", v22, 2);
            v19 = (uint8_t *)v18;
            sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService startLocationSessionHighAccuracy]", "%s\n", v18);
            if (v19 != buf)
              free(v19);
          }
          AnalyticsSendEventLazy(CFSTR("com.apple.locationd.position.GNSS.WIGO"), &stru_1021611C8);
          if (qword_1022A0140 != -1)
            dispatch_once(&qword_1022A0140, &stru_102161258);
          v11 = qword_1022A0148;
          if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289026;
            v27 = 0;
            v28 = 2082;
            v29 = "";
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa start no debounce\"}", buf, 0x12u);
          }
          sub_1001B3AF0();
        }
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v17 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#sa no gnss client handle", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0140 != -1)
            dispatch_once(&qword_1022A0140, &stru_102161258);
          LOWORD(v23) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 16, "#sa no gnss client handle", &v23, 2);
          v21 = (uint8_t *)v20;
          sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService startLocationSessionHighAccuracy]", "%s\n", v20);
          if (v21 != buf)
            free(v21);
        }
      }
    }
    else
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v15 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa no location client handle\"}", buf, 0x12u);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
      }
      v16 = qword_1022A0148;
      if (os_signpost_enabled((os_log_t)qword_1022A0148))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa no location client handle", "{\"msg%{public}.0s\":\"#sa no location client handle\"}", buf, 0x12u);
      }
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v2 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v3 = "{\"msg%{public}.0s\":\"#sa not authorized\"}";
      goto LABEL_6;
    }
  }
}

- (void)stopLocationSession
{
  void *p_locationClient;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;

  if (self->_isLocationSessionActive)
  {
    p_locationClient = &self->_locationClient;
    if (self->_locationClient.__ptr_.__value_)
    {
      sub_100197040();
      if ((sub_100195F08() & 1) != 0 || (sub_100197040(), (sub_1001CE630() & 1) == 0))
      {
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v7 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v12 = 0;
          v13 = 2082;
          v14 = "";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop wifi request\"}", buf, 0x12u);
        }
        v6 = 1;
      }
      else
      {
        p_locationClient = &self->_gnssClient;
        if (!self->_gnssClient.__ptr_.__value_)
        {
LABEL_22:
          self->_isLocationSessionActive = 0;
          dispatch_source_set_timer((dispatch_source_t)self->_stopLocationRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          return;
        }
        if (qword_1022A0070 != -1)
          dispatch_once(&qword_1022A0070, &stru_102161278);
        v4 = qword_1022A0078;
        if (os_log_type_enabled((os_log_t)qword_1022A0078, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#wigo,off,CLSA", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0070 != -1)
            dispatch_once(&qword_1022A0070, &stru_102161278);
          v10[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0078, 0, "#wigo,off,CLSA", v10, 2);
          v9 = (uint8_t *)v8;
          sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService stopLocationSession]", "%s\n", v8);
          if (v9 != buf)
            free(v9);
        }
        AnalyticsSendEventLazy(CFSTR("com.apple.locationd.position.GNSS.WIGO"), &stru_1021611E8);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v5 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v12 = 0;
          v13 = 2082;
          v14 = "";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stop no debounce\"}", buf, 0x12u);
        }
        v6 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)p_locationClient + 16), "unregister:forNotification:", *(_QWORD *)(*(_QWORD *)p_locationClient + 8), v6);
      goto LABEL_22;
    }
  }
}

- (void)onGnssNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  if (a3 == 13)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *((unsigned __int8 *)a4 + 824);
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2050;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received location simulation event\", \"SimulationStatus\":%{public}ld}", buf, 0x1Cu);
    }
    v7 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 9, *((unsigned __int8 *)a4 + 824), +[NSDate date](NSDate, "date"));
    goto LABEL_13;
  }
  if (!a3)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received location\"}", buf, 0x12u);
    }
    v7 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)a4 + 76)), *((unsigned __int8 *)a4 + 672), *(double *)((char *)a4 + 4), *(double *)((char *)a4 + 12), *(double *)((char *)a4 + 20), *(double *)((char *)a4 + 28), *(double *)((char *)a4 + 36), *(double *)((char *)a4 + 44), *(double *)((char *)a4 + 52), *(double *)((char *)a4 + 60), *(_QWORD *)((char *)a4 + 68), *((_QWORD *)a4 + 21),
           *((_QWORD *)a4 + 22),
           *((_QWORD *)a4 + 67),
           *((_QWORD *)a4 + 68),
           *((_QWORD *)a4 + 57),
           *((_QWORD *)a4 + 58));
LABEL_13:
    v10 = v7;
    -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

    return;
  }
  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v11 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "#sa, received unhandled location notification", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled location notification", v14, 2);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onGnssNotification:data:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  NSObject *v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT")
    && (objc_msgSend(a3, "isApple") & 1) == 0)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v16 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v17 = "{\"msg%{public}.0s\":\"#sa received advertisement and avoided ingest TASPAdvertisement for non-Apple advertisement\"}";
      goto LABEL_20;
    }
  }
  else
  {
    if (a4 && objc_msgSend(a4, "uuid") && objc_msgSend(a4, "type") == (id)1)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v7 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289283;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = objc_msgSend(a4, "uuid");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received advertisement\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      v8 = +[TASPAdvertisement instancesRespondToSelector:](TASPAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:")));
      v20 = objc_alloc((Class)TASPAdvertisement);
      v9 = objc_msgSend(a3, "address");
      v10 = objc_msgSend(a3, "advertisementData");
      v11 = objc_msgSend(a3, "status");
      v12 = objc_msgSend(a3, "reserved");
      v13 = objc_msgSend(a3, "rssi");
      v14 = objc_msgSend(a3, "scanDate");
      if (v8)
      {
        LODWORD(v19) = objc_msgSend(a3, "detailsBitmask");
        v15 = objc_msgSend(v20, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v9, v10, v11, v12, v13, v14, v19, objc_msgSend(a4, "uuid"), objc_msgSend(a3, "protocolID"));
      }
      else
      {
        v15 = objc_msgSend(v20, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:uuid:", v9, v10, v11, v12, v13, v14, objc_msgSend(a4, "uuid"));
      }
      v18 = v15;
      -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v15);

      return;
    }
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v16 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v17 = "{\"msg%{public}.0s\":\"#sa received advertisement and avoided ingest TASPAdvertisement for non-owned devices\"}";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, buf, 0x12u);
    }
  }
}

- (void)onAggressiveScanStarted
{
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan started\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = objc_msgSend(objc_alloc((Class)TAAggressiveScanState), "initWithState:date:", 2, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v4);

}

- (void)onAggressiveScanEnded
{
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan ended\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = objc_msgSend(objc_alloc((Class)TAAggressiveScanState), "initWithState:date:", 1, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v4);

}

- (void)onAdvertisementBufferEmptied
{
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v3 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received scan buffer emptied\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 15, 1, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v4);

}

- (void)onUpdatedPowerState
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (!self->_scannerClientPoweredOn && -[CLAvengerScannerClient poweredOn](self->_scannerClient, "poweredOn"))
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v3 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
      {
        v4[0] = 68289026;
        v4[1] = 0;
        v5 = 2082;
        v6 = "";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa performing long scan on power on\"}", (uint8_t *)v4, 0x12u);
      }
      -[CLAvengerScannerClient performTemporaryLongAggressiveScan](self->_scannerClient, "performTemporaryLongAggressiveScan");
    }
    self->_scannerClientPoweredOn = -[CLAvengerScannerClient poweredOn](self->_scannerClient, "poweredOn");
  }
}

- (id)clientIdentifier
{
  return CFSTR("CLSeparationAlertsService");
}

- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  id v28;
  _WORD v29[8];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v7 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status\"}", buf, 0x12u);
  }
  switch(a3)
  {
    case 0:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: initialize\"}";
        goto LABEL_22;
      }
      return;
    case 1:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: shutdown\"}";
        goto LABEL_22;
      }
      return;
    case 2:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: device sleep\"}";
        goto LABEL_22;
      }
      return;
    case 3:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v9 = "{\"msg%{public}.0s\":\"#sa received daemon status: device awake\"}";
LABEL_22:
        v10 = v8;
        v11 = 18;
        goto LABEL_23;
      }
      return;
    case 6:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v15 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_DWORD *)a4;
        v17 = *((_DWORD *)a4 + 1);
        *(_DWORD *)buf = 68289539;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1025;
        v35 = v16;
        v36 = 1025;
        v37 = v17;
        v9 = "{\"msg%{public}.0s\":\"#sa received daemon status reachability change\", \"ReachabilityOld\":%{private}d, \"
             "ReachabilityNew\":%{private}d}";
        v10 = v15;
        v11 = 30;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v9, buf, v11);
      }
      return;
    case 8:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v18 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_BYTE *)a4;
        *(_DWORD *)buf = 68289283;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1025;
        v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status airplaneMode\", \"AirplaneMode\":%{private}d}", buf, 0x18u);
      }
      v20 = *(_BYTE *)a4 != 0;
      v21 = 3;
      goto LABEL_57;
    case 10:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v22 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v23 = *(_BYTE *)a4;
        *(_DWORD *)buf = 68289283;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1025;
        v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status displayOn\", \"DisplayOn\":%{private}d}", buf, 0x18u);
      }
      v20 = *(_BYTE *)a4 != 0;
      v21 = 2;
      goto LABEL_57;
    case 13:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v24 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v25 = *(_DWORD *)a4;
        *(_DWORD *)buf = 68289283;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1025;
        v35 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status thermalLevel\", \"ThermalLevel\":%{private}d}", buf, 0x18u);
      }
      v20 = *(_DWORD *)a4 > 9;
      v21 = 7;
      goto LABEL_57;
    case 15:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v26 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_BYTE *)a4;
        *(_DWORD *)buf = 68289283;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1025;
        v35 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received daemon status batterSaveMode\", \"BatterySaverMode\":%{private}d}", buf, 0x18u);
      }
      v20 = *(_BYTE *)a4 != 0;
      v21 = 4;
LABEL_57:
      v28 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", v21, v20, +[NSDate date](NSDate, "date"));
      -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v28);

      break;
    default:
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v12 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled daemon status notification", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v29[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled daemon status notification", v29, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onDaemonStatusNotification:data:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      break;
  }
}

- (void)onDataProtectionManagerNotification:(int)a3 data:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  _WORD v21[8];
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
  _BYTE v32[128];

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v7 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received data protection notification\"}", buf, 0x12u);
  }
  if (a3 == 1)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 1025;
      LODWORD(v31) = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa got after-first-unlock event\", \"DeviceUnlockedSinceBoot\":%{private}d}", buf, 0x18u);
    }
    v9 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 11, HIDWORD(a4) & 1, +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfSAServiceRunning:", v9);

    if ((a4 & 0x100000000) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = objc_msgSend(a1[16], "monitoredRegions");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            if (qword_1022A0140 != -1)
              dispatch_once(&qword_1022A0140, &stru_102161258);
            v16 = qword_1022A0148;
            if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
            {
              v17 = objc_msgSend(v15, "identifier");
              *(_DWORD *)buf = 68289283;
              v27 = 0;
              v28 = 2082;
              v29 = "";
              v30 = 2113;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa request state for region\", \"regionUUID\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            objc_msgSend(a1[16], "requestStateForRegion:", v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v12);
      }
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v18 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "#sa, received unhandled data protection notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v21[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled data protection notification", v21, 2);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onDataProtectionManagerNotification:data:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
  }
}

- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  _WORD v15[8];
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v8 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 1026;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received bluetooth service\", \"msg\":%{public}d}", buf, 0x18u);
  }
  if ((a3 - 4) >= 2)
  {
    if (a3 == 9)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v9 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v10 = *((unsigned __int8 *)a4 + 113);
        *(_DWORD *)buf = 68289283;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 1025;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa received bluetooth service event\", \"power\":%{private}d}", buf, 0x18u);
      }
      v11 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 5, *((unsigned __int8 *)a4 + 113), +[NSDate date](NSDate, "date"));
      -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v11);

    }
    else
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v12 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled bluetooth service notification", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v15[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled bluetooth service notification", v15, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onBluetoothServiceNotification:data:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
  }
}

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  double v13;
  uint8_t *v14;
  uint8_t *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  double v19;
  uint8_t *v20;
  uint64_t v21;
  _WORD v22[8];
  uint8_t buf[1640];

  if (a3 != 3)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v12 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#sa, received unhandled motion notification", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v22[0] = 0;
    v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "#sa, received unhandled motion notification", v22, 2);
    v15 = v14;
    sub_100512490("Generic", 1, 0, 0, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n", v13);
LABEL_41:
    if (v15 != buf)
      free(v15);
    return;
  }
  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v9 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#sa, received motion state", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v22[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 2, "#sa, received motion state", v22, 2);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  if ((CLMotionActivity::isInVehicle((CLMotionActivity *)a4) & 1) != 0
    || (CLMotionActivity::isDriving((CLMotionActivity *)a4) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((CLMotionActivity::isWalking((CLMotionActivity *)a4) & 1) != 0
         || (CLMotionActivity::isRunning((CLMotionActivity *)a4) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((CLMotionActivity::isStatic((CLMotionActivity *)a4) & 1) != 0)
  {
    v10 = 1;
  }
  else if (CLMotionActivity::isCycling((CLMotionActivity *)a4))
  {
    v10 = 4;
  }
  else
  {
    v10 = 0;
  }
  if (*((double *)a4 + 10) > 0.0)
  {
    v11 = objc_msgSend(objc_alloc((Class)TAUserActivity), "initWithActivityType:date:", v10, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *((double *)a4 + 10)));
    -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v11);

    return;
  }
  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v16 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "#sa received invalid motion timestamp", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v22[0] = 0;
    LODWORD(v21) = 2;
    v19 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 2, "#sa received invalid motion timestamp", v22, v21);
    v15 = v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService onMotionStateNotification:data:]", "%s\n", v19);
    goto LABEL_41;
  }
}

- (void)separationAlertsServiceManager:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];

  v7 = objc_alloc_init((Class)NSMutableSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v13 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(objc_msgSend(v12, "identifier"), "UUIDString");
          *(_DWORD *)buf = 68289283;
          v30 = 0;
          v31 = 2082;
          v32 = "";
          v33 = 2113;
          v34 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for device\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(v12, "identifier"));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v9);
  }
  if (a5)
  {
    v15 = objc_alloc((Class)CLCircularRegion);
    objc_msgSend(a5, "coordinate");
    v17 = v16;
    v19 = v18;
    objc_msgSend(a5, "horizontalAccuracy");
    objc_msgSend(objc_msgSend(v15, "initWithCenter:radius:identifier:", CFSTR("FMFLocationRecommendation"), v17, v19, v20), "setGeoReferenceFrame:", objc_msgSend(a5, "referenceFrame"));
  }
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v21 = objc_msgSend(a6, "objectForKey:", &off_10221B900);
  if (v21)
    objc_msgSend(v21, "unsignedIntegerValue");
  -[SPSeparationMonitoringProtocol publishSeparationEventForBeacons:eventType:region:completion:](self->_separationMonitoringSession, "publishSeparationEventForBeacons:eventType:region:completion:", v7);
}

- (void)separationAlertsServiceManager:(id)a3 addGeofence:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;

  if (self->_locationManager)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa adding geofence\"}", (uint8_t *)&v9, 0x12u);
    }
    -[CLLocationManager startMonitoringForRegion:](self->_locationManager, "startMonitoringForRegion:", a4);
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v7 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to add geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v8 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to add geofence but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to add geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 removeGeofence:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;

  if (self->_locationManager)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa removing geofence\"}", (uint8_t *)&v9, 0x12u);
    }
    -[CLLocationManager stopMonitoringForRegion:](self->_locationManager, "stopMonitoringForRegion:", a4);
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v7 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to remove geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v8 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to remove geofence but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to remove geofence but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestStateForRegion:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;

  if (self->_locationManager)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa requesting geofence state\"}", (uint8_t *)&v9, 0x12u);
    }
    -[CLLocationManager requestStateForRegion:](self->_locationManager, "requestStateForRegion:", a4);
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v7 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to request geofence state but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v8 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to request geofence state but location manager doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to request geofence state but location manager doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4
{
  char v4;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;

  v4 = a4;
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (self->_scannerClient)
    {
      if ((v4 & 2) != 0)
      {
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v13 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
        {
          v15 = 68289026;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing long avenger scan\"}", (uint8_t *)&v15, 0x12u);
        }
        -[CLAvengerScannerClient performTemporaryLongAggressiveScan](self->_scannerClient, "performTemporaryLongAggressiveScan");
      }
      else if ((v4 & 1) != 0)
      {
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v6 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
        {
          v15 = 68289026;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing avenger scan\"}", (uint8_t *)&v15, 0x12u);
        }
        -[CLAvengerScannerClient performTemporaryAggressiveScan](self->_scannerClient, "performTemporaryAggressiveScan");
      }
      return;
    }
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner client doesnt exist\"}", (uint8_t *)&v15, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v9 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
      v15 = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v10 = "#sa attempted to issue scan but scanner client doesnt exist";
      v11 = "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner client doesnt exist\"}";
LABEL_32:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v15, 0x12u);
    }
  }
  else if (self->_avengerScannerProxy)
  {
    if ((v4 & 2) != 0)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v14 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289026;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing long avenger scan\"}", (uint8_t *)&v15, 0x12u);
      }
      -[CLAvengerScannerServiceProtocol performTemporaryLongAggressiveScan:](self->_avengerScannerProxy, "performTemporaryLongAggressiveScan:", CLISP_ME_TOKEN);
    }
    else if ((v4 & 1) != 0)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v7 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289026;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa performing avenger scan\"}", (uint8_t *)&v15, 0x12u);
      }
      -[CLAvengerScannerServiceProtocol performTemporaryAggressiveScan:](self->_avengerScannerProxy, "performTemporaryAggressiveScan:", CLISP_ME_TOKEN);
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v12 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner proxy doesnt exist\"}", (uint8_t *)&v15, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v9 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
      v15 = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v10 = "#sa attempted to issue scan but scanner proxy doesnt exist";
      v11 = "{\"msg%{public}.0s\":\"#sa attempted to issue scan but scanner proxy doesnt exist\"}";
      goto LABEL_32;
    }
  }
}

- (void)separationAlertsServiceManager:(id)a3 requestLocationForType:(unint64_t)a4
{
  if (!a4)
    -[CLSeparationAlertsService startLocationSessionHighAccuracy](self, "startLocationSessionHighAccuracy", a3);
}

- (void)separationAlertsServiceManager:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  id v18;

  if (-[NSMutableDictionary objectForKey:](self->_scheduledAlarms, "objectForKey:", a5))
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v11 = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2050;
      v16 = a4;
      v17 = 2114;
      v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa alarm already exist\", \"timeIntervalFromNow\":\"%{public}.1f\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v9 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
    {
      v11 = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2050;
      v16 = a4;
      v17 = 2114;
      v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa scheduling next time event\", \"timeIntervalFromNow\":\"%{public}.1f\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
    }
    v10 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.locationd.clSeparationAlertsServicePersistentTimer"), self, "onPCPersistentTimerFired:", a5, a4);
    objc_msgSend(v10, "setMinimumEarlyFireProportion:", 1.0);
    objc_msgSend(v10, "setUserVisible:", 0);
    objc_msgSend(v10, "setDisableSystemWaking:", 0);
    objc_msgSend(v10, "scheduleInQueue:", self->_queue);
    -[NSMutableDictionary setObject:forKey:](self->_scheduledAlarms, "setObject:forKey:", v10, a5);
  }
}

- (void)separationAlertsServiceManager:(id)a3 cancelSATimeEventForAlarm:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v6 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa cancelling scheduled SATimeEvent\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  -[CLSeparationAlertsService clearAndRemoveAlarm:](self, "clearAndRemoveAlarm:", a4);
}

- (void)separationAlertsServiceManagerStopLongAggressiveScan:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (self->_scannerClient)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v4 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 68289026;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stopping long avenger scan\"}", (uint8_t *)&v9, 0x12u);
      }
      -[CLAvengerScannerClient stopTemporaryLongAggressiveScan](self->_scannerClient, "stopTemporaryLongAggressiveScan");
      return;
    }
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v6 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v7 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
    {
LABEL_27:
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#sa attempted to terminate long scan but scanner proxy doesnt exist", "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
    }
  }
  else if (self->_avengerScannerProxy)
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v5 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa stopping long avenger scan\"}", (uint8_t *)&v9, 0x12u);
    }
    -[CLAvengerScannerServiceProtocol terminateTemporaryLongAggressiveScan:](self->_avengerScannerProxy, "terminateTemporaryLongAggressiveScan:", CLISP_ME_TOKEN);
  }
  else
  {
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    v8 = qword_1022A0148;
    if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_ERROR))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa attempted to terminate long scan but scanner proxy doesnt exist\"}", (uint8_t *)&v9, 0x12u);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
    }
    v7 = qword_1022A0148;
    if (os_signpost_enabled((os_log_t)qword_1022A0148))
      goto LABEL_27;
  }
}

- (void)onPCPersistentTimerFired:(id)a3
{
  NSObject *v5;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v5 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = objc_msgSend(a3, "userInfo");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa PCPersistentTimerFired, ingesting SATimeEvent\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  v6 = objc_msgSend(objc_alloc((Class)SATimeEvent), "initWithDate:", +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v6);

  -[CLSeparationAlertsService clearAndRemoveAlarm:](self, "clearAndRemoveAlarm:", objc_msgSend(a3, "userInfo"));
}

- (void)clearAndRemoveAlarm:(id)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v5 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa clearing alarm and removing it from dictionary if it exists\", \"alarmUUID\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v6 = -[NSMutableDictionary objectForKey:](self->_scheduledAlarms, "objectForKey:", a3);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_scheduledAlarms, "removeObjectForKey:", a3);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v6 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa location authorization changed\", \"authorizationStatus\":%{private}ld}", (uint8_t *)v8, 0x1Cu);
  }
  self->_authorized = a4 == 3;
  if (a4 != 3)
    -[CLSeparationAlertsService stopLocationSession](self, "stopLocationSession");
  v7 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 8, self->_authorized, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v8 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289539;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(a4, "identifier");
    v15 = 2114;
    v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa region monitoring failed\", \"regionUUID\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x26u);
  }
  v9 = objc_msgSend(objc_alloc((Class)SAGeofenceEvent), "initWithRegion:eventType:eventDate:", a4, 6, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v9);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v6 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa started monitoring region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v7 = objc_msgSend(objc_alloc((Class)SAGeofenceEvent), "initWithRegion:eventType:eventDate:", a4, 5, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v8 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289283;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa determined state for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x1Cu);
  }
  if (a4 != 2)
    a4 = a4 == 1;
  v9 = objc_msgSend(objc_alloc((Class)SAGeofenceEvent), "initWithRegion:eventType:eventDate:", a5, a4, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v9);

}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v6 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa did enter for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v7 = objc_msgSend(objc_alloc((Class)SAGeofenceEvent), "initWithRegion:eventType:eventDate:", a4, 3, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v6 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa did exit for region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  v7 = objc_msgSend(objc_alloc((Class)SAGeofenceEvent), "initWithRegion:eventType:eventDate:", a4, 4, +[NSDate date](NSDate, "date"));
  -[CLSeparationAlertsService ingestTAEventIfSAServiceRunning:](self, "ingestTAEventIfSAServiceRunning:", v7);

}

- (void)showSAUserFeedbackDialogue:(id)a3
{
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  const char *v12;
  char *v13;
  const std::string::value_type *v14;
  id v15;
  id v16;
  std::string *v17;
  CFUserNotificationRef v18;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v20;
  int v21;
  std::string *v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  std::string *v29;
  int data;
  int v31;
  std::string *v33;
  int v34;
  int v35;
  BOOL v36;
  const char *v37;
  std::string v38;
  __int16 v39;
  CFTypeRef cf;
  uint8_t buf[8];
  _BYTE v42[10];
  __int16 v43;
  id v44;

  sub_1001E4804(buf);
  sub_1001E4874(*(uint64_t *)buf, "SeparationAlertsAllowUserFeedback", &self->_allowSAUserFeedback);
  v5 = *(std::__shared_weak_count **)v42;
  if (*(_QWORD *)v42)
  {
    v6 = (unint64_t *)(*(_QWORD *)v42 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (self->_allowSAUserFeedback)
  {
    if ((double)arc4random() / 4294967300.0 > 0.4)
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v8 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#sa user will not receive feedback dialogue", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        LOWORD(v38.__r_.__value_.__l.__data_) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 0, "#sa user will not receive feedback dialogue", &v38, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService showSAUserFeedbackDialogue:]", "%s\n", v9);
LABEL_24:
        if (v10 != buf)
          free(v10);
        return;
      }
      return;
    }
    if (objc_msgSend(objc_msgSend(a3, "name"), "UTF8String"))
      v13 = (char *)objc_msgSend(objc_msgSend(a3, "name"), "UTF8String");
    else
      v13 = "device";
    sub_1015A2E04(&v38, v13);
    if (-[CLSeparationAlertsService isAirPodsProCase:](self, "isAirPodsProCase:", a3))
    {
      v14 = "AirPods Pro - case";
LABEL_31:
      std::string::assign(&v38, v14);
      goto LABEL_32;
    }
    v21 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v38.__r_.__value_.__l.__size_ != 4)
        goto LABEL_71;
      v22 = (std::string *)v38.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(v38.__r_.__value_.__r.__words[2]) != 4)
      {
LABEL_65:
        if (v21 != 5)
        {
LABEL_78:
          if (v21 != 6)
            goto LABEL_32;
          v33 = &v38;
          goto LABEL_86;
        }
        v29 = &v38;
        goto LABEL_73;
      }
      v22 = &v38;
    }
    if (LODWORD(v22->__r_.__value_.__l.__data_) == 1952867692)
    {
      if (objc_msgSend(a3, "deviceType") == (id)16
        || -[CLSeparationAlertsService isAirPodsProBuds:](self, "isAirPodsProBuds:", a3))
      {
        v14 = "AirPods - left";
        goto LABEL_31;
      }
      v21 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
      if ((*((_BYTE *)&v38.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_65;
    }
    else if ((*((_BYTE *)&v38.__r_.__value_.__s + 23) & 0x80) == 0)
    {
      goto LABEL_65;
    }
LABEL_71:
    if (v38.__r_.__value_.__l.__size_ != 5)
      goto LABEL_84;
    v29 = (std::string *)v38.__r_.__value_.__r.__words[0];
LABEL_73:
    data = (int)v29->__r_.__value_.__l.__data_;
    v31 = v29->__r_.__value_.__s.__data_[4];
    if (data == 1751607666 && v31 == 116)
    {
      if (objc_msgSend(a3, "deviceType") == (id)16
        || -[CLSeparationAlertsService isAirPodsProBuds:](self, "isAirPodsProBuds:", a3))
      {
        v14 = "AirPods - right";
        goto LABEL_31;
      }
      v21 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
      if ((*((_BYTE *)&v38.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_78;
    }
    else if ((v21 & 0x80) == 0)
    {
      goto LABEL_78;
    }
LABEL_84:
    if (v38.__r_.__value_.__l.__size_ != 6)
      goto LABEL_32;
    v33 = (std::string *)v38.__r_.__value_.__r.__words[0];
LABEL_86:
    v34 = (int)v33->__r_.__value_.__l.__data_;
    v35 = WORD2(v33->__r_.__value_.__r.__words[0]);
    v36 = v34 == 1735289203 && v35 == 25964;
    if (v36 && objc_msgSend(a3, "deviceType") == (id)16)
    {
      v14 = "AirPods Max";
      goto LABEL_31;
    }
LABEL_32:
    v15 = objc_msgSend(a3, "deviceType");
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("[Internal Only] Find My: Notify When Left Behind"), kCFUserNotificationAlertHeaderKey);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Yes - Expected"), kCFUserNotificationAlternateButtonTitleKey);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("No - Not Expected"), kCFUserNotificationOtherButtonTitleKey);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Don't ask again"), kCFUserNotificationDefaultButtonTitleKey);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &v38;
    else
      v17 = (std::string *)v38.__r_.__value_.__r.__words[0];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Did you leave %@ behind? If not, please file a radar to FindMy | iOS"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17)), kCFUserNotificationAlertMessageKey);
    v18 = CFUserNotificationCreate(kCFAllocatorDefault, 30.0, 0, 0, (CFDictionaryRef)v16);
    cf = v18;

    if (v18)
    {
      CFRetain(v18);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v18, (CFUserNotificationCallBack)sub_100985694, 0);
      if (RunLoopSource)
      {
        *(_QWORD *)buf = &cf;
        sub_10006221C((uint64_t **)&qword_102305AA8, (unint64_t *)&cf, (uint64_t)&unk_101B9EB60, (uint64_t **)buf)[5] = (uint64_t)v15;
        v20 = (__CFRunLoop *)sub_100193530();
        CFRunLoopAddSource(v20, RunLoopSource, kCFRunLoopCommonModes);
        CFRelease(RunLoopSource);
        CFRelease(cf);
LABEL_54:
        if (qword_1022A0140 != -1)
          dispatch_once(&qword_1022A0140, &stru_102161258);
        v27 = qword_1022A0148;
        if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend(a3, "identifier");
          *(_DWORD *)buf = 68289283;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v42 = 2082;
          *(_QWORD *)&v42[2] = "";
          v43 = 2113;
          v44 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa user feedback submitted\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v38.__r_.__value_.__l.__data_);
        return;
      }
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v26 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Could not create runloop source for SA user feedback", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_54;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v39 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "Could not create runloop source for SA user feedback", &v39, 2);
      v25 = (uint8_t *)v37;
      sub_100512490("Generic", 1, 0, 0, "void displaySAUserFeedback(const std::string &, SADeviceType)", "%s\n", v37);
    }
    else
    {
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v23 = qword_1022A0148;
      if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Could not create SA user feedback", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_54;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0140 != -1)
        dispatch_once(&qword_1022A0140, &stru_102161258);
      v39 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 17, "Could not create SA user feedback", &v39, 2);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 0, "void displaySAUserFeedback(const std::string &, SADeviceType)", "%s\n", v24);
    }
    if (v25 != buf)
      free(v25);
    goto LABEL_54;
  }
  if (qword_1022A0140 != -1)
    dispatch_once(&qword_1022A0140, &stru_102161258);
  v11 = qword_1022A0148;
  if (os_log_type_enabled((os_log_t)qword_1022A0148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#sa user opt out feedback dialogue", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0140 != -1)
      dispatch_once(&qword_1022A0140, &stru_102161258);
    LOWORD(v38.__r_.__value_.__l.__data_) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0148, 0, "#sa user opt out feedback dialogue", &v38, 2);
    v10 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLSeparationAlertsService showSAUserFeedbackDialogue:]", "%s\n", v12);
    goto LABEL_24;
  }
}

- (BOOL)isAirPodsProBuds:(id)a3
{
  return objc_msgSend(a3, "productId") == (id)8212 || objc_msgSend(a3, "productId") == (id)8228;
}

- (BOOL)isAirPodsProCase:(id)a3
{
  return objc_msgSend(a3, "productId") == (id)8213 || objc_msgSend(a3, "productId") == (id)8216;
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;

  value = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_companionClient.__ptr_.__value_;
  self->_companionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->_gnssClient.__ptr_.__value_;
  self->_gnssClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  v8 = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v8 + 8))(v8, a2);
  v9 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v9 + 8))(v9, a2);
  v10 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  return self;
}

@end
