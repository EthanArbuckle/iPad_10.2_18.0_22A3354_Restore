@implementation WCM_BSPMonitor

+ (id)create
{
  return objc_alloc_init(WCM_BSPMonitorIOS);
}

- (WCM_BSPMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_BSPMonitor;
  return -[WCM_BSPMonitor init](&v3, "init");
}

- (int)getTimeToTSTForULLAMode:(int)a3
{
  if (a3 == 2)
    return 64;
  else
    return 20;
}

@end
