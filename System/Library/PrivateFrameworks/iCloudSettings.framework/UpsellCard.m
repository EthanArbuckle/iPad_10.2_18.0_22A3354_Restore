@implementation UpsellCard

- (NSString)title
{
  return (NSString *)sub_24B51A6A0();
}

- (NSArray)features
{
  uint64_t v2;

  return (NSArray *)sub_24B5C3A80((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings10UpsellCard_features, v2, (void (*)(uint64_t))type metadata accessor for Feature);
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings10UpsellCard_action));
}

- (id)init:(id)a3
{
  return (id)sub_24B5C1EE4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))UpsellCard.init(_:));
}

- (_TtC14iCloudSettings10UpsellCard)init
{
  _TtC14iCloudSettings10UpsellCard *result;

  result = (_TtC14iCloudSettings10UpsellCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
