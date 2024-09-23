@implementation CLRoutineMonitor

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  NSObject *v25;
  char *v26;
  _OWORD v27[8];
  _BYTE v28[28];
  _OWORD v29[8];
  _OWORD v30[2];
  _DWORD v31[4];
  uint8_t buf[4];
  int v33;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (a3 <= 21)
  {
    if (a3 != 4)
    {
      if (a3 == 14)
      {
        -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
        return;
      }
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a3 == 39)
  {
LABEL_11:
    v19 = objc_alloc((Class)CLLocation);
    v20 = *((_OWORD *)a4 + 7);
    v29[6] = *((_OWORD *)a4 + 6);
    v29[7] = v20;
    v30[0] = *((_OWORD *)a4 + 8);
    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)a4 + 140);
    v21 = *((_OWORD *)a4 + 3);
    v29[2] = *((_OWORD *)a4 + 2);
    v29[3] = v21;
    v22 = *((_OWORD *)a4 + 5);
    v29[4] = *((_OWORD *)a4 + 4);
    v29[5] = v22;
    v23 = *((_OWORD *)a4 + 1);
    v29[0] = *(_OWORD *)a4;
    v29[1] = v23;
    v24 = objc_msgSend(v19, "initWithClientLocation:", v29);
    -[CLRoutineMonitor addLocation:](self, "addLocation:", v24);

LABEL_12:
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager")), "dingAllActiveTranscriptSubscriptions");
    return;
  }
  if (a3 == 22)
  {
    if (sub_10104BD1C(*((int **)a4 + 100)))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v9 = objc_alloc((Class)CLLocation);
        v10 = sub_1003471B4(*((_QWORD *)a4 + 100));
        v11 = *(_OWORD *)(v10 + v7 + 16);
        v27[0] = *(_OWORD *)(v10 + v7);
        v27[1] = v11;
        v12 = *(_OWORD *)(v10 + v7 + 80);
        v14 = *(_OWORD *)(v10 + v7 + 32);
        v13 = *(_OWORD *)(v10 + v7 + 48);
        v27[4] = *(_OWORD *)(v10 + v7 + 64);
        v27[5] = v12;
        v27[2] = v14;
        v27[3] = v13;
        v16 = *(_OWORD *)(v10 + v7 + 112);
        v15 = *(_OWORD *)(v10 + v7 + 128);
        v17 = *(_OWORD *)(v10 + v7 + 96);
        *(_OWORD *)&v28[12] = *(_OWORD *)(v10 + v7 + 140);
        v27[7] = v16;
        *(_OWORD *)v28 = v15;
        v27[6] = v17;
        v18 = objc_msgSend(v9, "initWithClientLocation:", v27);
        -[CLRoutineMonitor addLocation:](self, "addLocation:", v18);

        ++v8;
        v7 += 156;
      }
      while (v8 < sub_10104BD1C(*((int **)a4 + 100)));
    }
    goto LABEL_12;
  }
LABEL_13:
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v25 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67240192;
    v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v31[0] = 67240192;
    v31[1] = a3;
    v26 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 17, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", v31, 8);
    sub_100512490("Generic", 1, 0, 0, "-[CLRoutineMonitor onLocationNotification:data:]", "%s\n", v26);
    if (v26 != (char *)buf)
      free(v26);
  }
}

