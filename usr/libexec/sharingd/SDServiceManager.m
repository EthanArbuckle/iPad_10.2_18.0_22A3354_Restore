@implementation SDServiceManager

- (SDServiceManager)initWithClientProxy:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  SDServiceManager *v9;
  SDServiceManager *v10;
  NSString *bundleID;
  NSMutableArray *v12;
  NSMutableArray *enabledServices;
  NSMutableArray *v14;
  NSMutableArray *companionStreams;
  NSMutableDictionary *v16;
  NSMutableDictionary *streamHandlers;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SDServiceManager;
  v9 = -[SDServiceManager init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientProxy, a3);
    objc_storeStrong((id *)&v10->_managerID, a4);
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)&stru_10072FE60;

    v12 = objc_opt_new(NSMutableArray);
    enabledServices = v10->_enabledServices;
    v10->_enabledServices = v12;

    v14 = objc_opt_new(NSMutableArray);
    companionStreams = v10->_companionStreams;
    v10->_companionStreams = v14;

    v16 = objc_opt_new(NSMutableDictionary);
    streamHandlers = v10->_streamHandlers;
    v10->_streamHandlers = v16;

  }
  return v10;
}

- (void)start
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
  objc_msgSend(v3, "registerManager:", self);

}

- (void)stop
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_enabledServices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager", (_QWORD)v13));
        objc_msgSend(v9, "removeService:", v8);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        objc_msgSend(v10, "closeStreamsForIdentifier:", v11);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_enabledServices, "removeAllObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
  objc_msgSend(v12, "unregisterManager:", self);

}

- (id)streamHandlerForService:(id)a3
{
  NSMutableDictionary *streamHandlers;
  void *v4;
  void *v5;

  streamHandlers = self->_streamHandlers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](streamHandlers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)enableService:(id)a3
{
  NSMutableArray *enabledServices;
  id v4;
  id v5;

  enabledServices = self->_enabledServices;
  v4 = a3;
  -[NSMutableArray addObject:](enabledServices, "addObject:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
  objc_msgSend(v5, "addService:", v4);

}

- (void)disableService:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](SDStreamManager, "sharedManager"));
  objc_msgSend(v4, "removeService:", v5);

  -[NSMutableArray removeObject:](self->_enabledServices, "removeObject:", v5);
}

- (void)manager:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SFCompanionServiceManagerClient *clientProxy;
  _QWORD v16[4];
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v11)
  {
    if (v12)
    {
      clientProxy = self->_clientProxy;
      if (clientProxy)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10019E4BC;
        v16[3] = &unk_100714370;
        v17 = v13;
        -[SFCompanionServiceManagerClient streamToService:withFileHandle:acceptReply:](clientProxy, "streamToService:withFileHandle:acceptReply:", v11, v12, v16);
        objc_msgSend(v12, "closeFile");

      }
    }
  }

}

- (void)companionStreamClosedStreams:(id)a3
{
  -[NSMutableArray removeObject:](self->_companionStreams, "removeObject:", a3);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)managerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SFCompanionServiceManagerClient)clientProxy
{
  return (SFCompanionServiceManagerClient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)streamHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStreamHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)enabledServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnabledServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompanionStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionStreams, 0);
  objc_storeStrong((id *)&self->_enabledServices, 0);
  objc_storeStrong((id *)&self->_streamHandlers, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_managerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
