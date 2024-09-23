@implementation GKIDSConnection

- (GKIDSConnection)initWithClient:(id)a3 gameSession:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKIDSConnection *v11;
  GKIDSConnection *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GKIDSConnection;
  v11 = -[GKIDSConnection init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    -[GKIDSConnection setClientForSession:](v11, "setClientForSession:", v8);
    -[GKIDSConnection setCloudSession:](v12, "setCloudSession:", v9);
    -[GKIDSConnection setLocalIDSAccount:](v12, "setLocalIDSAccount:", v10);
    v13 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setPendingSessions:](v12, "setPendingSessions:", v13);

    v14 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setReliableSessions:](v12, "setReliableSessions:", v14);

    v15 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setUnreliableSessions:](v12, "setUnreliableSessions:", v15);

    v16 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setStreamConnections:](v12, "setStreamConnections:", v16);

    v17 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setDatagramConnections:](v12, "setDatagramConnections:", v17);

    v18 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKIDSConnection setHeartbeatTimeForCloudIDs:](v12, "setHeartbeatTimeForCloudIDs:", v18);

    -[GKIDSConnection setConnectionState:](v12, "setConnectionState:", 0);
  }

  return v12;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableDictionary *pendingSessions;
  NSMutableDictionary *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableDictionary *reliableSessions;
  NSMutableDictionary *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMutableDictionary *unreliableSessions;
  NSMutableDictionary *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *backgroundTimer;
  NSObject *connectTimeoutTimer;
  NSObject *heartbeatTimer;
  void (**connectionCompleteHandler)(id, _QWORD);
  void (**disconnectCompleteHandler)(id, _QWORD);
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v3 = self->_streamConnections;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v59;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v59 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v7)));
        objc_msgSend(v8, "cancelConnection");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_streamConnections, "removeAllObjects");
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = self->_datagramConnections;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v13)));
        objc_msgSend(v14, "cancelConnection");

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeAllObjects](self->_datagramConnections, "removeAllObjects");
  pendingSessions = self->_pendingSessions;
  if (pendingSessions)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v16 = pendingSessions;
    v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v20)));
          objc_msgSend(v21, "endSession");

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v18);
    }

    -[NSMutableDictionary removeAllObjects](self->_pendingSessions, "removeAllObjects");
  }
  reliableSessions = self->_reliableSessions;
  if (reliableSessions)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = reliableSessions;
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v47;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v27)));
          objc_msgSend(v28, "endSession");

          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
      }
      while (v25);
    }

    -[NSMutableDictionary removeAllObjects](self->_reliableSessions, "removeAllObjects");
  }
  unreliableSessions = self->_unreliableSessions;
  if (unreliableSessions)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v30 = unreliableSessions;
    v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v43;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unreliableSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v34)));
          objc_msgSend(v35, "endSession");

          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
      }
      while (v32);
    }

    -[NSMutableDictionary removeAllObjects](self->_unreliableSessions, "removeAllObjects");
  }
  backgroundTimer = self->_backgroundTimer;
  if (backgroundTimer)
    dispatch_source_cancel(backgroundTimer);
  connectTimeoutTimer = self->_connectTimeoutTimer;
  if (connectTimeoutTimer)
    dispatch_source_cancel(connectTimeoutTimer);
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
    dispatch_source_cancel(heartbeatTimer);
  connectionCompleteHandler = (void (**)(id, _QWORD))self->_connectionCompleteHandler;
  if (connectionCompleteHandler)
    connectionCompleteHandler[2](connectionCompleteHandler, 0);
  disconnectCompleteHandler = (void (**)(id, _QWORD))self->_disconnectCompleteHandler;
  if (disconnectCompleteHandler)
    disconnectCompleteHandler[2](disconnectCompleteHandler, 0);
  v41.receiver = self;
  v41.super_class = (Class)GKIDSConnection;
  -[GKIDSConnection dealloc](&v41, "dealloc");
}

- (BOOL)isBusyChangingConnectionState
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection connectionCompleteHandler](self, "connectionCompleteHandler"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection disconnectCompleteHandler](self, "disconnectCompleteHandler"));
    v4 = v5 != 0;

  }
  return v4;
}

- (void)connectToGameSessionUsingDelegateQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKIDSConnection: connectToGameSessionUsingDelegateQueue:handler:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("connectToGameSession")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self->_cloudSession, "emailsByCKID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection primaryPlayerCKID](self, "primaryPlayerCKID"));

  if (!v13)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010B884;
    v21[3] = &unk_1002BB4A0;
    v21[4] = self;
    v22 = v12;
    v23 = v11;
    objc_msgSend(v23, "perform:", v21);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010BA7C;
  v17[3] = &unk_1002BB518;
  v17[4] = self;
  v18 = v12;
  v19 = v11;
  v20 = v8;
  v14 = v8;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v15, "notifyOnQueue:block:", v6, v17);

}

- (void)connectToPlayersWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  dispatch_time_t v27;
  id v28;
  NSObject *v29;
  NSObject *queue;
  void *v31;
  _QWORD handler[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[8];
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKIDSConnection: connectToPlayersWithIdentifiers:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  queue = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDelegateQueue"));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingSessions, "objectForKeyedSubscript:", v14, queue));
        if (v15)
          goto LABEL_11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", v14));

        if (!v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
          v41 = v14;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDestinationsFromCKIDs:containerName:", v18, CFSTR("com.apple.socialgaming.sessions")));

          v19 = objc_msgSend(objc_alloc((Class)IDSSession), "initWithAccount:destinations:transportType:", self->_localIDSAccount, v15, 1);
          objc_msgSend(v19, "setDelegate:queue:", self, queue);
          v39[0] = CFSTR("GKIDSInviteSessionID");
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession identifier](self->_cloudSession, "identifier"));
          v39[1] = CFSTR("GKIDSInviteTransportType");
          v40[0] = v20;
          v40[1] = &off_1002DB880;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));

          v33 = 0;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v31, 200, 0, &v33));
          v22 = v12;
          v23 = v9;
          v24 = v33;
          objc_msgSend(v19, "sendInvitationWithData:declineOnError:", v21, 1);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingSessions, "setObject:forKeyedSubscript:", v19, v14);

          v9 = v23;
          v12 = v22;

LABEL_11:
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      v11 = v25;
    }
    while (v25);
  }

  if (-[NSMutableDictionary count](self->_pendingSessions, "count"))
  {
    if (!self->_connectTimeoutTimer)
    {
      v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, queue);
      v27 = dispatch_walltime(0, 60000000000);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10010C10C;
      handler[3] = &unk_1002BBBD8;
      handler[4] = self;
      dispatch_source_set_event_handler(v26, handler);
      dispatch_resume(v26);
      -[GKIDSConnection setConnectTimeoutTimer:](self, "setConnectTimeoutTimer:", v26);

    }
  }
  else if (self->_connectionCompleteHandler)
  {
    if (!os_log_GKGeneral)
      v28 = (id)GKOSLoggers(0);
    v29 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "GKIDSConnection::connectToPlayersWithIdentifiers - Already connected to player identifiers in parameter.", buf, 2u);
    }
    (*((void (**)(void))self->_connectionCompleteHandler + 2))();
    -[GKIDSConnection setConnectionCompleteHandler:](self, "setConnectionCompleteHandler:", 0);
  }

}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v8 = a5;
  v9 = a3;
  v10 = IDSCopyRawAddressForDestination(a4);
  v11 = (void *)v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v14 = objc_retainAutorelease(v11);
    v15 = v13;
    v16 = 136315138;
    v17 = objc_msgSend(v14, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "IDSSession Invite accepted for session from %s", (uint8_t *)&v16, 0xCu);

  }
  -[GKIDSConnection invitationAcceptedForIDSSession:fromID:withData:](self, "invitationAcceptedForIDSSession:fromID:withData:", v9, v11, v8);

}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = IDSCopyRawAddressForDestination(a4);
  v8 = (void *)v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    v13 = 136315138;
    v14 = objc_msgSend(v11, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received IDSSession invitation decline from %s", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v6, "endSession");

}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = IDSCopyRawAddressForDestination(a4);
  v8 = (void *)v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    v13 = 136315138;
    v14 = objc_msgSend(v11, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received IDSSession invitation cancel from %s", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v6, "endSession");

}

