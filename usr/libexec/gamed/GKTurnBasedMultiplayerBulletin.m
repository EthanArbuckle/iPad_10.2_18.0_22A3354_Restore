@implementation GKTurnBasedMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 46, "+[GKTurnBasedMultiplayerBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014046C;
  v11[3] = &unk_1002C0B88;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

+ (BOOL)shouldLoadCacheData
{
  return 1;
}

+ (BOOL)shouldLoadCacheList
{
  return 0;
}

+ (BOOL)shouldLoadCacheDetails
{
  return 1;
}

+ (BOOL)shouldExpirePlayerList
{
  return 0;
}

+ (BOOL)displayNotification
{
  return 1;
}

- (void)update
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin update:", v5, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin updateBadgeCount](self, "updateBadgeCount");
  -[GKTurnBasedMultiplayerBulletin expireAndLoadCaches](self, "expireAndLoadCaches");
}

- (GKTurnBasedMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTurnBasedMultiplayerBulletin *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  NSString *matchID;
  uint64_t v14;
  NSDictionary *localizableMessage;
  uint64_t v16;
  NSString *exchangeID;
  uint64_t v18;
  NSNumber *turnCount;
  uint64_t v20;
  NSString *guestID;
  objc_super v23;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v23.receiver = self;
  v23.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  v8 = -[GKMultiplayerBulletin initWithPushNotification:](&v23, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v10 = objc_msgSend(v9, "shouldAllowCustomCommunication");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("m")));
      -[GKBulletin setMessage:](v8, "setMessage:", v11);

    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("s")));
    matchID = v8->_matchID;
    v8->_matchID = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lm")));
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x")));
    exchangeID = v8->_exchangeID;
    v8->_exchangeID = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("t")));
    turnCount = v8->_turnCount;
    v8->_turnCount = (NSNumber *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("g")));
    guestID = v8->_guestID;
    v8->_guestID = (NSString *)v20;

  }
  return v8;
}

- (GKTurnBasedMultiplayerBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTurnBasedMultiplayerBulletin *v8;
  id v9;
  uint64_t v10;
  NSString *matchID;
  id v12;
  uint64_t v13;
  NSNumber *turnCount;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSDictionary *localizableMessage;
  id v20;
  uint64_t v21;
  NSString *exchangeID;
  id v23;
  uint64_t v24;
  NSString *guestID;
  objc_super v27;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v27.receiver = self;
  v27.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  v8 = -[GKGameplayBulletin initWithCoder:](&v27, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("matchID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    matchID = v8->_matchID;
    v8->_matchID = (NSString *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("turnCount"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    turnCount = v8->_turnCount;
    v8->_turnCount = (NSNumber *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("userTapped"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v8->_userTapped = objc_msgSend(v16, "BOOLValue");

    v17 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSDictionary), CFSTR("localizableMessage"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v18;

    v20 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("exchangeID"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    exchangeID = v8->_exchangeID;
    v8->_exchangeID = (NSString *)v21;

    v23 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("guestID"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    guestID = v8->_guestID;
    v8->_guestID = (NSString *)v24;

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v14.receiver = self;
  v14.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  -[GKGameplayBulletin encodeWithCoder:](&v14, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("matchID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin turnCount](self, "turnCount"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("turnCount"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKTurnBasedMultiplayerBulletin userTapped](self, "userTapped")));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("userTapped"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin localizableMessage](self, "localizableMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("localizableMessage"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin exchangeID](self, "exchangeID"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("exchangeID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin guestID](self, "guestID"));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("guestID"));

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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin loadDataWithHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 200, "-[GKTurnBasedMultiplayerBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001414EC;
  v24[3] = &unk_1002BB590;
  v24[4] = self;
  v11 = v9;
  v25 = v11;
  objc_msgSend(v11, "perform:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));

  if (v12)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100141648;
    v22[3] = &unk_1002BB590;
    v22[4] = self;
    v23 = v11;
    objc_msgSend(v23, "perform:", v22);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));

  if (v13)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100141778;
    v20[3] = &unk_1002BB590;
    v20[4] = self;
    v21 = v11;
    objc_msgSend(v21, "perform:", v20);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100141A78;
  v17[3] = &unk_1002BB450;
  v18 = v11;
  v19 = v5;
  v15 = v11;
  v16 = v5;
  objc_msgSend(v15, "notifyOnQueue:block:", v14, v17);

}

- (void)updateBadgeCount
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin updateBadgeCount", v10, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin turnCount](self, "turnCount"));
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](GKBadgeController, "sharedController"));
    objc_msgSend(v9, "setBadgeCount:forBundleID:badgeType:", objc_msgSend(v8, "unsignedIntegerValue"), v6, 2);

  }
}

- (void)saveTurnBasedEvent
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin saveTurnBasedEvent", v7, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "acceptedInviteManager"));

  objc_msgSend(v6, "addTurnBasedEvent:", self);
}

- (void)invalidateTurnCache
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKTurnBasedMultiplayerBulletin *v17;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin invalidateTurnCache", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 279, "-[GKTurnBasedMultiplayerBulletin invalidateTurnCache]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushCredentialForEnvironment:", objc_msgSend(v7, "environment")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerInternal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionGroupWithName:forPlayerID:", v8, v12));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100141E70;
  v15[3] = &unk_1002BB850;
  v16 = v6;
  v17 = self;
  v14 = v6;
  objc_msgSend(v13, "performOnManagedObjectContext:", v15);

}

- (void)acceptTurnBasedTurn
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn", buf, 2u);
  }
  v5 = -[GKTurnBasedMultiplayerBulletin invalidateTurnCache](self, "invalidateTurnCache");
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Accept Turn Based Invite", v13, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acceptedInviteManager"));

  objc_msgSend(v9, "addTurnBasedEvent:", self);
  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v11));

    objc_msgSend(v12, "fetchTurnBasedData");
  }

}

