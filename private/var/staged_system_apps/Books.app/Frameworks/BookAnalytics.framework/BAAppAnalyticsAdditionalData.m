@implementation BAAppAnalyticsAdditionalData

- (BOOL)supportsUnifiedProductPage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BAAppAnalyticsAdditionalData_supportsUnifiedProductPage);
}

- (NSString)editionKind
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->supportsUnifiedProductPage[OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->supportsUnifiedProductPage[OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (NSString)supportsUnifiedProductPageKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)editionKindKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (BAAppAnalyticsAdditionalData)initWithSupportsUnifiedProductPage:(BOOL)a3 editionKind:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  objc_super v10;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAAppAnalyticsAdditionalData_supportsUnifiedProductPage) = a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind);
  *v8 = v6;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AppAnalyticsAdditionalData();
  return -[BAAppAnalyticsAdditionalData init](&v10, "init");
}

+ (id)dataWithDictionary:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v4 = _s13BookAnalytics03AppB14AdditionalDataC4data10dictionaryACSgSDySSypG_tFZ_0(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (id)dictionary
{
  BAAppAnalyticsAdditionalData *v2;
  unint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_3A138();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (BAAppAnalyticsAdditionalData)init
{
  BAAppAnalyticsAdditionalData *result;

  result = (BAAppAnalyticsAdditionalData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.AppAnalyticsAdditionalData", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->supportsUnifiedProductPage[OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind]);
}

@end
