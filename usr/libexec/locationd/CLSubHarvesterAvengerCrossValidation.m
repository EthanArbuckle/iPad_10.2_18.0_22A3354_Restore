@implementation CLSubHarvesterAvengerCrossValidation

- (void)terminateActiveLocationRequest
{
  NSObject *v3;
  External *ptr;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;

  if (self->isActivelyRequestingLocation)
  {
    if (qword_1022A0070 != -1)
      dispatch_once(&qword_1022A0070, &stru_102173960);
    v3 = qword_1022A0078;
    if (os_log_type_enabled((os_log_t)qword_1022A0078, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#wigo,off,BlueAvengerCrossValidation", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0070 != -1)
        dispatch_once(&qword_1022A0070, &stru_102173960);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0078, 0, "#wigo,off,BlueAvengerCrossValidation", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLSubHarvesterAvengerCrossValidation terminateActiveLocationRequest]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    AnalyticsSendEventLazy(CFSTR("com.apple.locationd.position.GNSS.WIGO"), &stru_1021737E0);
    ptr = self->_external.__ptr_;
    *(_DWORD *)buf = 0;
    (*(void (**)(External *, uint8_t *))(*(_QWORD *)ptr + 56))(ptr, buf);
    self->isActivelyRequestingLocation = 0;
    -[CLTimer invalidate](self->_activeLocationRequestTimer, "invalidate");
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102173980);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation proactive location request terminate\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
    }
  }
}

- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 andSettings:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  objc_super v23;

  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  v23.receiver = self;
  v23.super_class = (Class)CLSubHarvesterAvengerCrossValidation;
  v8 = -[CLSubHarvesterAvengerCrossValidation init](&v23, "init", a3, a4.__ptr_, a4.__cntrl_, a5);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = a3;
    sub_100349198((_QWORD *)v8 + 97, ptr);
    v9 = *(_OWORD *)((char *)cntrl + 24);
    v10 = *(_OWORD *)((char *)cntrl + 56);
    v11 = *(_OWORD *)((char *)cntrl + 8);
    *(_OWORD *)(v8 + 536) = *(_OWORD *)((char *)cntrl + 40);
    *(_OWORD *)(v8 + 552) = v10;
    *(_OWORD *)(v8 + 504) = v11;
    *(_OWORD *)(v8 + 520) = v9;
    v12 = *(_OWORD *)((char *)cntrl + 88);
    v13 = *(_OWORD *)((char *)cntrl + 120);
    v14 = *(_OWORD *)((char *)cntrl + 72);
    *(_OWORD *)(v8 + 600) = *(_OWORD *)((char *)cntrl + 104);
    *(_OWORD *)(v8 + 616) = v13;
    *(_OWORD *)(v8 + 568) = v14;
    *(_OWORD *)(v8 + 584) = v12;
    v15 = *(_OWORD *)((char *)cntrl + 152);
    v16 = *(_OWORD *)((char *)cntrl + 184);
    v17 = *(_OWORD *)((char *)cntrl + 136);
    *(_OWORD *)(v8 + 664) = *(_OWORD *)((char *)cntrl + 168);
    *(_OWORD *)(v8 + 680) = v16;
    *(_OWORD *)(v8 + 632) = v17;
    *(_OWORD *)(v8 + 648) = v15;
    v18 = *(_OWORD *)((char *)cntrl + 216);
    v19 = *(_OWORD *)((char *)cntrl + 232);
    v20 = *(_OWORD *)((char *)cntrl + 200);
    *((_QWORD *)v8 + 93) = *((_QWORD *)cntrl + 31);
    *(_OWORD *)(v8 + 712) = v18;
    *(_OWORD *)(v8 + 728) = v19;
    *(_OWORD *)(v8 + 696) = v20;
    *((_QWORD *)v8 + 2) = objc_alloc_init((Class)SPOwnerInterface);
    *((_QWORD *)v8 + 5) = objc_alloc_init((Class)SPBeaconManager);
    *((_QWORD *)v8 + 4) = objc_alloc_init((Class)SPPairingManager);
    *((_QWORD *)v8 + 3) = objc_msgSend(*((id *)v8 + 2), "privateOwnerSession");
    *((_QWORD *)v8 + 6) = objc_alloc_init((Class)SPFinderStateManager);
    v21 = (*(double (**)(char *))(*((_QWORD *)v8 + 62) + 96))(v8 + 496);
    arc4random_uniform(v21);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  void *proactiveRequestMonitor;
  objc_super v4;

  -[CLTimer invalidate](self->_crossValidationDurationTimer, "invalidate");
  -[CLTimer invalidate](self->_crossValidationFinalQueryTimer, "invalidate");

  -[CLTimer invalidate](self->_periodicBAQueryTimer, "invalidate");
  -[CLTimer invalidate](self->_periodicLocationRequestTimer, "invalidate");

  -[CLTimer invalidate](self->_activeLocationRequestTimer, "invalidate");
  proactiveRequestMonitor = self->_proactiveRequestMonitor;
  if (proactiveRequestMonitor)
    (*(void (**)(void *))(*(_QWORD *)proactiveRequestMonitor + 8))(proactiveRequestMonitor);
  self->_locationsDuringCrossValidation.__end_ = self->_locationsDuringCrossValidation.__begin_;

  v4.receiver = self;
  v4.super_class = (Class)CLSubHarvesterAvengerCrossValidation;
  -[CLSubHarvesterAvengerCrossValidation dealloc](&v4, "dealloc");
}

