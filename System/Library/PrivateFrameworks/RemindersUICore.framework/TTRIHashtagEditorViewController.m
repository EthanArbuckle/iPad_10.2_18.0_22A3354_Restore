@implementation TTRIHashtagEditorViewController

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B4499168();
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v2;

  v2 = self;
  sub_1B44949B0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5[2];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[TTRIHashtagEditorViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  if ((v4[OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_style + 8] & 1) == 0
    && (v4[OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_style] & 1) != 0)
  {
    memset(v5, 0, sizeof(v5));
    sub_1B4494F98();
    sub_1B41EA560((uint64_t)v5, &qword_1ED4ED170);
  }

}

- (void)didTapCommit:(id)a3
{
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v4;
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B4494F98();

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (void)didTapCancel:(id)a3
{
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v4;
  void *v5;
  id v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  v5 = *(Class *)((char *)&v4->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_cancelButton);
  v6 = v5;
  sub_1B449B890((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithStyle:(int64_t)a3
{
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *result;

  result = (_TtC15RemindersUICore31TTRIHashtagEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore31TTRIHashtagEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_contentSizeObserver));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B449B6EC();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v5;
  id v6;
  _TtC15RemindersUICore31TTRIHashtagEditorViewController *v7;
  id v8;

  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_cancelButton);
  v8 = v5;
  v6 = a3;
  v7 = self;
  sub_1B449B890((uint64_t)v5);

}

@end
