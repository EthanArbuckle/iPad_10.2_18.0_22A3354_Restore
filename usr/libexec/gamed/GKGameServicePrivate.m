@implementation GKGameServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x100000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameServicePrivateInterface, a2);
}

- (id)cachedGamesPlayed:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID == %@"), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayed _gkFetchRequest](GamesPlayed, "_gkFetchRequest"));
  objc_msgSend(v7, "setPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, 0));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v10 = 1;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10));
        objc_msgSend(v5, "deleteObject:", v11);

        ++v10;
      }
      while (v10 < (unint64_t)objc_msgSend(v8, "count"));
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)submitFriendListAccess:(id)a3 value:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKPlayerGameSettingsNetworkRequest *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[GKPlayerGameSettingsNetworkRequest initWithBundleID:value:]([GKPlayerGameSettingsNetworkRequest alloc], "initWithBundleID:value:", v10, v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100042CD0;
  v15[3] = &unk_1002BD988;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v12, "writeToNetwork:clientProxy:handler:", v11, v13, v15);

}

- (void)getGamesPlayedMetaData:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  GKGameServicePrivate *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 626, "-[GKGameServicePrivate getGamesPlayedMetaData:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000430BC;
  v18[3] = &unk_1002BDA00;
  v10 = v6;
  v19 = v10;
  v11 = v7;
  v22 = v11;
  v12 = v9;
  v20 = v12;
  v21 = self;
  objc_msgSend(v12, "performOnManagedObjectContext:", v18);
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100043F60;
    v15[3] = &unk_1002BB758;
    v16 = v12;
    v17 = v11;
    objc_msgSend(v16, "notifyOnQueue:block:", v14, v15);

  }
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 handler:(id)a5
{
  -[GKGameServicePrivate getGamesPlayedSummaries:limit:withinSecs:handler:](self, "getGamesPlayedSummaries:limit:withinSecs:handler:", a3, a4, 0, a5);
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 withinSecs:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  GKGameServicePrivate *v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100044160;
  v24[3] = &unk_1002BDA50;
  v15 = v10;
  v25 = v15;
  v16 = v14;
  v26 = v16;
  v17 = v12;
  v27 = v17;
  v28 = self;
  v18 = v11;
  v29 = v18;
  objc_msgSend(v16, "performOnManagedObjectContext:", v24);
  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100044C04;
    v21[3] = &unk_1002BB758;
    v22 = v16;
    v23 = v13;
    objc_msgSend(v22, "notifyOnQueue:block:", v20, v21);

  }
}

- (void)getGameInstallDataForBundleIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameInstallDataFetcher createAndReturnError:](GKGameInstallDataFetcher, "createAndReturnError:", &v18));
  v9 = v18;
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100044DB4;
    block[3] = &unk_1002BB450;
    v17 = v7;
    v16 = v9;
    dispatch_async(v11, block);

    v12 = v17;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100044DC8;
    v13[3] = &unk_1002BCA30;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v8, "fetchGameInstallInfoFor:completionHandler:", v6, v13);
    v12 = v14;
  }

}

- (id)ampController
{
  return +[GKAMPController controller](GKAMPController, "controller");
}

- (void)getAppMetadataForBundleIDs:(id)a3 adamIDs:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 903, "-[GKGameServicePrivate getAppMetadataForBundleIDs:adamIDs:withCompletion:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100045080;
  v23[3] = &unk_1002BC3A8;
  v23[4] = self;
  v13 = v12;
  v24 = v13;
  v25 = v8;
  v26 = v9;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "perform:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100045394;
  v20[3] = &unk_1002BB450;
  v21 = v13;
  v22 = v10;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v18, "notifyOnQueue:block:", v17, v20);

}

