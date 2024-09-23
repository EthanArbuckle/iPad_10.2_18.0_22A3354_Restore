@implementation CLRecordingTriggerBase

- (CLRecordingTriggerBase)initWithDelegate:(id)a3 universe:(id)a4 andSettings:()unique_ptr<CLRecordingSettings
{
  CLRecordingTriggerBase *v8;
  NSObject *v9;
  void **var0;
  CLRecordingSettings *value;
  const char *v13;
  uint8_t *v14;
  _WORD v15[8];
  objc_super v16;
  uint8_t buf[1640];

  v16.receiver = self;
  v16.super_class = (Class)CLRecordingTriggerBase;
  v8 = -[CLRecordingTriggerBase init](&v16, "init");
  if (v8)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v9 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Initializing CLRecordingTriggerBase instance", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: Initializing CLRecordingTriggerBase instance", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase initWithDelegate:universe:andSettings:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v8->_delegate = (CLRecordingTriggerDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    var0 = a5.__ptr_.__value_->var0;
    a5.__ptr_.__value_->var0 = 0;
    value = v8->_settings.__ptr_.__value_;
    v8->_settings.__ptr_.__value_ = (CLRecordingSettings *)var0;
    if (value)
      (*((void (**)(CLRecordingSettings *))value->var0 + 1))(value);
    v8->_publisher = 0;
    v8->_workoutStartedOnWatch = 1;
  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  CLPowerAssertion *value;
  const char *v5;
  uint8_t *v6;
  objc_super v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: dealloc", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: dealloc", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase dealloc]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }

  self->_publisher = 0;
  self->_delegate = 0;
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);

  self->_recording = 0;
  -[CLRecordingTriggerBase cancelDeferredStopTimer](self, "cancelDeferredStopTimer");
  v7.receiver = self;
  v7.super_class = (Class)CLRecordingTriggerBase;
  -[CLRecordingTriggerBase dealloc](&v7, "dealloc");
}

- (void)initializePowerAssertion
{
  void *__p;

  (*((void (**)(void **__return_ptr))self->_settings.__ptr_.__value_->var0 + 5))(&__p);
  operator new();
}

