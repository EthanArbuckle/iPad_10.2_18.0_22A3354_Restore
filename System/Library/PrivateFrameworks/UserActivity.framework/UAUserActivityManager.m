@implementation UAUserActivityManager

- (void)makeActive:(id)a3
{
  char *v3;
  id v5;
  UAUserActivityManager *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  NSMapTable *activeUserActivitiesByUUID;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  UAUserActivityManager *obj;
  _QWORD block[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const __CFString *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  obj = v6;
  if (v5)
  {
    -[UAUserActivityManager activeUserActivitiesByUUID](v6, "activeUserActivitiesByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);

  }
  -[UAUserActivityManager activeUserActivityUUID](v6, "activeUserActivityUUID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v40 = (void *)v9;
  if ((v5 == 0) == (v9 != 0))
  {
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v10 || ((v12 ^ 1) & 1) == 0)
    {
      if ((v12 & 1) == 0)
        goto LABEL_11;
LABEL_10:
      v17 = 0;
      goto LABEL_35;
    }
  }
  -[UAUserActivityManager userActivitiesByUUID](obj, "userActivitiesByUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v5, "priority");
  v16 = objc_msgSend(v14, "priority");

  if (v15 > v16)
    goto LABEL_10;
LABEL_11:
  activeUserActivitiesByUUID = obj->_activeUserActivitiesByUUID;
  -[UAUserActivityManager activeUserActivityUUID](obj, "activeUserActivityUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](activeUserActivitiesByUUID, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    +[UAUserActivity observers](UAUserActivity, "observers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v49;
      do
      {
        v24 = 0;
        v3 = sel_userActivityWillBecomeCurrent_current_;
        do
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v24);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v20, "parentUserActivity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "userActivityWillBecomeCurrent:current:", v26, 0);

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v22);
    }

  }
  objc_msgSend(v5, "uniqueIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityManager setActiveUserActivityUUID:](obj, "setActiveUserActivityUUID:", v27);

  objc_msgSend(v5, "uniqueIdentifier");
  v39 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    +[UAUserActivity observers](UAUserActivity, "observers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v45;
      do
      {
        v31 = 0;
        v3 = sel_userActivityWillBecomeCurrent_current_;
        do
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v31);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v5, "parentUserActivity");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "userActivityWillBecomeCurrent:current:", v33, 1);

          }
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v29);
    }

  }
  else
  {
    -[UAUserActivityManager unregisterForApplicationDeactivation](obj, "unregisterForApplicationDeactivation");
  }

  v17 = 1;
  v40 = (void *)v39;
LABEL_35:
  objc_sync_exit(obj);

  _uaGetLogForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "UUIDString");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = &stru_1E60084E8;
    if (v40)
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v3 = (char *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqual:", v40))
        v37 = CFSTR(" (already active)");
    }
    *(_DWORD *)buf = 138543618;
    v53 = v36;
    v54 = 2114;
    v55 = v37;
    _os_log_impl(&dword_1AF7EB000, v34, OS_LOG_TYPE_DEBUG, "makeActive, userActivity=%{public}@%{public}@", buf, 0x16u);
    if (v40)

  }
  if (v17)
  {
    objc_msgSend(v5, "setDirty:", 1);
    -[UAUserActivityManager serverQ](obj, "serverQ");
    v38 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__UAUserActivityManager_makeActive___block_invoke;
    block[3] = &unk_1E60078E8;
    block[4] = obj;
    v43 = v40;
    dispatch_async(v38, block);

  }
}

- (BOOL)userActivityIsActive:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  -[UAUserActivityManager activeUserActivityUUID](self, "activeUserActivityUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v8);

  }
  return v7;
}

- (NSUUID)activeUserActivityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSXPCConnection)connection
{
  UAUserActivityManager *v2;
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  UAUserActivityManager *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_allowedToConnect)
  {
    connection = v2->_connection;
    if (connection)
    {
      v4 = connection;
    }
    else
    {
      _uaGetLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        UActivityCreationXPCServiceName();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v7;
        _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "Creating NSXPCConnection to server %{public}@", buf, 0xCu);

      }
      v8 = v2;
      v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
      UActivityCreationXPCServiceName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithMachServiceName:options:", v10, 0);
      v12 = v2->_connection;
      v2->_connection = (NSXPCConnection *)v11;

      _LSGetUserActivityClientProtocolInterface();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v13);

      -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v8);
      _LSGetUserActivityClientResponseProtocolInterface();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v14);

      v15 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __35__UAUserActivityManager_connection__block_invoke;
      v19[3] = &unk_1E6007310;
      v19[4] = v8;
      -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v19);
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __35__UAUserActivityManager_connection__block_invoke_2;
      v18[3] = &unk_1E6007310;
      v18[4] = v8;
      -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v18);
      -[NSXPCConnection resume](v2->_connection, "resume");
      v4 = v2->_connection;

    }
  }
  else
  {
    _uaGetLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "Not allowed to connect to useractivityd.", buf, 2u);
    }

    v4 = 0;
  }
  objc_sync_exit(v2);

  if (v4 && !-[UAUserActivityManager initialServerHandshake:](v2, "initialServerHandshake:", 0))
  {
    _uaGetLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_ERROR, "Failed sending initial message for connection to useractivityd.", buf, 2u);
    }

    v4 = 0;
  }
  return v4;
}

