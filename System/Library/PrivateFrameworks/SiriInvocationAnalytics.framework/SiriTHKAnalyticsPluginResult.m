@implementation SiriTHKAnalyticsPluginResult

+ (NSString)numTHKEventsKey
{
  void *v2;

  OUTLINED_FUNCTION_3_26();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

+ (NSString)thkEventSummariesKey
{
  void *v2;

  static SiriTHKAnalyticsPluginResult.thkEventSummariesKey.getter();
  sub_2464F8B64();
  OUTLINED_FUNCTION_10_7();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

- (int64_t)numTHKEvents
{
  int64_t result;

  SiriTHKAnalyticsPluginResult.numTHKEvents.getter();
  return result;
}

- (void)setNumTHKEvents:(int64_t)a3
{
  sub_2464F2C54(a3);
}

- (NSDictionary)thkEventSummaries
{
  SiriTHKAnalyticsPluginResult.thkEventSummaries.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257580328);
  sub_2464F8A98();
  OUTLINED_FUNCTION_10_7();
  return (NSDictionary *)OUTLINED_FUNCTION_2_9(self);
}

- (void)setThkEventSummaries:(id)a3
{
  uint64_t v4;
  _TtC23SiriInvocationAnalytics28SiriTHKAnalyticsPluginResult *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257580328);
  v4 = sub_2464F8AA4();
  v5 = self;
  sub_2464F2DD0(v4);

}

- (_TtC23SiriInvocationAnalytics28SiriTHKAnalyticsPluginResult)init
{
  SiriTHKAnalyticsPluginResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
