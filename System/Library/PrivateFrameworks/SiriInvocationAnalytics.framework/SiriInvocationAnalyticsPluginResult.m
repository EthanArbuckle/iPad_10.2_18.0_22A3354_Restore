@implementation SiriInvocationAnalyticsPluginResult

+ (NSString)numConversationsKey
{
  return (NSString *)OUTLINED_FUNCTION_1_9((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter);
}

+ (NSString)numVTEventsKey
{
  return (NSString *)OUTLINED_FUNCTION_1_9((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter);
}

+ (NSString)bookmarkNameKey
{
  void *v2;

  OUTLINED_FUNCTION_10_18();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

+ (NSString)conversationIdsKey
{
  void *v2;

  OUTLINED_FUNCTION_9_22();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

+ (NSString)vtEventIdsKey
{
  void *v2;

  OUTLINED_FUNCTION_11_16();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

+ (NSString)vtEventSummariesKey
{
  return (NSString *)OUTLINED_FUNCTION_1_9((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter);
}

+ (NSString)bookmarkSavedKey
{
  void *v2;

  OUTLINED_FUNCTION_8_16();
  v2 = (void *)sub_2464F8B64();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_9(v2);
}

- (int64_t)numFeaturizedConversations
{
  int64_t result;

  SiriInvocationAnalyticsPluginResult.numFeaturizedConversations.getter();
  return result;
}

- (void)setNumFeaturizedConversations:(int64_t)a3
{
  sub_2464D881C(a3);
  OUTLINED_FUNCTION_17_0();
}

- (int64_t)numFeaturizedVoiceTriggerEvents
{
  int64_t result;

  SiriInvocationAnalyticsPluginResult.numFeaturizedVoiceTriggerEvents.getter();
  return result;
}

- (void)setNumFeaturizedVoiceTriggerEvents:(int64_t)a3
{
  sub_2464D8914(a3);
  OUTLINED_FUNCTION_17_0();
}

- (NSString)bookmarkName
{
  SiriInvocationAnalyticsPluginResult.bookmarkName.getter();
  sub_2464F8B64();
  OUTLINED_FUNCTION_10_7();
  return (NSString *)OUTLINED_FUNCTION_2_9(self);
}

- (void)setBookmarkName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult *v7;

  v4 = sub_2464F8B88();
  v6 = v5;
  v7 = self;
  sub_2464D8A6C(v4, v6);

}

- (NSArray)conversationIds
{
  return (NSArray *)sub_2464D8C08(self, (uint64_t)a2, SiriInvocationAnalyticsPluginResult.conversationIds.getter);
}

- (void)setConversationIds:(id)a3
{
  _TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult *v4;
  uint64_t v5;
  void *v6;

  sub_2464F8CCC();
  v4 = self;
  v5 = OUTLINED_FUNCTION_12_15();
  sub_2464D8B88(v5);
  OUTLINED_FUNCTION_3_17(v6);
}

- (NSArray)vtEventIds
{
  return (NSArray *)sub_2464D8C08(self, (uint64_t)a2, SiriInvocationAnalyticsPluginResult.vtEventIds.getter);
}

- (void)setVtEventIds:(id)a3
{
  _TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult *v4;
  uint64_t v5;
  void *v6;

  sub_2464F8CCC();
  v4 = self;
  v5 = OUTLINED_FUNCTION_12_15();
  sub_2464D8C88(v5);
  OUTLINED_FUNCTION_3_17(v6);
}

- (NSDictionary)vtEventSummaries
{
  SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257580328);
  sub_2464F8A98();
  OUTLINED_FUNCTION_10_7();
  return (NSDictionary *)OUTLINED_FUNCTION_2_9(self);
}

- (void)setVtEventSummaries:(id)a3
{
  uint64_t v4;
  _TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257580328);
  v4 = sub_2464F8AA4();
  v5 = self;
  sub_2464D8DC0(v4);
  OUTLINED_FUNCTION_3_17(v5);
}

- (BOOL)bookmarkSaved
{
  return SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter() & 1;
}

- (void)setBookmarkSaved:(BOOL)a3
{
  sub_2464D8ED8(a3);
  OUTLINED_FUNCTION_17_0();
}

- (_TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult)init
{
  SiriInvocationAnalyticsPluginResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
