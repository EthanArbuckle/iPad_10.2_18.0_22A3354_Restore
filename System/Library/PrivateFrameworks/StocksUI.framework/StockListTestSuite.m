@implementation StockListTestSuite

- (_TtC8StocksUI18StockListTestSuite)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SNTestSuite init](&v3, sel_init);
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8StocksUI18StockListTestSuite *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1DC14F4C4(v8, (uint64_t)sub_1DC112E3C, v7);

  swift_release();
}

@end
