@implementation GKMultiplayerMatchService

+ (unint64_t)requiredEntitlements
{
  return 128;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKMultiplayerServiceInterface, a2);
}

- (_TtC14GameDaemonCore13GameDaemonTTR)ttrHelper
{
  _TtC14GameDaemonCore13GameDaemonTTR *ttrHelper;
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC14GameDaemonCore13GameDaemonTTR *v7;
  void *v8;
  void *v9;
  _TtC14GameDaemonCore13GameDaemonTTR *v10;
  _TtC14GameDaemonCore13GameDaemonTTR *v11;

  ttrHelper = self->_ttrHelper;
  if (!ttrHelper)
  {
    v4 = GKGetRuntimeStrategy(0, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localPlayer"));

    v7 = [_TtC14GameDaemonCore13GameDaemonTTR alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v10 = -[GameDaemonTTR initWithClientProxyBundleIdentifier:localPlayer:](v7, "initWithClientProxyBundleIdentifier:localPlayer:", v9, v6);
    v11 = self->_ttrHelper;
    self->_ttrHelper = v10;

    ttrHelper = self->_ttrHelper;
  }
  return ttrHelper;
}

- (GKPseudonymManager)pseudonymManager
{
  GKPseudonymManager *pseudonymManager;
  GKPseudonymManager *v4;
  GKPseudonymManager *v5;

  pseudonymManager = self->_pseudonymManager;
  if (!pseudonymManager)
  {
    v4 = objc_alloc_init(GKPseudonymManager);
    v5 = self->_pseudonymManager;
    self->_pseudonymManager = v4;

    pseudonymManager = self->_pseudonymManager;
  }
  return pseudonymManager;
}

- (void)fetchPseudonymIfNeededWithTransportContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *, _QWORD);
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pseudonym"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pseudonym"));
    v7[2](v7, v9, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_100079000;
    v16[4] = sub_100079010;
    v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_100079000;
    v14[4] = sub_100079010;
    v15 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100079018;
    v10[3] = &unk_1002BFC20;
    v12 = v16;
    v13 = v14;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v9, "isICloudAvailableWithHandler:", v10);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);

  }
}

- (void)getPlayersForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 transportContext:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  GKMultiplayerMatchService *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v34 = v15;
  if (!os_log_GKGeneral)
    v16 = (id)GKOSLoggers(v15);
  v17 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v12;
    v49 = 2112;
    v50 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Get players for match request: %@, transportContext: %@", buf, 0x16u);
  }
  -[GKMultiplayerMatchService cancelOutstandingMatchRequestWithHandler:](self, "cancelOutstandingMatchRequestWithHandler:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 160, "-[GKMultiplayerMatchService getPlayersForMatchRequest:playerCount:rematchID:transportContext:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v20 = objc_alloc_init((Class)GKMatchResponse);
  objc_msgSend(v20, "transitionToState:", 1);
  objc_msgSend(v20, "setMatchingGroup:", v19);
  objc_msgSend(v20, "setMatchRequest:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v21, "setCurrentMatchResponse:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000796CC;
  v40[3] = &unk_1002BFC98;
  v40[4] = self;
  v41 = v14;
  v24 = v19;
  v42 = v24;
  v25 = v20;
  v43 = v25;
  v44 = v12;
  v45 = v13;
  v46 = a4;
  v26 = v13;
  v27 = v12;
  v28 = v14;
  objc_msgSend(v24, "performOnQueue:block:", v23, v40);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyQueue"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100079D1C;
  v35[3] = &unk_1002BFCC0;
  v36 = v25;
  v37 = v24;
  v38 = self;
  v39 = v34;
  v31 = v34;
  v32 = v24;
  v33 = v25;
  objc_msgSend(v32, "notifyOnQueue:block:", v30, v35);

}

+ (id)makeBaseServerRequestForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 connInfo:(int64_t)a6
{
  id v9;
  id v10;
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
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];

  v9 = a3;
  v10 = a5;
  v28[0] = CFSTR("min-peers");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "minPlayers")));
  v29[0] = v11;
  v28[1] = CFSTR("max-peers");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maxPlayers")));
  v29[1] = v12;
  v28[2] = CFSTR("requires-guest-player-capability");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "hasGuestPlayers")));
  v29[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  if (a4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("num-players"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queueName"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queueName"));
    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("queue-name"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "properties"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "properties"));
      objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("properties"));

    }
  }
  else
  {
    v26[0] = CFSTR("bucket-id");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "playerGroup")));
    v27[0] = v21;
    v26[1] = CFSTR("conn-info");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
    v27[1] = v22;
    v26[2] = CFSTR("flags");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#.8x"), objc_msgSend(v9, "playerAttributes")));
    v27[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 3));
    objc_msgSend(v15, "addEntriesFromDictionary:", v24);

    if (v10)
      objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("match-id"));
  }

  return v15;
}

+ (id)makePlayersDictionaryForMatchRequest:(id)a3 transportContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  const __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];

  v5 = a3;
  v6 = a4;
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localPlayerID"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localPlayerID"));
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
  v12 = CFSTR("player-id");
  if (v11)
  {
    v61[1] = CFSTR("properties");
    v62[0] = v10;
    v61[0] = CFSTR("player-id");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
    v62[1] = v13;
    v14 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 2));

  }
  else
  {
    v59 = CFSTR("player-id");
    v60 = v10;
    v14 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
  }

  v37 = (void *)v14;
  objc_msgSend(v42, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipientPlayerIDs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedPlayerIDs"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedPlayerIDs"));
    objc_msgSend(v16, "addObjectsFromArray:", v18);

  }
  v38 = v6;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v50;
    v40 = v5;
    v41 = v10;
    v39 = *(_QWORD *)v50;
    do
    {
      v22 = 0;
      v43 = v20;
      do
      {
        if (*(_QWORD *)v50 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v22);
        if ((objc_msgSend(v23, "isEqualToString:", v10) & 1) == 0)
        {
          v24 = v12;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipientProperties"));
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v46;
            while (2)
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(_QWORD *)v46 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "playerID"));
                v32 = objc_msgSend(v31, "isEqualToString:", v23);

                if (v32)
                {
                  v12 = v24;
                  v55[0] = v24;
                  v55[1] = CFSTR("properties");
                  v56[0] = v23;
                  v5 = v40;
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "recipientProperties"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v30));
                  v56[1] = v34;
                  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
                  objc_msgSend(v42, "addObject:", v35);

                  goto LABEL_25;
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
              if (v27)
                continue;
              break;
            }
          }

          v12 = v24;
          v53 = v24;
          v54 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          objc_msgSend(v42, "addObject:", v25);
          v5 = v40;
