@implementation PGSocialGroupsElector

+ (int64_t)defaultNumberOfElectedSocialGroups
{
  return 100;
}

- (id)electedSocialGroupsMaxNumberOfElectedSocialGroups:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  PGSocialGroupsElector *v8;
  void *v9;

  v7 = a4;
  v8 = self;
  SocialGroupsElector.electSocialGroups(maxNumberOfElectedSocialGroups:progressReporter:)(a3, (uint64_t)v7);

  type metadata accessor for ElectedSocialGroup();
  v9 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return v9;
}

- (PGSocialGroupsElector)init
{
  PGSocialGroupsElector *result;

  result = (PGSocialGroupsElector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
