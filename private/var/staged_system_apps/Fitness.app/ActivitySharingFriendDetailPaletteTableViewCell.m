@implementation ActivitySharingFriendDetailPaletteTableViewCell

- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell *)sub_10020AB80(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_activitySummaryProvider) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingFriendDetailPaletteTableViewCell.swift", 64, 2, 54, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_activitySummaryProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_paletteViewController));
}

@end
