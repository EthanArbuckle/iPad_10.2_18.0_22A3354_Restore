@implementation ActivitySharingFriendListCompetitionView

- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView *)sub_100228580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  _TtC10FitnessApp40ActivitySharingFriendListCompetitionView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_100228E64();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100228FFC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionScoreViewConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionScoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionStageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_friend));
}

@end
