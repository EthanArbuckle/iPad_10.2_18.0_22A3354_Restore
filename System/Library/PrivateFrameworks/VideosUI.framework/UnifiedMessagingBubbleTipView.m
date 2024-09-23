@implementation UnifiedMessagingBubbleTipView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI29UnifiedMessagingBubbleTipView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9FA0308(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI29UnifiedMessagingBubbleTipView *result;

  sub_1D9FA0498();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithCoder:(id)a3
{
  _TtC8VideosUI29UnifiedMessagingBubbleTipView *result;

  sub_1D9FA0510(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29UnifiedMessagingBubbleTipView_bubbleTipContentView));
  swift_release();
}

@end
