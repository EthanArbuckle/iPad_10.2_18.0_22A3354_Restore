@implementation GKGameStatServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x100000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameStatServicePrivateInterface, a2);
}

+ (id)filterUnreportedAndHiddenAchievements:(id)a3 includeUnreported:(BOOL)a4 includeHidden:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  BOOL v16;
  BOOL v17;

  v7 = a3;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10006CC74;
  v14 = &unk_1002BF480;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = a4;
  v17 = a5;
  v8 = v15;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v11);

  v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
  return v9;
}

- (void)loadAchievementsForGameWithProfileFetchOptions:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 profileFetchOptions:(unint64_t)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;

  v14 = a3;
  v15 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006CE84;
  v19[3] = &unk_1002BF5E8;
  v19[4] = self;
  v20 = v14;
  v24 = a5;
  v25 = a6;
  v22 = a8;
  v23 = a7;
  v21 = v15;
  v16 = v22;
  v17 = v15;
  v18 = v14;
  -[GKGameStatService getAchievementsForGameDescriptor:players:handler:](self, "getAchievementsForGameDescriptor:players:handler:", v18, v17, v19);

}

- (void)getEntriesForLeaderboard:(id)a3 fetchOptions:(unint64_t)a4 gameDescriptor:(id)a5 localPlayer:(id)a6 playerScope:(int64_t)a7 timeScope:(int64_t)a8 range:(_NSRange)a9 players:(id)a10 handler:(id)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  int64_t v42;
  int64_t v43;
  _NSRange v44;
  unint64_t v45;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a10;
  v18 = a11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2840, "-[GKGameStatServicePrivate getEntriesForLeaderboard:fetchOptions:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10006D798;
  v36[3] = &unk_1002BF638;
  v36[4] = self;
  v37 = v14;
  v38 = v15;
  v39 = v16;
  v43 = a8;
  v44 = a9;
  v42 = a7;
  v40 = v17;
  v21 = v20;
  v41 = v21;
  v45 = a4;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  objc_msgSend(v21, "perform:", v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10006DA34;
  v33[3] = &unk_1002BB450;
  v34 = v21;
  v35 = v18;
  v28 = v21;
  v29 = v18;
  objc_msgSend(v28, "notifyOnQueue:block:", v27, v33);

}

- (void)getAchievementLeaderboardForRequest:(id)a3 handler:(id)a4
{
  -[GKGameStatService getLeaderboardForRequest:handler:](self, "getLeaderboardForRequest:handler:", a3, a4);
}

- (void)getHypotheticalLeaderboardRanksForScores:(id)a3 forGameDescriptor:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  GKGameStatServicePrivate *v18;
  id v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v9)
    {
      if (objc_msgSend(v8, "count"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKGameServicePrivate, "serviceFromService:", self));
        v20 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10006DCB0;
        v15[3] = &unk_1002BF688;
        v19 = v10;
        v16 = v8;
        v17 = v9;
        v18 = self;
        objc_msgSend(v12, "getGameStatsForPlayer:bundleIDs:handler:", 0, v13, v15);

      }
      else
      {
        (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, &__NSArray0__struct, 0);
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

    }
  }

}

- (id)ensureGameObjectsForDescriptors:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_gkMapWithBlock:", &stru_1002BF6A8));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForBundleIDs:context:](GKGameCacheObject, "gamesForBundleIDs:context:", v7, v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006E0EC;
  v11[3] = &unk_1002BF6D0;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  return v8;
}

- (id)ensureGameObject:(id)a3 gameDescriptor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  GKGameCacheObject *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle-id")));
  v8 = (GKGameCacheObject *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gameForBundleID:context:](GKGameCacheObject, "gameForBundleID:context:", v7, v5));
  if (v8
    || (v8 = -[GKCacheObject initWithManagedObjectContext:]([GKGameCacheObject alloc], "initWithManagedObjectContext:", v5), -[GKGameCacheObject setBundleID:](v8, "setBundleID:", v7), v8))
  {
    -[GKGameCacheObject updateWithGameDescriptor:](v8, "updateWithGameDescriptor:", v6);
  }

  return v8;
}

- (void)loadGamesFriendsPlayed:(id)a3 matchingBundleIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v12 = GKBagKeyGamesFriendsPlayed;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006E308;
  v16[3] = &unk_1002BF768;
  v17 = v8;
  v18 = v9;
  v16[4] = self;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "issueRequest:bagKey:clientProxy:handler:", v10, v12, v13, v16);

}

+ (id)currentFriendsPlayedList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  void *v21;
  uint64_t i;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  void *v28;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FriendsPlayedGameList _gkFetchRequest](FriendsPlayedGameList, "_gkFetchRequest"));
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26));
  v6 = v26;
  v7 = v6;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v6);
    v9 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    v10 = "Could not fetch data from cache: %@";
    v11 = v9;
    v12 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v15 = objc_msgSend(v5, "count");
  v16 = (uint64_t)v15;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v15);
  v18 = (void *)os_log_GKDaemon;
  v19 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v19)
  {
    v20 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "currentCacheCount: %@", buf, 0xCu);

  }
  if (!v16)
  {
    if (!os_log_GKGeneral)
      v24 = (id)GKOSLoggers(v19);
    v25 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v10 = "No gameFriendsPlayed data in cache, hitting server";
    v11 = v25;
    v12 = 2;
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  if (v16 >= 2)
  {
    for (i = 1; i != v16; ++i)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
      objc_msgSend(v3, "deleteObject:", v23);

    }
  }
