@implementation UserEngagementStatsAnalyticsPluginResult

- (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats)dailyAggregatedStats
{
  id v2;

  UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.getter();
  return (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats *)OUTLINED_FUNCTION_2_9(v2);
}

- (void)setDailyAggregatedStats:(id)a3
{
  id v5;
  _TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult *v6;

  v5 = a3;
  v6 = self;
  UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.setter(a3);

}

- (NSArray)accumulatedAggregationStats
{
  return (NSArray *)sub_2464BF4A4((uint64_t)self, (uint64_t)a2, UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.getter, (void (*)(void))type metadata accessor for AccumulatedAggregationStats);
}

- (void)setAccumulatedAggregationStats:(id)a3
{
  sub_2464BF530(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for AccumulatedAggregationStats, UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.setter);
}

- (_TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult)init
{
  UserEngagementStatsAnalyticsPluginResult.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult_dailyAggregatedStats));
  OUTLINED_FUNCTION_14_7();
}

@end
