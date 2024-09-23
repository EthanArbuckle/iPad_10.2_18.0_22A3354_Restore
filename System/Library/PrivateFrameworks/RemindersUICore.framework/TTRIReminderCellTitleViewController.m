@implementation TTRIReminderCellTitleViewController

- (_TtC15RemindersUICore35TTRIReminderCellTitleViewController)init
{
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *result;

  result = (_TtC15RemindersUICore35TTRIReminderCellTitleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_titleTextView));
  swift_release();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  uint64_t v4;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v5;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v6;
  BOOL result;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v12;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_presenter);
  v5 = (_TtC15RemindersUICore35TTRIReminderCellTitleViewController *)a3;
  v6 = self;
  result = sub_1B448FDE8();
  v8 = result;
  if (!result)
    goto LABEL_5;
  v9 = *(Class *)((char *)&v6->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellTitleViewController_titleTextView);
  if (v9)
  {
    if (*(_QWORD *)(v4 + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellTitlePresenter_quickBar))
    {
      v10 = *(_QWORD *)(v4 + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellTitlePresenter_quickBar + 8);
      swift_getObjectType();
      v11 = *(void (**)(void))(v10 + 16);
      v12 = v9;
      v11();

      v5 = v6;
      v6 = v12;
    }
LABEL_5:

    return v8;
  }
  __break(1u);
  return result;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B448B5D8();

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B448B7FC();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1B4906A64();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B448A808(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B448AD08(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B448B8F8();

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = sub_1B49036D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B490368C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v9;
  id v10;
  _TtC15RemindersUICore35TTRIReminderCellTitleViewController *v11;
  __C::_NSRange v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  sub_1B41DF50C(0, (unint64_t *)&unk_1EF0A3630);
  v9 = sub_1B4906DAC();
  type metadata accessor for TTRIReminderTitleTextView();
  if (swift_dynamicCastClass())
  {
    v10 = a3;
    v11 = self;
    v12.location = location;
    v12.length = length;
    v13 = (void *)TTRIReminderTitleTextView.editMenuForTextIn(_:suggestedActions:)(v12, (Swift::OpaquePointer)v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
  }
  return v13;
}

@end
