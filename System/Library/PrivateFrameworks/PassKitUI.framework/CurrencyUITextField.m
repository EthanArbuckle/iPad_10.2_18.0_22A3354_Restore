@implementation CurrencyUITextField

- (_TtC9PassKitUI19CurrencyUITextField)initWithCoder:(id)a3
{
  _TtC9PassKitUI19CurrencyUITextField *result;

  result = (_TtC9PassKitUI19CurrencyUITextField *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)deleteBackward
{
  _TtC9PassKitUI19CurrencyUITextField *v2;

  v2 = self;
  sub_19D62462C();

}

- (void)editingChanged
{
  _TtC9PassKitUI19CurrencyUITextField *v2;

  v2 = self;
  sub_19D624780();

}

- (void)resetSelection
{
  _TtC9PassKitUI19CurrencyUITextField *v2;
  id v3;
  id v4;
  id v5;

  v2 = self;
  v3 = -[CurrencyUITextField endOfDocument](v2, sel_endOfDocument);
  v4 = -[CurrencyUITextField endOfDocument](v2, sel_endOfDocument);
  v5 = -[CurrencyUITextField textRangeFromPosition:toPosition:](v2, sel_textRangeFromPosition_toPosition_, v3, v4);

  -[CurrencyUITextField setSelectedTextRange:](v2, sel_setSelectedTextRange_, v5);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9PassKitUI19CurrencyUITextField *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_19DE87BF4();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_19D624B1C(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC9PassKitUI19CurrencyUITextField_pk_isEditable);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (_TtC9PassKitUI19CurrencyUITextField)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI19CurrencyUITextField *result;

  result = (_TtC9PassKitUI19CurrencyUITextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI19CurrencyUITextField_formatter));
}

@end
