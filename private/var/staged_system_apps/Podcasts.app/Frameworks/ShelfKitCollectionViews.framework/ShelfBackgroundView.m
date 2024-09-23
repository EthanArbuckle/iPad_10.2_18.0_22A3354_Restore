@implementation ShelfBackgroundView

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews19ShelfBackgroundView *v5;

  v4 = a3;
  v5 = self;
  sub_CD1AC(v4);

}

- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_background;
  *(_DWORD *)v7 = 0;
  *((_WORD *)v7 + 2) = 256;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ShelfBackgroundView();
  return -[ShelfBackgroundView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_background;
  *(_DWORD *)v4 = 0;
  *((_WORD *)v4 + 2) = 256;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ShelfBackgroundView();
  return -[ShelfBackgroundView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill));
}

@end