LABEL_25:

          v10 = v41;
          v21 = v39;
          v20 = v43;
        }
        v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v20);
  }

  return v42;
}

- (void)cancelOutstandingMatchRequestWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
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
  _QWORD v17[4];
  id v18;
  id v19;
  id buf;
  _QWORD v21[2];
  _QWORD v22[2];

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService: cancelOutstandingMatchRequest", (uint8_t *)&buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v8, "cancelOutstandingCheckMatchStatus");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentMatchResponse"));

  if (v10 && objc_msgSend(v10, "transitionToState:", 5))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "playerGroup")));

    if (v11 && v13)
    {
      v21[0] = CFSTR("rid");
      v21[1] = CFSTR("bucket-id");
      v22[0] = v11;
      v22[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchingGroup"));
      if (v15)
      {
        objc_initWeak(&buf, self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchingGroup"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10007A7BC;
        v17[3] = &unk_1002BFCE8;
        objc_copyWeak(&v19, &buf);
        v18 = v14;
        objc_msgSend(v16, "perform:", v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&buf);
      }

    }
  }
  if (v5)
    v5[2](v5);

}

- (void)getFlowRateForPlayerGroup:(int64_t)a3 handler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:](self, "getFlowRateWithPlayerGroup:queueName:handler:", v7, 0, v6);

}

- (void)getOverallFlowRateWithHandler:(id)a3
{
  -[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:](self, "getFlowRateWithPlayerGroup:queueName:handler:", 0, 0, a3);
}

- (void)getFlowRateForQueue:(id)a3 handler:(id)a4
{
  -[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:](self, "getFlowRateWithPlayerGroup:queueName:handler:", 0, a3, a4);
}

- (void)getFlowRateWithPlayerGroup:(id)a3 queueName:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("handler can't be nil")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (handler)\n[%s (%s:%d)]"), v12, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]", objc_msgSend(v14, "UTF8String"), 391));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  if (v8 && v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("playerGroup and queueName can't be both non-nil")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (!(playerGroup && queueName))\n[%s (%s:%d)]"), v16, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]", objc_msgSend(v18, "UTF8String"), 392));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }
  if (!os_log_GKGeneral)
    v20 = (id)GKOSLoggers(v10);
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    sub_1000897B4();
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 395, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v21));

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10007ACCC;
  v34[3] = &unk_1002BEF00;
  v34[4] = self;
  v23 = v8;
  v35 = v23;
  v24 = v9;
  v36 = v24;
  v38 = v39;
  v25 = v22;
  v37 = v25;
  objc_msgSend(v25, "performOnManagedObjectContext:", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10007B514;
  v30[3] = &unk_1002BBD40;
  v28 = v11;
  v32 = v28;
  v33 = v39;
  v29 = v25;
  v31 = v29;
  objc_msgSend(v29, "notifyOnQueue:block:", v27, v30);

  _Block_object_dispose(v39, 8);
}

- (void)getCompatibilityMatrix:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKMultiplayerMatchService *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    sub_1000898A4();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 466, "-[GKMultiplayerMatchService getCompatibilityMatrix:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007B728;
  v19[3] = &unk_1002BB8A0;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v22 = self;
  objc_msgSend(v13, "performOnManagedObjectContext:", v19);
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007BFDC;
    v16[3] = &unk_1002BB450;
    v18 = v8;
    v17 = v13;
    objc_msgSend(v17, "notifyOnQueue:block:", v15, v16);

  }
}

- (void)setShareInvitees:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  GKMultiplayerMatchService *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchOrCreateInviteSession"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));
  objc_msgSend(v6, "setShareInvitees:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareRecordID"));
  if (v8)
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "setObject:forKey:", &stru_1002CE2A8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14));
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveInvitedPlayers")));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007C270;
    v18[3] = &unk_1002BB4A0;
    v19 = v6;
    v20 = v15;
    v21 = self;
    v17 = v15;
    objc_msgSend(v16, "perform:", v18);

  }
}

- (void)hasExistingInviteSessionWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, BOOL);

  v6 = (void (**)(id, BOOL))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inviteSession"));

  if (v6)
    v6[2](v6, v5 != 0);

}

- (void)setShareRecordID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchOrCreateInviteSession"));

  objc_msgSend(v6, "setShareRecordID:", v4);
}

- (void)initiateInvitationForMatchRequest:(id)a3 recipients:(id)a4 devicePushTokenMap:(id)a5 isNearbyInvite:(BOOL)a6 availableForMessageV2:(BOOL)a7 transportContext:(id)a8 handler:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  GKMultiplayerMatchService *v38;
  id v39;
  id v40;
  BOOL v41;
  BOOL v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a9;
  v18 = v17;
  if (!os_log_GKGeneral)
    v19 = (id)GKOSLoggers(v17);
  v20 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v13;
    v45 = 2112;
    v46 = v16;
    v47 = 2112;
    v48 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Initiate invitation for match request: %@\ntransportContext: %@\nrecipients: %@", buf, 0x20u);
  }
  v21 = objc_alloc_init((Class)GKInviteInitiateResponse);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v24 = objc_msgSend(v23, "forceRelay");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10007C908;
  v33[3] = &unk_1002BFE00;
  v34 = v13;
  v35 = v14;
  v41 = a6;
  v36 = v21;
  v37 = v15;
  v38 = self;
  v39 = v16;
  v40 = v18;
  v42 = a7;
  v25 = v18;
  v26 = v16;
  v27 = v15;
  v28 = v21;
  v29 = v14;
  v30 = v13;
  objc_msgSend(v22, "getValidNATTypeWithForceRelay:withHandler:", v24, v33);

}

