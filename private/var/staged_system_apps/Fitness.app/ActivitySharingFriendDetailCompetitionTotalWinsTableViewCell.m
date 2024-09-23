@implementation ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell

- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell *)sub_10035BA08(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView), "sizeThatFits:", a3.width, a3.height);
  v7 = v6 + 0.0;
  result.height = v7;
  result.width = v5;
  return result;
}

- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell *result;

  v5 = OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView;
  v6 = objc_allocWithZone((Class)ASCompetitionScoreView);
  v7 = a3;
  v8 = objc_msgSend(v6, "init");
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell.swift", 77, 2, 68, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView));
}

@end
