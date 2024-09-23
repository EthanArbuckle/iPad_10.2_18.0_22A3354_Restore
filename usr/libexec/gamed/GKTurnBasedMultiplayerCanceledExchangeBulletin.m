@implementation GKTurnBasedMultiplayerCanceledExchangeBulletin

+ (BOOL)shouldLoadCacheData
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedExchangeCanceled;
}

- (void)loadDataWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 944, "-[GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001455A8;
  v21[3] = &unk_1002BB590;
  v21[4] = self;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v11, "perform:", v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100145704;
  v19[3] = &unk_1002BB590;
  v19[4] = self;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v12, "perform:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10014582C;
  v16[3] = &unk_1002BB450;
  v17 = v12;
  v18 = v5;
  v14 = v12;
  v15 = v5;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (void)loadBulletinMessageWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerCanceledExchangeBulletin loadBulletinMessageWithHandler:", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001459D8;
  v12[3] = &unk_1002BB590;
  v12[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("loadBulletinMessageWithHandler")));
  v13 = v8;
  objc_msgSend(v8, "perform:", v12);
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100145E7C;
    v9[3] = &unk_1002BB450;
    v11 = v5;
    v10 = v8;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v9);

  }
}

@end
