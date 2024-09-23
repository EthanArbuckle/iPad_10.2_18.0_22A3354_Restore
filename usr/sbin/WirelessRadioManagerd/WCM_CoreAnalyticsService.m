@implementation WCM_CoreAnalyticsService

+ (id)singleton
{
  id result;
  objc_super v4;

  result = (id)qword_100271488;
  if (!qword_100271488)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_CoreAnalyticsService;
    result = objc_msgSend(objc_msgSendSuper2(&v4, "allocWithZone:", 0), "init");
    qword_100271488 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "singleton", a3);
}

- (WCM_CoreAnalyticsService)init
{
  WCM_CoreAnalyticsService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_CoreAnalyticsService;
  v2 = -[WCM_CoreAnalyticsService init](&v4, "init");
  if (v2)
    v2->_mBTConnectedDevicesHandler = objc_alloc_init(WCM_CA_BTConnectedDevicesHandler);
  return v2;
}

- (WCM_CA_BTConnectedDevicesHandler)mBTConnectedDevicesHandler
{
  return self->_mBTConnectedDevicesHandler;
}

@end
