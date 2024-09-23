@implementation MultiPlayerView

- (_TtC8VideosUI15MultiPlayerView)initWithCoder:(id)a3
{
  id v3;
  _TtC8VideosUI15MultiPlayerView *result;

  v3 = a3;
  sub_1D9D189D4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI15MultiPlayerView *v2;

  v2 = self;
  sub_1D9D18DE4();

}

- (void)viewPinchedWithGesture:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  OUTLINED_FUNCTION_4_11();
  v5 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9D1BC94(v5);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)onPanGesture:(id)a3
{
  void *v3;
  id v4;
  uint64_t (**v5)(uint64_t, uint64_t, uint64_t);
  void *v6;

  v4 = a3;
  OUTLINED_FUNCTION_4_11();
  v5 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))OUTLINED_FUNCTION_2_13();
  sub_1D9D1C1B0(v5);

  OUTLINED_FUNCTION_4_3(v6);
}

- (_TtC8VideosUI15MultiPlayerView)initWithFrame:(CGRect)a3
{
  sub_1D9D1D3C0();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0216D30);
  OUTLINED_FUNCTION_4_12(v3);
  swift_bridgeObjectRelease();
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_delegate);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI15MultiPlayerView_didSelectPlayerViewController);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI15MultiPlayerView_didPinchPlayerViewController);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0216D40);
  OUTLINED_FUNCTION_4_12(v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_layoutEngine);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0216D50);
  OUTLINED_FUNCTION_4_12(v5);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15MultiPlayerView_gestureView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15MultiPlayerView____lazy_storage___panGesture);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15MultiPlayerView____lazy_storage___adjustmentView);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
