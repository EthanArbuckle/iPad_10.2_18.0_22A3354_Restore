@implementation WRM_SpeedTestSchedulerServices

- (WRM_SpeedTestSchedulerServices)initWithWaitTime:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_SpeedTestSchedulerServices;
  return -[WRM_SpeedTestSchedulerServices init](&v4, "init", a3);
}

- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4
{
  return 0;
}

@end
