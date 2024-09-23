@implementation BTPipeManager

- (BTPipeManager)initWithDelegate:(id)a3 isServer:(BOOL)a4
{
  id v6;
  BTPipeManager *v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *pipes;
  id v11;
  void *v12;
  void *v13;
  CBScalablePipeManager *v14;
  CBScalablePipeManager *pipeManager;
  objc_super v17;
  uint8_t buf[4];
  BTPipeManager *v19;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BTPipeManager;
  v7 = -[BTPipeManager init](&v17, "init");
  if (v7)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Initializing (%p)", buf, 0xCu);
    }
    v7->_isServer = a4;
    v9 = objc_opt_new(NSMutableDictionary);
    pipes = v7->_pipes;
    v7->_pipes = v9;

    objc_storeWeak((id *)&v7->_delegate, v6);
    v11 = objc_alloc((Class)CBScalablePipeManager);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workQueue"));
    v14 = (CBScalablePipeManager *)objc_msgSend(v11, "initWithDelegate:queue:", v7, v13);
    pipeManager = v7->_pipeManager;
    v7->_pipeManager = v14;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[BTPipeManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BTPipeManager;
  -[BTPipeManager dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  CBScalablePipeManager *pipeManager;
  int v6;
  BTPipeManager *v7;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Invalidating (%p)", (uint8_t *)&v6, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_pipeRegistered)
    {
      v4 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412290;
        v7 = (BTPipeManager *)CFSTR("com.apple.qs.ms");
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Telling CoreBluetooth to unregister endpoint (%@)", (uint8_t *)&v6, 0xCu);
      }
      -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", CFSTR("com.apple.qs.ms"));
    }
    -[CBScalablePipeManager setDelegate:](self->_pipeManager, "setDelegate:", 0);
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;

  }
}

- (id)pipeForPeerID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_pipes, "objectForKeyedSubscript:", a3);
}

- (void)registerEndpoint
{
  NSObject *v3;
  int v4;
  const __CFString *v5;

  v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.qs.ms");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Telling CoreBluetooth to register endpoint (%@)", (uint8_t *)&v4, 0xCu);
  }
  self->_pipeRegistered = 1;
  -[CBScalablePipeManager registerEndpoint:type:priority:](self->_pipeManager, "registerEndpoint:type:priority:", CFSTR("com.apple.qs.ms"), self->_isServer, 1);
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  NSObject *v4;
  int64_t v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSMutableDictionary *pipes;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  NSMutableDictionary *v26;

  if ((-[CBScalablePipeManager isEqual:](self->_pipeManager, "isEqual:", a3) & 1) == 0)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", buf, 2u);
    }
  }
  v5 = (int64_t)-[CBScalablePipeManager state](self->_pipeManager, "state");
  v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = sub_100004370(v5);
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe manager did update state (%@)", buf, 0xCu);

  }
  if (v5 < 4)
  {
    *(_WORD *)&self->_pipeRegistered = 0;
    if (-[NSMutableDictionary count](self->_pipes, "count"))
    {
      v10 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        pipes = self->_pipes;
        *(_DWORD *)buf = 138412290;
        v26 = pipes;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Notifying delegate all pipes disconnected for pipes: (%@)", buf, 0xCu);
      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = self->_pipes;
      v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pipes, "objectForKeyedSubscript:", v17, (_QWORD)v20));
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "pipe:didDisconnectFromPeer:", v18, v17);

          }
          v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

      -[NSMutableDictionary removeAllObjects](self->_pipes, "removeAllObjects");
    }
  }
  else
  {
    if (!self->_pipeRegistered)
      -[BTPipeManager registerEndpoint](self, "registerEndpoint");
    if (v5 == 5)
      self->_isPoweredOn = 1;
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v8 = a4;
  v9 = a5;
  if ((-[CBScalablePipeManager isEqual:](self->_pipeManager, "isEqual:", a3) & 1) == 0)
  {
    v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v13, 2u);
    }
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.qs.ms")) & 1) == 0)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v13, 2u);
    }
  }
  v12 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did register endpoint: (%@); error: %@",
      (uint8_t *)&v13,
      0x16u);
  }

}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a4;
  if ((-[CBScalablePipeManager isEqual:](self->_pipeManager, "isEqual:", a3) & 1) == 0)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v10, 2u);
    }
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.qs.ms")) & 1) == 0)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v10, 2u);
    }
  }
  v9 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did unregister endpoint: (%@)", (uint8_t *)&v10, 0xCu);
  }

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  v6 = a4;
  if ((-[CBScalablePipeManager isEqual:](self->_pipeManager, "isEqual:", a3) & 1) == 0)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v18, 2u);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.qs.ms")) & 1) == 0)
  {
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v18, 2u);
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peer"));
  if (!v10)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "peer is nil", (uint8_t *)&v18, 2u);
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  if (!v12)
  {
    v13 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "pipe UUID is nil", (uint8_t *)&v18, 2u);
    }
  }
  v14 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did connect: (%@); peer: (%@)",
      (uint8_t *)&v18,
      0x16u);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipes, "setObject:forKeyedSubscript:", v6, v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pipe:didConnectToPeer:", v6, v12);

}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v8 = a4;
  v9 = a5;
  if ((-[CBScalablePipeManager isEqual:](self->_pipeManager, "isEqual:", a3) & 1) == 0)
  {
    v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v21, 2u);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.qs.ms")) & 1) == 0)
  {
    v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v21, 2u);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
  if (!v13)
  {
    v14 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "peer is nil", (uint8_t *)&v21, 2u);
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  if (!v15)
  {
    v16 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "peerID is nil", (uint8_t *)&v21, 2u);
    }
  }
  v17 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v21 = 138412802;
    v22 = v8;
    v23 = 2112;
    v24 = v19;
    v25 = 2112;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did disconnect: (%@); peer: (%@); error: (%@)",
      (uint8_t *)&v21,
      0x20u);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipes, "setObject:forKeyedSubscript:", 0, v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pipe:didDisconnectFromPeer:", v8, v15);

}

- (BOOL)isServer
{
  return self->_isServer;
}

- (void)setIsServer:(BOOL)a3
{
  self->_isServer = a3;
}

- (BTPipeManagerDelegate)delegate
{
  return (BTPipeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBScalablePipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pipeManager, a3);
}

- (BOOL)pipeRegistered
{
  return self->_pipeRegistered;
}

- (void)setPipeRegistered:(BOOL)a3
{
  self->_pipeRegistered = a3;
}

- (BOOL)isPoweredOn
{
  return self->_isPoweredOn;
}

- (void)setIsPoweredOn:(BOOL)a3
{
  self->_isPoweredOn = a3;
}

- (NSMutableDictionary)pipes
{
  return self->_pipes;
}

- (void)setPipes:(id)a3
{
  objc_storeStrong((id *)&self->_pipes, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
