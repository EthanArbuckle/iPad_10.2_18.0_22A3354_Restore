@implementation STUInvitationSessionManager

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CATTaskServer invalidate](self->mInvitationServer, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STUInvitationSessionManager;
  -[STUInvitationSessionManager dealloc](&v4, "dealloc");
}

- (STUInvitationSessionManager)initWithConfigurationManager:(id)a3 daemon:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUInvitationSessionManager *v12;
  STUInvitationSessionManager *v13;
  CATTaskServer *v14;
  CATTaskServer *mInvitationServer;
  CATOperationQueue *v16;
  CATOperationQueue *mOperationQueue;
  uint64_t v18;
  NSMapTable *mEndpointsByTransport;
  NSMutableDictionary *v20;
  NSMutableDictionary *mConnectedTransportsByEndpoint;
  NSMutableDictionary *v22;
  NSMutableDictionary *mInvitationOperationsByCourseIdentifier;
  uint64_t v24;
  NSSet *acceptedInvitationIdentifiers;
  STUInvitationIdentityTable *v26;
  STUInvitationIdentityTable *identityTable;
  NSMutableDictionary *v28;
  NSMutableDictionary *transactionsBySessionUUID;
  void *v30;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)STUInvitationSessionManager;
  v12 = -[STUInvitationSessionManager init](&v32, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configurationManager, a3);
    objc_storeWeak((id *)&v13->_daemon, v10);
    objc_storeWeak((id *)&v13->_device, v11);
    v14 = objc_opt_new(CATTaskServer);
    mInvitationServer = v13->mInvitationServer;
    v13->mInvitationServer = v14;

    -[CATTaskServer setDelegate:](v13->mInvitationServer, "setDelegate:", v13);
    v16 = objc_opt_new(CATOperationQueue);
    mOperationQueue = v13->mOperationQueue;
    v13->mOperationQueue = v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    mEndpointsByTransport = v13->mEndpointsByTransport;
    v13->mEndpointsByTransport = (NSMapTable *)v18;

    v20 = objc_opt_new(NSMutableDictionary);
    mConnectedTransportsByEndpoint = v13->mConnectedTransportsByEndpoint;
    v13->mConnectedTransportsByEndpoint = v20;

    v22 = objc_opt_new(NSMutableDictionary);
    mInvitationOperationsByCourseIdentifier = v13->mInvitationOperationsByCourseIdentifier;
    v13->mInvitationOperationsByCourseIdentifier = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    acceptedInvitationIdentifiers = v13->_acceptedInvitationIdentifiers;
    v13->_acceptedInvitationIdentifiers = (NSSet *)v24;

    v26 = -[STUInvitationIdentityTable initWithConfigurationManager:]([STUInvitationIdentityTable alloc], "initWithConfigurationManager:", v13->_configurationManager);
    identityTable = v13->_identityTable;
    v13->_identityTable = v26;

    v28 = objc_opt_new(NSMutableDictionary);
    transactionsBySessionUUID = v13->_transactionsBySessionUUID;
    v13->_transactionsBySessionUUID = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v13, "invitationDidFail:", CRKCourseInvitationDidFailNotificationName, 0);

  }
  return v13;
}

- (void)setAdHocBaseUserIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_adHocBaseUserIdentifier, a3);
  if (v5)
  {
    v7 = CRKTaskServerBaseStudentIdentifierUserInfoKey;
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    -[CATTaskServer setUserInfo:](self->mInvitationServer, "setUserInfo:", v6);

  }
  else
  {
    -[CATTaskServer setUserInfo:](self->mInvitationServer, "setUserInfo:", 0);
  }

}

- (NSArray)courseInvitations
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  int isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  NSMutableArray *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v19 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mInvitationOperationsByCourseIdentifier, "allValues"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v8 = objc_msgSend(v7, "isExecuting");
        v9 = objc_opt_class(STUInviteToCourseOperation);
        if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
          v11 = objc_msgSend(v10, "supportsConnectedInstructor") ^ 1;

        }
        else
        {
          v11 = 1;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
        v13 = objc_opt_class(CRKInviteToCourseRequest);
        isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((v8 & isKindOfClass) == 1 && (v11 & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "invitation"));
          -[NSMutableArray addObject:](v19, "addObject:", v16);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  v17 = -[NSMutableArray copy](v19, "copy");
  return (NSArray *)v17;
}

