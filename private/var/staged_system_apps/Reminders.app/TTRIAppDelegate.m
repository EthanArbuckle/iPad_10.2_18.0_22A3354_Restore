@implementation TTRIAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9Reminders15TTRIAppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_1000175C8(&qword_10063E3F8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10051FE80);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, &type metadata for Any[8], v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_100018288((uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (_TtC9Reminders15TTRIAppDelegate)init
{
  return (_TtC9Reminders15TTRIAppDelegate *)sub_10000E644();
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
  _TtC9Reminders15TTRIAppDelegate *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_1000175C8(&qword_10063E408, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_10051FE3C);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, &type metadata for Any[8], v15);
  v17 = a3;
  v18 = self;
  LOBYTE(a3) = sub_100257854((uint64_t)v12, v16);

  v19 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return a3 & 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  sub_1002572E0(self, (int)a2, a3, a4, a5, (void (*)(id, void *))sub_1002579A4);
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC9Reminders15TTRIAppDelegate *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  LOBYTE(v6) = sub_100257B04(v6, v8);

  swift_bridgeObjectRelease(v8);
  return v6 & 1;
}

- (void)application:(id)a3 didUpdateUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders15TTRIAppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100257CA4(v7);

}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC9Reminders15TTRIAppDelegate *v11;
  char v12;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = sub_100257E5C(v10);
  _Block_release(v8);

  return v12 & 1;
}

- (void)application:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders15TTRIAppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100257FF4(v7);

}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC9Reminders15TTRIAppDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100256D94(a3);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9Reminders15TTRIAppDelegate____lazy_storage___geoService));
  swift_release();
  swift_release();
  swift_release();
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders15TTRIAppDelegate____lazy_storage___hashtagAssociation, &qword_100651F70);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_1002572E0(self, (int)a2, a3, a4, a5, (void (*)(id, void *))sub_100258404);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_1002572E0(self, (int)a2, a3, a4, a5, (void (*)(id, void *))sub_100258624);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders15TTRIAppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100258910(a4);

}

@end
