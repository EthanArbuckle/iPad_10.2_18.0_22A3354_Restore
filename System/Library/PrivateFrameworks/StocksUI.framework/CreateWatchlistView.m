@implementation CreateWatchlistView

- (_TtC8StocksUI19CreateWatchlistView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI19CreateWatchlistView *)sub_1DC23C74C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI19CreateWatchlistView)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  uint64_t v9;
  _TtC8StocksUI19CreateWatchlistView *result;

  v5 = OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_onTap;
  sub_1DC12F234();
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_newWatchlistButton;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);

  result = (_TtC8StocksUI19CreateWatchlistView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19CreateWatchlistView_newWatchlistButton));
}

@end
