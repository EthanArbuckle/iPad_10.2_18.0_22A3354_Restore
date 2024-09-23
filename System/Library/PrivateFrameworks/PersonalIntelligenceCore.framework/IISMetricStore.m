@implementation IISMetricStore

+ (IISMetricStore)sharedInstance
{
  return (IISMetricStore *)static MetricStore.sharedInstance.getter();
}

- (IISMetricStore)init
{
  IISMetricStore *result;

  OUTLINED_FUNCTION_116((void (*)(unint64_t, unint64_t))sub_1C3B5B688);
  OUTLINED_FUNCTION_10();
  return result;
}

- (id)saveMessage:(id)a3 backend:(unsigned __int8)a4 messageIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IISMetricStore *v11;
  void *v12;

  v7 = sub_1C3B62BF4();
  v8 = sub_1C3B62C3C();
  v10 = v9;
  v11 = self;
  MetricStore.saveMessage(_:backend:messageIdentifier:)(v7, a4, v8, v10);

  OUTLINED_FUNCTION_23();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1C3B62BE8();
  OUTLINED_FUNCTION_23();
  return v12;
}

- (void)removeAllMetricsWithPrefix:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  IISMetricStore *v7;
  Swift::String v8;

  v4 = sub_1C3B62C3C();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  MetricStore.removeAllMetrics(withPrefix:)(v8);

  swift_bridgeObjectRelease();
}

- (void)registerEnrichmentProvider:(id)a3
{
  IISMetricStore *v4;

  swift_unknownObjectRetain();
  v4 = self;
  MetricStore.registerEnrichmentProvider(_:)();
  swift_unknownObjectRelease();

}

- (void)registerMessageListener:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_111((int)self, (int)a2, a3);
  v4 = OUTLINED_FUNCTION_5_2();
  v5 = OUTLINED_FUNCTION_83(v4);
  MetricStore.registerMessageListener(_:)((uint64_t)sub_1C3B60198, v3);

  swift_release();
}

- (BOOL)sendMessagesWithShouldContinue:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;
  char v6;

  OUTLINED_FUNCTION_111((int)self, (int)a2, a3);
  v3 = OUTLINED_FUNCTION_5_2();
  v4 = OUTLINED_FUNCTION_83(v3);
  MetricStore.sendMessages(shouldContinue:)();
  v6 = v5;

  OUTLINED_FUNCTION_73();
  return v6 & 1;
}

- (BOOL)shouldSendMessages
{
  IISMetricStore *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = MetricStore.shouldSendMessages()();

  return v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___IISMetricStore_windowStartDate;
  v4 = OUTLINED_FUNCTION_7_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
