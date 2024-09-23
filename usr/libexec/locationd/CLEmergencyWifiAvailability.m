@implementation CLEmergencyWifiAvailability

- (void)_processReceivedWiFiDeviceLinkScore:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *fReceivedCallBacks;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (fReceivedCallBacks)
  {
    if (!-[NSMutableDictionary objectForKey:](fReceivedCallBacks, "objectForKey:", CFSTR("lqmKey"))
      || -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("lqmKey"))
      && objc_msgSend(-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("lqmKey")), "unsignedIntValue") != (_DWORD)v3)
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v6 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
        v16 = 1024;
        v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s, linkScore, %u", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10213D4B8);
        v10 = 136315394;
        v11 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
        v12 = 1024;
        v13 = v3;
        v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, linkScore, %u", (const char *)&v10, 18);
        sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]", "%s\n", v9);
        if (v9 != (char *)buf)
          free(v9);
      }
      -[NSMutableDictionary setObject:forKey:](self->fReceivedCallBacks, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3), CFSTR("lqmKey"));
      -[CLEmergencyWifiAvailability submitWifiAvailabilityEventToBiome](self, "submitWifiAvailabilityEventToBiome");
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v10 = 136315138;
      v11 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
      v8 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, skipping, callbacks nil", (const char *)&v10);
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]", "%s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
}

- (void)processReceivedWiFiDeviceLinkScore:(unsigned int)a3
{
  NSObject *fQueue;
  _QWORD v4[5];
  unsigned int v5;

  fQueue = self->fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020F8F4;
  v4[3] = &unk_10213D498;
  v4[4] = self;
  v5 = a3;
  dispatch_async(fQueue, v4);
}

- (CLEmergencyWifiAvailability)initWithUniverse:(id)a3
{
  NSObject *v5;
  CLEmergencyWifiAvailability *v6;
  CLEmergencyWifiAvailability *v7;
  const char *v9;
  uint8_t *v10;
  objc_super v11;
  int v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CLEmergencyWifiAvailability initWithUniverse:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v12 = 136315138;
    v13 = "-[CLEmergencyWifiAvailability initWithUniverse:]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability initWithUniverse:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)CLEmergencyWifiAvailability;
  v6 = -[CLEmergencyWifiAvailability init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->fUniverse = (CLIntersiloUniverse *)a3;
    v6->fQueue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    -[CLEmergencyWifiAvailability setup](v7, "setup");
  }
  return v7;
}

- (void)setup
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100482244;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_setup
{
  NSObject *v3;
  CWFInterface *v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  const char *v8;
  uint8_t buf[4];
  const char *v10;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CLEmergencyWifiAvailability _setup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v7 = 136315138;
    v8 = "-[CLEmergencyWifiAvailability _setup]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v7);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setup]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v4 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
  self->fCoreWiFiInterface = v4;
  if (v4)
  {
    -[CWFInterface activate](v4, "activate");
    self->fWifiDevice = 0;
    self->fWifiManager = 0;
    self->fReceivedCallBacks = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](self->fReceivedCallBacks, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CWFInterface wakeOnWirelessEnabled](self->fCoreWiFiInterface, "wakeOnWirelessEnabled")), CFSTR("isWoWEnabledKey"));
    -[CLEmergencyWifiAvailability submitWowChangeEventToBiome](self, "submitWowChangeEventToBiome");
    -[CLEmergencyWifiAvailability registerForEventsNotification](self, "registerForEventsNotification");
  }
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  int v7;
  const char *v8;
  uint8_t buf[4];
  const char *v10;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CLEmergencyWifiAvailability dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v7 = 136315138;
    v8 = "-[CLEmergencyWifiAvailability dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v7);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  if (self->fCoreWiFiInterface)
  {
    -[CLEmergencyWifiAvailability _unregisterForEventsNotification](self, "_unregisterForEventsNotification");
    -[CWFInterface invalidate](self->fCoreWiFiInterface, "invalidate");
  }
  if (self->fWifiDevice)
    -[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications](self, "_unregisterForLqmScoreNotifications");
  v6.receiver = self;
  v6.super_class = (Class)CLEmergencyWifiAvailability;
  -[CLEmergencyWifiAvailability dealloc](&v6, "dealloc");
}