- (void)setSessionBrowser:(id)a3
{
  CRKClassSessionBrowser *v5;
  CRKClassSessionBrowser *sessionBrowser;
  void *v7;
  NSString *v8;
  void *v9;
  CRKClassSessionBrowser *v10;

  v5 = (CRKClassSessionBrowser *)a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUInvitationSessionManager.m"), 97, CFSTR("%@ must be called from the main thread"), v9);

  }
  sessionBrowser = self->_sessionBrowser;
  self->_sessionBrowser = v5;
  v10 = v5;

  -[CRKClassSessionBrowser setInvitationSessionDelegate:](v10, "setInvitationSessionDelegate:", self);
}

- (BOOL)acceptCourseInvitationWithIdentifier:(id)a3 pin:(id)a4 studentInformation:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationOperationsByCourseIdentifier, "objectForKeyedSubscript:", v10));
  v14 = v13;
  if (!v13
    || (objc_msgSend(v13, "isCanceled") & 1) != 0
    || (objc_msgSend(v14, "isFinished") & 1) != 0)
  {
    if (a6)
    {
      v19 = CFSTR("kCRKItemNameErrorKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      v20 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v17 = CRKErrorWithCodeAndUserInfo(12, v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue(v17);

      LOBYTE(a6) = 0;
    }
  }
  else
  {
    objc_msgSend(v14, "acceptInvitationWithPin:studentInformation:", v11, v12);
    -[STUInvitationSessionManager recordAcceptedCourseInvitationWithIdentifier:](self, "recordAcceptedCourseInvitationWithIdentifier:", v10);
    LOBYTE(a6) = 1;
  }

  return (char)a6;
}

- (void)beginTransactionForSession:(id)a3 transport:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager transactionsBySessionUUID](self, "transactionsBySessionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sessionUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.studentd.invitation-session.%@"), v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v13, v15));

      v13 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager osTransactionPrimitives](self, "osTransactionPrimitives"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transactionWithReverseDNSReason:", v13));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager transactionsBySessionUUID](self, "transactionsBySessionUUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sessionUUID"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  }
}

- (void)endTransactionForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager transactionsBySessionUUID](self, "transactionsBySessionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionUUID"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);
}

- (id)browser:(id)a3 needsClientIdentityForEndpoint:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager identityTable](self, "identityTable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identityForEndpoint:createIfDoesNotExist:", v5, 1));

  return v7;
}

- (void)browser:(id)a3 didFindInvitationSessionWithEndpoint:(id)a4 transport:(id)a5
{
  id v7;
  NSMutableDictionary *mConnectedTransportsByEndpoint;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v7 = a4;
  mConnectedTransportsByEndpoint = self->mConnectedTransportsByEndpoint;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mConnectedTransportsByEndpoint, "objectForKeyedSubscript:", v7));
  if (v10)
  {
    v11 = sub_100033290();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Invalidating new invitation session for endpoint %{public}@ because we are already connected to %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v9, "invalidate");
  }
  else
  {
    -[CATTaskServer connectWithClientTransport:](self->mInvitationServer, "connectWithClientTransport:", v9);
    -[NSMapTable setObject:forKey:](self->mEndpointsByTransport, "setObject:forKey:", v7, v9);
  }

}

- (void)browser:(id)a3 didRemoveInvitationSessionWithEndpoint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSMapTable *mEndpointsByTransport;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager identityTable](self, "identityTable"));
  objc_msgSend(v6, "removeIdentityForEndpoint:", v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskServer clientSessions](self->mInvitationServer, "clientSessions", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        mEndpointsByTransport = self->mEndpointsByTransport;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transport"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v14));

        if (v15 && objc_msgSend(v15, "isEqualToRemoteEndpoint:", v5))
        {
          v16 = CRKErrorWithCodeAndUserInfo(6, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(v12, "invalidateWithError:", v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (BOOL)server:(id)a3 clientSession:(id)a4 shouldConnectWithTransport:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transport"));

  v10 = sub_100033290();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9 == v8)
  {
    if (v12)
    {
      v14 = 138543362;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "INVITE SESSION CONNECTING %{public}@", (uint8_t *)&v14, 0xCu);
    }

    -[STUInvitationSessionManager beginTransactionForSession:transport:](self, "beginTransactionForSession:transport:", v7, v8);
  }
  else
  {
    if (v12)
    {
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "INVITE SESSION RECONNECTING %{public}@ with transport %{public}@", (uint8_t *)&v14, 0x16u);
    }

  }
  return 1;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v7;
  id v8;
  NSMapTable *mEndpointsByTransport;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;

  v7 = a4;
  v8 = a5;
  mEndpointsByTransport = self->mEndpointsByTransport;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v12, "isEqualToString:", CATErrorDomain))
  {
    v13 = objc_msgSend(v8, "code");

    if (v13 == (id)503)
    {
      v14 = sub_100033290();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10007BBA8((uint64_t)v7, v8);

      if (v11)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager sessionBrowser](self, "sessionBrowser"));
        objc_msgSend(v16, "invitationSessionWithEndpointInvalidated:", v11);

      }
      objc_msgSend(v7, "invalidate");
      goto LABEL_16;
    }
  }
  else
  {

  }
  v17 = sub_100033290();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10007BCC0((uint64_t)v7, v8);

  if (v11)
  {
    v19 = sub_100033290();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10007BC34(v11, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager sessionBrowser](self, "sessionBrowser"));
    objc_msgSend(v21, "lostConnectionToInvitationSessionWithEndpoint:", v11);

  }
  objc_msgSend(v7, "disconnect");
