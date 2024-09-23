@implementation GKTurnBasedSessionCacheObject

+ (id)entityName
{
  return CFSTR("TurnBasedSession");
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("exchanges"), CFSTR("participants"), 0);
}

- (BOOL)isActive
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject status](self, "status"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Active")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject status](self, "status"));
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("Invited"));

  }
  return v4;
}

- (void)prepareForDeletion
{
  objc_super v3;

  -[GKTurnBasedSessionCacheObject deleteGameData](self, "deleteGameData");
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedSessionCacheObject;
  -[GKTurnBasedSessionCacheObject prepareForDeletion](&v3, "prepareForDeletion");
}

- (id)gameData
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject gameData]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionCacheObject gameData]", objc_msgSend(v8, "UTF8String"), 3756));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
  v11 = GKTurnBasedGameDataCacheRoot();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v12));
    if (!v13)
      -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)deleteGameData
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject deleteGameData]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionCacheObject deleteGameData]", objc_msgSend(v8, "UTF8String"), 3770));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
  v11 = GKTurnBasedGameDataCacheRoot();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = objc_msgSend(v13, "removeItemAtPath:error:", v12, 0);

    if (v14)
    {
      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v15);
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
        sub_1000F6E34();
    }
  }
  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0);

}

- (void)expireGameData
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject expireGameData]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionCacheObject expireGameData]", objc_msgSend(v8, "UTF8String"), 3783));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v10);

}

- (void)saveGameData:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3789));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  if (v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
    v16 = GKTurnBasedGameDataCacheRoot();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (!v17)
    {
LABEL_15:

      goto LABEL_16;
    }
    v27 = 0;
    v18 = objc_msgSend(v6, "writeToFile:options:error:", v17, 1, &v27);
    v19 = v27;
    v20 = v19;
    if ((v18 & 1) != 0)
    {
LABEL_6:
      v21 = v7;
LABEL_14:
      -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v21);

      goto LABEL_15;
    }
    if (objc_msgSend(v19, "code") == (id)4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByDeletingLastPathComponent"));
      v23 = objc_alloc_init((Class)NSFileManager);
      if ((objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, 0) & 1) != 0)
      {
        v26 = v20;
        v24 = objc_msgSend(v6, "writeToFile:options:error:", v17, 1, &v26);
        v25 = v26;

        if (!v24)
        {
          v21 = 0;
          v20 = v25;
          goto LABEL_14;
        }
        v20 = v25;
        goto LABEL_6;
      }

    }
    v21 = 0;
    goto LABEL_14;
  }
  -[GKTurnBasedSessionCacheObject deleteGameData](self, "deleteGameData");
LABEL_16:

}

