@implementation GKFriendServicePrivate

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  _QWORD v10[4];
  GKFriendServicePrivate *v11;
  id v12;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000089BC;
  v10[3] = &unk_1002BCA30;
  v11 = self;
  v12 = a6;
  v9 = v12;
  -[GKFriendServicePrivate getFriendIDsForPlayer:withFilter:commonFriends:handler:](v11, "getFriendIDsForPlayer:withFilter:commonFriends:handler:", a3, v7, v6, v10);

}

- (void)getActiveFriendRequests:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v6 = objc_msgSend(v5, "fakeFriendRequestCount");

  if (v6)
  {
    -[GKFriendServicePrivate getFakeActiveFriendRequests:](self, "getFakeActiveFriendRequests:", v4);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B248;
    v7[3] = &unk_1002BCA30;
    v7[4] = self;
    v8 = v4;
    -[GKFriendServicePrivate getMessageInboxEntries:](self, "getMessageInboxEntries:", v7);

  }
}

- (void)getMessageInboxEntries:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, NSMutableArray *, _QWORD);
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v24 = (void (**)(id, NSMutableArray *, _QWORD))a3;
  v30 = objc_opt_new(NSMutableArray);
  os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendServicePrivate messageInboxLocation](GKFriendServicePrivate, "messageInboxLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));

  os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v29 = *(_QWORD *)v32;
    v27 = GKFriendRequestURLSenderHandle;
    v28 = GKFriendRequestURL;
    v26 = GKFriendRequestURLSenderAlias;
    v7 = GKFriendRequestURLContactID;
    v8 = GKFriendRequestURLFriendCode;
    v9 = GKFriendRequestTimestamp;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc_init((Class)GKMessageInboxEntryInternal);
        v13 = objc_alloc((Class)NSData);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v28));
        v15 = objc_msgSend(v13, "initWithBase64EncodedString:options:", v14, 0);

        v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));
        objc_msgSend(v12, "setUrl:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v27));
        objc_msgSend(v12, "setSenderHandle:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v26));
        objc_msgSend(v12, "setSenderAlias:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
        objc_msgSend(v12, "setContactID:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
        objc_msgSend(v12, "setFriendCode:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
        objc_msgSend(v12, "setTimestamp:", v22);

        -[NSMutableArray addObject:](v30, "addObject:", v12);
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  v24[2](v24, v30, 0);
}

+ (os_unfair_lock_s)messageInboxEntriesLock
{
  if (qword_100317E28 != -1)
    dispatch_once(&qword_100317E28, &stru_1002BD410);
  return (os_unfair_lock_s *)&dword_100317E20;
}

- (void)getFriendCodeDetailWithIdentifiers:(id)a3 handler:(id)a4
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
  id v17;
  _QWORD v18[4];
  id v19;
  GKFriendServicePrivate *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 708, "-[GKFriendServicePrivate getFriendCodeDetailWithIdentifiers:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A9D4;
  v18[3] = &unk_1002BB8A0;
  v10 = v6;
  v19 = v10;
  v20 = self;
  v11 = v9;
  v21 = v11;
  objc_msgSend(v11, "performOnManagedObjectContext:", v18);
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000093BC;
    v14[3] = &unk_1002BB568;
    v15 = v11;
    v16 = v10;
    v17 = v7;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 handler:(id)a5
{
  -[GKFriendServicePrivate getFriendsForPlayer:withFilter:commonFriends:handler:](self, "getFriendsForPlayer:withFilter:commonFriends:handler:", a3, *(_QWORD *)&a4, 0, a5);
}

- (void)getFriendIDsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
  -[GKFriendService getFriendIDsForPlayer:withPredicate:withFilter:commonFriends:handler:](self, "getFriendIDsForPlayer:withPredicate:withFilter:commonFriends:handler:", a3, &stru_1002BD258, *(_QWORD *)&a4, a5, a6);
}

+ (unint64_t)requiredEntitlements
{
  return 0x40000;
}

+ (id)messageInboxLocation
{
  if (qword_100317E18 != -1)
    dispatch_once(&qword_100317E18, &stru_1002BD3F0);
  return (id)qword_100317E10;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKFriendServicePrivateInterface, a2);
}

- (void)getChallengableFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKProfileServicePrivate, "serviceWithTransport:forClient:localPlayer:", v10, v11, v12));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000373A8;
  v16[3] = &unk_1002BD1F0;
  v18 = v8;
  v19 = a4;
  v17 = v13;
  v14 = v8;
  v15 = v13;
  -[GKFriendService getChallengableFriendIDsForPlayer:handler:](self, "getChallengableFriendIDsForPlayer:handler:", v9, v16);

}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037450;
  v9[3] = &unk_1002BD1F0;
  v10 = a5;
  v11 = a4;
  v9[4] = self;
  v8 = v10;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:](self, "getFriendIDsForPlayer:commonFriends:handler:", a3, 0, v9);

}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 withFilter:(int)a5 handler:(id)a6
{
  uint64_t v6;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = *(_QWORD *)&a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000375A4;
  v11[3] = &unk_1002BD1F0;
  v12 = a6;
  v13 = a4;
  v11[4] = self;
  v10 = v12;
  -[GKFriendServicePrivate getFriendIDsForPlayer:withFilter:commonFriends:handler:](self, "getFriendIDsForPlayer:withFilter:commonFriends:handler:", a3, v6, 0, v11);

}

