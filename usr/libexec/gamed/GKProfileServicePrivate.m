@implementation GKProfileServicePrivate

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
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
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  GKProfileServicePrivate *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1002BCF98));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));

  if (objc_msgSend(v12, "count") && objc_msgSend(v8, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1602, "-[GKProfileServicePrivate loadScopedPlayerIDs:gameBundleIDs:handler:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v13));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100033304;
    v27[3] = &unk_1002BCAA8;
    v27[4] = self;
    v15 = v12;
    v28 = v15;
    v16 = v8;
    v29 = v16;
    v17 = v14;
    v30 = v17;
    objc_msgSend(v17, "performOnManagedObjectContext:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000333AC;
    v21[3] = &unk_1002BCFC0;
    v22 = v17;
    v23 = v15;
    v24 = v16;
    v25 = self;
    v26 = v9;
    v20 = v17;
    objc_msgSend(v20, "notifyOnQueue:block:", v19, v21);

  }
  else
  {
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, &__NSArray0__struct, 0);
  }

}

+ (unint64_t)requiredEntitlements
{
  return 0x20000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKProfileServicePrivateInterface, a2);
}

- (void)setStatus:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  GKProfileServicePrivate *v26;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x8D)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", 140));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 608, "-[GKProfileServicePrivate setStatus:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002BD68;
  v22[3] = &unk_1002BC3A8;
  v15 = v12;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  v17 = v10;
  v25 = v17;
  v26 = self;
  objc_msgSend(v15, "performOnQueue:block:", v14, v22);

  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002BFD4;
    v19[3] = &unk_1002BB450;
    v21 = v7;
    v20 = v15;
    objc_msgSend(v20, "notifyOnQueue:block:", v18, v19);

  }
}

- (void)cachePhotos:(id)a3 avatarType:(id)a4 fileNames:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  GKProfileServicePrivate *v29;
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 641, "-[GKProfileServicePrivate cachePhotos:avatarType:fileNames:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002C208;
  v26[3] = &unk_1002BC010;
  v18 = v15;
  v27 = v18;
  v19 = v11;
  v28 = v19;
  v29 = self;
  v20 = v10;
  v30 = v20;
  v21 = v12;
  v31 = v21;
  objc_msgSend(v18, "performOnQueue:block:", v17, v26);

  if (v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002C4C4;
    v24[3] = &unk_1002BB540;
    v25 = v13;
    objc_msgSend(v18, "notifyOnQueue:block:", v23, v24);

  }
}

- (void)setPhotoData:(id)a3 avatarType:(id)a4 handler:(id)a5
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
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  GKProfileServicePrivate *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 673, "-[GKProfileServicePrivate setPhotoData:avatarType:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002C69C;
  v22[3] = &unk_1002BC3A8;
  v15 = v12;
  v23 = v15;
  v24 = self;
  v16 = v8;
  v25 = v16;
  v17 = v9;
  v26 = v17;
  objc_msgSend(v15, "performOnQueue:block:", v14, v22);

  if (v10)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002CA18;
    v20[3] = &unk_1002BB540;
    v21 = v10;
    objc_msgSend(v15, "notifyOnQueue:block:", v19, v20);

  }
}

- (void)deletePhotoWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  GKProfileServicePrivate *v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKProfileService: deletePhotoWithHandler", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 709, "-[GKProfileServicePrivate deletePhotoWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002CC00;
  v17[3] = &unk_1002BB590;
  v12 = v9;
  v18 = v12;
  v19 = self;
  objc_msgSend(v12, "performOnQueue:block:", v11, v17);

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002CE3C;
    v15[3] = &unk_1002BB540;
    v16 = v5;
    objc_msgSend(v12, "notifyOnQueue:block:", v14, v15);

  }
}

- (void)setFindable:(BOOL)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKProfileServicePrivate *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 739, "-[GKProfileServicePrivate setFindable:handler:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002CF5C;
  v12[3] = &unk_1002BCB20;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "performBlock:", v12);

}

