@implementation UpsellBannerCell

- (_TtC23ShelfKitCollectionViews16UpsellBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16UpsellBannerCell *)sub_2152B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16UpsellBannerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_215F3C();
}

- (void).cxx_destruct
{
  sub_21602C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16UpsellBannerCell_imageProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16UpsellBannerCell_bannerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16UpsellBannerCell_viewConstraints));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16UpsellBannerCell_objectGraph));
}

@end
