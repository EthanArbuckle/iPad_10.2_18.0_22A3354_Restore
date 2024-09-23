@implementation AppStoreAppRecommendationCollectionViewCell

- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell *)sub_10031D56C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppStoreAppRecommendationCollectionViewCell();
  v2 = (char *)v5.receiver;
  -[AppStoreAppRecommendationCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = sub_10031D35C();
  objc_msgSend(v3, "setConstant:", 46.0, v5.receiver, v5.super_class);

  v4 = sub_10031D370();
  objc_msgSend(v4, "setConstant:", 46.0);

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_iconImageView], "setImage:", 0);
}

- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10031E568();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell____lazy_storage___imageViewHeightConstraint));
}

@end