LABEL_16:

}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSMapTable *mEndpointsByTransport;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v5 = a4;
  v6 = sub_100033290();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "INVITE SESSION CONNECTED %{public}@", (uint8_t *)&v13, 0xCu);
  }

  mEndpointsByTransport = self->mEndpointsByTransport;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mConnectedTransportsByEndpoint, "setObject:forKeyedSubscript:", v12, v10);

    }
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "invalidateSession:", v5);

}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSMapTable *mEndpointsByTransport;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  id v16;

  v5 = a4;
  v6 = sub_100033290();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v15 = 138543362;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "INVITE SESSION DISCONNECTED %{public}@", (uint8_t *)&v15, 0xCu);
  }

  mEndpointsByTransport = self->mEndpointsByTransport;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v9));

  if (v10)
    -[NSMutableDictionary removeObjectForKey:](self->mConnectedTransportsByEndpoint, "removeObjectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("DisconnectedSessionTimeout")));
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  -[STUInvitationSessionManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "invalidateSession:", v5, v14);
}

- (void)invalidateSession:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = CATErrorWithCodeAndUserInfo(4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v7, "invalidateWithError:", v6);

  }
  else
  {
    -[STUInvitationSessionManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v7, 0);
  }

}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSMapTable *mEndpointsByTransport;
  void *v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  int v13;
  id v14;

  v5 = a4;
  v6 = sub_100033290();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "INVITE SESSION INVALIDATED %{public}@", (uint8_t *)&v13, 0xCu);
  }

  mEndpointsByTransport = self->mEndpointsByTransport;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v9));

  if (v10)
  {
    v11 = self->mEndpointsByTransport;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transport"));
    -[NSMapTable removeObjectForKey:](v11, "removeObjectForKey:", v12);

  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "invalidateSession:", v5);
  -[STUInvitationSessionManager endTransactionForSession:](self, "endTransactionForSession:", v5);

}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  STUInviteToCourseOperation *v19;
  NSMapTable *mEndpointsByTransport;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  STUTaskOperationContext *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  STUTaskOperationContext *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(CRKInviteToCourseRequest);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0
    && +[STUInviteToCourseOperation validateRequest:error:](STUInviteToCourseOperation, "validateRequest:error:", v10, a6))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "invitation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "courseIdentifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager configurationManager](self, "configurationManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enrollmentRecordWithIdentifier:", v13));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager daemon](self, "daemon"));
    v17 = objc_msgSend(v16, "hasConnectionToClassWithIdentifier:", v13);

    if (v15 && v17)
    {
      if (a6)
      {
        v18 = CRKErrorWithCodeAndUserInfo(201, 0);
        v19 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v18);
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v45 = v13;
      mEndpointsByTransport = self->mEndpointsByTransport;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transport"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mEndpointsByTransport, "objectForKey:", v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CRKTaskClientInstructorPlatformUserInfoKey));

      v46 = v24;
      v43 = objc_msgSend(v24, "unsignedIntegerValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CRKTaskClientInstructorOSVersionUserInfoKey));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientUserInfo"));
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CRKTaskClientInstructorClassroomAppVersionUserInfoKey));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager identityTable](self, "identityTable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identityForEndpoint:createIfDoesNotExist:", v22, 0));

      if (v28)
      {
        v29 = [STUTaskOperationContext alloc];
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager configurationManager](self, "configurationManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager daemon](self, "daemon"));
        v42 = v15;
        v32 = v22;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager device](self, "device"));
        v34 = (void *)v44;
        v35 = -[STUTaskOperationContext initWithConfigurationManager:endpoint:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:studentIdentity:serverResourceCache:daemon:device:applicationWorkspace:](v29, "initWithConfigurationManager:endpoint:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:studentIdentity:serverResourceCache:daemon:device:applicationWorkspace:", v30, v32, v43, v47, v44, v28, 0, v31, v33, 0);

        v22 = v32;
        v15 = v42;

        v19 = -[STUTaskOperation initWithRequest:context:delegate:]([STUInviteToCourseOperation alloc], "initWithRequest:context:delegate:", v10, v35, self);
        v36 = (void *)v47;
      }
      else
      {
        v34 = (void *)v44;
        v36 = (void *)v47;
        v37 = sub_100033290();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_10007BD4C((uint64_t)v22, v38, v39);

        if (a6)
        {
          v40 = CRKErrorWithCodeAndUserInfo(17, 0);
          v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue(v40);
        }
        else
        {
          v19 = 0;
        }
      }

      v13 = v45;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "invitation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "courseIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationOperationsByCourseIdentifier, "objectForKeyedSubscript:", v11));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "cancel");
    -[STUInvitationSessionManager forgetAcceptedCourseInvitationWithIdentifier:](self, "forgetAcceptedCourseInvitationWithIdentifier:", v11);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInvitationOperationsByCourseIdentifier, "setObject:forKeyedSubscript:", v8, v11);
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v8);
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, "invitationOperationDidFinish:", 6);
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, "enqueuedOperationDidFail:", 4);
  v14 = sub_100033290();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class(v8);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "INVITE SESSION %{public}@ enqueued operation: %{public}@", (uint8_t *)&v19, 0x16u);

  }
}

