@implementation NewsUserProfileShim

- (NSSet)purchasedTagIDs
{
  uint64_t v2;
  void *v3;

  v2 = sub_1ABF2FF5C();
  sub_1ABD22CD8(v2);
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1ABF31B10();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (FCBundleSubscription)bundleSubscription
{
  return (FCBundleSubscription *)objc_retainAutoreleaseReturnValue(*(id *)&self->userProfile[OBJC_IVAR____TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim_userProfile
                                                                                           + 24]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->userProfile[OBJC_IVAR____TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim_userProfile
                                       + 24]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim)init
{
  _TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim *result;

  result = (_TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  void (**v4)(const void *);
  void (**v5)(const void *);
  void (*v6)(const void *);
  _TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim *v7;

  v4 = (void (**)(const void *))_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = v4[2];
    v7 = self;
    v6(v5);
    _Block_release(v5);

  }
}

@end
