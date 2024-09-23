@implementation TTRITemplateSharingConfigurationViewController

- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001E1B44();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v2;

  v2 = self;
  sub_1001DF54C();

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v3;

  v3 = self;
  sub_1001DF650((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v4;

  v4 = self;
  sub_1001E0050(a3, (uint64_t)v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v8.receiver;
  -[TTRITemplateSharingConfigurationViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (!v7)
      objc_msgSend(v4, "becomeFirstResponder");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v6;
  objc_super v7;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v6 = self;
  -[TTRITemplateSharingConfigurationViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  UIViewController.endFirstResponderEditing()();
  -[TTRITemplateSharingConfigurationViewController resignFirstResponder](v6, "resignFirstResponder", v7.receiver, v7.super_class);
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()(ObjectType, &off_1005F6488);

}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v3;

  v3 = self;
  sub_1001E0300((uint64_t)v3, v2);

}

- (void)didTapCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v8;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v9;
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
  v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_presenter);
  if (qword_10063D2E8 != -1)
    swift_once(&qword_10063D2E8, sub_10005AF30);
  v11 = type metadata accessor for Logger(0);
  sub_100012DC4(v11, (uint64_t)qword_100640738);
  v12 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Template Sharing cancel", 23, 2, v12);
  swift_bridgeObjectRelease(v12);
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  type metadata accessor for MainActor(0);
  v14 = swift_retain();
  v15 = static MainActor.shared.getter(v14);
  v16 = (_QWORD *)swift_allocObject(&unk_1005F6538, 40, 7);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v10;
  sub_100148368((uint64_t)v7, (uint64_t)&unk_10064BD48, (uint64_t)v16);

  swift_release();
  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)didTapCommit:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v8;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v9;
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
  UIViewController.endFirstResponderEditing()();
  v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_presenter);
  if (qword_10063D2E8 != -1)
    swift_once(&qword_10063D2E8, sub_10005AF30);
  v11 = type metadata accessor for Logger(0);
  sub_100012DC4(v11, (uint64_t)qword_100640738);
  v12 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Template Sharing create or update link", 38, 2, v12);
  swift_bridgeObjectRelease(v12);
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  type metadata accessor for MainActor(0);
  v14 = swift_retain();
  v15 = static MainActor.shared.getter(v14);
  v16 = (_QWORD *)swift_allocObject(&unk_1005F6510, 40, 7);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v10;
  sub_100148368((uint64_t)v7, (uint64_t)&unk_10064BD40, (uint64_t)v16);

  swift_release();
  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)didTapShowPreview:(id)a3
{
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v5;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_10005AFC0();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *result;

  v4 = a4;
  result = (_TtC9Reminders46TTRITemplateSharingConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRITemplateSharingConfigurationViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_tableDataController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___dateAndTimeCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___tagsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___locationsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___dateAndTimeSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___tagsSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___locationsSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController____lazy_storage___imageSection));
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  _TtC9Reminders46TTRITemplateSharingConfigurationViewController *v8;

  v4 = qword_10063D2E8;
  v5 = a3;
  v8 = self;
  if (v4 != -1)
    swift_once(&qword_10063D2E8, sub_10005AF30);
  v6 = type metadata accessor for Logger(0);
  sub_100012DC4(v6, (uint64_t)qword_100640738);
  v7 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Template Sharing User Dismiss", 29, 2, v7);
  swift_bridgeObjectRelease(v7);
  sub_10005B324(1);

}

@end
