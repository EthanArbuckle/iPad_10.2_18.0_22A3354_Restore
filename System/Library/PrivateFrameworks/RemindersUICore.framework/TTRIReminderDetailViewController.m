@implementation TTRIReminderDetailViewController

- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore32TTRIReminderDetailViewController *)sub_1B46275A4(a3);
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v2;

  v2 = self;
  sub_1B4627A78();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v4;

  v4 = self;
  sub_1B46282B0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v3;

  v3 = self;
  sub_1B4634D04();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v4;

  v4 = self;
  sub_1B46293D4(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v2;

  v2 = self;
  sub_1B4629548();

}

- (UITableView)tableView
{
  return (UITableView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_tableView, a2);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)didTapCancel:(id)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  sub_1B463E364(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)didTapCommit:(id)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  v5 = -[TTRIReminderDetailViewController viewIfLoaded](v4, sel_viewIfLoaded);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      objc_msgSend(v7, sel_resignFirstResponder);

    }
  }
  sub_1B463E698(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v8);
}

- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore32TTRIReminderDetailViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_viewModel, &qword_1EF0AA368);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_tableDataController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_localUndoManager));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_commitButton));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
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
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B46366E8(v7);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B463DE48();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  sub_1B463481C(self, (uint64_t)a2, a3, 1);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v4;
  id v5;
  void *v6;
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v7;
  _TtC15RemindersUICore32TTRIReminderDetailViewController *v8;

  v4 = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)a3;
  v8 = self;
  v5 = -[TTRIReminderDetailViewController viewIfLoaded](v8, sel_viewIfLoaded);
  if (v5)
  {
    v6 = v5;
    v7 = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      -[TTRIReminderDetailViewController resignFirstResponder](v7, sel_resignFirstResponder);

      v4 = v8;
      v8 = v7;
    }
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  sub_1B463481C(self, (uint64_t)a2, a3, 0);
}

@end
