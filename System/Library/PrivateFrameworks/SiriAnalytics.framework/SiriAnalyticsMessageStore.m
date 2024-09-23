@implementation SiriAnalyticsMessageStore

- (SiriAnalyticsMessageStore)initWithPrefs:(id)a3
{
  return (SiriAnalyticsMessageStore *)MessageStoreShim.init(prefs:)(a3);
}

- (void)prune
{
  SiriAnalyticsMessageStore *v2;

  v2 = self;
  sub_1A02958A8();

}

- (SiriAnalyticsMessageStore)init
{
  MessageStoreShim.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
