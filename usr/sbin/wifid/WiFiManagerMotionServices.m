@implementation WiFiManagerMotionServices

- (WiFiManagerMotionServices)init
{
  WiFiManagerMotionServices *result;
  void *v4;
  objc_super v5;

  if (objc_opt_class(CMMotionActivityManager))
  {
    if (+[CMMotionActivityManager isActivityAvailable](CMMotionActivityManager, "isActivityAvailable"))
    {
      v5.receiver = self;
      v5.super_class = (Class)WiFiManagerMotionServices;
      result = -[WiFiManagerMotionServices init](&v5, "init");
      if (result)
        return result;
      self = 0;
    }
    else
    {
      v4 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] this device does not support motion data", "-[WiFiManagerMotionServices init]");
      objc_autoreleasePoolPop(v4);
    }
  }

  return 0;
}

- (void)startMonitoringMotionState
{
  void *v3;
  void *v4;
  NSOperationQueue *v5;
  _QWORD v6[5];

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiManagerMotionServices startMonitoringMotionState]");
  objc_autoreleasePoolPop(v4);
  self->_activityManager = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
  v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  self->_motionQ = v5;
  -[NSOperationQueue setName:](v5, "setName:", CFSTR("WiFiManagerMotionServicesQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BBFD0;
  v6[3] = &unk_100230DE8;
  v6[4] = self;
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](-[WiFiManagerMotionServices activityManager](self, "activityManager"), "startActivityUpdatesToQueue:withHandler:", -[WiFiManagerMotionServices motionQ](self, "motionQ"), v6);
  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  void *v3;
  NSObject *serialActivityDispatchQ;
  objc_super v5;

  v3 = objc_autoreleasePoolPush();
  serialActivityDispatchQ = self->_serialActivityDispatchQ;
  if (serialActivityDispatchQ)
    dispatch_release(serialActivityDispatchQ);

  v5.receiver = self;
  v5.super_class = (Class)WiFiManagerMotionServices;
  -[WiFiManagerMotionServices dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (void)dispatchMotionCallback
{
  void *v3;
  void (*v4)(__WiFiManager *, _QWORD);
  __WiFiManager *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_autoreleasePoolPush();
  if (-[WiFiManagerMotionServices motionStateChangeCb](self, "motionStateChangeCb"))
  {
    v4 = -[WiFiManagerMotionServices motionStateChangeCb](self, "motionStateChangeCb");
    v5 = -[WiFiManagerMotionServices manager](self, "manager");
    v6 = -[WiFiManagerMotionServices motionState](self, "motionState");
    -[WiFiManagerMotionServices motionStartTime](self, "motionStartTime");
    v4(v5, v6);
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "motionStateChangeCb is NULL!");
    objc_autoreleasePoolPop(v7);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)stopMonitoringMotionState
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  -[CMMotionActivityManager stopActivityUpdates](-[WiFiManagerMotionServices activityManager](self, "activityManager"), "stopActivityUpdates");
  objc_autoreleasePoolPop(v3);
}

- (void)setupWalkingStartedAlarm
{
  void *v3;
  const char *v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10026C9D0;
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices walkingStartedAlarmTriggerDuration](self, "walkingStartedAlarmTriggerDuration");
    v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BC430;
    v10[3] = &unk_100230E10;
    v10[4] = self;
    self->_walkingAlarm = (CMActivityAlarm *)objc_msgSend(objc_alloc((Class)CMActivityAlarm), "initWithTrigger:duration:onQueue:withHandler:", 2, -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"), v10, v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] Setting up Walking Started Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupWalkingStartedAlarm]", *(_QWORD *)&v7);
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupWalkingStartedAlarm]", v9);
  }
  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupWalkingEndedAlarm
{
  void *v3;
  const char *v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10026C9D0;
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices walkingEndedAlarmTriggerDuration](self, "walkingEndedAlarmTriggerDuration");
    v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BC660;
    v10[3] = &unk_100230E10;
    v10[4] = self;
    self->_walkingAlarm = (CMActivityAlarm *)objc_msgSend(objc_alloc((Class)CMActivityAlarm), "initWithTrigger:duration:onQueue:withHandler:", 0, -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"), v10, v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] Setting up Walking Ended Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupWalkingEndedAlarm]", *(_QWORD *)&v7);
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupWalkingEndedAlarm]", v9);
  }
  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupDrivingStartedAlarm
{
  void *v3;
  const char *v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10026C9D0;
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices drivingStartedAlarmTriggerDuration](self, "drivingStartedAlarmTriggerDuration");
    v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BC890;
    v10[3] = &unk_100230E10;
    v10[4] = self;
    self->_drivingAlarm = (CMActivityAlarm *)objc_msgSend(objc_alloc((Class)CMActivityAlarm), "initWithTrigger:duration:onQueue:withHandler:", 4, -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"), v10, v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] Setting up Driving Started Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupDrivingStartedAlarm]", *(_QWORD *)&v7);
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupDrivingStartedAlarm]", v9);
  }
  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupDrivingEndedAlarm
{
  void *v3;
  const char *v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10026C9D0;
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices drivingEndedAlarmTriggerDuration](self, "drivingEndedAlarmTriggerDuration");
    v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BCAC0;
    v10[3] = &unk_100230E10;
    v10[4] = self;
    self->_drivingAlarm = (CMActivityAlarm *)objc_msgSend(objc_alloc((Class)CMActivityAlarm), "initWithTrigger:duration:onQueue:withHandler:", 10, -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"), v10, v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] Setting up Driving Ended Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupDrivingEndedAlarm]", *(_QWORD *)&v7);
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupDrivingEndedAlarm]", v9);
  }
  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSOperationQueue)motionQ
{
  return self->_motionQ;
}

- (void)setMotionQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)motionStateChangeCb
{
  return self->_motionStateChangeCb;
}

- (void)setMotionStateChangeCb:(void *)a3
{
  self->_motionStateChangeCb = a3;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (int)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int)a3
{
  self->_motionState = a3;
}

- (OS_dispatch_queue)serialActivityDispatchQ
{
  return self->_serialActivityDispatchQ;
}

- (void)setSerialActivityDispatchQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CMActivityAlarm)drivingAlarm
{
  return self->_drivingAlarm;
}

- (void)setDrivingAlarm:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CMActivityAlarm)walkingAlarm
{
  return self->_walkingAlarm;
}

- (void)setWalkingAlarm:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (double)drivingStartedAlarmTriggerDuration
{
  return self->_drivingStartedAlarmTriggerDuration;
}

- (void)setDrivingStartedAlarmTriggerDuration:(double)a3
{
  self->_drivingStartedAlarmTriggerDuration = a3;
}

- (double)drivingEndedAlarmTriggerDuration
{
  return self->_drivingEndedAlarmTriggerDuration;
}

- (void)setDrivingEndedAlarmTriggerDuration:(double)a3
{
  self->_drivingEndedAlarmTriggerDuration = a3;
}

- (double)walkingStartedAlarmTriggerDuration
{
  return self->_walkingStartedAlarmTriggerDuration;
}

- (void)setWalkingStartedAlarmTriggerDuration:(double)a3
{
  self->_walkingStartedAlarmTriggerDuration = a3;
}

- (double)walkingEndedAlarmTriggerDuration
{
  return self->_walkingEndedAlarmTriggerDuration;
}

- (void)setWalkingEndedAlarmTriggerDuration:(double)a3
{
  self->_walkingEndedAlarmTriggerDuration = a3;
}

- (double)motionStartTime
{
  return self->_motionStartTime;
}

- (void)setMotionStartTime:(double)a3
{
  self->_motionStartTime = a3;
}

@end