- (void)addLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  char *v32;
  NSObject *v33;
  NSObject *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  v5 = -[CLRoutineMonitor lastLocation](self, "lastLocation");
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", -[CLLocation timestamp](v5, "timestamp"));
  if (fabs(v7) >= 1.0)
    goto LABEL_21;
  objc_msgSend(a3, "coordinate");
  v9 = v8;
  -[CLLocation coordinate](v6, "coordinate");
  if (v9 != v10)
    goto LABEL_21;
  objc_msgSend(a3, "coordinate");
  v12 = v11;
  -[CLLocation coordinate](v6, "coordinate");
  if (v12 != v13)
    goto LABEL_21;
  objc_msgSend(a3, "horizontalAccuracy");
  v15 = v14;
  -[CLLocation horizontalAccuracy](v6, "horizontalAccuracy");
  if (v15 != v16)
    goto LABEL_21;
  objc_msgSend(a3, "altitude");
  v18 = v17;
  -[CLLocation altitude](v6, "altitude");
  if (v18 != v19)
    goto LABEL_21;
  objc_msgSend(a3, "verticalAccuracy");
  v21 = v20;
  -[CLLocation verticalAccuracy](v6, "verticalAccuracy");
  if (v21 != v22)
    goto LABEL_21;
  objc_msgSend(a3, "speed");
  v24 = v23;
  -[CLLocation speed](v6, "speed");
  if (v24 != v25)
    goto LABEL_21;
  objc_msgSend(a3, "course");
  v27 = v26;
  -[CLLocation course](v6, "course");
  if (v27 == v28
    && (v29 = objc_msgSend(a3, "type"), v29 == -[CLLocation type](v6, "type"))
    && (v30 = objc_msgSend(objc_msgSend(a3, "floor"), "level"),
        v30 == (id)-[CLFloor level](-[CLLocation floor](v6, "floor"), "level")))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v31 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v41 = (uint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "dropping duplicate location, %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v38 = 138477827;
      v39 = (uint64_t)a3;
      v32 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "dropping duplicate location, %{private}@", &v38, 12);
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v32);
      if (v32 != (char *)buf)
        free(v32);
    }
  }
  else
  {
LABEL_21:
    -[CLRoutineMonitor setLastLocation:](self, "setLastLocation:", a3);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v33 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v41 = (uint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "received location, %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v38 = 138477827;
      v39 = (uint64_t)a3;
      v35 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "received location, %{private}@", &v38, 12);
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v35);
      if (v35 != (char *)buf)
        free(v35);
    }
    -[NSMutableArray addObject:](-[CLRoutineMonitor locations](self, "locations"), "addObject:", a3);
    if (-[CLRoutineMonitor updating](self, "updating"))
    {
      -[CLRoutineMonitor sendLocations](self, "sendLocations");
    }
    else
    {
      -[CLRoutineMonitor setArmed:](self, "setArmed:", 1);
      if ((unint64_t)-[NSMutableArray count](-[CLRoutineMonitor locations](self, "locations"), "count") >= 0x272)
      {
        if (qword_1022A01F0 != -1)
          dispatch_once(&qword_1022A01F0, &stru_102180AC0);
        v34 = qword_1022A01F8;
        if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v41 = 625;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#warning in-memory cache has exceeded threshold of %{public}lu, removing oldest fix", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01F0 != -1)
            dispatch_once(&qword_1022A01F0, &stru_102180AC0);
          v38 = 134349056;
          v39 = 625;
          LODWORD(v37) = 12;
          v36 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 0, "#warning in-memory cache has exceeded threshold of %{public}lu, removing oldest fix", &v38, v37);
          sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor addLocation:]", "%s\n", v36);
          if (v36 != (char *)buf)
            free(v36);
        }
        -[NSMutableArray removeObjectAtIndex:](-[CLRoutineMonitor locations](self, "locations"), "removeObjectAtIndex:", 0);
      }
    }
  }
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setLastLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setArmed:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (self->_armed != v3)
  {
    if (!-[NSMutableArray count](-[CLRoutineMonitor locations](self, "locations"), "count"))
      goto LABEL_9;
    if (-[CLRoutineMonitor authorized](self, "authorized"))
    {
      if (!v3)
      {
LABEL_9:
        if (self->_armed)
        {
          self->_armed = 0;
          -[CLRoutineMonitor stopWakeRoutinedTimer](self, "stopWakeRoutinedTimer");
        }
        return;
      }
    }
    else if (!-[CLRoutineMonitor diminishedMode](self, "diminishedMode") || !v3)
    {
      goto LABEL_9;
    }
    self->_armed = 1;
    -[CLRoutineMonitor startWakeRoutinedTimer](self, "startWakeRoutinedTimer");
  }
}

