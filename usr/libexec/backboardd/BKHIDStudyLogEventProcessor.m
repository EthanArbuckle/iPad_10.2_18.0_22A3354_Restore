@implementation BKHIDStudyLogEventProcessor

- (BKHIDStudyLogEventProcessor)initWithContext:(id)a3
{
  id v4;
  BKHIDStudyLogEventProcessor *v5;
  uint64_t v6;
  BKSLocalDefaults *localDefaults;
  uint64_t v8;
  SLGLog *keyboardLog;
  dispatch_queue_t v10;
  OS_dispatch_queue *matcherQueue;
  void *v12;
  BKIOHIDServiceMatcher *v13;
  BKIOHIDServiceMatcher *gyroMatcher;
  id v15;
  id v16;
  void *v17;
  id v18;
  SLGTimedLogger *v19;
  SLGTimedLogger *cameraLog;
  objc_super v22;

  v4 = a3;
  if (+[BKHIDStudyLogEventProcessor shouldCreateStudyLogger](BKHIDStudyLogEventProcessor, "shouldCreateStudyLogger"))
  {
    v22.receiver = self;
    v22.super_class = (Class)BKHIDStudyLogEventProcessor;
    v5 = -[BKHIDStudyLogEventProcessor init](&v22, "init");
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
      localDefaults = v5->_localDefaults;
      v5->_localDefaults = (BKSLocalDefaults *)v6;

      v8 = objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
      keyboardLog = v5->_keyboardLog;
      v5->_keyboardLog = (SLGLog *)v8;

      v10 = dispatch_queue_create("BKHIDEventStudyLoggerMatcherQueue", 0);
      matcherQueue = v5->_matcherQueue;
      v5->_matcherQueue = (OS_dispatch_queue *)v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceMatcherDataProvider"));
      v13 = (BKIOHIDServiceMatcher *)objc_msgSend(objc_alloc((Class)BKIOHIDServiceMatcher), "initWithUsagePage:usage:builtIn:dataProvider:", 65280, 9, 1, v12);
      gyroMatcher = v5->_gyroMatcher;
      v5->_gyroMatcher = v13;

      -[BKIOHIDServiceMatcher startObserving:queue:](v5->_gyroMatcher, "startObserving:queue:", v5, v5->_matcherQueue);
      v15 = objc_alloc((Class)SLGTimedLogger);
      v16 = objc_alloc((Class)SLGActivatableLogger);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
      v18 = objc_msgSend(v16, "initWithLogger:", v17);
      v19 = (SLGTimedLogger *)objc_msgSend(v15, "initWithLogger:duration:", v18, 1.0);
      cameraLog = v5->_cameraLog;
      v5->_cameraLog = v19;

      -[SLGTimedLogger setActivationHandler:](v5->_cameraLog, "setActivationHandler:", &stru_1000E9B78);
      -[SLGTimedLogger setDeactivationHandler:](v5->_cameraLog, "setDeactivationHandler:", &stru_1000E9B98);

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BKIOHIDServiceMatcher invalidate](self->_gyroMatcher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKHIDStudyLogEventProcessor;
  -[BKHIDStudyLogEventProcessor dealloc](&v3, "dealloc");
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  __IOHIDEvent *v6;
  int Type;
  SLGTimedLogger *cameraLog;
  BKSLocalDefaults *v9;
  SLGLog *v10;
  SLGTimedLogger *v11;
  BKSLocalDefaults *v12;
  __int16 IntegerValue;
  __int16 v14;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  BKSLocalDefaults *localDefaults;
  SLGTimedLogger *v19;
  const __CFString *v20;
  BKSLocalDefaults *v21;
  const __CFString *v22;
  void ***v23;
  SLGLog *v24;
  uint64_t v25;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  id (*v34)(uint64_t);
  void *v35;
  __IOHIDEvent *v36;

  v6 = *a3;
  Type = IOHIDEventGetType(*a3);
  switch(Type)
  {
    case 20:
      localDefaults = self->_localDefaults;
      v19 = self->_cameraLog;
      if ((-[BKSLocalDefaults disableStudyLogGyroLogging](localDefaults, "disableStudyLogGyroLogging") & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        v33 = 3221225472;
        v34 = sub_100020118;
        v35 = &unk_1000E9C18;
        v36 = v6;
        v20 = CFSTR("com.apple.backboard.hid.gyro");
LABEL_16:
        -[SLGTimedLogger logBlock:domain:](v19, "logBlock:domain:", &v32, v20);
      }
LABEL_17:

      return 0;
    case 12:
      v21 = self->_localDefaults;
      v19 = self->_cameraLog;
      if ((-[BKSLocalDefaults disableStudyLogALSLogging](v21, "disableStudyLogALSLogging") & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        v33 = 3221225472;
        v34 = sub_1000202CC;
        v35 = &unk_1000E9C18;
        v36 = v6;
        v20 = CFSTR("com.apple.backboard.hid.als");
        goto LABEL_16;
      }
      goto LABEL_17;
    case 3:
      cameraLog = self->_cameraLog;
      v9 = self->_localDefaults;
      v10 = self->_keyboardLog;
      v11 = cameraLog;
      v12 = v9;
      if ((-[BKSLocalDefaults disableStudyLogButtonLogging](v12, "disableStudyLogButtonLogging") & 1) != 0)
      {
LABEL_36:
        v17 = 0;
        goto LABEL_37;
      }
      IntegerValue = IOHIDEventGetIntegerValue(v6, 196608);
      v14 = IOHIDEventGetIntegerValue(v6, 196609);
      v15 = IOHIDEventGetIntegerValue(v6, 196610);
      v16 = v15 != 0;
      if (IntegerValue == 144)
      {
        if ((-[BKSLocalDefaults disableStudyLogCameraKeyLogging](v12, "disableStudyLogCameraKeyLogging") & 1) != 0
          || v14 != 33)
        {
          goto LABEL_35;
        }
        -[SLGTimedLogger setActive:](v11, "setActive:", 1);
        v27 = _NSConcreteStackBlock;
        v28 = 3221225472;
        v29 = sub_10001FCEC;
        v30 = &unk_1000E9BB8;
        LOWORD(v31) = v14;
        BYTE2(v31) = v16;
        v22 = CFSTR("com.apple.backboard.hid.camera");
        v23 = &v27;
        v24 = v11;
        goto LABEL_34;
      }
      if (IntegerValue != 12)
      {
        if (IntegerValue == 7)
        {
          if ((-[BKSLocalDefaults disableStudyLogBTKeyboardEventLogging](v12, "disableStudyLogBTKeyboardEventLogging") & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            v28 = 3221225472;
            v29 = sub_10001F95C;
            v30 = &unk_1000E9BB8;
            LOWORD(v31) = v14;
            BYTE2(v31) = v16;
            -[SLGLog logBlock:domain:](v10, "logBlock:domain:", &v27, CFSTR("com.apple.backboard.hid.keyboard"));
          }
          if ((-[BKSLocalDefaults disableStudyLogBTKeyboardEventRedirection](v12, "disableStudyLogBTKeyboardEventRedirection") & 1) == 0)
          {
            v17 = 1;
LABEL_37:

            return v17;
          }
        }
        goto LABEL_35;
      }
      switch(v14)
      {
        case 48:
          if ((-[BKSLocalDefaults disableStudyLogPowerButtonLogging](v12, "disableStudyLogPowerButtonLogging") & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            v28 = 3221225472;
            v29 = sub_10001FC14;
            v30 = &unk_1000EABE8;
            LOBYTE(v31) = v16;
            v22 = CFSTR("com.apple.backboard.hid.power");
LABEL_32:
            v23 = &v27;
LABEL_33:
            v24 = v10;
LABEL_34:
            -[SLGLog logBlock:domain:](v24, "logBlock:domain:", v23, v22, v27, v28, v29, v30, v31);
          }
          break;
        case 233:
          if ((-[BKSLocalDefaults disableStudyLogVolumeKeyLogging](v12, "disableStudyLogVolumeKeyLogging") & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            v28 = 3221225472;
            v29 = sub_10001FB3C;
            v30 = &unk_1000EABE8;
            LOBYTE(v31) = v16;
            v22 = CFSTR("com.apple.backboard.hid.volume");
            goto LABEL_32;
          }
          break;
        case 234:
          v25 = v15;
          if ((-[BKSLocalDefaults disableStudyLogVolumeKeyLogging](v12, "disableStudyLogVolumeKeyLogging") & 1) != 0)break;
          v27 = _NSConcreteStackBlock;
          v28 = 3221225472;
          v29 = sub_10001FA64;
          v30 = &unk_1000EABE8;
          LOBYTE(v31) = v16;
          -[SLGLog logBlock:domain:](v10, "logBlock:domain:", &v27, CFSTR("com.apple.backboard.hid.volume"));
          if (!v25)
            break;
          v23 = (void ***)&stru_1000E9BF8;
          v22 = CFSTR("com.apple.backboard.hid.volume");
          goto LABEL_33;
        default:
          break;
      }
LABEL_35:
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472;
      v34 = sub_10001FED4;
      v35 = &unk_1000E9C18;
      v36 = v6;
      -[SLGLog logBlock:domain:](v10, "logBlock:domain:", &v32, CFSTR("com.apple.backboard.hid.keyboard"));
      goto LABEL_36;
  }
  return 0;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  BKIOHIDService *v5;
  BKIOHIDService *gyroService;
  BKIOHIDService *v7;
  id v8;

  v5 = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  gyroService = self->_gyroService;
  self->_gyroService = v5;

  -[BKIOHIDService addDisappearanceObserver:queue:](self->_gyroService, "addDisappearanceObserver:queue:", self, self->_matcherQueue);
  v7 = self->_gyroService;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 100000.0));
  -[BKIOHIDService setProperty:forKey:](v7, "setProperty:forKey:", v8, CFSTR("ReportInterval"));

}

- (void)serviceDidDisappear:(id)a3
{
  BKIOHIDService *gyroService;

  gyroService = self->_gyroService;
  self->_gyroService = 0;

}

- (BOOL)isButtonLoggingEnabled
{
  return self->_buttonLoggingEnabled;
}

- (void)setButtonLoggingEnabled:(BOOL)a3
{
  self->_buttonLoggingEnabled = a3;
}

- (SLGLog)keyboardLog
{
  return self->_keyboardLog;
}

- (void)setKeyboardLog:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLog, a3);
}

- (SLGTimedLogger)cameraLog
{
  return self->_cameraLog;
}

- (void)setCameraLog:(id)a3
{
  objc_storeStrong((id *)&self->_cameraLog, a3);
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setLocalDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_localDefaults, a3);
}

- (BKIOHIDServiceMatcher)gyroMatcher
{
  return self->_gyroMatcher;
}

- (void)setGyroMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_gyroMatcher, a3);
}

- (BKIOHIDService)gyroService
{
  return self->_gyroService;
}

- (void)setGyroService:(id)a3
{
  objc_storeStrong((id *)&self->_gyroService, a3);
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
  objc_storeStrong((id *)&self->_matcherQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_gyroService, 0);
  objc_storeStrong((id *)&self->_gyroMatcher, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_cameraLog, 0);
  objc_storeStrong((id *)&self->_keyboardLog, 0);
}

+ (BOOL)shouldCreateStudyLogger
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
  v3 = objc_msgSend(v2, "isEnabled");

  if (v3)
  {
    v4 = sub_100059844();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "StudyLog is enabled", v7, 2u);
    }

  }
  return v3;
}

@end
