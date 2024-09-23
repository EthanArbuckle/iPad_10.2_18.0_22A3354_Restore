@implementation JSAOSFeatureFlags

+ (BOOL)isEnabled:(id)a3 :(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a4;
  LOBYTE(v5) = sub_50060(v5, v7, v8);

  swift_bridgeObjectRelease(v7);
  return v5 & 1;
}

- (_TtC5JSApp17JSAOSFeatureFlags)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[JSAOSFeatureFlags init](&v3, "init");
}

@end
