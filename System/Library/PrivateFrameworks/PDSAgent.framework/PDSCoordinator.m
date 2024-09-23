@implementation PDSCoordinator

- (PDSCoordinator)initWithQueue:(id)a3 serverBag:(id)a4 requestQueue:(id)a5 kvStoreBlock:(id)a6 entryStoreBlock:(id)a7 pushTokenBlock:(id)a8 systemMonitor:(id)a9 pushHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  PDSCoordinator *v26;
  PDSCoordinator *v27;
  PDSCoordinator *v28;
  uint64_t v29;
  id kvStoreBlock;
  uint64_t v31;
  id entryStoreBlock;
  uint64_t v33;
  id pushTokenBlock;
  void *v35;
  PDSHeartbeatTracker *v36;
  void *v37;
  uint64_t v38;
  PDSHeartbeatTracker *heartbeatTracker;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  id v49;
  id v50;
  objc_super v51;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v49 = a5;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v50 = a10;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCoordinator.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v24 = v23;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCoordinator.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverBag"));

  }
  v25 = v19;
  v26 = self;
  if (v25)
  {
    if (v20)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PDSCoordinator.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestQueue"));

    if (v20)
    {
LABEL_7:
      if (v21)
        goto LABEL_8;
LABEL_14:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PDSCoordinator.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryStoreBlock"));

      if (v22)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PDSCoordinator.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kvStoreBlock"));

  if (!v21)
    goto LABEL_14;
LABEL_8:
  if (v22)
    goto LABEL_9;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PDSCoordinator.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pushTokenBlock"));

LABEL_9:
  v51.receiver = v26;
  v51.super_class = (Class)PDSCoordinator;
  v27 = -[PDSCoordinator init](&v51, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_queue, a3);
    objc_storeStrong((id *)&v28->_serverBag, obj);
    objc_storeStrong((id *)&v28->_requestQueue, v49);
    -[PDSRequestQueue setDelegate:](v28->_requestQueue, "setDelegate:", v28);
    v29 = MEMORY[0x2199F31C4](v20);
    kvStoreBlock = v28->_kvStoreBlock;
    v28->_kvStoreBlock = (id)v29;

    v31 = MEMORY[0x2199F31C4](v21);
    entryStoreBlock = v28->_entryStoreBlock;
    v28->_entryStoreBlock = (id)v31;

    v33 = MEMORY[0x2199F31C4](v22);
    pushTokenBlock = v28->_pushTokenBlock;
    v28->_pushTokenBlock = (id)v33;

    *(_WORD *)&v28->_requestPending = 0;
    v28->_tokenChanged = 0;
    v28->_bagLoadRetries = 0;
    objc_storeStrong((id *)&v28->_pushHandler, a10);
    -[IDSPushHandler addListener:topics:commands:queue:](v28->_pushHandler, "addListener:topics:commands:queue:", v28, 0, 0, v28->_queue);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v28, sel__bagReloaded_, *MEMORY[0x24BE4FDE8], v18);

    objc_msgSend(v24, "addListener:", v28);
    v36 = [PDSHeartbeatTracker alloc];
    -[PDSCoordinator queue](v28, "queue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PDSHeartbeatTracker initWithDelegate:queue:kvStoreBlock:serverBag:](v36, "initWithDelegate:queue:kvStoreBlock:serverBag:", v28, v37, v20, v18);
    heartbeatTracker = v28->_heartbeatTracker;
    v28->_heartbeatTracker = (PDSHeartbeatTracker *)v38;

  }
  return v28;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSPushHandler removeListener:](self->_pushHandler, "removeListener:", self);
  v3.receiver = self;
  v3.super_class = (Class)PDSCoordinator;
  -[PDSCoordinator dealloc](&v3, sel_dealloc);
}

- (void)registerIfNeeded
{
  NSObject *v3;
  void (**v4)(void);
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  pds_defaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "Registering if needed.", buf, 2u);
  }

  -[PDSCoordinator entryStoreBlock](self, "entryStoreBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PDSCoordinator _comparePushTokensWithEntryStore:](self, "_comparePushTokensWithEntryStore:", v5);
    -[PDSCoordinator entryStore:didUpdatePendingTopics:forceImmediateUpdate:](self, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", v5, MEMORY[0x24BDBD1A8], 1);
  }
  else
  {
    pds_defaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215E64000, v6, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", v7, 2u);
    }

  }
}

