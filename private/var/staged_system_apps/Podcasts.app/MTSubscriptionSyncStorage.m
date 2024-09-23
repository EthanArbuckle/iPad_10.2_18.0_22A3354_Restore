@implementation MTSubscriptionSyncStorage

- (MTSubscriptionSyncStorage)init
{
  MTSubscriptionSyncStorage *v2;
  _TtC8Podcasts20CloudSyncBugReporter *v3;
  _TtC8Podcasts20CloudSyncBugReporter *cloudSyncBugReporter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTSubscriptionSyncStorage;
  v2 = -[MTSubscriptionSyncStorage init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = v3;

  }
  return v2;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "setPodcastsDomainVersion:", v3);

}

- (NSString)podcastsDomainVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "podcastsDomainVersion"));

  return (NSString *)v3;
}

- (void)setSyncDirtyFlag:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v5, "markSubscriptionSyncDirty:for:", v3, -[MTSubscriptionSyncStorage syncType](self, "syncType"));

}

- (BOOL)syncDirtyFlag
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  LOBYTE(self) = objc_msgSend(v3, "isSubscriptionSyncDirtyFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));

  return (char)self;
}

- (double)subscriptionsLastSyncTimestamp
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "subscriptionsLastSyncTimestampFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));
  v5 = v4;

  return v5;
}

- (void)updateSubscriptionsLastSyncTimestamp
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "updateSubscriptionsLastSyncTimestampFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));

}

- (NSString)syncVersion
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptionsSyncVersionFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType")));

  return (NSString *)v4;
}

- (void)setSyncVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v5, "updateSubscriptionsSyncVersionFor:newValue:", -[MTSubscriptionSyncStorage syncType](self, "syncType"), v4);

  -[objc_class didUpdateSubscriptionsSyncVersionForSyncType:](+[SyncControllerFactory resolvedSyncClass](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncClass"), "didUpdateSubscriptionsSyncVersionForSyncType:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));
}

+ (void)resetAllSubscriptionsSyncKeys
{
  objc_msgSend(a1, "resetForSyncType:", 0);
  objc_msgSend(a1, "resetForSyncType:", 1);
}

+ (void)resetForSyncType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "resetSubscriptionsSyncVersionFor:", a3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v5, "markSubscriptionSyncDirty:for:", 1, a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v6, "resetSubscriptionsLastSyncTimestampFor:", a3);

}

- (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5
{
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", a3, a4, a5);
}

- (void)cleanUpOldHiddenPodcasts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
  objc_msgSend(v2, "cleanUpOldHiddenPodcasts");

}

- (void)immediatelyDeleteAllHiddenPodcasts
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = os_feature_enabled_recently_unfollowed(self, a2);
  if ((_DWORD)v3)
  {
    v4 = _MTLogCategoryCloudSync(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "This device is at the same time in read-only sync mode AND is supposed to have a Recently Unfollowed feature. This is a programming error and will break Recently Unfollowed badly.", v7, 2u);
    }

    -[CloudSyncBugReporter report:userInfo:](self->_cloudSyncBugReporter, "report:userInfo:", 5, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
  objc_msgSend(v6, "immediatelyDeleteAllHiddenPodcasts");

}

- (void)enableSubscriptionOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  objc_msgSend(v7, "unsafeEnableSubscriptionOnPodcastUUID:from:context:", v6, 0, v5);

}

- (void)disableSubscriptionsWithUuids:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  objc_msgSend(v7, "disableSubscriptionsOnPodcastUUIDs:from:context:", v6, 0, v5);

}

- (id)importContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importContext"));

  return v3;
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
}

@end
