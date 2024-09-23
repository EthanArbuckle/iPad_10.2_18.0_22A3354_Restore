@implementation GKActivityFeedBulletin

- (GKActivityFeedBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKActivityFeedBulletin *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin initWithPushNotification:", buf, 2u);
  }
  v17.receiver = self;
  v17.super_class = (Class)GKActivityFeedBulletin;
  v8 = -[GKBulletin initWithPushNotification:](&v17, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC4F0, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC4F0, "objectForKeyedSubscript:", v9));
      -[GKActivityFeedBulletin setActivityFeedAction:](v8, "setActivityFeedAction:", objc_msgSend(v11, "integerValue"));

    }
    else
    {
      -[GKActivityFeedBulletin setActivityFeedAction:](v8, "setActivityFeedAction:", -1);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title")));
    -[GKActivityFeedBulletin setTitleFromPush:](v8, "setTitleFromPush:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body")));
    -[GKActivityFeedBulletin setBodyFromPush:](v8, "setBodyFromPush:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle")));
    -[GKActivityFeedBulletin setSubtitleFromPush:](v8, "setSubtitleFromPush:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relationships")));
    -[GKActivityFeedBulletin setRelationships:](v8, "setRelationships:", v15);

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKActivityFeedBulletin)initWithCoder:(id)a3
{
  id v4;
  GKActivityFeedBulletin *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GKActivityFeedBulletin;
  v5 = -[GKGameplayBulletin initWithCoder:](&v22, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[GKActivityFeedBulletin setActivityFeedAction:](v5, "setActivityFeedAction:", objc_msgSend(v7, "integerValue"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("titleFromPush"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKActivityFeedBulletin setTitleFromPush:](v5, "setTitleFromPush:", v9);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bodyFromPush"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[GKActivityFeedBulletin setBodyFromPush:](v5, "setBodyFromPush:", v11);

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("subtitleFromPush"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[GKActivityFeedBulletin setSubtitleFromPush:](v5, "setSubtitleFromPush:", v13);

    v14 = objc_opt_class(NSString);
    v15 = objc_opt_class(NSArray);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(NSDictionary), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("relationships")));
    -[GKActivityFeedBulletin setRelationships:](v5, "setRelationships:", v18);

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("isMalformed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[GKActivityFeedBulletin setIsMalformed:](v5, "setIsMalformed:", objc_msgSend(v20, "BOOLValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKActivityFeedBulletin;
  v4 = a3;
  -[GKGameplayBulletin encodeWithCoder:](&v11, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction", v11.receiver, v11.super_class)));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bulletinAction"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin titleFromPush](self, "titleFromPush"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titleFromPush"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin bodyFromPush](self, "bodyFromPush"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bodyFromPush"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin subtitleFromPush](self, "subtitleFromPush"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subtitleFromPush"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("relationships"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKActivityFeedBulletin isMalformed](self, "isMalformed")));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("isMalformed"));

}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  GKActivityFeedBulletin *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  GKActivityFeedBulletin *v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin loadBulletinsForPushNotification:", buf, 2u);
  }
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKActivityFeedBulletin.m", 133, "+[GKActivityFeedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100157480;
  v21[3] = &unk_1002BB4A0;
  v14 = -[GKActivityFeedBulletin initWithPushNotification:]([GKActivityFeedBulletin alloc], "initWithPushNotification:", v5);
  v22 = v14;
  v15 = v10;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  objc_msgSend(v13, "perform:", v21);
  if (v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100157868;
    v18[3] = &unk_1002BB450;
    v20 = v7;
    v19 = v15;
    objc_msgSend(v13, "notifyOnQueue:block:", v17, v18);

  }
}

- (NSString)getRelationshipGameBundleId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("game")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));

  return (NSString *)v4;
}

- (NSString)getRelationshipGameImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("game")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("image")));

  return (NSString *)v4;
}

- (NSNumber)getRelationshipGameAdamId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("game")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adamId")));

  return (NSNumber *)v4;
}

- (NSString)getRelationshipGameName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("game")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name")));

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("leaderboard")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("leaderboard")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name")));

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("player")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));

  return (NSString *)v4;
}

