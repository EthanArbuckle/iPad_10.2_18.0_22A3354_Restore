@implementation SKDaemonConnection

+ (int64_t)checkPrivilegeLevelWithConnection:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  unsigned int v17;
  _DWORD v19[2];

  v3 = a3;
  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "A SK client wants to connect", (uint8_t *)v19, 2u);
  }

  if (sub_10000C75C((uint64_t)off_1000517A0, v3))
  {
    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client entitled for destructive operations", (uint8_t *)v19, 2u);
    }
    v8 = 3;
    goto LABEL_22;
  }
  if (sub_10000C75C((uint64_t)off_100051798, v3))
  {
    v9 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      v8 = 2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client entitled for destructive external operations", (uint8_t *)v19, 2u);
    }
    else
    {
      v8 = 2;
    }
    goto LABEL_22;
  }
  if (!sub_10000C75C((uint64_t)off_100051790, v3))
  {
    v11 = sub_10000C75C((uint64_t)off_100051788, v3);
    v12 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v19[0]) = 0;
        v14 = "Client entitled for information";
        v15 = v7;
        v16 = 2;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v19, v16);
      }
    }
    else if (v13)
    {
      v17 = objc_msgSend(v3, "processIdentifier");
      v19[0] = 67109120;
      v19[1] = v17;
      v14 = "Client (%d) not entitiled, applying default level (information)";
      v15 = v7;
      v16 = 8;
      goto LABEL_20;
    }
    v8 = 0;
    goto LABEL_22;
  }
  v10 = sub_10000BA9C();
  v7 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client entitled for state-changing", (uint8_t *)v19, 2u);
  }
  v8 = 1;
LABEL_22:

  return v8;
}

- (SKDaemonConnection)initWithConnection:(id)a3
{
  id v4;
  char *v5;
  int64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  SKDaemonConnection *v11;
  __int128 v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  objc_super v21;
  uint8_t buf[40];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SKDaemonConnection;
  v5 = -[SKDaemonConnection init](&v21, "init");
  if (!v5)
  {
LABEL_14:
    v11 = v5;
    goto LABEL_15;
  }
  v6 = +[SKDaemonConnection checkPrivilegeLevelWithConnection:](SKDaemonConnection, "checkPrivilegeLevelWithConnection:", v4);
  *((_QWORD *)v5 + 4) = v6;
  if (v6 != -1)
  {
    if (sub_10000C75C((uint64_t)off_1000517A8, v4))
    {
      v7 = sub_10000BA9C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client has audited mounts entitlement", buf, 2u);
      }

      v5[16] = 1;
    }
    v9 = sub_10000188C();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v4, "setExportedInterface:", v10);

    objc_msgSend(v4, "setExportedObject:", v5);
    *((_DWORD *)v5 + 5) = objc_msgSend(v4, "effectiveUserIdentifier");
    *((_DWORD *)v5 + 6) = objc_msgSend(v4, "effectiveGroupIdentifier");
    if (v4)
      objc_msgSend(v4, "auditToken");
    else
      memset(buf, 0, 32);
    v12 = *(_OWORD *)&buf[16];
    *(_OWORD *)(v5 + 40) = *(_OWORD *)buf;
    *(_OWORD *)(v5 + 56) = v12;
    v13 = sub_100001A24();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v4, "setRemoteObjectInterface:", v14);

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_100044E88));
    v16 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v15;

    v17 = sub_10000BA9C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v4, "processIdentifier");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SKDaemonConnection initWithConnection:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Connected via XPC from pid %d", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)authorizeRequestForRoot
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_10000BA9C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[SKDaemonConnection authorizeRequestForRoot]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Not allowed for non-root users on this platform", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7
{
  id v11;
  char *v12;
  int64_t v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  id v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  NSObject *v25;
  const char *v26;
  uint8_t buf[4];
  const char *v28;

  v11 = a3;
  v12 = (char *)a5;
  if (!v11)
  {
    v18 = sub_10000BA9C();
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Couldn't find disk for given disk dictionary.";
      v19 = v15;
      v20 = 2;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v17, buf, v20);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v13 = -[SKDaemonConnection privilege](self, "privilege");
  if (objc_msgSend(v11, "isExternal") && (id)-[SKDaemonConnection privilege](self, "privilege") == (id)2)
    v13 = 3;
  if (v13 < a4)
  {
    v14 = sub_10000BA9C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        v17 = "Missing entitlement, request denied for UUID: %{public}@.";
LABEL_14:
        v19 = v15;
        v20 = 12;
        goto LABEL_15;
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 136446210;
      v28 = a6;
      v17 = "Missing entitlement, request denied for API: %{public}s.";
      goto LABEL_14;
    }
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000CD34;
  v24[3] = &unk_100044EB0;
  v26 = a6;
  v25 = v11;
  objc_msgSend(v21, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.storagekitd.usage"), v24);

  v22 = 1;
  v15 = v25;
LABEL_17:

  return v22;
}

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  return -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", a3, a4, 0, a5, 1);
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  const char *v19;

  v8 = a3;
  v9 = sub_10000BA9C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v8;
    v18 = 2080;
    v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s", (uint8_t *)&v16, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v8));

  v13 = -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v12, a4, 0, a5, 1);
  v14 = 0;
  if (v13)
    v14 = v12;

  return v14;
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 failResGenFunc:(id)a7
{
  return -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:", a3, a4, a5, a6, 1, a7);
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7 failResGenFunc:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  uint64_t (**v16)(_QWORD);
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  SKHelperClientProtocol *progressHandler;
  uint64_t v23;
  void *v24;
  int v26;
  id v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = (uint64_t (**)(_QWORD))a8;
  v17 = sub_10000BA9C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412802;
    v27 = v14;
    v28 = 2080;
    v29 = a6;
    v30 = 2114;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", (uint8_t *)&v26, 0x20u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "knownDiskForDictionary:", v14));

  if (-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v20, a4, v15, a6, v9))
  {
    v21 = v20;
  }
  else
  {
    progressHandler = self->_progressHandler;
    v23 = v16[2](v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:](progressHandler, "requestWithUUID:didCompleteWithResult:", v15, v24);

    v21 = 0;
  }

  return v21;
}

