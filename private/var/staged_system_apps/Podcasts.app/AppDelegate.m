@implementation AppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC8Podcasts11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001D150(v4);

}

- (void)willConnectScene
{
  _TtC8Podcasts11AppDelegate *v2;

  v2 = self;
  sub_100016CB4();

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_1002C0DD0(self, (uint64_t)a2, a3, (uint64_t)a4, sub_10001F6AC);
}

- (UIWindow)window
{
  void *v3;
  _TtC8Podcasts11AppDelegate *v4;
  id v5;
  id v6;
  id v7;

  v3 = (void *)objc_opt_self(UIApplication);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedApplication");
  v6 = objc_msgSend(v5, "delegate");

  if (!v6)
  {

LABEL_6:
    v7 = 0;
    return (UIWindow *)v7;
  }
  if ((objc_msgSend(v6, "respondsToSelector:", "window") & 1) == 0)
  {

    swift_unknownObjectRelease(v6);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "window");

  swift_unknownObjectRelease(v6);
  return (UIWindow *)v7;
}

+ (id)createWindowWithScene:(id)a3
{
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v4 = (void *)objc_opt_self(UIScreen);
  v5 = a3;
  v6 = objc_msgSend(v4, "mainScreen");
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_allocWithZone((Class)type metadata accessor for Window(0));
  v16 = v5;
  v17 = (void *)Window.init(frame:windowScene:)(v8, v10, v12, v14);
  type metadata accessor for Theme(0);
  v18 = v17;
  v19 = (void *)static Theme.appTintColor.getter();
  objc_msgSend(v18, "setTintColor:", v19);

  return v18;
}

- (UIResponder)commandController
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController));
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_1002C0DD0(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1002C5B24);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Podcasts11AppDelegate *v12;
  char v13;

  v5 = a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_10028D908(a3, v8, v10, (uint64_t)v5);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v13 & 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8Podcasts11AppDelegate *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_1002C56A8(v10);
  _Block_release(v8);

  return self & 1;
}

- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider
{
  _TtC8Podcasts11AppDelegate *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;

  v2 = self;
  v3 = sub_1002C04FC();
  v4 = type metadata accessor for LibraryDataProvider(0);
  BaseObjectGraph.inject<A>(_:)(&v6, v4, v4);

  swift_release(v3);
  return (_TtC8Podcasts19LibraryDataProvider *)v6;
}

- (void)setCommandController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController) = (Class)a3;
  v3 = a3;

}

- (_TtC8Podcasts11AppDelegate)init
{
  return (_TtC8Podcasts11AppDelegate *)sub_1002C0704((uint64_t)self, (uint64_t)a2);
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  _TtC8Podcasts11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1002C6120();

}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC8Podcasts11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1002C6310();

}

- (void)application:(id)a3 openStateRestorationActivity:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts11AppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002C6590();

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC8Podcasts11AppDelegate *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_100026844((unint64_t *)&qword_10055B990, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_1003C9B24);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  v17 = a3;
  v18 = self;
  LOBYTE(a3) = sub_1002C69D8((uint64_t)v12, v16);

  v19 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return a3 & 1;
}

- (void)activeSystemRouteDidChangeWithNotification:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _TtC8Podcasts11AppDelegate *v8;
  _QWORD v9[6];

  v5 = (void *)objc_opt_self(MPAVRoutingController);
  v9[4] = sub_100008858;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000489A8;
  v9[3] = &unk_1004BDBE8;
  v6 = _Block_copy(v9);
  v7 = a3;
  v8 = self;
  objc_msgSend(v5, "getActiveRouteWithTimeout:completion:", v6, 1.0);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts11AppDelegate_subscriptions));

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_appBootstrap));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_nowPlayingBootstrap));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_eventWatchdoge));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts11AppDelegate_urlActionRunner));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts11AppDelegate_pendingBootstrapBlocks));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts11AppDelegate_pptViewHierarchyProxy, &qword_10055E910);
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts11AppDelegate_flowController, &qword_100554570);
}

- (void)handleDebugActivationFrom:(id)a3
{
  id v4;
  _TtC8Podcasts11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1002C4CC4(v4);

}

@end