- (BOOL)initialServerHandshake:(BOOL)a3
{
  NSObject *v5;
  UAUserActivityManager *v6;
  _BOOL4 v7;
  _BOOL4 allowedToConnect;
  NSXPCConnection *v9;
  _BOOL4 v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  _QWORD v21[5];
  NSXPCConnection *v22;
  uint64_t *v23;
  uint8_t buf[8];
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[UAUserActivityManager serverQ](self, "serverQ");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = self;
  objc_sync_enter(v6);
  v7 = a3 || v6->_needToSendInitialMessage;
  v6->_needToSendInitialMessage = 0;
  allowedToConnect = v6->_allowedToConnect;
  v9 = v6->_connection;
  objc_sync_exit(v6);

  if (v9)
    v10 = allowedToConnect;
  else
    v10 = 0;
  v11 = v27;
  if (v10)
  {
    *((_BYTE *)v27 + 24) = 1;
    if (v7)
    {
      v12 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke;
      v25[3] = &unk_1E6007EB0;
      v25[4] = v6;
      v25[5] = &v26;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v9, "remoteObjectProxyWithErrorHandler:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v30 = CFSTR("CFBundleIdentifier");
          objc_msgSend(v14, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }

        _uaGetLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v18, OS_LOG_TYPE_DEBUG, "calling doInitializeWithClientVersion: 1", buf, 2u);
        }

        v21[0] = v12;
        v21[1] = 3221225472;
        v21[2] = __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke_245;
        v21[3] = &unk_1E6007ED8;
        v21[4] = v6;
        v22 = v9;
        v23 = &v26;
        objc_msgSend(v13, "doInitializeWithClientVersion:clientInfo:completionHandler:", 1, v17, v21);

      }
      v11 = v27;
    }
  }
  v19 = *((_BYTE *)v11 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (OS_dispatch_queue)serverQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSMapTable)activeUserActivitiesByUUID
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveUserActivityUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)serialQueueForSendingActivitiesToServer
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)sendUserActivityInfoToLSUserActivityd:(id)a3 makeCurrent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    if (v4)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "Sending updated activity %{public}@ information to server, makeCurrent=%{public}@", buf, 0x16u);

  }
  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UAUserActivityManager serverQ](self, "serverQ");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke;
      block[3] = &unk_1E6007D50;
      block[4] = self;
      v15 = v6;
      v16 = v4;
      dispatch_async(v13, block);

    }
  }

}

- (void)unregisterForApplicationDeactivation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__UAUserActivityManager_unregisterForApplicationDeactivation__block_invoke;
  block[3] = &unk_1E6007310;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

+ (id)defaultManager
{
  if (defaultManager_sOnce != -1)
    dispatch_once(&defaultManager_sOnce, &__block_literal_global_6);
  return (id)defaultManager_sManager;
}

- (void)removeUserActivity:(id)a3
{
  id v4;
  void *v5;
  UAUserActivityManager *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[UAUserActivityManager userActivitiesByUUID](v6, "userActivitiesByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    objc_sync_exit(v6);
  }
  if (-[UAUserActivityManager userActivityIsActive:](self, "userActivityIsActive:", v4))
    -[UAUserActivityManager makeInactive:](self, "makeInactive:", v4);
  if (objc_msgSend(v4, "activityHasBeenSentToServer"))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityManager serverQ](self, "serverQ");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__UAUserActivityManager_removeUserActivity___block_invoke;
    v12[3] = &unk_1E60078E8;
    v12[4] = self;
    v13 = v9;
    v11 = v9;
    dispatch_async(v10, v12);

  }
}

- (NSMapTable)userActivitiesByUUID
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)makeInactive:(id)a3
{
  UAUserActivityManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[UAUserActivityManager activeUserActivityUUID](v4, "activeUserActivityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UAUserActivityManager activeUserActivitiesByUUID](v4, "activeUserActivitiesByUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  objc_msgSend(v12, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v9)
  {
    -[UAUserActivityManager setActiveUserActivityUUID:](v4, "setActiveUserActivityUUID:", 0);
    -[UAUserActivityManager activeActivitiesByPriority](v4, "activeActivitiesByPriority");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityManager makeActive:](v4, "makeActive:", v11);

  }
  objc_sync_exit(v4);

}

- (id)activeActivitiesByPriority
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UAUserActivityManager activeUserActivitiesByUUID](self, "activeUserActivitiesByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_44);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __39__UAUserActivityManager_defaultManager__block_invoke()
{
  UAUserActivityManager *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(UAUserActivityManager);
  v1 = (void *)defaultManager_sManager;
  defaultManager_sManager = (uint64_t)v0;

  objc_msgSend((id)defaultManager_sManager, "serverQ");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_state_add_handler();

}

- (UAUserActivityManager)init
{
  UAUserActivityManager *v2;
  uint64_t v3;
  NSMapTable *userActivitiesByUUID;
  uint64_t v5;
  NSMapTable *activeUserActivitiesByUUID;
  uint64_t v7;
  NSMutableSet *userActivityUUIDsSendToServer;
  char v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serverQ;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueueForSendingActivitiesToServer;
  _QWORD block[4];
  UAUserActivityManager *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UAUserActivityManager;
  v2 = -[UAUserActivityManager init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    userActivitiesByUUID = v2->_userActivitiesByUUID;
    v2->_userActivitiesByUUID = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    activeUserActivitiesByUUID = v2->_activeUserActivitiesByUUID;
    v2->_activeUserActivitiesByUUID = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    userActivityUUIDsSendToServer = v2->_userActivityUUIDsSendToServer;
    v2->_userActivityUUIDsSendToServer = (NSMutableSet *)v7;

    v2->_allowedToConnect = 1;
    v9 = objc_msgSend((id)objc_opt_class(), "shouldSupportActivityContinuation");
    v2->_supportsActivityContinuation = v9;
    v2->_activityContinuationIsEnabled = v9;
    v10 = dispatch_queue_create("userActivityQ", 0);
    serverQ = v2->_serverQ;
    v2->_serverQ = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("serialQueueForSendingActivitiesToServer", 0);
    serialQueueForSendingActivitiesToServer = v2->_serialQueueForSendingActivitiesToServer;
    v2->_serialQueueForSendingActivitiesToServer = (OS_dispatch_queue *)v12;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__UAUserActivityManager_init__block_invoke;
    block[3] = &unk_1E6007310;
    v16 = v2;
    if (init_sRegisterForReconnectionMessageOnce_0 != -1)
      dispatch_once(&init_sRegisterForReconnectionMessageOnce_0, block);

  }
  return v2;
}

+ (BOOL)shouldSupportActivityContinuation
{
  int v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = MGGetBoolAnswer();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSharedIPad");

    if (v4)
    {
      _uaGetLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v7, 2u);
      }

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

void __44__UAUserActivityManager_removeUserActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "calling doDeleteUserActivityWithUUID: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(v3, "doDeleteUserActivityWithUUID:", *(_QWORD *)(a1 + 40));
  }

}

