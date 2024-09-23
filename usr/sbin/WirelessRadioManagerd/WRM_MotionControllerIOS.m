@implementation WRM_MotionControllerIOS

- (int)getMobilityState
{
  return self->myMobilityState;
}

+ (id)singleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079A38;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_1002711C8 != -1)
    dispatch_once(&qword_1002711C8, block);
  return (id)qword_1002711C0;
}

- (WRM_MotionControllerIOS)init
{
  WRM_MotionControllerIOS *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionControllerIOS;
  v2 = -[WRM_MotionController init](&v4, "init");
  if (v2)
  {
    v2->mAlarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.Motion", 0);
    v2->myMobilityState = 5;
    v2->myPrevMobilityState = 5;
    v2->mMotionControllerState = 0;
    v2->mStaticAlarm = 0;
    v2->mWalkingAlarm = 0;
    v2->mRunningAlarm = 0;
    v2->mDrivingAlarm = 0;
    v2->mPedestrianAfterStatic = 0;
    v2->mDefaultAlarmDuration = 1;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, CFSTR("Motion Controller: initialized\n"));
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mAlarmQueue;
  objc_super v4;

  mAlarmQueue = self->mAlarmQueue;
  if (mAlarmQueue)
    dispatch_release(mAlarmQueue);
  self->mAlarmQueue = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, CFSTR("Handover Manager: Dealloc called for handover manager "));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, CFSTR("Handover Manager: Dealloc called for handover manager \n"));
  -[WRM_MotionControllerIOS stopMonitoringAlarms](self, "stopMonitoringAlarms");
  self->myMobilityState = 5;
  self->myPrevMobilityState = 5;
  self->mMotionControllerState = 0;
  self->mStaticAlarm = 0;
  self->mWalkingAlarm = 0;
  self->mRunningAlarm = 0;
  self->mDrivingAlarm = 0;
  self->mPedestrianAfterStatic = 0;
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionControllerIOS;
  -[WRM_MotionController dealloc](&v4, "dealloc");
}

- (int)getPrevMobilityState
{
  return self->myMobilityState;
}

- (void)updateAlarmMonitoringDuration:(int)a3
{
  self->mDefaultAlarmDuration = a3;
}

