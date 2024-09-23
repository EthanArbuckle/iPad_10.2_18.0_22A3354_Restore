@implementation CLDrivingRecorderTrigger

- (CLDrivingRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4
{
  operator new();
}

- (void)dealloc
{
  objc_super v3;

  -[CLDrivingRecorderTrigger teardownListeners](self, "teardownListeners");
  -[CLDrivingRecorderTrigger cancelDeferredStartTimer](self, "cancelDeferredStartTimer");
  v3.receiver = self;
  v3.super_class = (Class)CLDrivingRecorderTrigger;
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

  if (self->_enableVehicularNotifications)
  {
    if (qword_10229FE50 != -1)
      dispatch_once(&qword_10229FE50, &stru_1021D84F8);
    v3 = qword_10229FE58;
    if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Setting up driving recorder trigger listener.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE50 != -1)
        dispatch_once(&qword_10229FE50, &stru_1021D84F8);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger: Setting up driving recorder trigger listener.", v8, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger setupListeners]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    v7.receiver = self;
    v7.super_class = (Class)CLDrivingRecorderTrigger;
    -[CLRecordingTriggerBase initializePowerAssertion](&v7, "initializePowerAssertion");
    v6.receiver = self;
    v6.super_class = (Class)CLDrivingRecorderTrigger;
    -[CLRecordingTriggerBase getDelegate](&v6, "getDelegate");
    sub_1011570CC();
  }
}

- (void)scheduleStart
{
  NSObject *v2;
  const char *v3;
  NSObject *v5;
  uint8_t *v6;
  double v7;
  NSObject *v8;
  CLTimer *v9;
  const char *v10;
  uint8_t *v11;
  _QWORD v12[6];
  objc_super v13;
  objc_super v14;
  int v15;
  double v16;
  uint8_t buf[4];
  _BYTE v18[12];

  if (self->_deferredStartTimer)
  {
    if (qword_10229FE50 != -1)
      dispatch_once(&qword_10229FE50, &stru_1021D84F8);
    v2 = qword_10229FE58;
    if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLDrivingRecorderTrigger:  Deferred start already scheduled.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE50 != -1)
        dispatch_once(&qword_10229FE50, &stru_1021D84F8);
      LOWORD(v15) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 0, "CLDrivingRecorderTrigger:  Deferred start already scheduled.", &v15, 2);
LABEL_19:
      v6 = (uint8_t *)v3;
      sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger scheduleStart]", "%s\n", v3);
      if (v6 != buf)
        free(v6);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CLDrivingRecorderTrigger;
    if (-[CLRecordingTriggerBase isRecording](&v14, "isRecording"))
    {
      if (qword_10229FE50 != -1)
        dispatch_once(&qword_10229FE50, &stru_1021D84F8);
      v5 = qword_10229FE58;
      if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger:  Unable to schedule start, currently recording", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE50 != -1)
          dispatch_once(&qword_10229FE50, &stru_1021D84F8);
        LOWORD(v15) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger:  Unable to schedule start, currently recording", &v15, 2);
        goto LABEL_19;
      }
    }
    else
    {
      sub_1018BEA14(buf, "DrivingRecorderTriggerDeferredStartDurationSeconds", &qword_101CEB5F8, 0);
      v7 = *(double *)&v18[4];
      if (qword_10229FE50 != -1)
        dispatch_once(&qword_10229FE50, &stru_1021D84F8);
      v8 = qword_10229FE58;
      if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Scheduling start for %f seconds in the future.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE50 != -1)
          dispatch_once(&qword_10229FE50, &stru_1021D84F8);
        v15 = 134217984;
        v16 = v7;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger: Scheduling start for %f seconds in the future.", COERCE_DOUBLE(&v15));
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger scheduleStart]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
      v13.receiver = self;
      v13.super_class = (Class)CLDrivingRecorderTrigger;
      v9 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLRecordingTriggerBase getUniverse](&v13, "getUniverse"), "silo"), "newTimer");
      self->_deferredStartTimer = v9;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1018EB1AC;
      v12[3] = &unk_102131360;
      v12[4] = self;
      *(double *)&v12[5] = v7;
      -[CLTimer setHandler:](v9, "setHandler:", v12);
      -[CLTimer setNextFireDelay:interval:](self->_deferredStartTimer, "setNextFireDelay:interval:", v7, v7);
    }
  }
}

