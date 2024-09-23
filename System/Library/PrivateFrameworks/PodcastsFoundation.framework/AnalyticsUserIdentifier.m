@implementation AnalyticsUserIdentifier

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)clientId
{
  return (NSString *)sub_1A9242DC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_clientId);
}

- (NSString)userId
{
  return (NSString *)sub_1A9242DC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userId);
}

- (BOOL)userAllowsPersonalization
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userAllowsPersonalization);
}

- (BOOL)userUnder13YearsOld
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userUnder13YearsOld);
}

- (BOOL)userIsManagedAccount
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userIsManagedAccount);
}

- (_TtC18PodcastsFoundation23AnalyticsUserIdentifier)init
{
  _TtC18PodcastsFoundation23AnalyticsUserIdentifier *result;

  result = (_TtC18PodcastsFoundation23AnalyticsUserIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
