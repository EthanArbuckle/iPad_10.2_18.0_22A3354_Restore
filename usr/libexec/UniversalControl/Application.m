@implementation Application

+ (BOOL)_isSystemUIService
{
  return sub_1000079A4();
}

+ (id)_systemUIServiceClientSettings
{
  return sub_100007A64();
}

+ (id)_systemUIServiceIdentifier
{
  NSString v2;

  sub_100007AD8();
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

- (_TtC20UniversalControl_iOS11Application)init
{
  return (_TtC20UniversalControl_iOS11Application *)sub_100008784();
}

@end
