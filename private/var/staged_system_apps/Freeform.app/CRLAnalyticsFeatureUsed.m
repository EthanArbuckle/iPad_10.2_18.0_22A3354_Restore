@implementation CRLAnalyticsFeatureUsed

+ (id)featurePayloadFor:(int64_t)a3
{
  Class isa;

  _s8Freeform23CRLAnalyticsFeatureUsedC14featurePayload3forSDySSSo8NSObjectCGAA0bC4NameO_tFZ_0(a3);
  sub_100511A70();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (void)logFeatureUsedWithName:(int64_t)a3
{
  void *v4;
  NSString v5;
  Class isa;

  v4 = (void *)objc_opt_self(CRLAnalyticsLogger);
  v5 = String._bridgeToObjectiveC()();
  _s8Freeform23CRLAnalyticsFeatureUsedC14featurePayload3forSDySSSo8NSObjectCGAA0bC4NameO_tFZ_0(a3);
  sub_100511A70();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v4, "sendEventInDomain:lazily:eventPayload:", v5, 1, isa, swift_bridgeObjectRelease().n128_f64[0]);

}

- (_TtC8Freeform23CRLAnalyticsFeatureUsed)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsFeatureUsed();
  return -[CRLAnalyticsFeatureUsed init](&v3, "init");
}

@end
