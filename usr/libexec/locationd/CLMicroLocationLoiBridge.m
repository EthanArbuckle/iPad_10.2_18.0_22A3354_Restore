@implementation CLMicroLocationLoiBridge

- (BOOL)valid
{
  return self->_valid;
}

- (void)fetchLocationOfInterestAtLocation:(id)a3
{
  CLRoutineMonitorServiceProtocol *routineMonitor;
  id v6;
  id v7;
  CLDispatchSilo *silo;
  _QWORD v9[6];
  _QWORD v10[7];
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    v6 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Routine Monitor is not active");
    v7 = objc_msgSend(v6, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002B5BE8;
    v10[3] = &unk_10212BBA8;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = v7;
    -[CLDispatchSilo async:](silo, "async:", v10);
    routineMonitor = self->_routineMonitor;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F134;
  v9[3] = &unk_10212BBD0;
  v9[4] = self;
  v9[5] = a3;
  -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestAtLocation:withReply:](routineMonitor, "fetchLocationOfInterestAtLocation:withReply:", a3, v9);
}

- (id)initInUniverse:(id)a3
{
  CLMicroLocationLoiBridge *v4;
  CLDispatchSilo *v5;
  CLRoutineMonitorServiceProtocol *v6;
  id v7;
  uint64_t *v8;
  CLLocationManager *v9;
  NSObject *v10;
  id v11;
  uint64_t *v12;
  NSString *v13;
  uint64_t *v14;
  CLMonitorConfiguration *v15;
  const char *v17;
  uint8_t *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  __int16 v21[8];
  objc_super v22;
  uint8_t buf[1640];

  v22.receiver = self;
  v22.super_class = (Class)CLMicroLocationLoiBridge;
  v4 = -[CLMicroLocationLoiBridge init](&v22, "init");
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    v5 = (CLDispatchSilo *)objc_msgSend(a3, "silo");
    v4->_silo = v5;
    v4->_queue = (OS_dispatch_queue *)-[CLDispatchSilo queue](v5, "queue");
    v4->_fetchPlaceInferenceTimer = 0;
    *(_WORD *)&v4->_bridgeReady = 256;
    v6 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(-[CLIntersiloUniverse vendor](v4->_universe, "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    v4->_routineMonitor = v6;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v6, "registerDelegate:inSilo:", v4, -[CLIntersiloUniverse silo](v4->_universe, "silo"));
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:](v4->_routineMonitor, "setDelegateEntityName:", "CLMicroLocationLoiBridge");
    if (sub_1002B49E0())
    {
      v7 = objc_alloc((Class)CLLocationManager);
      if (byte_102301107 >= 0)
        v8 = &qword_1023010F0;
      else
        v8 = (uint64_t *)qword_1023010F0;
      v9 = (CLLocationManager *)objc_msgSend(v7, "initWithEffectiveBundlePath:delegate:onQueue:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8), v4, v4->_queue);
      v4->_clLocationManager = v9;
      if (!v9)
      {
        if (qword_1022A00F0 != -1)
          dispatch_once(&qword_1022A00F0, &stru_10212BC18);
        v10 = qword_1022A00F8;
        if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00F0 != -1)
            dispatch_once(&qword_1022A00F0, &stru_10212BC18);
          v21[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 17, "Failed to create location manager using MicroLocation bundle", v21, 2);
          v18 = (uint8_t *)v17;
          sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge initInUniverse:]", "%s\n", v17);
          if (v18 != buf)
            free(v18);
        }
      }
      -[CLLocationManager setDesiredAccuracy:](v4->_clLocationManager, "setDesiredAccuracy:", kCLLocationAccuracyHundredMeters);
      v19[4] = v4;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1002B4AB8;
      v20[3] = &unk_10212BAE0;
      v20[4] = v4;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002B4AEC;
      v19[3] = &unk_10212BB08;
      v11 = objc_alloc((Class)CLMonitorConfiguration);
      if (byte_102301137 >= 0)
        v12 = &qword_102301120;
      else
        v12 = (uint64_t *)qword_102301120;
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12);
      if (byte_10230111F >= 0)
        v14 = &qword_102301108;
      else
        v14 = (uint64_t *)qword_102301108;
      v15 = (CLMonitorConfiguration *)objc_msgSend(v11, "initWithName:path:onQueue:eventHandler:useMonitorQueueForVendingMonitor:vendingHandler:", v13, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14), v4->_queue, v19, 1, v20);
      v4->_regionMonitorConfiguration = v15;
      -[CLLocationManager requestMonitorWithConfiguration:completion:](v4->_clLocationManager, "requestMonitorWithConfiguration:completion:", v15, v20);
    }
    if (sub_1002B49E0())
      -[CLMicroLocationLoiBridge startVisitMonitoring](v4, "startVisitMonitoring");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineMonitor, "stopLeechingVisitsForClient:", self);
  -[CLRoutineMonitorServiceProtocol stopLeechingLowConfidenceVisitsForClient:](self->_routineMonitor, "stopLeechingLowConfidenceVisitsForClient:", self);

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationLoiBridge;
  -[CLMicroLocationLoiBridge dealloc](&v3, "dealloc");
}

- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3
{
  self->_microlocationLoiClient = a3;
}

- (void)requestBootstrapWithLastGeofenceStates
{
  CLMonitor *regionMonitor;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  CLMonitoringRecord *v9;
  CLDispatchSilo *silo;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _WORD v19[8];
  uint8_t v20[128];
  uint8_t buf[1640];

  regionMonitor = self->_regionMonitor;
  if (regionMonitor)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = -[CLMonitor monitoredIdentifiers](regionMonitor, "monitoredIdentifiers");
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = -[CLMonitor monitoringRecordForIdentifier:](self->_regionMonitor, "monitoringRecordForIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
          if (-[CLMonitoringRecord lastEvent](v9, "lastEvent"))
          {
            silo = self->_silo;
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_1002B4E10;
            v14[3] = &unk_10212BB30;
            v14[4] = v9;
            v14[5] = self;
            -[CLDispatchSilo async:](silo, "async:", v14);
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v6);
    }
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v11 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted bootstraping when region monitor was not available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_10212BC18);
      v19[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "#LOI Bridge, Attempted bootstraping when region monitor was not available", v19, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge requestBootstrapWithLastGeofenceStates]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
}

- (id)generateLocationManagerNotAvailableError
{
  NSObject *v2;
  id v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  NSErrorUserInfoKey v8;
  const __CFString *v9;
  uint8_t buf[1640];

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v2 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted LOI request when location manager was not available", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "#LOI Bridge, Attempted LOI request when location manager was not available", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge generateLocationManagerNotAvailableError]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v3 = objc_alloc((Class)NSError);
  v8 = NSLocalizedDescriptionKey;
  v9 = CFSTR("Location Manager not available");
  return objc_msgSend(v3, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
}

- (id)generateRegionMonitorNotAvailableError
{
  NSObject *v2;
  id v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  NSErrorUserInfoKey v8;
  const __CFString *v9;
  uint8_t buf[1640];

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v2 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#LOI Bridge, Attempted geofence request when region monitor was not available", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "#LOI Bridge, Attempted geofence request when region monitor was not available", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v3 = objc_alloc((Class)NSError);
  v8 = NSLocalizedDescriptionKey;
  v9 = CFSTR("Routine Monitor is not active");
  return objc_msgSend(v3, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
}

- (void)generateGeofenceUpdateToClient:(id)a3
{
  (*((void (**)(CLMicroLocationLoiClient *, id, unint64_t))self->_microlocationLoiClient->var0 + 7))(self->_microlocationLoiClient, objc_msgSend(a3, "identifier"), -[CLMicroLocationLoiBridge convertMonitoringEventToGeofenceState:](self, "convertMonitoringEventToGeofenceState:"));
}

- (unint64_t)convertMonitoringEventToGeofenceState:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "state");
  if (v3 == (id)1)
    return 1;
  else
    return 2 * (v3 == (id)2);
}

- (void)regionMonitor:(id)a3 didGenerateEvent:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unsigned int v13;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v6 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289539;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2081;
    v11 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    v12 = 1025;
    v13 = objc_msgSend(a4, "state");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, got geofence update\", \"Geofence Id\":%{private, location:escape_only}s, \"state\":%{private}d}", (uint8_t *)v7, 0x22u);
  }
  -[CLMicroLocationLoiBridge generateGeofenceUpdateToClient:](self, "generateGeofenceUpdateToClient:", a4);
}

- (void)startVisitMonitoring
{
  -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:](self->_routineMonitor, "startLeechingVisitsForClient:", self);
  -[CLRoutineMonitorServiceProtocol startLeechingLowConfidenceVisitsForClient:](self->_routineMonitor, "startLeechingLowConfidenceVisitsForClient:", self);
}

