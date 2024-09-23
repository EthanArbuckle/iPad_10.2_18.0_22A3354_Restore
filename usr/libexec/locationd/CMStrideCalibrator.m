@implementation CMStrideCalibrator

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    -[CMStrideCalibrationStepCountBuffer feedStepCountUpdate:](self->fStepsBuffer, "feedStepCountUpdate:", a4);
    -[CMStrideCalibrator tick:](self, "tick:", *((double *)a4 + 2));
    -[CMStrideCalLocationFSM feedPedometerData:](self->fStrideCalLocationFSM, "feedPedometerData:", a4);
  }
}

- (void)updateCalibrationBins:(double)a3
{
  NSMutableArray *fLatestCalDataArray;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  double v18;
  double v19;
  unsigned int v20;
  NSObject *v21;
  const char *v22;
  char *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  GPSRawSpeedToKValueTable *ptr;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  unsigned int v37;
  double v38;
  CMStrideCalibrationDatabase *fDatabase;
  uint64_t v40;
  id v41;
  const char *v42;
  char *v43;
  const char *v44;
  char *v45;
  id v46;
  double v47;
  id v48;
  _OWORD v49[7];
  uint64_t v50;
  _OWORD v51[2];
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  _BYTE v59[10];
  double v60;
  _BYTE buf[32];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE v68[128];

  v48 = +[NSMutableArray array](NSMutableArray, "array");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  fLatestCalDataArray = self->fLatestCalDataArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fLatestCalDataArray, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v55;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v55 != v7)
          objc_enumerationMutation(fLatestCalDataArray);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v8);
        objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "start"), "timeIntervalSinceReferenceDate");
        v11 = v10;
        objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "stop"), "timeIntervalSinceReferenceDate");
        v13 = v12;
        v14 = a3 - v12;
        if (a3 - v12 >= 60.0)
        {
          -[CMStrideCalibrationElevationBuffer updateGradient:](self->fElevationBuffer, "updateGradient:", v9);
          objc_msgSend(v48, "addObject:", v9);
          if (v14 < 1800.0)
          {
            if (qword_10229FCD0 != -1)
              dispatch_once(&qword_10229FCD0, &stru_10215A570);
            v15 = qword_10229FCD8;
            if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
            {
              v16 = objc_msgSend(objc_msgSend(v9, "description"), "UTF8String");
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = a3;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CalData, %s, stepEntryEpochTime, %f", buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FCD0 != -1)
                dispatch_once(&qword_10229FCD0, &stru_10215A570);
              v40 = qword_10229FCD8;
              v41 = objc_msgSend(objc_msgSend(v9, "description"), "UTF8String");
              v58 = 136315394;
              *(_QWORD *)v59 = v41;
              *(_WORD *)&v59[8] = 2048;
              v60 = a3;
              LODWORD(v47) = 22;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v40, 2, "CalData, %s, stepEntryEpochTime, %f", (const char *)&v58, v47);
              v43 = (char *)v42;
              sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v42);
              if (v43 != buf)
                free(v43);
            }
            v53 = 0;
            v52 = 0u;
            memset(v51, 0, sizeof(v51));
            sub_100087DE0((uint64_t)self->fStepCountDb.__ptr_, 1, (uint64_t)v51, v11, v13);
            if (objc_msgSend(v9, "gradientValidity"))
            {
              if (!-[CMStrideCalibrator checkValidTrack:associatedEntry:](self, "checkValidTrack:associatedEntry:", objc_msgSend(v9, "track"), v51))goto LABEL_48;
              if (qword_10229FCD0 != -1)
                dispatch_once(&qword_10229FCD0, &stru_10215A570);
              v17 = qword_10229FCD8;
              if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v52;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = DWORD1(v52);
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "FloorsAscended,%d,FloorsDescended,%d", buf, 0xEu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FCD0 != -1)
                  dispatch_once(&qword_10229FCD0, &stru_10215A570);
                v58 = 67109376;
                *(_DWORD *)v59 = v52;
                *(_WORD *)&v59[4] = 1024;
                *(_DWORD *)&v59[6] = DWORD1(v52);
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "FloorsAscended,%d,FloorsDescended,%d", &v58, 14);
                v45 = (char *)v44;
                sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v44);
                if (v45 != buf)
                  free(v45);
              }
              objc_msgSend(objc_msgSend(v9, "track"), "distanceRawPed");
              v19 = v18;
              sub_100197040();
              if (sub_100195F08())
                v20 = -[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession");
              else
                v20 = 0;
              sub_100197040();
              v24 = sub_10019DF90();
              v25 = v19 / (v13 - v11);
              if (!v24)
                goto LABEL_36;
              if (!-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession"))
              {
                v24 = -[CMStrideCalibrator outOfSession](self, "outOfSession");
                if (v24)
                  v24 = -[CMPedometerTableRawSpeedToKValue isRawSpeedRun:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "isRawSpeedRun:", v25);
LABEL_36:
                if ((v20 | v24) != 1)
                  goto LABEL_48;
              }
              v26 = COERCE_DOUBLE(-[CMStrideCalibrationRunningFormBuffer strideLengthFromStartDate:endDate:](self->fFormBuffer, "strideLengthFromStartDate:endDate:", objc_msgSend(objc_msgSend(v9, "track"), "start"), objc_msgSend(objc_msgSend(v9, "track"), "stop")));
              v28 = v27;
              -[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "updateBinsWithTrack:", objc_msgSend(v9, "track"));
              -[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "updateBinsWithTrack:", objc_msgSend(v9, "track"));
              ptr = self->fGPSCalibrationTable.__ptr_;
              if (ptr)
                sub_10040AD28((uint64_t)ptr, objc_msgSend(v9, "track"));
              -[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime](self, "sendGPSCoreAnalyticsAndUpdateTime");
              v67 = 0;
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              *(_OWORD *)&buf[16] = 0u;
              v62 = 0u;
              *(_QWORD *)buf = 0;
              *(double *)&buf[8] = v11;
              -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "kValueForRawSpeed:", v25);
              *(_QWORD *)&buf[24] = v30;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceGps");
              v32 = v31;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceRawPed");
              v62 = COERCE_UNSIGNED_INT64(v32 / v33);
              *(double *)&v63 = v13;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceGps");
              *((_QWORD *)&v63 + 1) = v34;
              objc_msgSend(objc_msgSend(v9, "track"), "steps");
              LODWORD(v64) = (int)v35;
              DWORD1(v64) = objc_msgSend(v9, "session");
              *((double *)&v64 + 1) = v25;
              objc_msgSend(v9, "gradient");
              *(_QWORD *)&v65 = v36;
              v37 = objc_msgSend(objc_msgSend(v9, "track"), "gpsSource");
              v38 = v26;
              DWORD2(v65) = v37;
              *(_QWORD *)&v66 = 0;
              if ((v28 & (unint64_t)&_mh_execute_header) == 0)
                v38 = 0.0;
              *((double *)&v66 + 1) = v38;
              LODWORD(v67) = v28;
              if (self->fLogPedometer)
              {
                sub_10163B664((uint64_t)buf, (uint64_t)&v58);
                if (qword_1023118A8 != -1)
                  dispatch_once(&qword_1023118A8, &stru_10215A590);
                if (qword_1023118B0)
                  operator new();
                PB::Base::~Base((PB::Base *)&v58);
              }
              fDatabase = self->fDatabase;
              v49[4] = v64;
              v49[5] = v65;
              v49[6] = v66;
              v50 = v67;
              v49[0] = *(_OWORD *)buf;
              v49[1] = *(_OWORD *)&buf[16];
              v49[2] = v62;
              v49[3] = v63;
              -[CMStrideCalibrationDatabase addEntry:](fDatabase, "addEntry:", v49);
              -[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:](self->fStats, "awdMotionFitnessStrideCalibration:", buf);
              -[CMStrideCalibrationStats awdLogDistance:status:description:](self->fStats, "awdLogDistance:status:description:", 0, CFSTR("Yay!"), *((double *)v51 + 1));
              goto LABEL_48;
            }
            -[CMStrideCalibrationStats awdLogDistance:status:description:](self->fStats, "awdLogDistance:status:description:", 4, CFSTR("GradientOutOfBounds"), *((double *)v51 + 1));
            if (qword_10229FCD0 != -1)
              dispatch_once(&qword_10229FCD0, &stru_10215A570);
            v21 = qword_10229FCD8;
            if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v13;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,Gradient,DistanceFusion,startTime,%f,endTime,%f", buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FCD0 != -1)
                dispatch_once(&qword_10229FCD0, &stru_10215A570);
              v58 = 134218240;
              *(double *)v59 = v11;
              *(_WORD *)&v59[8] = 2048;
              v60 = v13;
              LODWORD(v47) = 22;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "SessionMetrics,Fail,Gradient,DistanceFusion,startTime,%f,endTime,%f", COERCE_DOUBLE(&v58), v47);
              v23 = (char *)v22;
              sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v22);
              if (v23 != buf)
                free(v23);
            }
          }
        }