- (void)entryStore:(id)a3 didUpdatePendingTopics:(id)a4 forceImmediateUpdate:(BOOL)a5
{
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!-[PDSCoordinator _disabledForAnyReason](self, "_disabledForAnyReason"))
  {
    -[PDSCoordinator setRequestPending:](self, "setRequestPending:", 1);
    v7 = 0.0;
    if (!a5)
    {
      -[PDSCoordinator _timeToDelayRequestForTopics:](self, "_timeToDelayRequestForTopics:", v10);
      v7 = v8;
    }
    -[PDSCoordinator processDeferredTaskQueue](self, "processDeferredTaskQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueExecutionWithTarget:afterDelay:", self, v7);

  }
}

- (void)requestQueue:(id)a3 processedRequest:(id)a4 withResponse:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  pds_defaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = (uint64_t)v8;
    _os_log_impl(&dword_215E64000, v9, OS_LOG_TYPE_DEFAULT, "Received PDS registration response: %@", (uint8_t *)&v23, 0xCu);
  }

  if (objc_msgSend(v8, "status"))
  {
    pds_defaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v8, "status");
      v23 = 134217984;
      v24 = v11;
      _os_log_impl(&dword_215E64000, v10, OS_LOG_TYPE_DEFAULT, "Bad response status: %ld", (uint8_t *)&v23, 0xCu);
    }

    switch(objc_msgSend(v8, "status"))
    {
      case 6001:
        pds_defaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          break;
        LOWORD(v23) = 0;
        v13 = "FTResponseActionDoNotRetry: Not retrying request";
        goto LABEL_18;
      case 6002:
        pds_defaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          break;
        LOWORD(v23) = 0;
        v13 = "FTResponseActionRetryWithDelay";
        goto LABEL_18;
      case 6005:
        pds_defaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          break;
        LOWORD(v23) = 0;
        v13 = "FTResponseActionRefreshCredentials";
LABEL_18:
        v19 = v12;
        v20 = 2;
        goto LABEL_21;
      case 6009:
        pds_defaultLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_215E64000, v22, OS_LOG_TYPE_DEFAULT, "FTResponseActionPermanentFailure: Permanently disabling", (uint8_t *)&v23, 2u);
        }

        self->_disabled = 1;
        goto LABEL_23;
      default:
        pds_defaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          break;
        v21 = objc_msgSend(v8, "status");
        v23 = 134217984;
        v24 = v21;
        v13 = "Unhandled response status: %ld";
        v19 = v12;
        v20 = 12;
LABEL_21:
        _os_log_impl(&dword_215E64000, v19, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v20);
        break;
    }
  }
  else
  {
    v14 = objc_msgSend(v8, "ttl");
    -[PDSCoordinator serverBag](self, "serverBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ttlFromBag");

    if (v14 > v16)
    {
      -[PDSCoordinator serverBag](self, "serverBag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ttlFromBag");

      pds_defaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PDSCoordinator requestQueue:processedRequest:withResponse:].cold.1(v8, self, v18);

    }
    -[PDSCoordinator _updateEntriesForResponse:fromRequest:](self, "_updateEntriesForResponse:fromRequest:", v8, v7);
    -[PDSCoordinator heartbeatTracker](self, "heartbeatTracker");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject noteUpdatedHeartbeatTTL:](v12, "noteUpdatedHeartbeatTTL:", (double)objc_msgSend(v8, "ttl"));
  }

LABEL_23:
}

- (int64_t)ttlForRequest:(id)a3
{
  void *v3;
  int64_t v4;

  -[PDSCoordinator serverBag](self, "serverBag", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ttlFromBag");

  return v4;
}

- (void)_processEntryStore
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215E64000, log, OS_LOG_TYPE_FAULT, "Fault! Registering with unkown reason (neither heartbeat or state change)", v1, 2u);
}

- (void)_updateEntriesForResponse:(id)a3 fromRequest:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PDSCoordinator entryStoreBlock](self, "entryStoreBlock");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v7, "entries");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v11)
    {
      v12 = v11;
      v30 = v7;
      v13 = *(_QWORD *)v34;
      v31 = v6;
      obj = v10;
      while (1)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
          objc_msgSend(v15, "user", v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "statusByUser");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            pds_defaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v16;
              v22 = v21;
              v23 = "User status not included in response: user: %@";
              v24 = 12;
LABEL_13:
              _os_log_impl(&dword_215E64000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
            }
LABEL_14:

            goto LABEL_15;
          }
          v19 = objc_msgSend(v18, "integerValue");
          if (v19)
          {
            v20 = v19;
            pds_defaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v39 = v16;
              v40 = 2048;
              v41 = v20;
              v22 = v21;
              v23 = "Bad user status: user: %@ status: %ld";
              v24 = 22;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          if (-[PDSCoordinator _matchingEntryExistsFor:inStore:](self, "_matchingEntryExistsFor:inStore:", v15, v9))
          {
            -[PDSCoordinator _updateOrDeleteEntry:inStore:](self, "_updateOrDeleteEntry:inStore:", v15, v9);
          }
          else
          {
            pds_defaultLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v15;
              _os_log_impl(&dword_215E64000, v25, OS_LOG_TYPE_DEFAULT, "State has changed mid-update for entry: %@", buf, 0xCu);
            }

            objc_msgSend(v15, "registration");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "topicString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v27;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDSCoordinator entryStore:didUpdatePendingTopics:forceImmediateUpdate:](self, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", v9, v28, 1);

            v6 = v31;
          }
