@implementation GKGameCacheObject

+ (id)uniqueAttributeName
{
  return CFSTR("bundleID");
}

+ (const)uniqueObjectIDLookupKey
{
  return CFSTR("GKGameCacheObjectUniqueObjectIDLookupKey");
}

+ (id)fetchSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("bundleID"), 1));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timeStamp"), 0));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

+ (id)gameForGameDescriptor:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForGameDescriptors:context:](GKGameCacheObject, "gamesForGameDescriptors:context:", v7, v5, v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  return v9;
}

+ (id)gameForBundleID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v15 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "gamesForBundleIDs:context:", v9, v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v7);
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000F6A74(v13);
    v11 = 0;
  }

  return v11;
}

+ (id)gamesForBundleIDs:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6B04();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gameDescriptorsWithInstalledBundleVersionsForBundleIDs:", v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject _gamesForFullGameDescriptors:context:](GKGameCacheObject, "_gamesForFullGameDescriptors:context:", v10, v7));
  return v11;
}

+ (id)gamesForGameDescriptors:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6B30();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:", v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject _gamesForFullGameDescriptors:context:](GKGameCacheObject, "_gamesForFullGameDescriptors:context:", v10, v7));
  return v11;
}

+ (id)_gamesForFullGameDescriptors:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a4;
  v7 = a3;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000E31F0;
  v25[3] = &unk_1002C25B0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
  v26 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueObjectIDLookupWithContext:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E324C;
  v21[3] = &unk_1002C25D8;
  v24 = a1;
  v11 = v6;
  v22 = v11;
  v23 = v8;
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueObjectsForKeys:context:newObject:", v10, v11, v21));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E32BC;
  v18[3] = &unk_1002C0950;
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_gkMapDictionaryWithKeyPath:", CFSTR("bundleID")));
  v20 = v11;
  v14 = v11;
  v15 = v19;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_gkMapWithBlock:", v18));

  return v16;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKGameCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject name](self, "name"));
  if (v3)
    v4 = -[GKCacheObject hasImages](self, "hasImages");
  else
    v4 = 0;

  return v4;
}

