@implementation CLWorkoutRecorder

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
  if (qword_102310170 != -1)
    dispatch_once(&qword_102310170, &stru_1021D7598);
  return (id)qword_102310168;
}

- (CLWorkoutRecorder)init
{
  CLWorkoutRecorder *v2;
  CLWorkoutRecorder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutRecorder;
  v2 = -[CLWorkoutRecorder initWithInboundProtocol:outboundProtocol:](&v5, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWorkoutRecorderProtocol, &OBJC_PROTOCOL___CLWorkoutRecorderClientProtocol);
  v3 = v2;
  if (v2)
  {
    v2->_recentLocation.ellipsoidalAltitude = 0.0;
    v2->_workoutRecorderTrigger = -[CLWorkoutRecorderTrigger initWithDelegate:andUniverse:]([CLWorkoutRecorderTrigger alloc], "initWithDelegate:andUniverse:", v2, -[CLWorkoutRecorder universe](v2, "universe"));
    v3->_drivingRecorderTrigger = -[CLDrivingRecorderTrigger initWithDelegate:andUniverse:]([CLDrivingRecorderTrigger alloc], "initWithDelegate:andUniverse:", v3, -[CLWorkoutRecorder universe](v3, "universe"));
    v3->_serviceLocationClient.__ptr_.__value_ = 0;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  Client *value;
  const char *v5;
  uint8_t *v6;
  objc_super v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: dealloc", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: dealloc", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder dealloc]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }

  self->_workingDirectory = 0;
  self->_workoutRecorderTrigger = 0;

  self->_drivingRecorderTrigger = 0;
  value = self->_serviceLocationClient.__ptr_.__value_;
  if (value)
  {

    self->_serviceLocationClient.__ptr_.__value_ = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CLWorkoutRecorder;
  -[CLWorkoutRecorder dealloc](&v7, "dealloc");
}

+ (BOOL)isSupported
{
  int v2;
  int v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  int v12;
  int v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  sub_1018BF25C(buf, "WorkoutRecorderDisable", (unsigned __int8 *)&unk_101CEB274, 0);
  v2 = buf[1];
  sub_1018BF25C(buf, "WorkoutRecorderAlwaysOn", byte_101CEB275, 0);
  v3 = buf[1];
  if (objc_opt_class(MCProfileConnection, v4))
    v5 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed");
  else
    v5 = 0;
  sub_100197040();
  if (sub_1000C4240())
    v6 = +[CLWorkoutRecorderAvailability isSupportedForHardware:](CLWorkoutRecorderAvailability, "isSupportedForHardware:", sub_1001AA9A8());
  else
    v6 = 0;
  v7 = +[CLWorkoutRecorderAvailability isSupportedWithExplicitDisable:withIHAOverride:withIHAOptIn:withHwSupport:](CLWorkoutRecorderAvailability, "isSupportedWithExplicitDisable:withIHAOverride:withIHAOptIn:withHwSupport:", v2 != 0, v3 != 0, v5, v6);
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v8 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    v18 = v2;
    v19 = 1024;
    v20 = v3;
    v21 = 1024;
    v22 = (int)v5;
    v23 = 1024;
    v24 = v6;
    v25 = 1024;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: isSupported Flags - disable: %d, alwaysOn: %d, iha: %d, hwSupported: %d, isSupported, %d", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    LOWORD(v13) = 1024;
    HIWORD(v13) = v3;
    HIWORD(v14) = WORD1(v6);
    v15 = 1024;
    v16 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: isSupported Flags - disable: %d, alwaysOn: %d, iha: %d, hwSupported: %d, isSupported, %d", &v12, 32, 67110144, v13, (_DWORD)v5);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "+[CLWorkoutRecorder isSupported]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  return v7;
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Beginning service.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Beginning service.", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  if (-[CLWorkoutRecorder createWorkingDirectory](self, "createWorkingDirectory"))
    sub_100E35814();
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  double ellipsoidalAltitude;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Ending service.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Ending service.", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder endService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  ellipsoidalAltitude = self->_recentLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0)
  {
    (*(void (**)(double))(**(_QWORD **)&ellipsoidalAltitude + 8))(COERCE_DOUBLE(*(_QWORD *)&ellipsoidalAltitude));
    self->_recentLocation.ellipsoidalAltitude = 0.0;
  }
  v6 = *(_QWORD *)&self->_recentLocation.fromSimulationController;
  *(_QWORD *)&self->_recentLocation.fromSimulationController = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  objc_msgSend(self->_serviceLocationProvider, "unregisterForWeatherUpdates:", self);

  self->_serviceLocationProvider = 0;
}

