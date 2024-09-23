@implementation ApplicationDelegate

- (_TtC16MusicApplication19ApplicationDelegate)init
{
  return (_TtC16MusicApplication19ApplicationDelegate *)sub_5BA7B0();
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication19ApplicationDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_4DD24((unint64_t *)&unk_14D58B0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_105EDDC);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_5BD1E4(v10);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication19ApplicationDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_5BD54C(v9);

  return v12;
}

- (BOOL)application:(id)a3 shouldRestoreApplicationState:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication19ApplicationDelegate *v11;
  char v12;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_4DD24((unint64_t *)&unk_14D58B0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_105EDDC);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_5BD784();

  swift_bridgeObjectRelease();
  return v12 & 1;
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
  id v18;
  id v19;
  _TtC16MusicApplication19ApplicationDelegate *v20;
  char v21;
  char v22;
  uint64_t v24;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_4DD24(&qword_14ACF08, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_105EE20);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = self;
  sub_5BDA60(v17, (uint64_t)v12, v16);
  v22 = v21;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  return v22 & 1;
}

- (BOOL)application:(id)a3 shouldSaveApplicationState:(id)a4
{
  return 1;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  _QWORD *v8;
  void (*v9)(_QWORD *, uint64_t);
  id v10;
  id v11;
  _TtC16MusicApplication19ApplicationDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = (void (*)(_QWORD *, uint64_t))v8[2];
  v10 = a3;
  v11 = a4;
  v12 = self;
  v9(v8, 26);
  _Block_release(v8);

}

- (UIResponder)nextResponder
{
  _TtC16MusicApplication19ApplicationDelegate *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_5BB398();
  v4 = v3;

  return (UIResponder *)v4;
}

- (id)application:(id)a3 handlerForIntent:(id)a4
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication19ApplicationDelegate *v11;
  _QWORD *v12;
  uint64_t v13;
  double v14;
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
  v12 = __swift_project_boxed_opaque_existential_1(v19, (uint64_t)v7);
  v13 = *((_QWORD *)v7 - 1);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v13 + 16))(v16, v14);
  v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v16, v7);
  (*(void (**)(char *, objc_class *))(v13 + 8))(v16, v7);
  __swift_destroy_boxed_opaque_existential_1(v19);
  return v17;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19ApplicationDelegate_remoteRadioController));
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  __n128 v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  _BYTE v26[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_14AED20);
  __chkstk_darwin(v0);
  v2 = &v26[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v9 = &v26[-v8];
  URL.init(string:)(0xD00000000000001DLL, 0x80000000010E5990);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_56024((uint64_t)v2, &qword_14AED20);
    return;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v9, v2, v3);
  v10 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v11 = objc_msgSend(v10, "connectedScenes");
  v12 = sub_4E684(0, (unint64_t *)&qword_14C5D80, UIScene_ptr);
  v13 = sub_950D0((unint64_t *)&qword_14AD310, (unint64_t *)&qword_14C5D80, UIScene_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v11, v12, v13);
  sub_1A3B54(v14);
  v16 = v15;

  swift_bridgeObjectRelease();
  if ((unint64_t)v16 >> 62)
  {
    if (v16 < 0)
      v23 = v16;
    else
      v23 = v16 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v24 = _CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease();
    if (v24)
      goto LABEL_5;
LABEL_13:
    v25 = swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t, __n128))(v4 + 8))(v9, v3, v25);

    return;
  }
  if (!*(_QWORD *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8)))
    goto LABEL_13;
LABEL_5:
  if ((v16 & 0xC000000000000001) != 0)
  {
    v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v16);
    goto LABEL_8;
  }
  if (*(_QWORD *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8)))
  {
    v17 = *(id *)(v16 + 32);
LABEL_8:
    v18 = v17;

    v19 = swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t, __n128))(v4 + 16))(v6, v9, v3, v19);
    v20 = type metadata accessor for LaunchOptions(0);
    swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
    v21 = v18;
    v22 = sub_B1E708((uint64_t)v6, 0, v21);
    sub_B2C48C();

    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);
    swift_release(v22);
    return;
  }
  __break(1u);
}

@end
