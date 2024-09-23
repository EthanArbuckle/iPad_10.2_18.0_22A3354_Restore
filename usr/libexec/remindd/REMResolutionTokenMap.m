@implementation REMResolutionTokenMap

+ (id)newObjectFromJSONObject:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  swift_getObjCClassMetadata(a1);
  v5 = sub_1005A3520(v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (id)objc_toJSONString
{
  REMResolutionTokenMap *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10015F740();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)objc_newObjectFromJSONString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  v7 = (void *)sub_1005A37E8(v4, v6);
  swift_bridgeObjectRelease();
  return v7;
}

@end
