@implementation TTRIReminderCellNotesViewController

- (_TtC15RemindersUICore35TTRIReminderCellNotesViewController)init
{
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *result;

  result = (_TtC15RemindersUICore35TTRIReminderCellNotesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView));
  swift_release();
  swift_release();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v9;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v10;

  v3 = (_QWORD *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_presenter)
                + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellNotesPresenter_quickBar);
  if (*v3)
  {
    v6 = v3[1];
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v6 + 16);
    v9 = a3;
    v10 = self;
    v8(v9, &protocol witness table for UITextView, ObjectType, v6);

  }
  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = self;
  sub_1B44924E4();
  v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v7, sel_textStorage);
    NSMutableAttributedString.clearLinks()();

  }
  else
  {
    __break(1u);
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  void *v3;
  id v5;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_notesTextView);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    TTRIReminderTitleTextView.adjustStateAfterSelectionChange()();

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1B4906A64();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B448C838(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B448CE7C(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v8;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v9;
  id v10;
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v11;

  v4 = (_QWORD *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore35TTRIReminderCellNotesViewController_presenter)
                + OBJC_IVAR____TtC15RemindersUICore30TTRIReminderCellNotesPresenter_quickBar);
  if (*v4)
  {
    v5 = v4[1];
    ObjectType = swift_getObjectType();
    v7 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 24);
    v8 = a3;
    v9 = self;
    v7(v8, &protocol witness table for UITextView, ObjectType, v5);
  }
  else
  {
    v10 = a3;
    v11 = self;
  }
  sub_1B4492760();

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
  _TtC15RemindersUICore35TTRIReminderCellNotesViewController *v11;
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