- (void)clearAppMetadataCacheWithCompletion:(id)a3
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
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 940, "-[GKGameServicePrivate clearAppMetadataCacheWithCompletion:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045558;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000456D8;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (id)internalGameSummariesFromResults:(id)a3 limit:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  id v28;
  id v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = a4;
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]", objc_msgSend(v12, "UTF8String"), 968));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v15 = objc_msgSend(v5, "count");
    v31 = v6;
    if (v6)
    {
      v16 = objc_msgSend(v6, "longValue");
      if (v16 >= objc_msgSend(v5, "count"))
        v15 = objc_msgSend(v5, "count");
      else
        v15 = objc_msgSend(v6, "longValue");
    }
    v17 = v15;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v32 = v5;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      v22 = GKGameCenterIdentifier;
LABEL_10:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundleID"));
        v26 = objc_msgSend(v25, "isEqualToString:", v22);

        if ((v26 & 1) == 0)
        {
          v27 = objc_msgSend(objc_alloc((Class)GKGameSummaryInternal), "initWithGameSummary:", v24);
          objc_msgSend(v14, "addObject:", v27);
          v28 = objc_msgSend(v14, "count");

          if (v28 >= v17)
            break;
        }
        if (v20 == (id)++v23)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v20)
            goto LABEL_10;
          break;
        }
      }
    }

    v6 = v31;
    v5 = v32;
  }
  v29 = objc_msgSend(v14, "copy");

  return v29;
}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  objc_super v6;

  if (sel_isEqual("getTopGamesWithHandler:", a3))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)GKGameServicePrivate;
  return -[GKService requiresAuthenticationForSelector:](&v6, "requiresAuthenticationForSelector:", a3);
}

- (void)fetchTopGamesInContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1004, "-[GKGameServicePrivate fetchTopGamesInContext:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v8, v6, v9));

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100045C6C;
  v21[3] = &unk_1002BDAE0;
  v11 = v10;
  v22 = v11;
  v23 = v25;
  v24 = v27;
  objc_msgSend(v11, "performOnManagedObjectContext:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100045D68;
  v16[3] = &unk_1002BC640;
  v14 = v7;
  v18 = v14;
  v15 = v11;
  v17 = v15;
  v19 = v27;
  v20 = v25;
  objc_msgSend(v15, "notifyOnQueue:block:", v13, v16);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

}

- (void)loadTopGamesWithContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1028, "-[GKGameServicePrivate loadTopGamesWithContext:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v8, v7, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100045FA8;
  v21[3] = &unk_1002BB590;
  v21[4] = self;
  v13 = v10;
  v22 = v13;
  objc_msgSend(v13, "performOnQueue:block:", v12, v21);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004621C;
  v18[3] = &unk_1002BB450;
  v19 = v13;
  v20 = v6;
  v16 = v13;
  v17 = v6;
  objc_msgSend(v16, "notifyOnQueue:block:", v15, v18);

}

- (void)getTopGamesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  GKGameServicePrivate *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1065, "-[GKGameServicePrivate getTopGamesWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000463F4;
  v14[3] = &unk_1002BB590;
  v14[4] = self;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v7, "perform:", v14);
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000468F4;
    v10[3] = &unk_1002BB568;
    v11 = v7;
    v12 = self;
    v13 = v4;
    objc_msgSend(v11, "notifyOnQueue:block:", v9, v10);

  }
}

- (void)fetchOnDeviceMultiplayerGamesInContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1122, "-[GKGameServicePrivate fetchOnDeviceMultiplayerGamesInContext:forBundleIDs:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v8, v12));

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100046DC8;
  v25[3] = &unk_1002BDBA8;
  v14 = v9;
  v26 = v14;
  v15 = v13;
  v27 = v15;
  v28 = v30;
  v29 = v32;
  objc_msgSend(v15, "performOnManagedObjectContext:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100047038;
  v20[3] = &unk_1002BC640;
  v18 = v10;
  v22 = v18;
  v19 = v15;
  v21 = v19;
  v23 = v32;
  v24 = v30;
  objc_msgSend(v19, "notifyOnQueue:block:", v17, v20);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

- (void)loadOnDeviceMultiplayerGamesWithContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  GKGameServicePrivate *v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1160, "-[GKGameServicePrivate loadOnDeviceMultiplayerGamesWithContext:forBundleIDs:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v10, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000472A4;
  v25[3] = &unk_1002BB4A0;
  v26 = v8;
  v27 = self;
  v16 = v13;
  v28 = v16;
  v17 = v8;
  objc_msgSend(v16, "performOnQueue:block:", v15, v25);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000475A4;
  v22[3] = &unk_1002BB450;
  v23 = v16;
  v24 = v9;
  v20 = v16;
  v21 = v9;
  objc_msgSend(v20, "notifyOnQueue:block:", v19, v22);

}

