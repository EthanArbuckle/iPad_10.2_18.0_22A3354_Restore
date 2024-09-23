@implementation MarkButton

- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_styleDidChange);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_labelActive) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_style) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_animateHoverChanges) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_isHovering) = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/MarkedLabel.swift", 41, 2, 372, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  return sub_26FD84(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_26FDD0(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isUserInteractionEnabled
{
  return sub_26FD84(self, (uint64_t)a2, (SEL *)&selRef_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  sub_26FDD0(self, (uint64_t)a2, a3, (const char **)&selRef_setUserInteractionEnabled_);
}

- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithFrame:(CGRect)a3
{
  sub_26FF44((uint64_t)self, (uint64_t)a2, (uint64_t)"ShelfKitCollectionViews.MarkButton", 34);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->mark[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_mark
                                                 + 8]);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_styleDidChange), *(_QWORD *)&self->mark[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_styleDidChange]);
}

@end
