@implementation CLGeoMapTilesPreloaderService

- (void)onLocationNotification:(int)a3 data:(uint64_t)a4
{
  uint64_t v5;
  int v6;
  int v7;
  NSObject *v10;
  char *v11;
  _QWORD v12[5];
  _DWORD v13[4];
  uint8_t buf[4];
  int v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1013CD460;
  v12[3] = &unk_1021B3250;
  v12[4] = a1;
  if (a3 == 5)
  {
    v5 = a1 + 360;
    v6 = *(_DWORD *)(a1 + 560);
    sub_10017A970(a1 + 360, a4, (uint64_t)v12, *(double *)(a1 + 752));
    v7 = *(_DWORD *)(v5 + 200);
    if ((v6 == 2) != (v7 == 2))
      objc_msgSend((id)a1, "setNewCriteria:", *(unsigned int *)(a1 + 348));
    if (v7 != 2 && v6 == 2)
      objc_msgSend((id)a1, "unregisterForMotionStateMediatorNotification");
    objc_msgSend((id)a1, "fetchLOIFromCoreRoutine");
    objc_msgSend((id)a1, "fetchNPLOI");
    objc_msgSend((id)a1, "fetchWorkoutCount:", 0);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v10 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLGMTPS, received unhandled location notification,%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v13[0] = 67174657;
      v13[1] = a3;
      v11 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS, received unhandled location notification,%{private}d", v13, 8);
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onLocationNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
}

- (void)fetchWorkoutCount:(BOOL)a3
{
  _BOOL4 v3;
  int64_t *p_fTotalNPLOISectionDownloads;
  int *v6;
  uint64_t v7;
  double Current;
  double v9;
  NSObject *v10;
  uint64_t v11;
  int value;
  uint64_t v13;
  int v14;
  char *v15;
  NSDate *v16;
  id v17;
  NSPredicate *v18;
  NSPredicate *v19;
  NSPredicate *v20;
  NSPredicate *v21;
  NSCompoundPredicate *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  NSDate *v27;
  int v28;
  NSPredicate *v29;
  _QWORD v30[5];
  int v31;
  _WORD v32[8];
  int64_t *v33;
  __int16 v34;
  _QWORD v35[3];
  _QWORD v36[6];
  _DWORD v37[2];
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  int v43;
  int v44;
  uint8_t buf[4];
  _BOOL4 v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  int v52;

  v3 = a3;
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v33 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v34 = 256;
  v6 = &OBJC_IVAR___CLGeoMapTilesPreloaderService_fTimeOfLastWorkoutQueryOnDeviceUnlock;
  if (!v3)
    v6 = &OBJC_IVAR___CLGeoMapTilesPreloaderService_fTimeOfLastWorkoutQuery;
  v7 = *v6;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = vabdd_f64(Current, *(double *)&self->CLIntersiloService_opaque[v7]);
  if (v9 >= 10800.0)
  {
    *(double *)&self->CLIntersiloService_opaque[v7] = Current;
    -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
    if ((sub_1013BF300((uint64_t)v37) & 1) != 0)
    {
      v16 = +[NSDate now](NSDate, "now");
      v28 = v44;
      v29 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v16, (double)(-86400 * v44)), v16, 3);
      v27 = v16;
      v17 = +[HKQuery _predicateForObjectsFromAppleWatches](HKQuery, "_predicateForObjectsFromAppleWatches");
      v18 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 52));
      v19 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 13));
      v20 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 37));
      v21 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 24));
      v36[0] = v18;
      v36[1] = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 70));
      v36[2] = v19;
      v36[3] = v20;
      v36[4] = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:](HKQuery, "predicateForWorkoutActivitiesWithWorkoutActivityType:", 71));
      v36[5] = v21;
      v35[0] = v29;
      v35[1] = v17;
      v35[2] = +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 6));
      v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v23 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CLGMTPS,setting up workout count query", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v32[0] = 0;
        v26 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,setting up workout count query", v32, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v26);
        if (v26 != (char *)buf)
          free(v26);
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1013CE130;
      v30[3] = &unk_1021B3278;
      v30[4] = self;
      v31 = v28;
      v24 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKSampleType workoutType](HKSampleType, "workoutType"), v22, 0, 0, v30);
      objc_msgSend(*(id *)&self->fTimeOfLastWorkoutQueryOnDeviceUnlock, "executeQuery:", v24);

    }
    else
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v25 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "CLGMTPS,skipped workout query,as aggressive caching is not allowed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v32[0] = 0;
        v15 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,skipped workout query,as aggressive caching is not allowed", v32, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v15);
        goto LABEL_28;
      }
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v10 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)&self->CLIntersiloService_opaque[v7];
      value = self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_;
      *(_DWORD *)buf = 67240960;
      v46 = v3;
      v47 = 2050;
      v48 = v11;
      v49 = 2050;
      v50 = v9;
      v51 = 1026;
      v52 = value;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLGMTPS,skipped workout query,unlocked,%{public}d,lastQueryTime,%{public}.1lf,timeSinceLastQuery,%{public}.1lf,numWorkouts,%{public}d", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v13 = *(_QWORD *)&self->CLIntersiloService_opaque[v7];
      v14 = self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_;
      v37[0] = 67240960;
      v37[1] = v3;
      v38 = 2050;
      v39 = v13;
      v40 = 2050;
      v41 = v9;
      v42 = 1026;
      v43 = v14;
      v15 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,skipped workout query,unlocked,%{public}d,lastQueryTime,%{public}.1lf,timeSinceLastQuery,%{public}.1lf,numWorkouts,%{public}d", v37, 34);
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v15);
LABEL_28:
      if (v15 != (char *)buf)
        free(v15);
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (BOOL)fetchLOIFromCoreRoutine
{
  CLRoutineManagerInfo *p_fRoutineInfo;
  _BOOL4 v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  char *v8;
  double v9;
  NSObject *v10;
  unint64_t value;
  double v12;
  unint64_t v13;
  double v14;
  char *v15;
  _DWORD v17[2];
  __int16 v18;
  double v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  double v23;

  if (self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
  {
    p_fRoutineInfo = &self->fRoutineInfo;
    v4 = sub_10017BC38(&self->fRoutineInfo.fLOICoarseCoordinateRequestMachContTime);
    if (v4)
    {
      if (-[CLGeoMapTilesPreloaderService setCoarseCoordinatesFromDefaultsWriteEntry](self, "setCoarseCoordinatesFromDefaultsWriteEntry"))
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v5 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,using coordinates from defaults-write entry", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          LOWORD(v17[0]) = 0;
          v6 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,using coordinates from defaults-write entry", v17, 2);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v6);
          if (v6 != (char *)buf)
            free(v6);
        }
      }
      else
      {
        v9 = sub_1001FCBB4();
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v10 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
        {
          value = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          v12 = v9 - p_fRoutineInfo->fLOICoarseCoordinateRequestMachContTime;
          *(_DWORD *)buf = 67240448;
          v21 = value;
          v22 = 2050;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CLGMTPS,requesting home work school LOIs,%{public}d,dT,%{public}.1lf", buf, 0x12u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v13 = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          v14 = v9 - p_fRoutineInfo->fLOICoarseCoordinateRequestMachContTime;
          v17[0] = 67240448;
          v17[1] = v13;
          v18 = 2050;
          v19 = v14;
          v15 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,requesting home work school LOIs,%{public}d,dT,%{public}.1lf", v17, 18);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v15);
          if (v15 != (char *)buf)
            free(v15);
        }
        p_fRoutineInfo->fLOICoarseCoordinateRequestMachContTime = v9;
        -[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:](self, "fetchLOIForType:isSecondTry:", 0, 0);
      }
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v7 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLGMTPS,LOI query cancelled,mobile assets not received", buf, 2u);
    }
    v4 = sub_1001BFF7C(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LOWORD(v17[0]) = 0;
      v8 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,LOI query cancelled,mobile assets not received", v17, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)fetchNPLOI
{
  int64_t *p_fTotalNPLOISectionDownloads;
  CLRoutineManagerInfo *p_fRoutineInfo;
  double v5;
  NSObject *v6;
  double v7;
  double v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t value;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSDate *v16;
  id v17;
  double v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  CLLocationCoordinate2D v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void **v29;
  uint64_t v30;
  id (*v31)(uint64_t, uint64_t, uint64_t);
  void *v32;
  CLGeoMapTilesPreloaderService *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _OWORD v45[10];
  int v46;
  int64_t *v47;
  __int16 v48;
  int v49;
  double v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  double v58;
  uint8_t buf[4];
  double v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  double v68;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v47 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v48 = 256;
  if (self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
  {
    -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
    p_fRoutineInfo = &self->fRoutineInfo;
    if (BYTE4(v45[0]))
    {
      if (!sub_1013BC9AC((uint64_t)&self->fRoutineInfo))
        goto LABEL_56;
      v30 = 3221225472;
      v41 = v45[7];
      v42 = v45[8];
      v43 = v45[9];
      v37 = v45[3];
      v38 = v45[4];
      v39 = v45[5];
      v40 = v45[6];
      v34 = v45[0];
      v35 = v45[1];
      v29 = _NSConcreteStackBlock;
      v31 = sub_1013BCBE8;
      v32 = &unk_1021B3158;
      v33 = self;
      LODWORD(v44) = v46;
      v36 = v45[2];
      v5 = sub_1013BD8D0((uint64_t)&self->fRoutineInfo);
      if (v5 < 0.0 || v5 > 21600.0)
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v14 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v60 = v5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,current location not available to make query,%{public}.1lf", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v49 = 134349056;
          v50 = v5;
          v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,NPLOI,current location not available to make query,%{public}.1lf", &v49, 12, v29, v30, v31, v32, v33, v34, v35, v36, v37,
                         v38,
                         v39,
                         v40,
                         v41,
                         v42,
                         v43,
                         v44);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
      else if (*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4) <= 250.0)
      {
        v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.courseAccuracy + 4));
        v17 = objc_alloc_init((Class)NSDateFormatter);
        objc_msgSend(v17, "setDateFormat:", CFSTR("yyyy-MM-dd"));
        v18 = COERCE_DOUBLE(objc_msgSend(v17, "stringFromDate:", v16));
        v19 = objc_msgSend(v17, "stringFromDate:", +[NSDate date](NSDate, "date"));
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v20 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
        {
          v21 = *(_QWORD *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1);
          v22 = *(_QWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4);
          *(_DWORD *)buf = 138544387;
          v60 = v18;
          v61 = 2114;
          v62 = v19;
          v63 = 2049;
          v64 = v21;
          v65 = 2049;
          v66 = v22;
          v67 = 2050;
          v68 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,requested,dataDate,%{public}@,todaysDate,%{public}@,LL,%{private}.7lf,%{private}.7lf,locationAge,%{public}.1lf", buf, 0x34u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v26 = *(_QWORD *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1);
          v27 = *(_QWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4);
          v49 = 138544387;
          v50 = v18;
          v51 = 2114;
          v52 = v19;
          v53 = 2049;
          v54 = v26;
          v55 = 2049;
          v56 = v27;
          v57 = 2050;
          v58 = v5;
          v28 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,NPLOI,requested,dataDate,%{public}@,todaysDate,%{public}@,LL,%{private}.7lf,%{private}.7lf,locationAge,%{public}.1lf", &v49, 52, v29, v30, v31, v32, v33, v34, v35, v36,
                          v37,
                          v38,
                          v39,
                          v40,
                          v41,
                          v42,
                          v43,
                          v44);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v28);
          if (v28 != (char *)buf)
            free(v28);
        }
        self->fRoutineInfo.fDistanceCalc.fRefLatDegs = CFAbsoluteTimeGetCurrent();
        v23 = objc_alloc((Class)CLLocation);
        v24 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1), *(CLLocationDegrees *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4));
        v25 = objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v16, v24.latitude, v24.longitude, *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.horizontalAccuracy + 4), *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4), *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.altitude + 4));
        -[CLRoutineMonitorServiceProtocol fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withReply:](self->fRoutineMonitor, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withReply:", v25, +[NSDate date](NSDate, "date"), &v29, 86400.0);

      }
      else
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v6 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
        {
          v7 = *(double *)((char *)&p_fRoutineInfo->fLastUserLocation.coordinate.longitude + 4);
          *(_DWORD *)buf = 134349056;
          v60 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,not requested as hunc is over threshold,%{public}.1lf", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v8 = *(double *)((char *)&p_fRoutineInfo->fLastUserLocation.coordinate.longitude + 4);
          v49 = 134349056;
          v50 = v8;
          v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,NPLOI,not requested as hunc is over threshold,%{public}.1lf", &v49, 12, v29, v30, v31, v32, v33, v34, v35, v36, v37,
                         v38,
                         v39,
                         v40,
                         v41,
                         v42,
                         v43,
                         v44);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
