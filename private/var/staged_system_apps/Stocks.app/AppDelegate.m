@implementation AppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9StocksApp11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10000B308(&qword_1000479F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100037B40);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10000B348((uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9StocksApp11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10000B308(&qword_1000479F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100037B40);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10000BC54(v10, (uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _TtC9StocksApp11AppDelegate *v14;

  v6 = a3;
  v7 = a4;
  v14 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  v11 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v12 = (void *)static OS_os_log.default.getter(v11);
  v13 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("successfully registered for remote notifications", 48, 2, &_mh_execute_header, v12, v13, &_swiftEmptyArrayStorage);

  sub_1000105D4(v8, v10);
}

- (_TtC9StocksApp11AppDelegate)init
{
  return (_TtC9StocksApp11AppDelegate *)sub_100006004();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container));
  sub_1000060F0((uint64_t)self + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker));
}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC9StocksApp11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100011FC8();

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9StocksApp11AppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1000121C4(v9);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9StocksApp11AppDelegate *v11;

  v7 = sub_1000059D0(0, &qword_100047F20, UISceneSession_ptr);
  v8 = sub_100012E3C();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100012424(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC9StocksApp11AppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = swift_allocObject(&unk_100042688, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = self;
  sub_1000127B0(v9, (uint64_t)sub_100012F28, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v6;
  _TtC9StocksApp11AppDelegate *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100012A00((uint64_t)v8);

}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC9StocksApp11AppDelegate *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100042610, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100012B34((uint64_t)sub_100012DB4, v7);

  swift_release(v7);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  objc_class *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC9StocksApp11AppDelegate *v12;
  char v13;

  v5 = (objc_class *)a5;
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
    v5 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_100012C8C(v8, v10, v5);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v13 & 1;
}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC9StocksApp11AppDelegate *v5;
  _QWORD *v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_100010A88();
  objc_msgSend(v6, "buildMenuWithBuilder:", a3);
  swift_unknownObjectRelease(a3);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _TtC9StocksApp11AppDelegate *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  v4 = self;
  sub_100011670((uint64_t)a3, v12);

  v5 = v13;
  if (!v13)
    return 0;
  v6 = sub_10000C1E8(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10000778C(v12);
  return v10;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC9StocksApp11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100011828((uint64_t)v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC9StocksApp11AppDelegate *v7;
  uint64_t v8;
  _TtC9StocksApp11AppDelegate *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_1000119A8((uint64_t)a3, (uint64_t)v12);

  sub_100011C40((uint64_t)v12);
  return v10 & 1;
}

@end
