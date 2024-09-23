@implementation StaticLyricsViewController

- (_TtC16MusicApplication26StaticLyricsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B46680();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication26StaticLyricsViewController *v2;

  v2 = self;
  sub_B404A0();

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
  v4[OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_isVisible] = 1;

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
  sub_B43414();
  v4[OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_isVisible] = 0;

}

- (_TtC16MusicApplication26StaticLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication26StaticLyricsViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication26StaticLyricsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.StaticLyricsViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C0DC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_song, type metadata accessor for StaticLyricsViewController.Song);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_modelPlayEvent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_lyricsLoader));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController_lyricsVisibilityStart, (uint64_t *)&unk_14AD5F0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication26StaticLyricsViewController____lazy_storage___actionMetricsReportingContext, &qword_14BB530);
}

@end
