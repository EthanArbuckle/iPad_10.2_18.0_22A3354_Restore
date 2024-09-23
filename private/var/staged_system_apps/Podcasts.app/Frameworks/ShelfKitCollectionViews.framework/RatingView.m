@implementation RatingView

- (_TtC23ShelfKitCollectionViews10RatingView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews10RatingView *)sub_20318C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews10RatingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC23ShelfKitCollectionViews10RatingView *result;

  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_rating) = 1080033280;
  v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_color;
  sub_1B68C8();
  v6 = a3;
  *(UIColor *)((char *)&self->super.super.super.isa + v5) = UIColor.init(_colorLiteralRed:green:blue:alpha:)(0.99608, 0.5098, 0.027451, 1.0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_starSize) = 2;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_hideEmptyStars) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_reverseAlignment) = 0;

  result = (_TtC23ShelfKitCollectionViews10RatingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/RatingView.swift", 40, 2, 72, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[RatingView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC23ShelfKitCollectionViews10RatingView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_203560();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RatingView();
  v2 = (char *)v4.receiver;
  -[RatingView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_label];
  objc_msgSend(v2, "frame", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0);

}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_label));
}

- (void).cxx_destruct
{

}

@end