- (void)startRecordingSpecifyTriggerDelay:(double)a3 powerSaveMode:(BOOL)a4 maxFileCount:(unsigned int)a5 extraStartInfo:(WatchStartInfo *)a6
{
  uint64_t v7;
  id *p_recording;
  unique_ptr<CLRecordingSettings, std::default_delete<CLRecordingSettings>> *p_settings;
  id v12;
  CLWorkoutModuleSettings *v13;
  CLWorkoutModuleSettings *v14;
  __int128 v15;
  CLRecordingTriggerDelegate *delegate;
  CLIntersiloUniverse *universe;
  id v18;
  uint64_t v19;
  float v20;
  float v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  const char *v28;
  uint8_t *v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v32;
  int v33;
  double v34;
  uint8_t buf[4];
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 __p;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *__src[2];
  _BYTE v57[72];

  v7 = *(_QWORD *)&a5;
  HIDWORD(v32) = a4;
  p_recording = (id *)&self->_recording;
  p_settings = &self->_settings;
  if (!-[CLRecordingTriggerDelegate canStartRecording:settings:publisher:](self->_delegate, "canStartRecording:settings:publisher:", &self->_recording, &self->_settings, self->_publisher))return;
  self->_workoutStartedOnWatch = a6->var1;
  self->_transaction = -[CLOSTransaction initWithDescription:]([CLOSTransaction alloc], "initWithDescription:", "WorkoutRecorder.CLRecordingTriggerBase");
  v12 = -[CLWorkoutModuleFactory initFor:]([CLWorkoutModuleFactory alloc], "initFor:", 1);
  v13 = -[CLWorkoutModuleSettings initWith:]([CLWorkoutModuleSettings alloc], "initWith:", &self->_settings);
  v14 = v13;
  v15 = *(_OWORD *)&a6->var1;
  v49[0] = *(_OWORD *)a6->var0;
  v49[1] = v15;
  if (v13)
  {
    -[CLWorkoutModuleSettings getStructSetting:](v13, "getStructSetting:", v49);
    delegate = self->_delegate;
    universe = self->_universe;
    v39 = v52;
    v40 = v53;
    v41 = v54;
    v42 = v55;
    v37 = v50;
    v38 = v51;
    if ((v57[7] & 0x80000000) != 0)
    {
      sub_100115CE4(&__p, __src[0], (unint64_t)__src[1]);
      goto LABEL_8;
    }
  }
  else
  {
    memset(v57, 0, sizeof(v57));
    *(_OWORD *)__src = 0u;
    v55 = 0u;
    v54 = 0u;
    v53 = 0u;
    v52 = 0u;
    v51 = 0u;
    v50 = 0u;
    delegate = self->_delegate;
    universe = self->_universe;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
  }
  __p = *(_OWORD *)__src;
  v44 = *(_QWORD *)v57;
LABEL_8:
  v45 = *(_OWORD *)&v57[8];
  v46 = *(_OWORD *)&v57[24];
  v47 = *(_OWORD *)&v57[40];
  v48 = *(_OWORD *)&v57[56];
  v18 = objc_msgSend(v12, "generateTheRecording:universe:settings:", delegate, universe, &v37);
  *p_recording = v18;
  if (SHIBYTE(v44) < 0)
  {
    operator delete((void *)__p);
    v18 = *p_recording;
  }
  if ((objc_msgSend(v18, "start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:", -[CLRecordingTriggerDelegate getWorkingDirectory](self->_delegate, "getWorkingDirectory"), -[CLRecordingTriggerDelegate getRecentLocation](self->_delegate, "getRecentLocation"), -[CLRecordingTriggerDelegate getRecentWeatherData](self->_delegate, "getRecentWeatherData"), v7, a3) & 1) != 0)
  {

    if (a6->var1)
    {
      v19 = (*((uint64_t (**)(CLRecordingSettings *))p_settings->__ptr_.__value_->var0 + 8))(p_settings->__ptr_.__value_);
      v20 = *(float *)&v19;
      if ((v19 & 0xFF00000000) != 0)
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7530);
        v21 = v20;
        v22 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v36 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase, Power assertion for %f seconds", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7530);
          v23 = v21;
          v33 = 134217984;
          v34 = v23;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase, Power assertion for %f seconds", COERCE_DOUBLE(&v33));
          v29 = (uint8_t *)v28;
          sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v28);
          if (v29 != buf)
            free(v29);
        }
        else
        {
          v23 = v21;
        }
        -[CLRecordingTriggerBase takePowerAndScheduleRelease:](self, "takePowerAndScheduleRelease:", v23);
      }
      else
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7530);
        v25 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase, Power Assertion time not found in recording settings, will not take power", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D7530);
          LOWORD(v33) = 0;
          LODWORD(v32) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase, Power Assertion time not found in recording settings, will not take power", &v33, v32);
          v31 = (uint8_t *)v30;
          sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v30);
          if (v31 != buf)
            free(v31);
        }
      }
    }
    else
    {
      -[CLRecordingTriggerBase setPowerSaveMode:](self, "setPowerSaveMode:", HIDWORD(v32));
    }
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v24 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "CLRecordingTriggerBase: Unable to start recording, releasing CLWorkoutRecording, CLWorkoutModuleSettings, and CLOSTransaction pointers", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      LOWORD(v33) = 0;
      LODWORD(v32) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLRecordingTriggerBase: Unable to start recording, releasing CLWorkoutRecording, CLWorkoutModuleSettings, and CLOSTransaction pointers", &v33, v32);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 0, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }

    self->_recording = 0;
    self->_transaction = 0;
  }
  if ((v57[7] & 0x80000000) != 0)
    operator delete(__src[0]);
}

- (void)scheduleStop:(double)a3 withHandler:(id)a4
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v10;
  OS_dispatch_source *v11;
  dispatch_time_t v12;
  NSObject *deferredStopTimer;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  _QWORD handler[7];
  int v18;
  double v19;
  uint8_t buf[4];
  double v21;

  if (self->_deferredStopTimer)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v4 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: scheduleStop, Deferred stop already created and scheduled.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      LOWORD(v18) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: scheduleStop, Deferred stop already created and scheduled.", &v18, 2);