- (void)sendLocations
{
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  objc_msgSend(-[NSXPCConnection _unboostingRemoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "_unboostingRemoteObjectProxy"), "didUpdateLocations:", -[CLRoutineMonitor locations](self, "locations"));
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor locations](self, "locations"), "removeAllObjects");
  -[CLRoutineMonitor setArmed:](self, "setArmed:", 0);
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withReply:(id)a4
{
  -[RTRoutineManager fetchLocationOfInterestAtLocation:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationOfInterestAtLocation:withHandler:", a3, a4);
}

+ (BOOL)isSupported
{
  if (qword_102307CA0 != -1)
    dispatch_once(&qword_102307CA0, &stru_102180900);
  return byte_102307C98;
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
  if (qword_102307CB0 != -1)
    dispatch_once(&qword_102307CB0, &stru_102180920);
  return (id)qword_102307CA8;
}

+ (id)bundlePath
{
  if (qword_102307CC0 != -1)
    dispatch_once(&qword_102307CC0, &stru_102180940);
  return (id)qword_102307CB8;
}

- (CLRoutineMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLRoutineMonitor;
  return -[CLRoutineMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLRoutineMonitorServiceProtocol, &OBJC_PROTOCOL___CLRoutineMonitorClientProtocol);
}

- (void)beginService
{
  OS_dispatch_source *v3;
  NSObject *wakeRoutinedTimer;
  _QWORD handler[5];
  _QWORD v6[6];

  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo"), "queue"));
  self->_wakeRoutinedTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_100207198;
  v6[4] = sub_100207C9C;
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  v6[5] = self;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100D0AC9C;
  handler[3] = &unk_102149BF8;
  handler[4] = v6;
  dispatch_source_set_event_handler(wakeRoutinedTimer, handler);
  dispatch_resume((dispatch_object_t)self->_wakeRoutinedTimer);
  operator new();
}

- (void)endService
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  void *serviceLocationProvider;
  _QWORD v9[5];

  -[NSXPCConnection invalidate](-[CLRoutineMonitor connection](self, "connection"), "invalidate");
  -[CLRoutineMonitor setConnection:](self, "setConnection:", 0);
  -[NSXPCListener invalidate](-[CLRoutineMonitor listener](self, "listener"), "invalidate");
  -[CLRoutineMonitor setListener:](self, "setListener:", 0);
  value = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  serviceLocationProvider = self->_serviceLocationProvider;
  if (serviceLocationProvider)
  {
    (*(void (**)(void *))(*(_QWORD *)serviceLocationProvider + 8))(serviceLocationProvider);
    self->_serviceLocationProvider = 0;
  }
  -[RTRoutineManager stopMonitoringVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopMonitoringVisits");
  -[CLRoutineMonitor setVisitClients:](self, "setVisitClients:", 0);
  -[RTRoutineManager stopLeechingVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopLeechingVisits");
  -[CLRoutineMonitor setLeechClients:](self, "setLeechClients:", 0);
  -[RTRoutineManager stopLeechingLowConfidenceVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopLeechingLowConfidenceVisits");
  -[CLRoutineMonitor setLowConfidenceVisitLeechClients:](self, "setLowConfidenceVisitLeechClients:", 0);
  -[RTRoutineManager stopMonitoringPlaceInferences](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopMonitoringPlaceInferences");
  -[CLRoutineMonitor setCachedPlaceInferences:](self, "setCachedPlaceInferences:", 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D0AF94;
  v9[3] = &unk_102180968;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](-[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"), "enumerateKeysAndObjectsUsingBlock:", v9);
  -[CLRoutineMonitor setScenarioTriggerClients:](self, "setScenarioTriggerClients:", 0);
  -[CLRoutineMonitor setRoutineManager:](self, "setRoutineManager:", 0);
}

- (void)startMonitoringPlaceInferencesForCache
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD v7[5];
  _WORD v8[8];
  uint8_t buf[1640];

  v3 = objc_msgSend(objc_alloc((Class)RTPlaceInferenceOptions), "initWithFidelityPolicy:locations:accessPoints:", 0, &__NSArray0__struct, &__NSArray0__struct);
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v4 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start monitoring place inferences for cache", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "start monitoring place inferences for cache", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringPlaceInferencesForCache]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D0B1C4;
  v7[3] = &unk_10212BB80;
  v7[4] = self;
  -[RTRoutineManager startMonitoringPlaceInferencesWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "startMonitoringPlaceInferencesWithOptions:handler:", v3, v7);
}

- (void)startMonitoringVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  _WORD v9[8];
  uint8_t buf[4];
  __int16 v11;
  const char *v12;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (!-[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#slv telling routined to start visit monitoring", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "#slv telling routined to start visit monitoring", v9, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100D0B5A8;
    v8[3] = &unk_102180990;
    v8[4] = self;
    -[RTRoutineManager startMonitoringVisitsWithHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "startMonitoringVisitsWithHandler:", v8);
    *(_DWORD *)buf = 3600;
    v11 = 1;
    v12 = "visits";
    sub_10061DCC4();
  }
  -[NSMutableSet addObject:](-[CLRoutineMonitor visitClients](self, "visitClients"), "addObject:", a3);
  -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
}

- (void)stopMonitoringVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLRoutineMonitor visitClients](self, "visitClients"), "removeObject:", a3);
  if (!-[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#slv telling routined to stop visit monitoring", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "#slv telling routined to stop visit monitoring", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopMonitoringVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    -[RTRoutineManager stopMonitoringVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopMonitoringVisits");
    objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 12);
    objc_msgSend(*((id *)self->_awarenessClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_awarenessClient.__ptr_.__value_ + 1), 0);
  }
  -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
}

- (void)startLeechingVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  _WORD v9[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to start visit leeching", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "#slv Telling routined to start visit leeching", v9, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startLeechingVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100D0BCAC;
    v8[3] = &unk_102180990;
    v8[4] = self;
    -[RTRoutineManager startLeechingVisitsWithHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "startLeechingVisitsWithHandler:", v8);
  }
  -[NSMutableSet addObject:](-[CLRoutineMonitor leechClients](self, "leechClients"), "addObject:", a3);
}

- (void)stopLeechingVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLRoutineMonitor leechClients](self, "leechClients"), "removeObject:", a3);
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to stop visit leeching", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "#slv Telling routined to stop visit leeching", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopLeechingVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    -[RTRoutineManager stopLeechingVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopLeechingVisits");
  }
}

- (void)startLeechingLowConfidenceVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  _WORD v9[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (!-[NSMutableSet count](-[CLRoutineMonitor lowConfidenceVisitLeechClients](self, "lowConfidenceVisitLeechClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to start low confidence visit leeching", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "#slv Telling routined to start low confidence visit leeching", v9, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startLeechingLowConfidenceVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100D0C378;
    v8[3] = &unk_102180990;
    v8[4] = self;
    -[RTRoutineManager startLeechingLowConfidenceVisitsWithHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "startLeechingLowConfidenceVisitsWithHandler:", v8);
  }
  -[NSMutableSet addObject:](-[CLRoutineMonitor lowConfidenceVisitLeechClients](self, "lowConfidenceVisitLeechClients"), "addObject:", a3);
}

- (void)stopLeechingLowConfidenceVisitsForClient:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLRoutineMonitor lowConfidenceVisitLeechClients](self, "lowConfidenceVisitLeechClients"), "removeObject:", a3);
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#slv Telling routined to stop low confidence visit leeching", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "#slv Telling routined to stop low confidence visit leeching", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopLeechingLowConfidenceVisitsForClient:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    -[RTRoutineManager stopLeechingLowConfidenceVisits](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopLeechingLowConfidenceVisits");
  }
}