- (void)getOnDeviceMultiplayerGamesForBundleIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1192, "-[GKGameServicePrivate getOnDeviceMultiplayerGamesForBundleIDs:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004779C;
  v17[3] = &unk_1002BB4A0;
  v17[4] = self;
  v10 = v9;
  v18 = v10;
  v11 = v6;
  v19 = v11;
  objc_msgSend(v10, "perform:", v17);
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100047D08;
    v14[3] = &unk_1002BB450;
    v16 = v7;
    v15 = v10;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

- (void)scanInstalledGamesForPlayer:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100047E58;
  v12[3] = &unk_1002BB4A0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v11, "performOnQueue:block:", v9, v12);

}

- (void)fetchGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  GKGameServicePrivate *v32;
  _QWORD *v33;
  _QWORD *v34;
  int v35;
  BOOL v36;
  _QWORD v37[3];
  BOOL v38;
  _QWORD v39[3];
  char v40;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = a5 == 2;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1311, "-[GKGameServicePrivate fetchGamesForPlayer:includeInstalled:responseKind:context:handler:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v15, v13, v16));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100048744;
  v29[3] = &unk_1002BDCB0;
  v18 = v12;
  v30 = v18;
  v33 = v37;
  v34 = v39;
  v35 = a5;
  v19 = v17;
  v36 = a4;
  v31 = v19;
  v32 = self;
  objc_msgSend(v19, "performOnManagedObjectContext:", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100048CC8;
  v24[3] = &unk_1002BC640;
  v22 = v14;
  v26 = v22;
  v23 = v19;
  v25 = v23;
  v27 = v39;
  v28 = v37;
  objc_msgSend(v23, "notifyOnQueue:block:", v21, v24);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

}

- (void)loadGamesForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  GKGameServicePrivate *v25;
  _QWORD *v26;
  _QWORD v27[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1386, "-[GKGameServicePrivate loadGamesForPlayer:context:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v9, v12));

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100048F44;
  v22[3] = &unk_1002BDE08;
  v14 = v8;
  v23 = v14;
  v15 = v13;
  v24 = v15;
  v25 = self;
  v26 = v27;
  objc_msgSend(v15, "performOnManagedObjectContext:", v22);
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100049A38;
    v18[3] = &unk_1002BBD40;
    v20 = v10;
    v21 = v27;
    v19 = v15;
    objc_msgSend(v19, "notifyOnQueue:block:", v17, v18);

  }
  _Block_object_dispose(v27, 8);

}

- (void)getGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1477, "-[GKGameServicePrivate getGamesForPlayer:includeInstalled:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerID"));
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal internalRepresentation](GKLocalPlayerInternal, "internalRepresentation"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100049D0C;
    v30[3] = &unk_1002BBBD8;
    v8 = v13;
    v31 = v8;
    objc_msgSend(v14, "performBlockAndWait:", v30);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100049D54;
  v25[3] = &unk_1002BDEF8;
  v25[4] = self;
  v17 = v8;
  v26 = v17;
  v29 = a4;
  v18 = v9;
  v28 = v18;
  v19 = v11;
  v27 = v19;
  objc_msgSend(v19, "performOnQueue:block:", v16, v25);

  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004A6A4;
    v22[3] = &unk_1002BB450;
    v24 = v18;
    v23 = v19;
    objc_msgSend(v23, "notifyOnQueue:block:", v21, v22);

  }
}

