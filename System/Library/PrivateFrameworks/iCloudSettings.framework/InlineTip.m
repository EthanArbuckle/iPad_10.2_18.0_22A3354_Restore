@implementation InlineTip

- (NSString)title
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)subtitle
{
  return (NSString *)sub_24B51A6A0();
}

- (NSURL)iconURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D8D30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B52C5CC((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings9InlineTip_iconURL, (uint64_t)v5);
  v6 = sub_24B5E2FF4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_24B5E2FB8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v8;
}

- (NSArray)actions
{
  uint64_t v2;

  return (NSArray *)sub_24B5C3A80((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings9InlineTip_actions, v2, (void (*)(uint64_t))type metadata accessor for Action);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return InlineTip.init(_:)(v3);
}

- (_TtC14iCloudSettings9InlineTip)init
{
  _TtC14iCloudSettings9InlineTip *result;

  result = (_TtC14iCloudSettings9InlineTip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings9InlineTip_iconURL, &qword_2544D8D30);
  swift_bridgeObjectRelease();
}

@end
