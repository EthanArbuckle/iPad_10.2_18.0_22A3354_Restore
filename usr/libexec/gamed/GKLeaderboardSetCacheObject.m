@implementation GKLeaderboardSetCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GKLeaderboardTitleMapListCacheObject *v16;
  void *v17;
  GKLeaderboardTitleMapListCacheObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  GKLeaderboardSetCacheObject *v30;
  objc_super v31;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 2080));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v31.receiver = self;
  v31.super_class = (Class)GKLeaderboardSetCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v31, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("set-name")));
  -[GKLeaderboardSetCacheObject setIdentifier:](self, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("set-group-name")));
  -[GKLeaderboardSetCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("set-title")));
  -[GKLeaderboardSetCacheObject setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  if (!v15)
  {
    v16 = [GKLeaderboardTitleMapListCacheObject alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject managedObjectContext](self, "managedObjectContext"));
    v18 = -[GKCacheObject initWithManagedObjectContext:](v16, "initWithManagedObjectContext:", v17);
    -[GKLeaderboardSetCacheObject setLeaderboardTitleMapList:](self, "setLeaderboardTitleMapList:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("set-image-urls")));
  if (v19)
    v20 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("leaderboards")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v21, "count")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "entries"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_gkMapDictionaryWithKeyPath:", CFSTR("identifier")));
  objc_msgSend(v22, "addEntriesFromDictionary:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E7154;
  v28[3] = &unk_1002C2768;
  v29 = v22;
  v30 = self;
  v27 = v22;
  objc_msgSend(v26, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v21, v28, 0);

}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKLeaderboardSetCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKLeaderboardSetCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2121));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKLeaderboardSetInternal internalRepresentation](GKLeaderboardSetInternal, "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject identifier](self, "identifier"));
  objc_msgSend(v10, "setIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v10, "setGroupIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject title](self, "title"));
  objc_msgSend(v10, "setTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_gkMapDictionaryWithKeyPath:valueKeyPath:", CFSTR("identifier"), CFSTR("localizedTitle")));
  objc_msgSend(v10, "setLeaderboardIdentifiers:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  objc_msgSend(v10, "setIcons:", v17);

  return v10;
}

+ (id)entityName
{
  return CFSTR("LeaderboardSet");
}

@end
