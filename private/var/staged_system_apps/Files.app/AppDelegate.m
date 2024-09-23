@implementation AppDelegate

- (_TtC5Files11AppDelegate)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files11AppDelegate_fileImportController);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v4, "init");
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10005A360((unint64_t *)&unk_100650690, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1004D91A0);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10037AFB0();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC5Files11AppDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10037AC7C(a3);
  swift_unknownObjectRelease(a3);

}

- (void)observedApplicationDidEnterBackgroundWithSender:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_10037B3EC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files11AppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10037BD00(v9, v10);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files11AppDelegate *v11;

  v7 = sub_10004F2F0(0, &qword_100647C90, UISceneSession_ptr);
  v8 = sub_1000835B4(&qword_100647C98, &qword_100647C90, UISceneSession_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10037BF30(v10, v9);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files11AppDelegate_fileImportController);
}

@end