- (void)invitationAcceptedForIDSSession:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10
    && (v17 = 0,
        v18 = 200,
        (v10 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v10, 1, &v18, &v17))) != 0))
  {
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("GKIDSInviteTransportType")));
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 == (id)1)
      -[GKIDSConnection sendUnreliableIDSSessionInviteToIdentifier:](self, "sendUnreliableIDSSessionInviteToIdentifier:", v9);
  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v10);
    v16 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10010EBD8(v16);
    objc_msgSend(v8, "endSession");
    v12 = 0;
  }

}

- (BOOL)shouldAllowAddingAnotherConnection
{
  GKIDSConnection *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession connectedPlayerIDs](self->_cloudSession, "connectedPlayerIDs"));
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 < (id)-[GKCloudGameSession maxConnectedPlayers](v2->_cloudSession, "maxConnectedPlayers");

  return (char)v2;
}

- (void)sessionStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_connectionState == 2)
  {
    objc_msgSend(v4, "endSession");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_pendingSessions, "allKeysForObject:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reliableSessions, "setObject:forKeyedSubscript:", v10, v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingSessions, "setObject:forKeyedSubscript:", 0, v6);
      -[GKIDSConnection setupStreamForIDSSession:fromID:](self, "setupStreamForIDSSession:fromID:", v10, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_heartbeatTimeForCloudIDs, "setObject:forKeyedSubscript:", v7, v6);

      -[GKIDSConnection startHeartbeatToMonitorConnections](self, "startHeartbeatToMonitorConnections");
      -[GKIDSConnection handleIDSSessionStatusChange](self, "handleIDSSessionStatusChange");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_unreliableSessions, "allKeysForObject:", v10));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    if (v9)
      -[GKIDSConnection setupDatagramForIDSSession:fromID:](self, "setupDatagramForIDSSession:fromID:", v10, v9);

  }
}

- (void)acceptReliableInviteForIDSSession:(id)a3 fromID:(id)a4 context:(id)a5
{
  NSMutableDictionary *pendingSessions;
  id v9;
  id v10;
  void *v11;
  id v12;

  pendingSessions = self->_pendingSessions;
  v9 = a5;
  v10 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingSessions, "setObject:forKeyedSubscript:", v10, a4);
  objc_msgSend(v10, "acceptInvitationWithData:", v9);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDelegateQueue"));
  objc_msgSend(v10, "setDelegate:queue:", self, v11);

}

- (void)sendUnreliableIDSSessionInviteToIdentifier:(id)a3
{
  GKCloudGameSession *cloudSession;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v18[0] = CFSTR("GKIDSInviteSessionID");
  cloudSession = self->_cloudSession;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession identifier](cloudSession, "identifier"));
  v18[1] = CFSTR("GKIDSInviteTransportType");
  v19[0] = v6;
  v19[1] = &off_1002DB898;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v17 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDestinationsFromCKIDs:containerName:", v9, CFSTR("com.apple.socialgaming.sessions")));

  v11 = objc_msgSend(objc_alloc((Class)IDSSession), "initWithAccount:destinations:transportType:", self->_localIDSAccount, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDelegateQueue"));
  objc_msgSend(v11, "setDelegate:queue:", self, v13);

  v16 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v7, 200, 0, &v16));
  v15 = v16;
  objc_msgSend(v11, "sendInvitationWithData:declineOnError:", v14, 1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unreliableSessions, "setObject:forKeyedSubscript:", v11, v5);

}

- (void)acceptUnreliableInviteForIDSSession:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDelegateQueue"));
  objc_msgSend(v12, "setDelegate:queue:", self, v11);

  objc_msgSend(v12, "acceptInvitationWithData:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unreliableSessions, "setObject:forKeyedSubscript:", v12, v9);

}

