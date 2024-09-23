@implementation CLSubHarvesterAvengerDataCollection

- (id)initInUniverse:(id)a3 withSettings:(CLSubHarvesterAvengerSettings *)a4
{
  CLSubHarvesterAvengerDataCollection *v6;
  __int128 v7;
  __int128 v8;
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
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLSubHarvesterAvengerDataCollection;
  v6 = -[CLSubHarvesterAvengerDataCollection init](&v21, "init");
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v7 = *(_OWORD *)&a4->fMaximumWaitTimeForActiveBestLocationRequest;
    v8 = *(_OWORD *)&a4->fAnalyticsHoldoffInterval;
    v9 = *(_OWORD *)&a4->fMaximumTimeOffsetThreshold;
    *(_OWORD *)&v6->_settings.fMaximumNumberOfAdvertisementsInCache = *(_OWORD *)&a4->fMaximumNumberOfAdvertisementsInCache;
    *(_OWORD *)&v6->_settings.fAnalyticsHoldoffInterval = v8;
    *(_OWORD *)&v6->_settings.fMaximumTimeOffsetThreshold = v9;
    *(_OWORD *)&v6->_settings.fMaximumWaitTimeForActiveBestLocationRequest = v7;
    v10 = *(_OWORD *)&a4->fCrossValidationDurationInterval;
    v11 = *(_OWORD *)&a4->fCrossValidationRequestInterval;
    v12 = *(_OWORD *)&a4->fCrossValidationRequestLimitShortResetInterval;
    *(_OWORD *)&v6->_settings.fCrossValidationFinalQueryInterval = *(_OWORD *)&a4->fCrossValidationFinalQueryInterval;
    *(_OWORD *)&v6->_settings.fCrossValidationRequestInterval = v11;
    *(_OWORD *)&v6->_settings.fCrossValidationRequestLimitShortResetInterval = v12;
    *(_OWORD *)&v6->_settings.fCrossValidationDurationInterval = v10;
    v13 = *(_OWORD *)&a4->fDataCollectionRequestInterval;
    v14 = *(_OWORD *)&a4->fActivityBasedSpeedRunning;
    v15 = *(_OWORD *)&a4->fMaximumDataCollectionRequests;
    *(_OWORD *)&v6->_settings.fActivityBasedSpeedDriving = *(_OWORD *)&a4->fActivityBasedSpeedDriving;
    *(_OWORD *)&v6->_settings.fActivityBasedSpeedRunning = v14;
    *(_OWORD *)&v6->_settings.fMaximumDataCollectionRequests = v15;
    *(_OWORD *)&v6->_settings.fDataCollectionRequestInterval = v13;
    v16 = *(_OWORD *)&a4->fTimeShiftForRegeotag;
    v17 = *(_OWORD *)&a4->fMinimumOverlappingPercentage;
    v18 = *(_OWORD *)&a4->fSaveBeaconPayloadCacheInterval;
    v6->_settings.fActivityBasedRegeotaggingFetchDuration = a4->fActivityBasedRegeotaggingFetchDuration;
    *(_OWORD *)&v6->_settings.fTimeShiftForRegeotag = v16;
    *(_OWORD *)&v6->_settings.fMinimumOverlappingPercentage = v17;
    *(_OWORD *)&v6->_settings.fSaveBeaconPayloadCacheInterval = v18;
    v19 = (*((double (**)(CLSubHarvesterAvengerSettings *))v6->_settings._vptr$Settings + 20))(&v6->_settings);
    arc4random_uniform(v19);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  void *proactiveRequestMonitor;
  objc_super v4;

  sub_1000F34E0(&self->locationCache.__end_.__prev_);

  -[CLTimer invalidate](self->_cacheAdvTimer, "invalidate");
  -[CLTimer invalidate](self->_stopDataCollectionTimer, "invalidate");

  -[CLTimer invalidate](self->_cancelDataCollectionTimer, "invalidate");
  self->targetAdv = 0;

  proactiveRequestMonitor = self->_proactiveRequestMonitor;
  if (proactiveRequestMonitor)
    (*(void (**)(void *))(*(_QWORD *)proactiveRequestMonitor + 8))(proactiveRequestMonitor);

  v4.receiver = self;
  v4.super_class = (Class)CLSubHarvesterAvengerDataCollection;
  -[CLSubHarvesterAvengerDataCollection dealloc](&v4, "dealloc");
}