- (void)fetchRoutineModeFromLocation:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
    -[RTRoutineManager fetchRoutineModeFromLocation:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchRoutineModeFromLocation:withHandler:", a3, a4);
  else
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchLocationOfInterestForRegion:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
  {
    -[RTRoutineManager fetchLocationOfInterestForRegion:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationOfInterestForRegion:withHandler:", a3, a4);
  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withReply:(id)a5
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
  {
    -[RTRoutineManager setHintForRegionState:significantRegion:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "setHintForRegionState:significantRegion:withHandler:", a3, a4, a5);
  }
  else if (a5)
  {
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
  }
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
    -[RTRoutineManager fetchLocationsOfInterestAssociatedToIdentifier:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationsOfInterestAssociatedToIdentifier:withHandler:", a3, a4);
  else
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
    -[RTRoutineManager fetchLocationOfInterestWithIdentifier:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationOfInterestWithIdentifier:withHandler:", a3, a4);
  else
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withReply:(id)a5
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
    -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", a4, a5, a3);
  else
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
    -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationsOfInterestOfType:withHandler:", a3, a4);
  else
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchRecentLocationsOfInterestWithReply:(id)a3
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
  -[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLocationsOfInterestVisitedSinceDate:withHandler:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -4233600.0), a3);
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withReply:(id)a6
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
  -[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", a3, a4, a6, a5);
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  -[RTRoutineManager fetchPredictedLocationsOfInterestOnDate:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchPredictedLocationsOfInterestOnDate:withHandler:", a3, a4);
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
  -[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:", a3, a4, a5);
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  -[RTRoutineManager fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:", a3, a4);
}

- (void)dealloc
{
  NSObject *wakeRoutinedTimer;
  objc_super v4;

  -[CLRoutineMonitor setLocations:](self, "setLocations:", 0);
  -[CLRoutineMonitor setLastLocation:](self, "setLastLocation:", 0);
  -[CLRoutineMonitor setInertialSamples:](self, "setInertialSamples:", 0);
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  if (wakeRoutinedTimer)
  {
    dispatch_source_cancel(wakeRoutinedTimer);
    dispatch_release((dispatch_object_t)self->_wakeRoutinedTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLRoutineMonitor;
  -[CLRoutineMonitor dealloc](&v4, "dealloc");
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  uint64_t *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe", *(_QWORD *)&a3, a4, a5), "silo");
  if (a3)
  {
    if (a3 == 4)
    {
      -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
    }
    else
    {
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v9 = qword_1022A01F8;
      if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        v14 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLClientManager_Type::Notification}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01F0 != -1)
          dispatch_once(&qword_1022A01F0, &stru_102180AC0);
        v12[0] = 67240192;
        v12[1] = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 17, "received unhandled notification %{public, location:CLClientManager_Type::Notification}d", v12, 8);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 0, "-[CLRoutineMonitor onClientManagerNotification:data:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
  }
  else
  {
    -[CLRoutineMonitor flush](self, "flush");
    -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
    v7 = objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    if (byte_102307C97 >= 0)
      v8 = &qword_102307C80;
    else
      v8 = (uint64_t *)qword_102307C80;
    objc_msgSend(v7, "resetNotificationConsumedForIdentifier:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  }
}

- (void)addInertialData:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_102307CC8 != -1)
    dispatch_once(&qword_102307CC8, &stru_1021809B0);
  -[NSMutableArray addObject:](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "addObject:", a3);
  if (-[CLRoutineMonitor updating](self, "updating")
    && (v5 = -[NSMutableArray count](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "count"),
        (unint64_t)v5 > qword_1022FB040))
  {
    -[CLRoutineMonitor sendInertialData](self, "sendInertialData");
  }
  else if ((unint64_t)-[NSMutableArray count](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "count") >= 0x272)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v12 = 625;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#warning in-memory inertial cache has exceeded threshold of %{public}lu, removing oldest samples", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v9 = 134349056;
      v10 = 625;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 0, "#warning in-memory inertial cache has exceeded threshold of %{public}lu, removing oldest samples", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor addInertialData:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[NSMutableArray removeObjectAtIndex:](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "removeObjectAtIndex:", 0);
  }
}

- (void)onVdrNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint8_t *v24;
  double v25;
  int v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (a3)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v7 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLTSP,unknown CLVDRNotifier_Type::Notification,%u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v26 = 67109120;
      LODWORD(v27) = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 16, "CLTSP,unknown CLVDRNotifier_Type::Notification,%u", &v26);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v10 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(void **)a4;
      v12 = *((_QWORD *)a4 + 1);
      v13 = *((_QWORD *)a4 + 2);
      v14 = *((_QWORD *)a4 + 3);
      *(_DWORD *)buf = 134218752;
      v35 = v11;
      v36 = 2048;
      v37 = v12;
      v38 = 2048;
      v39 = v13;
      v40 = 2048;
      v41 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLTSP,vdr2DofMeasurementSample,t,%.3lf,dataPeriod,%.2lf,deltaCourse,%.3lf,deltaSpeed,%.3lf", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v17 = *(void **)a4;
      v18 = *((_QWORD *)a4 + 1);
      v19 = *((_QWORD *)a4 + 2);
      v20 = *((_QWORD *)a4 + 3);
      v26 = 134218752;
      v27 = v17;
      v28 = 2048;
      v29 = v18;
      v30 = 2048;
      v31 = v19;
      v32 = 2048;
      v33 = v20;
      LODWORD(v25) = 42;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 2, "CLTSP,vdr2DofMeasurementSample,t,%.3lf,dataPeriod,%.2lf,deltaCourse,%.3lf,deltaSpeed,%.3lf", COERCE_DOUBLE(&v26), v25);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    v15 = objc_msgSend(objc_alloc((Class)CLTripSegmentInertialData), "initWithTime:dataPeriodSec:deltaCourseRad:deltaSpeedMps:deltaCourseVarRad2:deltaSpeedVarMps2:deltaCourseSpeedCovarRadMps:", objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *(double *)a4), *((double *)a4 + 1), *((double *)a4 + 2), *((double *)a4 + 3), *((double *)a4 + 4), *((double *)a4 + 5), *((double *)a4 + 6));
    if (objc_msgSend(v15, "isValid"))
    {
      -[CLRoutineMonitor addInertialData:](self, "addInertialData:", v15);
    }
    else
    {
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v16 = qword_1022A01F8;
      if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "CLTSP,invalid tripSegmentInertialData,%@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01F0 != -1)
          dispatch_once(&qword_1022A01F0, &stru_102180AC0);
        v26 = 138412290;
        v27 = v15;
        LODWORD(v25) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 16, "CLTSP,invalid tripSegmentInertialData,%@", &v26, *(_QWORD *)&v25);
        v24 = (uint8_t *)v23;
        sub_100512490("Generic", 1, 0, 0, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v23);
        if (v24 != buf)
          free(v24);
      }
    }

  }
}

