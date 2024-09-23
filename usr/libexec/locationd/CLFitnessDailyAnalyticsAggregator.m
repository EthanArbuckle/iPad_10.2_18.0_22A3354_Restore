@implementation CLFitnessDailyAnalyticsAggregator

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
  if (qword_102305F40 != -1)
    dispatch_once(&qword_102305F40, &stru_1021628A0);
  return (id)qword_102305F38;
}

+ (BOOL)isSupported
{
  uint64_t v2;

  sub_100197040();
  return sub_1000C4240() && sub_1001FBB04(0) && objc_opt_class(HKHealthStore, v2);
}

- (CLFitnessDailyAnalyticsAggregator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFitnessDailyAnalyticsAggregator;
  return -[CLFitnessDailyAnalyticsAggregator initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFitnessDailyAnalyticsAggregatorServiceProtocol, &OBJC_PROTOCOL___CLFitnessDailyAnalyticsAggregatorClientProtocol);
}

- (void)beginService
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  __CFString *v7;
  __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[8];
  uint8_t buf[1632];

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  self->fMotionStateProxy = 0;
  self->fStoreCacheTimer = (CLTimer *)objc_msgSend(objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo"), "newTimer");
  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->fCompanionNotifierClient.__ptr_.__value_;
  self->fCompanionNotifierClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  self->fTimeCompanionConnected = 0.0;
  self->fEncryptedDataAvailable = 0;
  self->fHealthStore = 0;
  self->fQueryState = 0;
  self->fQueryTimer = (CLTimer *)objc_msgSend(objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo"), "newTimer");
  self->fHKQueryStartDate = 0;
  sub_100197040();
  if ((sub_1000C4240() & 1) != 0)
  {
    v7 = CFSTR("Watch");
    v8 = CFSTR("iPhone");
  }
  else
  {
    sub_100197040();
    if (!sub_100195F08())
      goto LABEL_14;
    v7 = CFSTR("iPhone");
    v8 = CFSTR("Watch");
  }
  self->kProductTypePrefix = &v8->isa;
  self->kCompanionProductTypePrefix = &v7->isa;
LABEL_14:
  self->fSources = 0;
  self->fFirstPartySources = 0;
  self->fFitnessPlusSources = 0;
  self->fCompanionSources = 0;
  self->fPendingCompanionActiveCaloriesQueries = 0;
  self->fPendingCompanionBasalCaloriesQueries = 0;
  self->fPendingCompanionFlightsClimbedQueries = 0;
  self->fPendingCompanionPedDistanceQueries = 0;
  self->fPendingCompanionStepCountQueries = 0;
  self->fPendingTimeInDaylightQueries = 0;
  self->fPendingTimeInDaylightMetadataQueries = 0;
  self->fPendingStepCountQueries = 0;
  self->fPendingFlightsClimbedQueries = 0;
  self->fPendingTimeNonStaticQueries = 0;
  self->fPendingActiveCaloriesQueries = 0;
  self->fPendingBasalCaloriesQueries = 0;
  self->fPendingPedDistanceQueries = 0;
  self->fPendingCaloriesFromAllWorkoutQueries = 0;
  self->fPendingCaloriesFromFirstPartyWorkoutQueries = 0;
  self->fPendingCaloriesFromFitnessPlusWorkoutQueries = 0;
  self->fPendingExerciseMinutesQueries = 0;
  if (&MCEffectiveSettingsChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1009B0690, MCEffectiveSettingsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  -[CLFitnessDailyAnalyticsAggregator onDataCollectionChangedNotification](self, "onDataCollectionChangedNotification");
  if (self->fServiceEnabled)
  {
    if (+[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable"))
    {
      if (qword_10229FF10 != -1)
        dispatch_once(&qword_10229FF10, &stru_102162B78);
      v10 = qword_10229FF18;
      if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, data is available", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF10 != -1)
          dispatch_once(&qword_10229FF10, &stru_102162B78);
        v18[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF18, 2, "CLFitnessDailyAnalyticsAggregator, data is available", v18, 2);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator beginService]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
      self->fHealthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    }
    else
    {
      if (qword_10229FF10 != -1)
        dispatch_once(&qword_10229FF10, &stru_102162B78);
      v12 = qword_10229FF18;
      if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, data is NOT available", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF10 != -1)
          dispatch_once(&qword_10229FF10, &stru_102162B78);
        v18[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF18, 2, "CLFitnessDailyAnalyticsAggregator, data is NOT available", v18, 2);
        v17 = (uint8_t *)v16;
        sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator beginService]", "%s\n", v16);
        if (v17 != buf)
          free(v17);
      }
    }
    v13 = sub_1001FD94C();
    sub_1005254E4(v13);
    self->fDataCache = (NSMutableDictionary *)-[CLFitnessDailyAnalyticsAggregator loadCache](self, "loadCache");
    -[CLFitnessDailyAnalyticsAggregator ageOutCache:](self, "ageOutCache:", -[CLFitnessDailyAnalyticsAggregator NSDateToNSStringKey:](self, "NSDateToNSStringKey:", -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -259200.0))));
    -[CLFitnessDailyAnalyticsAggregator universe](self, "universe");
    sub_100E35814();
  }
  v11 = sub_1001FD94C();
  sub_1005254E4(v11);
}

- (void)endService
{
  __CFNotificationCenter *DarwinNotifyCenter;
  Client *value;
  Client *v5;
  Client *v6;
  Client *v7;
  CLMotionStateProtocol *fMotionStateProxy;

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  if (&MCEffectiveSettingsChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, MCEffectiveSettingsChangedNotification, 0);
  }

  self->fHKQueryStartDate = 0;
  self->fStoreCacheTimer = 0;

  self->fQueryTimer = 0;
  self->fHealthStore = 0;

  self->fDataCache = 0;
  value = self->fLocationClient.__ptr_.__value_;
  if (value)
  {
    self->fLocationClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  }
  v5 = self->fCompanionNotifierClient.__ptr_.__value_;
  if (v5)
  {
    self->fCompanionNotifierClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  }
  v6 = self->fNatalimetryClient.__ptr_.__value_;
  if (v6)
  {
    self->fNatalimetryClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  }
  v7 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v7)
  {
    self->fFitnessTrackingClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  }
  fMotionStateProxy = self->fMotionStateProxy;
  if (fMotionStateProxy)
  {

    self->fMotionStateProxy = 0;
  }
}