- (id)contactsIntegrationController
{
  return +[GKContactsIntegrationController sharedController](GKContactsIntegrationController, "sharedController");
}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v12, "validTransportSelected") & 1) != 0
    || (objc_msgSend(v12, "supportsTransportVersion:", &off_1002DB5B0) & 1) == 0)
  {
    -[GKMultiplayerMatchService loadCloudKitShareURLWithPlayer:matchRequest:transportContext:availableForMessageV2:handler:](self, "loadCloudKitShareURLWithPlayer:matchRequest:transportContext:availableForMessageV2:handler:", v10, v11, v12, 0, v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messagesBasedRecipients"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10007DC2C;
    v33[3] = &unk_1002BFE28;
    v35 = &v36;
    v16 = v14;
    v34 = v16;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v33);

    if (*((_BYTE *)v37 + 24) || (v17 = objc_msgSend(v16, "count")) == 0)
    {
      if (!os_log_GKGeneral)
        v18 = (id)GKOSLoggers(v17);
      v19 = os_log_GKMatch;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v37 + 24)));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count")));
        *(_DWORD *)buf = 138412546;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Skip overriding transport for msg invites. missing: %@, unprefixedHandles count: %@", buf, 0x16u);

      }
      -[GKMultiplayerMatchService loadCloudKitShareURLWithPlayer:matchRequest:transportContext:availableForMessageV2:handler:](self, "loadCloudKitShareURLWithPlayer:matchRequest:transportContext:availableForMessageV2:handler:", v10, v11, v12, 0, v13);
    }
    else
    {
      if (!os_log_GKGeneral)
        v22 = (id)GKOSLoggers(v17);
      v23 = os_log_GKMatch;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count")));
        *(_DWORD *)buf = 138412290;
        v41 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Checking %@ handles' availability for msg invites.", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService contactsIntegrationController](self, "contactsIntegrationController"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10007DCB8;
      v26[3] = &unk_1002BFE50;
      objc_copyWeak(&v32, (id *)buf);
      v27 = v10;
      v28 = v11;
      v29 = v12;
      v30 = v16;
      v31 = v13;
      objc_msgSend(v25, "fetchMessageTransportV2AvailabilityForUnprefixedHandles:completion:", v30, v26);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }

    _Block_object_dispose(&v36, 8);
  }

}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 availableForMessageV2:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("loadRecordURL")));
  v17 = (void *)v16;
  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v16);
  v19 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Loading a CloudKit share URL for matchRequest: %@, transportContext: %@", buf, 0x16u);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10007E0BC;
  v29[3] = &unk_1002BBC50;
  v29[4] = self;
  v30 = v13;
  v34 = a6;
  v31 = v14;
  v20 = v17;
  v32 = v20;
  v33 = v12;
  v21 = v12;
  v22 = v14;
  v23 = v13;
  objc_msgSend(v20, "perform:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10007EEA0;
  v26[3] = &unk_1002BB450;
  v27 = v20;
  v28 = v15;
  v24 = v20;
  v25 = v15;
  objc_msgSend(v24, "notifyOnQueue:block:", &_dispatch_main_q, v26);

}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 shouldRetry:(BOOL)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, void *);
  void *v25;
  GKMultiplayerMatchService *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(objc_alloc((Class)CKShare), "initWithRootRecord:shareID:", v10, v9);
  objc_msgSend(v12, "setPublicPermission:", 3);
  v13 = objc_alloc((Class)CKModifyRecordsOperation);
  v31[0] = v12;
  v31[1] = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
  v15 = objc_msgSend(v13, "initWithRecordsToSave:recordIDsToDelete:", v14, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession cloudKitOperationConfigurationForSocialGamingSessionsContainer](GKCloudGameSession, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v15, "setConfiguration:", v16);

  objc_msgSend(v15, "setSavePolicy:", 1);
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_10007F0F8;
  v25 = &unk_1002BFEC8;
  v26 = self;
  v27 = v9;
  v29 = v12;
  v30 = v11;
  v28 = v10;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = v9;
  objc_msgSend(v15, "setModifyRecordsCompletionBlock:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService privateDatabase](self, "privateDatabase", v22, v23, v24, v25, v26));
  objc_msgSend(v21, "addOperation:", v15);

}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 handler:(id)a5
{
  -[GKMultiplayerMatchService setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:](self, "setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:", a3, a4, 1, a5);
}

- (id)privateDatabase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateCloudDatabase"));

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
  -[GKMultiplayerMatchService saveRecord:shouldRetry:withHandler:](self, "saveRecord:shouldRetry:withHandler:", a3, 1, a4);
}

- (BOOL)zoneNotFoundFromOperation:(id)a3 operationError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "code") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "code") == (id)26)
          {
            if (!os_log_GKGeneral)
              v13 = (id)GKOSLoggers(26);
            v14 = os_log_GKMatch;
            LOBYTE(v10) = 1;
            if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v5;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Zone Not Found. Should retry %@ after creating zone.", buf, 0xCu);
            }
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (void)saveRecord:(id)a3 shouldRetry:(BOOL)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc((Class)CKModifyRecordsOperation);
  v19 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v11 = objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", v10, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession cloudKitOperationConfigurationForSocialGamingSessionsContainer](GKCloudGameSession, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v11, "setConfiguration:", v12);

  objc_msgSend(v11, "setSavePolicy:", 1);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007F6E0;
  v16[3] = &unk_1002BFEF0;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService privateDatabase](self, "privateDatabase"));
  objc_msgSend(v15, "addOperation:", v11);

}

