@implementation CLContextManagerElevationProfile

- (CLContextManagerElevationProfile)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerElevationProfile *v6;
  CLContextManagerElevationProfile *v7;
  CLRoutineMonitorServiceProtocol *v8;
  double v9;
  double v10;
  CLTimer *v11;
  _QWORD v13[6];
  int v14;
  unsigned __int8 v15;
  BOOL v16;
  float v17;
  double v18;
  objc_super v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLContextManagerElevationProfile;
  v6 = -[CLContextManagerElevationProfileBase initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v20, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v19.receiver = v6;
    v19.super_class = (Class)CLContextManagerElevationProfile;
    -[CLContextManagerElevationProfileBase initElevationProfileEstimator:withElevationDbInMemory:](&v19, "initElevationProfileEstimator:withElevationDbInMemory:", v6, 0);
    LOBYTE(v14) = 0;
    sub_1018BF25C(&v15, "ElevationVerbose", (unsigned __int8 *)&v14, 0);
    v7->_isVerboseLogging = v16;
    LOBYTE(v14) = 1;
    sub_1018BF25C(&v15, "EnableHistoricalElevationPushModel", (unsigned __int8 *)&v14, 0);
    v7->_pushModelEnabled = v16;
    sub_1018BEA14(&v15, "MaxPushedElevationPeriod", &qword_101C31A28, 0);
    v7->_maxPushedElevationPeriod = v18;
    v7->_elevationProfileRoutineAdapter = objc_alloc_init(CLElevationProfileRoutineAdapter);
    v8 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(-[CLIntersiloUniverse vendor](v7->super.super._universe, "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    v7->_routineMonitor = v8;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v8, "registerDelegate:inSilo:", v7->_elevationProfileRoutineAdapter, -[CLIntersiloUniverse silo](v7->super.super._universe, "silo"));
    v7->_routineManager = (RTRoutineManager *)objc_alloc_init((Class)RTRoutineManager);
    v7->_lastPushedTime = 0.0;
    -[CLContextManagerElevationProfile retrieveLastPushedTime](v7, "retrieveLastPushedTime");
    v7->_lastPushedTime = v9;
    -[CLContextManagerElevationProfileBase setRegisteredXPCTaskMSLP:](v7, "setRegisteredXPCTaskMSLP:", 0);
    -[CLContextManagerElevationProfileBase setRegisteredXPCTaskElevationProfile:](v7, "setRegisteredXPCTaskElevationProfile:", 0);
    v14 = 1155596288;
    sub_1018C2254(&v15, "ElevationProfilePeriodSeconds", &v14, 0);
    v10 = v17;
    v11 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](v7->super.super._universe, "silo"), "newTimer");
    v7->_scheduleElevationProfile = v11;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100F6FA84;
    v13[3] = &unk_102131360;
    v13[4] = v7;
    *(double *)&v13[5] = v10;
    -[CLTimer setHandler:](v11, "setHandler:", v13);
    if (v7->_pushModelEnabled)
      -[CLTimer setNextFireDelay:](v7->_scheduleElevationProfile, "setNextFireDelay:", v10);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_routineMonitor = 0;
  self->_routineManager = 0;
  -[CLElevationProfileRoutineAdapter invalidate](self->_elevationProfileRoutineAdapter, "invalidate");

  self->_elevationProfileRoutineAdapter = 0;
  -[CLTimer invalidate](self->_scheduleElevationProfile, "invalidate");

  self->_scheduleElevationProfile = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerElevationProfile;
  -[CLContextManagerElevationProfileBase dealloc](&v3, "dealloc");
}