- (void)startMonitoringAlarms
{
  NSObject *mAlarmQueue;
  _QWORD block[5];

  mAlarmQueue = self->mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079CB8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopMonitoringAlarms
{
  if (+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable"))
    -[WRM_MotionControllerIOS stopPendingAlarms](self, "stopPendingAlarms");
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, CFSTR("Alarm: Motion activity not supported on the platform \n"));
}

- (void)stopAllAlarms
{
  NSObject *mAlarmQueue;
  _QWORD block[5];

  mAlarmQueue = self->mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079DF8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopPendingAlarms
{
  CMActivityAlarm *mStaticAlarm;
  CMActivityAlarm *mWalkingAlarm;
  CMActivityAlarm *mRunningAlarm;
  CMActivityAlarm *mDrivingAlarm;
  CMActivityAlarm *mPedestrianAfterStatic;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: Inside stopPendingAlarms"));
  if (+[CMActivityAlarm activityAlarmAvailable](CMActivityAlarm, "activityAlarmAvailable"))
  {
    mStaticAlarm = self->mStaticAlarm;
    if (mStaticAlarm)
    {
      -[CMActivityAlarm invalidate](mStaticAlarm, "invalidate");

      self->mStaticAlarm = 0;
    }
    mWalkingAlarm = self->mWalkingAlarm;
    if (mWalkingAlarm)
    {
      -[CMActivityAlarm invalidate](mWalkingAlarm, "invalidate");

      self->mWalkingAlarm = 0;
    }
    mRunningAlarm = self->mRunningAlarm;
    if (mRunningAlarm)
    {
      -[CMActivityAlarm invalidate](mRunningAlarm, "invalidate");

      self->mRunningAlarm = 0;
    }
    mDrivingAlarm = self->mDrivingAlarm;
    if (mDrivingAlarm)
    {
      -[CMActivityAlarm invalidate](mDrivingAlarm, "invalidate");

      self->mDrivingAlarm = 0;
    }
    mPedestrianAfterStatic = self->mPedestrianAfterStatic;
    if (mPedestrianAfterStatic)
    {
      -[CMActivityAlarm invalidate](mPedestrianAfterStatic, "invalidate");

      self->mPedestrianAfterStatic = 0;
    }
    self->mMotionControllerState = 0;
  }
}

- (void)waitForStaticState:(unint64_t)a3
{
  CMActivityAlarm *mStaticAlarm;
  id v6;
  OS_dispatch_queue *mAlarmQueue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: setting up static state alarm "));
  mStaticAlarm = self->mStaticAlarm;
  if (mStaticAlarm)
  {

    self->mStaticAlarm = 0;
  }
  v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A0E0;
  v8[3] = &unk_1002035A0;
  v8[4] = self;
  v8[5] = a3;
  self->mStaticAlarm = (CMActivityAlarm *)objc_msgSend(v6, "initWithTrigger:duration:onQueue:withHandler:", 0, mAlarmQueue, v8, (double)a3);
}

- (void)waitForPedestrianState:(unint64_t)a3
{
  CMActivityAlarm *mPedestrianAfterStatic;
  id v6;
  OS_dispatch_queue *mAlarmQueue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: setting up pedestrian state alarm "));
  mPedestrianAfterStatic = self->mPedestrianAfterStatic;
  if (mPedestrianAfterStatic)
  {

    self->mPedestrianAfterStatic = 0;
  }
  v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A208;
  v8[3] = &unk_1002035A0;
  v8[4] = self;
  v8[5] = a3;
  self->mPedestrianAfterStatic = (CMActivityAlarm *)objc_msgSend(v6, "initWithTrigger:duration:onQueue:withHandler:", 11, mAlarmQueue, v8, (double)a3);
}

- (void)waitForWalkingState:(unint64_t)a3
{
  CMActivityAlarm *mWalkingAlarm;
  id v6;
  OS_dispatch_queue *mAlarmQueue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: setting up walking state alarm "));
  mWalkingAlarm = self->mWalkingAlarm;
  if (mWalkingAlarm)
  {

    self->mWalkingAlarm = 0;
  }
  v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A334;
  v8[3] = &unk_1002035A0;
  v8[4] = self;
  v8[5] = a3;
  self->mWalkingAlarm = (CMActivityAlarm *)objc_msgSend(v6, "initWithTrigger:duration:onQueue:withHandler:", 2, mAlarmQueue, v8, (double)a3);
}

- (void)waitForRunningState:(unint64_t)a3
{
  CMActivityAlarm *mRunningAlarm;
  id v6;
  OS_dispatch_queue *mAlarmQueue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: setting up running state alarm "));
  mRunningAlarm = self->mRunningAlarm;
  if (mRunningAlarm)
  {

    self->mRunningAlarm = 0;
  }
  v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A460;
  v8[3] = &unk_1002035A0;
  v8[4] = self;
  v8[5] = a3;
  self->mRunningAlarm = (CMActivityAlarm *)objc_msgSend(v6, "initWithTrigger:duration:onQueue:withHandler:", 3, mAlarmQueue, v8, (double)a3);
}

- (void)waitForDrivingState:(unint64_t)a3
{
  CMActivityAlarm *mDrivingAlarm;
  id v6;
  OS_dispatch_queue *mAlarmQueue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Alarm: setting up driving state alarm "));
  mDrivingAlarm = self->mDrivingAlarm;
  if (mDrivingAlarm)
  {

    self->mDrivingAlarm = 0;
  }
  v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A58C;
  v8[3] = &unk_1002035A0;
  v8[4] = self;
  v8[5] = a3;
  self->mDrivingAlarm = (CMActivityAlarm *)objc_msgSend(v6, "initWithTrigger:duration:onQueue:withHandler:", 4, mAlarmQueue, v8, (double)a3);
}

- (void)waitForActivityState:(unint64_t)a3 :(int)a4
{
  const __CFString *v7;
  uint64_t v8;

  -[WRM_MotionControllerIOS stopPendingAlarms](self, "stopPendingAlarms");
  switch(a4)
  {
    case 0:
      -[WRM_MotionControllerIOS waitForWalkingState:](self, "waitForWalkingState:", a3);
      -[WRM_MotionControllerIOS waitForRunningState:](self, "waitForRunningState:", a3);
      -[WRM_MotionControllerIOS waitForDrivingState:](self, "waitForDrivingState:", a3);
      -[WRM_MotionControllerIOS waitForPedestrianState:](self, "waitForPedestrianState:", a3);
      self->mMotionControllerState = 2;
      v7 = CFSTR("Alarm State: ALARM_WALKING_RUNNING_DRIVING_PEDESTRIAN");
      goto LABEL_9;
    case 1:
      -[WRM_MotionControllerIOS waitForStaticState:](self, "waitForStaticState:", a3);
      -[WRM_MotionControllerIOS waitForRunningState:](self, "waitForRunningState:", a3);
      -[WRM_MotionControllerIOS waitForDrivingState:](self, "waitForDrivingState:", a3);
      -[WRM_MotionControllerIOS waitForPedestrianState:](self, "waitForPedestrianState:", a3);
      goto LABEL_8;
    case 2:
      -[WRM_MotionControllerIOS waitForStaticState:](self, "waitForStaticState:", a3);
      -[WRM_MotionControllerIOS waitForDrivingState:](self, "waitForDrivingState:", a3);
      -[WRM_MotionControllerIOS waitForWalkingState:](self, "waitForWalkingState:", a3);
      -[WRM_MotionControllerIOS waitForPedestrianState:](self, "waitForPedestrianState:", a3);
      self->mMotionControllerState = 4;
      v7 = CFSTR("Alarm State: ALARM_DRIVING_STATIONARY_WALKING_PEDSTRIAN");
      goto LABEL_9;
    case 3:
      -[WRM_MotionControllerIOS waitForStaticState:](self, "waitForStaticState:", a3);
      -[WRM_MotionControllerIOS waitForRunningState:](self, "waitForRunningState:", a3);
      -[WRM_MotionControllerIOS waitForWalkingState:](self, "waitForWalkingState:", a3);
      -[WRM_MotionControllerIOS waitForPedestrianState:](self, "waitForPedestrianState:", a3);
      self->mMotionControllerState = 5;
      v7 = CFSTR("Alarm State: ALARM_STATIONARY_WALKING_RUNNING_PEDSTRIAN");
      goto LABEL_9;
    case 4:
      -[WRM_MotionControllerIOS waitForStaticState:](self, "waitForStaticState:", a3);
      -[WRM_MotionControllerIOS waitForRunningState:](self, "waitForRunningState:", a3);
      -[WRM_MotionControllerIOS waitForDrivingState:](self, "waitForDrivingState:", a3);
      -[WRM_MotionControllerIOS waitForWalkingState:](self, "waitForWalkingState:", a3);
LABEL_8:
      self->mMotionControllerState = 3;
      v7 = CFSTR("Alarm State: ALARM_RUNNING_DRIVING_STATIONARY_PEDESTRIAN");
LABEL_9:
      v8 = 18;
      goto LABEL_10;
    case 5:
      -[WRM_MotionControllerIOS waitForStaticState:](self, "waitForStaticState:", a3);
      return;
    default:
      v7 = CFSTR("Alarm: Motion State Invalid \n");
      v8 = 16;
LABEL_10:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v8, v7);
      return;
  }
}

- (void)notifyHandoverManager:(int)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t object[2];
  char *v8[2];
  xpc_object_t values[2];
  char *keys[2];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "kWRMM_MOTION_STATE", a3);
  *(_OWORD *)keys = *(_OWORD *)off_1002035C0;
  values[0] = xpc_uint64_create(0x3E9uLL);
  values[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v8 = *(_OWORD *)off_1002035D0;
  object[0] = xpc_uint64_create(0x3E8uLL);
  object[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v8, object, 2uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, CFSTR("%s: ready to send a xpc message: %@."), "-[WRM_MotionControllerIOS notifyHandoverManager:]", v6);
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v6);
  objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", v6);
  xpc_release(object[0]);
  xpc_release(v6);
  xpc_release(values[0]);
  xpc_release(v5);
  xpc_release(v4);
}

@end