- (void)assembleBulletin
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  void *v6;
  GKBulletinAction *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  GKBulletinAction *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin assembleBulletin", (uint8_t *)&v18, 2u);
  }
  if (-[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
    v5 = v6 == 0;
    if (v6)
    {
      v7 = objc_alloc_init(GKBulletinAction);
      -[GKBulletinAction setType:](v7, "setType:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_VIEW](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_VIEW"));
      -[GKBulletinAction setTitle:](v7, "setTitle:", v8);

      -[GKBulletinAction setInfo:](v7, "setInfo:", v6);
      -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v7);

    }
  }
  -[GKActivityFeedBulletin setIsMalformed:](self, "setIsMalformed:", v5);
  v9 = -[GKActivityFeedBulletin isMalformed](self, "isMalformed");
  if (!v9)
  {
    v12 = objc_alloc_init(GKBulletinAction);
    -[GKBulletinAction setType:](v12, "setType:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings BULLETIN_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "BULLETIN_IGNORE"));
    -[GKBulletinAction setTitle:](v12, "setTitle:", v14);

    -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
    -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
    -[GKActivityFeedBulletin setContactHandle:](self, "setContactHandle:", 0);
    -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", CFSTR("GKNotificationCategoryActionsViewIgnore"));
    -[GKBulletin setHasSound:](self, "setHasSound:", 1);
    -[GKBulletin setSoundPath:](self, "setSoundPath:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin titleFromPush](self, "titleFromPush"));
    -[GKBulletin setTitle:](self, "setTitle:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin bodyFromPush](self, "bodyFromPush"));
    -[GKBulletin setMessage:](self, "setMessage:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[GKBulletin setDate:](self, "setDate:", v17);

    -[GKBulletin setBulletinType:](self, "setBulletinType:", 1000);
    goto LABEL_16;
  }
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v9);
  v11 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
    v18 = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin assembleBulletin, malformed bulletin with relationships: %@", (uint8_t *)&v18, 0xCu);

LABEL_16:
  }
}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  GKActivityFeedBulletin *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;

  v4 = a3;
  v44 = CFSTR("pageDetails");
  v42 = CFSTR("activityFeedAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction")));
  v43 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
  v45 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
  v8 = objc_msgSend(v7, "mutableCopy");

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("GKAccepted")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("GKDefault")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("GKDeclined")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("GKDismissed")) & 1) != 0
      || !objc_msgSend(v4, "isEqualToString:", CFSTR("GKExpired")))
    {
      goto LABEL_33;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v9, "expireBulletin:", self);
    goto LABEL_32;
  }
  if (-[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction"))
  {
LABEL_33:
    -[GKActivityFeedBulletin reportMetricsForActionID:withAdditionalFields:](self, "reportMetricsForActionID:withAdditionalFields:", v4, v8);
    goto LABEL_34;
  }
  if (_os_feature_enabled_impl("gseui", "de7bbd8e"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipLeaderboardIdentifier](self, "getRelationshipLeaderboardIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipPlayerId](self, "getRelationshipPlayerId"));
    v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("game-overlay-ui:///game/%@/leaderboard/%@?challengeSuggestionPlayerID=%@"), v9, v10, v11));
      v14 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v13);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
        objc_msgSend(v15, "openURL:", v14);

      }
      else
      {
        if (!os_log_GKGeneral)
          v30 = (id)GKOSLoggers(0);
        v31 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v13;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin handleAction, failed to construct deeplink url with string %@", buf, 0xCu);
        }
      }

    }
    else
    {
      if (!os_log_GKGeneral)
        v25 = (id)GKOSLoggers(v11);
      v26 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v37 = v9;
        v38 = 2112;
        v39 = v10;
        v40 = 2112;
        v41 = v12;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin handleAction, missing ids to construct deeplink. bundleID: %@, leaderboardID: %@, playerID: %@", buf, 0x20u);
      }
    }

LABEL_32:
    goto LABEL_33;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKUtilityServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v16, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameAdamId](self, "getRelationshipGameAdamId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));

  v21 = +[GKGame isNewsApp:](GKGame, "isNewsApp:", v18);
  if ((_DWORD)v21)
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(v21);
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Launching News puzzles section in response to leaderboard notification action", buf, 2u);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v24, "openNewsApp");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("targetId"));
    -[GKActivityFeedBulletin reportMetricsForActionID:withAdditionalFields:](self, "reportMetricsForActionID:withAdditionalFields:", v4, v8);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAppLaunchTrampolineURL URLWithAdamId:bundleId:localizedName:sourceApplication:topic:](ASCAppLaunchTrampolineURL, "URLWithAdamId:bundleId:localizedName:sourceApplication:topic:", v20, v18, 0, v28, 0));

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10015836C;
    v32[3] = &unk_1002C5008;
    v33 = v8;
    v34 = self;
    v35 = v4;
    objc_msgSend(v17, "invokeASCAppLaunchTrampolineWithURL:handler:", v29, v32);

  }
LABEL_34:

}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  _QWORD v15[4];
  NSMutableDictionary *v16;
  id v17;
  GKActivityFeedBulletin *v18;
  void *v19;

  v6 = a3;
  if (a4)
    v7 = (NSMutableDictionary *)objc_msgSend(a4, "mutableCopy");
  else
    v7 = objc_opt_new(NSMutableDictionary);
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v9, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
  v19 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100158524;
  v15[3] = &unk_1002C5030;
  v16 = v8;
  v17 = v6;
  v18 = self;
  v13 = v6;
  v14 = v8;
  objc_msgSend(v10, "getGameMetadataForBundleIDs:handler:", v12, v15);

}

- (int64_t)activityFeedAction
{
  return self->_activityFeedAction;
}

- (void)setActivityFeedAction:(int64_t)a3
{
  self->_activityFeedAction = a3;
}

- (NSString)titleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTitleFromPush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)bodyFromPush
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBodyFromPush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)subtitleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSubtitleFromPush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSDictionary)relationships
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setRelationships:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSString)contactHandle
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setContactHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (BOOL)isMalformed
{
  return self->_isMalformed;
}

- (void)setIsMalformed:(BOOL)a3
{
  self->_isMalformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactHandle, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_subtitleFromPush, 0);
  objc_storeStrong((id *)&self->_bodyFromPush, 0);
  objc_storeStrong((id *)&self->_titleFromPush, 0);
}

@end