- (void)flush
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v3 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "flushing routine data", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "flushing routine data", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor flush]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor locations](self, "locations"), "removeAllObjects");
  -[CLRoutineMonitor setArmed:](self, "setArmed:", 0);
}

- (void)checkAuthorization
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint8_t *v7;
  _QWORD v8[2];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (sub_10019CFA0() != 1)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v4 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Location services are disabled; stopping routine data collection",
        buf,
        2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_17;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    LOWORD(v8[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 0, "Location services are disabled; stopping routine data collection",
      v8,
      2,
      v8[0]);
    goto LABEL_22;
  }
  if (sub_100BCF098((uint64_t)self->_serviceLocationProvider) != 3)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Routine system service disabled; stopping routine data collection",
        buf,
        2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_17;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    LOWORD(v8[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 0, "Routine system service disabled; stopping routine data collection",
      v8,
      2,
      v8[0]);
LABEL_22:
    v7 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor checkAuthorization]", "%s\n", v5);
    if (v7 != buf)
      free(v7);
LABEL_17:
    v3 = 0;
    goto LABEL_18;
  }
  v3 = 1;
LABEL_18:
  -[CLRoutineMonitor setAuthorized:](self, "setAuthorized:", v3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  unsigned int v11;
  NSObject *v12;
  std::string *p_p;
  NSObject *v14;
  std::string *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  std::string __p;
  audit_token_t v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  std::string *v34;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe", a3), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v6 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LocationServer received incoming connection", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    LOWORD(v26.val[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 0, "LocationServer received incoming connection", &v26, 2);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor listener:shouldAcceptNewConnection:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  if (a4)
  {
    v8 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.routine"));
    if (v8)
    {
      v9 = objc_opt_class(NSNumber, v7);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationManagerRoutineServerInterface));
        objc_msgSend(a4, "setExportedObject:", self);
        objc_msgSend(a4, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationManagerRoutineClientInterface));
        objc_msgSend(a4, "_setQueue:", objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo"), "queue"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100D0E3BC;
        v24[3] = &unk_10212BB58;
        v24[4] = self;
        objc_msgSend(a4, "setInterruptionHandler:", v24);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100D0E570;
        v23[3] = &unk_10212BB58;
        v23[4] = self;
        objc_msgSend(a4, "setInvalidationHandler:", v23);
        -[CLRoutineMonitor setConnection:](self, "setConnection:", a4);
        -[NSXPCConnection resume](-[CLRoutineMonitor connection](self, "connection"), "resume");
        LOBYTE(v10) = 1;
        return v10;
      }
    }
    v11 = objc_msgSend(a4, "processIdentifier");
    memset(&v26, 0, sizeof(v26));
    objc_msgSend(a4, "auditToken");
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v12 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_FAULT))
    {
      sub_1001A48F4(&v26, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 68289538;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 1026;
      v32 = v11;
      v33 = 2082;
      v34 = p_p;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerRoutine\", \"pid\":%{public}d, \"executable\":%{public, location:escape_only}s}", buf, 0x22u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    }
    v14 = qword_1022A01F8;
    if (os_signpost_enabled((os_log_t)qword_1022A01F8))
    {
      sub_1001A48F4(&v26, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &__p;
      else
        v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 68289538;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 1026;
      v32 = v11;
      v33 = 2082;
      v34 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "process is not entitled to use CLLocationManagerRoutine", "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerRoutine\", \"pid\":%{public}d, \"executable\":%{public, location:escape_only}s}", buf, 0x22u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
LABEL_27:
    LOBYTE(v10) = 0;
    return v10;
  }
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v16 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Why didn't we get a connection", buf, 2u);
  }
  v10 = sub_1001BFF7C(115, 0);
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    LOWORD(v26.val[0]) = 0;
    LODWORD(v22) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 17, "Why didn't we get a connection", &v26, v22);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 0, "-[CLRoutineMonitor listener:shouldAcceptNewConnection:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
    goto LABEL_27;
  }
  return v10;
}

- (void)sendInertialData
{
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  objc_msgSend(-[NSXPCConnection _unboostingRemoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "_unboostingRemoteObjectProxy"), "didUpdateInertialData:", -[CLRoutineMonitor inertialSamples](self, "inertialSamples"));
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "removeAllObjects");
}

- (void)startUpdatingLocation
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v3 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start updating location", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "start updating location", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startUpdatingLocation]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLRoutineMonitor setUpdating:](self, "setUpdating:", 1);
  -[CLRoutineMonitor sendLocations](self, "sendLocations");
}

- (void)stopUpdatingLocation
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v3 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop updating location", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "stop updating location", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopUpdatingLocation]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLRoutineMonitor setUpdating:](self, "setUpdating:", 0);
}

