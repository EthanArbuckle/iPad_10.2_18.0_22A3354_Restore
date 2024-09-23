@implementation MastheadView

- (_TtC8StocksUI12MastheadView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI12MastheadView *)sub_1DC0962B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI12MastheadView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8StocksUI12MastheadView *result;

  v5 = OBJC_IVAR____TtC8StocksUI12MastheadView_appNameLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8StocksUI12MastheadView_dateLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI12MastheadView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