- (void)setupStreamForIDSSession:(id)a3 fromID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  GKNWStreamConnectionWrapper *v15;
  void *v16;
  void *v17;
  GKNWStreamConnectionWrapper *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsService"));
  v10 = objc_msgSend(v7, "socket");

  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "streamConnectionForSocketDescriptor:error:", v10, &v19));
  v12 = v19;

  if (v12)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10010EC18();
  }
  else
  {
    v15 = [GKNWStreamConnectionWrapper alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDelegateQueue"));
    v18 = -[GKNWStreamConnectionWrapper initWithStreamConnection:connectionID:delegate:delegateQueue:](v15, "initWithStreamConnection:connectionID:delegate:delegateQueue:", v11, v6, self, v17);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamConnections, "setObject:forKeyedSubscript:", v18, v6);
  }

}

- (void)setupDatagramForIDSSession:(id)a3 fromID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  GKNWDatagramConnectionWrapper *v15;
  void *v16;
  void *v17;
  GKNWDatagramConnectionWrapper *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsService"));
  v10 = objc_msgSend(v7, "socket");

  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "datagramConnectionForSocketDescriptor:error:", v10, &v19));
  v12 = v19;

  if (v12)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10010EC78();
  }
  else
  {
    v15 = [GKNWDatagramConnectionWrapper alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDelegateQueue"));
    v18 = -[GKNWDatagramConnectionWrapper initWithDatagramConnection:connectionID:delegate:delegateQueue:](v15, "initWithDatagramConnection:connectionID:delegate:delegateQueue:", v11, v6, self, v17);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datagramConnections, "setObject:forKeyedSubscript:", v18, v6);
  }

}

- (void)connectionWrapper:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary **p_streamConnections;
  void *v12;
  void *v13;
  NSMutableDictionary **p_datagramConnections;
  NSMutableDictionary *datagramConnections;
  void *v16;
  int v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "NWConnection did fail with error %@", (uint8_t *)&v17, 0xCu);
  }
  p_streamConnections = &self->_streamConnections;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_streamConnections, "allKeysForObject:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  if (v13)
    goto LABEL_8;
  datagramConnections = self->_datagramConnections;
  p_datagramConnections = &self->_datagramConnections;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](datagramConnections, "allKeysForObject:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

  if (v13)
  {
    p_streamConnections = p_datagramConnections;
LABEL_8:
    -[NSMutableDictionary setObject:forKeyedSubscript:](*p_streamConnections, "setObject:forKeyedSubscript:", 0, v13);

  }
  objc_msgSend(v6, "cancelConnection");

}

- (id)internalPacketWithMessage:(int64_t)a3 error:(id *)a4
{
  __CFString *primaryPlayerCKID;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  primaryPlayerCKID = &stru_1002CE2A8;
  if (self->_primaryPlayerCKID)
    primaryPlayerCKID = (__CFString *)self->_primaryPlayerCKID;
  v12[0] = CFSTR("senderCKID");
  v12[1] = CFSTR("type");
  v13[0] = primaryPlayerCKID;
  v13[1] = &off_1002DB898;
  v12[2] = CFSTR("message");
  v7 = primaryPlayerCKID;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v13[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v9, 200, 0, a4));
  return v10;
}

- (id)clientPacketWithData:(id)a3 isReliable:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  __CFString *primaryPlayerCKID;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[4];

  v6 = a4;
  primaryPlayerCKID = &stru_1002CE2A8;
  if (self->_primaryPlayerCKID)
    primaryPlayerCKID = (__CFString *)self->_primaryPlayerCKID;
  v15[0] = CFSTR("senderCKID");
  v15[1] = CFSTR("type");
  v16[0] = primaryPlayerCKID;
  v16[1] = &off_1002DB880;
  v15[2] = CFSTR("transport");
  v9 = primaryPlayerCKID;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v15[3] = CFSTR("data");
  v16[2] = v11;
  v16[3] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v12, 200, 0, a5));
  return v13;
}

- (void)sendData:(id)a3 reliably:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, void *);
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a4;
  v8 = (void (**)(id, void *))a5;
  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection clientPacketWithData:isReliable:error:](self, "clientPacketWithData:isReliable:error:", a3, v5, &v15));
  v10 = v15;
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      if (!os_log_GKGeneral)
        v12 = (id)GKOSLoggers(v10);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_10010ED38();
      v8[2](v8, v11);
    }
    else
    {
      if (!os_log_GKGeneral)
        v14 = (id)GKOSLoggers(v10);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_10010ECD8();
    }
  }
  else
  {
    v13 = 136;
    if (v5)
      v13 = 128;
    -[GKIDSConnection _sendData:usingConnections:handler:](self, "_sendData:usingConnections:handler:", v9, *(Class *)((char *)&self->super.isa + v13), v8);
  }

}

