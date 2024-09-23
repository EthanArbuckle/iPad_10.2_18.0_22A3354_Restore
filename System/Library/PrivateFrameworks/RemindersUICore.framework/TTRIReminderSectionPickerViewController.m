@implementation TTRIReminderSectionPickerViewController

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B44D3BC8();
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore39TTRIReminderSectionPickerViewController *v2;

  v2 = self;
  sub_1B44D0420();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TTRIReminderSectionPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_1B44D0A5C();

}

- (void)cancelButtonAction:(id)a3
{
  _TtC15RemindersUICore39TTRIReminderSectionPickerViewController *v4;
  _TtC15RemindersUICore39TTRIReminderSectionPickerViewController *v5;
  __int128 v6;
  __int128 v7;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = self;
  }
  -[TTRIReminderSectionPickerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1B4314F88((uint64_t)&v6);
}

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithStyle:(int64_t)a3
{
  _TtC15RemindersUICore39TTRIReminderSectionPickerViewController *result;

  result = (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore39TTRIReminderSectionPickerViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderSectionPickerViewController_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderSectionPickerViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