- (void)sendLocationsWithReply:(id)a3
{
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v5 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocationsWithReply\"}", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D0EC20;
  v6[3] = &unk_102162918;
  v6[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "remoteObjectProxy"), "didUpdateLocations:withReply:", -[CLRoutineMonitor locations](self, "locations"), v6);
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor locations](self, "locations"), "removeAllObjects");
  -[CLRoutineMonitor setArmed:](self, "setArmed:", 0);
}

- (void)setAuthorized:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (self->_authorized != v3)
  {
    self->_authorized = v3;
    -[CLRoutineMonitor setArmed:](self, "setArmed:", v3);
    -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
  }
}

- (void)startWakeRoutinedTimer
{
  NSObject *v3;
  NSObject *wakeRoutinedTimer;
  dispatch_time_t v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v3 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start wakeRoutinedTimer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "start wakeRoutinedTimer", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startWakeRoutinedTimer]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  v5 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(wakeRoutinedTimer, v5, 0x45D964B800uLL, 0);
}

- (void)stopWakeRoutinedTimer
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v3 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop wakeRoutinedTimer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "stop wakeRoutinedTimer", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopWakeRoutinedTimer]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  dispatch_source_set_timer((dispatch_source_t)self->_wakeRoutinedTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)onWakeRoutinedTimer
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (!-[CLRoutineMonitor connection](self, "connection"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v3 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wake routined", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "wake routined", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor onWakeRoutinedTimer]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLApplicationLifecycleManager")), "launchDaemon:", +[CLRoutineMonitor bundlePath](CLRoutineMonitor, "bundlePath"));
  }
}

- (void)setDiminishedMode:(BOOL)a3
{
  NSObject *v4;
  Client *value;
  NSObject *v6;
  Client *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[1640];

  if (self->_diminishedMode != a3)
  {
    self->_diminishedMode = a3;
    if (a3)
    {
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v4 = qword_1022A01F8;
      if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "entering diminished mode; starting data collection",
          buf,
          2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01F0 != -1)
          dispatch_once(&qword_1022A01F0, &stru_102180AC0);
        v12[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "entering diminished mode; starting data collection",
          v12,
          2);
        v9 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
      value = self->_filteredLocationClient.__ptr_.__value_;
      if (value)
      {
        objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 4, 0);
        objc_msgSend(*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_filteredLocationClient.__ptr_.__value_ + 1), 22, 0);
      }
    }
    else
    {
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v6 = qword_1022A01F8;
      if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "exiting diminished mode; stopping data collection",
          buf,
          2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01F0 != -1)
          dispatch_once(&qword_1022A01F0, &stru_102180AC0);
        v12[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "exiting diminished mode; stopping data collection",
          v12,
          2);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
      v7 = self->_filteredLocationClient.__ptr_.__value_;
      if (v7)
      {
        objc_msgSend(*((id *)v7 + 2), "unregister:forNotification:", *((_QWORD *)v7 + 1), 4);
        objc_msgSend(*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_filteredLocationClient.__ptr_.__value_ + 1), 22);
      }
    }
    -[CLRoutineMonitor setArmed:](self, "setArmed:", self->_diminishedMode);
  }
}

