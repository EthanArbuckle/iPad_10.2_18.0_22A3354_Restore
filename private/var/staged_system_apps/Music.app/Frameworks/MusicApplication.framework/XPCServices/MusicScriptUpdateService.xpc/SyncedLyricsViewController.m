@implementation SyncedLyricsViewController

- (void)viewDidLoad
{
  _TtC11MusicCoreUI26SyncedLyricsViewController *v2;

  v2 = self;
  SyncedLyricsViewController.viewDidLoad()();

}

- (void)bottomTapHandler
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC11MusicCoreUI26SyncedLyricsViewController *v8;
  _BYTE v9[24];

  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 40);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11MusicCoreUI26SyncedLyricsViewController *v4;

  v4 = self;
  SyncedLyricsViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  v4 = (char *)v7.receiver;
  -[SyncedLyricsViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink], "invalidate", v7.receiver, v7.super_class);
  v6 = *(void **)&v4[v5];
  *(_QWORD *)&v4[v5] = 0;

}

- (void)viewDidLayoutSubviews
{
  _TtC11MusicCoreUI26SyncedLyricsViewController *v2;

  v2 = self;
  SyncedLyricsViewController.viewDidLayoutSubviews()();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  v2 = v3.receiver;
  -[SyncedLyricsViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  sub_100288F64();

}

- (void)displayLinkFired:(id)a3
{
  _TtC11MusicCoreUI26SyncedLyricsViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100292AF0();

}

- (void)shareGestureHandler:(id)a3
{
  _TtC11MusicCoreUI26SyncedLyricsViewController *v4;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v5;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v6;
  uint64_t v7;
  char *v8;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v9;

  v4 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)a3;
  v5 = self;
  if (-[SyncedLyricsViewController state](v4, "state") == (id)1
    && (v6 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)-[SyncedLyricsViewController view](v4, "view")) != 0)
  {
    v9 = v6;
    v7 = type metadata accessor for SyncedLyricsLineView();
    v8 = (char *)swift_dynamicCastClass(v9, v7);
    if (v8)
      sub_100288688(v8);

    v4 = v5;
  }
  else
  {
    v9 = v5;
  }

}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithCoder:(id)a3
{
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_specs, 0x219uLL);
  sub_10026ED0C((uint64_t)v3);
  sub_1000FF204((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_lyrics));
  sub_100008758((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_timingProvider, &qword_10049AEB0);
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_shareHandler), *(_QWORD *)&self->isPlayingSpatial[OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_shareHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_scrollView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_manager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_instrumentalBreakVisibleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_tapFeedbackGenerator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100292EE4(v7);

  return v9 & 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = self;
  sub_10028CDC4();
  sub_10028FFA4();
  *((_BYTE *)&v5->super.super.super.isa
  + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScroll) = 0;
  v6 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer;
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer), "invalidate");
  v7 = *(Class *)((char *)&v5->super.super.super.isa + v6);
  *(Class *)((char *)&v5->super.super.super.isa + v6) = 0;

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v6;

  v5 = a3;
  v6 = self;
  _s11MusicCoreUI26SyncedLyricsViewControllerC06scrollF14DidEndDragging_14willDecelerateySo08UIScrollF0C_SbtF_0();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v8;
  _TtC11MusicCoreUI26SyncedLyricsViewController *v9;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = self;
  _s11MusicCoreUI26SyncedLyricsViewControllerC06scrollF15WillEndDragging_12withVelocity19targetContentOffsetySo08UIScrollF0C_So7CGPointVSpyAJGtF_0(x, y);

}

@end
