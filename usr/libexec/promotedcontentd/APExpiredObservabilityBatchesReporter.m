@implementation APExpiredObservabilityBatchesReporter

- (APExpiredObservabilityBatchesReporter)initWithBatchPath:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APExpiredObservabilityBatchesReporter_batchPath);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ExpiredObservabilityBatchesReporter();
  return -[APExpiredObservabilityBatchesReporter init](&v8, "init");
}

- (void)run
{
  APExpiredObservabilityBatchesReporter *v2;

  v2 = self;
  sub_10015A560();

}

- (APExpiredObservabilityBatchesReporter)init
{
  APExpiredObservabilityBatchesReporter *result;

  result = (APExpiredObservabilityBatchesReporter *)_swift_stdlib_reportUnimplementedInitializer("Metrics.ExpiredObservabilityBatchesReporter", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->batchPath[OBJC_IVAR___APExpiredObservabilityBatchesReporter_batchPath]);
}

@end
