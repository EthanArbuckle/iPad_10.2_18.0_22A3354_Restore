@implementation ConnectedAppFooterViewCell.ComponentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  OUTLINED_FUNCTION_38_10(self);
  v4 = OUTLINED_FUNCTION_47_2();
  sub_1D9A6D808(v4, v5, v6);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView *result;

  sub_1D9A6F788();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithCoder:(id)a3
{
  _TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView *result;

  sub_1D9A6F7EC((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView_titleView));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView_buttonSeparatorView));
}

@end