- (id)participantWithPlayerID:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]", objc_msgSend(v10, "UTF8String"), 3818));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000F0A34;
    v17[3] = &unk_1002BFA78;
    v18 = v4;
    v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", v17);

    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v13));

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  objc_super v83;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F67F4();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v15, "UTF8String"), 3839));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v83.receiver = self;
  v83.super_class = (Class)GKTurnBasedSessionCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v83, "updateWithServerRepresentation:expirationDate:", v6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("session-id")));
  if (v17)
    -[GKTurnBasedSessionCacheObject setSessionID:](self, "setSessionID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("created-at")));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v18));
    -[GKTurnBasedSessionCacheObject setCreationDate:](self, "setCreationDate:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("session-status")));

  if (v20)
    -[GKTurnBasedSessionCacheObject setStatus:](self, "setStatus:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("current-player-id")));

  if (v21)
  {
    if (objc_msgSend(v21, "length"))
      v22 = v21;
    else
      v22 = 0;
    -[GKTurnBasedSessionCacheObject setCurrentPlayerID:](self, "setCurrentPlayerID:", v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("current-guest-id")));

  if (v23)
  {
    if (objc_msgSend(v23, "length"))
      v24 = v23;
    else
      v24 = 0;
    -[GKTurnBasedSessionCacheObject setCurrentGuestID:](self, "setCurrentGuestID:", v24);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("last-turn-at")));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v25));
    -[GKTurnBasedSessionCacheObject setLastTurnDate:](self, "setLastTurnDate:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle-id")));

  if (v27)
    -[GKTurnBasedSessionCacheObject setBundleID:](self, "setBundleID:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle-version")));

  if (v28)
    -[GKTurnBasedSessionCacheObject setBundleVersion:](self, "setBundleVersion:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("short-bundle-version")));

  if (v29)
    -[GKTurnBasedSessionCacheObject setShortBundleVersion:](self, "setShortBundleVersion:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("platform")));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:](GKGameDescriptor, "gamePlatformFromServerGameDescriptorString:", v30)));
    -[GKTurnBasedSessionCacheObject setPlatform:](self, "setPlatform:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("slots")));
  if (v32)
  {
    -[GKTurnBasedSessionCacheObject setExpirationDate:](self, "setExpirationDate:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-id")));

    if (v33)
      -[GKTurnBasedSessionCacheObject setUnusedID:](self, "setUnusedID:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("taken-at")));

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v34));
      -[GKTurnBasedSessionCacheObject setLastTurnDate:](self, "setLastTurnDate:", v35);

    }
    v71 = v8;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("delete-at")));

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v36));
      -[GKTurnBasedSessionCacheObject setDeletionDate:](self, "setDeletionDate:", v37);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message")));

    if (v38)
      -[GKTurnBasedSessionCacheObject setMessage:](self, "setMessage:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localized-message")));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v39, 100, 0, 0));
      -[GKTurnBasedSessionCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason")));

    if (v41)
      -[GKTurnBasedSessionCacheObject setReason:](self, "setReason:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("min-players")));

    if (v42)
      -[GKTurnBasedSessionCacheObject setMinPlayers:](self, "setMinPlayers:", objc_msgSend(v42, "integerValue"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("max-players")));

    if (v43)
      -[GKTurnBasedSessionCacheObject setMaxPlayers:](self, "setMaxPlayers:", objc_msgSend(v43, "integerValue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("whose-turn")));

    if (v44)
    {
      if (objc_msgSend(v44, "length"))
        v45 = v44;
      else
        v45 = 0;
      -[GKTurnBasedSessionCacheObject setCurrentPlayerID:](self, "setCurrentPlayerID:", v45);
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("turn-on-slot")));

    if (v46)
      -[GKTurnBasedSessionCacheObject setCurrentParticipant:](self, "setCurrentParticipant:", objc_msgSend(v46, "integerValue"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("turn-number")));

    if (v47)
    {
      v48 = objc_msgSend(v47, "integerValue");
      if (v48 != (id)(int)-[GKTurnBasedSessionCacheObject turnNumber](self, "turnNumber"))
      {
        -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0);
        -[GKTurnBasedSessionCacheObject setTurnNumber:](self, "setTurnNumber:", v48);
      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("submitted-by")));

    if (v30)
    {
      if (objc_msgSend(v30, "length"))
        v49 = v30;
      else
        v49 = 0;
      -[GKTurnBasedSessionCacheObject setLastTurnPlayerID:](self, "setLastTurnPlayerID:", v49);
    }
    v50 = objc_autoreleasePoolPush();
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject managedObjectContext](self, "managedObjectContext"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("participants")));
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1000F1424;
    v81[3] = &unk_1002C0A90;
    v53 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v52, "count")));
    v82 = v53;
    objc_msgSend(v52, "enumerateObjectsUsingBlock:", v81);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1000F1490;
    v77[3] = &unk_1002BE118;
    v54 = v53;
    v78 = v54;
    v55 = v51;
    v79 = v55;
    v56 = v52;
    v80 = v56;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v77);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allValues"));
    objc_msgSend(v55, "_gkDeleteObjects:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exchanges")));
    if (v58)
    {
      v69 = v50;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject exchanges](self, "exchanges"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_gkMapDictionaryWithKeyPath:", CFSTR("exchangeID")));
      v70 = v32;
      v61 = objc_msgSend(v60, "mutableCopy");

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("exchanges")));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1000F154C;
      v72[3] = &unk_1002BDFD8;
      v73 = v61;
      v63 = v55;
      v74 = v63;
      v75 = v56;
      v76 = v62;
      v68 = v62;
      v64 = v61;
      objc_msgSend(v58, "enumerateObjectsUsingBlock:", v72);
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allValues"));
      objc_msgSend(v63, "_gkDeleteObjects:", v65);

      v50 = v69;
      v32 = v70;
    }

    objc_autoreleasePoolPop(v50);
    v8 = v71;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("game-state")));

  if (v66)
    -[GKTurnBasedSessionCacheObject saveGameData:expirationDate:](self, "saveGameData:expirationDate:", v66, v8);
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("game-state-version")));

  if (v67)
    -[GKTurnBasedSessionCacheObject setMatchDataVersion:](self, "setMatchDataVersion:", v67);

}

+ (id)sessionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionsWithSessionIDs:inContext:", v8, v6, v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

  return v10;
}

+ (id)uniqueAttributeName
{
  return CFSTR("sessionID");
}

+ (const)uniqueObjectIDLookupKey
{
  return CFSTR("GKTurnBasedSessionCacheObjectUniqueObjectIDLookupKey");
}

+ (id)sessionsWithSessionIDs:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6E94();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]", objc_msgSend(v15, "UTF8String"), 4021));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueObjectIDLookupWithContext:", v8));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000F18F0;
  v21[3] = &unk_1002C2A08;
  v22 = v8;
  v23 = a1;
  v18 = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueObjectsForKeys:context:newObject:", v6, v18, v21));

  return v19;
}

- (void)expire
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedSessionCacheObject;
  -[GKExpiringCacheObject expire](&v4, "expire");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject expirationDate](self, "expirationDate"));
  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v3);

}

- (id)participantAtIndex:(int64_t)a3
{
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject participantAtIndex:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedSessionCacheObject participantAtIndex:]", objc_msgSend(v10, "UTF8String"), 4037));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
  v13 = objc_msgSend(v12, "count");

  if ((unint64_t)v13 <= a3)
  {
    v15 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", a3));

  }
  return v15;
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 4047));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  return +[GKTurnBasedMatchInternal internalRepresentationForCacheObject:](GKTurnBasedMatchInternal, "internalRepresentationForCacheObject:", self);
}

@end
