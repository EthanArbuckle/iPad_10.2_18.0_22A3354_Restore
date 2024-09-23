@implementation TTRISubtaskListCellTitleViewController

- (_TtC15RemindersUICore38TTRISubtaskListCellTitleViewController)init
{
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *result;

  result = (_TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_titleTextView));
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (id)MEMORY[0x1B5E3D8DC](*(char **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_presenter)+ 48, a2);
  if (v5)
  {
    v6 = v5;
    v7 = a3;
    v8 = self;
    v5 = objc_msgSend(v6, sel_tableView);
    if (v5)
    {
      v9 = v5;
      v10 = objc_msgSend(v5, sel_hasActiveDrag);

      if ((v10 & 1) != 0)
      {

        swift_unknownObjectRelease();
        LOBYTE(v5) = 0;
        return (char)v5;
      }
      v5 = objc_msgSend(v6, sel_tableView);
      if (v5)
      {
        v11 = v5;
        v12 = objc_msgSend(v5, sel_hasActiveDrop);

        swift_unknownObjectRelease();
        LOBYTE(v5) = v12 ^ 1;
        return (char)v5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return (char)v5;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B4888550();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1B4906A64();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B48888D0(location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B4887ED0(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  char v4;
  id v5;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v6;

  v4 = *((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC15RemindersUICore38TTRISubtaskListCellTitleViewController_userPressedReturn);
  v5 = a3;
  v6 = self;
  sub_1B4888F0C(v4);

}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v9;
  id v10;
  _TtC15RemindersUICore38TTRISubtaskListCellTitleViewController *v11;
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
