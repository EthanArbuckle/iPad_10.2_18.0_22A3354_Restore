@implementation TTRIExtensionCreateReminderViewController

- (_TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController)initWithCoder:(id)a3
{
  return (_TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *)sub_1000179A4(a3);
}

- (void)viewDidLoad
{
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v2;

  v2 = self;
  sub_100017B20();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v4;

  v4 = self;
  sub_100018848(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = self;
  -[TTRIExtensionCreateReminderViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v7 = *(uint64_t *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver);
  if (v7)
  {
    swift_retain(*(Class *)((char *)&v6->super.super.super.isa
                          + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver));
    TTRICurrentTextInputModeObserver.stopObserving()();
    swift_release(v7);
  }
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()(ObjectType, &off_1000214E0);

}

- (void)viewWillLayoutSubviews
{
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v2;

  v2 = self;
  sub_100018A00();

}

- (UITableView)tableView
{
  return (UITableView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView, a3);
}

- (UIBarButtonItem)addBarButtonItem
{
  return (UIBarButtonItem *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_addBarButtonItem);
}

- (void)setAddBarButtonItem:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self+ OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_addBarButtonItem, a3);
}

- (void)didTapCancel:(id)a3
{
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v5;
  double v6;
  _QWORD v7[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v7, a3);
  swift_unknownObjectRelease(a3);
  sub_10000E898(v6);

  sub_10000CEF0(v7);
}

- (void)didTapAdd:(id)a3
{
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  UIViewController.endFirstResponderEditing()();
  -[TTRIExtensionCreateReminderViewController resignFirstResponder](v5, "resignFirstResponder");
  sub_10000E4F8();

  sub_10000CEF0(v6);
}

- (_TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *result;

  v4 = a4;
  result = (_TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController *)_swift_stdlib_reportUnimplementedInitializer("RemindersSharingExtension.TTRIExtensionCreateReminderViewController", 67, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView, a2);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_addBarButtonItem, v3);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell));
}

@end
