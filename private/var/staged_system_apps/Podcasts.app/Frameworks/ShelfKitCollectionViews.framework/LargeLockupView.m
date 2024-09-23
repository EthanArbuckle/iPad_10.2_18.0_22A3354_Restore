@implementation LargeLockupView

- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB168();
}

- (void)subtitleTapped
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;

  v2 = self;
  sub_1A980C();

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;

  v2 = self;
  sub_1A99FC();

}

- (UILabel)accessibilityOrdinalLabel
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;
  void *v3;

  v2 = self;
  v3 = sub_1A8A0C();

  return (UILabel *)v3;
}

- (UIAccessibilityElement)accessibilityPrimaryTitleLabel
{
  return (UIAccessibilityElement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_titleAccessibilityLabel));
}

- (UILabel)accessibilitySecondaryTitleLabel
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;
  id v3;

  v2 = self;
  v3 = sub_24DBC(&OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___titleLabel, (uint64_t (*)(void))sub_1AB010);

  return (UILabel *)v3;
}

- (UILabel)accessibilitySubtitleLabel
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;
  id v3;

  v2 = self;
  v3 = sub_24DBC(&OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___subtitleLabel, (uint64_t (*)(void))sub_1A8B40);

  return (UILabel *)v3;
}

- (UIView)accessibilityArtworkContainer
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *v2;
  char *v3;

  v2 = self;
  v3 = sub_1A8950();

  return (UIView *)v3;
}

- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews15LargeLockupView *result;

  result = (_TtC23ShelfKitCollectionViews15LargeLockupView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.LargeLockupView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_cachingArtworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___artworkContainer));
  sub_1AB148(*(id *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_titleAccessibilityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_explicitLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_subtitleAction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_objectGraph));
}

@end
