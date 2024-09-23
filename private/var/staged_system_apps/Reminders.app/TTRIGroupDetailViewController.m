@implementation TTRIGroupDetailViewController

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders29TTRIGroupDetailViewController *)sub_10044F3F4(v3, v4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_localUndoManager));
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders29TTRIGroupDetailViewController *v3;

  v3 = self;
  sub_10044F554((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[TTRIGroupDetailViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_10044F94C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9Reminders29TTRIGroupDetailViewController *v4;

  v4 = self;
  sub_10044FB80(a3, (uint64_t)v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[TTRIGroupDetailViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(v4, "resignFirstResponder", v5.receiver, v5.super_class);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC9Reminders29TTRIGroupDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004502C4();

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  _TtC9Reminders29TTRIGroupDetailViewController *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v20 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v20 - v15;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v16, v7);
  v17 = a3;
  v18 = self;
  IndexPath.init(item:section:)(1, 0);
  LOBYTE(a3) = static IndexPath.== infix(_:_:)(v13, v10);
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v13, v7);
  v19(v10, v7);
  if ((a3 & 1) != 0)
    sub_1000B12F0();

  v19(v16, v7);
}

- (UITextField)nameTextField
{
  return (UITextField *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_nameTextField);
}

- (void)setNameTextField:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_nameTextField, a3);
}

- (UIBarButtonItem)doneBarButtonItem
{
  return (UIBarButtonItem *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_doneBarButtonItem);
}

- (void)setDoneBarButtonItem:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_doneBarButtonItem, a3);
}

- (UITableViewCell)includeCell
{
  return (UITableViewCell *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_includeCell);
}

- (void)setIncludeCell:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_includeCell, a3);
}

- (void)didTapCancel:(id)a3
{
  _TtC9Reminders29TTRIGroupDetailViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_1000B111C();

  sub_100027F10(v6);
}

- (void)didTapCreate:(id)a3
{
  sub_100450174(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10044FFE4);
}

- (void)nameTextFieldDidChange:(id)a3
{
  sub_100450174(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100450094);
}

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC9Reminders29TTRIGroupDetailViewController *result;

  result = (_TtC9Reminders29TTRIGroupDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIGroupDetailViewController", 39, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders29TTRIGroupDetailViewController *result;

  v4 = a4;
  result = (_TtC9Reminders29TTRIGroupDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIGroupDetailViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_nameTextField);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_doneBarButtonItem);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_includeCell);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_localUndoManager));
}

@end
