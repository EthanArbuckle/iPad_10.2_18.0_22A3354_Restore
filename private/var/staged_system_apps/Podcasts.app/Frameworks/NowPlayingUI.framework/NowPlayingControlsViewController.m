@implementation NowPlayingControlsViewController

- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_12580C();
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                      + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse));
}

- (void)setResponse:(id)a3
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1256D8(a3);

}

- (_UIGrabber)chevronView
{
  return (_UIGrabber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView));
}

- (void)setChevronView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView) = (Class)a3;
  v3 = a3;

}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v2;

  v2 = self;
  sub_11A718();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v4;

  v4 = self;
  sub_120724(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v4;

  v4 = self;
  sub_1208F4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v4;

  v4 = self;
  sub_120A38(a3);

}

- (void)appExitedWhileAppeared
{
  sub_120C38(self, (uint64_t)a2, 4);
}

- (void)appEnteredWhileAppeared
{
  sub_120C38(self, (uint64_t)a2, 5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType(self);
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[NowPlayingControlsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_1D28F0, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_1260C8;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_12EB28;
  v12[3] = &block_descriptor_77;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v6.receiver;
  -[NowPlayingControlsViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController];
  *(_QWORD *)&v4[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController] = 0;

}

- (void)viewWillLayoutSubviews
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v2;

  v2 = self;
  sub_12126C();

}

- (void)viewDidLayoutSubviews
{
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v2;

  v2 = self;
  sub_121390();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_121630(a3);

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1204B0();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[NowPlayingControlsViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  sub_1204B0();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPoint v12;
  CGRect v13;

  v4 = a3;
  v5 = self;
  v6 = -[NowPlayingControlsViewController view](v5, "view");
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkLayoutGuide), "layoutFrame");
  v12.x = v8;
  v12.y = v10;
  LOBYTE(v6) = CGRectContainsPoint(v13, v12);

  return (char)v6;
}

- (MTMPButton)accessibilityContextButton
{
  return (MTMPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_contextButton));
}

- (MTMPButton)accessibilityPlaybackSpeedButton
{
  return (MTMPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playbackSpeedButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityLeftButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityPlayPauseStopButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityRightButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButton));
}

- (MPCPlayerResponse)accessibilityResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                      + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse));
}

- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI32NowPlayingControlsViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI32NowPlayingControlsViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingControlsViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_objectGraph));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_bindings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaTrailingConstraint));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_metrics));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_configuration));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_videoTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_videoPinchGestureRecognizer));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_sleepTimerController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_subscriptions));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellBannerDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_releaseDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_subtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellBannerView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_episodeUpsellBannerProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_adamIdForUpsellBannerView]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellCoverView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_contextActionsHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_transportControlsController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_transportControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bindings[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButtonConfiguration]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bindings[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButtonConfiguration]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bindings[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButtonConfiguration]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_secondaryTransportControlsGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playbackSpeedButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_contextButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_sleepButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_queueControlsView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_preferredContentSizeDidChangeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_transportControlsHeightConstraint));
  sub_4375C(*(id *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController____lazy_storage___shazamHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titlesYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_secondaryControlsBottomMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaTopMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControlLayoutGuideTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellCoverTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControlTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_volumeSliderBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkMaxWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__placeholder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse));
}

- (void)standaloneMediaControlsViewController:(id)a3 didSelectRoute:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI32NowPlayingControlsViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_125C68(a4);

}

@end