- (void)invitationOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "invitation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "courseIdentifier"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationOperationsByCourseIdentifier, "objectForKeyedSubscript:", v6));
  if (v7 == v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->mInvitationOperationsByCourseIdentifier, "removeObjectForKey:", v6);
    -[STUInvitationSessionManager forgetAcceptedCourseInvitationWithIdentifier:](self, "forgetAcceptedCourseInvitationWithIdentifier:", v6);
  }

}

- (void)enqueuedOperationDidFail:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = sub_100033290();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10007BDB8(v3);

}

- (void)taskOperation:(id)a3 needsToEnqueueOperation:(id)a4
{
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", a4);
}

- (void)invitationDidFail:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CRKCourseInvitationIdentifierUserInfoKey));

  if (v6)
  {
    v5 = objc_msgSend(objc_alloc((Class)DMFControlGroupIdentifier), "initWithString:", v6);
    -[STUInvitationSessionManager forgetAcceptedCourseInvitationWithIdentifier:](self, "forgetAcceptedCourseInvitationWithIdentifier:", v5);

  }
}

- (void)recordAcceptedCourseInvitationWithIdentifier:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager acceptedInvitationIdentifiers](self, "acceptedInvitationIdentifiers"));
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager acceptedInvitationIdentifiers](self, "acceptedInvitationIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setByAddingObject:", v8));
    -[STUInvitationSessionManager setAcceptedInvitationIdentifiers:](self, "setAcceptedInvitationIdentifiers:", v7);

  }
}

- (void)forgetAcceptedCourseInvitationWithIdentifier:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager acceptedInvitationIdentifiers](self, "acceptedInvitationIdentifiers"));
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationSessionManager acceptedInvitationIdentifiers](self, "acceptedInvitationIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v6));

    objc_msgSend(v7, "removeObject:", v8);
    -[STUInvitationSessionManager setAcceptedInvitationIdentifiers:](self, "setAcceptedInvitationIdentifiers:", v7);

  }
}

- (id)osTransactionPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "osTransactionPrimitives"));

  return v4;
}

- (CRKClassSessionBrowser)sessionBrowser
{
  return self->_sessionBrowser;
}

- (NSSet)acceptedInvitationIdentifiers
{
  return self->_acceptedInvitationIdentifiers;
}

- (void)setAcceptedInvitationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)adHocBaseUserIdentifier
{
  return self->_adHocBaseUserIdentifier;
}

- (STUDaemon)daemon
{
  return (STUDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (STUDevice)device
{
  return (STUDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (STUInvitationIdentityTable)identityTable
{
  return self->_identityTable;
}

- (NSMutableDictionary)transactionsBySessionUUID
{
  return self->_transactionsBySessionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsBySessionUUID, 0);
  objc_storeStrong((id *)&self->_identityTable, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_adHocBaseUserIdentifier, 0);
  objc_storeStrong((id *)&self->_acceptedInvitationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sessionBrowser, 0);
  objc_storeStrong((id *)&self->mInvitationOperationsByCourseIdentifier, 0);
  objc_storeStrong((id *)&self->mConnectedTransportsByEndpoint, 0);
  objc_storeStrong((id *)&self->mEndpointsByTransport, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->mInvitationServer, 0);
}

@end