LABEL_48:
          if (v9 != (char *)buf)
            free(v9);
        }
      }
    }
    else
    {
      *(_DWORD *)buf = 3;
      if (sub_10017BFFC((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf))
      {
        *(_DWORD *)buf = 3;
        sub_1013D0C84((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v11 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
        {
          value = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          *(_DWORD *)buf = 134349056;
          v60 = *(double *)&value;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI caching not allowed, erased all NPLOI coordinates,size,%{public}ld", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v13 = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          v49 = 134349056;
          v50 = *(double *)&v13;
          v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,NPLOI caching not allowed, erased all NPLOI coordinates,size,%{public}ld", &v49, 12);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
      else
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v15 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI caching not allowed", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          LOWORD(v49) = 0;
          v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,NPLOI caching not allowed", &v49, 2);
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v10 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI query cancelled, mobile assets not received", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LOWORD(v45[0]) = 0;
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,NPLOI query cancelled, mobile assets not received", v45, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
      goto LABEL_48;
    }
  }
LABEL_56:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (CLMapMatcherGeoTilesPrecachingConfig)getConfigFromMobileAssets
{
  CLMapMatcherGeoTilesPrecachingConfig *result;
  char v6;
  int var12;
  int var13;
  int var15;
  int var17;
  NSObject *v11;
  char *v12;
  _WORD v13[8];
  void *__p[2];
  char v15;

  sub_10018755C((uint64_t)retstr);
  result = -[CLGeoMapTilesPreloaderService getCountryCode](self, "getCountryCode");
  if (!result)
    return result;
  sub_1015A2E04(__p, (char *)-[CLMapMatcherGeoTilesPrecachingConfig UTF8String](result, "UTF8String"));
  result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_100187620((uint64_t **)&self->fMapMatcherMobileAssetReader, (const void **)__p, (uint64_t)retstr);
  v6 = (char)result;
  if (v15 < 0)
  {
    operator delete(__p[0]);
    if ((v6 & 1) != 0)
      goto LABEL_4;
  }
  else if ((result & 1) != 0)
  {
LABEL_4:
    var12 = retstr->var12;
    var13 = retstr->var13;
    if (self->fSettings.fMinimumBatteryLevel > 0)
      var12 = self->fSettings.fMinimumBatteryLevel;
    self->fMinimumBatterylevel = var12;
    self->fMinimumBatteryLevelAggressiveMode = var13;
    var15 = retstr->var15;
    self->fXPCDownloadInterval = retstr->var14;
    self->fDownloadSizePerSection = var15;
    var17 = retstr->var17;
    self->fUploadSizePerSection = retstr->var16;
    self->fDownloadTimePerSection = var17;
    self->fIsDiskIntensiveActivity = retstr->var2;
    *(double *)&self->fTotalTimeSpentDownloadingData.__tree_.__pair1_.__value_.__left_ = (double)retstr->var25;
    if (self->fMinimumBatterylevel <= 24)
      self->fMinimumBatterylevel = 25;
    return result;
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v11 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLGMTPS,precaching config not available, precaching not supported", (uint8_t *)__p, 2u);
  }
  result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_1001BFF7C(115, 2);
  if ((_DWORD)result)
  {
    bzero(__p, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v13[0] = 0;
    v12 = (char *)_os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,precaching config not available, precaching not supported", v13, 2);
    result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getConfigFromMobileAssets]", "%s\n", v12);
    if (v12 != (char *)__p)
      free(v12);
  }
  return result;
}

- (id)getCountryCode
{
  id result;

  result = +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  if (result)
    return objc_msgSend(result, "countryCode");
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
  if (qword_10230EB08 != -1)
    dispatch_once(&qword_10230EB08, &stru_1021B30E0);
  return (id)qword_10230EB00;
}

- (CLGeoMapTilesPreloaderService)init
{
  CLGeoMapTilesPreloaderService *v2;
  CLGeoMapTilesPreloaderService *v3;
  CLGeoMapTilesPreloaderSettings *p_fSettings;
  Client *value;
  Client *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;
  int fMinimumBatteryLevel;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLGeoMapTilesPreloaderService;
  v2 = -[CLGeoMapTilesPreloaderService initWithInboundProtocol:outboundProtocol:](&v17, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGeoMapTilesPreloaderServiceProtocol, &OBJC_PROTOCOL___CLGeoMapTilesPreloaderServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    p_fSettings = &v2->fSettings;
    sub_1013B6D7C((unsigned __int8 *)&v2->fSettings);
    v3->fRoutineMonitor = 0;
    v3->fGEOCoarseLocationProvider = 0;
    v3->fGEOMapFeatureAccess = 0;
    v3->fGeoMapSubscriptionManager = 0;
    v3->fIsTrackPrecachingEnabled = 0;
    value = v3->fWiFiServiceClient.__ptr_.__value_;
    v3->fWiFiServiceClient.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
    v6 = v3->fDaemonStatusClient.__ptr_.__value_;
    v3->fDaemonStatusClient.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
    v7 = v3->fClientManagerClient.__ptr_.__value_;
    v3->fClientManagerClient.__ptr_.__value_ = 0;
    if (v7)
      (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
    v8 = v3->fMobileAssetClient.__ptr_.__value_;
    v3->fMobileAssetClient.__ptr_.__value_ = 0;
    if (v8)
      (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
    v9 = v3->fLocationClient.__ptr_.__value_;
    v3->fLocationClient.__ptr_.__value_ = 0;
    if (v9)
      (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
    v10 = v3->fDataProtectionClient.__ptr_.__value_;
    v3->fDataProtectionClient.__ptr_.__value_ = 0;
    if (v10)
      (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
    v3->fIsWiFiAssociated = 0;
    v3->fIsCharging = 0;
    v3->fBatteryLevel = -1.0;
    v3->fThermalLevel = -1;
    v3->fTimeOfLastWorkoutQueryOnDeviceUnlock = 0.0;
    v3->fLocationServiceState = 0;
    v3->fDownloadRequestInProgress = 0;
    v3->fIsDiskIntensiveActivity = 0;
    v3->fAnalytics.fTotalTouristSectionDownloads = 0;
    v3->fXPCCurrentInterval = -1;
    v3->fIsXPCSettingAggressive = 0;
    v3->fXPCDownloadInterval = 301;
    v3->fDownloadSizePerSection = 150000;
    v3->fUploadSizePerSection = 10000;
    v3->fDownloadTimePerSection = 150;
    fMinimumBatteryLevel = v3->fSettings.fMinimumBatteryLevel;
    if (fMinimumBatteryLevel <= 0)
      fMinimumBatteryLevel = 75;
    v3->fMinimumBatterylevel = fMinimumBatteryLevel;
    v3->fMinimumBatteryLevelAggressiveMode = 50;
    v3->fTotalTimeSpentDownloadingData.__tree_.__pair1_.__value_.__left_ = (void *)0x40F86A0000000000;
    *(_QWORD *)&v3->fNumberOfWorkoutsPerformedRecently = 0xBFF0000000000000;
    v3->fDistanceFromHomeForTouristModeMeters = -1.0;
    LODWORD(v3->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_) = 0;
    LOBYTE(v3->fTimeOfLastWorkoutQuery) = 0;
    if (p_fSettings->fEnabled)
    {
      sub_1013D0D94("CLGMTPSOSTransaction", &v16);
      sub_1002B7674((uint64_t)&v3->fHealthStore, &v16);
      v12 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
      if (*((_QWORD *)&v16 + 1))
      {
        v13 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      v3->fGEOCoarseLocationProvider = (GEOCoarseLocationProvider *)objc_alloc_init((Class)GEOCoarseLocationProvider);
      operator new();
    }
  }
  return v3;
}

- (void)beginService
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (self->fSettings.fEnabled)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,beginService", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,beginService", v9, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService beginService]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    -[CLGeoMapTilesPreloaderService registerForRoutineMonitor](self, "registerForRoutineMonitor");
    -[CLGeoMapTilesPreloaderService registerForLocationNotification](self, "registerForLocationNotification");
    -[CLGeoMapTilesPreloaderService registerForMobileAssetNotification](self, "registerForMobileAssetNotification");
    -[CLGeoMapTilesPreloaderService registerForWifiServiceNotification](self, "registerForWifiServiceNotification");
    -[CLGeoMapTilesPreloaderService registerForClientManagerNotification](self, "registerForClientManagerNotification");
    -[CLGeoMapTilesPreloaderService registerForDataProtectionNotification](self, "registerForDataProtectionNotification");
    -[CLGeoMapTilesPreloaderService clearPersistentStore:](self, "clearPersistentStore:", 0);
    -[CLGeoMapTilesPreloaderService registerForDaemonStatusNotification](self, "registerForDaemonStatusNotification");
    -[CLGeoMapTilesPreloaderService registerForTrackRunEnablementNotifications](self, "registerForTrackRunEnablementNotifications");
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v4 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,beginService,featureNotEnabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,beginService,featureNotEnabled", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService beginService]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)endService
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  GEOMapDataSubscriptionManager *fGeoMapSubscriptionManager;
  GEOCoarseLocationProvider *fGEOCoarseLocationProvider;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  _WORD v16[8];
  uint8_t buf[1640];

  if (self->fSettings.fEnabled)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,endService", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,endService", v16, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    -[CLGeoMapTilesPreloaderService unregisterForWifiServiceNotification](self, "unregisterForWifiServiceNotification");
    -[CLGeoMapTilesPreloaderService unregisterForRoutineMonitor](self, "unregisterForRoutineMonitor");
    -[CLGeoMapTilesPreloaderService unregisterForDaemonStatusNotification](self, "unregisterForDaemonStatusNotification");
    -[CLGeoMapTilesPreloaderService unregisterForClientManagerNotification](self, "unregisterForClientManagerNotification");
    -[CLGeoMapTilesPreloaderService unregisterForMobileAssetNotification](self, "unregisterForMobileAssetNotification");
    -[CLGeoMapTilesPreloaderService unregisterForLocationNotification](self, "unregisterForLocationNotification");
    -[CLGeoMapTilesPreloaderService unregisterForMotionStateMediatorNotification](self, "unregisterForMotionStateMediatorNotification");
    -[CLGeoMapTilesPreloaderService unregisterForDataProtectionNotification](self, "unregisterForDataProtectionNotification");
    if (self->fGEOMapFeatureAccess)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v4 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLGCZ,destroy geocodec malloc zone,CLGeoMapTilesPreloaderService,endService", buf, 2u);
      }
      v5 = sub_1001BFF7C(115, 2);
      if ((_DWORD)v5)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v16[0] = 0;
        LODWORD(v15) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGCZ,destroy geocodec malloc zone,CLGeoMapTilesPreloaderService,endService", v16, v15);
        v12 = (uint8_t *)v11;
        v5 = sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      GEOResetGeoCodecsAllocator(v5);

      self->fGEOMapFeatureAccess = 0;
    }
    fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
    if (fGeoMapSubscriptionManager)

    -[CLGeoMapTilesPreloaderService unregisterForTrackRunEnablementNotifications](self, "unregisterForTrackRunEnablementNotifications");
    fGEOCoarseLocationProvider = self->fGEOCoarseLocationProvider;
    if (fGEOCoarseLocationProvider)
    {

      self->fGEOCoarseLocationProvider = 0;
    }
    -[CLGeoMapTilesPreloaderService unregisterXPCActivity:](self, "unregisterXPCActivity:", 0);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,endService,featureNotEnabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,endService,featureNotEnabled", v16, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)downloadTilesOnXPCFire
{
  NSObject *v3;
  _BOOL4 fDownloadRequestInProgress;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  int fXPCCurrentInterval;
  int v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  int v14;
  char *left;
  uint64_t **p_fLOICoarseCoordinates;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CLMapMatcherOperatingPolicy::MatcherLocationOfInterestType, CLCoarseLocationData>, void *>>> *p_pair1;
  int v18;
  BOOL v19;
  char **v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  _QWORD **v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v35;
  int v36;
  _BOOL4 v37;
  _BOOL4 v38;
  unsigned int v39;
  double v40;
  NSObject *v41;
  void **v42;
  void **v43;
  const char *v44;
  uint8_t *v45;
  NSObject *v46;
  void **v47;
  void **v48;
  const char *v49;
  NSObject *v50;
  void **v51;
  _QWORD *v52;
  void **v53;
  _QWORD *v54;
  const char *v55;
  NSObject *v56;
  void **v57;
  void **v58;
  const char *v59;
  NSObject *v60;
  void **v61;
  void **v62;
  const char *v63;
  unsigned int *v64;
  NSObject *v65;
  void **v66;
  void **v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  NSObject *v72;
  void **v73;
  int v74;
  _QWORD *v75;
  _QWORD **v76;
  BOOL v77;
  NSObject *v78;
  void **v79;
  char *v80;
  _QWORD *v81;
  _QWORD *v82;
  int v83;
  double v84;
  double v85;
  unsigned int *v86;
  void **v87;
  const char *v88;
  void **v89;
  _QWORD *v90;
  _QWORD *v91;
  char *v92;
  int v93;
  const char *v94;
  uint8_t *v95;
  int v96;
  NSObject *v97;
  int v98;
  _BOOL4 v99;
  uint64_t v100;
  NSObject *v101;
  int v102;
  const char *v103;
  const char *v104;
  uint8_t *v105;
  int v106;
  _BOOL4 v107;
  const char *v108;
  uint8_t *v109;
  const char *v110;
  uint8_t *v111;
  uint64_t v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  int v118;
  unsigned int v119;
  _OWORD v120[10];
  int v121;
  uint64_t v122[3];
  uint64_t v123[3];
  void *__p[2];
  char v125;
  _QWORD **v126;
  _QWORD *v127[2];
  __int128 v128;
  _OWORD v129[2];
  _OWORD v130[7];
  int v131;
  int64_t *p_fTotalNPLOISectionDownloads;
  pthread_mutex_t *v133;
  __int16 v134;
  int v135;
  _BYTE v136[10];
  _BYTE v137[6];
  _BYTE v138[10];
  __int16 v139;
  _QWORD *v140;
  __int16 v141;
  _QWORD *v142;
  __int16 v143;
  int v144;
  __int16 v145;
  unsigned int v146;
  __int16 v147;
  int v148;
  __int16 v149;
  unsigned int v150;
  __int16 v151;
  int v152;
  __int16 v153;
  double v154;
  uint8_t buf[4];
  _BYTE v156[10];
  _BYTE v157[6];
  _BYTE v158[10];
  __int16 v159;
  _QWORD *v160;
  __int16 v161;
  _QWORD *v162;
  __int16 v163;
  int v164;
  __int16 v165;
  unsigned int v166;
  __int16 v167;
  int v168;
  __int16 v169;
  unsigned int v170;
  __int16 v171;
  int v172;
  __int16 v173;
  double v174;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v134 = 256;
  -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
  if (!self->fPersistentStoreData.__ptr_.__value_)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v156 = fXPCCurrentInterval;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLGMTPS,persistentStoreData is null,interval,%{public}d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_26;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v10 = self->fXPCCurrentInterval;
    v135 = 67240192;
    *(_DWORD *)v136 = v10;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,persistentStoreData is null,interval,%{public}d", &v135, 8);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v11);
    goto LABEL_251;
  }
  if (!(_BYTE)v128)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v13 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      v14 = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v156 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CLGMTPS,roads and building precaching not supported in this region,interval,%{public}d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_26;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v102 = self->fXPCCurrentInterval;
    v135 = 67240192;
    *(_DWORD *)v136 = v102;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,roads and building precaching not supported in this region,interval,%{public}d", &v135, 8);
    v12 = (uint8_t *)v103;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v103);
LABEL_251:
    if (v12 != buf)
      free(v12);
LABEL_26:
    -[CLGeoMapTilesPreloaderService setNewCriteria:](self, "setNewCriteria:", 86400);
    goto LABEL_27;
  }
  if (self->fDownloadRequestInProgress)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      fDownloadRequestInProgress = self->fDownloadRequestInProgress;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v156 = fDownloadRequestInProgress;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "CLGMTPS,download request already in progress,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v5 = self->fDownloadRequestInProgress;
      v135 = 67240192;
      *(_DWORD *)v136 = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,download request already in progress,%{public}d", &v135, 8);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    goto LABEL_27;
  }
  if (BYTE3(v128))
  {
    if (*(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2)
    {
      left = (char *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        p_fLOICoarseCoordinates = (uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates;
        p_pair1 = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
        do
        {
          v18 = *((_DWORD *)left + 8);
          v19 = v18 < 4;
          if (v18 >= 4)
            v20 = (char **)left;
          else
            v20 = (char **)(left + 8);
          if (!v19)
            p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CLMapMatcherOperatingPolicy::MatcherLocationOfInterestType, CLCoarseLocationData>, void *>>> *)left;
          left = *v20;
        }
        while (*v20);
        if (p_pair1 != &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_
          && SLODWORD(p_pair1[4].__value_.__left_) <= 4
          && sub_1013BA304((double *)&p_pair1[5]))
        {
          v21 = vabdd_f64(*(double *)&p_pair1[10].__value_.__left_, CFAbsoluteTimeGetCurrent());
          if (v21 > (double)SHIDWORD(v128))
          {
            *(_DWORD *)buf = 4;
            sub_1013D0C84(p_fLOICoarseCoordinates, (int *)buf);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v22 = qword_1022A00D8;
            if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349312;
              *(double *)v156 = v21;
              *(_WORD *)&v156[8] = 1026;
              *(_DWORD *)v157 = HIDWORD(v128);
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CLGMTPS,tourist stale coarse location erased,age,%{public}.1lf,threshold,%{public}d", buf, 0x12u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v135 = 134349312;
              *(double *)v136 = v21;
              *(_WORD *)&v136[8] = 1026;
              *(_DWORD *)v137 = HIDWORD(v128);
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,tourist stale coarse location erased,age,%{public}.1lf,threshold,%{public}d", &v135, 18);
              v111 = (uint8_t *)v110;
              sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v110);
              if (v111 != buf)
                free(v111);
            }
            *(_DWORD *)buf = 6;
            if (sub_10017BFFC((uint64_t)p_fLOICoarseCoordinates, (int *)buf))
            {
              *(_DWORD *)buf = 6;
              sub_1013D0C84(p_fLOICoarseCoordinates, (int *)buf);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v23 = qword_1022A00D8;
              if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134349312;
                *(double *)v156 = v21;
                *(_WORD *)&v156[8] = 1026;
                *(_DWORD *)v157 = HIDWORD(v128);
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CLGMTPS,tourist stale signal env coarse location erased,age,%{public}.1lf,threshold,%{public}d", buf, 0x12u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1022A00D0 != -1)
                  dispatch_once(&qword_1022A00D0, &stru_1021B3298);
                v135 = 134349312;
                *(double *)v136 = v21;
                *(_WORD *)&v136[8] = 1026;
                *(_DWORD *)v137 = HIDWORD(v128);
                LODWORD(v112) = 18;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,tourist stale signal env coarse location erased,age,%{public}.1lf,threshold,%{public}d", &v135, v112);
                v25 = (uint8_t *)v24;
                sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v24);
                if (v25 != buf)
                  free(v25);
              }
            }
          }
        }
      }
    }
    else
    {
      sub_1013B9FFC((uint64_t)&self->fRoutineInfo);
    }
  }
  if (!sub_1013BA344((uint64_t)&self->fRoutineInfo))
  {
    -[CLGeoMapTilesPreloaderService setNewCriteria:](self, "setNewCriteria:", 1800);
    goto LABEL_27;
  }
  if (!self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v101 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "CLGMTPS,no coarse location data available", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LOWORD(v135) = 0;
      LODWORD(v112) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,no coarse location data available", &v135, v112);
      v105 = (uint8_t *)v104;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v104);
      if (v105 != buf)
        free(v105);
    }
    -[CLGeoMapTilesPreloaderService setNewCriteria:](self, "setNewCriteria:", 28800);
    goto LABEL_27;
  }
  sub_1013D0F7C((uint64_t)&v126, (uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates);
  sub_1013BA5F4((uint64_t **)self->fPersistentStoreData.__ptr_.__value_, (uint64_t)&v126);
  v26 = 0;
  v119 = 0;
  v118 = 1;
  do
  {
    v27 = v118;
    if (v26 < 4)
      v27 = 3u >> (v26 & 0xF);
    v118 = v27;
    v28 = v119;
    if (v26 < 4)
      v28 = v26;
    v119 = v28;
    v29 = v126;
    if (v126 != v127)
    {
      v117 = v28 & 1;
      v114 = v27 & 1;
      while (1)
      {
        v30 = *((unsigned int *)v29 + 8);
        v31 = "Unknown";
        if (v30 <= 6)
          v31 = off_1021B33C0[(int)v30];
        sub_1015A2E04(__p, v31);
        v32 = sub_1013BA9C8((uint64_t)self->fPersistentStoreData.__ptr_.__value_, *((_DWORD *)v29 + 8), (double *)v29 + 5, 1);
        if (!v32)
          break;
        v33 = sub_1013BA304((double *)v29 + 5);
        if (*((double *)v29 + 10) <= 0.0 || !v33)
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v50 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
          {
            v51 = __p;
            if (v125 < 0)
              v51 = (void **)__p[0];
            v52 = v29[10];
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)v156 = v51;
            *(_WORD *)&v156[8] = 1026;
            *(_DWORD *)v157 = v26;
            *(_WORD *)&v157[4] = 2050;
            *(_QWORD *)v158 = v52;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "CLGMTPS,coarse coordinate for type,%{public}s,is invalid,requesting new,cycle,%{public}d,loiTime,%{public}.1lf", buf, 0x1Cu);
          }
          if (!sub_1001BFF7C(115, 0))
            goto LABEL_178;
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v53 = __p;
          if (v125 < 0)
            v53 = (void **)__p[0];
          v54 = v29[10];
          v135 = 136446722;
          *(_QWORD *)v136 = v53;
          *(_WORD *)&v136[8] = 1026;
          *(_DWORD *)v137 = v26;
          *(_WORD *)&v137[4] = 2050;
          *(_QWORD *)v138 = v54;
          LODWORD(v112) = 28;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,coarse coordinate for type,%{public}s,is invalid,requesting new,cycle,%{public}d,loiTime,%{public}.1lf", &v135, v112);
          v45 = (uint8_t *)v55;
          sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v55);
          goto LABEL_216;
        }
        v35 = 64;
        if ((v119 & 1) != 0)
          v35 = 68;
        v36 = *(_DWORD *)((char *)&v129[-1] + 12 * (int)v30 + v35);
        if (v36 <= 0)
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v56 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
          {
            v57 = __p;
            if (v125 < 0)
              v57 = (void **)__p[0];
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)v156 = v57;
            *(_WORD *)&v156[8] = 1026;
            *(_DWORD *)v157 = v117;
            *(_WORD *)&v157[4] = 1026;
            *(_DWORD *)v158 = v26;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "CLGMTPS,invalid radius for type,%{public}s,building,%{public}d,no download for cycle,%{public}d", buf, 0x18u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v58 = __p;
            if (v125 < 0)
              v58 = (void **)__p[0];
            v135 = 136446722;
            *(_QWORD *)v136 = v58;
            *(_WORD *)&v136[8] = 1026;
            *(_DWORD *)v137 = v117;
            *(_WORD *)&v137[4] = 1026;
            *(_DWORD *)v138 = v26;
            LODWORD(v112) = 24;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,invalid radius for type,%{public}s,building,%{public}d,no download for cycle,%{public}d", &v135, v112);
            v45 = (uint8_t *)v59;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v59);
            goto LABEL_216;
          }
