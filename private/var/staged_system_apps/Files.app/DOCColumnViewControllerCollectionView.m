@implementation DOCColumnViewControllerCollectionView

- (_TtC5Files37DOCColumnViewControllerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
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
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCColumnViewControllerCollectionView();
  return -[DOCCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC5Files37DOCColumnViewControllerCollectionView)initWithCoder:(id)a3
{
  uint64_t v3;

  return (_TtC5Files37DOCColumnViewControllerCollectionView *)sub_10037D38C(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnViewControllerCollectionView);
}

@end
