@implementation AccumulatedAggregationStats

- (double)aggregationStartTimestamp
{
  double result;

  AccumulatedAggregationStats.aggregationStartTimestamp.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setAggregationStartTimestamp:(double)a3
{
  AccumulatedAggregationStats.aggregationStartTimestamp.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (int64_t)numberOfDaysAggregation
{
  int64_t result;

  AccumulatedAggregationStats.numberOfDaysAggregation.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setNumberOfDaysAggregation:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_8((uint64_t)self, (uint64_t)a2, a3);
  AccumulatedAggregationStats.numberOfDaysAggregation.setter(v3);
  OUTLINED_FUNCTION_17_0();
}

- (NSArray)aggregationStats
{
  return (NSArray *)sub_2464BF4A4((uint64_t)self, (uint64_t)a2, AccumulatedAggregationStats.aggregationStats.getter, (void (*)(void))type metadata accessor for AggregatedStats);
}

- (void)setAggregationStats:(id)a3
{
  sub_2464BF530(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for AggregatedStats, AccumulatedAggregationStats.aggregationStats.setter);
}

- (NSString)cohortType
{
  return (NSString *)sub_2464BF5D4(self, (uint64_t)a2, (void (*)(void))AccumulatedAggregationStats.cohortType.getter);
}

- (void)setCohortType:(id)a3
{
  sub_2464BF624(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AccumulatedAggregationStats.cohortType.setter);
}

- (double)intendedRequestRatio
{
  double result;

  AccumulatedAggregationStats.intendedRequestRatio.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setIntendedRequestRatio:(double)a3
{
  AccumulatedAggregationStats.intendedRequestRatio.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (double)uesScore
{
  double result;

  AccumulatedAggregationStats.uesScore.getter();
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (void)setUesScore:(double)a3
{
  AccumulatedAggregationStats.uesScore.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (NSString)mitigationAssetVersion
{
  return (NSString *)sub_2464BF5D4(self, (uint64_t)a2, (void (*)(void))AccumulatedAggregationStats.mitigationAssetVersion.getter);
}

- (void)setMitigationAssetVersion:(id)a3
{
  sub_2464BF624(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AccumulatedAggregationStats.mitigationAssetVersion.setter);
}

- (int)sdsdRetryCount
{
  return AccumulatedAggregationStats.sdsdRetryCount.getter();
}

- (void)setSdsdRetryCount:(int)a3
{
  AccumulatedAggregationStats.sdsdRetryCount.setter(a3);
  OUTLINED_FUNCTION_17_0();
}

- (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats)init
{
  AccumulatedAggregationStats.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_7();
}

@end
