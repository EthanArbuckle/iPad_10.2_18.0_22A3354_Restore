@implementation StructuredConsumer

- (id)consumerName
{
  void *v2;

  sub_1C3935C78();
  v2 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals18StructuredConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C393D108((uint64_t)v4);

  return v6;
}

- (id)consumeInteractionWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals18StructuredConsumer *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1C39570DC(v4);
  v7 = v6;

  return v7;
}

@end
