@implementation PHOrientationMonitorKeys

+ (NSString)notificationEvent
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationValidKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationDeviceKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationInterfaceKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (PHOrientationMonitorKeys)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrientationMonitorKeys();
  return -[PHOrientationMonitorKeys init](&v3, "init");
}

@end