LABEL_178:
          v74 = 42;
          goto LABEL_179;
        }
        v37 = sub_1013BB2D8((uint64_t)&self->fRoutineInfo, (double *)v29 + 5);
        v38 = 0;
        if ((v30 & 0xFFFFFFFD) == 4 && *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2)
          v38 = BYTE3(v128) != 0;
        v39 = v30 - 5;
        if ((_DWORD)v30 == 3)
          v38 = 1;
        if (!v37 && !v38)
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v60 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
          {
            v61 = __p;
            if (v125 < 0)
              v61 = (void **)__p[0];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)v156 = v61;
            *(_WORD *)&v156[8] = 1026;
            *(_DWORD *)v157 = v30;
            *(_WORD *)&v157[4] = 1026;
            *(_DWORD *)v158 = v26;
            *(_WORD *)&v158[4] = 1026;
            *(_DWORD *)&v158[6] = BYTE3(v128);
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "CLGMTPS,caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v62 = __p;
            if (v125 < 0)
              v62 = (void **)__p[0];
            v135 = 136446978;
            *(_QWORD *)v136 = v62;
            *(_WORD *)&v136[8] = 1026;
            *(_DWORD *)v137 = v30;
            *(_WORD *)&v137[4] = 1026;
            *(_DWORD *)v138 = v26;
            *(_WORD *)&v138[4] = 1026;
            *(_DWORD *)&v138[6] = BYTE3(v128);
            LODWORD(v112) = 30;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", &v135, v112);
            v45 = (uint8_t *)v63;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v63);
            goto LABEL_216;
          }
          goto LABEL_178;
        }
        v40 = dbl_101CA13C0[(v30 - 5) < 2];
        if (self->fIsXPCSettingAggressive)
        {
          if ((_DWORD)v30 != 6)
          {
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v65 = qword_1022A00D8;
            if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
            {
              v66 = __p;
              if (v125 < 0)
                v66 = (void **)__p[0];
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)v156 = v66;
              *(_WORD *)&v156[8] = 1026;
              *(_DWORD *)v157 = v30;
              *(_WORD *)&v157[4] = 1026;
              *(_DWORD *)v158 = v26;
              *(_WORD *)&v158[4] = 1026;
              *(_DWORD *)&v158[6] = BYTE3(v128);
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v67 = __p;
              if (v125 < 0)
                v67 = (void **)__p[0];
              v135 = 136446978;
              *(_QWORD *)v136 = v67;
              *(_WORD *)&v136[8] = 1026;
              *(_DWORD *)v137 = v30;
              *(_WORD *)&v137[4] = 1026;
              *(_DWORD *)v138 = v26;
              *(_WORD *)&v138[4] = 1026;
              *(_DWORD *)&v138[6] = BYTE3(v128);
              LODWORD(v112) = 30;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,aggressive caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", &v135, v112);
              v45 = (uint8_t *)v68;
              sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v68);
              goto LABEL_216;
            }
            goto LABEL_178;
          }
          if (-[CLGeoMapTilesPreloaderService isAggressiveSettingDataDownloadLimitCrossed:building:](self, "isAggressiveSettingDataDownloadLimitCrossed:building:", &v128, v119 & 1))
          {
            -[CLGeoMapTilesPreloaderService storeDataInPersistentStore](self, "storeDataInPersistentStore");
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v41 = qword_1022A00D8;
            if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
            {
              v42 = __p;
              if (v125 < 0)
                v42 = (void **)__p[0];
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)v156 = v42;
              *(_WORD *)&v156[8] = 1026;
              *(_DWORD *)v157 = 6;
              *(_WORD *)&v157[4] = 1026;
              *(_DWORD *)v158 = v26;
              *(_WORD *)&v158[4] = 1026;
              *(_DWORD *)&v158[6] = BYTE3(v128);
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed as data download limit crossed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v43 = __p;
              if (v125 < 0)
                v43 = (void **)__p[0];
              v135 = 136446978;
              *(_QWORD *)v136 = v43;
              *(_WORD *)&v136[8] = 1026;
              *(_DWORD *)v137 = 6;
              *(_WORD *)&v137[4] = 1026;
              *(_DWORD *)v138 = v26;
              *(_WORD *)&v138[4] = 1026;
              *(_DWORD *)&v138[6] = BYTE3(v128);
              LODWORD(v112) = 30;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,aggressive caching not allowed as data download limit crossed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", &v135, v112);
              v45 = (uint8_t *)v44;
              sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v44);
              goto LABEL_216;
            }
            goto LABEL_178;
          }
          if (!self->fIsXPCSettingAggressive)
          {
LABEL_171:
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v72 = qword_1022A00D8;
            if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
            {
              v73 = __p;
              if (v125 < 0)
                v73 = (void **)__p[0];
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)v156 = v73;
              *(_WORD *)&v156[8] = 1026;
              *(_DWORD *)v157 = v30;
              *(_WORD *)&v157[4] = 1026;
              *(_DWORD *)v158 = v26;
              *(_WORD *)&v158[4] = 1026;
              *(_DWORD *)&v158[6] = BYTE3(v128);
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed in non-aggressive settings,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v87 = __p;
              if (v125 < 0)
                v87 = (void **)__p[0];
              v135 = 136446978;
              *(_QWORD *)v136 = v87;
              *(_WORD *)&v136[8] = 1026;
              *(_DWORD *)v137 = v30;
              *(_WORD *)&v137[4] = 1026;
              *(_DWORD *)v138 = v26;
              *(_WORD *)&v138[4] = 1026;
              *(_DWORD *)&v138[6] = BYTE3(v128);
              LODWORD(v112) = 30;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,aggressive caching not allowed in non-aggressive settings,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", &v135, v112);
              v45 = (uint8_t *)v88;
              sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v88);
              goto LABEL_216;
            }
            goto LABEL_178;
          }
          v115 = (int)((double)v36 / v40 + 0.5) * (int)((double)v36 / v40 + 0.5);
          v64 = (unsigned int *)v129 + 1;
        }
        else
        {
          if ((_DWORD)v30 == 6)
            goto LABEL_171;
          v115 = (int)((double)v36 / v40 + 0.5) * (int)((double)v36 / v40 + 0.5);
          v64 = (unsigned int *)v129 + 1;
          if ((v30 - 3) >= 2)
            v64 = (unsigned int *)v129;
        }
        v113 = *v64;
        v69 = 6;
        if ((v119 & 1) != 0)
          v69 = 9;
        v70 = (uint64_t)&v32[v69];
        if ((v118 & 1) != 0)
        {
          sub_1013D11D0(v123, v70);
          v71 = v123;
          v116 = -[CLGeoMapTilesPreloaderService getSectionNotDownloadedYet:maxSections:](self, "getSectionNotDownloadedYet:maxSections:", v123, v115);
        }
        else
        {
          sub_1013D11D0(v122, v70);
          v71 = v122;
          v116 = -[CLGeoMapTilesPreloaderService getSectionToBeRefreshed:maxSections:refreshPeriod:](self, "getSectionToBeRefreshed:maxSections:refreshPeriod:", v122, v115, v113);
        }
        sub_100008848((uint64_t)v71, (_QWORD *)v71[1]);
        if (v116 == -1)
        {
          v74 = 0;
        }
        else
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v78 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
          {
            v79 = __p;
            if (v125 < 0)
              v79 = (void **)__p[0];
            v80 = (char *)v130 + 12;
            if (v39 >= 2)
            {
              if ((_DWORD)v30 == 3)
              {
                v80 = (char *)v130 + 8;
              }
              else
              {
                v80 = (char *)v130;
                if ((_DWORD)v30 == 4)
                  v80 = (char *)v130 + 4;
              }
            }
            v81 = v29[5];
            v82 = v29[6];
            v83 = *(_DWORD *)v80;
            *(_DWORD *)buf = 136449027;
            *(_QWORD *)v156 = v79;
            *(_WORD *)&v156[8] = 1026;
            *(_DWORD *)v157 = v116;
            *(_WORD *)&v157[4] = 1026;
            *(_DWORD *)v158 = v115;
            *(_WORD *)&v158[4] = 1026;
            *(_DWORD *)&v158[6] = v117;
            v159 = 2049;
            v160 = v81;
            v161 = 2049;
            v162 = v82;
            v163 = 1026;
            v164 = v36;
            v165 = 1026;
            v166 = v26;
            v167 = 1026;
            v168 = v114;
            v169 = 1026;
            v170 = v113;
            v171 = 1026;
            v172 = v83;
            v173 = 2050;
            v174 = v40;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting tiles,for type,%{public}s,section,%{public}d/%{public}d,building,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}d,current cycle,%{public}d,download,%{public}d,tileRefreshPeriod,%{public}d,sections,%{public}d,sectionRadius,%{public}.1lf", buf, 0x5Au);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            if (v125 >= 0)
              v89 = __p;
            else
              v89 = (void **)__p[0];
            v91 = v29[5];
            v90 = v29[6];
            v92 = (char *)v130 + 12;
            if (v39 >= 2)
            {
              if ((_DWORD)v30 == 3)
              {
                v92 = (char *)v130 + 8;
              }
              else
              {
                v92 = (char *)v130;
                if ((_DWORD)v30 == 4)
                  v92 = (char *)v130 + 4;
              }
            }
            v93 = *(_DWORD *)v92;
            v135 = 136449027;
            *(_QWORD *)v136 = v89;
            *(_WORD *)&v136[8] = 1026;
            *(_DWORD *)v137 = v116;
            *(_WORD *)&v137[4] = 1026;
            *(_DWORD *)v138 = v115;
            *(_WORD *)&v138[4] = 1026;
            *(_DWORD *)&v138[6] = v117;
            v139 = 2049;
            v140 = v91;
            v141 = 2049;
            v142 = v90;
            v143 = 1026;
            v144 = v36;
            v145 = 1026;
            v146 = v26;
            v147 = 1026;
            v148 = v114;
            v149 = 1026;
            v150 = v113;
            v151 = 1026;
            v152 = v93;
            v153 = 2050;
            v154 = v40;
            LODWORD(v112) = 90;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,requesting tiles,for type,%{public}s,section,%{public}d/%{public}d,building,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}d,current cycle,%{public}d,download,%{public}d,tileRefreshPeriod,%{public}d,sections,%{public}d,sectionRadius,%{public}.1lf", &v135, v112);
            v95 = (uint8_t *)v94;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v94);
            if (v95 != buf)
              free(v95);
          }
          v84 = *((double *)v29 + 5);
          v85 = *((double *)v29 + 6);
          v120[0] = v128;
          v120[1] = v129[0];
          v120[8] = v130[5];
          v120[9] = v130[6];
          v121 = v131;
          v120[4] = v130[1];
          v120[5] = v130[2];
          v120[6] = v130[3];
          v120[7] = v130[4];
          v86 = (unsigned int *)v130 + 3;
          v120[2] = v129[1];
          v120[3] = v130[0];
          if (v39 >= 2)
          {
            if ((_DWORD)v30 == 3)
            {
              v86 = (unsigned int *)v130 + 2;
            }
            else
            {
              v86 = (unsigned int *)v130;
              if ((_DWORD)v30 == 4)
                v86 = (unsigned int *)v130 + 1;
            }
          }
          -[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:](self, "preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:", v120, v30, v119 & 1, v116, *v86, v32, v84, v85);
          v74 = 1;
        }
LABEL_179:
        if (v125 < 0)
          operator delete(__p[0]);
        if (v74 != 42 && v74)
          goto LABEL_240;
        v75 = v29[1];
        if (v75)
        {
          do
          {
            v76 = (_QWORD **)v75;
            v75 = (_QWORD *)*v75;
          }
          while (v75);
        }
        else
        {
          do
          {
            v76 = (_QWORD **)v29[2];
            v77 = *v76 == v29;
            v29 = v76;
          }
          while (!v77);
        }
        v29 = v76;
        if (v76 == v127)
          goto LABEL_230;
      }
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v46 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
      {
        v47 = __p;
        if (v125 < 0)
          v47 = (void **)__p[0];
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v156 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "CLGMTPS,Unexpected,downloadTilesOnXPCFire,loiSectionData does not exist for type,%{public}s", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_178;
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v48 = __p;
      if (v125 < 0)
        v48 = (void **)__p[0];
      v135 = 136446210;
      *(_QWORD *)v136 = v48;
      LODWORD(v112) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,Unexpected,downloadTilesOnXPCFire,loiSectionData does not exist for type,%{public}s", &v135, v112);
      v45 = (uint8_t *)v49;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v49);
LABEL_216:
      if (v45 != buf)
        free(v45);
      goto LABEL_178;
    }
LABEL_230:
    ++v26;
  }
  while (v26 != 4);
  v96 = sub_1013BB4CC(self->fPersistentStoreData.__ptr_.__value_, (uint64_t)&v128, *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2, self->fIsXPCSettingAggressive);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v97 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
  {
    v98 = self->fXPCCurrentInterval;
    v99 = *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2;
    *(_DWORD *)buf = 67240705;
    *(_DWORD *)v156 = v98;
    *(_WORD *)&v156[4] = 1026;
    *(_DWORD *)&v156[6] = v96;
    *(_WORD *)v157 = 1025;
    *(_DWORD *)&v157[2] = v99;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "CLGMTPS,nothing to download or refresh,currentInterval,%{public}d,nextXPCTriggerDelay,%{public}d,tourist,%{private}d", buf, 0x14u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v106 = self->fXPCCurrentInterval;
    v107 = *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2;
    v135 = 67240705;
    *(_DWORD *)v136 = v106;
    *(_WORD *)&v136[4] = 1026;
    *(_DWORD *)&v136[6] = v96;
    *(_WORD *)v137 = 1025;
    *(_DWORD *)&v137[2] = v107;
    LODWORD(v112) = 20;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,nothing to download or refresh,currentInterval,%{public}d,nextXPCTriggerDelay,%{public}d,tourist,%{private}d", &v135, v112);
    v109 = (uint8_t *)v108;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v108);
    if (v109 != buf)
      free(v109);
  }
  if (v96 >= 86400)
    v100 = 86400;
  else
    v100 = v96;
  -[CLGeoMapTilesPreloaderService setNewCriteria:](self, "setNewCriteria:", v100);
LABEL_240:
  sub_100008848((uint64_t)&v126, v127[0]);
LABEL_27:
  if (HIBYTE(v134))
  {
    if ((_BYTE)v134)
      pthread_mutex_unlock(v133);
    else
      (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
  }
}

- (void)fetchLOIForType:(int64_t)a3 isSecondTry:(BOOL)a4
{
  int64_t *p_fTotalNPLOISectionDownloads;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  CLGeoMapTilesPreloaderService *v18;
  int64_t v19;
  uint64_t v20;
  int64_t *v21;
  __int16 v22;
  _DWORD v23[4];
  uint8_t buf[4];
  int v25;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v21 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v22 = 256;
  if (a3 != -1)
  {
    if (-[CLGeoMapTilesPreloaderService setCoarseCoordinatesFromDefaultsWriteEntry](self, "setCoarseCoordinatesFromDefaultsWriteEntry"))
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v8 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,coarse coordinate set from defaults write entry", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        LOWORD(v23[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,coarse coordinate set from defaults write entry", v23, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
    }
    else
    {
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_1013BBD9C;
      v17 = &unk_1021B3108;
      v18 = self;
      v19 = a3;
      LOBYTE(v20) = a4;
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v11 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67240192;
        v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting locations of type,%{public}d,from routinemanager", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v23[0] = 67240192;
        v23[1] = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,requesting locations of type,%{public}d,from routinemanager", v23, 8, v14, v15, v16, v17, v18, v19, v20);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
      -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](self->fRoutineMonitor, "fetchLocationsOfInterestOfType:withReply:", a3, &v14);
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)addFakeNPLOIDataForTesting:(CLMapMatcherGeoTilesPrecachingConfig *)a3
{
  NSObject *v5;
  __int128 v6;
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
  __int128 v19;
  __int128 v20;
  const char *v21;
  uint8_t *v22;
  _OWORD v23[10];
  int v24;
  _OWORD v25[10];
  int v26;
  _OWORD v27[10];
  int var26;
  _WORD v29[8];
  uint8_t buf[4];

  if (self->fSettings.fAddFakeNPLOIData)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v5 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGMTPS,NPLOI,adding fake NPLOIs", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v29[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,NPLOI,adding fake NPLOIs", v29, 2);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addFakeNPLOIDataForTesting:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    *(_DWORD *)buf = 3;
    sub_1013D0C84((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    v6 = *(_OWORD *)&a3->var22[6].var2;
    v27[8] = *(_OWORD *)&a3->var22[5].var1;
    v27[9] = v6;
    var26 = a3->var26;
    v7 = *(_OWORD *)&a3->var22[1].var1;
    v27[4] = *(_OWORD *)&a3->var22[0].var0;
    v27[5] = v7;
    v8 = *(_OWORD *)&a3->var22[4].var0;
    v27[6] = *(_OWORD *)&a3->var22[2].var2;
    v27[7] = v8;
    v9 = *(_OWORD *)&a3->var10;
    v27[0] = *(_OWORD *)&a3->var0;
    v27[1] = v9;
    v10 = *(_OWORD *)&a3->var18;
    v27[2] = *(_OWORD *)&a3->var14;
    v27[3] = v10;
    -[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:](self, "computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:", 3, 1, v27, 0, 37.2949791, -121.807884, 20.0, 20.0, 20.0);
    v11 = *(_OWORD *)&a3->var22[6].var2;
    v25[8] = *(_OWORD *)&a3->var22[5].var1;
    v25[9] = v11;
    v26 = a3->var26;
    v12 = *(_OWORD *)&a3->var22[1].var1;
    v25[4] = *(_OWORD *)&a3->var22[0].var0;
    v25[5] = v12;
    v13 = *(_OWORD *)&a3->var22[4].var0;
    v25[6] = *(_OWORD *)&a3->var22[2].var2;
    v25[7] = v13;
    v14 = *(_OWORD *)&a3->var10;
    v25[0] = *(_OWORD *)&a3->var0;
    v25[1] = v14;
    v15 = *(_OWORD *)&a3->var18;
    v25[2] = *(_OWORD *)&a3->var14;
    v25[3] = v15;
    -[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:](self, "computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:", 3, 1, v25, 1, 37.3402175, -122.005546, 20.0, 20.0, 20.0);
    v16 = *(_OWORD *)&a3->var22[6].var2;
    v23[8] = *(_OWORD *)&a3->var22[5].var1;
    v23[9] = v16;
    v24 = a3->var26;
    v17 = *(_OWORD *)&a3->var22[1].var1;
    v23[4] = *(_OWORD *)&a3->var22[0].var0;
    v23[5] = v17;
    v18 = *(_OWORD *)&a3->var22[4].var0;
    v23[6] = *(_OWORD *)&a3->var22[2].var2;
    v23[7] = v18;
    v19 = *(_OWORD *)&a3->var10;
    v23[0] = *(_OWORD *)&a3->var0;
    v23[1] = v19;
    v20 = *(_OWORD *)&a3->var18;
    v23[2] = *(_OWORD *)&a3->var14;
    v23[3] = v20;
    -[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:](self, "computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:", 3, 1, v23, 2, 37.2350657, -121.782939, 20.0, 20.0, 20.0);
  }
}

- (void)computeCoarseLocationAndStore:(id)a3
{
  int64_t *p_fTotalNPLOISectionDownloads;
  id v6;
  uint64_t v7;
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
  id v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  _OWORD v23[10];
  int v24;
  int64_t *v25;
  __int16 v26;
  _DWORD v27[4];
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v25 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v26 = 256;
  if (a3)
  {
    v6 = objc_msgSend(a3, "type");
    if ((unint64_t)v6 >= 3)
      v7 = 7;
    else
      v7 = v6;
    -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
    objc_msgSend(objc_msgSend(a3, "location"), "latitude");
    v9 = v8;
    objc_msgSend(objc_msgSend(a3, "location"), "longitude");
    v11 = v10;
    objc_msgSend(objc_msgSend(a3, "location"), "altitude");
    v13 = v12;
    objc_msgSend(objc_msgSend(a3, "location"), "horizontalUncertainty");
    v15 = v14;
    objc_msgSend(objc_msgSend(a3, "location"), "verticalUncertainty");
    v17 = v16;
    v18 = objc_msgSend(objc_msgSend(a3, "location"), "referenceFrame");
    v23[8] = v36;
    v23[9] = v37;
    v24 = v38;
    v23[4] = v32;
    v23[5] = v33;
    v23[6] = v34;
    v23[7] = v35;
    v23[0] = *(_OWORD *)buf;
    v23[1] = v29;
    v23[2] = v30;
    v23[3] = v31;
    -[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:](self, "computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:", v7, v18, v23, 0xFFFFFFFFLL, v9, v11, v13, v15, v17);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v19 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = objc_msgSend(0, "type");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "CLGMTPS,unexpected,loi is nil,type,%{public}d,requesting next", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v20 = qword_1022A00D8;
      v27[0] = 67240192;
      v27[1] = objc_msgSend(0, "type");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 16, "CLGMTPS,unexpected,loi is nil,type,%{public}d,requesting next", v27, 8);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStore:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)removeTrackRunSubscriptionForType:(int)a3 nploiIndex:(int)a4
{
  char *v5;
  std::string *v7;
  std::string::size_type size;
  std::string *v9;
  __int128 v10;
  NSObject *v11;
  std::string *v12;
  int v13;
  std::string::size_type v14;
  NSStringEncoding v15;
  std::string *v16;
  NSString *v17;
  GEOMapDataSubscriptionManager *fGeoMapSubscriptionManager;
  id v19;
  std::string *v20;
  const char *v21;
  std::string *v22;
  _QWORD v23[4];
  __int128 __p;
  std::string::size_type v25;
  std::string v26;
  void *v27[2];
  std::string::size_type v28;
  int v29;
  std::string *v30;
  std::string v31;

  v5 = "Home";
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      v5 = "Work";
      goto LABEL_9;
    case 2:
      v5 = "School";
      goto LABEL_9;
    case 3:
      sub_1015A2E04(&v31, "NPLOI");
      std::to_string(&v26, a4);
      goto LABEL_10;
    case 4:
      v5 = "Tourist";
      goto LABEL_9;
    case 5:
      v5 = "SignalEnvironment";
      goto LABEL_9;
    case 6:
      v5 = "TouristSignalEnvironment";
      goto LABEL_9;
    default:
      v5 = "Unknown";
LABEL_9:
      sub_1015A2E04(&v31, v5);
      sub_1015A2E04(&v26, "");
LABEL_10:
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v7 = &v26;
      else
        v7 = (std::string *)v26.__r_.__value_.__r.__words[0];
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
      else
        size = v26.__r_.__value_.__l.__size_;
      v9 = std::string::append(&v31, (const std::string::value_type *)v7, size);
      v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      v28 = v9->__r_.__value_.__r.__words[2];
      *(_OWORD *)v27 = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      std::operator+<char>(&v26, "com.apple.corelocation.precaching.", v27);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v11 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = &v26;
        if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v12 = (std::string *)v26.__r_.__value_.__r.__words[0];
        LODWORD(v31.__r_.__value_.__l.__data_) = 136446210;
        *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,Removing subscription for,%{public}s", (uint8_t *)&v31, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(&v31, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v20 = &v26;
        if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
        v29 = 136446210;
        v30 = v20;
        _os_log_send_and_compose_impl(2, 0, &v31, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,TrackRun,Removing subscription for,%{public}s", &v29, 12);
        v22 = (std::string *)v21;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService removeTrackRunSubscriptionForType:nploiIndex:]", "%s\n", v21);
        if (v22 != &v31)
          free(v22);
      }
      v13 = SHIBYTE(v26.__r_.__value_.__r.__words[2]);
      v14 = v26.__r_.__value_.__r.__words[0];
      v15 = +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding");
      if (v13 >= 0)
        v16 = &v26;
      else
        v16 = (std::string *)v14;
      v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, v15);
      fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
      v19 = objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"), "queue");
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3321888768;
      v23[2] = sub_1013BE0C0;
      v23[3] = &unk_1021B3178;
      if (SHIBYTE(v28) < 0)
      {
        sub_100115CE4(&__p, v27[0], (unint64_t)v27[1]);
      }
      else
      {
        __p = *(_OWORD *)v27;
        v25 = v28;
      }
      -[GEOMapDataSubscriptionManager removeSubscriptionWithIdentifier:callbackQueue:completionHandler:](fGeoMapSubscriptionManager, "removeSubscriptionWithIdentifier:callbackQueue:completionHandler:", v17, v19, v23);
      if (SHIBYTE(v25) < 0)
        operator delete((void *)__p);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      if (SHIBYTE(v28) < 0)
        operator delete(v27[0]);
      return;
  }
}

