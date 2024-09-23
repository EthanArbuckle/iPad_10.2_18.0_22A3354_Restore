@implementation StockFeedMastheadView

- (_TtC8StocksUI21StockFeedMastheadView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI21StockFeedMastheadView *)sub_1DC1FA368(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI21StockFeedMastheadView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC1FABBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_symbolLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_moreOptionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_watchStockButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_quoteSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedMastheadView_exchangeLabel));
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end
