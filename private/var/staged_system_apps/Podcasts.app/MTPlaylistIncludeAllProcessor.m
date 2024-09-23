@implementation MTPlaylistIncludeAllProcessor

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  if (objc_msgSend(a4, "count", a3))
    -[MTBaseProcessor results:](self, "results:", &stru_1004A9470);
}

- (id)predicate
{
  return +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

@end
