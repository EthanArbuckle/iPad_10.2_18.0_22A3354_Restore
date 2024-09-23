@implementation MTPlaylistSyncStorage

- (NSString)playlistSyncVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playlistSyncVersion"));

  return (NSString *)v3;
}

- (void)setPlaylistSyncVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  objc_msgSend(v4, "setPlaylistSyncVersion:", v3);

}

- (NSString)podcastsDomainVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "podcastsDomainVersion"));

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "setPodcastsDomainVersion:", v3);

}

- (BOOL)playlistSyncDirtyFlag
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = objc_msgSend(v2, "isPlaylistSyncDirty");

  return v3;
}

- (void)setPlaylistSyncDirtyFlag:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "setIsPlaylistSyncDirty:", v3);

}

- (id)importContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importContext"));

  return v3;
}

@end
