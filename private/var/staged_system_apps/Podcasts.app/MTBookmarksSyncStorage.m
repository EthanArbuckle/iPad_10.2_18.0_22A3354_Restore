@implementation MTBookmarksSyncStorage

+ (BOOL)hasBookmarksSync
{
  uint64_t v3;
  BOOL v4;
  char v5;
  char v6;
  void *v7;
  double v8;

  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (v4)
    {
      v4 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookmarksSyncVersionForSyncType:", v3));
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(a1, "lastBookmarksSyncTimestampForSyncType:", v3);
        v4 = v8 != 0.0;
      }

    }
    v5 = 0;
    v3 = 1;
  }
  while ((v6 & 1) != 0);
  return v4;
}

+ (double)lastBookmarksSyncTimestampForSyncType:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookmarksLastSyncKeyForSyncType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "doubleForKey:", v3);
  v6 = v5;

  return v6;
}

+ (id)bookmarksSyncVersionForSyncType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookmarksKeyForSyncType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", v3));

  return v5;
}

+ (id)bookmarksLastSyncKeyForSyncType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("bookmarks-drm-last-sync");
  else
    return CFSTR("bookmarks-last-sync");
}

+ (id)bookmarksKeyForSyncType:(int64_t)a3
{
  id *v3;

  v3 = (id *)&kMTBookmarksKey;
  if (a3 == 1)
    v3 = (id *)&kMTBookmarksDRMKey;
  return *v3;
}

- (MTBookmarksSyncStorage)initWithSyncType:(int64_t)a3
{
  MTBookmarksSyncStorage *v4;
  MTBookmarksSyncStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTBookmarksSyncStorage;
  v4 = -[MTBookmarksSyncStorage init](&v7, "init");
  v5 = v4;
  if (v4)
    -[MTBookmarksSyncStorage setSyncType:](v4, "setSyncType:", a3);
  return v5;
}

- (NSString)syncVersion
{
  return (NSString *)+[MTBookmarksSyncStorage bookmarksSyncVersionForSyncType:](MTBookmarksSyncStorage, "bookmarksSyncVersionForSyncType:", -[MTBookmarksSyncStorage syncType](self, "syncType"));
}

- (void)setSyncVersion:(id)a3
{
  id v4;

  v4 = a3;
  +[MTBookmarksSyncStorage setBookmarksSyncVersion:syncType:](MTBookmarksSyncStorage, "setBookmarksSyncVersion:syncType:", v4, -[MTBookmarksSyncStorage syncType](self, "syncType"));

}

- (double)lastSyncTimestamp
{
  double result;

  +[MTBookmarksSyncStorage lastBookmarksSyncTimestampForSyncType:](MTBookmarksSyncStorage, "lastBookmarksSyncTimestampForSyncType:", -[MTBookmarksSyncStorage syncType](self, "syncType"));
  return result;
}

- (void)setLastSyncTimestamp:(double)a3
{
  +[MTBookmarksSyncStorage setLastBookmarksSyncTimestamp:syncType:](MTBookmarksSyncStorage, "setLastBookmarksSyncTimestamp:syncType:", -[MTBookmarksSyncStorage syncType](self, "syncType"), a3);
}

+ (void)setBookmarksSyncVersion:(id)a3 syncType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookmarksKeyForSyncType:", a4));
  v7 = objc_msgSend(v10, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);

}

+ (void)setLastBookmarksSyncTimestamp:(double)a3 syncType:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookmarksLastSyncKeyForSyncType:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = v5;
  if (a3 <= 0.0)
    objc_msgSend(v5, "removeObjectForKey:", v7);
  else
    objc_msgSend(v5, "setDouble:forKey:", v7, a3);

}

+ (void)resetBookmarksSync
{
  void *v3;
  id v4;

  objc_msgSend(a1, "setBookmarksSyncVersion:syncType:", 0, 0);
  objc_msgSend(a1, "setLastBookmarksSyncTimestamp:syncType:", 0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "markBookmarksSyncDirty:for:", 1, 0);

  objc_msgSend(a1, "setBookmarksSyncVersion:syncType:", 0, 1);
  objc_msgSend(a1, "setLastBookmarksSyncTimestamp:syncType:", 1, 0.0);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "markBookmarksSyncDirty:for:", 1, 1);

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

- (void)setSyncDirtyFlag:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v5, "markBookmarksSyncDirty:for:", v3, self->syncType);

}

- (BOOL)syncDirtyFlag
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  LOBYTE(self) = objc_msgSend(v3, "isBookmarksSyncDirtyFor:", -[MTBookmarksSyncStorage syncType](self, "syncType"));

  return (char)self;
}

- (id)importContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importContext"));

  return v3;
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  objc_msgSend(v6, "unsafeBookmarkEpisode:onTimestamp:shouldDownloadEpisode:from:", v5, 0, 1, a4);

}

- (void)unsafeRemoveFromBookmarksEpisodes:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = _MTLogCategoryCloudSync(v6);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncStorage logPrefix](self, "logPrefix"));
          v14 = objc_msgSend(v10, "storeTrackId");
          *(_DWORD *)buf = 138412546;
          v21 = v13;
          v22 = 2048;
          v23 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Step 2: missing bookmark adam id from cloud: %lld", buf, 0x16u);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
        objc_msgSend(v15, "unsafeRemoveEpisodeFromBookmarks:from:", v10, 1);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (NSString)logPrefix
{
  if (self->syncType == 1)
    return (NSString *)CFSTR("[Bookmarks DRM Sync]");
  else
    return (NSString *)CFSTR("[Bookmarks Sync]");
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

@end