- (void)invitePlayersForMatchRequest:(id)a3 devicePushTokenMap:(id)a4 isNearbyInvite:(BOOL)a5 transportContext:(id)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  GKMultiplayerMatchService *v62;
  id v63;
  id v64;
  BOOL v65;
  id v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  id v72;

  v11 = a3;
  v49 = a4;
  v12 = a6;
  v13 = a7;
  v50 = v13;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v13);
  v15 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v70 = v11;
    v71 = 2112;
    v72 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Invite players for matchRequest: %@, transportContext: %@", buf, 0x16u);
  }
  v45 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1077, "-[GKMultiplayerMatchService invitePlayersForMatchRequest:devicePushTokenMap:isNearbyInvite:transportContext:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recipients"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10007FC70;
  v67[3] = &unk_1002BC828;
  v20 = v18;
  v68 = v20;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v67);

  if (!objc_msgSend(v20, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recipientPlayerIDs"));
    objc_msgSend(v20, "addObjectsFromArray:", v21);

  }
  v22 = objc_msgSend(v20, "count");
  v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v22);
  v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v22);
  v26 = objc_opt_class(NSDictionary, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "archivedSharePlayInviteeTokensFromProgrammaticInvite"));
  v66 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v26, v27, &v66));
  v29 = v66;

  v51 = v29;
  if (v29)
  {
    v31 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v32 = (id)GKOSLoggers(v30);
      v31 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      sub_100089C60();
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "replyQueue"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10007FCCC;
  v55[3] = &unk_1002BFF68;
  v56 = v20;
  v57 = v49;
  v58 = v23;
  v59 = v28;
  v60 = v24;
  v35 = v17;
  v61 = v35;
  v62 = self;
  v65 = a5;
  v63 = v11;
  v64 = v45;
  v48 = v45;
  v46 = v11;
  v36 = v24;
  v37 = v28;
  v38 = v23;
  v39 = v49;
  v40 = v20;
  objc_msgSend(v35, "performOnQueue:block:", v34, v55);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "replyQueue"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100080CB4;
  v52[3] = &unk_1002BB450;
  v53 = v35;
  v54 = v50;
  v43 = v35;
  v44 = v50;
  objc_msgSend(v43, "notifyOnQueue:block:", v42, v52);

}

- (void)removePlayersFromGameInviteV2:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  GKMultiplayerMatchService *v25;
  NSObject *v26;
  uint8_t buf[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Remove players from game inviteV2: %@", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "inviteSession"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sessionToken"));
  v14 = dispatch_group_create();
  v15 = v14;
  if (v12 && v13)
  {
    dispatch_group_enter(v14);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100080F98;
    v21[3] = &unk_1002BBE20;
    v22 = v6;
    v23 = v12;
    v24 = v13;
    v25 = self;
    v26 = v15;
    objc_msgSend(v23, "performAsync:", v21);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000812EC;
  v19[3] = &unk_1002BB540;
  v20 = v8;
  v18 = v8;
  dispatch_group_notify(v15, v17, v19);

}

- (void)cancelGameInviteWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  GKMultiplayerMatchService *v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Cancel game invite", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inviteSession"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1335, "-[GKMultiplayerMatchService cancelGameInviteWithHandler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v10));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000814E0;
  v18[3] = &unk_1002BB590;
  v19 = v9;
  v20 = self;
  v12 = v9;
  objc_msgSend(v11, "perform:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100081644;
  v16[3] = &unk_1002BB758;
  v16[4] = self;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v11, "notifyOnQueue:block:", v14, v16);

}

- (id)ensureGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 numberOfAutomatched:(int64_t)a6 moc:(id)a7 list:(id)a8
{
  id v11;
  id v12;
  id v13;
  MultiplayerGroupList *v14;
  MultiplayerGroupList *v15;
  void *v16;
  void *v17;
  void *v18;
  MultiplayerGroup *v19;
  MultiplayerGroup *v20;
  void *v21;
  NSMutableSet *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  MultiplayerGroupParticipant *v29;
  void *v30;
  MultiplayerGroupParticipant *v31;
  void *v32;
  void *v33;
  void *v34;
  MultiplayerGroup *v36;
  void *v37;
  MultiplayerGroupList *v38;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = (MultiplayerGroupList *)a8;
  if (!v14)
  {
    v15 = [MultiplayerGroupList alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroupList entity](MultiplayerGroupList, "entity"));
    v14 = -[MultiplayerGroupList initWithEntity:insertIntoManagedObjectContext:](v15, "initWithEntity:insertIntoManagedObjectContext:", v16, v13);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroup _gkFetchRequest](MultiplayerGroup, "_gkFetchRequest"));
  v41 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("id == %@"), v11));
  objc_msgSend(v17, "setPredicate:", v18);

  v37 = v17;
  v19 = (MultiplayerGroup *)objc_claimAutoreleasedReturnValue(+[NSManagedObject _gkRetrieveCleanEntry:request:](NSManagedObject, "_gkRetrieveCleanEntry:request:", v13, v17));
  if (!v19)
  {
    v20 = [MultiplayerGroup alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroup entity](MultiplayerGroup, "entity"));
    v19 = -[MultiplayerGroup initWithEntity:insertIntoManagedObjectContext:](v20, "initWithEntity:insertIntoManagedObjectContext:", v21, v13);

    -[MultiplayerGroupList addEntriesObject:](v14, "addEntriesObject:", v19);
  }
  v36 = v19;
  v38 = v14;
  v22 = objc_opt_new(NSMutableSet);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v43;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v27);
        v29 = [MultiplayerGroupParticipant alloc];
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroupParticipant entity](MultiplayerGroupParticipant, "entity"));
        v31 = -[MultiplayerGroupParticipant initWithEntity:insertIntoManagedObjectContext:](v29, "initWithEntity:insertIntoManagedObjectContext:", v30, v13);

        -[MultiplayerGroupParticipant setPlayerID:](v31, "setPlayerID:", v28);
        -[NSMutableSet addObject:](v22, "addObject:", v31);

        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v25);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MultiplayerGroup entries](v36, "entries"));
  -[MultiplayerGroup removeEntries:](v36, "removeEntries:", v32);

  -[MultiplayerGroup addEntries:](v36, "addEntries:", v22);
  -[MultiplayerGroup setId:](v36, "setId:", v41);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
  -[MultiplayerGroup setNumberOfAutomatched:](v36, "setNumberOfAutomatched:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  -[MultiplayerGroup setPlayedAt:](v36, "setPlayedAt:", v34);

  return v36;
}

