@implementation BackgroundTextConsumer

- (id)consumerName
{
  void *v2;

  sub_1C3935BC8();
  v2 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C393D108((uint64_t)v4);

  return v6;
}

- (id)consumeMailContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C394898C(v4);

  return v6;
}

- (id)consumeNewsArticleViewsWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  v8 = (void *)sub_1C3948AB0(v4, v6, v7);

  return v8;
}

- (id)consumeNotesContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C3948B18(v4);

  return v6;
}

- (id)consumeSafariContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1C3948B84(v4);
  v7 = v6;

  return v7;
}

- (id)consumeThirdPartyAppContentWithContext:(id)a3
{
  id v4;
  _TtC32PersonalizationPortraitInternals22BackgroundTextConsumer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  v8 = (void *)sub_1C3948C74(v4, v6, v7);

  return v8;
}

@end
