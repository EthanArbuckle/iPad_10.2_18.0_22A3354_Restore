@implementation WorkoutAppRecommendationCollectionViewCell

- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell *)sub_100341914(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  sub_100341BEC(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell_titleLabel));
}

@end
