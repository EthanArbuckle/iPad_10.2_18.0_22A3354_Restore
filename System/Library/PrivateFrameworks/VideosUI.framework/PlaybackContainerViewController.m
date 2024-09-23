@implementation PlaybackContainerViewController

- (VUIPlaybackContainerViewControllerDelegate)delegate
{
  sub_1D9BCD6D0();
}

- (void)setDelegate:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_352();
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9BCD73C();
  OUTLINED_FUNCTION_5_8(v5);
}

- (BOOL)isShowingEmbeddedContent
{
  BOOL result;

  sub_1D9BCD950();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9BCD9EC((SEL *)&selRef_prefersStatusBarHidden);
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9BCD9EC((SEL *)&selRef_prefersHomeIndicatorAutoHidden);
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI31PlaybackContainerViewController)init
{
  _TtC8VideosUI31PlaybackContainerViewController *result;

  sub_1D9BCDD88();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI31PlaybackContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BCE4A8();
}

- (void)viewDidLoad
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BCE5C8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI31PlaybackContainerViewController *v4;

  v4 = self;
  sub_1D9BCE840(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v4;
  double v6;
  double v7;
  id v8;

  OUTLINED_FUNCTION_352();
  v8 = v4;
  v6 = OUTLINED_FUNCTION_21_4();
  sub_1D9BCE8DC((uint64_t)a4, v6, v7);
  OUTLINED_FUNCTION_107_0();

}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BCEB58();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)embedCatchUpToLiveViewController:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  OUTLINED_FUNCTION_4_11();
  v5 = OUTLINED_FUNCTION_2_13();
  sub_1D9BCECB8(v5);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)embedCatchUpToLiveViewController:(id)a3 reusingFullscreenPlaybackWithPlayer:(id)a4
{
  void *v4;
  id v7;
  id v8;
  _TtC8VideosUI31PlaybackContainerViewController *v9;

  v7 = a3;
  v8 = OUTLINED_FUNCTION_4_11();
  v9 = self;
  sub_1D9BCED10(v4, a4);

  OUTLINED_FUNCTION_4_3(v9);
}

- (void)unembedCatchUpToLiveViewController
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BCF148();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)presentPlayerViewController:(AVPlayerViewController *)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  AVPlayerViewController *v10;
  _TtC8VideosUI31PlaybackContainerViewController *v11;

  v8 = _Block_copy(a5);
  v9 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_1D9BCFD10((uint64_t)&unk_1F020D450, v9);
}

- (_TtC8VideosUI31PlaybackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9BCFDE8();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_delegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_pipTargetView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_backgroundContent);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_playerViewController);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController____lazy_storage___fullscreenButton);
  swift_bridgeObjectRelease();
}

- (void)embedMultiPlayerViewController:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  OUTLINED_FUNCTION_4_11();
  v5 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9BD0268(v5);

  OUTLINED_FUNCTION_4_3(v6);
}

- (id)unembedMultiPlayerViewController
{
  void *v2;
  _TtC8VideosUI31PlaybackContainerViewController *v3;

  v3 = self;
  sub_1D9BD03E4();
  OUTLINED_FUNCTION_214();
  return OUTLINED_FUNCTION_111(v2);
}

- (void)loadPostPlayForMediaItem:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  OUTLINED_FUNCTION_352();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_36_5();
  sub_1D9BD04A4(v5);
  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_5_8(v6);
}

- (void)removePostPlayViewController
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BD1B9C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)enterPictureInPicture
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BD1C50();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)exitPictureInPictureWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  v5 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = v3;
  sub_1D9BCFD10((uint64_t)&unk_1F020D428, v5);
}

- (void)hidePictureInPictureWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  id v8;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  if (v4)
  {
    v5 = v4;
    v6 = OUTLINED_FUNCTION_37();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1D9B07CC0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = v3;
  sub_1D9BD2320((uint64_t)v7, v6);
  sub_1D97B50A8((uint64_t)v7);
  OUTLINED_FUNCTION_4_3(v8);
}

- (void)playbackUpNextControllerReadyToBeDisplayed
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BD24E4();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)backgroundPlaybackWillBegin
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BD25EC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5
{
  id v8;
  _TtC8VideosUI31PlaybackContainerViewController *v9;

  v8 = a3;
  v9 = self;
  sub_1D9BD265C((uint64_t)v9, a4, a5);

  OUTLINED_FUNCTION_4_3(v9);
}

- (BOOL)overridesOrientationLock
{
  _TtC8VideosUI31PlaybackContainerViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9BD2724();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
