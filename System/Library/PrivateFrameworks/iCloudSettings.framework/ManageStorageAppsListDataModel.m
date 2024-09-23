@implementation ManageStorageAppsListDataModel

- (NSArray)apps
{
  return (NSArray *)sub_24B51A6FC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_apps, (void (*)(void))type metadata accessor for ManageStorageApp);
}

- (NSString)genericErrorMessage
{
  return (NSString *)sub_24B51A6A0();
}

- (_TtC14iCloudSettings24ManageStorageThermometer)thermometer
{
  return (_TtC14iCloudSettings24ManageStorageThermometer *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_thermometer);
}

- (int64_t)primaryAppsSectionCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_primaryAppsSectionCount);
}

- (NSString)secondaryAppsSectionLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageAppsListDataModel.init(_:)(v3);
}

- (NSString)description
{
  _TtC14iCloudSettings30ManageStorageAppsListDataModel *v2;
  void *v3;

  v2 = self;
  sub_24B52A250();

  v3 = (void *)sub_24B5E42C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14iCloudSettings30ManageStorageAppsListDataModel)init
{
  _TtC14iCloudSettings30ManageStorageAppsListDataModel *result;

  result = (_TtC14iCloudSettings30ManageStorageAppsListDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_thermometer));
  swift_bridgeObjectRelease();
}

@end
