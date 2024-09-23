@implementation SectionHeaderView

- (_TtC8StocksUI17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI17SectionHeaderView *)sub_1DC14A11C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI17SectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8StocksUI17SectionHeaderView *result;

  v5 = OBJC_IVAR____TtC8StocksUI17SectionHeaderView_backgroundView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8StocksUI17SectionHeaderView_titleLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI17SectionHeaderView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
