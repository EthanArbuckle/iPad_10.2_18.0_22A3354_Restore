@implementation IOSAbstractInertialSensor

- (void).cxx_destruct
{
  IOSInertialSensorBridge *value;

  objc_storeStrong((id *)&self->_motionEventProcessor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  value = self->_sensorBridge.__ptr_.__value_;
  self->_sensorBridge.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(IOSInertialSensorBridge *))(*(_QWORD *)value + 8))(value);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (IOSAbstractInertialSensor)initWithMotionManager:(id)a3 andHandler:(id)a4 andType:(int)a5 andRate:(double)a6
{
  id v9;
  id v10;
  IOSAbstractInertialSensor *v11;
  IOSAbstractInertialSensor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IOSAbstractInertialSensor;
  v11 = -[IOSAbstractInertialSensor init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_motionManager, a3);
    objc_storeStrong((id *)&v12->_motionEventProcessor, a4);
    operator new();
  }

  return 0;
}

- (void)sensorBridge
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (NSOperationQueue)motionEventProcessor
{
  return self->_motionEventProcessor;
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

- (IOSAbstractInertialSensor)init
{
  NSObject *v4;
  int v6;
  const char *v7;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404B90);
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
    v7 = "-[IOSAbstractInertialSensor init]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  -[IOSAbstractInertialSensor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)sensorPresent
{
  NSObject *v4;
  int v6;
  const char *v7;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404B90);
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
    v7 = "-[IOSAbstractInertialSensor sensorPresent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  -[IOSAbstractInertialSensor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)start
{
  NSObject *v4;
  int v5;
  const char *v6;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404B90);
    v4 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    v5 = 136315138;
    v6 = "-[IOSAbstractInertialSensor start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v5, 0xCu);
  }
LABEL_4:
  -[IOSAbstractInertialSensor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)stop
{
  NSObject *v4;
  int v5;
  const char *v6;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404B90);
    v4 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    v5 = 136315138;
    v6 = "-[IOSAbstractInertialSensor stop]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v5, 0xCu);
  }
LABEL_4:
  -[IOSAbstractInertialSensor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

@end
