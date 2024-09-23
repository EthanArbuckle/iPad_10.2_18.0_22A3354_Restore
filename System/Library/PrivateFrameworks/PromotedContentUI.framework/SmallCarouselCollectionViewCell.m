@implementation SmallCarouselCollectionViewCell

- (_TtC17PromotedContentUI31SmallCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17PromotedContentUI31SmallCarouselCollectionViewCell *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SmallCarouselCollectionViewCell();
  v7 = -[CarouselCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B12E5B50();
  sub_1B136D618();

  return v7;
}

- (_TtC17PromotedContentUI31SmallCarouselCollectionViewCell)initWithCoder:(id)a3
{
  _TtC17PromotedContentUI31SmallCarouselCollectionViewCell *result;

  result = (_TtC17PromotedContentUI31SmallCarouselCollectionViewCell *)sub_1B1373174();
  __break(1u);
  return result;
}

@end