- (void)computeCoarseLocationAndStoreForType:(int)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 referenceFrame:(int)a9 config:(CLMapMatcherGeoTilesPrecachingConfig *)a10 nploiIndex:(int)a11
{
  id v21;
  uint64_t v22;
  HKHealthStore *fHealthStore;
  NSObject *v24;
  GEOCoarseLocationProvider *fGEOCoarseLocationProvider;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int var26;
  __int128 v32;
  NSObject *v33;
  const char *v34;
  uint8_t *v35;
  const char *v36;
  uint8_t *v37;
  _QWORD v38[7];
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint8_t buf[4];
  int v55;

  if (a10->var22[a3].var0 <= 0 && a10->var22[a3].var1 <= 0 && a10->var22[a3].var2 <= 0)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v33 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      v55 = a3;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "CLGMTPS,no valid radius for type,%{public}d,coarse location not computed", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v52 = 67240192;
      v53 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,no valid radius for type,%{public}d,coarse location not computed", &v52, 8);
      v35 = (uint8_t *)v34;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:]", "%s\n", v34);
      if (v35 != buf)
        free(v35);
    }
  }
  else
  {
    v21 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", a4, a5);
    objc_msgSend(v21, "setTimestamp:", CFAbsoluteTimeGetCurrent());
    objc_msgSend(v21, "setAltitude:", (int)a6);
    objc_msgSend(v21, "setHorizontalAccuracy:", a7);
    objc_msgSend(v21, "setVerticalAccuracy:", a8);
    objc_msgSend(v21, "setSpeed:", 0.0);
    objc_msgSend(v21, "setCourse:", 0.0);
    if (a9 == 1)
      v22 = 1;
    else
      v22 = 2 * (a9 == 2);
    objc_msgSend(v21, "setReferenceFrame:", v22);
    fHealthStore = self->fHealthStore;
    if (fHealthStore)
      sub_100D823D8((uint64_t)fHealthStore);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v24 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      v55 = a3;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CLGMTPS,getting coarse location for type,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v52 = 67240192;
      v53 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,getting coarse location for type,%{public}d", &v52, 8);
      v37 = (uint8_t *)v36;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:]", "%s\n", v36);
      if (v37 != buf)
        free(v37);
    }
    fGEOCoarseLocationProvider = self->fGEOCoarseLocationProvider;
    v26 = objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"), "queue");
    v38[1] = 3221225472;
    *(double *)&v38[5] = a4;
    *(double *)&v38[6] = a5;
    v27 = *(_OWORD *)&a10->var22[2].var2;
    v47 = *(_OWORD *)&a10->var22[4].var0;
    v28 = *(_OWORD *)&a10->var22[6].var2;
    v48 = *(_OWORD *)&a10->var22[5].var1;
    v49 = v28;
    v29 = *(_OWORD *)&a10->var14;
    v43 = *(_OWORD *)&a10->var18;
    v30 = *(_OWORD *)&a10->var22[1].var1;
    v44 = *(_OWORD *)&a10->var22[0].var0;
    v38[0] = _NSConcreteStackBlock;
    v38[2] = sub_1013BE8BC;
    v38[3] = &unk_1021B31B0;
    v39 = a3;
    v38[4] = self;
    var26 = a10->var26;
    v45 = v30;
    v46 = v27;
    v32 = *(_OWORD *)&a10->var10;
    v40 = *(_OWORD *)&a10->var0;
    v41 = v32;
    v42 = v29;
    v50 = var26;
    v51 = a11;
    -[GEOCoarseLocationProvider fetchCoarseEquivalentForLocation:callbackQueue:callback:](fGEOCoarseLocationProvider, "fetchCoarseEquivalentForLocation:callbackQueue:callback:", v21, v26, v38);

  }
}

- (void)addGeoMapDataSubscriptionForType:(int)a3 latitude:(double)a4 longitude:(double)a5 config:(CLMapMatcherGeoTilesPrecachingConfig *)a6 nploiIndex:(int)a7
{
  char *v12;
  std::string *v14;
  std::string::size_type size;
  std::string *v16;
  __int128 v17;
  int var2;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  NSDate *v25;
  NSDate *v26;
  NSObject *v27;
  void **v28;
  int v29;
  void **v30;
  NSStringEncoding v31;
  void **v32;
  NSString *v33;
  GEOMapDataSubscriptionManager *fGeoMapSubscriptionManager;
  id v35;
  NSObject *v36;
  void **v37;
  void **v38;
  const char *v39;
  std::string *v40;
  NSObject *v41;
  const char *v42;
  void **v43;
  const char *v44;
  std::string *v45;
  _QWORD v46[4];
  __int128 __p;
  uint64_t v48;
  void *v49[2];
  char v50;
  void *v51[2];
  int64_t v52;
  std::string v53;
  double v54;
  __int16 v55;
  double v56;
  std::string v57;
  double v58;
  __int16 v59;
  double v60;

  v12 = "Home";
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      v12 = "Work";
      goto LABEL_9;
    case 2:
      v12 = "School";
      goto LABEL_9;
    case 3:
      sub_1015A2E04(&v57, "NPLOI");
      std::to_string(&v53, a7);
      goto LABEL_10;
    case 4:
      v12 = "Tourist";
      goto LABEL_9;
    case 5:
      v12 = "SignalEnvironment";
      goto LABEL_9;
    case 6:
      v12 = "TouristSignalEnvironment";
      goto LABEL_9;
    default:
      v12 = "Unknown";
LABEL_9:
      sub_1015A2E04(&v57, v12);
      sub_1015A2E04(&v53, "");
LABEL_10:
      if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v14 = &v53;
      else
        v14 = (std::string *)v53.__r_.__value_.__r.__words[0];
      if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v53.__r_.__value_.__r.__words[2]);
      else
        size = v53.__r_.__value_.__l.__size_;
      v16 = std::string::append(&v57, (const std::string::value_type *)v14, size);
      v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      v52 = v16->__r_.__value_.__r.__words[2];
      *(_OWORD *)v51 = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v53.__r_.__value_.__l.__data_);
      if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v57.__r_.__value_.__l.__data_);
      var2 = a6->var22[a3].var2;
      v19 = (double)var2;
      if (var2 <= 0)
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v36 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v51;
          if (v52 < 0)
            v37 = (void **)v51[0];
          LODWORD(v57.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v57.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
          WORD2(v57.__r_.__value_.__r.__words[1]) = 2048;
          *(double *)((char *)&v57.__r_.__value_.__r.__words[1] + 6) = v19;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,loiCacheRadiusMeters non-positive. Not adding subscription for,%{public}s,radius,%.lf", (uint8_t *)&v57, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&v57, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v38 = v51;
          if (v52 < 0)
            v38 = (void **)v51[0];
          LODWORD(v53.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v53.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v53.__r_.__value_.__r.__words[1]) = 2048;
          *(double *)((char *)&v53.__r_.__value_.__r.__words[1] + 6) = v19;
          _os_log_send_and_compose_impl(2, 0, &v57, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,TrackRun,loiCacheRadiusMeters non-positive. Not adding subscription for,%{public}s,radius,%.lf", &v53, 22);
          v40 = (std::string *)v39;
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", v39);
          goto LABEL_54;
        }
      }
      else
      {
        v20 = GEOCoordinateRegionMakeWithDistance(a4, a5, v19 + v19, v19 + v19);
        v24 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithCoordinateRegion:", v20, v21, v22, v23);
        v25 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1209600.0);
        if (self->fGeoMapSubscriptionManager)
        {
          v26 = v25;
          std::operator+<char>(v49, "com.apple.corelocation.precaching.", v51);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v27 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
          {
            v28 = v49;
            if (v50 < 0)
              v28 = (void **)v49[0];
            LODWORD(v57.__r_.__value_.__l.__data_) = 136446979;
            *(std::string::size_type *)((char *)v57.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
            WORD2(v57.__r_.__value_.__r.__words[1]) = 2049;
            *(double *)((char *)&v57.__r_.__value_.__r.__words[1] + 6) = a4;
            HIWORD(v57.__r_.__value_.__r.__words[2]) = 2049;
            v58 = a5;
            v59 = 2050;
            v60 = v19;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,Adding subscription for,%{public}s,LL,%{private}.7lf,%{private}.7lf,radius_m,%{public}.2lf", (uint8_t *)&v57, 0x2Au);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(&v57, 0x65CuLL);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v43 = v49;
            if (v50 < 0)
              v43 = (void **)v49[0];
            LODWORD(v53.__r_.__value_.__l.__data_) = 136446979;
            *(std::string::size_type *)((char *)v53.__r_.__value_.__r.__words + 4) = (std::string::size_type)v43;
            WORD2(v53.__r_.__value_.__r.__words[1]) = 2049;
            *(double *)((char *)&v53.__r_.__value_.__r.__words[1] + 6) = a4;
            HIWORD(v53.__r_.__value_.__r.__words[2]) = 2049;
            v54 = a5;
            v55 = 2050;
            v56 = v19;
            _os_log_send_and_compose_impl(2, 0, &v57, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,TrackRun,Adding subscription for,%{public}s,LL,%{private}.7lf,%{private}.7lf,radius_m,%{public}.2lf", &v53, 42);
            v45 = (std::string *)v44;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", v44);
            if (v45 != &v57)
              free(v45);
          }
          v29 = v50;
          v30 = (void **)v49[0];
          v31 = +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding");
          if (v29 >= 0)
            v32 = v49;
          else
            v32 = v30;
          v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, v31);
          fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
          v35 = objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"), "queue");
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3321888768;
          v46[2] = sub_1013BFBA0;
          v46[3] = &unk_1021B3178;
          if (SHIBYTE(v52) < 0)
          {
            sub_100115CE4(&__p, v51[0], (unint64_t)v51[1]);
          }
          else
          {
            __p = *(_OWORD *)v51;
            v48 = v52;
          }
          -[GEOMapDataSubscriptionManager addSubscriptionWithIdentifier:dataTypes:policy:region:expirationDate:callbackQueue:completionHandler:](fGeoMapSubscriptionManager, "addSubscriptionWithIdentifier:dataTypes:policy:region:expirationDate:callbackQueue:completionHandler:", v33, 4, 0, v24, v26, v35, v46);
          if (SHIBYTE(v48) < 0)
            operator delete((void *)__p);
          if (v50 < 0)
            operator delete(v49[0]);
          goto LABEL_61;
        }
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v41 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v57.__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "CLGMTPS,TrackRun,fGeoMapSubscriptionManager unallocated, cannot proceed to set up precaching subscriptions.", (uint8_t *)&v57, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(&v57, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          LOWORD(v53.__r_.__value_.__l.__data_) = 0;
          _os_log_send_and_compose_impl(2, 0, &v57, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,TrackRun,fGeoMapSubscriptionManager unallocated, cannot proceed to set up precaching subscriptions.", &v53, 2);
          v40 = (std::string *)v42;
          sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", v42);
LABEL_54:
          if (v40 != &v57)
            free(v40);
        }
      }
LABEL_61:
      if (SHIBYTE(v52) < 0)
        operator delete(v51[0]);
      return;
  }
}

- (void)fetchCoarseLocationForNextLOI:(int)a3
{
  uint64_t v3;

  if (a3 == 7)
  {
    v3 = 0;
  }
  else if (a3 == 1)
  {
    v3 = 2;
  }
  else
  {
    if (a3)
      return;
    v3 = 1;
  }
  -[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:](self, "fetchLOIForType:isSecondTry:", v3, 0);
}

