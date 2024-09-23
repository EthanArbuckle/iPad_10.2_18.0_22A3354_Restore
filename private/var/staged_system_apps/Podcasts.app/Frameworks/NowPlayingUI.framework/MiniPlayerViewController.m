@implementation MiniPlayerViewController

- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_E2828();
}

- (_TtC12NowPlayingUI21NowPlayingContentView)artworkView
{
  return (_TtC12NowPlayingUI21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView));
}

- (void)setArtworkView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView) = (Class)a3;
  v3 = a3;

}

- (UILabel)nowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel));
}

- (void)setNowPlayingItemTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)playPauseButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton));
}

- (void)setPlayPauseButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton) = (Class)a3;
  v3 = a3;

}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton));
}

- (void)setSkipButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton) = (Class)a3;
  v3 = a3;

}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipBackwardButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton));
}

- (void)setSkipBackwardButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton) = (Class)a3;
  v3 = a3;

}

- (void)loadView
{
  id v3;
  _TtC12NowPlayingUI24MiniPlayerViewController *v4;
  char *v5;

  type metadata accessor for MiniPlayerView();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = (char *)objc_msgSend(v3, "init");
  swift_unknownObjectWeakAssign(&v5[OBJC_IVAR____TtC12NowPlayingUI14MiniPlayerView_controller], v4);
  -[MiniPlayerViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI24MiniPlayerViewController *v2;

  v2 = self;
  sub_D9124();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI24MiniPlayerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_DD484(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NowPlayingUI24MiniPlayerViewController *v4;

  v4 = self;
  sub_DD6F8(a3);

}

- (void)willMoveToParentViewController:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  v4 = (char *)v7.receiver;
  v5 = a3;
  -[MiniPlayerViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:", v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController];
  if (v5)
  {
    objc_msgSend(v6, "beginAutomaticResponseLoading", v7.receiver, v7.super_class);

  }
  else
  {
    objc_msgSend(v6, "endAutomaticResponseLoading", v7.receiver, v7.super_class);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24MiniPlayerViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_E2F00(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24MiniPlayerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_E2F98();

}

- (UILabel)accessibilityNowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilitySkipButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityPlayPauseButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton));
}

- (_TtC12NowPlayingUI21NowPlayingContentView)accessibilityArtworkView
{
  return (_TtC12NowPlayingUI21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView));
}

- (id)accessibilityPlayerRequestController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController));
}

- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24MiniPlayerViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24MiniPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.MiniPlayerViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkLayoutGuide));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_leadingArtworkConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_trailingTransportControlsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemRouteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingUpsellLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemLargeTextTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemLargeTextMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playbackCancellationGesture));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_transportControlsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_transportControlsStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButtonConfiguration]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButtonConfiguration]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButtonConfiguration]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_bindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_contextActionRegistration));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_preferredContentSizeDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_routeDidChangeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_highlightGestureRecognizer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_highlightGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_episodeUpsellHintProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_upsellAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController____lazy_storage___upsellString));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_openMiniPlayerHook), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_openMiniPlayerHook]);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;
  _TtC12NowPlayingUI24MiniPlayerViewController *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_E35F4(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24MiniPlayerViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_E38F8(v6, (uint64_t)v7);

  return v9 & 1;
}

@end