LABEL_48:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fLatestCalDataArray, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      v6 = v46;
    }
    while (v46);
  }
  -[NSMutableArray removeObjectsInArray:](self->fLatestCalDataArray, "removeObjectsInArray:", v48);
}

- (void)tick:(double)a3
{
  -[CMStrideCalibrator updateCalibrationBins:](self, "updateCalibrationBins:", a3);
  -[CMStrideCalibrator checkForLocationStateTransition](self, "checkForLocationStateTransition");
  -[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration](self, "checkTimeToSendNewCAGPSCalibration");
}

- (BOOL)outOfSession
{
  return self->fCurrentSession == 0;
}

- (BOOL)inOutdoorPedestrianSession
{
  return (self->fCurrentSession < 0x19uLL) & (0x1028000u >> self->fCurrentSession);
}

- (void)checkForLocationStateTransition
{
  int v3;
  NSObject *v4;
  int64_t fCurrentSession;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  int64_t v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  unsigned int v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint8_t *v22;
  int v23;
  int64_t v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  int64_t v28;
  __int16 v29;
  id v30;

  v3 = -[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState");
  if (-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession") && v3 <= 2)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v4 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218242;
      v28 = fCurrentSession;
      v29 = 2080;
      v30 = objc_msgSend(+[CMWorkout workoutName:](CMWorkout, "workoutName:", fCurrentSession), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "ForcingLocationDueToGizmoRequest,session,%ld,%s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v10 = qword_10229FCD8;
      v11 = self->fCurrentSession;
      v12 = objc_msgSend(+[CMWorkout workoutName:](CMWorkout, "workoutName:", v11), "UTF8String");
      v23 = 134218242;
      v24 = v11;
      v25 = 2080;
      v26 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "ForcingLocationDueToGizmoRequest,session,%ld,%s", &v23, 22);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 3);
  }
  else
  {
    sub_100197040();
    if ((sub_100195F08() & 1) == 0
      && -[CMStrideCalibrator outOfSession](self, "outOfSession")
      && -[CMStrideCalibrationActivityBuffer isRunningStateInWindow](self->fActivityBuffer, "isRunningStateInWindow"))
    {
      if (v3 >= 2)
      {
        if (v3 > 2)
          return;
      }
      else if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") >= 0xB)
      {
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v6 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          v7 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "StepRunNotification,Pass,LeechingLocation,Steps,%d", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FCD0 != -1)
            dispatch_once(&qword_10229FCD0, &stru_10215A570);
          v19 = qword_10229FCD8;
          v20 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          v23 = 67109120;
          LODWORD(v24) = v20;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "StepRunNotification,Pass,LeechingLocation,Steps,%d", &v23);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 2);
      }
      if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") >= 0x65)
      {
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v8 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          v9 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "StepRunNotification,Pass,AttemptingToForceLocation,Steps,%d", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FCD0 != -1)
            dispatch_once(&qword_10229FCD0, &stru_10215A570);
          v15 = qword_10229FCD8;
          v16 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          v23 = 67109120;
          LODWORD(v24) = v16;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 2, "StepRunNotification,Pass,AttemptingToForceLocation,Steps,%d", &v23);
          v18 = (uint8_t *)v17;
          sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v17);
          if (v18 != buf)
            free(v18);
        }
        -[CMStrideCalibrator attemptForcedLocation](self, "attemptForcedLocation");
      }
    }
  }
}

