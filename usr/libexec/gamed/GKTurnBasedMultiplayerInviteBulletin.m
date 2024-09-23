@implementation GKTurnBasedMultiplayerInviteBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 487, "+[GKTurnBasedMultiplayerInviteBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001435A8;
  v10[3] = &unk_1002BB758;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v10);

}

+ (BOOL)shouldLoadCacheList
{
  return 1;
}

+ (BOOL)shouldExpirePlayerList
{
  return 1;
}

- (void)assembleBulletin
{
  id v3;
  NSObject *v4;
  GKBulletinAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  GKBulletinAction *v12;
  void *v13;
  GKBulletinAction *v14;
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
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerInviteBulletin assembleBulletin", buf, 2u);
  }
  v5 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings APP_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "APP_STORE"));
    v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }
  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1)
      goto LABEL_10;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ACCEPT_INVITE_BUTTON_TITLE"));
    v11 = &GKNotificationCategoryActionsAcceptDecline;
  }
  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CLOSE_TURN_BASED_ALERT_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  v14 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_1002CE2A8);
  -[GKBulletinAction setIsDestructive:](v14, "setIsDestructive:", 1);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerBulletin customInviteSoundPathForBundleID:](self, "customInviteSoundPathForBundleID:", v17));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
    -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v20);

  }
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v21);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 200);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v23));
  -[GKBulletin setTitle:](self, "setTitle:", v24);

}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerInviteBulletin handleAction:", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMultiplayerInviteBulletin;
  v8 = -[GKTurnBasedMultiplayerBulletin handleAction:](&v12, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle multiplayer action: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")))
  {
    -[GKTurnBasedMultiplayerInviteBulletin handleAcceptAction](self, "handleAcceptAction");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("GKDeclined")))
  {
    -[GKTurnBasedMultiplayerInviteBulletin handleDeclineAction](self, "handleDeclineAction");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("GKExpired")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v11, "expireBulletin:", self);

  }
}

- (void)handleAcceptAction
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerInviteBulletin handleAcceptAction", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v5, "reportEvent:type:", GKReporterDomainTurnBased, GKReporterTurnBasedAccept);

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMultiplayerInviteBulletin;
  -[GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn](&v6, "acceptTurnBasedTurn");
}

- (void)handleDeclineAction
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerInviteBulletin handleDeclineAction", v5, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin declineTurnBasedInviteWithReason:](self, "declineTurnBasedInviteWithReason:", 1);
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerInviteBulletin loadDataWithHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 643, "-[GKTurnBasedMultiplayerInviteBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001445A4;
  v21[3] = &unk_1002BB590;
  v21[4] = self;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v11, "perform:", v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100144700;
  v19[3] = &unk_1002BB590;
  v19[4] = self;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v12, "perform:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100144908;
  v16[3] = &unk_1002BB450;
  v17 = v12;
  v18 = v5;
  v14 = v12;
  v15 = v5;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

@end