- (void)receiveLocation:(CLDaemonLocation *)a3
{
  unsigned int lifespan_low;
  int v6;
  NSObject *v7;
  _BOOL4 isRunningCrossValidation;
  _BOOL4 isRunningFinalCrossValidation;
  CLDaemonLocation *end;
  CLDaemonLocation *value;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  $AB5116BA7E623E054F959CECB034F4E7 v17;
  __int128 v18;
  CLDaemonLocation *v19;
  CLDaemonLocation *begin;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  CLDaemonLocation *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v34;
  CLDaemonLocation *v35;
  CLDaemonLocation *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  SPPairingManager *pairingManager;
  _QWORD v48[5];
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  _BYTE v54[10];
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;

  lifespan_low = LODWORD(a3->lifespan);
  if (self->isActiveVisit)
    v6 = 1;
  else
    v6 = (*((uint64_t (**)(CLSubHarvesterAvengerSettings *, SEL))self->_settings._vptr$Settings + 16))(&self->_settings, a2);
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v7 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    isRunningCrossValidation = self->isRunningCrossValidation;
    isRunningFinalCrossValidation = self->isRunningFinalCrossValidation;
    *(_DWORD *)buf = 68290306;
    v50 = 0;
    v51 = 2082;
    v52 = "";
    v53 = 1026;
    *(_DWORD *)v54 = isRunningCrossValidation;
    *(_WORD *)&v54[4] = 1026;
    *(_DWORD *)&v54[6] = isRunningFinalCrossValidation;
    v55 = 1026;
    v56 = (lifespan_low < 0xC) & (0xC02u >> lifespan_low);
    v57 = 1026;
    v58 = v6;
    v59 = 2050;
    v60 = 11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"receiveLocation\", \"isRunningCrossValidation\":%{public}hhd, \"isRunningFinalCrossValidation\":%{public}hhd, \"isHighAccuracyProviderFix\":%{public}hhd, \"isActiveVisitIfRequired\":%{public}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x34u);
  }
  if (self->isRunningCrossValidation)
  {
    end = self->_locationsDuringCrossValidation.__end_;
    value = self->_locationsDuringCrossValidation.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->_locationsDuringCrossValidation.__begin_;
      v21 = 0x6F96F96F96F96F97 * (((char *)end - (char *)begin) >> 2);
      v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) > 0x1A41A41A41A41A4)
        sub_100259694();
      v23 = 0x6F96F96F96F96F97 * (((char *)value - (char *)begin) >> 2);
      if (2 * v23 > v22)
        v22 = 2 * v23;
      if (v23 >= 0xD20D20D20D20D2)
        v24 = 0x1A41A41A41A41A4;
      else
        v24 = v22;
      if (v24)
        v25 = (char *)sub_10055B5BC((uint64_t)&self->_locationsDuringCrossValidation.__end_cap_, v24);
      else
        v25 = 0;
      v26 = &v25[156 * v21];
      v27 = (CLDaemonLocation *)&v25[156 * v24];
      v28 = *(_OWORD *)&a3->coordinate.longitude;
      *(_OWORD *)v26 = *(_OWORD *)&a3->suitability;
      *((_OWORD *)v26 + 1) = v28;
      v29 = *(_OWORD *)&a3->altitude;
      v30 = *(_OWORD *)&a3->speed;
      v31 = *(_OWORD *)&a3->timestamp;
      *((_OWORD *)v26 + 4) = *(_OWORD *)&a3->course;
      *((_OWORD *)v26 + 5) = v31;
      *((_OWORD *)v26 + 2) = v29;
      *((_OWORD *)v26 + 3) = v30;
      v32 = *(_OWORD *)&a3->lifespan;
      rawCoordinate = a3->rawCoordinate;
      v34 = *(_OWORD *)&a3->rawCourse;
      *(_OWORD *)(v26 + 140) = *(_OWORD *)&a3->integrity;
      *(($AB5116BA7E623E054F959CECB034F4E7 *)v26 + 7) = rawCoordinate;
      *((_OWORD *)v26 + 8) = v34;
      *((_OWORD *)v26 + 6) = v32;
      v19 = (CLDaemonLocation *)(v26 + 156);
      v35 = self->_locationsDuringCrossValidation.__end_;
      v36 = self->_locationsDuringCrossValidation.__begin_;
      if (v35 != v36)
      {
        do
        {
          v37 = *(_OWORD *)((char *)&v35[-1].coordinate.longitude + 4);
          *(_OWORD *)(v26 - 140) = *(_OWORD *)((char *)&v35[-1].altitude + 4);
          *(_OWORD *)(v26 - 156) = v37;
          v38 = *(_OWORD *)((char *)&v35[-1].speed + 4);
          v39 = *(_OWORD *)((char *)&v35[-1].course + 4);
          v40 = *(_OWORD *)((char *)&v35[-1].timestamp + 4);
          *(_OWORD *)(v26 - 76) = *(_OWORD *)((char *)&v35[-1].lifespan + 4);
          *(_OWORD *)(v26 - 92) = v40;
          *(_OWORD *)(v26 - 108) = v39;
          *(_OWORD *)(v26 - 124) = v38;
          v41 = *(__int128 *)((char *)&v35[-1].rawCoordinate + 4);
          v42 = *(_OWORD *)((char *)&v35[-1].rawCourse + 4);
          v43 = *(_OWORD *)&v35[-1].rawReferenceFrame;
          *((_OWORD *)v26 - 1) = *(_OWORD *)&v35[-1].ellipsoidalAltitude;
          *(_OWORD *)(v26 - 28) = v43;
          *(_OWORD *)(v26 - 44) = v42;
          *(_OWORD *)(v26 - 60) = v41;
          v26 -= 156;
          v35 = (CLDaemonLocation *)((char *)v35 - 156);
        }
        while (v35 != v36);
        v35 = self->_locationsDuringCrossValidation.__begin_;
      }
      self->_locationsDuringCrossValidation.__begin_ = (CLDaemonLocation *)v26;
      self->_locationsDuringCrossValidation.__end_ = v19;
      self->_locationsDuringCrossValidation.__end_cap_.__value_ = v27;
      if (v35)
        operator delete(v35);
    }
    else
    {
      v12 = *(_OWORD *)&a3->coordinate.longitude;
      *(_OWORD *)&end->suitability = *(_OWORD *)&a3->suitability;
      *(_OWORD *)&end->coordinate.longitude = v12;
      v13 = *(_OWORD *)&a3->altitude;
      v14 = *(_OWORD *)&a3->speed;
      v15 = *(_OWORD *)&a3->timestamp;
      *(_OWORD *)&end->course = *(_OWORD *)&a3->course;
      *(_OWORD *)&end->timestamp = v15;
      *(_OWORD *)&end->altitude = v13;
      *(_OWORD *)&end->speed = v14;
      v16 = *(_OWORD *)&a3->lifespan;
      v17 = a3->rawCoordinate;
      v18 = *(_OWORD *)&a3->rawCourse;
      *(_OWORD *)&end->integrity = *(_OWORD *)&a3->integrity;
      end->rawCoordinate = v17;
      *(_OWORD *)&end->rawCourse = v18;
      *(_OWORD *)&end->lifespan = v16;
      v19 = (CLDaemonLocation *)(&end->signalEnvironmentType + 1);
    }
    self->_locationsDuringCrossValidation.__end_ = v19;
  }
  if (!self->isRunningFinalCrossValidation
    && ((lifespan_low < 0xC) & (0xC02u >> lifespan_low)) != 0
    && ((v6 ^ 1) & 1) == 0)
  {
    sub_101247A80((uint64_t)self->_proactiveRequestMonitor);
    if (sub_1012479D0((uint64_t)self->_proactiveRequestMonitor))
    {
      if (!objc_opt_class(MCProfileConnection, v44)
        || (v45 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),
            objc_msgSend(v45, "effectiveBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed) == 1))
      {
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_102173980);
        v46 = qword_1022A0208;
        if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          v50 = 0;
          v51 = 2082;
          v52 = "";
          v53 = 2050;
          *(_QWORD *)v54 = 11;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation enabled\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
        }
        *(_WORD *)&self->isRunningCrossValidation = 257;
        pairingManager = self->_pairingManager;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100B4FDB8;
        v48[3] = &unk_102142CC0;
        v48[4] = self;
        -[SPPairingManager setAlwaysBeaconWildState:completion:](pairingManager, "setAlwaysBeaconWildState:completion:", 1, v48);
      }
    }
  }
}

- (BOOL)logCoreAnalytics:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B50530;
  v4[3] = &unk_102132010;
  v4[4] = a3;
  return AnalyticsSendEventLazy(CFSTR("com.apple.locationd.harvest.ba.validation"), v4);
}

- (BOOL)logFinalCoreAnalytics:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B50590;
  v4[3] = &unk_102132010;
  v4[4] = a3;
  return AnalyticsSendEventLazy(CFSTR("com.apple.locationd.harvest.ba.finalvalidation"), v4);
}

