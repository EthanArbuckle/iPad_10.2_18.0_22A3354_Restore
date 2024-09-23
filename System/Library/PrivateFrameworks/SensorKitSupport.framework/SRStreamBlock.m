@implementation SRStreamBlock

- (_TtC16SensorKitSupport13SRStreamBlock)initWithBinaryRep:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16SensorKitSupport13SRStreamBlock *result;

  v3 = a3;
  v4 = sub_21C888050();
  v6 = v5;

  SRStreamBlock.init(binaryRep:)(v4, v6);
  return result;
}

- (NSDictionary)dictionary
{
  _TtC16SensorKitSupport13SRStreamBlock *v2;
  void *v3;

  v2 = self;
  sub_21C87A074();
  v3 = (void *)sub_21C888218();

  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (_TtC16SensorKitSupport13SRStreamBlock)init
{
  _TtC16SensorKitSupport13SRStreamBlock *result;

  result = (_TtC16SensorKitSupport13SRStreamBlock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C887DD4((uint64_t)self + OBJC_IVAR____TtC16SensorKitSupport13SRStreamBlock_streamBlock);
}

@end
