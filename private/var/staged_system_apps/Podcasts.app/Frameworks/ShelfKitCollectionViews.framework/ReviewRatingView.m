@implementation ReviewRatingView

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)sub_1B584C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews16ReviewRatingView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_hasRTLTransformSet) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_rating) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_starSize) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_showsEmptyStars) = 1;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews16ReviewRatingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ReviewRatingView.swift", 46, 2, 137, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ShelfKitCollectionViews16ReviewRatingView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1B5C24(x, y, width, height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC23ShelfKitCollectionViews16ReviewRatingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1B670C();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ReviewRatingView sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)accessibilityRating
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_rating);
}

@end
