@implementation BackgroundGradientWithTopSeparatorDecorationView

- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView *)sub_1D9E40D84();
}

- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E40EC4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView *v7;
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
  sub_1D9E40F94(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView_lineView));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView_gradientView));
}

@end
