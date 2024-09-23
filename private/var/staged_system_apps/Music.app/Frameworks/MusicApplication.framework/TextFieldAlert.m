@implementation TextFieldAlert

- (void)textFieldDidChange:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert *v5;

  v4 = a3;
  v5 = self;
  sub_148AA0(v4);

}

- (_TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert_submitAction) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert_currentName);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/FolderActions.swift", 36, 2, 227, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert *result;

  v4 = a4;
  result = (_TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.TextFieldAlert", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert_submitAction));
  swift_bridgeObjectRelease(*(_QWORD *)&self->submitAction[OBJC_IVAR____TtC16MusicApplicationP33_7E17862605AF25E7ABA06AA95737897914TextFieldAlert_currentName]);
}

@end
