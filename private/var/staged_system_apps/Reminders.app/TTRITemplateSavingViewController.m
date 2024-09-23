@implementation TTRITemplateSavingViewController

- (_TtC9Reminders32TTRITemplateSavingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028E198();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  _TtC9Reminders32TTRITemplateSavingViewController *v2;

  v2 = self;
  sub_10028C4E8();

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders32TTRITemplateSavingViewController *v3;

  v3 = self;
  sub_10028C5EC((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Reminders32TTRITemplateSavingViewController *v4;

  v4 = self;
  sub_10028CBB8(a3, (uint64_t)v4);

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
  -[TTRITemplateSavingViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
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
  _TtC9Reminders32TTRITemplateSavingViewController *v6;
  objc_super v7;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v6 = self;
  -[TTRITemplateSavingViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  UIViewController.endFirstResponderEditing()();
  -[TTRITemplateSavingViewController resignFirstResponder](v6, "resignFirstResponder", v7.receiver, v7.super_class);
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()(ObjectType, &off_1005FCAF0);

}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC9Reminders32TTRITemplateSavingViewController *v3;

  v3 = self;
  sub_10028CDF0((uint64_t)v3, v2);

}

- (void)didTapCancel:(id)a3
{
  _TtC9Reminders32TTRITemplateSavingViewController *v5;
  _TtC9Reminders32TTRITemplateSavingViewController *v6;
  void *v7;
  id v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton);
  if (v7)
  {
    v8 = v7;
    sub_10023B128((uint64_t)v8);

    sub_10002CAA0((uint64_t)v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)didTapCommit:(id)a3
{
  _TtC9Reminders32TTRITemplateSavingViewController *v5;
  _TtC9Reminders32TTRITemplateSavingViewController *v6;
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
  UIViewController.endFirstResponderEditing()();
  sub_10023B6FC();

  sub_10002CAA0((uint64_t)v7);
}

- (_TtC9Reminders32TTRITemplateSavingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders32TTRITemplateSavingViewController *result;

  v4 = a4;
  result = (_TtC9Reminders32TTRITemplateSavingViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRITemplateSavingViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_tableDataController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController____lazy_storage___badgeSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController____lazy_storage___badgeCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController____lazy_storage___nameCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController____lazy_storage___templateConfigurationSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController____lazy_storage___includeCompletedCell));
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC9Reminders32TTRITemplateSavingViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10023AAD8();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v3;
  id v5;
  _TtC9Reminders32TTRITemplateSavingViewController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    sub_10023B128((uint64_t)v7);

  }
  else
  {
    __break(1u);
  }
}

@end
