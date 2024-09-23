@implementation BKAudiobookNowPlayingTouchViewController

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  BKAudiobookNowPlayingTouchViewController *v6;
  void *v7;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_externalDelegates);
    v6 = self;
    swift_retain(v5);
    swift_unknownObjectRelease(v4);
    v7 = (void *)swift_unknownObjectWeakLoadStrong(v5 + 24);

    swift_release(v5);
  }
  else
  {
    v7 = 0;
  }
  return (AEAssetViewControllerDelegate *)v7;
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  BKAudiobookNowPlayingTouchViewController *v8;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_externalDelegates);
    swift_unknownObjectRetain(a3);
    v8 = self;
    swift_retain(v7);
    swift_unknownObjectRelease(v6);
    swift_unknownObjectWeakAssign(v7 + 24, a3);

    swift_release(v7);
    swift_unknownObjectRelease(a3);
  }
}

- (BKAudiobookNowPlayingTouchViewControllerDelegate)delegate
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  BKAudiobookNowPlayingTouchViewController *v6;
  void *v7;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_externalDelegates);
    v6 = self;
    swift_retain(v5);
    swift_unknownObjectRelease(v4);
    v7 = (void *)swift_unknownObjectWeakLoadStrong(v5 + 16);

    swift_release(v5);
  }
  else
  {
    v7 = 0;
  }
  return (BKAudiobookNowPlayingTouchViewControllerDelegate *)v7;
}

- (void)setDelegate:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  BKAudiobookNowPlayingTouchViewController *v8;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_externalDelegates);
    swift_unknownObjectRetain(a3);
    v8 = self;
    swift_retain(v7);
    swift_unknownObjectRelease(v6);
    swift_unknownObjectWeakAssign(v7 + 16, a3);

    swift_release(v7);
    swift_unknownObjectRelease(a3);
  }
}

- (BOOL)isPlaying
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  BKAudiobookNowPlayingTouchViewController *v6;
  _BOOL8 v8;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel);
  KeyPath = swift_getKeyPath(&unk_1007146A0);
  v5 = swift_getKeyPath(&unk_1007146C8);
  v6 = self;
  static Published.subscript.getter(&v8, v3, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  return v8;
}

- (_TtC13BookAnalytics9BATracker)recommendedTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker));
}

- (void)setRecommendedTracker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker) = (Class)a3;
  v3 = a3;

}

- (AEAssetAudiobookStatus)assetStatus
{
  return (AEAssetAudiobookStatus *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler), "assetStatus");
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return (AEAssetOpenAnimating *)sub_100246CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator);
}

- (void)setContentOpenAnimator:(id)a3
{
  sub_100246D74((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator);
}

- (BCBookPositionProcessing)bookPositionProcessor
{
  return (BCBookPositionProcessing *)sub_100246CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_bookPositionProcessor);
}

- (void)setBookPositionProcessor:(id)a3
{
  sub_100246D74((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_bookPositionProcessor);
}

- (BKAudiobookNowPlayingTouchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10024AC4C();
}

- (void)dealloc
{
  void (*v2)(void);
  BKAudiobookNowPlayingTouchViewController *v3;
  objc_super v4;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x1E0);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  -[BKAudiobookNowPlayingTouchViewController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_helperProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_analyticsRecorder));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_cancellables));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_minibarViewControllerDelegate);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_minifiedController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_bookPositionProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_amsEngagement));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_messageViewControllerProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_cachedPointerInteractionViews));
}

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  v2 = (char *)v5.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = objc_msgSend(v3, "defaultCenter", v5.receiver, v5.super_class);
  objc_msgSend(v4, "addObserver:selector:name:object:", v2, "onAppWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);
  sub_100247220(*(_QWORD *)&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel]);

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  id *v3;
  double v4;
  id v5;
  _BYTE v6[24];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  v2 = (char *)v7.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  v3 = (id *)&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator];
  *(_QWORD *)&v4 = swift_beginAccess(&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator], v6, 1, 0).n128_u64[0];
  if (*v3)
  {
    objc_msgSend(*v3, "bookContentDidLoad", v4);
    v5 = *v3;
  }
  else
  {
    v5 = 0;
  }
  *v3 = 0;

  swift_unknownObjectRelease(v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  v4 = v5.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  objc_msgSend(v4, "setNeedsStatusBarAppearanceUpdate", v5.receiver, v5.super_class);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  v4 = (char *)v7.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "ba_effectiveAnalyticsTracker", v7.receiver, v7.super_class);
  v6 = *(void **)&v4[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker];
  *(_QWORD *)&v4[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker] = v5;

  sub_1002477B4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BKAudiobookNowPlayingTouchViewController *v4;

  v4 = self;
  AudiobookNowPlayingTouchViewController.viewWillDisappear(_:)(a3);

}

