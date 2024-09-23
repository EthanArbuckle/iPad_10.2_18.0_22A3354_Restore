@implementation MultiPlayerContainerView

- (void)dealloc
{
  _TtC8VideosUI24MultiPlayerContainerView *v2;

  v2 = self;
  sub_1D9F6B874();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___controlsView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___volumeGradient);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___volumeIndicator);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___dimmingView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_snapshotView);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_onSelect);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_closeHandler);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_fullscreenHandler);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_playerViewController);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___singlePressGesture);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___hoverGestureRecognizer));
}

- (void)onHoverWithGesture:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9F6BEAC(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (_TtC8VideosUI24MultiPlayerContainerView)initWithCoder:(id)a3
{
  _TtC8VideosUI24MultiPlayerContainerView *result;

  sub_1D9F6D450(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI24MultiPlayerContainerView *v2;

  v2 = self;
  sub_1D9F6D658();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)singlePressWithGesture:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9F6DBD0();

  OUTLINED_FUNCTION_4_3(v4);
}

- (_TtC8VideosUI24MultiPlayerContainerView)initWithFrame:(CGRect)a3
{
  sub_1D9F6DE5C();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  id v4;
  BOOL v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  v5 = sub_1D9F6DE94(v3);

  return v5;
}

@end