- (void)receiveLocation:(CLDaemonLocation *)a3
{
  NSObject *v5;
  _OWORD *v6;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD *prev;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;

  if (self->_state)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10217B718);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v12[0] = 68289282;
      v12[1] = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2050;
      v16 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collecting location information\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v12, 0x1Cu);
    }
    v6 = operator new(0xB0uLL);
    rawCoordinate = a3->rawCoordinate;
    v6[7] = *(_OWORD *)&a3->lifespan;
    v6[8] = rawCoordinate;
    v6[9] = *(_OWORD *)&a3->rawCourse;
    *(_OWORD *)((char *)v6 + 156) = *(_OWORD *)&a3->integrity;
    v8 = *(_OWORD *)&a3->speed;
    v6[3] = *(_OWORD *)&a3->altitude;
    v6[4] = v8;
    v9 = *(_OWORD *)&a3->timestamp;
    v6[5] = *(_OWORD *)&a3->course;
    v6[6] = v9;
    v10 = *(_OWORD *)&a3->coordinate.longitude;
    v6[1] = *(_OWORD *)&a3->suitability;
    v6[2] = v10;
    prev = self->locationCache.__end_.__prev_;
    *(_QWORD *)v6 = prev;
    *((_QWORD *)v6 + 1) = &self->locationCache;
    prev[1] = v6;
    self->locationCache.__end_.__prev_ = v6;
    ++self->locationCache.__size_alloc_.__value_;
    if (self->targetAdv)
      -[CLSubHarvesterAvengerDataCollection pruneLocationCacheAfterAdv](self, "pruneLocationCacheAfterAdv");
    else
      -[CLSubHarvesterAvengerDataCollection pruneLocationCacheBeforeAdv](self, "pruneLocationCacheBeforeAdv");
  }
}

- (void)receiveMotionActivity:(CLMotionActivity *)a3
{
  NSObject *v14;
  CLSubHarvesterAvengerMotion *v15;
  CLSubHarvesterAvengerMotion *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t buf;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;

  if (self->_state)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10217B718);
    v14 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      buf = 68289282;
      v21 = 2082;
      v22 = "";
      v23 = 2050;
      v24 = 11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collecting motion information\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    v15 = [CLSubHarvesterAvengerMotion alloc];
    -[NSDate timeIntervalSinceReferenceDate](+[NSDate now](NSDate, "now", *(_QWORD *)&a3->type, *(_QWORD *)&a3->source, *(_QWORD *)&a3->mountedConfidence, *(_QWORD *)&a3->conservativeMountedProbability, *(_QWORD *)&a3->isStanding, *(_QWORD *)&a3->timestamp, *(_QWORD *)&a3->isVehicleConnected, *(_QWORD *)&a3->estExitTime, *(_QWORD *)&a3->vehicleType, *(_QWORD *)&a3->fsmTransitionData.fConsecStatic, *(_QWORD *)&a3[1].type, *(_QWORD *)&a3[1].source, *(_QWORD *)&a3[1].mountedConfidence, *(_QWORD *)&a3[1].conservativeMountedProbability, *(_QWORD *)&a3[1].isStanding, *(_QWORD *)&a3[1].timestamp,
        *(_QWORD *)&a3[1].isVehicleConnected),
      "timeIntervalSinceReferenceDate");
    v16 = -[CLSubHarvesterAvengerMotion initWithMotion:timestamp:](v15, "initWithMotion:timestamp:", &v19);
    -[NSMutableArray addObject:](self->motionCache, "addObject:", v16);

    if (self->targetAdv)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10217B718);
      v17 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      {
        buf = 68289282;
        v21 = 2082;
        v22 = "";
        v23 = 2050;
        v24 = 11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prune motion after adv\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
      }
      -[CLSubHarvesterAvengerDataCollection pruneMotionCacheAfterAdv](self, "pruneMotionCacheAfterAdv");
    }
    else
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10217B718);
      v18 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      {
        buf = 68289282;
        v21 = 2082;
        v22 = "";
        v23 = 2050;
        v24 = 11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prune motion before adv\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
      }
      -[CLSubHarvesterAvengerDataCollection pruneMotionCacheBeforeAdv](self, "pruneMotionCacheBeforeAdv");
    }
  }
}

