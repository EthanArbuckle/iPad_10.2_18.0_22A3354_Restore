@implementation PaginatedMediaController

- (_TtC8VideosUI24PaginatedMediaController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9D5BCEC();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI24PaginatedMediaController *v2;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9D5BFC8();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3;

  v3 = OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_325_1();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3;

  v3 = OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_325_1();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)mediaControllerTapped:(id)a3
{
  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_115_2();
  sub_1D9D5E3F4();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9D5E47C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)transitionToFullScreenAnimated:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D5E52C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
  self;
  sub_1D9D5E56C();
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5
{
  self;
  j__OUTLINED_FUNCTION_136_16();
}

- (void)setControlsVisible:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D5EB54(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI24PaginatedMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9D61A74();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_pageControlBottomMarginConstraint));
  OUTLINED_FUNCTION_72_2();
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_paginationDelegate);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_backgroundMediaInfo);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_backgroundMediaController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___previousIndicator);
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_collectionImpressioner, &qword_1EDA8E6B0);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___nextIndicator);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___containerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___mediaShowcaseConfig);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___pageControl);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___pageProgress);
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_elapsedTimeObserverToken, &qword_1EDA95080);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_enablePageControlTimer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_chevronDebounceTimer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_swipeController);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___metadataView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___buttonsView);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_autoAdvancePageTimer);
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController__metadataViewTopOffsetStream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA87868);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_unknownObjectRelease();
}

- (TVPPlayer)player
{
  void *v2;
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D61C68();
  OUTLINED_FUNCTION_214();
  return (TVPPlayer *)OUTLINED_FUNCTION_111(v2);
}

- (void)setPlayer:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  OUTLINED_FUNCTION_91_0();
  v4 = v3;
  v5 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9D61CC4(v5);
  OUTLINED_FUNCTION_5_8(v6);
}

- (AVPlayerViewController)avPlayerViewController
{
  void *v2;
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D61DD0();
  OUTLINED_FUNCTION_214();
  return (AVPlayerViewController *)OUTLINED_FUNCTION_111(v2);
}

- (void)setAvPlayerViewController:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  OUTLINED_FUNCTION_91_0();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_36_5();
  sub_1D9D61E2C(v5);
  OUTLINED_FUNCTION_5_8(v6);
}

- (unint64_t)state
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9D61E9C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (NSArray)mediaInfos
{
  uint64_t v2;
  _TtC8VideosUI24PaginatedMediaController *v3;
  uint64_t v4;
  void *v5;

  v3 = self;
  sub_1D9D61F10();
  OUTLINED_FUNCTION_214();
  if (!v2)
    return (NSArray *)OUTLINED_FUNCTION_111(0);
  OUTLINED_FUNCTION_236(v4, (unint64_t *)&qword_1EDAB2F00);
  v5 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v5);
}

