@implementation TTRIBoardColumnCollectionView

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9Reminders29TTRIBoardColumnCollectionView *v11;

  v7 = sub_10040D444();
  v8 = sub_10040D480();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10040D1F0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
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
  v10.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIBoardColumnCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIBoardColumnCollectionView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