void __64__UAUserActivityManager_markUserActivityAsDirty_forceImmediate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  int v11;
  const char *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 64))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 48), "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR(" webPageURL=<private>");
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(unsigned __int8 *)(a1 + 65);
      v11 = *(unsigned __int8 *)(a1 + 66);
      if (!v7)
        v8 = &stru_1E60084E8;
      v14 = 138544642;
      v12 = "YES";
      v15 = v5;
      v17 = v6;
      if (v10)
        v13 = "YES";
      else
        v13 = "NO";
      v16 = 2114;
      if (!v11)
        v12 = "NO";
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2082;
      v23 = v13;
      v24 = 2082;
      v25 = v12;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "calling doMarkUserActivityAsDirty:%{public}@ forceImmediate:%{public}@ %{public}@ expiration=%{public}@ iCloud=%{public}s/%{public}s", (uint8_t *)&v14, 0x3Eu);

    }
    objc_msgSend(v3, "doMarkUserActivityAsDirty:forceImmediate:webpageURL:expiration:hasiCloudDocument:hasUnsynchronizediCloudDoc:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 65), *(unsigned __int8 *)(a1 + 66));
  }

}

void __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke_2;
    v6[3] = &unk_1E6007D28;
    v7 = v4;
    objc_msgSend(v3, "doUpdateUserActivityInfo:makeCurrent:completionHandler:", v7, v5, v6);

  }
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int8x16_t v16;
  _QWORD v17[4];
  id v18;
  int8x16_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "Skipping telling server about activity because it was invalidated, uuid=%{public}@.", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "userActivityUUIDsSendToServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if ((v7 & 1) != 0)
      return;
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v2 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "userActivityInfoForSelfWithPayload:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v2 && v9)
    {
      _uaGetLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "--- calling doUpdateUserActivityInfo on serverQ", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "activeUserActivityUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_51;
      v17[3] = &unk_1E6007D00;
      v18 = v10;
      v16 = *(int8x16_t *)(a1 + 32);
      v15 = (id)v16.i64[0];
      v19 = vextq_s8(v16, v16, 8uLL);
      -[NSObject doUpdateUserActivityInfo:makeCurrent:completionHandler:](v2, "doUpdateUserActivityInfo:makeCurrent:completionHandler:", v18, v14, v17);

    }
  }

}

void __36__UAUserActivityManager_makeActive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "calling doUpdateUserActivityWithUUID:%{public}@ setActive: YES", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "doUpdateUserActivityWithUUID:setActive:", *(_QWORD *)(a1 + 40), 1);

}

- (NSSet)userActivityUUIDsSendToServer
{
  UAUserActivityManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_userActivityUUIDsSendToServer, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

void __61__UAUserActivityManager_unregisterForApplicationDeactivation__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "registeredForAppResignationMessages"))
  {
    _uaGetLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "unregisterForApplicationDeactivation", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setRegisteredForAppResignationMessages:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("UIApplicationWillResignActiveNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("UIApplicationWillTerminateNotification"), 0);

  }
  objc_sync_exit(v2);

}

void __68__UAUserActivityManager_registerForApplicationDeactivateIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "registeredForAppResignationMessages") & 1) == 0)
  {
    _uaGetLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "registerForApplicationDeactivateIfNecessary()", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setRegisteredForAppResignationMessages:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_sendCurrentActivityToIndexer_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_sendCurrentActivityToIndexer_, CFSTR("UIApplicationWillTerminateNotification"), 0);

  }
  objc_sync_exit(v2);

}

- (BOOL)registeredForAppResignationMessages
{
  return self->_registeredForAppResignationMessages;
}

- (void)setRegisteredForAppResignationMessages:(BOOL)a3
{
  self->_registeredForAppResignationMessages = a3;
}

- (void)markUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4
{
  UAUserActivityManager *v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  char v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  char v30;
  char v31;
  char v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  LODWORD(v4) = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v4)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (objc_msgSend(v6, "isInvalidated"))
      v10 = CFSTR(" (invalidated)");
    else
      v10 = &stru_1E60084E8;
    v11 = (char)v4;
    v4 = self;
    if (objc_msgSend(v6, "userInfoContainsFileURLs"))
      v12 = "YES";
    else
      v12 = "NO";
    *(_DWORD *)buf = 138544643;
    if (objc_msgSend(v6, "encodedContainsUnsynchronizedCloudDocument"))
      v13 = "YES";
    else
      v13 = "NO";
    v34 = v8;
    v35 = 2113;
    v36 = v6;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    v41 = 2082;
    v42 = v12;
    self = v4;
    LOBYTE(v4) = v11;
    v43 = 2082;
    v44 = v13;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@/%{private}@ forceImmediate=%{public}@%{public}@ iCloud=%{public}s/%{public}s", buf, 0x3Eu);

  }
  if (v6 && (objc_msgSend(v6, "isInvalidated") & 1) == 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    objc_msgSend(v6, "webpageURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    objc_msgSend(v6, "expirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    LOBYTE(v18) = objc_msgSend(v6, "userInfoContainsFileURLs");
    v20 = objc_msgSend(v6, "encodedContainsUnsynchronizedCloudDocument");
    -[UAUserActivityManager serverQ](self, "serverQ");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__UAUserActivityManager_markUserActivityAsDirty_forceImmediate___block_invoke;
    block[3] = &unk_1E6007D78;
    block[4] = self;
    v27 = v15;
    v30 = (char)v4;
    v28 = v17;
    v29 = v19;
    v31 = (char)v18;
    v32 = v20;
    v22 = v19;
    v23 = v17;
    v24 = v15;
    dispatch_async(v21, block);

  }
}

