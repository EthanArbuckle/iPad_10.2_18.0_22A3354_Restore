@implementation GKRealTimeMultiplayerDeclineBulletin

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountInviteDecline;
}

- (id)debugLine
{
  return CFSTR("decline push");
}

- (id)notificationName
{
  return GKDeclineGameInviteNotification;
}

- (BOOL)isAccept
{
  return 0;
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
  objc_super v12;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerDeclineBulletin assembleBulletin", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKRealTimeMultiplayerDeclineBulletin;
  -[GKRealTimeMultiplayerActionBulletin assembleBulletin](&v12, "assembleBulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6));
  -[GKBulletin setTitle:](self, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameWithOptions:", 0));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_INVITEE_DECLINED_ALERT_MESSAGE_ALIAS_1_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_INVITEE_DECLINED_ALERT_MESSAGE_ALIAS_1_FORMAT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v9));
    -[GKBulletin setMessage:](self, "setMessage:", v11);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_INVITEE_DECLINED_ALERT_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_INVITEE_DECLINED_ALERT_MESSAGE"));
    -[GKBulletin setMessage:](self, "setMessage:", v10);
  }

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 403);
}

@end
