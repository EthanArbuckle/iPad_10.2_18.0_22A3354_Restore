@implementation GKProfileService

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKProfileServicePrivate, "serviceFromService:", self));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FA74;
  v13[3] = &unk_1002BCA80;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "loadScopedPlayerIDs:gameBundleIDs:handler:", v10, v9, v13);

}

- (void)getProfilesForPlayerIDs:(id)a3 discardingStaleData:(BOOL)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_queue_t v12;
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
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  GKProfileService *v53;
  id v54;
  BOOL v55;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v8);
  v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKProfileService: getProfilesForPlayerIDs", buf, 2u);
  }
  v12 = dispatch_queue_create("com.apple.gamed.getProfiles.results", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryCredentialForEnvironment:", objc_msgSend(v16, "environment")));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 432, "-[GKProfileService getProfilesForPlayerIDs:discardingStaleData:handler:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerInternal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playerID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v17, v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000095B4;
  v48[3] = &unk_1002BCA08;
  v23 = v12;
  v49 = v23;
  v24 = v13;
  v50 = v24;
  v25 = v20;
  v51 = v25;
  v26 = v7;
  v52 = v26;
  v53 = self;
  v27 = v9;
  v54 = v27;
  v55 = a4;
  objc_msgSend(v25, "performOnQueue:block:", v22, v48);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bundleIdentifier"));

    if (v29)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "replyQueue"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100007AC8;
      v44[3] = &unk_1002BC3A8;
      v44[4] = self;
      v45 = v26;
      v46 = v29;
      v47 = v25;
      objc_msgSend(v47, "performOnQueue:block:", v31, v44);

    }
    else
    {
      v32 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v33 = (id)GKOSLoggers(v30);
        v32 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        sub_1000350B0();
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "replyQueue"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10002B52C;
    v38[3] = &unk_1002BB4C8;
    v39 = v25;
    v40 = v23;
    v41 = v26;
    v42 = v24;
    v43 = v27;
    objc_msgSend(v39, "notifyOnQueue:block:", v35, v38);

  }
}

- (void)getProfilesForPlayerIDs:(id)a3 handler:(id)a4
{
  -[GKProfileService getProfilesForPlayerIDs:discardingStaleData:handler:](self, "getProfilesForPlayerIDs:discardingStaleData:handler:", a3, 0, a4);
}

+ (unint64_t)requiredEntitlements
{
  return 2;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKProfileServiceInterface, a2);
}

+ (id)profileRequestForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v10;
  id v11;

  v10 = CFSTR("player-ids");
  v11 = a3;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("show-details"));
  if ((a4 & 8) == 0)
  {
    if ((a4 & 0x10) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("show-stats"));
    if ((a4 & 0x80) == 0)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("check-friend-invitation-ability"));
    goto LABEL_4;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("show-emails"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("show-emails-hashed"));
  if ((a4 & 0x10) != 0)
    goto LABEL_6;
LABEL_3:
  if ((a4 & 0x80) != 0)
    goto LABEL_7;
LABEL_4:
  v8 = objc_msgSend(v7, "copy");

  return v8;
}

- (void)updateGames:(id)a3 forPlayers:(id)a4 group:(id)a5 updater:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v11, "count")));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100028C68;
  v23[3] = &unk_1002BC4C8;
  v15 = v10;
  v24 = v15;
  v16 = v14;
  v25 = v16;
  v17 = v11;
  v26 = v17;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
  if (objc_msgSend(v18, "count"))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100028D18;
    v19[3] = &unk_1002BC568;
    v19[4] = self;
    v20 = v18;
    v21 = v16;
    v22 = v13;
    objc_msgSend(v12, "perform:", v19);

  }
}

- (void)updateLastPlayedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKProfileService: updateLastPlayedGames:", v14, 2u);
  }
  -[GKProfileService updateGames:forPlayers:group:updater:](self, "updateGames:forPlayers:group:updater:", v8, v9, v11, &stru_1002BC5A8);

}

- (void)updateChallengedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKProfileService: updateChallengedGames:", v14, 2u);
  }
  -[GKProfileService updateGames:forPlayers:group:updater:](self, "updateGames:forPlayers:group:updater:", v8, v9, v11, &stru_1002BC5C8);

}