- (int64_t)getTimeOfDayForAnalytics
{
  return -[NSDateComponents hour](-[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, +[NSDate now](NSDate, "now")), "hour");
}

- (void)terminateBeaconing
{
  NSObject *v3;
  SPPairingManager *pairingManager;
  _QWORD v5[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289282;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2050;
    v11 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminateBeaconing\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
  }
  -[CLTimer invalidate](self->_crossValidationDurationTimer, "invalidate");
  -[CLTimer invalidate](self->_periodicLocationRequestTimer, "invalidate");
  -[CLTimer invalidate](self->_activeLocationRequestTimer, "invalidate");
  -[CLSubHarvesterAvengerCrossValidation terminateActiveLocationRequest](self, "terminateActiveLocationRequest");
  self->isRunningInnerLoopOfCrossValidation = 0;
  self->isRunningCrossValidation = 0;
  self->_analytics.deltaFindMyDistance = 0.0;
  self->_analytics.deviceFound = 0;
  self->_analytics.baDispersion = 0.0;
  self->_analytics.baEstimatedHorizontalAccuracy = 0.0;
  self->_analytics.countBALocations = 0;
  *(double *)((char *)&self->_analytics.findMyEstimatedHorizontalAccuracy + 4) = 0.0;
  *(_QWORD *)&self->_analytics.deviceMotionState = 0;
  self->_analytics.truncatedDeviceLocationLatitude = 0.0;
  self->_analytics.truncatedDeviceLocationLongitude = 0.0;
  self->_analytics.timeToFindLatency = 0.0;
  self->_analytics.timeOfDay = 0;
  pairingManager = self->_pairingManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B50758;
  v5[3] = &unk_102142CC0;
  v5[4] = self;
  -[SPPairingManager setAlwaysBeaconWildState:completion:](pairingManager, "setAlwaysBeaconWildState:completion:", 0, v5);
}

- (void)terminateFinalCrossValidation
{
  NSObject *v3;
  CLTimer *periodicBAQueryTimer;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2050;
    v9 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminateFinalCrossValidation\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v5, 0x1Cu);
  }
  periodicBAQueryTimer = self->_periodicBAQueryTimer;
  if (periodicBAQueryTimer)
    -[CLTimer invalidate](periodicBAQueryTimer, "invalidate");
  self->_finalAnalytics.deltaFindMyDistance = 0.0;
  self->_finalAnalytics.deviceFound = 0;
  self->_finalAnalytics.distanceAccuracyRatio = 0.0;
  self->_finalAnalytics.baDispersion = 0.0;
  self->_finalAnalytics.baEstimatedHorizontalAccuracy = 0.0;
  self->_finalAnalytics.countBALocations = 0;
  *(double *)((char *)&self->_finalAnalytics.findMyEstimatedHorizontalAccuracy + 4) = 0.0;
  *(_QWORD *)&self->_finalAnalytics.deviceMotionState = 0;
  self->_finalAnalytics.truncatedDeviceLocationLatitude = 0.0;
  self->_finalAnalytics.truncatedDeviceLocationLongitude = 0.0;
  self->_finalAnalytics.timeOfDay = 0;
  -[CLTimer invalidate](self->_crossValidationFinalQueryTimer, "invalidate");
  self->_locationsDuringCrossValidation.__end_ = self->_locationsDuringCrossValidation.__begin_;
  self->isRunningFinalCrossValidation = 0;
  self->isLastDownload = 0;
  self->hasBeenFound = 0;
}

- (void)submitEmptyResult
{
  CLDaemonLocation *begin;
  CLDaemonLocation *end;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[9];
  _QWORD v10[9];

  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  v5 = -1.0;
  if (begin == end)
  {
    v7 = 0.0;
    v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      if (*(double *)((char *)&begin->courseAccuracy + 4) > 0.0)
      {
        v6 = *(double *)(&begin->suitability + 1);
        v7 = *(double *)((char *)&begin->coordinate.latitude + 4);
        v5 = *(double *)((char *)&begin->coordinate.longitude + 4);
      }
      begin = (CLDaemonLocation *)((char *)begin + 156);
    }
    while (begin != end);
  }
  self->_analytics.deviceFound = 0;
  self->_analytics.deviceMotionState = CLMotionActivity::isMoving(&self->_recentMotionActivity);
  self->_analytics.findMyEstimatedHorizontalAccuracy = v5;
  self->_analytics.sigEnv = self->_recentSignalEnvironment;
  -[NSDate timeIntervalSinceDate:](self->_startBeaconingDate, "timeIntervalSinceDate:", +[NSDate now](NSDate, "now"));
  self->_analytics.timeToFindLatency = fabs(v8);
  self->_analytics.truncatedDeviceLocationLatitude = (double)(int)(v6 * 10.0) / 10.0;
  self->_analytics.truncatedDeviceLocationLongitude = (double)(int)(v7 * 10.0) / 10.0;
  self->_analytics.timeOfDay = -[CLSubHarvesterAvengerCrossValidation getTimeOfDayForAnalytics](self, "getTimeOfDayForAnalytics");
  v9[0] = CFSTR("deviceFound");
  v10[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_analytics.deviceFound);
  v9[1] = CFSTR("deviceMotionState");
  v10[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_analytics.deviceMotionState);
  v9[2] = CFSTR("findMyEstimatedHorizontalAccuracy");
  v10[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_analytics.findMyEstimatedHorizontalAccuracy);
  v9[3] = CFSTR("sigEnv");
  v10[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_analytics.sigEnv);
  v9[4] = CFSTR("timeToFindLatency");
  v10[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_analytics.timeToFindLatency);
  v9[5] = CFSTR("truncatedDeviceLocationLatitude");
  v10[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_analytics.truncatedDeviceLocationLatitude);
  v9[6] = CFSTR("truncatedDeviceLocationLongitude");
  v10[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_analytics.truncatedDeviceLocationLongitude);
  v9[7] = CFSTR("isActiveVisit");
  v10[7] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->isActiveVisit);
  v9[8] = CFSTR("timeOfDay");
  v10[8] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_analytics.timeOfDay);
  -[CLSubHarvesterAvengerCrossValidation logCoreAnalytics:](self, "logCoreAnalytics:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 9));
  -[CLSubHarvesterAvengerCrossValidation terminateBeaconing](self, "terminateBeaconing");
}

