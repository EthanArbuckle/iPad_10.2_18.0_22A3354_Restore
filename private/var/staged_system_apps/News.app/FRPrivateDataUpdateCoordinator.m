@implementation FRPrivateDataUpdateCoordinator

- (FRPrivateDataUpdateCoordinator)initWithNetworkReachability:(id)a3
{
  id v4;
  FRPrivateDataUpdateCoordinator *v5;
  FCAsyncSerialQueue *v6;
  FCAsyncSerialQueue *updateQueue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRPrivateDataUpdateCoordinator;
  v5 = -[FRPrivateDataUpdateCoordinator init](&v9, "init");
  if (v5)
  {
    v6 = (FCAsyncSerialQueue *)objc_alloc_init((Class)FCAsyncSerialQueue);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = v6;

    objc_msgSend(v4, "addObserver:", v5);
  }

  return v5;
}

- (void)setPrivateDataControllers:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  NSArray *privateDataControllers;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_privateDataControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9), "removeStateObserver:", self);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  privateDataControllers = self->_privateDataControllers;
  self->_privateDataControllers = v10;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
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
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "addStateObserver:", self, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  -[FRPrivateDataUpdateCoordinator _updatePrivateDataControllersWithCompletion:](self, "_updatePrivateDataControllersWithCompletion:", 0);
}

- (void)_updatePrivateDataControllersWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);
  _QWORD v13[5];
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v12 = (void (**)(_QWORD))a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v4 = dispatch_group_create();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPrivateDataUpdateCoordinator privateDataControllers](self, "privateDataControllers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isDirty"))
        {
          dispatch_group_enter(v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPrivateDataUpdateCoordinator updateQueue](self, "updateQueue"));
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10005EEEC;
          v13[3] = &unk_1000DDA00;
          v13[4] = v10;
          v14 = v4;
          objc_msgSend(v11, "enqueueBlockForMainThread:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (v12)
  {
    if (FCDispatchGroupIsEmpty(v4))
      v12[2](v12);
    else
      dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, v12);
  }

}

- (NSArray)privateDataControllers
{
  return self->_privateDataControllers;
}

- (void)updatePrivateDataControllersWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  -[FRPrivateDataUpdateCoordinator _updatePrivateDataControllersWithCompletion:](self, "_updatePrivateDataControllersWithCompletion:", v4);

}

- (FRPrivateDataUpdateCoordinator)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRPrivateDataUpdateCoordinator init]";
    v7 = 2080;
    v8 = "FRPrivateDataUpdateCoordinator.m";
    v9 = 1024;
    v10 = 21;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRPrivateDataUpdateCoordinator init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)markAllPrivateDataControllersAsNeedingUpdate
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPrivateDataUpdateCoordinator privateDataControllers](self, "privateDataControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "markAsDirty");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)privateDataControllerDidBecomeDirty:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_updatePrivateDataControllersWithCompletion:", 0);
  -[FRPrivateDataUpdateCoordinator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_updatePrivateDataControllersWithCompletion:", 0, 1.0);
}

- (void)networkReachabilityDidChange:(id)a3
{
  if (objc_msgSend(a3, "isNetworkReachable"))
    -[FRPrivateDataUpdateCoordinator updatePrivateDataControllersWithCompletion:](self, "updatePrivateDataControllersWithCompletion:", 0);
}

- (FCAsyncSerialQueue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_privateDataControllers, 0);
}

@end
