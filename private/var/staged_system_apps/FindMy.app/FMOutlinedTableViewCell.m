@implementation FMOutlinedTableViewCell

- (_TtC6FindMy23FMOutlinedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy23FMOutlinedTableViewCell *)sub_100347A80(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy23FMOutlinedTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy23FMOutlinedTableViewCell *result;

  v5 = OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_outlineLayer;
  v6 = objc_allocWithZone((Class)CAShapeLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_disableOutline) = 0;

  result = (_TtC6FindMy23FMOutlinedTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMOutlinedTableViewCell.swift", 36, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC6FindMy23FMOutlinedTableViewCell *v2;

  v2 = self;
  sub_100347CE8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_outlineLayer));
}

@end
