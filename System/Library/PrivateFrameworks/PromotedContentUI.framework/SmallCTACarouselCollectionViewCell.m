@implementation SmallCTACarouselCollectionViewCell

- (_TtC17PromotedContentUI34SmallCTACarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17PromotedContentUI34SmallCTACarouselCollectionViewCell *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SmallCTACarouselCollectionViewCell();
  v7 = -[CTACarouselCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B12E8068();
  sub_1B1344A54();

  return v7;
}

- (_TtC17PromotedContentUI34SmallCTACarouselCollectionViewCell)initWithCoder:(id)a3
{
  _TtC17PromotedContentUI34SmallCTACarouselCollectionViewCell *result;

  result = (_TtC17PromotedContentUI34SmallCTACarouselCollectionViewCell *)sub_1B1373174();
  __break(1u);
  return result;
}

@end
