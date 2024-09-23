@implementation PFBugReport

- (NSString)domainString
{
  return (NSString *)(id)sub_1A93F8010();
}

- (NSString)systemString
{
  void *v2;

  PodcastsSystem.rawValue.getter();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)errorKindString
{
  void *v2;

  sub_1A924E9E4();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)forceSubmissionAttempt
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PFBugReport_forceSubmissionAttempt);
}

- (NSString)signature
{
  PFBugReport *v2;
  void *v3;

  v2 = self;
  sub_1A924ECF8();

  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFBugReport)init
{
  PFBugReport *result;

  result = (PFBugReport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
