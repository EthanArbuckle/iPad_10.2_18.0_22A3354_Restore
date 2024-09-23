@implementation GKConnectionManager

- (void)clientEnteredForegroundState:(id)a3
{
  id v4;
  NSObject *idsDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  idsDelegateQueue = self->_idsDelegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006758;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(idsDelegateQueue, v7);

}

+ (id)sharedManager
{
  if (qword_100318018 != -1)
    dispatch_once(&qword_100318018, &stru_1002C3670);
  return (id)qword_100318020;
}

- (GKConnectionManager)init
{
  GKConnectionManager *v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKConnectionManager;
  v2 = -[GKConnectionManager init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.gamed.ids.delegateQueue", 0);
    -[GKConnectionManager setIdsDelegateQueue:](v2, "setIdsDelegateQueue:", v3);

    v4 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.gamecenter"));
    -[GKConnectionManager setIdsService:](v2, "setIdsService:", v4);

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_idsDelegateQueue);
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKConnectionManager setConnectionsBySessionID:](v2, "setConnectionsBySessionID:", v5);

    v6 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKConnectionManager setConnectionErrorBySessionID:](v2, "setConnectionErrorBySessionID:", v6);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)GKConnectionManager;
  -[GKConnectionManager dealloc](&v3, "dealloc");
}

- (id)primaryEmailAddress
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108C4C;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  if (qword_100318028 != -1)
    dispatch_once(&qword_100318028, block);
  return off_100314300;
}

- (void)isBusyChangingConnectionStateForSession:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *idsDelegateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  idsDelegateQueue = self->_idsDelegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108E3C;
  block[3] = &unk_1002BB568;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(idsDelegateQueue, block);

}

- (void)gameSession:(id)a3 forClient:(id)a4 lostConnectionFromCKID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameSessionServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, a4, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  objc_msgSend(v10, "saveConnectionStateForLostPlayerWithCloudID:sessionIdentifier:handler:", v7, v9, &stru_1002C3690);
}

- (void)connectToGameSession:(id)a3 forClient:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GKIDSConnection *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_idsService, "accounts"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "record"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "share"));

    if (v12)
      goto LABEL_8;
    v13 = 4;
  }
  else
  {
    v13 = 2;
  }
  v14 = objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", v13, 0));
  if (v14)
  {
    v15 = (void *)v14;
    if (v9)
      v9[2](v9, v14);
    goto LABEL_11;
  }
LABEL_8:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionsBySessionID, "objectForKeyedSubscript:", v16));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
    v19 = -[GKIDSConnection initWithClient:gameSession:account:]([GKIDSConnection alloc], "initWithClient:gameSession:account:", v8, v21, v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionsBySessionID, "setObject:forKeyedSubscript:", v19, v16);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionsBySessionID, "objectForKeyedSubscript:", v16));
  objc_msgSend(v20, "connectToGameSessionUsingDelegateQueue:handler:", self->_idsDelegateQueue, v9);

  v15 = 0;
LABEL_11:

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint8_t v30[16];
  id v31;
  uint64_t v32;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v31 = 0;
  v32 = 200;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 1, &v32, &v31));
  v14 = v31;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("GKIDSInviteSessionID")));
  v16 = objc_msgSend(v10, "state");
  if ((_DWORD)v16 == 2)
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v16);
    v18 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Declining IDSSesion because state == IDSSessionStateEnded", v30, 2u);
    }
    objc_msgSend(v10, "declineInvitationWithData:", v12);
  }
  else if (v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionsBySessionID, "objectForKeyedSubscript:", v15));

    if (v19)
    {
      v20 = (void *)IDSCopyRawAddressForDestination(v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("GKIDSInviteTransportType")));
      v22 = objc_msgSend(v21, "integerValue");

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionsBySessionID, "objectForKeyedSubscript:", v15));
      v24 = v23;
      if (v22 == (id)1)
      {
        v25 = objc_msgSend(v23, "shouldAllowAddingAnotherConnection");

        if (v25)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionsBySessionID, "objectForKeyedSubscript:", v15));
          objc_msgSend(v27, "acceptReliableInviteForIDSSession:fromID:context:", v10, v20, v12);

        }
        else
        {
          if (!os_log_GKGeneral)
            v28 = (id)GKOSLoggers(v26);
          v29 = os_log_GKTrace;
          if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Declining IDSSession because too many connections in match", v30, 2u);
          }
          objc_msgSend(v10, "declineInvitationWithData:", v12);
        }
      }
      else
      {
        objc_msgSend(v23, "acceptUnreliableInviteForIDSSession:fromID:withData:", v10, v20, v12);

      }
    }
  }

}

- (void)cloudGameSessionUpdated:(id)a3
{
  id v4;
  NSObject *idsDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  idsDelegateQueue = self->_idsDelegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001093C8;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(idsDelegateQueue, v7);

}

- (id)idsDestinationsFromCKIDs:(id)a3 containerName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v5, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "containsString:", CFSTR("@")))
        {
          v14 = IDSCopyIDForEmailAddress(v13);
        }
        else
        {
          if (objc_msgSend(v13, "hasPrefix:", CFSTR("_")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v13, v6, (_QWORD)v18));
            v16 = (void *)IDSCopyIDForAnonymousCloudIdentifier();

            goto LABEL_12;
          }
          v14 = IDSCopyIDForPhoneNumber(v13);
        }
        v16 = (void *)v14;
LABEL_12:
        objc_msgSend(v7, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)disconnectConnectionsForClient:(id)a3 reason:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *idsDelegateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  idsDelegateQueue = self->_idsDelegateQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010968C;
  v13[3] = &unk_1002BE650;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(idsDelegateQueue, v13);

}

