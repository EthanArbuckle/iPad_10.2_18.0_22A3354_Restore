@implementation GKFriendRecommendationListCacheObject

+ (id)entityName
{
  return CFSTR("FriendRecommendationList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKFriendRecommendationListEntryCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  _QWORD v24[4];
  id v25;
  id v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 2799));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v27.receiver = self;
  v27.super_class = (Class)GKFriendRecommendationListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v27, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recommendations")));
  v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v15, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000EAFEC;
  v24[3] = &unk_1002C2768;
  v19 = v16;
  v25 = v19;
  v20 = v18;
  v26 = v20;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, v24, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject player](self, "player"));
  v23 = objc_msgSend(v22, "isLocalPlayer");

  if (v23)
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:](GKPlayerProfileCacheObject, "setFamiliarPlayerIDs:familiarity:", v21, 4);
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:](self, "populateFriendNamesFromServerRepresentationDictionary:", v19);

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
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRecommendationListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendRecommendationListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2838));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  v11 = objc_msgSend(v10, "count");

  v32 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
  v12 = objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject managedObjectContext](self, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v31 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v13, v12));

  v30 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "playerID"));
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v22));
          if (objc_msgSend(v23, "familiarity") == 4)
          {
            v24 = objc_msgSend(objc_alloc((Class)GKFriendRecommendationInternal), "initWithCacheObject:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "reason"));
            objc_msgSend(v24, "setReason:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "reason2"));
            objc_msgSend(v24, "setReason2:", v26);

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rid"));
            objc_msgSend(v24, "setRid:", objc_msgSend(v27, "unsignedIntegerValue"));

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "source"));
            objc_msgSend(v24, "setSource:", objc_msgSend(v28, "integerValue"));

            objc_msgSend(v32, "addObject:", v24);
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  return v32;
}

@end