- (void)registerForEventsNotification
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004826C4;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_registerForEventsNotification
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CLEmergencyWifiAvailability _registerForEventsNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v6 = 136315138;
    v7 = "-[CLEmergencyWifiAvailability _registerForEventsNotification]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v6);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForEventsNotification]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLEmergencyWifiAvailability _setupMonitoringEvent](self, "_setupMonitoringEvent");
  -[CLEmergencyWifiAvailability _registerForLinkChangedNotifications](self, "_registerForLinkChangedNotifications");
  -[CLEmergencyWifiAvailability _registerForWowChangeNotifications](self, "_registerForWowChangeNotifications");
  -[CLEmergencyWifiAvailability _registerForLqmScoreNotifications](self, "_registerForLqmScoreNotifications");
}

- (void)unregisterForEventsNotification
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100482900;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_unregisterForEventsNotification
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CLEmergencyWifiAvailability _unregisterForEventsNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v6 = 136315138;
    v7 = "-[CLEmergencyWifiAvailability _unregisterForEventsNotification]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v6);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForEventsNotification]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications](self, "_unregisterForLinkChangedNotifications");
  -[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications](self, "_unregisterForWowChangeNotifications");
  -[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications](self, "_unregisterForLqmScoreNotifications");
}

- (void)_scheduleWifiArtifactsAllocation:(const char *)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD block[5];
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]";
    v15 = 2080;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, reason, %s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v9 = 136315394;
    v10 = "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]";
    v11 = 2080;
    v12 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, reason, %s", (const char *)&v9, 22);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100482D08;
  block[3] = &unk_10212BB58;
  block[4] = self;
  if (qword_102301390 != -1)
    dispatch_once(&qword_102301390, block);
}

