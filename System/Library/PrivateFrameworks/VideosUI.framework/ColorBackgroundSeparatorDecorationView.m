@implementation ColorBackgroundSeparatorDecorationView

- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI38ColorBackgroundSeparatorDecorationView *result;

  sub_1DA017ACC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA017C48();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI38ColorBackgroundSeparatorDecorationView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA017CD4(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI38ColorBackgroundSeparatorDecorationView_lineView));
}

@end
