@implementation old_ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_53B0F8(self, (uint64_t)a2, a3, a4, sub_53ABC0);
}

- (_TtC16MusicApplication32old_ArtworkPrefetchingController)init
{
  return (_TtC16MusicApplication32old_ArtworkPrefetchingController *)sub_53B17C();
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogMetricsProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogMetricsProviding]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogProviding), *(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogProviding]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_cachingReference));
  swift_bridgeObjectRelease(*(_QWORD *)&self->defaultCatalogMetricsProviding[OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_cachingIdentifier]);
}

@end
