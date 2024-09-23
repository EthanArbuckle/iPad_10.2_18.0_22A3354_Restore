@implementation BilingualFeedPromptView

- (_TtC8StocksUI23BilingualFeedPromptView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI23BilingualFeedPromptView *)sub_1DC1FAD64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI23BilingualFeedPromptView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC1FB314();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_enableBilingualFeedButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23BilingualFeedPromptView_neverShowBilingualFeedPromptsButton));
}

@end