- (void)setPlayerNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GKProfileServicePrivate *v23;
  id v24;
  int64_t v25;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 766, "-[GKProfileServicePrivate setPlayerNickname:suggestionsCount:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002D3F0;
  v21[3] = &unk_1002BCB70;
  v25 = a4;
  v22 = v8;
  v23 = self;
  v12 = v11;
  v24 = v12;
  v13 = v8;
  objc_msgSend(v12, "performOnManagedObjectContext:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002D898;
  v18[3] = &unk_1002BB450;
  v19 = v12;
  v20 = v9;
  v16 = v12;
  v17 = v9;
  objc_msgSend(v16, "notifyOnQueue:block:", v15, v18);

}

- (void)getSuggestionsForNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
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
  _QWORD v23[4];
  id v24;
  GKProfileServicePrivate *v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v8 = a5;
  v27[0] = CFSTR("player-nickname");
  v27[1] = CFSTR("suggestions-count");
  v28[0] = a3;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v28[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 816, "-[GKProfileServicePrivate getSuggestionsForNickname:suggestionsCount:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002DB48;
  v23[3] = &unk_1002BB4A0;
  v24 = v11;
  v25 = self;
  v14 = v13;
  v26 = v14;
  v15 = v11;
  objc_msgSend(v14, "perform:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002DD34;
  v20[3] = &unk_1002BB450;
  v21 = v14;
  v22 = v8;
  v18 = v14;
  v19 = v8;
  objc_msgSend(v18, "notifyOnQueue:block:", v17, v20);

}

- (void)getTermsAndConditionsURLWithHandler:(id)a3
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
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKProfileServicePrivate *v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;

  v4 = a3;
  v21 = CFSTR("key");
  v22 = CFSTR("TD.termsOfServiceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 840, "-[GKProfileServicePrivate getTermsAndConditionsURLWithHandler:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002DF70;
  v17[3] = &unk_1002BB4A0;
  v18 = v5;
  v19 = self;
  v8 = v7;
  v20 = v8;
  v9 = v5;
  objc_msgSend(v8, "perform:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E158;
  v14[3] = &unk_1002BB450;
  v15 = v8;
  v16 = v4;
  v12 = v8;
  v13 = v4;
  objc_msgSend(v12, "notifyOnQueue:block:", v11, v14);

}

- (void)setGlobalFriendListAccess:(int)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  int v19;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 862, "-[GKProfileServicePrivate setGlobalFriendListAccess:handler:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v7));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E31C;
  v17[3] = &unk_1002BCC10;
  v19 = a3;
  v17[4] = self;
  v9 = v8;
  v18 = v9;
  objc_msgSend(v9, "performOnManagedObjectContext:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E5AC;
  v14[3] = &unk_1002BB450;
  v15 = v9;
  v16 = v6;
  v12 = v9;
  v13 = v6;
  objc_msgSend(v12, "notifyOnQueue:block:", v11, v14);

}

- (void)setArcadeSubscriptionExpiration:(id)a3 handler:(id)a4
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
  GKProfileServicePrivate *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 904, "-[GKProfileServicePrivate setArcadeSubscriptionExpiration:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002E778;
  v19[3] = &unk_1002BB4A0;
  v20 = v6;
  v21 = self;
  v10 = v9;
  v22 = v10;
  v11 = v6;
  objc_msgSend(v10, "perform:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002E8CC;
  v16[3] = &unk_1002BB450;
  v17 = v10;
  v18 = v7;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)allowFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
  -[GKProfileServicePrivate setFriendInvitesAllowedFlag:source:handler:](self, "setFriendInvitesAllowedFlag:source:handler:", CFSTR("allowed"), a3, a4);
}

- (void)denyFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
  -[GKProfileServicePrivate setFriendInvitesAllowedFlag:source:handler:](self, "setFriendInvitesAllowedFlag:source:handler:", CFSTR("denied"), a3, a4);
}

- (void)setFriendInvitesAllowedFlag:(id)a3 source:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD);
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKProfileService: setFriendInvitesAllowedFlag: %@, source: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = v15;
  if ((a4 & 1) != 0)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("allow-friend-invites-from-challenges"));
  if ((a4 & 2) != 0)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, CFSTR("allow-friend-invites-from-multiplayer-invites"));
  if (objc_msgSend(v16, "count"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002EB30;
    v18[3] = &unk_1002BCC38;
    v19 = v10;
    -[GKProfileServicePrivate setProfileSettings:handler:](self, "setProfileSettings:handler:", v16, v18);
    v17 = v19;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:description:](NSError, "userErrorForCode:description:", 17, CFSTR("At least one source must be selected")));
    ((void (**)(_QWORD, void *))v10)[2](v10, v17);
  }

}

