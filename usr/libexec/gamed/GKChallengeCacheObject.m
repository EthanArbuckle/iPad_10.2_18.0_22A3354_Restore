@implementation GKChallengeCacheObject

+ (id)uniqueAttributeName
{
  return CFSTR("challengeID");
}

+ (const)uniqueObjectIDLookupKey
{
  return CFSTR("GKChallengeCacheObjectUniqueObjectIDLookupKey");
}

+ (id)challengesWithChallengeIDs:(id)a3 context:(id)a4
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
  void *v16;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKChallengeCacheObject challengesWithChallengeIDs:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKChallengeCacheObject challengesWithChallengeIDs:context:]", objc_msgSend(v13, "UTF8String"), 4482));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueObjectIDLookupWithContext:", v7));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueObjectsForKeys:context:newObject:", v6, v7, 0));

  return v16;
}

+ (id)challengeWithServerRepresentation:(id)a3 context:(id)a4
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKChallengeCacheObject challengeWithServerRepresentation:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKChallengeCacheObject challengeWithServerRepresentation:context:]", objc_msgSend(v13, "UTF8String"), 4488));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueObjectIDLookupWithContext:", v7));
  v23 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000F4434;
  v21[3] = &unk_1002C2AB8;
  v22 = v7;
  v17 = v7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "insertObjectsForServerRepresentations:context:newObject:", v16, v17, v21));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
  return v19;
}

+ (id)fetchSortDescriptors
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("issueDate"), 0));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (Class)classForInternalRepresentation
{
  return 0;
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKChallengeCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKChallengeCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 4523));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v11 = objc_opt_class(self, v10);
  if (v11 != objc_opt_class(GKChallengeCacheObject, v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class internalRepresentation](-[GKChallengeCacheObject classForInternalRepresentation](self, "classForInternalRepresentation"), "internalRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject bundleID](self, "bundleID"));
    objc_msgSend(v13, "setBundleID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject issuingPlayerID](self, "issuingPlayerID"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentation](GKPlayerInternal, "internalRepresentation"));
      objc_msgSend(v16, "setPlayerID:", v15);
      objc_msgSend(v13, "setIssuingPlayer:", v16);

    }
    v17 = objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject receivingPlayerID](self, "receivingPlayerID"));
    if (v17)
    {
      v18 = (void *)v17;

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject selfPlayerID](GKPlayerProfileCacheObject, "selfPlayerID"));

      if (!v18)
      {
LABEL_11:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject issueDate](self, "issueDate"));
        objc_msgSend(v13, "setIssueDate:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject completionDate](self, "completionDate"));
        objc_msgSend(v13, "setCompletionDate:", v21);

        objc_msgSend(v13, "setState:", -[GKChallengeCacheObject state](self, "state"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject challengeID](self, "challengeID"));
        objc_msgSend(v13, "setChallengeID:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject message](self, "message"));
        objc_msgSend(v13, "setMessage:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKeyPath:", CFSTR("bundleID")));
        objc_msgSend(v13, "setCompatibleBundleIDs:", v25);

        return v13;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentation](GKPlayerInternal, "internalRepresentation"));
    objc_msgSend(v19, "setPlayerID:", v18);
    objc_msgSend(v13, "setReceivingPlayer:", v19);

    goto LABEL_11;
  }
  v13 = 0;
  return v13;
}

- (id)orderedSetOfCompatibleBundleIDs
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKChallengeCacheObject orderedSetOfCompatibleBundleIDs]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKChallengeCacheObject orderedSetOfCompatibleBundleIDs]", objc_msgSend(v8, "UTF8String"), 4560));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc((Class)NSMutableOrderedSet);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v19), "bundleID"));
          objc_msgSend(v14, "addObject:", v20);

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  GKChallengeCompatibleBundleID *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKChallengeCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKChallengeCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 4573));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v40.receiver = self;
  v40.super_class = (Class)GKChallengeCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v40, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject managedObjectContext](self, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("challenge-id")));
  -[GKChallengeCacheObject setChallengeID:](self, "setChallengeID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("issue-timestamp")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v14));
  -[GKChallengeCacheObject setIssueDate:](self, "setIssueDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("message")));
  if (v16)
    -[GKChallengeCacheObject setMessage:](self, "setMessage:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("issuing-player-id")));

  if (v17)
    -[GKChallengeCacheObject setIssuingPlayerID:](self, "setIssuingPlayerID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("receiving-player-id")));

  if (v18)
    -[GKChallengeCacheObject setReceivingPlayerID:](self, "setReceivingPlayerID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id")));

  if (v19)
    -[GKChallengeCacheObject setBundleID:](self, "setBundleID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("completion-timestamp")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v20));

  if (v21)
    -[GKChallengeCacheObject setCompletionDate:](self, "setCompletionDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("completion-status")));

  if (v22)
    -[GKChallengeCacheObject setState:](self, "setState:", objc_msgSend(v22, "unsignedIntValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("compatible-games")));
  if (v23)
  {
    v34 = v22;
    v35 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    v25 = objc_msgSend(v24, "mutableCopy");

    if (!v25)
      v25 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v23, "count"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v23;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v37;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v30);
          v32 = (GKChallengeCompatibleBundleID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
          if (!v32)
          {
            v32 = -[GKCacheObject initWithManagedObjectContext:]([GKChallengeCompatibleBundleID alloc], "initWithManagedObjectContext:", v12);
            -[GKChallengeCompatibleBundleID setChallenge:](v32, "setChallenge:", self);
          }
          -[GKChallengeCompatibleBundleID setBundleID:](v32, "setBundleID:", v31);
          objc_msgSend(v25, "removeObject:", v32);

          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v28);
    }

    objc_msgSend(v12, "_gkDeleteObjects:", v25);
    v22 = v34;
    v4 = v35;
    v23 = v33;
  }

}

+ (id)entityName
{
  return CFSTR("Challenge");
}

- (BOOL)hasDetails
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKChallengeCacheObject hasDetails]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKChallengeCacheObject hasDetails]", objc_msgSend(v8, "UTF8String"), 4635));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject detailsExpirationDate](self, "detailsExpirationDate"));
  v11 = v10 != 0;

  return v11;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengeCacheObject;
  -[GKCacheObject invalidate](&v3, "invalidate");
  -[GKChallengeCacheObject setDetailsExpirationDate:](self, "setDetailsExpirationDate:", 0);
}

@end