char *__39__UAUserActivityManager_defaultManager__block_invoke_2()
{
  void *v0;
  char *v1;
  const char *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21[128];
  char __s[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  *(_OWORD *)__s = 0u;
  v23 = 0u;
  strstr("@(#)PROGRAM:UserActivity  PROJECT:UserActivity-551\n", "PROJECT:");
  __strlcpy_chk();
  v1 = strrchr(__s, 10);
  if (v1)
    *v1 = 0;
  if (objc_msgSend((id)defaultManager_sManager, "supportsActivityContinuation"))
    v2 = "YES";
  else
    v2 = "NO";
  if (objc_msgSend((id)defaultManager_sManager, "activityContinuationIsEnabled"))
    v3 = "YES";
  else
    v3 = "NO";
  objc_msgSend(v0, "appendFormat:", CFSTR("UAUserActivityManager supportsActivityContinuation=%s isEnabled=%s serverPid=%ld %s"), v2, v3, *(int *)(defaultManager_sManager + 48), __s);
  objc_msgSend((id)defaultManager_sManager, "activeUserActivityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)defaultManager_sManager, "activeUserActivityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appendFormat:", CFSTR(" becomeCurrentUUID=%@"), v6);

  }
  v7 = (id)defaultManager_sManager;
  objc_sync_enter(v7);
  objc_msgSend((id)defaultManager_sManager, "userActivitiesByUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)objc_msgSend(v8, "count") > 1;

  if (v9)
  {
    objc_msgSend(v0, "appendString:", CFSTR(" - otherUUIDs:["));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend((id)defaultManager_sManager, "userActivitiesByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v0, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v0, "appendString:", CFSTR("\n"));
  }
  objc_sync_exit(v7);

  v15 = serializedCFType(v0);
  return v15;
}

- (BOOL)supportsActivityContinuation
{
  return self->_supportsActivityContinuation;
}

- (BOOL)activityContinuationIsEnabled
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "shouldSupportActivityContinuation");
  if (v3)
    LOBYTE(v3) = self->_activityContinuationIsEnabled;
  return v3;
}

- (id)fetchUUID:(id)a3 intervalToWaitForDocumentSynchonization:(double)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v28[4];
  _QWORD v29[2];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  _QWORD *v32;
  _QWORD *v33;
  double v34;
  os_signpost_id_t v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v8)
  {
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__2;
    v47[4] = __Block_byref_object_dispose__2;
    v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__2;
    v45[4] = __Block_byref_object_dispose__2;
    v46 = 0;
    _uaGetLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v12;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCancellable:", 1);
    objc_msgSend(v13, "setPausable:", 0);
    v14 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke;
    v43[3] = &unk_1E6007310;
    v15 = v8;
    v44 = v15;
    objc_msgSend(v13, "setCancellationHandler:", v43);
    -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      _uaGetLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v18;
        _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_INFO, "Found activity %@ local to this process, so doing an immediate copy.", buf, 0xCu);

      }
      objc_msgSend(v13, "setTotalUnitCount:", 1);
      dispatch_get_global_queue(0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_29;
      block[3] = &unk_1E6007BD0;
      v41 = v47;
      v37 = v16;
      v38 = v13;
      v39 = v15;
      v42 = v45;
      v40 = v10;
      dispatch_async(v19, block);

      v20 = &v37;
    }
    else
    {
      _uaGetLogForCategory(CFSTR("signposts"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_signpost_id_generate(v22);

      _uaGetLogForCategory(CFSTR("signposts"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v15;
        _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "fetchUserActivity", "Fetching handoff payload:%{public}@", buf, 0xCu);
      }

      -[UAUserActivityManager serverQ](self, "serverQ");
      v26 = objc_claimAutoreleasedReturnValue();
      v28[0] = v14;
      v28[1] = 3221225472;
      v28[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_31;
      v28[3] = &unk_1E6007C48;
      v34 = a4;
      v29[0] = v15;
      v29[1] = self;
      v32 = v45;
      v30 = v13;
      v33 = v47;
      v31 = v10;
      v35 = v23;
      dispatch_async(v26, v28);

      v20 = (id *)v29;
    }

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);

  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v21);

    }
    v13 = 0;
  }

  return v13;
}

- (id)userActivityForUUID:(id)a3
{
  id v4;
  UAUserActivityManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[UAUserActivityManager userActivitiesByUUID](v5, "userActivitiesByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)registerForApplicationDeactivateIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__UAUserActivityManager_registerForApplicationDeactivateIfNecessary__block_invoke;
  block[3] = &unk_1E6007310;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __29__UAUserActivityManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD handler[4];
  id v4;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__UAUserActivityManager_init__block_invoke_2;
  handler[3] = &unk_1E60078C0;
  v4 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.coreservices.useractivity.reconnection", (int *)&init_sRegisterForReconnectionNotificationToken_0, v2, handler);

}

void __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "Got error, from doUpdateUserActivityInfo to server, for %{public}@, error: %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

- (void)tellDaemonAboutNewLSUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  UAUserActivityManager *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v16 = v7;
    v17 = 2113;
    v18 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "Sending initial activity uuid=%{public}@ %{private}@ information to server", buf, 0x16u);

  }
  if (objc_msgSend(v4, "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "Skipping telling server about activity because it has been invalidated, uuid=%{public}@.", buf, 0xCu);

    }
  }
  else
  {
    -[UAUserActivityManager addUserActivity:](self, "addUserActivity:", v4);
    -[UAUserActivityManager serverQ](self, "serverQ");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke;
    v12[3] = &unk_1E60078E8;
    v13 = v4;
    v14 = self;
    dispatch_async(v11, v12);

    v8 = v13;
  }

}

- (void)addUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  UAUserActivityManager *v8;
  NSMapTable *userActivitiesByUUID;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543619;
    v12 = v7;
    v13 = 2113;
    v14 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "(%{public}@, %{private}@)", (uint8_t *)&v11, 0x16u);

  }
  v8 = self;
  objc_sync_enter(v8);
  userActivitiesByUUID = v8->_userActivitiesByUUID;
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](userActivitiesByUUID, "setObject:forKey:", v4, v10);

  objc_sync_exit(v8);
}

+ (BOOL)userActivityContinuationSupported
{
  int v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = MGGetBoolAnswer();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSharedIPad");

    if (v4)
    {
      _uaGetLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v7, 2u);
      }

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)allowedToConnect
{
  UAUserActivityManager *v2;
  BOOL allowedToConnect;

  v2 = self;
  objc_sync_enter(v2);
  allowedToConnect = v2->_allowedToConnect;
  objc_sync_exit(v2);

  return allowedToConnect;
}

