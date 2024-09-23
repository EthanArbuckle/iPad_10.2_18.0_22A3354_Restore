@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_14DFC8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_14E018(self, (uint64_t)a2, a3, (SEL *)&selRef_setSelected_, (SEL *)&selRef_isSelected);
}

- (BOOL)isHighlighted
{
  return sub_14DFC8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_14E018(self, (uint64_t)a2, a3, (SEL *)&selRef_setHighlighted_, (SEL *)&selRef_isHighlighted);
}

- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *)sub_14E2F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1516D8();
}

- (void)wasTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler];
    v5 = self;
    v4 = sub_2C690((uint64_t)v2, v3);
    v2(v4);
    sub_1D618((uint64_t)v2, v3);

  }
}

- (void)layoutSubviews
{
  __n128 v2;
  _TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *v3;

  v3 = self;
  sub_14ECB4(v2);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_14FEF0(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction];
    v6 = a3;
    v8 = self;
    v7 = sub_2C690((uint64_t)v3, v5);
    v3(v7);
    sub_1D618((uint64_t)v3, v5);

  }
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *v2;

  v2 = self;
  sub_1502FC();

}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_titleLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_subtitleLabel);
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryView));
  sub_151834(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory], self->subtitleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory]);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_topDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_bottomDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_tapGestureRecognizer));
}

@end
