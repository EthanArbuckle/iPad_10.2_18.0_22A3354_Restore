@implementation GKAchievementPointsListCacheObject

+ (id)entityName
{
  return CFSTR("AchievementPointsList");
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
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
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
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  GKAchievementPointsListCacheObject *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id obj;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3623));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v77.receiver = self;
  v77.super_class = (Class)GKAchievementPointsListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v77, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("results")));
  if (v15)
  {
    v54 = v7;
    v55 = v6;
    v53 = self;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject managedObjectContext](self, "managedObjectContext"));
    v16 = objc_msgSend(v15, "count");
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v16));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v16));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v52 = v15;
    obj = v15;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("game")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("bundle-id")));
          if (v24)
          {
            objc_msgSend(v59, "addObject:", v23);
            objc_msgSend(v17, "setObject:forKey:", v22, v24);
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v19);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForGameDescriptors:context:](GKGameCacheObject, "gamesForGameDescriptors:context:", v59, v56));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v16));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v57 = v25;
    v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v70 != v28)
            objc_enumerationMutation(v57);
          v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("game")));
          objc_msgSend(v30, "updateWithGameDescriptor:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("name")));
          if (v34)
            objc_msgSend(v30, "setName:", v34);
          objc_msgSend(v60, "setObject:forKey:", v30, v31);

        }
        v27 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v27);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v16));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "allValues"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject player](v53, "player"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameRecordCacheObject recordsForGames:playerProfile:](GKGameRecordCacheObject, "recordsForGames:playerProfile:", v36, v37));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(_QWORD *)v66 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "game"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bundleID"));

          objc_msgSend(v35, "setObject:forKey:", v44, v46);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      }
      while (v41);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject entries](v53, "entries"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_gkMapDictionaryWithKeyPath:", CFSTR("gameRecord.game.bundleID")));

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000EFC88;
    v61[3] = &unk_1002C29E0;
    v62 = v60;
    v63 = v48;
    v64 = v35;
    v49 = v35;
    v50 = v48;
    v51 = v60;
    -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](v53, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", obj, v61, 0);

    v7 = v54;
    v6 = v55;
    v15 = v52;
  }

}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKAchievementPointsEntryCacheObject, a2);
}

@end
