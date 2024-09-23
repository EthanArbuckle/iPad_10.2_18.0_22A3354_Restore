@implementation GKMetricsIntBucketer

- (GKMetricsIntBucketer)initWithBuckets:(id)a3
{
  uint64_t v3;

  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int);
  return (GKMetricsIntBucketer *)MetricsIntBucketer.init(buckets:)(v3);
}

- (int64_t)clamp:(int64_t)a3
{
  return MetricsIntBucketer.clamp(_:)(a3);
}

- (GKMetricsIntBucketer)init
{
  MetricsIntBucketer.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMetricsIntBucketer_buckets), a2);
}

@end
