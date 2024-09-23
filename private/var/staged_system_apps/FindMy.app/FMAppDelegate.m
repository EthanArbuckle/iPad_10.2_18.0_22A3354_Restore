@implementation FMAppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC6FindMy13FMAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001BBC4(v4);

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6FindMy13FMAppDelegate *v11;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100008000(&qword_1005D2600, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100481478);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  sub_100020BA0(v10, v4);

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window));
}

- (_TtC6FindMy13FMAppDelegate)init
{
  return (_TtC6FindMy13FMAppDelegate *)sub_100008A58();
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC6FindMy13FMAppDelegate *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_10009E200(v10);
  _Block_release(v8);

  return self & 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC6FindMy13FMAppDelegate *v12;
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
    v5 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_1000F2260(a3, v8, v10, v5);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v13 & 1;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_1002F2308(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_1002F6B00);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_1002F2308(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_1002F79C8);
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  _TtC6FindMy13FMAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100346A6C(0xD00000000000001FLL, 0x80000001004C02D0);

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  _TtC6FindMy13FMAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100345D60();

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  _TtC6FindMy13FMAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100346504();

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC6FindMy13FMAppDelegate *v13;
  uint64_t v15;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_10034682C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC6FindMy13FMAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100346A6C(0xD00000000000001CLL, 0x80000001004C0230);

}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_mediator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_alertQueue));

}

@end