- (void)_sendData:(id)a3 usingConnections:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
  v20 = (void (**)(_QWORD, _QWORD))v9;
  if (objc_msgSend(v10, "count"))
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 9, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v18));
        if ((objc_msgSend(v19, "sendData:", v7) & 1) == 0)
          objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  if (!v11)
  {
    if (!objc_msgSend(v12, "count"))
    {
      v11 = 0;
      if (!v20)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 10, 0));
  }
  if (v20)
LABEL_17:
    ((void (**)(_QWORD, void *))v20)[2](v20, v11);
LABEL_18:

}

- (void)connectionWrapper:(id)a3 didReceiveData:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;

  v15 = 0;
  v16 = 200;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a4, 0, &v16, &v15));
  v6 = v15;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type")));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("senderCKID")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByEmail](self->_cloudSession, "playersByEmail"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
      WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession createGKGameSession](self->_cloudSession, "createGKGameSession"));
      objc_msgSend(WeakRetained, "session:didReceiveData:fromPlayer:", v14, v10, v12);

    }
    else
    {
      -[GKIDSConnection processInternalMessage:](self, "processInternalMessage:", v5);
    }
  }

}

- (void)processInternalMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message")));
  v6 = objc_msgSend(v5, "integerValue");

  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKIDSConnection received internal messgae %ld", (uint8_t *)&v14, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderCKID")));

  if (v6 == (id)1)
  {
    -[GKIDSConnection receivedHeartbeatFromID:](self, "receivedHeartbeatFromID:", v10);
  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v11);
    v13 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "IDSConnection received unknown internal message %ld", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)startHeartbeatToMonitorConnections
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection heartbeatTimer](self, "heartbeatTimer"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDelegateQueue"));
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

    v7 = dispatch_walltime(0, 2000000000);
    dispatch_source_set_timer(v6, v7, 0x77359400uLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10010D8A8;
    handler[3] = &unk_1002BBBD8;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    -[GKIDSConnection setHeartbeatTimer:](self, "setHeartbeatTimer:", v6);

  }
}

- (BOOL)shouldSaveConnectionStateForLostConnectionWithCKID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession connectedPlayerIDs](self->_cloudSession, "connectedPlayerIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  objc_msgSend(v6, "sortUsingComparator:", &stru_1002C37E0);
  if (v4)
  {
    v7 = objc_msgSend(v6, "containsObject:", v4);
    objc_msgSend(v6, "removeObject:", v4);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self->_cloudSession, "emailsByCKID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeysForObject:", self->_primaryPlayerCKID));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    LOBYTE(v7) = objc_msgSend(v10, "isEqualToString:", v11);

  }
  return v7;
}

- (void)sendHeartbeatToConnections
{
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  GKCloudGameSession *cloudSession;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  NSMutableDictionary *obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];

  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_heartbeatTimeForCloudIDs;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v35;
    *(_QWORD *)&v4 = 136315138;
    v31 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_heartbeatTimeForCloudIDs, "objectForKeyedSubscript:", v8, v31));
        objc_msgSend(v9, "timeIntervalSinceNow");
        if (v10 < -10.0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", v8));

          if (v11)
          {
            if (!os_log_GKGeneral)
              v13 = (id)GKOSLoggers(v12);
            v14 = (void *)os_log_GKTrace;
            if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
            {
              v15 = objc_retainAutorelease(v8);
              v16 = v14;
              v17 = objc_msgSend(v15, "UTF8String");
              *(_DWORD *)buf = v31;
              v39 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Have not received heartbeat, IDSSession lost connection with %s", buf, 0xCu);

            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self->_cloudSession, "emailsByCKID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeysForObject:", v8));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

            v21 = -[GKIDSConnection shouldSaveConnectionStateForLostConnectionWithCKID:](self, "shouldSaveConnectionStateForLostConnectionWithCKID:", v20);
            if (v21)
            {
              if (!os_log_GKGeneral)
                v22 = (id)GKOSLoggers(v21);
              v23 = os_log_GKTrace;
              if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Saving connection state to disconnected for lost connection", buf, 2u);
              }
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
              cloudSession = self->_cloudSession;
              WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
              objc_msgSend(v24, "gameSession:forClient:lostConnectionFromCKID:", cloudSession, WeakRetained, v20);

            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", v8));
            objc_msgSend(v27, "endSession");
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", v8));
            objc_msgSend(v28, "endSession");

          }
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v5);
  }

  v33 = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection internalPacketWithMessage:error:](self, "internalPacketWithMessage:error:", 1, &v33));
  v30 = v33;
  -[GKIDSConnection _sendData:usingConnections:handler:](self, "_sendData:usingConnections:handler:", v29, self->_streamConnections, 0);

}