- (void)setPrivacyNoticeVersion:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  unint64_t v23;

  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKDaemon;
  v10 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v10)
  {
    *(_DWORD *)buf = 134217984;
    v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKProfileService: setPrivacyNoticeVersion:%lu", buf, 0xCu);
  }
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v10);
  v12 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412290;
    v23 = (unint64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Syncing the privacy notice version (%@) to the server...", buf, 0xCu);

  }
  v20 = GKAccountPrivacyNoticeVersionKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002EE40;
  v18[3] = &unk_1002BCC38;
  v19 = v7;
  v17 = v7;
  -[GKProfileServicePrivate setProfileSettings:handler:](self, "setProfileSettings:handler:", v16, v18);

}

- (void)setProfilePrivacy:(int)a3 handler:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  __CFString *v26;
  GKProfileServicePrivate *v27;
  id v28;
  int v29;
  uint8_t buf[4];
  const __CFString *v31;

  v6 = a4;
  v7 = v6;
  v8 = CFSTR("everyone");
  if (a3 == 2)
    v8 = CFSTR("me");
  if (a3 == 1)
    v9 = CFSTR("friends");
  else
    v9 = v8;
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v6);
  v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKProfileService: setProfilePrivacy:%@", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 991, "-[GKProfileServicePrivate setProfilePrivacy:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002F19C;
  v25[3] = &unk_1002BCC60;
  v29 = a3;
  v26 = (__CFString *)v9;
  v27 = self;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v15, "performOnManagedObjectContext:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002F464;
  v21[3] = &unk_1002BB568;
  v22 = v15;
  v23 = v14;
  v24 = v7;
  v18 = v7;
  v19 = v14;
  v20 = v15;
  objc_msgSend(v20, "notifyOnQueue:block:", v17, v21);

}

- (void)setProfileSettings:(id)a3 handler:(id)a4
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
  GKProfileServicePrivate *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1035, "-[GKProfileServicePrivate setProfileSettings:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002F658;
  v19[3] = &unk_1002BB8A0;
  v20 = v6;
  v21 = self;
  v10 = v9;
  v22 = v10;
  v11 = v6;
  objc_msgSend(v10, "performOnManagedObjectContext:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002F808;
  v16[3] = &unk_1002BB450;
  v17 = v10;
  v18 = v7;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)invalidateCachedProfileForLocalPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1060, "-[GKProfileServicePrivate invalidateCachedProfileForLocalPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  objc_msgSend(v6, "performOnManagedObjectContext:", &stru_1002BCCC8);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "replyQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002F9E0;
    v9[3] = &unk_1002BB540;
    v10 = v4;
    objc_msgSend(v6, "notifyOnQueue:block:", v8, v9);

  }
}