- (void)invalidateFetchPlaceInferenceTimer
{
  -[CLTimer invalidate](self->_fetchPlaceInferenceTimer, "invalidate");

  self->_fetchPlaceInferenceTimer = 0;
}

- (void)fetchPlaceInferenceAtCurrentLocation
{
  CLDispatchSilo *silo;
  CLTimer *v4;
  CLLocationManager *clLocationManager;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[1640];

  if (sub_1002B49E0())
  {
    if (!self->_clLocationManager)
    {
      silo = self->_silo;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1002B5758;
      v12[3] = &unk_10212BB58;
      v12[4] = self;
      -[CLDispatchSilo async:](silo, "async:", v12);
    }
    v4 = (CLTimer *)-[CLDispatchSilo newTimer](self->_silo, "newTimer");
    self->_fetchPlaceInferenceTimer = v4;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002B5790;
    v11[3] = &unk_10212BB58;
    v11[4] = self;
    -[CLTimer setHandler:](v4, "setHandler:", v11);
    -[CLTimer setNextFireDelay:](self->_fetchPlaceInferenceTimer, "setNextFireDelay:", 5.0);
    clLocationManager = self->_clLocationManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002B5984;
    v10[3] = &unk_10212BB80;
    v10[4] = self;
    -[CLLocationManager _fetchPlaceInferencesWithFidelityPolicy:handler:](clLocationManager, "_fetchPlaceInferencesWithFidelityPolicy:handler:", 0, v10);
  }
  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v6 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "fetchPlaceInferenceAtCurrentLocation - MicroLocation is disabled", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v9 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "fetchPlaceInferenceAtCurrentLocation - MicroLocation is disabled", &v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge fetchPlaceInferenceAtCurrentLocation]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)fetchRelatedLoisForLoi:(id)a3
{
  CLRoutineMonitorServiceProtocol *routineMonitor;
  id v6;
  id v7;
  CLDispatchSilo *silo;
  _QWORD v9[5];
  _QWORD v10[6];
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    v6 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Routine Monitor is not active");
    v7 = objc_msgSend(v6, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002B5D4C;
    v10[3] = &unk_10212BB30;
    v10[4] = self;
    v10[5] = v7;
    -[CLDispatchSilo async:](silo, "async:", v10);
    routineMonitor = self->_routineMonitor;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002B5D64;
  v9[3] = &unk_10212BB80;
  v9[4] = self;
  -[CLRoutineMonitorServiceProtocol fetchDedupedLocationOfInterestIdentifiersWithIdentifier:withReply:](routineMonitor, "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:withReply:", a3, v9);
}

- (id)retrieveAllActiveGeofences
{
  id v3;
  NSArray *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CLMonitoringRecord *v11;
  CLCondition *v12;
  CLMicroLocationGeofence *v13;
  id v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = -[CLMonitor monitoredIdentifiers](self->_regionMonitor, "monitoredIdentifiers");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v6 = 68289282;
    v22 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v11 = -[CLMonitor monitoringRecordForIdentifier:](self->_regionMonitor, "monitoringRecordForIdentifier:", v10, v22);
        if (v11)
        {
          v12 = -[CLMonitoringRecord condition](v11, "condition");
          v13 = objc_alloc_init(CLMicroLocationGeofence);
          -[CLMicroLocationGeofence setRegionId:](v13, "setRegionId:", v10);
          v14 = objc_alloc((Class)CLLocation);
          -[CLCondition center](v12, "center");
          v16 = v15;
          -[CLCondition center](v12, "center");
          -[CLMicroLocationGeofence setRegionCenterLocation:](v13, "setRegionCenterLocation:", objc_msgSend(v14, "initWithLatitude:longitude:", v16));
          objc_msgSend(v3, "addObject:", v13);
        }
        else
        {
          if (qword_1022A00F0 != -1)
            dispatch_once(&qword_1022A00F0, &stru_10212BC18);
          v17 = qword_1022A00F8;
          if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_msgSend(v10, "UTF8String");
            *(_DWORD *)buf = v22;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            v31 = 2082;
            v32 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            if (qword_1022A00F0 != -1)
              dispatch_once(&qword_1022A00F0, &stru_10212BC18);
          }
          v19 = qword_1022A00F8;
          if (os_signpost_enabled((os_log_t)qword_1022A00F8))
          {
            v20 = objc_msgSend(v10, "UTF8String");
            *(_DWORD *)buf = v22;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            v31 = 2082;
            v32 = v20;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LoiBridge, was unable to retrieve monitor record for valid region identifier", "{\"msg%{public}.0s\":\"#LoiBridge, was unable to retrieve monitor record for valid region identifier\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3);
}

- (void)getAllActiveGeofences
{
  id v3;
  id v4;
  CLDispatchSilo *silo;
  _QWORD v6[7];

  if (self->_regionMonitor)
  {
    v3 = -[CLMicroLocationLoiBridge retrieveAllActiveGeofences](self, "retrieveAllActiveGeofences");
    v4 = 0;
  }
  else
  {
    v4 = -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
    v3 = 0;
  }
  silo = self->_silo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002B6274;
  v6[3] = &unk_10212BBA8;
  v6[4] = self;
  v6[5] = v3;
  v6[6] = v4;
  -[CLDispatchSilo async:](silo, "async:", v6);
}

- (void)removeGeofencesNearLocationWithLatitude:(double)a3 andLongitude:(double)a4
{
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];

  if (self->_regionMonitor)
  {
    v7 = -[CLMicroLocationLoiBridge retrieveAllActiveGeofences](self, "retrieveAllActiveGeofences");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v25;
      *(_QWORD *)&v9 = 68289539;
      v23 = v9;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
          objc_msgSend(objc_msgSend(v13, "regionCenterLocation", v23), "coordinate");
          v15 = v14;
          objc_msgSend(objc_msgSend(v13, "regionCenterLocation"), "coordinate");
          v17 = sub_100124100(a3, a4, v15, v16);
          sub_1002B6554();
          if (v17 <= v18 + v18)
          {
            if (qword_1022A00F0 != -1)
              dispatch_once(&qword_1022A00F0, &stru_10212BC18);
            v21 = qword_1022A00F8;
            if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(objc_msgSend(v13, "regionId"), "UTF8String");
              *(_DWORD *)buf = v23;
              v29 = 0;
              v30 = 2082;
              v31 = "";
              v32 = 2081;
              v33 = v22;
              v34 = 2049;
              v35 = v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, removing geofence because it overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
            -[CLMonitor removeConditionFromMonitoringWithIdentifier:](self->_regionMonitor, "removeConditionFromMonitoringWithIdentifier:", objc_msgSend(v13, "regionId"));
          }
          else
          {
            if (qword_1022A00F0 != -1)
              dispatch_once(&qword_1022A00F0, &stru_10212BC18);
            v19 = qword_1022A00F8;
            if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_INFO))
            {
              v20 = objc_msgSend(objc_msgSend(v13, "regionId"), "UTF8String");
              *(_DWORD *)buf = v23;
              v29 = 0;
              v30 = 2082;
              v31 = "";
              v32 = 2081;
              v33 = v20;
              v34 = 2049;
              v35 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#LOI Bridge, geofence does not overlap the geofence at the requested location\", \"Geofence ID\":%{private, location:escape_only}s, \"Distance Between Geofences\":\"%{private}7f\"}", buf, 0x26u);
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v10);
    }
  }
}