- (void)checkDiminishedMode
{
  _BOOL8 v3;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  v3 = !-[CLRoutineMonitor authorized](self, "authorized")
    && -[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count");
  -[CLRoutineMonitor setDiminishedMode:](self, "setDiminishedMode:", v3);
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  NSNumber *v7;
  NSMutableSet *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _QWORD v12[6];
  int v13;
  unint64_t v14;
  uint8_t buf[4];
  unint64_t v16;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3);
  v8 = (NSMutableSet *)-[NSMutableDictionary objectForKey:](-[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"), "objectForKey:", v7);
  if (!v8)
  {
    v8 = objc_opt_new(NSMutableSet);
    -[NSMutableDictionary setObject:forKey:](-[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"), "setObject:forKey:", v8, v7);

  }
  if (!-[NSMutableSet count](v8, "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v9 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#scenarioTrigger Telling routined to start monitoring trigger of type, %lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v13 = 134217984;
      v14 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "#scenarioTrigger Telling routined to start monitoring trigger of type, %lu", &v13);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor startMonitoringScenarioTriggerOfType:forClient:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100D0F8CC;
    v12[3] = &unk_1021809D8;
    v12[4] = self;
    v12[5] = v7;
    -[RTRoutineManager startMonitoringScenarioTriggerOfType:withHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "startMonitoringScenarioTriggerOfType:withHandler:", a3, v12);
  }
  -[NSMutableSet addObject:](v8, "addObject:", a4);
}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  unint64_t v12;
  uint8_t buf[4];
  unint64_t v14;

  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  v7 = -[NSMutableDictionary objectForKey:](-[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"), "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v7, "removeObject:", a4);
  if (!objc_msgSend(v7, "count"))
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102180AC0);
    v8 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#scenarioTrigger Telling routined to stop monitoring trigger of type, %lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102180AC0);
      v11 = 134217984;
      v12 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 1, "#scenarioTrigger Telling routined to stop monitoring trigger of type, %lu", &v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLRoutineMonitor stopMonitoringScenarioTriggerOfType:forClient:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    -[RTRoutineManager stopMonitoringScenarioTriggerOfType:](-[CLRoutineMonitor routineManager](self, "routineManager"), "stopMonitoringScenarioTriggerOfType:", a3);
  }
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 withReply:(id)a4
{
  -[RTRoutineManager fetchPlaceInferencesWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchPlaceInferencesWithOptions:handler:", a3, a4);
}

- (void)fetchCachedPlaceInferencesWithReply:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSMutableArray *v10;

  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v5 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = -[CLRoutineMonitor cachedPlaceInferences](self, "cachedPlaceInferences");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetchCachedPlaceInferences\", \"cachedPlaceInferences\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
  (*((void (**)(id, NSMutableArray *, _QWORD))a3 + 2))(a3, -[CLRoutineMonitor cachedPlaceInferences](self, "cachedPlaceInferences"), 0);
}

- (void)fetchFormattedPostalAddressesFromMeCardWithReply:(id)a3
{
  -[RTRoutineManager fetchFormattedPostalAddressesFromMeCard:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchFormattedPostalAddressesFromMeCard:", a3);
}

- (void)fetchStoredVisitsWithOptions:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager"))
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  -[RTRoutineManager fetchStoredVisitsWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchStoredVisitsWithOptions:handler:", a3, a4);
}

- (void)getStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 withReply:(id)a7
{
  id v13;
  id v14;
  id v15;
  _QWORD v16[10];

  v13 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4));
  v14 = objc_alloc((Class)RTStoredVisitFetchOptions);
  v15 = objc_msgSend(v14, "initWithAscending:confidence:dateInterval:limit:", 1, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh), v13, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D1024C;
  v16[3] = &unk_102180A00;
  *(double *)&v16[7] = a3;
  *(double *)&v16[8] = a4;
  *(double *)&v16[9] = a5;
  v16[4] = objc_msgSend(-[CLRoutineMonitor vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLRoutineMonitor"), CFSTR("CLRoutineMonitor"));
  v16[5] = a6;
  v16[6] = a7;
  -[RTRoutineManager fetchStoredVisitsWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchStoredVisitsWithOptions:handler:", v15, v16);
}

- (void)zipperedStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 custeredWithVisits:(id)a7 withReply:(id)a8
{
  NSDate *v15;
  NSDate *v16;
  NSObject *v17;
  uint64_t *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  _QWORD v29[16];
  _QWORD v30[3];
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  _QWORD v38[4];
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[3];
  int v44;
  uint8_t v45[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  uint8_t buf[8];
  _BYTE v56[32];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  NSDate *v61;
  __int16 v62;
  NSDate *v63;

  v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
  v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
  v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3);
  v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4);
  v26 = objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v15, v16), 0, 0, 0.0);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102180AE0);
  v17 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68290562;
    *(_WORD *)v56 = 2082;
    *(_QWORD *)&v56[2] = "";
    *(_WORD *)&v56[10] = 2050;
    *(_QWORD *)&v56[12] = objc_msgSend(a6, "count");
    *(_WORD *)&v56[20] = 2050;
    *(_QWORD *)&v56[22] = objc_msgSend(a7, "count");
    *(_WORD *)&v56[30] = 2050;
    v57 = (uint64_t)a3;
    v58 = 2050;
    v59 = (uint64_t)a4;
    v60 = 2114;
    v61 = v15;
    v62 = 2114;
    v63 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#storedLocations: zipper start\", \"IntervalCount\":%{public}ld, \"VisitCount\":%{public}ld, \"startTime\":%{public}ld, \"endTime\":%{public}ld, \"FromDate\":%{public, location:escape_only}@, \"ToDate\":%{public, location:escape_only}@}", buf, 0x4Eu);
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0xFFEFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v56 = buf;
  *(_QWORD *)&v56[8] = 0x3052000000;
  *(_QWORD *)&v56[16] = sub_100207198;
  *(_QWORD *)&v56[24] = sub_100207C9C;
  v57 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_100207198;
  v36 = sub_100207C9C;
  v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100D109F4;
  v29[3] = &unk_102180A28;
  v29[8] = v43;
  v29[9] = v30;
  v29[10] = &v32;
  v29[11] = v38;
  *(double *)&v29[15] = a5;
  v29[4] = a6;
  v29[5] = a7;
  v29[12] = v41;
  v29[13] = buf;
  v29[14] = v39;
  v29[6] = v27;
  v29[7] = v28;
  -[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:](-[CLRoutineMonitor routineManager](self, "routineManager", a8), "enumerateStoredLocationsWithOptions:usingBlock:", v26, v29);
  v18 = v33;
  v19 = (void *)v33[5];
  if (v19)
  {

    v18 = v33;
  }
  v18[5] = 0;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102180AE0);
  v20 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    v21 = -[NSMutableArray count](v28, "count");
    v22 = -[NSMutableArray count](v27, "count");
    *(_DWORD *)v45 = 68289794;
    v46 = 0;
    v47 = 2082;
    v48 = "";
    v49 = 2050;
    v50 = v21;
    v51 = 2050;
    v52 = v22;
    v53 = 2050;
    v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#storedLocations: zipper finished\", \"LocationCount\":%{public}ld, \"ClusteredCount\":%{public}ld, \"UnattributedIntervals\":%{public}ld}", v45, 0x30u);
  }
  v23 = sub_100D11174(v28, 0x64u);
  v24 = sub_100D11174(v27, 0x64u);
  (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v23, v24);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

- (void)fetchEstimatedLocationAtDate:(id)a3 withReply:(id)a4
{
  NSObject *v7;
  int v8;
  int v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  NSDictionary *v15;
  _QWORD v16[7];
  BOOL v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[8];
  _QWORD v21[2];

  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v7 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v21[0]) = 2082;
    *(_QWORD *)((char *)v21 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate\"}", buf, 0x12u);
  }
  sub_1001E4804(buf);
  v17 = 0;
  v8 = sub_1001E4874(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v17);
  if (v17)
    v9 = 0;
  else
    v9 = v8;
  v10 = (std::__shared_weak_count *)v21[0];
  if (v21[0])
  {
    v11 = (unint64_t *)(v21[0] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_13;
LABEL_19:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100D11808;
      v16[3] = &unk_102180A50;
      v16[4] = self;
      v16[5] = a3;
      v16[6] = a4;
      -[CLRoutineMonitor sendLocationsWithReply:](self, "sendLocationsWithReply:", v16);
      return;
    }
  }
  if (!v9)
    goto LABEL_19;