LABEL_15:

          ++v14;
        }
        while (v12 != v14);
        v10 = obj;
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        v12 = v29;
        if (!v29)
        {
          v7 = v30;
          break;
        }
      }
    }
  }
  else
  {
    pds_defaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v10, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", buf, 2u);
    }
  }

}

- (void)_updateOrDeleteEntry:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  char v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "state");
  objc_msgSend(v5, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 2)
  {
    v14 = 0;
    v13 = objc_msgSend(v6, "deleteEntry:withError:", v5, &v14);
    v11 = v14;
    if ((v13 & 1) == 0)
    {
      pds_defaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        goto LABEL_9;
      }
LABEL_10:

    }
LABEL_11:

    goto LABEL_12;
  }
  if (v8 == 1)
  {
    v15 = 0;
    v10 = objc_msgSend(v6, "updateEntryState:forUser:clientID:withError:", 3, v9, v7, &v15);
    v11 = v15;
    if ((v10 & 1) == 0)
    {
      pds_defaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
LABEL_9:
        _os_log_impl(&dword_215E64000, v12, OS_LOG_TYPE_DEFAULT, "Error updating entry: %@", buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)_entries:(id)a3 includeState:(unsigned __int8)a4
{
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "state", (_QWORD)v12) == v4)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)_lastRequestHash
{
  void (**v2)(void);
  void *v3;
  void *v4;
  unint64_t v5;

  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberForKey:", CFSTR("kPDSLastRequestHash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongValue");

  return v5;
}

- (void)_markLastRequest:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v4, "hash");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumber:forKey:", v8, CFSTR("kPDSLastRequestHash"));

}

- (BOOL)_requestMatchesPreviousRequest:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "hash");
  return -[PDSCoordinator _lastRequestHash](self, "_lastRequestHash") == v4;
}

- (BOOL)_matchingEntryExistsFor:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entriesForUser:withClientID:", v7, v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(v5, "isEqualToEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (double)_timeToDelayRequestForTopics:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSDate *v22;
  NSDate *pendingRequestDate;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  double v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDSCoordinator serverBag](self, "serverBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coalesceDelayFromBag");
  v7 = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        -[PDSCoordinator serverBag](self, "serverBag", (_QWORD)v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v14, "topicAvoidsCoalescing:", v13);

        if ((v13 & 1) != 0)
        {
          v7 = 0.0;
          v21 = v8;
          goto LABEL_18;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (self->_pendingRequestDate)
  {
    -[PDSCoordinator serverBag](self, "serverBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coalesceMaxPeriodFromBag");
    v17 = v16;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", self->_pendingRequestDate);
    v20 = v19;

    if (v7 + v20 > v17)
    {
      if (v20 <= v17)
        v7 = v17 - v20;
      else
        v7 = 0.0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pendingRequestDate = self->_pendingRequestDate;
    self->_pendingRequestDate = v22;

  }
  pds_defaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v7;
    _os_log_impl(&dword_215E64000, v21, OS_LOG_TYPE_DEFAULT, "Delay register by: %f for coalescing", buf, 0xCu);
  }
LABEL_18:

  return v7;
}

- (void)_bagReloaded:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  pds_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E64000, v4, OS_LOG_TYPE_DEFAULT, "Received bag loaded notification -- attempting registration", buf, 2u);
  }

  -[PDSCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__PDSCoordinator__bagReloaded___block_invoke;
  block[3] = &unk_24D4A6EE8;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __31__PDSCoordinator__bagReloaded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerIfNeeded");
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  pds_defaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "Left first data protection lock -- attempting registration", buf, 2u);
  }

  -[PDSCoordinator queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PDSCoordinator_systemDidLeaveFirstDataProtectionLock__block_invoke;
  block[3] = &unk_24D4A6EE8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __55__PDSCoordinator_systemDidLeaveFirstDataProtectionLock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerIfNeeded");
}

