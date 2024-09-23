@implementation GKMultiplayerBulletin

+ (BOOL)shouldProcessNotification
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  objc_super v8;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(a1);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin shouldProcessNotification", buf, 2u);
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___GKMultiplayerBulletin;
  if (!objc_msgSendSuper2(&v8, "shouldProcessNotification"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v6 = objc_msgSend(v5, "multiplayerAllowedPlayerType") != 0;

  return v6;
}

- (id)URLContext
{
  return GKContextInvite;
}

- (GKMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKMultiplayerBulletin *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)GKMultiplayerBulletin;
  v8 = -[GKBulletin initWithPushNotification:](&v21, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("g")));
    -[GKGameplayBulletin setReceiverGuestPlayerID:](v8, "setReceiverGuestPlayerID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("i")));
    -[GKGameplayBulletin setReceiverPlayerID:](v8, "setReceiverPlayerID:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("I")));
    v12 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      -[GKGameplayBulletin setOriginatorPlayerID:](v8, "setOriginatorPlayerID:", v13);

    }
    else
    {
      v14 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
        -[GKGameplayBulletin setOriginatorPlayerID:](v8, "setOriginatorPlayerID:", v11);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("G")));
    -[GKGameplayBulletin setOriginatorGuestPlayerID:](v8, "setOriginatorGuestPlayerID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("d")));
    v17 = objc_msgSend(objc_alloc((Class)GKGameDescriptor), "initWithPushDictionary:", v16);
    -[GKBulletin setGameDescriptor:](v8, "setGameDescriptor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", GKInviteCompatibleVersionsKey));
    -[GKGameplayBulletin setCompatibleVersions:](v8, "setCompatibleVersions:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", GKInviteCompatibleShortVersionsKey));
    -[GKGameplayBulletin setCompatibleShortVersions:](v8, "setCompatibleShortVersions:", v19);

  }
  return v8;
}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  GKMultiplayerBulletin *v19;
  id v20;
  uint8_t buf[16];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  v11 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin loadLocalizedGameNameForBundleID: handler:", buf, 2u);
  }
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v12, 0));
    v22 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10013E33C;
    v17[3] = &unk_1002BCE80;
    v18 = v6;
    v19 = self;
    v20 = v8;
    objc_msgSend(v13, "getGameMetadataForBundleIDs:handler:", v14, v17);

  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v11);
    v16 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10013E7B0((uint64_t)v6, v16);
  }

}

- (void)setGameInviteMessage
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin setGameInviteMessage original message:  %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameWithOptions:", 0));

  if (!objc_msgSend(v9, "length") || !objc_msgSend(v7, "length"))
    -[GKBulletin setMessage:](self, "setMessage:", 0);
  v10 = -[GKGameplayBulletin gameLocation](self, "gameLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v12 = objc_msgSend(v11, "length");
  if (v10 == 2)
  {
    if (v12)
      v13 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_STORE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_STORE_FORMAT"));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_STORE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_STORE_FORMAT"));
  }
  else if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_FORMAT"));
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_FORMAT"));
  }
  v14 = (void *)v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v9, v15));
  -[GKBulletin setMessage:](self, "setMessage:", v16);

  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v17);
  v19 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    *(_DWORD *)buf = 138412290;
    v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin setGameInviteMessage: %@", buf, 0xCu);

  }
}

- (id)customInviteSoundPathForBundleID:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin customInviteSoundPathForBundleID:", v15, 2u);
  }
  v7 = GKGetBundlePathForIdentifier(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v8));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkPathForInviteSound"));
  v11 = (void *)v10;
  v12 = &stru_1002CE2A8;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  return v13;
}

@end
