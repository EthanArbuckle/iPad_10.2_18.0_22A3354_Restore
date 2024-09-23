@implementation FMAccessoryNameTextField

- (_TtC6FindMy24FMAccessoryNameTextField)init
{
  return (_TtC6FindMy24FMAccessoryNameTextField *)sub_100140DA8();
}

- (_TtC6FindMy24FMAccessoryNameTextField)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100142EB0();
}

- (void)clearTextView
{
  _TtC6FindMy24FMAccessoryNameTextField *v2;

  v2 = self;
  sub_100141A20();

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC6FindMy24FMAccessoryNameTextField *v5;

  v4 = a3;
  v5 = self;
  sub_100141C14(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC6FindMy24FMAccessoryNameTextField *v5;

  v4 = a3;
  v5 = self;
  sub_100142F90();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC6FindMy24FMAccessoryNameTextField *v12;
  uint64_t v13;

  length = a4.length;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  LOBYTE(length) = sub_100141FBC(v11, v13, length, v8, v10);

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (_TtC6FindMy24FMAccessoryNameTextField)initWithFrame:(CGRect)a3
{
  _TtC6FindMy24FMAccessoryNameTextField *result;

  result = (_TtC6FindMy24FMAccessoryNameTextField *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryNameTextField", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_displayTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_placeholderTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_deleteButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->displayTextView[OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_textSizeHeightConstraint));
}

@end
