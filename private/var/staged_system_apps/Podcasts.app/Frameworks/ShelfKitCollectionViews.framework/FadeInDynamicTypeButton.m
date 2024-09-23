@implementation FadeInDynamicTypeButton

- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_maximumFadeWidth) = (Class)0x4059000000000000;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_fadeInPosition) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/FadeInDynamicTypeButton.swift", 53, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *v5;

  v4 = a3;
  v5 = self;
  sub_4A368();

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
  return -[FadeInDynamicTypeButton backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
  v4 = a3;
  v5 = v6.receiver;
  -[FadeInDynamicTypeButton setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  sub_4A368();

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *v2;

  v2 = self;
  sub_4A654();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  double *v8;
  double v10;
  double v11;
  id v12;
  _TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *v13;
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
  v8 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets);
  if ((self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets + 24] & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
    return -[FadeInDynamicTypeButton pointInside:withEvent:](&v19, "pointInside:withEvent:", a4, x, y);
  }
  else
  {
    v11 = *v8;
    v10 = v8[1];
    v12 = a4;
    v13 = self;
    -[FadeInDynamicTypeButton bounds](v13, "bounds");
    v21.origin.x = UIEdgeInsetsInsetRect(v14, v15, v16, v17, v11, v10);
    v20.x = x;
    v20.y = y;
    v18 = CGRectContainsPoint(v21, v20);

    return v18;
  }
}

- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *result;

  result = (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.FadeInDynamicTypeButton", 47, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_fadeLayer));
}

@end
