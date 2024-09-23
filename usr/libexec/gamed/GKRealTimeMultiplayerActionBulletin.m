@implementation GKRealTimeMultiplayerActionBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 625, "+[GKRealTimeMultiplayerActionBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100149FE8;
  v11[3] = &unk_1002C0B88;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (void)loadDataWithHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD, _QWORD);
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin loadDataWithHandler", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 663, "-[GKRealTimeMultiplayerActionBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForInviteSessionToken:](GKClientProxy, "clientForInviteSessionToken:", v11));

  if (!v12)
  {
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(v13);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_10014E8EC();
      if (!v5)
        goto LABEL_12;
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GKMultiplayerInvite"), 0, 0));
    ((void (**)(_QWORD, void *))v5)[2](v5, v20);

    goto LABEL_12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  objc_msgSend(v15, "setBundleIdentifier:", v14);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10014A8B8;
  v26[3] = &unk_1002BB590;
  v26[4] = self;
  v16 = v9;
  v27 = v16;
  objc_msgSend(v16, "perform:", v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10014AA14;
  v24[3] = &unk_1002BB590;
  v24[4] = self;
  v17 = v16;
  v25 = v17;
  objc_msgSend(v17, "perform:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10014AB3C;
  v21[3] = &unk_1002BB450;
  v23 = v5;
  v22 = v17;
  objc_msgSend(v22, "notifyOnQueue:block:", v18, v21);

LABEL_12:
}

- (void)setInvitedPlayerRespondedWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  GKRealTimeMultiplayerActionBulletin *v20;
  id v21;
  SEL v22;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v5);
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin: setInvitedPlayerRespondedWithCompletionHandler", buf, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForInviteSessionToken:](GKClientProxy, "clientForInviteSessionToken:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 711, "-[GKRealTimeMultiplayerActionBulletin setInvitedPlayerRespondedWithCompletionHandler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10014AD78;
  v18[3] = &unk_1002BCDE0;
  v13 = v10;
  v19 = v13;
  v20 = self;
  v14 = v12;
  v21 = v14;
  v22 = a2;
  objc_msgSend(v14, "perform:", v18);
  if (v6)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10014BC30;
    v15[3] = &unk_1002BB450;
    v17 = v6;
    v16 = v14;
    objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v15);

  }
}

- (void)assembleBulletin
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin: assembleBulletin", v10, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForInviteSessionToken:](GKClientProxy, "clientForInviteSessionToken:", v5));

  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin customInviteSoundPathForBundleID:](self, "customInviteSoundPathForBundleID:", v7));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v9);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 401);
}

- (NSString)aggregateDictionaryKey
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("for subclasses only"));
  return 0;
}

- (id)getDebugLine
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("for subclasses only"));
  return 0;
}

- (id)getNotificationName
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("for subclasses only"));
  return 0;
}

- (BOOL)isAccept
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("for subclasses only"));
  return 0;
}

- (NSString)debugLine
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_debugLine, 0);
}

@end
