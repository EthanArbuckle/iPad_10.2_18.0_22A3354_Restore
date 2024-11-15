@implementation BKAccelerometerClientBKSAccelerometer

- (void)handleAccelerometerEventWithTimestamp:(double)a3 x:(float)a4 y:(float)a5 z:(float)a6 samplingInterval:(double)a7
{
  void *v13;
  _QWORD v14[7];
  float v15;
  float v16;
  float v17;

  if (-[BKAccelerometerClient wantsAccelerometerEvents](self, "wantsAccelerometerEvents"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAccelerometerClientBKSAccelerometer sendRight](self, "sendRight"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100018188;
    v14[3] = &unk_1000EACE0;
    v14[4] = self;
    v15 = a4;
    v16 = a5;
    v17 = a6;
    *(double *)&v14[5] = a3;
    *(double *)&v14[6] = a7;
    objc_msgSend(v13, "accessPort:", v14);

  }
}

- (BOOL)_deathBySendRight
{
  return 1;
}

- (BOOL)_deathByPid
{
  return 0;
}

- (void)_queue_invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKAccelerometerClientBKSAccelerometer;
  -[BKAccelerometerClient _queue_invalidate](&v2, "_queue_invalidate");
}

@end
