@implementation ArtworkWithPlaybackStatusView

- (_TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView)init
{
  return (_TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView *)sub_EAE0();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView *v2;

  v2 = self;
  sub_EE5C();

}

- (float)accessibilityProgress
{
  return *(float *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_progress);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_playbackStatusPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_progressOverlay));
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_episodePlayState, (uint64_t (*)(_QWORD))&type metadata accessor for EpisodePlayState);
}

@end
