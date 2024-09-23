@implementation Icons

- (id)iconURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC14iCloudSettings5Icons *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D8D30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_24B4F9C8C((uint64_t)v5);

  v7 = sub_24B5E2FF4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_24B5E2FB8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (NSString)assetId
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_assetId);
}

- (NSArray)bundleIdentifiers
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings5Icons_bundleIdentifiers))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24B5E4374();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSString)sfSymbolId
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_sfSymbolId);
}

- (NSDictionary)urls
{
  return (NSDictionary *)sub_24B5C41CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_urls);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return Icons.init(_:)(v3);
}

- (NSURL)url1x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C451C);
}

- (NSURL)url2x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C4534);
}

- (NSURL)url3x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C469C);
}

- (NSURL)darkUrl1x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C46B4);
}

- (NSURL)darkUrl2x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C46D4);
}

- (NSURL)darkUrl3x
{
  return (NSURL *)sub_24B5C46F4(self, (uint64_t)a2, (void (*)(void))sub_24B5C47BC);
}

- (_TtC14iCloudSettings5Icons)init
{
  _TtC14iCloudSettings5Icons *result;

  result = (_TtC14iCloudSettings5Icons *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
