@implementation SiriAnalyticsLargeMessageUploadProcessor

- (SiriAnalyticsLargeMessageUploadProcessor)initWithMetastore:(id)a3
{
  SiriAnalyticsLargeMessageUploadProcessor *result;

  LargeMessageUploadProcessor.init(metastore:)(a3);
  return result;
}

- (id)processWithUploadEvent:(id)a3
{
  id v4;
  SiriAnalyticsLargeMessageUploadProcessor *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1A0299080();
  v7 = v6;

  return v7;
}

- (SiriAnalyticsLargeMessageUploadProcessor)init
{
  LargeMessageUploadProcessor.init()();
}

- (void).cxx_destruct
{
  id v3;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsLargeMessageUploadProcessor_tagExpander);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();

}

@end
