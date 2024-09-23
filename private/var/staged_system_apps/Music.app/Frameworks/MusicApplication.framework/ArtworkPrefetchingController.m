@implementation ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_53B0F8(self, (uint64_t)a2, a3, a4, sub_53A0EC);
}

- (_TtC16MusicApplication28ArtworkPrefetchingController)init
{
  _TtC16MusicApplication28ArtworkPrefetchingController *result;

  result = (_TtC16MusicApplication28ArtworkPrefetchingController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ArtworkPrefetchingController", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_defaultArtworkMetricsProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_defaultArtworkMetricsProvider]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkMetricsProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkMetricsProvider]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkProvider), *(_QWORD *)&self->defaultArtworkMetricsProvider[OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkProvider]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_cachingReference));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_context, (uint64_t *)&unk_14AD640);
}

@end
