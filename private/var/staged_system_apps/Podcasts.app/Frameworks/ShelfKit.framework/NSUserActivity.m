@implementation NSUserActivity

- (BOOL)isStateRestorationActivity
{
  NSUserActivity *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = self;
  v3 = -[NSUserActivity activityType](v2, "activityType");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  if (v4 == 0xD000000000000023 && v6 == 0x800000000030AA90)
  {

    swift_bridgeObjectRelease(0x800000000030AA90);
    v7 = 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 0xD000000000000023, 0x800000000030AA90, 0);

    swift_bridgeObjectRelease(v6);
  }
  return v7 & 1;
}

@end
