@implementation VUIMetricsJetEngine

+ (VUIMetricsJetEngine)sharedInstance
{
  return (VUIMetricsJetEngine *)static MetricsJetEngine.shared.getter();
}

- (id)recordEventWithTopic:(id)a3 eventType:(id)a4 eventData:(id)a5 pageData:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VUIMetricsJetEngine *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = sub_1DA143E80();
  v11 = v10;
  v12 = OUTLINED_FUNCTION_32_66();
  v13 = OUTLINED_FUNCTION_32_66();
  v14 = self;
  MetricsJetEngine.recordEvent(topic:eventType:eventData:pageData:)(v6, v8, v9, v11, v12, v13, v15, v16, v20, (uint64_t)self, v22, v23, v24, v25, v26, v27, v28, v29, v30,
    v31);
  v18 = v17;

  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_137();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_79();
  return v18;
}

- (NSObject)wrappedPipeline
{
  return MetricsJetEngine.wrappedPipeline.getter();
}

- (void)setWrappedPipeline:(id)a3
{
  id v4;
  VUIMetricsJetEngine *v5;

  v4 = a3;
  v5 = self;
  MetricsJetEngine.wrappedPipeline.setter(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)flushMetrics
{
  VUIMetricsJetEngine *v2;

  v2 = self;
  MetricsJetEngine.flushMetrics()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (BOOL)isSharedContent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  VUIMetricsJetEngine *v7;
  Swift::String_optional v8;
  BOOL result;

  if (a3)
  {
    v4 = sub_1DA143E80();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  MetricsJetEngine.isSharedContent(_:)(v8);

  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_9();
  return result;
}

- (void)flushMetricsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  VUIMetricsJetEngine *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  MetricsJetEngine.flushMetricsWithCompletion(_:)((uint64_t)sub_1D9B07CC0, v5);

  swift_release();
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  VUIMetricsJetEngine *v4;

  v4 = self;
  MetricsJetEngine.setMonitorsLifecycleEvents(_:)(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

+ (id)convertClickDataToLocationData:(id)a3 index:(int64_t)a4
{
  void *v4;

  sub_1DA143C7C();
  static MetricsJetEngine.convertClickDataToLocationData(_:index:)();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1DA143C70();
  OUTLINED_FUNCTION_79();
  return OUTLINED_FUNCTION_11_91(v4);
}

+ (id)convertClickDataToImpressionsData:(id)a3 index:(int64_t)a4 ignoreHosted:(BOOL)a5
{
  void *v5;

  sub_1DA143C7C();
  static MetricsJetEngine.convertClickDataToImpressionsData(_:index:ignoreHosted:)();
  OUTLINED_FUNCTION_54_0();
  v5 = (void *)sub_1DA143C70();
  OUTLINED_FUNCTION_79();
  return OUTLINED_FUNCTION_11_91(v5);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___VUIMetricsJetEngine_sharedPipeline;
  v4 = OUTLINED_FUNCTION_21_75();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

}

@end
