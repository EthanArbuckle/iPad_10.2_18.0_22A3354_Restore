@implementation GKGameplayBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGameplayBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKGameplayBulletin *v8;
  id v9;
  uint64_t v10;
  NSString *receiverPlayerID;
  id v12;
  uint64_t v13;
  NSString *originatorPlayerID;
  id v15;
  uint64_t v16;
  GKPlayerInternal *receiverPlayer;
  id v18;
  uint64_t v19;
  GKPlayerInternal *originatorPlayer;
  id v21;
  uint64_t v22;
  NSString *receiverGuestPlayerID;
  id v24;
  uint64_t v25;
  NSString *originatorGuestPlayerID;
  id v27;
  uint64_t v28;
  GKPlayerInternal *receiverGuestPlayer;
  id v30;
  uint64_t v31;
  GKPlayerInternal *originatorGuestPlayer;
  uint64_t v33;
  uint64_t v34;
  NSSet *v35;
  void *v36;
  uint64_t v37;
  NSArray *compatibleVersions;
  uint64_t v39;
  uint64_t v40;
  NSSet *v41;
  void *v42;
  uint64_t v43;
  NSArray *compatibleShortVersions;
  id v45;
  void *v46;
  objc_super v48;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin initWithCoder:", buf, 2u);
  }
  v48.receiver = self;
  v48.super_class = (Class)GKGameplayBulletin;
  v8 = -[GKBulletin initWithCoder:](&v48, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("receiverPlayerID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    receiverPlayerID = v8->_receiverPlayerID;
    v8->_receiverPlayerID = (NSString *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("originatorPlayerID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    originatorPlayerID = v8->_originatorPlayerID;
    v8->_originatorPlayerID = (NSString *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal), CFSTR("receiverPlayer"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    receiverPlayer = v8->_receiverPlayer;
    v8->_receiverPlayer = (GKPlayerInternal *)v16;

    v18 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal), CFSTR("originatorPlayer"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    originatorPlayer = v8->_originatorPlayer;
    v8->_originatorPlayer = (GKPlayerInternal *)v19;

    v21 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("receiverGuestPlayerID"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    receiverGuestPlayerID = v8->_receiverGuestPlayerID;
    v8->_receiverGuestPlayerID = (NSString *)v22;

    v24 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("originatorGuestPlayerID"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    originatorGuestPlayerID = v8->_originatorGuestPlayerID;
    v8->_originatorGuestPlayerID = (NSString *)v25;

    v27 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal), CFSTR("receiverGuestPlayer"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    receiverGuestPlayer = v8->_receiverGuestPlayer;
    v8->_receiverGuestPlayer = (GKPlayerInternal *)v28;

    v30 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal), CFSTR("originatorGuestPlayer"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    originatorGuestPlayer = v8->_originatorGuestPlayer;
    v8->_originatorGuestPlayer = (GKPlayerInternal *)v31;

    v33 = objc_opt_class(NSArray);
    v34 = objc_opt_class(NSDictionary);
    v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, v34, objc_opt_class(NSString), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v36, CFSTR("compatibleVersions")));
    compatibleVersions = v8->_compatibleVersions;
    v8->_compatibleVersions = (NSArray *)v37;

    v39 = objc_opt_class(NSArray);
    v40 = objc_opt_class(NSDictionary);
    v41 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v39, v40, objc_opt_class(NSString), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v42, CFSTR("compatibleShortVersions")));
    compatibleShortVersions = v8->_compatibleShortVersions;
    v8->_compatibleShortVersions = (NSArray *)v43;

    v45 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("gameLocation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v8->_gameLocation = objc_msgSend(v46, "integerValue");

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
  objc_super v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin encodeWithCoder:", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)GKGameplayBulletin;
  -[GKBulletin encodeWithCoder:](&v19, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("receiverPlayerID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("originatorPlayerID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayer](self, "receiverPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("receiverPlayer"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("originatorPlayer"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayerID](self, "receiverGuestPlayerID"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("receiverGuestPlayerID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorGuestPlayerID](self, "originatorGuestPlayerID"));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("originatorGuestPlayerID"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayer](self, "receiverGuestPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("receiverGuestPlayer"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorGuestPlayer](self, "originatorGuestPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("originatorGuestPlayer"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("compatibleVersions"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("compatibleShortVersions"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[GKGameplayBulletin gameLocation](self, "gameLocation")));
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("gameLocation"));

}

- (NSString)URLContext
{
  return (NSString *)&stru_1002CE2A8;
}

- (BOOL)isPushForLocalPlayers
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  uint8_t v8[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushForLocalPlayers", v8, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  v6 = objc_msgSend((id)objc_opt_class(self), "playerIsLocal:", v5);

  return v6;
}

- (BOOL)isPushFromLocalPlayers
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  uint8_t v8[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushFromLocalPlayers", v8, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  v6 = objc_msgSend((id)objc_opt_class(self), "playerIsLocal:", v5);

  return v6;
}

- (BOOL)isCompatibleWithGameDescriptor:(id)a3
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
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  unsigned __int8 v21;
  uint8_t v23[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin isCompatibleWithGameDescriptor:", v23, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleVersion"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortBundleVersion"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v15 = objc_msgSend(v9, "isEqualToString:", v14);

  if (!v15)
    goto LABEL_13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortBundleVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleVersion"));
  if (!objc_msgSend(v13, "isEqualToString:", v16))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    if ((objc_msgSend(v18, "containsObject:", v16) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", v17))
    {

      goto LABEL_10;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
    v21 = objc_msgSend(v20, "containsObject:", v17);

    if ((v21 & 1) != 0)
      goto LABEL_11;
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
LABEL_10:

LABEL_11:
  v19 = 1;
LABEL_14:

  return v19;
}

- (void)checkCompatibleGameWithoutCompatibilityMatrix
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin checkCompatibleGameWithoutCompatibilityMatrix", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationProxyForBundleID:", v7));
  if (objc_msgSend(v8, "isInstalled") && (objc_msgSend(v8, "isRestricted") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleShortVersion"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortBundleVersion"));
    if ((objc_msgSend(v11, "isEqualToString:", v9) & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
      if ((objc_msgSend(v12, "containsObject:", v9) & 1) == 0)
      {
        v30 = v9;
        v31 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleVersion"));
        if ((objc_msgSend(v14, "isEqualToString:", v32) & 1) == 0)
        {
          v28 = v14;
          v29 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
          v16 = v32;
          if ((objc_msgSend(v15, "containsObject:") & 1) == 0)
          {
            v27 = objc_msgSend(v32, "isEqualToString:", CFSTR("-1"));

            v9 = v30;
            if ((v27 & 1) == 0)
            {
LABEL_25:

              goto LABEL_26;
            }
LABEL_15:
            v17 = +[GKApplicationWorkspace getPlatformForBundleID:](GKApplicationWorkspace, "getPlatformForBundleID:", v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
            v19 = objc_msgSend(v18, "platform");

            if (v19 == v17)
            {
              if (!os_log_GKGeneral)
                v21 = (id)GKOSLoggers(v20);
              v22 = os_log_GKDaemon;
              v16 = v32;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v34 = v7;
                v35 = 2112;
                v36 = v9;
                v37 = 2112;
                v38 = v32;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found perfect compatible game: bundleID = %@, short version = %@, version = %@", buf, 0x20u);
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
              objc_msgSend(v23, "setShortBundleVersion:", v9);

              v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
              objc_msgSend(v24, "setBundleVersion:", v32);

              -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 1);
            }
            else
            {
              if (!os_log_GKGeneral)
                v25 = (id)GKOSLoggers(v20);
              v26 = os_log_GKDaemon;
              v16 = v32;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v34 = v7;
                v35 = 2112;
                v36 = v9;
                v37 = 2112;
                v38 = v32;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Didn't find a perfect compatible game: bundleID = %@, short version = %@, version = %@", buf, 0x20u);
              }
            }
            goto LABEL_25;
          }

          v14 = v28;
          v13 = v29;
        }

        v9 = v30;
        v12 = v31;
      }

    }
    goto LABEL_15;
  }
LABEL_26:

}

- (BOOL)setInstalledGameLocationFor:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL8 v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  BOOL v27;
  id v28;
  id v29;
  NSObject *v30;
  _BOOL8 v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "platform")
    || (v8 = +[GKGameDescriptor supportsPlatform:](GKGameDescriptor, "supportsPlatform:", objc_msgSend(v6, "platform")), (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationProxyForBundleID:", v9));

    if (objc_msgSend(v11, "isInstalled") && (objc_msgSend(v11, "isRestricted") & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleShortVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleVersion"));
      v28 = objc_msgSend((id)objc_opt_class(self), "areGameVersionsCompatibleForGame:shortVersion:version:", v6, v14, v16);
      if ((_DWORD)v28)
      {
        if (!os_log_GKGeneral)
          v29 = (id)GKOSLoggers(v28);
        v30 = os_log_GKTrace;
        v31 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
        if (v31)
        {
          LOWORD(v40) = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Installed compatible app found", (uint8_t *)&v40, 2u);
        }
        if (!os_log_GKGeneral)
          v32 = (id)GKOSLoggers(v31);
        v33 = os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v40 = 138412802;
          v41 = v9;
          v42 = 2112;
          v43 = v14;
          v44 = 2112;
          v45 = v16;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GKGameplayBulletin - found installed compatible app: bundleID = %@, short version = %@, version = %@", (uint8_t *)&v40, 0x20u);
        }
        v27 = 1;
        -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        objc_msgSend(v34, "setBundleIdentifier:", v9);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        objc_msgSend(v35, "setBundleVersion:", v16);

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        objc_msgSend(v36, "setShortBundleVersion:", v14);

        v37 = +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform");
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        objc_msgSend(v38, "setPlatform:", v37);

        goto LABEL_32;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
      v13 = objc_msgSend(v12, "isAppInstallationRestricted");

      if ((v13 & 1) != 0)
      {
LABEL_31:
        v27 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("short-bundle-version")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle-version")));
      v16 = (void *)v15;
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(v15);
      v18 = os_log_GKTrace;
      v19 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v19)
      {
        LOWORD(v40) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Store Compatible app found", (uint8_t *)&v40, 2u);
      }
      if (!os_log_GKGeneral)
        v20 = (id)GKOSLoggers(v19);
      v21 = os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v40 = 138412802;
        v41 = v9;
        v42 = 2112;
        v43 = v14;
        v44 = 2112;
        v45 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKGameplayBulletin - found store compatible app: bundleID = %@, short version = %@, version = %@", (uint8_t *)&v40, 0x20u);
      }
      -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 2);
    }

    goto LABEL_31;
  }
  if (!os_log_GKGeneral)
    v22 = (id)GKOSLoggers(v8);
  v23 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor supportedPlatforms](GKGameDescriptor, "supportedPlatforms"));
    v40 = 134218498;
    v41 = v25;
    v42 = 2112;
    v43 = v6;
    v44 = 2112;
    v45 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GKGameplayBulletin - skipping mismatching platform between current = %ld and game = %@. Supported platforms: %@", (uint8_t *)&v40, 0x20u);

  }
  v27 = 0;
