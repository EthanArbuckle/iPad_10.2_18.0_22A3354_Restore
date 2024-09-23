@implementation WatchlistCellView

- (_TtC8StocksUI17WatchlistCellView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI17WatchlistCellView *)sub_1DC15DC10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI17WatchlistCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC15E6C0();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_selectionButton));

  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_onEditing));
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_onSelection));
  sub_1DC15EA7C((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WatchlistCellView_indexPath);
}

@end