- (void)connection:(id)a3 didDisconnectForGameSessionWithID:(id)a4 client:(id)a5 playerID:(id)a6 reason:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  OS_dispatch_queue *idsDelegateQueue;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  uint8_t buf[4];
  int64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v15);
  v18 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKConnectionManager:: didDisconnectForGameSessionWithID for reason %ld", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("didDisconnectForGameSession")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("playerID"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("sessionID"));
  if ((a7 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100109C08;
    v24[3] = &unk_1002BCDE0;
    v25 = v14;
    v26 = v13;
    v28 = a7;
    v27 = v19;
    objc_msgSend(v27, "perform:", v24);

  }
  idsDelegateQueue = self->_idsDelegateQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100109EDC;
  v22[3] = &unk_1002BB658;
  v22[4] = self;
  v23 = v19;
  v21 = v19;
  objc_msgSend(v21, "notifyOnQueue:block:", idsDelegateQueue, v22);

}

- (void)sendData:(id)a3 reliably:(BOOL)a4 forGameSessionWithIdentifier:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *idsDelegateQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  idsDelegateQueue = self->_idsDelegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A004;
  block[3] = &unk_1002BC058;
  block[4] = self;
  v18 = v11;
  v21 = a4;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(idsDelegateQueue, block);

}

- (int64_t)deviceTypeForNotification
{
  return 3;
}

- (void)sendNotificationMessageOfType:(signed __int16)a3 forSession:(id)a4 localizedFormatKey:(id)a5 arguments:(id)a6 userMessage:(id)a7 data:(id)a8 recipientIDs:(id)a9 handler:(id)a10
{
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  OS_dispatch_queue *idsDelegateQueue;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  GKConnectionManager *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int16 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  __int16 v55;

  v14 = a3;
  v15 = a4;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("sendNotificationMessageOfType")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "record"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "share"));

  if (v14 == 120 || v21)
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10010A388;
    v52[3] = &unk_1002C3708;
    v55 = v14;
    v23 = v19;
    v53 = v23;
    v24 = v15;
    v54 = v24;
    objc_msgSend(v23, "perform:", v52);
    if (v14 == 120)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10010A590;
      v49[3] = &unk_1002BB590;
      v50 = v24;
      v51 = v23;
      objc_msgSend(v51, "perform:", v49);

    }
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 4, 0));
    objc_msgSend(v19, "setError:", v22);

  }
  idsDelegateQueue = self->_idsDelegateQueue;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10010A6C4;
  v38[3] = &unk_1002C3758;
  v48 = v14;
  v39 = v19;
  v40 = v15;
  v41 = self;
  v42 = v37;
  v43 = v36;
  v44 = v16;
  v45 = v35;
  v46 = v17;
  v47 = v18;
  v26 = v18;
  v27 = v17;
  v28 = v35;
  v29 = v16;
  v30 = v36;
  v31 = v37;
  v32 = v15;
  v33 = v19;
  objc_msgSend(v33, "notifyOnQueue:block:", idsDelegateQueue, v38);

}

- (void)sendNotificationMessage:(id)a3 toIDSIDs:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  IDSService *idsService;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v25 = CFSTR("message");
  v26 = v8;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v22 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v11, 200, 0, &v22));
  v13 = v22;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKConnectionManager idsDestinationsFromCKIDs:containerName:](self, "idsDestinationsFromCKIDs:containerName:", v10, CFSTR("com.apple.socialgaming.sessions")));

  if (v13)
    goto LABEL_13;
  v23 = IDSSendMessageOptionFireAndForgetKey;
  v24 = &__kCFBooleanTrue;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  idsService = self->_idsService;
  v20 = 0;
  v21 = 0;
  -[IDSService sendData:toDestinations:priority:options:identifier:error:](idsService, "sendData:toDestinations:priority:options:identifier:error:", v12, v14, 300, v16, &v21, &v20);
  v18 = v21;
  v13 = v20;

  if (v13)
  {
LABEL_13:
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(v15);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_10010EB78();
      if (!v9)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  if (v9)
LABEL_7:
    v9[2](v9, v13);
LABEL_8:

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a6;
  v16 = 0;
  v17 = 200;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a5, 1, &v17, &v16));
  v10 = v16;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("message")));
  v12 = (void *)v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  if (!v13)
  {
    v14 = (void *)IDSCopyRawAddressForDestination(v8);
    objc_msgSend(v12, "setValue:forKey:", v14, GKIDSLookupPushSenderCloudID);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
    objc_msgSend(v15, "didReceiveIncomingIDSMessage:", v12);

  }
}

- (void)clientEnteredBackgroundState:(id)a3
{
  id v4;
  NSObject *idsDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  idsDelegateQueue = self->_idsDelegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010AF34;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(idsDelegateQueue, v7);

}

- (NSMutableDictionary)connectionErrorBySessionID
{
  return self->_connectionErrorBySessionID;
}

- (void)setConnectionErrorBySessionID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionErrorBySessionID, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (NSMutableDictionary)connectionsBySessionID
{
  return self->_connectionsBySessionID;
}

- (void)setConnectionsBySessionID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionsBySessionID, a3);
}

- (OS_dispatch_queue)idsDelegateQueue
{
  return self->_idsDelegateQueue;
}

- (void)setIdsDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsDelegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDelegateQueue, 0);
  objc_storeStrong((id *)&self->_connectionsBySessionID, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_connectionErrorBySessionID, 0);
}

@end