- (void)convertToInternalObjects:(id)a3 results:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v24 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "entries"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_opt_new(GKMultiplayerGroupInternal);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "numberOfAutomatched"));
        objc_msgSend(v10, "setNumberOfAutomached:", objc_msgSend(v11, "longValue"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
        objc_msgSend(v10, "setGroupID:", v12);

        v13 = objc_opt_new(NSMutableArray);
        objc_msgSend(v10, "setParticipants:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playedAt"));
        objc_msgSend(v10, "setPlayedAt:", objc_msgSend(v14, "longValue"));

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entries"));
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "participants"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "playerID"));
              objc_msgSend(v21, "addObject:", v22);

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v17);
        }

        objc_msgSend(v24, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

}

- (void)getMultiPlayerGroups:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  _QWORD v10[5];
  NSMutableArray *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  v6 = objc_opt_new(NSMutableArray);
  objc_msgSend(v5, "setResult:", v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081D3C;
  v10[3] = &unk_1002BD8F0;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v8, "performOnManagedObjectContext:", v10);

}

- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  GKMultiplayerMatchService *v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1480, "-[GKMultiplayerMatchService putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100082820;
  v24[3] = &unk_1002BFFF8;
  v25 = v15;
  v26 = self;
  v30 = a5;
  v31 = a7;
  v27 = v14;
  v28 = v16;
  v29 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v14;
  v23 = v15;
  objc_msgSend(v19, "performOnManagedObjectContext:", v24);

}

- (void)acceptGameInvite:(id)a3 transportContext:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
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
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v8;
    v37 = 2112;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Accept game invite: %@, transportContext: %@", buf, 0x16u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1511, "-[GKMultiplayerMatchService acceptGameInvite:transportContext:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = objc_alloc_init((Class)GKInviteAcceptResponse);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100082DB8;
  v30[3] = &unk_1002BC010;
  v30[4] = self;
  v31 = v8;
  v32 = v9;
  v19 = v15;
  v33 = v19;
  v34 = v16;
  v20 = v16;
  v21 = v9;
  v22 = v8;
  objc_msgSend(v19, "performOnQueue:block:", v18, v30);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100083618;
  v27[3] = &unk_1002BB450;
  v28 = v19;
  v29 = v11;
  v25 = v19;
  v26 = v11;
  objc_msgSend(v25, "notifyOnQueue:block:", v24, v27);

}

- (void)declineGameInvite:(id)a3 reason:(int64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  id v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[6];
  _QWORD v30[6];

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));

  v25 = (void *)v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, CFSTR("s"), 0));
  v26 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushToken"));
  v29[0] = CFSTR("session-token");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionToken"));
  v30[0] = v15;
  v29[1] = CFSTR("peer-id");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerID"));
  v30[1] = v16;
  v29[2] = CFSTR("peer-push-token");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerPushToken"));

  v30[2] = v17;
  v29[3] = CFSTR("self-push-token");
  v18 = v14;
  if (!v14)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v30[3] = v18;
  v29[4] = CFSTR("reason");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v29[5] = CFSTR("client-data");
  v30[4] = v19;
  v30[5] = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 6));

  if (!v14)
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100083974;
  v27[3] = &unk_1002BBA68;
  v28 = v7;
  v23 = v7;
  objc_msgSend(v21, "issueRequest:bagKey:clientProxy:handler:", v20, CFSTR("gk-invitation-reject"), v22, v27);

}

- (void)getAcceptedGameInviteWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1610, "-[GKMultiplayerMatchService getAcceptedGameInviteWithHandler:]"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100083A54;
  v7[3] = &unk_1002BB758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v5, v7);

}

- (void)hasCanceledMultiplayerInitiateBulletinForSessionToken:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService: hasCanceledMultiplayerInitiateBulletinForSessionToken", v13, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "acceptedInviteManager"));
  v12 = objc_msgSend(v11, "removeAndReturnQueuedCancelledInviteWithSessionToken:", v5);
  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v12);

}

- (void)getPlayersToInviteWithHandlerV2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1676, "-[GKMultiplayerMatchService getPlayersToInviteWithHandlerV2:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100084154;
  v14[3] = &unk_1002BB658;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v14);

  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000842A0;
    v11[3] = &unk_1002BB450;
    v13 = v4;
    v12 = v8;
    objc_msgSend(v12, "notifyOnQueue:block:", v10, v11);

  }
}

- (void)getInviteSessionTokenWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100079000;
  v13[4] = sub_100079010;
  v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inviteSession"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008440C;
  v9[3] = &unk_1002C00D8;
  v12 = v13;
  v7 = v6;
  v10 = v7;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "performAsync:", v9);

  _Block_object_dispose(v13, 8);
}

- (void)removeInviteSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v2, "deleteInviteSession");

}

- (void)removeInviteSessionIfNeeded
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchOrCreateInviteSession"));
  v5 = objc_msgSend(v4, "shouldBeCleared");

  if (v5)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v6);
    v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inviteSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "inviteSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sessionToken"));
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "ClientProxy should clear inviteSession: %@, token: %@", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    objc_msgSend(v15, "deleteInviteSession");

  }
}

- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  GKMultiplayerMatchService *v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100084780;
  v27[3] = &unk_1002C0100;
  v28 = v14;
  v29 = v16;
  v30 = self;
  v31 = v17;
  v32 = v15;
  v33 = v18;
  v34 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v15;
  v24 = v17;
  v25 = v16;
  v26 = v14;
  objc_msgSend(v20, "getValidNATTypeWithForceRelay:withHandler:", 0, v27);

}