- (FitnessDailyMetric)getActivityStats
{
  id v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BOOL4 v11;
  unsigned int var17;
  int var30;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  FitnessDailyMetric *result;
  NSObject *v22;
  id v23;
  uint64_t v24;
  id v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  const char *v29;
  char *v30;
  int v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  _BYTE buf[48];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  int v46;
  id v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  float v51;
  int v52;

  retstr->var0 = 0;
  retstr->var1 = -1.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_QWORD *)&retstr->var13 = -1;
  retstr->var15 = -1.0;
  *(_QWORD *)&retstr->var16 = 0;
  *(_QWORD *)((char *)&retstr->var17 + 1) = 0;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_QWORD *)&retstr->var28 = 0;
  retstr->var30 = -1;
  if (self->fServiceEnabled)
  {
    v5 = -[CLFitnessDailyAnalyticsAggregator NSDateToNSStringKey:](self, "NSDateToNSStringKey:", -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -172800.0)));
    v6 = -[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:", v5);
    if (v6)
    {
      -[CLFitnessDailyAnalyticsAggregator NSDictionaryToMotionFitnessDailyStruct:](self, "NSDictionaryToMotionFitnessDailyStruct:", v6);
      v7 = v44;
      *(_OWORD *)&retstr->var22 = v43;
      *(_OWORD *)&retstr->var26 = v7;
      retstr->var30 = v45;
      v8 = v40;
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&buf[32];
      *(_OWORD *)&retstr->var10 = v8;
      v9 = v42;
      *(_OWORD *)&retstr->var14 = v41;
      *(_OWORD *)&retstr->var18 = v9;
      v10 = *(_OWORD *)&buf[16];
      *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
      *(_OWORD *)&retstr->var2 = v10;
      v11 = 0;
      retstr->var20 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:", CFSTR("kPhoneFitnessModeKey")), "unsignedIntValue");
      var17 = retstr->var17;
      retstr->var16 /= 0x3Cu;
      retstr->var17 = var17 / 0x3C;
      retstr->var0 = 1;
      if (retstr->var13 == -1 && retstr->var14 == -1)
        v11 = retstr->var15 == -1.0;
      var30 = retstr->var30;
      if (v11 || var30 == -1)
      {
        v14 = -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent());
        v15 = -[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:", v14);
        if (v15)
        {
          -[CLFitnessDailyAnalyticsAggregator NSDictionaryToMotionFitnessDailyStruct:](self, "NSDictionaryToMotionFitnessDailyStruct:", v15);
          if (v11)
          {
            *(_QWORD *)&retstr->var13 = v50;
            retstr->var15 = v51;
          }
          if (var30 == -1)
            retstr->var30 = v52;
          if (qword_10229FF10 != -1)
            dispatch_once(&qword_10229FF10, &stru_102162B78);
          v16 = qword_10229FF18;
          if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
          {
            v17 = objc_msgSend(v5, "UTF8String");
            v18 = objc_msgSend(v14, "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = v11;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = var30 == -1;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, some metrics unavailable so overriding with most recent values, keyForDataToSubmit, %s, recentKey, %s, didOverrideBodyMetrics, %d, didOverrideLocalDaytimeDuration, %d", buf, 0x22u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FF10 != -1)
              dispatch_once(&qword_10229FF10, &stru_102162B78);
            v28 = qword_10229FF18;
            v31 = 136315906;
            v32 = objc_msgSend(v5, "UTF8String");
            v33 = 2080;
            v34 = objc_msgSend(v14, "UTF8String");
            v35 = 1024;
            v36 = v11;
            v37 = 1024;
            v38 = var30 == -1;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 2, "CLFitnessDailyAnalyticsAggregator, some metrics unavailable so overriding with most recent values, keyForDataToSubmit, %s, recentKey, %s, didOverrideBodyMetrics, %d, didOverrideLocalDaytimeDuration, %d", (const char *)&v31, 34);
            v30 = (char *)v29;
            sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator getActivityStats]", "%s\n", v29);
            if (v30 != buf)
              free(v30);
          }
        }
      }
      -[CLFitnessDailyAnalyticsAggregator ageOutCache:](self, "ageOutCache:", v5);
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    if (qword_10229FF10 != -1)
      dispatch_once(&qword_10229FF10, &stru_102162B78);
    v22 = qword_10229FF18;
    if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(v5, "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, getting activity stats, keyForDataToSubmit, %s, isValid, %d", buf, 0x12u);
    }
    result = (FitnessDailyMetric *)sub_1001BFF7C(115, 2);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF10 != -1)
        dispatch_once(&qword_10229FF10, &stru_102162B78);
      v24 = qword_10229FF18;
      v25 = objc_msgSend(v5, "UTF8String");
      v46 = 136315394;
      v47 = v25;
      v48 = 1024;
      v49 = v19;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "CLFitnessDailyAnalyticsAggregator, getting activity stats, keyForDataToSubmit, %s, isValid, %d", (const char *)&v46, 18);
      v27 = (char *)v26;
      result = (FitnessDailyMetric *)sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator getActivityStats]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
  }
  else
  {
    v20 = sub_1001FD94C();
    return (FitnessDailyMetric *)sub_1005254E4(v20);
  }
  return result;
}

- (void)setupStoreCacheTimer
{
  uint64_t v3;
  int v4;
  int v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  double v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009B1018;
  v13[3] = &unk_10212BB58;
  v13[4] = self;
  -[CLTimer setHandler:](self->fStoreCacheTimer, "setHandler:", v13);
  v12 = 0;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v10);
  v4 = sub_1001FD98C(v10, "FitnessDailyAnalyticsAggregatorCacheStoreInterval", &v12);
  v5 = v4;
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if (v5)
        goto LABEL_6;
LABEL_8:
      v12 = 0x40AC200000000000;
      v9 = 3600.0;
      goto LABEL_9;
    }
  }
  if (!v4)
    goto LABEL_8;
LABEL_6:
  v9 = *(double *)&v12;
LABEL_9:
  -[CLTimer setNextFireDelay:interval:](self->fStoreCacheTimer, "setNextFireDelay:interval:", 120.0, v9);
}

- (id)createCache
{
  id v3;
  _QWORD v5[2];
  __int128 v6;
  _BYTE v7[28];
  uint64_t v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0), CFSTR("kPhoneFitnessModeKey"));
  memset(v7, 0, sizeof(v7));
  HIDWORD(v10) = 0;
  v5[0] = 0;
  v6 = 0u;
  v5[1] = 0xBFF0000000000000;
  v8 = -1;
  v9 = -1082130432;
  *(_QWORD *)&v10 = 0;
  *(_QWORD *)((char *)&v10 + 5) = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0;
  v14 = 0xFFFFFFFFLL;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[CLFitnessDailyAnalyticsAggregator MotionFitnessDailyStructToNSDictionary:](self, "MotionFitnessDailyStructToNSDictionary:", v5), -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent()));
  return v3;
}