- (void)setAllowedToConnect:(BOOL)a3
{
  _BOOL4 v3;
  UAUserActivityManager *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  NSObject *v7;
  UAUserActivityManager *obj;
  _QWORD block[5];

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_allowedToConnect != v3)
  {
    connection = obj->_connection;
    if (connection)
    {
      -[NSXPCConnection invalidate](connection, "invalidate");
      v6 = obj->_connection;
      obj->_connection = 0;

    }
    v4 = obj;
    if (v3)
    {
      -[UAUserActivityManager serverQ](obj, "serverQ");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__UAUserActivityManager_setAllowedToConnect___block_invoke;
      block[3] = &unk_1E6007310;
      block[4] = obj;
      dispatch_sync(v7, block);

      v4 = obj;
    }
  }
  objc_sync_exit(v4);

}

void __45__UAUserActivityManager_setAllowedToConnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "connection");

}

void __29__UAUserActivityManager_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "--- Received com.apple.coreservices.useractivity.reconnection notification, and we had an active user activity, so reconnecting to server.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serverQ");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__UAUserActivityManager_init__block_invoke_22;
  block[3] = &unk_1E6007310;
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

  objc_autoreleasePoolPop(v2);
}

void __29__UAUserActivityManager_init__block_invoke_22(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "allowedToConnect"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedToSendInitialMessage:", 1);
    objc_msgSend(*(id *)(a1 + 32), "activeUserActivityUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(*(id *)(a1 + 32), "initialServerHandshake:", 0);
  }
}

- (UAUserActivityManager)initWithConnection:(id)a3
{
  id v5;
  UAUserActivityManager *v6;
  UAUserActivityManager *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = -[UAUserActivityManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    _LSGetUserActivityClientProtocolInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    _LSGetUserActivityClientResponseProtocolInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7->_connection, "setExportedInterface:", v9);

    -[NSXPCConnection resume](v7->_connection, "resume");
  }

  return v7;
}

- (void)dealloc
{
  OS_dispatch_queue *serverQ;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  OS_dispatch_queue *v12;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = self->_serverQ;
  serverQ = self->_serverQ;
  self->_serverQ = 0;

  v4 = v8[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__UAUserActivityManager_dealloc__block_invoke;
  block[3] = &unk_1E6007870;
  block[4] = &v7;
  dispatch_async(v4, block);
  _Block_object_dispose(&v7, 8);

  v5.receiver = self;
  v5.super_class = (Class)UAUserActivityManager;
  -[UAUserActivityManager dealloc](&v5, sel_dealloc);
}

void __32__UAUserActivityManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __35__UAUserActivityManager_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_DEBUG, "CONNECTION INTERRUPTED to useractivityd", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serverQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__UAUserActivityManager_connection__block_invoke_27;
  block[3] = &unk_1E6007310;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

uint64_t __35__UAUserActivityManager_connection__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionInterrupted");
}

void __35__UAUserActivityManager_connection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "serverQ");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__UAUserActivityManager_connection__block_invoke_3;
  block[3] = &unk_1E6007310;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __35__UAUserActivityManager_connection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionInvalidated");
}

- (void)connectionInterrupted
{
  NSObject *v3;
  UAUserActivityManager *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "CONNECTION: connectionInterrupted, to useractivityd.", buf, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_needToSendInitialMessage = 1;
  -[NSMutableSet removeAllObjects](v4->_userActivityUUIDsSendToServer, "removeAllObjects");
  objc_sync_exit(v4);

  if (-[UAUserActivityManager allowedToConnect](v4, "allowedToConnect"))
  {
    -[UAUserActivityManager activeUserActivityUUID](v4, "activeUserActivityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    if (!v6)
    {
      _uaGetLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        v12 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "CONNECTION reconnect; queueing up reconnection attempt in %{public}g seconds because our connection was interrupted.",
          buf,
          0xCu);
      }

      v8 = dispatch_time(0, 100000000);
      -[UAUserActivityManager serverQ](v4, "serverQ");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__UAUserActivityManager_connectionInterrupted__block_invoke;
      block[3] = &unk_1E6007310;
      block[4] = v4;
      dispatch_after(v8, v9, block);

    }
  }
}

uint64_t __46__UAUserActivityManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "CONNECTION reconnect; sending initial message to useractivityd because we had an active activity at interruption-time.",
      v4,
      2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "initialServerHandshake:", 1);
}