- (void)bc_analyticsForceEndSession
{
  void *v2;
  BKAudiobookNowPlayingTouchViewController *v3;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler);
  v3 = self;
  objc_msgSend(v2, "togglePlayPause");
  dispatch thunk of AudiobookAnalyticsRecorder.forceEndPlaySession()(v3);

}

- (void)setHelper:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t Strong;
  char *v7;
  BKAudiobookNowPlayingTouchViewController *v8;
  BKAudiobookNowPlayingTouchViewController *v9;

  v5 = _Block_copy(a4);
  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_helperProvider)+ 16);
  if (Strong)
  {
    v7 = (char *)Strong;
    _Block_copy(v5);
    swift_unknownObjectRetain(a3);
    v8 = self;
    sub_1003951C8((uint64_t)a3, v7, v5);
    swift_unknownObjectRelease(v7);
    _Block_release(v5);
  }
  else
  {
    swift_unknownObjectRetain(a3);
    v9 = self;
  }
  _Block_release(v5);
  swift_unknownObjectRelease(a3);

}

- (void)togglePlayPause
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler), "togglePlayPause");
}

- (void)ensureAudiobookNotPlayingWithAssetID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BKAudiobookNowPlayingTouchViewController *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100247E6C(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)play
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler), "play");
}

- (void)onAppWillEnterForeground:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler), "updateFollowingDormantPeriod");
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BKAudiobookNowPlayingTouchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKAudiobookNowPlayingTouchViewController *result;

  v4 = a4;
  result = (BKAudiobookNowPlayingTouchViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingTouchViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (AEAsset)asset
{
  BKAudiobookNowPlayingTouchViewController *v2;
  id v3;

  v2 = self;
  v3 = AudiobookNowPlayingTouchViewController.asset.getter();

  return (AEAsset *)v3;
}

- (int64_t)readerType
{
  return 1;
}

- (void)open:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  BKAudiobookNowPlayingTouchViewController *v8;

  v3 = a3;
  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler);
  swift_unknownObjectWeakAssign(v5 + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_viewController, self);
  Strong = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = self;
    sub_1002A73E0(0, v3);

    swift_unknownObjectRelease(v7);
  }
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  BKAudiobookNowPlayingTouchViewController *v10;

  v4 = a4;
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler);
  swift_unknownObjectWeakAssign(v7 + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_viewController, self);
  Strong = swift_unknownObjectWeakLoadStrong(v7 + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v9 = Strong;
    swift_unknownObjectRetain(a3);
    v10 = self;
    sub_1002A73E0((uint64_t)a3, v4);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v9);
  }
}

- (void)close:(BOOL)a3
{
  BKAudiobookNowPlayingTouchViewController *v4;

  v4 = self;
  sub_1002085F8(a3);

}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  uint64_t Strong;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
    swift_unknownObjectRelease(Strong);
}

- (BOOL)dismissShouldBegin:(id)a3
{
  return objc_msgSend(a3, "proposedBeginState");
}

- (void)requestClose:(BOOL)a3
{
  BKAudiobookNowPlayingTouchViewController *v4;

  v4 = self;
  sub_1002086A4(a3);

}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  uint64_t Strong;
  uint64_t v5;
  BKAudiobookNowPlayingTouchViewController *v6;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = self;
    sub_1002A8B5C();

    swift_unknownObjectRelease(v5);
  }
}

- (uint64_t)jumpToBeginningAnimated:(uint64_t)a1
{
  uint64_t result;

  result = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(a1 + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (result)
    return swift_unknownObjectRelease(result);
  return result;
}

- (void)assetViewControllerWillUnload
{
  void (*v2)(void);
  BKAudiobookNowPlayingTouchViewController *v3;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x1E0);
  v3 = self;
  v2();
  sub_100208774();

}

- (void)assetViewControllerPrepareForReload
{
  uint64_t Strong;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
    swift_unknownObjectRelease(Strong);
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  void *v6;
  BKAudiobookNowPlayingTouchViewController *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_10024AD2C((uint64_t)a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

}

- (void)setDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5
{
  uint64_t Strong;
  uint64_t v10;
  BKAudiobookNowPlayingTouchViewController *v11;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v10 = Strong;
    v11 = self;
    sub_1002A0B40(a3, a4, a5);

    swift_unknownObjectRelease(v10);
  }
}

