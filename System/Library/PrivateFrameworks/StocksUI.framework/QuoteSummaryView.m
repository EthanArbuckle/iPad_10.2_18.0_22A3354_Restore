@implementation QuoteSummaryView

- (_TtC8StocksUI16QuoteSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI16QuoteSummaryView *)sub_1DC399408(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI16QuoteSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC399780();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_priceChangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_separatorBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_afterHoursPriceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI16QuoteSummaryView_afterHoursPriceChangeLabel));

}

@end