- (void)declineTurnBasedInviteWithReason:(int)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  _BOOL8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[8];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[3];

  v3 = *(_QWORD *)&a3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = os_log_GKTrace;
  v7 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v7)
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin declineTurnBasedInviteWithReason:", v24, 2u);
  }
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Decline Turn Based Invite", v24, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin guestID](self, "guestID"));
  if (v10)
  {
    v27[0] = CFSTR("session-id");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
    v28[0] = v11;
    v27[1] = CFSTR("reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    v27[2] = CFSTR("guest-id");
    v28[1] = v12;
    v28[2] = v10;
    v13 = v28;
    v14 = v27;
    v15 = 3;
  }
  else
  {
    v25[0] = CFSTR("session-id");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
    v25[1] = CFSTR("reason");
    v26[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    v26[1] = v12;
    v13 = v26;
    v14 = v25;
    v15 = 2;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v16, 100, 0, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storeBag"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushCredentialForEnvironment:", objc_msgSend(v18, "environment")));
  objc_msgSend(v20, "writeDataForBagKey:postData:client:credential:completion:", CFSTR("gk-tb-decline"), v17, 0, v22, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v23, "reportEvent:type:", GKReporterDomainTurnBased, GKReporterTurnBasedDecline);

}

- (void)removePreviousTurnBulletins
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin removePreviousTurnBulletins", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v6 = objc_msgSend(v5, "getBulletinsOfType:", objc_opt_class(GKTurnBasedMultiplayerTurnBulletin));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matchID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
          objc_msgSend(v5, "withdrawBulletin:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

}

- (id)bulletinMessage
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin bulletinMessage", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayerID](self, "receiverGuestPlayerID"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_GUESTS_TURN_NOTIFICATION_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_TURN_BASED_YOUR_GUESTS_TURN_NOTIFICATION_MESSAGE_FORMAT"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_TURN_NOTIFICATION_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_TURN_BASED_YOUR_TURN_NOTIFICATION_MESSAGE_FORMAT"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9));

  return v10;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin assembleBulletin", buf, 2u);
  }
  -[GKTurnBasedMultiplayerBulletin removePreviousTurnBulletins](self, "removePreviousTurnBulletins");
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
    v11 = &GKNotificationCategoryActionsAppStoreClose;
  }
  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1)
      goto LABEL_10;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings PLAY_TURN_BASED_TURN_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "PLAY_TURN_BASED_TURN_BUTTON_TITLE"));
    v11 = &GKNotificationCategoryActionsPlayClose;
  }
  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CLOSE_TURN_BASED_ALERT_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin localizableMessage](self, "localizableMessage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkLocalizedMessageFromPushDictionary:forBundleID:](NSBundle, "_gkLocalizedMessageFromPushDictionary:forBundleID:", v14, v16));

  if (objc_msgSend(v17, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19, v17));
LABEL_14:

    goto LABEL_15;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19, v23));

    goto LABEL_14;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin bulletinMessage](self, "bulletinMessage"));
LABEL_15:
  -[GKBulletin setMessage:](self, "setMessage:", v20);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundleIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerBulletin customInviteSoundPathForBundleID:](self, "customInviteSoundPathForBundleID:", v25));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
    -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v29);

  }
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GENERAL_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GENERAL_NOTIFICATION_TITLE"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v31));
  -[GKBulletin setTitle:](self, "setTitle:", v32);

}

- (void)expireAndLoadCaches
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin expireAndLoadCaches", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedMultiplayerBulletin.m", 410, "-[GKTurnBasedMultiplayerBulletin expireAndLoadCaches]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pushCredentialForEnvironment:", objc_msgSend(v7, "environment")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerInternal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transactionGroupWithName:forPlayerID:", v9, v13));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100142DBC;
  v18[3] = &unk_1002BCAA8;
  v18[4] = self;
  v19 = v8;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKTurnBasedService, "serviceWithTransport:forClient:localPlayer:", 0, v7, 0));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKTurnBasedService, "serviceWithTransport:forClient:localPlayer:", 0, v8, 0));
  v15 = v21;
  v16 = v20;
  v17 = v8;
  objc_msgSend(v14, "performOnManagedObjectContext:", v18);
  objc_msgSend(v14, "wait");

}

- (void)handleAcceptAction
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(self);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin handleAcceptAction", v4, 2u);
  }
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
  objc_super v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin handleAction:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  v8 = -[GKBulletin handleAction:](&v11, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle turn based action: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")))
  {
    -[GKTurnBasedMultiplayerBulletin setUserTapped:](self, "setUserTapped:", 1);
    -[GKTurnBasedMultiplayerBulletin handleAcceptAction](self, "handleAcceptAction");
  }

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  v3 = -[GKBulletin description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\nmatchID:%@\n"), v5));

  return v6;
}

- (NSString)matchID
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMatchID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSNumber)turnCount
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTurnCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)userTapped
{
  return self->_userTapped;
}

- (void)setUserTapped:(BOOL)a3
{
  self->_userTapped = a3;
}

- (NSDictionary)localizableMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLocalizableMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)exchangeID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setExchangeID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)guestID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setGuestID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSString)aggregateDictionaryKey
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateDictionaryKey, 0);
  objc_storeStrong((id *)&self->_guestID, 0);
  objc_storeStrong((id *)&self->_exchangeID, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_turnCount, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
}

@end
