@implementation SizeClassAutoMarginView

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23SizeClassAutoMarginView *v2;

  v2 = self;
  sub_BA20C();

}

- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23SizeClassAutoMarginView_totalWidth) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SizeClassAutoMarginView();
  return -[SizeClassAutoMarginView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23SizeClassAutoMarginView_totalWidth) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SizeClassAutoMarginView();
  return -[SizeClassAutoMarginView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
