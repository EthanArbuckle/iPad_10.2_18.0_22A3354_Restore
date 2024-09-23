@implementation TTRISubtaskListViewController

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC15RemindersUICore29TTRISubtaskListViewController *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = a3;

  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_class *ObjectType;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v6;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  v7 = v6;
  if (!a3)
  {
    v8 = -[TTRISubtaskListViewController viewIfLoaded](v6, sel_viewIfLoaded);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)UIView.firstResponderDescendant.getter();

      if (v10)
      {
        objc_msgSend(v10, sel_resignFirstResponder);

      }
    }
  }
  v12.receiver = v7;
  v12.super_class = ObjectType;
  v11 = a3;
  -[TTRISubtaskListViewController willMoveToParentViewController:](&v12, sel_willMoveToParentViewController_, v11);

}

- (void)viewDidLoad
{
  _TtC15RemindersUICore29TTRISubtaskListViewController *v2;

  v2 = self;
  sub_1B42D948C();

}

- (void)viewWillLayoutSubviews
{
  _TtC15RemindersUICore29TTRISubtaskListViewController *v2;

  v2 = self;
  sub_1B42D982C();

}

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithStyle:(int64_t)a3
{
  _TtC15RemindersUICore29TTRISubtaskListViewController *result;

  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore29TTRISubtaskListViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1B42B6048(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1B42DB93C();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v11;
  _BYTE *v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = sub_1B42D9E78((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v11;
  uint64_t v12;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  sub_1B42DA420(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v12;
  uint64_t v13;

  v7 = sub_1B4903CB0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v11 = a3;
  v12 = self;
  sub_1B42DB994();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore29TTRISubtaskListViewController *v11;
  int64_t v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = sub_1B42DBB04();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
