@implementation StackView

- (_TtC23ShelfKitCollectionViews9StackView)initWithFrame:(CGRect)a3
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
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_distribution;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_spacing) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StackView();
  return -[StackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews9StackView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews9StackView *result;

  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_distribution;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9StackView_spacing) = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews9StackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/StackView.swift", 39, 2, 19, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StackView();
  v2 = v3.receiver;
  -[StackView layoutSubviews](&v3, "layoutSubviews");
  sub_2275CC();
  sub_227734();
  sub_227998();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC23ShelfKitCollectionViews9StackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_227D8C(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