- (void)cancelDeferredStartTimer
{
  -[CLTimer invalidate](self->_deferredStartTimer, "invalidate");

  self->_deferredStartTimer = 0;
}

- (void)teardownListeners
{
  NSObject *v3;
  Client *value;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FE50 != -1)
    dispatch_once(&qword_10229FE50, &stru_1021D84F8);
  v3 = qword_10229FE58;
  if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Tearing down driving recorder trigger listener.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE50 != -1)
      dispatch_once(&qword_10229FE50, &stru_1021D84F8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger: Tearing down driving recorder trigger listener.", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger teardownListeners]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  objc_super v12;
  uint8_t buf[1640];

  if (self->_enableVehicularNotifications)
  {
    if (*((_DWORD *)a4 + 3) == 4)
    {
      if (!self->_deferredStartTimer)
      {
        v12.receiver = self;
        v12.super_class = (Class)CLDrivingRecorderTrigger;
        if (!-[CLRecordingTriggerBase getDeferredStopTimer](&v12, "getDeferredStopTimer", a3))
        {
          if (qword_10229FE50 != -1)
            dispatch_once(&qword_10229FE50, &stru_1021D84F8);
          v5 = qword_10229FE58;
          if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Received high confidence driving notification.", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE50 != -1)
              dispatch_once(&qword_10229FE50, &stru_1021D84F8);
            v11[0] = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger: Received high confidence driving notification.", v11, 2);
            v10 = (uint8_t *)v9;
            sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v9);
            if (v10 != buf)
              free(v10);
          }
          -[CLDrivingRecorderTrigger scheduleStart](self, "scheduleStart");
        }
      }
    }
    else
    {
      if (qword_10229FE50 != -1)
        dispatch_once(&qword_10229FE50, &stru_1021D84F8);
      v6 = qword_10229FE58;
      if (os_log_type_enabled((os_log_t)qword_10229FE58, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Received low confidence driving notification.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE50 != -1)
          dispatch_once(&qword_10229FE50, &stru_1021D84F8);
        v11[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE58, 2, "CLDrivingRecorderTrigger: Received low confidence driving notification.", v11, 2);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v7);
        if (v8 != buf)
          free(v8);
      }
      -[CLDrivingRecorderTrigger cancelDeferredStartTimer](self, "cancelDeferredStartTimer");
      -[CLDrivingRecorderTrigger onDeferredStopTimerShouldPublish:](self, "onDeferredStopTimerShouldPublish:", 1);
    }
  }
}

- (void)onDeferredStartTimerSpecifyTriggerDelay:(double)a3
{
  CLRecordingSettings *v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[5];
  unsigned __int8 v9[8];
  double v10;
  objc_super v11;
  objc_super v12;
  _OWORD v13[2];
  uuid_t out;

  -[CLDrivingRecorderTrigger cancelDeferredStartTimer](self, "cancelDeferredStartTimer");
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  v12.receiver = self;
  v12.super_class = (Class)CLDrivingRecorderTrigger;
  v5 = -[CLRecordingTriggerBase getSettings](&v12, "getSettings");
  v6 = sub_1018C123C((uint64_t)v5);
  memset(v13, 0, sizeof(v13));
  v11.receiver = self;
  v11.super_class = (Class)CLDrivingRecorderTrigger;
  -[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:](&v11, "startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:", 0, v6, v13, a3);
  sub_1018BEA14(v9, "DrivingRecorderTriggerDeferredStopDurationSeconds", &qword_101CEB600, 0);
  v8[1] = 3221225472;
  v8[2] = sub_1018EB7F8;
  v8[3] = &unk_10212BB58;
  v8[4] = self;
  v7.receiver = self;
  v7.super_class = (Class)CLDrivingRecorderTrigger;
  v8[0] = _NSConcreteStackBlock;
  -[CLRecordingTriggerBase scheduleStop:withHandler:](&v7, "scheduleStop:withHandler:", v8, v10);
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLDrivingRecorderTrigger;
  -[CLRecordingTriggerBase cancelDeferredStopTimer](&v6, "cancelDeferredStopTimer");
  v5.receiver = self;
  v5.super_class = (Class)CLDrivingRecorderTrigger;
  -[CLRecordingTriggerBase stopRecordingShouldPublish:](&v5, "stopRecordingShouldPublish:", v3);
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
