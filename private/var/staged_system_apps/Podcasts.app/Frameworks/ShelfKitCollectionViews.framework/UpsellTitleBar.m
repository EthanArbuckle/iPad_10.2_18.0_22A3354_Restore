@implementation UpsellTitleBar

- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews14UpsellTitleBar *)sub_123268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_12384C();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 38.0;
  if (!*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_style))
    v2 = 54.0;
  v3 = UIViewNoIntrinsicMetric;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_dismissHandler), *(_QWORD *)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_dismissHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_containerStackView));
}

@end