- (id)loadCache
{
  uint64_t v3;
  id v4;
  CFTypeRef v6;

  v6 = 0;
  v3 = sub_1001FD94C();
  if ((sub_100219F40(v3, (uint64_t)CFSTR("FitnessDailyAnalytics"), &v6) & 1) != 0)
    return (id)v6;
  v4 = -[CLFitnessDailyAnalyticsAggregator createCache](self, "createCache");
  -[CLFitnessDailyAnalyticsAggregator storeCache:](self, "storeCache:", v4);
  return v4;
}

- (void)storeCache:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = objc_opt_class(NSDictionary, a2);
  v6 = objc_opt_class(NSNumber, v5);
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v6, objc_opt_class(NSString, v7), 0), +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0), 0);
  v9 = objc_msgSend(v8, "allKeys");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend((id)qword_102305F00, "containsObject:", v14) & 1) == 0)
        {
          v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          objc_msgSend(v15, "removeObjectsForKeys:", qword_102305EF8);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  v16 = sub_1001FD94C();
  sub_10023EC14(v16);
  v17 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v17 + 944))(v17);
}

- (void)ageOutCache:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = -[NSMutableDictionary allKeys](self->fDataCache, "allKeys");
  -[NSMutableDictionary removeObjectForKey:](self->fDataCache, "removeObjectForKey:", a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "compare:", a3) == (id)-1)
          -[NSMutableDictionary removeObjectForKey:](self->fDataCache, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

- (id)CFAbsoluteTimeToNSStringKey:(double)a3
{
  return -[NSNumber stringValue](+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(a3 / 60.0 / 60.0 / 24.0)), "stringValue");
}

- (id)NSDateToNSStringKey:(id)a3
{
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:");
}

- (id)MotionFitnessDailyStructToNSDictionary:(FitnessDailyMetric *)a3
{
  id v4;
  double v5;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var2), CFSTR("kActiveCaloriesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var3), CFSTR("kBasalCaloriesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4), CFSTR("kFlightsClimbedKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var5), CFSTR("kPedDistanceKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var6), CFSTR("kStepsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var7), CFSTR("kExerciseMinutesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var8), CFSTR("kCaloriesFromAllWorkoutsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var9), CFSTR("kCaloriesFromFirstPartyWorkoutsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var10), CFSTR("kCaloriesFromFitnessPlusWorkoutsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var11), CFSTR("kNonPedWorkoutsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var12), CFSTR("kNonPedWorkoutMinutesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var13), CFSTR("kAgeBinKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var14), CFSTR("kGenderKey"));
  *(float *)&v5 = a3->var15;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("kWeightKGKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var16), CFSTR("kTimeNonStaticKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var17), CFSTR("kTimeCompanionConnectedKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var18), CFSTR("kHoursActiveKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var19), CFSTR("kWatchPairedKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var21), CFSTR("kCompanionActiveCaloriesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var22), CFSTR("kCompanionBasalCaloriesKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var23), CFSTR("kCompanionFlightsClimbedKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var24), CFSTR("kCompanionPedDistanceKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var25), CFSTR("kCompanionStepsKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var26), CFSTR("kTimeInDaylightKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var27), CFSTR("kAmbientLightIntensityMinKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var28), CFSTR("kAmbientLightIntensityMedianKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var29), CFSTR("kAmbientLightIntensityMaxKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var30), CFSTR("kLocalDaytimeDurationKey"));
  return v4;
}

- (FitnessDailyMetric)NSDictionaryToMotionFitnessDailyStruct:(SEL)a3
{
  id v6;
  float v7;
  FitnessDailyMetric *result;
  _QWORD v9[2];
  __int128 v10;
  _BYTE v11[28];
  uint64_t v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  memset(v11, 0, sizeof(v11));
  HIDWORD(v14) = 0;
  v9[0] = 0;
  v10 = 0u;
  v9[1] = 0xBFF0000000000000;
  v12 = -1;
  v13 = -1082130432;
  *(_QWORD *)&v14 = 0;
  *(_QWORD *)((char *)&v14 + 5) = 0;
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v18 = 0xFFFFFFFFLL;
  v6 = -[CLFitnessDailyAnalyticsAggregator MotionFitnessDailyStructToNSDictionary:](self, "MotionFitnessDailyStructToNSDictionary:", v9);
  objc_msgSend(v6, "addEntriesFromDictionary:", a4);
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var1 = -1.0;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_QWORD *)&retstr->var13 = -1;
  retstr->var15 = -1.0;
  *(_QWORD *)&retstr->var16 = 0;
  *(_QWORD *)((char *)&retstr->var17 + 1) = 0;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_QWORD *)&retstr->var28 = 0;
  *(_QWORD *)&retstr->var30 = 0;
  retstr->var30 = -1;
  retstr->var2 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kActiveCaloriesKey")), "unsignedIntValue");
  retstr->var3 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kBasalCaloriesKey")), "unsignedIntValue");
  retstr->var4 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kFlightsClimbedKey")), "unsignedIntValue");
  retstr->var5 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kPedDistanceKey")), "unsignedIntValue");
  retstr->var6 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kStepsKey")), "unsignedIntValue");
  retstr->var7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kExerciseMinutesKey")), "unsignedIntValue");
  retstr->var8 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCaloriesFromAllWorkoutsKey")), "unsignedIntValue");
  retstr->var9 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCaloriesFromFirstPartyWorkoutsKey")), "unsignedIntValue");
  retstr->var10 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCaloriesFromFitnessPlusWorkoutsKey")), "unsignedIntValue");
  retstr->var11 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kNonPedWorkoutsKey")), "unsignedIntValue");
  retstr->var12 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kNonPedWorkoutMinutesKey")), "unsignedIntValue");
  retstr->var13 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kAgeBinKey")), "intValue");
  retstr->var14 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kGenderKey")), "intValue");
  objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kWeightKGKey")), "floatValue");
  retstr->var15 = v7;
  retstr->var16 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kTimeNonStaticKey")), "unsignedIntValue");
  retstr->var17 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kTimeCompanionConnectedKey")), "unsignedIntValue");
  retstr->var18 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kHoursActiveKey")), "unsignedIntValue");
  retstr->var19 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kWatchPairedKey")), "BOOLValue");
  retstr->var21 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCompanionActiveCaloriesKey")), "unsignedIntValue");
  retstr->var22 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCompanionBasalCaloriesKey")), "unsignedIntValue");
  retstr->var23 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCompanionFlightsClimbedKey")), "unsignedIntValue");
  retstr->var24 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCompanionPedDistanceKey")), "unsignedIntValue");
  retstr->var25 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kCompanionStepsKey")), "unsignedIntValue");
  retstr->var26 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kTimeInDaylightKey")), "unsignedIntValue");
  retstr->var27 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kAmbientLightIntensityMinKey")), "unsignedIntValue");
  retstr->var28 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kAmbientLightIntensityMedianKey")), "unsignedIntValue");
  retstr->var29 = objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kAmbientLightIntensityMaxKey")), "unsignedIntValue");
  result = (FitnessDailyMetric *)objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("kLocalDaytimeDurationKey")), "intValue");
  retstr->var30 = (int)result;
  return result;
}

