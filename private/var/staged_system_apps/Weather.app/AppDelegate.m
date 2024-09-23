@implementation AppDelegate

- (_TtC7Weather11AppDelegate)init
{
  return (_TtC7Weather11AppDelegate *)sub_10014C49C();
}

- (void)willEnterForeground
{
  _TtC7Weather11AppDelegate *v2;

  v2 = self;
  sub_10014C884((uint64_t)"Application will enter foreground", 33, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of ApplicationStateManagerType.willEnterForeground());

}

- (void)didBecomeKeyWindow
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtC7Weather11AppDelegate *v6;

  v6 = self;
  sub_10014C988((uint64_t)v6, v2, v3, v4, v5);

}

- (void)didBecomeFocused
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtC7Weather11AppDelegate *v6;

  v6 = self;
  sub_10014CB5C((uint64_t)v6, v2, v3, v4, v5);

}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_100008100(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_1000346D8);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_100008100(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_100036B98);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7Weather11AppDelegate *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10014CC94((int)v11, v9);
  v13 = v12;

  return v13;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v5;
  unint64_t v6;

  v5 = sub_1000A0794(0, &qword_100BCEF30, UISceneSession_ptr);
  v6 = sub_1001205D8();
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v5, v6);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___containerManager));
  sub_1000D949C(OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___container);
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___resolver, &qword_100BCED50);
  sub_1000D949C(OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___observableResolver);
  sub_1000D949C(OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___tracker);
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___stateManager, &qword_100BCEF10);
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___windowFocusManager, &qword_100BCEEE8);
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___debugPresenter, &qword_100BCEEF8);
  sub_1000D949C(OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___testManager);
  sub_1000D949C(OBJC_IVAR____TtC7Weather11AppDelegate_sessionManager);
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Weather11AppDelegate_appSessionManager));
}

- (void)willTerminate
{
  _TtC7Weather11AppDelegate *v2;

  v2 = self;
  sub_100256F6C();

}

- (void)didEnterBackground
{
  _TtC7Weather11AppDelegate *v2;

  v2 = self;
  sub_10014C884((uint64_t)"Application did enter background", 32, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of ApplicationStateManagerType.didEnterBackground());

}

- (id)createSceneContainer
{
  _TtC7Weather11AppDelegate *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v7[3];
  uint64_t v8;

  v2 = self;
  sub_1002573C8(v7);

  v3 = v8;
  v4 = sub_1000DB418(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v7);
  return v5;
}

- (void)didLoseFocus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtC7Weather11AppDelegate *v6;

  v6 = self;
  sub_1002574B4((uint64_t)v6, v2, v3, v4, v5);

}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC7Weather11AppDelegate *v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100257538((uint64_t)v12, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return self & 1;
}

@end
