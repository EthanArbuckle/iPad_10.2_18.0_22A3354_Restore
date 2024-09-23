@implementation VUIMetricsDiskManager

+ (VUIMetricsDiskManager)sharedInstance
{
  return (VUIMetricsDiskManager *)static MetricsDiskManager.shared.getter();
}

- (VUIMetricsDiskManager)initWithSessionSuiteName:(id)a3 eventSuiteName:(id)a4
{
  VUIMetricsDiskManager *result;

  sub_1DA143E80();
  sub_1DA143E80();
  sub_1D97F32E4();
  OUTLINED_FUNCTION_9();
  return result;
}

- (VUIMetricsDiskManager)init
{
  MetricsDiskManager.init()();
}

- (void).cxx_destruct
{

}

- (void)writeSession:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_13();
  MetricsDiskManager.writeSession(_:)();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)writeEvent:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_13();
  MetricsDiskManager.writeEvent(_:)();

  OUTLINED_FUNCTION_4_3(v4);
}

- (id)eventsForSession:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  MetricsDiskManager.eventsForSession(_:)(v3);

  type metadata accessor for MetricsRenderEvent();
  v5 = (void *)sub_1DA1440F0();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_15_14(v5);
}

- (id)sessionForEvent:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  v5 = (void *)MetricsDiskManager.sessionForEvent(_:)(v3);

  return OUTLINED_FUNCTION_15_14(v5);
}

- (id)allSessions
{
  return sub_1D9C43DD4(self, (uint64_t)a2, MetricsDiskManager.allSessions(), (void (*)(_QWORD))type metadata accessor for MetricsRenderSession);
}

- (id)allEvents
{
  return sub_1D9C43DD4(self, (uint64_t)a2, MetricsDiskManager.allEvents(), (void (*)(_QWORD))type metadata accessor for MetricsRenderEvent);
}

- (void)clearAllData
{
  VUIMetricsDiskManager *v2;

  v2 = self;
  MetricsDiskManager.clearAllData()();

}

@end
