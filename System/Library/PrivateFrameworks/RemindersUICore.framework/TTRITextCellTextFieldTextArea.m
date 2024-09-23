@implementation TTRITextCellTextFieldTextArea

- (void)textFieldEditingChanged
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v6;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC15RemindersUICore29TTRITextCellTextFieldTextArea)init
{
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *result;

  result = (_TtC15RemindersUICore29TTRITextCellTextFieldTextArea *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_textField));
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v9;

  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v9;

  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  id v10;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v11;
  char v12;

  sub_1B4906A64();
  v7 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v7))
  {
    v8 = *((_QWORD *)v7 + 1);
    swift_getObjectType();
    v9 = *(uint64_t (**)(void))(v8 + 16);
    v10 = a3;
    v11 = self;
    v12 = v9();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = 1;
  }
  return v12 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  id v8;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v9;
  id v10;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v11;

  v4 = self;
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRITextCellTextFieldTextArea_delegate;
  swift_beginAccess();
  if (!MEMORY[0x1B5E3D8DC](v5))
  {
    v10 = a3;
    v11 = v4;
    goto LABEL_5;
  }
  v6 = *((_QWORD *)v5 + 1);
  swift_getObjectType();
  v7 = *(uint64_t (**)(void))(v6 + 32);
  v8 = a3;
  v9 = v4;
  LOBYTE(v6) = v7();
  swift_unknownObjectRelease();
  if ((v6 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(a3, sel_resignFirstResponder);
    goto LABEL_6;
  }
  a3 = v8;
  v4 = v9;
LABEL_6:

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  UITextField *v4;
  _TtC15RemindersUICore29TTRITextCellTextFieldTextArea *v5;

  v4 = (UITextField *)a3;
  v5 = self;
  TTRITextCellTextFieldTextArea.textFieldDidEndEditing(_:)(v4);

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end
