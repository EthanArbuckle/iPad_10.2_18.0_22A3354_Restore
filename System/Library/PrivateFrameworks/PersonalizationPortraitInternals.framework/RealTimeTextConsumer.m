@implementation RealTimeTextConsumer

- (id)consumerName
{
  void *v2;

  sub_1C3935C20();
  v2 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals20RealTimeTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C393D108((uint64_t)v4);

  return v6;
}

- (id)consumeInteractionWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals20RealTimeTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C3947930(v4);

  return v6;
}

- (id)consumeSafariContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals20RealTimeTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C394799C(v4);

  return v6;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals20RealTimeTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C3947AC4(v4);

  return v6;
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals20RealTimeTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C3947BDC(v4);

  return v6;
}

@end
