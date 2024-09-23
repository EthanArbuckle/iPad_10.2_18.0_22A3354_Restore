@implementation old_ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_1001EB48C(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1001EAF68);
}

- (_TtC5Music32old_ArtworkPrefetchingController)init
{
  return (_TtC5Music32old_ArtworkPrefetchingController *)sub_1001EB504();
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogMetricsProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogMetricsProviding]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogProviding]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_cachingReference));
  swift_bridgeObjectRelease(*(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_cachingIdentifier]);
}

@end
