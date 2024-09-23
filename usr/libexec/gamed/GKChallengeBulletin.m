@implementation GKChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKChallengeBulletin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengeBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

- (GKChallengeBulletin)initWithCoder:(id)a3
{
  id v4;
  GKChallengeBulletin *v5;
  id v6;
  uint64_t v7;
  GKChallengeInternal *challenge;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKChallengeBulletin;
  v5 = -[GKGameplayBulletin initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GKChallengeInternal), CFSTR("challenge"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    challenge = v5->_challenge;
    v5->_challenge = (GKChallengeInternal *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKChallengeBulletin;
  v4 = a3;
  -[GKGameplayBulletin encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("challenge"));

}

- (id)URLContext
{
  return GKContextChallenge;
}

+ (void)expireChallengeList
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKChallengeBulletin expireChallengeList", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeBulletin.m", 91, "+[GKChallengeBulletin expireChallengeList]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushCredentialForEnvironment:", objc_msgSend(v4, "environment")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerInternal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transactionGroupWithName:forPlayerID:", v5, v9));

  objc_msgSend(v10, "performOnManagedObjectContext:", &stru_1002C4EF0);
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
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
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  _BYTE v36[128];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeBulletin - determineGameLocationOnDeviceOrInStoreWithCompletionHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeBulletin.m", 104, "-[GKChallengeBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "compatibleBundleIDs"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationProxyForBundleID:", v17));
        if (objc_msgSend(v18, "isInstalled")
          && (objc_msgSend(v18, "isRestricted") & 1) == 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          objc_msgSend(v19, "setBundleIdentifier:", v17);

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleVersion"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          objc_msgSend(v21, "setBundleVersion:", v20);

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleShortVersion"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          objc_msgSend(v23, "setShortBundleVersion:", v22);

          -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 1);
          goto LABEL_16;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_16:

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10014F244;
    v29[3] = &unk_1002BB590;
    v29[4] = self;
    v30 = v9;
    objc_msgSend(v30, "perform:", v29);

  }
  if (v5)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10014F36C;
    v26[3] = &unk_1002BB450;
    v28 = v5;
    v27 = v9;
    objc_msgSend(v27, "notifyOnQueue:block:", v24, v26);

  }
}

- (id)gameDescriptor
{
  id v3;
  NSObject *v4;
  GKGameDescriptor *gameDescriptor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GKGameDescriptor *v14;
  GKGameDescriptor *v15;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin gameDescriptor", buf, 2u);
  }
  gameDescriptor = self->super.super._gameDescriptor;
  if (!gameDescriptor)
  {
    if (self->_challenge)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "game"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "game"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortBundleVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "game"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "adamID"));
      v14 = (GKGameDescriptor *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:](GKGameDescriptor, "gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:", v6, v7, v10, v13));
      v15 = self->super.super._gameDescriptor;
      self->super.super._gameDescriptor = v14;

      return self->super.super._gameDescriptor;
    }
    gameDescriptor = 0;
  }
  return gameDescriptor;
}

- (id)receiverPlayerID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivingPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerID"));

  return v4;
}

- (void)setReceiverPlayerID:(id)a3
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ does not set players manually, they are all derived from the set challenge"), v5);

}

- (id)receiverPlayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivingPlayer"));

  return v3;
}

- (void)setReceiverPlayer:(id)a3
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ does not set players manually, they are all derived from the set challenge"), v5);

}

- (id)originatorPlayerID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "issuingPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerID"));

  return v4;
}

- (void)setOriginatorPlayerID:(id)a3
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ does not set players manually, they are all derived from the set challenge"), v5);

}

- (id)originatorPlayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "issuingPlayer"));

  return v3;
}

- (void)setOriginatorPlayer:(id)a3
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ does not set players manually, they are all derived from the set challenge"), v5);

}

- (id)gameName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (BOOL)supportsChallenges
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "game"));
  v4 = objc_msgSend(v3, "supportsChallenges");

  return v4;
}

- (void)setGameName:(id)a3
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ does not set gameName manually, they are all derived from the set challenge"), v5);

}

- (void)refreshData
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  const __CFString *v12;
  void *v13;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin refreshData", v11, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v12 = CFSTR("scroll");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v5, "refreshContentsForDataType:userInfo:", 1, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v9));

  objc_msgSend(v10, "refreshContentsForDataType:userInfo:", 1, 0);
}

- (BOOL)isAppRunning
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _DWORD v17[2];
  __int16 v18;
  void *v19;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin isAppRunning", (uint8_t *)v17, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
  v9 = GKGetApplicationStateForBundleID(v8);

  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v10);
  v12 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
    v17[0] = 67109378;
    v17[1] = v9;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "presentChallengeReceived: got appState of %d for %@", (uint8_t *)v17, 0x12u);

  }
  return v9 == 8;
}

- (void)notifyApp
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin notifyApp", (uint8_t *)&v13, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v6));

  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "telling the client %@ about challenge %@", (uint8_t *)&v13, 0x16u);

  }
  -[GKChallengeBulletin notifyClient:](self, "notifyClient:", v7);
  objc_msgSend(v7, "refreshContentsForDataType:userInfo:", 1, 0);

}

- (void)notifyClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeBulletin notifyClient:", buf, 2u);
  }
  v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[NSException raise:format:](NSException, "raise:format:", NSObjectInaccessibleException, CFSTR("%@ Only to be used by derived classes"), v10);

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
  void *v10;
  void *v11;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin assembleBulletin", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameName](self, "gameName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6));
  -[GKBulletin setTitle:](self, "setTitle:", v7);

  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin customChallengeSoundPathForBundleID:](self, "customChallengeSoundPathForBundleID:", v9));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v11);

}

- (id)customChallengeSoundPathForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint8_t v15[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKChallengeBulletin customChallengeSoundPathForBundleID:", v15, 2u);
  }
  v7 = GKGetBundlePathForIdentifier(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v8));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkPathForChallengeSound"));
  v11 = (void *)v10;
  v12 = &stru_1002CE2A8;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  return v13;
}

- (unint64_t)launchEventType
{
  id v4;
  void *v5;

  if (!os_log_GKGeneral)
    v4 = (id)GKOSLoggers(self);
  v5 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_100152AA4(v5, (uint64_t)self, a2);
  return -1;
}

- (void)handleAcceptAction
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  GKChallengeBulletin *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  GKChallengeBulletin *v20;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin handleAcceptAction", (uint8_t *)&v19, 2u);
  }
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallenge Notification: challenge received handling accept action %@", (uint8_t *)&v19, 0xCu);
  }
  v8 = -[GKGameplayBulletin gameLocation](self, "gameLocation");
  if ((_DWORD)v8 == 1)
  {
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v8);
    v10 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
      v13 = (GKChallengeBulletin *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
      v19 = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKChallenge Notification: set launch event for client %@", (uint8_t *)&v19, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v15));

    v17 = -[GKChallengeBulletin launchEventType](self, "launchEventType");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    objc_msgSend(v16, "setLaunchEvent:withContext:", v17, v18);

  }
}

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
  objc_storeStrong((id *)&self->_challengeID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challengeID, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
