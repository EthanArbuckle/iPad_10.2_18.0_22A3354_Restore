@implementation CLWorkoutRecorderTrigger

- (CLWorkoutRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4
{
  self->_valid = 0;
  self->_active_recording = 0;
  operator new();
}

- (void)dealloc
{
  objc_super v3;

  self->_valid = 0;
  -[CLWorkoutRecorderTrigger teardownListeners](self, "teardownListeners");
  v3.receiver = self;
  v3.super_class = (Class)CLWorkoutRecorderTrigger;
  -[CLRecordingTriggerBase dealloc](&v3, "dealloc");
}

- (void)setupListeners
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  objc_super v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7578);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Setting up workout recorder trigger listener.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7578);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: Setting up workout recorder trigger listener.", v8, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger setupListeners]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)CLWorkoutRecorderTrigger;
  -[CLRecordingTriggerBase initializePowerAssertion](&v7, "initializePowerAssertion");
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecorderTrigger;
  -[CLRecordingTriggerBase getDelegate](&v6, "getDelegate");
  sub_1006CB5B4();
}

- (void)teardownListeners
{
  NSObject *v3;
  Client *value;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7578);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Tearing down workout recorder trigger listener.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7578);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: Tearing down workout recorder trigger listener.", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger teardownListeners]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  -[CLMotionStateMediatorProtocol unregisterForWorkoutSessionUpdates:](self->_motionStateMediatorProtocol, "unregisterForWorkoutSessionUpdates:", self);

  self->_motionStateMediatorProtocol = 0;
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v5;
  NSObject *v7;
  _BOOL8 isWorkoutPowerSaveModeEnabled;
  CLRecordingSettings *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  objc_super v15;
  objc_super v16;
  _WORD v17[8];
  _OWORD v18[2];
  uint8_t buf[16];
  __int128 v20;

  if (*(double *)a4 == 1.79769313e308)
  {
    if (self->_active_recording)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7578);
      v5 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Stop recording signal.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        v17[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Stop recording signal.", v17, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      -[CLWorkoutRecorderTrigger onDeferredStopTimerShouldPublish:](self, "onDeferredStopTimerShouldPublish:", 1);
      self->_active_recording = 0;
    }
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7578);
    v7 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Start recording signal.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7578);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Start recording signal.", v17, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    if (!self->_active_recording)
    {
      self->_active_recording = 1;
      memset(buf, 0, sizeof(buf));
      *(_QWORD *)&v20 = 1;
      *((_QWORD *)&v20 + 1) = +[CMWorkout CMWorkoutTypeFromCLMotionActivityType:](CMWorkout, "CMWorkoutTypeFromCLMotionActivityType:", *((unsigned int *)a4 + 2));
      uuid_copy(buf, (const unsigned __int8 *)a4 + 20);
      isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
      v16.receiver = self;
      v16.super_class = (Class)CLWorkoutRecorderTrigger;
      v9 = -[CLRecordingTriggerBase getSettings](&v16, "getSettings");
      v10 = sub_1018C123C((uint64_t)v9);
      v18[0] = *(_OWORD *)buf;
      v18[1] = v20;
      v15.receiver = self;
      v15.super_class = (Class)CLWorkoutRecorderTrigger;
      -[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:](&v15, "startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:", isWorkoutPowerSaveModeEnabled, v10, v18, 0.0);
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSObject *v16;
  _BOOL8 isWorkoutPowerSaveModeEnabled;
  CLRecordingSettings *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint8_t *v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  _WORD v29[8];
  objc_super v30;
  _OWORD v31[2];
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[10];
  uint64_t v39;

  v8 = *((_OWORD *)a4 + 13);
  v38[8] = *((_OWORD *)a4 + 12);
  v38[9] = v8;
  v39 = *((_QWORD *)a4 + 28);
  v9 = *((_OWORD *)a4 + 9);
  v38[4] = *((_OWORD *)a4 + 8);
  v38[5] = v9;
  v10 = *((_OWORD *)a4 + 10);
  v38[7] = *((_OWORD *)a4 + 11);
  v38[6] = v10;
  v11 = *((_OWORD *)a4 + 5);
  v38[0] = *((_OWORD *)a4 + 4);
  v38[1] = v11;
  v12 = *((_OWORD *)a4 + 6);
  v38[3] = *((_OWORD *)a4 + 7);
  v38[2] = v12;
  v13 = *((_OWORD *)a4 + 1);
  v34 = *(_OWORD *)a4;
  v35 = v13;
  v14 = *((_OWORD *)a4 + 2);
  v37 = *((_OWORD *)a4 + 3);
  v36 = v14;
  switch((_QWORD)v35)
  {
    case 0x13:
      self->_isWorkoutPowerSaveModeEnabled = v39 == 1;
      v25.receiver = self;
      v25.super_class = (Class)CLWorkoutRecorderTrigger;
      -[CLRecordingTriggerBase setPowerSaveMode:](&v25, "setPowerSaveMode:");
      break;
    case 0xALL:
      v26.receiver = self;
      v26.super_class = (Class)CLWorkoutRecorderTrigger;
      if (!-[CLRecordingTriggerBase getDeferredStopTimer](&v26, "getDeferredStopTimer", a3))
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        v20 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Received an AP de-escalation.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7578);
          v29[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: Received an AP de-escalation.", v29, 2);
          v24 = (uint8_t *)v23;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateMediatorNotification:data:]", "%s\n", v23);
          if (v24 != buf)
            free(v24);
        }
        sub_100197040();
        -[CLWorkoutRecorderTrigger onDeferredStopTimerShouldPublish:](self, "onDeferredStopTimerShouldPublish:", sub_10075D288());
      }
      break;
    case 8:
      v30.receiver = self;
      v30.super_class = (Class)CLWorkoutRecorderTrigger;
      if (!-[CLRecordingTriggerBase getDeferredStopTimer](&v30, "getDeferredStopTimer", a3))
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        v16 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Received an AP escalation.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7578);
          v29[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorderTrigger: Received an AP escalation.", v29, 2);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateMediatorNotification:data:]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        uuid_copy(self->_workoutSession, (const unsigned __int8 *)v38);
        *(_OWORD *)buf = 0u;
        v33 = 0u;
        uuid_copy(buf, (const unsigned __int8 *)a4 + 96);
        isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
        v28.receiver = self;
        v28.super_class = (Class)CLWorkoutRecorderTrigger;
        v18 = -[CLRecordingTriggerBase getSettings](&v28, "getSettings");
        v19 = sub_1018C123C((uint64_t)v18);
        v31[0] = *(_OWORD *)buf;
        v31[1] = v33;
        v27.receiver = self;
        v27.super_class = (Class)CLWorkoutRecorderTrigger;
        -[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:](&v27, "startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:", isWorkoutPowerSaveModeEnabled, v19, v31, 0.0);
      }
      break;
  }
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecorderTrigger;
  -[CLRecordingTriggerBase cancelDeferredStopTimer](&v6, "cancelDeferredStopTimer");
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutRecorderTrigger;
  -[CLRecordingTriggerBase stopRecordingShouldPublish:](&v5, "stopRecordingShouldPublish:", v3);
  uuid_clear(self->_workoutSession);
  self->_isWorkoutPowerSaveModeEnabled = 0;
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3 recordSubsequentSession:(BOOL)a4 isMultiSportSession:(BOOL)a5 withEvent:(WorkoutEvent *)a6 triggerDelay:(double)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  uint64_t v12;
  int64_t workoutType;
  _BOOL8 isWorkoutPowerSaveModeEnabled;
  objc_super v15;
  _OWORD v16[2];
  uuid_t dst;
  __int128 v18;

  v9 = a5;
  v10 = a4;
  -[CLWorkoutRecorderTrigger onDeferredStopTimerShouldPublish:](self, "onDeferredStopTimerShouldPublish:", a3);
  if (v10)
  {
    uuid_copy(self->_workoutSession, a6->workoutSettings.sessionId);
    self->_isWorkoutPowerSaveModeEnabled = a6->workoutSettings.workoutMode == 1;
    v12 = -[CLWorkoutRecorderTrigger getMaxFileCountForRecording:](self, "getMaxFileCountForRecording:", v9);
    memset(dst, 0, sizeof(dst));
    workoutType = a6->workoutSettings.workoutType;
    *(_QWORD *)&v18 = 0;
    *((_QWORD *)&v18 + 1) = workoutType;
    uuid_copy(dst, a6->workoutSettings.workoutRecorderSessionId);
    isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
    v16[0] = *(_OWORD *)dst;
    v16[1] = v18;
    v15.receiver = self;
    v15.super_class = (Class)CLWorkoutRecorderTrigger;
    -[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:](&v15, "startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:", isWorkoutPowerSaveModeEnabled, v12, v16, a7);
  }
}

- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5
{
  int64_t eventType;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  unint64_t workoutMode;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _BOOL8 isWorkoutPowerSaveModeEnabled;
  void *v24;
  void *v25;
  const char *v26;
  char *v27;
  const char *v28;
  char *v29;
  const char *v30;
  char *v31;
  objc_super v32;
  objc_super v33;
  _QWORD v34[5];
  objc_super v35;
  objc_super v36;
  objc_super v37;
  objc_super v38;
  objc_super v39;
  objc_super v40;
  objc_super v41;
  objc_super v42;
  _WORD v43[8];
  objc_super v44;
  _OWORD v45[2];
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  WorkoutAttrib attrib;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  unint64_t v61;
  double v62;
  char v63;
  BOOL v64;
  __int128 buf;
  __int128 v66;
  _QWORD v67[4];
  char v68;
  _QWORD v69[5];
  unint64_t v70;

  eventType = a3->eventType;
  if (eventType == 15)
  {
    v36.receiver = self;
    v36.super_class = (Class)CLWorkoutRecorderTrigger;
    if (-[CLRecordingTriggerBase getDeferredStopTimer](&v36, "getDeferredStopTimer"))
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7578);
      v20 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user ended workout during deferred stop.", (uint8_t *)&buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        LOWORD(v67[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user ended workout during deferred stop.", v67, 2);
        v27 = (char *)v26;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v26);
        if (v27 != (char *)&buf)
          free(v27);
      }
      v35.receiver = self;
      v35.super_class = (Class)CLWorkoutRecorderTrigger;
      -[CLRecordingTriggerBase cancelDeferredStopTimer](&v35, "cancelDeferredStopTimer");
    }
    sub_1018BEA14((unsigned __int8 *)&buf, "WorkoutRecorderTriggerStopEventDeferredStopDurationSeconds", &qword_101CEB268, 0);
    v34[1] = 3221225472;
    v34[2] = sub_1018C6CC4;
    v34[3] = &unk_10212BB58;
    v34[4] = self;
    v33.receiver = self;
    v33.super_class = (Class)CLWorkoutRecorderTrigger;
    v34[0] = _NSConcreteStackBlock;
    -[CLRecordingTriggerBase scheduleStop:withHandler:](&v33, "scheduleStop:withHandler:", v34, *((double *)&buf + 1));
  }
  else if (eventType == 13)
  {
    (*((void (**)(_QWORD *__return_ptr, id, SEL))a5 + 2))(v67, a5, a2);
    v8 = v70;
    v9 = v70 > 1;
    if (uuid_compare(self->_workoutSession, a3->workoutSettings.sessionId))
    {
      uuid_copy(self->_workoutSession, a3->workoutSettings.sessionId);
      self->_isWorkoutPowerSaveModeEnabled = a3->workoutSettings.workoutMode == 1;
      v41.receiver = self;
      v41.super_class = (Class)CLWorkoutRecorderTrigger;
      if (-[CLRecordingTriggerBase getDeferredStopTimer](&v41, "getDeferredStopTimer"))
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        v10 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user started new workout during deferred stop.", (uint8_t *)&buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7578);
          v43[0] = 0;
          _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user started new workout during deferred stop.", v43, 2);
          v29 = (char *)v28;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v28);
          if (v29 != (char *)&buf)
            free(v29);
        }
        v40.receiver = self;
        v40.super_class = (Class)CLWorkoutRecorderTrigger;
        -[CLRecordingTriggerBase cancelDeferredStopTimer](&v40, "cancelDeferredStopTimer");
        sub_1018BEA14((unsigned __int8 *)&buf, "WorkoutRecorderTriggerStartEventDeferredStopDurationSeconds", &qword_101CEB258, 0);
        v11 = *((double *)&buf + 1);
        sub_1018BF25C((unsigned __int8 *)&buf, "WorkoutRecorderTriggerShouldRecordConsecutiveWorkouts", byte_101CEB260, 0);
        v46[1] = 3221225472;
        v12 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[15];
        v58 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[31];
        v13 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[63];
        v59 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.catalogWorkoutId[47];
        v60 = v13;
        v14 = *(_OWORD *)a3->workoutSettings.workoutRecorderSessionId;
        v54 = *(_OWORD *)&a3->workoutSettings.workoutType;
        v15 = *(_OWORD *)&a3->workoutSettings.fitnessPlus.isFitnessPlus;
        attrib = a3->workoutSettings.attrib;
        v56 = v15;
        v57 = v12;
        v16 = *(_OWORD *)&a3->details.sessionType;
        v50 = *(_OWORD *)&a3->details.escalationType;
        v17 = *(_OWORD *)a3->workoutSettings.overviewId;
        v51 = *(_OWORD *)a3->workoutSettings.sessionId;
        v52 = v17;
        v53 = v14;
        v18 = *(_OWORD *)&a3->eventType;
        v47 = *(_OWORD *)&a3->startTime;
        v48 = v18;
        v46[0] = _NSConcreteStackBlock;
        v46[2] = sub_1018C6BC4;
        v46[3] = &unk_1021D7558;
        v63 = BYTE1(buf);
        v64 = v9;
        workoutMode = a3->workoutSettings.workoutMode;
        v46[4] = self;
        v61 = workoutMode;
        v49 = v16;
        v62 = v11;
        v39.receiver = self;
        v39.super_class = (Class)CLWorkoutRecorderTrigger;
        -[CLRecordingTriggerBase scheduleStop:withHandler:](&v39, "scheduleStop:withHandler:", v46, v11);
      }
      else
      {
        v22 = -[CLWorkoutRecorderTrigger getMaxFileCountForRecording:](self, "getMaxFileCountForRecording:", v8 > 1);
        buf = 0u;
        v66 = 0u;
        uuid_copy((unsigned __int8 *)&buf, a3->workoutSettings.workoutRecorderSessionId);
        isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
        v45[0] = buf;
        v45[1] = v66;
        v38.receiver = self;
        v38.super_class = (Class)CLWorkoutRecorderTrigger;
        -[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:](&v38, "startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:", isWorkoutPowerSaveModeEnabled, v22, v45, 0.0);
        v37.receiver = self;
        v37.super_class = (Class)CLWorkoutRecorderTrigger;
        v24 = *-[CLRecordingTriggerBase getRecording](&v37, "getRecording");
        if (v24)
          objc_msgSend(v24, "recordWorkoutSessionPriors:", v67);
      }
    }
    else
    {
      v44.receiver = self;
      v44.super_class = (Class)CLWorkoutRecorderTrigger;
      if (-[CLRecordingTriggerBase getDeferredStopTimer](&v44, "getDeferredStopTimer"))
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7578);
        v21 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling deferred stop - user resumed current workout.", (uint8_t *)&buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7578);
          v43[0] = 0;
          _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorderTrigger: Canceling deferred stop - user resumed current workout.", v43, 2);
          v31 = (char *)v30;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v30);
          if (v31 != (char *)&buf)
            free(v31);
        }
        v42.receiver = self;
        v42.super_class = (Class)CLWorkoutRecorderTrigger;
        -[CLRecordingTriggerBase cancelDeferredStopTimer](&v42, "cancelDeferredStopTimer");
      }
    }
    sub_100544F70(v69);
    if (v68 < 0)
      operator delete((void *)v67[2]);
  }
  v32.receiver = self;
  v32.super_class = (Class)CLWorkoutRecorderTrigger;
  v25 = *-[CLRecordingTriggerBase getRecording](&v32, "getRecording");
  if (v25)
    objc_msgSend(v25, "recordWorkoutSessionEvent:", a3);
}

- (unsigned)getMaxFileCountForRecording:(BOOL)a3
{
  _BOOL4 v3;
  CLRecordingSettings *v6;
  objc_super v7;
  unsigned __int8 v8[4];
  unsigned int v9;

  v3 = a3;
  sub_100197040();
  if (sub_10075D288() && v3)
  {
    sub_1018C1A0C(v8, "WorkoutRecorderTriggerMaxFileCountForMultiSportWorkouts", &dword_101CEB270, 0);
    return v9;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CLWorkoutRecorderTrigger;
    v6 = -[CLRecordingTriggerBase getSettings](&v7, "getSettings");
    return sub_1018C123C((uint64_t)v6);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
