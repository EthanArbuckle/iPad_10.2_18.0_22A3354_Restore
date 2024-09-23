@implementation AccountMessageView

- (_TtC8VideosUI18AccountMessageView)init
{
  return (_TtC8VideosUI18AccountMessageView *)sub_1D9DC9A84();
}

- (_TtC8VideosUI18AccountMessageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DC9DE0();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI18AccountMessageView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9DC9EF0(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI18AccountMessageView)initWithFrame:(CGRect)a3
{
  sub_1D9DCA4F0();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___backgroundExtensionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___shadowView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___amsMaskingView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18AccountMessageView_topSeparatorView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18AccountMessageView_bottomSeparatorView));
}

@end
