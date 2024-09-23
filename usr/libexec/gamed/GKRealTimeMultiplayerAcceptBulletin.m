@implementation GKRealTimeMultiplayerAcceptBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountInviteAccept;
}

- (id)debugLine
{
  return CFSTR("accept push");
}

- (id)notificationName
{
  return GKAcceptGameInviteNotification;
}

- (BOOL)isAccept
{
  return 1;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerAcceptBulletin *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *blobType;
  uint64_t v13;
  NSNumber *relayType;
  uint64_t v15;
  NSData *relayConnectionID;
  void *v17;
  uint64_t v18;
  NSData *relayTranscationID;
  uint64_t v20;
  NSData *selfRelayIP;
  uint64_t v22;
  NSNumber *selfRelayPort;
  void *v24;
  uint64_t v25;
  NSData *peerRelayIP;
  uint64_t v27;
  NSNumber *peerRelayPort;
  uint64_t v29;
  NSData *relayToken;
  objc_super v32;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin initWithPushNotification:", buf, 2u);
  }
  v32.receiver = self;
  v32.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v32, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v9));
    -[GKRealTimeMultiplayerBulletin setSelfTicket:](v8, "setSelfTicket:", v10);

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("g")));
    blobType = v8->_blobType;
    v8->_blobType = (NSNumber *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("t")));
    relayType = v8->_relayType;
    v8->_relayType = (NSNumber *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("k")));
    relayConnectionID = v8->_relayConnectionID;
    v8->_relayConnectionID = (NSData *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("q")));
    v18 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v17));
    relayTranscationID = v8->_relayTranscationID;
    v8->_relayTranscationID = (NSData *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("h")));
    selfRelayIP = v8->_selfRelayIP;
    v8->_selfRelayIP = (NSData *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("o")));
    selfRelayPort = v8->_selfRelayPort;
    v8->_selfRelayPort = (NSNumber *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("H")));
    v25 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v24));
    peerRelayIP = v8->_peerRelayIP;
    v8->_peerRelayIP = (NSData *)v25;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("O")));
    peerRelayPort = v8->_peerRelayPort;
    v8->_peerRelayPort = (NSNumber *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("r")));
    relayToken = v8->_relayToken;
    v8->_relayToken = (NSData *)v29;

  }
  return v8;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerAcceptBulletin *v8;
  id v9;
  uint64_t v10;
  NSNumber *blobType;
  id v12;
  uint64_t v13;
  NSNumber *relayType;
  id v15;
  uint64_t v16;
  NSData *relayConnectionID;
  id v18;
  uint64_t v19;
  NSData *relayTranscationID;
  id v21;
  uint64_t v22;
  NSData *selfRelayIP;
  id v24;
  uint64_t v25;
  NSNumber *selfRelayPort;
  id v27;
  uint64_t v28;
  NSData *peerRelayIP;
  id v30;
  uint64_t v31;
  NSNumber *peerRelayPort;
  id v33;
  uint64_t v34;
  NSData *relayToken;
  objc_super v37;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin initWithCoder:", buf, 2u);
  }
  v37.receiver = self;
  v37.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v37, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("blobType"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    blobType = v8->_blobType;
    v8->_blobType = (NSNumber *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("relayType"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    relayType = v8->_relayType;
    v8->_relayType = (NSNumber *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("relayConnectionID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    relayConnectionID = v8->_relayConnectionID;
    v8->_relayConnectionID = (NSData *)v16;

    v18 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("relayTranscationID"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    relayTranscationID = v8->_relayTranscationID;
    v8->_relayTranscationID = (NSData *)v19;

    v21 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("selfRelayIP"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    selfRelayIP = v8->_selfRelayIP;
    v8->_selfRelayIP = (NSData *)v22;

    v24 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("selfRelayPort"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    selfRelayPort = v8->_selfRelayPort;
    v8->_selfRelayPort = (NSNumber *)v25;

    v27 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("peerRelayIP"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    peerRelayIP = v8->_peerRelayIP;
    v8->_peerRelayIP = (NSData *)v28;

    v30 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("peerRelayPort"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    peerRelayPort = v8->_peerRelayPort;
    v8->_peerRelayPort = (NSNumber *)v31;

    v33 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("relayToken"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    relayToken = v8->_relayToken;
    v8->_relayToken = (NSData *)v34;

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
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin encodeWithCoder:", buf, 2u);
  }
  v17.receiver = self;
  v17.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v17, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin blobType](self, "blobType"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("blobType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayType](self, "relayType"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("relayType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayConnectionID](self, "relayConnectionID"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("relayConnectionID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayTranscationID](self, "relayTranscationID"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("relayTranscationID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin selfRelayIP](self, "selfRelayIP"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("selfRelayIP"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin selfRelayPort](self, "selfRelayPort"));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("selfRelayPort"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin peerRelayIP](self, "peerRelayIP"));
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("peerRelayIP"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin peerRelayPort](self, "peerRelayPort"));
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("peerRelayPort"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayToken](self, "relayToken"));
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("relayToken"));

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin assembleBulletin:", buf, 2u);
  }
  v17.receiver = self;
  v17.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  -[GKRealTimeMultiplayerActionBulletin assembleBulletin](&v17, "assembleBulletin");
  v5 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  -[GKBulletinAction setTitle:](v5, "setTitle:", &stru_1002CE2A8);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setBulletinType:](self, "setBulletinType:", 402);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayNameWithOptions:", 0));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE_ALIAS_1_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE_ALIAS_1_FORMAT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v11));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15));
  -[GKBulletin setTitle:](self, "setTitle:", v16);

  -[GKBulletin setMessage:](self, "setMessage:", v13);
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
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin handleAction:", buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  v8 = -[GKBulletin handleAction:](&v15, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle multiplayer action: %@", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
  objc_msgSend(v13, "acceptInviteWithNotification:", v14);

}

- (NSNumber)blobType
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBlobType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setRelayType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setRelayConnectionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSData)relayTranscationID
{
  return (NSData *)objc_getProperty(self, a2, 408, 1);
}

- (void)setRelayTranscationID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSelfRelayIP:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSelfRelayPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeerRelayIP:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerRelayPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSData)relayToken
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRelayToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayToken, 0);
  objc_storeStrong((id *)&self->_peerRelayPort, 0);
  objc_storeStrong((id *)&self->_peerRelayIP, 0);
  objc_storeStrong((id *)&self->_selfRelayPort, 0);
  objc_storeStrong((id *)&self->_selfRelayIP, 0);
  objc_storeStrong((id *)&self->_relayTranscationID, 0);
  objc_storeStrong((id *)&self->_relayConnectionID, 0);
  objc_storeStrong((id *)&self->_relayType, 0);
  objc_storeStrong((id *)&self->_blobType, 0);
}

@end