- (void)initDataDictForDay:(id)a3
{
  NSMutableDictionary *fDataCache;
  _QWORD v6[2];
  __int128 v7;
  _BYTE v8[28];
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:"))
  {
    fDataCache = self->fDataCache;
    memset(v8, 0, sizeof(v8));
    HIDWORD(v11) = 0;
    v6[0] = 0;
    v7 = 0u;
    v6[1] = 0xBFF0000000000000;
    v9 = -1;
    v10 = -1082130432;
    *(_QWORD *)&v11 = 0;
    *(_QWORD *)((char *)&v11 + 5) = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0;
    v15 = 0xFFFFFFFFLL;
    -[NSMutableDictionary setObject:forKey:](fDataCache, "setObject:forKey:", -[CLFitnessDailyAnalyticsAggregator MotionFitnessDailyStructToNSDictionary:](self, "MotionFitnessDailyStructToNSDictionary:", v6), a3);
  }
}

- (unsigned)computeLocalDaytimeDurationForDate:(double)a3 latitude:(float)a4 longitude:(float)a5
{
  int v5;
  int v7;
  double v8;
  double v9;

  v9 = 0.0;
  v8 = 0.0;
  v7 = 0;
  sub_100AD22BC(&v9, &v8, &v7, a3, a4, a5);
  if (v7 == 2)
  {
    LOWORD(v5) = 1440;
  }
  else if (v7 == 1)
  {
    LOWORD(v5) = 0;
  }
  else
  {
    return (int)((v8 - v9) / 60.0);
  }
  return v5;
}

- (void)onDataCollectionChangedNotification
{
  uint64_t v3;

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  if (objc_opt_class(MCProfileConnection, v3))
    self->fServiceEnabled = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed");
  else
    self->fServiceEnabled = 0;
}

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  double v8;
  double v9;

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  if (a3 == 4)
  {
    v7 = -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", *(double *)((char *)a4 + 76));
    -[CLFitnessDailyAnalyticsAggregator initDataDictForDay:](self, "initDataDictForDay:", v7);
    v8 = *(double *)((char *)a4 + 4);
    *(float *)&v8 = v8;
    v9 = *(double *)((char *)a4 + 12);
    *(float *)&v9 = v9;
    objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v7), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (int)sub_1011A2E30(0x1Eu, (double)-[CLFitnessDailyAnalyticsAggregator computeLocalDaytimeDurationForDate:latitude:longitude:](self, "computeLocalDaytimeDurationForDate:latitude:longitude:", *(double *)((char *)a4 + 76), v8, v9))), CFSTR("kLocalDaytimeDurationKey"));
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  CFAbsoluteTime Current;
  double fTimeCompanionConnected;
  CFAbsoluteTime v9;
  id v10;
  double v11;

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  if (a3 == 5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    fTimeCompanionConnected = self->fTimeCompanionConnected;
    if (*(_BYTE *)a4)
    {
      if (fTimeCompanionConnected != 0.0)
        return;
    }
    else
    {
      if (fTimeCompanionConnected == 0.0)
        return;
      v9 = Current - fTimeCompanionConnected;
      v10 = -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent());
      -[CLFitnessDailyAnalyticsAggregator initDataDictForDay:](self, "initDataDictForDay:", v10);
      objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v10), "objectForKeyedSubscript:", CFSTR("kTimeCompanionConnectedKey")), "doubleValue");
      objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v10), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v9 + v11)), CFSTR("kTimeCompanionConnectedKey"));
      Current = 0.0;
    }
    self->fTimeCompanionConnected = Current;
  }
}

- (id)onDataProtectionNotification:(int)a3 data:(int)a4
{
  id result;

  result = objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (!a3)
  {
    a1[80] = a4 == 1;
    return _objc_msgSend(a1, "runQueries");
  }
  return result;
}

- (void)onNatalimetryNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  float v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *v13;
  double v14;
  float *v15;
  float *v16;
  uint64_t v17;

  objc_msgSend(-[CLFitnessDailyAnalyticsAggregator universe](self, "universe"), "silo");
  if (a3 != 2)
    return;
  v7 = -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent());
  -[CLFitnessDailyAnalyticsAggregator initDataDictForDay:](self, "initDataDictForDay:", v7);
  v8 = *((float *)a4 + 5);
  v16 = 0;
  v17 = 0;
  v15 = 0;
  sub_10027205C(&v15, (const void *)qword_102305F20, qword_102305F28, (qword_102305F28 - qword_102305F20) >> 2);
  v10 = (char *)v16 - (char *)v15;
  if (v16 != v15)
  {
    v11 = 0;
    v12 = v10 >> 2;
    if ((unint64_t)(v10 >> 2) <= 1)
      v12 = 1;
    while (v15[v11] < v8)
    {
      if (v12 == ++v11)
      {
        LODWORD(v11) = v12;
        goto LABEL_9;
      }
    }
    goto LABEL_9;
  }
  LODWORD(v11) = 0;
  if (v16)
  {
LABEL_9:
    v16 = v15;
    operator delete(v15);
    LODWORD(v10) = v11;
  }
  if (*((_BYTE *)a4 + 56))
  {
    *(float *)&v9 = (float)(int)v10;
    v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
  }
  else
  {
    v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL);
  }
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v7), "setObject:forKeyedSubscript:", v13, CFSTR("kAgeBinKey"));
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v7), "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_DWORD *)a4), CFSTR("kGenderKey"));
  if (*((_BYTE *)a4 + 58))
    LODWORD(v14) = *((_DWORD *)a4 + 3);
  else
    LODWORD(v14) = -1.0;
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v7), "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14), CFSTR("kWeightKGKey"));
}