- (id)initInUniverse:(id)a3 stepCountDb:(shared_ptr<CLStepCountRecorderDb>)a4
{
  uint64_t *ptr;
  char *v7;
  CMStrideCalLocationFSM *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  NSObject *v14;
  id v15;
  CMStrideCalibrationDatabase *v16;
  uint64_t v17;
  NSObject *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  const char *v23;
  uint8_t *v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  unsigned __int8 v30[16];
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[5];
  unsigned __int8 v34;
  objc_super v35;
  uint8_t buf[1640];

  ptr = (uint64_t *)a4.__ptr_;
  sub_100197040();
  if (sub_10019DF90() || (sub_100197040(), (sub_100195F08() & 1) != 0))
  {
    v35.receiver = self;
    v35.super_class = (Class)CMStrideCalibrator;
    v7 = -[CMStrideCalibrator init](&v35, "init");
    if (!v7)
      return v7;
    *((_QWORD *)v7 + 11) = a3;
    sub_100349198((_QWORD *)v7 + 21, ptr);
    *((_QWORD *)v7 + 35) = 0;
    -[CMPedometerTableRawSpeedToKValue logBins](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "logBins");
    -[CMPedometerTableStepCadenceToStrideLength logBins](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "logBins");
    v8 = objc_alloc_init(CMStrideCalLocationFSM);
    *((_QWORD *)v7 + 19) = v8;
    -[CMStrideCalLocationFSM setDelegate:](v8, "setDelegate:", v7);
    *(_OWORD *)(v7 + 184) = xmmword_101BE58F0;
    *(_OWORD *)(v7 + 200) = unk_101BE5900;
    *(_OWORD *)(v7 + 216) = xmmword_101BE5910;
    *(_OWORD *)(v7 + 228) = *(__int128 *)((char *)&xmmword_101BE5910 + 12);
    sub_100197040();
    if (sub_100195F08())
    {
      v30[0] = 1;
      v34 = 1;
      sub_1008B8B9C(v30, &v34, buf);
      sub_1002B7674((uint64_t)(v7 + 256), (__int128 *)buf);
      v9 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        goto LABEL_18;
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      sub_1002B7674((uint64_t)(v7 + 256), (__int128 *)buf);
      v9 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v11 = __ldaxr(v13);
        while (__stlxr(v11 - 1, v13));
LABEL_18:
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    *((CFAbsoluteTime *)v7 + 31) = CFAbsoluteTimeGetCurrent();
    *((_QWORD *)v7 + 14) = objc_alloc_init(CMStrideCalibrationElevationBuffer);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v14 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AutomaticStrideCalibration,Pass,CreatingDaemonCacheForCalibrationBins", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      LOWORD(v31) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AutomaticStrideCalibration,Pass,CreatingDaemonCacheForCalibrationBins", &v31, 2);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    sub_100197040();
    if (sub_100195F08())
    {
      *((_QWORD *)v7 + 17) = objc_alloc_init(CMStrideCalibrationStats);
    }
    else
    {
      sub_100197040();
      if ((sub_1001B7910() & 0x2000000) != 0)
      {
        *((_QWORD *)v7 + 13) = objc_alloc_init(CMStrideCalibrationActivityBuffer);
        v15 = objc_msgSend(objc_msgSend(*((id *)v7 + 11), "silo"), "newTimer");
        *((_QWORD *)v7 + 12) = v15;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1008B63F8;
        v33[3] = &unk_10212BB58;
        v33[4] = v7;
        objc_msgSend(v15, "setHandler:", v33);
      }
    }
    sub_100197040();
    if ((sub_1001B7910() & 0x2000000) != 0)
    {
      *((_QWORD *)v7 + 20) = objc_alloc_init((Class)NSMutableArray);
      *((_QWORD *)v7 + 16) = objc_alloc_init(CMStrideCalibrationStepCountBuffer);
      v16 = -[CMStrideCalibrationDatabase initWithSilo:]([CMStrideCalibrationDatabase alloc], "initWithSilo:", objc_msgSend(*((id *)v7 + 11), "silo"));
      *((_QWORD *)v7 + 18) = v16;
      -[CMStrideCalibrationDatabase setDelegate:](v16, "setDelegate:", v7);
      objc_msgSend(*((id *)v7 + 18), "registerStrideCalDbForColdStorage:", objc_msgSend(objc_msgSend(*((id *)v7 + 11), "vendor"), "proxyForService:", CFSTR("CMHealthColdStorageService")));
    }
    if (+[CMStrideCalibrationRunningFormBuffer isAvailable](CMStrideCalibrationRunningFormBuffer, "isAvailable"))
    {
      *((_QWORD *)v7 + 15) = objc_alloc_init(CMStrideCalibrationRunningFormBuffer);
    }
    objc_msgSend(v7, "setupCLNotifiers");
    v7[288] = 0;
    v17 = sub_100127B9C();
    sub_100081C10(v17, &v31);
    sub_1001E4874(v31, "MotionLoggerLogPedometer", (BOOL *)v7 + 288);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v18 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "AutomaticStrideCalibration,Success,AllChecksPassed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      *(_WORD *)v30 = 0;
      LODWORD(v29) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AutomaticStrideCalibration,Success,AllChecksPassed", v30, v29);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    v19 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    return v7;
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v12 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Not companion or watch. Returning.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    LOWORD(v31) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Not companion or watch. Returning.", &v31, 2);
    v28 = (uint8_t *)v27;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v27);
    if (v28 != buf)
      free(v28);
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CMStrideCalibrator teardownCLNotifiers](self, "teardownCLNotifiers");
  -[CLTimer invalidate](self->fStopOpportunisticCalibrationTimer, "invalidate");

  self->fStopOpportunisticCalibrationTimer = 0;
  sub_100346F9C(&self->fStepCountDb.__ptr_);
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalibrator;
  -[CMStrideCalibrator dealloc](&v3, "dealloc");
}

