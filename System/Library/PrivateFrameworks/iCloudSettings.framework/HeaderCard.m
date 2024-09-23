@implementation HeaderCard

- (BOOL)isiCloudPlusSubscriber
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_isiCloudPlusSubscriber);
}

- (NSString)storageState
{
  return (NSString *)sub_24B51A6A0();
}

- (_TtC14iCloudSettings14StorageSummary)storageSummary
{
  return (_TtC14iCloudSettings14StorageSummary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_storageSummary));
}

- (_TtC14iCloudSettings14StatefulHeader)statefulHeader
{
  return (_TtC14iCloudSettings14StatefulHeader *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_statefulHeader));
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return HeaderCard.init(_:)(v3);
}

- (_TtC14iCloudSettings10HeaderCard)init
{
  _TtC14iCloudSettings10HeaderCard *result;

  result = (_TtC14iCloudSettings10HeaderCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
