@implementation FullscreenNowPlayingViewController

- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_13160();
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI34FullscreenNowPlayingViewController *v2;

  v2 = self;
  sub_12300();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  BOOL v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FullscreenNowPlayingViewController();
  v4 = v7.receiver;
  -[FullscreenNowPlayingViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = sub_12A9C();
  v6 = v4[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode];
  v4[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode] = v5;
  sub_11DA4(v6);

}

- (void)viewDidLayoutSubviews
{
  _BYTE *v2;
  BOOL v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FullscreenNowPlayingViewController();
  v2 = v5.receiver;
  -[FullscreenNowPlayingViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = sub_12A9C();
  v4 = v2[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode];
  v2[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode] = v3;
  sub_11DA4(v4);

}

- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI34FullscreenNowPlayingViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI34FullscreenNowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.FullscreenNowPlayingViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_nowPlayingControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_nowPlayingDetailsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_splitStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_sheetGrabber));
}

@end
