@implementation MTKeyProcessorPairProvider

- (MTKeyProcessorPairProvider)initWithCloudSyncBugReporter:(id)a3
{
  id v5;
  MTKeyProcessorPairProvider *v6;
  MTKeyProcessorPairProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTKeyProcessorPairProvider;
  v6 = -[MTKeyProcessorPairProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cloudSyncBugReporter, a3);

  return v7;
}

- (id)keysAndProcessorsForAllBookkeeperKeys
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForCriticalBookkeeperKeys](self, "keysAndProcessorsForCriticalBookkeeperKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForTermsVersionSync](self, "keysAndProcessorsForTermsVersionSync"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return v5;
}

- (id)keysAndProcessorsForCriticalBookkeeperKeys
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v4 = objc_msgSend(v3, "isLibrarySyncEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForSubscriptionsAndStationsSync](self, "keysAndProcessorsForSubscriptionsAndStationsSync"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForBookmarksSync](self, "keysAndProcessorsForBookmarksSync"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForNonFollowedShowsSync](self, "keysAndProcessorsForNonFollowedShowsSync"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7));

    if (+[InterestSyncProcessor canSyncInterests](_TtC8Podcasts21InterestSyncProcessor, "canSyncInterests"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider keysAndProcessorsForInterestSync](self, "keysAndProcessorsForInterestSync"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10));

      v9 = (void *)v11;
    }

  }
  else
  {
    v9 = &__NSArray0__struct;
  }
  return v9;
}

- (id)keysAndProcessorsForNonFollowedShowsSync
{
  void *v2;
  unsigned int v3;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v4;
  MTKeyProcessorPair *v5;
  MTKeyProcessorPair *v6;
  void *v7;
  MTKeyProcessorPair *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = objc_msgSend(v2, "isLibrarySyncEnabled");

  if (!v3)
    return &__NSArray0__struct;
  v4 = objc_alloc_init(_TtC8Podcasts29NonFollowedShowsSyncProcessor);
  v5 = [MTKeyProcessorPair alloc];
  v6 = -[MTKeyProcessorPair initWithKey:processor:](v5, "initWithKey:processor:", kMTNonFollowedShowsSyncKey, v4);
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (id)keysAndProcessorsForInterestSync
{
  _TtC8Podcasts21InterestSyncProcessor *v2;
  MTKeyProcessorPair *v3;
  MTKeyProcessorPair *v4;
  void *v5;
  MTKeyProcessorPair *v7;

  if (!+[InterestSyncProcessor canSyncInterests](_TtC8Podcasts21InterestSyncProcessor, "canSyncInterests"))return &__NSArray0__struct;
  v2 = objc_alloc_init(_TtC8Podcasts21InterestSyncProcessor);
  v3 = [MTKeyProcessorPair alloc];
  v4 = -[MTKeyProcessorPair initWithKey:processor:](v3, "initWithKey:processor:", kMTInterestSyncKey, v2);
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v5;
}

- (id)keysAndProcessorsForBookmarksSync
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  MTBookmarksSyncStorage *v10;
  MTBookmarksSyncProcessor *v11;
  void *v12;
  MTBookmarksSyncProcessor *v13;
  MTKeyProcessorPair *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v4 = objc_msgSend(v3, "isLibrarySyncEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider bookmarkKeyForSyncType:](self, "bookmarkKeyForSyncType:", v6));
      v10 = -[MTBookmarksSyncStorage initWithSyncType:]([MTBookmarksSyncStorage alloc], "initWithSyncType:", v6);
      v11 = [MTBookmarksSyncProcessor alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v13 = -[MTBookmarksSyncProcessor initWithStorageProvider:cloudSyncBugReporter:](v11, "initWithStorageProvider:cloudSyncBugReporter:", v10, v12);

      v14 = -[MTKeyProcessorPair initWithKey:processor:]([MTKeyProcessorPair alloc], "initWithKey:processor:", v9, v13);
      objc_msgSend(v5, "addObject:", v14);

      v7 = 0;
      v6 = 1;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (id)keysAndProcessorsForTermsVersionSync
{
  MTTermsVersionSyncProcessor *v2;
  MTTermsVersionSyncStorage *v3;
  MTTermsVersionSyncProcessor *v4;
  MTKeyProcessorPair *v5;
  MTKeyProcessorPair *v6;
  void *v7;
  MTKeyProcessorPair *v9;

  v2 = [MTTermsVersionSyncProcessor alloc];
  v3 = objc_opt_new(MTTermsVersionSyncStorage);
  v4 = -[MTTermsVersionSyncProcessor initWithStorage:](v2, "initWithStorage:", v3);

  v5 = [MTKeyProcessorPair alloc];
  v6 = -[MTKeyProcessorPair initWithKey:processor:](v5, "initWithKey:processor:", kMTTermsVersionKey, v4);
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (id)keysAndProcessorsForSubscriptionsAndStationsSync
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  MTSubscriptionSyncStorage *v11;
  MTSubscriptionSyncProcessor *v12;
  void *v13;
  MTSubscriptionSyncProcessor *v14;
  MTKeyProcessorPair *v15;
  MTPlaylistSyncProcessor *v16;
  MTPlaylistSyncStorage *v17;
  MTPlaylistSyncProcessor *v18;
  MTKeyProcessorPair *v19;
  MTKeyProcessorPair *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v4 = objc_msgSend(v3, "isLibrarySyncEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider subscriptionKeyForSyncType:](self, "subscriptionKeyForSyncType:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionSyncProcessorConfig configWithSupportsMetrics:](MTSubscriptionSyncProcessorConfig, "configWithSupportsMetrics:", 1));
      v11 = objc_opt_new(MTSubscriptionSyncStorage);
      -[MTSubscriptionSyncStorage setSyncType:](v11, "setSyncType:", v6);
      v12 = [MTSubscriptionSyncProcessor alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v14 = -[MTSubscriptionSyncProcessor initWithStorage:config:cloudSyncBugReporter:](v12, "initWithStorage:config:cloudSyncBugReporter:", v11, v10, v13);

      v15 = -[MTKeyProcessorPair initWithKey:processor:]([MTKeyProcessorPair alloc], "initWithKey:processor:", v9, v14);
      objc_msgSend(v5, "addObject:", v15);

      v7 = 0;
      v6 = 1;
    }
    while ((v8 & 1) != 0);
    v16 = [MTPlaylistSyncProcessor alloc];
    v17 = objc_opt_new(MTPlaylistSyncStorage);
    v18 = -[MTPlaylistSyncProcessor initWithStorageProvider:](v16, "initWithStorageProvider:", v17);

    v19 = [MTKeyProcessorPair alloc];
    v20 = -[MTKeyProcessorPair initWithKey:processor:](v19, "initWithKey:processor:", kMTPlaylistsKey, v18);
    objc_msgSend(v5, "addObject:", v20);

  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (id)bookmarkKeysForSyncType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider bookmarkKeyForSyncType:](self, "bookmarkKeyForSyncType:", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)bookmarkKeyForSyncType:(int64_t)a3
{
  id *v3;

  v3 = (id *)&kMTBookmarksKey;
  if (a3 == 1)
    v3 = (id *)&kMTBookmarksDRMKey;
  return *v3;
}

- (id)subscriptionKeysForSyncType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider subscriptionKeyForSyncType:](self, "subscriptionKeyForSyncType:", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)subscriptionKeyForSyncType:(int64_t)a3
{
  id *v3;

  v3 = (id *)&kMTSubscriptionsKey;
  if (a3 == 1)
    v3 = (id *)&kMTSubscriptionsV3Key;
  return *v3;
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
}

@end
