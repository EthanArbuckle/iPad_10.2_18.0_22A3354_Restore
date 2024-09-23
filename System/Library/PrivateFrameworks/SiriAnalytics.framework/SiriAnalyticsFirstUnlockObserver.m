@implementation SiriAnalyticsFirstUnlockObserver

- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)initWithQueue:(id)a3
{
  return (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver *)SiriAnalyticsFirstUnlockObserver.init(queue:)(a3);
}

- (void)afterFirstUnlock:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A02B0A44((uint64_t)sub_1A0276DB8, v5);

  swift_release();
}

- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)init
{
  SiriAnalyticsFirstUnlockObserver.init()();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
