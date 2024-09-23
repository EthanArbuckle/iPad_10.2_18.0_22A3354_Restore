@implementation CHMindfulnessSessionListTableViewCell

- (CHMindfulnessSessionListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHMindfulnessSessionListTableViewCell *)sub_100446308(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  CHMindfulnessSessionListTableViewCell *v2;

  v2 = self;
  sub_10044882C();

}

- (CHMindfulnessSessionListTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100448E3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_imageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_labelStackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageViewCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageViewLeadingConstraint));
}

@end
