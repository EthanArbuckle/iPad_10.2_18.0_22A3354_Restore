@implementation VerticalStackView.FooterView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtCC8VideosUI17VerticalStackView10FooterView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9FE45A0(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI17VerticalStackView10FooterView *result;

  sub_1D9FE4AE8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithCoder:(id)a3
{
  _TtCC8VideosUI17VerticalStackView10FooterView *result;

  sub_1D9FE4B64(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D9A67D78(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC8VideosUI17VerticalStackView10FooterView____lazy_storage___viewLayout));
}

@end
