@implementation MusicApplication

- (MusicApplication)init
{
  return (MusicApplication *)Application.init()();
}

+ (id)_defaultContentSizeCategory
{
  swift_getObjCClassMetadata(a1);
  return static Application._defaultContentSizeCategory()();
}

- (id)_extendLaunchTest
{
  return String._bridgeToObjectiveC()();
}

@end
