@implementation StockListScrollTestCase

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI23StockListScrollTestCase)init
{
  return (_TtC8StocksUI23StockListScrollTestCase *)sub_1DC11C968();
}

- (NSString)testName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DC408A1C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockListScrollTestCase_aggregate);
}

- (int64_t)iterations
{
  return 2;
}

- (int64_t)offset
{
  return 15;
}

- (int64_t)numberOfScreens
{
  return 3;
}

- (unint64_t)scrollDirection
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8StocksUI23StockListScrollTestCase_scrollDirection);
}

- (id)scrollViewWithContext:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListScrollTestCase *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1DC3B87B8(v4);
  v7 = v6;

  return v7;
}

@end
