@implementation StockFeedEarningsView

- (_TtC8StocksUI21StockFeedEarningsView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI21StockFeedEarningsView *)sub_1DC309728(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI21StockFeedEarningsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC309C74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedEarningsView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedEarningsView_earningsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21StockFeedEarningsView_addCalendarButton));
}

@end
