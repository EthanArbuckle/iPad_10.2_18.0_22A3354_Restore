@implementation CountDownProgressView

- (_TtC8VideosUI21CountDownProgressView)initWithCoder:(id)a3
{
  _TtC8VideosUI21CountDownProgressView *result;

  sub_1D9F905E8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI21CountDownProgressView *v7;
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
  sub_1D9F90BEC(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC8VideosUI21CountDownProgressView)initWithFrame:(CGRect)a3
{
  sub_1D9F90CD0();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CountDownProgressView_image);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CountDownProgressView_imageTintColor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CountDownProgressView_imageSymbolConfig);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CountDownProgressView_circle);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CountDownProgressView____lazy_storage___imageView));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  _TtC8VideosUI21CountDownProgressView *v7;

  v6 = a3;
  v7 = self;
  sub_1D9F90DB4((uint64_t)v7, a4);

  OUTLINED_FUNCTION_4_3(v7);
}

@end