- (id)onFitnessTrackingNotification:(int)a3 data:(uint64_t)a4
{
  id result;

  result = objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (a3 == 5)
    return objc_msgSend(a1[3], "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4), CFSTR("kPhoneFitnessModeKey"));
  return result;
}

- (void)resetQueryState
{
  self->fPendingCompanionActiveCaloriesQueries = 0;
  self->fPendingCompanionBasalCaloriesQueries = 0;
  self->fPendingCompanionFlightsClimbedQueries = 0;
  self->fPendingCompanionPedDistanceQueries = 0;
  self->fPendingCompanionStepCountQueries = 0;
  self->fPendingTimeInDaylightQueries = 0;
  self->fPendingTimeInDaylightMetadataQueries = 0;
  self->fPendingStepCountQueries = 0;
  self->fPendingTimeNonStaticQueries = 0;
  self->fPendingActiveCaloriesQueries = 0;
  self->fPendingBasalCaloriesQueries = 0;
  self->fPendingPedDistanceQueries = 0;
  self->fPendingCaloriesFromAllWorkoutQueries = 0;
  self->fPendingCaloriesFromFirstPartyWorkoutQueries = 0;
  self->fPendingCaloriesFromFitnessPlusWorkoutQueries = 0;

  self->fSources = 0;
  self->fFirstPartySources = 0;

  self->fFitnessPlusSources = 0;
  self->fCompanionSources = 0;
  self->fQueryState = 0;
}

- (void)setupQueryTimer
{
  uint64_t v3;
  int v4;
  int v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  double v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009B23E4;
  v13[3] = &unk_10212BB58;
  v13[4] = self;
  -[CLTimer setHandler:](self->fQueryTimer, "setHandler:", v13);
  v12 = 0;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v10);
  v4 = sub_1001FD98C(v10, "FitnessDailyAnalyticsAggregatorHKQueryInterval", &v12);
  v5 = v4;
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if (v5)
        goto LABEL_6;
LABEL_8:
      v9 = *(double *)&qword_102305F10;
      v12 = qword_102305F10;
      goto LABEL_9;
    }
  }
  if (!v4)
    goto LABEL_8;
LABEL_6:
  v9 = *(double *)&v12;
LABEL_9:
  -[CLTimer setNextFireDelay:interval:](self->fQueryTimer, "setNextFireDelay:interval:", 120.0, v9);
}

- (void)runQueries
{
  NSObject *v3;
  _BOOL4 fEncryptedDataAvailable;
  int fQueryState;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;

  if (qword_10229FF10 != -1)
    dispatch_once(&qword_10229FF10, &stru_102162B78);
  v3 = qword_10229FF18;
  if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
  {
    fEncryptedDataAvailable = self->fEncryptedDataAvailable;
    fQueryState = self->fQueryState;
    *(_DWORD *)buf = 67109632;
    v20 = fEncryptedDataAvailable;
    v21 = 1024;
    v22 = fQueryState;
    v23 = 1024;
    v24 = +[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, attempting queries, encrypted, %d, state, %d, health, %d", buf, 0x14u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF10 != -1)
      dispatch_once(&qword_10229FF10, &stru_102162B78);
    v10 = qword_10229FF18;
    v11 = self->fQueryState;
    v15 = 1024;
    v16 = v11;
    v17 = 1024;
    v18 = +[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "CLFitnessDailyAnalyticsAggregator, attempting queries, encrypted, %d, state, %d, health, %d", &v14, 20, 67109632);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator runQueries]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  v6 = -[objc_class sharedInstance](off_1022A6168(), "sharedInstance");
  v7 = objc_msgSend(-[objc_class getAllDevicesWithArchivedDevicesMatching:](v6, "getAllDevicesWithArchivedDevicesMatching:", -[objc_class activeDeviceSelectorBlock](off_1022A6168(), "activeDeviceSelectorBlock")), "firstObject");
  v8 = -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent());
  -[CLFitnessDailyAnalyticsAggregator initDataDictForDay:](self, "initDataDictForDay:", v8);
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v8), "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 != 0), CFSTR("kWatchPairedKey"));
  if (self->fEncryptedDataAvailable
    && self->fQueryState
    && +[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable")
    && self->fHealthStore)
  {
    -[NSDate timeIntervalSinceNow](self->fHKQueryStartDate, "timeIntervalSinceNow");
    if (v9 <= -43200.0)
    {
      -[CLFitnessDailyAnalyticsAggregator resetQueryState](self, "resetQueryState");
      self->fQueryState = 1;
    }
    else if (self->fQueryState != 1)
    {
      return;
    }
    -[CLFitnessDailyAnalyticsAggregator querySources](self, "querySources");
  }
}

- (void)querySources
{
  NSPredicate *v3;
  id v4;
  _QWORD v5[5];

  self->fHKQueryStartDate = +[NSDate date](NSDate, "date");
  v3 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, -172800.0)), self->fHKQueryStartDate, 3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009B2884;
  v5[3] = &unk_1021628C8;
  v5[4] = self;
  v4 = objc_msgSend(objc_alloc((Class)HKSourceQuery), "initWithSampleType:samplePredicate:completionHandler:", +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierStepCount), v3, v5);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v4);

}

