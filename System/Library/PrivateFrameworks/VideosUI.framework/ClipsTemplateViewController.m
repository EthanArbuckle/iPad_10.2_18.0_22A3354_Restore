@implementation ClipsTemplateViewController

- (BOOL)prefersStatusBarHidden
{
  _TtC8VideosUI27ClipsTemplateViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1D9E06A18();

  return v3 & 1;
}

- (_TtC8VideosUI27ClipsTemplateViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E07FF4();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI27ClipsTemplateViewController *v2;

  v2 = self;
  sub_1D9E08104();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI27ClipsTemplateViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9E082A8(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC8VideosUI27ClipsTemplateViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  OUTLINED_FUNCTION_21_4();
  sub_1D9E0A868((uint64_t)a4);
  swift_unknownObjectRelease();

}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI27ClipsTemplateViewController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E0A97C();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27ClipsTemplateViewController *v2;

  v2 = self;
  sub_1D9E0ABCC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI27ClipsTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9E0B880();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_26_98((uint64_t)self + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_previousSubtitle);
  OUTLINED_FUNCTION_26_98((uint64_t)self + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_previousAlternateSubtitle);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_playlistViewController);
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_hudController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_tabViewController);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_3();
}

- (NSArray)multiviewIdentifiers
{
  void *v2;

  v2 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v2);
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)0;
}

- (VUINowPlayingTabControllerDelegate)nowPlayingControllerDelegate
{
  OUTLINED_FUNCTION_304();
  return (VUINowPlayingTabControllerDelegate *)OUTLINED_FUNCTION_111(self);
}

- (TVPMediaItem)currentMediaItem
{
  _TtC8VideosUI27ClipsTemplateViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D9E0BAC0();
  v4 = v3;

  return (TVPMediaItem *)OUTLINED_FUNCTION_111(v4);
}

@end
