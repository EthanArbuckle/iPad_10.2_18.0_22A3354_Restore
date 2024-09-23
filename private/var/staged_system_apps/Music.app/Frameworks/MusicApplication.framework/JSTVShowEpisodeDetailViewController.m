@implementation JSTVShowEpisodeDetailViewController

- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC16MusicApplication35JSTVShowEpisodeDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetailView) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_artworkCachingReference;
  v6 = type metadata accessor for Artwork.CachingReference();
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)swift_allocObject(v6, 16, 7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_contentItem) = 0;
  v7 = a3;

  result = (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSTVShowEpisodeDetailViewController.swift", 58, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication35JSTVShowEpisodeDetailViewController *v2;

  v2 = self;
  sub_36A2F4();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication35JSTVShowEpisodeDetailViewController *v2;

  v2 = self;
  sub_36AB30();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication35JSTVShowEpisodeDetailViewController *v4;

  v4 = self;
  sub_36ACB0(a3);

}

- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication35JSTVShowEpisodeDetailViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSTVShowEpisodeDetailViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetail));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetailView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_contentItem));
}

@end