- (BOOL)setCoarseCoordinatesFromDefaultsWriteEntry
{
  CLGeoMapTilesPreloaderSettings *p_fSettings;
  const char *v4;
  const char *v5;
  const char *v6;
  __int128 v7;
  double fLongitudeInDeg;
  double fLatitudeInDeg;
  CFAbsoluteTime Current;
  NSObject *v11;
  unint64_t value;
  unint64_t v14;
  const char *v15;
  uint8_t *v16;
  int v17;
  char v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  __int128 v30;
  _BYTE v31[20];
  int v32;
  _DWORD v33[2];
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint8_t buf[4];
  int v39;
  _BYTE v40[24];
  double v41;
  double v42;
  CFAbsoluteTime v43;

  p_fSettings = &self->fSettings;
  if (sub_10011CE64(self->fSettings.fLatitudeInDeg, self->fSettings.fLongitudeInDeg)
    || p_fSettings->fRadiusInMeters <= 0.0)
  {
    return 0;
  }
  v32 = 0;
  if (!sub_10017BFFC((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, &v32))
  {
    sub_100119F3C(v31);
    if (byte_10230E6C7 >= 0)
      v4 = (const char *)&qword_10230E6B0;
    else
      v4 = (const char *)qword_10230E6B0;
    buf[0] = 1;
    sub_10011B47C((uint64_t)v31, v4, buf);
    if (byte_10230E6DF >= 0)
      v5 = (const char *)&qword_10230E6C8;
    else
      v5 = (const char *)qword_10230E6C8;
    sub_10018A4CC((uint64_t)v31, v5, &p_fSettings->fRadiusInMeters);
    if (byte_10230E6F7 >= 0)
      v6 = (const char *)&qword_10230E6E0;
    else
      v6 = (const char *)qword_10230E6E0;
    sub_10018A4CC((uint64_t)v31, v6, &p_fSettings->fRadiusInMeters);
    v17 = 16777472;
    v18 = 1;
    v19 = 0;
    v21 = xmmword_101BC0BA0;
    v22 = xmmword_101BC0BB0;
    v23 = 400;
    *(_QWORD *)&v7 = -1;
    *((_QWORD *)&v7 + 1) = -1;
    v24 = v7;
    v25 = v7;
    v26 = v7;
    v27 = v7;
    v28 = v7;
    v30 = xmmword_101BC0BC0;
    v20 = xmmword_101BC0BD0;
    if (sub_1000C4240())
      DWORD1(v20) = 4233600;
    DWORD2(v24) = 125000;
    DWORD1(v25) = 125000;
    LODWORD(v26) = 125000;
    HIDWORD(v26) = 15000;
    DWORD2(v27) = 25000;
    DWORD1(v28) = -1;
    v29 = -1;
    sub_1007743C0((unsigned __int8 *)&v17, (uint64_t)v31);
    sub_100008848((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (_QWORD *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_);
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__begin_node_ = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_ = 0;
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_ = 0;
    -[CLGeoMapTilesPreloaderService clearPersistentStore:](self, "clearPersistentStore:", 1);
    fLatitudeInDeg = p_fSettings->fLatitudeInDeg;
    fLongitudeInDeg = p_fSettings->fLongitudeInDeg;
    Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = v32;
    *(double *)v40 = fLatitudeInDeg;
    *(double *)&v40[8] = fLongitudeInDeg;
    *(_QWORD *)&v40[16] = 0;
    v41 = fLatitudeInDeg;
    v42 = fLongitudeInDeg;
    v43 = Current;
    sub_1013D1224((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    *(_DWORD *)buf = 5;
    *(double *)v40 = fLatitudeInDeg;
    *(double *)&v40[8] = fLongitudeInDeg;
    *(_QWORD *)&v40[16] = 0;
    v41 = fLatitudeInDeg;
    v42 = fLongitudeInDeg;
    v43 = Current;
    sub_1013D1224((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v11 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
    {
      value = self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_;
      *(_DWORD *)buf = 67240705;
      v39 = value;
      *(_WORD *)v40 = 2049;
      *(double *)&v40[2] = fLatitudeInDeg;
      *(_WORD *)&v40[10] = 2049;
      *(double *)&v40[12] = fLongitudeInDeg;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLGMTPS,set coordinates from defaults-write entry,%{public}d,LL,%{private}.8lf,%{private}.8lf", buf, 0x1Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v14 = self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_;
      v33[0] = 67240705;
      v33[1] = v14;
      v34 = 2049;
      v35 = fLatitudeInDeg;
      v36 = 2049;
      v37 = fLongitudeInDeg;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,set coordinates from defaults-write entry,%{public}d,LL,%{private}.8lf,%{private}.8lf", v33, 28);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setCoarseCoordinatesFromDefaultsWriteEntry]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    sub_10011A5A8(v31);
  }
  return 1;
}

- (CLMatrixIndex)getInsideOutSpiralMatrixIndicesForSection:(int)a3 matrixSize:(int)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  _BOOL4 v25;
  NSObject *v26;
  unint64_t v27;
  int v28;
  const char *v29;
  uint8_t *v30;
  int v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  CLMatrixIndex result;

  if (a4 >= 0x79)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v5 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v42 = a4;
      v43 = 1026;
      v44 = 120;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLGMTPS,too big matrix size for inside out index computation,size,%{public}d,maxSize,%{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v31 = 67240448;
      v32 = a4;
      v33 = 1026;
      v34 = 120;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,too big matrix size for inside out index computation,size,%{public}d,maxSize,%{public}d", &v31, 14);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getInsideOutSpiralMatrixIndicesForSection:matrixSize:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    goto LABEL_49;
  }
  v9 = (a4 + 1) >> 1;
  if (a3 < 0)
  {
    v16 = 0;
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = -1;
    v12 = 4;
    v13 = a3;
    do
    {
      v14 = __OFSUB__(v13, v12);
      v13 -= v12;
      if (v13 < 0 != v14)
        v15 = 0;
      else
        v15 = v12;
      v10 += v15;
      ++v11;
      v12 += 8;
    }
    while ((v13 & 0x80000000) == 0);
    if (v11 >= v9)
    {
LABEL_49:
      v16 = -1;
      v20 = 0xFFFFFFFFLL;
      v19 = -1;
      goto LABEL_55;
    }
    v16 = v11 + 1;
  }
  v17 = 0;
  v18 = (2 * (v16 - 1)) | 1;
  if (v18 >= a4)
    v18 = a4;
  v19 = v16 - 1 + v9 - 1;
  v20 = v9 - v16;
  if ((a4 & (v16 == v9)) != 0)
    v21 = 2;
  else
    v21 = 4;
  v22 = a4 - 1;
  while (v18 < 1)
  {
LABEL_48:
    if (++v17 == v21)
      goto LABEL_49;
  }
  v23 = 0;
  while (1)
  {
    if (!v17 && v23 && v19)
    {
      --v19;
    }
    else if (v17 == 1 && (int)v20 < v22)
    {
      v20 = (v20 + 1);
    }
    else if (v17 == 2 && v19 < v22)
    {
      ++v19;
    }
    else
    {
      v24 = v17 != 3 || (_DWORD)v20 == 0;
      v25 = !v24;
      v20 = (v20 - v25);
    }
    if (v10 - a3 == v23)
      break;
    if (-v18 == --v23)
    {
      v10 -= v23;
      goto LABEL_48;
    }
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v26 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67241216;
    v42 = a3;
    v43 = 1026;
    v44 = v16;
    v45 = 1026;
    v46 = v19;
    v47 = 1026;
    v48 = v20;
    v49 = 1026;
    v50 = a4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "CLGMTPS,getInsideOutSpiralMatrixIndicesForSection,section,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,size,%{public}d", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v31 = 67241216;
    v32 = a3;
    v33 = 1026;
    v34 = v16;
    v35 = 1026;
    v36 = v19;
    v37 = 1026;
    v38 = v20;
    v39 = 1026;
    v40 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,getInsideOutSpiralMatrixIndicesForSection,section,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,size,%{public}d", &v31, 32);
    v30 = (uint8_t *)v29;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getInsideOutSpiralMatrixIndicesForSection:matrixSize:]", "%s\n", v29);
    if (v30 != buf)
      free(v30);
  }
LABEL_55:
  v27 = v19 | (unint64_t)(v20 << 32);
  v28 = v16;
  result.var0 = v27;
  result.var1 = HIDWORD(v27);
  result.var2 = v28;
  return result;
}

- (CLTileDownloadSection)getSectionCoordinate:(SEL)a3 aroundLatitude:(int)a4 longitude:(double)a5 radius:(double)a6 sectionRadius:(double)a7 useInsideOutDownload:(double)a8
{
  double *p_var2;
  uint64_t v17;
  NSObject *v18;
  CLTileDownloadSection *result;
  int v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  BOOL v24;
  BOOL v25;
  int v26;
  BOOL v27;
  NSObject *v28;
  const char *v29;
  double v30;
  CLDistanceCalc *p_fDistanceCalc;
  NSObject *v32;
  NSObject *v33;
  double v34;
  double v35;
  NSObject *v36;
  uint8_t *v37;
  double v38;
  uint64_t v39;
  const char *v40;
  uint8_t *v41;
  const char *v42;
  uint8_t *v43;
  uint64_t v44;
  double *p_var3;
  uint64_t v46;
  int v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  __int16 v51;
  _BYTE v52[28];
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  _BYTE v68[10];
  __int16 v69;
  _BYTE v70[28];
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;

  retstr->var2 = 0.0;
  p_var2 = &retstr->var2;
  *(_QWORD *)&retstr->var0 = -1;
  *(_QWORD *)&retstr->var1.var1 = -1;
  retstr->var3 = 0.0;
  retstr->var4 = -1.0;
  retstr->var5 = 0;
  if (a7 < 0.0)
    goto LABEL_7;
  if (a7 <= 0.0 || a8 <= 0.0)
  {
    if (a4 <= 3)
    {
      v17 = 2;
      goto LABEL_14;
    }
LABEL_7:
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v18 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v66 = a4;
      v67 = 2050;
      *(double *)v68 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLGMTPS,getSectionCoordinate,invalid input,section,%{public}d,radius,%{public}.2lf", buf, 0x12u);
    }
    result = (CLTileDownloadSection *)sub_1001BFF7C(115, 0);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v47 = 67240448;
      v48 = a4;
      v49 = 2050;
      *(double *)v50 = a7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,getSectionCoordinate,invalid input,section,%{public}d,radius,%{public}.2lf", &v47, 18);
      goto LABEL_62;
    }
    return result;
  }
  v17 = (int)(a7 / a8 + 0.5);
  if ((int)v17 * (int)v17 <= a4)
    goto LABEL_7;
LABEL_14:
  v20 = a4 / (int)v17;
  LODWORD(v21) = a4 % (int)v17;
  if (!a9
    || (v22 = (uint64_t)-[CLGeoMapTilesPreloaderService getInsideOutSpiralMatrixIndicesForSection:matrixSize:](self, "getInsideOutSpiralMatrixIndicesForSection:matrixSize:", *(_QWORD *)&a4, v17), (v22 & 0x80000000) != 0)|| ((int)v17 > (int)v22 ? (v24 = v22 <= -1) : (v24 = 1), !v24 ? (v25 = (int)v17 <= SHIDWORD(v22)) : (v25 = 1), v25))
  {
    v26 = -1;
  }
  else
  {
    v26 = v23;
    v21 = HIDWORD(v22);
    v20 = v22;
  }
  v27 = v20 < (int)v17 && (int)v21 < (int)v17;
  if (!v27 || ((v20 | v21) & 0x80000000) != 0)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v28 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240960;
      v66 = v26;
      v67 = 1026;
      *(_DWORD *)v68 = v20;
      *(_WORD *)&v68[4] = 1026;
      *(_DWORD *)&v68[6] = v21;
      v69 = 1026;
      *(_DWORD *)v70 = v17;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "CLGMTPS,getSectionCoordinate,invalid size,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d", buf, 0x1Au);
    }
    result = (CLTileDownloadSection *)sub_1001BFF7C(115, 0);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v47 = 67240960;
      v48 = v26;
      v49 = 1026;
      *(_DWORD *)v50 = v20;
      *(_WORD *)&v50[4] = 1026;
      *(_DWORD *)&v50[6] = v21;
      v51 = 1026;
      *(_DWORD *)v52 = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,getSectionCoordinate,invalid size,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d", &v47, 26);
      goto LABEL_62;
    }
  }
  else
  {
    v30 = (double)(int)v17 * a8;
    p_fDistanceCalc = &self->fDistanceCalc;
    p_var3 = &retstr->var3;
    v46 = 0;
    if (sub_10008111C(&self->fDistanceCalc.fM, p_var2, &retstr->var3, (double *)&v46, a5, a6, 0.0, v30 - (double)((2 * v20) | 1) * a8, -(v30 - (double)(int)((2 * v21) | 1) * a8), 0.0))
    {
      goto LABEL_45;
    }
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v32 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67241472;
      v66 = v26;
      v67 = 1026;
      *(_DWORD *)v68 = v20;
      *(_WORD *)&v68[4] = 1026;
      *(_DWORD *)&v68[6] = v21;
      v69 = 1026;
      *(_DWORD *)v70 = v17;
      *(_WORD *)&v70[4] = 2050;
      *(double *)&v70[6] = v30 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v70[14] = 2050;
      *(double *)&v70[16] = -(v30 - (double)(int)((2 * v21) | 1) * a8);
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "CLGMTPS,calculateNewPosUsingDelta failed,trying NoLimit spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", buf, 0x2Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v47 = 67241472;
      v48 = v26;
      v49 = 1026;
      *(_DWORD *)v50 = v20;
      *(_WORD *)&v50[4] = 1026;
      *(_DWORD *)&v50[6] = v21;
      v51 = 1026;
      *(_DWORD *)v52 = v17;
      *(_WORD *)&v52[4] = 2050;
      *(double *)&v52[6] = v30 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v52[14] = 2050;
      *(double *)&v52[16] = -(v30 - (double)(int)((2 * v21) | 1) * a8);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,calculateNewPosUsingDelta failed,trying NoLimit spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", &v47, 46);
      v43 = (uint8_t *)v42;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v42);
      if (v43 != buf)
        free(v43);
    }
    if (sub_1010B97DC(&p_fDistanceCalc->fM, p_var2, p_var3, (double *)&v46, a5, a6, 0.0, v30 - (double)((2 * v20) | 1) * a8, -(v30 - (double)(int)((2 * v21) | 1) * a8), 0.0))
    {
LABEL_45:
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v33 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
      {
        v34 = *p_var2;
        v35 = *p_var3;
        *(_DWORD *)buf = 67243009;
        v66 = v17;
        v67 = 1026;
        *(_DWORD *)v68 = v20;
        *(_WORD *)&v68[4] = 1026;
        *(_DWORD *)&v68[6] = v21;
        v69 = 2049;
        *(double *)v70 = v34;
        *(_WORD *)&v70[8] = 2049;
        *(double *)&v70[10] = v35;
        *(_WORD *)&v70[18] = 2049;
        *(double *)&v70[20] = a5;
        v71 = 2049;
        v72 = a6;
        v73 = 2050;
        v74 = a7;
        v75 = 2049;
        v76 = -(v30 - (double)(int)((2 * v21) | 1) * a8);
        v77 = 2049;
        v78 = v30 - (double)((2 * v20) | 1) * a8;
        v79 = 2048;
        v80 = a8;
        v81 = 2048;
        v82 = (double)(int)v17 * a8;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "CLGMTPS,getSectionCoordinate,size,%{public}d,row,%{public}d,col,%{public}d,LL,%{private}.7lf,%{private}.7lf,inLL,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,east,%{private}.3lf,north,%{private}.3lf,sectionRadius,%.2lf,radiusBasedOnSize,%.2lf", buf, 0x6Eu);
      }
      result = (CLTileDownloadSection *)sub_1001BFF7C(115, 2);
      if ((_DWORD)result)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v38 = *p_var2;
        v39 = *(_QWORD *)p_var3;
        v47 = 67243009;
        v48 = v17;
        v49 = 1026;
        *(_DWORD *)v50 = v20;
        *(_WORD *)&v50[4] = 1026;
        *(_DWORD *)&v50[6] = v21;
        v51 = 2049;
        *(double *)v52 = v38;
        *(_WORD *)&v52[8] = 2049;
        *(_QWORD *)&v52[10] = v39;
        *(_WORD *)&v52[18] = 2049;
        *(double *)&v52[20] = a5;
        v53 = 2049;
        v54 = a6;
        v55 = 2050;
        v56 = a7;
        v57 = 2049;
        v58 = -(v30 - (double)(int)((2 * v21) | 1) * a8);
        v59 = 2049;
        v60 = v30 - (double)((2 * v20) | 1) * a8;
        v61 = 2048;
        v62 = a8;
        v63 = 2048;
        v64 = (double)(int)v17 * a8;
        LODWORD(v44) = 110;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,getSectionCoordinate,size,%{public}d,row,%{public}d,col,%{public}d,LL,%{private}.7lf,%{private}.7lf,inLL,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,east,%{private}.3lf,north,%{private}.3lf,sectionRadius,%.2lf,radiusBasedOnSize,%.2lf", &v47, v44);
        v41 = (uint8_t *)v40;
        result = (CLTileDownloadSection *)sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v40);
        if (v41 != buf)
          free(v41);
      }
      retstr->var1.var1 = v21;
      retstr->var1.var2 = v26;
      retstr->var4 = a8;
      retstr->var0 = a4;
      retstr->var1.var0 = v20;
      return result;
    }
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v36 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67241472;
      v66 = v26;
      v67 = 1026;
      *(_DWORD *)v68 = v20;
      *(_WORD *)&v68[4] = 1026;
      *(_DWORD *)&v68[6] = v21;
      v69 = 1026;
      *(_DWORD *)v70 = v17;
      *(_WORD *)&v70[4] = 2050;
      *(double *)&v70[6] = v30 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v70[14] = 2050;
      *(double *)&v70[16] = -(v30 - (double)(int)((2 * v21) | 1) * a8);
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "CLGMTPS,calculateNewPosUsingDelta failed,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", buf, 0x2Eu);
    }
    result = (CLTileDownloadSection *)sub_1001BFF7C(115, 0);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v47 = 67241472;
      v48 = v26;
      v49 = 1026;
      *(_DWORD *)v50 = v20;
      *(_WORD *)&v50[4] = 1026;
      *(_DWORD *)&v50[6] = v21;
      v51 = 1026;
      *(_DWORD *)v52 = v17;
      *(_WORD *)&v52[4] = 2050;
      *(double *)&v52[6] = v30 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v52[14] = 2050;
      *(double *)&v52[16] = -(v30 - (double)(int)((2 * v21) | 1) * a8);
      LODWORD(v44) = 46;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,calculateNewPosUsingDelta failed,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", &v47, v44);
LABEL_62:
      v37 = (uint8_t *)v29;
      result = (CLTileDownloadSection *)sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v29);
      if (v37 != buf)
        free(v37);
    }
  }
  return result;
}

- (void)preloadSectionTilesAtLatitude:(double)a3 longitude:(double)a4 config:(CLMapMatcherGeoTilesPrecachingConfig *)a5 type:(int)a6 building:(BOOL)a7 section:(int)a8 numberOfsectionsToDownload:(int)a9 loiSectionData:(void *)a10
{
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  int64_t *p_fTotalNPLOISectionDownloads;
  NSObject *v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  int v24;
  double v25;
  unint64_t v26;
  BOOL v27;
  char v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  char *v34;
  int v35;
  CFAbsoluteTime v36;
  uint64_t **v37;
  NSObject *v38;
  _BYTE *v39;
  NSObject *v40;
  const char *v41;
  char *v42;
  NSObject *v43;
  xpc_activity_state_t state;
  uint64_t v45;
  xpc_activity_state_t v46;
  const char *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  NSObject *v63;
  xpc_activity_state_t v64;
  const char *v65;
  uint64_t v66;
  _BYTE *v67;
  char *v68;
  const char *v69;
  char *v70;
  uint64_t v71;
  xpc_activity_state_t v72;
  const char *v73;
  _OWORD v74[10];
  int var26;
  _OWORD v76[3];
  _OWORD v77[10];
  int v78;
  _OWORD v79[3];
  _QWORD v80[2];
  void (*v81)(uint64_t, int, void *);
  void *v82;
  CLGeoMapTilesPreloaderService *v83;
  _QWORD *v84;
  _QWORD *v85;
  _BYTE *v86;
  __int128 *v87;
  int v88;
  int v89;
  int v90;
  BOOL v91;
  _QWORD v92[3];
  CFAbsoluteTime Current;
  _QWORD v94[3];
  double v95;
  int64_t *v96;
  __int16 v97;
  int v98;
  int v99;
  xpc_activity_state_t v100;
  NSErrorUserInfoKey v101;
  NSString *v102;
  _BYTE v103[24];
  __n128 (*v104)(uint64_t, uint64_t);
  uint64_t (*v105)();
  void *v106;
  __int128 v107;
  uint64_t v108;
  int v109;
  _BYTE buf[12];
  __int16 v111;
  int v112;
  char v113;

  v12 = *(_QWORD *)&a8;
  v13 = a7;
  v14 = *(_QWORD *)&a6;
  v98 = a8;
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v96 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  v97 = 256;
  if ((_DWORD)v14 != 7)
  {
    if (a9 <= 0)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v30 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = a9;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid sections to download,%{public}d", buf, 8u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      *(_DWORD *)v103 = 67240192;
      *(_DWORD *)&v103[4] = a9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,invalid sections to download,%{public}d", v103, 8);
      v22 = (char *)v65;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v65);
      goto LABEL_102;
    }
    v23 = 64;
    if (v13)
      v23 = 68;
    v24 = *(_DWORD *)(&a5->var0 + 12 * (int)v14 + v23);
    v25 = (double)v24;
    v26 = (unint64_t)(COERCE__INT64(fabs((double)v24)) - 0x10000000000000) >> 53;
    if ((double)v24)
      v27 = v26 >= 0x3FF;
    else
      v27 = 0;
    v28 = !v27;
    if (v24 > 0x1E848 || (v28 & 1) == 0)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v31 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(double *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "CLGMTPS,invalid radius,%{public}.1lf", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      *(_DWORD *)v103 = 134349056;
      *(double *)&v103[4] = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,invalid radius,%{public}.1lf", v103, 12);
      v22 = (char *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v32);
      if (v22 == buf)
        goto LABEL_30;
      goto LABEL_103;
    }
    if (!a10 || !self->fPersistentStoreData.__ptr_.__value_)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v33 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
      {
        v34 = v14 > 6 ? "Unknown" : off_1021B33C0[(int)v14];
        sub_1015A2E04(buf, v34);
        v39 = v113 >= 0 ? buf : *(_BYTE **)buf;
        *(_DWORD *)v103 = 136446210;
        *(_QWORD *)&v103[4] = v39;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "CLGMTPS,%{public}s,uninitialized map entry, preloadSectionTilesAtLatitude", v103, 0xCu);
        if (v113 < 0)
          operator delete(*(void **)buf);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v66 = qword_1022A00D8;
      sub_1013BA99C(v14, v103);
      if (v103[23] >= 0)
        v67 = v103;
      else
        v67 = *(_BYTE **)v103;
      LODWORD(v107) = 136446210;
      *(_QWORD *)((char *)&v107 + 4) = v67;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v66, 16, "CLGMTPS,%{public}s,uninitialized map entry, preloadSectionTilesAtLatitude", &v107, 12);
      v22 = v68;
      if ((v103[23] & 0x80000000) != 0)
        operator delete(*(void **)v103);
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v22);
      if (v22 == buf)
        goto LABEL_30;
      goto LABEL_103;
    }
    *(_QWORD *)&v107 = 0;
    *((_QWORD *)&v107 + 1) = &v107;
    v108 = 0x2020000000;
    if (v24)
      v29 = (int)(v25 / dbl_101CA13C0[(v14 - 5) < 2] + 0.5);
    else
      v29 = 2;
    v35 = v29 * v29;
    v109 = v35 - 1;
    if (v35 <= (int)v12)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v38 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        *(double *)&buf[4] = v25;
        v111 = 1026;
        v112 = v98;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "CLGMTPS,reached end of download cycle for this LOI or invalid radius,radius,%{public}.1lf,section,%{public}d", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        *(_DWORD *)v103 = 134349312;
        *(double *)&v103[4] = v25;
        *(_WORD *)&v103[12] = 1026;
        *(_DWORD *)&v103[14] = v98;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,reached end of download cycle for this LOI or invalid radius,radius,%{public}.1lf,section,%{public}d", v103, 18);
        v70 = (char *)v69;
        sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v69);
        if (v70 != buf)
          free(v70);
      }
      -[CLGeoMapTilesPreloaderService setXPCActivityToDone](self, "setXPCActivityToDone");
      goto LABEL_97;
    }
    *(_QWORD *)v103 = 0;
    *(_QWORD *)&v103[8] = v103;
    *(_QWORD *)&v103[16] = 0x6012000000;
    v104 = sub_100207358;
    v105 = nullsub_59;
    v106 = &unk_102080316;
    -[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:](self, "getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:", v12, a5->var1, a3, a4, v25);
    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x2020000000;
    v95 = 0.0;
    v95 = sub_1001FCBB4();
    v92[0] = 0;
    v92[1] = v92;
    v92[2] = 0x2020000000;
    Current = 0.0;
    Current = CFAbsoluteTimeGetCurrent();
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v81 = sub_1013C2240;
    v82 = &unk_1021B31D8;
    v91 = v13;
    v83 = self;
    v84 = v94;
    v88 = v14;
    v89 = v98;
    v85 = v92;
    v86 = v103;
    v87 = &v107;
    v90 = a9;
    if (self->fAnalytics.fTotalTouristSectionDownloads)
    {
      v36 = CFAbsoluteTimeGetCurrent();
      *(_QWORD *)buf = &v98;
      if (v13)
        v37 = sub_100041CE0((uint64_t **)a10 + 9, &v98, (uint64_t)&unk_101B9EB60, (_DWORD **)buf);
      else
        v37 = sub_100041CE0((uint64_t **)a10 + 6, &v98, (uint64_t)&unk_101B9EB60, (_DWORD **)buf);
      *((CFAbsoluteTime *)v37 + 5) = v36;
      if ((*(_DWORD *)(*(_QWORD *)&v103[8] + 48) & 0x80000000) != 0)
      {
        v48 = objc_alloc((Class)NSError);
        v101 = NSLocalizedDescriptionKey;
        v102 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid download section"));
        v81((uint64_t)v80, 0, objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.CLGMTPS"), 0, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1)));
      }
      else
      {
        if (xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads) == 4
          || xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 4))
        {
          if (!xpc_activity_should_defer((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads)
            || !xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 3))
          {
            v49 = *(_OWORD *)(*(_QWORD *)&v103[8] + 80);
            v50 = *(_OWORD *)(*(_QWORD *)&v103[8] + 48);
            if ((v14 - 5) > 1)
            {
              v76[1] = *(_OWORD *)(*(_QWORD *)&v103[8] + 64);
              v76[2] = v49;
              v76[0] = v50;
              v57 = *(unsigned int *)(*((_QWORD *)&v107 + 1) + 24);
              v58 = *(_OWORD *)&a5->var22[6].var2;
              v74[8] = *(_OWORD *)&a5->var22[5].var1;
              v74[9] = v58;
              var26 = a5->var26;
              v59 = *(_OWORD *)&a5->var22[1].var1;
              v74[4] = *(_OWORD *)&a5->var22[0].var0;
              v74[5] = v59;
              v60 = *(_OWORD *)&a5->var22[4].var0;
              v74[6] = *(_OWORD *)&a5->var22[2].var2;
              v74[7] = v60;
              v61 = *(_OWORD *)&a5->var10;
              v74[0] = *(_OWORD *)&a5->var0;
              v74[1] = v61;
              v62 = *(_OWORD *)&a5->var18;
              v74[2] = *(_OWORD *)&a5->var14;
              v74[3] = v62;
              -[CLGeoMapTilesPreloaderService preloadTilesAPICallForSection:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:](self, "preloadTilesAPICallForSection:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:", v76, v57, v13, v14, v74, v80, 3000.0);
            }
            else
            {
              v79[1] = *(_OWORD *)(*(_QWORD *)&v103[8] + 64);
              v79[2] = v49;
              v79[0] = v50;
              v51 = *(unsigned int *)(*((_QWORD *)&v107 + 1) + 24);
              v52 = *(_OWORD *)&a5->var22[6].var2;
              v77[8] = *(_OWORD *)&a5->var22[5].var1;
              v77[9] = v52;
              v78 = a5->var26;
              v53 = *(_OWORD *)&a5->var22[1].var1;
              v77[4] = *(_OWORD *)&a5->var22[0].var0;
              v77[5] = v53;
              v54 = *(_OWORD *)&a5->var22[4].var0;
              v77[6] = *(_OWORD *)&a5->var22[2].var2;
              v77[7] = v54;
              v55 = *(_OWORD *)&a5->var10;
              v77[0] = *(_OWORD *)&a5->var0;
              v77[1] = v55;
              v56 = *(_OWORD *)&a5->var18;
              v77[2] = *(_OWORD *)&a5->var14;
              v77[3] = v56;
              -[CLGeoMapTilesPreloaderService preloadTilesAPICallForSectionWithSECheck:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:](self, "preloadTilesAPICallForSectionWithSECheck:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:", v79, v51, v13, v14, v77, v80, 3000.0);
            }
            goto LABEL_96;
          }
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v43 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
          {
            state = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
            *(_DWORD *)buf = 134349056;
            *(_QWORD *)&buf[4] = state;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "CLGMTPS,setting activity to defer,currentState,%{public}ld", buf, 0xCu);
          }
          if (!sub_1001BFF7C(115, 2))
            goto LABEL_96;
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v45 = qword_1022A00D8;
          v46 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
          v99 = 134349056;
          v100 = v46;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v45, 1, "CLGMTPS,setting activity to defer,currentState,%{public}ld", &v99, 12);
          v42 = (char *)v47;
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v47);
        }
        else
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v63 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
          {
            v64 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
            *(_DWORD *)buf = 134349056;
            *(_QWORD *)&buf[4] = v64;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "CLGMTPS,failed to mark activity as Continue,state,%{public}ld", buf, 0xCu);
          }
          if (!sub_1001BFF7C(115, 0))
            goto LABEL_96;
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v71 = qword_1022A00D8;
          v72 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
          v99 = 134349056;
          v100 = v72;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v71, 16, "CLGMTPS,failed to mark activity as Continue,state,%{public}ld", &v99, 12);
          v42 = (char *)v73;
          sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v73);
        }
        if (v42 != buf)
          goto LABEL_121;
      }