LABEL_8:

  return v13;
}

- (void)expireGamesFriendsPlayed
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring games friends played", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 3110, "-[GKGameStatServicePrivate expireGamesFriendsPlayed]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate currentLocalPlayer](self, "currentLocalPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v5, v7));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006F308;
  v9[3] = &unk_1002BCCF0;
  v9[4] = self;
  objc_msgSend(v8, "performOnManagedObjectContext:", v9);

}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 withinSecs:(int64_t)a5 matchingBundleIDs:(id)a6 handler:(id)a7
{
  -[GKGameStatServicePrivate getGamesFriendsPlayed:type:fetchOptions:withinSecs:matchingBundleIDs:handler:](self, "getGamesFriendsPlayed:type:fetchOptions:withinSecs:matchingBundleIDs:handler:", a3, a4, 0, a5, a6, a7);
}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 fetchOptions:(unint64_t)a5 withinSecs:(int64_t)a6 matchingBundleIDs:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  GKGameStatServicePrivate *v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate currentLocalPlayer](self, "currentLocalPlayer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKFriendServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v18, v17));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006F550;
  v24[3] = &unk_1002BF7B8;
  v29 = v16;
  v30 = a3;
  v25 = v14;
  v26 = self;
  v27 = v17;
  v28 = v15;
  v31 = a6;
  v32 = a5;
  v20 = v15;
  v21 = v17;
  v22 = v14;
  v23 = v16;
  objc_msgSend(v19, "getFriendsForPlayer:commonFriends:handler:", v21, 0, v24);

}

- (id)getCachedAcievementListForLocalPlayer:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:](GKPlayerProfileCacheObject, "localPlayerInManagedObjectContext:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gameForBundleID:context:](GKGameCacheObject, "gameForBundleID:context:", v6, v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "achievementLists"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "achievementLists"));
  objc_msgSend(v10, "intersectSet:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
  return v12;
}

- (id)findAchievementInternal:(id)a3 identifier:(id)a4 context:(id)a5 existingPercent:(double)a6 existingDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  float v43;
  double v44;
  float v45;
  void *v46;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheObject fetchRequestForContext:](GKAchievementDescriptionListCacheObject, "fetchRequestForContext:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID == %@"), v12));
  objc_msgSend(v16, "setPredicate:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeFetchRequest:error:", v16, 0));
  if (!objc_msgSend(v18, "count"))
  {
    v30 = 0;
    goto LABEL_35;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate getCachedAcievementListForLocalPlayer:context:](self, "getCachedAcievementListForLocalPlayer:context:", v12, v14));
  v51 = v12;
  v52 = v15;
  v50 = v16;
  v53 = v19;
  v54 = v18;
  if (v19)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entries"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
          v28 = objc_msgSend(v27, "isEqualToString:", v13);

          if (v28)
          {
            v29 = v26;

            v23 = v29;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v22);

      if (v23)
        goto LABEL_18;
    }
    else
    {

    }
    objc_msgSend(v53, "expire");
  }
  v23 = 0;
LABEL_18:
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", 0));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "entries"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v33)
  {
    v34 = v33;
    v48 = v31;
    v49 = v14;
    v35 = 0;
    v36 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
        v40 = objc_msgSend(v39, "isEqualToString:", v13);

        if (v40)
        {
          v41 = v38;

          v35 = v41;
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v34);

    if (v35)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "internalRepresentation"));
      objc_msgSend(v23, "percentComplete");
      v44 = v43;
      v14 = v49;
      if (v44 >= a6)
      {
        objc_msgSend(v23, "percentComplete");
        objc_msgSend(v42, "setPercentComplete:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastReportedDate"));
        objc_msgSend(v42, "setLastReportedDate:", v46);

      }
      else
      {
        *(float *)&v44 = a6;
        objc_msgSend(v23, "setPercentComplete:", v44);
        objc_msgSend(v23, "setLastReportedDate:", v52);
        objc_msgSend(v42, "setPercentComplete:", a6);
        objc_msgSend(v42, "setLastReportedDate:", v52);
      }
      v31 = v48;
      v30 = v42;
    }
    else
    {
      v30 = 0;
      v31 = v48;
      v14 = v49;
    }
  }
  else
  {

    v35 = 0;
    v30 = 0;
  }

  v12 = v51;
  v15 = v52;
  v16 = v50;
  v18 = v54;
LABEL_35:

  return v30;
}

