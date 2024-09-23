@implementation RPMultipleClientProxy

+ (id)clientProxy
{
  if (qword_100095BE8 != -1)
    dispatch_once(&qword_100095BE8, &stru_100081840);
  return (id)qword_100095BE0;
}

- (RPMultipleClientProxy)init
{
  RPMultipleClientProxy *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPMultipleClientProxy;
  v2 = -[RPMultipleClientProxy init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableSet);
    -[RPMultipleClientProxy setConnectionSet:](v2, "setConnectionSet:", v3);

  }
  return v2;
}

- (void)resetConnectionWithProcessIdentifier:(int)a3
{
  RPMultipleClientProxy *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = self;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v4, "connectionSet", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);

        v7 = v10;
        if (objc_msgSend(v10, "processIdentifier") == a3)
        {
          objc_msgSend(v10, "setInvalidationHandler:", 0);
          objc_msgSend(v10, "setInterruptionHandler:", 0);
          objc_msgSend(v10, "invalidate");
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);

  }
  if (objc_msgSend(0, "processIdentifier") == a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v4, "connectionSet"));
    objc_msgSend(v11, "removeObject:", 0);

  }
  objc_sync_exit(v4);

}

- (void)handleNewConnection:(id)a3 currentState:(id)a4
{
  id v6;
  RPMultipleClientProxy *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v7, "connectionSet"));
  v9 = objc_msgSend(v8, "containsObject:", v11);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v7, "connectionSet"));
    objc_msgSend(v10, "addObject:", v11);

  }
  -[RPMultipleClientProxy updateScreenRecordingStateWithCurrentState:](v7, "updateScreenRecordingStateWithCurrentState:", v6);
  objc_sync_exit(v7);

}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v4;
  RPMultipleClientProxy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPMultipleClientProxy:updateScreenRecordingState:", buf, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "remoteObjectProxyWithErrorHandler:", &stru_100081860));
        objc_msgSend(v10, "updateScreenRecordingStateWithCurrentState:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6;
  id v7;
  RPMultipleClientProxy *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPMultipleClientProxy:recordingDidStopWithError:movieURL:", buf, 2u);
  }
  v8 = self;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v8, "connectionSet", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "remoteObjectProxyWithErrorHandler:", &stru_100081880));
        objc_msgSend(v13, "recordingDidStopWithError:movieURL:", v6, v7);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)updateBroadcastURL:(id)a3
{
  id v4;
  RPMultipleClientProxy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPMultipleClientProxy:updateBroadcastURL:", buf, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "remoteObjectProxyWithErrorHandler:", &stru_1000818A0));
        objc_msgSend(v10, "updateBroadcastURL:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingLockInterrupted:(id)a3
{
  id v4;
  RPMultipleClientProxy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPMultipleClientProxy:recordingLockInterrupted:", buf, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "remoteObjectProxyWithErrorHandler:", &stru_1000818C0));
        objc_msgSend(v10, "recordingLockInterrupted:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v4;
  RPMultipleClientProxy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPMultipleClientProxy:recordingTimerDidUpdate:", buf, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "remoteObjectProxyWithErrorHandler:", &stru_1000818E0));
        objc_msgSend(v10, "recordingTimerDidUpdate:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingDidPause
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v2)
    sub_10004EC88(v2, v3, v4, v5, v6, v7, v8, v9);
}

- (void)shouldResumeSessionType:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3)
    sub_10004ECBC(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (int)currentConnectionProcessIdentifier
{
  return self->_currentConnectionProcessIdentifier;
}

- (void)setCurrentConnectionProcessIdentifier:(int)a3
{
  self->_currentConnectionProcessIdentifier = a3;
}

- (NSMutableSet)connectionSet
{
  return self->_connectionSet;
}

- (void)setConnectionSet:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSet, 0);
}

@end