- (void)submitEmptyFinalResult
{
  NSObject *v3;
  int v4;
  CLDaemonLocation *begin;
  CLDaemonLocation *end;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[11];
  _QWORD v12[11];
  uint64_t buf;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v4 = -1762037865
       * ((unint64_t)((char *)self->_locationsDuringCrossValidation.__end_
                           - (char *)self->_locationsDuringCrossValidation.__begin_) >> 2);
    buf = 68289538;
    v14 = 2082;
    v15 = "";
    v16 = 1026;
    v17 = v4;
    v18 = 2050;
    v19 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submitEmptyFinalResult\", \"device locations:count\":%{public}d, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x22u);
  }
  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  v7 = -1.0;
  if (begin == end)
  {
    v9 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      if (*(double *)((char *)&begin->courseAccuracy + 4) > 0.0)
      {
        v8 = *(double *)(&begin->suitability + 1);
        v9 = *(double *)((char *)&begin->coordinate.latitude + 4);
        v7 = *(double *)((char *)&begin->coordinate.longitude + 4);
      }
      begin = (CLDaemonLocation *)((char *)begin + 156);
    }
    while (begin != end);
  }
  -[NSDate timeIntervalSinceDate:](self->_recentLastPublishDate, "timeIntervalSinceDate:", self->_startBeaconingDate);
  self->selfPublishTime = v10;
  self->_finalAnalytics.deviceFound = 0;
  self->_finalAnalytics.deviceMotionState = CLMotionActivity::isMoving(&self->_recentMotionActivity);
  self->_finalAnalytics.sigEnv = self->_recentSignalEnvironment;
  self->_finalAnalytics.findMyEstimatedHorizontalAccuracy = v7;
  self->_finalAnalytics.truncatedDeviceLocationLatitude = (double)(int)(v8 * 10.0) / 10.0;
  self->_finalAnalytics.truncatedDeviceLocationLongitude = (double)(int)(v9 * 10.0) / 10.0;
  self->_finalAnalytics.timeOfDay = -[CLSubHarvesterAvengerCrossValidation getTimeOfDayForAnalytics](self, "getTimeOfDayForAnalytics");
  v12[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_finalAnalytics.deviceFound, CFSTR("deviceFound"));
  v11[1] = CFSTR("deviceMotionState");
  v12[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_finalAnalytics.deviceMotionState);
  v11[2] = CFSTR("findMyEstimatedHorizontalAccuracy");
  v12[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_finalAnalytics.findMyEstimatedHorizontalAccuracy);
  v11[3] = CFSTR("sigEnv");
  v12[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_finalAnalytics.sigEnv);
  v11[4] = CFSTR("truncatedDeviceLocationLatitude");
  v12[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_finalAnalytics.truncatedDeviceLocationLatitude);
  v11[5] = CFSTR("truncatedDeviceLocationLongitude");
  v12[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_finalAnalytics.truncatedDeviceLocationLongitude);
  v11[6] = CFSTR("isActiveVisit");
  v12[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->isActiveVisit);
  v11[7] = CFSTR("timeOfDay");
  v12[7] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_finalAnalytics.timeOfDay);
  v11[8] = CFSTR("deviceBeenFound");
  v12[8] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->hasBeenFound);
  v11[9] = CFSTR("selfPublishTime");
  v12[9] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->selfPublishTime);
  v11[10] = CFSTR("selfPublishTimeBounded");
  v12[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLSubHarvesterAvengerCrossValidation binTimeInterval:](self, "binTimeInterval:", self->selfPublishTime));
  -[CLSubHarvesterAvengerCrossValidation logFinalCoreAnalytics:](self, "logFinalCoreAnalytics:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 11));
  -[CLSubHarvesterAvengerCrossValidation terminateFinalCrossValidation](self, "terminateFinalCrossValidation");
}

- (void)receiveMotionActivity:(CLMotionActivity *)a3
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&self->_recentMotionActivity.type = *(_OWORD *)&a3->type;
  v12 = *(_OWORD *)&a3->mountedConfidence;
  v13 = *(_OWORD *)&a3->isStanding;
  v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_recentMotionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_recentMotionActivity.vehicleType = v14;
  *(_OWORD *)&self->_recentMotionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_recentMotionActivity.isStanding = v13;
  v15 = *(_OWORD *)&a3[1].type;
  v16 = *(_OWORD *)&a3[1].mountedConfidence;
  v17 = *(_OWORD *)&a3[1].isStanding;
  *(_QWORD *)&self->_anon_c0[48] = *(_QWORD *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_c0[16] = v16;
  *(_OWORD *)&self->_anon_c0[32] = v17;
  *(_OWORD *)self->_anon_c0 = v15;
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->_recentSignalEnvironment = a3;
}

- (id)convertLocationResult:(id)a3
{
  NSMutableArray *v5;
  NSDate *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _BYTE v22[4];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v6 = -[NSDate dateByAddingTimeInterval:](self->_startBeaconingDate, "dateByAddingTimeInterval:", -600.0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "latitude");
        v13 = v12;
        objc_msgSend(v11, "longitude");
        v15 = v14;
        objc_msgSend(objc_msgSend(v11, "timestamp"), "timeIntervalSinceReferenceDate");
        v17 = v16;
        objc_msgSend(v11, "horizontalAccuracy");
        v19 = v18;
        if (objc_msgSend(objc_msgSend(v11, "timestamp"), "compare:", v6) != (id)-1)
        {
          v20 = objc_alloc((Class)CLLocation);
          v23 = v13;
          v24 = v15;
          v25 = v19;
          v26 = v17;
          -[NSMutableArray addObject:](v5, "addObject:", objc_msgSend(v20, "initWithClientLocation:", v22));
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  return v5;
}

- (float64x2_t)rotateWithAxis:(float64x2_t *)a3@<X8> angle:(double)a4@<D0> originVector:
{
  float64x2_t v5;
  __double2 v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  int8x16_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t result;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;

  v18 = *a1;
  v19 = a1[1];
  v21 = a2[1];
  v20 = *a2;
  v6 = __sincos_stret(a4 * 3.14159265 / 180.0 * 0.5);
  v5.f64[0] = v6.__sinval;
  v7 = vmulq_n_f64(v18, v6.__sinval);
  *(_QWORD *)&v5.f64[0] = *(_OWORD *)&vmulq_f64(v5, v19);
  v8.f64[0] = v5.f64[0];
  v8.f64[1] = v6.__cosval;
  v9 = vmulq_f64(v8, (float64x2_t)xmmword_101C16B90);
  v10 = (int8x16_t)vnegq_f64(v7);
  v11 = (float64x2_t)vextq_s8((int8x16_t)v9, (int8x16_t)vnegq_f64(v9), 8uLL);
  v12 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v7, v20, 1), (float64x2_t)vextq_s8(v10, (int8x16_t)v7, 8uLL), v20.f64[0]), v11, v21.f64[0]);
  v13 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v9, v20, 1), v11, v20.f64[0]), (float64x2_t)vextq_s8((int8x16_t)v7, v10, 8uLL), v21.f64[0]);
  v14 = vnegq_f64(v13);
  v15 = (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)vnegq_f64(v12), 8uLL);
  v16 = vmlaq_n_f64(vmulq_n_f64(v12, v6.__cosval), v15, v5.f64[0]);
  result = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v13, v6.__cosval), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v13, 8uLL), v5.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v12, v7, 1), v15, v7.f64[0]));
  *a3 = result;
  a3[1] = vaddq_f64(v16, vmlaq_n_f64(vmulq_laneq_f64(v14, v7, 1), (float64x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), v7.f64[0]));
  return result;
}

