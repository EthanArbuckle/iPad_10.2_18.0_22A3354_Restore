@implementation VerticalStackView.ExpandableView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtCC8VideosUI17VerticalStackView14ExpandableView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA046588(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI17VerticalStackView14ExpandableView *result;

  sub_1DA046BC8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithCoder:(id)a3
{
  _TtCC8VideosUI17VerticalStackView14ExpandableView *result;

  sub_1DA046C40(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI17VerticalStackView14ExpandableView____lazy_storage___scrollView));
}

@end