- (void)connectionInvalidated
{
  NSObject *v3;
  UAUserActivityManager *v4;
  uint8_t v5[16];

  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "CONNECTION INVALIDATED: to useractivityd; all future attempts to use it will fail.",
      v5,
      2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_allowedToConnect = 0;
  objc_sync_exit(v4);

}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "cancellationHandler for activity %{public}@ cancelled.", (uint8_t *)&v4, 0xCu);

  }
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "copyWithNewUUID:", 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 1);
    _uaGetLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v15 = 138543619;
      v16 = v8;
      v17 = 2113;
      v18 = v9;
      _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "Calling completion handler with activity %{public}@/%{private}@", (uint8_t *)&v15, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _uaGetLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138543619;
      v16 = v11;
      v17 = 2113;
      v18 = v12;
      _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_ERROR, "Failed attempting to copy %{public}@/%{private}@, so calling completion handler with UAContinuityClientNoSuchActivity@", (uint8_t *)&v15, 0x16u);

    }
    v13 = *(_QWORD *)(a1 + 56);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -108, 0);
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
  objc_autoreleasePoolPop(v2);
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  dispatch_group_t v4;
  dispatch_group_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  os_signpost_id_t v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  __int128 v46;
  _QWORD v47[4];
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  _BYTE buf[22];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_DEBUG, "on serverQ, preparing to call doFetchUserActivityInfoWithUUID to get latest info from server for %{public}@", buf, 0xCu);

  }
  kdebug_trace();
  v4 = dispatch_group_create();
  v5 = 0;
  if (*(double *)(a1 + 80) > 0.0)
    v5 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_32;
  v47[3] = &unk_1E6007BF8;
  v50 = *(_QWORD *)(a1 + 64);
  v8 = v4;
  v48 = v8;
  v9 = v5;
  v49 = v9;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -107, 0);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
    goto LABEL_19;
  }
  dispatch_group_enter(v8);
  if (v9)
    dispatch_group_enter(v9);
  v11 = *(void **)(a1 + 32);
  v37 = v7;
  v38 = 3221225472;
  v39 = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_34;
  v40 = &unk_1E6007C20;
  v41 = v11;
  v12 = *(id *)(a1 + 48);
  v46 = *(_OWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 40);
  v42 = v12;
  v43 = v13;
  v44 = v8;
  v14 = v9;
  v45 = v14;
  objc_msgSend(v10, "doFetchUserActivityInfoWithUUID:completionHandler:", v41, &v37);
  v15 = *(double *)(a1 + 80);
  if (v15 < 3.40282347e38)
  {
    v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    if (!v9)
      goto LABEL_18;
LABEL_13:
    _uaGetLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 32), "UUIDString", v37, v38, v39, v40);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_1AF7EB000, v20, OS_LOG_TYPE_DEBUG, "-- before waiting up to %g seconds for documentSynchronization of uuid %{public}@", buf, 0x16u);

    }
    dispatch_group_wait(v14, v16);
    _uaGetLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_1AF7EB000, v23, OS_LOG_TYPE_DEBUG, "-- done waiting up to %g seconds for documentSynchronization of uuid %{public}@", buf, 0x16u);

    }
    goto LABEL_18;
  }
  v16 = -1;
  if (v9)
    goto LABEL_13;
LABEL_18:

  v19 = v41;
LABEL_19:

  if (*(_QWORD *)(a1 + 56))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _uaGetLogForCategory(CFSTR("signposts"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = *(_QWORD *)(a1 + 88);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v30;
    _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "fetchUserActivity", "Fetching handoff payload:%{public}@ err=%{public}d", buf, 0x12u);
  }

  _uaGetLogForCategory(CFSTR("signposts"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(void **)(a1 + 32);
  if (v32)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v32, "getUUIDBytes:", buf);
    v33 = 0;
    v34 = 0;
    do
    {
      v34 = (buf[v33 + 1] ^ buf[v33]) | (v34 << 8);
      v33 += 2;
    }
    while (v33 != 16);
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      v35 = *(_QWORD *)(a1 + 32);
      v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v36;
      _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v31, OS_SIGNPOST_INTERVAL_END, v34, "fetchUserActivityQueued", "Fetching handoff payload:%{public}@ err=%{public}d", buf, 0x12u);
    }
  }

}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_ERROR, "Error attempting to get user activity from server: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_group_leave(v6);

}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UAUserActivity *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543875;
    v18 = v8;
    v19 = 2113;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "fetchUUID: for uuid %{public}@, got %{private}@ from server, error=%{public}@", (uint8_t *)&v17, 0x20u);

  }
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", 1);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    goto LABEL_10;
  }
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "error");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    goto LABEL_10;
  }
  if (!v5)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -108, 0);
    goto LABEL_7;
  }
  v13 = -[UAUserActivity initWithManager:userActivityInfo:]([UAUserActivity alloc], "initWithManager:userActivityInfo:", *(_QWORD *)(a1 + 48), v5);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 1);
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  v16 = *(NSObject **)(a1 + 64);
  if (v16)
    dispatch_group_leave(v16);

}

- (void)addDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[UAUserActivityManager serverQ](self, "serverQ");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__UAUserActivityManager_addDynamicUserActivity_matching___block_invoke;
  block[3] = &unk_1E6007C70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __57__UAUserActivityManager_addDynamicUserActivity_matching___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138478083;
      v8 = v5;
      v9 = 2113;
      v10 = v6;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "calling doAddDynamicUserActivity: %{private}@ matching: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(v3, "doAddDynamicUserActivity:matching:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)removeDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[UAUserActivityManager serverQ](self, "serverQ");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__UAUserActivityManager_removeDynamicUserActivity_matching___block_invoke;
  block[3] = &unk_1E6007C70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__UAUserActivityManager_removeDynamicUserActivity_matching___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138478083;
      v8 = v5;
      v9 = 2113;
      v10 = v6;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "calling doRemoveDynamicUserActivity: %{private}@ matching: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(v3, "doRemoveDynamicUserActivity:matching:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

uint64_t __51__UAUserActivityManager_activeActivitiesByPriority__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "priority");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (void)askClientUserActivityToSave:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 0, 0);

}

- (void)askClientUserActivityToSave:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "askClientUserActivityToSave: uuid=%{public}@", buf, 0xCu);

  }
  -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    _uaGetLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_ERROR, "askClientUserActivityToSave:%{public}@ on activity, which does not seem to exist.", buf, 0xCu);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -108;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isInvalidated"))
  {
    _uaGetLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "typeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v13;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_ERROR, "askClientUserActivityToSave:%{public}@ %{public}@ on activity which has been invalidated.", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -130;
LABEL_11:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v19);
    goto LABEL_17;
  }
  objc_msgSend(v11, "parentUserActivity");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20
    && (v21 = (void *)v20,
        objc_msgSend(v11, "parentUserActivity"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "_supportsSynchronizeActivityWithTimeout"),
        v22,
        v21,
        v23))
  {
    objc_msgSend(v11, "manager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activeUserActivityUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v11, "manager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activeUserActivityUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

    }
    else
    {
      v29 = 0;
    }

    objc_msgSend(v11, "parentUserActivity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__UAUserActivityManager_askClientUserActivityToSave_completionHandler___block_invoke;
    v31[3] = &unk_1E6007CD8;
    v32 = v6;
    v33 = v7;
    objc_msgSend(v30, "doSaveUserActivityWithTimeout:isCurrent:withCompletionHandler:", v29, v31, 3.0);

    v19 = v32;
  }
  else
  {
    objc_msgSend(v11, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", 1, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v19, objc_msgSend(v11, "dirty") ^ 1, 0);
  }
LABEL_17:

}

void __71__UAUserActivityManager_askClientUserActivityToSave_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_ERROR, "Failed asking parentUserActivity to doSaveUserActivityWithTimeout:, activity=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    objc_msgSend(v5, "_internalUserActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userActivityInfoForSelf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "_internalUserActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "dirty") ^ 1;
    if (v10)
    {
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v11 + 16))(v11, v10, v13, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -136, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v11 + 16))(v11, 0, v13, v14);

    }
  }

}

