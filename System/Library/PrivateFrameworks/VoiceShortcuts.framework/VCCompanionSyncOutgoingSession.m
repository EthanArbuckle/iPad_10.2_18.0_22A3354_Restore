@implementation VCCompanionSyncOutgoingSession

- (VCCompanionSyncOutgoingSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5 changeSet:(id)a6 metadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  VCCompanionSyncOutgoingSession *v19;
  uint64_t v20;
  NSMutableArray *pendingChanges;
  uint64_t v22;
  NSMutableArray *sentChanges;
  uint64_t v24;
  NSMutableArray *syncedChanges;
  uint64_t v26;
  NSDictionary *metadata;
  VCCompanionSyncOutgoingSession *v28;
  void *v30;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncOutgoingSession.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeSet"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncOutgoingSession.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)VCCompanionSyncOutgoingSession;
  v19 = -[VCCompanionSyncSession initWithSYSession:service:syncDataHandlers:](&v32, sel_initWithSYSession_service_syncDataHandlers_, v13, v14, v15);
  if (v19)
  {
    v20 = objc_msgSend(v16, "mutableCopy");
    pendingChanges = v19->_pendingChanges;
    v19->_pendingChanges = (NSMutableArray *)v20;

    v22 = objc_opt_new();
    sentChanges = v19->_sentChanges;
    v19->_sentChanges = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    syncedChanges = v19->_syncedChanges;
    v19->_syncedChanges = (NSMutableArray *)v24;

    v26 = objc_msgSend(v18, "copy");
    metadata = v19->_metadata;
    v19->_metadata = (NSDictionary *)v26;

    v28 = v19;
  }

  return v19;
}

- (double)progress
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[VCCompanionSyncOutgoingSession syncedChanges](self, "syncedChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[VCCompanionSyncOutgoingSession sentChanges](self, "sentChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + v4 + objc_msgSend(v7, "count");

  return (double)v4 / (double)(unint64_t)v8;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  SEL v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  VCCompanionSyncOutgoingSession *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v29 = a2;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(id, void *))a4;
  getWFWatchSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
    v33 = 2114;
    v34 = self;
    v35 = 2114;
    v36 = (uint64_t)v7;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ -enqueueChanges called by %{public}@", buf, 0x20u);
  }
  v30 = v7;

  -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    while (1)
    {
      v12 = (void *)MEMORY[0x1C3BAFA00]();
      v13 = v8[2](v8, v11);
      getWFWatchSyncLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (!v13)
        break;
      if (v15)
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
        v33 = 2114;
        v34 = self;
        v35 = 2114;
        v36 = (uint64_t)v11;
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully enqueued change=%{public}@", buf, 0x20u);
      }

      -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "indexOfObject:", v11);

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("VCCompanionSyncOutgoingSession.m"), 74, CFSTR("Change should be the first pending change"));

      }
      -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges", v29, v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectAtIndex:", 0);

      -[VCCompanionSyncOutgoingSession sentChanges](self, "sentChanges");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v11);

      objc_autoreleasePoolPop(v12);
      -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v21;
      if (!v21)
        goto LABEL_14;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136315650;
      v32 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
      v33 = 2114;
      v34 = self;
      v35 = 2114;
      v36 = (uint64_t)v11;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ stopped early, before sending change=%{public}@", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v12);
  }
LABEL_14:
  -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  getWFWatchSyncLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
    v33 = 2114;
    v34 = self;
    v35 = 2048;
    v36 = v24;
    _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_DEFAULT, "%s %{public}@ finished enqueuing changes, with %lu remaining changes", buf, 0x20u);
  }

  if (v24)
  {
    -[VCCompanionSyncSession transaction](self, "transaction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    os_transaction_needs_more_time();
    v27 = 1;
  }
  else
  {
    -[VCCompanionSyncSession delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "companionSyncSessionDidFinishSendingChanges:", self);
    v27 = 2;
  }

  return v27;
}

- (void)syncSession:(id)a3 successfullySynced:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  const char *v37;
  uint32_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  void *v46;
  VCCompanionSyncOutgoingSession *v47;
  uint64_t v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "state") != 5)
  {
    v44 = v6;
    -[VCCompanionSyncOutgoingSession sentChanges](self, "sentChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __65__VCCompanionSyncOutgoingSession_syncSession_successfullySynced___block_invoke;
    v55[3] = &unk_1E7AA7C50;
    v43 = v7;
    v56 = v7;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v55);
    v9 = objc_claimAutoreleasedReturnValue();

    -[VCCompanionSyncOutgoingSession sentChanges](self, "sentChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectsAtIndexes:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCCompanionSyncOutgoingSession syncedChanges](self, "syncedChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v11);

    -[VCCompanionSyncOutgoingSession sentChanges](self, "sentChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v9;
    objc_msgSend(v13, "removeObjectsAtIndexes:", v9);

    -[VCCompanionSyncSession delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCompanionSyncOutgoingSession progress](self, "progress");
    objc_msgSend(v14, "companionSyncSession:didUpdateProgress:", self);

    -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCompanionSyncOutgoingSession pendingChanges](self, "pendingChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v11;
    VCPartitionMessages(v11);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v17;
    VCPartitionMessages(v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[VCCompanionSyncSession syncDataHandlers](self, "syncDataHandlers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (!v18)
      goto LABEL_20;
    v19 = v18;
    v48 = *(_QWORD *)v52;
    v47 = self;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1C3BAFA00]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v46, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "count"))
          {
            v26 = 0;
          }
          else
          {
            -[VCCompanionSyncOutgoingSession metadata](self, "metadata");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            self = v47;
          }

          -[VCCompanionSyncSession service](self, "service");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          v29 = objc_msgSend(v21, "markChangesAsSynced:withSyncService:metadata:error:", v24, v28, v26, &v50);
          v30 = v50;

          getWFWatchSyncLogObject();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v29)
          {
            self = v47;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              -[VCCompanionSyncSession service](v47, "service");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 136315650;
              v58 = "-[VCCompanionSyncOutgoingSession syncSession:successfullySynced:]";
              v59 = 2114;
              v60 = v33;
              v61 = 2048;
              v62 = v34;
              v35 = v32;
              v36 = OS_LOG_TYPE_INFO;
              v37 = "%s Service %{public}@ marked %lu changes as synced";
              v38 = 32;
              goto LABEL_16;
            }
          }
          else
          {
            self = v47;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              -[VCCompanionSyncSession service](v47, "service");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 136315906;
              v58 = "-[VCCompanionSyncOutgoingSession syncSession:successfullySynced:]";
              v59 = 2114;
              v60 = v33;
              v61 = 2048;
              v62 = v39;
              v63 = 2114;
              v64 = v30;
              v35 = v32;
              v36 = OS_LOG_TYPE_FAULT;
              v37 = "%s Service %{public}@ failed to mark %lu changes as synced: %{public}@";
              v38 = 42;
LABEL_16:
              _os_log_impl(&dword_1C146A000, v35, v36, v37, buf, v38);

            }
          }

        }
        objc_autoreleasePoolPop(v22);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      if (!v19)
      {
LABEL_20:

        v7 = v43;
        v6 = v44;
        break;
      }
    }
  }

}

- (NSMutableArray)pendingChanges
{
  return self->_pendingChanges;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSMutableArray)sentChanges
{
  return self->_sentChanges;
}

- (NSMutableArray)syncedChanges
{
  return self->_syncedChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedChanges, 0);
  objc_storeStrong((id *)&self->_sentChanges, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
}

uint64_t __65__VCCompanionSyncOutgoingSession_syncSession_successfullySynced___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (int64_t)direction
{
  return 0;
}

@end
