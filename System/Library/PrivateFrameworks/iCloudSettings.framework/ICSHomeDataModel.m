@implementation ICSHomeDataModel

- (_TtC14iCloudSettings10HeaderCard)headerCard
{
  return (_TtC14iCloudSettings10HeaderCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___ICSHomeDataModel_headerCard));
}

- (_TtC14iCloudSettings10UpsellCard)upsellCard
{
  return (_TtC14iCloudSettings10UpsellCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___ICSHomeDataModel_upsellCard));
}

- (_TtC14iCloudSettings14iCloudPlusCard)icloudPlusCard
{
  return (_TtC14iCloudSettings14iCloudPlusCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_icloudPlusCard));
}

- (_TtC14iCloudSettings14iCloudAppsCard)icloudAppsCard
{
  return (_TtC14iCloudSettings14iCloudAppsCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_icloudAppsCard));
}

- (_TtC14iCloudSettings21ManageStorageViewInfo)manageStorageViewInfo
{
  return (_TtC14iCloudSettings21ManageStorageViewInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR___ICSHomeDataModel_manageStorageViewInfo));
}

- (_TtC14iCloudSettings14BackupViewInfo)backupViewInfo
{
  return (_TtC14iCloudSettings14BackupViewInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_backupViewInfo));
}

- (_TtC14iCloudSettings6Action)preLaunchAction
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___ICSHomeDataModel_preLaunchAction));
}

- (_TtC14iCloudSettings6Action)manageSubscriptionsAction
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___ICSHomeDataModel_manageSubscriptionsAction));
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return iCloudHomeDataModel.init(_:)(v3);
}

- (NSString)description
{
  ICSHomeDataModel *v2;
  void *v3;

  v2 = self;
  iCloudHomeDataModel.description.getter();

  v3 = (void *)sub_24B5E42C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ICSHomeDataModel)init
{
  ICSHomeDataModel *result;

  result = (ICSHomeDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