- (void)setSession:(int64_t)a3
{
  NSObject *v5;
  int64_t fCurrentSession;
  int64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  int64_t v13;
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  int64_t v17;

  if (self->fCurrentSession != a3)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v5 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218240;
      v15 = fCurrentSession;
      v16 = 2048;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setSession,oldSession,%ld,newSession,%ld", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v7 = self->fCurrentSession;
      v10 = 134218240;
      v11 = v7;
      v12 = 2048;
      v13 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "setSession,oldSession,%ld,newSession,%ld", &v10, 22);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator setSession:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    self->fCurrentSession = a3;
    if (!-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession"))
      -[CMStrideCalibrator quitForcedLocationState](self, "quitForcedLocationState");
    -[CMStrideCalibrator checkForLocationStateTransition](self, "checkForLocationStateTransition");
  }
}

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  return -[CMStrideCalibrationDatabase isCalibrationConvergedMedianForSpeed:](self->fDatabase, "isCalibrationConvergedMedianForSpeed:", a3);
}

- (void)addLatestCalData:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "A new calData is added: %s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v6 = qword_10229FCD8;
    v9 = 136315138;
    v10 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "A new calData is added: %s", (const char *)&v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator addLatestCalData:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[NSMutableArray addObject:](self->fLatestCalDataArray, "addObject:", a3);
}

- (void)checkTimeToSendNewCAGPSCalibration
{
  double Current;
  NSObject *v4;
  double lastGPSCalibrationUpdateTime;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  double v9;
  const char *v10;
  uint8_t *v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v4 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      lastGPSCalibrationUpdateTime = self->lastGPSCalibrationUpdateTime;
      *(_DWORD *)buf = 134218496;
      v20 = lastGPSCalibrationUpdateTime;
      v21 = 2048;
      v22 = Current;
      v23 = 2048;
      v24 = Current - lastGPSCalibrationUpdateTime;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Checking send time in checkTimeToSendNewCAGPSCalibration: LastTime: %0.3f, CurrentTime: %0.3f, Difference: %0.3f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v9 = self->lastGPSCalibrationUpdateTime;
      v13 = 134218496;
      v14 = v9;
      v15 = 2048;
      v16 = Current;
      v17 = 2048;
      v18 = Current - v9;
      LODWORD(v12) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Checking send time in checkTimeToSendNewCAGPSCalibration: LastTime: %0.3f, CurrentTime: %0.3f, Difference: %0.3f", COERCE_DOUBLE(&v13), v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    if (Current - self->lastGPSCalibrationUpdateTime >= 28800.0)
      -[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime](self, "sendGPSCoreAnalyticsAndUpdateTime");
  }
  else
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v6 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Not sending gps core analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      LOWORD(v13) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Not sending gps core analytics, no IHA permission", &v13, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (int64_t)currentSession
{
  return self->fCurrentSession;
}

- (void)attemptForcedLocation
{
  double Current;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  double v15;
  int v16;
  double v17;
  uint8_t buf[4];
  double v19;

  if (!-[CMStrideCalibrator outOfSession](self, "outOfSession"))
    sub_10190DBC4();
  Current = CFAbsoluteTimeGetCurrent();
  v15 = Current;
  v4 = sub_1001FD94C();
  if (sub_1001FD98C(v4, "StrideCalibrationLastCalibration", &v15) && Current - v15 < 2400.0)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v5 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v19 = Current - v15;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationSuccess,TimeSinceLastCalibrationSuccess,%0.3f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v16 = 134217984;
      v17 = Current - v15;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationSuccess,TimeSinceLastCalibrationSuccess,%0.3f");
LABEL_32:
      v11 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v6);
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    v7 = sub_1001FD94C();
    if (sub_1001FD98C(v7, "StrideCalibrationLastCalibrationAttempt", &v15) && Current - v15 < 1200.0)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v8 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v19 = Current - v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationAttempt,TimeSinceLastCalibrationAttempt,%0.3f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v16 = 134217984;
        v17 = Current - v15;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationAttempt,TimeSinceLastCalibrationAttempt,%0.3f");
        goto LABEL_32;
      }
    }
    else
    {
      v9 = sub_1001FD94C();
      if (sub_1001FD98C(v9, "LastStrideCalibrationConverge", &v15) && Current - v15 < 2592000.0)
      {
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v10 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v19 = Current - v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastConverged,TimeSinceLastCalibrationAttempt,%0.3f", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FCD0 != -1)
            dispatch_once(&qword_10229FCD0, &stru_10215A570);
          v16 = 134217984;
          v17 = Current - v15;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastConverged,TimeSinceLastCalibrationAttempt,%0.3f");
          goto LABEL_32;
        }
      }
      else
      {
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v12 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Success,AllChecksPassed", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FCD0 != -1)
            dispatch_once(&qword_10229FCD0, &stru_10215A570);
          LOWORD(v16) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "AttemptForcedLocation,Success,AllChecksPassed", &v16, 2);
          v14 = (uint8_t *)v13;
          sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v13);
          if (v14 != buf)
            free(v14);
        }
        -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 3);
      }
    }
  }
}