- (void)getProfilePrivacyWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKProfileService: getProfilePrivacyWithHandler", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1077, "-[GKProfileServicePrivate getProfilePrivacyWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002FBA0;
  v18[3] = &unk_1002BCCF0;
  v10 = v9;
  v19 = v10;
  objc_msgSend(v10, "performOnManagedObjectContext:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002FC38;
  v15[3] = &unk_1002BB758;
  v16 = v10;
  v17 = v5;
  v13 = v5;
  v14 = v10;
  objc_msgSend(v14, "notifyOnQueue:block:", v12, v15);

}

- (id)contactsIntegrationController
{
  return +[GKContactsIntegrationController sharedController](GKContactsIntegrationController, "sharedController");
}

- (void)getContactsIntegrationConsentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKProfileService: getContactsIntegrationConsentWithCompletionHandler", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1100, "-[GKProfileServicePrivate getContactsIntegrationConsentWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002FE48;
  v18[3] = &unk_1002BCCF0;
  v10 = v9;
  v19 = v10;
  objc_msgSend(v10, "performOnManagedObjectContext:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002FF9C;
  v15[3] = &unk_1002BB758;
  v16 = v10;
  v17 = v5;
  v13 = v5;
  v14 = v10;
  objc_msgSend(v14, "notifyOnQueue:block:", v12, v15);

}

- (void)setContactsIntegrationConsent:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  int v25;
  uint8_t buf[4];
  int v27;

  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKProfileService: setContactsIntegrationConsent:%d", buf, 8u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1119, "-[GKProfileServicePrivate setContactsIntegrationConsent:withCompletionHandler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10003020C;
  v23[3] = &unk_1002BCC10;
  v25 = a3;
  v23[4] = self;
  v13 = v11;
  v24 = v13;
  objc_msgSend(v13, "performOnManagedObjectContext:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100030790;
  v19[3] = &unk_1002BB568;
  v20 = v13;
  v21 = v12;
  v22 = v7;
  v16 = v7;
  v17 = v12;
  v18 = v13;
  objc_msgSend(v18, "notifyOnQueue:block:", v15, v19);

}

- (void)updateContactsIntegrationInfoFromLocalPlayerProfile:(id)a3 completionHandler:(id)a4
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKProfileServicePrivate updateContactsIntegrationInfoFromLocalPlayerProfile:completionHandler:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKProfileServicePrivate updateContactsIntegrationInfoFromLocalPlayerProfile:completionHandler:]", objc_msgSend(v13, "UTF8String"), 1187));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactsAssociationID"));
  v17 = objc_msgSend(v6, "contactsIntegrationConsent");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceLastUpdatedTimestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v20 = objc_msgSend(v19, "environment");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100030A18;
  v22[3] = &unk_1002BC0D0;
  v23 = v7;
  v21 = v7;
  objc_msgSend(v15, "setContactAssociationID:contactIntegrationConsent:serviceLastUpdateTimestamp:forEnvironment:forcefully:completionHandler:", v16, v17, v18, v20, 0, v22);

}

- (void)getGameCenterRelationshipsForContact:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[5];
  id v25;
  id v26;
  BOOL v27;

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v9)
  {
    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1221, "-[GKProfileServicePrivate getGameCenterRelationshipsForContact:shouldRefresh:completionHandler:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100030C88;
      v24[3] = &unk_1002BBAD8;
      v24[4] = self;
      v25 = v8;
      v27 = a4;
      v13 = v12;
      v26 = v13;
      objc_msgSend(v13, "perform:", v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100030DF0;
      v21[3] = &unk_1002BB450;
      v22 = v13;
      v23 = v10;
      v16 = v13;
      objc_msgSend(v16, "notifyOnQueue:block:", v15, v21);

    }
    else
    {
      if (!os_log_GKGeneral)
        v19 = (id)GKOSLoggers(v9);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_1000355BC();
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKContactsIntegrationErrorDomain, 8, 0));
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v20);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(0);
    v18 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10003552C(v18, v8);
  }

}