LABEL_96:
      _Block_object_dispose(v92, 8);
      _Block_object_dispose(v94, 8);
      _Block_object_dispose(v103, 8);
LABEL_97:
      _Block_object_dispose(&v107, 8);
      goto LABEL_98;
    }
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v40 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "CLGMTPS,failed to mark activity as Continue,activity does not exist", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_96;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    LOWORD(v99) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,failed to mark activity as Continue,activity does not exist", &v99, 2);
    v42 = (char *)v41;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v41);
    if (v42 == buf)
      goto LABEL_96;
LABEL_121:
    free(v42);
    goto LABEL_96;
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v20 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid matcher LOI type", buf, 2u);
  }
  if (!sub_1001BFF7C(115, 0))
    goto LABEL_30;
  bzero(buf, 0x65CuLL);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  *(_WORD *)v103 = 0;
  _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,invalid matcher LOI type", v103, 2);
  v22 = (char *)v21;
  sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v21);
LABEL_102:
  if (v22 != buf)
LABEL_103:
    free(v22);
LABEL_30:
  -[CLGeoMapTilesPreloaderService setXPCActivityToDone](self, "setXPCActivityToDone");
LABEL_98:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)preloadTilesAPICallForSection:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9
{
  _BOOL4 v11;
  double *p_fCosRefLat;
  CLPersistentStoreData *value;
  double Current;
  NSObject *v20;
  double var2;
  double var3;
  double var4;
  int var0;
  int v25;
  int v26;
  int var1;
  uint64_t v28;
  int fMapsBuildingTileStyleToUse;
  double v30;
  double v31;
  GEOMapFeatureAccess *fGEOMapFeatureAccess;
  double v33;
  double v34;
  double v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint8_t *v43;
  _DWORD v44[2];
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  _BOOL4 v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;

  v11 = a6;
  p_fCosRefLat = &self->fRoutineInfo.fDistanceCalc.fCosRefLat;
  ++self->fAnalytics.fXPCCallBackCount;
  if (a7 == 6)
  {
    value = self->fPersistentStoreData.__ptr_.__value_;
    if (value)
    {
      Current = CFAbsoluteTimeGetCurrent();
      sub_1013C3140((uint64_t)value, 6, a5, a3->var0, v11, a8->var24, Current);
    }
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v20 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
  {
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    var0 = a3->var0;
    v25 = a3->var1.var0;
    var1 = a3->var1.var1;
    v26 = a3->var1.var2;
    v28 = *((_QWORD *)p_fCosRefLat + 3);
    fMapsBuildingTileStyleToUse = self->fSettings.fMapsBuildingTileStyleToUse;
    *(_DWORD *)buf = 67242753;
    v66 = var0;
    v67 = 2049;
    v68 = var2;
    v69 = 2049;
    v70 = var3;
    v71 = 2050;
    v72 = var4;
    v73 = 1026;
    v74 = v11;
    v75 = 1026;
    v76 = v26;
    v77 = 1026;
    v78 = v25;
    v79 = 1026;
    v80 = var1;
    v81 = 2050;
    v82 = v28;
    v83 = 1026;
    v84 = a7;
    v85 = 1026;
    v86 = fMapsBuildingTileStyleToUse;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting tiles,section,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,building,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,downloadReqCount,%{public}ld,loiType,%{public}d,mapsBuildingTileStyle,%{public}d", buf, 0x54u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v33 = a3->var2;
    v34 = a3->var3;
    v35 = a3->var4;
    v36 = a3->var0;
    v37 = a3->var1.var0;
    v39 = a3->var1.var1;
    v38 = a3->var1.var2;
    v40 = *((_QWORD *)p_fCosRefLat + 3);
    v41 = self->fSettings.fMapsBuildingTileStyleToUse;
    v44[0] = 67242753;
    v44[1] = v36;
    v45 = 2049;
    v46 = v33;
    v47 = 2049;
    v48 = v34;
    v49 = 2050;
    v50 = v35;
    v51 = 1026;
    v52 = v11;
    v53 = 1026;
    v54 = v38;
    v55 = 1026;
    v56 = v37;
    v57 = 1026;
    v58 = v39;
    v59 = 2050;
    v60 = v40;
    v61 = 1026;
    v62 = a7;
    v63 = 1026;
    v64 = v41;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,requesting tiles,section,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,building,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,downloadReqCount,%{public}ld,loiType,%{public}d,mapsBuildingTileStyle,%{public}d", v44, 84);
    v43 = (uint8_t *)v42;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadTilesAPICallForSection:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:]", "%s\n", v42);
    if (v43 != buf)
      free(v43);
  }
  self->fDownloadRequestInProgress = 1;
  v30 = a3->var2;
  v31 = a3->var3;
  fGEOMapFeatureAccess = self->fGEOMapFeatureAccess;
  if (v11)
    -[GEOMapFeatureAccess preloadBuildingTilesNear:radius:tileSetStyle:preloadToDiskOnly:completionHandler:](fGEOMapFeatureAccess, "preloadBuildingTilesNear:radius:tileSetStyle:preloadToDiskOnly:completionHandler:", self->fSettings.fMapsBuildingTileStyleToUse, 1, a9, v30, v31, a4);
  else
    -[GEOMapFeatureAccess preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:](fGEOMapFeatureAccess, "preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:", 1, a9, v30, v31, a4);
}

- (void)preloadTilesAPICallForSectionWithSECheck:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9
{
  id v17;
  double var2;
  double var3;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  int v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int var26;
  BOOL v44;

  v17 = objc_msgSend(-[CLGeoMapTilesPreloaderService vendor](self, "vendor"), "proxyForService:", CFSTR("CLSignalEnvironmentProvider"));
  objc_msgSend(v17, "registerDelegate:inSilo:", self, objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"));
  var2 = a3->var2;
  var3 = a3->var3;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1013C3328;
  v26[3] = &unk_1021B3200;
  v20 = *(_OWORD *)&a3->var2;
  v27 = *(_OWORD *)&a3->var0;
  v28 = v20;
  v29 = *(_OWORD *)&a3->var4;
  v30 = a4;
  v31 = a7;
  v32 = a5;
  v44 = a6;
  v21 = *(_OWORD *)&a8->var10;
  v33 = *(_OWORD *)&a8->var0;
  v34 = v21;
  v22 = *(_OWORD *)&a8->var22[0].var0;
  v38 = *(_OWORD *)&a8->var22[1].var1;
  v37 = v22;
  v23 = *(_OWORD *)&a8->var18;
  v35 = *(_OWORD *)&a8->var14;
  v36 = v23;
  var26 = a8->var26;
  v24 = *(_OWORD *)&a8->var22[5].var1;
  v42 = *(_OWORD *)&a8->var22[6].var2;
  v41 = v24;
  v25 = *(_OWORD *)&a8->var22[4].var0;
  v39 = *(_OWORD *)&a8->var22[2].var2;
  v40 = v25;
  v26[4] = self;
  v26[5] = a9;
  objc_msgSend(v17, "fetchCoarseSignalEnvironmentForLatitude:longitude:withReply:", v26, var2, var3);
}

- (void)logRTLocationOfInterest:(id)a3 type:(id)a4
{
  id v4;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  id v35;
  unsigned int v36;
  const char *v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  id v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  id v62;
  __int16 v63;
  unsigned int v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  unsigned int v78;
  __int16 v79;
  id v80;
  __int16 v81;
  unsigned int v82;
  _BYTE v83[128];

  if (a3)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v83, 16);
    if (v4)
    {
      v5 = v4;
      v6 = &qword_1022A0000;
      v7 = &qword_1022A0000;
      v8 = *(_QWORD *)v44;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v9);
          if (v6[26] != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v11 = v7[27];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = objc_msgSend(v10, "type");
            objc_msgSend(objc_msgSend(v10, "location"), "latitude");
            v14 = v13;
            objc_msgSend(objc_msgSend(v10, "location"), "longitude");
            v16 = v15;
            objc_msgSend(objc_msgSend(v10, "location"), "horizontalUncertainty");
            v18 = v17;
            objc_msgSend(v10, "confidence");
            v20 = v19;
            v21 = objc_msgSend(objc_msgSend(v10, "visits"), "count");
            v22 = objc_msgSend(objc_msgSend(v10, "preferredName"), "UTF8String");
            v23 = objc_msgSend(v10, "typeSource");
            *(_DWORD *)buf = 138545411;
            v66 = a4;
            v67 = 1026;
            v68 = v12;
            v7 = &qword_1022A0000;
            v69 = 2049;
            v70 = v14;
            v71 = 2049;
            v72 = v16;
            v73 = 2050;
            v74 = v18;
            v75 = 2050;
            v76 = v20;
            v77 = 1026;
            v78 = v21;
            v79 = 2081;
            v80 = v22;
            v6 = &qword_1022A0000;
            v81 = 1026;
            v82 = v23;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,%{public}@,receivedType,%{public}d,ll,%{private}.7lf,%{private}.7lf,unc,%{public}.1lf,confidence,%{public}.1lf,visitsCount,%{public}d,name,%{private}s,source,%{public}d", buf, 0x50u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v6[26] != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v24 = v7[27];
            v25 = objc_msgSend(v10, "type");
            objc_msgSend(objc_msgSend(v10, "location"), "latitude");
            v27 = v26;
            objc_msgSend(objc_msgSend(v10, "location"), "longitude");
            v29 = v28;
            objc_msgSend(objc_msgSend(v10, "location"), "horizontalUncertainty");
            v31 = v30;
            objc_msgSend(v10, "confidence");
            v33 = v32;
            v34 = objc_msgSend(objc_msgSend(v10, "visits"), "count");
            v35 = objc_msgSend(objc_msgSend(v10, "preferredName"), "UTF8String");
            v36 = objc_msgSend(v10, "typeSource");
            v47 = 138545411;
            v48 = a4;
            v49 = 1026;
            v50 = v25;
            v51 = 2049;
            v52 = v27;
            v53 = 2049;
            v54 = v29;
            v55 = 2050;
            v56 = v31;
            v57 = 2050;
            v58 = v33;
            v59 = 1026;
            v60 = v34;
            v61 = 2081;
            v62 = v35;
            v63 = 1026;
            v64 = v36;
            LODWORD(v40) = 80;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "CLGMTPS,%{public}@,receivedType,%{public}d,ll,%{private}.7lf,%{private}.7lf,unc,%{public}.1lf,confidence,%{public}.1lf,visitsCount,%{public}d,name,%{private}s,source,%{public}d", &v47, v40);
            v38 = (uint8_t *)v37;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService logRTLocationOfInterest:type:]", "%s\n", v37);
            if (v38 != buf)
              free(v38);
            v6 = &qword_1022A0000;
            v7 = &qword_1022A0000;
          }
          v9 = (char *)v9 + 1;
        }
        while (v5 != v9);
        v39 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v83, 16);
        v5 = v39;
      }
      while (v39);
    }
  }
}

- (void)pullDataFromPersistentStore
{
  CLPersistentStoreData *value;
  NSObject *v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  _QWORD v13[6];
  _WORD v14[88];
  _DWORD v15[4];
  uint8_t buf[4];
  unsigned int v17;

  value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    sub_100D823D8((uint64_t)value + 56);
    -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1013C3D20;
    v13[3] = &unk_102131360;
    v13[4] = self;
    v13[5] = v14;
    objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"), "sync:", v13);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v4 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      v5 = -[CLGeoMapTilesPreloaderService getPersistentStoreDataCount](self, "getPersistentStoreDataCount");
      *(_DWORD *)buf = 67240192;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,persistent store read with datacount,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v7 = qword_1022A00D8;
      v8 = -[CLGeoMapTilesPreloaderService getPersistentStoreDataCount](self, "getPersistentStoreDataCount");
      v15[0] = 67240192;
      v15[1] = v8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 1, "CLGMTPS,persistent store read with datacount,%{public}d", v15, 8);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService pullDataFromPersistentStore]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    sub_100D823A8((id *)self->fPersistentStoreData.__ptr_.__value_ + 7);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CLGMTPS,pullDataFromPersistentStore,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,pullDataFromPersistentStore,invalid persistent store data pointer", v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService pullDataFromPersistentStore]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)storeDataInPersistentStore
{
  CLPersistentStoreData *value;
  uint64_t *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    sub_100D823D8((uint64_t)value + 56);
    v4 = (uint64_t *)self->fPersistentStoreData.__ptr_.__value_;
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_1013C6104(v4, self->fRoutineInfo.fDistanceCalc.fRefLatDegs);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v5 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,persistent store written", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,persistent store written", v11, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService storeDataInPersistentStore]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    sub_100D823A8((id *)self->fPersistentStoreData.__ptr_.__value_ + 7);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,invalid persistent store data pointer", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService storeDataInPersistentStore]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)clearPersistentStore:(BOOL)a3
{
  CLPersistentStoreData *value;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  const char *v12;
  _DWORD v13[4];
  uint8_t buf[4];
  unsigned int v15;

  value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    if (!self->fSettings.fClearPersistentStore && !a3)
      return;
    sub_1013C6E10((uint64_t)value);
    v6 = *((_QWORD *)self->fPersistentStoreData.__ptr_.__value_ + 11);
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v7 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      v15 = -[CLGeoMapTilesPreloaderService getPersistentStoreDataCount](self, "getPersistentStoreDataCount");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLGMTPS,persistent store with datacount,%{public}d,cleared", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8 = qword_1022A00D8;
    v13[0] = 67240192;
    v13[1] = -[CLGeoMapTilesPreloaderService getPersistentStoreDataCount](self, "getPersistentStoreDataCount");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "CLGMTPS,persistent store with datacount,%{public}d,cleared", v13, 8);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService clearPersistentStore:]", "%s\n", v9);
    if (v10 == buf)
      return;
LABEL_26:
    free(v10);
    return;
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v11 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CLGMTPS,clearPersistentStore,invalid persistent store data pointer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    LOWORD(v13[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,clearPersistentStore,invalid persistent store data pointer", v13, 2);
    v10 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService clearPersistentStore:]", "%s\n", v12);
    if (v10 != buf)
      goto LABEL_26;
  }
}

- (int)getPersistentStoreDataCount
{
  CLPersistentStoreData *value;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
    return sub_1013C7010((uint64_t)value);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v4 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getPersistentStoreDataCount]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  return -1;
}

- (int)getPersistentStoreDataCountForType:(int)a3
{
  CLPersistentStoreData *value;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
    return sub_1013C7244((uint64_t)value, a3);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v5 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getPersistentStoreDataCountForType:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  return -1;
}

- (void)registerForClientManagerNotification
{
  if (!self->fClientManagerClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_1001B6A0C();
  }
}

- (void)unregisterForClientManagerNotification
{
  Client *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  value = self->fClientManagerClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 4);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForClientManagerNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForClientManagerNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForClientManagerNotification]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v11;
  int v12;
  int v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;

  if (a3 == 4)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      v7 = a1[54];
      v8 = *(_DWORD *)(a4 + 188);
      *(_DWORD *)buf = 67240448;
      v23 = v7;
      v24 = 1026;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received clientManager notification,prev,%{public}d,now,%{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v12 = a1[54];
      v13 = *(_DWORD *)(a4 + 188);
      v18 = 67240448;
      v19 = v12;
      v20 = 1026;
      v21 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,received clientManager notification,prev,%{public}d,now,%{public}d", &v18, 14);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onClientManagerNotification:data:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v9 = a1[54];
    if (v9 == 1)
    {
      if (!*(_DWORD *)(a4 + 188))
      {
        a1[54] = 0;
        objc_msgSend(a1, "unregisterXPCActivity:", 0);
        objc_msgSend(a1, "clearPersistentStore:", 1);
      }
    }
    else if (!v9 && *(_DWORD *)(a4 + 188) == 1)
    {
      a1[54] = 1;
      objc_msgSend(a1, "setUpRepeatingActivityToDownloadTiles");
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v11 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLGMTPS,unhandled clientManager notification,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v18 = 67240192;
      v19 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unhandled clientManager notification,%{public}d", &v18, 8);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onClientManagerNotification:data:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
}

- (void)registerForWifiServiceNotification
{
  if (!self->fWiFiServiceClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_1001B7DEC();
  }
}

- (void)unregisterForWifiServiceNotification
{
  Client *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  value = self->fWiFiServiceClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 6);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForWifiServiceNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForWifiServiceNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForWifiServiceNotification]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  char v5;
  NSObject *v6;
  int v7;
  int v8;
  double v9;
  uint8_t *v10;
  uint8_t *v11;
  NSObject *v13;
  double v14;
  uint8_t *v15;
  int v16;
  int v17;
  uint8_t buf[4];
  int v19;

  if (a3 == 6)
  {
    v5 = *(_BYTE *)(a4 + 96);
    if (v5)
      v5 = *(_DWORD *)(a4 + 48) > 0;
    *(_BYTE *)(a1 + 192) = v5;
    objc_msgSend((id)a1, "setNewCriteria:", *(unsigned int *)(a1 + 348));
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      v7 = *(unsigned __int8 *)(a1 + 192);
      *(_DWORD *)buf = 67174657;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received wifi service link status,%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v8 = *(unsigned __int8 *)(a1 + 192);
      v16 = 67174657;
      v17 = v8;
      v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,received wifi service link status,%{private}d", &v16, 8);
      v11 = v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onWifiServiceNotification:data:]", "%s\n", v9);
LABEL_21:
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v13 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CLGMTPS, received unhandled wifi service notification,%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v16 = 67174657;
      v17 = a3;
      v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS, received unhandled wifi service notification,%{private}d", &v16, 8);
      v11 = v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onWifiServiceNotification:data:]", "%s\n", v14);
      goto LABEL_21;
    }
  }
}

- (void)registerForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (!self->fRoutineMonitor)
  {
    v3 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    self->fRoutineMonitor = v3;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v3, "registerDelegate:inSilo:", self, -[CLGeoMapTilesPreloaderService silo](self, "silo"));
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v4 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,registerForRoutineMonitor", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,registerForRoutineMonitor", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService registerForRoutineMonitor]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)unregisterForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *fRoutineMonitor;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  fRoutineMonitor = self->fRoutineMonitor;
  if (fRoutineMonitor)

  self->fRoutineMonitor = 0;
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v4 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForRoutineMonitor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForRoutineMonitor", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForRoutineMonitor]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)registerForTrackRunEnablementNotifications
{
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  id v10;
  void *__p[2];
  char v12;
  uint8_t buf[8];
  CLGeoMapTilesPreloaderService *v14;
  uint8_t *v15;

  v3 = sub_100CF08FC();
  self->fIsTrackPrecachingEnabled = sub_100CF0F84(v3);
  v4 = sub_100CF08FC();
  sub_1015A2E04(__p, "CLGeoMapTilesPreloaderService");
  v10 = objc_msgSend(objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo"), "queue");
  *(_QWORD *)buf = off_1021B3338;
  v14 = self;
  v15 = buf;
  sub_100CF0C5C(v4, (uint64_t)__p, (uint64_t *)&v10, (uint64_t)buf);
  v5 = v15;
  if (v15 == buf)
  {
    v6 = 4;
    v5 = buf;
  }
  else
  {
    if (!v15)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_6:
  if (v12 < 0)
    operator delete(__p[0]);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v7 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CLGMTPS,registerForTrackRunEnablementNotifications", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    LOWORD(__p[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,registerForTrackRunEnablementNotifications", __p, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService registerForTrackRunEnablementNotifications]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)unregisterForTrackRunEnablementNotifications
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  void **v5;
  _WORD v6[8];
  void *__p[2];
  char v8;

  v2 = sub_100CF08FC();
  sub_1015A2E04(__p, "CLGeoMapTilesPreloaderService");
  sub_100CF0FBC(v2, (unsigned __int8 **)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v3 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGMTPS,unregisterForTrackRunEnablementNotifications", (uint8_t *)__p, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A00D8, 0, "CLGMTPS,unregisterForTrackRunEnablementNotifications", v6, 2);
    v5 = (void **)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForTrackRunEnablementNotifications]", "%s\n", v4);
    if (v5 != __p)
      free(v5);
  }
}