- (void)getCommonFriendsForPlayer:(id)a3 handler:(id)a4
{
  -[GKFriendService getFriendsForPlayer:commonFriends:handler:](self, "getFriendsForPlayer:commonFriends:handler:", a3, 1, a4);
}

- (void)removeFriendWithPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  __objc2_meth_list *v14;
  GKRemoveFriendNetworkRequest *v15;
  void *v16;
  GKRemoveFriendNetworkRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 425, "-[GKFriendServicePrivate removeFriendWithPlayer:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  v11 = (void *)v10;
  v12 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v13 = (id)GKOSLoggers(v10);
    v12 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10003E614();
  v14 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
  if (v11)
  {
    v15 = [GKRemoveFriendNetworkRequest alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
    v17 = -[GKRemoveFriendNetworkRequest initWithFriendPlayerID:](v15, "initWithFriendPlayerID:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    objc_msgSend(v18, "writeToNetwork:clientProxy:handler:", v17, v19, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameStatServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v20, v21));

    v14 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
    objc_msgSend(v22, "expireGamesFriendsPlayed");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100037908;
    v27[3] = &unk_1002BB850;
    v28 = v11;
    v29 = v6;
    objc_msgSend(v9, "performOnManagedObjectContext:", v27);

  }
  if (v7)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = v14[254];
    v25[2] = sub_100037B68;
    v25[3] = &unk_1002BB450;
    v25[4] = self;
    v26 = v7;
    objc_msgSend(v9, "notifyOnQueue:block:", v24, v25);

  }
}

- (void)removeAllFriendsWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  v5 = v4;
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = (id)GKOSLoggers(v4);
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10003E678();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 468, "-[GKFriendServicePrivate removeAllFriendsWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = -[GKRemoveAllFriendsNetworkRequest initRequest]([GKRemoveAllFriendsNetworkRequest alloc], "initRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100037D38;
  v15[3] = &unk_1002BB8F0;
  v15[4] = self;
  v16 = v9;
  v17 = v5;
  v13 = v5;
  v14 = v9;
  objc_msgSend(v11, "writeToNetwork:clientProxy:handler:", v10, v12, v15);

}

- (void)getConcernsForPlayer:(id)a3 handler:(id)a4
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
  _QWORD v17[4];
  id v18;
  GKFriendServicePrivate *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 508, "-[GKFriendServicePrivate getConcernsForPlayer:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000381C0;
  v17[3] = &unk_1002BB4A0;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v11, "perform:", v17);
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003856C;
    v14[3] = &unk_1002BB450;
    v16 = v7;
    v15 = v11;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

- (void)reportConcern:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  GKFriendServicePrivate *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 544, "-[GKFriendServicePrivate reportConcern:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "player"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerID"));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
  v13 = (void *)v12;
  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000387E4;
    v20[3] = &unk_1002BC010;
    v21 = v11;
    v22 = v13;
    v23 = v6;
    v24 = self;
    v25 = v9;
    objc_msgSend(v25, "perform:", v20);

    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 17, 0));
  objc_msgSend(v9, "setError:", v14);

  if (v7)
  {
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003898C;
    v17[3] = &unk_1002BB450;
    v19 = v7;
    v18 = v9;
    objc_msgSend(v18, "notifyOnQueue:block:", v16, v17);

  }
LABEL_7:

}

- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4
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
  _QWORD v17[4];
  id v18;
  GKFriendServicePrivate *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 610, "-[GKFriendServicePrivate cancelFriendRequestWithIdentifier:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100038B9C;
  v17[3] = &unk_1002BB4A0;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v11, "perform:", v17);
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100038D00;
    v14[3] = &unk_1002BB450;
    v16 = v7;
    v15 = v11;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v19[0] = CFSTR("friend-code");
  v19[1] = CFSTR("send-push");
  v20[0] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v20[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038EBC;
  v16[3] = &unk_1002BCC88;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "issueRequest:bagKey:clientProxy:handler:", v11, CFSTR("gk-use-friend-code"), v13, v16);

}

- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKFriendServicePrivate *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  GKFriendServicePrivate *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 658, "-[GKFriendServicePrivate rejectFriendRequestWithIdentifier:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100039198;
  v22[3] = &unk_1002BB4A0;
  v10 = v6;
  v23 = v10;
  v24 = self;
  v11 = v9;
  v25 = v11;
  objc_msgSend(v11, "perform:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000392FC;
  v17[3] = &unk_1002BB518;
  v18 = v11;
  v19 = self;
  v20 = v10;
  v21 = v7;
  v14 = v7;
  v15 = v10;
  v16 = v11;
  objc_msgSend(v16, "notifyOnQueue:block:", v13, v17);

}

- (void)_invalidateCacheForFriendCode:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 684, "-[GKFriendServicePrivate _invalidateCacheForFriendCode:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039520;
  v19[3] = &unk_1002BB850;
  v20 = v6;
  v10 = v9;
  v21 = v10;
  v11 = v6;
  objc_msgSend(v10, "performOnManagedObjectContext:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000396CC;
  v16[3] = &unk_1002BB450;
  v17 = v10;
  v18 = v7;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)getPlayerActivityFeed:(id)a3 gameID:(id)a4 continuation:(id)a5 handler:(id)a6
{
  -[GKFriendServicePrivate getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:](self, "getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:", a3, a4, a5, 0, a6);
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 handler:(id)a6
{
  -[GKFriendServicePrivate getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:](self, "getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:", a3, a4, a5, 0, a6);
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 gameCategoryFilter:(id)a6 handler:(id)a7
{
  __CFString *v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  void *v34;
  id v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  id v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  GKFriendServicePrivate *v58;
  id v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  id v70;
  uint8_t buf[4];
  __CFString *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  __CFString *v76;
  __int16 v77;
  __CFString *v78;

  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v50 = v16;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v16);
  v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v72 = v12;
    v73 = 2112;
    v74 = v13;
    v75 = 2112;
    v76 = v14;
    v77 = 2112;
    v78 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "targetPlayerId: %@ bundleId: %@ continuation: %@ filter: %@", buf, 0x2Au);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDPlayerActivity _gkFetchRequest](GKCDPlayerActivity, "_gkFetchRequest"));
  v51 = v13;
  if (!v13
    || (objc_msgSend(v13, "isEqualToString:", GKDaemonIdentifier) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", GKGameCenterIdentifier) & 1) != 0)
  {
    v20 = CFSTR("NoGameId");
  }
  else
  {
    v20 = (__CFString *)v13;
  }
  v21 = CFSTR("NoContinuation");
  if (v14)
    v21 = v14;
  v22 = v21;
  v42 = v22;
  v23 = CFSTR("NoTargetPlayer");
  if (v12)
    v23 = v12;
  v24 = v23;
  v44 = v24;
  v25 = CFSTR("NoCategoryFilter");
  if (v15)
    v25 = v15;
  v47 = v25;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(continuation == %@) AND (gameID == %@) AND (targetPlayerID == %@) AND (gameCategoryFilter == %@)"), v22, v20, v24, v47));
  objc_msgSend(v19, "setPredicate:", v49);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 898, "-[GKFriendServicePrivate getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v26));

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10003A36C;
  v64[3] = &unk_1002BD310;
  v28 = v19;
  v65 = v28;
  v29 = v14;
  v66 = v29;
  v30 = v20;
  v67 = v30;
  v31 = v12;
  v68 = v31;
  v32 = v15;
  v69 = v32;
  v33 = v27;
  v70 = v33;
  objc_msgSend(v33, "performOnManagedObjectContext:", v64);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "replyQueue"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10003A604;
  v52[3] = &unk_1002BD3B0;
  v53 = v33;
  v54 = v30;
  v55 = v31;
  v56 = v29;
  v57 = v32;
  v58 = self;
  v59 = v28;
  v60 = v42;
  v61 = v44;
  v62 = v47;
  v63 = v50;
  v46 = v47;
  v45 = v44;
  v43 = v42;
  v35 = v28;
  v48 = v32;
  v36 = v29;
  v37 = v31;
  v38 = v30;
  v39 = v50;
  v40 = v33;
  objc_msgSend(v40, "notifyOnQueue:block:", v34, v52);

}

- (void)clearActivityFeedCacheWithHandler:(id)a3
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 1025, "-[GKFriendServicePrivate clearActivityFeedCacheWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003B2EC;
  v15[3] = &unk_1002BCCF0;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B3B8;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)expireFriendList
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring friends list", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 1046, "-[GKFriendServicePrivate expireFriendList]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  objc_msgSend(v6, "performOnManagedObjectContext:", &stru_1002BD3D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "replyQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B608;
  v9[3] = &unk_1002BBBD8;
  v9[4] = self;
  objc_msgSend(v6, "notifyOnQueue:block:", v8, v9);

}