- (void)runNextPendingQuery
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (self->fPendingCompanionActiveCaloriesQueries < 1)
  {
    if (self->fPendingCompanionBasalCaloriesQueries < 1)
    {
      if (self->fPendingCompanionFlightsClimbedQueries < 1)
      {
        if (self->fPendingCompanionPedDistanceQueries < 1)
        {
          if (self->fPendingCompanionStepCountQueries < 1)
          {
            if (self->fPendingTimeInDaylightQueries < 1)
            {
              if (self->fPendingTimeInDaylightMetadataQueries < 1)
              {
                if (self->fPendingStepCountQueries < 1)
                {
                  if (self->fPendingFlightsClimbedQueries < 1)
                  {
                    if (self->fPendingActiveCaloriesQueries < 1)
                    {
                      if (self->fPendingBasalCaloriesQueries < 1)
                      {
                        if (self->fPendingPedDistanceQueries < 1)
                        {
                          if (self->fPendingCaloriesFromAllWorkoutQueries < 1)
                          {
                            if (self->fPendingCaloriesFromFirstPartyWorkoutQueries < 1)
                            {
                              if (self->fPendingCaloriesFromFitnessPlusWorkoutQueries < 1)
                              {
                                if (self->fPendingExerciseMinutesQueries < 1)
                                {
                                  if (self->fPendingTimeNonStaticQueries < 1)
                                  {
                                    if (qword_10229FF10 != -1)
                                      dispatch_once(&qword_10229FF10, &stru_102162B78);
                                    v3 = qword_10229FF18;
                                    if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, all queries finished successfully", buf, 2u);
                                    }
                                    if (sub_1001BFF7C(115, 2))
                                    {
                                      bzero(buf, 0x65CuLL);
                                      if (qword_10229FF10 != -1)
                                        dispatch_once(&qword_10229FF10, &stru_102162B78);
                                      v6[0] = 0;
                                      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF18, 2, "CLFitnessDailyAnalyticsAggregator, all queries finished successfully", v6, 2);
                                      v5 = (uint8_t *)v4;
                                      sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator runNextPendingQuery]", "%s\n", v4);
                                      if (v5 != buf)
                                        free(v5);
                                    }
                                    -[CLFitnessDailyAnalyticsAggregator resetQueryState](self, "resetQueryState");
                                    -[CLFitnessDailyAnalyticsAggregator attemptSendCoreAnalytics](self, "attemptSendCoreAnalytics");
                                  }
                                  else
                                  {
                                    -[CLFitnessDailyAnalyticsAggregator queryTimeNonStatic](self, "queryTimeNonStatic");
                                  }
                                }
                                else
                                {
                                  -[CLFitnessDailyAnalyticsAggregator queryExerciseMinutes](self, "queryExerciseMinutes");
                                }
                              }
                              else
                              {
                                -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromFitnessPlusWorkouts](self, "queryCaloriesFromFitnessPlusWorkouts");
                              }
                            }
                            else
                            {
                              -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromFirstPartyWorkouts](self, "queryCaloriesFromFirstPartyWorkouts");
                            }
                          }
                          else
                          {
                            -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromAllWorkouts](self, "queryCaloriesFromAllWorkouts");
                          }
                        }
                        else
                        {
                          -[CLFitnessDailyAnalyticsAggregator queryPedDistance](self, "queryPedDistance");
                        }
                      }
                      else
                      {
                        -[CLFitnessDailyAnalyticsAggregator queryBasalCalories](self, "queryBasalCalories");
                      }
                    }
                    else
                    {
                      -[CLFitnessDailyAnalyticsAggregator queryActiveCalories](self, "queryActiveCalories");
                    }
                  }
                  else
                  {
                    -[CLFitnessDailyAnalyticsAggregator queryFlightsClimbed](self, "queryFlightsClimbed");
                  }
                }
                else
                {
                  -[CLFitnessDailyAnalyticsAggregator queryStepCount](self, "queryStepCount");
                }
              }
              else
              {
                -[CLFitnessDailyAnalyticsAggregator queryTimeInDaylightMetadata](self, "queryTimeInDaylightMetadata");
              }
            }
            else
            {
              -[CLFitnessDailyAnalyticsAggregator queryTimeInDaylight](self, "queryTimeInDaylight");
            }
          }
          else
          {
            -[CLFitnessDailyAnalyticsAggregator queryCompanionStepCount](self, "queryCompanionStepCount");
          }
        }
        else
        {
          -[CLFitnessDailyAnalyticsAggregator queryCompanionPedDistance](self, "queryCompanionPedDistance");
        }
      }
      else
      {
        -[CLFitnessDailyAnalyticsAggregator queryCompanionFlightsClimbed](self, "queryCompanionFlightsClimbed");
      }
    }
    else
    {
      -[CLFitnessDailyAnalyticsAggregator queryCompanionBasalCalories](self, "queryCompanionBasalCalories");
    }
  }
  else
  {
    -[CLFitnessDailyAnalyticsAggregator queryCompanionActiveCalories](self, "queryCompanionActiveCalories");
  }
}

- (void)queryCompanionStepCount
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fCompanionSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCompanionStepCountQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B36C0;
  v6[3] = &unk_1021628F0;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryStepCount:endDate:sources:stepCountHandler:](self, "queryStepCount:endDate:sources:stepCountHandler:", v3, v4, fCompanionSources, v6);
}

- (void)queryStepCount
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingStepCountQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B3A00;
  v6[3] = &unk_1021628F0;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryStepCount:endDate:sources:stepCountHandler:](self, "queryStepCount:endDate:sources:stepCountHandler:", v3, v4, fSources, v6);
}

- (void)queryStepCount:(id)a3 endDate:(id)a4 sources:(id)a5 stepCountHandler:(id)a6
{
  NSCompoundPredicate *v10;
  id v11;
  id v12;
  _QWORD v13[9];
  _QWORD v14[6];
  void *__p;
  void *v16;
  uint64_t v17;

  v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3), +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5), 0));
  v11 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v11, "setHour:", 1);
  v12 = objc_msgSend(objc_alloc((Class)HKStatisticsCollectionQuery), "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierStepCount), v10, 16, a3, v11);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x4812000000;
  v14[3] = sub_100207058;
  v14[4] = sub_100207BD8;
  v14[5] = &unk_102080316;
  __p = 0;
  v16 = 0;
  v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009B3EC4;
  v13[3] = &unk_102162990;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a6;
  v13[8] = v14;
  objc_msgSend(v12, "setInitialResultsHandler:", v13);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v12);

  _Block_object_dispose(v14, 8);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
}

- (void)queryFlightsClimbed
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingFlightsClimbedQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B44E0;
  v6[3] = &unk_1021629B8;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryFlightsClimbed:endDate:sources:flightsClimbedHandler:](self, "queryFlightsClimbed:endDate:sources:flightsClimbedHandler:", v3, v4, fSources, v6);
}

- (void)queryCompanionFlightsClimbed
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fCompanionSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCompanionFlightsClimbedQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B480C;
  v6[3] = &unk_1021629B8;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryFlightsClimbed:endDate:sources:flightsClimbedHandler:](self, "queryFlightsClimbed:endDate:sources:flightsClimbedHandler:", v3, v4, fCompanionSources, v6);
}

- (void)queryFlightsClimbed:(id)a3 endDate:(id)a4 sources:(id)a5 flightsClimbedHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B4BB8;
  v10[3] = &unk_102162A08;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKStatisticsQuery), "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierFlightsClimbed), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 16, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryActiveCalories
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingActiveCaloriesQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B4FD0;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCalories:endDate:hkIdentifier:sources:caloriesHandler:](self, "queryCalories:endDate:hkIdentifier:sources:caloriesHandler:", v3, v4, HKQuantityTypeIdentifierActiveEnergyBurned, fSources, v6);
}