LABEL_33:

  return v27;
}

- (void)determineGameLocationViaCompatibilityMatrixWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameplayBulletin.m", 194, "-[GKGameplayBulletin determineGameLocationViaCompatibilityMatrixWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortBundleVersion"));
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      goto LABEL_10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    objc_msgSend(v16, "setShortBundleVersion:", v13);

  }
LABEL_10:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleVersion"));
  if (v18)
  {
    v19 = (void *)v18;
LABEL_14:

    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    objc_msgSend(v22, "setBundleVersion:", v19);

    goto LABEL_14;
  }
LABEL_15:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));

  if (v23)
  {
    -[GKGameplayBulletin checkCompatibleGameWithoutCompatibilityMatrix](self, "checkCompatibleGameWithoutCompatibilityMatrix");
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10013C8D4;
      v30[3] = &unk_1002BB4A0;
      v30[4] = self;
      v31 = v10;
      v32 = v9;
      objc_msgSend(v32, "perform:", v30);

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10013CD94;
  v27[3] = &unk_1002BB450;
  v28 = v9;
  v29 = v5;
  v25 = v9;
  v26 = v5;
  objc_msgSend(v25, "notifyOnQueue:block:", v24, v27);

}

+ (BOOL)areGameVersionsCompatibleForGame:(id)a3 shortVersion:(id)a4 version:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortVersions"));
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortVersions"));
    if ((objc_msgSend(v13, "containsObject:", CFSTR("-1")) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "versions"));
      if ((objc_msgSend(v14, "containsObject:", v8) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "versions"));
        v12 = objc_msgSend(v15, "containsObject:", CFSTR("-1"));

      }
    }

  }
  return v12;
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGamePlayerBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameplayBulletin.m", 274, "-[GKGameplayBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013D0BC;
  v16[3] = &unk_1002BB590;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v11, "perform:", v16);
  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10013D368;
    v13[3] = &unk_1002BB450;
    v15 = v5;
    v14 = v11;
    objc_msgSend(v14, "notifyOnQueue:block:", v12, v13);

  }
}

