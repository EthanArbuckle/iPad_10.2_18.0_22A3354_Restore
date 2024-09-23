@implementation GKSystemBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKSystemBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletin cacheTransactionGroup](GKBulletin, "cacheTransactionGroup"));
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithPushNotification:", v6);
  v14 = objc_msgSend(v13, "pushCommand");
  v15 = (int)v14;
  if ((unsigned __int16)v14 <= 0xEFu)
  {
    if ((unsigned __int16)v14 == 51)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", GKFriendRequestURLFriendCode));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100137E90;
      v27[3] = &unk_1002BB8A0;
      v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", GKFriendRequestPushAcceptorID));
      v29 = v20;
      v30 = v6;
      v21 = v20;
      v22 = v28;
      objc_msgSend(v12, "performOnManagedObjectContext:", v27);

      if (!v8)
        goto LABEL_30;
      goto LABEL_29;
    }
    if ((unsigned __int16)v14 != 68)
      goto LABEL_25;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("game")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundle-id")));
    v18 = v17;
    if (v16 && v17)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100137C7C;
      v34[3] = &unk_1002BB850;
      v35 = v17;
      v36 = v16;
      objc_msgSend(v12, "performOnManagedObjectContext:", v34);

    }
LABEL_19:

    if (!v8)
      goto LABEL_30;
    goto LABEL_29;
  }
  switch((unsigned __int16)v14)
  {
    case 0xF0u:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", GKPushReceiverID));
      v19 = +[GKBulletin playerIsLocal:](GKBulletin, "playerIsLocal:", v16);
      if (!v19)
      {
        if (!os_log_GKGeneral)
          v25 = (id)GKOSLoggers(v19);
        v26 = os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "GKSystemBulletin bulletin is not meant for current local player. Skipping.", buf, 2u);
        }
        v8[2](v8, 0);

        goto LABEL_30;
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100137D28;
      v31[3] = &unk_1002BB850;
      v32 = v6;
      v33 = v12;
      objc_msgSend(v33, "performOnManagedObjectContext:", v31);

      goto LABEL_19;
    case 0xFEu:
      objc_msgSend(v11, "resetEnvironment");
      if (!v8)
        goto LABEL_30;
      goto LABEL_29;
    case 0xFDu:
      objc_msgSend(v11, "clearPushEnvironment");
      if (!v8)
        goto LABEL_30;
      goto LABEL_29;
  }
LABEL_25:
  if (!os_log_GKGeneral)
    v23 = (id)GKOSLoggers(v14);
  v24 = os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    sub_10013A4D4(v15, v24);
    if (!v8)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (v8)
LABEL_29:
    v8[2](v8, 0);
LABEL_30:

}

+ (void)presentGameCenterInviteUpdate:(id)a3 playerAlias:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKBulletinAction *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v16 = objc_msgSend(objc_alloc((Class)a1), "initWithPushNotification:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "setDate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  objc_msgSend(v16, "setExpirationDate:", v9);

  objc_msgSend(v16, "setBulletinType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings GAME_CENTER_FRIEND_REQUEST_ACCEPTED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GAME_CENTER_FRIEND_REQUEST_ACCEPTED"));
  objc_msgSend(v16, "setMessage:", v10);

  objc_msgSend(v16, "setHasSound:", 1);
  objc_msgSend(v16, "setSoundPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "setDate:", v11);

  objc_msgSend(v16, "setTitle:", v6);
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_VIEW](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_VIEW"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKFriendRequestPushAcceptorID));
  -[GKBulletinAction setInfo:](v12, "setInfo:", v14);

  objc_msgSend(v16, "setDefaultAction:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  objc_msgSend(v15, "presentBulletin:", v16);

}

+ (void)expireGetPerGameSettingsCaches:(id)a3 payload:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDGameSettings _gkFetchRequest](GKCDGameSettings, "_gkFetchRequest"));
  if (objc_msgSend(v7, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleID == %@"), v7));
    objc_msgSend(v10, "setPredicate:", v11);

  }
  v43 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v10, &v43));
  v13 = v43;
  if (v13)
  {
    v41 = 0uLL;
    v42 = 0uLL;
    v39 = 0uLL;
    v40 = 0uLL;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v16);
    }

    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v19);
    v21 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "expireGetPerGameSettingsCaches: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    v37 = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    v22 = v12;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "setExpirationDate:", 0);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v24);
    }

  }
  v27 = GKPushFriendsAuthorizationStatus;
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", GKPushFriendsAuthorizationStatus));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v27));
    v31 = objc_msgSend(v30, "integerValue");
    v32 = (id)GKPushFriendsAuthorizationStatusRemoved;

    if (v31 == v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:credential:](GKGameService, "serviceWithTransport:forClient:credential:", 0, v33, 0));
      objc_msgSend(v34, "resetTCCAuthorization:", &stru_1002C4B70);

    }
  }

}

