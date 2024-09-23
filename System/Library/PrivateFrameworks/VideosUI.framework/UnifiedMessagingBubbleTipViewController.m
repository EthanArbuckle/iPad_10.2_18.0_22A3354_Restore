@implementation UnifiedMessagingBubbleTipViewController

- (void)vui_loadView
{
  _TtC8VideosUI39UnifiedMessagingBubbleTipViewController *v2;

  v2 = self;
  sub_1D9DE2CEC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI39UnifiedMessagingBubbleTipViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9DE2F88(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController *)sub_1D9DE307C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39UnifiedMessagingBubbleTipViewController____lazy_storage___containerView));
}

@end
