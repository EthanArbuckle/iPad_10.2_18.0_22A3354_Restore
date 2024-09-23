@implementation AddToYourRingTableViewCell

- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp26AddToYourRingTableViewCell *)sub_100265078(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithCoder:(id)a3
{
  id v5;
  _TtC10FitnessApp26AddToYourRingTableViewCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell_addToYourRingCollectionViewController, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell____lazy_storage___heightConstraint) = 0;
  v5 = a3;

  result = (_TtC10FitnessApp26AddToYourRingTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/AddToYourRingTableViewCell.swift", 43, 2, 54, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell_addToYourRingCollectionViewController);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell____lazy_storage___heightConstraint));
}

@end