- (void)registerForDaemonStatusNotification
{
  if (!self->fDaemonStatusClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_100647FA8();
  }
}

- (void)unregisterForDaemonStatusNotification
{
  Client *value;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  value = self->fDaemonStatusClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 7);
    objc_msgSend(*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fDaemonStatusClient.__ptr_.__value_ + 1), 13);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v4 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForDaemonStatusNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForDaemonStatusNotification", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForDaemonStatusNotification]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4
{
  uint64_t *v7;
  uint64_t *v8;
  NSObject *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  double v25;
  BOOL v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int v31;
  NSObject *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint8_t *v48;
  int v49;
  int v50;
  const char *v51;
  uint8_t *v52;
  const char *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  int *v70;
  int *v71;
  int v72;
  _BYTE v73[10];
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  unsigned int v92;
  __int16 v93;
  unsigned int v94;
  __int16 v95;
  unsigned int v96;
  __int16 v97;
  unsigned int v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  uint8_t buf[4];
  _BYTE v108[10];
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  unsigned int v127;
  __int16 v128;
  unsigned int v129;
  __int16 v130;
  unsigned int v131;
  __int16 v132;
  unsigned int v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;

  if (a3 == 13)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v29 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      v30 = *a4;
      v31 = *(_DWORD *)(a1 + 208);
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v108 = v30;
      *(_WORD *)&v108[4] = 1026;
      *(_DWORD *)&v108[6] = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "CLGMTPS,received thermal notification,level,%{public}d,prevLevel,%{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v49 = *a4;
      v50 = *(_DWORD *)(a1 + 208);
      v72 = 67240448;
      *(_DWORD *)v73 = v49;
      *(_WORD *)&v73[4] = 1026;
      *(_DWORD *)&v73[6] = v50;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,received thermal notification,level,%{public}d,prevLevel,%{public}d", &v72, 14);
      v52 = (uint8_t *)v51;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v51);
      if (v52 != buf)
        free(v52);
    }
    *(_DWORD *)(a1 + 208) = *a4;
  }
  else if (a3 == 7)
  {
    v7 = &qword_1022A0000;
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8 = &qword_1022A0000;
    v9 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEFAULT))
    {
      v64 = *(_QWORD *)a4;
      v70 = a4;
      v62 = *((unsigned __int8 *)a4 + 9);
      v66 = *(_DWORD *)(a1 + 352);
      v68 = *(unsigned __int8 *)(a1 + 192);
      v10 = *(double *)(a1 + 616);
      v11 = 0.0;
      if (v10 >= 0.0)
        v11 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)(a1 + 616));
      v12 = *(_QWORD *)(a1 + 624);
      v13 = *(_QWORD *)(a1 + 632);
      v14 = *(_QWORD *)(a1 + 640);
      v60 = *(_QWORD *)(a1 + 648);
      v15 = objc_msgSend((id)a1, "getPersistentStoreDataCount");
      v16 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 0);
      v17 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 1);
      v18 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 2);
      v19 = *(_QWORD *)(a1 + 672);
      v20 = *(_QWORD *)(a1 + 680);
      v21 = *(_QWORD *)(a1 + 656);
      v22 = *(_QWORD *)(a1 + 664);
      *(_DWORD *)buf = 134353409;
      *(_QWORD *)v108 = v64;
      *(_WORD *)&v108[8] = 1025;
      v109 = v62;
      v110 = 1025;
      v111 = v68;
      v112 = 1026;
      v113 = v66;
      v114 = 2050;
      v115 = v10;
      v116 = 2050;
      v117 = v11;
      v118 = 2050;
      v119 = v12;
      v120 = 2050;
      v121 = v13;
      v122 = 2050;
      v123 = v14;
      v124 = 2050;
      v125 = v60;
      v126 = 1026;
      v127 = v15;
      v128 = 1026;
      v129 = v16;
      v130 = 1026;
      v131 = v17;
      v132 = 1026;
      v133 = v18;
      v134 = 2050;
      v135 = v19;
      v136 = 2050;
      v137 = v20;
      v138 = 2050;
      v139 = v21;
      v140 = 2050;
      v141 = v22;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLGMTPS,received battery notification,level,%{public}.1lf,charging,%{private}d,wifi,%{private}d,xpcInt,%{public}d,startTime,%{public}.1lf,dT,%{public}.1lf,callBack,%{public}ld,intervalChng,%{public}ld,dwnldReq,%{public}ld,success,%{public}ld,store,%{public}d,home,%{public}d,work,%{public}d,school,%{public}d,tourist,%{public}ld,nploi,%{public}ld,road,%{public}ld,bldg,%{public}ld", buf, 0x9Au);
      a4 = v70;
      v7 = &qword_1022A0000;
      v8 = &qword_1022A0000;
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v69 = qword_1022A00D8;
      v71 = a4;
      v63 = *(_QWORD *)a4;
      v67 = *(unsigned __int8 *)(a1 + 192);
      v61 = *((unsigned __int8 *)a4 + 9);
      v65 = *(_DWORD *)(a1 + 352);
      v33 = *(double *)(a1 + 616);
      v34 = 0.0;
      if (v33 >= 0.0)
        v34 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)(a1 + 616));
      v35 = *(_QWORD *)(a1 + 624);
      v36 = *(_QWORD *)(a1 + 632);
      v38 = *(_QWORD *)(a1 + 640);
      v37 = *(_QWORD *)(a1 + 648);
      v39 = objc_msgSend((id)a1, "getPersistentStoreDataCount");
      v40 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 0);
      v41 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 1);
      v42 = objc_msgSend((id)a1, "getPersistentStoreDataCountForType:", 2);
      v43 = *(_QWORD *)(a1 + 672);
      v44 = *(_QWORD *)(a1 + 680);
      v45 = *(_QWORD *)(a1 + 656);
      v46 = *(_QWORD *)(a1 + 664);
      v72 = 134353409;
      *(_QWORD *)v73 = v63;
      *(_WORD *)&v73[8] = 1025;
      v74 = v61;
      v75 = 1025;
      v76 = v67;
      v77 = 1026;
      v78 = v65;
      v79 = 2050;
      v80 = v33;
      v81 = 2050;
      v82 = v34;
      v83 = 2050;
      v84 = v35;
      v85 = 2050;
      v86 = v36;
      v87 = 2050;
      v88 = v38;
      v89 = 2050;
      v90 = v37;
      v91 = 1026;
      v92 = v39;
      v93 = 1026;
      v94 = v40;
      v95 = 1026;
      v96 = v41;
      v97 = 1026;
      v98 = v42;
      v99 = 2050;
      v100 = v43;
      v101 = 2050;
      v102 = v44;
      v103 = 2050;
      v104 = v45;
      v105 = 2050;
      v106 = v46;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v69, 0, "CLGMTPS,received battery notification,level,%{public}.1lf,charging,%{private}d,wifi,%{private}d,xpcInt,%{public}d,startTime,%{public}.1lf,dT,%{public}.1lf,callBack,%{public}ld,intervalChng,%{public}ld,dwnldReq,%{public}ld,success,%{public}ld,store,%{public}d,home,%{public}d,work,%{public}d,school,%{public}d,tourist,%{public}ld,nploi,%{public}ld,road,%{public}ld,bldg,%{public}ld", &v72, 154);
      v48 = (uint8_t *)v47;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v47);
      if (v48 != buf)
        free(v48);
      a4 = v71;
      v7 = &qword_1022A0000;
      v8 = &qword_1022A0000;
    }
    v23 = *((unsigned __int8 *)a4 + 9);
    v24 = *(unsigned __int8 *)(a1 + 193);
    *(_BYTE *)(a1 + 193) = v23;
    if (v23 != v24)
      objc_msgSend((id)a1, "setNewCriteria:", *(unsigned int *)(a1 + 348));
    if (sub_100512A64(*(double *)a4, 50.0, 0.01)
      || ((v25 = *(double *)a4, *(double *)(a1 + 200) < 0.0) ? (v26 = v25 < 50.0) : (v26 = 1), !v26))
    {
      if (v7[26] != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v27 = v8[27];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = *(_QWORD *)a4;
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)v108 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CLGMTPS,prefetch LOIs at batteryLevel,%{public}.1lf", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (v7[26] != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v55 = v8[27];
        v56 = *(_QWORD *)a4;
        v72 = 134349056;
        *(_QWORD *)v73 = v56;
        LODWORD(v59) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v55, 1, "CLGMTPS,prefetch LOIs at batteryLevel,%{public}.1lf", &v72, v59);
        v58 = (uint8_t *)v57;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v57);
        if (v58 != buf)
          free(v58);
      }
      objc_msgSend((id)a1, "fetchLOIFromCoreRoutine");
      objc_msgSend((id)a1, "fetchNPLOI");
      v25 = *(double *)a4;
    }
    *(double *)(a1 + 200) = v25;
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v32 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v108 = a3;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "CLGMTPS,daemonStatus notification,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v72 = 67240192;
      *(_DWORD *)v73 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,daemonStatus notification,%{public}d", &v72, 8);
      v54 = (uint8_t *)v53;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v53);
      if (v54 != buf)
        free(v54);
    }
  }
}

- (void)registerForMotionStateMediatorNotification
{
  if (!self->fMotionStateMediatorClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_1006CB5B4();
  }
}

- (void)unregisterForMotionStateMediatorNotification
{
  Client *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForMotionStateMediatorNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForMotionStateMediatorNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForMotionStateMediatorNotification]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (uint64_t)onMotionStateMediatorNotification:(int)a3 data:(uint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  _BYTE *v8;
  int v9;
  double v10;
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  const char *v15;
  uint8_t *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;

  if (a3)
    return result;
  v5 = result;
  v6 = result + 696;
  (*(void (**)(uint64_t))(*(_QWORD *)(result + 696) + 16))(result + 696);
  v8 = (_BYTE *)(v5 + 712);
  if (*(_BYTE *)(v5 + 712))
  {
    v9 = 1;
  }
  else
  {
    v7.n128_u64[0] = *(_QWORD *)(v5 + 720);
    if (v7.n128_f64[0] <= 0.0)
    {
      v9 = 0;
    }
    else
    {
      v7.n128_f64[0] = vabdd_f64(sub_1001FCBB4(), *(double *)(v5 + 720));
      v9 = v7.n128_f64[0] < 3600.0;
    }
  }
  if (!CLMotionActivity::isTypeInVehicle(*(unsigned int *)(a4 + 8), v7))
  {
    *v8 = 0;
    v10 = *(double *)(v5 + 720);
LABEL_11:
    v11 = v10 > 0.0 && vabdd_f64(sub_1001FCBB4(), *(double *)(v5 + 720)) < 3600.0;
    goto LABEL_14;
  }
  *v8 = 1;
  v10 = sub_1001FCBB4();
  *(double *)(v5 + 720) = v10;
  if (!*v8)
    goto LABEL_11;
  v11 = 1;
LABEL_14:
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v12 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_DWORD *)(a4 + 8);
    *(_DWORD *)buf = 67240704;
    v23 = v13;
    v24 = 1026;
    v25 = v9;
    v26 = 1026;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLGMTPS,onMotionStateMediator,type,%{public}d,inVehicleBefore,%{public}d,inVehicleAfter,%{public}d", buf, 0x14u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v14 = *(_DWORD *)(a4 + 8);
    v17[0] = 67240704;
    v17[1] = v14;
    v18 = 1026;
    v19 = v9;
    v20 = 1026;
    v21 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,onMotionStateMediator,type,%{public}d,inVehicleBefore,%{public}d,inVehicleAfter,%{public}d", v17, 20);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMotionStateMediatorNotification:data:]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
  if (v9 != v11)
    objc_msgSend((id)v5, "setNewCriteria:", *(unsigned int *)(v5 + 348));
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
}

- (void)registerForMobileAssetNotification
{
  if (!self->fMobileAssetClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_1013DF780();
  }
}

- (void)unregisterForMobileAssetNotification
{
  Client *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  value = self->fMobileAssetClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 2);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForMobileAssetNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForMobileAssetNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForMobileAssetNotification]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  _WORD v21[8];
  _QWORD v22[2];
  uint8_t buf[4];
  int v24;

  if (a3 == 2)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      v24 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received MA-OTA,notification,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v22[0] = 0x204020100;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,received MA-OTA,notification,%{public}d", v22, 8);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    sub_100119F3C(v22);
    if (sub_100006BB4(a4, "MapMatcherConfig", v22))
    {
      sub_10077665C(a1 + 264, (uint64_t)v22);
      v7 = *(_QWORD **)(a1 + 120);
      if (v7 != (_QWORD *)(a1 + 128))
      {
        do
        {
          sub_100776124((uint64_t **)(a1 + 264), (std::string *)(v7 + 4), (__int128 *)(v7 + 7));
          v8 = (_QWORD *)v7[1];
          if (v8)
          {
            do
            {
              v9 = v8;
              v8 = (_QWORD *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = (_QWORD *)v7[2];
              v10 = *v9 == (_QWORD)v7;
              v7 = v9;
            }
            while (!v10);
          }
          v7 = v9;
        }
        while (v9 != (_QWORD *)(a1 + 128));
      }
      objc_msgSend((id)a1, "getConfigFromMobileAssets");
      objc_msgSend((id)a1, "setUpRepeatingActivityToDownloadTiles");
      if (*(double *)(a1 + 200) > 50.0)
        objc_msgSend((id)a1, "fetchLOIFromCoreRoutine");
    }
    else
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v15 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "CLGMTPS,MA-OTA,map matcher config not available", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v21[0] = 0;
        LODWORD(v20) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,MA-OTA,map matcher config not available", v21, v20);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v18);
        if (v19 != buf)
          free(v19);
      }
    }
    sub_10011A5A8(v22);
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v12 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLGMTPS,MA-OTA,invalid notification,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LODWORD(v22[0]) = 67240192;
      HIDWORD(v22[0]) = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,MA-OTA,invalid notification,%{public}d", v22, 8);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)setUpRepeatingActivityToDownloadTiles
{
  NSObject *v3;
  int fXPCCurrentInterval;
  int v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  NSObject *v9;
  int fLocationServiceState;
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  uint8_t *v16;
  _QWORD handler[6];
  _WORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  CFAbsoluteTime Current;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  _BOOL4 v26;

  if (self->fXPCCurrentInterval == -1)
  {
    if (self->fPersistentStoreData.__ptr_.__value_
      && self->fGEOMapFeatureAccess
      && self->fLocationServiceState
      && self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
    {
      -[CLGeoMapTilesPreloaderService unregisterXPCActivity:](self, "unregisterXPCActivity:", 1);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      Current = 0.0;
      Current = CFAbsoluteTimeGetCurrent();
      self->fRoutineInfo.fDistanceCalc.fCosRefLat = CFAbsoluteTimeGetCurrent();
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v8 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,XPC activity Check-in", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v18[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,XPC activity Check-in", v18, 2);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1013CAD4C;
      handler[3] = &unk_1021B3228;
      handler[4] = self;
      handler[5] = &v19;
      xpc_activity_register("com.apple.locationd.GeoMapTilesPreloaderServiceDownload", XPC_ACTIVITY_CHECK_IN, handler);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v9 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
      {
        fLocationServiceState = self->fLocationServiceState;
        v11 = self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ != 0;
        *(_DWORD *)buf = 67240448;
        v24 = fLocationServiceState;
        v25 = 1026;
        v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CLGMTPS,conditions not ideal to set XPC Activity,lsState,%{public}d,maConfig,%{public}d", buf, 0xEu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v12 = self->fLocationServiceState;
        v13 = self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ != 0;
        LODWORD(v19) = 67240448;
        HIDWORD(v19) = v12;
        LOWORD(v20) = 1026;
        *(_DWORD *)((char *)&v20 + 2) = v13;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,conditions not ideal to set XPC Activity,lsState,%{public}d,maConfig,%{public}d", &v19, 14);
        v7 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v14);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      v24 = fXPCCurrentInterval;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,activity already set with interval,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v5 = self->fXPCCurrentInterval;
      LODWORD(v19) = 67240192;
      HIDWORD(v19) = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,activity already set with interval,%{public}d", &v19, 8);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v6);
LABEL_29:
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)setNewCriteria:(int)a3
{
  int64_t *p_fTotalNPLOISectionDownloads;
  unsigned int v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  int v13;
  int v14;
  const char *v15;
  int v16;
  int fXPCDownloadInterval;
  xpc_object_t v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  int fXPCCurrentInterval;
  int v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  int v29;
  int fDownloadSizePerSection;
  int fUploadSizePerSection;
  int fDownloadTimePerSection;
  double fXPCSetUpTime;
  _BOOL4 fIsXPCSettingAggressive;
  int v35;
  int v36;
  int v37;
  int v38;
  double v39;
  _BOOL4 v40;
  const char *v41;
  uint8_t *v42;
  int fMinimumBatterylevel;
  xpc_object_t xdict;
  int v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  double v56;
  __int16 v57;
  _BOOL4 v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  double v70;
  __int16 v71;
  _BOOL4 v72;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  if (self->fAnalytics.fTotalTouristSectionDownloads)
  {
    if (self->fXPCCurrentInterval == -1)
    {
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v21 = qword_1022A00D8;
      if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        v60 = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CLGMTPS,activity currently not registered,interval,%{public}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v45 = 67240192;
        v46 = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,activity currently not registered,interval,%{public}d", &v45, 8);
        v11 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v22);
        goto LABEL_47;
      }
    }
    else
    {
      -[CLGeoMapTilesPreloaderService setXPCActivityToDone](self, "setXPCActivityToDone");
      v6 = -[CLGeoMapTilesPreloaderService shouldUseAggressiveSettings](self, "shouldUseAggressiveSettings");
      v7 = v6;
      v8 = self->fXPCCurrentInterval - a3;
      if (v8 || self->fIsXPCSettingAggressive != v6)
      {
        if (v8 >= 0)
          v16 = self->fXPCCurrentInterval - a3;
        else
          v16 = a3 - self->fXPCCurrentInterval;
        fXPCDownloadInterval = self->fXPCDownloadInterval;
        if (fXPCDownloadInterval != a3 && v16 < fXPCDownloadInterval)
        {
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v23 = qword_1022A00D8;
          if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
          {
            fXPCCurrentInterval = self->fXPCCurrentInterval;
            *(_DWORD *)buf = 67240704;
            v60 = a3;
            v61 = 1026;
            v62 = fXPCCurrentInterval;
            v63 = 1026;
            v64 = v16;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "CLGMTPS,new activity interval,%{public}d,is close to current,%{public}d,delta,%{public}d", buf, 0x14u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v25 = self->fXPCCurrentInterval;
            v45 = 67240704;
            v46 = a3;
            v47 = 1026;
            v48 = v25;
            v49 = 1026;
            v50 = v16;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,new activity interval,%{public}d,is close to current,%{public}d,delta,%{public}d", &v45, 20);
            v11 = (uint8_t *)v26;
            sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v26);
            goto LABEL_47;
          }
        }
        else
        {
          fMinimumBatterylevel = self->fMinimumBatterylevel;
          v19 = xpc_activity_copy_criteria((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
          if (v19)
          {
            self->fXPCCurrentInterval = a3;
            self->fIsXPCSettingAggressive = v7;
            xdict = xpc_dictionary_create(0, 0, 0);
            if (v7)
            {
              xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_ALLOW_BATTERY, 1);
              xpc_dictionary_set_string(v19, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
              xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
              v20 = (const char *)objc_msgSend((id)off_1022FFAD8(), "cStringUsingEncoding:", 4);
              xpc_dictionary_set_int64(xdict, v20, self->fMinimumBatteryLevelAggressiveMode);
              fMinimumBatterylevel = self->fMinimumBatteryLevelAggressiveMode;
            }
            else
            {
              xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_ALLOW_BATTERY, 0);
              xpc_dictionary_set_string(v19, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
              xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
              v27 = (const char *)objc_msgSend((id)off_1022FFAD8(), "cStringUsingEncoding:", 4);
              xpc_dictionary_set_int64(xdict, v27, self->fMinimumBatterylevel);
            }
            xpc_dictionary_set_value(v19, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, xdict);
            xpc_dictionary_set_int64(v19, XPC_ACTIVITY_NETWORK_DOWNLOAD_SIZE, self->fDownloadSizePerSection);
            xpc_dictionary_set_int64(v19, XPC_ACTIVITY_NETWORK_UPLOAD_SIZE, self->fUploadSizePerSection);
            xpc_dictionary_set_int64(v19, XPC_ACTIVITY_EXPECTED_DURATION, self->fDownloadTimePerSection);
            xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_DISK_INTENSIVE, self->fIsDiskIntensiveActivity);
            xpc_dictionary_set_int64(v19, XPC_ACTIVITY_INTERVAL, self->fXPCCurrentInterval);
            ++*(_QWORD *)&self->fAnalytics.fXPCSetUpTime;
            if (qword_1022A00D0 != -1)
              dispatch_once(&qword_1022A00D0, &stru_1021B3298);
            v28 = qword_1022A00D8;
            if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
            {
              v29 = self->fXPCCurrentInterval;
              fDownloadSizePerSection = self->fDownloadSizePerSection;
              fUploadSizePerSection = self->fUploadSizePerSection;
              fDownloadTimePerSection = self->fDownloadTimePerSection;
              fXPCSetUpTime = self->fAnalytics.fXPCSetUpTime;
              fIsXPCSettingAggressive = self->fIsXPCSettingAggressive;
              *(_DWORD *)buf = 67241728;
              v60 = v29;
              v61 = 1026;
              v62 = fMinimumBatterylevel;
              v63 = 1026;
              v64 = fDownloadSizePerSection;
              v65 = 1026;
              v66 = fUploadSizePerSection;
              v67 = 1026;
              v68 = fDownloadTimePerSection;
              v69 = 2050;
              v70 = fXPCSetUpTime;
              v71 = 1026;
              v72 = fIsXPCSettingAggressive;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "CLGMTPS,Setting new XPC interval,%{public}d,minimumBatterylevel,%{public}d,downloadSz,%{public}d,uploadSz,%{public}d,downloadTime,%{public}d,changeCount,%{public}ld,aggressive,%{public}d", buf, 0x30u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A00D0 != -1)
                dispatch_once(&qword_1022A00D0, &stru_1021B3298);
              v35 = self->fXPCCurrentInterval;
              v36 = self->fDownloadSizePerSection;
              v37 = self->fUploadSizePerSection;
              v38 = self->fDownloadTimePerSection;
              v39 = self->fAnalytics.fXPCSetUpTime;
              v40 = self->fIsXPCSettingAggressive;
              v45 = 67241728;
              v46 = v35;
              v47 = 1026;
              v48 = fMinimumBatterylevel;
              v49 = 1026;
              v50 = v36;
              v51 = 1026;
              v52 = v37;
              v53 = 1026;
              v54 = v38;
              v55 = 2050;
              v56 = v39;
              v57 = 1026;
              v58 = v40;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,Setting new XPC interval,%{public}d,minimumBatterylevel,%{public}d,downloadSz,%{public}d,uploadSz,%{public}d,downloadTime,%{public}d,changeCount,%{public}ld,aggressive,%{public}d", &v45, 48);
              v42 = (uint8_t *)v41;
              sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v41);
              if (v42 != buf)
                free(v42);
            }
            xpc_activity_set_criteria((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, v19);
            xpc_release(xdict);
            xpc_release(v19);
          }
        }
      }
      else
      {
        if (qword_1022A00D0 != -1)
          dispatch_once(&qword_1022A00D0, &stru_1021B3298);
        v9 = qword_1022A00D8;
        if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67240448;
          v60 = a3;
          v61 = 1026;
          v62 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLGMTPS,activity interval,%{public}d,already set,aggressive,%{public}d", buf, 0xEu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00D0 != -1)
            dispatch_once(&qword_1022A00D0, &stru_1021B3298);
          v45 = 67240448;
          v46 = a3;
          v47 = 1026;
          v48 = v7;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,activity interval,%{public}d,already set,aggressive,%{public}d", &v45, 14);
          v11 = (uint8_t *)v10;
          sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v10);
LABEL_47:
          if (v11 != buf)
            free(v11);
        }
      }
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v12 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      v13 = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240448;
      v60 = v13;
      v61 = 1026;
      v62 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLGMTPS,activity is nil,interval,%{public}d,newInterval,%{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v14 = self->fXPCCurrentInterval;
      v45 = 67240448;
      v46 = v14;
      v47 = 1026;
      v48 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,activity is nil,interval,%{public}d,newInterval,%{public}d", &v45, 14);
      v11 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v15);
      goto LABEL_47;
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)unregisterXPCActivity:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int fXPCCurrentInterval;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = a3;
  if (!a3 && self->fXPCCurrentInterval == -1)
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v7 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLGMTPS,activity not registered, nothing to unregister", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,activity not registered, nothing to unregister", v13, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService unregisterXPCActivity:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v5 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240448;
      v17 = fXPCCurrentInterval;
      v18 = 1026;
      v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLGMTPS,activity with interval,%{public}d,unregistered,force,%{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v10 = self->fXPCCurrentInterval;
      v13[0] = 67240448;
      v13[1] = v10;
      v14 = 1026;
      v15 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,activity with interval,%{public}d,unregistered,force,%{public}d", v13, 14);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterXPCActivity:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    self->fXPCCurrentInterval = -1;
    xpc_activity_unregister("com.apple.locationd.GeoMapTilesPreloaderServiceDownload");
    self->fAnalytics.fTotalTouristSectionDownloads = 0;
  }
}

