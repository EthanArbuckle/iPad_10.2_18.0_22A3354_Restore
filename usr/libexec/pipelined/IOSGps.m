@implementation IOSGps

- (IOSGps)initWithDisableBackground:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSGps;
  if (-[IOSGps init](&v4, "init"))
    operator new();

  return 0;
}

- (void)locationManager:(id)a3 didUpdateToLocation:(id)a4 fromLocation:(id)a5
{
  (*(void (**)(GPSSensor *, id))(*(_QWORD *)self->_gpsSensor.__ptr_.__value_ + 56))(self->_gpsSensor.__ptr_.__value_, a4);
}

- (BOOL)sensorPresent
{
  return MGGetBoolAnswer(CFSTR("gps"));
}

- (void)start
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F3F10;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stop
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F4078;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)getSensor
{
  return self->_gpsSensor.__ptr_.__value_;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSLog(CFSTR("IOSGPS: Authorization status changed!"), a2, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  GPSSensor *value;

  objc_storeStrong((id *)&self->_locationManager, 0);
  value = self->_gpsSensor.__ptr_.__value_;
  self->_gpsSensor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(GPSSensor *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