- (id)shiftLocation:(id)a3 referenceLocation:(CLDaemonLocation *)a4 latitudeShift:(double)a5 longitudeShift:(double)a6 directionShift:(double)a7
{
  double v13;
  double v14;
  long double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  __int128 v22;
  int8x16_t v28;
  long double v29;
  CLLocationCoordinate2D v30;
  id v31;
  double v32;
  _OWORD v34[2];
  _OWORD v35[3];
  double v36;
  _OWORD v37[2];
  _QWORD v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[2];
  _OWORD v43[4];
  uint64_t v44;
  CLLocationDegrees v45;
  double v46;
  float64_t v47;
  float64_t v48;
  float64_t v49;
  float64_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = 0;
  v52 = 0;
  v49 = 0.0;
  v50 = 0.0;
  v47 = 0.0;
  v48 = 0.0;
  v45 = 0.0;
  v46 = 0.0;
  v44 = 0;
  objc_msgSend(a3, "coordinate");
  v14 = v13;
  objc_msgSend(a3, "coordinate");
  v15 = 0.0;
  sub_100615B30((double *)&v52, (double *)&v51, &v50, v14, v16, 0.0);
  sub_100615B30(&v49, &v48, &v47, *(double *)(&a4->suitability + 1), *(double *)((char *)&a4->coordinate.latitude + 4), 0.0);
  if (self)
  {
    v18.f64[0] = v49;
    v18.f64[1] = v48;
    v17.f64[0] = v47;
    v19 = vmulq_f64(v17, v17);
    v19.f64[0] = 1.0 / sqrt(v19.f64[0] + vaddvq_f64(vmulq_f64(v18, v18)));
    v20 = vmulq_n_f64(v18, v19.f64[0]);
    v21 = vmulq_f64(v17, v19);
    v19.f64[0] = v50;
    *(_QWORD *)&v22 = v52;
    *((_QWORD *)&v22 + 1) = v51;
    v43[0] = v20;
    v43[1] = v21;
    v42[0] = v22;
    v42[1] = v19;
    -[CLSubHarvesterAvengerCrossValidation rotateWithAxis:angle:originVector:](self, "rotateWithAxis:angle:originVector:", v43, v42, a7);
    v38[0] = 0;
    v38[1] = 0;
    __asm { FMOV            V2.2D, #1.0 }
    v39 = _Q2;
    v37[0] = v43[2];
    v37[1] = v43[3];
    -[CLSubHarvesterAvengerCrossValidation rotateWithAxis:angle:originVector:](self, "rotateWithAxis:angle:originVector:", v38, v37, a6);
    v35[0] = xmmword_101C16BA0;
    v35[1] = 0u;
    v34[0] = v40;
    v34[1] = v41;
    -[CLSubHarvesterAvengerCrossValidation rotateWithAxis:angle:originVector:](self, "rotateWithAxis:angle:originVector:", v35, v34, a5);
    v28 = (int8x16_t)v35[2];
    *(_QWORD *)&v29 = vextq_s8(v28, v28, 8uLL).u64[0];
    v15 = v36;
  }
  else
  {
    v28.i64[0] = 0;
    v29 = 0.0;
  }
  sub_100615BEC(&v46, (long double *)&v45, (double *)&v44, *(long double *)v28.i64, v29, v15);
  v30 = CLLocationCoordinate2DMake(fabs(v46), v45);
  v31 = objc_alloc((Class)CLLocation);
  objc_msgSend(a3, "horizontalAccuracy");
  return objc_msgSend(v31, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", objc_msgSend(a3, "timestamp"), v30.latitude, v30.longitude, 0.0, v32, -1.0);
}

- (id)collectLocationData:(id)a3 outputLocation:(id)a4 deviceLocation:(CLDaemonLocation *)a5
{
  NSObject *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSDate *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  CLSubHarvesterAvengerCrossValidation *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  NSString *v28;
  id v29;
  double v30;
  CLLocationDegrees v31;
  CLLocationDegrees v32;
  CLLocationCoordinate2D v33;
  id v34;
  double v35;
  id v36;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  $AB5116BA7E623E054F959CECB034F4E7 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  double v48;
  CLLocationCoordinate2D v49;
  id v50;
  $AB5116BA7E623E054F959CECB034F4E7 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CLSubHarvesterAvengerCrossValidation *v57;
  id v58;
  _OWORD v59[8];
  _OWORD v60[2];
  _OWORD v61[8];
  _OWORD v62[2];
  _OWORD v63[8];
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  NSSortDescriptor *v69;
  _BYTE v70[128];
  uint64_t buf;
  __int16 v72;
  const char *v73;
  __int16 v74;
  uint64_t v75;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v8 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
  {
    buf = 68289282;
    v72 = 2082;
    v73 = "";
    v74 = 2050;
    v75 = 11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"collectLocationData\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
  }
  v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v57 = self;
  v11 = -[NSDate dateByAddingTimeInterval:](self->_startBeaconingDate, "dateByAddingTimeInterval:", -600.0);
  v58 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v16, "timestamp"), "compare:", v11) != (id)-1)
        {
          -[NSMutableArray addObject:](v9, "addObject:", v16);
          -[NSMutableArray addObject:](v10, "addObject:", objc_msgSend(v16, "hashedPublicKey"));
        }
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v13);
  }
  v17 = -[NSMutableArray valueForKeyPath:](v10, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.self"));
  v69 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  -[NSMutableArray sortUsingDescriptors:](v9, "sortUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
  v18 = objc_msgSend(-[NSMutableArray firstObject](v9, "firstObject"), "timestamp");
  v19 = v57;
  -[CLSubHarvesterAvengerCrossValidation randomDoubleWithMin:max:](v57, "randomDoubleWithMin:max:", -5.0, 5.0);
  v21 = v20;
  -[CLSubHarvesterAvengerCrossValidation randomDoubleWithMin:max:](v57, "randomDoubleWithMin:max:", -180.0, 180.0);
  v23 = v22;
  -[CLSubHarvesterAvengerCrossValidation randomDoubleWithMin:max:](v57, "randomDoubleWithMin:max:", -180.0, 180.0);
  v25 = v24;
  if (-[NSMutableArray count](v9, "count"))
  {
    v26 = 0;
    do
    {
      v27 = v26 + 1;
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("input%ld"), v26 + 1);
      v29 = -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", v26);
      objc_msgSend(v29, "latitude");
      v31 = v30;
      objc_msgSend(v29, "longitude");
      v33 = CLLocationCoordinate2DMake(v31, v32);
      v34 = objc_alloc((Class)CLLocation);
      objc_msgSend(v29, "horizontalAccuracy");
      v36 = objc_msgSend(v34, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", objc_msgSend(v29, "timestamp"), v33.latitude, v33.longitude, 0.0, v35, -1.0);
      rawCoordinate = a5->rawCoordinate;
      v63[6] = *(_OWORD *)&a5->lifespan;
      v63[7] = rawCoordinate;
      v64[0] = *(_OWORD *)&a5->rawCourse;
      *(_OWORD *)((char *)v64 + 12) = *(_OWORD *)&a5->integrity;
      v38 = *(_OWORD *)&a5->speed;
      v63[2] = *(_OWORD *)&a5->altitude;
      v63[3] = v38;
      v39 = *(_OWORD *)&a5->timestamp;
      v63[4] = *(_OWORD *)&a5->course;
      v63[5] = v39;
      v40 = *(_OWORD *)&a5->coordinate.longitude;
      v63[0] = *(_OWORD *)&a5->suitability;
      v63[1] = v40;
      v41 = -[CLSubHarvesterAvengerCrossValidation shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:](v19, "shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:", v36, v63, v21, v23, v25);
      v19 = v57;
      objc_msgSend(v58, "setObject:forKeyedSubscript:", -[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v57, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", v41, v18, -[NSNumber stringValue](+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_msgSend(v29, "hashedPublicKey"))), "stringValue")), v28);
      v42 = -[NSMutableArray count](v9, "count");
      if (v26 > 0x12)
        break;
      ++v26;
    }
    while (v27 < (unint64_t)v42);
  }
  v43 = a5->rawCoordinate;
  v61[6] = *(_OWORD *)&a5->lifespan;
  v61[7] = v43;
  v62[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v62 + 12) = *(_OWORD *)&a5->integrity;
  v44 = *(_OWORD *)&a5->speed;
  v61[2] = *(_OWORD *)&a5->altitude;
  v61[3] = v44;
  v45 = *(_OWORD *)&a5->timestamp;
  v61[4] = *(_OWORD *)&a5->course;
  v61[5] = v45;
  v46 = *(_OWORD *)&a5->coordinate.longitude;
  v61[0] = *(_OWORD *)&a5->suitability;
  v61[1] = v46;
  v47 = -[CLSubHarvesterAvengerCrossValidation shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:](v19, "shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:", a4, v61, v21, v23, v25);
  objc_msgSend(v47, "coordinate");
  if (v48 > 65.0)
    return +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v58, "setObject:forKeyedSubscript:", -[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v19, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", v47, v18, 0), CFSTR("output"));
  v49 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&a5->suitability + 1), *(CLLocationDegrees *)((char *)&a5->coordinate.latitude + 4));
  v50 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&a5->courseAccuracy + 4)), v49.latitude, v49.longitude, 0.0, *(double *)((char *)&a5->coordinate.longitude + 4), -1.0);
  v51 = a5->rawCoordinate;
  v59[6] = *(_OWORD *)&a5->lifespan;
  v59[7] = v51;
  v60[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v60 + 12) = *(_OWORD *)&a5->integrity;
  v52 = *(_OWORD *)&a5->speed;
  v59[2] = *(_OWORD *)&a5->altitude;
  v59[3] = v52;
  v53 = *(_OWORD *)&a5->timestamp;
  v59[4] = *(_OWORD *)&a5->course;
  v59[5] = v53;
  v54 = *(_OWORD *)&a5->coordinate.longitude;
  v59[0] = *(_OWORD *)&a5->suitability;
  v59[1] = v54;
  objc_msgSend(v58, "setObject:forKeyedSubscript:", -[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v19, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", -[CLSubHarvesterAvengerCrossValidation shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:](v19, "shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:", v50, v59, v21, v23, v25), v18, 0), CFSTR("deviceLocation"));
  return v58;
}

- (double)calculateDispersion:(id)a3
{
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B51BDC;
    v6[3] = &unk_102173850;
    v6[4] = a3;
    v6[5] = &v7;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v6);
  }
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)covertLocationToString:(id)a3 withFirstLocationTimeStamp:(id)a4 withPublicKey:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  objc_msgSend(a3, "coordinate");
  v9 = v8;
  objc_msgSend(a3, "coordinate");
  v11 = v10;
  objc_msgSend(a3, "horizontalAccuracy");
  v13 = v12;
  objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", a4);
  if (a5)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@, <%.6lf, %.6lf> +/- %.2lf) @%.2lf"), a5, v9, v11, v13, v14);
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(<%.6lf, %.6lf> +/- %.2lf) @%.2lf"), v9, v11, v13, v14, v16);
}

