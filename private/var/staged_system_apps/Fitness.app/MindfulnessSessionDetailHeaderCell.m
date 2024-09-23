@implementation MindfulnessSessionDetailHeaderCell

- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell *)sub_10058CF2C(a3, (uint64_t)a4, v6);
}

- (void)navigateToCatalogItem
{
  _TtC10FitnessApp34MindfulnessSessionDetailHeaderCell *v2;

  v2 = self;
  sub_10058E2FC();

}

- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100590C8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell____lazy_storage___imageViewHeightConstraint));
}

@end
