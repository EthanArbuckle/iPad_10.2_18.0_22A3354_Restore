@implementation UpsellOfferTransactionView

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9B37D70(v4, v3);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat v4;
  double v5;
  double v7;
  double v8;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9B38200(a4, v5, v4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8VideosUI26UpsellOfferTransactionView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26UpsellOfferTransactionView *result;

  sub_1D9B382A8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26UpsellOfferTransactionView)initWithCoder:(id)a3
{
  _TtC8VideosUI26UpsellOfferTransactionView *result;

  sub_1D9B38364(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UpsellOfferTransactionView_disclaimerLabel));
  swift_bridgeObjectRelease();
}

@end