- (id)preflightRequestWithDisksArr:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRootForInternal:(BOOL)a7 failResGenFunc:(id)a8
{
  id v13;
  uint64_t (**v14)(_QWORD);
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  SKHelperClientProtocol *progressHandler;
  uint64_t v31;
  void *v32;
  uint64_t (**v34)(_QWORD);
  id obj;
  _BOOL4 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;

  v36 = a7;
  v13 = a3;
  v37 = a5;
  v14 = (uint64_t (**)(_QWORD))a8;
  v15 = sub_10000BA9C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v13;
    v45 = 2080;
    v46 = a6;
    v47 = 2114;
    v48 = v37;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v13;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    v34 = v14;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager", v34));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "knownDiskForDictionary:", v22));

        if (!v24)
        {
          v28 = sub_10000BA9C();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Couldn't find disk for given disk dictionary.", buf, 2u);
          }

LABEL_21:
          progressHandler = self->_progressHandler;
          v14 = v34;
          v31 = v34[2](v34);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:](progressHandler, "requestWithUUID:didCompleteWithResult:", v37, v32);
          v26 = obj;

          v27 = 0;
          goto LABEL_22;
        }
        if (v36)
        {
          v25 = objc_msgSend(v24, "isInternal");
          if (!-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v24, a4, v37, a6, v25 ^ 1)|| v25 && !-[SKDaemonConnection authorizeRequestForRoot](self, "authorizeRequestForRoot"))
          {
            goto LABEL_21;
          }
        }
        else if (!-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v24, a4, v37, a6, 1))
        {
          goto LABEL_21;
        }
        objc_msgSend(v17, "addObject:", v24);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v14 = v34;
      if (v19)
        continue;
      break;
    }
  }
  v26 = obj;

  v27 = v17;
LABEL_22:

  return v27;
}

- (void)initialPopulateComplete
{
  -[SKHelperClientProtocol initialPopulateComplete](self->_progressHandler, "initialPopulateComplete");
}

- (void)disksAppeared:(id)a3
{
  -[SKHelperClientProtocol disksAppeared:](self->_progressHandler, "disksAppeared:", a3);
}

- (void)disksChanged:(id)a3
{
  -[SKHelperClientProtocol disksChanged:](self->_progressHandler, "disksChanged:", a3);
}

- (void)disksDisappeared:(id)a3
{
  -[SKHelperClientProtocol disksDisappeared:](self->_progressHandler, "disksDisappeared:", a3);
}

- (void)managerStalled
{
  -[SKHelperClientProtocol managerStalled](self->_progressHandler, "managerStalled");
}

- (void)managerResumed
{
  -[SKHelperClientProtocol managerResumed](self->_progressHandler, "managerResumed");
}

- (void)syncAllDisksWithCompletionUUID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON - waiting for initialPopulateComplete", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D660;
  v9[3] = &unk_100044ED8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "syncAllDisksWithCompletionBlock:", v9);

}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionUUID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _BYTE *v16;
  _BYTE buf[24];
  char v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = sub_10000BA9C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SKDaemonConnection setDaemonOptionsWithLanguage:authRef:withCompletionUUID:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v18 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D810;
  v14[3] = &unk_100044F00;
  v14[4] = self;
  v13 = v9;
  v15 = v13;
  v16 = buf;
  objc_msgSend(v12, "setDaemonOptionsWithLanguage:authRef:withCompletionBlock:", v8, v6, v14);

  _Block_object_dispose(buf, 8);
}

- (void)diskForPath:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SKDaemonConnection diskForPath:withCompletionUUID:]";
    v16 = 2114;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000DA1C;
  v12[3] = &unk_100044F28;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "diskForPath:withCallbackBlock:", v7, v12);

}

- (void)wholeDiskForDiskDictionary:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2080;
    v19 = "-[SKDaemonConnection wholeDiskForDiskDictionary:withCompletionUUID:]";
    v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DC54;
  v14[3] = &unk_100044F28;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "wholeDiskForDisk:withCallbackBlock:", v12, v14);

}

