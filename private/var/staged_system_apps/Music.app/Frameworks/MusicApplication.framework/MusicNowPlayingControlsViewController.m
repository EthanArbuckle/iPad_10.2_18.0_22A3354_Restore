@implementation MusicNowPlayingControlsViewController

- (MusicNowPlayingControlsViewController)init
{
  return (MusicNowPlayingControlsViewController *)sub_6D2F70();
}

- (MusicNowPlayingControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_6FC0C8();
}

- (void)dealloc
{
  uint64_t v2;
  MusicNowPlayingControlsViewController *v3;
  int *v4;
  void (*v5)(MusicNowPlayingControlsViewController *, __n128);
  MusicNowPlayingControlsViewController *v6;
  __n128 v7;
  objc_super v8;

  v2 = qword_14AB6E8;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_14AB6E8, sub_6DC4C0);
  v4 = off_14DAB30;
  v5 = *(void (**)(MusicNowPlayingControlsViewController *, __n128))(*(_QWORD *)off_14DAB30 + 104);
  v6 = v3;
  v7 = swift_retain(v4);
  v5(v6, v7);

  swift_release(v4);
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for NowPlayingControlsViewController();
  -[MusicNowPlayingControlsViewController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR___MusicNowPlayingControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlaying));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_musicHapticsToken));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_mainContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_timeControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemAudioTraitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButtonPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_attributionContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_repeatButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_transportControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeSharePlayTogetherControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_lyricsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___bottomButtonsConfiguration));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_singIndicatorView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_sharePlayTogetherParticipantsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkPlaceholderLayoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_grabberYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_timeControlWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerMinYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_transportControlsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_volumeSlideBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideExtendedLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideMotionBackgroundTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideMotionBackgroundCollapsedTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideExtendedTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideSplitViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeButtonRegularLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueModeBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueModeBadgeMaskLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_musicHapticsManager));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_metricsReporter));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___MusicNowPlayingControlsViewController_artworkDidChangeHandler), *(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_artworkDidChangeHandler]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___MusicNowPlayingControlsViewController_contentView);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_animationData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_sessionWaitTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_videoPinchGestureRecognizer));
  sub_6FD6C0(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle), *(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle], self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle + 8]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_transportControlsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___mediaControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___leaveSessionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionEffectInteraction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemAudioTraitWatchdog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlayingPath));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_sharePlayTogetherSession));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_videoOutput));
}

- (void)loadView
{
  MusicNowPlayingControlsViewController *v2;

  v2 = self;
  sub_6D3FBC();

}

- (void)viewDidLoad
{
  MusicNowPlayingControlsViewController *v2;

  v2 = self;
  sub_6D40AC();

}

- (void)viewWillAppear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_6DB780(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_6DB884(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_6DB954(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_6DBA40(a3);

}

- (void)viewDidLayoutSubviews
{
  MusicNowPlayingControlsViewController *v2;

  v2 = self;
  sub_6DBB44();

}

- (void)traitCollectionDidChange:(id)a3
{
  MusicNowPlayingControlsViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_6DBF24(a3);

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingControlsViewController();
  v2 = v8.receiver;
  -[MusicNowPlayingControlsViewController viewSafeAreaInsetsDidChange](&v8, "viewSafeAreaInsetsDidChange");
  if (qword_14AB308 != -1)
    swift_once(&qword_14AB308, sub_49B98C);
  v3 = type metadata accessor for Logger(0);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1580520);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "[NowPlayingControlsViewController] safe area insets changed, updating metrics", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_6F0384();
}

- (UIButton)dismissButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton));
}

- (void)setDismissButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton) = (Class)a3;
  v3 = a3;

}

- (_TtC11MusicCoreUI12SymbolButton)contextButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton));
}

- (void)setContextButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton) = (Class)a3;
  v3 = a3;

}

- (_TtC11MusicCoreUI12SymbolButton)favoriteButton
{
  MusicNowPlayingControlsViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_6DFAC0();

  return (_TtC11MusicCoreUI12SymbolButton *)v3;
}

- (void)setFavoriteButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton) = (Class)a3;
  v3 = a3;

}

- (_TtCE16MusicApplicationO11MusicCoreUI9Reactions7Control)reactionButton
{
  return (_TtCE16MusicApplicationO11MusicCoreUI9Reactions7Control *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton);
}

- (void)setReactionButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton) = (Class)a3;
  v3 = a3;

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel));
}

- (void)setTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton)subtitleButton
{
  return (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
}

- (void)setSubtitleButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)leftButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton);
}

- (void)setLeftButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)playPauseStopButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton);
}

- (void)setPlayPauseStopButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication25NowPlayingTransportButton)rightButton
{
  return (_TtC16MusicApplication25NowPlayingTransportButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton);
}

- (void)setRightButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton) = (Class)a3;
  v3 = a3;

}

- (MPRouteLabel)routeLabel
{
  return (MPRouteLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel));
}

- (void)setRouteLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel) = (Class)a3;
  v3 = a3;

}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  MusicNowPlayingControlsViewController *v6;

  v6 = self;
  sub_6EBCB8(a3, a4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  MusicNowPlayingControlsViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_6EDDF4(v4);

  return self & 1;
}

- (MPButton)accessibilityLyricsButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_lyricsButton));
}

- (MPButton)accessibilityQueueButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_queueButton));
}

- (_TtC16MusicApplication16AudioTraitButton)accessibilityPlayingItemAudioTraitButton
{
  return (_TtC16MusicApplication16AudioTraitButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemAudioTraitButton));
}

- (MPCPlayerResponse)accessibilityNowPlayingResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlaying));
}

- (MusicNowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  MusicNowPlayingControlsViewController *result;

  v4 = a4;
  result = (MusicNowPlayingControlsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.NowPlayingControlsViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  MusicNowPlayingControlsViewController *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_6F9644((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  MusicNowPlayingControlsViewController *v10;
  _QWORD v11[5];
  uint64_t v12;

  v7 = swift_allocObject(&unk_137ABD8, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  v11[4] = sub_6FCAD4;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_20B50C;
  v11[3] = &block_descriptor_10_21;
  v8 = _Block_copy(v11);
  v9 = v12;
  swift_unknownObjectRetain_n(a3, 2);
  v10 = self;
  swift_unknownObjectRetain(a4);
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v8, swift_release(v9).n128_f64[0]);
  _Block_release(v8);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (BOOL)videoOutputShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  MusicNowPlayingControlsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_6FC85C();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end
