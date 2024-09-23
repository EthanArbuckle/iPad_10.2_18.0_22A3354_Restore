@implementation GKBulletinController

- (id)getBulletinsOfType:(Class)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];

  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController+Common getBulletinsOfType:", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletins](self, "bulletins", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletins](self, "bulletins"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

        if ((objc_opt_isKindOfClass(v15, a3) & 1) != 0)
          objc_msgSend(v7, "setObject:forKey:", v15, v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)bulletinQueue
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController+Common bulletinQueue", v5, 2u);
  }
  if (qword_100318168 != -1)
    dispatch_once(&qword_100318168, &stru_1002C50C8);
  return (id)qword_100318170;
}

- (id)bulletinStorageFilePathForEnvironment:(int64_t)a3
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common bulletinStorageFilePathForEnvironment:", v11, 2u);
  }
  v7 = GKSupportDataRoot(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Bulletins.bulletins")));

  return v9;
}

- (void)clearSavedBulletins
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearSavedBulletins", buf, 2u);
  }
  v5 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015A7A0;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_sync(v6, block);

}

- (void)updateSavedBulletins
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common updateSavedBulletins", buf, 2u);
  }
  v5 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AAD4;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_sync(v6, block);

}

- (void)loadBulletins
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v4 = (id)GKOSLoggers(self);
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletinController+Common loadBulletins", buf, 2u);
  }
  v6 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015AE08;
  v8[3] = &unk_1002C1620;
  v8[4] = self;
  v8[5] = a2;
  dispatch_sync(v7, v8);

}

- (void)clearTurnBasedBulletinsForMatchID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKBulletinController *v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearTurnBasedBulletinsForMatchID:", buf, 2u);
  }
  v8 = -[GKBulletinController getBulletinsOfType:](self, "getBulletinsOfType:", objc_opt_class(GKTurnBasedMultiplayerBulletin));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015B78C;
  v11[3] = &unk_1002C50F0;
  v12 = v5;
  v13 = self;
  v10 = v5;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)clearChallengeBulletinsForChallengeID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKBulletinController *v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearChallengeBulletinsForChallengeID:", buf, 2u);
  }
  v8 = -[GKBulletinController getBulletinsOfType:](self, "getBulletinsOfType:", objc_opt_class(GKChallengeBulletin));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015B8F8;
  v11[3] = &unk_1002C5118;
  v12 = v5;
  v13 = self;
  v10 = v5;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

+ (void)startBulletinController
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(a1);
  v4 = os_log_GKTrace;
  v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController startBulletinController", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting up the bulletin controller", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](GKDevice, "currentDevice"));
  v9 = objc_msgSend(v8, "isFocusDevice");

  if (v9)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015BD14;
    block[3] = &unk_1002C10A8;
    block[4] = a1;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = objc_msgSend(a1, "sharedController");
  }
}

+ (id)sharedController
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController sharedController", v5, 2u);
  }
  if (qword_100318180 != -1)
    dispatch_once(&qword_100318180, &stru_1002C5158);
  return (id)qword_100318178;
}

- (void)dealloc
{
  objc_super v3;

  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_userNotificationCenter, "removeAllPendingNotificationRequests");
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_userNotificationCenter, "removeAllDeliveredNotifications");
  -[UNUserNotificationCenter setDelegate:](self->_userNotificationCenter, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GKBulletinController;
  -[GKBulletinController dealloc](&v3, "dealloc");
}

- (GKBulletinController)init
{
  GKBulletinController *v2;
  GKAcceptedInviteManager *v3;
  GKAcceptedInviteManager *acceptedInviteManager;
  GKAcceptedInviteManager *v5;
  id v6;
  NSObject *v7;
  GKBulletinController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  GKBulletinController *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)GKBulletinController;
  v2 = -[GKBulletinController init](&v19, "init");
  if (v2)
  {
    v3 = objc_alloc_init(GKAcceptedInviteManager);
    acceptedInviteManager = v2->_acceptedInviteManager;
    v2->_acceptedInviteManager = v3;
    v5 = v3;

    v6 = objc_msgSend((id)objc_opt_class(v2), "bulletinQueue");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015C020;
    block[3] = &unk_1002BBBD8;
    v8 = v2;
    v18 = v8;
    dispatch_sync(v7, block);

    v9 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.gamecenter"));
    -[GKBulletinController setUserNotificationCenter:](v8, "setUserNotificationCenter:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](v8, "userNotificationCenter"));
    objc_msgSend(v10, "setDelegate:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](v8, "userNotificationCenter"));
    objc_msgSend(v11, "setWantsNotificationResponsesDelivered");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController registeredCategories](v8, "registeredCategories"));
    -[GKBulletinController setNotificationCategories:](v8, "setNotificationCategories:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](v8, "userNotificationCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController notificationCategories](v8, "notificationCategories"));
    objc_msgSend(v13, "setNotificationCategories:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](v8, "userNotificationCenter"));
    objc_msgSend(v15, "requestAuthorizationWithOptions:completionHandler:", 71, &stru_1002C5178);

  }
  return v2;
}

