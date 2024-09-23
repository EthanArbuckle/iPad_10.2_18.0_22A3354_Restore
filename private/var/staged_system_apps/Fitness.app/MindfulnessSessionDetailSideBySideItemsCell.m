@implementation MindfulnessSessionDetailSideBySideItemsCell

- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell *)sub_100375D34(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  _TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell *v2;

  v2 = self;
  sub_100376B2C();

}

- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100376D7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_leadingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_trailingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_bottomDetailItemView));
}

@end