- (BOOL)canStartRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  _QWORD v24[2];
  uint8_t buf[1640];

  if (+[CLWorkoutRecorder isSupported](CLWorkoutRecorder, "isSupported"))
  {
    if (self->_workingDirectory)
    {
      if (-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace](self, "workingDirectoryHasSufficientFreeSpace"))
      {
        if (*a3)
        {
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D75B8);
          v9 = qword_10229FE38;
          if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, already recording.", buf, 2u);
          }
          v10 = sub_1001BFF7C(115, 2);
          if (v10)
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE30 != -1)
              dispatch_once(&qword_10229FE30, &stru_1021D75B8);
            LOWORD(v24[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, already recording.", v24, 2, v24[0]);
LABEL_81:
            v20 = (uint8_t *)v11;
            sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder canStartRecording:settings:publisher:]", "%s\n", v11);
            if (v20 != buf)
              free(v20);
            LOBYTE(v10) = 0;
          }
        }
        else if (a5)
        {
          if ((objc_msgSend(a5, "canPublish") & 1) != 0)
          {
            if (-[CLRecordingTriggerBase isRecording](self->_workoutRecorderTrigger, "isRecording")
              || -[CLRecordingTriggerBase isRecording](self->_drivingRecorderTrigger, "isRecording"))
            {
              if (qword_10229FE30 != -1)
                dispatch_once(&qword_10229FE30, &stru_1021D75B8);
              v15 = qword_10229FE38;
              if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, session already being captured.", buf, 2u);
              }
              v10 = sub_1001BFF7C(115, 2);
              if (v10)
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE30 != -1)
                  dispatch_once(&qword_10229FE30, &stru_1021D75B8);
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, session already being captured.", v24, 2, v24[0]);
                goto LABEL_81;
              }
            }
            else if (-[CLWorkoutRecorder acquireTokenWithSettings:publisher:](self, "acquireTokenWithSettings:publisher:", a4, a5))
            {
              if (qword_10229FE30 != -1)
                dispatch_once(&qword_10229FE30, &stru_1021D75B8);
              v18 = qword_10229FE38;
              if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Can Start Recording", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE30 != -1)
                  dispatch_once(&qword_10229FE30, &stru_1021D75B8);
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Can Start Recording", v24, 2);
                v22 = (uint8_t *)v21;
                sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder canStartRecording:settings:publisher:]", "%s\n", v21);
                if (v22 != buf)
                  free(v22);
              }
              LOBYTE(v10) = 1;
            }
            else
            {
              if (qword_10229FE30 != -1)
                dispatch_once(&qword_10229FE30, &stru_1021D75B8);
              v19 = qword_10229FE38;
              if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Not recording, rate limit reached.", buf, 2u);
              }
              v10 = sub_1001BFF7C(115, 2);
              if (v10)
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE30 != -1)
                  dispatch_once(&qword_10229FE30, &stru_1021D75B8);
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Not recording, rate limit reached.", v24, 2, v24[0]);
                goto LABEL_81;
              }
            }
          }
          else
          {
            if (qword_10229FE30 != -1)
              dispatch_once(&qword_10229FE30, &stru_1021D75B8);
            v17 = qword_10229FE38;
            if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, publisher is not ready to publish.", buf, 2u);
            }
            v10 = sub_1001BFF7C(115, 2);
            if (v10)
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE30 != -1)
                dispatch_once(&qword_10229FE30, &stru_1021D75B8);
              LOWORD(v24[0]) = 0;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, publisher is not ready to publish.", v24, 2, v24[0]);
              goto LABEL_81;
            }
          }
        }
        else
        {
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D75B8);
          v16 = qword_10229FE38;
          if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no publisher.", buf, 2u);
          }
          v10 = sub_1001BFF7C(115, 2);
          if (v10)
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE30 != -1)
              dispatch_once(&qword_10229FE30, &stru_1021D75B8);
            LOWORD(v24[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, no publisher.", v24, 2, v24[0]);
            goto LABEL_81;
          }
        }
      }
      else
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D75B8);
        v14 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, not enough free space in working directory.", buf, 2u);
        }
        v10 = sub_1001BFF7C(115, 2);
        if (v10)
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D75B8);
          LOWORD(v24[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, not enough free space in working directory.", v24, 2, v24[0]);
          goto LABEL_81;
        }
      }
    }
    else
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      v13 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no working directory.", buf, 2u);
      }
      v10 = sub_1001BFF7C(115, 2);
      if (v10)
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D75B8);
        LOWORD(v24[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, no working directory.", v24, 2, v24[0]);
        goto LABEL_81;
      }
    }
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v12 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no longer allowed.", buf, 2u);
    }
    v10 = sub_1001BFF7C(115, 2);
    if (v10)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v24[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: Unable to start recording, no longer allowed.", v24, 2, v24[0]);
      goto LABEL_81;
    }
  }
  return v10;
}

