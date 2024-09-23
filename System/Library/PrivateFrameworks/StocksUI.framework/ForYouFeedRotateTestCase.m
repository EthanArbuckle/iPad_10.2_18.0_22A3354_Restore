@implementation ForYouFeedRotateTestCase

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI24ForYouFeedRotateTestCase)init
{
  return (_TtC8StocksUI24ForYouFeedRotateTestCase *)sub_1DC11B388();
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
  return 60.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedRotateTestCase_aggregate);
}

- (NSArray)requiredCapabilities
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DC408CC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int64_t)rotateOrientation
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8StocksUI24ForYouFeedRotateTestCase_rotateOrientation);
}

@end