- (void)removeMessageInboxEntries:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendServicePrivate messageInboxLocation](GKFriendServicePrivate, "messageInboxLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v7));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "friendCode", (_QWORD)v18));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "friendCode"));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendServicePrivate messageInboxLocation](GKFriendServicePrivate, "messageInboxLocation"));
    objc_msgSend(v8, "writeToFile:atomically:", v17, 1);

    os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
    v6[2](v6, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    ((void (**)(id, void *))v6)[2](v6, v8);
  }

}

- (void)getFakeActiveFriendRequests:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKFriendServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B918;
  v4[3] = &unk_1002BCA30;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKFriendServicePrivate getMessageInboxEntries:](v5, "getMessageInboxEntries:", v4);

}

- (void)didAccept:(BOOL)a3 friendRequest:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  GKFriendServicePrivate *v23;
  _QWORD *v24;
  BOOL v25;
  _QWORD v26[3];
  char v27;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 1320, "-[GKFriendServicePrivate didAccept:friendRequest:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v10));

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003CB14;
  v21[3] = &unk_1002BD5A0;
  v12 = v8;
  v25 = a3;
  v22 = v12;
  v23 = self;
  v24 = v26;
  objc_msgSend(v11, "perform:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003D230;
  v17[3] = &unk_1002BD5C8;
  v20 = v26;
  v17[4] = self;
  v15 = v9;
  v19 = v15;
  v16 = v11;
  v18 = v16;
  objc_msgSend(v16, "notifyOnQueue:block:", v14, v17);

  _Block_object_dispose(v26, 8);
}

- (void)notifyMessageBasedFriendRequestSentTo:(id)a3 nameKind:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = v5;
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v5);
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 1024;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKFriendService: notifyMessageBasedFriendRequestSentTo:%@ nameKind:%d", buf, 0x12u);
  }
  v14[0] = GKFriendRequestRecipientNameKey;
  v14[1] = GKFriendRequestRecipientNameKindKey;
  v15[0] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003D43C;
  v12[3] = &unk_1002BB918;
  v13 = v10;
  v11 = v10;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v12);

}

- (void)getFriendsLatestActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", 0, CFSTR("gk-get-friends-latest-activity"), 0, v5, v4, &stru_1002BD608);

}

- (void)getFriendInvitationMailboxWithType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v11 = CFSTR("type");
  v12 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v8, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v9, CFSTR("gk-get-friend-invitation-mailbox"), 0, v10, v6, &stru_1002BD648);

}

- (void)getCombinedFriendInvitationListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  if ((_os_feature_enabled_impl("GameCenter", "friending_via_push") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 1443, "-[GKFriendServicePrivate getCombinedFriendInvitationListWithCompletion:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v6, "setResult:", v7);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003D860;
    v18[3] = &unk_1002BB590;
    v18[4] = self;
    v8 = v6;
    v19 = v8;
    objc_msgSend(v8, "perform:", v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003DA18;
    v16[3] = &unk_1002BB590;
    v16[4] = self;
    v9 = v8;
    v17 = v9;
    objc_msgSend(v9, "perform:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003DD58;
    v13[3] = &unk_1002BB758;
    v14 = v9;
    v15 = v4;
    v12 = v9;
    objc_msgSend(v12, "notifyOnQueue:block:", v11, v13);

  }
  else
  {
    -[GKFriendServicePrivate getActiveFriendRequests:](self, "getActiveFriendRequests:", v4);
  }

}

- (void)sendFriendInvitationWithPlayerID:(id)a3 contactAssociationID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v11)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("receiving-player-id"));
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("receiving-player-caid"));
  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:](self, "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:", v10, CFSTR("gk-send-friend-invitation"), 0, v9);

}

- (void)acceptFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v9 = CFSTR("issuing-player-id");
  v10 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:](self, "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:", v8, CFSTR("gk-accept-friend-invitation"), 1, v6);
}

- (void)cancelFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v9 = CFSTR("receiving-player-id");
  v10 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:](self, "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:", v8, CFSTR("gk-cancel-friend-invitation"), 0, v6);
}

- (void)ignoreFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v9 = CFSTR("issuing-player-id");
  v10 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:](self, "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:", v8, CFSTR("gk-ignore-friend-invitation"), 1, v6);
}

- (void)sendResponselessWithRequest:(id)a3 bagKey:(id)a4 refreshFriendsRequestContents:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003E240;
  v16[3] = &unk_1002BD6E0;
  v18 = a5;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "issueRequest:bagKey:clientProxy:handler:", v12, v11, v14, v16);

}

@end