- (void)quitForcedLocationState
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (-[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState") == 3)
  {
    v3 = sub_1001FD94C();
    *(_QWORD *)buf = CFAbsoluteTimeGetCurrent();
    sub_10018A4CC(v3, "StrideCalibrationLastCalibrationAttempt", buf);
    -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 2);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v4 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Terminated forced calibration.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Terminated forced calibration.", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator quitForcedLocationState]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)getSpdToKTable
{
  GPSRawSpeedToKValueTable **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable> result;

  cntrl = self->fGPSCalibrationTable.__cntrl_;
  *v2 = self->fGPSCalibrationTable.__ptr_;
  v2[1] = (GPSRawSpeedToKValueTable *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (GPSRawSpeedToKValueTable *)self;
  return result;
}

- (void)strideCalibrationDatabase:(id)a3 didInsertEntry:(CLStrideCalEntry *)a4
{
  uint64_t v6;
  void (**v7)(id, _OWORD *);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[7];
  uint64_t v12;
  CFAbsoluteTime Current;

  if (objc_msgSend(a3, "isCalibrationConvergedStdForBinWithSpeed:", a4->speed))
  {
    v6 = sub_1001FD94C();
    Current = CFAbsoluteTimeGetCurrent();
    sub_10018A4CC(v6, "LastStrideCalibrationConverge", &Current);
  }
  -[CMStrideCalibrationStats activityLoggerLogStrideCalEntry:](self->fStats, "activityLoggerLogStrideCalEntry:", a4);
  if (-[CMStrideCalibrator calibrationTrackCallback](self, "calibrationTrackCallback"))
  {
    v7 = -[CMStrideCalibrator calibrationTrackCallback](self, "calibrationTrackCallback");
    v8 = *(_OWORD *)&a4->percentGrade;
    v11[4] = *(_OWORD *)&a4->steps;
    v11[5] = v8;
    v11[6] = *(_OWORD *)&a4->timestamp;
    v12 = *(_QWORD *)&a4->runningFormStrideLengthMetrics;
    v9 = *(_OWORD *)&a4->endTime;
    v11[2] = *(_OWORD *)&a4->kvalueTrack;
    v11[3] = v9;
    v10 = *(_OWORD *)&a4->pacebin;
    v11[0] = *(_OWORD *)&a4->recordId;
    v11[1] = v10;
    v7[2](v7, v11);
  }
}

- (void)fsm:(id)a3 didTransitionFromState:(int)a4 toState:(int)a5
{
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v8 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v15 = a4;
    v16 = 1024;
    v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LocationStateOld,%d,LocationStateNew,%d", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v11[0] = 67109376;
    v11[1] = a4;
    v12 = 1024;
    v13 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "LocationStateOld,%d,LocationStateNew,%d", v11, 14);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didTransitionFromState:toState:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (a5 <= 1)
  {
    -[CMStrideCalibrator stopLeechingLocation](self, "stopLeechingLocation");
    -[CMStrideCalibrator stopGpsOdometerSpectatorUpdates](self, "stopGpsOdometerSpectatorUpdates");
    -[CMStrideCalibrator stopElevationSpectatorUpdates](self, "stopElevationSpectatorUpdates");
    goto LABEL_11;
  }
  self->fLastGoodLocFix = CFAbsoluteTimeGetCurrent();
  -[CMStrideCalibrator startLeechingLocation](self, "startLeechingLocation");
  -[CMStrideCalibrator startGpsOdometerSpectatorUpdates](self, "startGpsOdometerSpectatorUpdates");
  -[CMStrideCalibrator startElevationSpectatorUpdates](self, "startElevationSpectatorUpdates");
  if (a5 == 2)
  {
LABEL_11:
    -[CMStrideCalibrator stopLocationUpdates](self, "stopLocationUpdates");
    -[CMStrideCalibrator stopGpsOdometerUpdates](self, "stopGpsOdometerUpdates");
    -[CMStrideCalibrator stopElevationUpdates](self, "stopElevationUpdates");
    return;
  }
  -[CMStrideCalibrator startLocationUpdates](self, "startLocationUpdates");
  -[CMStrideCalibrator startGpsOdometerUpdates](self, "startGpsOdometerUpdates");
  -[CMStrideCalibrator startElevationUpdates](self, "startElevationUpdates");
  if (-[CMStrideCalibrator outOfSession](self, "outOfSession"))
    -[CLTimer setNextFireDelay:](self->fStopOpportunisticCalibrationTimer, "setNextFireDelay:", 360.0);
}

- (void)fsm:(id)a3 didYieldTrack:(id)a4
{
  uint64_t v6;
  CMStrideCalDataContainer *v7;
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  v6 = sub_1001FD94C();
  sub_10018A4CC(v6, "StrideCalibrationLastCalibration", &Current);
  v7 = -[CMStrideCalDataContainer initWithTrack:session:]([CMStrideCalDataContainer alloc], "initWithTrack:session:", a4, -[CMStrideCalibrator currentSession](self, "currentSession"));
  -[CMStrideCalibrator addLatestCalData:](self, "addLatestCalData:", v7);

}

- (void)fsm:(id)a3 didUpdateLocationAtTime:(double)a4
{
  int v5;
  double Current;
  BOOL v7;
  int v8;
  NSObject *v9;
  double v10;
  double v11;
  const char *v12;
  uint8_t *v13;
  CMStrideCalibrationStepCountBuffer **p_fStepsBuffer;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint8_t *v27;
  double v28;
  int v29;
  double v30;
  uint8_t buf[4];
  double v32;

  -[CMStrideCalibrator tickleArrow](self, "tickleArrow", a3, a4);
  if (-[CMStrideCalibrator outOfSession](self, "outOfSession"))
  {
    v5 = -[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState");
    Current = CFAbsoluteTimeGetCurrent();
    v28 = Current;
    v7 = Current - self->fLastGoodLocFix > 30.0 && v5 == 3;
    v8 = v7;
    if (v7)
    {
      -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 2);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v9 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        v10 = Current - self->fLastGoodLocFix;
        *(_DWORD *)buf = 134217984;
        v32 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,LocationTimeout,TimeSinceLastPosition,%0.3f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v11 = Current - self->fLastGoodLocFix;
        v29 = 134217984;
        v30 = v11;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "TrackClose,Pass,LocationTimeout,TimeSinceLastPosition,%0.3f", COERCE_DOUBLE(&v29));
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
LABEL_20:
      p_fStepsBuffer = &self->fStepsBuffer;
      if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") <= 0x63)
      {
        -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 2);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v15 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          v16 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](*p_fStepsBuffer, "stepsInWindow");
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,ForcedNotSufficientSteps,Steps,%d", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FCD0 != -1)
            dispatch_once(&qword_10229FCD0, &stru_10215A570);
          v24 = qword_10229FCD8;
          v25 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](*p_fStepsBuffer, "stepsInWindow");
          v29 = 67109120;
          LODWORD(v30) = v25;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "TrackClose,Pass,ForcedNotSufficientSteps,Steps,%d", &v29);
          v27 = (uint8_t *)v26;
          sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v26);
          if (v27 != buf)
            free(v27);
        }
        v8 = 1;
      }
      if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](*p_fStepsBuffer, "stepsInWindow") >= 0xA)
      {
        if (!v8)
          return;
        goto LABEL_38;
      }