- (CLDaemonLocation)findNearestDeviceLocationWithBALocationTime:(SEL)a3
{
  CLDaemonLocation *begin;
  CLDaemonLocation *end;
  double v14;
  double v15;
  double v16;
  double v17;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  NSObject *v22;
  CLDaemonLocation *result;
  int v24;
  int v25;
  int v26;
  _DWORD v27[2];
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  retstr->suitability = 0xFFFF;
  *(double *)((char *)&retstr->coordinate.latitude + 4) = 0.0;
  *(_QWORD *)(&retstr->suitability + 1) = 0;
  *(_OWORD *)((char *)&retstr->coordinate.longitude + 4) = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)&retstr->altitude + 4) = _Q0;
  *(_OWORD *)((char *)&retstr->speed + 4) = _Q0;
  *(_OWORD *)((char *)&retstr->course + 4) = _Q0;
  HIDWORD(retstr->timestamp) = 0;
  retstr->lifespan = 0.0;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->confidence = 0xBFF0000000000000;
  LODWORD(retstr->rawCoordinate.latitude) = 0;
  *(double *)((char *)&retstr->rawCoordinate.latitude + 4) = -1.0;
  HIDWORD(retstr->rawCoordinate.longitude) = 0x7FFFFFFF;
  *(_QWORD *)&retstr->floor = 0;
  *(_QWORD *)&retstr->referenceFrame = 0;
  retstr->rawCourse = 0.0;
  LOBYTE(retstr->signalEnvironmentType) = 0;
  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  v14 = 1.79769313e308;
  while (begin != end)
  {
    v15 = *(double *)((char *)&begin->courseAccuracy + 4);
    objc_msgSend(a4, "timeIntervalSinceReferenceDate");
    v17 = vabdd_f64(v15, v16);
    if (v17 < v14)
    {
      rawCoordinate = begin->rawCoordinate;
      *(_OWORD *)&retstr->lifespan = *(_OWORD *)&begin->lifespan;
      retstr->rawCoordinate = rawCoordinate;
      *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&begin->rawCourse;
      *(_OWORD *)&retstr->integrity = *(_OWORD *)&begin->integrity;
      v19 = *(_OWORD *)&begin->speed;
      *(_OWORD *)&retstr->altitude = *(_OWORD *)&begin->altitude;
      *(_OWORD *)&retstr->speed = v19;
      v20 = *(_OWORD *)&begin->timestamp;
      *(_OWORD *)&retstr->course = *(_OWORD *)&begin->course;
      *(_OWORD *)&retstr->timestamp = v20;
      v21 = *(_OWORD *)&begin->coordinate.longitude;
      v14 = v17;
      *(_OWORD *)&retstr->suitability = *(_OWORD *)&begin->suitability;
      *(_OWORD *)&retstr->coordinate.longitude = v21;
    }
    begin = (CLDaemonLocation *)((char *)begin + 156);
  }
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v22 = qword_1022A0208;
  result = (CLDaemonLocation *)os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO);
  if ((result & 1) != 0)
  {
    v24 = (int)*(double *)(&retstr->suitability + 1);
    v25 = (int)*(double *)((char *)&retstr->coordinate.latitude + 4);
    v26 = (int)*(double *)((char *)&retstr->coordinate.longitude + 4);
    v27[0] = 68290307;
    v27[1] = 0;
    v28 = 2082;
    v29 = "";
    v30 = 1025;
    v31 = v24;
    v32 = 1025;
    v33 = v25;
    v34 = 1025;
    v35 = v26;
    v36 = 1025;
    v37 = (int)v14;
    v38 = 2050;
    v39 = 11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"find nearest location\", \"lat\":%{private}d, \"lng\":%{private}d, \"ucc\":%{private}d, \"time interval\":%{private}d, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v27, 0x34u);
  }
  return result;
}

