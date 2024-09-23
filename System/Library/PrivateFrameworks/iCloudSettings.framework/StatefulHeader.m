@implementation StatefulHeader

- (NSString)layoutType
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)subTitle
{
  return (NSString *)sub_24B51A6A0();
}

- (NSArray)actions
{
  uint64_t v2;

  return (NSArray *)sub_24B5C3A80((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_actions, v2, (void (*)(uint64_t))type metadata accessor for Action);
}

- (NSString)impressionUrlString
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_impressionUrlString);
}

- (NSDictionary)impressionPayload
{
  return (NSDictionary *)sub_24B5C41CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_impressionPayload);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return StatefulHeader.init(_:)(v3);
}

- (_TtC14iCloudSettings14StatefulHeader)init
{
  _TtC14iCloudSettings14StatefulHeader *result;

  result = (_TtC14iCloudSettings14StatefulHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
