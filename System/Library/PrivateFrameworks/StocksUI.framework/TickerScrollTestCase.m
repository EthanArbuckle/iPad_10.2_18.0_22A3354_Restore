@implementation TickerScrollTestCase

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI20TickerScrollTestCase)init
{
  return (_TtC8StocksUI20TickerScrollTestCase *)sub_1DC11FF50();
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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI20TickerScrollTestCase_aggregate);
}

- (NSArray)requiredCapabilities
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DC408CC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
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
  return 5;
}

- (unint64_t)scrollDirection
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI20TickerScrollTestCase_scrollDirection);
}

- (id)scrollViewWithContext:(id)a3
{
  id v4;
  _TtC8StocksUI20TickerScrollTestCase *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1DC3D46C0(v4);
  v7 = v6;

  return v7;
}

@end
