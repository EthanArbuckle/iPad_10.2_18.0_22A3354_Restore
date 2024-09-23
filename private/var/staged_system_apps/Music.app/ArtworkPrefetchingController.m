@implementation ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_1001EB48C(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1001EA480);
}

- (_TtC5Music28ArtworkPrefetchingController)init
{
  _TtC5Music28ArtworkPrefetchingController *result;

  result = (_TtC5Music28ArtworkPrefetchingController *)_swift_stdlib_reportUnimplementedInitializer("Music.ArtworkPrefetchingController", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_defaultArtworkMetricsProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_defaultArtworkMetricsProvider]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkMetricsProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkMetricsProvider]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkProvider]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_cachingReference));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_context, &qword_10119DCC0);
}

@end
