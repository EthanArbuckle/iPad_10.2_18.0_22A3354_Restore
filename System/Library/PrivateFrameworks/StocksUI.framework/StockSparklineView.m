@implementation StockSparklineView

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StockSparklineView();
  v2 = (char *)v4.receiver;
  -[StockSparklineView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8StocksUI18StockSparklineView_sparklineView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (_TtC8StocksUI18StockSparklineView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18StockSparklineView *)sub_1DC0D4B8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI18StockSparklineView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC1D19A4();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18StockSparklineView_baselineIndicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18StockSparklineView_nonAnimatingDelegate));
}

@end
