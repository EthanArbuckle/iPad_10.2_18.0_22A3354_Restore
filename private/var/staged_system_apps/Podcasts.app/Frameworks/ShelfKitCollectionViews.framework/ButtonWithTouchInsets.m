@implementation ButtonWithTouchInsets

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
  return -[DynamicTypeButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ButtonWithTouchInsets.swift", 51, 2, 30, 0);
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  double *v8;
  double v10;
  double v11;
  id v12;
  _TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets);
  if ((self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets + 24] & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
    return -[ButtonWithTouchInsets pointInside:withEvent:](&v19, "pointInside:withEvent:", a4, x, y);
  }
  else
  {
    v11 = *v8;
    v10 = v8[1];
    v12 = a4;
    v13 = self;
    -[ButtonWithTouchInsets bounds](v13, "bounds");
    v21.origin.x = UIEdgeInsetsInsetRect(v14, v15, v16, v17, v11, v10);
    v20.x = x;
    v20.y = y;
    v18 = CGRectContainsPoint(v21, v20);

    return v18;
  }
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
  v2 = (char *)v6.receiver;
  -[ButtonWithTouchInsets layoutSubviews](&v6, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bringSubviewToFront:", v4, v6.receiver, v6.super_class);
    v5 = (char *)objc_msgSend(v4, "layer");
    objc_msgSend(v5, "removeAllAnimations");

    v2 = v5;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView));
}

@end