- (void)fetchGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  int v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  BOOL v42;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1559, "-[GKGameServicePrivate fetchGameStatsForPlayer:bundleIdentifiers:responseKind:context:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v16, v14, v17));

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = a5 == 2;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004A9B0;
  v31[3] = &unk_1002BDF48;
  v37 = objc_msgSend(v13, "count");
  v35 = v41;
  v19 = v12;
  v32 = v19;
  v20 = v13;
  v33 = v20;
  v36 = v39;
  v38 = a5;
  v21 = v18;
  v34 = v21;
  objc_msgSend(v21, "performOnManagedObjectContext:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10004ACA4;
  v26[3] = &unk_1002BC640;
  v24 = v15;
  v28 = v24;
  v25 = v21;
  v27 = v25;
  v29 = v39;
  v30 = v41;
  objc_msgSend(v25, "notifyOnQueue:block:", v23, v26);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

}

- (void)loadGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  GKGameServicePrivate *v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1612, "-[GKGameServicePrivate loadGameStatsForPlayer:bundleIdentifiers:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v13, v15));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004AEE4;
  v27[3] = &unk_1002BCAA8;
  v28 = v11;
  v29 = v10;
  v17 = v16;
  v30 = v17;
  v31 = self;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v17, "performOnManagedObjectContext:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004B864;
  v24[3] = &unk_1002BB450;
  v25 = v17;
  v26 = v12;
  v22 = v17;
  v23 = v12;
  objc_msgSend(v22, "notifyOnQueue:block:", v21, v24);

}

- (void)getGameStatsForPlayer:(id)a3 bundleIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  GKGameServicePrivate *v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1711, "-[GKGameServicePrivate getGameStatsForPlayer:bundleIDs:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004BAC8;
  v24[3] = &unk_1002BE0C8;
  v15 = v12;
  v25 = v15;
  v16 = v8;
  v26 = v16;
  v27 = self;
  v17 = v9;
  v28 = v17;
  v18 = v10;
  v29 = v18;
  objc_msgSend(v15, "performOnQueue:block:", v14, v24);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004C3FC;
    v21[3] = &unk_1002BB450;
    v23 = v18;
    v22 = v15;
    objc_msgSend(v22, "notifyOnQueue:block:", v20, v21);

  }
}

- (void)fetchGameMetadataForBundleIDs:(id)a3 responseKind:(int)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  uint8_t *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t *v33;
  _QWORD *v34;
  int v35;
  _QWORD v36[3];
  char v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  BOOL v41;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v12);
  v15 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKGameService: fetchGameMetadataForBundleIDs:", buf, 2u);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1782, "-[GKGameServicePrivate fetchGameMetadataForBundleIDs:responseKind:context:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v16, v11, v17));

  *(_QWORD *)buf = 0;
  v39 = buf;
  v40 = 0x2020000000;
  v41 = a4 == 2;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10004C70C;
  v30[3] = &unk_1002BE0F0;
  v19 = v10;
  v31 = v19;
  v33 = buf;
  v34 = v36;
  v35 = a4;
  v20 = v18;
  v32 = v20;
  objc_msgSend(v20, "performOnManagedObjectContext:", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004CA34;
  v25[3] = &unk_1002BC640;
  v23 = v13;
  v27 = v23;
  v24 = v20;
  v26 = v24;
  v28 = v36;
  v29 = buf;
  objc_msgSend(v24, "notifyOnQueue:block:", v22, v25);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(buf, 8);

}

- (void)loadGameMetadataForBundleIDs:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  GKGameServicePrivate *v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKGameService: loadGameMetadataForBundleIDs:", buf, 2u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1836, "-[GKGameServicePrivate loadGameMetadataForBundleIDs:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v9, v15));

  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x2020000000;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004CCE8;
  v25[3] = &unk_1002BDE08;
  v17 = v8;
  v26 = v17;
  v18 = v16;
  v27 = v18;
  v28 = self;
  v29 = buf;
  objc_msgSend(v18, "performOnManagedObjectContext:", v25);
  if (v11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004D3DC;
    v21[3] = &unk_1002BBD40;
    v23 = v11;
    v24 = buf;
    v22 = v18;
    objc_msgSend(v22, "notifyOnQueue:block:", v20, v21);

  }
  _Block_object_dispose(buf, 8);

}

