@implementation SiriAnalyticsMessageStaging

- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)initWithInternalTelemetry:(id)a3
{
  return (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging *)SiriAnalyticsMessageStaging.init(internalTelemetry:)(a3);
}

- (void)bootstrapAndPrune
{
  _TtC13SiriAnalytics27SiriAnalyticsMessageStaging *v2;

  v2 = self;
  sub_1A02829DC();

}

- (void)purgeWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13SiriAnalytics27SiriAnalyticsMessageStaging *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1A02AA970((uint64_t)&unk_1EE58F550, v5);
}

- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)init
{
  SiriAnalyticsMessageStaging.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
