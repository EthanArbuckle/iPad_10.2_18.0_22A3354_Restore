@implementation ModernProductReviewCollectionViewCell

- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell *)sub_25F26C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2620AC();
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_260A2C();

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModernProductReviewCollectionViewCell(0);
  v2 = (char *)v5.receiver;
  -[ModernProductReviewCollectionViewCell tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ModernProductReviewCollectionViewCell(0);
  v4 = a3;
  v5 = v8.receiver;
  v6 = -[ModernProductReviewCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, "preferredLayoutAttributesFittingAttributes:", v4);
  if (*((_BYTE *)v5 + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_isReviewExpanded) == 1)
  {
    objc_msgSend(v5, "setNeedsLayout", v8.receiver, v8.super_class);
    objc_msgSend(v5, "layoutIfNeeded");
  }

  return v6;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_260CA0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_rating));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_date));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_username));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_body));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_contentBackgroundColor));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_review));
  sub_1BE500((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_currentPresentation);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_cellReloadingHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_cellReloadingHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_objectGraph));
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_title);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_date);
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_rating);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityUsernameLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_username);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_body);
}

- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)accessibilityReviewMoreButton
{
  return (_TtC23ShelfKitCollectionViews17DynamicTypeButton *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more);
}

@end