- (void)sendInvitationUpdate:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
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
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[128];
  _BYTE v77[128];

  v5 = a3;
  v46 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerTokenMap"));
  v50 = v5;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v65;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v65 != v49)
          objc_enumerationMutation(obj);
        v52 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v7);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerTokenMap"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v61 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
              v74[0] = CFSTR("id");
              v74[1] = CFSTR("push-token");
              v75[0] = v8;
              v75[1] = v15;
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v75, v74, 2));
              objc_msgSend(v6, "addObject:", v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
          }
          while (v12);
        }

        v7 = v52 + 1;
        v5 = v50;
      }
      while ((id)(v52 + 1) != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v51);
  }

  v72[0] = CFSTR("bundle-id");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
  v73[0] = v18;
  v72[1] = GKSuggestedTransportVersionPushShortKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportVersionToUse"));
  v73[1] = v19;
  v72[2] = GKInviteSessionIDKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionID"));
  v73[2] = v20;
  v21 = v5;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 3));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v22));

  v70[0] = CFSTR("session-token");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sessionToken"));
  v71[0] = v23;
  v70[1] = CFSTR("self-push-token");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pushToken"));
  v26 = v25;
  if (!v25)
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v71[1] = v26;
  v70[2] = CFSTR("reason");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
  v70[3] = CFSTR("peers");
  v71[2] = v27;
  v71[3] = v6;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 4));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v28));

  if (!v25)
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "matchID"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "matchID"));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v31, GKMatchmakerMatchID);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "playerTokenMap"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "playerTokenMap"));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v33, GKTransportPlayerTokenMapKey);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "gameParticipants"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100085444;
  v58[3] = &unk_1002C0128;
  v36 = v34;
  v59 = v36;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v58);

  if (objc_msgSend(v36, "count"))
    objc_msgSend(v53, "setObject:forKey:", v36, GKInviteGameParticipantsKey);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "lobbyParticipants"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100085488;
  v56[3] = &unk_1002C0128;
  v39 = v37;
  v57 = v39;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v56);

  if (objc_msgSend(v39, "count"))
    objc_msgSend(v53, "setObject:forKey:", v39, GKInviteLobbyParticipantsKey);
  v40 = objc_msgSend(v29, "setObject:forKeyedSubscript:", v53, CFSTR("client-data"));
  if (!os_log_GKGeneral)
    v41 = (id)GKOSLoggers(v40);
  v42 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v29;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Sending invitation update with request: %@", buf, 0xCu);
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000854CC;
  v54[3] = &unk_1002BBA68;
  v55 = v46;
  v45 = v46;
  objc_msgSend(v43, "issueRequest:bagKey:clientProxy:handler:", v29, CFSTR("gk-invitation-send"), v44, v54);

}

- (void)requestTTRLogsWith:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  GKMultiplayerMatchService *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  _QWORD *v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[2];
  _QWORD v63[2];
  const __CFString *v64;
  void *v65;
  _QWORD v66[5];
  _QWORD v67[5];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;

  v6 = a3;
  v7 = a4;
  v51 = v7;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    *(_DWORD *)buf = 138412546;
    v70 = v6;
    v71 = 2112;
    v72 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Request TTRLogsWith: %@, for client proxy: %@", buf, 0x16u);

  }
  v50 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playersAndPushTokens"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "serverRepresentation"));
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v16);
  }
  v53 = v6;

  v66[0] = CFSTR("session-token");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v67[0] = v20;
  v66[1] = CFSTR("self-push-token");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushToken"));
  v23 = v22;
  if (!v22)
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v67[1] = v23;
  v66[2] = CFSTR("reason");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 100));
  v67[2] = v24;
  v67[3] = v13;
  v66[3] = CFSTR("peers");
  v66[4] = GKTTRBulletinKeyRadarID;
  v49 = GKTTRBulletinKeyRadarID;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "radarID"));
  v67[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 5));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v26));

  if (!v22)
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100085BF0;
  v56[3] = &unk_1002BC0D0;
  v27 = v51;
  v57 = v27;
  v28 = objc_retainBlock(v56);
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "radarID"));
  v30 = v53;
  if (v29
    && (v31 = (void *)v29,
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "requesterAlias")),
        v32,
        v31,
        v32))
  {
    v62[0] = v49;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "radarID"));
    v63[0] = v33;
    v62[1] = GKTTRBulletinKeyRequesterPlayerAlias;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "requesterAlias"));
    v63[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2));

    v36 = objc_msgSend(v52, "setObject:forKeyedSubscript:", v35, CFSTR("client-data"));
    if (!os_log_GKGeneral)
      v37 = (id)GKOSLoggers(v36);
    v38 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v50, "clientProxy"));
      *(_DWORD *)buf = 138412546;
      v70 = v52;
      v71 = 2112;
      v72 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Sending TTRLogs with request: %@, self.clientProxy: %@", buf, 0x16u);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v50, "clientProxy"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100085C78;
    v54[3] = &unk_1002BBA68;
    v55 = v28;
    v43 = v52;
    objc_msgSend(v41, "issueRequest:bagKey:clientProxy:handler:", v52, CFSTR("gk-invitation-send"), v42, v54);

  }
  else
  {
    v44 = GKInternalErrorDomain;
    v64 = CFSTR("reason");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "radarID"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "requesterAlias"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid GKTTRLogRequestInfo(radarID: %@, requesterAlias: %@)"), v45, v46));
    v65 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v44, 900, v48));

    v30 = v53;
    ((void (*)(_QWORD *, void *))v28[2])(v28, v35);
    v43 = v52;
  }

}