- (BOOL)didPublishRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  id v6;
  double v10;
  NSObject *v11;
  id v12;
  id v13;
  NSDate *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint8_t *v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  _QWORD v25[2];
  uint8_t buf[1640];

  v6 = *a3;
  if (!*a3)
    return (char)v6;
  objc_msgSend(v6, "stopTime");
  if (v10 == 0.0)
  {
LABEL_30:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  if (self->_deviceUnlocked)
  {
    if (a5)
    {
      if (+[CLWorkoutRecorder isSupported](CLWorkoutRecorder, "isSupported"))
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D75B8);
        v11 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Publishing Recording", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D75B8);
          LOWORD(v25[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Publishing Recording", v25, 2);
          v21 = (uint8_t *)v20;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v20);
          if (v21 != buf)
            free(v21);
        }
        v12 = objc_msgSend(*a3, "recordingURLs");
        v13 = objc_msgSend(*a3, "metadata");
        objc_msgSend(*a3, "startTime");
        v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        objc_msgSend(*a3, "stopTime");
        objc_msgSend(a5, "publishDataFiles:metadata:startDate:endDate:settings:", v12, v13, v14, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"), a4);
      }
      else
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D75B8);
        v19 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Unable to publish recording, no longer allowed.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D75B8);
          LOWORD(v25[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Unable to publish recording, no longer allowed.", v25, 2);
          v23 = (uint8_t *)v22;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v22);
          if (v23 != buf)
            free(v23);
        }
      }
      LOBYTE(v6) = 1;
      return (char)v6;
    }
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v17 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Deferring publishing of recording until publisher is created.", buf, 2u);
    }
    LODWORD(v6) = sub_1001BFF7C(115, 2);
    if ((_DWORD)v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Deferring publishing of recording until publisher is created.", v25, 2, v25[0]);
LABEL_28:
      v18 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v16);
      if (v18 != buf)
        free(v18);
      goto LABEL_30;
    }
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v15 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Deferring publishing of recording until device is unlocked.", buf, 2u);
    }
    LODWORD(v6) = sub_1001BFF7C(115, 2);
    if ((_DWORD)v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Deferring publishing of recording until device is unlocked.", v25, 2, v25[0]);
      goto LABEL_28;
    }
  }
  return (char)v6;
}

- (id)getWorkingDirectory
{
  return self->_workingDirectory;
}