- (id)registeredCategories
{
  id v3;
  void *v4;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings APP_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "APP_STORE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsAppStoreClose"), v4, CFSTR("appstore.app"), v5, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings PLAY_TURN_BASED_TURN_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "PLAY_TURN_BASED_TURN_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsPlayClose"), v7, CFSTR("play"), v8, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings APP_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "APP_STORE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsAppStoreDecline"), v10, CFSTR("appstore.app"), v11, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ACCEPT_INVITE_BUTTON_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsAcceptDecline"), v13, CFSTR("checkmark.circle"), v14, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings APP_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "APP_STORE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsAppStoreIgnore"), v16, CFSTR("appstore.app"), v17, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_LAUNCH_GAME"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsLaunchGameIgnore"), v19, CFSTR("play"), v20, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_LAUNCH_GAME"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_DECLINE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_DECLINE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsLaunchGameDecline"), v22, CFSTR("play"), v23, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_VIEW](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_VIEW"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_IGNORE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsViewIgnore"), v25, CFSTR("play"), v26, CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsTTRInitiation"), CFSTR("File a radar"), CFSTR("ant.circle"), CFSTR("Not for now"), CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:](self, "categoryWithIdentifier:defaultActionTitle:defaultActionIcon:dismissActionTitle:dismissActionIcon:", CFSTR("GKNotificationCategoryActionsTTRUploadRequest"), CFSTR("Upload in Tap-to-Radar"), CFSTR("ant.circle"), CFSTR("Not for now"), CFSTR("xmark.circle")));
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_ACCEPT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_ACCEPT"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_IGNORE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_VIEW_PROFILE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_VIEW_PROFILE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController categoryWithIdentifier:acceptActionTitle:acceptActionIcon:declineActionTitle:declineActionIcon:viewActionTitle:viewActionIcon:](self, "categoryWithIdentifier:acceptActionTitle:acceptActionIcon:declineActionTitle:declineActionIcon:viewActionTitle:viewActionIcon:", CFSTR("GKNotificationsCategoryActionsFriendRequest"), v30, CFSTR("checkmark"), v31, CFSTR("xmark"), v32, CFSTR("arrow.up.forward.app")));
  objc_msgSend(v3, "addObject:", v33);

  return v3;
}

- (id)categoryWithIdentifier:(id)a3 defaultActionTitle:(id)a4 defaultActionIcon:(id)a5 dismissActionTitle:(id)a6 dismissActionIcon:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  if (objc_msgSend(v12, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", v12));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDefault"), v11, 0, v16));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDefault"), v11, 0, 0));
  }
  if (objc_msgSend(v14, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", v14));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDismissed"), v13, 0, v18));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDismissed"), v13, 0, 0));
  }
  v23[0] = v17;
  v23[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", v15, v20, &__NSArray0__struct, 1));

  return v21;
}

