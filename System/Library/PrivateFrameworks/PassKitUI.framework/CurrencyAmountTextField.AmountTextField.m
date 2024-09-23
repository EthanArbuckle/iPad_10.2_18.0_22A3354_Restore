@implementation CurrencyAmountTextField.AmountTextField

- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithCoder:(id)a3
{
  id v4;
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField_firstEdit) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField____lazy_storage___currencyFormatter) = 0;
  v4 = a3;

  result = (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)editingChanged
{
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v2;

  v2 = self;
  sub_19D45E35C();

}

- (void)resetSelection
{
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v2;
  id v3;
  id v4;
  id v5;

  v2 = self;
  v3 = -[CurrencyAmountTextField.AmountTextField endOfDocument](v2, sel_endOfDocument);
  v4 = -[CurrencyAmountTextField.AmountTextField endOfDocument](v2, sel_endOfDocument);
  v5 = -[CurrencyAmountTextField.AmountTextField textRangeFromPosition:toPosition:](v2, sel_textRangeFromPosition_toPosition_, v3, v4);

  -[CurrencyAmountTextField.AmountTextField setSelectedTextRange:](v2, sel_setSelectedTextRange_, v5);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_19DE87BF4();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_19D45E6D4(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v5;

  v4 = a3;
  v5 = self;
  sub_19D45EF20();

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_19D45FBD4();

  return self & 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *v4;
  _OWORD v6[2];

  if (a4)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19DE8868C();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_19D1A9DC0((uint64_t)v6, (uint64_t *)&unk_1EE498020);
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  sub_19D1A9ED4(0, (unint64_t *)&unk_1EE4A45F0);
  return (id)sub_19DE87DF8();
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithFrame:(CGRect)a3
{
  _TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *result;

  result = (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField____lazy_storage___currencyFormatter));
}

@end