- (void)queryCompanionActiveCalories
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fCompanionSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCompanionActiveCaloriesQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B5308;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCalories:endDate:hkIdentifier:sources:caloriesHandler:](self, "queryCalories:endDate:hkIdentifier:sources:caloriesHandler:", v3, v4, HKQuantityTypeIdentifierActiveEnergyBurned, fCompanionSources, v6);
}

- (void)queryBasalCalories
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingBasalCaloriesQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B5640;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCalories:endDate:hkIdentifier:sources:caloriesHandler:](self, "queryCalories:endDate:hkIdentifier:sources:caloriesHandler:", v3, v4, HKQuantityTypeIdentifierBasalEnergyBurned, fSources, v6);
}

- (void)queryCompanionBasalCalories
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fCompanionSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCompanionBasalCaloriesQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B5978;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCalories:endDate:hkIdentifier:sources:caloriesHandler:](self, "queryCalories:endDate:hkIdentifier:sources:caloriesHandler:", v3, v4, HKQuantityTypeIdentifierBasalEnergyBurned, fCompanionSources, v6);
}

- (void)queryCalories:(id)a3 endDate:(id)a4 hkIdentifier:(id)a5 sources:(id)a6 caloriesHandler:(id)a7
{
  id v11;
  _QWORD v12[6];
  _QWORD v13[2];

  v13[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v13[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009B5D20;
  v12[3] = &unk_102162A08;
  v12[4] = self;
  v12[5] = a7;
  v11 = objc_msgSend(objc_alloc((Class)HKStatisticsQuery), "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", a5), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2)), 16, v12);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v11);

}

- (void)queryPedDistance
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingPedDistanceQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B6128;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryPedDistance:endDate:sources:distanceHandler:](self, "queryPedDistance:endDate:sources:distanceHandler:", v3, v4, fSources, v6);
}

- (void)queryCompanionPedDistance
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fCompanionSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCompanionPedDistanceQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B6454;
  v6[3] = &unk_102162A30;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryPedDistance:endDate:sources:distanceHandler:](self, "queryPedDistance:endDate:sources:distanceHandler:", v3, v4, fCompanionSources, v6);
}

- (void)queryPedDistance:(id)a3 endDate:(id)a4 sources:(id)a5 distanceHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B6800;
  v10[3] = &unk_102162A08;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKStatisticsQuery), "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierDistanceWalkingRunning), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 16, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryCaloriesFromAllWorkouts
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCaloriesFromAllWorkoutQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B6C08;
  v6[3] = &unk_102162A58;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:](self, "queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:", v3, v4, fSources, v6);
}

- (void)queryCaloriesFromFirstPartyWorkouts
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fFirstPartySources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCaloriesFromFirstPartyWorkoutQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fFirstPartySources = self->fFirstPartySources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B6F64;
  v6[3] = &unk_102162A58;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:](self, "queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:", v3, v4, fFirstPartySources, v6);
}

- (void)queryCaloriesFromFitnessPlusWorkouts
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fFitnessPlusSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingCaloriesFromFitnessPlusWorkoutQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fFitnessPlusSources = self->fFitnessPlusSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B732C;
  v6[3] = &unk_102162A58;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:](self, "queryCaloriesFromWorkouts:endDate:sources:workoutsHandler:", v3, v4, fFitnessPlusSources, v6);
}

- (void)queryCaloriesFromWorkouts:(id)a3 endDate:(id)a4 sources:(id)a5 workoutsHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B76D0;
  v10[3] = &unk_102162AA8;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKSampleType workoutType](HKSampleType, "workoutType"), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 0, 0, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryExerciseMinutes
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingExerciseMinutesQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B7C44;
  v6[3] = &unk_1021629B8;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryExerciseMinutes:endDate:sources:exerciseMinutesHandler:](self, "queryExerciseMinutes:endDate:sources:exerciseMinutesHandler:", v3, v4, fSources, v6);
}

- (void)queryExerciseMinutes:(id)a3 endDate:(id)a4 sources:(id)a5 exerciseMinutesHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B7FF0;
  v10[3] = &unk_102162A08;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKStatisticsQuery), "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierAppleExerciseTime), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 16, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryTimeInDaylight
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingTimeInDaylightQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B83FC;
  v6[3] = &unk_1021629B8;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryTimeInDaylight:endDate:sources:timeInDaylightHandler:](self, "queryTimeInDaylight:endDate:sources:timeInDaylightHandler:", v3, v4, fSources, v6);
}

- (void)queryTimeInDaylight:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B87B4;
  v10[3] = &unk_102162A08;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKStatisticsQuery), "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierTimeInDaylight), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 16, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryTimeInDaylightMetadata
{
  NSDate *v3;
  NSDate *v4;
  NSMutableSet *fSources;
  _QWORD v6[6];

  v3 = -[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->fHKQueryStartDate, (double)(-86400 * self->fPendingTimeInDaylightMetadataQueries)));
  v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", 86399.0);
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B8BC0;
  v6[3] = &unk_102162AD0;
  v6[4] = self;
  v6[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryTimeInDaylightMetadata:endDate:sources:timeInDaylightMetadataHandler:](self, "queryTimeInDaylightMetadata:endDate:sources:timeInDaylightMetadataHandler:", v3, v4, fSources, v6);
}

- (void)queryTimeInDaylightMetadata:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightMetadataHandler:(id)a6
{
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3);
  v11[1] = +[HKQuery predicateForObjectsFromSources:](HKQuery, "predicateForObjectsFromSources:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B9000;
  v10[3] = &unk_102162AA8;
  v10[4] = self;
  v10[5] = a6;
  v9 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierTimeInDaylight), +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)), 0, 0, v10);
  self->fQueryState = 2;
  -[HKHealthStore executeQuery:](self->fHealthStore, "executeQuery:", v9);

}

