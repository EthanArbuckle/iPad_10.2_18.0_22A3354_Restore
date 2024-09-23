@implementation BlurIconButton

- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B88DC(0x8000000000307D10, 96);
}

- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithFrame:(CGRect)a3
{
  sub_B88DC(0x800000000030B270, 101);
}

- (void)layoutMarginsDidChange
{
  -[BlurIconButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews14BlurIconButton *v2;

  v2 = self;
  sub_B1DDC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC23ShelfKitCollectionViews14BlurIconButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_B2054();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC23ShelfKitCollectionViews14BlurIconButton *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_B217C(v4, x, y);

  return v4 & 1;
}

- (BOOL)accessibilityActivate
{
  void (*v2)(_TtC23ShelfKitCollectionViews14BlurIconButton *);
  uint64_t v3;
  _TtC23ShelfKitCollectionViews14BlurIconButton *v4;

  v2 = *(void (**)(_TtC23ShelfKitCollectionViews14BlurIconButton *))((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->handler[OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler];
    v4 = self;
    sub_2C690((uint64_t)v2, v3);
    v2(v4);
    sub_1D618((uint64_t)v2, v3);

  }
  return 1;
}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler), *(_QWORD *)&self->handler[OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_imageView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_objectGraph));
}

@end
