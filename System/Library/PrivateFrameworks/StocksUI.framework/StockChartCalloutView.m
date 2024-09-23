@implementation StockChartCalloutView

- (_TtC8StocksUI21StockChartCalloutView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8StocksUI21StockChartCalloutView *result;

  v5 = OBJC_IVAR____TtC8StocksUI21StockChartCalloutView_dateLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8StocksUI21StockChartCalloutView_priceLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI21StockChartCalloutView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI21StockChartCalloutView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI21StockChartCalloutView *)StockChartCalloutView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{

}

@end
