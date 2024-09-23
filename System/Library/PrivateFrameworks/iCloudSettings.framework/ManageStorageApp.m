@implementation ManageStorageApp

- (NSString)label
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)detailLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)detailLabelColor
{
  return (NSString *)sub_24B51A6A0();
}

- (NSArray)bundleIds
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_24B5E4374();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)fetchLocally
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_fetchLocally);
}

- (BOOL)applySystemStyle
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_applySystemStyle);
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)iconUrls
{
  return (_TtC14iCloudSettings23ManageStorageAppIconURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_iconUrls));
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)detailViewIconUrls
{
  return (_TtC14iCloudSettings23ManageStorageAppIconURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_detailViewIconUrls));
}

- (_TtC14iCloudSettings19ManageStorageAction)action
{
  return (_TtC14iCloudSettings19ManageStorageAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_action));
}

- (NSString)thermometerUsageLabel
{
  return (NSString *)sub_24B51A6A0();
}

- (BOOL)showInAppList
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_showInAppList);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageApp.init(_:)(v3);
}

- (_TtC14iCloudSettings16ManageStorageApp)init
{
  _TtC14iCloudSettings16ManageStorageApp *result;

  result = (_TtC14iCloudSettings16ManageStorageApp *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_24B4F1BBC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_category), *(_QWORD *)&self->label[OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_category]);
}

@end
