@implementation ErrorContentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI16ErrorContentView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9C1E900(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)accessibilityTitleView
{
  _TtC8VideosUI16ErrorContentView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9C1EE14();

  return (UIView *)OUTLINED_FUNCTION_111(v3);
}

- (UIView)accessibilityDescriptionView
{
  _TtC8VideosUI16ErrorContentView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D97BAFF4();

  return (UIView *)OUTLINED_FUNCTION_111(v3);
}

- (_TtC8VideosUI16ErrorContentView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI16ErrorContentView *result;

  sub_1D9C1EE5C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI16ErrorContentView)initWithCoder:(id)a3
{
  _TtC8VideosUI16ErrorContentView *result;

  sub_1D9C1EEFC(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI16ErrorContentView_titleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI16ErrorContentView_descriptionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI16ErrorContentView_debugTextView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16ErrorContentView_debugTextView2));
}

@end
