@implementation GKLeaderboardCacheObject

+ (BOOL)getIsPrereleaseFromServerRep:(id)a3
{
  return objc_msgSend(a3, "BOOLValueFromKey:defaultValue:", CFSTR("is-prerelease"), 0);
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
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
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
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char isKindOfClass;
  void *v52;
  void *v53;
  objc_super v54;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKLeaderboardCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKLeaderboardCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 3167));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v54.receiver = self;
  v54.super_class = (Class)GKLeaderboardCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v54, "updateWithServerRepresentation:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("global-alltime-info")));
  if (!v12)
    v12 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("leaderboard-id")));
  if (!v13)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("category-name")));
  if (+[GKLeaderboardCacheObject getIsPrereleaseFromServerRep:](GKLeaderboardCacheObject, "getIsPrereleaseFromServerRep:", v12))
  {
    v14 = 2;
  }
  else
  {
    v14 = 1;
  }
  -[GKLeaderboardCacheObject setReleaseState:](self, "setReleaseState:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
  v16 = objc_msgSend(v15, "isEqualToString:", v13);

  if ((v16 & 1) == 0)
  {
    -[GKLeaderboardCacheObject setIdentifier:](self, "setIdentifier:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
    if (v17
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category-title")))) != 0)
    {
      -[GKLeaderboardCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score-type")));
    if (v18)
      -[GKLeaderboardCacheObject setScoreType:](self, "setScoreType:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("base-leaderboard-id")));

    if (v19)
    {
      -[GKLeaderboardCacheObject setBaseLeaderboardID:](self, "setBaseLeaderboardID:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));

      if (!v20)
        -[GKLeaderboardCacheObject setIdentifier:](self, "setIdentifier:", v19);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
      -[GKLeaderboardCacheObject setBaseLeaderboardID:](self, "setBaseLeaderboardID:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("group-id")));

    if (v22
      || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("group-category-name")))) != 0)
    {
      -[GKLeaderboardCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v22);

    }
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type")));
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("classic");
    -[GKLeaderboardCacheObject setType:](self, "setType:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("start-date")));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v26));
      -[GKLeaderboardCacheObject setStartDate:](self, "setStartDate:", v27);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("next-start-date")));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v28));
      -[GKLeaderboardCacheObject setNextStartDate:](self, "setNextStartDate:", v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("duration")));

    if (v30)
      -[GKLeaderboardCacheObject setDuration:](self, "setDuration:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rank")));

    if (v31)
      -[GKLeaderboardCacheObject setRank:](self, "setRank:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("leaderboard-size")));

    if (v32)
      -[GKLeaderboardCacheObject setMaxRank:](self, "setMaxRank:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("friend-rank")));

    if (v33)
      -[GKLeaderboardCacheObject setFriendRank:](self, "setFriendRank:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("num-friends-ranked")));

    if (v34)
      -[GKLeaderboardCacheObject setMaxFriendRank:](self, "setMaxFriendRank:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("last-submitted")));

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v35));
      -[GKLeaderboardCacheObject setLastSubmittedDate:](self, "setLastSubmittedDate:", v36);

    }
    -[GKLeaderboardCacheObject setIsPrimary:](self, "setIsPrimary:", 1);
    -[GKLeaderboardCacheObject setPreviousInstanceLoaded:](self, "setPreviousInstanceLoaded:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject previousInstance](self, "previousInstance"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject managedObjectContext](self, "managedObjectContext"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject previousInstance](self, "previousInstance"));
      objc_msgSend(v38, "deleteObject:", v39);

    }
    -[GKLeaderboardCacheObject setPreviousInstance:](self, "setPreviousInstance:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "UUIDString"));
    -[GKLeaderboardCacheObject setRecordID:](self, "setRecordID:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("image-urls")));
    if (v42
      || (v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("category-image-urls")))) != 0)
    {
      v43 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v42);

    }
    -[GKLeaderboardCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", objc_msgSend(v12, "BOOLValueFromKey:defaultValue:", CFSTR("allow-challenges"), 0));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("activity-type")));
    -[GKLeaderboardCacheObject setActivityType:](self, "setActivityType:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("description")));
    -[GKLeaderboardCacheObject setLeaderboardDescription:](self, "setLeaderboardDescription:", v45);

    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("user-info")));
    if (v46)
    {
      v47 = (void *)v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("user-info")));
      v50 = objc_opt_class(NSDictionary, v49);
      isKindOfClass = objc_opt_isKindOfClass(v48, v50);

      if ((isKindOfClass & 1) != 0)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("user-info")));
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v52));
        -[GKLeaderboardCacheObject setUserInfo:](self, "setUserInfo:", v53);

      }
    }

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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKLeaderboardCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKLeaderboardCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 3283));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKLeaderboardInternal internalRepresentation](GKLeaderboardInternal, "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject recordID](self, "recordID"));
  objc_msgSend(v10, "setRecordID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject baseLeaderboardID](self, "baseLeaderboardID"));
  objc_msgSend(v10, "setBaseLeaderboardID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject duration](self, "duration"));
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v10, "setDuration:");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject friendRank](self, "friendRank"));
  objc_msgSend(v10, "setFriendRank:", (unsigned __int16)objc_msgSend(v14, "unsignedIntegerValue"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject maxFriendRank](self, "maxFriendRank"));
  objc_msgSend(v10, "setFriendRankCount:", (unsigned __int16)objc_msgSend(v15, "unsignedIntegerValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v10, "setGroupIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  objc_msgSend(v10, "setIcons:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
  objc_msgSend(v10, "setIdentifier:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject localizedTitle](self, "localizedTitle"));
  objc_msgSend(v10, "setLocalizedTitle:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject nextStartDate](self, "nextStartDate"));
  objc_msgSend(v10, "setNextStartDate:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject rank](self, "rank"));
  objc_msgSend(v10, "setOverallRank:", objc_msgSend(v21, "unsignedIntegerValue"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject maxRank](self, "maxRank"));
  objc_msgSend(v10, "setOverallRankCount:", objc_msgSend(v22, "unsignedIntegerValue"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject recordID](self, "recordID"));
  objc_msgSend(v10, "setRecordID:", v23);

  objc_msgSend(v10, "setReleaseState:", -[GKLeaderboardCacheObject releaseState](self, "releaseState"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject startDate](self, "startDate"));
  objc_msgSend(v10, "setStartDate:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject activityType](self, "activityType"));
  objc_msgSend(v10, "setActivityType:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject leaderboardDescription](self, "leaderboardDescription"));
  objc_msgSend(v10, "setLeaderboardDescription:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject userInfo](self, "userInfo"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject userInfo](self, "userInfo"));
    objc_msgSend(v10, "setUserInfo:", v28);

  }
  else
  {
    objc_msgSend(v10, "setUserInfo:", &__NSDictionary0__struct);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject type](self, "type"));
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("recurring"));

  objc_msgSend(v10, "setType:", v30);
  objc_msgSend(v10, "setSupportsChallenges:", -[GKLeaderboardCacheObject supportsChallenges](self, "supportsChallenges"));
  return v10;
}

+ (id)entityName
{
  return CFSTR("Leaderboard");
}

@end
