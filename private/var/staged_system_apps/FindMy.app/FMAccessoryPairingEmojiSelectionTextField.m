@implementation FMAccessoryPairingEmojiSelectionTextField

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  return -[FMAccessoryPairingEmojiSelectionTextField isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  v4 = v5.receiver;
  -[FMAccessoryPairingEmojiSelectionTextField setSelected:](&v5, "setSelected:", v3);
  sub_1002D1838();

}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)init
{
  return (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)sub_1002D1BE4();
}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithCoder:(id)a3
{
  return (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)sub_1002D1CD4(a3);
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  v2 = v4.receiver;
  -[FMAccessoryPairingEmojiSelectionTextField layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v4.receiver, v4.super_class);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetWidth(v5) * 0.5);

}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_hiddenTextField), "becomeFirstResponder");
}

- (void)textFieldDidBeginEditing:(id)a3
{
  -[FMAccessoryPairingEmojiSelectionTextField setSelected:](self, "setSelected:", 1);
}

- (void)textFieldDidEndEditing:(id)a3
{
  -[FMAccessoryPairingEmojiSelectionTextField setSelected:](self, "setSelected:", 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *v11;
  NSString v12;
  int IsSingleEmoji;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  v12 = String._bridgeToObjectiveC()();
  IsSingleEmoji = CEMStringIsSingleEmoji();

  if (IsSingleEmoji)
  {
    swift_bridgeObjectRetain(v9);
    v15 = sub_1000C9270(v7, v9);
    v17 = v16;
    *(_QWORD *)&v14 = swift_bridgeObjectRelease(v9).n128_u64[0];
    v18 = v15;
    v19 = v17;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  sub_1002D193C(v18, v19, v14);

  swift_bridgeObjectRelease(v9);
  return 0;
}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithFrame:(CGRect)a3
{
  _TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *result;

  result = (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryPairingEmojiSelectionTextField", 48, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_hiddenTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_placeholderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_borderColor));
}

@end