- (void)_performRelayAction:(id)a3 request:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  GKMultiplayerMatchService *v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1891, "-[GKMultiplayerMatchService _performRelayAction:request:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100085F28;
  v23[3] = &unk_1002BC3A8;
  v24 = v9;
  v25 = v8;
  v26 = self;
  v13 = v12;
  v27 = v13;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v13, "perform:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100086060;
  v20[3] = &unk_1002BB450;
  v21 = v13;
  v22 = v10;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v18, "notifyOnQueue:block:", v17, v20);

}

- (void)initiateRelayRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKMultiplayerMatchService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000861A4;
  v11[3] = &unk_1002C0150;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getValidNATTypeWithForceRelay:withHandler:", 0, v11);

}

- (void)updateRelayRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKMultiplayerMatchService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100086400;
  v11[3] = &unk_1002C0150;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getValidNATTypeWithForceRelay:withHandler:", 0, v11);

}

- (void)cancelRelayRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "relayCancel serverRequest:%@", (uint8_t *)&v12, 0xCu);
  }
  -[GKMultiplayerMatchService _performRelayAction:request:handler:](self, "_performRelayAction:request:handler:", CFSTR("gk-invitation-relay-cancel"), v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "reportEvent:type:", GKReporterDomainRelay, GKReporterRelayCancel);

}

- (void)updateCacheWithNearbyProfileDictionary:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 1956, "-[GKMultiplayerMatchService updateCacheWithNearbyProfileDictionary:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("profile")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("playerID")));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000868A0;
    v18[3] = &unk_1002BC380;
    v19 = v11;
    v20 = v9;
    v21 = v10;
    objc_msgSend(v12, "performBlockAndWait:", v18);

  }
  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100086C6C;
    v15[3] = &unk_1002BB450;
    v17 = v6;
    v16 = v9;
    objc_msgSend(v16, "notifyOnQueue:block:", v14, v15);

  }
}

- (void)startNearbyBrowsingWithPlayerID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerDiscovery"));
    *(_DWORD *)buf = 138412290;
    v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startBrowsing", buf, 0xCu);

  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100086F04;
  v26[3] = &unk_1002BB540;
  v14 = v8;
  v27 = v14;
  v15 = objc_retainBlock(v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v17 = objc_msgSend(v16, "disableViceroyNearby");

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nearbyDiscovery"));
    objc_msgSend(v19, "startBrowsingWithPlayerID:", v6);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v21 = objc_msgSend(v20, "fastSyncTransportEnabled");

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerDiscovery"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100086F78;
    v24[3] = &unk_1002BB540;
    v25 = v15;
    objc_msgSend(v23, "startBrowsingWithCompletionHandler:", v24);

  }
  else
  {
    ((void (*)(_QWORD *))v15[2])(v15);
  }

}

- (void)stopNearbyBrowsingWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDiscovery"));
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopBrowsing", buf, 0xCu);

  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000871BC;
  v23[3] = &unk_1002BB540;
  v11 = v5;
  v24 = v11;
  v12 = objc_retainBlock(v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v14 = objc_msgSend(v13, "disableViceroyNearby");

  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nearbyDiscovery"));
    objc_msgSend(v16, "stopBrowsing");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v18 = objc_msgSend(v17, "fastSyncTransportEnabled");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDiscovery"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100087230;
    v21[3] = &unk_1002BB540;
    v22 = v12;
    objc_msgSend(v20, "stopBrowsingWithCompletionHandler:", v21);

  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }

}

- (void)startNearbyAdvertisingWithDiscoveryInfo:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerDiscovery"));
    *(_DWORD *)buf = 138412290;
    v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startListening", buf, 0xCu);

  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000874C4;
  v28[3] = &unk_1002BC0D0;
  v14 = v8;
  v29 = v14;
  v15 = objc_retainBlock(v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v17 = objc_msgSend(v16, "disableViceroyNearby");

  if ((v17 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nearbyDiscovery"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startAdvertisingWithDiscoveryInfo:", v6));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v22 = objc_msgSend(v21, "fastSyncTransportEnabled");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "peerDiscovery"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100087548;
    v25[3] = &unk_1002BB450;
    v27 = v15;
    v26 = v18;
    objc_msgSend(v24, "startListening:completionHandler:", v6, v25);

  }
  else
  {
    ((void (*)(_QWORD *, void *))v15[2])(v15, v18);
  }

}

- (void)stopNearbyAdvertisingWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDiscovery"));
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopListening", buf, 0xCu);

  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100087790;
  v23[3] = &unk_1002BB540;
  v11 = v5;
  v24 = v11;
  v12 = objc_retainBlock(v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v14 = objc_msgSend(v13, "disableViceroyNearby");

  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nearbyDiscovery"));
    objc_msgSend(v16, "stopAdvertising");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v18 = objc_msgSend(v17, "fastSyncTransportEnabled");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDiscovery"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100087804;
    v21[3] = &unk_1002BB540;
    v22 = v12;
    objc_msgSend(v20, "stopListeningWithCompletionHandler:", v21);

  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }

}

- (void)presentNearbyInvite:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  objc_msgSend(v4, "presentNearbyInvite:", v3);

}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  objc_msgSend(v4, "nearbyInviteWasCancelled:", v3);

}

- (void)fetchDevicePushToken:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  v4 = (void (**)(_QWORD, _QWORD))v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService fetchDevicePushToken", v9, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pushToken"));

  ((void (**)(_QWORD, void *))v4)[2](v4, v8);
}

- (void)fetchOnDeviceMultiplayerBundleIDsForNewBundleID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchOnDeviceMultiplayerBundleIDsForNewBundleID: %@", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v10, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100087AE4;
  v13[3] = &unk_1002BCA80;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "getOnDeviceMultiplayerGamesForBundleIDs:handler:", v5, v13);

}

- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  GKMultiplayerMatchService *v18;
  int v19;
  GKMultiplayerMatchService *v20;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetchOnDeviceMultiplayerBundleIDsWithHandler", (uint8_t *)&v19, 2u);
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ Scanning installed apps", (uint8_t *)&v19, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "availableGameIdentifiers"));
  v13 = objc_msgSend(v12, "count");
  v14 = v13;
  if (!os_log_GKGeneral)
    v15 = (id)GKOSLoggers(v13);
  v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (GKMultiplayerMatchService *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
    v19 = 138412290;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "found %@ installed Game Center games.", (uint8_t *)&v19, 0xCu);

  }
  -[GKMultiplayerMatchService fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:](self, "fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:", v12, v5);

}

- (void)isGameCenterMultiplayerGameForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "isGameCenterMultiplayerGameForBundleID, bundleID: %@", buf, 0xCu);
  }
  v17 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100087F5C;
  v14[3] = &unk_1002BCA30;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  -[GKMultiplayerMatchService fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:](self, "fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:", v11, v14);

}

- (void)fetchTransportOverrideWithHandler:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a3;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetchTransportOverrideWithHandler", v11, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "forceEnabledTransportVersions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "forceDisabledTransportVersions"));
  ((void (**)(_QWORD, void *, void *))v4)[2](v4, v8, v10);

}

- (void)setupNearbyDiscovery
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v4 = objc_msgSend(v3, "disableViceroyNearby");

  if (v4)
  {
    if (!os_log_GKGeneral)
      v6 = (id)GKOSLoggers(v5);
    v7 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Viceroy nearby is disabled. Stop setting up nearby discovery.", buf, 2u);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10008829C;
    v22[3] = &unk_1002C01A0;
    v10 = v9;
    v23 = v10;
    v11 = objc_retainBlock(v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100088560;
    v20[3] = &unk_1002C01F0;
    v12 = v10;
    v21 = v12;
    v13 = objc_retainBlock(v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100088744;
    v18[3] = &unk_1002C0218;
    v19 = v12;
    v14 = v12;
    v15 = objc_retainBlock(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nearbyDiscovery"));
    objc_msgSend(v17, "setupWithPlayerFoundHandler:playerLostHandler:receiveDataHandler:", v11, v13, v15);

  }
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4 handler:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyDiscovery"));
  objc_msgSend(v12, "forgetParticipant:deviceID:", v10, v9);

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
      sub_100089FB8();
  }

}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 usePeerDiscovery:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  void *v27;
  _QWORD v28[4];
  void *v29;
  uint8_t buf[4];
  const __CFString *v31;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v15);
  v18 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v19 = CFSTR("bonjour in Viceoroy");
    if (v8)
      v19 = CFSTR("bonjour in gamed");
    *(_DWORD *)buf = 138412290;
    v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Sending data to nearby participant with %@", buf, 0xCu);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = v20;
  if (v8)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "peerDiscovery"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100088C44;
    v28[3] = &unk_1002BC0D0;
    v23 = &v29;
    v29 = v16;
    v24 = v16;
    objc_msgSend(v22, "sendDataToParticipant:deviceID:data:completionHandler:", v12, v13, v14, v28);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nearbyDiscovery"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100088C5C;
    v26[3] = &unk_1002BC0D0;
    v23 = &v27;
    v27 = v16;
    v25 = v16;
    objc_msgSend(v22, "sendDataToParticipant:deviceID:data:handler:", v12, v13, v14, v26);
  }

}

- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService pseudonymManager](self, "pseudonymManager"));
  objc_msgSend(v8, "revokePseudonym:completionHandler:", v7, v6);

}

- (void)validateRequests:(id)a3 andFileMultiplayerTTRIfNeededWithContext:(id)a4
{
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", GKSupportedTransportVersionsKey));
  v7 = objc_msgSend(v6, "containsObject:", &off_1002DB5F8);

  if (v7)
    -[GKMultiplayerMatchService fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:](self, "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:", &stru_1002CE2A8, v8, &stru_1002C0238);

}

- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _UNKNOWN **v23;
  uint8_t buf[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v12 = objc_msgSend(v11, "isInternalBuild");

  if (v12)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    v15 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKMultiplayerService fileMultiplayerTTR with callbackIdentifier: %@", buf, 0xCu);
    }
    v22 = GKTTRBulletinKeyType;
    v23 = &off_1002DB610;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService ttrHelper](self, "ttrHelper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getURLForNewMultiplayerRadarWithCallbackIdentifier:descriptionAddition:", v8, v9));

    if (v19)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, GKTTRBulletinKeyURL);
    if (v9)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, GKTTRBulletinKeySubtitle);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKTTRInitiationBulletin packFakeTTRBulletinWithInfo:](GKTTRInitiationBulletin, "packFakeTTRBulletinWithInfo:", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
    objc_msgSend(v21, "processIncomingTTR:", v20);

    v10[2](v10);
  }

}

- (void)uploadLogsForRadar:(id)a3 from:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[8];
  _QWORD v23[3];
  _QWORD v24[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v12 = objc_msgSend(v11, "isInternalBuild");

  if (v12)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    v15 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKMultiplayerServicePrivate uploadLogsForRadar:", v22, 2u);
    }
    v23[0] = GKTTRBulletinKeyType;
    v23[1] = GKTTRBulletinKeyRadarID;
    v24[0] = &off_1002DB610;
    v24[1] = v8;
    v23[2] = GKTTRBulletinKeyRequesterPlayerAlias;
    v24[2] = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService ttrHelper](self, "ttrHelper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getURLForExistingMultiplayerRadarWithRadarID:", v8));

    if (v19)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, GKTTRBulletinKeyURL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKTTRUploadRequestBulletin packFakeTTRBulletinWithInfo:](GKTTRUploadRequestBulletin, "packFakeTTRBulletinWithInfo:", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
    objc_msgSend(v21, "processIncomingTTR:", v20);

    v10[2](v10);
  }

}

- (void)setPseudonymManager:(id)a3
{
  objc_storeStrong((id *)&self->_pseudonymManager, a3);
}

- (void)setTtrHelper:(id)a3
{
  objc_storeStrong((id *)&self->_ttrHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrHelper, 0);
  objc_storeStrong((id *)&self->_pseudonymManager, 0);
}

@end
