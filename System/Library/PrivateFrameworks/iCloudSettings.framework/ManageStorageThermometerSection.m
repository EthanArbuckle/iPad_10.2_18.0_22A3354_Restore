@implementation ManageStorageThermometerSection

- (NSString)bundleId
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)displayLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (double)storagePercentage
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14iCloudSettings31ManageStorageThermometerSection_storagePercentage);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageThermometerSection.init(_:)(v3);
}

- (_TtC14iCloudSettings31ManageStorageThermometerSection)init
{
  _TtC14iCloudSettings31ManageStorageThermometerSection *result;

  result = (_TtC14iCloudSettings31ManageStorageThermometerSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
