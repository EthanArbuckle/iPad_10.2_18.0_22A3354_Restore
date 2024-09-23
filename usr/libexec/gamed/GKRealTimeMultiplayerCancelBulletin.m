@implementation GKRealTimeMultiplayerCancelBulletin

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 1043, "+[GKRealTimeMultiplayerCancelBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014CEE8;
  v10[3] = &unk_1002BB758;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v10);

}

- (void)copyDataFromAssociatedBulletin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin copyDataFromAssociatedBulletin", v12, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originatorPlayer"));
  -[GKGameplayBulletin setOriginatorPlayer:](self, "setOriginatorPlayer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameName"));
  -[GKBulletin setGameName:](self, "setGameName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originatorPlayerID"));
  -[GKGameplayBulletin setOriginatorPlayerID:](self, "setOriginatorPlayerID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameDescriptor"));
  -[GKBulletin setGameDescriptor:](self, "setGameDescriptor:", v11);

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
  void *v12;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin assembleBulletin", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v5);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 404);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7));
  -[GKBulletin setTitle:](self, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayNameWithOptions:", 0));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE_ALIAS_1_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE_ALIAS_1_FORMAT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v10));
    -[GKBulletin setMessage:](self, "setMessage:", v12);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE"));
    -[GKBulletin setMessage:](self, "setMessage:", v11);
  }

}

- (id)removeAndReturnAssociatedInvite
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin removeAndReturnAssociatedInvite", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v6 = objc_msgSend(v5, "getBulletinsOfType:", objc_opt_class(GKRealTimeMultiplayerInitiateBulletin));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11), (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sessionToken"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
        v15 = objc_msgSend(v13, "isEqualToData:", v14);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v5, "withdrawBulletin:", v12);
          goto LABEL_15;
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

@end
