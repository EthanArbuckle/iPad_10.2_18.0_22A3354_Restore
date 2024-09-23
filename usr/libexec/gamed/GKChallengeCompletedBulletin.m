@implementation GKChallengeCompletedBulletin

- (GKChallengeCompletedBulletin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengeCompletedBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
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
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[8];
  _BYTE v59[128];

  v6 = a3;
  v7 = a4;
  v42 = v7;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKChallengeCompletedBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  objc_msgSend(a1, "expireChallengeList");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v10, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountChallengeCompleted);

  v43 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("di")));
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v12);
  v41 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v44 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("ci")));
        if (v20)
        {
          objc_msgSend(v44, "addObject:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("pl")));
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v21));
            if (!v22)
              goto LABEL_15;
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v23));

            if (!v22)
            {
LABEL_15:
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              if (v21)
              {
                objc_msgSend(v13, "setObject:forKey:", v22, v21);
              }
              else
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                objc_msgSend(v13, "setObject:forKey:", v22, v24);

              }
            }
          }
          objc_msgSend(v22, "addObject:", v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v16);
  }
  v25 = v14;

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeBulletin.m", 334, "+[GKChallengeCompletedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pushCredentialForEnvironment:", objc_msgSend(v40, "environment")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "playerInternal"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "playerID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "transactionGroupWithName:forPlayerID:", v26, v30));

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100150998;
  v51[3] = &unk_1002BB850;
  v52 = v44;
  v32 = v40;
  v53 = v32;
  v33 = v44;
  objc_msgSend(v31, "performOnManagedObjectContext:", v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "replyQueue"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100150D2C;
  v45[3] = &unk_1002BB4C8;
  v46 = v32;
  v47 = v13;
  v48 = v43;
  v49 = v41;
  v50 = v42;
  v35 = v42;
  v36 = v41;
  v37 = v43;
  v38 = v13;
  v39 = v32;
  objc_msgSend(v31, "notifyOnQueue:block:", v34, v45);

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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeCompletedBulletin notifyClient:", v9, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  objc_msgSend(v5, "challengeCompleted:", v8);

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
  objc_super v18;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeCompletedBulletin assembleBulletin", buf, 2u);
  }
  v18.receiver = self;
  v18.super_class = (Class)GKChallengeCompletedBulletin;
  -[GKChallengeBulletin assembleBulletin](&v18, "assembleBulletin");
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
    v11 = &GKNotificationCategoryActionsAppStoreIgnore;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_LAUNCH_GAME"));
    v11 = &GKNotificationCategoryActionsLaunchGameIgnore;
  }
  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_RECEIVED_IGNORE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_CHALLENGE_REMOTELY_COMPLETED_BANNER_OUT_OF_GAME_1_PLAYER_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_CHALLENGE_REMOTELY_COMPLETED_BANNER_OUT_OF_GAME_1_PLAYER_FORMAT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin receiverPlayer](self, "receiverPlayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayNameWithOptions:", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v16));
  -[GKBulletin setMessage:](self, "setMessage:", v17);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 800);
}

- (unint64_t)launchEventType
{
  return 1;
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeCompletedBulletin handleAction:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKChallengeCompletedBulletin;
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

}

@end
