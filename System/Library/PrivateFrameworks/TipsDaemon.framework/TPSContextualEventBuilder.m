@implementation TPSContextualEventBuilder

- (NSDictionary)dictionary
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setDictionary:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSContextualEventBuilder_dictionary) = (Class)sub_1DACA2D58();
  swift_bridgeObjectRelease();
}

- (NSString)stream
{
  void *v2;

  if (*(_QWORD *)&self->dictionary[OBJC_IVAR___TPSContextualEventBuilder_stream])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setStream:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1DACA2D94();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___TPSContextualEventBuilder_stream);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (TPSContextualEventBuilder)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_1DACA2D58();
  return (TPSContextualEventBuilder *)sub_1DAC896BC(v3);
}

- (id)contextualEvent
{
  TPSContextualEventBuilder *v2;
  id v3;

  v2 = self;
  v3 = sub_1DAC8989C();

  return v3;
}

- (TPSContextualEventBuilder)init
{
  TPSContextualEventBuilder *result;

  result = (TPSContextualEventBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
