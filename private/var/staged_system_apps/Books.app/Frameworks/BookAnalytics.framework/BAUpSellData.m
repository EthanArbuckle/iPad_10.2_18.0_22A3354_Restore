@implementation BAUpSellData

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_location);
}

- (int64_t)variant
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_variant);
}

- (NSString)variantVersion
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->location[OBJC_IVAR___BAUpSellData_variantVersion];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BAUpSellData)initWithLocation:(int64_t)a3 variant:(int64_t)a4 variantVersion:(id)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_super v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_location) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_variant) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___BAUpSellData_variantVersion);
  *v9 = v8;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BridgedUpSellData();
  return -[BAUpSellData init](&v12, "init");
}

- (BAUpSellData)init
{
  BAUpSellData *result;

  result = (BAUpSellData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedUpSellData", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->location[OBJC_IVAR___BAUpSellData_variantVersion]);
}

@end
