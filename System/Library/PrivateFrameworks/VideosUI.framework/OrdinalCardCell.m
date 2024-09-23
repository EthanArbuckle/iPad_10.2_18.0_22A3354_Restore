@implementation OrdinalCardCell

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  v3 = OUTLINED_FUNCTION_21_4();
  sub_1D9D0E768(v3);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  OUTLINED_FUNCTION_21_4();
  sub_1D9D0F210();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC8VideosUI15OrdinalCardCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15OrdinalCardCell *result;

  sub_1D9D0FA38();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15OrdinalCardCell)initWithCoder:(id)a3
{
  _TtC8VideosUI15OrdinalCardCell *result;

  sub_1D9D0FAD8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_cellImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_numberLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_titleLabel);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_subtitleLabel));
}

- (id)zoomSourceView
{
  _TtC8VideosUI15OrdinalCardCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9C1EE14();

  return v3;
}

@end
