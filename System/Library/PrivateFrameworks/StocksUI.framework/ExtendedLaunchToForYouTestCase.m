@implementation ExtendedLaunchToForYouTestCase

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
  return 30.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8StocksUI30ExtendedLaunchToForYouTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8StocksUI30ExtendedLaunchToForYouTestCase *v9;
  uint64_t v10;
  void *v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  sub_1DC3BAB10();
  v8 = a3;
  v9 = self;
  sub_1DC402E0C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1DC112E3C;
  *(_QWORD *)(v10 + 24) = v7;
  swift_retain();
  v11 = (void *)sub_1DC402C80();
  sub_1DC402D64();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

- (_TtC8StocksUI30ExtendedLaunchToForYouTestCase)init
{
  _TtC8StocksUI30ExtendedLaunchToForYouTestCase *result;

  result = (_TtC8StocksUI30ExtendedLaunchToForYouTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
