@implementation StockFeedMemoryTestCase

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI23StockFeedMemoryTestCase)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_testName);
  *v4 = 0x6565466B636F7453;
  v4[1] = 0xEF79726F6D654D64;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[StockFeedMemoryTestCase init](&v6, sel_init);
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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8StocksUI23StockFeedMemoryTestCase *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1DC25425C(v8, (uint64_t)sub_1DC112E3C, v7);

  swift_release();
}

@end
