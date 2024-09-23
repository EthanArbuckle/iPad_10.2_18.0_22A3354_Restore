@implementation BKAudiobookNowPlayingFullscreenTouchViewController

- (BKAudiobookNowPlayingFullscreenTouchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100257E4C();
}

- (void)loadView
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_10024C720();
  -[BKAudiobookNowPlayingFullscreenTouchViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = *(_QWORD *)&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel];
  sub_10024CB78(v3);
  sub_10024D1CC(v3);
  sub_10024FF48();

}

- (void)viewWillAppear:(BOOL)a3
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v4;

  v4 = self;
  AudiobookNowPlayingFullscreenTouchViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = sub_10024C720();
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleMarqueeView], "setMarqueeEnabled:withOptions:", 1, 0, v6.receiver, v6.super_class);
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleMarqueeView], "setMarqueeEnabled:withOptions:", 1, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[BKAudiobookNowPlayingFullscreenTouchViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = (void *)sub_1003B0800();
  if (v5)
  {
    v6 = v5;
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v5);

    v4 = v6;
  }

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[BKAudiobookNowPlayingFullscreenTouchViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  v3 = sub_10024C720();
  objc_msgSend(v3, "setNeedsLayout", v4.receiver, v4.super_class);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[BKAudiobookNowPlayingFullscreenTouchViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 30;
  else
    return 2;
}

- (id)createMiniViewController
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_1002506D0();

  return v3;
}

- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[BKAudiobookNowPlayingFullscreenTouchViewController ba_analyticsTracker](&v3, "ba_analyticsTracker");
}

- (void)ba_setAnalyticsTracker:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[BKAudiobookNowPlayingFullscreenTouchViewController ba_setAnalyticsTracker:](&v6, "ba_setAnalyticsTracker:", v4);
  sub_100250C24();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController____lazy_storage___nowPlayingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_tocVC));
  sub_100010960((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_buyButtonProvider, (uint64_t *)&unk_1009D4CE0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_buyButtonViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_hudDisappearTimer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.eventHandler[OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_hudText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_scrubberImpactBehavior));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_supportedSkipAmounts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_cancellables));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_attributionView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.eventHandler[OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController____lazy_storage___languageSuffix]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.eventHandler[OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_lastAccessibilityAnnouncedScrubbingPosition]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.eventHandler[OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_lastAccessibilityAnnouncedScrubbingSpeed]);
}

- (id)transitionCurrentCoverImage
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;
  id v4;
  id v5;

  v2 = self;
  v3 = sub_10024C720();
  v4 = *(id *)&v3[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView];

  v5 = objc_msgSend(v4, "image");
  return v5;
}

- (CGRect)transitionCoverFrame
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = AudiobookNowPlayingFullscreenTouchViewController.transitionCoverFrame()();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)transitionBackgroundImageView
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;
  id v4;

  v2 = self;
  v3 = sub_10024C720();
  v4 = sub_1003479F4();

  return v4;
}

- (id)transitionToolbarViews
{
  return sub_100255B24(self, (uint64_t)a2, &OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_grabberView, &qword_1009D4B88, _UIGrabber_ptr);
}

- (id)transitionControlsViews
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = AudiobookNowPlayingFullscreenTouchViewController.transitionControlsViews()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)transitionCoverViews
{
  return sub_100255B24(self, (uint64_t)a2, &OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView, &qword_1009D4BA0, UIImageView_ptr);
}

- (double)coverCornerRadius
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;
  double v4;

  v2 = self;
  v3 = sub_10024C720();
  if (qword_1009CDF30 != -1)
    swift_once(&qword_1009CDF30, sub_100347AE4);
  v4 = *(double *)&qword_1009DC548;

  return v4;
}

- (id)transitionCoverImagePlayControl
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  char *v3;
  id v4;

  v2 = self;
  v3 = sub_10024C720();
  v4 = *(id *)&v3[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView];

  return v4;
}

- (void)fadeOutHUD:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100255D48(0);

}

- (void)beginTracking:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;

  v4 = a3;
  v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.beginTracking(_:)((uint64_t)v4);

}

- (void)endTracking:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;

  v4 = a3;
  v5 = self;
  _s5Books48AudiobookNowPlayingFullscreenTouchViewControllerC11endTrackingyySo14IMCustomSliderCF_0();

}

- (void)fineScrubSpeedChanged:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;

  v4 = a3;
  v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.fineScrubSpeedChanged(_:)(v4);

}

- (BOOL)sliderIsProgressSlider:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;
  char *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = sub_10024C720();
  v7 = *(id *)&v6[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_progressSlider];

  return v7 == v4;
}

- (double)playedInterval
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  BKAudiobookNowPlayingFullscreenTouchViewController *v6;
  double v8;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel);
  KeyPath = swift_getKeyPath(&unk_1007148B8);
  v5 = swift_getKeyPath(&unk_1007148E0);
  v6 = self;
  static Published.subscript.getter(&v8, v3, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  return v8;
}

- (double)durationOfCurrentChapter
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  double v3;

  v2 = self;
  v3 = AudiobookNowPlayingFullscreenTouchViewController.durationOfCurrentChapter.getter();

  return v3;
}

- (void)didTapSessionIndicator:(id)a3
{
  BKScrubberSlider *v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;

  v4 = (BKScrubberSlider *)a3;
  v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.didTapSessionIndicator(_:)(v4);

}

- (id)accessibleDescriptionOfSessionIndicatorPosition
{
  BKAudiobookNowPlayingFullscreenTouchViewController *v2;
  void *object;
  NSString v4;

  v2 = self;
  object = AudiobookNowPlayingFullscreenTouchViewController.accessibleDescriptionOfSessionIndicatorPosition()().value._object;

  if (object)
  {
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)alternateAccessibilityFrameFor:(id)a3
{
  id v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = AudiobookNowPlayingFullscreenTouchViewController.alternateAccessibilityFrame(for:)(v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)resetPlaybackSpeed
{
  void *v2;
  double v3;
  BKAudiobookNowPlayingFullscreenTouchViewController *v4;
  BKAudiobookNowPlayingFullscreenTouchViewController *v5;
  BKAudiobookNowPlayingFullscreenTouchViewController *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler);
  v6 = self;
  objc_msgSend(v2, "playbackRate");
  if (*(float *)&v3 == 1.0)
  {
    v4 = v6;
  }
  else
  {
    LODWORD(v3) = 1.0;
    objc_msgSend(v2, "setPlaybackRateTo:", v3);
    v5 = (BKAudiobookNowPlayingFullscreenTouchViewController *)objc_msgSend(objc_allocWithZone((Class)UINotificationFeedbackGenerator), "init");
    -[BKAudiobookNowPlayingFullscreenTouchViewController notificationOccurred:](v5, "notificationOccurred:", 0);

    v4 = v5;
  }

}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

@end
