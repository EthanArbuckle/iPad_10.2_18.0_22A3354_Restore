@implementation PinningHeaderView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat width;
  _TtC8VideosUI17PinningHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9FE9758(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8VideosUI17PinningHeaderView *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  sub_1D9FE9F34((uint64_t)a4, x, y);
  v11 = v10;

  return v11;
}

- (_TtC8VideosUI17PinningHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI17PinningHeaderView *result;

  sub_1D9FEA02C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI17PinningHeaderView)initWithCoder:(id)a3
{
  _TtC8VideosUI17PinningHeaderView *result;

  sub_1D9FEA0C4(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17PinningHeaderView_collapsingView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17PinningHeaderView_pinnedView);
  sub_1D9FE9E50((uint64_t)self + OBJC_IVAR____TtC8VideosUI17PinningHeaderView_animator);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17PinningHeaderView_trackingScrollView);
  swift_release();
}

@end
