@implementation GKGameListCacheObject

+ (id)entityName
{
  return CFSTR("GameList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKGameListEntryCacheObject, a2);
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
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  GKGameListCacheObject *v55;
  id v56;
  id v57;
  id obj;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3034));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v74.receiver = self;
  v74.super_class = (Class)GKGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v74, "updateWithServerRepresentation:expirationDate:", v6, v7);
  if (v6)
  {
    v53 = v7;
    v55 = self;
    v15 = objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject managedObjectContext](self, "managedObjectContext"));
    v54 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results")));
    v17 = objc_msgSend(v16, "count");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v17));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v17));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v16;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("game")));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bundle-id")));
          if (v25)
          {
            objc_msgSend(v59, "addObject:", v24);
            objc_msgSend(v18, "setObject:forKey:", v23, v25);
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
      }
      while (v20);
    }

    v52 = (void *)v15;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v57 = (id)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForGameDescriptors:context:](GKGameCacheObject, "gamesForGameDescriptors:context:", v59, v15));
    v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v67 != v28)
            objc_enumerationMutation(v57);
          v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("name")));
          if (v33)
            objc_msgSend(v30, "setName:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("software-type")));
          if (v34)
            objc_msgSend(v30, "setSoftwareType:", v34);

        }
        v27 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v27);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject entries](v55, "entries"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_gkMapDictionaryWithKeyPath:", CFSTR("bundleID")));

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000ECA94;
    v64[3] = &unk_1002C27F8;
    v37 = v36;
    v65 = v37;
    -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](v55, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", obj, v64, 0);
    v38 = objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject player](v55, "player"));
    v39 = (void *)v38;
    if (v38)
    {
      v50 = (void *)v38;
      v51 = v37;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v56 = (id)objc_claimAutoreleasedReturnValue(+[GKGameRecordCacheObject recordsForGames:playerProfile:](GKGameRecordCacheObject, "recordsForGames:playerProfile:", v57, v38));
      v40 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v61;
        do
        {
          for (k = 0; k != v41; k = (char *)k + 1)
          {
            if (*(_QWORD *)v61 != v42)
              objc_enumerationMutation(v56);
            v44 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "game"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bundleID"));

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v46));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("timestamp")));
            if (v48)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v48));
              objc_msgSend(v44, "setLastPlayedDate:", v49);

            }
          }
          v41 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        }
        while (v41);
      }

      v39 = v50;
      v37 = v51;
    }

    v7 = v53;
    v6 = v54;
  }

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

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKGameListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 3108));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  return -[GKGameListCacheObject internalRepresentationIncludingInstalledGames:](self, "internalRepresentationIncludingInstalledGames:", 0);
}

- (id)internalRepresentationIncludingInstalledGames:(BOOL)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
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

  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]", objc_msgSend(v9, "UTF8String"), 3115));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_gkValuesForKeyPath:", CFSTR("bundleID")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID IN %@"), v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject player](self, "player"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "gameRecords"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredSetUsingPredicate:", v13));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 0, &stru_1002C2860));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_gkValuesForKeyPath:", CFSTR("internalRepresentation")));
  return v20;
}

@end
