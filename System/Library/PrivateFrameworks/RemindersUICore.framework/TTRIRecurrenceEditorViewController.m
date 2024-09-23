@implementation TTRIRecurrenceEditorViewController

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithCoder:(id)a3
{
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *result;

  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v2;

  v2 = self;
  sub_1B4468950();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v4;

  v4 = self;
  sub_1B4468A98(a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v3;

  if (!a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1B446A88C();

    swift_unknownObjectRelease();
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;
  int64_t v8;

  if (!a4)
  {
    v4 = (void *)self;
    v5 = a3;
    v6 = v4;
    swift_unknownObjectRetain();
    v7 = sub_1B446ADE4();
    swift_unknownObjectRelease();
    v8 = v7[2];

    swift_bridgeObjectRelease();
    return v8;
  }
  v8 = a4;
  if (a4 == 1)
    return v8;
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = sub_1B4468E4C(v10, v9);

  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;

  if (a4 == 1
    && (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC15RemindersUICore34TTRIRecurrenceEditorViewController_presenter))[8])
  {
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    v4 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v11;
  uint64_t v12;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  sub_1B4469D4C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *v14;
  uint64_t v15;

  v8 = sub_1B4903CB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1B4469E1C(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithStyle:(int64_t)a3
{
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *result;

  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore34TTRIRecurrenceEditorViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