LABEL_28:
      -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 1);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v17 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        v18 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](*p_fStepsBuffer, "stepsInWindow");
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,EnabledNotSufficientSteps,Steps,%d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10215A570);
        v19 = qword_10229FCD8;
        v20 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](*p_fStepsBuffer, "stepsInWindow");
        v29 = 67109120;
        LODWORD(v30) = v20;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "TrackClose,Pass,EnabledNotSufficientSteps,Steps,%d", &v29);
        v22 = (uint8_t *)v21;
        sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v21);
        if (v22 != buf)
          free(v22);
      }
LABEL_38:
      v23 = sub_1001FD94C();
      sub_10018A4CC(v23, "StrideCalibrationLastCalibrationAttempt", &v28);
      return;
    }
    if (v5 >= 3)
      goto LABEL_20;
    if (v5 == 2)
    {
      p_fStepsBuffer = &self->fStepsBuffer;
      if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") <= 9)
        goto LABEL_28;
    }
  }
}

- (BOOL)checkValidTrack:(id)a3 associatedEntry:(const CLStepDistance *)a4
{
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
  NSObject *v19;
  CMStrideCalibrationStats *fStats;
  double var1;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  double v27;
  double v28;
  CMStrideCalibrationStats *v29;
  double v30;
  NSObject *v31;
  double v32;
  const char *v33;
  NSObject *v34;
  double v35;
  uint8_t *v36;
  const char *v37;
  uint8_t *v38;
  const char *v39;
  uint8_t *v40;
  uint64_t v41;
  const char *v42;
  uint8_t *v43;
  double v45;
  int v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  uint8_t buf[4];
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;

  objc_msgSend(objc_msgSend(a3, "start"), "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(objc_msgSend(a3, "stop"), "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(a3, "distanceRawPed");
  if (v11 <= 0.0)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v19 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v57 = v8;
      v58 = 2048;
      v59 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,Pedometer distance is zero,startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v46 = 134218240;
      v47 = v8;
      v48 = 2048;
      v49 = v10;
      LODWORD(v45) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "TrackCalibration,Fail,Pedometer distance is zero,startTime,%f,endTime,%f", COERCE_DOUBLE(&v46), v45);
      v38 = (uint8_t *)v37;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v37);
      if (v38 != buf)
        free(v38);
    }
    fStats = self->fStats;
    var1 = a4->var1;
    v22 = CFSTR("ZeroDistance");
    v23 = 7;
    goto LABEL_22;
  }
  objc_msgSend(a3, "distanceRawPed");
  v13 = v12 / (v10 - v8);
  if (!-[CMPedometerTableRawSpeedToKValue isRawSpeedValid:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "isRawSpeedValid:", v13))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v24 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v57 = v13;
      v58 = 2048;
      v59 = v8;
      v60 = 2048;
      v61 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,rawSpeed %f out of bounds,startTime,%f,endTime,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      v46 = 134218496;
      v47 = v13;
      v48 = 2048;
      v49 = v8;
      v50 = 2048;
      v51 = v10;
      LODWORD(v45) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "TrackCalibration,Fail,rawSpeed %f out of bounds,startTime,%f,endTime,%f", COERCE_DOUBLE(&v46), v45);
      v40 = (uint8_t *)v39;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v39);
      if (v40 != buf)
        free(v40);
    }
    fStats = self->fStats;
    var1 = a4->var1;
    v22 = CFSTR("SpeedOutOfBounds");
    v23 = 6;
LABEL_22:
    -[CMStrideCalibrationStats awdLogDistance:status:description:](fStats, "awdLogDistance:status:description:", v23, v22, var1);
LABEL_23:
    LOBYTE(v25) = 0;
    return v25;
  }
  objc_msgSend(a3, "distanceGps");
  v15 = v14;
  objc_msgSend(a3, "distanceRawPed");
  v17 = v15 / v16;
  sub_100197040();
  if (sub_100195F08())
  {
    if (v17 <= 1.4 && v17 >= 0.5)
      goto LABEL_27;
  }
  else if (v17 <= 2.0 && v17 >= 0.666666667)
  {
LABEL_27:
    LOBYTE(v25) = 1;
    return v25;
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v26 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v57 = COERCE_DOUBLE(objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    v58 = 2048;
    v59 = v17;
    v60 = 2048;
    v61 = v13;
    v62 = 2048;
    v63 = v8;
    v64 = 2048;
    v65 = v10;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,KFactorOutOfBounds,%s,KFactor,%0.4f,RawSpeed,%f,startTime,%f,endTime,%f", buf, 0x34u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v41 = qword_10229FCD8;
    v46 = 136316162;
    v47 = COERCE_DOUBLE(objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    v48 = 2048;
    v49 = v17;
    v50 = 2048;
    v51 = v13;
    v52 = 2048;
    v53 = v8;
    v54 = 2048;
    v55 = v10;
    LODWORD(v45) = 52;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v41, 2, "TrackCalibration,Fail,KFactorOutOfBounds,%s,KFactor,%0.4f,RawSpeed,%f,startTime,%f,endTime,%f", (const char *)&v46, v45);
    v43 = (uint8_t *)v42;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v42);
    if (v43 != buf)
      free(v43);
  }
  -[CMStrideCalibrationStats awdLogDistance:status:description:](self->fStats, "awdLogDistance:status:description:", 5, CFSTR("GainOutOfBounds"), a4->var1);
  objc_msgSend(a3, "distanceGps");
  v28 = v27;
  v29 = self->fStats;
  v30 = a4->var1;
  if (v28 >= 70.0)
  {
    -[CMStrideCalibrationStats awdLogDistance:status:description:](v29, "awdLogDistance:status:description:", 3, CFSTR("GainOutOfBounds"), v30);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v34 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v35 = a4->var1;
      *(_DWORD *)buf = 134218496;
      v57 = v35;
      v58 = 2048;
      v59 = v8;
      v60 = 2048;
      v61 = v10;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,Pedometer,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f", buf, 0x20u);
    }
    v25 = sub_1001BFF7C(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "SessionMetrics,Fail,Pedometer,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f");
      goto LABEL_50;
    }
  }
  else
  {
    -[CMStrideCalibrationStats awdLogDistance:status:description:](v29, "awdLogDistance:status:description:", 2, CFSTR("GainOutOfBounds"), v30);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v31 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v32 = a4->var1;
      *(_DWORD *)buf = 134218496;
      v57 = v32;
      v58 = 2048;
      v59 = v8;
      v60 = 2048;
      v61 = v10;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,GPS,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f", buf, 0x20u);
    }
    v25 = sub_1001BFF7C(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10215A570);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "SessionMetrics,Fail,GPS,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f");
