@implementation Legacy.JSClientObject

- (NSString)buildType
{
  void *v3;
  _TtCO10PodcastsUI6Legacy14JSClientObject *v4;
  void *v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  objc_msgSend(v3, sel_isRunningOnInternalOS);

  v5 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)deviceType
{
  void *v2;

  sub_1DA4AA4DC();
  v2 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)displayKinds
{
  _TtCO10PodcastsUI6Legacy14JSClientObject *v2;
  void *v3;

  v2 = self;
  sub_1DA66B30C((uint64_t)&unk_1EA0C6AA0);

  v3 = (void *)sub_1DA66FA90();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)guid
{
  void *v3;
  _TtCO10PodcastsUI6Legacy14JSClientObject *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_deviceGUID);
  sub_1DA66F8BC();

  v6 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)storefrontIdentifier
{
  void *v2;
  _TtCO10PodcastsUI6Legacy14JSClientObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCO10PodcastsUI6Legacy14JSClientObject_accountStore);
  v3 = self;
  v4 = objc_msgSend(v2, sel_ams_activeiTunesAccount);
  if (v4
    && (v5 = v4, v6 = objc_msgSend(v4, sel_ams_storefront), v5, v6))
  {
    sub_1DA66F8BC();

    v7 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (BOOL)isThinClient
{
  return objc_msgSend((id)objc_opt_self(), sel_supportsLocalLibrary) ^ 1;
}

- (id)analyticsIdentifiers
{
  void *v2;

  sub_1DA63CAB4(MEMORY[0x1E0DEE9D8]);
  v2 = (void *)sub_1DA66F748();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)getDefaultForKeyName:(id)a3
{
  void *v4;
  _TtCO10PodcastsUI6Legacy14JSClientObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  sub_1DA66F8BC();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel__applePodcastsFoundationSharedUserDefaults);
  v7 = (void *)sub_1DA66F88C();
  v8 = objc_msgSend(v6, sel_stringForKey_, v7);

  if (v8)
  {
    sub_1DA66F8BC();

    swift_bridgeObjectRelease();
    v9 = (void *)sub_1DA66F88C();
  }
  else
  {

    v9 = 0;
  }
  swift_bridgeObjectRelease();
  return v9;
}

- (void)setDefaultForKeyName:(id)a3 :(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtCO10PodcastsUI6Legacy14JSClientObject *v8;

  v5 = sub_1DA66F8BC();
  v7 = v6;
  sub_1DA66F8BC();
  v8 = self;
  sub_1DA66B8D8(v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtCO10PodcastsUI6Legacy14JSClientObject)init
{
  _TtCO10PodcastsUI6Legacy14JSClientObject *result;

  result = (_TtCO10PodcastsUI6Legacy14JSClientObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
