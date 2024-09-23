@implementation AnalyticsIdentifierManager

- (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)init
{
  return (_TtC18PodcastsFoundation26AnalyticsIdentifierManager *)sub_1A90C9CD4();
}

+ (NSString)kMTResetIdentifierKey
{
  return (NSString *)(id)sub_1A93F8010();
}

+ (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)sharedInstance
{
  if (qword_1ED2A78D8 != -1)
    swift_once();
  return (_TtC18PodcastsFoundation26AnalyticsIdentifierManager *)(id)qword_1ED2A78D0;
}

- (id)identifierPromise
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise);
  swift_beginAccess();
  return *v2;
}

- (void)setIdentifierPromise:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)updateIdentifiers
{
  _TtC18PodcastsFoundation26AnalyticsIdentifierManager *v2;

  v2 = self;
  sub_1A908CD08();

}

- (void)resetIdentifiers
{
  _TtC18PodcastsFoundation26AnalyticsIdentifierManager *v2;

  v2 = self;
  sub_1A9243450();

}

- (void)resetIfNeeded
{
  _TtC18PodcastsFoundation26AnalyticsIdentifierManager *v2;

  v2 = self;
  sub_1A90C9F70();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise));
  swift_release();
}

@end