- (void)setMediaInfos:(id)a3
{
  _TtC8VideosUI24PaginatedMediaController *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    OUTLINED_FUNCTION_236((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
    OUTLINED_FUNCTION_302_0();
  }
  v4 = self;
  v5 = OUTLINED_FUNCTION_301_0();
  sub_1D9D61F7C(v5);
  OUTLINED_FUNCTION_5_8(v6);
}

- (VUIMediaInfo)currentMediaInfo
{
  void *v2;
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D5D2AC();
  OUTLINED_FUNCTION_214();
  return (VUIMediaInfo *)OUTLINED_FUNCTION_111(v2);
}

- (unint64_t)mediaInfoIndex
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9D59460();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setMediaInfoIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62070(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isPlaybackEnabled
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D620A4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9D620F4();
  OUTLINED_FUNCTION_5_8(v3);
}

- (BOOL)forceAutoPlay
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D627F0();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setForceAutoPlay:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62840(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)autoPlayInSharePlay
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62880();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setAutoPlayInSharePlay:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D628D0(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)prefetchesVideoFrame
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62910();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setPrefetchesVideoFrame:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62960(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (double)videoAudioRampDuration
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  double result;

  v2 = self;
  sub_1D9D629A4();
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_59();
  return result;
}

- (void)setVideoAudioRampDuration:(double)a3
{
  _TtC8VideosUI24PaginatedMediaController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_215_10();
  sub_1D9D629F4();
  OUTLINED_FUNCTION_12_4(v4);
}

- (BOOL)recordPausedMediaEventAsStop
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62A34();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setRecordPausedMediaEventAsStop:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62A84(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isVideoFrameFallbackEnabled
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62AC4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setVideoFrameFallbackEnabled:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62B14(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)allowsExternalPlayback
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62B54();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62BA4(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)stopsPlaybackWhenInactive
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62BE4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setStopsPlaybackWhenInactive:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62C34(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)updatesNowPlayingInfoCenter
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62C74();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62CC4(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isForeground
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62D1C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62D6C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62DBC(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)shouldStopPlayerWhenExitingFullScreen
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62DFC();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62E4C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)clearPreviousImageBeforeLoading
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62ED4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D62F24(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (double)playbackStartDelay
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  double result;

  v2 = self;
  sub_1D9D62F68();
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_59();
  return result;
}

- (void)setPlaybackStartDelay:(double)a3
{
  _TtC8VideosUI24PaginatedMediaController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_215_10();
  sub_1D9D62FB8();
  OUTLINED_FUNCTION_12_4(v4);
}

- (BOOL)animateImageChange
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D62FF8();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setAnimateImageChange:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D63048(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (unint64_t)imageContentMode
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9D63088();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setImageContentMode:(unint64_t)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D630C8(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (unint64_t)imageSwappingAnimationType
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9D6310C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setImageSwappingAnimationType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D6314C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isPreloadPlaybackEnabled
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D63190();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D631E0(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)prefersAudioOverPictureInPicture
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D632A0();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D632F0(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)showsPlaybackControlsInForeground
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D633DC();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setShowsPlaybackControlsInForeground:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D6342C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)allowsPictureInPicturePlayback
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D6346C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D634BC(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (UIEdgeInsets)legibleContentInsets
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = self;
  sub_1D9D63510();
  OUTLINED_FUNCTION_16_0();
  v3 = OUTLINED_FUNCTION_88();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D6358C();

}

- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D635CC();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D6361C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (NSString)videoGravity
{
  void *v2;
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D63674();
  OUTLINED_FUNCTION_214();
  return (NSString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setVideoGravity:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9D636CC(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isAutomaticPlaybackStart
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D63734();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D63784(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  BOOL result;

  v2 = self;
  sub_1D9D637C4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D63814(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)appendMediaInfos:(id)a3
{
  uint64_t v4;

  OUTLINED_FUNCTION_236((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
  sub_1DA1440FC();
  OUTLINED_FUNCTION_132_4();
  v4 = OUTLINED_FUNCTION_35_1();
  sub_1D9D60E54(v4);

  OUTLINED_FUNCTION_19_5();
}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D6387C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)setMediaInfos:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;

  OUTLINED_FUNCTION_236((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
  OUTLINED_FUNCTION_302_0();
  v6 = OUTLINED_FUNCTION_275();
  sub_1D9D638C0(v4, a4);

  OUTLINED_FUNCTION_1_19();
}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  void *v5;
  id v8;
  id v9;

  v8 = a3;
  v9 = OUTLINED_FUNCTION_275();
  sub_1D9D61544((uint64_t)v5, a4, a5);

  OUTLINED_FUNCTION_4_3(v9);
}

- (void)replaceMediaInfo:(id)a3 atIndex:(unint64_t)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v6 = v4;
  v7 = OUTLINED_FUNCTION_211_6();
  sub_1D9D5F348(v7, v8);

  OUTLINED_FUNCTION_4_3(v9);
}

- (id)notificationObject
{
  id v2;

  v2 = sub_1D9D63A20();
  return OUTLINED_FUNCTION_111(v2);
}

- (void)play
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9D63A4C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)pause
{
  _TtC8VideosUI24PaginatedMediaController *v2;

  v2 = self;
  sub_1D9D63AEC((SEL *)&selRef_pause);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)stop
{
  _TtC8VideosUI24PaginatedMediaController *v2;

  v2 = self;
  sub_1D9D63AEC((SEL *)&selRef_stop);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)setShowsVideoControls:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9D63B54(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (id)surrenderCurrentPlayer
{
  void *v2;
  _TtC8VideosUI24PaginatedMediaController *v3;

  v3 = self;
  sub_1D9D64254();
  OUTLINED_FUNCTION_214();
  return OUTLINED_FUNCTION_111(v2);
}

- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_132_4();
  v6 = OUTLINED_FUNCTION_211_6();
  sub_1D9D642A8(v6, v7);

  OUTLINED_FUNCTION_4_3(v8);
}

- (void)handlePageControlChanged
{
  _TtC8VideosUI24PaginatedMediaController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9D65FD0();
  OUTLINED_FUNCTION_5_8(v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  BOOL result;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9D67268((int)v6, v4);

  OUTLINED_FUNCTION_9();
  return result;
}

- (BOOL)pageControlTimerProgress:(id)a3 shouldAdvanceToPage:(int64_t)a4
{
  void *v4;
  id v5;
  BOOL result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9D67554();

  OUTLINED_FUNCTION_9();
  return result;
}

@end
