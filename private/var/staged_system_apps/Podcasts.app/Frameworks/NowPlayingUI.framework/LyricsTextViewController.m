@implementation LyricsTextViewController

- (_TtC12NowPlayingUI24LyricsTextViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_137E60();
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI24LyricsTextViewController *v2;

  v2 = self;
  sub_137570();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LyricsTextViewController();
  v2 = (char *)v4.receiver;
  -[LyricsTextViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textView];
  objc_msgSend(v3, "setNeedsLayout", v4.receiver, v4.super_class);
  objc_msgSend(v3, "layoutIfNeeded");

}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (_TtC12NowPlayingUI24LyricsTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24LyricsTextViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24LyricsTextViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.LyricsTextViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_metrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_attributedLyricsText));
}

@end
