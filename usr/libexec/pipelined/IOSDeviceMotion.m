@implementation IOSDeviceMotion

- (void)stop
{
  CMMotionManager *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSDeviceMotion;
  v2 = -[IOSAbstractInertialSensor motionManager](&v4, "motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "stopDeviceMotionUpdates");

}

- (IOSDeviceMotion)initWithMotionManager:(id)a3 andHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  id v8;
  id v9;
  IOSDeviceMotion *v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "deviceMotionUpdateInterval");
  v12.receiver = self;
  v12.super_class = (Class)IOSDeviceMotion;
  v10 = -[IOSAbstractInertialSensor initWithMotionManager:andHandler:andType:andRate:](&v12, "initWithMotionManager:andHandler:andType:andRate:", v8, v9, 8);
  v10->_referenceFrame = a5;

  return v10;
}

- (BOOL)sensorPresent
{
  CMMotionManager *v2;
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSDeviceMotion;
  v2 = -[IOSAbstractInertialSensor motionManager](&v6, "motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "isDeviceMotionAvailable");

  return v4;
}

- (void)start
{
  CMMotionManager *v3;
  void *v4;
  unint64_t referenceFrame;
  NSOperationQueue *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSDeviceMotion;
  v3 = -[IOSAbstractInertialSensor motionManager](&v10, "motionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  referenceFrame = self->_referenceFrame;
  v9.receiver = self;
  v9.super_class = (Class)IOSDeviceMotion;
  v6 = -[IOSAbstractInertialSensor motionEventProcessor](&v9, "motionEventProcessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E530;
  v8[3] = &unk_100404AA0;
  v8[4] = self;
  objc_msgSend(v4, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", referenceFrame, v7, v8);

}

+ (void)convertGToAccel:(SensorMeasurement *)a3
{
  *(float64x2_t *)&a3->var1 = vmulq_n_f64(*(float64x2_t *)&a3->var1, -9.81);
  a3->var3 = -(9.81 * a3->var3);
}

- (id)description
{
  return CFSTR("fused device motion");
}

@end
