@implementation TTRIQuickEntryViewController

- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore28TTRIQuickEntryViewController *)sub_1B44B8BFC(a3);
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v2;

  v2 = self;
  sub_1B44B8F04();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v4;

  v4 = self;
  sub_1B44BA640(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v3;

  v3 = self;
  sub_1B44BE9E4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v4;

  v4 = self;
  sub_1B44BAA2C(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v2;

  v2 = self;
  sub_1B44BAB34();

}

- (UITableView)tableView
{
  return (UITableView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_tableView, a2);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_cancelButton, a2);
}

- (void)setCancelButton:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIBarButtonItem)commitButton
{
  return (UIBarButtonItem *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_commitButton, a2);
}

- (void)setCommitButton:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)didTapCancel:(id)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  sub_1B44B0604(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)didTapCommit:(id)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  v5 = -[TTRIQuickEntryViewController viewIfLoaded](v4, sel_viewIfLoaded);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      objc_msgSend(v7, sel_resignFirstResponder);

    }
  }
  sub_1B44B0B3C(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v8);
}

- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore28TTRIQuickEntryViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_tableDataController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_localUndoManager));
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

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v10;
  char v11;
  char v12;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_presenter);
  v6 = *(_QWORD *)(v5 + OBJC_IVAR____TtC15RemindersUICore23TTRIQuickEntryPresenter_interactor + 8);
  ObjectType = swift_getObjectType();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
  v9 = a3;
  v10 = self;
  if ((v8(ObjectType, v6) & 1) != 0 || (sub_1B44B0294(v5) & 1) != 0)
  {

    v11 = 0;
  }
  else
  {
    v12 = sub_1B44B044C(v5);

    v11 = v12 ^ 1;
  }
  return v11 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  sub_1B44BDF9C(self, (uint64_t)a2, a3, 1);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v4;
  id v5;
  void *v6;
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v7;
  _TtC15RemindersUICore28TTRIQuickEntryViewController *v8;

  v4 = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)a3;
  v8 = self;
  v5 = -[TTRIQuickEntryViewController viewIfLoaded](v8, sel_viewIfLoaded);
  if (v5)
  {
    v6 = v5;
    v7 = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      -[TTRIQuickEntryViewController resignFirstResponder](v7, sel_resignFirstResponder);

      v4 = v8;
      v8 = v7;
    }
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  sub_1B44BDF9C(self, (uint64_t)a2, a3, 0);
}

@end
