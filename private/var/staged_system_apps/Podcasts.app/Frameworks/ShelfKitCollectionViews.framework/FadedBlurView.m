@implementation FadedBlurView

- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithEffect:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC23ShelfKitCollectionViews13FadedBlurView *)sub_1D1298(a3);
}

- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews13FadedBlurView *result;

  v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskLayer;
  v6 = objc_allocWithZone((Class)CAGradientLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskGradientInPoints) = (Class)&_swiftEmptyArrayStorage;

  result = (_TtC23ShelfKitCollectionViews13FadedBlurView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ShowHeaderView.swift", 44, 2, 620, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews13FadedBlurView *v2;

  v2 = self;
  sub_1D1628();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskLayer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskGradientInPoints));
}

@end
