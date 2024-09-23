@implementation AppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6Health11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10000F6E4(&qword_1000EE820, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000B0CF8);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10000E55C();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC6Health11AppDelegate *v11;
  id v12;
  id v13;
  NSString v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_allocWithZone((Class)UISceneConfiguration);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithName:sessionRole:", v14, v12);

  return v15;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6Health11AppDelegate_window));
}

- (_TtC6Health11AppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6Health11AppDelegate____lazy_storage___pluginNotificationRouter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v5;
  _TtC6Health11AppDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10005DCD4();

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
  _TtC6Health11AppDelegate *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_10000F6E4(&qword_1000EC540, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_1000B0D3C);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  v17 = a3;
  v18 = self;
  LOBYTE(v14) = sub_10005DEB0((uint64_t)v12, v16);

  v19 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v14 & 1;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6Health11AppDelegate____lazy_storage___pluginNotificationRouter));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC6Health11AppDelegate *v12;
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
  v13 = sub_10006C104((uint64_t)a3, v8, v10, (uint64_t)v5);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v13 & 1;
}

@end
