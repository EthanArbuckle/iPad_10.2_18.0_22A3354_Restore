@implementation ActivitySharingFriendDetailCompetitionScoreTableViewCell

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell *)sub_10020C454(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell_scoreView), "sizeThatFits:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10020C768();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell_scoreView));
}

@end