- (void)receiveAdvertisement:(id)a3
{
  int64_t state;
  uint64_t v5;

  state = self->_state;
  if (state == 2)
  {
    -[CLSubHarvesterAvengerDataCollection identifyTargetAdv:](self, "identifyTargetAdv:", a3);
  }
  else if (!state && sub_1012479D0((uint64_t)self->_proactiveRequestMonitor))
  {
    -[CLSubHarvesterAvengerDataCollection startDataCollection](self, "startDataCollection", v5);
  }
}

- (void)receiveBeaconPayload:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  if (-[CLSubHarvesterAvengerDataCollection isEqualToTargetAdv:](self, "isEqualToTargetAdv:", objc_msgSend(a3, "advertisement"))&& objc_msgSend(a3, "location"))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10217B718);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2050;
      v10 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"found corresponding payload for target advertisement\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v6, 0x1Cu);
    }
    self->targetPayload = (SPBeaconPayload *)objc_msgSend(objc_alloc((Class)SPBeaconPayload), "initWithAdvertisement:location:", objc_msgSend(a3, "advertisement"), objc_msgSend(a3, "location"));
  }
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->recentSignalEnvironment = a3;
}

- (void)startDataCollection
{
  NSObject *v3;
  CLTimer *cacheAdvTimer;
  CLTimer *v5;
  CLSubHarvesterAvengerSettings *p_settings;
  CLTimer *cancelDataCollectionTimer;
  CLTimer *v8;
  double v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10217B718);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2050;
    v17 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"data collection is triggered\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
  }
  self->_state = 1;
  cacheAdvTimer = self->_cacheAdvTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C4D1B8;
  v11[3] = &unk_10212BB58;
  v11[4] = self;
  -[CLTimer setHandler:](cacheAdvTimer, "setHandler:", v11);
  v5 = self->_cacheAdvTimer;
  p_settings = &self->_settings;
  (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 21))(&self->_settings);
  -[CLTimer setNextFireDelay:](v5, "setNextFireDelay:");
  cancelDataCollectionTimer = self->_cancelDataCollectionTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C4D2AC;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  -[CLTimer setHandler:](cancelDataCollectionTimer, "setHandler:", v10);
  v8 = self->_cancelDataCollectionTimer;
  v9 = (*((double (**)(CLSubHarvesterAvengerSettings *))p_settings->_vptr$Settings + 21))(p_settings);
  -[CLTimer setNextFireDelay:](v8, "setNextFireDelay:", v9 + (*((double (**)(CLSubHarvesterAvengerSettings *))p_settings->_vptr$Settings + 22))(p_settings));
}

- (void)identifyTargetAdv:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  SPAdvertisement *targetAdv;
  SEL v8;
  uint64_t v9;
  NSInvocation *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SPAdvertisement *v18;
  CLTimer *stopDataCollectionTimer;
  CLTimer *v20;
  CLSubHarvesterAvengerSettings *p_settings;
  void **v22;
  uint64_t v23;
  _QWORD v24[5];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10217B718);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(objc_msgSend(a3, "scanDate"), "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 68289538;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2050;
    v30 = v6;
    v31 = 2050;
    v32 = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collected target advertisement\", \"adv timestamp: \":\"%{public}f\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x26u);
  }
  targetAdv = self->targetAdv;
  if (targetAdv)
  {

    self->targetAdv = 0;
  }
  if (+[SPAdvertisement instancesRespondToSelector:](SPAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:"))))
  {
    v8 = NSSelectorFromString(CFSTR("isPosh"));
    v10 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", objc_msgSend((id)objc_opt_class(a3, v9), "instanceMethodSignatureForSelector:", v8));
    -[NSInvocation setSelector:](v10, "setSelector:", v8);
    -[NSInvocation setTarget:](v10, "setTarget:", a3);
    -[NSInvocation invoke](v10, "invoke");
    buf[0] = 0;
    -[NSInvocation getReturnValue:](v10, "getReturnValue:", buf);
    v11 = objc_alloc((Class)SPAdvertisement);
    v12 = objc_msgSend(a3, "address");
    v13 = objc_msgSend(a3, "advertisementData");
    v14 = objc_msgSend(a3, "status");
    v15 = objc_msgSend(a3, "reserved");
    v16 = objc_msgSend(a3, "rssi");
    v17 = objc_msgSend(a3, "scanDate");
    LOBYTE(v23) = buf[0];
    v18 = (SPAdvertisement *)objc_msgSend(v11, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:", v12, v13, v14, v15, v16, v17, v23);
  }
  else
  {
    v18 = (SPAdvertisement *)objc_msgSend(objc_alloc((Class)SPAdvertisement), "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", objc_msgSend(a3, "address"), objc_msgSend(a3, "advertisementData"), objc_msgSend(a3, "status"), objc_msgSend(a3, "reserved"), objc_msgSend(a3, "rssi"), objc_msgSend(a3, "scanDate"));
  }
  self->targetAdv = v18;
  stopDataCollectionTimer = self->_stopDataCollectionTimer;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100C4D6A8;
  v24[3] = &unk_10212BB58;
  v24[4] = self;
  -[CLTimer setHandler:](stopDataCollectionTimer, "setHandler:", v24);
  v20 = self->_stopDataCollectionTimer;
  v22 = self->_settings._vptr$Settings;
  p_settings = &self->_settings;
  ((void (*)(CLSubHarvesterAvengerSettings *))v22[21])(p_settings);
  -[CLTimer setNextFireDelay:](v20, "setNextFireDelay:");
  *(_QWORD *)&p_settings[1].fMaximumFineRequestsPerDay = 3;
}

- (void)stopDataCollection
{
  NSObject *v3;
  CLTimer *cancelDataCollectionTimer;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10217B718);
  v3 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2050;
    v9 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"stop data collection\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v5, 0x1Cu);
  }
  self->_state = 0;
  -[CLTimer invalidate](self->_cacheAdvTimer, "invalidate");
  -[CLTimer invalidate](self->_stopDataCollectionTimer, "invalidate");
  cancelDataCollectionTimer = self->_cancelDataCollectionTimer;
  if (cancelDataCollectionTimer)
    -[CLTimer invalidate](cancelDataCollectionTimer, "invalidate");
  sub_1000F34E0(&self->locationCache.__end_.__prev_);
  -[NSMutableArray removeAllObjects](self->motionCache, "removeAllObjects");

  self->targetAdv = 0;
  self->targetPayload = 0;
}

