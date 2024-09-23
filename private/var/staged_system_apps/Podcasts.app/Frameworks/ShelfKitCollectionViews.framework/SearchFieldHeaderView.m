@implementation SearchFieldHeaderView

- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_margins);
  *v7 = xmmword_2FE0F0;
  v7[1] = xmmword_2FE100;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SearchFieldHeaderView();
  return -[SearchFieldHeaderView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews21SearchFieldHeaderView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_margins);
  *v4 = xmmword_2FE0F0;
  v4[1] = xmmword_2FE100;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView) = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/SearchFieldHeaderView.swift", 51, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews21SearchFieldHeaderView *v2;

  v2 = self;
  sub_1D99F0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView));
}

@end
