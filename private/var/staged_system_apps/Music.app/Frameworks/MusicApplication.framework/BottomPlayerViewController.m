@implementation BottomPlayerViewController

- (_TtC16MusicApplication26BottomPlayerViewController)init
{
  return (_TtC16MusicApplication26BottomPlayerViewController *)sub_A67E30();
}

- (_TtC16MusicApplication26BottomPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_A7737C();
}

- (_TtC16MusicApplication21NowPlayingContentView)artworkView
{
  return (_TtC16MusicApplication21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_artworkView));
}

- (void)setArtworkView:(id)a3
{
  id v4;
  _TtC16MusicApplication26BottomPlayerViewController *v5;
  id v6;

  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_artworkView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_artworkView) = (Class)a3;
  v4 = a3;
  v5 = self;
  sub_A68354(v6);

}

- (void)viewDidLoad
{
  _TtC16MusicApplication26BottomPlayerViewController *v2;

  v2 = self;
  sub_A68474();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[BottomPlayerViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_A6762C((void (*)(void *, char *, __n128))sub_A78404, sub_A764C0, (uint64_t (*)(void *, uint64_t))sub_A75A88);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication26BottomPlayerViewController *v4;

  v4 = self;
  sub_A720A0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[BottomPlayerViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  if (qword_14ABA90 != -1)
    swift_once(&qword_14ABA90, sub_8AF854);
  sub_A7619C(v4, qword_15810F0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicApplication26BottomPlayerViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_A778C8(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (UIStackView)nowPlayingItemStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemStackView));
}

- (void)setNowPlayingItemStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemStackView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemStackView) = (Class)a3;
  v3 = a3;

}

- (MPRouteLabel)nowPlayingItemRouteLabel
{
  return (MPRouteLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemRouteLabel));
}

- (void)setNowPlayingItemRouteLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemRouteLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemRouteLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)nowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemTitleLabel));
}

- (void)setNowPlayingItemTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemTitleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemTitleLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)nowPlayingItemSecondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
}

- (void)setNowPlayingItemSecondaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemSecondaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemSecondaryLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)skipButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipButton);
}

- (void)setSkipButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipButton) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)playPauseButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playPauseButton);
}

- (void)setPlayPauseButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playPauseButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playPauseButton) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)reverseButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_reverseButton);
}

- (void)setReverseButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_reverseButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_reverseButton) = (Class)a3;
  v3 = a3;

}

- (UILabel)sharedListeningParticipantsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharedListeningParticipantsLabel));
}

- (void)setSharedListeningParticipantsLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharedListeningParticipantsLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharedListeningParticipantsLabel) = (Class)a3;
  v3 = a3;

}

- (MPCPlayerResponse)accessibilityNowPlayingResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlaying));
}

- (_TtC16MusicApplication26BottomPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication26BottomPlayerViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication26BottomPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.BottomPlayerViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_queue));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_handoffToAction), *(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_handoffToAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_handoffFromAction), *(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_handoffFromAction]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlaying));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_willEnterForegroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_motionRestrictionsObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_videoArtworksObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_queueVideoArtworks));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingPath));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharePlayTogetherParticipantsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharePlayTogetherSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemRouteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playPauseButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_reverseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_sharedListeningParticipantsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_mediaControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipFeedbackGenerator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_skipGestureRecognizerHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_reverseGestureRecognizerHandler));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_repeatButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemLargeTextTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_nowPlayingItemLargeTextMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_playbackCancellationGesture));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_transportControlsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_transportControlsStack));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_dragDropController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_highlightGestureRecognizer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_highlightGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_handoffButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController____lazy_storage___nowPlayingHeadlineStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26BottomPlayerViewController_springLoadedInteraction));
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  _TtC16MusicApplication26BottomPlayerViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_A77A18(a4);

  swift_unknownObjectRelease(a4);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return 0;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication26BottomPlayerViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_A77DF0(a5);

  swift_unknownObjectRelease(a5);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat x;
  id v6;
  _TtC16MusicApplication26BottomPlayerViewController *v7;
  id v8;

  x = a4.x;
  v6 = a3;
  v7 = self;
  v8 = sub_A77ED4(x);

  return v8;
}

@end