- (void)getGameMetadataForBundleIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKGameService: getGameMetadataForBundleIDs:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004D600;
  v21[3] = &unk_1002BE230;
  v21[4] = self;
  v14 = v6;
  v22 = v14;
  v15 = v8;
  v25 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  objc_msgSend(v16, "perform:", v21);
  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004DC3C;
    v18[3] = &unk_1002BB450;
    v20 = v15;
    v19 = v16;
    objc_msgSend(v19, "notifyOnQueue:block:", v17, v18);

  }
}

- (void)fetchRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  GKGameServicePrivate *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004DD68;
  v11[3] = &unk_1002BB518;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)loadRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  GKGameServicePrivate *v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 1979, "-[GKGameServicePrivate loadRatingForGameDescriptor:context:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v9, v12));

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004E190;
  v25[3] = &unk_1002BE2D0;
  v14 = v8;
  v26 = v14;
  v27 = self;
  v15 = v13;
  v28 = v15;
  v16 = v9;
  v29 = v16;
  v30 = v31;
  objc_msgSend(v15, "perform:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004E604;
  v21[3] = &unk_1002BBD40;
  v19 = v10;
  v23 = v19;
  v24 = v31;
  v20 = v15;
  v22 = v20;
  objc_msgSend(v20, "notifyOnQueue:block:", v18, v21);

  _Block_object_dispose(v31, 8);
}

- (void)fetchGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  GKGameServicePrivate *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E708;
  v10[3] = &unk_1002BB568;
  v11 = a3;
  v12 = self;
  v13 = a5;
  v8 = v13;
  v9 = v11;
  objc_msgSend(a4, "performBlock:", v10);

}

- (void)loadGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  GKGameServicePrivate *v27;
  _QWORD *v28;
  _QWORD v29[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 2047, "-[GKGameServicePrivate loadGamesWithAchievementStatsForPlayer:context:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v9, v12));

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004EAD4;
  v24[3] = &unk_1002BDE08;
  v14 = v8;
  v25 = v14;
  v15 = v13;
  v26 = v15;
  v27 = self;
  v28 = v29;
  objc_msgSend(v15, "performOnManagedObjectContext:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004F13C;
  v20[3] = &unk_1002BBD40;
  v18 = v10;
  v22 = v18;
  v23 = v29;
  v19 = v15;
  v21 = v19;
  objc_msgSend(v19, "notifyOnQueue:block:", v17, v20);

  _Block_object_dispose(v29, 8);
}

- (void)getGamesWithAchievementStatsForPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKGameServicePrivate *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 2096, "-[GKGameServicePrivate getGamesWithAchievementStatsForPlayer:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004F368;
  v19[3] = &unk_1002BB4A0;
  v12 = v9;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  v22 = self;
  objc_msgSend(v12, "performOnQueue:block:", v11, v19);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004FC38;
    v16[3] = &unk_1002BB450;
    v18 = v7;
    v17 = v12;
    objc_msgSend(v17, "notifyOnQueue:block:", v15, v16);

  }
}

- (void)removeGameForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  GKGameServicePrivate *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 2158, "-[GKGameServicePrivate removeGameForBundleID:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004FE6C;
    v16[3] = &unk_1002BB4A0;
    v17 = v9;
    v18 = self;
    v19 = v6;
    objc_msgSend(v17, "performOnQueue:block:", v11, v16);

  }
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100050158;
    v14[3] = &unk_1002BB540;
    v15 = v7;
    objc_msgSend(v9, "notifyOnQueue:block:", v13, v14);

  }
}

