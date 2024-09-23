@implementation GKChallengeReceivedBulletin

- (GKChallengeReceivedBulletin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengeReceivedBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
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
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  objc_msgSend(a1, "expireChallengeList");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountChallengeReceived);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("di")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_gkValuesForKeyPath:", CFSTR("ci")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

  v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKChallengeService, "serviceWithTransport:forClient:localPlayer:", 0, v16, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeBulletin.m", 504, "+[GKChallengeReceivedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v18));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100151D78;
  v29[3] = &unk_1002BC010;
  v20 = v17;
  v30 = v20;
  v21 = v14;
  v31 = v21;
  v22 = v6;
  v32 = v22;
  v23 = v19;
  v33 = v23;
  v24 = v15;
  v34 = v24;
  objc_msgSend(v23, "perform:", v29);
  if (v8)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001522E0;
    v26[3] = &unk_1002BB450;
    v28 = v8;
    v27 = v24;
    objc_msgSend(v23, "notifyOnQueue:block:", v25, v26);

  }
}

- (void)notifyClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin notifyClient:", v9, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  objc_msgSend(v5, "challengeReceived:", v8);

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
  NSString *v21;
  void *v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin assembleBulletin", buf, 2u);
  }
  v24.receiver = self;
  v24.super_class = (Class)GKChallengeReceivedBulletin;
  -[GKChallengeBulletin assembleBulletin](&v24, "assembleBulletin");
  v5 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_LAUNCH_STORE"));
    v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_LAUNCH_GAME"));
    v11 = &GKNotificationCategoryActionsLaunchGameDecline;
  }
  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_DECLINE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_DECLINE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setIsDestructive:](v12, "setIsDestructive:", 1);
  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  v14 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_1002CE2A8);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v12);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin originatorPlayer](self, "originatorPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayNameWithOptions:", 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "message"));

  if (objc_msgSend(v19, "length"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_1_PLAYER_2_CUSTOM_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_1_PLAYER_2_CUSTOM_MESSAGE_FORMAT"));
    v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v17, v19);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_FORMAT"));
    v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v17, v23);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[GKBulletin setMessage:](self, "setMessage:", v22);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 801);
}

- (unint64_t)launchEventType
{
  return 0;
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin handleAction:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKChallengeReceivedBulletin;
  v8 = -[GKBulletin handleAction:](&v11, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle challenge action: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")))
  {
    -[GKChallengeBulletin handleAcceptAction](self, "handleAcceptAction");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("GKDeclined")))
  {
    -[GKChallengeReceivedBulletin handleDeclineAction](self, "handleDeclineAction");
  }

}

- (void)handleDeclineAction
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  GKChallengeReceivedBulletin *v16;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin handleDeclineAction", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "challenge received handling decline action %@", buf, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKChallengeService, "serviceWithTransport:forClient:localPlayer:", 0, v11, 0));
    v14 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v12, "abortChallenges:handler:", v13, 0);

  }
}

@end
