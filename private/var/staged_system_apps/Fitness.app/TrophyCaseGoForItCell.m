@implementation TrophyCaseGoForItCell

- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrophyCaseGoForItCell *)sub_10026B550(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10026E7D8();
}

- (void)didTapTopAchievement:(id)a3
{
  sub_1002241E4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnAchievement);
}

- (void)didTapShowAllButton:(id)a3
{
  sub_1002241E4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnShowAllAchievements);
}

- (void).cxx_destruct
{
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnAchievement), *(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnAchievement]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnShowAllAchievements), *(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnShowAllAchievements]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_templateUniqueName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_stackTemplateUniqueNames));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_roundedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_achievementLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_badgeStackImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_showAllButton));
}

@end