- (BOOL)shouldCloseDueToAssetDeletion
{
  uint64_t Strong;
  uint64_t v4;
  BKAudiobookNowPlayingTouchViewController *v5;
  char v6;

  Strong = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_navigationHandler)+ OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    v6 = sub_1002A7B34();

    swift_unknownObjectRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (id)transitionContentView
{
  return -[BKAudiobookNowPlayingTouchViewController view](self, "view");
}

- (id)transitionCurrentCoverImage
{
  return 0;
}

- (CGRect)transitionCoverFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)transitionBackgroundImageView
{
  return 0;
}

- (double)transitionToolbarAlpha
{
  return 1.0;
}

- (id)transitionCoverViews
{
  return Array._bridgeToObjectiveC()().super.isa;
}

- (double)coverCornerRadius
{
  return 0.0;
}

- (int64_t)coverContentMode
{
  BKAudiobookNowPlayingTouchViewController *v2;
  UIViewContentMode v3;

  v2 = self;
  v3 = AudiobookNowPlayingTouchViewController.coverContentMode()();

  return v3;
}

- (BOOL)transitionHasCustomArtwork
{
  return 0;
}

- (double)transitionCoverImagePlayControlShadowOpacityValue
{
  return 0.22;
}

- (id)transitionCoverImagePlayControl
{
  return 0;
}

- (_TtC13BookAnalytics9BATracker)trackerForAudiobookAnalytics
{
  return (_TtC13BookAnalytics9BATracker *)-[BKAudiobookNowPlayingTouchViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker");
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  BKAudiobookNowPlayingTouchViewController *v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_10024AE98(a4, v9, v11);

  swift_bridgeObjectRelease(v11);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4;
  BKAudiobookNowPlayingTouchViewController *v5;

  v4 = a3;
  v5 = self;
  AudiobookNowPlayingTouchViewController.messageViewControllerDidSelectCancel(_:)(v4);

}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  BKAudiobookNowPlayingTouchViewController *v14;

  v6 = qword_1009CDD18;
  v7 = a3;
  v14 = self;
  v8 = a4;
  if (v6 != -1)
    swift_once(&qword_1009CDD18, sub_100246604);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100048F64(v9, (uint64_t)qword_1009D4870);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.error.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Message View Controller did fail to load", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  BKAudiobookNowPlayingTouchViewController *v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  v6 = -[BKAudiobookNowPlayingTouchViewController traitCollection](v5, "traitCollection");
  v7 = -[BKAudiobookNowPlayingTouchViewController adaptivePresentationStyleForPresentationController:traitCollection:](v5, "adaptivePresentationStyleForPresentationController:traitCollection:", v4, v6);

  return v7;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  BKAudiobookNowPlayingTouchViewController *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, "presentedViewController");
  v10 = objc_opt_self(BCAMSUIBubbleTipViewController);
  v11 = swift_dynamicCastObjCClass(v9, v10);

  if (v11)
    v12 = -1;
  else
    v12 = 5;

  return v12;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKAudiobookNowPlayingTouchViewController *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_10024B2A0(v8);

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  BKAudiobookNowPlayingTouchViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s5Books38AudiobookNowPlayingTouchViewControllerC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0(v6);

  return v9;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  return 1;
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  BKAudiobookNowPlayingTouchViewController *v5;
  id result;
  id v7;
  objc_class *v8;
  char *v9;
  BKAudiobookNowPlayingTouchViewController *v10;
  objc_super v11;
  _QWORD v12[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  result = -[BKAudiobookNowPlayingTouchViewController view](v5, "view", swift_unknownObjectRelease(a3).n128_f64[0]);
  if (result)
  {
    v7 = result;
    v8 = (objc_class *)type metadata accessor for AudiobookNowPlayingTouchViewControllerCoverSource();
    v9 = (char *)objc_allocWithZone(v8);
    *(_QWORD *)&v9[OBJC_IVAR____TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource_view] = v7;
    v11.receiver = v9;
    v11.super_class = v8;
    v10 = -[BKAudiobookNowPlayingTouchViewController init](&v11, "init");

    _s5Books15CurrentPageViewVwxx_0(v12);
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3
{
  BKAudiobookNowPlayingTouchViewController *v5;
  uint64_t v6;
  BKAudiobookNowPlayingTouchViewController *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1003CF75C((uint64_t)v10);

  sub_10004A7B8((uint64_t)v10);
  return v8;
}

@end
