@implementation StockFeedTestSuite

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI18StockFeedTestSuite_resolver);
  swift_release();
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8StocksUI18StockFeedTestSuite *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1DC3CC1A8(v8, (uint64_t)sub_1DC112E3C, v7);

  swift_release();
}

- (_TtC8StocksUI18StockFeedTestSuite)init
{
  _TtC8StocksUI18StockFeedTestSuite *result;

  result = (_TtC8StocksUI18StockFeedTestSuite *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
