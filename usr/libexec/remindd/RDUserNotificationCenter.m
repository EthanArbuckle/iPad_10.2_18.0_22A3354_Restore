@implementation RDUserNotificationCenter

- (_TtC7remindd24RDUserNotificationCenter)initWithQueue:(id)a3 notificationCenter:(id)a4
{
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  objc_super v15;

  v7 = (char *)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_reminderAlarmDelegate;
  *((_QWORD *)v7 + 1) = 0;
  swift_unknownObjectWeakInit(v7, 0);
  v8 = (char *)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_todayNotificationDelegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);
  v9 = (char *)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_beforeFirstUnlockReminderDelegate;
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9, 0);
  v10 = (char *)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_assignmentNotificationDelegate;
  *((_QWORD *)v10 + 1) = 0;
  swift_unknownObjectWeakInit(v10, 0);
  v11 = (char *)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_sharedListUpdateNotificationDelegate;
  *((_QWORD *)v11 + 1) = 0;
  swift_unknownObjectWeakInit(v11, 0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_queue) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_notificationCenter) = (Class)a4;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for RDUserNotificationCenter();
  v12 = a3;
  v13 = a4;
  return -[RDUserNotificationCenter init](&v15, "init");
}

- (_TtC7remindd24RDUserNotificationCenter)init
{
  _TtC7remindd24RDUserNotificationCenter *result;

  result = (_TtC7remindd24RDUserNotificationCenter *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDUserNotificationCenter", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_reminderAlarmDelegate);
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_todayNotificationDelegate);
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_beforeFirstUnlockReminderDelegate);
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_assignmentNotificationDelegate);
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_sharedListUpdateNotificationDelegate);

}

- (void)retainNotificationWithIdentifier:(id)a3 reference:(id)a4 content:(id)a5 skipBanner:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v7;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _TtC7remindd24RDUserNotificationCenter *v21;

  v7 = a6;
  v12 = (uint64_t (*)())_Block_copy(a7);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  if (v12)
  {
    v19 = swift_allocObject(&unk_1007F56E8, 24, 7);
    *(_QWORD *)(v19 + 16) = v12;
    v12 = sub_100119B24;
  }
  else
  {
    v19 = 0;
  }
  v20 = a5;
  v21 = self;
  sub_100486364(v13, v15, v16, v18, v20, v7, (uint64_t)v12, v19);
  sub_1000A5C24((uint64_t)v12, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)releaseNotificationWithIdentifier:(id)a3 reference:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC7remindd24RDUserNotificationCenter *v16;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  if (v8)
  {
    v15 = swift_allocObject(&unk_1007F56C0, 24, 7);
    *(_QWORD *)(v15 + 16) = v8;
    v8 = sub_10011701C;
  }
  else
  {
    v15 = 0;
  }
  v16 = self;
  RDUserNotificationCenter.releaseNotification(identifier:reference:completion:)(v9, v11, v12, v14, (uint64_t)v8, v15);
  sub_1000A5C24((uint64_t)v8, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _TtC7remindd24RDUserNotificationCenter *v17;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = qword_1008375B0;
  v10 = a3;
  v11 = a4;
  v17 = self;
  if (v9 != -1)
    swift_once(&qword_1008375B0, sub_1004849CC);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_10001AAA8(v12, (uint64_t)qword_10084C000);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "userNotificationCenter willPresent", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  (*((void (**)(void *, uint64_t))v8 + 2))(v8, 27);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC7remindd24RDUserNotificationCenter *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_10048BB3C(v10, (uint64_t)v11, (void (**)(void))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7remindd24RDUserNotificationCenter *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;

  v6 = qword_1008375B0;
  v7 = a3;
  v14 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once(&qword_1008375B0, sub_1004849CC);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_10001AAA8(v9, (uint64_t)qword_10084C000);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.error.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "userNotificationCenter openSettingsForNotification, but we don't have any settings pane yet so bye ;)",
      v13,
      2u);
    swift_slowDealloc(v13, -1, -1);
  }

}

- (void)showNotificationWithIdentifier:(id)a3 content:(id)a4 completion:(id)a5
{
  void (*v8)(uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _TtC7remindd24RDUserNotificationCenter *v13;

  v8 = (void (*)(uint64_t))_Block_copy(a5);
  v9 = v8;
  if (!a3)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v11;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject(&unk_1007FDD10, 24, 7);
  *(_QWORD *)(v12 + 16) = v9;
  v9 = sub_10011701C;
LABEL_6:
  swift_unknownObjectRetain(a4);
  v13 = self;
  RDUserNotificationCenter.showNotification(withIdentifier:content:completion:)(v10, (unint64_t)a3, (uint64_t)a4, (uint64_t)v9, v12);
  sub_1000A5C24((uint64_t)v9, v12);
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease();
}

- (id)calDAVSharedListNotificationContentWithList:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC7remindd24RDUserNotificationCenter *v10;
  id v11;
  uint64_t v13;

  v5 = type metadata accessor for RDUserNotificationType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = a3;
  v10 = self;
  *v8 = objc_msgSend(v9, "objectID");
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for RDUserNotificationType.caldavSharedList(_:), v5);
  v11 = sub_10023F73C(0, v9, 0);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

@end
