@implementation FeedUpdaterObjcError

+ (NSError)notYetUpdatable
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 15);
}

- (_TtC18PodcastsFoundation20FeedUpdaterObjcError)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeedUpdaterObjcError();
  return -[FeedUpdaterObjcError init](&v3, sel_init);
}

+ (NSString)domainName
{
  void *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB9848);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB9850);
  sub_1A93F8094();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSError)feedURLIsEmpty
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 7);
}

+ (NSError)localShowMissing
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 10);
}

+ (NSError)preProcessHookDeniedUpdate
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 11);
}

+ (NSError)internetNotReachable
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 13);
}

+ (NSError)feedUpdatesDisabled
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 14);
}

+ (NSError)nonSubscribableShow
{
  return (NSError *)sub_1A90692CC((uint64_t)a1, (uint64_t)a2, 16);
}

@end
