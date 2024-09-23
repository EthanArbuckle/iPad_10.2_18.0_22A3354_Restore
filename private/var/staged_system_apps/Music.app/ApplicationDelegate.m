@implementation ApplicationDelegate

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5Music19ApplicationDelegate *v12;
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
  v13 = sub_1005B3B50(a3, v8, v10, (uint64_t)v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music19ApplicationDelegate *v11;
  char v12;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100048748(&qword_10119D860, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100EA77CC);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_1006DD95C();

  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Music19ApplicationDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1006DDB6C(v9, v10);

  return v12;
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
  _TtC5Music19ApplicationDelegate *v18;
  char v19;
  __n128 v20;
  uint64_t v22;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_100048748(&qword_10119D880, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_100EA7810);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  v17 = a3;
  v18 = self;
  sub_1006DDFD0(v17, (uint64_t)v12, v16);
  LOBYTE(a3) = v19;

  v20 = swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v20);
  return a3 & 1;
}

- (UIResponder)nextResponder
{
  _TtC5Music19ApplicationDelegate *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1006DD0AC();
  v4 = v3;

  return (UIResponder *)v4;
}

- (id)application:(id)a3 handlerForIntent:(id)a4
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  _TtC5Music19ApplicationDelegate *v11;
  _QWORD *v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD v19[4];

  objc_opt_self(INPlayMediaIntent);
  if (!swift_dynamicCastObjCClass(a4))
    return 0;
  v7 = (objc_class *)type metadata accessor for MediaIntentHandler();
  v8 = objc_allocWithZone(v7);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v19[3] = v7;
  v19[0] = objc_msgSend(v8, "init");

  if (!v7)
    return 0;
  v12 = sub_100007E68(v19, (uint64_t)v7);
  v13 = *((_QWORD *)v7 - 1);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v13 + 16))(v16, v14);
  v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v16, v7);
  (*(void (**)(char *, objc_class *))(v13 + 8))(v16, v7);
  _s5Music18DragDropToPlaylistV6OriginVwxx_0(v19);
  return v17;
}

- (_TtC5Music19ApplicationDelegate)init
{
  return (_TtC5Music19ApplicationDelegate *)sub_1006DD3DC();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC5Music19ApplicationDelegate_carMetricsObserver));
}

- (void)userNotificationCenter:openSettingsForNotification:
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];

  v0 = sub_100007E8C(&qword_10119E460);
  __chkstk_darwin(v0);
  v2 = &v24[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v24[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v9 = &v24[-v8];
  v10 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v11 = objc_msgSend(v10, "connectedScenes");
  v12 = sub_10004A07C(0, &qword_1011A4630, UIScene_ptr);
  v13 = sub_1000A569C();
  v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v11, v12, v13);

  sub_10079470C(v14);
  v16 = v15;
  swift_bridgeObjectRelease();
  if (!((unint64_t)v16 >> 62))
  {
    if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:

    swift_bridgeObjectRelease();
    return;
  }
  if (v16 < 0)
    v22 = v16;
  else
    v22 = v16 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v23 = _CocoaArrayWrapper.endIndex.getter(v22);
  swift_bridgeObjectRelease();
  if (!v23)
    goto LABEL_14;
LABEL_3:
  if ((v16 & 0xC000000000000001) != 0)
  {
    v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v16);
  }
  else
  {
    if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v17 = *(id *)(v16 + 32);
  }
  v18 = v17;

  swift_bridgeObjectRelease();
  URL.init(string:)(0xD00000000000001DLL, 0x8000000100E428D0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {

    sub_10004FF60((uint64_t)v2, &qword_10119E460);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v6, v9, v3);
    v19 = type metadata accessor for LaunchOptions(0);
    swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
    v20 = v18;
    sub_100267918((uint64_t)v6, 0, v20);
    sub_100275D54();

    v21 = swift_release();
    (*(void (**)(_BYTE *, uint64_t, __n128))(v4 + 8))(v9, v3, v21);
  }
}

@end
