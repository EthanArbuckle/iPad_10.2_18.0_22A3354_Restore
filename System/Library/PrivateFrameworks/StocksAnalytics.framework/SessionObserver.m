@implementation SessionObserver

- (void)pushOrientationData
{
  _TtC15StocksAnalytics15SessionObserver *v2;

  v2 = self;
  sub_1DC4BD5A4();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC15StocksAnalytics15SessionObserver *v5;

  v4 = a3;
  v5 = self;
  _s15StocksAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v4);

}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6;
  id v7;
  _TtC15StocksAnalytics15SessionObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s15StocksAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v6);

}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC15StocksAnalytics15SessionObserver *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_currentDevice);
  objc_msgSend(v6, sel_endGeneratingDeviceOrientationNotifications);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[SessionObserver dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  sub_1DC4BE354((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_userContext);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_appConfigurationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_watchlistManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_appIntentExecutionTypeProvider);
  swift_release();
}

- (_TtC15StocksAnalytics15SessionObserver)init
{
  _TtC15StocksAnalytics15SessionObserver *result;

  result = (_TtC15StocksAnalytics15SessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)offerDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15StocksAnalytics15SessionObserver *v8;
  uint64_t v9;

  v4 = sub_1DC62A0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC62A098();
  v8 = self;
  sub_1DC5DBEE8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
