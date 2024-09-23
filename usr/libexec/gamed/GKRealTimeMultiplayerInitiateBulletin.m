@implementation GKRealTimeMultiplayerInitiateBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 300, "+[GKRealTimeMultiplayerInitiateBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100147E64;
  v10[3] = &unk_1002BB758;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v10);

}

- (GKRealTimeMultiplayerInitiateBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerInitiateBulletin *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin initWithPushNotification:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v11, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKInviteIsReinvite));
    v8->_isReconnect = objc_msgSend(v9, "BOOLValue");

  }
  return v8;
}

- (GKRealTimeMultiplayerInitiateBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerInitiateBulletin *v8;
  id v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin initWithCoder:", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v12, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("isReconnect"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_isReconnect = objc_msgSend(v10, "BOOLValue");

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin encodeWithCoder:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKRealTimeMultiplayerInitiateBulletin isReconnect](self, "isReconnect")));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("isReconnect"));

}

- (void)parseClientData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  char *v9;
  unsigned __int8 v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  __int16 v15[8];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v15[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin parseClientData:", (uint8_t *)v15, 2u);
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    v8 = objc_retainAutorelease(v5);
    -[GKRealTimeMultiplayerBulletin setServerHosted:](self, "setServerHosted:", *((unsigned __int8 *)objc_msgSend(v8, "bytes") + 1));
    v9 = (char *)objc_msgSend(v8, "length");
    v10 = -[GKRealTimeMultiplayerBulletin inviteVersionFromMessage:](self, "inviteVersionFromMessage:", v8);
    if (!v10)
    {
      v11 = v9 - 2;
      if (!v11)
        goto LABEL_9;
      goto LABEL_8;
    }
    v11 = v9 - 4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v10));
    -[GKRealTimeMultiplayerBulletin setInviteVersion:](self, "setInviteVersion:", v12);

    if (v11)
    {
LABEL_8:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 2, v11));
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v13, 4);
      -[GKBulletin setMessage:](self, "setMessage:", v14);

    }
  }
LABEL_9:

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
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin assembleBulletin:", buf, 2u);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  -[GKBulletinAction setInAlertView:](v12, "setInAlertView:", 0);
  -[GKBulletinAction setIsDestructive:](v12, "setIsDestructive:", 1);
  v14 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_1002CE2A8);
  v16 = -[GKBulletinAction setIsDestructive:](v14, "setIsDestructive:", 1);
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v16);
  v18 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Action Set", v32, 2u);
  }
  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin customInviteSoundPathForBundleID:](self, "customInviteSoundPathForBundleID:", v20));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v22);

  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v12);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v23);

  v24 = -[GKBulletin setBulletinType:](self, "setBulletinType:", 400);
  if (!os_log_GKGeneral)
    v25 = (id)GKOSLoggers(v24);
  v26 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Data Set", v31, 2u);
  }
  if (-[GKRealTimeMultiplayerInitiateBulletin isReconnect](self, "isReconnect"))
    v27 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_RECONNECT_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_RECONNECT_NOTIFICATION_TITLE"));
  else
    v27 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v28 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v29));
  -[GKBulletin setTitle:](self, "setTitle:", v30);

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
  __int16 v15;
  GKRealTimeMultiplayerInitiateBulletin *v16;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleAction:", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  v8 = -[GKBulletin handleAction:](&v12, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle multiplayer action: %@ bulletin: %@", buf, 0x16u);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")))
  {
    -[GKRealTimeMultiplayerInitiateBulletin handleAcceptAction](self, "handleAcceptAction");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKDeclined")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDismissed")))
  {
    -[GKRealTimeMultiplayerInitiateBulletin handleDeclineAction](self, "handleDeclineAction");
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleAcceptAction", (uint8_t *)&v21, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acceptedInviteManager"));

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
    v11 = objc_msgSend(v10, "integerValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v13 = objc_msgSend(v12, "maximumInviteVersionSupported");

    if (v11 <= v13)
    {
      objc_msgSend(v9, "addMultiplayerInvite:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
      objc_msgSend(v20, "reportEvent:type:", GKReporterDomainInvite, GKReporterInviteAcceptUser);

      objc_msgSend(v7, "acceptMultiplayerGameInvite");
    }
    else
    {
      -[GKRealTimeMultiplayerBulletin declineInviteWithReason:](self, "declineInviteWithReason:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
      objc_msgSend(v7, "declineInviteWithNotification:", v14);

      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v15);
      v17 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
        v21 = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Cannot handle an invite with invite version: (%@).", (uint8_t *)&v21, 0xCu);

      }
      objc_msgSend(v9, "declineMultiplayerInvite:", self);
    }
  }

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleDeclineAction", v5, 2u);
  }
  -[GKRealTimeMultiplayerBulletin declineInviteWithReason:](self, "declineInviteWithReason:", 1);
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 571, "-[GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100149B0C;
  v21[3] = &unk_1002BB590;
  v21[4] = self;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v11, "perform:", v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100149C68;
  v19[3] = &unk_1002BB590;
  v19[4] = self;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v12, "perform:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100149E70;
  v16[3] = &unk_1002BB450;
  v17 = v12;
  v18 = v5;
  v14 = v12;
  v15 = v5;
  objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

}

- (BOOL)isReconnect
{
  return self->_isReconnect;
}

- (void)setIsReconnect:(BOOL)a3
{
  self->_isReconnect = a3;
}

@end