- (CLDaemonLocation)getRecentLocation
{
  return &self->_recentLocation;
}

- (id)getRecentWeatherData
{
  return self->_serviceLocationClient.__ptr_.__value_;
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3)
  {
    if (*a3 == 1 && *((_BYTE *)a4 + 4))
    {
      self->_deviceUnlocked = 1;
LABEL_7:
      -[CLRecordingTriggerBase publishRecording](self->_workoutRecorderTrigger, "publishRecording");
      -[CLRecordingTriggerBase publishRecording](self->_drivingRecorderTrigger, "publishRecording");
    }
  }
  else
  {
    if (*(_DWORD *)a4 == 1)
    {
      self->_deviceUnlocked = 1;
      goto LABEL_7;
    }
    self->_deviceUnlocked = 0;
  }
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  $AB5116BA7E623E054F959CECB034F4E7 v9;
  __int128 v10;

  if (*a3 == 5)
  {
    v4 = *((_OWORD *)a4 + 1);
    *(_OWORD *)&self->_recentLocation.suitability = *(_OWORD *)a4;
    *(_OWORD *)&self->_recentLocation.coordinate.longitude = v4;
    v5 = *((_OWORD *)a4 + 5);
    v7 = *((_OWORD *)a4 + 2);
    v6 = *((_OWORD *)a4 + 3);
    *(_OWORD *)&self->_recentLocation.course = *((_OWORD *)a4 + 4);
    *(_OWORD *)&self->_recentLocation.timestamp = v5;
    *(_OWORD *)&self->_recentLocation.altitude = v7;
    *(_OWORD *)&self->_recentLocation.speed = v6;
    v9 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
    v8 = *((_OWORD *)a4 + 8);
    v10 = *((_OWORD *)a4 + 6);
    *(_OWORD *)&self->_recentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
    self->_recentLocation.rawCoordinate = v9;
    *(_OWORD *)&self->_recentLocation.rawCourse = v8;
    *(_OWORD *)&self->_recentLocation.lifespan = v10;
  }
}

- (BOOL)acquireTokenWithSettings:(void *)a3 publisher:(id)a4
{
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  NSObject *v9;
  uint8_t *v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  uint8_t *v15;
  uint8_t *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  _QWORD v25[2];
  uint8_t buf[1640];

  if (sub_1018C129C(*(_QWORD *)a3))
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v6 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: acquireTokenWithSettings, rate limiting is disabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: acquireTokenWithSettings, rate limiting is disabled", v25, 2);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    goto LABEL_7;
  }
  if (!a4)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v12 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token, no publisher.", buf, 2u);
    }
    v13 = sub_1001BFF7C(115, 0);
    LOBYTE(v7) = 0;
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v25[0]) = 0;
      v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token, no publisher.", v25, 2);
      v16 = v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v14);
      goto LABEL_46;
    }
    return v7;
  }
  if ((sub_1018C12FC(*(_QWORD *)a3) & 1) == 0)
  {
    sub_100197040();
    if ((sub_10075D288() & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(a4, "requestConfiguration");
  v8 = sub_1018C135C(*(_QWORD *)a3);
  if ((double)rand() * 4.65661287e-10 > v8)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v9 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token. Filtered out due to server side sampling rate.", buf, 2u);
    }
    v7 = sub_1001BFF7C(115, 2);
    if (v7)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LOWORD(v25[0]) = 0;
      v11 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token. Filtered out due to server side sampling rate.", v25, 2, v25[0]);
LABEL_45:
      v16 = v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v11);
LABEL_46:
      if (v16 != buf)
        free(v16);
      LOBYTE(v7) = 0;
      return v7;
    }
    return v7;
  }
  v17 = sub_1018C117C(*(_QWORD *)a3);
  v18 = sub_1018C11DC(*(_QWORD *)a3);
  v19 = sub_1018C1044(*(_QWORD *)a3);
  v20 = *(_QWORD *)a3;
  if (v19 >= v17)
  {
    sub_1018C10A4(v20, 1u);
    goto LABEL_32;
  }
  sub_1018C10A4(v20, v19 + 1);
  if (v19 <= v18)
  {
LABEL_7:
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_32:
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v21 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token due to system side sampling rate.", buf, 2u);
  }
  v7 = sub_1001BFF7C(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    LOWORD(v25[0]) = 0;
    v11 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token due to system side sampling rate.", v25, 2, v25[0]);
    goto LABEL_45;
  }
  return v7;
}