- (void)getCurrentLocation
{
  CLLocationManager *clLocationManager;
  CLDispatchSilo *silo;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  if (sub_1002B49E0())
  {
    clLocationManager = self->_clLocationManager;
    if (!clLocationManager)
    {
      silo = self->_silo;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1002B6800;
      v7[3] = &unk_10212BB58;
      v7[4] = self;
      -[CLDispatchSilo async:](silo, "async:", v7);
      clLocationManager = self->_clLocationManager;
    }
    -[CLLocationManager requestLocation](clLocationManager, "requestLocation");
    self->_waitingOnLocationUpdate = 1;
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v5 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"LOI Bridge, getCurrentLocation while MicroLocation disabled\"}", buf, 0x12u);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    }
    v6 = qword_1022A00F8;
    if (os_signpost_enabled((os_log_t)qword_1022A00F8))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LOI Bridge, getCurrentLocation while MicroLocation disabled", "{\"msg%{public}.0s\":\"LOI Bridge, getCurrentLocation while MicroLocation disabled\"}", buf, 0x12u);
    }
  }
}

- (void)setGeofenceAtLocation:(id)a3
{
  NSString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  char *v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  CLDispatchSilo *silo;
  _QWORD v20[9];
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;

  v5 = -[NSString uppercaseString](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "uppercaseString");
  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v6 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a3, "coordinate");
    v8 = v7;
    objc_msgSend(a3, "coordinate");
    *(_DWORD *)buf = 68289539;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2049;
    v26 = v8;
    v27 = 2049;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"LOI Bridge, requested geofence at location\", \"latitude\":\"%{private}7f\", \"longitude\":\"%{private}7f\"}", buf, 0x26u);
  }
  if (self->_regionMonitor)
  {
    sub_1002B6554();
    v11 = v10;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v12 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2049;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#LOI Bridge, setting geofence for custom LOI\", \"Custom LOI Geofence radius\":\"%{private}7f\"}", buf, 0x1Cu);
    }
    v13 = objc_alloc((Class)CLCircularGeographicCondition);
    objc_msgSend(a3, "coordinate");
    -[CLMonitor addConditionForMonitoring:identifier:](self->_regionMonitor, "addConditionForMonitoring:identifier:", objc_msgSend(v13, "initWithCenter:radius:"), v5);
    v14 = -[NSString UTF8String](v5, "UTF8String");
    v15 = strlen(v14);
    v16 = sub_1002B7330((uint64_t)buf, (unsigned __int8 *)v14, (unsigned __int8 *)&v14[v15]);
    v18 = 0;
  }
  else
  {
    v18 = -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
    v16 = 0;
    v17 = 0;
  }
  silo = self->_silo;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002B6AC4;
  v20[3] = &unk_10212BBF8;
  v20[4] = self;
  v20[5] = a3;
  v20[7] = v16;
  v20[8] = v17;
  v20[6] = v18;
  -[CLDispatchSilo async:](silo, "async:", v20);
}

