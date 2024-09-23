@implementation NSURL

+ (id)mt_displayURLForPodcastStoreCollectionId:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcasts://show?podcastId=%lld"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  return v4;
}

+ (id)mt_displayURLForEpisodeStoreTrackId:(int64_t)a3 inPodcastWithStoreCollectionId:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcasts://show?podcastId=%lld&episodeId=%lld"), a4, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

  return v5;
}

@end