- (void)getStoredVisit:(id)a3 betweenStartTime:(double)a4 andEndTime:(double)a5 withCompletionBlock:(id)a6
{
  NSDate *v11;
  NSDate *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  double v23;
  _QWORD v24[6];
  int v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  NSDate *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  NSDate *v40;
  uint8_t buf[4];
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  NSDate *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  NSDate *v56;

  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4);
    v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a5);
    v13 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v11, v12);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v14 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v42 = COERCE_DOUBLE("startTime");
      v43 = 2048;
      v44 = a4;
      v45 = 2080;
      v46 = "endTime";
      v47 = 2048;
      v48 = a5;
      v49 = 2080;
      v50 = "startDate";
      v51 = 2112;
      v52 = v11;
      v53 = 2080;
      v54 = "endDate";
      v55 = 2112;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "query routine visit with,%s,%f,%s,%f,%s,%@,%s,%@", buf, 0x52u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102195C90);
      v25 = 136316930;
      v26 = COERCE_DOUBLE("startTime");
      v27 = 2048;
      v28 = a4;
      v29 = 2080;
      v30 = "endTime";
      v31 = 2048;
      v32 = a5;
      v33 = 2080;
      v34 = "startDate";
      v35 = 2112;
      v36 = v11;
      v37 = 2080;
      v38 = "endDate";
      v39 = 2112;
      v40 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "query routine visit with,%s,%f,%s,%f,%s,%@,%s,%@", &v25, 82);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    v15 = objc_alloc((Class)RTStoredVisitFetchOptions);
    v16 = objc_msgSend(v15, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh), v13, 0, 0, +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10221C428, &off_10221C440, 0));
    routineMonitor = self->_routineMonitor;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100F703F4;
    v24[3] = &unk_102195BF8;
    v24[4] = a3;
    v24[5] = a6;
    -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:](routineMonitor, "fetchStoredVisitsWithOptions:withReply:", v16, v24);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v18 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v42 = a4;
      v43 = 2048;
      v44 = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "query routine visit with unordered startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102195C90);
      v25 = 134218240;
      v26 = a4;
      v27 = 2048;
      v28 = a5;
      LODWORD(v23) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "query routine visit with unordered startTime,%f,endTime,%f", COERCE_DOUBLE(&v25), v23);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 0x7FFFFFFFLL);
  }
}

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
  -[CLRoutineMonitorServiceProtocol enumerateStoredLocationsWithOptions:withReply:](self->_routineMonitor, "enumerateStoredLocationsWithOptions:withReply:", _NSConcreteStackBlock, 3221225472, sub_100F70EF0, &unk_102195C20, self, a6, objc_autorelease(objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", objc_autorelease(objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:",
              *(_QWORD *)&a5,
              a6,
              *(_QWORD *)&a7,
              a3),
            +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4))), a5, 0, 0.0)), a8);
}

- (void)_sendElevationsFromEstimates:(id)a3 startIndex:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double lastPushedTime;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSDate *v29;
  id v30;
  id v31;
  float v32;
  id v33;
  NSObject *v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  float v39;
  double v40;
  float v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  double v46;
  double v47;
  float v48;
  double v49;
  float v50;
  const char *v51;
  uint8_t *v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint8_t *v57;
  NSObject *v58;
  double v59;
  __int128 v60;
  uint64_t v61;
  _QWORD block[10];
  int v64;
  unint64_t v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  uint8_t buf[4];
  unint64_t v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;

  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_msgSend(a3, "count");
  v11 = a4;
  if (a4 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v11 = a4;
    if ((unint64_t)v9 > a4)
    {
      *(_QWORD *)&v10 = 134350080;
      v60 = v10;
      v61 = 134219008;
      v11 = a4;
      v12 = a4;
      do
      {
        objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
        if (v13 >= 0.0)
        {
          objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
          if (v14 >= 0.0)
          {
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
            v16 = v15;
            if (v12)
            {
              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12 - 1), "timestamp");
              lastPushedTime = v17;
            }
            else
            {
              lastPushedTime = self->_lastPushedTime;
            }
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            v20 = lastPushedTime;
            if (v19 - lastPushedTime > 15.36)
            {
              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
              v20 = v21 + -15.36;
            }
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            if (v20 > v22)
            {
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_102195C90);
              v23 = qword_10229FE88;
              if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
              {
                v24 = self->_lastPushedTime;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                *(_DWORD *)buf = v60;
                v75 = v12;
                v76 = 2050;
                v77 = lastPushedTime;
                v78 = 2050;
                v79 = v24;
                v80 = 2050;
                v81 = v25;
                v82 = 2050;
                v83 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Elevation timestamp rolled back,iteration,%{public}lu,prevTimestamp,%{public}f,lastPushTime,%{public}f,endTime,%{public}f,beginTime,%{public}f", buf, 0x34u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_102195C90);
                v53 = qword_10229FE88;
                v54 = self->_lastPushedTime;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                v64 = v60;
                v65 = v12;
                v66 = 2050;
                v67 = lastPushedTime;
                v68 = 2050;
                v69 = v54;
                v70 = 2050;
                v71 = v55;
                v72 = 2050;
                v73 = v20;
                LODWORD(v59) = 52;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v53, 1, "Elevation timestamp rolled back,iteration,%{public}lu,prevTimestamp,%{public}f,lastPushTime,%{public}f,endTime,%{public}f,beginTime,%{public}f", &v64, *(_QWORD *)&v59);
                v57 = (uint8_t *)v56;
                sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]", "%s\n", v56);
                if (v57 != buf)
                  free(v57);
              }
              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
              v20 = v26 + -15.36;
            }
            v27 = sqrtf(v16);
            v28 = objc_alloc((Class)NSDateInterval);
            v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v20);
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            v30 = objc_msgSend(v28, "initWithStartDate:endDate:", v29, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
            v31 = objc_alloc((Class)RTElevation);
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
            v33 = objc_msgSend(v31, "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v30, 0, v32, v27);
            if (self->_isVerboseLogging)
            {
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_102195C90);
              v34 = qword_10229FE88;
              if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                v36 = v35;
                objc_msgSend(v33, "elevation");
                v38 = v37;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
                v40 = v39;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
                *(_DWORD *)buf = v61;
                v75 = v36;
                v76 = 2048;
                v77 = v38;
                v78 = 2048;
                v79 = v27;
                v80 = 2048;
                v81 = v40;
                v82 = 2048;
                v83 = sqrtf(v41);
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "send elevation profile back to client,timestamp,%f,elevation,%f,elevationUncertainty,%f,mslp,%f,mslpUncertainty,%f", buf, 0x34u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_102195C90);
                v43 = qword_10229FE88;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                v45 = v44;
                objc_msgSend(v33, "elevation");
                v47 = v46;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
                v49 = v48;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
                v64 = v61;
                v65 = v45;
                v66 = 2048;
                v67 = v47;
                v68 = 2048;
                v69 = v27;
                v70 = 2048;
                v71 = v49;
                v72 = 2048;
                v73 = sqrtf(v50);
                LODWORD(v59) = 52;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v43, 2, "send elevation profile back to client,timestamp,%f,elevation,%f,elevationUncertainty,%f,mslp,%f,mslpUncertainty,%f", COERCE_DOUBLE(&v64), v59, *(double *)&v60, *((double *)&v60 + 1), *(double *)&v61);
                v52 = (uint8_t *)v51;
                sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]", "%s\n", v51);
                if (v52 != buf)
                  free(v52);
              }
            }
            objc_msgSend(v8, "addObject:", v33);

            v11 = v12;
          }
        }
        ++v12;
        v42 = objc_msgSend(a3, "count");
      }
      while (v12 < a4 + 100 && v12 < (unint64_t)v42);
    }
  }
  v58 = objc_msgSend(-[CLIntersiloUniverse silo](self->super.super._universe, "silo"), "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100F71C6C;
  block[3] = &unk_102195C70;
  block[4] = self;
  block[5] = v8;
  block[8] = a4;
  block[9] = v11;
  block[6] = a3;
  block[7] = a5;
  dispatch_async(v58, block);
}

