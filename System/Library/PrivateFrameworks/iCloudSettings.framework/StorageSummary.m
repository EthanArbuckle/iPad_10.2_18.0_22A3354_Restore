@implementation StorageSummary

- (NSString)subscriptionLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)storageBarLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)storageBarColor
{
  return (NSString *)sub_24B51A6A0();
}

- (unint64_t)totalStorageInBytes
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_totalStorageInBytes);
}

- (unint64_t)usedStorageInBytes
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_usedStorageInBytes);
}

- (NSString)usageLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_action));
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return StorageSummary.init(_:)(v3);
}

- (_TtC14iCloudSettings14StorageSummary)init
{
  _TtC14iCloudSettings14StorageSummary *result;

  result = (_TtC14iCloudSettings14StorageSummary *)_swift_stdlib_reportUnimplementedInitializer();
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
