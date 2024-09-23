@implementation TTRIListDetailViewController

- (_TtC9Reminders28TTRIListDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10021D3F8();
}

- (void)loadView
{
  id v3;
  _TtC9Reminders28TTRIListDetailViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UITableView);
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:style:", 2, 0.0, 0.0, 0.0, 0.0);
  -[TTRIListDetailViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders28TTRIListDetailViewController *v3;

  v3 = self;
  sub_100218CA4((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Reminders28TTRIListDetailViewController *v4;

  v4 = self;
  sub_100219230(a3, (uint64_t)v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9Reminders28TTRIListDetailViewController *v4;

  v4 = self;
  sub_100219378(a3, (uint64_t)v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC9Reminders28TTRIListDetailViewController *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = self;
  -[TTRIListDetailViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  if (qword_10063D4F8 != -1)
    swift_once(&qword_10063D4F8, sub_100218B70);
  v7 = type metadata accessor for Logger(0);
  sub_100012DC4(v7, (uint64_t)qword_10064D7E0);
  sub_1002EB4BC(0x746544207473694CLL, 0xEC000000736C6961);
  -[TTRIListDetailViewController resignFirstResponder](v6, "resignFirstResponder", v8.receiver, v8.super_class);
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()(ObjectType, &off_1005F77A8);

}

- (void)didTapCancel:(id)a3
{
  _TtC9Reminders28TTRIListDetailViewController *v5;
  uint64_t Strong;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;
  _QWORD v11[4];
  _QWORD v12[8];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v11);
  swift_unknownObjectRelease(a3);
  UIViewController.endFirstResponderEditing()();
  Strong = swift_unknownObjectWeakLoadStrong((char *)v5 + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cancelBarButtonItem);
  if (Strong)
  {
    v8 = (void *)Strong;
    v9 = *(_QWORD *)&v5->presenter[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_presenter];
    ObjectType = swift_getObjectType(*(Class *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_presenter), v7);
    static TTRIPopoverAnchor.barButtonItem(_:permittedArrowDirections:)(v12, v8, 0, 1);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 56))(v12, ObjectType, v9);
    sub_1000A2958((uint64_t)v12);

  }
  else
  {

  }
  sub_100027F10(v11);
}

- (void)didTapDone:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Reminders28TTRIListDetailViewController *v8;
  uint64_t v9;
  _TtC9Reminders28TTRIListDetailViewController *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v13[4];

  v5 = sub_10002A750(&qword_100649BA0);
  __chkstk_darwin(v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain(a3);
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v13);
  swift_unknownObjectRelease(a3);
  UIViewController.endFirstResponderEditing()();
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  type metadata accessor for MainActor(0);
  v10 = v8;
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_1005F7868, 40, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v10;
  sub_100148368((uint64_t)v7, (uint64_t)&unk_10064D910, (uint64_t)v12);

  swift_release();
  sub_100027F10(v13);
}

- (_TtC9Reminders28TTRIListDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders28TTRIListDetailViewController *result;

  v4 = a4;
  result = (_TtC9Reminders28TTRIListDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIListDetailViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_presenter));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_doneBarButtonItem);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cancelBarButtonItem);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(_QWORD *)&self->autoBeginEditingPerformed[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor];
  v4 = *(_QWORD *)&self->$__lazy_storage_$_badgeSection[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor
                                                      + 7];
  v5 = *(_QWORD *)&self->$__lazy_storage_$_badgeCell[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor
                                                   + 7];
  v6 = *(_QWORD *)&self->$__lazy_storage_$_nameCell[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor
                                                  + 7];
  sub_1001CCDC0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor), *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor], *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor + 8], *(_QWORD *)&self->doneBarButtonItem[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor], *(_QWORD *)&self->cancelBarButtonItem[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor], *(_QWORD *)&self->tableDataController[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor]);
  sub_100179CA0(v3, v4, v5, v6);
  swift_release();
  swift_release();
}

@end