- (BOOL)_disabledForAnyReason
{
  NSObject *v2;
  const char *v3;
  void *v5;
  int v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_disabled)
  {
    pds_defaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v3 = "PDS has been disabled by a PermanentFailure server response";
LABEL_7:
      _os_log_impl(&dword_215E64000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    -[PDSCoordinator serverBag](self, "serverBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bagKillSwitchActive");

    if (v6)
    {
      pds_defaultLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v3 = "PDS has been disabled by the kill switch";
        goto LABEL_7;
      }
    }
    else
    {
      PDSProtocolVersionNumber();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "longLongValue");
      -[PDSCoordinator serverBag](self, "serverBag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minEnabledVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "longLongValue");

      if (v9 >= v12)
        return 0;
      pds_defaultLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        PDSProtocolVersionNumber();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDSCoordinator serverBag](self, "serverBag");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "minEnabledVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_215E64000, v2, OS_LOG_TYPE_DEFAULT, "PDS has been disabled because the protocol version %@ is lower than the min enabled version %@", (uint8_t *)&v16, 0x16u);

      }
    }
  }

  return 1;
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a4, "length", a3))
  {
    pds_defaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_215E64000, v5, OS_LOG_TYPE_DEFAULT, "Notified of push-token change.  Forcing reregister.", v6, 2u);
    }

    -[PDSCoordinator registerIfNeeded](self, "registerIfNeeded");
  }
}

- (void)_comparePushTokensWithEntryStore:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint32_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDSCoordinator pushTokenBlock](self, "pushTokenBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, *MEMORY[0x24BE08720]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDSCoordinator pushTokenBlock](self, "pushTokenBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, *MEMORY[0x24BE08718]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "__imHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    if (-[PDSCoordinator _lastPushTokenDiffersFrom:](self, "_lastPushTokenDiffersFrom:", v6))
    {
      v11 = arc4random_uniform(0x64u);
      if (objc_msgSend(MEMORY[0x24BE4FDF8], "isSupported") && v11 <= 9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Production push token has changed!"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BE4FDF8];
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __51__PDSCoordinator__comparePushTokensWithEntryStore___block_invoke;
        v20[3] = &unk_24D4A6F10;
        v21 = v12;
        v14 = v12;
        objc_msgSend(v13, "triggerCaptureWithEvent:context:completion:", 206, v14, v20);

      }
      pds_defaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_215E64000, v15, OS_LOG_TYPE_DEFAULT, "Production push token has changed! New token: %@", buf, 0xCu);

      }
      -[PDSCoordinator _pushTokenChangedWithEntryStore:](self, "_pushTokenChangedWithEntryStore:", v4);
      -[PDSCoordinator _markPushToken:](self, "_markPushToken:", v6);
      -[PDSCoordinator setTokenChanged:](self, "setTokenChanged:", 1);
    }
    if (-[PDSCoordinator _lastSandboxPushTokenDiffersFrom:](self, "_lastSandboxPushTokenDiffersFrom:", v8))
    {
      pds_defaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "debugDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_215E64000, v17, OS_LOG_TYPE_DEFAULT, "Sandbox push token has changed! New token: %@", buf, 0xCu);

      }
      -[PDSCoordinator _pushTokenChangedWithEntryStore:](self, "_pushTokenChangedWithEntryStore:", v4);
      -[PDSCoordinator _markSandboxPushToken:](self, "_markSandboxPushToken:", v8);
      -[PDSCoordinator setTokenChanged:](self, "setTokenChanged:", 1);
    }
  }
  else
  {
    pds_defaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v19, OS_LOG_TYPE_DEFAULT, "Missing push token! aborting", buf, 2u);
    }

  }
}

void __51__PDSCoordinator__comparePushTokensWithEntryStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_215E64000, v7, OS_LOG_TYPE_DEFAULT, "Finished capturing AutoBugCapture diagnostics for push token change { context: %@, sessionID: %@, error: %@ }", (uint8_t *)&v9, 0x20u);
  }

}

- (BOOL)_lastPushTokenDiffersFrom:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataForKey:", CFSTR("kPDSLastPushToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_215E64000, v8, OS_LOG_TYPE_DEFAULT, "Last push token: %@", (uint8_t *)&v12, 0xCu);

  }
  v10 = objc_msgSend(v7, "isEqualToData:", v4);

  return v10 ^ 1;
}

