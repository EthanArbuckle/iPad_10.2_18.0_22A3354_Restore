@implementation ConnectedAppFooterViewCell

- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26ConnectedAppFooterViewCell *result;

  sub_1D9A6D1B0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9A6D42C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  char v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  OUTLINED_FUNCTION_38_10(self);
  v4 = OUTLINED_FUNCTION_47_2();
  sub_1D9A6D4C4(v4, v5);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_59();
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26ConnectedAppFooterViewCell____lazy_storage___componentView));
  swift_release();
}

@end