LABEL_13:
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v13 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v21[0]) = 2082;
    *(_QWORD *)((char *)v21 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate is disabled\"}", buf, 0x12u);
  }
  v14 = objc_alloc((Class)NSError);
  v18 = NSLocalizedDescriptionKey;
  v19 = CFSTR("fetchEstimatedLocationAtDate is disabled");
  v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, objc_msgSend(v14, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v15));
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 withReply:(id)a5
{
  NSObject *v9;
  int v10;
  int v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  NSDictionary *v17;
  _QWORD v18[8];
  BOOL v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  uint8_t buf[8];
  _QWORD v23[2];

  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v9 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v23[0]) = 2082;
    *(_QWORD *)((char *)v23 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDateOptions\"}", buf, 0x12u);
  }
  sub_1001E4804(buf);
  v19 = 0;
  v10 = sub_1001E4874(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v19);
  if (v19)
    v11 = 0;
  else
    v11 = v10;
  v12 = (std::__shared_weak_count *)v23[0];
  if (v23[0])
  {
    v13 = (unint64_t *)(v23[0] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      if (v11)
        goto LABEL_13;
LABEL_19:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100D11BB0;
      v18[3] = &unk_102180A78;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      v18[7] = a5;
      -[CLRoutineMonitor sendLocationsWithReply:](self, "sendLocationsWithReply:", v18);
      return;
    }
  }
  if (!v11)
    goto LABEL_19;
LABEL_13:
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102180AC0);
  v15 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v23[0]) = 2082;
    *(_QWORD *)((char *)v23 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine fetchEstimatedLocationAtDate is disabled\"}", buf, 0x12u);
  }
  v16 = objc_alloc((Class)NSError);
  v20 = NSLocalizedDescriptionKey;
  v21 = CFSTR("fetchEstimatedLocationAtDate is disabled");
  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, objc_msgSend(v16, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v17));
}

- (void)fetchLookbackWindowStartDateWithReply:(id)a3
{
  -[RTRoutineManager fetchLookbackWindowStartDateWithHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchLookbackWindowStartDateWithHandler:", a3);
}

- (void)fetchRemoteStatusWithReply:(id)a3
{
  -[RTRoutineManager fetchRemoteStatusWithHandler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchRemoteStatusWithHandler:", a3);
}

- (void)enumerateStoredLocationsWithOptions:(id)a3 withReply:(id)a4
{
  CLOSTransaction *v7;
  _QWORD v8[5];

  v7 = -[CLOSTransaction initWithDescription:]([CLOSTransaction alloc], "initWithDescription:", "CLRoutineMonitor.enumerateStoredLocations");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D11D94;
  v8[3] = &unk_102180AA0;
  v8[4] = a4;
  -[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:](-[CLRoutineMonitor routineManager](self, "routineManager"), "enumerateStoredLocationsWithOptions:usingBlock:", a3, v8);

  (*((void (**)(id, _QWORD, _QWORD, uint64_t))a4 + 2))(a4, 0, 0, 1);
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  CLOSTransaction *v7;

  v7 = -[CLOSTransaction initWithDescription:]([CLOSTransaction alloc], "initWithDescription:", "CLRoutineMonitor.fetchBackgroundInertialOdometrySamplesWithOptions");
  -[RTRoutineManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:](-[CLRoutineMonitor routineManager](self, "routineManager"), "fetchBackgroundInertialOdometrySamplesWithOptions:handler:", a3, a4);

}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setLocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (BOOL)updatingPredictedApplications
{
  return self->_updatingPredictedApplications;
}

- (void)setUpdatingPredictedApplications:(BOOL)a3
{
  self->_updatingPredictedApplications = a3;
}

- (NSMutableArray)inertialSamples
{
  return self->_inertialSamples;
}

- (void)setInertialSamples:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (BOOL)armed
{
  return self->_armed;
}

- (BOOL)diminishedMode
{
  return self->_diminishedMode;
}

- (void)setRoutineManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSMutableSet)visitClients
{
  return self->_visitClients;
}

- (void)setVisitClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSMutableSet)leechClients
{
  return self->_leechClients;
}

- (void)setLeechClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSMutableSet)lowConfidenceVisitLeechClients
{
  return self->_lowConfidenceVisitLeechClients;
}

- (void)setLowConfidenceVisitLeechClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSMutableDictionary)scenarioTriggerClients
{
  return self->_scenarioTriggerClients;
}

- (void)setScenarioTriggerClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSMutableArray)cachedPlaceInferences
{
  return self->_cachedPlaceInferences;
}

- (void)setCachedPlaceInferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;

  value = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_vdrNotifierClient.__ptr_.__value_;
  self->_vdrNotifierClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  v8 = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
}

- (id).cxx_construct
{
  int64x2_t v2;

  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  v2 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(int64x2_t *)((char *)self + 72) = v2;
  *((_BYTE *)self + 88) = 0;
  *((int64x2_t *)self + 6) = v2;
  *((_BYTE *)self + 112) = 0;
  return self;
}

@end
