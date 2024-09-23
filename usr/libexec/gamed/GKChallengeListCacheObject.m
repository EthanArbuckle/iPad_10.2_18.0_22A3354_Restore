@implementation GKChallengeListCacheObject

+ (id)entityName
{
  return CFSTR("ChallengeList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKChallengeCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];

  v6 = a3;
  v32 = a4;
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v12, "UTF8String"), 4423));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v40.receiver = self;
  v40.super_class = (Class)GKChallengeListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v40, "updateWithServerRepresentation:expirationDate:", v6, v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeListCacheObject managedObjectContext](self, "managedObjectContext"));
  v31 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("results")));
  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v16));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v22), "objectForKeyedSubscript:", CFSTR("challenge-id")));
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKChallengeCacheObject challengesWithChallengeIDs:context:](GKChallengeCacheObject, "challengesWithChallengeIDs:context:", v17, v14));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v16));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_gkMapDictionaryWithKeyPath:", CFSTR("challengeID")));
  objc_msgSend(v25, "addEntriesFromDictionary:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeListCacheObject player](self, "player"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "playerID"));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000F3FA8;
  v33[3] = &unk_1002C2768;
  v34 = v25;
  v35 = v28;
  v29 = v28;
  v30 = v25;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v18, v33, 0);

}

@end