- (BOOL)_lastSandboxPushTokenDiffersFrom:(id)a3
{
  unint64_t v4;
  void (**v5)(void);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (unint64_t)a3;
  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataForKey:", CFSTR("kPDSLastSandboxPushToken"));
  v7 = objc_claimAutoreleasedReturnValue();
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v7, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_215E64000, v8, OS_LOG_TYPE_DEFAULT, "Last sandbox push token: %@", (uint8_t *)&v12, 0xCu);

  }
  if (v4 | v7)
    v10 = objc_msgSend((id)v7, "isEqualToData:", v4) ^ 1;
  else
    LOBYTE(v10) = 0;

  return v10;
}

- (void)_markPushToken:(id)a3
{
  id v4;
  void (**v5)(void);
  id v6;

  v4 = a3;
  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setData:forKey:", v4, CFSTR("kPDSLastPushToken"));
}

- (void)_markSandboxPushToken:(id)a3
{
  id v4;
  void (**v5)(void);
  id v6;

  v4 = a3;
  -[PDSCoordinator kvStoreBlock](self, "kvStoreBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setData:forKey:", v4, CFSTR("kPDSLastSandboxPushToken"));
}

- (void)_pushTokenChangedWithEntryStore:(id)a3
{
  -[PDSCoordinator _updateAllHeartbeatEntriesWithState:inEntryStore:](self, "_updateAllHeartbeatEntriesWithState:inEntryStore:", 1, a3);
}

- (void)_updateAllHeartbeatEntriesWithState:(unsigned __int8)a3 inEntryStore:(id)a4
{
  objc_msgSend(a4, "updateAllEntriesWithState:toState:withError:", 3, a3, 0);
}

- (BOOL)shouldScheduleHeartbeatForTracker:(id)a3
{
  void (**v3)(void);
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  -[PDSCoordinator entryStoreBlock](self, "entryStoreBlock", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "hasActiveEntries");
  }
  else
  {
    pds_defaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_215E64000, v6, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (CUTDeferredTaskQueue)processDeferredTaskQueue
{
  CUTDeferredTaskQueue *processDeferredTaskQueue;
  CUTDeferredTaskQueue *v4;
  CUTDeferredTaskQueue *v5;

  processDeferredTaskQueue = self->_processDeferredTaskQueue;
  if (!processDeferredTaskQueue)
  {
    v4 = (CUTDeferredTaskQueue *)objc_msgSend(objc_alloc(MEMORY[0x24BE18E10]), "initWithCapacity:queue:block:", 1, self->_queue, &__block_literal_global);
    v5 = self->_processDeferredTaskQueue;
    self->_processDeferredTaskQueue = v4;

    processDeferredTaskQueue = self->_processDeferredTaskQueue;
  }
  return processDeferredTaskQueue;
}

uint64_t __42__PDSCoordinator_processDeferredTaskQueue__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_processEntryStore");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)pendingRequestDate
{
  return self->_pendingRequestDate;
}

- (void)setPendingRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestDate, a3);
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
  objc_storeStrong((id *)&self->_serverBag, a3);
}

- (void)setProcessDeferredTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processDeferredTaskQueue, a3);
}

- (id)kvStoreBlock
{
  return self->_kvStoreBlock;
}

- (void)setKvStoreBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)entryStoreBlock
{
  return self->_entryStoreBlock;
}

- (void)setEntryStoreBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
  objc_storeStrong((id *)&self->_pushHandler, a3);
}

- (id)pushTokenBlock
{
  return self->_pushTokenBlock;
}

- (void)setPushTokenBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PDSRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_requestPending = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)tokenChanged
{
  return self->_tokenChanged;
}

- (void)setTokenChanged:(BOOL)a3
{
  self->_tokenChanged = a3;
}

- (int64_t)bagLoadRetries
{
  return self->_bagLoadRetries;
}

- (void)setBagLoadRetries:(int64_t)a3
{
  self->_bagLoadRetries = a3;
}

- (PDSHeartbeatTracker)heartbeatTracker
{
  return self->_heartbeatTracker;
}

- (void)setHeartbeatTracker:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatTracker, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_pushTokenBlock, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong(&self->_entryStoreBlock, 0);
  objc_storeStrong(&self->_kvStoreBlock, 0);
  objc_storeStrong((id *)&self->_processDeferredTaskQueue, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_pendingRequestDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestQueue:(void *)a1 processedRequest:(void *)a2 withResponse:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "ttl");
  objc_msgSend(a2, "serverBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218240;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(v6, "ttlFromBag");
  _os_log_error_impl(&dword_215E64000, a3, OS_LOG_TYPE_ERROR, "PDS TTL response exceeded bag value (%ld > %ld). Using Bag value as TTL", (uint8_t *)&v7, 0x16u);

}

@end
