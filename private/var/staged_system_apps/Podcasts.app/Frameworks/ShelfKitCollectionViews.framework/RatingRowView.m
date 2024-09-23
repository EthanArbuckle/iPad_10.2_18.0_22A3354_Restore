@implementation RatingRowView

- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews13RatingRowView *result;

  result = (_TtC23ShelfKitCollectionViews13RatingRowView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ProductRatingCollectionViewCell.swift", 61, 2, 107, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView), "intrinsicContentSize");
  v3 = UIViewNoIntrinsicMetric;
  result.height = v2;
  result.width = v3;
  return result;
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView);
}

- (UIProgressView)accessibilityBarView
{
  return (UIProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView));
}

- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews13RatingRowView *result;

  result = (_TtC23ShelfKitCollectionViews13RatingRowView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.RatingRowView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView));
}

@end