- (void)updateWithGameDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6B5C();
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameCacheObject updateWithGameDescriptor:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKGameCacheObject updateWithGameDescriptor:]", objc_msgSend(v12, "UTF8String"), 1403));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  if (v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("bundle-id")));
    if (v15)
    {
      v16 = objc_opt_class(NSString, v14);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

        v15 = (void *)v17;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("bundle-version")));
    if (v19)
    {
      v20 = objc_opt_class(NSString, v18);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));

        v19 = (void *)v21;
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("short-bundle-version")));
    if (v23)
    {
      v24 = objc_opt_class(NSString, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringValue"));

        v23 = (void *)v25;
      }
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("adam-id")));
    if (v27)
    {
      v28 = objc_opt_class(NSNumber, v26);
      if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
      {
        if ((objc_opt_respondsToSelector(v27, "longLongValue") & 1) != 0)
          v29 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v27, "longLongValue")));
        else
          v29 = 0;

        v27 = (void *)v29;
      }
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("external-version")));
    if (v31)
    {
      v32 = objc_opt_class(NSNumber, v30);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
      {
        if ((objc_opt_respondsToSelector(v31, "longLongValue") & 1) != 0)
          v33 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v31, "longLongValue")));
        else
          v33 = 0;

        v31 = (void *)v33;
      }
    }
    v34 = v31;
    if (v15)
      -[GKGameCacheObject setBundleID:](self, "setBundleID:", v15);
    v56 = v15;
    if (v27)
      -[GKGameCacheObject setAdamID:](self, "setAdamID:", v27);
    if (v19)
    {
      v35 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));
      if (!v35
        || (v36 = (void *)v35,
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion")),
            v38 = objc_msgSend(v19, "isEqualToString:", v37),
            v37,
            v36,
            (v38 & 1) == 0))
      {
        -[GKGameCacheObject setBundleVersion:](self, "setBundleVersion:", v19);
      }
    }
    if (v23)
    {
      v39 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));
      if (!v39
        || (v40 = (void *)v39,
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion")),
            v42 = objc_msgSend(v23, "isEqualToString:", v41),
            v41,
            v40,
            (v42 & 1) == 0))
      {
        -[GKGameCacheObject setShortBundleVersion:](self, "setShortBundleVersion:", v23);
      }
    }
    if (v34)
    {
      v43 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));
      if (!v43
        || (v44 = (void *)v43,
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion")),
            v46 = objc_msgSend(v34, "isEqualToNumber:", v45),
            v45,
            v44,
            (v46 & 1) == 0))
      {
        -[GKGameCacheObject setExternalVersion:](self, "setExternalVersion:", v34);
      }
    }
    v55 = v19;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("platform")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:](GKGameDescriptor, "gamePlatformFromServerGameDescriptorString:", v47)));
    -[GKGameCacheObject setPlatform:](self, "setPlatform:", v48);
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("is-arcade-game")));
    v50 = (void *)v49;
    if (v49 && (objc_opt_respondsToSelector(v49, "BOOLValue") & 1) != 0)
      -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", objc_msgSend(v50, "BOOLValue"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils constructCompatiblePlatforms:moc:](GKCachingUtils, "constructCompatiblePlatforms:moc:", v5, v51));
    -[GKGameCacheObject setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils constructSupportedTransports:moc:](GKCachingUtils, "constructSupportedTransports:moc:", v5, v53));
    -[GKGameCacheObject setSupportedTransportVersions:](self, "setSupportedTransportVersions:", v54);

  }
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  void *v51;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F67F4();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v15, "UTF8String"), 1485));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject expirationDate](self, "expirationDate"));
  v50.receiver = self;
  v50.super_class = (Class)GKGameCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v50, "updateWithServerRepresentation:expirationDate:", v6, v8);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("game")));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v51 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

    -[GKGameCacheObject updateWithGameDescriptor:](self, "updateWithGameDescriptor:", v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("software-type")));
  -[GKGameCacheObject setSoftwareType:](self, "setSoftwareType:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("name")));

  -[GKGameCacheObject setName:](self, "setName:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("is-prerendered")));

  -[GKGameCacheObject setPrerendered:](self, "setPrerendered:", objc_msgSend(v25, "BOOLValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("supports-leaderboards")));

  -[GKGameCacheObject setSupportsLeaderboards:](self, "setSupportsLeaderboards:", objc_msgSend(v26, "BOOLValue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("has-aggregate-leaderboard")));

  -[GKGameCacheObject setHasAggregateLeaderboard:](self, "setHasAggregateLeaderboard:", objc_msgSend(v27, "BOOLValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("num-leaderboard-categories")));

  -[GKGameCacheObject setNumberOfCategories:](self, "setNumberOfCategories:", objc_msgSend(v28, "integerValue"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("num-leaderboard-sets")));

  -[GKGameCacheObject setNumberOfLeaderboardSets:](self, "setNumberOfLeaderboardSets:", objc_msgSend(v29, "integerValue"));
  -[GKGameCacheObject setSupportsLeaderboardSets:](self, "setSupportsLeaderboardSets:", -[GKGameCacheObject numberOfLeaderboardSets](self, "numberOfLeaderboardSets") != 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("default-leaderboard-category")));

  -[GKGameCacheObject setDefaultCategory:](self, "setDefaultCategory:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("supports-achievements")));

  -[GKGameCacheObject setSupportsAchievements:](self, "setSupportsAchievements:", objc_msgSend(v31, "BOOLValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("max-achievements")));

  -[GKGameCacheObject setNumberOfAchievements:](self, "setNumberOfAchievements:", objc_msgSend(v32, "integerValue"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("supports-multi-player")));

  -[GKGameCacheObject setSupportsMultiplayer:](self, "setSupportsMultiplayer:", objc_msgSend(v33, "BOOLValue"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("supports-turn-based-multi-player")));

  -[GKGameCacheObject setSupportsTurnBasedMultiplayer:](self, "setSupportsTurnBasedMultiplayer:", objc_msgSend(v34, "BOOLValue"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("max-achievements-score")));

  -[GKGameCacheObject setMaxAchievementPoints:](self, "setMaxAchievementPoints:", objc_msgSend(v35, "integerValue"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("adam-id")));

  if (v36)
    -[GKGameCacheObject setAdamID:](self, "setAdamID:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("is-arcade-game")));

  -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", objc_msgSend(v37, "BOOLValue"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("allow-challenges")));

  if (objc_msgSend(v38, "BOOLValue"))
  {
    -[GKGameCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", 1);
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    -[GKGameCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", objc_msgSend(v39, "supportsChallenges"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("allow-leaderboard-challenges")));

  if (v40)
  {
    v42 = objc_opt_class(NSNumber, v41);
    if ((objc_opt_isKindOfClass(v40, v42) & 1) != 0)
      -[GKGameCacheObject setSupportsLeaderboardChallenges:](self, "setSupportsLeaderboardChallenges:", objc_msgSend(v40, "BOOLValue"));
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("image-urls")));

  if (v43)
    v44 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils constructCompatiblePlatforms:moc:](GKCachingUtils, "constructCompatiblePlatforms:moc:", v6, v45));
  -[GKGameCacheObject setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("supported-transports")));
  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils constructSupportedTransports:moc:](GKCachingUtils, "constructSupportedTransports:moc:", v6, v48));
    -[GKGameCacheObject setSupportedTransportVersions:](self, "setSupportedTransportVersions:", v49);

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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKGameCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 1571));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  return +[GKGameInternal internalRepresentationForCacheObject:](GKGameInternal, "internalRepresentationForCacheObject:", self);
}

- (id)leaderboardSetWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("list.game = %@ && identifier = %@"), self, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheObject firstObjectMatchingPredicate:context:](GKLeaderboardSetCacheObject, "firstObjectMatchingPredicate:context:", v4, v5));

  return v6;
}

- (id)gameDescriptor
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameCacheObject gameDescriptor]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKGameCacheObject gameDescriptor]", objc_msgSend(v8, "UTF8String"), 1582));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleID](self, "bundleID"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleID](self, "bundleID"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("bundle-id"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));
    objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("bundle-version"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));
    objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("short-bundle-version"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject adamID](self, "adamID"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject adamID](self, "adamID"));
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("adam-id"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));
    objc_msgSend(v10, "setObject:forKey:", v20, CFSTR("external-version"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject platform](self, "platform"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", objc_msgSend(v21, "integerValue")));

  if (v22)
    objc_msgSend(v10, "setObject:forKey:", v22, CFSTR("platform"));

  return v10;
}

+ (id)entityName
{
  return CFSTR("Game");
}

@end
