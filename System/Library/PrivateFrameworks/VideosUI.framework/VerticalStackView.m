@implementation VerticalStackView

- (_TtC8VideosUI17VerticalStackView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI17VerticalStackView *result;

  sub_1D9E238CC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI17VerticalStackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E23AF8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI17VerticalStackView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  sub_1D9E23B90(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  _TtC8VideosUI17VerticalStackView *v3;
  double v4;

  v3 = self;
  v4 = sub_1D9E24EEC();

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_platterView));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___expandableView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___panelView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView_footerView);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___platterContainerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView_topPlatterGradient);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI17VerticalStackView_bottomExpandableGradient);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_bottomPlatterGradient));
}

@end
