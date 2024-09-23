@implementation PluginSchedulerTimestamp

+ (BOOL)supportsSecureCoding
{
  return byte_1EF99EF88;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EF99EF88 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7C49B8(v4);

}

- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *)sub_1CB7C4AEC(a3);
}

- (NSString)debugDescription
{
  _TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *v2;
  void *v3;

  v2 = self;
  sub_1CB7C4CF8();

  v3 = (void *)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)init
{
  _TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *result;

  result = (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