- (void)removeGeofenceWithRegionId:(id)a3
{
  CLMonitor *regionMonitor;
  id v6;
  CLDispatchSilo *silo;
  _QWORD v8[7];

  regionMonitor = self->_regionMonitor;
  if (regionMonitor)
  {
    -[CLMonitor removeConditionFromMonitoringWithIdentifier:](regionMonitor, "removeConditionFromMonitoringWithIdentifier:", a3);
    v6 = 0;
  }
  else
  {
    v6 = -[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError](self, "generateRegionMonitorNotAvailableError");
  }
  silo = self->_silo;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002B6B70;
  v8[3] = &unk_10212BBA8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = v6;
  -[CLDispatchSilo async:](silo, "async:", v8);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CLDispatchSilo *silo;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  _QWORD v18[7];
  uint8_t buf[1640];
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  if (self->_waitingOnLocationUpdate)
  {
    self->_waitingOnLocationUpdate = 0;
    if (a4 && objc_msgSend(a4, "count", a3))
    {
      v6 = objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
      v7 = 0;
    }
    else
    {
      v8 = objc_alloc((Class)NSError);
      v22 = NSLocalizedDescriptionKey;
      v23 = CFSTR("Failed to get current Location");
      v7 = objc_msgSend(v8, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v6 = 0;
    }
    objc_msgSend(v6, "horizontalAccuracy");
    v10 = v9;
    sub_1002B6554();
    if (v10 > v11)
    {
      v12 = objc_alloc((Class)NSError);
      v20 = NSLocalizedDescriptionKey;
      v21 = CFSTR("Failed to get current Location");
      v7 = objc_msgSend(v12, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v6 = 0;
    }
    silo = self->_silo;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002B6E80;
    v18[3] = &unk_10212BBA8;
    v18[4] = self;
    v18[5] = v6;
    v18[6] = v7;
    -[CLDispatchSilo async:](silo, "async:", v18);
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v14 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "LOI Bridge: Received location update when not waiting on one... Ignoring", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_10212BC18);
      v17 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "LOI Bridge: Received location update when not waiting on one... Ignoring", &v17, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLMicroLocationLoiBridge locationManager:didUpdateLocations:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
  {
    v7 = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#LOI Bridge: location manager failed\", \"error:\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
  }
  v6 = qword_1022A00F8;
  if (os_signpost_enabled((os_log_t)qword_1022A00F8))
  {
    v7 = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#LOI Bridge: location manager failed", "{\"msg%{public}.0s\":\"#LOI Bridge: location manager failed\", \"error:\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (a3)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v5 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LOI Bridge: Received visit notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_10212BC18);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "LOI Bridge: Received visit notification", v11, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    ((void (*)(CLMicroLocationLoiClient *, id))*self->_microlocationLoiClient->var0)(self->_microlocationLoiClient, a3);
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_10212BC18);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LOI Bridge: Received nil visit notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_10212BC18);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "LOI Bridge: Received nil visit notification", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
