@implementation SeymourWorkoutRecommendationCollectionViewCell

- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell *)sub_10050D0F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  _TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell *v2;

  v2 = self;
  sub_10050E328();

}

- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10050E5F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_subtitleLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_configurationTask));
  swift_bridgeObjectRelease(*(_QWORD *)&self->insetContentView[OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->insetContentView[OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_recommendation]);
}

@end