- (void)loadOriginatorPlayerWithCompletionHandler:(id)a3
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
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameplayBulletin.m", 311, "-[GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  if (!v11)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10013D594;
    v16[3] = &unk_1002BB590;
    v16[4] = self;
    v17 = v10;
    objc_msgSend(v17, "perform:", v16);

    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v5)
  {
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10013D7A4;
    v13[3] = &unk_1002BB450;
    v15 = v5;
    v14 = v10;
    objc_msgSend(v14, "notifyOnQueue:block:", v12, v13);

  }
LABEL_8:

}

- (NSString)receiverPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setReceiverPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)originatorPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOriginatorPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (GKPlayerInternal)receiverPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReceiverPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (GKPlayerInternal)originatorPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOriginatorPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)receiverGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReceiverGuestPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)originatorGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOriginatorGuestPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (GKPlayerInternal)receiverGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 216, 1);
}

- (void)setReceiverGuestPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (GKPlayerInternal)originatorGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOriginatorGuestPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)compatibleVersions
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCompatibleVersions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)compatibleShortVersions
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCompatibleShortVersions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (unsigned)gameLocation
{
  return self->_gameLocation;
}

- (void)setGameLocation:(unsigned __int8)a3
{
  self->_gameLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibleShortVersions, 0);
  objc_storeStrong((id *)&self->_compatibleVersions, 0);
  objc_storeStrong((id *)&self->_originatorGuestPlayer, 0);
  objc_storeStrong((id *)&self->_receiverGuestPlayer, 0);
  objc_storeStrong((id *)&self->_originatorGuestPlayerID, 0);
  objc_storeStrong((id *)&self->_receiverGuestPlayerID, 0);
  objc_storeStrong((id *)&self->_originatorPlayer, 0);
  objc_storeStrong((id *)&self->_receiverPlayer, 0);
  objc_storeStrong((id *)&self->_originatorPlayerID, 0);
  objc_storeStrong((id *)&self->_receiverPlayerID, 0);
}

@end
