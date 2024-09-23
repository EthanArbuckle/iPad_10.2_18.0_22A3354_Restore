@implementation PostPlayDocumentViewController

- (BOOL)prefersStatusBarHidden
{
  _TtC8VideosUI30PostPlayDocumentViewController *v2;
  BOOL result;

  v2 = self;
  sub_1DA0D140C((SEL *)&selRef_prefersStatusBarHidden);
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  _TtC8VideosUI30PostPlayDocumentViewController *v2;
  BOOL result;

  v2 = self;
  sub_1DA0D140C((SEL *)&selRef_prefersHomeIndicatorAutoHidden);
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI30PostPlayDocumentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA0D15D0();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI30PostPlayDocumentViewController_playbackUpNextDelegate);
  OUTLINED_FUNCTION_19_5();
}

- (void)setPlaybackUpNextDelegate:(id)a3
{
  sub_1DA0D183C();
}

- (void)setPlaybackUpNextContextData:(id)a3
{
  uint64_t v4;
  _TtC8VideosUI30PostPlayDocumentViewController *v5;

  v4 = sub_1DA143C7C();
  v5 = self;
  sub_1DA0D1874(v4);

  swift_bridgeObjectRelease();
}

- (void)startAutoPlayAnimation
{
  _TtC8VideosUI30PostPlayDocumentViewController *v2;

  v2 = self;
  sub_1DA0D19A0();

}

- (double)playbackUpNextViewHeight
{
  _TtC8VideosUI30PostPlayDocumentViewController *v2;
  double result;

  v2 = self;
  sub_1DA0D1A60();

  OUTLINED_FUNCTION_59();
  return result;
}

@end