- (void)tellClientUserActivityItWasResumed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "didSynchronizeUserActivity");

}

- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _uaGetLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109635;
    v7[1] = v4;
    v8 = 2113;
    v9 = v5;
    v10 = 1024;
    v11 = objc_msgSend(v5, "fileDescriptor");
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "Received debug update from server: %d %{private}@(%d)", (uint8_t *)v7, 0x18u);
  }

}

- (void)didReceiveInputStreamWithUUID:(id)a3 inputStream:(id)a4 outputStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _uaGetLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v15, 0xCu);

  }
  -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "didReceiveInputStream:outputStream:", v9, v10);

}

- (id)encodeUserActivity:(id)a3
{
  id v3;
  UAUserActivityInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(UAUserActivityInfo);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setUuid:](v4, "setUuid:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setWhen:](v4, "setWhen:", v6);

  -[UAUserActivityInfo setType:](v4, "setType:", objc_msgSend(v3, "suggestedActionType"));
  objc_msgSend(v3, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setOptions:](v4, "setOptions:", v7);

  objc_msgSend(v3, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setTitle:](v4, "setTitle:", v8);

  objc_msgSend(v3, "typeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setActivityType:](v4, "setActivityType:", v9);

  objc_msgSend(v3, "dynamicIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setDynamicActivityType:](v4, "setDynamicActivityType:", v10);

  objc_msgSend(v3, "webpageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setWebpageURL:](v4, "setWebpageURL:", v11);

  objc_msgSend(v3, "referrerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setReferrerURL:](v4, "setReferrerURL:", v12);

  objc_msgSend(v3, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeUserInfo:error:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAUserActivityInfo setPayload:identifier:](v4, "setPayload:identifier:", v14, CFSTR("UAUserActivityUserInfoPayload"));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)createByDecodingUserActivity:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");

  return v6;
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "activityType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v13 = v6;
      v14 = 2113;
      v15 = v7;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "*** Unexpected error from doUpdateUserActivityInfo for activity %{public}@/%{private}@, error=%{public}@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serverQ");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_52;
    v10[3] = &unk_1E60078E8;
    v9 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v9;
    dispatch_async(v8, v10);

  }
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_52(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_sync_exit(obj);
}

- (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _uaGetLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v7)
    {
      objc_msgSend(v7, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      stringRemovingNewlines(v4);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("-");
    }
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, "options=%{public}@ ", buf, 0xCu);
    if (v7)
    {

    }
  }

  -[UAUserActivityManager serverQ](self, "serverQ");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke;
  v14[3] = &unk_1E6007DC8;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  dispatch_async(v11, v14);

  return 1;
}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_1E60075A8;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_63;
    v9[3] = &unk_1E6007DA0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "doGetCurrentUserActivityInfo:", v9);
    v5 = v10;
  }
  else
  {
    _uaGetLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_DEBUG, "proxy == nil", v8, 2u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -113, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, 0, 0, v5);
  }

}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v6;
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a5;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  _uaGetLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = CFSTR("-");
    v21 = a1;
    if (v12)
    {
      objc_msgSend(v12, "UUIDString");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("-");
    }
    if (v13)
      v20 = v13;
    else
      v20 = CFSTR("-");
    if (v14)
    {
      objc_msgSend(v14, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      stringRemovingNewlines(v6);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543875;
    v23 = v19;
    v24 = 2113;
    v25 = v20;
    v26 = 2114;
    v27 = v18;
    _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_DEBUG, "activityUUID=%{public}@ bundleID=%{private}@ error=%{public}@", buf, 0x20u);
    if (v14)
    {

    }
    a1 = v21;
    if (v12)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)currentUserActivityProxiesWithOptions:(id)a3 predicate:(id)a4 completionHandler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  _uaGetLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
    {
      objc_msgSend(v9, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      stringRemovingNewlines(v5);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("-");
    }
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEBUG, "options=%{public}@ predicate=%{public}@", buf, 0x16u);
    if (v9)
    {

    }
  }

  -[UAUserActivityManager serverQ](self, "serverQ");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke;
  block[3] = &unk_1E6007E18;
  v19 = v9;
  v20 = v11;
  block[4] = self;
  v15 = v9;
  v16 = v11;
  dispatch_async(v14, block);

  return 1;
}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_2;
  v12[3] = &unk_1E60075A8;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_65;
    v10[3] = &unk_1E6007DF0;
    v5 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v4, "doGetUserActivityProxiesWithOptions:completionHandler:", v5, v10);
    v6 = v11;
  }
  else
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "proxy == nil", v9, 2u);
    }

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -113, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "XPC Error for currentUserActivityProxiesWithOptions: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "proxies=%{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "uuid=%@", buf, 0xCu);

  }
  -[UAUserActivityManager serverQ](self, "serverQ");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke;
  block[3] = &unk_1E6007E18;
  v15 = v6;
  v16 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

  return 1;
}

void __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_2;
  v12[3] = &unk_1E60075A8;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_67;
    v10[3] = &unk_1E6007E40;
    v5 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v4, "doDetermineIfUserActivityIsCurrent:completionHandler:", v5, v10);
    v6 = v11;
  }
  else
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "proxy == nil", v9, 2u);
    }

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -113, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, 0, 0, v6);
  }

}

void __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pinUserActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[UAUserActivityManager serverQ](self, "serverQ");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke;
  block[3] = &unk_1E6007E18;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E60075A8;
  v11 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", 1, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    _uaGetLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v13 = v9;
      v14 = 2113;
      v15 = v5;
      _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "Sending Info to pin: %{public}@/%{private}@", buf, 0x16u);

    }
    objc_msgSend(v3, "doPinUserActivityInfo:completionHandler:", v5, a1[6]);
  }

}

