@implementation FMLabelTableViewCell

- (_TtC6FindMy20FMLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy20FMLabelTableViewCell *)sub_1002FB6A4(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy20FMLabelTableViewCell)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  id v7;
  _TtC6FindMy20FMLabelTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textField) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_characterLimit;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_delegate;
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textFieldIsEnabled) = 0;
  v7 = a3;

  result = (_TtC6FindMy20FMLabelTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLabelTableViewCell.swift", 33, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)textFieldDidChangeWithSender:(id)a3
{
  id v4;
  _TtC6FindMy20FMLabelTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002FBE30(v4);

}

- (void)returnKeyPressedWithSender:(id)a3
{
  id v4;
  _TtC6FindMy20FMLabelTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002FC224();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC6FindMy20FMLabelTableViewCell *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1002FBF84(v12, location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textField));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_delegate);
}

@end
