@implementation UpsellArtworkView

- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews17UpsellArtworkView *result;

  sub_E55B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_E69A0();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[UpsellArtworkView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadowView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_chinBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_entitlementBadgeView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView____lazy_storage___entitlementBadgeConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadow));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_objectGraph));
}

@end
