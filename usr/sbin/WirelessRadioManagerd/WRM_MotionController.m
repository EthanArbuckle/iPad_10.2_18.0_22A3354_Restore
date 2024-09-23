@implementation WRM_MotionController

- (WRM_MotionController)init
{
  WRM_MotionController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionController;
  v2 = -[WRM_MotionController init](&v4, "init");
  if (v2)
    v2->mAlarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.Motion", 0);
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
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionController;
  -[WRM_MotionController dealloc](&v4, "dealloc");
}

- (int)getMobilityState
{
  return 5;
}

- (int)getPrevMobilityState
{
  return 5;
}

- (id)getMotionAlarmQueue
{
  return self->mAlarmQueue;
}

+ (id)singleton
{
  if (qword_1002711B8 != -1)
    dispatch_once(&qword_1002711B8, &stru_100203578);
  return (id)qword_1002711B0;
}

@end
