@implementation Legacy.JSPropertiesObject

- (NSString)version
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)localizations
{
  uint64_t v2;
  _TtCO10PodcastsUI6Legacy18JSPropertiesObject *v3;
  void *v4;

  v2 = *(_QWORD *)&self->manifest[OBJC_IVAR____TtCO10PodcastsUI6Legacy18JSPropertiesObject_manifest + 8];
  v3 = self;
  sub_1DA498DA0(v2);

  v4 = (void *)sub_1DA66F748();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v4;
}

- (NSDictionary)clientFeatures
{
  void *v2;

  sub_1DA4F1D74();
  v2 = (void *)sub_1DA66F748();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtCO10PodcastsUI6Legacy18JSPropertiesObject)init
{
  _TtCO10PodcastsUI6Legacy18JSPropertiesObject *result;

  result = (_TtCO10PodcastsUI6Legacy18JSPropertiesObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
