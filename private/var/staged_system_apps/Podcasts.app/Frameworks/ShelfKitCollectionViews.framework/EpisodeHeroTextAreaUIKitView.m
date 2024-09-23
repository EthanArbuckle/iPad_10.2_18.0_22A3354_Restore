@implementation EpisodeHeroTextAreaUIKitView

- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1F5594();
}

- (void)layoutSubviews
{
  double v2;
  _TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView *v3;

  v3 = self;
  sub_1F2D1C(v2);

}

- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView *result;

  result = (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.EpisodeHeroTextAreaUIKitView", 52, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_graph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_episode));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_environment;
  v4 = type metadata accessor for EnvironmentValues(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_metrics, type metadata accessor for EpisodeHeroTextArea.Metrics);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_captionGenerator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_captionSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView____lazy_storage___layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_caption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_summary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_playedIcon));
}

@end