- (void)setXPCActivityToDone
{
  int64_t *p_fTotalNPLOISectionDownloads;
  _xpc_activity_s *fTotalTouristSectionDownloads;
  NSObject *v5;
  NSObject *v6;
  xpc_activity_state_t state;
  uint64_t v8;
  xpc_activity_state_t v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  xpc_activity_state_t v18;
  uint8_t buf[4];
  xpc_activity_state_t v20;

  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  fTotalTouristSectionDownloads = (_xpc_activity_s *)self->fAnalytics.fTotalTouristSectionDownloads;
  if (fTotalTouristSectionDownloads)
  {
    if (xpc_activity_get_state(fTotalTouristSectionDownloads) != 4)
      goto LABEL_23;
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v5 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,Set xpcActivity to Done", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      LOWORD(v17) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 2, "CLGMTPS,Set xpcActivity to Done", &v17, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    if (xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 5))
      goto LABEL_23;
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v6 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      state = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
      *(_DWORD *)buf = 134349056;
      v20 = state;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,failed to mark xpcActivity as Done,XPC error,currentState,%{public}ld", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_23;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v8 = qword_1022A00D8;
    v9 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
    v17 = 134349056;
    v18 = v9;
    LODWORD(v16) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 1, "CLGMTPS,failed to mark xpcActivity as Done,XPC error,currentState,%{public}ld", &v17, v16);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v10);
    if (v11 == buf)
      goto LABEL_23;
LABEL_27:
    free(v11);
    goto LABEL_23;
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v12 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLGMTPS,setXPCActivityToDone,activity is nil", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    LOWORD(v17) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 16, "CLGMTPS,setXPCActivityToDone,activity is nil", &v17, 2);
    v11 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v13);
    if (v11 != buf)
      goto LABEL_27;
  }
LABEL_23:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (BOOL)shouldUseAggressiveSettings
{
  _BYTE v4[164];

  if (*(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController != 2
    || self->fIsCharging && self->fIsWiFiAssociated
    || LOBYTE(self->fGeoMapTilesPreloaderMutex.fMutex._vptr$Mutex)
    || *(double *)&self->fGeoMapTilesPreloaderMutex.fMutex.info > 0.0
    && vabdd_f64(sub_1001FCBB4(), *(double *)&self->fGeoMapTilesPreloaderMutex.fMutex.info) < 3600.0
    || SLODWORD(self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_) < 1)
  {
    return 0;
  }
  -[CLGeoMapTilesPreloaderService getConfigFromMobileAssets](self, "getConfigFromMobileAssets");
  return sub_1013BF300((uint64_t)v4);
}

- (BOOL)isAggressiveSettingDataDownloadLimitCrossed:(const CLMapMatcherGeoTilesPrecachingConfig *)a3 building:(BOOL)a4
{
  CLPersistentStoreData *value;
  uint64_t *v5;
  _BOOL4 v6;
  int v8;
  BOOL v9;
  int v11;
  int var23;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  _DWORD v16[2];
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  if (!self->fIsXPCSettingAggressive)
    return 0;
  value = self->fPersistentStoreData.__ptr_.__value_;
  if (!value)
    return 0;
  v5 = (uint64_t *)*((_QWORD *)value + 16);
  if (!v5)
    return 0;
  v6 = a4;
  while (1)
  {
    v8 = *((_DWORD *)v5 + 8);
    if (v8 <= 6)
      break;
LABEL_8:
    v5 = (uint64_t *)*v5;
    if (!v5)
      return 0;
  }
  if (v8 != 6)
  {
    ++v5;
    goto LABEL_8;
  }
  v11 = sub_1013CD010((uint64_t)value, 6, a4, (double)a3->var24);
  var23 = a3->var23;
  v9 = v11 >= var23;
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v13 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240704;
    v22 = v11;
    v23 = 1026;
    v24 = v6;
    v25 = 1026;
    v26 = v11 >= var23;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CLGMTPS,isAggressiveSettingDataDownloadLimitCrossed,numDownloaded,%{public}d,building,%{public}d,limitCrossed,%{public}d", buf, 0x14u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v16[0] = 67240704;
    v16[1] = v11;
    v17 = 1026;
    v18 = v6;
    v19 = 1026;
    v20 = v11 >= var23;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,isAggressiveSettingDataDownloadLimitCrossed,numDownloaded,%{public}d,building,%{public}d,limitCrossed,%{public}d", v16, 20);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService isAggressiveSettingDataDownloadLimitCrossed:building:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  return v9;
}

- (void)registerForLocationNotification
{
  -[CLGeoMapTilesPreloaderService universe](self, "universe");
  sub_1006AA544();
}

- (void)unregisterForLocationNotification
{
  Client *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  value = self->fLocationClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v3 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForClientManagerNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregisterForClientManagerNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForLocationNotification]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (int)getSectionNotDownloadedYet:()map<int maxSections:()double
{
  int v4;
  int result;
  _DWORD *left;
  int v7;

  if (a4 < 1)
    return -1;
  v4 = 0;
  result = -1;
  do
  {
    if (!a3->var0.var1.var0.__left_)
      return 0;
    left = a3->var0.var1.var0.__left_;
    while (1)
    {
      v7 = left[8];
      if (v4 >= v7)
        break;
LABEL_8:
      left = *(_DWORD **)left;
      if (!left)
        return v4;
    }
    if (v7 < v4)
    {
      left += 2;
      goto LABEL_8;
    }
    ++v4;
  }
  while (v4 != a4);
  return result;
}

- (int)getSectionToBeRefreshed:()map<int maxSections:()double refreshPeriod:()std:(std:(double>>> *)a3 :(int)a4 allocator<std:(int)a5 :pair<const)int :less<int>
{
  double Current;
  double v9;
  int result;
  _DWORD *left;
  int v12;
  double v13;
  int v14;
  int *v15;

  Current = CFAbsoluteTimeGetCurrent();
  v14 = 0;
  if (a4 < 1)
    return -1;
  v9 = Current;
  result = 0;
  while (2)
  {
    left = a3->var0.var1.var0.__left_;
    if (!left)
      goto LABEL_10;
    while (1)
    {
      v12 = left[8];
      if (result >= v12)
        break;
LABEL_7:
      left = *(_DWORD **)left;
      if (!left)
        goto LABEL_10;
    }
    if (v12 < result)
    {
      left += 2;
      goto LABEL_7;
    }
    v15 = &v14;
    v13 = vabdd_f64(*((double *)sub_100041CE0((uint64_t **)a3, &v14, (uint64_t)&unk_101B9EB60, &v15) + 5), v9);
    result = v14;
    if (v13 <= (double)a5)
    {
LABEL_10:
      v14 = ++result;
      if (result >= a4)
        return -1;
      continue;
    }
    return result;
  }
}

- (void)registerForDataProtectionNotification
{
  if (!self->fDataProtectionClient.__ptr_.__value_)
  {
    -[CLGeoMapTilesPreloaderService universe](self, "universe");
    sub_100E35814();
  }
}

- (void)unregisterForDataProtectionNotification
{
  Client *value;
  NSObject *v4;
  Client *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v4 = qword_1022A00D8;
    if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregistered for data protection notifications", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00D0 != -1)
        dispatch_once(&qword_1022A00D0, &stru_1021B3298);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,unregistered for data protection notifications", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForDataProtectionNotification]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    LOBYTE(self->fTimeOfLastWorkoutQuery) = 0;
    v5 = self->fDataProtectionClient.__ptr_.__value_;
    self->fDataProtectionClient.__ptr_.__value_ = 0;
    if (v5)
      (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  }
}

- (uint64_t)onDataProtectionNotification:(int)a3 data:(int)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;

  v7 = a1 + 696;
  (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 696) + 16))(a1 + 696);
  if (!a3)
  {
    if (a4 == 1)
    {
      *(_BYTE *)(a1 + 792) = 1;
      objc_msgSend((id)a1, "fetchWorkoutCount:", 1);
    }
    else
    {
      *(_BYTE *)(a1 + 792) = 0;
    }
  }
  if (qword_1022A00D0 != -1)
    dispatch_once(&qword_1022A00D0, &stru_1021B3298);
  v8 = qword_1022A00D8;
  if (os_log_type_enabled((os_log_t)qword_1022A00D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240448;
    v16 = a3;
    v17 = 1026;
    v18 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,Received dataProtectionManager notification,%{public}d,data availability %{public}d", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00D0 != -1)
      dispatch_once(&qword_1022A00D0, &stru_1021B3298);
    v12[0] = 67240448;
    v12[1] = a3;
    v13 = 1026;
    v14 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00D8, 1, "CLGMTPS,Received dataProtectionManager notification,%{public}d,data availability %{public}d", v12, 14);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDataProtectionNotification:data:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
}

- (void).cxx_destruct
{
  CLPersistentStoreData *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;

  sub_100261F44((uint64_t)&self->fHealthStore);
  sub_100008848((uint64_t)&self->fVehicleMotionTracker, *(_QWORD **)&self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont);
  sub_10055D4D0(&self->fAnalytics.fTotalNPLOISectionDownloads);
  sub_100008848((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (_QWORD *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_);
  sub_10077B518((uint64_t)&self->fMapMatcherMobileAssetReader, (_QWORD *)self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_.__value_.__left_);
  sub_100090AE4((uint64_t)&self->fSettings.fAdditionalCountryConfigs, (char *)self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_.__value_.__left_);
  value = self->fPersistentStoreData.__ptr_.__value_;
  self->fPersistentStoreData.__ptr_.__value_ = 0;
  if (value)
    sub_1013D0F08((uint64_t)&self->fPersistentStoreData, (uint64_t)value);
  v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
  v9 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
  v10 = self->fWiFiServiceClient.__ptr_.__value_;
  self->fWiFiServiceClient.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
}

- (id).cxx_construct
{
  self->fWiFiServiceClient.__ptr_.__value_ = 0;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  self->fLocationClient.__ptr_.__value_ = 0;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  self->fPersistentStoreData.__ptr_.__value_ = 0;
  self->fSettings.fEnabled = 1;
  self->fSettings.fMinimumBatteryLevel = -1;
  self->fSettings.fLongitudeInDeg = 0.0;
  self->fSettings.fRadiusInMeters = 0.0;
  self->fSettings.fLatitudeInDeg = 0.0;
  *(_WORD *)&self->fSettings.fUseMotionStateStationaryAsXPCCriteria = 1;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__pair3_.__value_ = 0;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_.__value_.__left_ = 0;
  self->fSettings.fAddFakeNPLOIData = 0;
  self->fSettings.fMapsBuildingTileStyleToUse = 1;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__begin_node_ = &self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_;
  sub_1002433B8((uint64_t)&self->fDistanceCalc);
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_.__value_.__left_ = 0;
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__begin_node_ = &self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_;
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ = 0;
  self->fMapMatcherMobileAssetReader.fRoadWidthBufferForFitnessUseCase = 5.0;
  *(_WORD *)&self->fMapMatcherMobileAssetReader.fUseMapDataBuffer = 257;
  *(_OWORD *)&self->fMapMatcherMobileAssetReader.fMapsRoadDataBufferRadiusVehicle = xmmword_101C424E0;
  self->fMapMatcherMobileAssetReader.fMapsBuildingDataBufferRadiusBicycle = 125;
  self->fMapMatcherMobileAssetReader.fTrackRunProximityThreshold = 100.0;
  self->fRoutineInfo.fLOICoarseCoordinateRequestMachContTime = -1.0;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_ = 0;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__begin_node_ = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_ = 0;
  self->fRoutineInfo.fLastUserLocation.suitability = 0xFFFF;
  *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4) = 0.0;
  *(_QWORD *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1) = 0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4) = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.altitude + 4) = _Q0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.speed + 4) = _Q0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.course + 4) = _Q0;
  HIDWORD(self->fRoutineInfo.fLastUserLocation.timestamp) = 0;
  LODWORD(self->fRoutineInfo.fLastUserLocation.rawCoordinate.latitude) = 0;
  self->fRoutineInfo.fLastUserLocation.lifespan = 0.0;
  *(_QWORD *)&self->fRoutineInfo.fLastUserLocation.type = 0;
  *(_QWORD *)&self->fRoutineInfo.fLastUserLocation.confidence = 0xBFF0000000000000;
  *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.rawCoordinate.latitude + 4) = -1.0;
  HIDWORD(self->fRoutineInfo.fLastUserLocation.rawCoordinate.longitude) = 0x7FFFFFFF;
  *(_QWORD *)&self->fRoutineInfo.fLastUserLocation.floor = 0;
  *(_QWORD *)&self->fRoutineInfo.fLastUserLocation.referenceFrame = 0;
  self->fRoutineInfo.fLastUserLocation.rawCourse = 0.0;
  LOBYTE(self->fRoutineInfo.fLastUserLocation.signalEnvironmentType) = 0;
  self->fRoutineInfo.fLastUserLocation.ellipsoidalAltitude = -1.0;
  *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController = 0;
  sub_1002433B8((uint64_t)&self->fRoutineInfo.fLastTouristModeQueryMachContTime);
  self->fRoutineInfo.fDistanceCalc.fRefLatDegs = -1.0;
  self->fRoutineInfo.fDistanceCalc.fCosRefLat = -1.0;
  *(_OWORD *)&self->fRoutineInfo.fNPLOIQueryTime = 0u;
  *(_OWORD *)&self->fAnalytics.fXPCCallBackCount = 0u;
  *(_OWORD *)&self->fAnalytics.fDownloadRequestCount = 0u;
  *(_OWORD *)&self->fAnalytics.fTotalRoadTilesCount = 0u;
  sub_10055D44C(&self->fAnalytics.fTotalNPLOISectionDownloads, "CLGeoMapTilesPreloaderMutex", 1, 1);
  LOBYTE(self->fGeoMapTilesPreloaderMutex.fMutex._vptr$Mutex) = 0;
  self->fGeoMapTilesPreloaderMutex.fMutex.info = (MutexInfo *)0xBFF0000000000000;
  self->fTotalTimeSpentDownloadingData.__tree_.__begin_node_ = 0;
  self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont = 0.0;
  *(_QWORD *)&self->fVehicleMotionTracker.fIsInVehicle = &self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont;
  self->fHealthStore = 0;
  *(_QWORD *)&self->fDeviceCurrentlyUnlocked = 0;
  return self;
}

@end
