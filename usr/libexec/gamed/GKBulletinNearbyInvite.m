@implementation GKBulletinNearbyInvite

- (GKBulletinNearbyInvite)initWithPlayer:(id)a3 localizedGameName:(id)a4 inviteDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  GKBulletinNearbyInvite *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GKBulletinAction *v25;
  void *v26;
  GKBulletinAction *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _BOOL8 v32;
  NSObject *v33;
  id v34;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_super v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "reportEvent:type:", GKReporterDomainInviteInitiateType, GKNearbyInviteInitiate);

  if (!os_log_GKGeneral)
    v13 = (id)GKOSLoggers(v12);
  v14 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKBulletinNearbyInvite: initWithPlayer: localizedGameName: inviteDictionary", buf, 2u);
  }
  v39.receiver = self;
  v39.super_class = (Class)GKBulletinNearbyInvite;
  v15 = -[GKMultiplayerBulletin initWithPushNotification:](&v39, "initWithPushNotification:", &__NSDictionary0__struct);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("adamID")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("bundleID")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("inviteMessage")));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameWithOptions:", 0));
    -[GKBulletin setMessage:](v15, "setMessage:", v18);
    -[GKBulletin setGameName:](v15, "setGameName:", v9);
    -[GKGameplayBulletin setOriginatorPlayer:](v15, "setOriginatorPlayer:", v8);
    -[GKMultiplayerBulletin setGameInviteMessage](v15, "setGameInviteMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](v15, "message"));

    if (v19)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GAME_INVITE_NOTIFICATION_TITLE"));
      v37 = v18;
      v21 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[GKBulletin setDate:](v15, "setDate:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
      -[GKBulletin setExpirationDate:](v15, "setExpirationDate:", v23);

      -[GKBulletin setHasSound:](v15, "setHasSound:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerBulletin customInviteSoundPathForBundleID:](v15, "customInviteSoundPathForBundleID:", v17));
      -[GKBulletin setSoundPath:](v15, "setSoundPath:", v24);

      -[GKBulletin setTitle:](v15, "setTitle:", v36);
      objc_storeStrong((id *)&v15->_inviteDictionary, a5);
      v25 = objc_alloc_init(GKBulletinAction);
      -[GKBulletinAction setType:](v25, "setType:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ACCEPT_INVITE_BUTTON_TITLE"));
      -[GKBulletinAction setTitle:](v25, "setTitle:", v26);

      -[GKBulletinAction setAdamID:](v25, "setAdamID:", v16);
      -[GKBulletinAction setBundleID:](v25, "setBundleID:", v17);
      v27 = objc_alloc_init(GKBulletinAction);
      -[GKBulletinAction setType:](v27, "setType:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "DECLINE_INVITE_BUTTON_TITLE"));
      -[GKBulletinAction setTitle:](v27, "setTitle:", v28);

      v16 = v21;
      v18 = v37;
      -[GKBulletinAction setInfo:](v27, "setInfo:", &stru_1002CE2A8);
      -[GKBulletin setCategoryIdentifier:](v15, "setCategoryIdentifier:", CFSTR("GKNotificationCategoryActionsAcceptDecline"));
      -[GKBulletin setDefaultAction:](v15, "setDefaultAction:", v25);
      -[GKBulletin setDeclineAction:](v15, "setDeclineAction:", v27);
      -[GKBulletin setBulletinType:](v15, "setBulletinType:", 600);

      v29 = (void *)v38;
    }
    else
    {
      v30 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v31 = (id)GKOSLoggers(v20);
        v30 = os_log_GKGeneral;
      }
      v32 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      v29 = (void *)v38;
      if (v32)
        sub_10015A348(v30);
      v33 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v34 = (id)GKOSLoggers(v32);
        v33 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v41 = v38;
        v42 = 2112;
        v43 = v9;
        v44 = 2112;
        v45 = v18;
        v46 = 2112;
        v47 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "no message in nearby invite -- displayName:%@ gameName:%@ message:%@ from dict:%@", buf, 0x2Au);
      }
    }

  }
  return v15;
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
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinNearbyInvite: handleAction:", buf, 2u);
  }
  v18.receiver = self;
  v18.super_class = (Class)GKBulletinNearbyInvite;
  v8 = -[GKBulletin handleAction:](&v18, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle nearby invite action: %@", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinNearbyInvite inviteDictionary](self, "inviteDictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("bundleID")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v12));
  if (v13)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0)
      v14 = 1;
    else
      v14 = (uint64_t)objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault"));
    v15 = objc_msgSend(v11, "mutableCopy");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("accepted"));

    if ((v14 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("declineReason"));

    }
    objc_msgSend(v13, "respondedToNearbyInvite:", v15);

  }
}

- (NSDictionary)inviteDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setInviteDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteDictionary, 0);
}

@end
