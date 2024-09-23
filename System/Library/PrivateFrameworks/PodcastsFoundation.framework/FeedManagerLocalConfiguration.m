@implementation FeedManagerLocalConfiguration

+ (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)platformSpecificConfiguration
{
  uint64_t *v2;

  if (objc_msgSend((id)objc_opt_self(), sel_isRunningOnHomepod))
  {
    if (qword_1EEAB6CD0 != -1)
      swift_once();
    v2 = &qword_1EEAB86A8;
  }
  else
  {
    if (qword_1ED2A7EB8 != -1)
      swift_once();
    v2 = &qword_1ED2A7EB0;
  }
  return (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)(id)*v2;
}

- (BOOL)keepsFeedFileInTempDirAfterDownload
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_keepsFeedFileInTempDirAfterDownload);
}

- (BOOL)workQueueConcurrent
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration__workQueueConcurrent);
}

- (double)timeoutIntervalForResource
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_timeoutIntervalForResource);
}

- (int64_t)concurrentDeltaUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentDeltaUpdateLimit);
}

- (int64_t)concurrentBootstrapUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentBootstrapUpdateLimit);
}

- (int64_t)concurrentRSSUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentRSSUpdateLimit);
}

- (BOOL)useBackgroundFetchForFeedDownloads
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_useBackgroundFetchForFeedDownloads);
}

- (BOOL)usesCleanEpisodeTitles
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_usesCleanEpisodeTitles);
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)init
{
  _TtC18PodcastsFoundation29FeedManagerLocalConfiguration *result;

  result = (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)supportsBatchInsertion
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration__supportsBatchInsertion);
}

@end
