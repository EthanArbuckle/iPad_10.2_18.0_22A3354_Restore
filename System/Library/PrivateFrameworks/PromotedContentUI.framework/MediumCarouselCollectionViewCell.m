@implementation MediumCarouselCollectionViewCell

- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17PromotedContentUI32MediumCarouselCollectionViewCell *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MediumCarouselCollectionViewCell();
  v7 = -[CarouselCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B12E5B50();
  sub_1B1302F84();

  return v7;
}

- (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell)initWithCoder:(id)a3
{
  _TtC17PromotedContentUI32MediumCarouselCollectionViewCell *result;

  result = (_TtC17PromotedContentUI32MediumCarouselCollectionViewCell *)sub_1B1373174();
  __break(1u);
  return result;
}

@end