- (void)_registerForLqmScoreNotifications
{
  uint64_t *v3;
  NSObject *v4;
  __WiFiDeviceClient *fWifiDevice;
  __WiFiManagerClient *fWifiManager;
  __WiFiManagerClient *v7;
  uint64_t v8;
  const __CFArray *v9;
  const __CFArray *v10;
  NSObject *v11;
  __WiFiDeviceClient *ValueAtIndex;
  CFTypeID v13;
  NSObject *v14;
  const __CFString *InterfaceName;
  _BYTE *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  char *v21;
  const char *v22;
  char *v23;
  const char *v24;
  char *v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE *v30;
  char *v31;
  char *v32;
  const char *v33;
  char *v34;
  _BYTE v35[12];
  __int16 v36;
  _BYTE *v37;
  char v38;
  int v39;
  const char *v40;
  __int16 v41;
  _BYTE *v42;
  _BYTE buf[12];
  char v44;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v3 = &qword_1022A0000;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v4 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    *(_DWORD *)v35 = 136315138;
    *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", v35);
    v21 = (char *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    WiFiDeviceClientRegisterLQMCallback(fWifiDevice, 0, self);
    CFRelease(self->fWifiDevice);
    self->fWifiDevice = 0;
  }
  fWifiManager = self->fWifiManager;
  if (fWifiManager)
    goto LABEL_11;
  v7 = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  self->fWifiManager = v7;
  if (v7)
  {
    v8 = sub_100193530();
    WiFiManagerClientScheduleWithRunLoop(v7, v8, kCFRunLoopCommonModes);
    fWifiManager = self->fWifiManager;
LABEL_11:
    v9 = (const __CFArray *)WiFiManagerClientCopyDevices(fWifiManager);
    v10 = v9;
    if (v9)
    {
      if (!CFArrayGetCount(v9))
      {
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10213D4B8);
        v11 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s, wifi zero devices", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10213D4B8);
          *(_DWORD *)v35 = 136315138;
          *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "%s, wifi zero devices", v35);
          v27 = (char *)v26;
          sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v26);
          v3 = &qword_1022A0000;
          if (v27 != buf)
            free(v27);
        }
        -[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:](self, "_scheduleWifiArtifactsAllocation:", "DevicesZero");
      }
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v10, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex && (v13 = CFGetTypeID(ValueAtIndex), v13 == WiFiDeviceClientGetTypeID()))
      {
        CFRetain(self->fWifiDevice);
        if (v3[16] != -1)
          dispatch_once(&qword_1022A0080, &stru_10213D4B8);
        v14 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
        {
          InterfaceName = (const __CFString *)WiFiDeviceClientGetInterfaceName(self->fWifiDevice);
          sub_1001A486C(InterfaceName, (uint64_t)buf);
          v16 = v44 >= 0 ? buf : *(_BYTE **)buf;
          *(_DWORD *)v35 = 136315394;
          *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          v36 = 2080;
          v37 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s, wifi interface, %s", v35, 0x16u);
          if (v44 < 0)
            operator delete(*(void **)buf);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v3[16] != -1)
            dispatch_once(&qword_1022A0080, &stru_10213D4B8);
          v28 = qword_1022A0088;
          v29 = (const __CFString *)WiFiDeviceClientGetInterfaceName(self->fWifiDevice);
          sub_1001A486C(v29, (uint64_t)v35);
          if (v38 >= 0)
            v30 = v35;
          else
            v30 = *(_BYTE **)v35;
          v39 = 136315394;
          v40 = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          v41 = 2080;
          v42 = v30;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 2, "%s, wifi interface, %s", (const char *)&v39, 22);
          v32 = v31;
          if (v38 < 0)
            operator delete(*(void **)v35);
          sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v32);
          if (v32 != buf)
            free(v32);
        }
        WiFiDeviceClientRegisterLQMCallback(self->fWifiDevice, sub_10001C060, self);
        CFRelease(v10);
      }
      else
      {
        if (v3[16] != -1)
          dispatch_once(&qword_1022A0080, &stru_10213D4B8);
        v17 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s, wifi device failure", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (v3[16] != -1)
            dispatch_once(&qword_1022A0080, &stru_10213D4B8);
          *(_DWORD *)v35 = 136315138;
          *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "%s, wifi device failure", v35);
          v23 = (char *)v22;
          sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v22);
          if (v23 != buf)
            free(v23);
        }
        -[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:](self, "_scheduleWifiArtifactsAllocation:", "DeviceFail");
        self->fWifiDevice = 0;
        CFRelease(v10);
      }
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v18 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s, wifi devices failure", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10213D4B8);
        *(_DWORD *)v35 = 136315138;
        *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "%s, wifi devices failure", v35);
        v25 = (char *)v24;
        sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v24);
        if (v25 != buf)
          free(v25);
      }
      -[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:](self, "_scheduleWifiArtifactsAllocation:", "DevicesNull");
    }
    return;
  }
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v19 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s, WiFiManagerClientCreate failed", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    *(_DWORD *)v35 = 136315138;
    *(_QWORD *)&v35[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "%s, WiFiManagerClientCreate failed", v35);
    v34 = (char *)v33;
    sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v33);
    if (v34 != buf)
      free(v34);
  }
  -[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:](self, "_scheduleWifiArtifactsAllocation:", "ManagerNull");
}

- (void)_unregisterForLqmScoreNotifications
{
  NSObject *v3;
  __WiFiDeviceClient *fWifiDevice;
  const char *v5;
  uint8_t *v6;
  int v7;
  const char *v8;
  uint8_t buf[4];
  const char *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v7 = 136315138;
    v8 = "-[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v7);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    WiFiDeviceClientRegisterLQMCallback(fWifiDevice, 0, 0);
    CFRelease(self->fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)_registerForLinkChangedNotifications
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v13 = 136315138;
    v14 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v13);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v12 = 0;
  -[CWFInterface startMonitoringEventType:error:](self->fCoreWiFiInterface, "startMonitoringEventType:error:", 6, &v12);
  if (v12)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(v12, "description");
      *(_DWORD *)buf = 136315394;
      v18 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v8 = qword_1022A0088;
      v9 = objc_msgSend(v12, "description");
      v13 = 136315394;
      v14 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
      v15 = 2112;
      v16 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "%s, error, %@", &v13, 22);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)_unregisterForLinkChangedNotifications
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v6 = 136315138;
    v7 = "-[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v6);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CWFInterface stopMonitoringEventType:](self->fCoreWiFiInterface, "stopMonitoringEventType:", 6);
}

