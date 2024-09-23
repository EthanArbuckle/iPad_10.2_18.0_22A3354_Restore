@implementation IOSMagnetometer

- (IOSMagnetometer)initWithMotionManager:(id)a3 andHandler:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSMagnetometer;
  return -[IOSAbstractInertialSensor initWithMotionManager:andHandler:andType:andRate:](&v5, "initWithMotionManager:andHandler:andType:andRate:", a3, a4, 15, 0.0166666675);
}

- (BOOL)sensorPresent
{
  CMMotionManager *v2;
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSMagnetometer;
  v2 = -[IOSAbstractInertialSensor motionManager](&v6, "motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "isMagnetometerAvailable");

  return v4;
}

- (void)start
{
  double v3;
  double v4;
  CMMotionManager *v5;
  void *v6;
  CMMotionManager *v7;
  void *v8;
  NSOperationQueue *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IOSMagnetometer;
  -[IOSAbstractInertialSensor updateInterval](&v15, "updateInterval");
  v4 = v3;
  v14.receiver = self;
  v14.super_class = (Class)IOSMagnetometer;
  v5 = -[IOSAbstractInertialSensor motionManager](&v14, "motionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setMagnetometerUpdateInterval:", v4);

  v13.receiver = self;
  v13.super_class = (Class)IOSMagnetometer;
  v7 = -[IOSAbstractInertialSensor motionManager](&v13, "motionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12.receiver = self;
  v12.super_class = (Class)IOSMagnetometer;
  v9 = -[IOSAbstractInertialSensor motionEventProcessor](&v12, "motionEventProcessor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F51E4;
  v11[3] = &unk_100404E38;
  v11[4] = self;
  objc_msgSend(v8, "startMagnetometerUpdatesToQueue:withHandler:", v10, v11);

}

- (void)stop
{
  CMMotionManager *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSMagnetometer;
  v2 = -[IOSAbstractInertialSensor motionManager](&v4, "motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "stopMagnetometerUpdates");

}

- (id)description
{
  return CFSTR("magnetometer");
}

@end
