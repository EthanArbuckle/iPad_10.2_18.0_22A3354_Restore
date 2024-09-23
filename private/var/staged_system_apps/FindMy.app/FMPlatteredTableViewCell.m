@implementation FMPlatteredTableViewCell

- (_TtC6FindMy24FMPlatteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy24FMPlatteredTableViewCell *)sub_10018BF98(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy24FMPlatteredTableViewCell)initWithCoder:(id)a3
{
  _TtC6FindMy24FMPlatteredTableViewCell *result;

  result = (_TtC6FindMy24FMPlatteredTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPlatteredTableViewCell.swift", 37, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC6FindMy24FMPlatteredTableViewCell *v2;

  v2 = self;
  sub_10018C118();

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPlatteredTableViewCell();
  return -[FMPlatteredTableViewCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPlatteredTableViewCell();
  v4 = v5.receiver;
  -[FMPlatteredTableViewCell setSelected:](&v5, "setSelected:", v3);
  objc_msgSend(v4, "setNeedsLayout", v5.receiver, v5.super_class);

}

@end