+ (void)expireGetPerGameFriendPlayerIDsCache:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDGameFriendList _gkFetchRequest](GKCDGameFriendList, "_gkFetchRequest"));
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleID == %@"), v6));
    objc_msgSend(v8, "setPredicate:", v9);

  }
  v33 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v33));
  v11 = v33;
  if (v11)
  {
    v31 = 0uLL;
    v32 = 0uLL;
    v29 = 0uLL;
    v30 = 0uLL;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v7, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }

    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v17);
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "setExpirationDate:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v22);
    }

  }
}

+ (void)expireFriendCodeDetails:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDFriendCodeDetail _gkFetchRequest](GKCDFriendCodeDetail, "_gkFetchRequest"));
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("friendCode == %@"), v6));
    objc_msgSend(v8, "setPredicate:", v9);

  }
  v33 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v33));
  v11 = v33;
  if (v11)
  {
    v31 = 0uLL;
    v32 = 0uLL;
    v29 = 0uLL;
    v30 = 0uLL;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v7, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }

    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v17);
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "setExpirationDate:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v22);
    }

  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 group:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  id v17;
  NSObject *v18;
  dispatch_queue_t current_queue;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v12);
  v15 = os_log_GKTrace;
  v16 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKSystemBulletin expireCachesForKey: context:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v16);
  v18 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_10013A548((uint64_t)v9, v18);
  current_queue = dispatch_get_current_queue();
  v20 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v20, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSystemBulletin.m"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v22, "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]", objc_msgSend(v24, "UTF8String"), 251));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v25);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:](GKPlayerProfileCacheObject, "localPlayerInManagedObjectContext:", v11));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "internalRepresentation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKUtilityServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v27, v28));
    +[GKSystemBulletin expireCachesForBagKey:payload:context:profile:client:localPlayerInternal:](GKSystemBulletin, "expireCachesForBagKey:payload:context:profile:client:localPlayerInternal:", v9, v10, v11, v26, v27, v28);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100138C88;
    v31[3] = &unk_1002BB590;
    v32 = v29;
    v33 = v9;
    v30 = v29;
    objc_msgSend(v13, "perform:", v31);

  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 profile:(id)a6 client:(id)a7 localPlayerInternal:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKFriendServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v18, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v18, v19));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameStatServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v18, v19));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKProfileServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v18, v19));
  v59 = v14;
  if (objc_msgSend(v14, "isEqualToString:", GKBagKeyGetFriendIDs))
  {
    v56 = v21;
    v23 = v15;
    objc_msgSend(v17, "invalidate");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "friendList"));
    objc_msgSend(v24, "invalidate");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "friendRequestList"));
    objc_msgSend(v25, "invalidate");

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerID"));
    v27 = (void *)v26;
    v28 = v58;
    if (v26)
    {
      v65 = v26;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
      objc_msgSend(v58, "getProfilesForPlayerIDs:handler:", v29, &stru_1002C4BB0);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "internalRepresentation"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100139438;
    v60[3] = &unk_1002C4540;
    v61 = v18;
    v62 = v19;
    objc_msgSend(v20, "getFriendsForPlayer:commonFriends:handler:", v30, 0, v60);

    +[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:](GKCompatiblePlayerListCacheObject, "invalidateObjectsMatchingPredicate:context:", 0, v16);
    v15 = v23;
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:payload:context:](GKSystemBulletin, "expireGetPerGameFriendPlayerIDsCache:payload:context:", 0, v23, v16);
    +[GKSystemBulletin expireFriendCodeDetails:payload:context:](GKSystemBulletin, "expireFriendCodeDetails:payload:context:", 0, v23, v16);

    v21 = v56;
    goto LABEL_8;
  }
  if ((objc_msgSend(v14, "isEqualToString:", GKBagKeyGetGamesPlayed) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", CFSTR("gk-get-games-played")))
  {
    objc_msgSend(v17, "expire");
    v54 = v15;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "gameList"));
    objc_msgSend(v31, "expire");

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player = %@"), v17));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:](GKGameRecordCacheObject, "expireObjectsMatchingPredicate:context:", v32, v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerID"));
    v64 = v33;
    v53 = v19;
    v34 = v18;
    v35 = v22;
    v36 = v20;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
    v28 = v58;
    objc_msgSend(v58, "getProfilesForPlayerIDs:handler:", v37, &stru_1002C4BD0);

    v15 = v54;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "internalRepresentation"));
    objc_msgSend(v21, "getGamesForPlayer:includeInstalled:handler:", v38, 0, 0);

    v20 = v36;
    v22 = v35;
    v18 = v34;
    v19 = v53;

    goto LABEL_8;
  }
  if (objc_msgSend(v14, "isEqualToString:", GKBagKeyGamesFriendsPlayed))
  {
    objc_msgSend(v22, "expireGamesFriendsPlayed");
LABEL_18:
    v28 = v58;
    goto LABEL_8;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("gk-get-player-achievements")))
  {
    objc_msgSend(v17, "expire");
    v57 = v20;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "gameRecords"));
    objc_msgSend(v39, "makeObjectsPerformSelector:", "expire");

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player == %@"), a1));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:](GKAchievementListCacheObject, "expireObjectsMatchingPredicate:context:", v55, v16);
    v40 = v22;
    v41 = v15;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerID"));
    v63 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    objc_msgSend(v58, "getProfilesForPlayerIDs:handler:", v43, &stru_1002C4BF0);

    v15 = v41;
    v22 = v40;
    v28 = v58;

    v20 = v57;
    goto LABEL_8;
  }
  if (objc_msgSend(v14, "isEqualToString:", GKBagKeyGetPerGameSettings))
  {
    v44 = v22;
    v45 = v20;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", GKInviteGameIDKey));
    +[GKSystemBulletin expireGetPerGameSettingsCaches:payload:context:](GKSystemBulletin, "expireGetPerGameSettingsCaches:payload:context:", v46, v15, v16);
LABEL_17:

    v20 = v45;
    v22 = v44;
    goto LABEL_18;
  }
  if (objc_msgSend(v14, "isEqualToString:", GKBagKeyGetPerGameFriendPlayerIDs))
  {
    v44 = v22;
    v45 = v20;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", GKInviteGameIDKey));
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:payload:context:](GKSystemBulletin, "expireGetPerGameFriendPlayerIDsCache:payload:context:", v46, v15, v16);
    goto LABEL_17;
  }
  v28 = v58;
  if (objc_msgSend(v59, "isEqualToString:", GKBagKeyGetFriendInvitationMailbox))
  {
    objc_msgSend(v17, "invalidate");
    v47 = v22;
    v48 = v15;
    v49 = v20;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "friendList"));
    objc_msgSend(v50, "invalidate");

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "friendRequestList"));
    objc_msgSend(v51, "invalidate");

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKBulletinService, "serviceWithTransport:forClient:localPlayer:", 0, v18, v19));
    objc_msgSend(v52, "sendRefreshContentsForDataTypeToAllClientProxy:", 3);

    v20 = v49;
    v15 = v48;
    v22 = v47;
  }
LABEL_8:

}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSystemBulletin handleAction: %@", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)GKSystemBulletin;
  -[GKBulletin handleAction:](&v8, "handleAction:", v5);

}

@end
