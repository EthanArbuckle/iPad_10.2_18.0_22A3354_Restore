@implementation DividerView

- (_TtC23ShelfKitCollectionViews11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews11DividerView *)sub_1EBB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews11DividerView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  _TtC23ShelfKitCollectionViews11DividerView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11DividerView_separatorInset);
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11DividerView_style) = 2;
  v6 = a3;

  result = (_TtC23ShelfKitCollectionViews11DividerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/DividerView.swift", 41, 2, 104, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  char v4;
  _TtC23ShelfKitCollectionViews11DividerView *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11DividerView_style);
  v5 = self;
  v6 = sub_1FAB8(v4, v5);

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews11DividerView *v2;

  v2 = self;
  sub_1EE1C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11DividerView_separatorView));
}

@end
