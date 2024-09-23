@implementation ProductRatingCollectionViewCell

- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell *)sub_16448C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_165FC4();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell *v2;

  v2 = self;
  sub_164F78();

}

- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4
{
  void *v6;
  _TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;

  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack);
  v7 = self;
  v8 = objc_msgSend(v6, "arrangedSubviews");
  v9 = sub_E710(0, (unint64_t *)&qword_3D34B0, UIView_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a4, v10);
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFF8)) > (unint64_t)a4)
  {
    v11 = *(id *)(v10 + 8 * a4 + 32);
LABEL_5:
    v15 = v11;
    swift_bridgeObjectRelease(v10);
    v12 = type metadata accessor for RatingRowView();
    v13 = swift_dynamicCastClassUnconditional(v15, v12, 0, 0, 0);
    *(float *)&v14 = a3;
    objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView), "setProgress:", v14);

    return;
  }
  __break(1u);
}

- (void)clearAllRatings
{
  _TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell *v2;

  v2 = self;
  sub_1657EC();

}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingCountLabel));
}

- (UIStackView)accessibilityRatingBreakdownStack
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack));
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack));
}

@end
