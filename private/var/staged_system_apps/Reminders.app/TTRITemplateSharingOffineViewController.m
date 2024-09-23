@implementation TTRITemplateSharingOffineViewController

- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *result;
  uint64_t v14;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = qword_10063D598;
  v9 = a3;
  if (v8 != -1)
    swift_once(&qword_10063D598, sub_1002610D8);
  v10 = sub_100012DC4(v4, (uint64_t)qword_100652D20);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  v11 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  v12 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1002EB23C((uint64_t)"init(coder:) has not been implemented", 37, 2uLL, v11, v12);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *v3;

  v3 = self;
  sub_100261240((uint64_t)v3, v2);

}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002617D8();

}

- (void)didTapClose:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *v8;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD v17[2];

  v5 = sub_10002A750(&qword_100649BA0);
  __chkstk_darwin(v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v9 = self;
  }
  v10 = *(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders39TTRITemplateSharingOffineViewController_presenter];
  if (qword_10063D2E8 != -1)
    swift_once(&qword_10063D2E8, sub_10005AF30);
  v11 = type metadata accessor for Logger(0);
  sub_100012DC4(v11, (uint64_t)qword_100640738);
  v12 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Template Sharing Close Offline Message", 38, 2, v12);
  swift_bridgeObjectRelease(v12);
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  type metadata accessor for MainActor(0);
  v14 = swift_retain();
  v15 = static MainActor.shared.getter(v14);
  v16 = (_QWORD *)swift_allocObject(&unk_1005F9C50, 40, 7);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v10;
  sub_100148368((uint64_t)v7, (uint64_t)&unk_100652D70, (uint64_t)v16);

  swift_release();
  sub_10002CAA0((uint64_t)v17);
}

- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *result;

  v4 = a4;
  result = (_TtC9Reminders39TTRITemplateSharingOffineViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRITemplateSharingOffineViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders39TTRITemplateSharingOffineViewController_presenter]);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  _TtC9Reminders39TTRITemplateSharingOffineViewController *v8;

  v4 = qword_10063D2E8;
  v5 = a3;
  v8 = self;
  if (v4 != -1)
    swift_once(&qword_10063D2E8, sub_10005AF30);
  v6 = type metadata accessor for Logger(0);
  sub_100012DC4(v6, (uint64_t)qword_100640738);
  v7 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Template Sharing User Dismiss Offline Message", 45, 2, v7);
  swift_bridgeObjectRelease(v7);
  sub_10005B324(1);

}

@end
