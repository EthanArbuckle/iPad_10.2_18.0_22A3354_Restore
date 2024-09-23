@implementation iCloudApp

- (NSString)dataclass
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)subtitle
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)iTunesItemId
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings9iCloudApp_iTunesItemId);
}

- (_TtC14iCloudSettings5Icons)icons
{
  return (_TtC14iCloudSettings5Icons *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC14iCloudSettings9iCloudApp_icons));
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return iCloudApp.init(_:)(v3);
}

- (_TtC14iCloudSettings9iCloudApp)init
{
  _TtC14iCloudSettings9iCloudApp *result;

  result = (_TtC14iCloudSettings9iCloudApp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