- (void)receivedHeartbeatFromID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_heartbeatTimeForCloudIDs, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)cancelHeartbeatTimer
{
  NSObject *heartbeatTimer;

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    dispatch_source_cancel(heartbeatTimer);
    -[GKIDSConnection setHeartbeatTimer:](self, "setHeartbeatTimer:", 0);
  }
}

- (void)cancelConnectTimeoutTimer
{
  NSObject *connectTimeoutTimer;

  connectTimeoutTimer = self->_connectTimeoutTimer;
  if (connectTimeoutTimer)
  {
    dispatch_source_cancel(connectTimeoutTimer);
    -[GKIDSConnection setConnectTimeoutTimer:](self, "setConnectTimeoutTimer:", 0);
  }
}

- (void)handleDisconnectForClient:(id)a3 reason:(int64_t)a4 handler:(id)a5
{
  void (**v8)(id, _QWORD);
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v8 = (void (**)(id, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifier"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bundleIdentifier"));
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection disconnectCompleteHandler](self, "disconnectCompleteHandler"));

    if (!v12)
    {
      self->_connectionState = 2;
      self->_reasonForDisconnect = a4;
      -[GKIDSConnection setDisconnectCompleteHandler:](self, "setDisconnectCompleteHandler:", v8);
      -[GKIDSConnection cancelConnectTimeoutTimer](self, "cancelConnectTimeoutTimer");
      -[GKIDSConnection cancelBackgroundTimer](self, "cancelBackgroundTimer");
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v13 = self->_pendingSessions;
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v40;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v40 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v17)));
            objc_msgSend(v18, "endSession");

            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v15);
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = self->_reliableSessions;
      v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reliableSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23)));
            objc_msgSend(v24, "endSession");

            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v21);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = self->_unreliableSessions;
      v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v32;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unreliableSessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v29), (_QWORD)v31));
            objc_msgSend(v30, "endSession");

            v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v27);
      }

      -[GKIDSConnection handleIDSSessionStatusChangeWhileDisconnecting](self, "handleIDSSessionStatusChangeWhileDisconnecting");
      goto LABEL_28;
    }
  }
  else
  {

  }
  if (v8)
    v8[2](v8, 0);
LABEL_28:

}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_pendingSessions, "allKeysForObject:", v8));
  if (objc_msgSend(v10, "count"))
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_pendingSessions, "removeObjectsForKeys:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_unreliableSessions, "allKeysForObject:", v8));

  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramConnections, "objectForKeyedSubscript:", v13));
    objc_msgSend(v14, "cancelConnection");

    -[NSMutableDictionary removeObjectsForKeys:](self->_datagramConnections, "removeObjectsForKeys:", v12);
    -[NSMutableDictionary removeObjectsForKeys:](self->_unreliableSessions, "removeObjectsForKeys:", v12);
    v11 = (void *)v13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_reliableSessions, "allKeysForObject:", v8));

  if (objc_msgSend(v15, "count"))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamConnections, "objectForKeyedSubscript:", v16));
    objc_msgSend(v17, "cancelConnection");

    -[NSMutableDictionary removeObjectsForKeys:](self->_streamConnections, "removeObjectsForKeys:", v15);
    -[NSMutableDictionary removeObjectsForKeys:](self->_reliableSessions, "removeObjectsForKeys:", v15);
    v11 = (void *)v16;
  }
  v18 = objc_retainAutorelease(v11);
  NSLog(CFSTR("sessionEnded: GKIDSConnection IDS session ended with %s for reason %d with error %@"), objc_msgSend(v18, "UTF8String"), v6, v9);
  if (!os_log_GKGeneral)
    v20 = (id)GKOSLoggers(v19);
  v21 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v22 = objc_retainAutorelease(v18);
    v23 = v21;
    *(_DWORD *)buf = 136315650;
    v25 = objc_msgSend(v22, "UTF8String");
    v26 = 1024;
    v27 = v6;
    v28 = 2048;
    v29 = objc_msgSend(v9, "code");
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "GKIDSConnection IDS session ended with %s for reason %d with error %ld", buf, 0x1Cu);

  }
  if (self->_connectionState == 2)
    -[GKIDSConnection handleIDSSessionStatusChangeWhileDisconnecting](self, "handleIDSSessionStatusChangeWhileDisconnecting");
  else
    -[GKIDSConnection handleIDSSessionStatusChange](self, "handleIDSSessionStatusChange");

}

