@implementation StockChartCalloutHandleLayer

- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8StocksUI28StockChartCalloutHandleLayer *result;

  v5 = OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLayer;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2840]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLocation) = 0;

  result = (_TtC8StocksUI28StockChartCalloutHandleLayer *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI28StockChartCalloutHandleLayer)init
{
  return (_TtC8StocksUI28StockChartCalloutHandleLayer *)sub_1DC2E2E80();
}

- (void)layoutSublayers
{
  char *v2;
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[StockChartCalloutHandleLayer layoutSublayers](&v4, sel_layoutSublayers);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLayer];
  objc_msgSend(v2, sel_frame, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setPosition_, CGRectGetWidth(v5) * 0.5, *(double *)&v2[OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLocation]);

}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithLayer:(id)a3
{
  _TtC8StocksUI28StockChartCalloutHandleLayer *result;

  swift_unknownObjectRetain();
  sub_1DC409634();
  swift_unknownObjectRelease();
  result = (_TtC8StocksUI28StockChartCalloutHandleLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
