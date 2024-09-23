@implementation Legacy.JSUserObject

- (NSString)accountIdentifier
{
  return (NSString *)sub_1DA5826C0((char *)self, (uint64_t)a2, (SEL *)&selRef_username);
}

- (NSString)dsid
{
  _TtCO10PodcastsUI6Legacy12JSUserObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DA5825F0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)firstName
{
  return (NSString *)sub_1DA5826C0((char *)self, (uint64_t)a2, (SEL *)&selRef_ams_firstName);
}

- (NSString)lastName
{
  return (NSString *)sub_1DA5826C0((char *)self, (uint64_t)a2, (SEL *)&selRef_ams_lastName);
}

- (_TtCO10PodcastsUI6Legacy12JSUserObject)init
{
  _TtCO10PodcastsUI6Legacy12JSUserObject *result;

  result = (_TtCO10PodcastsUI6Legacy12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