- (void)submitData
{
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;

  AnalyticsSendEvent(CFSTR("com.apple.locationd.harvest.ba.geotagging.datacollection"), -[CLSubHarvesterAvengerDataCollection buildEvent](self, "buildEvent"));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10217B718);
  v2 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 68289282;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    v6 = 2050;
    v7 = 11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submit data\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v3, 0x1Cu);
  }
}

- (id)buildEvent
{
  id v3;
  double v4;
  double v5;
  double v6;
  NSDate *v8;

  if (!self->locationCache.__size_alloc_.__value_ || !-[NSMutableArray count](self->motionCache, "count"))
    return +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = *(double *)((char *)self->locationCache.__end_.__next_ + 92);
  objc_msgSend(-[NSMutableArray firstObject](self->motionCache, "firstObject"), "timestamp");
  if (v4 >= v5)
    objc_msgSend(-[NSMutableArray firstObject](self->motionCache, "firstObject"), "timestamp");
  else
    v6 = *(double *)((char *)self->locationCache.__end_.__next_ + 92);
  v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v6);
  objc_msgSend(v3, "addEntriesFromDictionary:", -[CLSubHarvesterAvengerDataCollection buildEventWithLocationWithFirstTimeStamp:](self, "buildEventWithLocationWithFirstTimeStamp:", v8));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[CLSubHarvesterAvengerDataCollection buildEventWithMotionWithFirstTimeStamp:](self, "buildEventWithMotionWithFirstTimeStamp:", v8));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[CLSubHarvesterAvengerDataCollection buildEventWithAdvWithFirstTimeStamp:](self, "buildEventWithAdvWithFirstTimeStamp:", v8));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->recentSignalEnvironment), CFSTR("sigEnv"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[CLSubHarvesterAvengerDataCollection getTimeOfDayForAnalytics](self, "getTimeOfDayForAnalytics")), CFSTR("timeOfDay"));
  return v3;
}

- (id)buildEventWithLocationWithFirstTimeStamp:(id)a3
{
  id v5;
  _QWORD *next;
  uint64_t v7;
  NSString *v8;
  double v9;
  double v10;
  uint64_t v11;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  next = self->locationCache.__end_.__next_;
  if (next != (_QWORD *)&self->locationCache)
  {
    v7 = 1;
    do
    {
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("location%ld"), v7);
      if (next == self->locationCache.__end_.__next_)
      {
        v10 = 0.0;
      }
      else
      {
        v9 = *(double *)((char *)next + 92) - *(double *)(*next + 92);
        v10 = sub_100124100(*(double *)((char *)next + 20), *(double *)((char *)next + 28), *(double *)(*next + 20), *(double *)(*next + 28))/ v9;
      }
      -[NSDate timeIntervalSinceDate:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)next + 92)), "timeIntervalSinceDate:", a3);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%.2lf, %.2lf, %.2lf, %.2lf"), v11, *(_QWORD *)((char *)next + 36), *(_QWORD *)((char *)next + 60), *(_QWORD *)&v10), v8);
      ++v7;
      next = (_QWORD *)next[1];
    }
    while (next != (_QWORD *)&self->locationCache);
  }
  return v5;
}

