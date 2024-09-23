@implementation StockListSectionHeaderView

- (_TtC8StocksUI26StockListSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI26StockListSectionHeaderView *)sub_1DC0A8CA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI26StockListSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  Class v9;
  _TtC8StocksUI26StockListSectionHeaderView *result;

  v5 = OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_switcherButton;
  v6 = objc_allocWithZone((Class)sub_1DC404240());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_onWatchlistSwitcherMenuPresentation;
  sub_1DC12F234();
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8StocksUI26StockListSectionHeaderView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_switcherButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI26StockListSectionHeaderView_onWatchlistSwitcherMenuPresentation));
}

@end