- (id)categoryWithIdentifier:(id)a3 acceptActionTitle:(id)a4 acceptActionIcon:(id)a5 declineActionTitle:(id)a6 declineActionIcon:(id)a7 viewActionTitle:(id)a8 viewActionIcon:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[3];

  v14 = a4;
  v15 = a5;
  v32 = a6;
  v16 = a7;
  v30 = a8;
  v17 = a9;
  v18 = a3;
  if (objc_msgSend(v15, "length"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", v15));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKAccepted"), v14, 0, v19));

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKAccepted"), v14, 0, 0));
  }
  v31 = v14;
  if (objc_msgSend(v16, "length"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", v16));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDeclined"), v32, 0, v21));

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKDeclined"), v32, 0, 0));
  }
  if (objc_msgSend(v17, "length", v15))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", v17));
    v24 = v30;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKView"), v30, 0, v23));

  }
  else
  {
    v24 = v30;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("GKView"), v30, 0, 0));
  }
  v33[0] = v20;
  v33[1] = v22;
  v33[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", v18, v26, &__NSArray0__struct, 0));

  return v27;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(void);
  id v9;
  NSObject *v10;
  _BOOL8 v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  BOOL v30;
  __CFString **v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  id v52;
  void (**v53)(void);
  _QWORD block[5];
  id v56;
  __int128 *p_buf;
  void *v58;
  uint8_t v59[4];
  void *v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v52 = a3;
  v7 = a4;
  v8 = (void (**)(void))a5;
  v53 = v8;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKTrace;
  v11 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v11)
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", (uint8_t *)&buf, 2u);
  }
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "response: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v62 = 0x3032000000;
  v63 = sub_10015D134;
  v64 = sub_10015D144;
  v65 = 0;
  v14 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D14C;
  block[3] = &unk_1002BDEA8;
  p_buf = &buf;
  block[4] = self;
  v16 = v7;
  v56 = v16;
  dispatch_sync(v15, block);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v17);
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v59 = 138412290;
      v60 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "bulletin: %@", v59, 0xCu);
    }
    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notification"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "request"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "content"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "expirationDate"));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notification"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "request"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "content"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "expirationDate"));
      objc_msgSend(v28, "timeIntervalSinceNow");
      v30 = v29 > 0.0;

      if (!v30)
      {
        v31 = &GKBulletinExpiredActionID;
        goto LABEL_26;
      }
    }
    else
    {

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionIdentifier"));
    v38 = objc_msgSend(v37, "isEqualToString:", UNNotificationDefaultActionIdentifier);

    if ((v38 & 1) != 0)
    {
      v31 = &GKBulletinDefaultActionID;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionIdentifier"));
      v40 = objc_msgSend(v39, "isEqualToString:", UNNotificationDismissActionIdentifier);

      if (!v40)
      {
        v42 = v51;
        if (v51)
          goto LABEL_27;
LABEL_29:
        v33 = v42;
        if (!os_log_GKGeneral)
          v48 = (id)GKOSLoggers(v41);
        v49 = os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v50 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v59 = 138412290;
          v60 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "no action for bulletin: %@", v59, 0xCu);
        }
        goto LABEL_33;
      }
      v31 = &GKBulletinDismissedActionID;
    }
LABEL_26:
    v42 = *v31;

    if (v42)
    {
LABEL_27:
      v33 = v42;
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "handleAction:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notification"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "request"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "identifier"));
      v58 = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
      objc_msgSend(v43, "removeDeliveredNotificationsWithIdentifiers:", v47);

      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (!os_log_GKGeneral)
    v32 = (id)GKOSLoggers(v17);
  v33 = os_log_GKMatch;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notification"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "request"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
    *(_DWORD *)v59 = 138412290;
    v60 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "no bulletin for ID: %@", v59, 0xCu);

  }
LABEL_33:

  v53[2]();
  _Block_object_dispose(&buf, 8);

}

- (void)removeBulletin:(id)a3
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
  id v14;
  NSObject *v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  GKBulletinController *v21;
  id v22;
  uint8_t buf[8];
  void *v24;
  void *v25;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController removeBulletin:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v25 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  objc_msgSend(v8, "removeDeliveredNotificationsWithIdentifiers:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v24 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  objc_msgSend(v11, "removePendingNotificationRequestsWithIdentifiers:", v13);

  v14 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10015D3C8;
  v20 = &unk_1002BB658;
  v21 = self;
  v22 = v5;
  v16 = v5;
  dispatch_sync(v15, &v17);

  -[GKBulletinController updateSavedBulletins](self, "updateSavedBulletins", v17, v18, v19, v20, v21);
}

- (void)withdrawBulletin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS withdrawBullentin", v8, 2u);
  }
  -[GKBulletinController removeBulletin:](self, "removeBulletin:", v5);

}

- (void)expireBulletin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS expireBulletin:", v8, 2u);
  }
  -[GKBulletinController removeBulletin:](self, "removeBulletin:", v5);

}

- (id)userInfoFromBulletin:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  uint8_t v28[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController userInfoFromBulletin:", v28, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "acceptAction"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "acceptAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDictionary"));
    objc_msgSend(v7, "setObject:forKey:", v10, GKBulletinActionDictionaryAcceptKey);

    v11 = &GKBulletinActionDictionaryDefaultKey;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultAction"));

    if (!v12)
      goto LABEL_10;
    v11 = &GKBulletinActionDictionaryAcceptKey;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultAction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionDictionary"));
  objc_msgSend(v7, "setObject:forKey:", v14, *v11);

LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultAction"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultAction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionDictionary"));
    objc_msgSend(v7, "setObject:forKey:", v17, GKBulletinActionDictionaryDefaultKey);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "declineAction"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "declineAction"));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dismissAction"));

    if (!v20)
      goto LABEL_17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dismissAction"));
  }
  v21 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionDictionary"));
  objc_msgSend(v7, "setObject:forKey:", v22, GKBulletinActionDictionaryDeclineKey);

LABEL_17:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    objc_msgSend(v7, "setObject:forKey:", v24, GKBulletinRecordIDUserDataKey);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categoryIdentifier"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categoryIdentifier"));
    objc_msgSend(v7, "setObject:forKey:", v26, GKBulletinCategoryIDUserDataKey);

  }
  return v7;
}

