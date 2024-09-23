@implementation StockFeedPriceView

- (_TtC8StocksUI18StockFeedPriceView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18StockFeedPriceView *)sub_1DC1F5B20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI18StockFeedPriceView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8StocksUI18StockFeedPriceView *result;

  v5 = OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_quoteSummaryView;
  v6 = objc_allocWithZone((Class)type metadata accessor for QuoteSummaryView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_exchangeLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI18StockFeedPriceView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18StockFeedPriceView_quoteSummaryView));

}

@end