- (id)buildEventWithMotionWithFirstTimeStamp:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unsigned int v18;
  unsigned int v19;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = (uint64_t)-[NSMutableArray count](self->motionCache, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = v8 + 1;
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("motion%ld"), v8 + 1);
      objc_msgSend(-[NSMutableArray objectAtIndex:](self->motionCache, "objectAtIndex:", v8), "timestamp");
      -[NSDate timeIntervalSinceDate:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"), "timeIntervalSinceDate:", a3);
      v12 = v11;
      v13 = -[NSMutableArray objectAtIndex:](self->motionCache, "objectAtIndex:", v8);
      if (v13)
      {
        objc_msgSend(v13, "motionActivity");
        v14 = v19;
      }
      else
      {
        v14 = 0;
        v19 = 0;
      }
      v15 = -[NSMutableArray objectAtIndex:](self->motionCache, "objectAtIndex:", v8);
      if (v15)
      {
        objc_msgSend(v15, "motionActivity");
        v16 = v18;
      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%.2lf, %u, %u"), v12, v14, v16), v10);
      ++v8;
    }
    while (v7 != v9);
  }
  return v5;
}

- (id)buildEventWithAdvWithFirstTimeStamp:(id)a3
{
  id v5;
  uint64_t v6;
  SPBeaconPayload *targetPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(-[SPAdvertisement scanDate](self->targetAdv, "scanDate"), "timeIntervalSinceDate:", a3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%.2lf, %ld, %@"), v6, -[SPAdvertisement rssi](self->targetAdv, "rssi"), -[CLSubHarvesterAvengerDataCollection getAdvType:](self, "getAdvType:", self->targetAdv)), CFSTR("advertisement"));
  targetPayload = self->targetPayload;
  if (targetPayload)
  {
    objc_msgSend(objc_msgSend(-[SPBeaconPayload location](targetPayload, "location"), "timestamp"), "timeIntervalSinceDate:", a3);
    v9 = v8;
    objc_msgSend(-[SPBeaconPayload location](self->targetPayload, "location"), "horizontalAccuracy");
    v11 = v10;
    objc_msgSend(-[SPBeaconPayload location](self->targetPayload, "location"), "speed");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%.2lf, %.2lf, %.2lf"), v9, v11, v12), CFSTR("result"));
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10217B718);
    v13 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2050;
      v20 = 11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"there is location tagged\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
    }
  }
  return v5;
}

- (void)pruneLocationCacheBeforeAdv
{
  double v3;
  uint64_t *next;
  unint64_t value;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (self->locationCache.__size_alloc_.__value_ >= 2)
  {
    v3 = *(double *)((char *)self->locationCache.__end_.__prev_ + 92)
       - *(double *)((char *)self->locationCache.__end_.__next_ + 92);
    if (v3 > (*((double (**)(void))self->_settings._vptr$Settings + 21))())
    {
      next = (uint64_t *)self->locationCache.__end_.__next_;
      value = self->locationCache.__size_alloc_.__value_;
      v6 = *next;
      *(_QWORD *)(v6 + 8) = next[1];
      *(_QWORD *)next[1] = v6;
      self->locationCache.__size_alloc_.__value_ = value - 1;
      operator delete(next);
    }
    v7 = self->locationCache.__size_alloc_.__value_;
    if (v7 >= 0xB)
    {
      v8 = (uint64_t *)self->locationCache.__end_.__next_;
      v9 = *v8;
      *(_QWORD *)(v9 + 8) = v8[1];
      *(_QWORD *)v8[1] = v9;
      self->locationCache.__size_alloc_.__value_ = v7 - 1;
      operator delete(v8);
    }
  }
}