- (void)childDisksForWholeDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2080;
    v19 = "-[SKDaemonConnection childDisksForWholeDisk:withCompletionUUID:]";
    v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DE8C;
  v14[3] = &unk_100044F50;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "childDisksForWholeDisk:withCallbackBlock:", v12, v14);

}

- (void)isBusyWithCompletionUUID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SKDaemonConnection isBusyWithCompletionUUID:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E12C;
  v9[3] = &unk_100044F78;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "isBusy:", v9);

}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 withCompletionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = sub_10000BA9C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    v20 = 2080;
    v21 = "-[SKDaemonConnection recacheDisk:options:withCompletionUUID:]";
    v22 = 2114;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "knownDiskForDictionary:", v8));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000E360;
  v16[3] = &unk_100044ED8;
  v16[4] = self;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v12, "recacheDisk:options:callbackBlock:", v14, a4, v16);

}

- (void)filesystemsWithCompletionUUID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SKDaemonConnection filesystemsWithCompletionUUID:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E4A0;
  v9[3] = &unk_100044F50;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "filesystemsWithCallbackBlock:", v9);

}

- (void)physicalStoresForAPFSVolume:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2080;
    v19 = "-[SKDaemonConnection physicalStoresForAPFSVolume:withCompletionUUID:]";
    v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E6C4;
  v14[3] = &unk_100044F50;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "physicalStoresForAPFSVolume:completionBlock:", v12, v14);

}

- (void)volumesForAPFSPS:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2080;
    v19 = "-[SKDaemonConnection volumesForAPFSPS:withCompletionUUID:]";
    v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E9C8;
  v14[3] = &unk_100044F50;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "volumesForAPFSPS:completionBlock:", v12, v14);

}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v9, "-[SKDaemonConnection renameDisk:to:withCompletionUUID:]", &stru_100044FB8));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000ECD4;
    v12[3] = &unk_100044FE0;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "renameDisk:to:withCompletionBlock:", v10, v8, v12);

  }
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v9, "-[SKDaemonConnection unmountDisk:options:withCompletionUUID:]", &stru_100045000));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000EF00;
    v12[3] = &unk_100044FE0;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "unmountDisk:options:withCompletionBlock:", v10, v8, v12);

  }
}

- (void)mountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SKMountOperation *v13;
  id v14;
  SKMountOperation *v15;
  void *v16;
  SKHelperClientProtocol *progressHandler;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  SKDaemonConnection *v23;
  id v24;
  void *v25;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "knownDiskForDictionary:", v10));

  v13 = [SKMountOperation alloc];
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10000F184;
  v22 = &unk_100044FE0;
  v23 = self;
  v14 = v8;
  v24 = v14;
  v15 = -[SKMountOperation initWithDisk:options:connection:completionBlock:](v13, "initWithDisk:options:connection:completionBlock:", v12, v9, self, &v19);

  if (v15)
  {
    if (-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v12, 1, v14, "-[SKDaemonConnection mountDisk:options:withCompletionUUID:]", -[SKMountOperation authenticateOnInit](v15, "authenticateOnInit", v19, v20, v21, v22, v23) ^ 1))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
      objc_msgSend(v16, "_scheduleOperation:", v15);
    }
    else
    {
      progressHandler = self->_progressHandler;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
      v25 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:](progressHandler, "requestWithUUID:didCompleteWithResult:", v14, v18);

    }
  }

}

- (void)ejectDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v6, "-[SKDaemonConnection ejectDisk:withCompletionUUID:]", &stru_100045020));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F394;
    v9[3] = &unk_100044FE0;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "ejectDisk:withCompletionBlock:", v7, v9);

  }
}

- (id)_safe_object:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  return v6;
}

- (id)eraseWithEraser:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const char *v22;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BA9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2082;
    v22 = "-[SKDaemonConnection eraseWithEraser:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight check for %@ at %{public}s", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "disk"));
  v11 = -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:prettyFunc:](self, "preflightRequestWithSKDisk:entitlementLevel:prettyFunc:", v10, 3, "-[SKDaemonConnection eraseWithEraser:reply:]");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000F65C;
    v16[3] = &unk_100045048;
    v16[4] = self;
    v17 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eraseWithEraser:completionBlock:", v6, v16));
    v14 = v17;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
    v18 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
    v13 = 0;
  }

  return v13;
}

- (id)resizeDisk:(id)a3 size:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:prettyFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:prettyFunc:", a3, 3, "-[SKDaemonConnection resizeDisk:size:reply:]"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F8CC;
    v14[3] = &unk_100045070;
    v15 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resize:toSize:completionBlock:", v9, a4, v14));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    v11 = 0;
  }

  return v11;
}

- (int64_t)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(int64_t)a3
{
  self->_privilege = a3;
}

- (BOOL)requiresMountAudit
{
  return self->_requiresMountAudit;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)authRef
{
  return self->_authRef;
}

- (void)setAuthRef:(unsigned __int8)a3
{
  self->_authRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressHandler, 0);
}

@end