- (void)sendElevationsFromEstimates:(id)a3 withCompletionBlock:(id)a4
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  double v23;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  if (objc_msgSend(a3, "count"))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a3, "count");
      objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
      v10 = v9;
      objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
      *(_DWORD *)buf = 134218496;
      v31 = v8;
      v32 = 2048;
      v33 = v10;
      v34 = 2048;
      v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pushing elevations,num,%lu,first timestamp,%f,last timestamp,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102195C90);
      v13 = qword_10229FE88;
      v14 = objc_msgSend(a3, "count");
      objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
      v16 = v15;
      objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
      v24 = 134218496;
      v25 = v14;
      v26 = 2048;
      v27 = v16;
      v28 = 2048;
      v29 = v17;
      LODWORD(v23) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "pushing elevations,num,%lu,first timestamp,%f,last timestamp,%f", &v24, v23);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    -[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:](self, "_sendElevationsFromEstimates:startIndex:withCompletionBlock:", a3, 0, a4);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v12 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = objc_msgSend(a3, "count");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pushing elevations,num,%lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102195C90);
      v20 = qword_10229FE88;
      v24 = 134217984;
      v25 = objc_msgSend(a3, "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "pushing elevations,num,%lu", &v24);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)saveLastPushedTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  double v8;
  int v9;
  double v10;
  uint8_t buf[4];
  double v12;

  v8 = a3;
  v3 = sub_1001FD94C();
  sub_10018A4CC(v3, "CLElevationProfile_LastPushedTimestamp", &v8);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102195C90);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "saved elevation profile push time,%{public}f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v9 = 134349056;
    v10 = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "saved elevation profile push time,%{public}f", &v9, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile saveLastPushedTime:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (double)retrieveLastPushedTime
{
  uint64_t v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  double v7;
  int v8;
  double v9;
  uint8_t buf[4];
  double v11;

  v7 = 0.0;
  v2 = sub_1001FD94C();
  sub_1001FD98C(v2, "CLElevationProfile_LastPushedTimestamp", &v7);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102195C90);
  v3 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "retrieved elevation profile push time,%{public}f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102195C90);
    v8 = 134349056;
    v9 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "retrieved elevation profile push time,%{public}f", &v8, 12);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile retrieveLastPushedTime]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  return v7;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