- (void)pruneLocationCacheAfterAdv
{
  unint64_t value;
  uint64_t *prev;
  uint64_t v4;

  value = self->locationCache.__size_alloc_.__value_;
  if (value >= 0x15)
  {
    prev = (uint64_t *)self->locationCache.__end_.__prev_;
    v4 = *prev;
    *(_QWORD *)(v4 + 8) = prev[1];
    *(_QWORD *)prev[1] = v4;
    self->locationCache.__size_alloc_.__value_ = value - 1;
    operator delete(prev);
  }
}

- (void)pruneMotionCacheBeforeAdv
{
  double v3;
  double v4;
  double v5;

  if ((unint64_t)-[NSMutableArray count](self->motionCache, "count") >= 2)
  {
    objc_msgSend(-[NSMutableArray lastObject](self->motionCache, "lastObject"), "timestamp");
    v4 = v3;
    objc_msgSend(-[NSMutableArray firstObject](self->motionCache, "firstObject"), "timestamp");
    if (v4 - v5 > (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 21))(&self->_settings))
      -[NSMutableArray removeObjectAtIndex:](self->motionCache, "removeObjectAtIndex:", 0);
  }
  if ((unint64_t)-[NSMutableArray count](self->motionCache, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->motionCache, "removeObjectAtIndex:", 0);
}

- (void)pruneMotionCacheAfterAdv
{
  if ((unint64_t)-[NSMutableArray count](self->motionCache, "count") >= 0x15)
    -[NSMutableArray removeLastObject](self->motionCache, "removeLastObject");
}

- (int64_t)getTimeOfDayForAnalytics
{
  return -[NSDateComponents hour](-[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, +[NSDate now](NSDate, "now")), "hour");
}

- (id)getAdvType:(id)a3
{
  if ((objc_msgSend(a3, "status") & 0x10) == 0)
    return CFSTR("unknown");
  if (objc_msgSend(objc_msgSend(a3, "advertisementData"), "length"))
    return CFSTR("wild");
  return CFSTR("nearOwner");
}

- (BOOL)isEqualToTargetAdv:(id)a3
{
  id v5;

  if (self->targetAdv
    && objc_msgSend(objc_msgSend(a3, "scanDate"), "isEqualToDate:", -[SPAdvertisement scanDate](self->targetAdv, "scanDate"))&& (v5 = objc_msgSend(a3, "rssi"), v5 == -[SPAdvertisement rssi](self->targetAdv, "rssi"))&& objc_msgSend(objc_msgSend(a3, "address"), "isEqualToData:", -[SPAdvertisement address](self->targetAdv, "address")))
  {
    return objc_msgSend(objc_msgSend(a3, "advertisementData"), "isEqualToData:", -[SPAdvertisement advertisementData](self->targetAdv, "advertisementData"));
  }
  else
  {
    return 0;
  }
}

- (void).cxx_destruct
{
  sub_1000F34E0(&self->locationCache.__end_.__prev_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = off_1021A5968;
  *((_OWORD *)self + 4) = xmmword_101C1F230;
  *((_OWORD *)self + 5) = xmmword_101C1F240;
  *((_QWORD *)self + 12) = 0x12000001F4;
  *((_DWORD *)self + 26) = 72;
  *((_QWORD *)self + 14) = 0x40CC200000000000;
  *((_BYTE *)self + 120) = 1;
  *((_DWORD *)self + 31) = 1;
  *((_OWORD *)self + 8) = xmmword_101C1F250;
  *((_OWORD *)self + 9) = xmmword_101C1F260;
  *((_QWORD *)self + 20) = 0x40B2C00000000000;
  *((_BYTE *)self + 168) = 0;
  *((_OWORD *)self + 11) = xmmword_101C1F270;
  *((_DWORD *)self + 48) = 1;
  *(_OWORD *)((char *)self + 200) = xmmword_101C16BE0;
  *(_OWORD *)((char *)self + 216) = xmmword_101C16BF0;
  *(_OWORD *)((char *)self + 232) = xmmword_101C16C00;
  *(_OWORD *)((char *)self + 248) = xmmword_101C16C10;
  *((_QWORD *)self + 33) = 0x4072C00000000000;
  *((_QWORD *)self + 34) = 0x3F847AE147AE147BLL;
  *((_DWORD *)self + 70) = 4;
  *((_OWORD *)self + 18) = xmmword_101C1F280;
  *((_QWORD *)self + 38) = 0x405E000000000000;
  *((_QWORD *)self + 41) = (char *)self + 328;
  *((_QWORD *)self + 42) = (char *)self + 328;
  *((_QWORD *)self + 43) = 0;
  return self;
}

@end