- (void)queryTimeNonStatic
{
  uint64_t v3;
  _QWORD v4[6];

  -[NSDate timeIntervalSinceReferenceDate](-[NSCalendar startOfDayForDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "startOfDayForDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(-86400 * self->fPendingTimeNonStaticQueries))), "timeIntervalSinceReferenceDate");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009B985C;
  v4[3] = &unk_102162B30;
  v4[4] = self;
  v4[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryTimeNonStatic:endDate:TimeNonStaticHandler:](self, "queryTimeNonStatic:endDate:TimeNonStaticHandler:", v4);
}

- (void)queryTimeNonStatic:(double)a3 endDate:(double)a4 TimeNonStaticHandler:(id)a5
{
  CLMotionStateProtocol *fMotionStateProxy;
  _QWORD v6[8];

  self->fQueryState = 2;
  fMotionStateProxy = self->fMotionStateProxy;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B9B2C;
  v6[3] = &unk_102162B58;
  *(double *)&v6[6] = a3;
  *(double *)&v6[7] = a4;
  v6[4] = self;
  v6[5] = a5;
  -[CLMotionStateProtocol queryMotionStatesWithStartTime:endTime:isFromInternalClient:withReply:](fMotionStateProxy, "queryMotionStatesWithStartTime:endTime:isFromInternalClient:withReply:", 1, v6);
}

- (void)sendFitnessAnalytics:(FitnessDailyMetric *)a3
{
  uint64_t v4;
  float var15;
  BOOL v6;
  float v7;
  float v8;
  double v9;
  NSDictionary *v10;
  id v11;
  NSDictionary *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  _QWORD v18[5];
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[15];
  _QWORD v32[15];

  v4 = a3->var3 + a3->var2;
  var15 = a3->var15;
  v6 = var15 <= 0.0;
  v7 = (double)v4 / (var15 * 24.0);
  if (v6)
    v8 = -1.0;
  else
    v8 = v7;
  v31[0] = CFSTR("age");
  v32[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var13);
  v31[1] = CFSTR("calories");
  v32[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4);
  v31[2] = CFSTR("caloriesFromFirstPartyWorkouts");
  v32[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var9);
  v31[3] = CFSTR("caloriesFromFitnessPlusWorkouts");
  v32[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var10);
  v31[4] = CFSTR("caloriesFromThirdPartyWorkouts");
  v32[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var8 - a3->var9);
  v31[5] = CFSTR("distance");
  v32[5] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var5);
  v31[6] = CFSTR("exerciseMinutes");
  v32[6] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var7);
  v31[7] = CFSTR("flights");
  v32[7] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4);
  v31[8] = CFSTR("gender");
  v32[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var14);
  v31[9] = CFSTR("mets");
  *(float *)&v9 = v8;
  v32[9] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
  v31[10] = CFSTR("nonPedWorkouts");
  v32[10] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var11);
  v31[11] = CFSTR("phoneFitnessMode");
  v32[11] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var20);
  v31[12] = CFSTR("steps");
  v32[12] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(a3->var6 / 0x64) * 100.0);
  v31[13] = CFSTR("timeNonPedWorkouts");
  v32[13] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var12);
  v31[14] = CFSTR("timeNonStatic");
  v32[14] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var16);
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 15);
  v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v11, "addEntriesFromDictionary:", v10);
  sub_100197040();
  if (sub_1000C4240())
  {
    v29[0] = CFSTR("timeWatchConnected");
    v30[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var17);
    v29[1] = CFSTR("watchPaired");
    v30[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var19);
    v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v13 = CFSTR("com.apple.CoreMotion.FitnessDailyPhone");
LABEL_8:
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);
    goto LABEL_10;
  }
  sub_100197040();
  if (sub_100195F08())
  {
    v14 = a3->var22 + a3->var21;
    v27[0] = CFSTR("timePhoneConnected");
    v28[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var17);
    v27[1] = CFSTR("caloriesPhone");
    v28[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14);
    v27[2] = CFSTR("distancePhone");
    v28[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var24);
    v27[3] = CFSTR("flightsPhone");
    v28[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var23);
    v27[4] = CFSTR("stepsPhone");
    v28[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var25);
    v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
    v13 = CFSTR("com.apple.CoreMotion.FitnessDailyWatch");
    goto LABEL_8;
  }
  v13 = &stru_1021D8FB8;
LABEL_10:
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009BA2A0;
  v18[3] = &unk_10215F370;
  v18[4] = v11;
  AnalyticsSendEventLazy(v13, v18);
  if (qword_10229FF10 != -1)
    dispatch_once(&qword_10229FF10, &stru_102162B78);
  v15 = qword_10229FF18;
  if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    v24 = v13;
    v25 = 2113;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF10 != -1)
      dispatch_once(&qword_10229FF10, &stru_102162B78);
    v19 = 138412547;
    v20 = v13;
    v21 = 2113;
    v22 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF18, 0, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", &v19, 22);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator sendFitnessAnalytics:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
}

- (void)sendTimeInDaylightAnayltics:(FitnessDailyMetric *)a3
{
  NSDictionary *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSDictionary *v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  NSDictionary *v16;
  _QWORD v17[6];
  _QWORD v18[6];

  sub_100197040();
  if (sub_100195F08())
  {
    v17[0] = CFSTR("timeInDaylight");
    v18[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var26);
    v17[1] = CFSTR("localDaytimeDuration");
    v18[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var30);
    v17[2] = CFSTR("ambientLightIntensityMin");
    v18[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var27);
    v17[3] = CFSTR("ambientLightIntensityMedian");
    v18[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var28);
    v17[4] = CFSTR("ambientLightIntensityMax");
    v18[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var29);
    v17[5] = CFSTR("ageBin");
    v18[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var13);
    v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009BA580;
    v8[3] = &unk_102132010;
    v8[4] = v4;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.TimeInDaylight.Daily"), v8);
    if (qword_10229FF10 != -1)
      dispatch_once(&qword_10229FF10, &stru_102162B78);
    v5 = qword_10229FF18;
    if (os_log_type_enabled((os_log_t)qword_10229FF18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412547;
      v14 = CFSTR("com.apple.CoreMotion.TimeInDaylight.Daily");
      v15 = 2113;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF10 != -1)
        dispatch_once(&qword_10229FF10, &stru_102162B78);
      v9 = 138412547;
      v10 = CFSTR("com.apple.CoreMotion.TimeInDaylight.Daily");
      v11 = 2113;
      v12 = v4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF18, 0, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", &v9, 22);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator sendTimeInDaylightAnayltics:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)attemptSendCoreAnalytics
{
  _BYTE v3[8];
  CFAbsoluteTime Current;

  if (self)
  {
    -[CLFitnessDailyAnalyticsAggregator getActivityStats](self, "getActivityStats");
    if (v3[0])
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[CLFitnessDailyAnalyticsAggregator sendFitnessAnalytics:](self, "sendFitnessAnalytics:", v3);
      -[CLFitnessDailyAnalyticsAggregator sendTimeInDaylightAnayltics:](self, "sendTimeInDaylightAnayltics:", v3);
      -[CLFitnessDailyAnalyticsAggregator storeCache:](self, "storeCache:", self->fDataCache);
    }
  }
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;

  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->fCompanionNotifierClient.__ptr_.__value_;
  self->fCompanionNotifierClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
