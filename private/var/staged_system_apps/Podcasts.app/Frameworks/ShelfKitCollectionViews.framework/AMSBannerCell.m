@implementation AMSBannerCell

- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13AMSBannerCell *)sub_F5F24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews13AMSBannerCell *)sub_F6008(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_metricsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_recentlyUnfollowedTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_addFavoriteCategoriesTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_addFavoriteCategoriesSearchTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_recommendationsUpdatedTipProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_messageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_amsDialogRequest));
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews13AMSBannerCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_F6580(v6, v7);

}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC23ShelfKitCollectionViews13AMSBannerCell *v12;

  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (a5)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = a3;
  v12 = self;
  sub_F94BC(v8, v9, (unint64_t)a5);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a5);
}

@end