LABEL_10:
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase scheduleStop:withHandler:]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  else if (self->_recording)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v10 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: scheduleStop, Scheduling stop for %f seconds in the future.", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v18 = 134217984;
      v19 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: scheduleStop, Scheduling stop for %f seconds in the future.", COERCE_DOUBLE(&v18));
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase scheduleStop:withHandler:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(-[CLRecordingTriggerDelegate silo](self->_delegate, "silo"), "queue"));
    self->_deferredStopTimer = v11;
    v12 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v11, v12, (unint64_t)(a3 * 1000000000.0), 0);
    deferredStopTimer = self->_deferredStopTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1018C3AF8;
    handler[3] = &unk_102180A50;
    handler[4] = deferredStopTimer;
    handler[5] = self;
    handler[6] = a4;
    dispatch_source_set_event_handler(deferredStopTimer, handler);
    dispatch_resume((dispatch_object_t)self->_deferredStopTimer);
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v14 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: scheduleStop, Unable to create deferred stop timer, not currently recording.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      LOWORD(v18) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: scheduleStop, Unable to create deferred stop timer, not currently recording.", &v18, 2);
      goto LABEL_10;
    }
  }
}

- (void)setPowerSaveMode:(BOOL)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;

  if (a3 || !self->_recording)
  {
    -[CLRecordingTriggerBase releasePowerAssertion:](self, "releasePowerAssertion:", CFSTR("Set Power save mode."));
  }
  else
  {
    if (*((int *)self->_powerAssertion.__ptr_.__value_ + 2) >= 1)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v3 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        v7 = 0;
        v8 = 2082;
        v9 = "";
        v10 = 2082;
        v11 = "assert";
        v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7530);
      }
      v4 = qword_10229FE38;
      if (os_signpost_enabled((os_log_t)qword_10229FE38))
      {
        *(_DWORD *)buf = 68289539;
        v7 = 0;
        v8 = 2082;
        v9 = "";
        v10 = 2082;
        v11 = "assert";
        v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "How did we have an assertion if we weren't recording?", "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7530);
      }
      v5 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        v7 = 0;
        v8 = 2082;
        v9 = "";
        v10 = 2082;
        v11 = "assert";
        v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/CLRecordingTriggerBase.mm", 250, "-[CLRecordingTriggerBase setPowerSaveMode:]");
    }
    -[CLRecordingTriggerBase takePower](self, "takePower");
  }
}

- (void)feedWeatherData:(id)a3
{
  CLWorkoutRecording *recording;

  recording = self->_recording;
  if (recording)
    -[CLWorkoutRecording recordWeatherData:](recording, "recordWeatherData:", a3);
}

- (void)feedWorkoutEffortEstimate:(const Result *)a3
{
  CLWorkoutRecording *recording;

  recording = self->_recording;
  if (recording)
    -[CLWorkoutRecording recordWorkoutEffort:](recording, "recordWorkoutEffort:", a3);
}

- (void)cancelDeferredStopTimer
{
  NSObject *deferredStopTimer;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  deferredStopTimer = self->_deferredStopTimer;
  if (deferredStopTimer)
  {
    dispatch_source_cancel(deferredStopTimer);
    dispatch_release((dispatch_object_t)self->_deferredStopTimer);
    self->_deferredStopTimer = 0;
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v4 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: cancelDeferredStopTimer", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: cancelDeferredStopTimer", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase cancelDeferredStopTimer]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)stopRecordingShouldPublish:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CLWorkoutRecording *recording;
  NSObject *v7;
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

  v3 = a3;
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v5 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Stopping Recording", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v16[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: Stopping Recording", v16, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  recording = self->_recording;
  if (recording)
  {
    -[CLWorkoutRecording stop](recording, "stop");
    if (v3)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v7 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Publishing Recording", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D7530);
        v16[0] = 0;
        LODWORD(v15) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: Publishing Recording", v16, v15);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      -[CLRecordingTriggerBase publishRecording](self, "publishRecording");
    }
    else
    {

      self->_recording = 0;
    }
  }

  self->_transaction = 0;
  if (self->_workoutStartedOnWatch)
  {
    if (*((int *)self->_powerAssertion.__ptr_.__value_ + 2) < 1)
      return;
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v8 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: Workout ended before deferred timer limit, releasing power", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v16[0] = 0;
      LODWORD(v15) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: Workout ended before deferred timer limit, releasing power", v16, v15);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
  -[CLRecordingTriggerBase releasePowerAssertion:](self, "releasePowerAssertion:", CFSTR("CLRecordingTriggerBase stop recording should publish."));
}

