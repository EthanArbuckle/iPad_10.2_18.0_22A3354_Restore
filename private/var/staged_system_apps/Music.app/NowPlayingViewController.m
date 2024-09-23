@implementation NowPlayingViewController

- (_TtC5Music24NowPlayingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005F2AAC();
}

- (void)dealloc
{
  _TtC5Music24NowPlayingViewController *v2;

  v2 = self;
  sub_1005DA530();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_initialArtworkImage));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_controlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_componentController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_motionBackgroundViewContainer));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24NowPlayingViewController_motionBackground, &qword_1011BCC18);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24NowPlayingViewController_previousMotionVideoArtwork, &qword_1011BCC50);
  swift_bridgeObjectRelease();
  sub_100064644(*(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music24NowPlayingViewController_mode), *(void **)&self->initialArtworkImage[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->nowPlaying[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->queue[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->controlsViewController[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->componentController[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(_QWORD *)&self->animationData[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(_QWORD *)&self->isAnimatingDismissal[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_playingItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_animatedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_containerView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_lyricsFullScreenTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_presentLyricsTimer));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

- (void)viewDidLoad
{
  _TtC5Music24NowPlayingViewController *v2;

  v2 = self;
  sub_1005DA870();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Music24NowPlayingViewController *v4;

  v4 = self;
  sub_1005E0EF0(a3);

}

- (id)contentScrollView
{
  unint64_t v2;

  v2 = *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music24NowPlayingViewController_mode);
  if (v2 >> 62)
  {
    if (v2 >> 62 != 1)
      return 0;
    v2 &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  return objc_msgSend((id)v2, "contentScrollView");
}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC5Music24NowPlayingViewController *v4;

  v4 = self;
  sub_1005E12E8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music24NowPlayingViewController *v4;

  v4 = self;
  sub_1005E13EC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Music24NowPlayingViewController *v4;

  v4 = self;
  sub_1005E1B54(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Music24NowPlayingViewController *v4;

  v4 = self;
  sub_1005E21E4(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music24NowPlayingViewController *v2;

  v2 = self;
  sub_1005E238C();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC5Music24NowPlayingViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4, a2);
  v8 = self;
  sub_1005E2E98(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (int64_t)preferredStatusBarStyle
{
  _TtC5Music24NowPlayingViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[NowPlayingViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    return 1;
  else
    return 3;
}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC5Music24NowPlayingViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1005E32DC(a3);

}

- (void)handleTimeGesture
{
  _TtC5Music24NowPlayingViewController *v2;

  v2 = self;
  sub_1005E5A40();

}

- (_TtC5Music24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music24NowPlayingViewController *result;

  v4 = a4;
  result = (_TtC5Music24NowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.NowPlayingViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4;
  _TtC5Music24NowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005F33D0();

}

@end