- (void)handleIDSSessionStatusChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  if (!-[NSMutableDictionary count](self->_pendingSessions, "count"))
  {
    -[GKIDSConnection cancelConnectTimeoutTimer](self, "cancelConnectTimeoutTimer");
    if (-[NSMutableDictionary count](self->_reliableSessions, "count"))
    {
      self->_connectionState = 1;
    }
    else
    {
      self->_connectionState = 0;
      -[GKIDSConnection cancelHeartbeatTimer](self, "cancelHeartbeatTimer");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection connectionCompleteHandler](self, "connectionCompleteHandler"));

    if (v3)
    {
      if (-[NSMutableDictionary count](self->_reliableSessions, "count"))
        v8 = 0;
      else
        v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 6, 0));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectionErrorBySessionID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession identifier](self->_cloudSession, "identifier"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);

      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GKIDSConnection connectionCompleteHandler](self, "connectionCompleteHandler"));
      ((void (**)(_QWORD, id))v7)[2](v7, v8);

      -[GKIDSConnection setConnectionCompleteHandler:](self, "setConnectionCompleteHandler:", 0);
    }
  }
}

- (void)handleIDSSessionStatusChangeWhileDisconnecting
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;

  if (!-[NSMutableDictionary count](self->_pendingSessions, "count")
    && !-[NSMutableDictionary count](self->_reliableSessions, "count")
    && !-[NSMutableDictionary count](self->_unreliableSessions, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection connectionCompleteHandler](self, "connectionCompleteHandler"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 5, 0));
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GKIDSConnection connectionCompleteHandler](self, "connectionCompleteHandler"));
      ((void (**)(_QWORD, void *))v5)[2](v5, v4);

      -[GKIDSConnection setConnectionCompleteHandler:](self, "setConnectionCompleteHandler:", 0);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnection disconnectCompleteHandler](self, "disconnectCompleteHandler"));

    if (v6)
    {
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GKIDSConnection disconnectCompleteHandler](self, "disconnectCompleteHandler"));
      v7[2](v7, 0);

      -[GKIDSConnection setDisconnectCompleteHandler:](self, "setDisconnectCompleteHandler:", 0);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByEmail](self->_cloudSession, "playersByEmail"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", self->_primaryPlayerCKID));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession identifier](self->_cloudSession, "identifier"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    objc_msgSend(v9, "connection:didDisconnectForGameSessionWithID:client:playerID:reason:", self, v10, WeakRetained, v12, self->_reasonForDisconnect);

  }
}

- (void)clientEnteredBackgroundState:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_source *backgroundTimer;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD handler[5];

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifier"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bundleIdentifier"));
  if (objc_msgSend(v11, "isEqualToString:", v5))
  {
    backgroundTimer = self->_backgroundTimer;

    if (!backgroundTimer)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDelegateQueue"));
      v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

      v10 = dispatch_walltime(0, 10000000000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10010E7D4;
      handler[3] = &unk_1002BBBD8;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(v9);
      -[GKIDSConnection setBackgroundTimer:](self, "setBackgroundTimer:", v9);

    }
  }
  else
  {

  }
}

