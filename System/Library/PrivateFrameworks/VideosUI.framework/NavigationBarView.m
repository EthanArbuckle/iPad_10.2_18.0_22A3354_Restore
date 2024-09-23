@implementation NavigationBarView

- (_TtC8VideosUI17NavigationBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI17NavigationBarView *)sub_1D9AA512C();
}

- (_TtC8VideosUI17NavigationBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9AA52A8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI17NavigationBarView *v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v5 = self;
  sub_1D9AA5368(width);

  OUTLINED_FUNCTION_59();
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17NavigationBarView_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17NavigationBarView_navigationItem));
}

@end