- (BOOL)createWorkingDirectory
{
  NSFileManager *v3;
  char *v4;
  __int128 *p_dst;
  NSString *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  NSURL **p_workingDirectory;
  NSObject *v15;
  const char *v17;
  char v18;
  void *v19[2];
  char v20;
  uint8_t buf[4];
  _BYTE v22[20];
  uint64_t v23;
  __int128 __dst;
  uint64_t v25;

  v3 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v4 = -[NSString UTF8String](-[NSString stringByAppendingString:](NSTemporaryDirectory(), "stringByAppendingString:", CFSTR("/WorkoutRecorder")), "UTF8String");
  sub_1015A2E04(v19, v4);
  sub_1018C9D4C((BOOL *)buf, "WorkoutRecorderWorkingDirectory", (__int128 *)v19, 0);
  if (SHIBYTE(v23) < 0)
  {
    sub_100115CE4(&__dst, *(void **)&v22[4], *(unint64_t *)&v22[12]);
  }
  else
  {
    __dst = *(_OWORD *)&v22[4];
    v25 = v23;
  }
  if (v25 >= 0)
    p_dst = &__dst;
  else
    p_dst = (__int128 *)__dst;
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_dst);
  if (SHIBYTE(v25) < 0)
    operator delete((void *)__dst);
  if (SHIBYTE(v23) < 0)
    operator delete(*(void **)&v22[4]);
  if (v20 < 0)
    operator delete(v19[0]);
  v18 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v3, "fileExistsAtPath:isDirectory:", v6, &v18))
  {
    if (!v18)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      v15 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to create working directory, path exists as a file, path: %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LODWORD(__dst) = 138543362;
      *(_QWORD *)((char *)&__dst + 4) = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutRecorder: Unable to create working directory, path exists as a file, path: %{public}@", &__dst, 12);
      v9 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v17);
      goto LABEL_45;
    }
    v19[0] = 0;
    -[NSFileManager removeItemAtPath:error:](v3, "removeItemAtPath:error:", v6, v19);
    if (v19[0])
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      v7 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void **)v22 = v19[0];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to delete working directory, error: %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v19[0];
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutRecorder: Unable to delete working directory, error: %{public}@", &__dst, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v8);
LABEL_45:
      if (v9 != buf)
        free(v9);
      return 0;
    }
  }
  v19[0] = 0;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, v19);
  v10 = v19[0] == 0;
  if (v19[0])
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v11 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void **)v22 = v19[0];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLWorkoutRecorder: Unable to create working directory, error: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v19[0];
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 1, "CLWorkoutRecorder: Unable to create working directory, error: %{public}@", &__dst, 12);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
  else
  {
    p_workingDirectory = &self->_workingDirectory;

    *p_workingDirectory = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6);
  }
  return v10;
}

