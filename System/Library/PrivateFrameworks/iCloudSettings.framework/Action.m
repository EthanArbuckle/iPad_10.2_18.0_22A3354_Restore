@implementation Action

- (NSString)type
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)title
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_title);
}

- (NSString)urlString
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_urlString);
}

- (NSDictionary)actionParameters
{
  return (NSDictionary *)sub_24B5C41CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_actionParameters);
}

- (NSDictionary)buyParameters
{
  return (NSDictionary *)sub_24B5C41CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_buyParameters);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return Action.init(_:)(v3);
}

- (_TtC14iCloudSettings6Action)initWithType:(id)a3 title:(id)a4 urlString:(id)a5 actionParameters:(id)a6 buyParameters:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _TtC14iCloudSettings6Action *v19;
  uint64_t *v20;
  id *v21;
  id *v22;
  objc_super v24;

  v12 = sub_24B5E42F0();
  v14 = v13;
  if (a4)
  {
    a4 = (id)sub_24B5E42F0();
    v16 = v15;
    if (a5)
    {
LABEL_3:
      a5 = (id)sub_24B5E42F0();
      v18 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    v16 = 0;
    if (a5)
      goto LABEL_3;
  }
  v18 = 0;
LABEL_6:
  if (a6)
    a6 = (id)sub_24B5E4290();
  if (a7)
    a7 = (id)sub_24B5E4290();
  v19 = self;
  *(Class *)((char *)&v19->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action__rawJsonObject) = (Class)sub_24B517CAC(MEMORY[0x24BEE4AF8]);
  v20 = (uint64_t *)((char *)v19 + OBJC_IVAR____TtC14iCloudSettings6Action_type);
  *v20 = v12;
  v20[1] = v14;
  v21 = (id *)((char *)&v19->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_title);
  *v21 = a4;
  v21[1] = v16;
  v22 = (id *)((char *)&v19->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_urlString);
  *v22 = a5;
  v22[1] = v18;
  *(Class *)((char *)&v19->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_actionParameters) = (Class)a6;
  *(Class *)((char *)&v19->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_buyParameters) = (Class)a7;

  v24.receiver = v19;
  v24.super_class = (Class)type metadata accessor for Action();
  return -[Action init](&v24, sel_init);
}

- (NSString)description
{
  _TtC14iCloudSettings6Action *v2;
  void *v3;

  v2 = self;
  sub_24B5C10F8();

  v3 = (void *)sub_24B5E42C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isUpsellAction
{
  _TtC14iCloudSettings6Action *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  v3 = (void *)sub_24B5E42C0();
  v4 = _ICQActionForString();

  return ((unint64_t)(v4 - 114) < 0xE) & (0x20F1u >> (v4 - 114));
}

- (_TtC14iCloudSettings6Action)init
{
  _TtC14iCloudSettings6Action *result;

  result = (_TtC14iCloudSettings6Action *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
