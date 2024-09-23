@implementation TrophyCaseSectionCell

- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrophyCaseSectionCell *)sub_10022229C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100225A04();
}

- (void)didTapBadgeImageView:(id)a3
{
  sub_1002241E4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnAchievement);
}

- (void)didTapShowAllButton:(id)a3
{
  sub_1002241E4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnShowAllAchievements);
}

- (void)prepareForReuse
{
  _TtC10FitnessApp21TrophyCaseSectionCell *v2;

  v2 = self;
  sub_10022565C();

}

- (void).cxx_destruct
{
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnAchievement), *(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnAchievement]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnShowAllAchievements), *(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnShowAllAchievements]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tapOnAchievement[OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_templateUniqueName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_stackTemplateUniqueNames));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_roundedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeStackImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_showAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_sectionDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeStackHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelTopMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeViewToSectionDescriptionMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelToStackViewConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelToCountLabelConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillViewToStackViewConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillViewToCountLabelConstraint));
}

@end
