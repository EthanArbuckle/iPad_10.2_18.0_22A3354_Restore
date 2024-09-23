@implementation AggregatedStats

- (int64_t)triggeredMechanism
{
  int64_t result;

  AggregatedStats.triggeredMechanism.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setTriggeredMechanism:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_8((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.triggeredMechanism.setter(v3);
  OUTLINED_FUNCTION_17_0();
}

- (int64_t)requestCount
{
  int64_t result;

  AggregatedStats.requestCount.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setRequestCount:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_8((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.requestCount.setter(v3);
  OUTLINED_FUNCTION_17_0();
}

- (int64_t)intendedRequestCount
{
  int64_t result;

  AggregatedStats.intendedRequestCount.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setIntendedRequestCount:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_8((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.intendedRequestCount.setter(v3);
  OUTLINED_FUNCTION_17_0();
}

- (int64_t)unintendedRequestCount
{
  int64_t result;

  AggregatedStats.unintendedRequestCount.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setUnintendedRequestCount:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_8((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.unintendedRequestCount.setter(v3);
  OUTLINED_FUNCTION_17_0();
}

- (double)intendedRequestRatio
{
  double result;

  AggregatedStats.intendedRequestRatio.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setIntendedRequestRatio:(double)a3
{
  AggregatedStats.intendedRequestRatio.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (double)triggeredMechanismRequestRatio
{
  double result;

  AggregatedStats.triggeredMechanismRequestRatio.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setTriggeredMechanismRequestRatio:(double)a3
{
  AggregatedStats.triggeredMechanismRequestRatio.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (NSString)modelVersion
{
  return (NSString *)sub_2464BF5D4(self, (uint64_t)a2, (void (*)(void))AggregatedStats.modelVersion.getter);
}

- (void)setModelVersion:(id)a3
{
  sub_2464BF624(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AggregatedStats.modelVersion.setter);
}

- (_TtC23SiriInvocationAnalytics15AggregatedStats)init
{
  AggregatedStats.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