- (void)clientEnteredForegroundState:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifier"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientForSession);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bundleIdentifier"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    -[GKIDSConnection cancelBackgroundTimer](self, "cancelBackgroundTimer");
}

- (void)cancelBackgroundTimer
{
  NSObject *backgroundTimer;

  backgroundTimer = self->_backgroundTimer;
  if (backgroundTimer)
  {
    dispatch_source_cancel(backgroundTimer);
    -[GKIDSConnection setBackgroundTimer:](self, "setBackgroundTimer:", 0);
  }
}

- (GKClientProxy)clientForSession
{
  return (GKClientProxy *)objc_loadWeakRetained((id *)&self->_clientForSession);
}

- (void)setClientForSession:(id)a3
{
  objc_storeWeak((id *)&self->_clientForSession, a3);
}

- (IDSAccount)localIDSAccount
{
  return self->_localIDSAccount;
}

- (void)setLocalIDSAccount:(id)a3
{
  objc_storeStrong((id *)&self->_localIDSAccount, a3);
}

- (NSString)primaryPlayerCKID
{
  return self->_primaryPlayerCKID;
}

- (void)setPrimaryPlayerCKID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GKCloudGameSession)cloudSession
{
  return self->_cloudSession;
}

- (void)setCloudSession:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSession, a3);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)reasonForDisconnect
{
  return self->_reasonForDisconnect;
}

- (void)setReasonForDisconnect:(int64_t)a3
{
  self->_reasonForDisconnect = a3;
}

- (id)connectionCompleteHandler
{
  return self->_connectionCompleteHandler;
}

- (void)setConnectionCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)disconnectCompleteHandler
{
  return self->_disconnectCompleteHandler;
}

- (void)setDisconnectCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_source)connectTimeoutTimer
{
  return self->_connectTimeoutTimer;
}

- (void)setConnectTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectTimeoutTimer, a3);
}

- (OS_dispatch_source)backgroundTimer
{
  return self->_backgroundTimer;
}

- (void)setBackgroundTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTimer, a3);
}

- (OS_dispatch_source)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (NSMutableDictionary)heartbeatTimeForCloudIDs
{
  return self->_heartbeatTimeForCloudIDs;
}

- (void)setHeartbeatTimeForCloudIDs:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimeForCloudIDs, a3);
}

- (NSMutableDictionary)pendingSessions
{
  return self->_pendingSessions;
}

- (void)setPendingSessions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSessions, a3);
}

- (NSMutableDictionary)reliableSessions
{
  return self->_reliableSessions;
}

- (void)setReliableSessions:(id)a3
{
  objc_storeStrong((id *)&self->_reliableSessions, a3);
}

- (NSMutableDictionary)unreliableSessions
{
  return self->_unreliableSessions;
}

- (void)setUnreliableSessions:(id)a3
{
  objc_storeStrong((id *)&self->_unreliableSessions, a3);
}

- (NSMutableDictionary)streamConnections
{
  return self->_streamConnections;
}

- (void)setStreamConnections:(id)a3
{
  objc_storeStrong((id *)&self->_streamConnections, a3);
}

- (NSMutableDictionary)datagramConnections
{
  return self->_datagramConnections;
}

- (void)setDatagramConnections:(id)a3
{
  objc_storeStrong((id *)&self->_datagramConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datagramConnections, 0);
  objc_storeStrong((id *)&self->_streamConnections, 0);
  objc_storeStrong((id *)&self->_unreliableSessions, 0);
  objc_storeStrong((id *)&self->_reliableSessions, 0);
  objc_storeStrong((id *)&self->_pendingSessions, 0);
  objc_storeStrong((id *)&self->_heartbeatTimeForCloudIDs, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_backgroundTimer, 0);
  objc_storeStrong((id *)&self->_connectTimeoutTimer, 0);
  objc_storeStrong(&self->_disconnectCompleteHandler, 0);
  objc_storeStrong(&self->_connectionCompleteHandler, 0);
  objc_storeStrong((id *)&self->_cloudSession, 0);
  objc_storeStrong((id *)&self->_primaryPlayerCKID, 0);
  objc_storeStrong((id *)&self->_localIDSAccount, 0);
  objc_destroyWeak((id *)&self->_clientForSession);
}

@end
