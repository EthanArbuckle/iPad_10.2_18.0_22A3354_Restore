@implementation StockView

- (_TtC8StocksUI9StockView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI9StockView *)sub_1DC0D465C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC8StocksUI9StockView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC31ED48();
}

- (void).cxx_destruct
{

  swift_release();
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI9StockView_makeAccessibilityCustomActions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI9StockView_accessibilityPriceString));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)accessibilityLabel
{
  _TtC8StocksUI9StockView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DC31EBF8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DC408A1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)tsaxAccessibilityLabelForReordering
{
  void *v2;
  _TtC8StocksUI9StockView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI9StockView_companyLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1DC408A4C();

    v6 = (void *)sub_1DC408A1C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

@end
