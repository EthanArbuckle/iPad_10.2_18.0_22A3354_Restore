@implementation GKRealTimeMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKRealTimeMultiplayerBulletin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKRealTimeMultiplayerBulletin;
  return -[GKRealTimeMultiplayerBulletin init](&v3, "init");
}

- (int64_t)inviteVersionFromMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  char *v9;
  int64_t v10;
  uint8_t v12[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin inviteVersionFromMessage:", v12, 2u);
  }
  v7 = (uint64_t)objc_msgSend(v4, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = (char *)objc_msgSend(v8, "bytes");
  if (v7 < 2 || v9[v7 - 2])
    v10 = 0;
  else
    v10 = v9[v7 - 1];

  return v10;
}

- (void)parseClientData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSNumber *v8;
  NSNumber *inviteVersion;
  uint8_t v10[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin parseClientData:", v10, 2u);
  }
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[GKRealTimeMultiplayerBulletin inviteVersionFromMessage:](self, "inviteVersionFromMessage:", v5)));
  inviteVersion = self->_inviteVersion;
  self->_inviteVersion = v8;

}

- (GKRealTimeMultiplayerBulletin)initWithPushNotification:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerBulletin *v8;
  uint64_t v9;
  NSDictionary *clientDictionary;
  void *v11;
  uint64_t v12;
  NSData *sessionToken;
  void *v14;
  uint64_t v15;
  NSData *peerPushToken;
  uint64_t v17;
  NSNumber *peerNatType;
  void *v19;
  uint64_t v20;
  NSData *peerNatIP;
  void *v22;
  uint64_t v23;
  NSData *peerBlob;
  uint64_t v25;
  NSString *sessionID;
  uint64_t v27;
  NSString *peerPseudonym;
  uint64_t v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  uint64_t v33;
  NSNumber *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  NSNumber *declineReason;
  uint64_t v44;
  NSNumber *transportVersionToUse;
  uint64_t v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;

  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v51.receiver = self;
  v51.super_class = (Class)GKRealTimeMultiplayerBulletin;
  v8 = -[GKMultiplayerBulletin initWithPushNotification:](&v51, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("x")));
    clientDictionary = v8->_clientDictionary;
    v8->_clientDictionary = (NSDictionary *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("s")));
    v12 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v11));
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = (NSData *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("P")));
    v15 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v14));
    peerPushToken = v8->_peerPushToken;
    v8->_peerPushToken = (NSData *)v15;

    v17 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("N")));
    peerNatType = v8->_peerNatType;
    v8->_peerNatType = (NSNumber *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("A")));
    v20 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v19));
    peerNatIP = v8->_peerNatIP;
    v8->_peerNatIP = (NSData *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("B")));
    v23 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v22));
    peerBlob = v8->_peerBlob;
    v8->_peerBlob = (NSData *)v23;

    v25 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8->_clientDictionary, "objectForKeyedSubscript:", GKInviteSessionIDKey));
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v25;

    v27 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8->_clientDictionary, "objectForKeyedSubscript:", GKTransportPseudonymKey));
    peerPseudonym = v8->_peerPseudonym;
    v8->_peerPseudonym = (NSString *)v27;

    v29 = GKSuggestedTransportVersionPushShortKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", GKSuggestedTransportVersionPushShortKey));

    if (v30)
    {
      v31 = v5;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8->_clientDictionary, "objectForKeyedSubscript:", v29));

      if (!v32)
      {
        v44 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
        transportVersionToUse = v8->_transportVersionToUse;
        v8->_transportVersionToUse = (NSNumber *)v44;

        if (!os_log_GKGeneral)
          v47 = (id)GKOSLoggers(v46);
        v48 = (void *)os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v49 = v48;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
          *(_DWORD *)buf = 138412290;
          v53 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Default to use (%@) GKDefaultTransportVersionIfNeeded, since this is not included in the push notification.", buf, 0xCu);

        }
        goto LABEL_11;
      }
      v31 = v8->_clientDictionary;
    }
    v33 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v29));
    v34 = v8->_transportVersionToUse;
    v8->_transportVersionToUse = (NSNumber *)v33;

LABEL_11:
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](v8, "clientDictionary"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("s")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v36));

    -[GKRealTimeMultiplayerBulletin parseClientData:](v8, "parseClientData:", v37);
    v38 = objc_alloc((Class)GKGameDescriptor);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("d")));
    v40 = objc_msgSend(v38, "initWithPushDictionary:", v39);
    -[GKBulletin setGameDescriptor:](v8, "setGameDescriptor:", v40);

    v41 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", GKDeclineReasonKey));
    declineReason = v8->_declineReason;
    v8->_declineReason = (NSNumber *)v41;

  }
  return v8;
}

- (GKRealTimeMultiplayerBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerBulletin *v8;
  id v9;
  uint64_t v10;
  NSData *sessionToken;
  id v12;
  uint64_t v13;
  NSNumber *selfNatType;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSData *peerPushToken;
  id v20;
  uint64_t v21;
  NSNumber *peerNatType;
  id v23;
  uint64_t v24;
  NSData *peerNatIP;
  id v26;
  uint64_t v27;
  NSData *peerBlob;
  id v29;
  uint64_t v30;
  NSData *selfTicket;
  id v32;
  uint64_t v33;
  NSNumber *declineReason;
  uint64_t v35;
  NSSet *v36;
  void *v37;
  uint64_t v38;
  NSDictionary *clientDictionary;
  id v40;
  uint64_t v41;
  NSNumber *inviteVersion;
  id v43;
  uint64_t v44;
  NSString *sessionID;
  id v46;
  uint64_t v47;
  NSString *peerPseudonym;
  id v49;
  uint64_t v50;
  NSNumber *transportVersionToUse;
  objc_super v53;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v53.receiver = self;
  v53.super_class = (Class)GKRealTimeMultiplayerBulletin;
  v8 = -[GKGameplayBulletin initWithCoder:](&v53, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("sessionToken"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = (NSData *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("selfNatType"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    selfNatType = v8->_selfNatType;
    v8->_selfNatType = (NSNumber *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("serverHosted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v8->_serverHosted = objc_msgSend(v16, "BOOLValue");

    v17 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("peerPushToken"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    peerPushToken = v8->_peerPushToken;
    v8->_peerPushToken = (NSData *)v18;

    v20 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("peerNatType"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    peerNatType = v8->_peerNatType;
    v8->_peerNatType = (NSNumber *)v21;

    v23 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("peerNatIP"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    peerNatIP = v8->_peerNatIP;
    v8->_peerNatIP = (NSData *)v24;

    v26 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("peerBlob"));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    peerBlob = v8->_peerBlob;
    v8->_peerBlob = (NSData *)v27;

    v29 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("selfTicket"));
    v30 = objc_claimAutoreleasedReturnValue(v29);
    selfTicket = v8->_selfTicket;
    v8->_selfTicket = (NSData *)v30;

    v32 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("declineReason"));
    v33 = objc_claimAutoreleasedReturnValue(v32);
    declineReason = v8->_declineReason;
    v8->_declineReason = (NSNumber *)v33;

    v35 = objc_opt_class(NSDictionary);
    v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, objc_opt_class(NSString), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v37, CFSTR("clientDictionary")));
    clientDictionary = v8->_clientDictionary;
    v8->_clientDictionary = (NSDictionary *)v38;

    v40 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("inviteVersion"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    inviteVersion = v8->_inviteVersion;
    v8->_inviteVersion = (NSNumber *)v41;

    v43 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("sessionID"));
    v44 = objc_claimAutoreleasedReturnValue(v43);
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v44;

    v46 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("pseudonym"));
    v47 = objc_claimAutoreleasedReturnValue(v46);
    peerPseudonym = v8->_peerPseudonym;
    v8->_peerPseudonym = (NSString *)v47;

    v49 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("transportVersionToUse"));
    v50 = objc_claimAutoreleasedReturnValue(v49);
    transportVersionToUse = v8->_transportVersionToUse;
    v8->_transportVersionToUse = (NSNumber *)v50;

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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v22.receiver = self;
  v22.super_class = (Class)GKRealTimeMultiplayerBulletin;
  -[GKGameplayBulletin encodeWithCoder:](&v22, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("sessionToken"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfNatType](self, "selfNatType"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("selfNatType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKRealTimeMultiplayerBulletin serverHosted](self, "serverHosted")));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("serverHosted"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("peerPushToken"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("peerNatType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("peerNatIP"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("peerBlob"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("selfTicket"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("declineReason"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](self, "clientDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("clientDictionary"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("inviteVersion"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("sessionID"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("pseudonym"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("transportVersionToUse"));

}

- (id)clientNotificationWithiCloudID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5));

  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("iCloudID"));

  return v6;
}

- (id)clientNotification
{
  id v3;
  NSObject *v4;
  id v5;
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
  uint8_t v35[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin clientNotification", v35, 2u);
  }
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("session-token"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("self-id"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("peer-id"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("peer-push-token"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("peer-nat-type"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("peer-nat-ip"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("peer-blob"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("invite-version"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, GKSuggestedTransportVersionPushShortKey);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, GKInviteCDXTicketIDKey);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, GKInviteSessionIDKey);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, GKInvitePeerPseudonym);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, GKBundleIDKey);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, GKDeclineReasonKey);

  }
  return v5;
}

- (void)updateDeclineInviteTrackingForReason:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin updateDeclineInviteTrackingForReason:", v11, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[GKRealTimeMultiplayerBulletin setDeclineReason:](self, "setDeclineReason:", v7);

  if ((unint64_t)a3 > 5)
    v8 = (id *)&GKReporterInviteDeclineUser;
  else
    v8 = (id *)*(&off_1002C4EC0 + a3);
  v9 = *v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v10, "reportEvent:type:", GKReporterDomainInvite, v9);

}

- (void)declineInviteWithReason:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = *(_QWORD *)&a3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    v16 = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin: declineInviteWithReason: %@", (uint8_t *)&v16, 0xCu);

  }
  v9 = v3;
  v10 = -[GKRealTimeMultiplayerBulletin updateDeclineInviteTrackingForReason:](self, "updateDeclineInviteTrackingForReason:", v3);
  if ((_DWORD)v3 == 5)
  {
    if (!os_log_GKGeneral)
      v11 = (id)GKOSLoggers(v10);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
      sub_10014E688();
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteInternal inviteWithBulletin:](GKInviteInternal, "inviteWithBulletin:", self));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceForBundleID:localPlayer:](GKMultiplayerMatchService, "serviceForBundleID:localPlayer:", v14, 0));
    objc_msgSend(v15, "declineGameInvite:reason:handler:", v12, v9, 0);

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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin: customInviteSoundPathForBundleID:", v15, 2u);
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

