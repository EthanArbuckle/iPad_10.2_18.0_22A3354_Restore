@implementation AchievementCellContentView

- (_TtC10FitnessApp26AchievementCellContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp26AchievementCellContentView *)sub_10017E5BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp26AchievementCellContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10017FDF8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->templateUniqueName[OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_templateUniqueName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_achievementBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_chevronImageView));
}

@end
