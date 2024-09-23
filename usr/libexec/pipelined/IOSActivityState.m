@implementation IOSActivityState

- (void).cxx_destruct
{
  IOSActivityStateSensorBridge *value;

  objc_storeStrong((id *)&self->_motionEventProcessor, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  value = self->_sensorBridge.__ptr_.__value_;
  self->_sensorBridge.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(IOSActivityStateSensorBridge *))(*(_QWORD *)value + 8))(value);
}

- (IOSActivityState)initWithMotionActivityManager:(id)a3 andHandler:(id)a4
{
  id v7;
  id v8;
  IOSActivityState *v9;
  IOSActivityState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IOSActivityState;
  v9 = -[IOSActivityState init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_motionActivityManager, a3);
    objc_storeStrong((id *)&v10->_motionEventProcessor, a4);
    operator new();
  }

  return 0;
}

- (void)stop
{
  -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
}

- (void)start
{
  NSOperationQueue *motionEventProcessor;
  CMMotionActivityManager *motionActivityManager;
  _QWORD v4[5];

  motionActivityManager = self->_motionActivityManager;
  motionEventProcessor = self->_motionEventProcessor;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E310;
  v4[3] = &unk_100404A40;
  v4[4] = self;
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](motionActivityManager, "startActivityUpdatesToQueue:withHandler:", motionEventProcessor, v4);
}

- (BOOL)sensorPresent
{
  return +[CMMotionActivityManager isActivityAvailable](CMMotionActivityManager, "isActivityAvailable");
}

- (void)getSensor
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (IOSActivityState)init
{
  NSObject *v4;
  int v6;
  const char *v7;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404A78);
    v4 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    v6 = 136315138;
    v7 = "-[IOSActivityState init]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  -[IOSActivityState doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)sensorBridge
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (id)description
{
  return CFSTR("activity state");
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (NSOperationQueue)motionEventProcessor
{
  return self->_motionEventProcessor;
}

@end
