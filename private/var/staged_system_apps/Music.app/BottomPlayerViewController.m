@implementation BottomPlayerViewController

- (_TtC5Music26BottomPlayerViewController)init
{
  return (_TtC5Music26BottomPlayerViewController *)sub_1002572E8();
}

- (_TtC5Music26BottomPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100265DC8();
}

- (_TtC5Music21NowPlayingContentView)artworkView
{
  return (_TtC5Music21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView));
}

- (void)setArtworkView:(id)a3
{
  void *v4;
  _TtC5Music26BottomPlayerViewController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_100257808(v4);

}

- (void)viewDidLoad
{
  _TtC5Music26BottomPlayerViewController *v2;

  v2 = self;
  sub_100257928();

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
  sub_1002569E0((void (*)(void *, char *, __n128))sub_100267240, sub_100265480, (uint64_t (*)(void *, uint64_t))sub_10067B494);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music26BottomPlayerViewController *v4;

  v4 = self;
  sub_1002615D0(a3);

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
  if (qword_10119B8A0 != -1)
    swift_once(&qword_10119B8A0, sub_1000E7994);
  sub_10067BBD4(v4, qword_10124C780);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC5Music26BottomPlayerViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1002667C4(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (UIStackView)nowPlayingItemStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView));
}

- (void)setNowPlayingItemStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView) = (Class)a3;
  v3 = a3;

}

- (MPRouteLabel)nowPlayingItemRouteLabel
{
  return (MPRouteLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel));
}

- (void)setNowPlayingItemRouteLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)nowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel));
}

- (void)setNowPlayingItemTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)nowPlayingItemSecondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
}

- (void)setNowPlayingItemSecondaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music25NowPlayingTransportButton)skipButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton));
}

- (void)setSkipButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music25NowPlayingTransportButton)playPauseButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton));
}

- (void)setPlayPauseButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music25NowPlayingTransportButton)reverseButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton));
}

- (void)setReverseButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton) = (Class)a3;
  v3 = a3;

}

- (UILabel)sharedListeningParticipantsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel));
}

- (void)setSharedListeningParticipantsLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel) = (Class)a3;
  v3 = a3;

}

- (MPCPlayerResponse)accessibilityNowPlayingResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlaying));
}

- (_TtC5Music26BottomPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music26BottomPlayerViewController *result;

  v4 = a4;
  result = (_TtC5Music26BottomPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.BottomPlayerViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_backdropLayerGroupName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView));

  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffToAction), *(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffToAction]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffFromAction), *(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffFromAction]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlaying));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_willEnterForegroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_motionRestrictionsObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_videoArtworksObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_queueVideoArtworks));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingPath));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharePlayTogetherParticipantsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharePlayTogetherSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_mediaControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipFeedbackGenerator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipGestureRecognizerHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseGestureRecognizerHandler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playerSubscriptions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_repeatButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemLargeTextTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemLargeTextMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playbackCancellationGesture));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_transportControlsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_transportControlsStack));
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButtonConfiguration
                                                                   + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButtonConfiguration
                                                                   + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButtonConfiguration
                                                                   + 8]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_bindings));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_cancellables));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_dragDropController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_highlightGestureRecognizer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music26BottomPlayerViewController_highlightGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->backdropLayerGroupName[OBJC_IVAR____TtC5Music26BottomPlayerViewController____lazy_storage___loadingString]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController____lazy_storage___nowPlayingHeadlineStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_springLoadedInteraction));
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  uint64_t v7;
  _TtC5Music26BottomPlayerViewController *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  sub_100266914(a4);

  swift_unknownObjectRelease(a4);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return 0;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, "setPreferredCommitStyle:", 0, a4);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat x;
  id v6;
  _TtC5Music26BottomPlayerViewController *v7;
  id v8;

  x = a4.x;
  v6 = a3;
  v7 = self;
  v8 = sub_100266CEC(x);

  return v8;
}

@end