- (id)getDeviceLocationsWithinBeaconingInterval
{
  id v3;
  CLDaemonLocation *begin;
  CLDaemonLocation *i;
  double v6;
  CLLocationCoordinate2D v7;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  begin = self->_locationsDuringCrossValidation.__begin_;
  for (i = self->_locationsDuringCrossValidation.__end_; begin != i; begin = (CLDaemonLocation *)((char *)begin + 156))
  {
    -[NSDate timeIntervalSinceDate:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&begin->courseAccuracy + 4)), "timeIntervalSinceDate:", self->_startBeaconingDate);
    if (v6 < (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 13))(&self->_settings))
    {
      v7 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&begin->suitability + 1), *(CLLocationDegrees *)((char *)&begin->coordinate.latitude + 4));
      objc_msgSend(v3, "addObject:", objc_msgSend(objc_alloc((Class)CLLocation), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&begin->courseAccuracy + 4)), v7.latitude, v7.longitude, 0.0, *(double *)((char *)&begin->coordinate.longitude + 4), -1.0));
    }
  }
  return v3;
}

- (void)processAvengerLocations:(id)a3
{
  NSObject *v5;
  unsigned int v6;
  int v7;
  _BOOL4 isLastDownload;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  NSObject *v20;
  SPFinderStateManager *finderManager;
  External *ptr;
  NSObject *v23;
  _QWORD block[11];
  _QWORD v25[6];
  _QWORD v26[6];
  uint8_t buf[8];
  __int128 v28;
  __n128 (*v29)(uint64_t, uint64_t);
  __int128 v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  NSSortDescriptor *v49;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(a3, "count");
    v7 = -1762037865
       * ((unint64_t)((char *)self->_locationsDuringCrossValidation.__end_
                           - (char *)self->_locationsDuringCrossValidation.__begin_) >> 2);
    isLastDownload = self->isLastDownload;
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v28) = 2082;
    *(_QWORD *)((char *)&v28 + 2) = "";
    WORD5(v28) = 1026;
    HIDWORD(v28) = v6;
    LOWORD(v29) = 1026;
    *(_DWORD *)((char *)&v29 + 2) = v7;
    HIWORD(v29) = 1026;
    LODWORD(v30) = isLastDownload;
    WORD2(v30) = 2050;
    *(_QWORD *)((char *)&v30 + 6) = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"completed cross validation cycle\", \"ba raw locations:count\":%{public}d, \"device locations:count\":%{public}d, \"isLastDownload\":%{public}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x2Eu);
  }
  self->isRunningInnerLoopOfCrossValidation = 0;
  if (objc_msgSend(a3, "count"))
  {
    v9 = -[CLSubHarvesterAvengerCrossValidation convertLocationResult:](self, "convertLocationResult:", a3);
    v49 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
    objc_msgSend(v9, "sortUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
    v10 = +[CLReductiveFilterSuite applyFilterToLocationObservations:options:](CLReductiveFilterSuite, "applyFilterToLocationObservations:options:", v9, objc_msgSend(objc_alloc((Class)CLReductiveFilterOptions), "initWithBeaconType:transmitPower:", 2, 10.0));
    v11 = objc_msgSend(v9, "firstObject");
    v12 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 33))(&self->_settings);
    v13 = objc_alloc((Class)RTEstimatedLocationOptions);
    v14 = objc_msgSend(v13, "initWithAverageSpeed:enableFallbackModel:timeInterval:", 1, kRTEstimatedLocationAverageSpeedUnknown, v12);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v28 = buf;
    *((_QWORD *)&v28 + 1) = 0xD012000000;
    v29 = sub_1002070B0;
    *(_QWORD *)&v30 = nullsub_57;
    *((_QWORD *)&v30 + 1) = 0;
    v33 = 0;
    v32 = 0;
    v34 = xmmword_101BAFC90;
    __asm { FMOV            V0.2D, #-1.0 }
    v35 = _Q0;
    v36 = _Q0;
    v37 = _Q0;
    v31 = 0xFFFF;
    v38 = 0;
    v40 = 0;
    v41 = 0;
    v39 = 0xBFF0000000000000;
    v43 = 0xBFF0000000000000;
    v42 = 0;
    v44 = 0x7FFFFFFF;
    v45 = 0;
    v46 = 0;
    v48 = 0;
    v47 = 0;
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    finderManager = self->_finderManager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100B52458;
    v26[3] = &unk_102173878;
    v26[4] = self;
    v26[5] = v20;
    -[SPFinderStateManager stateInfoWithCompletion:](finderManager, "stateInfoWithCompletion:", v26);
    dispatch_group_enter(v20);
    ptr = self->_external.__ptr_;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100B52768;
    v25[3] = &unk_1021738A0;
    v25[4] = v20;
    v25[5] = buf;
    (*(void (**)(External *, id, id, _QWORD *))(*(_QWORD *)ptr + 208))(ptr, objc_msgSend(v10, "timestamp"), v14, v25);
    v23 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B52904;
    block[3] = &unk_1021738C8;
    block[9] = a3;
    block[10] = buf;
    block[4] = v20;
    block[5] = self;
    block[6] = v10;
    block[7] = v9;
    block[8] = v11;
    dispatch_group_notify(v20, v23, block);
    _Block_object_dispose(buf, 8);
  }
  else if (self->isLastDownload)
  {
    -[CLSubHarvesterAvengerCrossValidation submitEmptyFinalResult](self, "submitEmptyFinalResult");
  }
}

- (void)queryForBAResult
{
  SPPairingManager *pairingManager;
  _QWORD v3[5];

  pairingManager = self->_pairingManager;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B53788;
  v3[3] = &unk_102173940;
  v3[4] = self;
  -[SPPairingManager getLocalPairingDataWithCompletion:](pairingManager, "getLocalPairingDataWithCompletion:", v3);
}

- (void)retrieveOwnerLocationsDuringValidationPeriod:(id)a3 completion:(id)a4
{
  NSDate *v7;

  v7 = +[NSDate date](NSDate, "date");
  if (-[NSDate compare:](self->_startBeaconingDate, "compare:", v7) == NSOrderedAscending)
    -[SPOwnerSessionPrivateProtocol rawSearchResultsForBeacon:dateInterval:completion:](self->_ownerSession, "rawSearchResultsForBeacon:dateInterval:completion:", a3, objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", self->_startBeaconingDate, v7), a4);
}

- (void)receiveCLVisit:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  _QWORD v12[2];

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_102173980);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v7 = 68289539;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 1025;
    LODWORD(v12[0]) = objc_msgSend(a3, "hasDepartureDate");
    WORD2(v12[0]) = 2050;
    *(_QWORD *)((char *)v12 + 6) = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation got receiveCLVisit\", \"hasDepartureDate\":%{private}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v7, 0x22u);
  }
  if (objc_msgSend(a3, "hasDepartureDate"))
  {
    self->isActiveVisit = 0;
    if (self->isRunningCrossValidation)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102173980);
      v6 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
      {
        v7 = 68289282;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        v11 = 2050;
        v12[0] = 11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminating cross validation on visit departure\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v7, 0x1Cu);
      }
      -[CLSubHarvesterAvengerCrossValidation terminateBeaconing](self, "terminateBeaconing");
      -[CLSubHarvesterAvengerCrossValidation terminateFinalCrossValidation](self, "terminateFinalCrossValidation");
    }
  }
  else
  {
    self->isActiveVisit = 1;
  }
}