- (void)getContactAssociationIDsForContacts:(id)a3 shouldRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  _QWORD v23[5];
  id v24;
  id v25;
  BOOL v26;

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v9)
  {
    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1256, "-[GKProfileServicePrivate getContactAssociationIDsForContacts:shouldRefresh:completionHandler:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000310A8;
      v23[3] = &unk_1002BBAD8;
      v23[4] = self;
      v24 = v8;
      v26 = a4;
      v13 = v12;
      v25 = v13;
      objc_msgSend(v13, "perform:", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000312E8;
      v20[3] = &unk_1002BB450;
      v21 = v13;
      v22 = v10;
      v16 = v13;
      objc_msgSend(v16, "notifyOnQueue:block:", v15, v20);

    }
    else
    {
      if (!os_log_GKGeneral)
        v18 = (id)GKOSLoggers(v9);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_1000355BC();
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKContactsIntegrationErrorDomain, 8, 0));
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v19);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1000355E8();
  }

}

- (void)clearContactsIntegrationCachesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKProfileServicePrivate contactsIntegrationController](self, "contactsIntegrationController"));
  objc_msgSend(v5, "clearCachesWithCompletionHandler:", v4);

}

- (void)startContactsIntegrationSyncWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKProfileServicePrivate contactsIntegrationController](self, "contactsIntegrationController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031434;
  v9[3] = &unk_1002BB540;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "startWithOptions:completion:", a3, v9);

}

- (void)startContactsIntegrationIDSSyncForHandles:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKProfileServicePrivate contactsIntegrationController](self, "contactsIntegrationController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031568;
  v11[3] = &unk_1002BB6E8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "syncIDSDataForHandles:forcefully:completion:", v10, 1, v11);

}

- (void)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withCompletion:(id)a4
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
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1325, "-[GKProfileServicePrivate filterForContactIDsSupportingFriendingViaPushFromContactIDs:withCompletion:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100031774;
  v19[3] = &unk_1002BB8A0;
  v19[4] = self;
  v10 = v9;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  objc_msgSend(v10, "performOnManagedObjectContext:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031804;
  v16[3] = &unk_1002BB450;
  v17 = v10;
  v18 = v7;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)getProfilesForPlayerIDs:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
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
  id v23;
  unint64_t v24;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1347, "-[GKProfileServicePrivate getProfilesForPlayerIDs:fetchOptions:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000319EC;
  v21[3] = &unk_1002BCDE0;
  v21[4] = self;
  v22 = v8;
  v12 = v11;
  v23 = v12;
  v24 = a4;
  v13 = v8;
  objc_msgSend(v12, "perform:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100031BE0;
  v18[3] = &unk_1002BB758;
  v19 = v12;
  v20 = v9;
  v16 = v9;
  v17 = v12;
  objc_msgSend(v17, "notifyOnQueue:block:", v15, v18);

}

- (void)loadProfileForPlayer:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  GKProfileServicePrivate *v29;
  id v30;
  _QWORD *v31;
  unsigned __int8 v32;
  _QWORD v33[4];
  id v34;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  if (v10)
  {
    v34 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1394, "-[GKProfileServicePrivate loadProfileForPlayer:pieces:context:handler:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v15, v11, v16));

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100031F74;
    v26[3] = &unk_1002BCE58;
    v27 = v10;
    v18 = v14;
    v32 = a4;
    v28 = v18;
    v29 = self;
    v19 = v17;
    v30 = v19;
    v31 = v33;
    objc_msgSend(v19, "performOnManagedObjectContext:", v26);
    if (v13)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000324CC;
      v22[3] = &unk_1002BBD40;
      v24 = v13;
      v25 = v33;
      v23 = v19;
      objc_msgSend(v23, "notifyOnQueue:block:", v21, v22);

    }
  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, double))v12 + 2))(v12, 0, 0.0);
  }
  _Block_object_dispose(v33, 8);

}

- (void)preloadInstalledGamesScopedPlayerIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032650;
  v13[3] = &unk_1002BB540;
  v7 = a4;
  v14 = v7;
  v8 = objc_retainBlock(v13);
  if (objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKGameServicePrivate, "serviceFromService:", self));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100032664;
    v10[3] = &unk_1002BCED0;
    v12 = v8;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "fetchInstalledGameIdCacheWithHandler:", v10);

  }
  else
  {
    ((void (*)(_QWORD *))v8[2])(v8);
  }

}

