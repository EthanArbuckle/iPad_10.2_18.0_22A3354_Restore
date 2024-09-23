@implementation LegacyArtworkWithPlaybackStatusView

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView *v2;

  v2 = self;
  sub_223AD8();

}

- (float)accessibilityProgress
{
  return *(float *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_progress);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_presenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_imageStoreProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_progressOverlay));
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_episodePlayState, (uint64_t (*)(_QWORD))&type metadata accessor for EpisodePlayState);
}

@end