LABEL_50:
      v36 = (uint8_t *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v33);
      if (v36 != buf)
        free(v36);
      goto LABEL_23;
    }
  }
  return v25;
}

- (void)sendGPSCoreAnalyticsAndUpdateTime
{
  NSObject *v3;
  GPSRawSpeedToKValueTable *ptr;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v3 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Correctly sending core analytics and updating latest time in gps calibration", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Correctly sending core analytics and updating latest time in gps calibration", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  self->lastGPSCalibrationUpdateTime = CFAbsoluteTimeGetCurrent();
  ptr = self->fGPSCalibrationTable.__ptr_;
  if (ptr)
    sub_10040B92C((uint64_t)ptr, &self->fCLBodyMetrics.gender);
}

- (void)updateUserHeight:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Correctly calling update user height in stride calibrator.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Correctly calling update user height in stride calibrator.", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator updateUserHeight:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[CMStrideCalibrationStats updateUserHeight:](self->fStats, "updateUserHeight:", a3);
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  NSObject *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10215A570);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Correctly feeding body metrics in stride calibrator.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10215A570);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Correctly feeding body metrics in stride calibrator.", v11, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator feedBodyMetrics:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v6 = *(_OWORD *)&a3->gender;
  v7 = *(_OWORD *)&a3->vo2max;
  v8 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->fCLBodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->fCLBodyMetrics.hronset = v8;
  *(_OWORD *)&self->fCLBodyMetrics.vo2max = v7;
  *(_OWORD *)&self->fCLBodyMetrics.gender = v6;
  -[CMStrideCalibrator updateUserHeight:](self, "updateUserHeight:", llroundf(a3->heightM * 100.0));
}

- (id)copyHistory
{
  return -[CMStrideCalibrationDatabase copyHistory](self->fDatabase, "copyHistory");
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return -[CMStrideCalibrationDatabase queryStrideLengthTracks:](self->fDatabase, "queryStrideLengthTracks:", a3);
}

- (id)calibrationTrackCallback
{
  return self->_calibrationTrackCallback;
}

- (void)setCalibrationTrackCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
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

  sub_100261F44((uint64_t)&self->fGPSCalibrationTable);
  sub_100261F44((uint64_t)&self->fStepCountDb);
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->fMotionStateClient.__ptr_.__value_;
  self->fMotionStateClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->fStreamingAwareLocationClient.__ptr_.__value_;
  self->fStreamingAwareLocationClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
  v9 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 33) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

- (void)onMotionStateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
    -[CMStrideCalibrationActivityBuffer feedMotionStateData:](self->fActivityBuffer, "feedMotionStateData:", a4);
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v6;

  v6 = *a3;
  if (*a3 == 7)
  {
    -[CMStrideCalibrationElevationBuffer feedElevationData:](self->fElevationBuffer, "feedElevationData:", a4);
    v6 = *a3;
  }
  if (v6 == 4)
    -[CMStrideCalLocationFSM feedGpsOdometerData:](self->fStrideCalLocationFSM, "feedGpsOdometerData:", a4);
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[4];
  uint8_t buf[4];
  int v15;

  -[CMStrideCalibrator authorizeLocationInReplay](self, "authorizeLocationInReplay");
  v7 = *a3;
  if (*a3)
  {
    if (v7 == 14)
    {
      -[CMStrideCalibrator checkLocationAuthorization](self, "checkLocationAuthorization");
    }
    else if (v7 == 5)
    {
      -[CMStrideCalLocationFSM feedLocationData:](self->fStrideCalLocationFSM, "feedLocationData:", a4);
    }
    else
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217FB00);
      v8 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *a3;
        *(_DWORD *)buf = 67109120;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning Received unhandled notification, %d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10217FB00);
        v10 = *a3;
        v13[0] = 67109120;
        v13[1] = v10;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 0, "#Warning Received unhandled notification, %d", v13);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator(DataInput) onLocationNotification:data:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
    }
  }
}

- (void)onRunningFormMetrics:(const FormMetrics *)a3
{
  -[CMStrideCalibrationRunningFormBuffer feedRunningFormMetrics:](self->fFormBuffer, "feedRunningFormMetrics:", a3);
}

- (void)setupCLNotifiers
{
  sub_10022AF5C();
}

- (void)teardownCLNotifiers
{
  void *fServiceLocationProvider;

  fServiceLocationProvider = self->fServiceLocationProvider;
  if (fServiceLocationProvider)
    (*(void (**)(void *, SEL))(*(_QWORD *)fServiceLocationProvider + 8))(fServiceLocationProvider, a2);
  self->fServiceLocationProvider = 0;
  -[CLStreamingAwareLocationProviderProtocol releaseAccuracyEnablementAssertionForClient:](self->fStreamingAwareProxy, "releaseAccuracyEnablementAssertionForClient:", CLISP_ME_TOKEN);

  self->fStreamingAwareProxy = 0;
  self->fClientAuthorizationCache = 0;
}

