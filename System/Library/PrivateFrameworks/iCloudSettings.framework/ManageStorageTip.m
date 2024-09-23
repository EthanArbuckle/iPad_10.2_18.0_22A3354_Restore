@implementation ManageStorageTip

- (NSString)identifier
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)title
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)subTitle
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)dismissURL
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)anchor
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)sfSymbol
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_sfSymbol);
}

- (NSString)sfSymbolColor
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_sfSymbolColor);
}

- (NSArray)actions
{
  return (NSArray *)sub_24B51A6FC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_actions, (void (*)(void))type metadata accessor for ManageStorageAction);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageTip.init(_:)(v3);
}

- (BOOL)containsUpsellAction
{
  _TtC14iCloudSettings16ManageStorageTip *v2;
  char v3;

  v2 = self;
  v3 = sub_24B519888();

  return v3 & 1;
}

- (BOOL)containsFamilyAction
{
  _TtC14iCloudSettings16ManageStorageTip *v2;
  char v3;

  v2 = self;
  v3 = sub_24B519A38();

  return v3 & 1;
}

- (_TtC14iCloudSettings16ManageStorageTip)init
{
  _TtC14iCloudSettings16ManageStorageTip *result;

  result = (_TtC14iCloudSettings16ManageStorageTip *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
