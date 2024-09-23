@implementation NowPlayingViewController

- (_TtC16MusicApplication24NowPlayingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_49D634();
}

- (void)dealloc
{
  _TtC16MusicApplication24NowPlayingViewController *v2;

  v2 = self;
  sub_48A44C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_initialArtworkImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_nowPlaying));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_queue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_controlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_componentController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_animationData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_motionBackgroundViewContainer));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_motionBackground, &qword_14CCE28);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_queueVideoArtworks));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_videoArtworksObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_motionKeyframeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_currentMotionData));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_previousMotionVideoArtwork, &qword_14CCE60);
  swift_bridgeObjectRelease(*(_QWORD *)&self->initialArtworkImage[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_nowPlayingRequestingID]);
  sub_A8BF4(*(unint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode), *(void **)&self->initialArtworkImage[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(void **)&self->nowPlaying[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(void **)&self->queue[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(void **)&self->controlsViewController[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(void **)&self->componentController[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(_QWORD *)&self->animationData[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode], *(_QWORD *)&self->isAnimatingDismissal[OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_playingItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_animatedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_containerView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_nowPlayingSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_windowEventNotificationObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_lyricsFullScreenTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_presentLyricsTimer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_foregroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_screenTraitCollectionObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_dismissalObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_timeLabel));
}

- (void)viewDidLoad
{
  _TtC16MusicApplication24NowPlayingViewController *v2;

  v2 = self;
  sub_48A780();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication24NowPlayingViewController *v4;

  v4 = self;
  sub_490D24(a3);

}

- (id)contentScrollView
{
  unint64_t v2;

  v2 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication24NowPlayingViewController_mode);
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
  _TtC16MusicApplication24NowPlayingViewController *v4;

  v4 = self;
  sub_49111C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication24NowPlayingViewController *v4;

  v4 = self;
  sub_491220(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicApplication24NowPlayingViewController *v4;

  v4 = self;
  sub_491944(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication24NowPlayingViewController *v4;

  v4 = self;
  sub_491F98(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication24NowPlayingViewController *v2;

  v2 = self;
  sub_492140();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MusicApplication24NowPlayingViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_492C3C(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (int64_t)preferredStatusBarStyle
{
  _TtC16MusicApplication24NowPlayingViewController *v2;
  id v3;
  char *v4;

  v2 = self;
  v3 = -[NowPlayingViewController traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (_BYTE *)&dword_0 + 2)
    return 1;
  else
    return 3;
}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC16MusicApplication24NowPlayingViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_493080(a3);

}

- (void)handleTimeGesture
{
  _TtC16MusicApplication24NowPlayingViewController *v2;

  v2 = self;
  sub_4956B0();

}

- (_TtC16MusicApplication24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication24NowPlayingViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication24NowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.NowPlayingViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4;
  _TtC16MusicApplication24NowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_49FB5C();

}

@end
