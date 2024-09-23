@implementation WRM_SpeedTestSchedulerServicesIOS

- (WRM_SpeedTestSchedulerServicesIOS)initWithWaitTime:(double)a3
{
  WRM_SpeedTestSchedulerServicesIOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WRM_SpeedTestSchedulerServicesIOS;
  v4 = -[WRM_SpeedTestSchedulerServicesIOS init](&v6, "init");
  if (v4)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: In WRM_SpeedTestSchedulerServicesIOS"));
    v4->waitTime = a3;
    v4->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wirelessdataanalytics.SpeedTestScheduler", 0);
  }
  return v4;
}

- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4
{
  signed int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  const char *v9;

  if (!a3)
    return 1;
  v5 = arc4random_uniform(0xAu);
  v6 = a4 / -10 + 9;
  v7 = v5 <= v6;
  v8 = v5 > v6;
  v9 = "NO";
  if (!v7)
    v9 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput ifScheduleSpeedTestAfterReboot: %s"), v9);
  return v8;
}

- (BOOL)ifNoActiveVoiceCall
{
  return objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isCallActive") ^ 1;
}

- (void)scheduleTests:(int)a3 :(id)a4
{
  dispatch_time_t v7;
  NSObject *mQueue;
  _QWORD block[6];
  int v10;

  v7 = dispatch_time(0, 120000000000);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A228;
  block[3] = &unk_100202BC8;
  v10 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_after(v7, mQueue, block);
}

- (void)abort
{
  WRM_SpeedTestConfigIOS *cellularTestStartRef;

  cellularTestStartRef = self->cellularTestStartRef;
  if (cellularTestStartRef)
    -[WRM_SpeedTestConfigIOS abort](cellularTestStartRef, "abort");
}

- (void)dealloc
{
  WRM_SpeedTestConfigIOS *cellularTestStartRef;
  NSObject *mQueue;
  objc_super v5;

  cellularTestStartRef = self->cellularTestStartRef;
  if (cellularTestStartRef)
  {

    self->cellularTestStartRef = 0;
  }
  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WRM_SpeedTestSchedulerServicesIOS;
  -[WRM_SpeedTestSchedulerServicesIOS dealloc](&v5, "dealloc");
}

@end