- (void)fetchProfilesForPlayerIDs:(id)a3 familiarity:(int)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  char v23;
  GKProfileService *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  uint8_t *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  GKProfileService *v48;
  uint8_t *v49;
  _QWORD *v50;
  uint64_t v51;
  int v52;
  unsigned __int8 v53;
  char v54;
  char v55;
  _QWORD v56[3];
  char v57;
  uint8_t buf[8];
  uint8_t *v59;
  uint64_t v60;
  BOOL v61;

  v10 = *(_QWORD *)&a4;
  v37 = a3;
  v12 = a6;
  v13 = a7;
  v36 = v13;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v13);
  v15 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKProfileService: fetchProfilesForPlayerIDs", buf, 2u);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 148, "-[GKProfileService fetchProfilesForPlayerIDs:familiarity:responseKind:context:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v16, v12, v17));

  *(_QWORD *)buf = 0;
  v59 = buf;
  v60 = 0x2020000000;
  v61 = a5 == 2;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v57 = 0;
  v20 = GKFriendRecommendationInternal_ptr;
  switch((int)v10)
  {
    case 1:
      v21 = objc_opt_class(GKLocalPlayerInternal, v19);
      v22 = 0;
      goto LABEL_9;
    case 2:
      v21 = objc_opt_class(GKFriendPlayerInternal, v19);
      v22 = 1;
LABEL_9:
      v23 = 1;
      goto LABEL_12;
    case 3:
      v20 = GKFriendRequestInternal_ptr;
      goto LABEL_11;
    case 4:
      goto LABEL_11;
    default:
      v20 = GKPlayerInternal_ptr;
LABEL_11:
      v21 = objc_opt_class(*v20, v19);
      v22 = 0;
      v23 = 0;
LABEL_12:
      v24 = self;
      v25 = +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:](GKPlayerProfileCacheObject, "piecesToLoadForFamiliarity:", v10);
      v35 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v37));
      objc_msgSend(v26, "removeObject:", GKAnonymousPlayerID);
      objc_msgSend(v26, "removeObject:", GKUnknownPlayerID);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100029508;
      v43[3] = &unk_1002BC618;
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));
      v44 = v27;
      v49 = buf;
      v53 = v25;
      v50 = v56;
      v52 = a5;
      v28 = v26;
      v45 = v28;
      v54 = v23;
      v55 = v22;
      v29 = v18;
      v46 = v29;
      v30 = v37;
      v51 = v21;
      v47 = v30;
      v48 = v24;
      objc_msgSend(v29, "performOnManagedObjectContext:", v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v24, "clientProxy"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "replyQueue"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100029B10;
      v38[3] = &unk_1002BC640;
      v33 = v36;
      v40 = v33;
      v34 = v29;
      v39 = v34;
      v41 = v56;
      v42 = buf;
      objc_msgSend(v34, "notifyOnQueue:block:", v32, v38);

      _Block_object_dispose(v56, 8);
      _Block_object_dispose(buf, 8);

      return;
  }
}

- (void)loadProfilesForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  GKProfileService *v36;
  id v37;
  _QWORD *v38;
  unsigned __int8 v39;
  _QWORD v40[5];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 281, "-[GKProfileService loadProfilesForPlayerIDs:pieces:context:handler:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v13, v11, v14));

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));
  objc_msgSend(v16, "removeObject:", GKAnonymousPlayerID);
  objc_msgSend(v16, "removeObject:", GKUnknownPlayerID);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_gkMapWithBlock:", &stru_1002BC680));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100029EEC;
  v31[3] = &unk_1002BC7D8;
  v20 = v17;
  v32 = v20;
  v21 = v11;
  v33 = v21;
  v22 = v16;
  v34 = v22;
  v39 = a4;
  v23 = v15;
  v35 = v23;
  v24 = v12;
  v36 = self;
  v37 = v24;
  v38 = v40;
  objc_msgSend(v23, "performOnQueue:block:", v19, v31);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002A7F8;
  v28[3] = &unk_1002BC800;
  v27 = v23;
  v29 = v27;
  v30 = v40;
  objc_msgSend(v27, "notifyOnQueue:block:", v26, v28);

  _Block_object_dispose(v40, 8);
}

- (void)setOcelotStateForCurrentApp
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v2));

  objc_msgSend(v4, "setIsOcelot:", objc_msgSend(v3, "isArcadeApp"));
}

- (void)getOcelotStateForCurrentAppWithHandler:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  (*((void (**)(id, id))a3 + 2))(v5, objc_msgSend(v6, "isOcelot"));

}

- (void)getFriendSupportPageURLWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKProfileService *v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m", 550, "-[GKProfileService getFriendSupportPageURLWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeBag"));

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002B8F8;
    v16[3] = &unk_1002BB4A0;
    v17 = v8;
    v18 = self;
    v19 = v6;
    objc_msgSend(v19, "perform:", v16);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002BAFC;
  v13[3] = &unk_1002BB450;
  v14 = v6;
  v15 = v4;
  v11 = v6;
  v12 = v4;
  objc_msgSend(v11, "notifyOnQueue:block:", v10, v13);

}

@end