- (id)description
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKRealTimeMultiplayerBulletin;
  v3 = -[GKBulletin description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\ngameDescriptor.bundleIdentifier:%@\noriginatorPlayerID:%@\nreceiverPlayerID:%@\nsessionToken:%@\nsessionID:%@\n"), v6, v7, v8, v9, v10));

  return v11;
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSNumber)selfNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSelfNatType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)serverHosted
{
  return self->_serverHosted;
}

- (void)setServerHosted:(BOOL)a3
{
  self->_serverHosted = a3;
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPeerPushToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSNumber)peerNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPeerNatType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSData)peerNatIP
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setPeerNatIP:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSData)peerBlob
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPeerBlob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSData)selfTicket
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSelfTicket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSNumber)declineReason
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDeclineReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSDictionary)clientDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setClientDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSNumber)inviteVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setInviteVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (BOOL)isMessageBasedInvite
{
  return self->_isMessageBasedInvite;
}

- (void)setIsMessageBasedInvite:(BOOL)a3
{
  self->_isMessageBasedInvite = a3;
}

- (unint64_t)inviteApproach
{
  return self->_inviteApproach;
}

- (void)setInviteApproach:(unint64_t)a3
{
  self->_inviteApproach = a3;
}

- (BOOL)isSharePlayInvite
{
  return self->_isSharePlayInvite;
}

- (void)setIsSharePlayInvite:(BOOL)a3
{
  self->_isSharePlayInvite = a3;
}

- (BOOL)isNearbyInvite
{
  return self->_isNearbyInvite;
}

- (void)setIsNearbyInvite:(BOOL)a3
{
  self->_isNearbyInvite = a3;
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_storeStrong((id *)&self->_transportVersionToUse, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)peerPseudonym
{
  return self->_peerPseudonym;
}

- (void)setPeerPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_peerPseudonym, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_inviteVersion, 0);
  objc_storeStrong((id *)&self->_clientDictionary, 0);
  objc_storeStrong((id *)&self->_declineReason, 0);
  objc_storeStrong((id *)&self->_selfTicket, 0);
  objc_storeStrong((id *)&self->_peerBlob, 0);
  objc_storeStrong((id *)&self->_peerNatIP, 0);
  objc_storeStrong((id *)&self->_peerNatType, 0);
  objc_storeStrong((id *)&self->_peerPushToken, 0);
  objc_storeStrong((id *)&self->_selfNatType, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end
