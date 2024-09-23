@implementation MSDPushService

- (MSDPushService)init
{
  MSDPushService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  uint64_t v5;
  NSArray *consumers;
  objc_super v8;
  uint64_t v9;

  v8.receiver = self;
  v8.super_class = (Class)MSDPushService;
  v2 = -[MSDPushService init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MSDPushService", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v9 = objc_opt_class(MSDCloudManager);
    v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    consumers = v2->_consumers;
    v2->_consumers = (NSArray *)v5;

    -[MSDPushService _statConnectionWithEnvironment:](v2, "_statConnectionWithEnvironment:", 0);
  }
  return v2;
}

+ (MSDPushService)sharedService
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FF8C;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052790 != -1)
    dispatch_once(&qword_100052790, block);
  return (MSDPushService *)(id)qword_100052788;
}

- (void)dealloc
{
  APSConnection *connection;
  objc_super v4;

  -[APSConnection shutdown](self->_connection, "shutdown");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSDPushService;
  -[MSDPushService dealloc](&v4, "dealloc");
}

- (void)_statConnectionWithEnvironment:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MSDPushService *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000200BC;
  v7[3] = &unk_100049ED8;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_determinePushEnvironment
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v17 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverPreferredPushEnvironmentWithError:", &v17));
  v4 = v17;

  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  v6 = v3;
  if (!v5)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000208E8((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v6 = (void *)APSEnvironmentProduction;
    if (v3)
      v6 = v3;
  }
  v15 = v6;

  return v15;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did receive public token %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;

  v5 = a4;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did receive push notification %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topic"));
  v9 = objc_msgSend(v8, "isEqualToString:", kAPSTopic);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Receive push notification with info %@", buf, 0xCu);
    }

  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushService consumers](self, "consumers", 0));
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "handlePushNotification:", v5);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }
  }

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;

  v4 = a4;
  v5 = a3;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 1024;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection status changed %@ %d", (uint8_t *)&v8, 0x12u);
  }

}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)connectionEnvironment
{
  return self->_connectionEnvironment;
}

- (void)setConnectionEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_connectionEnvironment, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSArray)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
  objc_storeStrong((id *)&self->_consumers, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionEnvironment, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