- (void)startElevationUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 3, 0);
}

- (void)stopElevationUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 3);
}

- (void)startElevationSpectatorUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 7, 0);
}

- (void)stopElevationSpectatorUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 7);
}

- (void)startGpsOdometerSpectatorUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 4, 0);
}

- (void)stopGpsOdometerSpectatorUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 4);
}

- (void)startGpsOdometerUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 2, 0);
}

- (void)stopGpsOdometerUpdates
{
  objc_msgSend(*((id *)self->fOdometerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fOdometerClient.__ptr_.__value_ + 1), 2);
}

- (void)startLocationUpdates
{
  -[CLStreamingAwareLocationProviderProtocol takeAccuracyEnablementAssertionForClient:withDesiredAccuracy:](self->fStreamingAwareProxy, "takeAccuracyEnablementAssertionForClient:withDesiredAccuracy:", CLISP_ME_TOKEN, -1.0);
  objc_msgSend(*((id *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 1), 0, 0);
}

- (void)stopLocationUpdates
{
  objc_msgSend(*((id *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 1), 0);
  -[CLStreamingAwareLocationProviderProtocol releaseAccuracyEnablementAssertionForClient:](self->fStreamingAwareProxy, "releaseAccuracyEnablementAssertionForClient:", CLISP_ME_TOKEN);
}

- (void)startLeechingLocation
{
  objc_msgSend(*((id *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 1), 5, 0);
}

- (void)stopLeechingLocation
{
  objc_msgSend(*((id *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 1), 5);
}

- (void)tickleArrow
{
  sub_100BCF0A0((uint64_t)self->fServiceLocationProvider);
}

- (void)checkLocationAuthorization
{
  unsigned int v3;
  CMStrideCalLocationFSM *fStrideCalLocationFSM;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  v3 = -[CMStrideCalibrator isAuthorizedForLocation](self, "isAuthorizedForLocation");
  fStrideCalLocationFSM = self->fStrideCalLocationFSM;
  if (v3)
  {
    if (-[CMStrideCalLocationFSM locationState](fStrideCalLocationFSM, "locationState") <= 0)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
      v5 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Success,AllChecksPassed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
        v8[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "EnableLocationServices,Success,AllChecksPassed", v8, 2);
        v7 = (uint8_t *)v6;
        sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator(CLNotifiers) checkLocationAuthorization]", "%s\n", v6);
        if (v7 != buf)
          free(v7);
      }
      -[CMStrideCalLocationFSM requestTransitionToLocationState:](self->fStrideCalLocationFSM, "requestTransitionToLocationState:", 1);
    }
  }
  else
  {
    -[CMStrideCalLocationFSM requestTransitionToLocationState:](fStrideCalLocationFSM, "requestTransitionToLocationState:", 0);
  }
}

- (BOOL)isAuthorizedForLocation
{
  unsigned __int8 v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint8_t *v7;
  _QWORD v8[2];
  uint8_t buf[1640];

  v2 = objc_msgSend(-[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:](self->fClientAuthorizationCache, "syncgetAuthorizationContextIfClientIsNonZonal:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle")), "isAuthorizedForServiceTypeMask:", 16);
  if ((v2 & 1) != 0)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
    v3 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Success", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
      LOWORD(v8[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "EnableLocationServices,Success", v8, 2, v8[0]);
LABEL_19:
      v7 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator(CLNotifiers) isAuthorizedForLocation]", "%s\n", v4);
      if (v7 != buf)
        free(v7);
    }
  }
  else
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
    v5 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Fail,PedometerCalibrationLocationServicesDisabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
      LOWORD(v8[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "EnableLocationServices,Fail,PedometerCalibrationLocationServicesDisabled", v8, 2, v8[0]);
      goto LABEL_19;
    }
  }
  return v2;
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;
  const char *v19;
  uint8_t *v20;
  _DWORD v21[2];
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint8_t buf[8];
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;

  if (*a3 == 1)
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
    v9 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v10 = *((_DWORD *)a4 + 2);
      v11 = *(_DWORD *)a4;
      v12 = +[CMWorkout workoutName:](CMWorkout, "workoutName:", *((_QWORD *)a4 + 18));
      v13 = *((_QWORD *)a4 + 39);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v10;
      v29 = 1024;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "StrideCal - Register tracks activity %d, override action, %d, session, %@, mode, %ld", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021A42F0);
      v14 = qword_10229FCD8;
      v15 = *((_DWORD *)a4 + 2);
      v16 = *(_DWORD *)a4;
      v17 = +[CMWorkout workoutName:](CMWorkout, "workoutName:", *((_QWORD *)a4 + 18));
      v18 = *((_QWORD *)a4 + 39);
      v21[0] = 67109890;
      v21[1] = v15;
      v22 = 1024;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2048;
      v27 = v18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "StrideCal - Register tracks activity %d, override action, %d, session, %@, mode, %ld", v21, 34);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrator(Callbacks) onMotionStateMediatorNotification:data:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    if (*(_DWORD *)a4 == 1 && !*((_QWORD *)a4 + 39))
    {
      -[CMStrideCalibrator setSession:](self, "setSession:", *((_QWORD *)a4 + 18));
      *(_QWORD *)buf = self->fCurrentSession;
      sub_101180210();
    }
    if (!*(_DWORD *)a4)
    {
      -[CMStrideCalibrator setSession:](self, "setSession:", 0);
      objc_msgSend(*((id *)self->fCompanionClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fCompanionClient.__ptr_.__value_ + 1), 0);
      -[CMStrideCalibrationStats endSessionMetrics:](self->fStats, "endSessionMetrics:", *((double *)a4 + 11));
      -[CMStrideCalibrationStats setReadyForSubmission](self->fStats, "setReadyForSubmission");
    }
  }
}

@end
