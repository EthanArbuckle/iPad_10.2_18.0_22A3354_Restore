@implementation EpicInlineView

- (_TtC8VideosUI14EpicInlineView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI14EpicInlineView *result;

  sub_1D9BFC3D0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI14EpicInlineView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BFC4D4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI14EpicInlineView *v7;
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
  sub_1D9BFC588(a4, width, height);
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

}

@end
