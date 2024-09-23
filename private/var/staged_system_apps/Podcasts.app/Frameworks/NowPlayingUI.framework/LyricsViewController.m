@implementation LyricsViewController

- (_TtC12NowPlayingUI20LyricsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_C7EC8();
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI20LyricsViewController *v2;

  v2 = self;
  sub_C6DD0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI20LyricsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_C7BF8((uint64_t)a3);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI20LyricsViewController *v8;
  unint64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (unint64_t)objc_msgSend(v7, "horizontalSizeClass");
  if (v9 >= 3)
  {
    objc_msgSend(v7, "horizontalSizeClass");
    v10 = 5;
  }
  else
  {
    v10 = qword_171968[v9];
  }

  return v10;
}

- (_TtC12NowPlayingUI20LyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI20LyricsViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI20LyricsViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.LyricsViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI20LyricsViewController_metrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20LyricsViewController_lyricsTextViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20LyricsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20LyricsViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20LyricsViewController_backgroundView));
}

@end
