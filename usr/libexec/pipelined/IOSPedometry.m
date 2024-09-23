@implementation IOSPedometry

- (void)start
{
  CMPedometer *pedometer;
  id v4;
  _QWORD v5[5];

  pedometer = self->_pedometer;
  v4 = objc_alloc_init((Class)NSDate);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F79C8;
  v5[3] = &unk_100405100;
  v5[4] = self;
  -[CMPedometer startPedometerUpdatesFromDate:withHandler:](pedometer, "startPedometerUpdatesFromDate:withHandler:", v4, v5);

}

- (IOSPedometry)init
{
  IOSPedometry *v2;
  CMPedometer *v3;
  CMPedometer *pedometer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSPedometry;
  v2 = -[IOSPedometry init](&v6, "init");
  if (v2)
  {
    v3 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
    pedometer = v2->_pedometer;
    v2->_pedometer = v3;

    operator new();
  }
  return 0;
}

- (void)stop
{
  -[CMPedometer stopPedometerUpdates](self->_pedometer, "stopPedometerUpdates");
}

- (BOOL)sensorPresent
{
  if (+[CMPedometer isStepCountingAvailable](CMPedometer, "isStepCountingAvailable")
    || +[CMPedometer isDistanceAvailable](CMPedometer, "isDistanceAvailable"))
  {
    return 1;
  }
  else
  {
    return +[CMPedometer isFloorCountingAvailable](CMPedometer, "isFloorCountingAvailable");
  }
}

- (void)getSensor
{
  return self->_sensor.__ptr_.__value_;
}

- (void).cxx_destruct
{
  PedometrySensor *value;

  value = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(PedometrySensor *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_pedometer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
