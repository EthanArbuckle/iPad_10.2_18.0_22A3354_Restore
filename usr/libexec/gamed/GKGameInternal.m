@implementation GKGameInternal

- (void)updateWithCacheObject:(id)a3
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
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  GKGameInternal *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf;
  _BYTE v51[15];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameInternal(Cache) updateWithCacheObject:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKGameInternal(Cache) updateWithCacheObject:]", objc_msgSend(v10, "UTF8String"), 73));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  -[GKGameInternal setBundleIdentifier:](self, "setBundleIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleVersion"));
  -[GKGameInternal setBundleVersion:](self, "setBundleVersion:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortBundleVersion"));
  -[GKGameInternal setShortBundleVersion:](self, "setShortBundleVersion:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));
  -[GKGameInternal setAdamID:](self, "setAdamID:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "externalVersion"));
  -[GKGameInternal setExternalVersion:](self, "setExternalVersion:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platform"));
  -[GKGameInternal setPlatform:](self, "setPlatform:", objc_msgSend(v17, "integerValue"));

  v49 = objc_alloc_init((Class)NSMutableSet);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatiblePlatforms"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
        v25 = objc_msgSend(v24, "length");

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
          objc_msgSend(v49, "addObject:", v26);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v20);
  }

  v46 = self;
  -[GKGameInternal setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v49);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedTransportVersions"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v27, "count")));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v47 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedTransportVersions"));
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j), "version"));
        if (objc_msgSend(v33, "isEqualToNumber:", &off_1002DB8B0)
          && (v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared")),
              v35 = objc_msgSend(v34, "fastSyncTransportEnabled"),
              v34,
              (v35 & 1) == 0))
        {
          if (!os_log_GKGeneral)
            v38 = (id)GKOSLoggers(v36);
          v39 = os_log_GKError;
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
            sub_10011D194(&buf, v51, v39);
        }
        else if (v33)
        {
          v37 = objc_msgSend(objc_alloc((Class)GKSupportedTransport), "initWithVersionNumber:", v33);
          objc_msgSend(v48, "addObject:", v37);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v30);
  }

  -[GKGameInternal setSupportedTransports:](v46, "setSupportedTransports:", v48);
  -[GKGameInternal setIsArcadeGame:](v46, "setIsArcadeGame:", objc_msgSend(v47, "isArcadeGame"));
  -[GKGameInternal setSupportsChallenges:](v46, "setSupportsChallenges:", objc_msgSend(v47, "supportsChallenges"));
  -[GKGameInternal setSupportsLeaderboardChallenges:](v46, "setSupportsLeaderboardChallenges:", objc_msgSend(v47, "supportsLeaderboardChallenges"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
  -[GKGameInternal setName:](v46, "setName:", v40);

  -[GKGameInternal setPrerendered:](v46, "setPrerendered:", objc_msgSend(v47, "prerendered"));
  if (objc_msgSend(v47, "supportsLeaderboards"))
  {
    -[GKGameInternal setSupportsLeaderboards:](v46, "setSupportsLeaderboards:", 1);
    -[GKGameInternal setHasAggregateLeaderboard:](v46, "setHasAggregateLeaderboard:", objc_msgSend(v47, "hasAggregateLeaderboard"));
    -[GKGameInternal setNumberOfLeaderboards:](v46, "setNumberOfLeaderboards:", (unsigned __int16)objc_msgSend(v47, "numberOfCategories"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "defaultCategory"));
    -[GKGameInternal setDefaultLeaderboardIdentifier:](v46, "setDefaultLeaderboardIdentifier:", v41);

  }
  if (objc_msgSend(v47, "supportsLeaderboardSets"))
  {
    -[GKGameInternal setSupportsLeaderboardSets:](v46, "setSupportsLeaderboardSets:", 1);
    -[GKGameInternal setNumberOfLeaderboardSets:](v46, "setNumberOfLeaderboardSets:", (unsigned __int16)objc_msgSend(v47, "numberOfLeaderboardSets"));
  }
  if (objc_msgSend(v47, "supportsAchievements"))
  {
    -[GKGameInternal setSupportsAchievements:](v46, "setSupportsAchievements:", 1);
    -[GKGameInternal setNumberOfAchievements:](v46, "setNumberOfAchievements:", (unsigned __int16)objc_msgSend(v47, "numberOfAchievements"));
    -[GKGameInternal setMaxAchievementPoints:](v46, "setMaxAchievementPoints:", (unsigned __int16)objc_msgSend(v47, "maxAchievementPoints"));
  }
  -[GKGameInternal setSupportsMultiplayer:](v46, "setSupportsMultiplayer:", objc_msgSend(v47, "supportsMultiplayer"));
  -[GKGameInternal setSupportsTurnBasedMultiplayer:](v46, "setSupportsTurnBasedMultiplayer:", objc_msgSend(v47, "supportsTurnBasedMultiplayer"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "imageURLDictionary"));
  -[GKGameInternal setIcons:](v46, "setIcons:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "expirationDate"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v43, "timeIntervalSinceDate:", v44);
  -[GKGameInternal setValid:](v46, "setValid:", v45 > 0.0);

}

@end