- (int)binLocationAge:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 60.0)
    return 60;
  if (a3 <= 120.0)
    return 120;
  if (a3 <= 300.0)
    return 300;
  if (a3 <= 480.0)
    return 480;
  if (a3 <= 600.0)
    return 600;
  if (a3 <= 900.0)
    return 900;
  if (a3 <= 1200.0)
    return 1200;
  if (a3 <= 1500.0)
    return 1500;
  if (a3 <= 1800.0)
    return 1800;
  if (a3 <= 2100.0)
    return 2100;
  if (a3 <= 2400.0)
    return 2400;
  if (a3 <= 2700.0)
    return 2700;
  if (a3 <= 3000.0)
    return 3000;
  if (a3 <= 3300.0)
    return 3300;
  if (a3 <= 3600.0)
    return 3600;
  if (a3 <= 3900.0)
    return 3900;
  if (a3 <= 4200.0)
    return 4200;
  if (a3 <= 4800.0)
    return 4800;
  if (a3 <= 5400.0)
    return 5400;
  return 6000;
}

- (int)binTimeInterval:(double)a3
{
  if (a3 <= -600.0)
    return -600;
  if (a3 <= -300.0)
    return -300;
  if (a3 <= -45.0)
    return -45;
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 60.0)
    return 60;
  if (a3 <= 120.0)
    return 120;
  if (a3 <= 300.0)
    return 300;
  if (a3 <= 600.0)
    return 600;
  if (a3 <= 900.0)
    return 900;
  if (a3 <= 1200.0)
    return 1200;
  if (a3 <= 1500.0)
    return 1500;
  if (a3 <= 1800.0)
    return 1800;
  if (a3 <= 2100.0)
    return 2100;
  if (a3 <= 2400.0)
    return 2400;
  if (a3 <= 2700.0)
    return 2700;
  if (a3 <= 3000.0)
    return 3000;
  if (a3 <= 3300.0)
    return 3300;
  if (a3 <= 3600.0)
    return 3600;
  if (a3 <= 4200.0)
    return 4200;
  if (a3 <= 4800.0)
    return 4800;
  return 5000;
}

- (int)binRatio:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 25.0)
    return 25;
  if (a3 <= 50.0)
    return 50;
  if (a3 <= 75.0)
    return 75;
  if (a3 <= 100.0)
    return 100;
  if (a3 <= 125.0)
    return 125;
  if (a3 <= 150.0)
    return 150;
  if (a3 <= 175.0)
    return 175;
  if (a3 <= 200.0)
    return 200;
  if (a3 <= 300.0)
    return 300;
  if (a3 <= 400.0)
    return 400;
  if (a3 <= 500.0)
    return 500;
  if (a3 <= 600.0)
    return 600;
  if (a3 <= 700.0)
    return 700;
  if (a3 <= 800.0)
    return 800;
  if (a3 <= 900.0)
    return 900;
  if (a3 <= 1000.0)
    return 1000;
  return 2000;
}

- (int)binAccuracy:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 5.0)
    return 5;
  if (a3 <= 10.0)
    return 10;
  if (a3 <= 15.0)
    return 15;
  if (a3 <= 25.0)
    return 25;
  if (a3 <= 50.0)
    return 50;
  if (a3 <= 75.0)
    return 75;
  if (a3 <= 100.0)
    return 100;
  if (a3 <= 125.0)
    return 125;
  if (a3 <= 250.0)
    return 250;
  if (a3 <= 500.0)
    return 500;
  if (a3 <= 750.0)
    return 750;
  if (a3 <= 1000.0)
    return 1000;
  if (a3 <= 5000.0)
    return 5000;
  if (a3 <= 10000.0)
    return 10000;
  return 20000;
}

- (double)randomDoubleWithMin:(double)a3 max:(double)a4
{
  return a3 + (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (a4 - a3);
}

- (void)setRecentLastPublishDate:(id)a3
{
  NSDate *recentLastPublishDate;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (!-[NSDate isEqualToDate:](self->_recentLastPublishDate, "isEqualToDate:", a3))
  {
    recentLastPublishDate = self->_recentLastPublishDate;
    self->_recentLastPublishDate = (NSDate *)objc_msgSend(a3, "copy");

  }
}

- (void).cxx_destruct
{
  CLDaemonLocation *begin;

  sub_100261F44((uint64_t)&self->_external);
  begin = self->_locationsDuringCrossValidation.__begin_;
  if (begin)
  {
    self->_locationsDuringCrossValidation.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 43) = 0;
  *((_BYTE *)self + 352) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_DWORD *)self + 84) = 0;
  *(_QWORD *)((char *)self + 364) = 0;
  *(_QWORD *)((char *)self + 356) = 0;
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 47) = 0;
  *((_DWORD *)self + 100) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_BYTE *)self + 440) = 0;
  *((_QWORD *)self + 51) = 0;
  *((_QWORD *)self + 52) = 0;
  *((_DWORD *)self + 106) = 0;
  *(_QWORD *)((char *)self + 452) = 0;
  *(_QWORD *)((char *)self + 444) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_DWORD *)self + 120) = 0;
  *((_QWORD *)self + 61) = 0;
  *((_QWORD *)self + 62) = off_1021A5968;
  *((_QWORD *)self + 63) = 0x4046800000000000;
  *((_OWORD *)self + 32) = xmmword_101C16BB0;
  *((_QWORD *)self + 66) = 0x400A666666666666;
  *((_QWORD *)self + 67) = 0x12000001F4;
  *((_DWORD *)self + 136) = 72;
  *((_QWORD *)self + 69) = 0x40CC200000000000;
  *((_BYTE *)self + 560) = 1;
  *((_DWORD *)self + 141) = 1;
  *((_QWORD *)self + 71) = 0x40F5180000000000;
  *((_OWORD *)self + 36) = xmmword_101C16BC0;
  *((_OWORD *)self + 37) = xmmword_101C16BD0;
  *((_BYTE *)self + 608) = 0;
  *((_QWORD *)self + 77) = 0x404E000000000000;
  *((_QWORD *)self + 78) = 0x40F5180000000000;
  *((_DWORD *)self + 158) = 1;
  *((_OWORD *)self + 40) = xmmword_101C16BE0;
  *((_OWORD *)self + 41) = xmmword_101C16BF0;
  *((_OWORD *)self + 42) = xmmword_101C16C00;
  *((_OWORD *)self + 43) = xmmword_101C16C10;
  *((_OWORD *)self + 44) = xmmword_101C16C20;
  *((_DWORD *)self + 180) = 4;
  *((_QWORD *)self + 91) = 0x3FECCCCCCCCCCCCDLL;
  *((_QWORD *)self + 98) = 0;
  *((_OWORD *)self + 47) = 0u;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 46) = xmmword_101C16C30;
  return self;
}

@end
