@implementation FMDMotionMonitor

- (void)startMotionMonitoring
{
  _QWORD v2[4];
  id v3;
  id location;

  if (!self->_motionActivityManager)
  {
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1000455F8;
    v2[3] = &unk_1002C1378;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)stopMotionMonitoring
{
  _QWORD v2[4];
  id v3;
  id location;

  if (self->_motionActivityManager)
  {
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100045820;
    v2[3] = &unk_1002C1378;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (id)_deviceMotionFrom:(id)a3
{
  id v3;
  FMDDeviceMotion *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(FMDDeviceMotion);
  if ((objc_msgSend(v3, "automotive") & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v3, "cycling") & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v3, "running") & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v3, "walking") & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    v5 = objc_msgSend(v3, "stationary");
  }
  -[FMDDeviceMotion setActivityState:](v4, "setActivityState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  -[FMDDeviceMotion setActivityStartDate:](v4, "setActivityStartDate:", v6);

  return v4;
}

- (FMDDeviceMotion)lastKnownDeviceMotion
{
  return (FMDDeviceMotion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastKnownDeviceMotion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (NSOperationQueue)activityUpdateQueue
{
  return self->_activityUpdateQueue;
}

- (void)setActivityUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityUpdateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_lastKnownDeviceMotion, 0);
}

@end