- (void)fetchInstalledGameIdCacheWithHandler:(id)a3
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
  GKGameServicePrivate *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 2192, "-[GKGameServicePrivate fetchInstalledGameIdCacheWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v5, 0));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000502C0;
  v16[3] = &unk_1002BCCF0;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100050484;
  v12[3] = &unk_1002BB568;
  v13 = v7;
  v14 = self;
  v15 = v4;
  v10 = v4;
  v11 = v7;
  objc_msgSend(v11, "notifyOnQueue:block:", v9, v12);

}

- (void)restoreGameIdCacheWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000527C0(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v16 = objc_alloc((Class)NSMutableSet);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "availableGameIdentifiers"));
  v18 = objc_msgSend(v16, "initWithArray:", v17);

  objc_msgSend(v18, "removeObject:", GKWidgetIdentifier);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100050658;
  v22[3] = &unk_1002BD988;
  v23 = v18;
  v24 = v5;
  v20 = v18;
  v21 = v5;
  -[GKGameService storeGameForBundleIDs:completion:](self, "storeGameForBundleIDs:completion:", v19, v22);

}

- (void)clearGlobalGameCacheWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 2234, "-[GKGameServicePrivate clearGlobalGameCacheWithHandler:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v4, v6));

  v38[0] = objc_opt_class(GKCDLoadedGame, v8);
  v38[1] = objc_opt_class(GKGameListCacheObject, v9);
  v38[2] = objc_opt_class(GKGameRecordCacheObject, v10);
  v38[3] = objc_opt_class(GKGameCacheObject, v11);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_gkFetchRequest"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100050950;
        v29[3] = &unk_1002BE398;
        v30 = v18;
        v19 = v7;
        v31 = v19;
        v32 = v17;
        v20 = v18;
        objc_msgSend(v19, "performOnManagedObjectContext:", v29);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100050AF0;
  v26[3] = &unk_1002BB450;
  v27 = v7;
  v28 = v25;
  v23 = v7;
  v24 = v25;
  objc_msgSend(v23, "notifyOnQueue:block:", v22, v26);

}

- (void)getFriendListAccessForAllGames:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  Block_layout *v14;

  v4 = a3;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100050E1C;
    v12[3] = &unk_1002BE490;
    v12[4] = self;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
    v13 = v5;
    v14 = &stru_1002BE3D8;
    objc_msgSend(v5, "performOnManagedObjectContext:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "replyQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000516C0;
    v9[3] = &unk_1002BB758;
    v10 = v5;
    v11 = v4;
    v8 = v5;
    objc_msgSend(v8, "notifyOnQueue:block:", v7, v9);

  }
}

- (void)triggerGameActivityForChallenge:(id)a3 bundleID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKChallengeServicePrivate, "serviceWithTransport:forClient:localPlayer:", v11, v12, v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100051854;
  v17[3] = &unk_1002BE508;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "getLeaderboardChallengeDetailsForChallengeID:allowStaleData:completionHandler:", v10, 1, v17);

}

- (void)addGameActivityForActivityType:(id)a3 BundleID:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)GKGameActivityInternal), "initWithActivityType:bundleID:andUserInfo:", v12, v11, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](GKGameService, "sharedGameActivityStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100052020;
  v16[3] = &unk_1002BB540;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v14, "add:completionHandler:", v13, v16);

}

- (void)fetchActivitiesForBundleID:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](GKGameService, "sharedGameActivityStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000520E4;
  v11[3] = &unk_1002BBA18;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "fetchActivitiesWithBundleID:ascending:completionHandler:", v8, v5, v11);

}

- (void)removeAllGameActivitiesWithHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](GKGameService, "sharedGameActivityStore"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052180;
  v6[3] = &unk_1002BB540;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "removeAllActivitiesWithCompletionHandler:", v6);

}

- (void)removeAllGameActivitiesForBundleID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](GKGameService, "sharedGameActivityStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005223C;
  v9[3] = &unk_1002BB540;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "removeActivitiesForBundleID:completionHandler:", v6, v9);

}

@end
