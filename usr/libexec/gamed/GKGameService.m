@implementation GKGameService

+ (unint64_t)requiredEntitlements
{
  return 16;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameServiceInterface, a2);
}

+ (id)sharedGameActivityStore
{
  if (qword_100317E38 != -1)
    dispatch_once(&qword_100317E38, &stru_1002BD700);
  return (id)qword_100317E30;
}

- (void)getArcadeHighlightForAdamID:(id)a3 count:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  GKGameService *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  if (qword_100317E40 != -1)
    dispatch_once(&qword_100317E40, &stru_1002BD720);
  v10 = objc_alloc((Class)ASCCollectionRequest);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003F250;
  v14[3] = &unk_1002BD7C0;
  v15 = objc_msgSend(v10, "initWithID:kind:context:limit:", ASCCollectionIDGamesForYou, ASCLockupKindApp, ASCLockupContextGameCenter, a4);
  v16 = v8;
  v17 = self;
  v18 = v9;
  v11 = v8;
  v12 = v9;
  v13 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (void)getPerGameSettingsForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKGameService *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 152, "-[GKGameService getPerGameSettingsForBundleID:handler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003FB68;
    v17[3] = &unk_1002BB8A0;
    v18 = v6;
    v19 = self;
    v10 = v9;
    v20 = v10;
    objc_msgSend(v10, "performOnManagedObjectContext:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004013C;
    v14[3] = &unk_1002BB758;
    v15 = v10;
    v16 = v7;
    v13 = v10;
    objc_msgSend(v13, "notifyOnQueue:block:", v12, v14);

  }
}

- (void)setPerGameSettings:(id)a3 handler:(id)a4
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
  GKGameService *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 218, "-[GKGameService setPerGameSettings:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004031C;
  v19[3] = &unk_1002BB8A0;
  v20 = v6;
  v10 = v9;
  v21 = v10;
  v22 = self;
  v11 = v6;
  objc_msgSend(v10, "performOnManagedObjectContext:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100040A70;
  v16[3] = &unk_1002BB450;
  v17 = v10;
  v18 = v7;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)getPerGameFriendsForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 321, "-[GKGameService getPerGameFriendsForBundleID:handler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100040C4C;
    v17[3] = &unk_1002BB4A0;
    v17[4] = self;
    v18 = v6;
    v10 = v9;
    v19 = v10;
    objc_msgSend(v10, "perform:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100040FBC;
    v14[3] = &unk_1002BB450;
    v15 = v10;
    v16 = v7;
    v13 = v10;
    objc_msgSend(v13, "notifyOnQueue:block:", v12, v14);

  }
}

- (void)checkTCCAuthorization:(id)a3
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 369, "-[GKGameService checkTCCAuthorization:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100041180;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000412D0;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)resetTCCAuthorization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 394, "-[GKGameService resetTCCAuthorization:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000414A8;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v16 = v8;
  v9 = v8;
  objc_msgSend(v6, "perform:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004154C;
  v13[3] = &unk_1002BB540;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v6, "notifyOnQueue:block:", v11, v13);

}

- (void)_getPerGameFriendsPlayerIDForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKGameService *v19;
  id v20;
  Block_layout *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 419, "-[GKGameService _getPerGameFriendsPlayerIDForBundleID:handler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100041948;
    v17[3] = &unk_1002BD8F0;
    v18 = v6;
    v19 = self;
    v10 = v9;
    v20 = v10;
    v21 = &stru_1002BD878;
    objc_msgSend(v10, "performOnManagedObjectContext:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004222C;
    v14[3] = &unk_1002BB758;
    v15 = v10;
    v16 = v7;
    v13 = v10;
    objc_msgSend(v13, "notifyOnQueue:block:", v12, v14);

  }
}

- (void)storeGameForBundleIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  GKGameService *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Add games: %@ ", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKProfileServicePrivate, "serviceFromService:", self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));

  v15 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m", 521, "-[GKGameService storeGameForBundleIDs:completion:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v16, 0));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100042558;
  v33[3] = &unk_1002BB8A0;
  v34 = v6;
  v35 = v15;
  v18 = v17;
  v36 = v18;
  v19 = v15;
  v20 = v6;
  objc_msgSend(v18, "performOnManagedObjectContext:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000427E0;
  v27[3] = &unk_1002BD918;
  v28 = v18;
  v29 = v14;
  v31 = self;
  v32 = v8;
  v30 = v11;
  v23 = v11;
  v24 = v8;
  v25 = v14;
  v26 = v18;
  objc_msgSend(v26, "notifyOnQueue:block:", v22, v27);

}

- (void)fetchMostRecentGameActivityForBundleID:(id)a3 handler:(id)a4
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
  v9[2] = sub_100042A98;
  v9[3] = &unk_1002BD940;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "fetchAndRemoveLatestActivityWithBundleID:completionHandler:", v6, v9);

}

@end
