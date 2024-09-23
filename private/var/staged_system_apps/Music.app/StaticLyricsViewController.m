@implementation StaticLyricsViewController

- (_TtC5Music26StaticLyricsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002ED8E4();
}

- (void)viewDidLoad
{
  _TtC5Music26StaticLyricsViewController *v2;

  v2 = self;
  sub_1002E63EC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticLyricsViewController(0);
  v4 = v5.receiver;
  -[StaticLyricsViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC5Music26StaticLyricsViewController_isVisible] = 1;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticLyricsViewController(0);
  v4 = v5.receiver;
  -[StaticLyricsViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  sub_1002E9860();
  v4[OBJC_IVAR____TtC5Music26StaticLyricsViewController_isVisible] = 0;

}

- (_TtC5Music26StaticLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music26StaticLyricsViewController *result;

  v4 = a4;
  result = (_TtC5Music26StaticLyricsViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.StaticLyricsViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController_song, type metadata accessor for StaticLyricsViewController.Song);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_modelPlayEvent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_lyricsLoader));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController_lyricsVisibilityStart, (uint64_t *)&unk_1011A30A0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_1011A9990);
}

@end
