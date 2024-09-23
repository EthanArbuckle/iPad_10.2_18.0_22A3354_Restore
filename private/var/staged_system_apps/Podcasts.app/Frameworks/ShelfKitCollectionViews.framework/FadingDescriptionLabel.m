@implementation FadingDescriptionLabel

- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel *)sub_184354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel));
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_184F40();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews22FadingDescriptionLabel *v2;

  v2 = self;
  sub_18488C();

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews22FadingDescriptionLabel *v6;
  id v7;
  char v8;
  BOOL *v9;
  double v10;
  _BYTE v11[24];

  v4 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionMask);
  v5 = a3;
  v6 = self;
  v7 = -[FadingDescriptionLabel traitCollection](v6, "traitCollection");
  v8 = UITraitCollection.prefersRightToLeftLayouts.getter();

  v9 = (BOOL *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment];
  *(_QWORD *)&v10 = swift_beginAccess(&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment], v11, 1, 0).n128_u64[0];
  *v9 = (v8 & 1) == 0;
  objc_msgSend(v4, "setNeedsDisplay", v10);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionMask));
}

@end