void __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasUserActivityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[UAUserActivityManager userActivitiesByUUID](self, "userActivitiesByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  return v7;
}

- (id)activities
{
  void *v2;
  void *v3;
  void *v4;

  -[UAUserActivityManager userActivitiesByUUID](self, "userActivitiesByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:(id)a3 dynamicType:(id)a4 kind:(unint64_t)a5 teamIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  _uaGetLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v47 = v9;
    v48 = 2114;
    v49 = v10;
    v50 = 2048;
    v51 = a5;
    v52 = 2114;
    v53 = v11;
    _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:%{public}@/%{public}@ %ld %{public}@", buf, 0x2Au);
  }

  if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB3418]))
  {
    applicationProxyForWebBrowserSupportingContinuation();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
      goto LABEL_7;
    objc_msgSend(v13, "appState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInstalled");

    if (!v16)
      goto LABEL_7;
    objc_msgSend(v14, "appState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isRestricted");

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v14, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_7:
      v19 = 0;
    }
  }
  else
  {
    v20 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "applicationsForUserActivityType:", v20);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v38 = v21;
      v39 = v20;
      v40 = v10;
      v14 = 0;
      v19 = 0;
      v25 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          v27 = v14;
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v14 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);

          objc_msgSend(v14, "appState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isPlaceholder");

          if (v29)
          {
            objc_msgSend(v14, "bundleIdentifier");
            v30 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v30;
          }
          else if (v14)
          {
            objc_msgSend(v14, "appState");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isInstalled");

            if (v32)
            {
              objc_msgSend(v14, "appState");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isRestricted");

              if ((v34 & 1) == 0)
              {
                objc_msgSend(v14, "bundleIdentifier");
                v36 = objc_claimAutoreleasedReturnValue();
                v35 = v19;
                v19 = (void *)v36;
                goto LABEL_22;
              }
            }
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v24)
          continue;
        break;
      }
      v35 = v14;
      v14 = 0;
LABEL_22:

      v20 = v39;
      v10 = v40;
      v21 = v38;
    }
    else
    {
      v14 = 0;
      v19 = 0;
    }

  }
  return v19;
}

- (void)sendToIndexerIfAppropriate:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "NO";
    if (v4)
      v10 = "YES";
    v13 = 138543618;
    v14 = v8;
    v15 = 2080;
    v16 = v10;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_DEBUG, "sendToIndexerIfAppropriate(%{public}@,%s)", (uint8_t *)&v13, 0x16u);

  }
  -[UAUserActivityManager userActivityForUUID:](self, "userActivityForUUID:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11
    && objc_msgSend(v11, "forwardToCoreSpotlightIndexer")
    && -[UAUserActivityManager userActivityIsActive:](self, "userActivityIsActive:", v12))
  {
    objc_msgSend(v12, "indexActivity:forceIndexing:", 1, 0.0);
  }

}

- (void)sendCurrentActivityToIndexer:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[UAUserActivityManager activeUserActivityUUID](self, "activeUserActivityUUID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = CFSTR("UIApplicationWillResignActiveNotification");
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "sendCurrentActivityToIndexer, got %{public}@ notification activeUUID=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  if (v4)
    -[UAUserActivityManager sendToIndexerIfAppropriate:force:](self, "sendToIndexerIfAppropriate:force:", v4, 1);

}

- (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  int v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  _uaGetLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v21 = a3;
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_INFO, "doRegisterAsProxyApplicationForPid:%{public}d", buf, 8u);
  }

  -[UAUserActivityManager serverQ](self, "serverQ");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  -[UAUserActivityManager serverQ](self, "serverQ");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke;
  v16[3] = &unk_1E6007E88;
  v17 = v8;
  v18 = v9;
  v19 = a3;
  v16[4] = self;
  v13 = v8;
  v14 = v9;
  dispatch_sync(v12, v16);

  return 1;
}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_2;
  v9 = &unk_1E60075A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v4, "doRegisterAsProxyApplicationForPid:options:completionHandler:", v3, 3221225472, __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_79, &__block_descriptor_36_e17_v16__0__NSError_8l, v5, v6, v7, v8, v9);
  }

}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "Error attempting to registerAsProxyForApplication from server: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67240450;
    v6[1] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "doRegisterAsProxyApplicationForPid:%{public}d finished, error=%{public}@", (uint8_t *)v6, 0x12u);
  }

}

- (void)setUserActivitiesByUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setActiveUserActivitiesByUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)needToSendInitialMessage
{
  return self->_needToSendInitialMessage;
}

- (void)setNeedToSendInitialMessage:(BOOL)a3
{
  self->_needToSendInitialMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_serialQueueForSendingActivitiesToServer, 0);
  objc_storeStrong((id *)&self->_activeUserActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityUUIDsSendToServer, 0);
  objc_storeStrong((id *)&self->_userActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_serverQ, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "*** Error on connection to useractivityd, err=%{public}@ (possibly useractivityd crashed?)", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 53) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  objc_sync_exit(v5);

}

void __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke_245(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _uaGetLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218499;
    v19 = a2;
    v20 = 2113;
    v21 = v11;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, " -- Server response to initialMessage, version=%ld info=%{private}@ error=%{public}@", (uint8_t *)&v18, 0x20u);

  }
  v12 = *(id *)(a1 + 32);
  objc_sync_enter(v12);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAllowedToConnect:", 0);
    objc_sync_exit(v12);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    objc_sync_exit(v12);

    objc_msgSend(*(id *)(a1 + 32), "userActivitiesByUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeUserActivityUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      _uaGetLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1AF7EB000, v15, OS_LOG_TYPE_DEBUG, " -- We had an active user activity, uuid=%{public}@, so sending that to server.", (uint8_t *)&v18, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "tellDaemonAboutNewLSUserActivity:", v12);
      objc_msgSend(*(id *)(a1 + 32), "markUserActivityAsDirty:forceImmediate:", v12, 0);
      objc_msgSend(*(id *)(a1 + 32), "makeActive:", v12);
      objc_msgSend(v12, "sendUserActivityInfoToLSUserActivityd:onAsyncQueue:", 0, 0);
    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

@end