- (void)publishRecording
{
  CLWorkoutRecorderPublisher *publisher;
  NSObject *v4;
  CLWorkoutRecording **p_recording;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  _WORD v12[8];
  uint8_t buf[1640];

  publisher = self->_publisher;
  if (!publisher)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v4 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: publishRecording, creating publisher", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: publishRecording, creating publisher", v12, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase publishRecording]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    publisher = -[CLWorkoutRecorderPublisher initWithDelegate:settings:]([CLWorkoutRecorderPublisher alloc], "initWithDelegate:settings:", self->_delegate, &self->_settings);
    self->_publisher = publisher;
  }
  p_recording = &self->_recording;
  if (-[CLRecordingTriggerDelegate didPublishRecording:settings:publisher:](self->_delegate, "didPublishRecording:settings:publisher:", &self->_recording, &self->_settings, publisher))
  {
    -[CLWorkoutRecording cleanup](*p_recording, "cleanup");

    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v6 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: publishRecording, done with publishing releasing CLWorkoutRecording ptr", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7530);
      v12[0] = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: publishRecording, done with publishing releasing CLWorkoutRecording ptr", v12, v11);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase publishRecording]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    *p_recording = 0;
  }
}

- (void)handlePublisherResponse:(id)a3
{
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  CLRecordingSettings *value;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint8_t *v14;
  uint8_t *v15;
  __int128 v16;
  uint8_t buf[4];
  double v18;

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v5 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: handlePublisherResponse", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    LOWORD(v16) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLRecordingTriggerBase: handlePublisherResponse", &v16, 2);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase handlePublisherResponse:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  v6 = objc_msgSend(a3, "objectForKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (*((uint64_t (**)(CLRecordingSettings *))self->_settings.__ptr_.__value_->var0 + 7))(self->_settings.__ptr_.__value_)));
  objc_msgSend(v6, "doubleValue");
  if (!v6
    || (v8 = v7,
        value = self->_settings.__ptr_.__value_,
        (*((double (**)(CLRecordingSettings *))value->var0 + 25))(value) > v7)
    || (*((double (**)(CLRecordingSettings *))value->var0 + 24))(value) < v8)
  {
    sub_1018C1760((uint64_t)self->_settings.__ptr_.__value_);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v10 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: handlePublisherResponse,clearing sampling rate", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: handlePublisherResponse,clearing sampling rate");
LABEL_30:
    v15 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase handlePublisherResponse:]", "%s\n", v12);
    if (v15 != buf)
      free(v15);
    return;
  }
  sub_1018C1570((uint64_t)self->_settings.__ptr_.__value_, v8);
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v11 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: handlePublisherResponse, setting sampling rate to %f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: handlePublisherResponse, setting sampling rate to %f");
    goto LABEL_30;
  }
}

- (id)getDelegate
{
  return self->_delegate;
}

- (id)getUniverse
{
  return self->_universe;
}

- (id)getDeferredStopTimer
{
  return self->_deferredStopTimer;
}

- (BOOL)isRecording
{
  return self->_recording != 0;
}

- (id)getRecording
{
  return (id *)&self->_recording;
}

- (CLRecordingSettings)getSettings
{
  return self->_settings.__ptr_.__value_;
}

- (void)releasePowerAssertion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  sub_100E3E6F0((uint64_t)self->_powerAssertion.__ptr_.__value_);
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v4 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: releasePowerAssertion, Power is released in:%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v5 = qword_10229FE38;
    v8 = 136315138;
    v9 = objc_msgSend(a3, "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 0, "CLRecordingTriggerBase: releasePowerAssertion, Power is released in:%s", (const char *)&v8);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase releasePowerAssertion:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)takePower
{
  CLPowerAssertion *value;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  void *__p[2];
  char v8;
  uint8_t buf[1640];

  value = self->_powerAssertion.__ptr_.__value_;
  sub_1015A2E04(__p, "none");
  sub_10002B684((uint64_t)value, (uint64_t *)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7530);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: Power is taken", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7530);
    v6 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLRecordingTriggerBase: Power is taken", &v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRecordingTriggerBase takePower]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)takePowerAndScheduleRelease:(double)a3
{
  _QWORD v5[5];

  -[CLRecordingTriggerBase takePower](self, "takePower");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1018C4F64;
  v5[3] = &unk_10212BB58;
  v5[4] = self;
  -[CLRecordingTriggerBase scheduleStop:withHandler:](self, "scheduleStop:withHandler:", v5, a3);
}

- (void).cxx_destruct
{
  CLRecordingSettings *value;
  CLPowerAssertion *v4;

  value = self->_settings.__ptr_.__value_;
  self->_settings.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(CLRecordingSettings *, SEL))value->var0 + 1))(value, a2);
  v4 = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
