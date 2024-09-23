@implementation GKCDIDSInfo

- (BOOL)isExpiredForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCDIDSInfo cohort](self, "cohort"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCDIDSInfo cohort](self, "cohort"));
    v7 = objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "expirationTimeForCohort:", v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCDIDSInfo timeStamp](self, "timeStamp"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12 > v9;

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)_gkUpdateEntryWithHandle:(id)a3 idsInfoResult:(id)a4
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
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:idsInfoResult:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCDIDSInfo+GKAdditions.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:idsInfoResult:]", objc_msgSend(v13, "UTF8String"), 72));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "gameCenterData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsFriendingViaPush")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsMessageTransportV2")));
  v18 = objc_msgSend(v7, "status");
  if (v18 == (id)2)
    goto LABEL_6;
  if (v18 == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactsSharingState"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactsSharingState"));
      v21 = (uint64_t)objc_msgSend(v20, "intValue");

    }
    else
    {
      v21 = 0xFFFFFFFFLL;
    }
    v34 = -[GKCDIDSInfo cohortFromIDSConsent:](self, "cohortFromIDSConsent:", v21);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactsAssociationID"));
    -[GKCDIDSInfo _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:](self, "_gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:", v6, v35, v16, v17, v34);

    goto LABEL_19;
  }
  if (!v18)
  {
LABEL_6:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactsAssociationID"));
    -[GKCDIDSInfo _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:](self, "_gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:", v6, v19, v16, v17, 0);
LABEL_19:

    goto LABEL_20;
  }
  if (!os_log_GKGeneral)
    v22 = (id)GKOSLoggers(v18);
  v23 = os_log_GKError;
  v24 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
  if (v24)
    sub_1001303E8(v23, v25, v26, v27, v28, v29, v30, v31);
  if (!os_log_GKGeneral)
    v32 = (id)GKOSLoggers(v24);
  v33 = (void *)os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_100130350(v33, v7);
LABEL_20:

}

- (int)cohortFromIDSConsent:(int)a3
{
  int result;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((a3 + 1) < 3)
    return dword_1002329B8[a3 + 1];
  if (!os_log_GKGeneral)
    v4 = (id)GKOSLoggers(self);
  v5 = os_log_GKError;
  result = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_10013041C(v5, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

- (void)_gkUpdateEntryWithHandle:(id)a3 contactAssociationID:(id)a4 supportsFriendingViaPush:(id)a5 supportsMessageTransportV2:(id)a6 cohort:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  dispatch_queue_t current_queue;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;

  v7 = *(_QWORD *)&a7;
  v25 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  current_queue = dispatch_get_current_queue();
  v16 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v16, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v24 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:]", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCDIDSInfo+GKAdditions.m"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v18, "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:]", objc_msgSend(v20, "UTF8String"), 136));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v21);
    v7 = v24;
  }

  if (objc_msgSend(v25, "length"))
  {
    -[GKCDIDSInfo setHandle:](self, "setHandle:", v25);
    -[GKCDIDSInfo setContactAssociationID:](self, "setContactAssociationID:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[GKCDIDSInfo setTimeStamp:](self, "setTimeStamp:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    -[GKCDIDSInfo setCohort:](self, "setCohort:", v23);

    -[GKCDIDSInfo setSupportsFriendingViaPush:](self, "setSupportsFriendingViaPush:", v13);
    -[GKCDIDSInfo setSupportsMessageTransportV2:](self, "setSupportsMessageTransportV2:", v14);
  }

}

+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@"), a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkObjectsMatchingPredicate:withContext:", v7, v6));

  return v8;
}

+ (id)_gkObjectsMatchingContactAssociationIDs:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contactAssociationID in %@"), a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkObjectsMatchingPredicate:withContext:", v7, v6));

  return v8;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("IDSInfo"));
}

@end
