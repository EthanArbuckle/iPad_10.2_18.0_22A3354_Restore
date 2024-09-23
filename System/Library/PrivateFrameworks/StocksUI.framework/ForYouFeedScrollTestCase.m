@implementation ForYouFeedScrollTestCase

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI24ForYouFeedScrollTestCase)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_testName);
  *v4 = 0xD000000000000010;
  v4[1] = 0x80000001DC436270;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_numberOfScreens) = (Class)5;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ForYouFeedScrollTestCase init](&v6, sel_init);
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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_aggregate);
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

- (id)scrollViewWithContext:(id)a3
{
  id v4;
  _TtC8StocksUI24ForYouFeedScrollTestCase *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1DC17D53C(v4);
  v7 = v6;

  return v7;
}

@end