- (id)existingReengagementAchievement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ReengagementAchievementEntry _gkFetchRequest](ReengagementAchievementEntry, "_gkFetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID == %@"), v5));
  objc_msgSend(v7, "setPredicate:", v8);

  v23 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v23));
  v10 = v23;
  v11 = v10;
  if (v10)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v10);
    v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Could not fetch reengagement data from cache: %@", buf, 0xCu);
    }
    v14 = 0;
  }
  else
  {
    v15 = (uint64_t)objc_msgSend(v9, "count");
    v14 = (void *)v15;
    if (v15)
    {
      if (v15 >= 2)
      {
        if (!os_log_GKGeneral)
          v16 = (id)GKOSLoggers(v15);
        v17 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
          *(_DWORD *)buf = 138412290;
          v25 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "more than one reengagementAchievement need to cleanup: %@", buf, 0xCu);

        }
        v20 = 1;
        do
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v20));
          objc_msgSend(v6, "deleteObject:", v21);

          ++v20;
        }
        while (v14 != (void *)v20);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    }
  }

  return v14;
}

- (id)processReengagementResults:(id)a3 localPlayer:(id)a4 expirationDate:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  ReengagementAchievementEntry *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  ReengagementAchievementEntry *v36;
  void *v37;
  void *v38;
  GKGameStatServicePrivate *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  ReengagementAchievementEntry *v50;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("achievements")));
    if (objc_msgSend(v15, "count"))
    {
      v47 = v12;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("game")));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("bundle-id")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("achievement-id")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("achievement-pct")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timestamp")));
      objc_msgSend(v41, "doubleValue");
      v19 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v18 / 1000.0));
      v20 = v11;
      v21 = (void *)v19;
      v48 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "playerID"));
      v23 = (ReengagementAchievementEntry *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate existingReengagementAchievement:context:](self, "existingReengagementAchievement:context:", v22, v13));

      v44 = v14;
      v42 = v15;
      if (v23)
      {
        if (!os_log_GKGeneral)
          v25 = (id)GKOSLoggers(v24);
        v26 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Using existing reengagement entry: %@", buf, 0xCu);
        }
        v27 = (void *)v45;
        v28 = (void *)v43;
      }
      else
      {
        if (!os_log_GKGeneral)
          v34 = (id)GKOSLoggers(v24);
        v40 = self;
        v35 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Creating new reengagement entry", buf, 2u);
        }
        v36 = [ReengagementAchievementEntry alloc];
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[ReengagementAchievementEntry entity](ReengagementAchievementEntry, "entity"));
        v23 = -[ReengagementAchievementEntry initWithEntity:insertIntoManagedObjectContext:](v36, "initWithEntity:insertIntoManagedObjectContext:", v37, v13);

        v27 = (void *)v45;
        -[ReengagementAchievementEntry setBundleID:](v23, "setBundleID:", v45);
        v28 = (void *)v43;
        -[ReengagementAchievementEntry setIdentifier:](v23, "setIdentifier:", v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "playerID"));
        -[ReengagementAchievementEntry setPlayerID:](v23, "setPlayerID:", v38);

        self = v40;
      }
      -[ReengagementAchievementEntry setPercentComplete:](v23, "setPercentComplete:", v17);
      -[ReengagementAchievementEntry setLastReportedDate:](v23, "setLastReportedDate:", v21);
      -[ReengagementAchievementEntry setExpirationDate:](v23, "setExpirationDate:", v47);
      objc_msgSend(v17, "doubleValue");
      v31 = (id)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate findAchievementInternal:identifier:context:existingPercent:existingDate:](self, "findAchievementInternal:identifier:context:existingPercent:existingDate:", v27, v28, v13, v21));

      v12 = v47;
      v11 = v48;
      v14 = v44;
      v15 = v42;
    }
    else
    {
      if (!os_log_GKGeneral)
        v32 = (id)GKOSLoggers(0);
      v33 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Zero reengagement achievements from server", buf, 2u);
      }
      v31 = 0;
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v29 = (id)GKOSLoggers(0);
    v30 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Zero server results for reengagement", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (void)loadReengagementAchievements:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000709A4;
  v13[3] = &unk_1002BF858;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "issueRequest:bagKey:clientProxy:handler:", v8, CFSTR("gk-reengagement-achievements"), v10, v13);

}

- (void)getReengagementAchievements:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100071280;
  v5[3] = &unk_1002BF880;
  v6 = a3;
  v4 = v6;
  -[GKGameStatServicePrivate getReengagementAchievement:](self, "getReengagementAchievement:", v5);

}

- (void)getReengagementAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pushCredentialForEnvironment:", objc_msgSend(v6, "environment")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerInternal"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 3423, "-[GKGameStatServicePrivate getReengagementAchievement:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000713EC;
    v13[3] = &unk_1002BD8F0;
    v13[4] = self;
    v14 = v8;
    v15 = v10;
    v16 = v4;
    v11 = v10;
    v12 = v8;
    objc_msgSend(v11, "performOnManagedObjectContext:", v13);

  }
}

- (void)clearAchievementsCacheWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 3455, "-[GKGameStatServicePrivate clearAchievementsCacheWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100071ACC;
  v15[3] = &unk_1002BCCF0;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100071B98;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)clearLeaderboardsCacheWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 3474, "-[GKGameStatServicePrivate clearLeaderboardsCacheWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100071D4C;
  v15[3] = &unk_1002BCCF0;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100071E18;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

@end