- (id)notificationRequestFromBulletin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSMutableArray *v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  NSMutableArray *v40;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController userNotificationFromBulletin:", buf, 2u);
  }
  v8 = objc_alloc_init((Class)UNMutableNotificationContent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
  objc_msgSend(v8, "setDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate"));
  objc_msgSend(v8, "setExpirationDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "message"));
  objc_msgSend(v8, "setBody:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  objc_msgSend(v8, "setTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userInfoFromBulletin:](self, "userInfoFromBulletin:", v5));
  objc_msgSend(v8, "setUserInfo:", v13);

  objc_msgSend(v8, "setShouldBackgroundDefaultAction:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "categoryIdentifier"));
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "categoryIdentifier"));
    objc_msgSend(v8, "setCategoryIdentifier:", v16);

  }
  if (objc_msgSend(v5, "hasSound"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNMutableNotificationSound soundWithAlertType:](UNMutableNotificationSound, "soundWithAlertType:", 17));
    if (objc_msgSend(v5, "bulletinType") != (id)2)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "soundPath"));
      v19 = objc_msgSend(v18, "length");

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "soundPath"));
      }
      else
      {
        v21 = GKGameCenterNotificationsBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pathForResource:ofType:", CFSTR("GKInvite"), CFSTR("caf")));

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20));
      objc_msgSend(v17, "setToneFileURL:", v23);

    }
    objc_msgSend(v8, "setSound:", v17);

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameIcon"));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameIcon"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "absoluteString"));
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameIcon"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "absoluteString"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconAtPath:](UNNotificationIcon, "iconAtPath:", v30));

      objc_msgSend(v8, "setIcon:", v31);
      objc_msgSend(v8, "setShouldShowSubordinateIcon:", 1);

    }
  }
  v32 = (uint64_t)objc_msgSend(v5, "bulletinType");
  if (v32 <= 399)
  {
    if ((unint64_t)(v32 - 200) >= 2 && v32 != 2)
      goto LABEL_24;
LABEL_23:
    objc_msgSend(v8, "setInterruptionLevel:", 2);
    goto LABEL_24;
  }
  if (v32 == 600 || v32 == 400)
    goto LABEL_23;
LABEL_24:
  v33 = objc_opt_new(NSMutableArray);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attachments"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10015DC30;
  v39[3] = &unk_1002C51A0;
  v40 = v33;
  v35 = v33;
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v39);

  objc_msgSend(v8, "setAttachments:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v36, v8, 0));

  return v37;
}

- (void)presentBulletin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  GKBulletinController *v24;
  id v25;
  uint8_t buf[4];
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController notificationCategories](self, "notificationCategories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateNotificationCategories:", v5));

  if (v6)
  {
    -[GKBulletinController setNotificationCategories:](self, "setNotificationCategories:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController notificationCategories](self, "notificationCategories"));
    objc_msgSend(v7, "setNotificationCategories:", v8);

  }
  v9 = objc_msgSend(v4, "reportMetricsForPresented");
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v9);
  v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS presentBulletin:", buf, 2u);
  }
  v12 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_10015E00C;
  v23 = &unk_1002BB658;
  v24 = self;
  v14 = v4;
  v25 = v14;
  dispatch_sync(v13, &v20);

  -[GKBulletinController updateSavedBulletins](self, "updateSavedBulletins", v20, v21, v22, v23, v24);
  v15 = objc_claimAutoreleasedReturnValue(-[GKBulletinController notificationRequestFromBulletin:](self, "notificationRequestFromBulletin:", v14));
  v16 = (void *)v15;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v15);
  v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKBulletinController: presenting notification request:%@", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
  objc_msgSend(v19, "addNotificationRequest:withCompletionHandler:", v16, 0);

}

- (void)removeAllBulletins
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS removeAllBulletins", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController userNotificationCenter](self, "userNotificationCenter"));
  objc_msgSend(v5, "removeAllDeliveredNotifications");

  v6 = objc_msgSend((id)objc_opt_class(self), "bulletinQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015E160;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_sync(v7, block);

  -[GKBulletinController clearSavedBulletins](self, "clearSavedBulletins");
}

- (NSMutableDictionary)bulletins
{
  return self->_bulletins;
}

- (void)setBulletins:(id)a3
{
  objc_storeStrong((id *)&self->_bulletins, a3);
}

- (GKAcceptedInviteManager)acceptedInviteManager
{
  return (GKAcceptedInviteManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcceptedInviteManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)notificationCategories
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCategories, 0);
  objc_storeStrong((id *)&self->_acceptedInviteManager, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
}

@end
