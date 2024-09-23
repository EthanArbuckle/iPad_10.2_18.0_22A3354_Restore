@implementation MusicNowPlayingControlsViewController

- (MusicNowPlayingControlsViewController)init
{
  return (MusicNowPlayingControlsViewController *)sub_100110D74();
}

- (MusicNowPlayingControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10013A628();
}

- (void)dealloc
{
  uint64_t v2;
  MusicNowPlayingControlsViewController *v3;
  void *v4;
  void (*v5)(MusicNowPlayingControlsViewController *, __n128);
  MusicNowPlayingControlsViewController *v6;
  __n128 v7;
  objc_super v8;

  v2 = qword_10119B940;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10119B940, sub_10011A5A8);
  v4 = off_1011A19F0;
  v5 = *(void (**)(MusicNowPlayingControlsViewController *, __n128))(*(_QWORD *)off_1011A19F0 + 104);
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
  uint64_t v3;

  sub_10013C71C((uint64_t)self + OBJC_IVAR___MusicNowPlayingControlsViewController_delegate, (uint64_t)a2);
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
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_leftButtonConfiguration
                                                     + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButtonConfiguration
                                                     + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_rightButtonConfiguration
                                                     + 8]);
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
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___lyricsButtonStateImages));
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
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentRegularLayoutConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentExtendedLayoutConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_mainContainerRegularLayoutConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_mainContainerExtendedCollapsedLayoutConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkLayoutGuideRegularConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkLayoutGuideCollapsedConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_placeholderArtworkLayoutGuideConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController__titlesStackViewRegularConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titlesStackViewCollapsedConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsCompactConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsRegularConstraints));
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
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playerSubscriptions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_musicHapticsManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkLayoutGuideFullBleedConstraints));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_metricsReporter));
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___MusicNowPlayingControlsViewController_artworkDidChangeHandler), *(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_artworkDidChangeHandler]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___MusicNowPlayingControlsViewController_contentView, v3);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingControlsViewController_animationData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_sessionWaitTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_videoPinchGestureRecognizer));
  sub_10013C090(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle), *(_QWORD *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle], self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle + 8]);
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
  sub_100111DD8();

}

- (void)viewDidLoad
{
  MusicNowPlayingControlsViewController *v2;

  v2 = self;
  sub_100111EC8();

}

- (void)viewWillAppear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_100119858(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_10011995C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_100119A2C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  MusicNowPlayingControlsViewController *v4;

  v4 = self;
  sub_100119B18(a3);

}

- (void)viewDidLayoutSubviews
{
  MusicNowPlayingControlsViewController *v2;

  v2 = self;
  sub_100119C1C();

}

- (void)traitCollectionDidChange:(id)a3
{
  MusicNowPlayingControlsViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10011A00C(a3);

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
  if (qword_10119C358 != -1)
    swift_once(&qword_10119C358, sub_1005EC118);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100048B14(v3, (uint64_t)qword_10124D428);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter(v5);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[NowPlayingControlsViewController] safe area insets changed, updating metrics", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_10012E6BC();
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
  v3 = sub_10011DAF0();

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

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)reactionButton
{
  return (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton));
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

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)subtitleButton
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
}

- (void)setSubtitleButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music25NowPlayingTransportButton)leftButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton));
}

- (void)setLeftButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music25NowPlayingTransportButton)playPauseStopButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton));
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

- (_TtC5Music25NowPlayingTransportButton)rightButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton));
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
  sub_100129CB8(a3, a4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  MusicNowPlayingControlsViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10012BDD8(v4);

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

- (_TtC5Music16AudioTraitButton)accessibilityPlayingItemAudioTraitButton
{
  return (_TtC5Music16AudioTraitButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
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
  result = (MusicNowPlayingControlsViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.NowPlayingControlsViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  uint64_t v7;
  MusicNowPlayingControlsViewController *v8;

  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  sub_100137ED4((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  MusicNowPlayingControlsViewController *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;

  v7 = swift_allocObject(&unk_1010B1A30, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  v12[4] = sub_10013B078;
  v13 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1005CE710;
  v12[3] = &unk_1010B1A48;
  v8 = _Block_copy(v12);
  v9 = v13;
  swift_unknownObjectRetain_n(a3, 2);
  v10 = self;
  swift_unknownObjectRetain(a4, v11);
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
  sub_10013AE00();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end