+ (id)scopedIDsFetchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDScopedIds _gkFetchRequest](GKCDScopedIds, "_gkFetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerId IN %@ AND gameBundleId IN %@ AND fetchedOn != nil"), v6, v5));

  objc_msgSend(v7, "setPredicate:", v8);
  return v7;
}

- (id)filterPlayerIDsThatNeedPreloading:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSExpressionDescription *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  void *v40;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]", objc_msgSend(v15, "UTF8String"), 1544));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:](GKProfileServicePrivate, "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:", v7, v8));
  v18 = objc_opt_new(NSExpressionDescription);
  -[NSExpressionDescription setName:](v18, "setName:", CFSTR("gameBundleIDCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", CFSTR("gameBundleId")));
  v40 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("count:"), v20));
  -[NSExpressionDescription setExpression:](v18, "setExpression:", v21);

  -[NSExpressionDescription setExpressionResultType:](v18, "setExpressionResultType:", 200);
  v39[0] = CFSTR("playerId");
  v39[1] = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  objc_msgSend(v17, "setPropertiesToFetch:", v22);

  objc_msgSend(v17, "setPropertiesToGroupBy:", &off_1002DC5A8);
  objc_msgSend(v17, "setResultType:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSExpressionDescription name](v18, "name"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForVariable:](NSExpression, "expressionForVariable:", v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@ >= %d"), v24, objc_msgSend(v8, "count")));
  objc_msgSend(v17, "setHavingPredicate:", v25);

  v38 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v17, &v38));
  v27 = v38;
  v28 = v27;
  if (v27)
  {
    if (!os_log_GKGeneral)
      v29 = (id)GKOSLoggers(v27);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100035970();
    v30 = &__NSArray0__struct;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_gkMapWithBlock:", &stru_1002BCF10));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v31));

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100033068;
    v36[3] = &unk_1002BCF38;
    v37 = v32;
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v36));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v34));

  }
  return v30;
}

- (id)fetchScopedIDsCacheKeysWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]", objc_msgSend(v15, "UTF8String"), 1573));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:](GKProfileServicePrivate, "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:", v7, v8));
  objc_msgSend(v17, "setPropertiesToFetch:", &off_1002DC5C0);
  objc_msgSend(v17, "setResultType:", 2);
  v22 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v17, &v22));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_gkMapWithBlock:", &stru_1002BCF58));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));

  return v20;
}

+ (id)makeGKScopedIDsFromInternal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gamePlayerId"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "teamPlayerId"));
    v6 = objc_msgSend(v5, "length");

    if (!v6)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gameBundleId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gamePlayerId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "teamPlayerId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKScopedIDs makePersistentWithPlayerID:gameBundleID:gamePlayerID:teamPlayerID:](GKScopedIDs, "makePersistentWithPlayerID:gameBundleID:gamePlayerID:teamPlayerID:", v4, v7, v8, v9));

  }
  else
  {
    v10 = 0;
  }

LABEL_7:
  return v10;
}

- (id)loadCachedScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 error:(id *)a5 moc:(id)a6
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_t current_queue;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v32;
  id v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];

  v8 = a3;
  v9 = a4;
  v10 = a6;
  current_queue = dispatch_get_current_queue();
  v12 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v12, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v14, "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]", objc_msgSend(v16, "UTF8String"), 1673));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }

  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:](GKProfileServicePrivate, "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:", v8, v9));
    v40 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executeFetchRequest:error:", v18, &v40));
    v20 = v40;
    v21 = v20;
    if (v20)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      v22 = &__NSArray0__struct;
    }
    else
    {
      v32 = v18;
      v34 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v24 = v19;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100033C20;
            v35[3] = &unk_1002BCFE8;
            v35[4] = v29;
            if ((objc_msgSend(v23, "_gkContainsObjectPassingTest:", v35) & 1) == 0)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[GKProfileServicePrivate makeGKScopedIDsFromInternal:](GKProfileServicePrivate, "makeGKScopedIDsFromInternal:", v29));
              if (v30)
                objc_msgSend(v23, "addObject:", v30);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v26);
      }

      v22 = objc_msgSend(v23, "copy");
      v8 = v34;
      v18 = v32;
      v21 = 0;
    }

  }
  else
  {
    v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)cacheKeyForScopedIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gameBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKProfileServicePrivate cacheKeyForScopedIDsWithGameBundleID:playerID:](GKProfileServicePrivate, "cacheKeyForScopedIDsWithGameBundleID:playerID:", v4, v5));
  return v6;
}