- (BOOL)workingDirectoryHasSufficientFreeSpace
{
  NSDictionary *v3;
  id v4;
  NSObject *v5;
  unint64_t v6;
  BOOL result;
  NSObject *v8;
  NSString *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSString *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _BYTE v18[12];
  __int16 v19;
  uint64_t v20;
  uint8_t buf[4];
  _BYTE v22[18];

  if (!self->_workingDirectory)
    return 0;
  v17 = 0;
  v3 = -[NSFileManager attributesOfFileSystemForPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfFileSystemForPath:error:", -[NSURL path](self->_workingDirectory, "path"), &v17);
  if (!v17 && v3)
  {
    v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", NSFileSystemFreeSize);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Working directory free space: %{public}@ bytes.", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75B8);
      *(_DWORD *)v18 = 138543362;
      *(_QWORD *)&v18[4] = v4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Working directory free space: %{public}@ bytes.", v18, 12);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    *(_QWORD *)v18 = 209715200;
    sub_1018CA5B4(buf, "WorkoutRecorderWorkingDirectoryMinSpace", v18, 0);
    v6 = *(_QWORD *)&v22[4];
    return (unint64_t)objc_msgSend(v4, "unsignedLongLongValue") > v6;
  }
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v8 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
  {
    v9 = -[NSURL path](self->_workingDirectory, "path");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v22 = v9;
    *(_WORD *)&v22[8] = 2114;
    *(_QWORD *)&v22[10] = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to get free space of working directory. Assuming no free space, path: %{public}@, error: %{public}@", buf, 0x16u);
  }
  v10 = sub_1001BFF7C(115, 0);
  result = 0;
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v11 = qword_10229FE38;
    v12 = -[NSURL path](self->_workingDirectory, "path");
    *(_DWORD *)v18 = 138543618;
    *(_QWORD *)&v18[4] = v12;
    v19 = 2114;
    v20 = v17;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 16, "CLWorkoutRecorder: Unable to get free space of working directory. Assuming no free space, path: %{public}@, error: %{public}@", v18, 22);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
    return 0;
  }
  return result;
}

- (void)handleResponse:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75B8);
  v5 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Received configuration: %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75B8);
    v8 = 138477827;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecorder: Received configuration: %{private}@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorder handleResponse:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[CLRecordingTriggerBase handlePublisherResponse:](self->_workoutRecorderTrigger, "handlePublisherResponse:", a3);
  -[CLRecordingTriggerBase handlePublisherResponse:](self->_drivingRecorderTrigger, "handlePublisherResponse:", a3);
}

- (void)didUpdateWeather:(id)a3
{
  Client *v5;

  v5 = (Client *)objc_msgSend(a3, "copy");
  self->_serviceLocationClient.__ptr_.__value_ = v5;
  -[CLRecordingTriggerBase feedWeatherData:](self->_workoutRecorderTrigger, "feedWeatherData:", v5);
  -[CLRecordingTriggerBase feedWeatherData:](self->_drivingRecorderTrigger, "feedWeatherData:", self->_serviceLocationClient.__ptr_.__value_);
}

- (void)onWorkoutEffortScoreUpdate:(id)a3
{
  CLWorkoutRecorderTrigger *workoutRecorderTrigger;
  _QWORD v4[4];

  if (a3)
  {
    workoutRecorderTrigger = self->_workoutRecorderTrigger;
    (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
    -[CLRecordingTriggerBase feedWorkoutEffortEstimate:](workoutRecorderTrigger, "feedWorkoutEffortEstimate:", v4);
  }
}

- (CLWorkoutRecorderPublisher)publisher
{
  return (CLWorkoutRecorderPublisher *)self->_recentWeatherData;
}

- (void).cxx_destruct
{
  uint64_t v3;
  Client *value;

  v3 = *(_QWORD *)&self->_recentLocation.fromSimulationController;
  *(_QWORD *)&self->_recentLocation.fromSimulationController = 0;
  if (v3)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v3 + 8))(v3, a2);
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 12) = 0xFFFF;
  *(_QWORD *)((char *)self + 60) = 0;
  *(_QWORD *)((char *)self + 52) = 0;
  *(_OWORD *)((char *)self + 68) = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 84) = _Q0;
  *(_OWORD *)((char *)self + 100) = _Q0;
  *(_OWORD *)((char *)self + 116) = _Q0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 40) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0xBFF0000000000000;
  *(_QWORD *)((char *)self + 164) = 0xBFF0000000000000;
  *((_DWORD *)self + 43) = 0x7FFFFFFF;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_BYTE *)self + 200) = 0;
  *((_QWORD *)self + 27) = 0;
  return self;
}

@end
