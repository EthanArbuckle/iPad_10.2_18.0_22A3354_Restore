@implementation TrophyCaseSectionHeaderView

- (_TtC10FitnessApp27TrophyCaseSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp27TrophyCaseSectionHeaderView *)sub_1005B1BB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp27TrophyCaseSectionHeaderView)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp27TrophyCaseSectionHeaderView *)sub_1005B1D9C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrophyCaseSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrophyCaseSectionHeaderView_descriptionLabel));
}

@end