- (void)_registerForWowChangeNotifications
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v13 = 136315138;
    v14 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v13);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v12 = 0;
  -[CWFInterface startMonitoringEventType:error:](self->fCoreWiFiInterface, "startMonitoringEventType:error:", 9, &v12);
  if (v12)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(v12, "description");
      *(_DWORD *)buf = 136315394;
      v18 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v8 = qword_1022A0088;
      v9 = objc_msgSend(v12, "description");
      v13 = 136315394;
      v14 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
      v15 = 2112;
      v16 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "%s, error, %@", &v13, 22);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)_unregisterForWowChangeNotifications
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v6 = 136315138;
    v7 = "-[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v6);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CWFInterface stopMonitoringEventType:](self->fCoreWiFiInterface, "stopMonitoringEventType:", 9);
}

- (void)_setupMonitoringEvent
{
  NSObject *v3;
  CWFInterface *fCoreWiFiInterface;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  int v11;
  const char *v12;
  uint8_t buf[4];
  const char *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v11 = 136315138;
    v12 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s", (const char *)&v11);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setupMonitoringEvent]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fCoreWiFiInterface = self->fCoreWiFiInterface;
  if (fCoreWiFiInterface)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004849F4;
    v10[3] = &unk_10213D430;
    v10[4] = self;
    -[CWFInterface setEventHandler:](fCoreWiFiInterface, "setEventHandler:", v10);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, fCoreWiFiInterface is nill", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v11 = 136315138;
      v12 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, fCoreWiFiInterface is nill", (const char *)&v11);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setupMonitoringEvent]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)submitWifiAvailabilityEventToBiome
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004850D0;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_submitWifiAvailabilityEventToBiome
{
  NSMutableDictionary *fReceivedCallBacks;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint8_t *v7;
  __int128 v8;
  uint8_t buf[4];
  const char *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (fReceivedCallBacks)
  {
    if (-[NSMutableDictionary objectForKey:](fReceivedCallBacks, "objectForKey:", CFSTR("isWiFiStartingKey"))
      && -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWiFiSwitchOnKey"))
      && -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("lqmKey")))
    {
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->fReceivedCallBacks, "enumerateKeysAndObjectsUsingBlock:", &stru_10213D470);
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "Wireless"), "WiFiAvailabilityStatus"), "source"), "sendEvent:", objc_msgSend(objc_alloc((Class)BMDeviceWiFiAvailabilityStatus), "initWithStarting:isWiFiSwitchOn:quality:", -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWiFiStartingKey")), -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWiFiSwitchOnKey")), -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("lqmKey"))));
      return;
    }
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, skipping, did not receive all the parameters", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, skipping, did not receive all the parameters", &v8);
LABEL_23:
      v7 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]", "%s\n", v5);
      if (v7 != buf)
        free(v7);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v6 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, skipping, callbacks nil", &v8);
      goto LABEL_23;
    }
  }
}

- (void)submitWowChangeEventToBiome
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004856C4;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_submitWowChangeEventToBiome
{
  NSMutableDictionary *fReceivedCallBacks;
  NSObject *v4;
  unsigned int v5;
  const __CFString *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int v11;
  const __CFString *v12;
  const char *v13;
  uint8_t *v14;
  uint8_t *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const __CFString *v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (!fReceivedCallBacks)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, skipping, callbacks nil", &v16);
LABEL_34:
    v15 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]", "%s\n", v8);
    if (v15 != buf)
      free(v15);
    return;
  }
  if (-[NSMutableDictionary objectForKey:](fReceivedCallBacks, "objectForKey:", CFSTR("isWoWEnabledKey")))
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWoWEnabledKey")), "BOOLValue");
      v6 = CFSTR("NO");
      if (v5)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v21 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, fIsWowEnabled, %@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10213D4B8);
      v10 = qword_1022A0088;
      v11 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWoWEnabledKey")), "BOOLValue");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v16 = 136315394;
      v17 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
      v18 = 2112;
      v19 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "%s, fIsWowEnabled, %@", &v16, 22);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "Wireless"), "WakeOnWiFiStatus"), "source"), "sendEvent:", objc_msgSend(objc_alloc((Class)BMDeviceWakeOnWiFiStatus), "initWithStarting:", -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", CFSTR("isWoWEnabledKey"))));
    return;
  }
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10213D4B8);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s, skipping, no WoW available", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10213D4B8);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "%s, skipping, no WoW available", &v16);
    goto LABEL_34;
  }
}

@end