+ (id)cacheKeyForScopedIDsWithGameBundleID:(id)a3 playerID:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 cachedScopedIDs:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "_gkMapWithBlock:", &stru_1002BD028));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

  -[GKProfileServicePrivate fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:](self, "fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:", v12, v11, v14, 0, v10);
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDsCacheKeys:(id)a5 cacheOnly:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  BOOL v37;
  _QWORD v38[6];
  id v39;
  id v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[4];
  id v47;
  _BYTE v48[128];

  v12 = a3;
  v33 = a5;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKScopedIDsUtils filterUnsupportedGameBundleIDs:](GKScopedIDsUtils, "filterUnsupportedGameBundleIDs:", a4));
  if (objc_msgSend(v14, "count"))
  {
    v32 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKScopedIDsUtils batchRequestWithPlayerIDs:gameBundleIDs:desiredSize:](GKScopedIDsUtils, "batchRequestWithPlayerIDs:gameBundleIDs:desiredSize:", v12, v14, 1000));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1749, "-[GKProfileServicePrivate fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10003418C;
          v38[3] = &unk_1002BD050;
          v38[4] = self;
          v38[5] = v23;
          v39 = v33;
          v41 = a6;
          v40 = v17;
          objc_msgSend(v40, "perform:", v38);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v20);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100034370;
    v34[3] = &unk_1002BD078;
    v37 = a6;
    v35 = v17;
    v36 = v13;
    v26 = v17;
    v27 = v13;
    objc_msgSend(v26, "notifyOnQueue:block:", v25, v34);

    v12 = v32;
  }
  else
  {
    v28 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v29 = (id)GKOSLoggers(0);
      v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_100035AF0();
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034174;
    block[3] = &unk_1002BB540;
    v47 = v13;
    v18 = v13;
    dispatch_async(v31, block);

    v27 = v47;
  }

}

- (void)fetchAndCacheScopedPlayerIDsForRequest:(id)a3 scopedIDsCacheKeys:(id)a4 cacheOnly:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100034660;
  v17[3] = &unk_1002BD0C8;
  v18 = v10;
  v19 = v11;
  v17[4] = self;
  v20 = a5;
  v15 = v10;
  v16 = v11;
  objc_msgSend(v13, "issueRequest:bagKey:clientProxy:handler:", v12, CFSTR("gk-get-scoped-ids"), v14, v17);

}

- (void)clearScopedIdsCacheWithHandler:(id)a3
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 1848, "-[GKProfileServicePrivate clearScopedIdsCacheWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100034DBC;
  v15[3] = &unk_1002BCCF0;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100034E88;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

+ (id)parseContactAssociationIDsFromRelationships:(id)a3 contactAssociationIDMap:(id)a4 contacts:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v18;

  v8 = sub_10016CBB4(0, &qword_100316BB0, GKContactRelationshipResult_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v11 = sub_10016CBB4(0, (unint64_t *)&qword_100314D70, CNContact_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  v13 = sub_1001B6C94(v9, v10, v12);
  swift_bridgeObjectRelease(v9, v14);
  swift_bridgeObjectRelease(v10, v15);
  swift_bridgeObjectRelease(v12, v16);
  sub_1001B71A0();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13, v18);
  return isa;
}

@end
