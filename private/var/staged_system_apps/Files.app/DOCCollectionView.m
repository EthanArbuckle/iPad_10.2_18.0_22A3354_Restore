@implementation DOCCollectionView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCollectionView();
  -[DOCCollectionView contentSize](&v4, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  _TtC5Files17DOCCollectionView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  DOCCollectionView.contentSize.setter(width, height);

}

- (_TtC5Files17DOCCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files17DOCCollectionView____lazy_storage___offsetAdjustmentBehaviors) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCCollectionView();
  return -[DOCCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC5Files17DOCCollectionView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files17DOCCollectionView____lazy_storage___offsetAdjustmentBehaviors) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCCollectionView();
  return -[DOCCollectionView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files17DOCCollectionView____lazy_storage___offsetAdjustmentBehaviors));
}

@end
